@implementation AddressBookAddressItemKey

- (AddressBookAddressItemKey)init
{

  return 0;
}

- (AddressBookAddressItemKey)initWithAddressBookAddress:(id)a3
{
  id v4;
  AddressBookAddressItemKey *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *keyString;
  void *v12;
  void *v13;
  uint64_t v14;
  GEOMapItem *geoMapItem;
  void *v16;
  uint64_t v17;
  NSString *v18;
  void *v19;
  CNContact *v20;
  CNContact *contact;
  id v22;
  uint64_t v23;
  NSString *shortAddress;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AddressBookAddressItemKey;
  v5 = -[AddressBookAddressItemKey init](&v26, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addressValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "label"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addressValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    v10 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - %@"), v7, v9));
    keyString = v5->_keyString;
    v5->_keyString = (NSString *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geocodedMapItem"));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geocodedMapItem"));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_geoMapItem"));
      geoMapItem = v5->_geoMapItem;
      v5->_geoMapItem = (GEOMapItem *)v14;

      v5->_geoMapItemHash = GEOMapItemHashForPurpose(v5->_geoMapItem, 5);
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddressItemKey contact](v5, "contact"));
      v17 = objc_claimAutoreleasedReturnValue(+[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", v16, 0));
      v18 = v5->_keyString;
      v5->_keyString = (NSString *)v17;

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contact"));
      v20 = (CNContact *)objc_msgSend(v19, "copy");
      contact = v5->_contact;
      v5->_contact = v20;

      v22 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithContact:", v5->_contact);
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "_addressFormattedAsShortenedAddress"));
      shortAddress = v5->_shortAddress;
      v5->_shortAddress = (NSString *)v23;

    }
  }

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  id v4;

  if (self->_geoMapItemHash)
    return self->_geoMapItemHash;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddressItemKey keyString](self, "keyString"));
  v4 = objc_msgSend(v3, "hash");

  return (unint64_t)v4;
}

- (BOOL)isEqual:(id)a3
{
  AddressBookAddressItemKey *v4;
  uint64_t v5;
  AddressBookAddressItemKey *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  char IsEqualToMapItemForPurposeWithinDistance;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  unsigned __int8 v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  unsigned __int8 v26;

  v4 = (AddressBookAddressItemKey *)a3;
  if (self == v4)
  {
    v9 = 1;
    goto LABEL_12;
  }
  v5 = objc_opt_class(AddressBookAddressItemKey);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    if (!-[AddressBookAddressItemKey conformsToProtocol:](v4, "conformsToProtocol:", &OBJC_PROTOCOL___PersonalizedItemKeyWithGEOMapItem))
    {
      v9 = 0;
      goto LABEL_12;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddressItemKey geoMapItem](v4, "geoMapItem"));
    if (v7)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddressItemKey geoMapItem](self, "geoMapItem"));

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddressItemKey geoMapItem](self, "geoMapItem"));
        IsEqualToMapItemForPurposeWithinDistance = GEOMapItemIsEqualToMapItemForPurposeWithinDistance(v11, v7, 5, GEOMapItemEquivalenceDistanceThresholdForPOIDeduplication);

        if ((IsEqualToMapItemForPurposeWithinDistance & 1) == 0)
          goto LABEL_22;
LABEL_20:
        v9 = 1;
        goto LABEL_4;
      }
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddressItemKey contact](self, "contact"));

    v9 = 0;
    if (!v7 || !v14)
      goto LABEL_4;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddressItemKey contact](self, "contact"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", v15, 0));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addressObject"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "shortAddress"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    v20 = v16;
    v21 = v19;
    if (v20 | v21
      && (v22 = objc_msgSend((id)v20, "isEqual:", v21),
          (id)v21,
          (id)v20,
          (v22 & 1) == 0))
    {

    }
    else
    {
      v23 = (unint64_t)(id)objc_claimAutoreleasedReturnValue(-[AddressBookAddressItemKey shortAddress](self, "shortAddress"));
      v24 = v18;
      if (!(v24 | v23))
      {

        goto LABEL_20;
      }
      v25 = (void *)v24;
      v26 = objc_msgSend((id)v23, "isEqual:", v24);

      if ((v26 & 1) != 0)
        goto LABEL_20;
    }
LABEL_22:
    v9 = 0;
    goto LABEL_4;
  }
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddressItemKey keyString](self, "keyString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddressItemKey keyString](v6, "keyString"));

  v9 = objc_msgSend(v7, "isEqualToString:", v8);
LABEL_4:

LABEL_12:
  return v9;
}

- (NSString)keyString
{
  return self->_keyString;
}

- (void)setKeyString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)shortAddress
{
  return self->_shortAddress;
}

- (void)setShortAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (GEOMapItem)geoMapItem
{
  return self->_geoMapItem;
}

- (void)setGeoMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_geoMapItem, a3);
}

- (unint64_t)geoMapItemHash
{
  return self->_geoMapItemHash;
}

- (void)setGeoMapItemHash:(unint64_t)a3
{
  self->_geoMapItemHash = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoMapItem, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_shortAddress, 0);
  objc_storeStrong((id *)&self->_keyString, 0);
}

@end
