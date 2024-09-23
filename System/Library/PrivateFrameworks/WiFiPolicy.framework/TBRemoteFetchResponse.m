@implementation TBRemoteFetchResponse

+ (id)responseWithResults:(id)a3 tiles:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  TBRemoteFetchResponse *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[TBRemoteFetchResponse initWithResults:tiles:error:]([TBRemoteFetchResponse alloc], "initWithResults:tiles:error:", v9, v8, v7);

  return v10;
}

- (TBRemoteFetchResponse)initWithResults:(id)a3 tiles:(id)a4 error:(id)a5
{
  NSArray *v8;
  NSSet *v9;
  NSError *v10;
  TBRemoteFetchResponse *v11;
  NSArray *results;
  NSArray *v13;
  NSSet *tiles;
  NSSet *v15;
  NSError *error;
  objc_super v18;

  v8 = (NSArray *)a3;
  v9 = (NSSet *)a4;
  v10 = (NSError *)a5;
  v18.receiver = self;
  v18.super_class = (Class)TBRemoteFetchResponse;
  v11 = -[TBRemoteFetchResponse init](&v18, sel_init);
  results = v11->_results;
  v11->_results = v8;
  v13 = v8;

  tiles = v11->_tiles;
  v11->_tiles = v9;
  v15 = v9;

  error = v11->_error;
  v11->_error = v10;

  return v11;
}

- (NSSet)tiles
{
  return self->_tiles;
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_tiles, 0);
}

@end
