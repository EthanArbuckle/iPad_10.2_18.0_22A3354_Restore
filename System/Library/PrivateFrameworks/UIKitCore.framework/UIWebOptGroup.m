@implementation UIWebOptGroup

- (UIWebOptGroup)initWithGroup:(id)a3 itemOffset:(int64_t)a4
{
  UIWebOptGroup *v6;
  UIWebOptGroup *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIWebOptGroup;
  v6 = -[UIWebOptGroup init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[UIWebOptGroup setGroup:](v6, "setGroup:", a3);
    v7->_offset = a4;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[UIWebOptGroup setGroup:](self, "setGroup:", 0);
  -[UIWebOptGroup setOptions:](self, "setOptions:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIWebOptGroup;
  -[UIWebOptGroup dealloc](&v3, sel_dealloc);
}

- (int64_t)offset
{
  return self->_offset;
}

- (UIWebSelectedItemPrivate)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSArray)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
