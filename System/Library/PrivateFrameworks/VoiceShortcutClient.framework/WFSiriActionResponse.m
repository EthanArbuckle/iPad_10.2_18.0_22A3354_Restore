@implementation WFSiriActionResponse

- (WFSiriActionResponse)initWithError:(id)a3
{
  id v5;
  WFSiriActionResponse *v6;
  WFSiriActionResponse *v7;
  WFSiriActionResponse *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriActionResponse;
  v6 = -[WFSiriActionResponse init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    v8 = v7;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFSiriActionResponse error](self, "error");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("error"));

}

- (WFSiriActionResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  WFSiriActionResponse *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[WFSiriActionResponse initWithError:](self, "initWithError:", v5);
  return v6;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
