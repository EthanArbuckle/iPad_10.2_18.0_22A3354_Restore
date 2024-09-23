@implementation FMDIdentityInfo

- (FMDIdentityInfo)initWithVersion:(int64_t)a3
{
  return -[FMDIdentityInfo initWithVersion:timeoutIntervalInSec:](self, "initWithVersion:timeoutIntervalInSec:", a3, 60);
}

- (FMDIdentityInfo)initWithVersion:(int64_t)a3 timeoutIntervalInSec:(int64_t)a4
{
  return -[FMDIdentityInfo initWithVersion:timeoutIntervalInSec:commandID:](self, "initWithVersion:timeoutIntervalInSec:commandID:", a3, a4, 0);
}

- (FMDIdentityInfo)initWithVersion:(int64_t)a3 timeoutIntervalInSec:(int64_t)a4 commandID:(id)a5
{
  return -[FMDIdentityInfo initWithVersion:timeoutIntervalInSec:commandID:identityURL:](self, "initWithVersion:timeoutIntervalInSec:commandID:identityURL:", a3, a4, a5, 0);
}

- (FMDIdentityInfo)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  FMDIdentityInfo *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version")));
  v6 = objc_msgSend(v5, "integerValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeout")));
  v8 = objc_msgSend(v7, "integerValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandID")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identityURL")));

  v11 = -[FMDIdentityInfo initWithVersion:timeoutIntervalInSec:commandID:identityURL:](self, "initWithVersion:timeoutIntervalInSec:commandID:identityURL:", v6, v8, v9, v10);
  return v11;
}

- (FMDIdentityInfo)initWithVersion:(int64_t)a3 timeoutIntervalInSec:(int64_t)a4 commandID:(id)a5 identityURL:(id)a6
{
  id v11;
  id v12;
  FMDIdentityInfo *v13;
  FMDIdentityInfo *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)FMDIdentityInfo;
  v13 = -[FMDIdentityInfo init](&v16, "init");
  v14 = v13;
  if (v13)
  {
    v13->_version = a3;
    v13->_timeoutIntervalInSec = a4;
    objc_storeStrong((id *)&v13->_commandID, a5);
    objc_storeStrong((id *)&v14->_identityURL, a6);
  }

  return v14;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[FMDIdentityInfo version](self, "version")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("version"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[FMDIdentityInfo timeoutIntervalInSec](self, "timeoutIntervalInSec")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("timeout"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDIdentityInfo commandID](self, "commandID"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDIdentityInfo commandID](self, "commandID"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("commandID"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDIdentityInfo identityURL](self, "identityURL"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDIdentityInfo identityURL](self, "identityURL"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("identityURL"));

  }
  v10 = objc_msgSend(v3, "copy");

  return (NSDictionary *)v10;
}

- (int64_t)version
{
  return self->_version;
}

- (int64_t)timeoutIntervalInSec
{
  return self->_timeoutIntervalInSec;
}

- (NSString)commandID
{
  return self->_commandID;
}

- (NSString)identityURL
{
  return self->_identityURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityURL, 0);
  objc_storeStrong((id *)&self->_commandID, 0);
}

@end
