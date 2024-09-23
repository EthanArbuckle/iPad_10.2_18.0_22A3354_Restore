@implementation LocationOfInterestItemKey

- (LocationOfInterestItemKey)init
{

  return 0;
}

- (LocationOfInterestItemKey)initWithLocationOfInterest:(id)a3
{
  id v5;
  LocationOfInterestItemKey *v6;
  LocationOfInterestItemKey *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LocationOfInterestItemKey;
  v6 = -[LocationOfInterestItemKey init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_locationOfInterest, a3);

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LocationOfInterestItemKey locationOfInterest](self, "locationOfInterest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LocationOfInterestItemKey locationOfInterest](self, "locationOfInterest"));
  v6 = v5;
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v8 = objc_msgSend(v7, "hash");

  }
  else
  {
    v8 = v5;
  }

  return (unint64_t)v8;
}

- (BOOL)isEqual:(id)a3
{
  LocationOfInterestItemKey *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;

  v4 = (LocationOfInterestItemKey *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    v5 = objc_opt_class(LocationOfInterestItemKey);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[LocationOfInterestItemKey locationOfInterest](v4, "locationOfInterest"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[LocationOfInterestItemKey locationOfInterest](self, "locationOfInterest"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      if (v8)
      {
        v9 = (void *)v8;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));

        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[LocationOfInterestItemKey locationOfInterest](self, "locationOfInterest"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
          v14 = objc_msgSend(v12, "isEqual:", v13);

LABEL_10:
          goto LABEL_11;
        }
      }
      else
      {

      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[LocationOfInterestItemKey locationOfInterest](self, "locationOfInterest"));
      v14 = v11 == v6;
      goto LABEL_10;
    }
    v14 = 0;
  }
LABEL_11:

  return v14;
}

- (MapsLocationOfInterest)locationOfInterest
{
  return self->_locationOfInterest;
}

- (void)setLocationOfInterest:(id)a3
{
  objc_storeStrong((id *)&self->_locationOfInterest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationOfInterest, 0);
}

@end
