@implementation RCEndpointConfig

- (RCEndpointConfig)initWithEnvironment:(unint64_t)a3 productionURL:(id)a4 stagingURL:(id)a5 qaURL:(id)a6 develURL:(id)a7 testURL:(id)a8
{
  id v15;
  id v16;
  id v17;
  RCEndpointConfig *v18;
  RCEndpointConfig *v19;
  id v21;
  id v22;
  objc_super v23;

  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)RCEndpointConfig;
  v18 = -[RCEndpointConfig init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_environment = a3;
    objc_storeStrong((id *)&v18->_productionURL, a4);
    objc_storeStrong((id *)&v19->_stagingURL, a5);
    objc_storeStrong((id *)&v19->_qaURL, a6);
    objc_storeStrong((id *)&v19->_develURL, a7);
    objc_storeStrong((id *)&v19->_testURL, a8);
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[RCEndpointConfig environment](self, "environment");
    if (v6 == objc_msgSend(v5, "environment"))
    {
      -[RCEndpointConfig productionURL](self, "productionURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "productionURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        -[RCEndpointConfig stagingURL](self, "stagingURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stagingURL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqual:", v10))
        {
          -[RCEndpointConfig qaURL](self, "qaURL");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "qaURL");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqual:", v12))
          {
            -[RCEndpointConfig develURL](self, "develURL");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "develURL");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v13, "isEqual:"))
            {
              -[RCEndpointConfig testURL](self, "testURL");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "testURL");
              v18 = v13;
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v17, "isEqual:", v14);

              v13 = v18;
            }
            else
            {
              v15 = 0;
            }

          }
          else
          {
            v15 = 0;
          }

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RCEndpointConfig environment](self, "environment"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RCEndpointConfig productionURL](self, "productionURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[RCEndpointConfig stagingURL](self, "stagingURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  -[RCEndpointConfig qaURL](self, "qaURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash");
  -[RCEndpointConfig develURL](self, "develURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");
  -[RCEndpointConfig testURL](self, "testURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash") ^ v4;

  return v14;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[RCEndpointConfig environmentDescription](self, "environmentDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCEndpointConfig productionURL](self, "productionURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCEndpointConfig stagingURL](self, "stagingURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCEndpointConfig qaURL](self, "qaURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCEndpointConfig develURL](self, "develURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCEndpointConfig testURL](self, "testURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; environment: %@\n productionURL: %@\n stagingURL: %@\n qaURL: %@\n develURL: %@\n testURL: %@\n>"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RCEndpointConfig environment](self, "environment"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v4, CFSTR("environment"));

  -[RCEndpointConfig productionURL](self, "productionURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v5, CFSTR("productionURL"));

  -[RCEndpointConfig stagingURL](self, "stagingURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v6, CFSTR("stagingURL"));

  -[RCEndpointConfig qaURL](self, "qaURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v7, CFSTR("qaURL"));

  -[RCEndpointConfig develURL](self, "develURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v8, CFSTR("develURL"));

  -[RCEndpointConfig testURL](self, "testURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v9, CFSTR("testURL"));

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (id)environmentDescription
{
  unint64_t v2;

  v2 = -[RCEndpointConfig environment](self, "environment");
  if (v2 > 4)
    return CFSTR("Unknown");
  else
    return off_1E470ED08[v2];
}

- (unint64_t)environment
{
  return self->_environment;
}

- (NSURL)productionURL
{
  return self->_productionURL;
}

- (NSURL)stagingURL
{
  return self->_stagingURL;
}

- (NSURL)qaURL
{
  return self->_qaURL;
}

- (NSURL)develURL
{
  return self->_develURL;
}

- (NSURL)testURL
{
  return self->_testURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testURL, 0);
  objc_storeStrong((id *)&self->_develURL, 0);
  objc_storeStrong((id *)&self->_qaURL, 0);
  objc_storeStrong((id *)&self->_stagingURL, 0);
  objc_storeStrong((id *)&self->_productionURL, 0);
}

@end
