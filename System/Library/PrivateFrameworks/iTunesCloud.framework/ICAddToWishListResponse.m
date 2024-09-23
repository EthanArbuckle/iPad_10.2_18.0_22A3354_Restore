@implementation ICAddToWishListResponse

- (ICAddToWishListResponse)initWithResponseDictionary:(id)a3
{
  id v5;
  ICAddToWishListResponse *v6;
  ICAddToWishListResponse *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICAddToWishListResponse;
  v6 = -[ICAddToWishListResponse init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_responseDictionary, a3);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)ICAddToWishListResponse;
  -[ICAddToWishListResponse description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ICAddToWishListResponse statusCode](self, "statusCode");
  -[ICAddToWishListResponse message](self, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [status=%d, msg='%@']"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)statusCode
{
  return -[NSDictionary ic_intValueForKey:](self->_responseDictionary, "ic_intValueForKey:", CFSTR("status"));
}

- (NSString)message
{
  return (NSString *)-[NSDictionary ic_stringValueForKey:](self->_responseDictionary, "ic_stringValueForKey:", CFSTR("msg"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end
