@implementation SCPair

+ (id)pairWithFirst:(id)a3 second:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SCPair initNonMemoizedWithFirst:second:]([SCPair alloc], "initNonMemoizedWithFirst:second:", v6, v5);

  return v7;
}

- (id)initNonMemoizedWithFirst:(id)a3 second:(id)a4
{
  id v7;
  id v8;
  SCPair *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCPair;
  v9 = -[SCPair init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong(&v9->_first, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = objc_msgSend(self->_first, "hash");
  return objc_msgSend(self->_second, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  SCPair *v4;
  SCPair *v5;
  BOOL v6;

  v4 = (SCPair *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[SCPair isEqualToPair:](self, "isEqualToPair:", v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToPair:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[SCPair first](self, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "first");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    -[SCPair second](self, "second");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "second");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8 == v9;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p first:%@ second:%@>"), objc_opt_class(), self, self->_first, self->_second);
}

- (id)first
{
  return self->_first;
}

- (void)setFirst:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)second
{
  return self->_second;
}

- (void)setSecond:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_second, 0);
  objc_storeStrong(&self->_first, 0);
}

@end
