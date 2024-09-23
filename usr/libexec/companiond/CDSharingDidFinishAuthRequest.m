@implementation CDSharingDidFinishAuthRequest

- (CDSharingDidFinishAuthRequest)initWithRapportDictionary:(id)a3
{
  id v4;
  CDSharingDidFinishAuthRequest *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSError *error;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CDSharingDidFinishAuthRequest;
  v5 = -[CDSharingDidFinishAuthRequest init](&v12, "init");
  if (v5)
  {
    v6 = objc_opt_self(NSError);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = sub_100019F54(v4, CFSTR("authError"), (uint64_t)v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    error = v5->_error;
    v5->_error = (NSError *)v9;

  }
  return v5;
}

- (id)makeRapportDictionary
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = sub_10001A22C((uint64_t)self->_error);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("authError"));

  v6 = objc_msgSend(v3, "copy");
  return v6;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v4 = objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_error, CFSTR("error"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return (NSString *)v5;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
