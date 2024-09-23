@implementation PLPhotoLibraryBundleCriteriaTuple

- (PLPhotoLibraryBundleCriteriaTuple)initWithBundle:(id)a3 withCriteria:(id)a4
{
  id v7;
  id v8;
  PLPhotoLibraryBundleCriteriaTuple *v9;
  PLPhotoLibraryBundleCriteriaTuple *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLPhotoLibraryBundleCriteriaTuple;
  v9 = -[PLPhotoLibraryBundleCriteriaTuple init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundle, a3);
    objc_storeStrong((id *)&v10->_criteria, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLBackgroundJobCriteria shortCode](self->_criteria, "shortCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@] - %@"), v4, self->_bundle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PLPhotoLibraryBundleCriteriaTuple *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  objc_super v15;

  v4 = (PLPhotoLibraryBundleCriteriaTuple *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)PLPhotoLibraryBundleCriteriaTuple;
    if (-[PLPhotoLibraryBundleCriteriaTuple isEqual:](&v15, sel_isEqual_, v4))
    {
      -[PLPhotoLibraryBundleCriteriaTuple bundle](self, "bundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "libraryURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "absoluteString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPhotoLibraryBundleCriteriaTuple bundle](v4, "bundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "libraryURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "absoluteString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", v10))
      {
        -[PLPhotoLibraryBundleCriteriaTuple criteria](self, "criteria");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLPhotoLibraryBundleCriteriaTuple criteria](v4, "criteria");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  -[PLPhotoLibraryBundleCriteriaTuple bundle](self, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "libraryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[PLPhotoLibraryBundleCriteriaTuple criteria](self, "criteria");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") ^ v5;

  return v7;
}

- (PLPhotoLibraryBundle)bundle
{
  return self->_bundle;
}

- (PLBackgroundJobCriteria)criteria
{
  return self->_criteria;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
