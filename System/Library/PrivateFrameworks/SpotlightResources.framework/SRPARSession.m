@implementation SRPARSession

+ (id)spotlightResourcesPARSessionSpotlight
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v2 = (void *)sSpotlightPARSession;
  if (!sSpotlightPARSession)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/Search.framework"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "infoDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CFBundleVersion"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Spotlight/%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1FA78]), "initWithId:userAgent:factory:", CFSTR("com.apple.spotlight"), v6, 0);
    objc_msgSend(MEMORY[0x24BE1FA70], "sessionWithConfiguration:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)sSpotlightPARSession;
    sSpotlightPARSession = v8;

    v2 = (void *)sSpotlightPARSession;
  }
  return v2;
}

+ (id)spotlightResourcesPARSessionMail
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)sMailPARSession;
  if (!sMailPARSession)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1FA78]), "initWithId:userAgent:factory:", CFSTR("com.apple.mail"), CFSTR("mail/1.0"), 0);
    objc_msgSend(MEMORY[0x24BE1FA70], "sessionWithConfiguration:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)sMailPARSession;
    sMailPARSession = v4;

    v2 = (void *)sMailPARSession;
  }
  return v2;
}

+ (id)spotlightResourcesPARSessionForClient:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Spotlight")))
  {
    +[SRPARSession spotlightResourcesPARSessionSpotlight](SRPARSession, "spotlightResourcesPARSessionSpotlight");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("Mail")))
    {
      v5 = 0;
      goto LABEL_7;
    }
    +[SRPARSession spotlightResourcesPARSessionMail](SRPARSession, "spotlightResourcesPARSessionMail");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_7:

  return v5;
}

@end
