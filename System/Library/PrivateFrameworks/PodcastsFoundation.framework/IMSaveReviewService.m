@implementation IMSaveReviewService

- (IMSaveReviewService)initWithEndpointURL:(id)a3 bodyData:(id)a4
{
  id v6;
  id v7;
  IMSaveReviewService *v8;
  IMSaveReviewService *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMSaveReviewService;
  v8 = -[IMBaseStoreService init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[IMSaveReviewService setBodyData:](v8, "setBodyData:", v7);
    -[IMSaveReviewService generatedEndpointURLForBaseURL:](v9, "generatedEndpointURLForBaseURL:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMSaveReviewService setEndpointURL:](v9, "setEndpointURL:", v10);

    -[IMBaseStoreService setPersonalizeRequests:](v9, "setPersonalizeRequests:", 1);
  }

  return v9;
}

- (id)generatedEndpointURLForBaseURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("type"), CFSTR("Podcast"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("version"), CFSTR("2"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setQueryItems:", v6);

  objc_msgSend(v3, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)performDataRequestWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[IMSaveReviewService urlRequest](self, "urlRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__IMSaveReviewService_performDataRequestWithCompletion___block_invoke;
  v7[3] = &unk_1E54D0F20;
  v8 = v4;
  v6 = v4;
  -[IMBaseStoreService performDataRequest:callback:](self, "performDataRequest:callback:", v5, v7);

}

uint64_t __56__IMSaveReviewService_performDataRequestWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a5);
  return result;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37A8];
  -[IMSaveReviewService endpointURL](self, "endpointURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setHTTPMethod:", CFSTR("POST"));
  -[IMSaveReviewService bodyData](self, "bodyData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHTTPBody:", v6);

  return v5;
}

- (NSData)bodyData
{
  return self->_bodyData;
}

- (void)setBodyData:(id)a3
{
  objc_storeStrong((id *)&self->_bodyData, a3);
}

- (NSURL)endpointURL
{
  return self->_endpointURL;
}

- (void)setEndpointURL:(id)a3
{
  objc_storeStrong((id *)&self->_endpointURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointURL, 0);
  objc_storeStrong((id *)&self->_bodyData, 0);
}

@end
