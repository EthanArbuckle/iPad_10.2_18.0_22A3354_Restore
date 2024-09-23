@implementation SignpostReporterAggregationKey

- (SignpostReporterAggregationKey)initWithSubsystem:(id)a3 category:(id)a4
{
  id v7;
  id v8;
  SignpostReporterAggregationKey *v9;
  SignpostReporterAggregationKey *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SignpostReporterAggregationKey;
  v9 = -[SignpostReporterAggregationKey init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_subsystem, a3);
    objc_storeStrong((id *)&v10->_category, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterAggregationKey subsystem](self, "subsystem"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterAggregationKey category](self, "category"));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SignpostReporterAggregationKey *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  SignpostReporterAggregationKey *v9;

  v4 = +[SignpostReporterAggregationKey allocWithZone:](SignpostReporterAggregationKey, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterAggregationKey subsystem](self, "subsystem"));
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterAggregationKey category](self, "category"));
  v8 = objc_msgSend(v7, "copy");
  v9 = -[SignpostReporterAggregationKey initWithSubsystem:category:](v4, "initWithSubsystem:category:", v6, v8);

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterAggregationKey subsystem](self, "subsystem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterAggregationKey category](self, "category"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v3, v4));

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SignpostReporterAggregationKey *v4;
  uint64_t v5;
  SignpostReporterAggregationKey *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v4 = (SignpostReporterAggregationKey *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterAggregationKey subsystem](v6, "subsystem"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterAggregationKey subsystem](self, "subsystem"));
      if (objc_msgSend(v7, "isEqualToString:", v8))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterAggregationKey category](v6, "category"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterAggregationKey category](self, "category"));
        v11 = objc_msgSend(v9, "isEqualToString:", v10);

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
  }

  return v11;
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (NSString)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_subsystem, 0);
}

@end
