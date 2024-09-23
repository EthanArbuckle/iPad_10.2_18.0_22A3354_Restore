@implementation PPSGroupingDimension

- (PPSGroupingDimension)initWithMetricName:(id)a3 groupBy:(id)a4
{
  id v7;
  id v8;
  PPSGroupingDimension *v9;
  PPSGroupingDimension *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PPSGroupingDimension;
  v9 = -[PPSGroupingDimension init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metricName, a3);
    objc_storeStrong((id *)&v10->_groupBy, a4);
  }

  return v10;
}

- (PPSGroupingDimension)initWithGroupBy:(id)a3
{
  id v5;
  PPSGroupingDimension *v6;
  PPSGroupingDimension *v7;
  NSString *metricName;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PPSGroupingDimension;
  v6 = -[PPSGroupingDimension init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    metricName = v6->_metricName;
    v6->_metricName = 0;

    objc_storeStrong((id *)&v7->_groupBy, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PPSGroupingDimension)initWithCoder:(id)a3
{
  id v4;
  PPSGroupingDimension *v5;
  uint64_t v6;
  NSString *metricName;
  uint64_t v8;
  NSString *groupBy;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPSGroupingDimension;
  v5 = -[PPSGroupingDimension init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metric"));
    v6 = objc_claimAutoreleasedReturnValue();
    metricName = v5->_metricName;
    v5->_metricName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupBy"));
    v8 = objc_claimAutoreleasedReturnValue();
    groupBy = v5->_groupBy;
    v5->_groupBy = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_metricName, CFSTR("metric"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_groupBy, CFSTR("groupBy"));

}

- (NSString)metricName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)groupBy
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupBy, 0);
  objc_storeStrong((id *)&self->_metricName, 0);
}

@end
