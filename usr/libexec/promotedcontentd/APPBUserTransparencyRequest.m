@implementation APPBUserTransparencyRequest

+ (id)options
{
  if (qword_100269698 != -1)
    dispatch_once(&qword_100269698, &stru_100214368);
  return (id)qword_100269690;
}

- (BOOL)hasDPID
{
  return self->_dPID != 0;
}

- (BOOL)hasLocaleIdentifier
{
  return self->_localeIdentifier != 0;
}

- (BOOL)hasIAdID
{
  return self->_iAdID != 0;
}

- (BOOL)hasContentiAdID
{
  return self->_contentiAdID != 0;
}

- (BOOL)hasITunesStore
{
  return self->_iTunesStore != 0;
}

- (void)setLimitAdTracking:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_limitAdTracking = a3;
}

- (void)setHasLimitAdTracking:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLimitAdTracking
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIsSignedInToiTunes:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isSignedInToiTunes = a3;
}

- (void)setHasIsSignedInToiTunes:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsSignedInToiTunes
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBUserTransparencyRequest;
  v3 = -[APPBUserTransparencyRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBUserTransparencyRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *dPID;
  NSString *localeIdentifier;
  NSData *iAdID;
  NSData *contentiAdID;
  NSString *iTunesStore;
  char has;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  dPID = self->_dPID;
  if (dPID)
    objc_msgSend(v3, "setObject:forKey:", dPID, CFSTR("DPID"));
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier)
    objc_msgSend(v4, "setObject:forKey:", localeIdentifier, CFSTR("localeIdentifier"));
  iAdID = self->_iAdID;
  if (iAdID)
    objc_msgSend(v4, "setObject:forKey:", iAdID, CFSTR("iAdID"));
  contentiAdID = self->_contentiAdID;
  if (contentiAdID)
    objc_msgSend(v4, "setObject:forKey:", contentiAdID, CFSTR("contentiAdID"));
  iTunesStore = self->_iTunesStore;
  if (iTunesStore)
    objc_msgSend(v4, "setObject:forKey:", iTunesStore, CFSTR("iTunesStore"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_limitAdTracking));
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("limitAdTracking"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isSignedInToiTunes));
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("isSignedInToiTunes"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBUserTransparencyRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSData *dPID;
  NSString *localeIdentifier;
  NSData *iAdID;
  NSData *contentiAdID;
  NSString *iTunesStore;
  char has;
  id v11;

  v4 = a3;
  dPID = self->_dPID;
  v11 = v4;
  if (dPID)
  {
    PBDataWriterWriteDataField(v4, dPID, 1);
    v4 = v11;
  }
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier)
  {
    PBDataWriterWriteStringField(v11, localeIdentifier, 2);
    v4 = v11;
  }
  iAdID = self->_iAdID;
  if (iAdID)
  {
    PBDataWriterWriteDataField(v11, iAdID, 3);
    v4 = v11;
  }
  contentiAdID = self->_contentiAdID;
  if (contentiAdID)
  {
    PBDataWriterWriteDataField(v11, contentiAdID, 4);
    v4 = v11;
  }
  iTunesStore = self->_iTunesStore;
  if (iTunesStore)
  {
    PBDataWriterWriteStringField(v11, iTunesStore, 5);
    v4 = v11;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField(v11, self->_limitAdTracking, 6);
    v4 = v11;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField(v11, self->_isSignedInToiTunes, 7);
    v4 = v11;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  _BYTE *v6;

  v4 = a3;
  v6 = v4;
  if (self->_dPID)
  {
    objc_msgSend(v4, "setDPID:");
    v4 = v6;
  }
  if (self->_localeIdentifier)
  {
    objc_msgSend(v6, "setLocaleIdentifier:");
    v4 = v6;
  }
  if (self->_iAdID)
  {
    objc_msgSend(v6, "setIAdID:");
    v4 = v6;
  }
  if (self->_contentiAdID)
  {
    objc_msgSend(v6, "setContentiAdID:");
    v4 = v6;
  }
  if (self->_iTunesStore)
  {
    objc_msgSend(v6, "setITunesStore:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[49] = self->_limitAdTracking;
    v4[52] |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[48] = self->_isSignedInToiTunes;
    v4[52] |= 1u;
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
  char has;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_dPID, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_localeIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[5];
  v5[5] = v8;

  v10 = -[NSData copyWithZone:](self->_iAdID, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSData copyWithZone:](self->_contentiAdID, "copyWithZone:", a3);
  v13 = (void *)v5[1];
  v5[1] = v12;

  v14 = -[NSString copyWithZone:](self->_iTunesStore, "copyWithZone:", a3);
  v15 = (void *)v5[4];
  v5[4] = v14;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_BYTE *)v5 + 49) = self->_limitAdTracking;
    *((_BYTE *)v5 + 52) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_BYTE *)v5 + 48) = self->_isSignedInToiTunes;
    *((_BYTE *)v5 + 52) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *dPID;
  NSString *localeIdentifier;
  NSData *iAdID;
  NSData *contentiAdID;
  NSString *iTunesStore;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_22;
  dPID = self->_dPID;
  if ((unint64_t)dPID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](dPID, "isEqual:"))
      goto LABEL_22;
  }
  localeIdentifier = self->_localeIdentifier;
  if ((unint64_t)localeIdentifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](localeIdentifier, "isEqual:"))
      goto LABEL_22;
  }
  iAdID = self->_iAdID;
  if ((unint64_t)iAdID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](iAdID, "isEqual:"))
      goto LABEL_22;
  }
  contentiAdID = self->_contentiAdID;
  if ((unint64_t)contentiAdID | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](contentiAdID, "isEqual:"))
      goto LABEL_22;
  }
  iTunesStore = self->_iTunesStore;
  if ((unint64_t)iTunesStore | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](iTunesStore, "isEqual:"))
      goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0)
      goto LABEL_22;
    if (self->_limitAdTracking)
    {
      if (!*((_BYTE *)v4 + 49))
        goto LABEL_22;
    }
    else if (*((_BYTE *)v4 + 49))
    {
      goto LABEL_22;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_22;
  }
  v10 = (*((_BYTE *)v4 + 52) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) != 0)
    {
      if (self->_isSignedInToiTunes)
      {
        if (!*((_BYTE *)v4 + 48))
          goto LABEL_22;
      }
      else if (*((_BYTE *)v4 + 48))
      {
        goto LABEL_22;
      }
      v10 = 1;
      goto LABEL_23;
    }
LABEL_22:
    v10 = 0;
  }
LABEL_23:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (unint64_t)-[NSData hash](self->_dPID, "hash");
  v4 = -[NSString hash](self->_localeIdentifier, "hash");
  v5 = (unint64_t)-[NSData hash](self->_iAdID, "hash");
  v6 = (unint64_t)-[NSData hash](self->_contentiAdID, "hash");
  v7 = -[NSString hash](self->_iTunesStore, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v8 = 2654435761 * self->_limitAdTracking;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v9 = 2654435761 * self->_isSignedInToiTunes;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL v5;
  BOOL *v6;

  v4 = (BOOL *)a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[APPBUserTransparencyRequest setDPID:](self, "setDPID:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[APPBUserTransparencyRequest setLocaleIdentifier:](self, "setLocaleIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[APPBUserTransparencyRequest setIAdID:](self, "setIAdID:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[APPBUserTransparencyRequest setContentiAdID:](self, "setContentiAdID:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[APPBUserTransparencyRequest setITunesStore:](self, "setITunesStore:");
    v4 = v6;
  }
  v5 = v4[52];
  if ((v5 & 2) != 0)
  {
    self->_limitAdTracking = v4[49];
    *(_BYTE *)&self->_has |= 2u;
    v5 = v4[52];
  }
  if (v5)
  {
    self->_isSignedInToiTunes = v4[48];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSData)dPID
{
  return self->_dPID;
}

- (void)setDPID:(id)a3
{
  objc_storeStrong((id *)&self->_dPID, a3);
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_localeIdentifier, a3);
}

- (NSData)iAdID
{
  return self->_iAdID;
}

- (void)setIAdID:(id)a3
{
  objc_storeStrong((id *)&self->_iAdID, a3);
}

- (NSData)contentiAdID
{
  return self->_contentiAdID;
}

- (void)setContentiAdID:(id)a3
{
  objc_storeStrong((id *)&self->_contentiAdID, a3);
}

- (NSString)iTunesStore
{
  return self->_iTunesStore;
}

- (void)setITunesStore:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesStore, a3);
}

- (BOOL)limitAdTracking
{
  return self->_limitAdTracking;
}

- (BOOL)isSignedInToiTunes
{
  return self->_isSignedInToiTunes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_iTunesStore, 0);
  objc_storeStrong((id *)&self->_iAdID, 0);
  objc_storeStrong((id *)&self->_dPID, 0);
  objc_storeStrong((id *)&self->_contentiAdID, 0);
}

@end
