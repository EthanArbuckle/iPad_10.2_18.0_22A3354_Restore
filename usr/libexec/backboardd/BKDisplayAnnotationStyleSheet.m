@implementation BKDisplayAnnotationStyleSheet

- (void)applyToLayer:(id)a3 forContent:(id)a4
{
  id v6;
  BKDisplayAnnotationStyle *styleModifier;
  id v8;

  v8 = a3;
  v6 = a4;
  -[BKDisplayAnnotationStyle applyToLayer:forContent:](self->_baseStyle, "applyToLayer:forContent:", v8, v6);
  styleModifier = self->_styleModifier;
  if (styleModifier && self->_baseStyle != styleModifier)
    -[BKDisplayAnnotationStyle applyToLayer:forContent:](styleModifier, "applyToLayer:forContent:", v8, v6);

}

- (void)sizeLayer:(id)a3 toFitAtScale:(double)a4
{
  BKDisplayAnnotationStyle *styleModifier;
  id v7;

  v7 = a3;
  if ((objc_opt_respondsToSelector(self->_baseStyle, "sizeLayer:toFitAtScale:") & 1) != 0)
    -[BKDisplayAnnotationStyle sizeLayer:toFitAtScale:](self->_baseStyle, "sizeLayer:toFitAtScale:", v7, a4);
  styleModifier = self->_styleModifier;
  if (styleModifier
    && self->_baseStyle != styleModifier
    && (objc_opt_respondsToSelector(styleModifier, "sizeLayer:toFitAtScale:") & 1) != 0)
  {
    -[BKDisplayAnnotationStyle sizeLayer:toFitAtScale:](self->_styleModifier, "sizeLayer:toFitAtScale:", v7, a4);
  }

}

- (BKDisplayAnnotationStyle)subnodeStyleModifier
{
  BKDisplayAnnotationStyle *subnodeStyleModifier;

  subnodeStyleModifier = self->_subnodeStyleModifier;
  if (!subnodeStyleModifier)
    subnodeStyleModifier = self->_styleModifier;
  return subnodeStyleModifier;
}

- (id)newLayerForContent:(id)a3 scale:(double)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = a3;
  v7 = objc_opt_class(BKDisplayAnnotationStringContent, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CATextLayer layer](CATextLayer, "layer"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "string"));
    objc_msgSend(v9, "setString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Text annotation: "), "stringByAppendingString:", v10));
    objc_msgSend(v9, "setName:", v11);

    objc_msgSend(v9, "setContentsScale:", a4);
    objc_msgSend(v9, "setRasterizationScale:", a4);
    objc_msgSend(v9, "setContentsFormat:", kCAContentsFormatAutomatic);

  }
  else
  {
    v12 = objc_opt_class(BKDisplayAnnotationShapeContent, v8);
    if ((objc_opt_isKindOfClass(v5, v12) & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
      objc_msgSend(v9, "setName:", CFSTR("Shape annotation"));
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    }
  }

  return v9;
}

- (BKDisplayAnnotationStyle)baseStyle
{
  return self->_baseStyle;
}

- (void)setBaseStyle:(id)a3
{
  objc_storeStrong((id *)&self->_baseStyle, a3);
}

- (BKDisplayAnnotationStyle)styleModifier
{
  return self->_styleModifier;
}

- (void)setStyleModifier:(id)a3
{
  objc_storeStrong((id *)&self->_styleModifier, a3);
}

- (void)setSubnodeStyleModifier:(id)a3
{
  objc_storeStrong((id *)&self->_subnodeStyleModifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subnodeStyleModifier, 0);
  objc_storeStrong((id *)&self->_styleModifier, 0);
  objc_storeStrong((id *)&self->_baseStyle, 0);
}

@end
