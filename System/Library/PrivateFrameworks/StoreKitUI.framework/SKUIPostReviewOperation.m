@implementation SKUIPostReviewOperation

- (SKUIPostReviewOperation)initWithReviewMetadata:(id)a3
{
  id v4;
  SKUIPostReviewOperation *v5;
  uint64_t v6;
  SKUIReviewMetadata *review;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUIPostReviewOperation;
  v5 = -[SKUIPostReviewOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    review = v5->_review;
    v5->_review = (SKUIReviewMetadata *)v6;

  }
  return v5;
}

- (NSDictionary)responseDictionary
{
  NSDictionary *v3;

  -[SKUIPostReviewOperation lock](self, "lock");
  v3 = self->_responseDictionary;
  -[SKUIPostReviewOperation unlock](self, "unlock");
  return v3;
}

- (void)run
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  NSDictionary *v14;
  NSDictionary *responseDictionary;
  id v16;

  v3 = objc_alloc_init(MEMORY[0x1E0DDC1B0]);
  v4 = objc_alloc(MEMORY[0x1E0DAF5C8]);
  -[SKUIReviewMetadata submitURL](self->_review, "submitURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithURL:", v5);

  objc_msgSend(v6, "setAllowedRetryCount:", 0);
  objc_msgSend(v6, "setCachePolicy:", 1);
  -[SKUIPostReviewOperation _httpBody](self, "_httpBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHTTPBody:", v7);

  objc_msgSend(v6, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v3, "setRequestProperties:", v6);
  objc_msgSend(MEMORY[0x1E0DDC1A0], "provider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShouldProcessDialogs:", 0);
  objc_msgSend(v3, "setDataProvider:", v8);
  v16 = 0;
  v9 = -[SKUIPostReviewOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v3, &v16);
  v10 = v16;
  v11 = 0;
  if (v9)
  {
    objc_msgSend(v8, "output");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("status-code"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v13, "integerValue") == 3200;
    -[SKUIPostReviewOperation lock](self, "lock");
    v14 = (NSDictionary *)objc_msgSend(v12, "copy");
    responseDictionary = self->_responseDictionary;
    self->_responseDictionary = v14;

    -[SKUIPostReviewOperation unlock](self, "unlock");
  }
  -[SKUIPostReviewOperation setError:](self, "setError:", v10);
  -[SKUIPostReviewOperation setSuccess:](self, "setSuccess:", v11);

}

- (id)_httpBody
{
  id v3;
  void *v4;
  float v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[SKUIReviewMetadata rating](self->_review, "rating");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%.2f"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("rating"));

  -[SKUIReviewMetadata body](self->_review, "body");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("body"));
  objc_msgSend(MEMORY[0x1E0DDC158], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "guid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("guid"));
  -[SKUIReviewMetadata nickname](self->_review, "nickname");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("nickname"));
  -[SKUIReviewMetadata title](self->_review, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length"))
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("title"));
  objc_msgSend(MEMORY[0x1E0C99E98], "queryStringForDictionary:escapedValues:", v3, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dataUsingEncoding:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_review, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end
