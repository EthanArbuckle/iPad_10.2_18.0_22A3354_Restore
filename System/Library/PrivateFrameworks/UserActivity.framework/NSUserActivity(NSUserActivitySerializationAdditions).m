@implementation NSUserActivity(NSUserActivitySerializationAdditions)

- (id)_createUserActivityStringsWithSaving:()NSUserActivitySerializationAdditions options:string:optionalString:data:error:
{
  id v13;
  void *v14;
  void *v15;

  v13 = a4;
  objc_msgSend(a1, "_internalUserActivity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "createUserActivityStringsWithSaving:options:optionalString:data:error:", a3, v13, a6, a7, a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_createUserActivityDataWithSaving:()NSUserActivitySerializationAdditions options:error:
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  objc_msgSend(a1, "_internalUserActivity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "createUserActivityDataWithSaving:options:error:", a3, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
