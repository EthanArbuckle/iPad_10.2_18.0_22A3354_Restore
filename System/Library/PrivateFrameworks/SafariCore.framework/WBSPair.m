@implementation WBSPair

- (id)first
{
  return self->_first;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_second, 0);
  objc_storeStrong(&self->_first, 0);
}

- (WBSPair)initWithFirst:(id)a3 second:(id)a4
{
  id v7;
  id v8;
  WBSPair *v9;
  WBSPair *v10;
  WBSPair *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSPair;
  v9 = -[WBSPair init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_first, a3);
    objc_storeStrong(&v10->_second, a4);
    v11 = v10;
  }

  return v10;
}

- (id)second
{
  return self->_second;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = objc_msgSend(self->_first, "hash");
  return objc_msgSend(self->_second, "hash") ^ v3;
}

- (WBSPair)init
{

  return 0;
}

- (void)getFirst:(id *)a3 second:(id *)a4
{
  *a3 = objc_retainAutorelease(self->_first);
  *a4 = objc_retainAutorelease(self->_second);
}

- (BOOL)isEqual:(id)a3
{
  WBSPair *v4;
  WBSPair *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (WBSPair *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[WBSPair first](v5, "first");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (WBSIsEqual(v6, self->_first))
      {
        -[WBSPair second](v5, "second");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = WBSIsEqual(v7, self->_second);

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p, first: %@, second: %@>"), objc_opt_class(), self, self->_first, self->_second);
}

@end
