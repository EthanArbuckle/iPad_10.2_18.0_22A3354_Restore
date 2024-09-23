@implementation GEOAddress

- (id)initWithAddressBookAddress:(id)a3
{
  id v4;
  void *v5;
  GEOAddress *v6;
  void *v7;
  GEOAddress *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addressDictionary"));
  v6 = -[GEOAddress initWithAddressDictionary:](self, "initWithAddressDictionary:", v5);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "singleLineAddress"));
    if (v7)
      -[GEOAddress addFormattedAddressLine:](v6, "addFormattedAddressLine:", v7);
    v8 = v6;

  }
  return v6;
}

@end
