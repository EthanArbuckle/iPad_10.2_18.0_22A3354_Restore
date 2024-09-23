@implementation CLPropertyValue

- (BOOL)dirty
{
  return self->_dirty;
}

- (id)value
{
  return self->_value;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (CLPropertyValue)initWithValue:(id)a3 dirty:(BOOL)a4
{
  CLPropertyValue *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLPropertyValue;
  v6 = -[CLPropertyValue init](&v8, "init");
  if (v6)
  {
    v6->_value = a3;
    v6->_dirty = a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLPropertyValue;
  -[CLPropertyValue dealloc](&v3, "dealloc");
}

@end
