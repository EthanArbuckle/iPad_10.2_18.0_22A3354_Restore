@implementation SSVURLLookupResponseConsumer

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  SSLookupResponse *v10;
  void *v11;
  SSLookupResponse *v12;
  void *v13;
  id v15;

  v7 = a4;
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  objc_opt_class();
  v10 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("pageType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "isEqualToString:", CFSTR("nearbyApps")))
      v12 = -[SSLookupResponse initWithLocationResponseDictionary:]([SSLookupResponse alloc], "initWithLocationResponseDictionary:", v8);
    else
      v12 = -[SSLookupResponse initWithResponseDictionary:]([SSLookupResponse alloc], "initWithResponseDictionary:", v8);
    v10 = v12;
    if (SSURLResponseExpirationInterval(v7) >= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSLookupResponse setExpirationDate:](v10, "setExpirationDate:", v13);

    }
  }
  if (!v7 && a5)
    *a5 = objc_retainAutorelease(v9);

  return v10;
}

@end
