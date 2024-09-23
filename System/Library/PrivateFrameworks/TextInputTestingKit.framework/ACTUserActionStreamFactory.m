@implementation ACTUserActionStreamFactory

+ (id)userActionStreamWithParameters:(id)a3 delegate:(id)a4
{
  id v5;
  id v6;
  NSString *v7;
  NSString *v8;
  Class v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKey:", CFSTR("UserActionStream"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = NSClassFromString(v7);
  else
    v9 = (Class)_ACTUserActionStream;
  -[objc_class userActionStreamWithParameters:delegate:](v9, "userActionStreamWithParameters:delegate:", v5, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
