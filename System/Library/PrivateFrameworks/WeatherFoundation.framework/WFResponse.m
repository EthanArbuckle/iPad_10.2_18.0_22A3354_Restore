@implementation WFResponse

+ (WFResponse)responseWithIdentifier:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:error:", v6, v5);

  return (WFResponse *)v7;
}

- (WFResponse)initWithIdentifier:(id)a3
{
  return -[WFResponse initWithIdentifier:error:](self, "initWithIdentifier:error:", a3, 0);
}

- (WFResponse)initWithIdentifier:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  WFResponse *v9;
  WFResponse *v10;
  WFResponse *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFResponse;
  v9 = -[WFResponse init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_error, a4);
    v11 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  WFResponse *v6;
  void *v7;
  double v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFResponse initWithIdentifier:](self, "initWithIdentifier:", v5);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("executionTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "doubleValue");
  v6->_executionTime = v8;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[WFResponse identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  v6 = (void *)MEMORY[0x24BDD16E0];
  -[WFResponse executionTime](self, "executionTime");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("executionTime"));

}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (double)executionTime
{
  return self->_executionTime;
}

- (void)setExecutionTime:(double)a3
{
  self->_executionTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
