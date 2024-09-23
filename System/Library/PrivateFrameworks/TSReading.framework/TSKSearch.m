@implementation TSKSearch

- (TSKSearch)initWithString:(id)a3 options:(unint64_t)a4 hitBlock:(id)a5
{
  TSKSearch *v8;
  TSKSearch *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TSKSearch;
  v8 = -[TSKSearch init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[TSKSearch setString:](v8, "setString:", a3);
    -[TSKSearch setOptions:](v9, "setOptions:", a4);
    -[TSKSearch setHitBlock:](v9, "setHitBlock:", a5);
    -[TSKSearch setIsComplete:](v9, "setIsComplete:", 0);
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[TSKSearch setString:](self, "setString:", 0);
  -[TSKSearch setHitBlock:](self, "setHitBlock:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TSKSearch;
  -[TSKSearch dealloc](&v3, sel_dealloc);
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (id)hitBlock
{
  return self->_hitBlock;
}

- (void)setHitBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (void)setIsComplete:(BOOL)a3
{
  self->_isComplete = a3;
}

@end
