@implementation GTUnsupportedFenumInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTUnsupportedFenumInfo)initWithFenum:(id)a3 category:(id)a4 customMessage:(id)a5 customRecoverySuggestion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  GTUnsupportedFenumInfo *v15;
  GTUnsupportedFenumInfo *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)GTUnsupportedFenumInfo;
  v15 = -[GTUnsupportedFenumInfo init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fenum, a3);
    objc_storeStrong((id *)&v16->_category, a4);
    objc_storeStrong((id *)&v16->_customMessage, a5);
    objc_storeStrong((id *)&v16->_customRecoverySuggestion, a6);
  }

  return v16;
}

- (GTUnsupportedFenumInfo)initWithCoder:(id)a3
{
  id v4;
  GTUnsupportedFenumInfo *v5;
  id v6;
  uint64_t v7;
  NSString *fenum;
  id v9;
  uint64_t v10;
  NSString *category;
  id v12;
  uint64_t v13;
  NSString *customMessage;
  id v15;
  uint64_t v16;
  NSString *customRecoverySuggestion;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GTUnsupportedFenumInfo;
  v5 = -[GTUnsupportedFenumInfo init](&v19, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("fenum"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    fenum = v5->_fenum;
    v5->_fenum = (NSString *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("category"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    category = v5->_category;
    v5->_category = (NSString *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("customMessage"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    customMessage = v5->_customMessage;
    v5->_customMessage = (NSString *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("customRecoverySuggestion"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    customRecoverySuggestion = v5->_customRecoverySuggestion;
    v5->_customRecoverySuggestion = (NSString *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *fenum;
  id v5;

  fenum = self->_fenum;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", fenum, CFSTR("fenum"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_category, CFSTR("category"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_customMessage, CFSTR("customMessage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_customRecoverySuggestion, CFSTR("customRecoverySuggestion"));

}

- (id)asError
{
  NSString *fenum;
  id v4;
  void *v5;
  NSString *category;
  NSString *v7;
  NSString *customMessage;
  NSString *v9;
  NSString *customRecoverySuggestion;
  __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSErrorUserInfoKey v16;
  void *v17;
  void *v18;
  NSString *v19;
  NSString *v20;
  void *v21;

  if (-[NSString isEqualToString:](self->_fenum, "isEqualToString:", &stru_100031038))
    fenum = 0;
  else
    fenum = self->_fenum;
  v4 = PrettifyFenumString(fenum, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (-[NSString isEqualToString:](self->_category, "isEqualToString:", &stru_100031038))
    category = 0;
  else
    category = self->_category;
  v7 = category;
  if (-[NSString isEqualToString:](self->_customMessage, "isEqualToString:", &stru_100031038))
    customMessage = 0;
  else
    customMessage = self->_customMessage;
  v9 = customMessage;
  if (-[NSString isEqualToString:](self->_customRecoverySuggestion, "isEqualToString:", &stru_100031038))
    customRecoverySuggestion = 0;
  else
    customRecoverySuggestion = self->_customRecoverySuggestion;
  v11 = customRecoverySuggestion;
  v12 = objc_alloc_init((Class)NSMutableDictionary);
  v13 = v12;
  if (v7)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Capturing %@ is not supported."), v7));
    objc_msgSend(v13, "setObject:forKey:", v14, NSLocalizedDescriptionKey);

    if (!v5)
      goto LABEL_19;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unsupported method: %@"), v5));
    v16 = NSLocalizedFailureReasonErrorKey;
  }
  else
  {
    if (!v5)
    {
      objc_msgSend(v12, "setObject:forKey:", CFSTR("Capturing disabled. Unsupported API usage."), NSLocalizedDescriptionKey);
      if (v9)
        goto LABEL_20;
      goto LABEL_24;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Capturing %@ is not supported."), v5));
    v16 = NSLocalizedDescriptionKey;
  }
  objc_msgSend(v13, "setObject:forKey:", v15, v16);

LABEL_19:
  if (v9)
  {
LABEL_20:
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", NSLocalizedFailureReasonErrorKey));
    v18 = v17;
    if (v17)
      v19 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingFormat:", CFSTR("\n\n%@"), v9));
    else
      v19 = v9;
    v20 = v19;
    objc_msgSend(v13, "setObject:forKey:", v19, NSLocalizedFailureReasonErrorKey);

  }
LABEL_24:
  if (!v11)
    v11 = CFSTR("To enable capturing, disable calls to unsupported APIs and relaunch your application.");
  objc_msgSend(v13, "setObject:forKey:", v11, NSLocalizedRecoverySuggestionErrorKey);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.capture"), 1000, v13));

  return v21;
}

- (NSString)fenum
{
  return self->_fenum;
}

- (NSString)category
{
  return self->_category;
}

- (NSString)customMessage
{
  return self->_customMessage;
}

- (NSString)customRecoverySuggestion
{
  return self->_customRecoverySuggestion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customRecoverySuggestion, 0);
  objc_storeStrong((id *)&self->_customMessage, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_fenum, 0);
}

@end
