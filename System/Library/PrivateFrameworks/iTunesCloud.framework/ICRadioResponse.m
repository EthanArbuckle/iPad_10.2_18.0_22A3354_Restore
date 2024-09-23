@implementation ICRadioResponse

- (ICRadioResponse)initWithURLResponse:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  ICRadioResponse *v9;
  void *v10;
  uint64_t v11;
  ICURLAggregatedPerformanceMetrics *performanceMetrics;

  v4 = a3;
  objc_msgSend(v4, "parsedBodyDictionary");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = v5;
  else
    v7 = MEMORY[0x1E0C9AA70];
  objc_msgSend(v4, "expirationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICRadioResponse initWithResponseDictionary:expirationDate:](self, "initWithResponseDictionary:expirationDate:", v7, v8);

  if (v9)
  {
    objc_msgSend(v4, "performanceMetrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "aggregatedPerformanceMetrics");
      v11 = objc_claimAutoreleasedReturnValue();
      performanceMetrics = v9->_performanceMetrics;
      v9->_performanceMetrics = (ICURLAggregatedPerformanceMetrics *)v11;

    }
  }

  return v9;
}

- (ICRadioResponse)initWithResponseDictionary:(id)a3 expirationDate:(id)a4
{
  id v6;
  id v7;
  ICRadioResponse *v8;
  uint64_t v9;
  NSDictionary *responseDictionary;
  uint64_t v11;
  NSDate *expirationDate;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICRadioResponse;
  v8 = -[ICRadioResponse init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    responseDictionary = v8->_responseDictionary;
    v8->_responseDictionary = (NSDictionary *)v9;

    v11 = objc_msgSend(v7, "copy");
    expirationDate = v8->_expirationDate;
    v8->_expirationDate = (NSDate *)v11;

  }
  return v8;
}

- (NSDictionary)contentDictionary
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("content"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
    v3 = v2;
  else
    v3 = (id)MEMORY[0x1E0C9AA70];

  return (NSDictionary *)v3;
}

- (int64_t)version
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("version"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 5;

  return v3;
}

- (ICStoreDialogResponse)dialog
{
  void *v2;
  ICStoreDialogResponse *v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("dialog"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
    v3 = -[ICStoreDialogResponse initWithResponseDictionary:]([ICStoreDialogResponse alloc], "initWithResponseDictionary:", v2);
  else
    v3 = 0;

  return v3;
}

- (NSError)serverError
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("error"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("error-value"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = objc_msgSend(v3, "integerValue");
      if (v4)
      {
        v5 = v4;
        objc_msgSend(v2, "objectForKey:", CFSTR("error-message"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if ((_NSIsNSString() & 1) != 0)
        {
          v7 = (void *)MEMORY[0x1E0CB35C8];
          if (v6)
          {
            v11 = *MEMORY[0x1E0CB2D50];
            v12[0] = v6;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("ICRadioServerError"), v5, v8);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
            goto LABEL_9;
          }
        }
        else
        {

          v7 = (void *)MEMORY[0x1E0CB35C8];
        }
        objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("ICRadioServerError"), v5, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }

  }
  v9 = 0;
LABEL_9:

  return (NSError *)v9;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (ICURLAggregatedPerformanceMetrics)performanceMetrics
{
  return self->_performanceMetrics;
}

- (void)setPerformanceMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_performanceMetrics, a3);
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_performanceMetrics, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end
