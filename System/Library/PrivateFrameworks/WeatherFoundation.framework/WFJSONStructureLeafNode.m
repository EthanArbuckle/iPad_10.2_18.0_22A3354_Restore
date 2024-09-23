@implementation WFJSONStructureLeafNode

+ (id)requiredLeafNode
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setRequired:", 1);
  return v2;
}

+ (id)optionalLeafNode
{
  return (id)objc_opt_new();
}

- (BOOL)isRequired
{
  return self->_required;
}

- (void)setRequired:(BOOL)a3
{
  self->_required = a3;
}

@end
