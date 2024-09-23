@implementation PKMediaSourceProperties

- (id)userCodableDictionary
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[PKMediaSourceProperties feedDirection](self, "feedDirection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("media-source-feed-direction"));

  -[PKMediaSourceProperties feedOrientation](self, "feedOrientation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("media-source-feed-orientation"));

  return v3;
}

- (NSString)feedDirection
{
  return (NSString *)Printd_Parameters::_get_FeedDirection((void **)-[PKCollectionSpecialization params](self, "params"));
}

- (NSNumber)feedOrientation
{
  return (NSNumber *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", Printd_Parameters::_get_FeedOrientation((void **)-[PKCollectionSpecialization params](self, "params")));
}

@end
