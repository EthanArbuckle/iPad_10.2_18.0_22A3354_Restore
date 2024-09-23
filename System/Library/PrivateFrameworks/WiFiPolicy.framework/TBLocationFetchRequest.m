@implementation TBLocationFetchRequest

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = objc_alloc_init((Class)objc_opt_class());
  -[TBLocationFetchRequest descriptor](self, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setDescriptor:", v7);

  objc_msgSend(v5, "setSourcePolicy:", -[TBLocationFetchRequest sourcePolicy](self, "sourcePolicy"));
  objc_msgSend(v5, "setCacheable:", -[TBLocationFetchRequest cacheable](self, "cacheable"));
  -[TBLocationFetchRequest resultsHandler](self, "resultsHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TBLocationFetchRequest resultsHandler](self, "resultsHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setResultsHandler:", v9);

  }
  -[TBLocationFetchRequest userInfo](self, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TBLocationFetchRequest userInfo](self, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copyWithZone:", a3);
    objc_msgSend(v5, "setUserInfo:", v12);

  }
  return v5;
}

- (id)resultsHandler
{
  return self->resultsHandler;
}

- (TBLocationFetchRequestDescriptor)descriptor
{
  return self->_descriptor;
}

- (NSDictionary)userInfo
{
  return self->userInfo;
}

- (unint64_t)sourcePolicy
{
  return self->_sourcePolicy;
}

- (void)setResultsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->userInfo, a3);
}

- (void)setSourcePolicy:(unint64_t)a3
{
  self->_sourcePolicy = a3;
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

- (void)setCacheable:(BOOL)a3
{
  self->_cacheable = a3;
}

- (BOOL)cacheable
{
  return self->_cacheable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong(&self->preferLocalHandler, 0);
  objc_storeStrong(&self->resultsHandler, 0);
  objc_storeStrong((id *)&self->userInfo, 0);
}

- (void)setPreferLocalHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)handleResponse:(id)a3
{
  id v4;
  void (**v5)(id, id, _QWORD, uint64_t);

  v4 = a3;
  -[TBLocationFetchRequest resultsHandler](self, "resultsHandler");
  v5 = (void (**)(id, id, _QWORD, uint64_t))objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4, 0, 1);

}

+ (id)fetchRequestWithDescriptor:(id)a3 sourcePolicy:(unint64_t)a4 cacheable:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;

  v5 = a5;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:sourcePolicy:cacheable:", v8, a4, v5);

  return v9;
}

- (TBLocationFetchRequest)initWithDescriptor:(id)a3 sourcePolicy:(unint64_t)a4 cacheable:(BOOL)a5
{
  TBLocationFetchRequestDescriptor *v8;
  TBLocationFetchRequest *v9;
  TBLocationFetchRequestDescriptor *descriptor;
  objc_super v12;

  v8 = (TBLocationFetchRequestDescriptor *)a3;
  v12.receiver = self;
  v12.super_class = (Class)TBLocationFetchRequest;
  v9 = -[TBLocationFetchRequest init](&v12, sel_init);
  descriptor = v9->_descriptor;
  v9->_descriptor = v8;

  v9->_sourcePolicy = a4;
  v9->_cacheable = a5;
  return v9;
}

- (id)preferLocalHandler
{
  return self->preferLocalHandler;
}

- (void)handlePreferLocalResponse:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = objc_msgSend(v13, "count");
  v5 = v13;
  if (v4)
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "created");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceNow");
      v9 = v8;

      if (self->userInfo)
      {
        -[TBLocationFetchRequest userInfo](self, "userInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "mutableCopy");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)-v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("staleness"));

        -[TBLocationFetchRequest setUserInfo:](self, "setUserInfo:", v11);
      }
    }

    v5 = v13;
  }

}

+ (id)fetchRequestWithDescriptor:(id)a3 sourcePolicy:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:sourcePolicy:cacheable:", v6, a4, 0);

  return v7;
}

@end
