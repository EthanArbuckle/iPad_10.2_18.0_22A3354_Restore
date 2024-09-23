@implementation GKCloudPlayer

+ (GKCloudPlayer)playerWithIdentity:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userRecordID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "playerWithRecordID:", v4));

  return (GKCloudPlayer *)v5;
}

+ (GKCloudPlayer)playerWithRecordID:(id)a3
{
  id v3;
  id v4;
  void *v5;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init((Class)GKCloudPlayer);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordName"));

    objc_msgSend(v4, "setIdentifier:", v5);
  }
  else
  {
    v4 = 0;
  }
  return (GKCloudPlayer *)v4;
}

@end
