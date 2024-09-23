@implementation PSCapacityBarCategory

- (PSCapacityBarCategory)initWithIdentifier:(id)a3 title:(id)a4 color:(id)a5 bytes:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  PSCapacityBarCategory *v13;
  void *v14;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PSCapacityBarCategory;
  v13 = -[PSCapacityBarCategory init](&v16, sel_init);
  if (v13)
  {
    if (objc_msgSend(v10, "length"))
      v14 = v10;
    else
      v14 = v11;
    objc_storeStrong((id *)&v13->_identifier, v14);
    objc_storeStrong((id *)&v13->_title, a4);
    objc_storeStrong((id *)&v13->_color, a5);
    v13->_bytes = a6;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PSCapacityBarCategory initWithIdentifier:title:color:bytes:]([PSCapacityBarCategory alloc], "initWithIdentifier:title:color:bytes:", self->_identifier, self->_title, self->_color, self->_bytes);
}

- (unint64_t)bytes
{
  return self->_bytes;
}

- (void)setBytes:(unint64_t)a3
{
  self->_bytes = a3;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (UIColor)color
{
  return (UIColor *)objc_getProperty(self, a2, 32, 1);
}

- (void)setColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
