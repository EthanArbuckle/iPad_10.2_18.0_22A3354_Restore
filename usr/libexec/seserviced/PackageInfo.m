@implementation PackageInfo

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray ses_map:](self->_moduleAIDs, "ses_map:", &stru_1003034F8));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSData asHexString](self->_packageAID, "asHexString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Package: %@ (modules %@)"), v4, v3));

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleAIDs, 0);
  objc_storeStrong((id *)&self->_packageAID, 0);
}

@end
