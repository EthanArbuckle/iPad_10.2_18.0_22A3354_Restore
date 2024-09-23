@implementation PersistentDirections

- (BOOL)hasStartAddress
{
  return self->_startAddress != 0;
}

- (BOOL)hasEndAddress
{
  return self->_endAddress != 0;
}

- (BOOL)hasUserStartSearch
{
  return self->_userStartSearch != 0;
}

- (BOOL)hasUserEndSearch
{
  return self->_userEndSearch != 0;
}

- (BOOL)hasAddressStartSearch
{
  return self->_addressStartSearch != 0;
}

- (BOOL)hasAddressEndSearch
{
  return self->_addressEndSearch != 0;
}

- (BOOL)hasRouteStartSearch
{
  return self->_routeStartSearch != 0;
}

- (BOOL)hasRouteEndSearch
{
  return self->_routeEndSearch != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PersistentDirections;
  v3 = -[PersistentDirections description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PersistentDirections dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *startAddress;
  NSString *endAddress;
  SearchResult *userStartSearch;
  void *v8;
  SearchResult *userEndSearch;
  void *v10;
  SearchResult *addressStartSearch;
  void *v12;
  SearchResult *addressEndSearch;
  void *v14;
  SearchResult *routeStartSearch;
  void *v16;
  SearchResult *routeEndSearch;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  startAddress = self->_startAddress;
  if (startAddress)
    objc_msgSend(v3, "setObject:forKey:", startAddress, CFSTR("StartAddress"));
  endAddress = self->_endAddress;
  if (endAddress)
    objc_msgSend(v4, "setObject:forKey:", endAddress, CFSTR("EndAddress"));
  userStartSearch = self->_userStartSearch;
  if (userStartSearch)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr dictionaryRepresentation](userStartSearch, "dictionaryRepresentation"));
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("UserStartSearch"));

  }
  userEndSearch = self->_userEndSearch;
  if (userEndSearch)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr dictionaryRepresentation](userEndSearch, "dictionaryRepresentation"));
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("UserEndSearch"));

  }
  addressStartSearch = self->_addressStartSearch;
  if (addressStartSearch)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr dictionaryRepresentation](addressStartSearch, "dictionaryRepresentation"));
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("AddressStartSearch"));

  }
  addressEndSearch = self->_addressEndSearch;
  if (addressEndSearch)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr dictionaryRepresentation](addressEndSearch, "dictionaryRepresentation"));
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("AddressEndSearch"));

  }
  routeStartSearch = self->_routeStartSearch;
  if (routeStartSearch)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr dictionaryRepresentation](routeStartSearch, "dictionaryRepresentation"));
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("RouteStartSearch"));

  }
  routeEndSearch = self->_routeEndSearch;
  if (routeEndSearch)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr dictionaryRepresentation](routeEndSearch, "dictionaryRepresentation"));
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("RouteEndSearch"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  int v11;
  unint64_t v13;
  SearchResult *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t String;
  _QWORD v21[2];

  if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(_QWORD *)((char *)a3
                                                                            + OBJC_IVAR___PBDataReader__length))
    return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  while (1)
  {
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
      return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    while (1)
    {
      v8 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v8 == -1 || v8 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
        break;
      v9 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0)
        goto LABEL_11;
      v5 += 7;
      if (v6++ >= 9)
      {
        v7 = 0;
        v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
      v7 = 0;
LABEL_13:
    if (v11 || (v7 & 7) == 4)
      return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    v13 = v7 >> 3;
    switch((v7 >> 3))
    {
      case 0xAu:
        v14 = objc_alloc_init(SearchResult);
        v15 = 64;
        goto LABEL_29;
      case 0xBu:
        v14 = objc_alloc_init(SearchResult);
        v15 = 56;
        goto LABEL_29;
      case 0xCu:
      case 0xDu:
      case 0xEu:
      case 0xFu:
      case 0x10u:
      case 0x13u:
        goto LABEL_22;
      case 0x11u:
        v14 = objc_alloc_init(SearchResult);
        v15 = 16;
        goto LABEL_29;
      case 0x12u:
        v14 = objc_alloc_init(SearchResult);
        v15 = 8;
        goto LABEL_29;
      case 0x14u:
        v14 = objc_alloc_init(SearchResult);
        v15 = 40;
        goto LABEL_29;
      case 0x15u:
        v14 = objc_alloc_init(SearchResult);
        v15 = 32;
LABEL_29:
        objc_storeStrong((id *)&self->PBCodable_opaque[v15], v14);
        v21[0] = 0;
        v21[1] = 0;
        if (PBReaderPlaceMark(a3, v21) && -[SearchResult readFrom:](v14, "readFrom:", a3))
        {
          PBReaderRecallMark(a3, v21);
LABEL_34:

          goto LABEL_35;
        }

        return 0;
      default:
        if ((_DWORD)v13 == 2)
        {
          String = PBReaderReadString(a3);
          v17 = objc_claimAutoreleasedReturnValue(String);
          v18 = 24;
          goto LABEL_33;
        }
        if ((_DWORD)v13 == 1)
        {
          v16 = PBReaderReadString(a3);
          v17 = objc_claimAutoreleasedReturnValue(v16);
          v18 = 48;
LABEL_33:
          v14 = *(SearchResult **)&self->PBCodable_opaque[v18];
          *(_QWORD *)&self->PBCodable_opaque[v18] = v17;
          goto LABEL_34;
        }
LABEL_22:
        if ((PBReaderSkipValueWithTag(a3) & 1) == 0)
          return 0;
LABEL_35:
        if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(_QWORD *)((char *)a3
                                                                                  + OBJC_IVAR___PBDataReader__length))
          return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
        break;
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *startAddress;
  NSString *endAddress;
  SearchResult *userStartSearch;
  SearchResult *userEndSearch;
  SearchResult *addressStartSearch;
  SearchResult *addressEndSearch;
  SearchResult *routeStartSearch;
  SearchResult *routeEndSearch;
  id v13;

  v4 = a3;
  startAddress = self->_startAddress;
  v13 = v4;
  if (startAddress)
  {
    PBDataWriterWriteStringField(v4, startAddress, 1);
    v4 = v13;
  }
  endAddress = self->_endAddress;
  if (endAddress)
  {
    PBDataWriterWriteStringField(v13, endAddress, 2);
    v4 = v13;
  }
  userStartSearch = self->_userStartSearch;
  if (userStartSearch)
  {
    PBDataWriterWriteSubmessage(v13, userStartSearch, 10);
    v4 = v13;
  }
  userEndSearch = self->_userEndSearch;
  if (userEndSearch)
  {
    PBDataWriterWriteSubmessage(v13, userEndSearch, 11);
    v4 = v13;
  }
  addressStartSearch = self->_addressStartSearch;
  if (addressStartSearch)
  {
    PBDataWriterWriteSubmessage(v13, addressStartSearch, 17);
    v4 = v13;
  }
  addressEndSearch = self->_addressEndSearch;
  if (addressEndSearch)
  {
    PBDataWriterWriteSubmessage(v13, addressEndSearch, 18);
    v4 = v13;
  }
  routeStartSearch = self->_routeStartSearch;
  if (routeStartSearch)
  {
    PBDataWriterWriteSubmessage(v13, routeStartSearch, 20);
    v4 = v13;
  }
  routeEndSearch = self->_routeEndSearch;
  if (routeEndSearch)
  {
    PBDataWriterWriteSubmessage(v13, routeEndSearch, 21);
    v4 = v13;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_startAddress)
  {
    objc_msgSend(v4, "setStartAddress:");
    v4 = v5;
  }
  if (self->_endAddress)
  {
    objc_msgSend(v5, "setEndAddress:");
    v4 = v5;
  }
  if (self->_userStartSearch)
  {
    objc_msgSend(v5, "setUserStartSearch:");
    v4 = v5;
  }
  if (self->_userEndSearch)
  {
    objc_msgSend(v5, "setUserEndSearch:");
    v4 = v5;
  }
  if (self->_addressStartSearch)
  {
    objc_msgSend(v5, "setAddressStartSearch:");
    v4 = v5;
  }
  if (self->_addressEndSearch)
  {
    objc_msgSend(v5, "setAddressEndSearch:");
    v4 = v5;
  }
  if (self->_routeStartSearch)
  {
    objc_msgSend(v5, "setRouteStartSearch:");
    v4 = v5;
  }
  if (self->_routeEndSearch)
  {
    objc_msgSend(v5, "setRouteEndSearch:");
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
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_startAddress, "copyWithZone:", a3);
  v7 = (void *)v5[6];
  v5[6] = v6;

  v8 = -[NSString copyWithZone:](self->_endAddress, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[SearchResult copyWithZone:](self->_userStartSearch, "copyWithZone:", a3);
  v11 = (void *)v5[8];
  v5[8] = v10;

  v12 = -[SearchResult copyWithZone:](self->_userEndSearch, "copyWithZone:", a3);
  v13 = (void *)v5[7];
  v5[7] = v12;

  v14 = -[SearchResult copyWithZone:](self->_addressStartSearch, "copyWithZone:", a3);
  v15 = (void *)v5[2];
  v5[2] = v14;

  v16 = -[SearchResult copyWithZone:](self->_addressEndSearch, "copyWithZone:", a3);
  v17 = (void *)v5[1];
  v5[1] = v16;

  v18 = -[SearchResult copyWithZone:](self->_routeStartSearch, "copyWithZone:", a3);
  v19 = (void *)v5[5];
  v5[5] = v18;

  v20 = -[SearchResult copyWithZone:](self->_routeEndSearch, "copyWithZone:", a3);
  v21 = (void *)v5[4];
  v5[4] = v20;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *startAddress;
  NSString *endAddress;
  SearchResult *userStartSearch;
  SearchResult *userEndSearch;
  SearchResult *addressStartSearch;
  SearchResult *addressEndSearch;
  SearchResult *routeStartSearch;
  SearchResult *routeEndSearch;
  unsigned __int8 v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((startAddress = self->_startAddress, !((unint64_t)startAddress | v4[6]))
     || -[NSString isEqual:](startAddress, "isEqual:"))
    && ((endAddress = self->_endAddress, !((unint64_t)endAddress | v4[3]))
     || -[NSString isEqual:](endAddress, "isEqual:"))
    && ((userStartSearch = self->_userStartSearch, !((unint64_t)userStartSearch | v4[8]))
     || -[SearchResult isEqual:](userStartSearch, "isEqual:"))
    && ((userEndSearch = self->_userEndSearch, !((unint64_t)userEndSearch | v4[7]))
     || -[SearchResult isEqual:](userEndSearch, "isEqual:"))
    && ((addressStartSearch = self->_addressStartSearch, !((unint64_t)addressStartSearch | v4[2]))
     || -[SearchResult isEqual:](addressStartSearch, "isEqual:"))
    && ((addressEndSearch = self->_addressEndSearch, !((unint64_t)addressEndSearch | v4[1]))
     || -[SearchResult isEqual:](addressEndSearch, "isEqual:"))
    && ((routeStartSearch = self->_routeStartSearch, !((unint64_t)routeStartSearch | v4[5]))
     || -[SearchResult isEqual:](routeStartSearch, "isEqual:")))
  {
    routeEndSearch = self->_routeEndSearch;
    if ((unint64_t)routeEndSearch | v4[4])
      v13 = -[SearchResult isEqual:](routeEndSearch, "isEqual:");
    else
      v13 = 1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v3 = -[NSString hash](self->_startAddress, "hash");
  v4 = -[NSString hash](self->_endAddress, "hash") ^ v3;
  v5 = -[SearchResult hash](self->_userStartSearch, "hash");
  v6 = v4 ^ v5 ^ -[SearchResult hash](self->_userEndSearch, "hash");
  v7 = -[SearchResult hash](self->_addressStartSearch, "hash");
  v8 = v7 ^ -[SearchResult hash](self->_addressEndSearch, "hash");
  v9 = v6 ^ v8 ^ -[SearchResult hash](self->_routeStartSearch, "hash");
  return v9 ^ -[SearchResult hash](self->_routeEndSearch, "hash");
}

- (void)mergeFrom:(id)a3
{
  SearchResult *userStartSearch;
  uint64_t v5;
  SearchResult *userEndSearch;
  uint64_t v7;
  SearchResult *addressStartSearch;
  uint64_t v9;
  SearchResult *addressEndSearch;
  uint64_t v11;
  SearchResult *routeStartSearch;
  uint64_t v13;
  SearchResult *routeEndSearch;
  uint64_t v15;
  _QWORD *v16;

  v16 = a3;
  if (v16[6])
    -[PersistentDirections setStartAddress:](self, "setStartAddress:");
  if (v16[3])
    -[PersistentDirections setEndAddress:](self, "setEndAddress:");
  userStartSearch = self->_userStartSearch;
  v5 = v16[8];
  if (userStartSearch)
  {
    if (v5)
      -[SearchResultRepr mergeFrom:](userStartSearch, "mergeFrom:");
  }
  else if (v5)
  {
    -[PersistentDirections setUserStartSearch:](self, "setUserStartSearch:");
  }
  userEndSearch = self->_userEndSearch;
  v7 = v16[7];
  if (userEndSearch)
  {
    if (v7)
      -[SearchResultRepr mergeFrom:](userEndSearch, "mergeFrom:");
  }
  else if (v7)
  {
    -[PersistentDirections setUserEndSearch:](self, "setUserEndSearch:");
  }
  addressStartSearch = self->_addressStartSearch;
  v9 = v16[2];
  if (addressStartSearch)
  {
    if (v9)
      -[SearchResultRepr mergeFrom:](addressStartSearch, "mergeFrom:");
  }
  else if (v9)
  {
    -[PersistentDirections setAddressStartSearch:](self, "setAddressStartSearch:");
  }
  addressEndSearch = self->_addressEndSearch;
  v11 = v16[1];
  if (addressEndSearch)
  {
    if (v11)
      -[SearchResultRepr mergeFrom:](addressEndSearch, "mergeFrom:");
  }
  else if (v11)
  {
    -[PersistentDirections setAddressEndSearch:](self, "setAddressEndSearch:");
  }
  routeStartSearch = self->_routeStartSearch;
  v13 = v16[5];
  if (routeStartSearch)
  {
    if (v13)
      -[SearchResultRepr mergeFrom:](routeStartSearch, "mergeFrom:");
  }
  else if (v13)
  {
    -[PersistentDirections setRouteStartSearch:](self, "setRouteStartSearch:");
  }
  routeEndSearch = self->_routeEndSearch;
  v15 = v16[4];
  if (routeEndSearch)
  {
    if (v15)
      -[SearchResultRepr mergeFrom:](routeEndSearch, "mergeFrom:");
  }
  else if (v15)
  {
    -[PersistentDirections setRouteEndSearch:](self, "setRouteEndSearch:");
  }

}

- (NSString)startAddress
{
  return self->_startAddress;
}

- (void)setStartAddress:(id)a3
{
  objc_storeStrong((id *)&self->_startAddress, a3);
}

- (NSString)endAddress
{
  return self->_endAddress;
}

- (void)setEndAddress:(id)a3
{
  objc_storeStrong((id *)&self->_endAddress, a3);
}

- (SearchResult)userStartSearch
{
  return self->_userStartSearch;
}

- (void)setUserStartSearch:(id)a3
{
  objc_storeStrong((id *)&self->_userStartSearch, a3);
}

- (SearchResult)userEndSearch
{
  return self->_userEndSearch;
}

- (void)setUserEndSearch:(id)a3
{
  objc_storeStrong((id *)&self->_userEndSearch, a3);
}

- (SearchResult)addressStartSearch
{
  return self->_addressStartSearch;
}

- (void)setAddressStartSearch:(id)a3
{
  objc_storeStrong((id *)&self->_addressStartSearch, a3);
}

- (SearchResult)addressEndSearch
{
  return self->_addressEndSearch;
}

- (void)setAddressEndSearch:(id)a3
{
  objc_storeStrong((id *)&self->_addressEndSearch, a3);
}

- (SearchResult)routeStartSearch
{
  return self->_routeStartSearch;
}

- (void)setRouteStartSearch:(id)a3
{
  objc_storeStrong((id *)&self->_routeStartSearch, a3);
}

- (SearchResult)routeEndSearch
{
  return self->_routeEndSearch;
}

- (void)setRouteEndSearch:(id)a3
{
  objc_storeStrong((id *)&self->_routeEndSearch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userStartSearch, 0);
  objc_storeStrong((id *)&self->_userEndSearch, 0);
  objc_storeStrong((id *)&self->_startAddress, 0);
  objc_storeStrong((id *)&self->_routeStartSearch, 0);
  objc_storeStrong((id *)&self->_routeEndSearch, 0);
  objc_storeStrong((id *)&self->_endAddress, 0);
  objc_storeStrong((id *)&self->_addressStartSearch, 0);
  objc_storeStrong((id *)&self->_addressEndSearch, 0);
}

@end
