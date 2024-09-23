@implementation _PSRecipient

- (id)_gkPrefixedURIHandle
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_PSRecipient handle](self, "handle"));
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_PSRecipient handle](self, "handle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithUnprefixedURI:](IDSURI, "URIWithUnprefixedURI:", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "prefixedURI"));

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end
