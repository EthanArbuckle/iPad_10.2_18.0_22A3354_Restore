@implementation MapsDropVCardReader

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeVCard, "identifier"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return (NSArray *)v3;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  id v13;
  void *v14;
  id *v15;
  id *v16;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeVCard, "identifier"));
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if (v11)
  {
    v18 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactVCardSerialization contactsWithData:error:](CNContactVCardSerialization, "contactsWithData:error:", v8, &v18));
    v13 = v18;
    v14 = v13;
    if (v13)
    {
      v15 = 0;
      if (a5)
        *a5 = objc_retainAutorelease(v13);
    }
    else
    {
      v16 = (id *)objc_alloc_init((Class)objc_opt_class(a1));
      v15 = v16;
      if (a1)
        objc_storeStrong(v16 + 1, v12);
    }

  }
  else
  {
    v15 = 0;
    if (a5)
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 3328, 0));
  }

  return v15;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contacts, 0);
}

@end
