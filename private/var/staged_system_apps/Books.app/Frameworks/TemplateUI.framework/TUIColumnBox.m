@implementation TUIColumnBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIColumnLayout, a2);
}

- (NSObject)columnSpan
{
  return self->_columnSpan;
}

- (void)setColumnSpan:(id)a3
{
  objc_storeStrong((id *)&self->_columnSpan, a3);
}

- (double)containerFraction
{
  return self->_containerFraction;
}

- (void)setContainerFraction:(double)a3
{
  self->_containerFraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnSpan, 0);
}

@end
