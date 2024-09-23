@implementation TBErrorFetchResponse

+ (id)responseWithError:(id)a3
{
  id v3;
  TBErrorFetchResponse *v4;

  v3 = a3;
  v4 = -[TBErrorFetchResponse initWithError:]([TBErrorFetchResponse alloc], "initWithError:", v3);

  return v4;
}

+ (id)remoteResponseWithError:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  TBError *v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

  if (v6)
  {
    if (objc_msgSend(v4, "code") == -1009)
      v7 = 155;
    else
      v7 = 150;
    v8 = CFSTR("Unknown remote fetch error");
  }
  else
  {
    objc_msgSend(v4, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    GEOErrorDomain();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    if (v11)
    {
      v12 = objc_msgSend(v4, "code");
      v8 = CFSTR("Unknown remote fetch error");
      v7 = 150;
      switch(v12)
      {
        case -9:
        case -1:
          goto LABEL_11;
        case -8:
        case -6:
        case -5:
        case -3:
        case -2:
          break;
        case -7:
          v8 = CFSTR("Server error");
          v7 = 153;
          break;
        case -4:
          v8 = CFSTR("No configured URL for remote fetch");
          v7 = 151;
          break;
        default:
          if (v12 == -15)
          {
LABEL_11:
            v8 = CFSTR("Connection error");
            v7 = 152;
          }
          break;
      }
    }
    else
    {
      v8 = CFSTR("Unknown remote fetch error");
      v7 = 150;
    }
  }
  v13 = *MEMORY[0x1E0CB3388];
  v19[0] = *MEMORY[0x1E0CB2D50];
  v19[1] = v13;
  v20[0] = v8;
  v20[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc((Class)a1);
  v16 = -[TBError initWithType:userInfo:]([TBError alloc], "initWithType:userInfo:", v7, v14);
  v17 = (void *)objc_msgSend(v15, "initWithError:", v16);

  return v17;
}

- (TBErrorFetchResponse)initWithError:(id)a3
{
  id v3;
  TBErrorFetchResponse *v4;
  uint64_t v5;
  NSError *error;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TBErrorFetchResponse;
  v3 = a3;
  v4 = -[TBErrorFetchResponse init](&v8, sel_init);
  v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  error = v4->_error;
  v4->_error = (NSError *)v5;

  return v4;
}

- (NSArray)results
{
  return self->results;
}

- (NSSet)tiles
{
  return self->tiles;
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
  objc_storeStrong((id *)&self->tiles, 0);
  objc_storeStrong((id *)&self->results, 0);
}

@end
