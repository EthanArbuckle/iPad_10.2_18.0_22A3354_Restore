@implementation _PSClustersArchive

- (_PSClustersArchive)initWithClustersDictionary:(id)a3 archiveDate:(id)a4
{
  id v7;
  id v8;
  _PSClustersArchive *v9;
  _PSClustersArchive *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PSClustersArchive;
  v9 = -[_PSClustersArchive init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clustersDictionary, a3);
    objc_storeStrong((id *)&v10->_archiveDate, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[_PSClustersArchive clustersDictionary](self, "clustersDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSClustersArchive archiveDate](self, "archiveDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithClustersDictionary:archiveDate:", v5, v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[_PSClustersArchive clustersDictionary](self, "clustersDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_clustersDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[_PSClustersArchive archiveDate](self, "archiveDate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_archiveDate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, v7);

}

- (_PSClustersArchive)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _PSClustersArchive *v17;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_clustersDictionary);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_archiveDate);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v12, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[_PSClustersArchive initWithClustersDictionary:archiveDate:](self, "initWithClustersDictionary:archiveDate:", v14, v16);
  return v17;
}

- (NSDate)archiveDate
{
  return self->_archiveDate;
}

- (NSDictionary)clustersDictionary
{
  return self->_clustersDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clustersDictionary, 0);
  objc_storeStrong((id *)&self->_archiveDate, 0);
}

@end
