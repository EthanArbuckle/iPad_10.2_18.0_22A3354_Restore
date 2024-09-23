@implementation PersistentHistoryItem

- (BOOL)hasAddressBookItem
{
  return self->_addressBookItem != 0;
}

- (BOOL)hasSearchRequestHistoryItem
{
  return self->_searchRequestHistoryItem != 0;
}

- (BOOL)hasSearchResultHistoryItem
{
  return self->_searchResultHistoryItem != 0;
}

- (BOOL)hasDirectionsHistoryItem
{
  return self->_directionsHistoryItem != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PersistentHistoryItem;
  v3 = -[PersistentHistoryItem description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PersistentHistoryItem dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  PersistentAddressBookAddress *addressBookItem;
  void *v5;
  PersistentSearchRequestHistoryItem *searchRequestHistoryItem;
  void *v7;
  PersistentSearchResultHistoryItem *searchResultHistoryItem;
  void *v9;
  PersistentDirectionsHistoryItem *directionsHistoryItem;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  addressBookItem = self->_addressBookItem;
  if (addressBookItem)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PersistentAddressBookAddress dictionaryRepresentation](addressBookItem, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("addressBookItem"));

  }
  searchRequestHistoryItem = self->_searchRequestHistoryItem;
  if (searchRequestHistoryItem)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PersistentSearchRequestHistoryItem dictionaryRepresentation](searchRequestHistoryItem, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("searchRequestHistoryItem"));

  }
  searchResultHistoryItem = self->_searchResultHistoryItem;
  if (searchResultHistoryItem)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PersistentSearchResultHistoryItem dictionaryRepresentation](searchResultHistoryItem, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("searchResultHistoryItem"));

  }
  directionsHistoryItem = self->_directionsHistoryItem;
  if (directionsHistoryItem)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PersistentDirectionsHistoryItem dictionaryRepresentation](directionsHistoryItem, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("directionsHistoryItem"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100A64ACC((id *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  PersistentSearchRequestHistoryItem *searchRequestHistoryItem;
  PersistentSearchResultHistoryItem *searchResultHistoryItem;
  PersistentDirectionsHistoryItem *directionsHistoryItem;
  PersistentAddressBookAddress *addressBookItem;
  id v9;

  v4 = a3;
  searchRequestHistoryItem = self->_searchRequestHistoryItem;
  v9 = v4;
  if (searchRequestHistoryItem)
  {
    PBDataWriterWriteSubmessage(v4, searchRequestHistoryItem, 10);
    v4 = v9;
  }
  searchResultHistoryItem = self->_searchResultHistoryItem;
  if (searchResultHistoryItem)
  {
    PBDataWriterWriteSubmessage(v9, searchResultHistoryItem, 11);
    v4 = v9;
  }
  directionsHistoryItem = self->_directionsHistoryItem;
  if (directionsHistoryItem)
  {
    PBDataWriterWriteSubmessage(v9, directionsHistoryItem, 12);
    v4 = v9;
  }
  addressBookItem = self->_addressBookItem;
  if (addressBookItem)
  {
    PBDataWriterWriteSubmessage(v9, addressBookItem, 15);
    v4 = v9;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_searchRequestHistoryItem)
  {
    objc_msgSend(v4, "setSearchRequestHistoryItem:");
    v4 = v5;
  }
  if (self->_searchResultHistoryItem)
  {
    objc_msgSend(v5, "setSearchResultHistoryItem:");
    v4 = v5;
  }
  if (self->_directionsHistoryItem)
  {
    objc_msgSend(v5, "setDirectionsHistoryItem:");
    v4 = v5;
  }
  if (self->_addressBookItem)
  {
    objc_msgSend(v5, "setAddressBookItem:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[PersistentSearchRequestHistoryItem copyWithZone:](self->_searchRequestHistoryItem, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[PersistentSearchResultHistoryItem copyWithZone:](self->_searchResultHistoryItem, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[PersistentDirectionsHistoryItem copyWithZone:](self->_directionsHistoryItem, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v12 = -[PersistentAddressBookAddress copyWithZone:](self->_addressBookItem, "copyWithZone:", a3);
  v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  PersistentSearchRequestHistoryItem *searchRequestHistoryItem;
  PersistentSearchResultHistoryItem *searchResultHistoryItem;
  PersistentDirectionsHistoryItem *directionsHistoryItem;
  PersistentAddressBookAddress *addressBookItem;
  unsigned __int8 v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((searchRequestHistoryItem = self->_searchRequestHistoryItem,
         !((unint64_t)searchRequestHistoryItem | v4[3]))
     || -[PersistentSearchRequestHistoryItem isEqual:](searchRequestHistoryItem, "isEqual:"))
    && ((searchResultHistoryItem = self->_searchResultHistoryItem, !((unint64_t)searchResultHistoryItem | v4[4]))
     || -[PersistentSearchResultHistoryItem isEqual:](searchResultHistoryItem, "isEqual:"))
    && ((directionsHistoryItem = self->_directionsHistoryItem, !((unint64_t)directionsHistoryItem | v4[2]))
     || -[PersistentDirectionsHistoryItem isEqual:](directionsHistoryItem, "isEqual:")))
  {
    addressBookItem = self->_addressBookItem;
    if ((unint64_t)addressBookItem | v4[1])
      v9 = -[PersistentAddressBookAddress isEqual:](addressBookItem, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[PersistentSearchRequestHistoryItem hash](self->_searchRequestHistoryItem, "hash");
  v4 = -[PersistentSearchResultHistoryItem hash](self->_searchResultHistoryItem, "hash") ^ v3;
  v5 = -[PersistentDirectionsHistoryItem hash](self->_directionsHistoryItem, "hash");
  return v4 ^ v5 ^ -[PersistentAddressBookAddress hash](self->_addressBookItem, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  PersistentSearchRequestHistoryItem *searchRequestHistoryItem;
  uint64_t v6;
  PersistentSearchResultHistoryItem *searchResultHistoryItem;
  uint64_t v8;
  PersistentDirectionsHistoryItem *directionsHistoryItem;
  uint64_t v10;
  PersistentAddressBookAddress *addressBookItem;
  uint64_t v12;
  _QWORD *v13;

  v4 = a3;
  searchRequestHistoryItem = self->_searchRequestHistoryItem;
  v6 = v4[3];
  v13 = v4;
  if (searchRequestHistoryItem)
  {
    if (!v6)
      goto LABEL_7;
    -[PersistentSearchRequestHistoryItem mergeFrom:](searchRequestHistoryItem, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[PersistentHistoryItem setSearchRequestHistoryItem:](self, "setSearchRequestHistoryItem:");
  }
  v4 = v13;
LABEL_7:
  searchResultHistoryItem = self->_searchResultHistoryItem;
  v8 = v4[4];
  if (searchResultHistoryItem)
  {
    if (!v8)
      goto LABEL_13;
    -[PersistentSearchResultHistoryItem mergeFrom:](searchResultHistoryItem, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[PersistentHistoryItem setSearchResultHistoryItem:](self, "setSearchResultHistoryItem:");
  }
  v4 = v13;
LABEL_13:
  directionsHistoryItem = self->_directionsHistoryItem;
  v10 = v4[2];
  if (directionsHistoryItem)
  {
    if (!v10)
      goto LABEL_19;
    -[PersistentDirectionsHistoryItem mergeFrom:](directionsHistoryItem, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_19;
    -[PersistentHistoryItem setDirectionsHistoryItem:](self, "setDirectionsHistoryItem:");
  }
  v4 = v13;
LABEL_19:
  addressBookItem = self->_addressBookItem;
  v12 = v4[1];
  if (addressBookItem)
  {
    if (v12)
    {
      -[PersistentAddressBookAddress mergeFrom:](addressBookItem, "mergeFrom:");
LABEL_24:
      v4 = v13;
    }
  }
  else if (v12)
  {
    -[PersistentHistoryItem setAddressBookItem:](self, "setAddressBookItem:");
    goto LABEL_24;
  }

}

- (PersistentAddressBookAddress)addressBookItem
{
  return self->_addressBookItem;
}

- (void)setAddressBookItem:(id)a3
{
  objc_storeStrong((id *)&self->_addressBookItem, a3);
}

- (PersistentSearchRequestHistoryItem)searchRequestHistoryItem
{
  return self->_searchRequestHistoryItem;
}

- (void)setSearchRequestHistoryItem:(id)a3
{
  objc_storeStrong((id *)&self->_searchRequestHistoryItem, a3);
}

- (PersistentSearchResultHistoryItem)searchResultHistoryItem
{
  return self->_searchResultHistoryItem;
}

- (void)setSearchResultHistoryItem:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultHistoryItem, a3);
}

- (PersistentDirectionsHistoryItem)directionsHistoryItem
{
  return self->_directionsHistoryItem;
}

- (void)setDirectionsHistoryItem:(id)a3
{
  objc_storeStrong((id *)&self->_directionsHistoryItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResultHistoryItem, 0);
  objc_storeStrong((id *)&self->_searchRequestHistoryItem, 0);
  objc_storeStrong((id *)&self->_directionsHistoryItem, 0);
  objc_storeStrong((id *)&self->_addressBookItem, 0);
}

@end
