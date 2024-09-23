@implementation BLBookletMigrationInfo

- (NSString)storeIDString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[BLBookletMigrationInfo storeID](self, "storeID")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringValue"));

  return (NSString *)v3;
}

@end
