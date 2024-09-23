@implementation RBSProcessServiceNamePredicate

- (BOOL)matchesProcess:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;

  v4 = a3;
  -[RBSProcessStringPredicate identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hasConsistentLaunchdJob"))
  {
    objc_msgSend(v6, "consistentLaunchdJobLabel");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isXPCService"))
  {
    objc_msgSend(v6, "xpcServiceIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isEmbeddedApplication"))
  {
    objc_msgSend(v6, "embeddedApplicationIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v6, "isApplication"))
    {
      v9 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v6, "applicationJobLabel");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  v9 = objc_msgSend(v5, "isEqualToString:", v7);

LABEL_10:
  return v9;
}

@end
