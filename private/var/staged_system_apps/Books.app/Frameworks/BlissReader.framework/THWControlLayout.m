@implementation THWControlLayout

- (THWControlLayout)init
{
  return -[THWControlLayout initWithTag:index:](self, "initWithTag:index:", 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL);
}

- (THWControlLayout)initWithInfo:(id)a3
{
  return -[THWControlLayout initWithTag:index:](self, "initWithTag:index:", 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL);
}

- (THWControlLayout)initWithTag:(unint64_t)a3
{
  return -[THWControlLayout initWithTag:index:](self, "initWithTag:index:", a3, 0x7FFFFFFFFFFFFFFFLL);
}

- (THWControlLayout)initWithTag:(unint64_t)a3 index:(unint64_t)a4
{
  THWControlLayout *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THWControlLayout;
  result = -[THWControlLayout initWithInfo:](&v7, "initWithInfo:", 0);
  if (result)
  {
    result->_invalidControlFlag = 1;
    result->_tag = a3;
    result->_index = a4;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)THWControlLayout;
  -[THWControlLayout dealloc](&v2, "dealloc");
}

- (void)validate
{
  objc_super v3;

  -[THWControlLayout invalidateFrame](self, "invalidateFrame");
  v3.receiver = self;
  v3.super_class = (Class)THWControlLayout;
  -[THWControlLayout validate](&v3, "validate");
  self->_invalidControlFlag = 0;
}

- (id)computeLayoutGeometry
{
  return objc_msgSend(-[THWControlLayout i_layoutGeometryProvider](self, "i_layoutGeometryProvider"), "layoutGeometryForLayout:", self);
}

- (void)invalidateControl
{
  if (!self->_invalidControlFlag)
  {
    self->_invalidControlFlag = 1;
    -[THWControlLayout invalidate](self, "invalidate");
  }
}

- (unint64_t)tag
{
  return self->_tag;
}

- (void)setTag:(unint64_t)a3
{
  self->_tag = a3;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (BOOL)invalidControlFlag
{
  return self->_invalidControlFlag;
}

@end
