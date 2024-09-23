@implementation TUISmartGridContentBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUISmartGridContentLayout, a2);
}

- ($738B17BD11CC339B30296C0EA03CEC2B)node
{
  return ($738B17BD11CC339B30296C0EA03CEC2B)self->_node.index;
}

- (void)setNode:(id)a3
{
  self->_node.index = a3.var0;
}

- ($738B17BD11CC339B30296C0EA03CEC2B)enumerator
{
  return ($738B17BD11CC339B30296C0EA03CEC2B)self->_enumerator.index;
}

- (void)setEnumerator:(id)a3
{
  self->_enumerator.index = a3.var0;
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
