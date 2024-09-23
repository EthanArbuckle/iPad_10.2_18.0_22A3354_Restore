@implementation MFMessage

- (id)mf_externalReference
{
  return -[MFMessage externalReference](self, "externalReference");
}

- (id)mf_conversationReference
{
  return sub_1001CBDEC((uint64_t)-[MFMessage conversationID](self, "conversationID"));
}

- (id)mf_documentReference
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessage documentID](self, "documentID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUIDString"));

  if (v3)
  {
    v4 = sub_1001CBE78(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
