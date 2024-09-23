@implementation SKUIPostRatingOperation

- (SKUIPostRatingOperation)initWithRating:(int64_t)a3 forItemID:(id)a4 reviewConfiguration:(id)a5
{
  id v8;
  SKUIPostRatingOperation *v9;
  SKUIPostRatingOperation *v10;
  uint64_t v11;
  NSString *itemID;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SKUIPostRatingOperation;
  v9 = -[SKUIPostRatingOperation init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_rating = a3;
    v11 = -[NSString copy](v9->_itemID, "copy");
    itemID = v10->_itemID;
    v10->_itemID = (NSString *)v11;

    objc_storeStrong((id *)&v10->_reviewConfiguration, a5);
  }

  return v10;
}

- (NSDictionary)responseDictionary
{
  NSDictionary *v3;

  -[SKUIPostRatingOperation lock](self, "lock");
  v3 = self->_responseDictionary;
  -[SKUIPostRatingOperation unlock](self, "unlock");
  return v3;
}

- (void)run
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  NSDictionary *v15;
  NSDictionary *responseDictionary;
  id v17;

  -[SKUIReviewConfiguration ratingURLString](self->_reviewConfiguration, "ratingURLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://userpub.itunes.apple.com/WebObjects/MZUserPublishing.woa/wa/userRateContent?displayable-kind=11&id=%@"), self->_itemID);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), self->_rating);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingQueryParameter:value:", CFSTR("rating"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x1E0DDC1B0]);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF5C8]), "initWithURL:", v6);
  objc_msgSend(v8, "setAllowedRetryCount:", 0);
  objc_msgSend(v8, "setCachePolicy:", 1);
  objc_msgSend(v8, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v7, "setRequestProperties:", v8);
  +[ISDataProvider provider](SKUIRatingResponseProvider, "provider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShouldProcessDialogs:", 1);
  objc_msgSend(v9, "setShouldProcessDialogsOutsideDaemon:", 1);
  objc_msgSend(v7, "setDataProvider:", v9);
  v17 = 0;
  v10 = -[SKUIPostRatingOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v7, &v17);
  v11 = v17;
  if (v10)
  {
    objc_msgSend(v9, "output");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("status-code"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v14 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v13, "integerValue") == 3200;
    -[SKUIPostRatingOperation lock](self, "lock");
    v15 = (NSDictionary *)objc_msgSend(v12, "copy");
    responseDictionary = self->_responseDictionary;
    self->_responseDictionary = v15;

    -[SKUIPostRatingOperation unlock](self, "unlock");
  }
  else
  {
    v14 = 0;
  }
  -[SKUIPostRatingOperation setError:](self, "setError:", v11);
  -[SKUIPostRatingOperation setSuccess:](self, "setSuccess:", v14);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reviewConfiguration, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end
