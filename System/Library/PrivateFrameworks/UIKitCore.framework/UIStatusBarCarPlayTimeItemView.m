@implementation UIStatusBarCarPlayTimeItemView

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v5;
  void *v6;
  NSString **p_timeString;
  char v8;

  v5 = objc_msgSend(a3, "rawData");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v5 + 46, 4);
  p_timeString = &self->_timeString;
  v8 = objc_msgSend(v6, "isEqualToString:", *p_timeString);
  if ((v8 & 1) == 0)
    objc_storeStrong((id *)p_timeString, v6);

  return v8 ^ 1;
}

- (double)neededSizeForImageSet:(id)a3
{
  void *v4;
  double v5;
  double v6;
  objc_super v8;

  -[UIStatusBarCarPlayTimeItemView _timeImageSet](self, "_timeImageSet", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)UIStatusBarCarPlayTimeItemView;
  -[UIStatusBarItemView neededSizeForImageSet:](&v8, sel_neededSizeForImageSet_, v4);
  v6 = v5;

  return v6;
}

- (int64_t)textStyle
{
  return 3;
}

- (double)extraLeftPadding
{
  void *v2;

  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");

  return -4.0;
}

- (double)extraRightPadding
{
  void *v2;
  double v3;
  double v4;
  double result;

  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  result = -5.0;
  if (v4 == 2.0)
    return -4.0;
  return result;
}

- (id)_timeImageSet
{
  return -[UIStatusBarCarPlayTimeItemView _timeImageSetForColor:](self, "_timeImageSetForColor:", 0);
}

- (id)_timeImageSetForColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[UIStatusBarItemView imageWithText:](self, "imageWithText:", self->_timeString);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_flatImageWithColor:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setImage:", v8);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeString, 0);
}

@end
