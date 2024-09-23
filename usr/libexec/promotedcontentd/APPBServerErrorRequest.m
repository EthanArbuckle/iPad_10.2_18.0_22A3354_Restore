@implementation APPBServerErrorRequest

+ (id)options
{
  if (qword_100269930 != -1)
    dispatch_once(&qword_100269930, &stru_100215220);
  return (id)qword_100269928;
}

- (BOOL)hasMetaData
{
  return self->_metaData != 0;
}

- (int)errorCode
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_errorCode;
  else
    return 1;
}

- (void)setErrorCode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)errorCodeAsString:(int)a3
{
  if ((a3 - 1) >= 0xD)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_100215240 + a3 - 1);
}

- (int)StringAsErrorCode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NoBannerContent")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BannerURLSchemeInvalid")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ActionURLSchemeInvalid")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WebArchiveURLSchemeInvalid")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AssetRetrieveFailure")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdSheetCrashDuringEngagement")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MediaPlaybackFailure")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RequiredFallbackURLNotProvided")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RequiredWebArchiveNotProvided")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ConfigurationInvalid")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MatchTagsInvalid")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("InvalidActionIdentifiers")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ProxyAuthHeaderExceedsMaxLength")))
  {
    v4 = 13;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasErrorDetails
{
  return self->_errorDetails != 0;
}

- (BOOL)hasBadResponse
{
  return self->_badResponse != 0;
}

- (void)clearFailingURLs
{
  -[NSMutableArray removeAllObjects](self->_failingURLs, "removeAllObjects");
}

- (void)addFailingURLs:(id)a3
{
  id v4;
  NSMutableArray *failingURLs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  failingURLs = self->_failingURLs;
  v8 = v4;
  if (!failingURLs)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_failingURLs;
    self->_failingURLs = v6;

    v4 = v8;
    failingURLs = self->_failingURLs;
  }
  -[NSMutableArray addObject:](failingURLs, "addObject:", v4);

}

- (unint64_t)failingURLsCount
{
  return (unint64_t)-[NSMutableArray count](self->_failingURLs, "count");
}

- (id)failingURLsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_failingURLs, "objectAtIndex:", a3);
}

+ (Class)failingURLsType
{
  return (Class)objc_opt_class(NSString, a2);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBServerErrorRequest;
  v3 = -[APPBServerErrorRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBServerErrorRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  APPBLogMetaData *metaData;
  void *v5;
  int v6;
  void *v7;
  NSString *errorDetails;
  APPBAdData *badResponse;
  void *v10;
  NSMutableArray *failingURLs;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  metaData = self->_metaData;
  if (metaData)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBLogMetaData dictionaryRepresentation](metaData, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("metaData"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = self->_errorCode - 1;
    if (v6 >= 0xD)
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_errorCode));
    else
      v7 = *(&off_100215240 + v6);
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("errorCode"));

  }
  errorDetails = self->_errorDetails;
  if (errorDetails)
    objc_msgSend(v3, "setObject:forKey:", errorDetails, CFSTR("errorDetails"));
  badResponse = self->_badResponse;
  if (badResponse)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdData dictionaryRepresentation](badResponse, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("badResponse"));

  }
  failingURLs = self->_failingURLs;
  if (failingURLs)
    objc_msgSend(v3, "setObject:forKey:", failingURLs, CFSTR("failingURLs"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBServerErrorRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  APPBLogMetaData *metaData;
  APPBAdData *badResponse;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSString *errorDetails;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = v4;
  metaData = self->_metaData;
  if (metaData)
    PBDataWriterWriteSubmessage(v4, metaData, 1);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field(v5, self->_errorCode, 2);
  badResponse = self->_badResponse;
  if (badResponse)
    PBDataWriterWriteSubmessage(v5, badResponse, 3);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = self->_failingURLs;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteStringField(v5, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12), 4);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  errorDetails = self->_errorDetails;
  if (errorDetails)
    PBDataWriterWriteStringField(v5, errorDetails, 5);

}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (self->_metaData)
  {
    objc_msgSend(v4, "setMetaData:");
    v4 = v9;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_errorCode;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  if (self->_badResponse)
    objc_msgSend(v9, "setBadResponse:");
  if (-[APPBServerErrorRequest failingURLsCount](self, "failingURLsCount"))
  {
    objc_msgSend(v9, "clearFailingURLs");
    v5 = -[APPBServerErrorRequest failingURLsCount](self, "failingURLsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[APPBServerErrorRequest failingURLsAtIndex:](self, "failingURLsAtIndex:", i));
        objc_msgSend(v9, "addFailingURLs:", v8);

      }
    }
  }
  if (self->_errorDetails)
    objc_msgSend(v9, "setErrorDetails:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[APPBLogMetaData copyWithZone:](self->_metaData, "copyWithZone:", a3);
  v7 = (void *)v5[5];
  v5[5] = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_errorCode;
    *((_BYTE *)v5 + 48) |= 1u;
  }
  v8 = -[APPBAdData copyWithZone:](self->_badResponse, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = self->_failingURLs;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v14), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend(v5, "addFailingURLs:", v15);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  v16 = -[NSString copyWithZone:](self->_errorDetails, "copyWithZone:", a3);
  v17 = (void *)v5[3];
  v5[3] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  APPBLogMetaData *metaData;
  APPBAdData *badResponse;
  NSMutableArray *failingURLs;
  NSString *errorDetails;
  unsigned __int8 v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_15;
  metaData = self->_metaData;
  if ((unint64_t)metaData | *((_QWORD *)v4 + 5))
  {
    if (!-[APPBLogMetaData isEqual:](metaData, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 4))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  badResponse = self->_badResponse;
  if ((unint64_t)badResponse | *((_QWORD *)v4 + 1) && !-[APPBAdData isEqual:](badResponse, "isEqual:"))
    goto LABEL_15;
  failingURLs = self->_failingURLs;
  if ((unint64_t)failingURLs | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](failingURLs, "isEqual:"))
      goto LABEL_15;
  }
  errorDetails = self->_errorDetails;
  if ((unint64_t)errorDetails | *((_QWORD *)v4 + 3))
    v9 = -[NSString isEqual:](errorDetails, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[APPBLogMetaData hash](self->_metaData, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_errorCode;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[APPBAdData hash](self->_badResponse, "hash");
  v7 = v5 ^ v6 ^ (unint64_t)-[NSMutableArray hash](self->_failingURLs, "hash");
  return v7 ^ -[NSString hash](self->_errorDetails, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  APPBLogMetaData *metaData;
  uint64_t v6;
  APPBAdData *badResponse;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  metaData = self->_metaData;
  v6 = *((_QWORD *)v4 + 5);
  if (metaData)
  {
    if (v6)
      -[APPBLogMetaData mergeFrom:](metaData, "mergeFrom:");
  }
  else if (v6)
  {
    -[APPBServerErrorRequest setMetaData:](self, "setMetaData:");
  }
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_errorCode = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  badResponse = self->_badResponse;
  v8 = *((_QWORD *)v4 + 1);
  if (badResponse)
  {
    if (v8)
      -[APPBAdData mergeFrom:](badResponse, "mergeFrom:");
  }
  else if (v8)
  {
    -[APPBServerErrorRequest setBadResponse:](self, "setBadResponse:");
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = *((id *)v4 + 4);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[APPBServerErrorRequest addFailingURLs:](self, "addFailingURLs:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), (_QWORD)v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  if (*((_QWORD *)v4 + 3))
    -[APPBServerErrorRequest setErrorDetails:](self, "setErrorDetails:");

}

- (APPBLogMetaData)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_metaData, a3);
}

- (NSString)errorDetails
{
  return self->_errorDetails;
}

- (void)setErrorDetails:(id)a3
{
  objc_storeStrong((id *)&self->_errorDetails, a3);
}

- (APPBAdData)badResponse
{
  return self->_badResponse;
}

- (void)setBadResponse:(id)a3
{
  objc_storeStrong((id *)&self->_badResponse, a3);
}

- (NSMutableArray)failingURLs
{
  return self->_failingURLs;
}

- (void)setFailingURLs:(id)a3
{
  objc_storeStrong((id *)&self->_failingURLs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_failingURLs, 0);
  objc_storeStrong((id *)&self->_errorDetails, 0);
  objc_storeStrong((id *)&self->_badResponse, 0);
}

@end
