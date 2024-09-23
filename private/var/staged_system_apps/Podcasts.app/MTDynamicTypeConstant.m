@implementation MTDynamicTypeConstant

- (MTDynamicTypeConstant)initWithDefaultConstant:(double)a3 textStyle:(id)a4
{
  id v7;
  MTDynamicTypeConstant *v8;
  MTDynamicTypeConstant *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTDynamicTypeConstant;
  v8 = -[MTDynamicTypeConstant init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_defaultConstant = a3;
    objc_storeStrong((id *)&v8->_textStyle, a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  MTDynamicTypeConstant *v4;
  uint64_t v5;
  MTDynamicTypeConstant *v6;
  BOOL v7;

  v4 = (MTDynamicTypeConstant *)a3;
  if (v4 && (v5 = objc_opt_class(MTDynamicTypeConstant), (objc_opt_isKindOfClass(v4, v5) & 1) != 0))
  {
    if (self == v4)
    {
      v7 = 1;
    }
    else
    {
      v6 = v4;
      if (-[NSString isEqual:](self->_textStyle, "isEqual:", v6->_textStyle))
        v7 = vabdd_f64(self->_defaultConstant, v6->_defaultConstant) <= 0.00000011920929;
      else
        v7 = 0;

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (double)currentConstant
{
  double result;

  +[UIFont mt_scaledConstantForTextStyle:defaultConstant:](UIFont, "mt_scaledConstantForTextStyle:defaultConstant:", self->_textStyle, self->_defaultConstant);
  return result;
}

+ (void)updateDynamicConstantInConstraints:(id)a3
{
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", &stru_1004AB6B0);
}

- (double)defaultConstant
{
  return self->_defaultConstant;
}

- (NSString)textStyle
{
  return self->_textStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textStyle, 0);
}

@end
