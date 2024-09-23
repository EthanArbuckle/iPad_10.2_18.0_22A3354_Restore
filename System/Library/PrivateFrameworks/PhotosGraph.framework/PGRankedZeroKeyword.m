@implementation PGRankedZeroKeyword

- (PGRankedZeroKeyword)initWithKeyword:(id)a3 score:(double)a4
{
  id v7;
  PGRankedZeroKeyword *v8;
  PGRankedZeroKeyword *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGRankedZeroKeyword;
  v8 = -[PGRankedZeroKeyword init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_zeroKeyword, a3);
    v9->_score = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PGRankedZeroKeyword zeroKeyword](self, "zeroKeyword");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zeroKeyword");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (NSDictionary)zeroKeyword
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (double)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zeroKeyword, 0);
}

@end
