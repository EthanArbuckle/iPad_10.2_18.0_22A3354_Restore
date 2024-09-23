@implementation DMFUser

- (id)initWithUser:(id)a3 isCurrentUser:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  DMFUser *v11;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "username"));
  v8 = objc_msgSend(v6, "dataQuota");
  v9 = objc_msgSend(v6, "dataUsed");
  v10 = objc_msgSend(v6, "hasDataToSync");

  v11 = -[DMFUser initWithUsername:dataQuota:dataUsed:hasDataToSync:isCurrentUser:](self, "initWithUsername:dataQuota:dataUsed:hasDataToSync:isCurrentUser:", v7, v8, v9, v10, v4);
  return v11;
}

@end
