@implementation GKAbortChallengeNetworkRequest

+ (id)bagKey
{
  return CFSTR("gk-abort-challenges");
}

- (BOOL)isDuplicateRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeNetworkRequest challenges](self, "challenges"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "challenges"));

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToSet:", v6);
  return (char)v4;
}

- (void)mergeRequestData:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[GKChallengeNetworkRequest challenges](self, "challenges"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "challenges"));

  objc_msgSend(v6, "unionSet:", v5);
}

- (id)postBody
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeNetworkRequest challenges](self, "challenges"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("challenge-ids"));

  return v3;
}

@end
