@implementation IDSMessageContext(PKProtoAdditions)

- (id)pkDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "outgoingResponseIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "incomingResponseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("(%@ outgoingResponseIdentifier %@ incomingResponseIdentifier %@ expectsPeerResponse %d)"), v3, v4, v5, objc_msgSend(a1, "expectsPeerResponse"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
