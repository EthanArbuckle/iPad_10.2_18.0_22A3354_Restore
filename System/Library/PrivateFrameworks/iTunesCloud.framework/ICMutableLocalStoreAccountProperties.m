@implementation ICMutableLocalStoreAccountProperties

- (void)setStorefrontIdentifier:(id)a3
{
  NSString *v4;
  NSString *storefrontIdentifier;
  NSString *v6;
  char v7;
  NSString *v8;
  NSString *v9;

  v9 = (NSString *)a3;
  v4 = self->super._storefrontIdentifier;
  storefrontIdentifier = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = v4;
  v7 = -[NSString isEqual:](v4, "isEqual:", v9);

  if ((v7 & 1) == 0)
  {
    v8 = (NSString *)-[NSString copy](v9, "copy");
    storefrontIdentifier = self->super._storefrontIdentifier;
    self->super._storefrontIdentifier = v8;
LABEL_4:

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICLocalStoreAccountProperties *v5;

  v5 = -[ICLocalStoreAccountProperties init](+[ICLocalStoreAccountProperties allocWithZone:](ICLocalStoreAccountProperties, "allocWithZone:"), "init");
  if (v5)
    -[ICLocalStoreAccountProperties _copyLocalStoreAccountPropertiesToOtherInstance:withZone:](self, "_copyLocalStoreAccountPropertiesToOtherInstance:withZone:", v5, a3);
  return v5;
}

@end
