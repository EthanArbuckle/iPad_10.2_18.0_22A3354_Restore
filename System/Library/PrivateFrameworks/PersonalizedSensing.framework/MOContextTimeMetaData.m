@implementation MOContextTimeMetaData

- (MOContextTimeMetaData)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOContextTimeMetaData;
  return -[MOContextTimeMetaData init](&v3, sel_init);
}

- (MOContextTimeMetaData)initWithTimeReferenceString:(id)a3
{
  id v5;
  MOContextTimeMetaData *v6;
  MOContextTimeMetaData *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MOContextTimeMetaData;
  v6 = -[MOContextTimeMetaData init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_timeReferenceString, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOContextTimeMetaData *v4;
  void *v5;
  MOContextTimeMetaData *v6;

  v4 = [MOContextTimeMetaData alloc];
  -[MOContextTimeMetaData timeReferenceString](self, "timeReferenceString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MOContextTimeMetaData initWithTimeReferenceString:](v4, "initWithTimeReferenceString:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_timeReferenceString, CFSTR("timeReferenceString"));
}

- (MOContextTimeMetaData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MOContextTimeMetaData *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeReferenceString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[MOContextTimeMetaData initWithTimeReferenceString:](self, "initWithTimeReferenceString:", v5);
  return v6;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[MOContextTimeMetaData timeReferenceString](self, "timeReferenceString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("time string, %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)timeReferenceString
{
  return self->_timeReferenceString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeReferenceString, 0);
}

@end
