@implementation IDSProtobuf(PKProtoAdditions)

- (id)pkDescription
{
  void *v2;
  uint64_t v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  PKIDSGeneralMessageIDToString(objc_msgSend(a1, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "isResponse");
  objc_msgSend(a1, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pkDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@, <%p> type %@ isResponse %d context %@ length %lu"), v3, a1, v4, v5, v7, objc_msgSend(v8, "length"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
