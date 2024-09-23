@implementation WBSSearchSuggestionsFetcherResponse

- (WBSSearchSuggestionsFetcherResponse)init
{

  return 0;
}

- (WBSSearchSuggestionsFetcherResponse)initWithSuggestions:(id)a3 sizeInBytes:(int64_t)a4 statusCode:(int64_t)a5 timingData:(id)a6
{
  id v10;
  id v11;
  WBSSearchSuggestionsFetcherResponse *v12;
  uint64_t v13;
  NSArray *suggestions;
  uint64_t v15;
  NSDictionary *timingData;
  WBSSearchSuggestionsFetcherResponse *v17;
  objc_super v19;

  v10 = a3;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)WBSSearchSuggestionsFetcherResponse;
  v12 = -[WBSSearchSuggestionsFetcherResponse init](&v19, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    suggestions = v12->_suggestions;
    v12->_suggestions = (NSArray *)v13;

    v12->_sizeInBytes = a4;
    v12->_statusCode = a5;
    v15 = objc_msgSend(v11, "copy");
    timingData = v12->_timingData;
    v12->_timingData = (NSDictionary *)v15;

    v17 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSSearchSuggestionsFetcherResponse)initWithCoder:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  WBSSearchSuggestionsFetcherResponse *v18;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("suggestions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sizeInBytes"));
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("statusCode"));
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("timingData"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[WBSSearchSuggestionsFetcherResponse initWithSuggestions:sizeInBytes:statusCode:timingData:](self, "initWithSuggestions:sizeInBytes:statusCode:timingData:", v7, v8, v9, v17);
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *suggestions;
  id v5;

  suggestions = self->_suggestions;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", suggestions, CFSTR("suggestions"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_sizeInBytes, CFSTR("sizeInBytes"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_statusCode, CFSTR("statusCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timingData, CFSTR("timingData"));

}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (int64_t)sizeInBytes
{
  return self->_sizeInBytes;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSDictionary)timingData
{
  return self->_timingData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingData, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
}

@end
