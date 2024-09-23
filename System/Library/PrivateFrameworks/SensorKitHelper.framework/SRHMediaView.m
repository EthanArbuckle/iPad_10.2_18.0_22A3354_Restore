@implementation SRHMediaView

- (SRHMediaView)init
{
  SRHMediaView *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SRHMediaView;
  v2 = -[SRHMediaView init](&v4, sel_init);
  if (v2)
    v2->_uuid = (NSUUID *)(id)objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  return v2;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("uuid:%@"), self->_uuid);
}

- (void)dealloc
{
  objc_super v3;

  self->_uuid = 0;
  v3.receiver = self;
  v3.super_class = (Class)SRHMediaView;
  -[SRHMediaView dealloc](&v3, sel_dealloc);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (CGRect)position
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_position.origin.x;
  y = self->_position.origin.y;
  width = self->_position.size.width;
  height = self->_position.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPosition:(CGRect)a3
{
  self->_position = a3;
}

@end
