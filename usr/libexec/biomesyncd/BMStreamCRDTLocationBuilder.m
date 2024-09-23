@implementation BMStreamCRDTLocationBuilder

- (BMStreamCRDTLocationBuilder)initWithAssignerPolicy:(id)a3
{
  id v5;
  BMStreamCRDTLocationBuilder *v6;
  BMStreamCRDTLocationBuilder *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMStreamCRDTLocationBuilder;
  v6 = -[BMStreamCRDTLocationBuilder init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_policy, a3);

  return v7;
}

- (id)locationWithStreamName:(id)a3 siteIdentifier:(id)a4 timestamp:(double)a5
{
  return -[BMStreamCRDTLocationAssignerPolicy locationWithStreamName:siteIdentifier:timestamp:](self->_policy, "locationWithStreamName:siteIdentifier:timestamp:", a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policy, 0);
}

@end
