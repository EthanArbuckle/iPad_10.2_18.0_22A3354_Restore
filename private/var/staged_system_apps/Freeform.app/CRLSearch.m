@implementation CRLSearch

- (CRLSearch)initWithString:(id)a3 options:(unint64_t)a4 hitBlock:(id)a5
{
  id v8;
  id v9;
  CRLSearch *v10;
  CRLSearch *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CRLSearch;
  v10 = -[CRLSearch init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    -[CRLSearch setString:](v10, "setString:", v8);
    -[CRLSearch setOptions:](v11, "setOptions:", a4);
    -[CRLSearch setHitBlock:](v11, "setHitBlock:", v9);
    -[CRLSearch setIsComplete:](v11, "setIsComplete:", 0);
  }

  return v11;
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hitBlock, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
