@implementation BCCountedCFISetEntry

- (BCCountedCFISetEntry)initWithCFI:(id)a3
{
  id v5;
  BCCountedCFISetEntry *v6;
  BCCountedCFISetEntry *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BCCountedCFISetEntry;
  v6 = -[BCCountedCFISetEntry init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cfi, a3);

  return v7;
}

- (int64_t)compare:(id)a3
{
  BCCountedCFISetEntry *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int64_t v8;

  v4 = (BCCountedCFISetEntry *)a3;
  if (self == v4)
  {
    v8 = 0;
  }
  else
  {
    v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCountedCFISetEntry cfi](self, "cfi"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCountedCFISetEntry cfi](v4, "cfi"));
      v8 = (int64_t)objc_msgSend(v6, "compare:", v7);

    }
    else
    {
      v8 = -1;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_alloc((Class)objc_opt_class(self));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCountedCFISetEntry cfi](self, "cfi"));
  v6 = objc_msgSend(v4, "initWithCFI:", v5);

  -[BCCountedCFISetEntry count](self, "count");
  objc_msgSend(v6, "setCount:");
  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCountedCFISetEntry cfi](self, "cfi"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "string"));
  -[BCCountedCFISetEntry count](self, "count");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ => %.1f"), v4, v5));

  return v6;
}

- (BCCFI)cfi
{
  return self->_cfi;
}

- (void)setCfi:(id)a3
{
  objc_storeStrong((id *)&self->_cfi, a3);
}

- (double)count
{
  return self->_count;
}

- (void)setCount:(double)a3
{
  self->_count = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cfi, 0);
}

@end
