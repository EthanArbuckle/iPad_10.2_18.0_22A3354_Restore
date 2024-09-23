@implementation PKGradientVerticalConnector

- (PKGradientVerticalConnector)initWithTopGradientColor:(id)a3 bottomGradientColor:(id)a4
{
  id v7;
  id v8;
  PKGradientVerticalConnector *v9;
  PKGradientVerticalConnector *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKGradientVerticalConnector;
  v9 = -[PKGradientVerticalConnector init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_topGradientColor, a3);
    objc_storeStrong((id *)&v10->_bottomGradientColor, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_topGradientColor);
  objc_msgSend(v3, "safelyAddObject:", self->_bottomGradientColor);
  v4 = PKCombinedHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKGradientVerticalConnector *v4;
  PKGradientVerticalConnector *v5;
  PKGradientVerticalConnector *v6;
  char v7;

  v4 = (PKGradientVerticalConnector *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (PKEqualObjects())
      v7 = PKEqualObjects();
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (UIColor)topGradientColor
{
  return self->_topGradientColor;
}

- (UIColor)bottomGradientColor
{
  return self->_bottomGradientColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomGradientColor, 0);
  objc_storeStrong((id *)&self->_topGradientColor, 0);
}

@end
