@implementation SLFetchShareableContentActionResponse

+ (id)responseWithResult:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResult:", v4);

  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SLFetchShareableContentActionResponse)initWithBSXPCCoder:(id)a3
{
  id v4;
  SLFetchShareableContentActionResponse *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  SLShareableContentLoadResult *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SLFetchShareableContentActionResponse;
  v5 = -[SLShareableContentActionResponse initWithBSXPCCoder:](&v11, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_result);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v5->_result;
    v5->_result = (SLShareableContentLoadResult *)v8;

  }
  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[SLFetchShareableContentActionResponse result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_result);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  v7.receiver = self;
  v7.super_class = (Class)SLFetchShareableContentActionResponse;
  -[SLShareableContentActionResponse encodeWithBSXPCCoder:](&v7, sel_encodeWithBSXPCCoder_, v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLFetchShareableContentActionResponse)initWithCoder:(id)a3
{
  id v4;
  SLFetchShareableContentActionResponse *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  SLShareableContentLoadResult *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SLFetchShareableContentActionResponse;
  v5 = -[SLShareableContentActionResponse initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_result);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v5->_result;
    v5->_result = (SLShareableContentLoadResult *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[SLFetchShareableContentActionResponse result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_result);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  v7.receiver = self;
  v7.super_class = (Class)SLFetchShareableContentActionResponse;
  -[SLShareableContentActionResponse encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);

}

- (SLShareableContentLoadResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
}

@end
