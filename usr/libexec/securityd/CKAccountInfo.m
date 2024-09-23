@implementation CKAccountInfo

- (id)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKAccountInfo CKPropertiesDescription](self, "CKPropertiesDescription"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CKAccountInfo: %@>"), v2));

  return v3;
}

@end
