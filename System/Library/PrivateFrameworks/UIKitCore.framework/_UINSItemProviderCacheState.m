@implementation _UINSItemProviderCacheState

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (void)setTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_typeIdentifier, a3);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
