@implementation UIPointFIFO

- (UIPointFIFO)initWithFIFO:(id)a3
{
  UIPointFIFO *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIPointFIFO;
  v4 = -[UIPointFIFO init](&v6, sel_init);
  if (v4)
    v4->_nextFIFO = (UIPointFIFO *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_nextFIFO = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIPointFIFO;
  -[UIPointFIFO dealloc](&v3, sel_dealloc);
}

- (void)emitPoint:(UIPointFIFO *)self
{
  double v2;

  -[UIPointFIFO addPoint:](-[UIPointFIFO nextFIFO](self, "nextFIFO"), "addPoint:", v2);
}

- (void)flush
{
  -[UIPointFIFO flush](self->_nextFIFO, "flush");
}

- (void)clear
{
  -[UIPointFIFO clear](self->_nextFIFO, "clear");
}

- (UIPointFIFO)nextFIFO
{
  return self->_nextFIFO;
}

- (void)setNextFIFO:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
