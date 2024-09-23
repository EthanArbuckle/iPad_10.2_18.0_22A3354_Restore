@implementation SBKSyncResponse

+ (id)responseWithResponse:(id)a3 transaction:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "responseWithResponse:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deserializeResponseBodyWithTransaction:", v6);

  return v7;
}

- (void)deserializeResponseBodyWithTransaction:(id)a3
{
  id v4;
  SBKSyncResponseData *v5;
  SBKSyncResponseData *syncResponseData;
  id v7;

  v4 = a3;
  -[SBKResponse responseDictionary](self, "responseDictionary");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[SBKSyncResponseData deserializedResponseBodyWithTransaction:responseDictionary:response:](SBKSyncResponseData, "deserializedResponseBodyWithTransaction:responseDictionary:response:", v4, v7, self);
  v5 = (SBKSyncResponseData *)objc_claimAutoreleasedReturnValue();

  syncResponseData = self->_syncResponseData;
  self->_syncResponseData = v5;

}

- (SBKSyncResponseData)syncResponseData
{
  return self->_syncResponseData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncResponseData, 0);
}

@end
