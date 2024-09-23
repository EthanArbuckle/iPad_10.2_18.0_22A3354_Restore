@implementation ICLibraryAuthServiceBulkClientTokenResponse

- (ICLibraryAuthServiceBulkClientTokenResponse)initWithResponseDictionary:(id)a3
{
  id v4;
  ICLibraryAuthServiceBulkClientTokenResponse *v5;
  uint64_t v6;
  NSDictionary *responseDictionary;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *parsedTokenResults;
  _QWORD v12[4];
  ICLibraryAuthServiceBulkClientTokenResponse *v13;

  v4 = a3;
  v5 = -[ICLibraryAuthServiceBulkClientTokenResponse init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    responseDictionary = v5->_responseDictionary;
    v5->_responseDictionary = (NSDictionary *)v6;

    -[NSDictionary ic_dictionaryValueForKey:](v5->_responseDictionary, "ic_dictionaryValueForKey:", CFSTR("result"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
    v9 = objc_claimAutoreleasedReturnValue();
    parsedTokenResults = v5->_parsedTokenResults;
    v5->_parsedTokenResults = (NSMutableDictionary *)v9;

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __74__ICLibraryAuthServiceBulkClientTokenResponse_initWithResponseDictionary___block_invoke;
    v12[3] = &unk_1E438E6C0;
    v13 = v5;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v12);

  }
  return v5;
}

- (NSString)serverInstance
{
  return (NSString *)-[NSDictionary ic_stringValueForKey:](self->_responseDictionary, "ic_stringValueForKey:", CFSTR("serverInstance"));
}

- (NSDictionary)tokenResults
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_parsedTokenResults, "copy");
}

- (id)tokenResultForAccountDSID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_parsedTokenResults, "objectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsedTokenResults, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

void __74__ICLibraryAuthServiceBulkClientTokenResponse_initWithResponseDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  ICLibraryAuthServiceClientTokenResult *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v10, "longLongValue") >= 1
    && _NSIsNSDictionary())
  {
    v6 = objc_msgSend(v10, "longLongValue");
    v7 = -[ICLibraryAuthServiceClientTokenResult initWithResponseDictionary:]([ICLibraryAuthServiceClientTokenResult alloc], "initWithResponseDictionary:", v5);
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, v9);

  }
}

@end
