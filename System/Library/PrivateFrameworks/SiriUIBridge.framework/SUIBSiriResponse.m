@implementation SUIBSiriResponse

- (SUIBSiriResponse)initWithBuilder:(id)a3
{
  void (**v4)(id, SUIBSiriResponseMutation *);
  SUIBSiriResponse *v5;
  SUIBSiriResponse *v6;
  SUIBSiriResponseMutation *v7;
  uint64_t v8;
  SUIBSiriInAppResponse *inAppResponse;
  objc_super v11;

  v4 = (void (**)(id, SUIBSiriResponseMutation *))a3;
  v11.receiver = self;
  v11.super_class = (Class)SUIBSiriResponse;
  v5 = -[SUIBSiriResponse init](&v11, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_alloc_init(SUIBSiriResponseMutation);
    v4[2](v4, v7);
    -[SUIBSiriResponseMutation inAppResponse](v7, "inAppResponse");
    v8 = objc_claimAutoreleasedReturnValue();
    inAppResponse = v6->_inAppResponse;
    v6->_inAppResponse = (SUIBSiriInAppResponse *)v8;

  }
  return v6;
}

- (SUIBSiriResponse)init
{
  return -[SUIBSiriResponse initWithBuilder:](self, "initWithBuilder:", &__block_literal_global_5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUIBSiriResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  SUIBSiriResponse *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SUIBSiriResponse::inAppResponse"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __34__SUIBSiriResponse_initWithCoder___block_invoke;
  v9[3] = &unk_2518A4558;
  v10 = v5;
  v6 = v5;
  v7 = -[SUIBSiriResponse initWithBuilder:](self, "initWithBuilder:", v9);

  return v7;
}

uint64_t __34__SUIBSiriResponse_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInAppResponse:", *(_QWORD *)(a1 + 32));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_inAppResponse, CFSTR("SUIBSiriResponse::inAppResponse"));
}

- (SUIBSiriInAppResponse)inAppResponse
{
  return self->_inAppResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inAppResponse, 0);
}

@end
