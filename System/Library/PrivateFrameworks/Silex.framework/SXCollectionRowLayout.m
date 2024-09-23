@implementation SXCollectionRowLayout

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("intendedComponentsPerRow: %lu; "),
    -[SXCollectionRowLayout intendedComponentsPerRow](self, "intendedComponentsPerRow"));
  objc_msgSend(v3, "appendFormat:", CFSTR("componentsPerRow: %lu; "),
    -[SXCollectionRowLayout componentsPerRow](self, "componentsPerRow"));
  -[SXCollectionRowLayout leftMargin](self, "leftMargin");
  objc_msgSend(v3, "appendFormat:", CFSTR("leftMargin: %f; "), v4);
  -[SXCollectionRowLayout rightMargin](self, "rightMargin");
  objc_msgSend(v3, "appendFormat:", CFSTR("rightMargin: %f; "), v5);
  -[SXCollectionRowLayout componentWidth](self, "componentWidth");
  objc_msgSend(v3, "appendFormat:", CFSTR("componentWidth: %f; "), v6);
  -[SXCollectionRowLayout spaceBetweenComponents](self, "spaceBetweenComponents");
  objc_msgSend(v3, "appendFormat:", CFSTR("spaceBetweenComponents: %f"), v7);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (unint64_t)intendedComponentsPerRow
{
  return self->_intendedComponentsPerRow;
}

- (void)setIntendedComponentsPerRow:(unint64_t)a3
{
  self->_intendedComponentsPerRow = a3;
}

- (unint64_t)componentsPerRow
{
  return self->_componentsPerRow;
}

- (void)setComponentsPerRow:(unint64_t)a3
{
  self->_componentsPerRow = a3;
}

- (double)leftMargin
{
  return self->_leftMargin;
}

- (void)setLeftMargin:(double)a3
{
  self->_leftMargin = a3;
}

- (double)rightMargin
{
  return self->_rightMargin;
}

- (void)setRightMargin:(double)a3
{
  self->_rightMargin = a3;
}

- (double)componentWidth
{
  return self->_componentWidth;
}

- (void)setComponentWidth:(double)a3
{
  self->_componentWidth = a3;
}

- (double)spaceBetweenComponents
{
  return self->_spaceBetweenComponents;
}

- (void)setSpaceBetweenComponents:(double)a3
{
  self->_spaceBetweenComponents = a3;
}

@end
