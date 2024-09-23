@implementation _SFPBURL(SearchFoundationTypeNaming)

- (id)_siriui_protobufTypeName
{
  void *v0;
  objc_class *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = (void *)MEMORY[0x24BDD17C8];
  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "substringFromIndex:", objc_msgSend(CFSTR("_SFPB"), "length"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("searchfoundation.%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
