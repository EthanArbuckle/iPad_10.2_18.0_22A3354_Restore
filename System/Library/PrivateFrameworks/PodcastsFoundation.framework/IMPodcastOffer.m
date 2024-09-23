@implementation IMPodcastOffer

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[IMPodcastOffer priceType](self, "priceType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMPodcastOffer priceType](self, "priceType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7 || objc_msgSend(v6, "isEqual:", v7))
    {
      -[IMPodcastOffer kind](self, "kind");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "kind");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v9)
        v10 = 1;
      else
        v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)offerTypeAsFlagBit
{
  void *v3;
  char v4;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  int v11;

  -[IMPodcastOffer priceType](self, "priceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("STDQ"));

  if ((v4 & 1) != 0)
    return 1;
  -[IMPodcastOffer priceType](self, "priceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("PSUB"));

  if ((v7 & 1) != 0)
    return 2;
  -[IMPodcastOffer priceType](self, "priceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("PLUS"));

  if ((v9 & 1) != 0)
    return 4;
  -[IMPodcastOffer priceType](self, "priceType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("PRMO"));

  if (v11)
    return 8;
  else
    return 1;
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
  objc_storeStrong((id *)&self->_kind, a3);
}

- (NSString)priceType
{
  return self->_priceType;
}

- (void)setPriceType:(id)a3
{
  objc_storeStrong((id *)&self->_priceType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priceType, 0);
  objc_storeStrong((id *)&self->_kind, 0);
}

@end
