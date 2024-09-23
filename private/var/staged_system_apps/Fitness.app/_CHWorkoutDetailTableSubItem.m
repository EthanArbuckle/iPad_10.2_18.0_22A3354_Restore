@implementation _CHWorkoutDetailTableSubItem

- (BOOL)_fitsWidth:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  NSAttributedStringKey v14;
  void *v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_CHWorkoutDetailTableSubItem titleString](self, "titleString"));
  v14 = NSFontAttributeName;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont defaultFontForTextStyle:](UIFont, "defaultFontForTextStyle:", UIFontTextStyleBody));
  v15 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
  objc_msgSend(v5, "sizeWithAttributes:", v7);
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_CHWorkoutDetailTableSubItem valueAttrString](self, "valueAttrString"));
  objc_msgSend(v10, "boundingRectWithSize:options:context:", 3, 0, 1.79769313e308, 1.79769313e308);
  v12 = v11;

  return v12 < a3 && v9 < a3;
}

+ (id)_emptyItem
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setTitleString:", 0);
  objc_msgSend(v2, "setValueAttrString:", 0);
  objc_msgSend(v2, "setUpdateBlock:", &stru_1007793E8);
  return v2;
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSAttributedString)valueAttrString
{
  return self->_valueAttrString;
}

- (void)setValueAttrString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_valueAttrString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
}

@end
