@implementation PFStoryClusteringProperties

- (PFStoryClusteringProperties)initWithAlgorithmName:(id)a3 algorithmProperties:(id)a4 distanceWeights:(id)a5
{
  id v7;
  id v8;
  __CFString *v9;
  PFStoryClusteringProperties *v10;
  PFStoryClusteringProperties *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PFStoryClusteringProperties;
  v7 = a5;
  v8 = a4;
  v9 = (__CFString *)a3;
  v10 = -[PFStoryClusteringProperties init](&v17, sel_init);
  v11 = v10;
  if (v9)
    v12 = v9;
  else
    v12 = CFSTR("PLDBSCANClustering");
  objc_storeStrong((id *)&v10->_algorithm, v12);
  v13 = (void *)MEMORY[0x1E0C9AA70];
  if (v8)
    v14 = v8;
  else
    v14 = (void *)MEMORY[0x1E0C9AA70];
  objc_storeStrong((id *)&v11->_algorithmProperties, v14);
  if (v7)
    v15 = v7;
  else
    v15 = v13;
  objc_storeStrong((id *)&v11->_distanceWeights, v15);

  return v11;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PFStoryClusteringProperties algorithm](self, "algorithm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryClusteringProperties algorithmProperties](self, "algorithmProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryClusteringProperties distanceWeights](self, "distanceWeights");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; algorithm = %@, algorithm properties = %@, distance weights = %@>"),
    v4,
    self,
    v5,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PFStoryClusteringProperties *v4;
  BOOL v5;

  v4 = (PFStoryClusteringProperties *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PFStoryClusteringProperties isEqualToPFStoryClusteringProperties:](self, "isEqualToPFStoryClusteringProperties:", v4);
  }

  return v5;
}

- (BOOL)isEqualToPFStoryClusteringProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[PFStoryClusteringProperties algorithm](self, "algorithm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "algorithm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[PFStoryClusteringProperties algorithmProperties](self, "algorithmProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "algorithmProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToDictionary:", v8))
    {
      -[PFStoryClusteringProperties distanceWeights](self, "distanceWeights");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "distanceWeights");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToDictionary:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)algorithm
{
  return self->_algorithm;
}

- (NSDictionary)algorithmProperties
{
  return self->_algorithmProperties;
}

- (NSDictionary)distanceWeights
{
  return self->_distanceWeights;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceWeights, 0);
  objc_storeStrong((id *)&self->_algorithmProperties, 0);
  objc_storeStrong((id *)&self->_algorithm, 0);
}

@end
