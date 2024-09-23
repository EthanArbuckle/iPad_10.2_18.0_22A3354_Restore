@implementation _TUIElementBindObject

- ($738B17BD11CC339B30296C0EA03CEC2B)select
{
  return ($738B17BD11CC339B30296C0EA03CEC2B)self->_select.index;
}

- (void)setSelect:(id)a3
{
  self->_select.index = a3.var0;
}

- (TUIDynamicInstantiateOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

@end
