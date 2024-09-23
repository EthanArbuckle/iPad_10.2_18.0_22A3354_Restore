@implementation IDSProtobuf(PBProtoAdditions)

- (id)pbDescription
{
  void *v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = objc_opt_class();
  v4 = objc_msgSend(a1, "type");
  v5 = objc_msgSend(a1, "isResponse");
  objc_msgSend(a1, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pbDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@, <%p> type %d isResponse %d context %@ length %lu"), v3, a1, v4, v5, v7, objc_msgSend(v8, "length"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
