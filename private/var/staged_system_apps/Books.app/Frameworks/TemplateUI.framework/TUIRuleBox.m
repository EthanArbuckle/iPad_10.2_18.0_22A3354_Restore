@implementation TUIRuleBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIRuleLayout, a2);
}

- (unint64_t)axis
{
  return self->_axis;
}

- (void)setAxis:(unint64_t)a3
{
  self->_axis = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
