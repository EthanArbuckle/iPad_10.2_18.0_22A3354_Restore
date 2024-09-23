@implementation IMFetchReviewService

- (IMFetchReviewService)initWithAdamID:(id)a3
{
  id v4;
  IMFetchReviewService *v5;
  IMFetchReviewService *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IMFetchReviewService;
  v5 = -[IMBaseStoreService init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[IMFetchReviewService setAdamID:](v5, "setAdamID:", v4);
    -[IMBaseStoreService setPersonalizeRequests:](v6, "setPersonalizeRequests:", 1);
  }

  return v6;
}

- (void)performDataRequestWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[IMFetchReviewService urlRequest](self, "urlRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__IMFetchReviewService_performDataRequestWithCompletion___block_invoke;
  v7[3] = &unk_1E54D0F20;
  v8 = v4;
  v6 = v4;
  -[IMBaseStoreService performDataRequest:callback:](self, "performDataRequest:callback:", v5, v7);

}

uint64_t __57__IMFetchReviewService_performDataRequestWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  -[IMBaseStoreService bag](self, "bag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForKey:", CFSTR("p2-application-user-write-review"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isLoaded") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://userpub.itunes.apple.com/WebObjects/MZUserPublishing.woa/wa/writeUserReview"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    if (v5)
      goto LABEL_3;
LABEL_5:
    v15 = 0;
    goto LABEL_6;
  }
  v17 = 0;
  objc_msgSend(v4, "valueWithError:", &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;
  if (!v5)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB39D8];
  -[IMFetchReviewService adamID](self, "adamID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queryItemWithName:value:", CFSTR("id"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("version"), CFSTR("2"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setQueryItems:", v12);

  v13 = (void *)MEMORY[0x1E0CB39E0];
  objc_msgSend(v7, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requestWithURL:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v15;
}

- (NSString)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
  objc_storeStrong((id *)&self->_adamID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adamID, 0);
}

@end
