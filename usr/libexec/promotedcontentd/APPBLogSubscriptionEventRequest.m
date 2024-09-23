@implementation APPBLogSubscriptionEventRequest

+ (id)options
{
  if (qword_1002699E0 != -1)
    dispatch_once(&qword_1002699E0, &stru_100215568);
  return (id)qword_1002699D8;
}

- (BOOL)hasIAdID
{
  return self->_iAdID != 0;
}

- (BOOL)hasAnonymousDemandiAdID
{
  return self->_anonymousDemandiAdID != 0;
}

- (BOOL)hasContentiAdID
{
  return self->_contentiAdID != 0;
}

- (BOOL)hasSubscriptionSourceID
{
  return self->_subscriptionSourceID != 0;
}

- (BOOL)hasQToken
{
  return self->_qToken != 0;
}

- (int)event
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_event;
  else
    return 0;
}

- (void)setEvent:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_event = a3;
}

- (void)setHasEvent:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEvent
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)eventAsString:(int)a3
{
  if (a3 >= 5)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_100215588 + a3);
}

- (int)StringAsEvent:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AlreadySubscribed")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PurchasedSubscription")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AlreadySubscribedViaNativeAd")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PurchasedSubscriptionViaNativeAd")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setEventTime:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_eventTime = a3;
}

- (void)setHasEventTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearInfos
{
  -[NSMutableArray removeAllObjects](self->_infos, "removeAllObjects");
}

- (void)addInfo:(id)a3
{
  id v4;
  NSMutableArray *infos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  infos = self->_infos;
  v8 = v4;
  if (!infos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_infos;
    self->_infos = v6;

    v4 = v8;
    infos = self->_infos;
  }
  -[NSMutableArray addObject:](infos, "addObject:", v4);

}

- (unint64_t)infosCount
{
  return (unint64_t)-[NSMutableArray count](self->_infos, "count");
}

- (id)infoAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_infos, "objectAtIndex:", a3);
}

+ (Class)infoType
{
  return (Class)objc_opt_class(APPBParameter, a2);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBLogSubscriptionEventRequest;
  v3 = -[APPBLogSubscriptionEventRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBLogSubscriptionEventRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *iAdID;
  NSData *anonymousDemandiAdID;
  NSData *contentiAdID;
  NSString *subscriptionSourceID;
  NSString *qToken;
  char has;
  uint64_t event;
  void *v12;
  void *v13;
  id v14;
  NSMutableArray *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  iAdID = self->_iAdID;
  if (iAdID)
    objc_msgSend(v3, "setObject:forKey:", iAdID, CFSTR("iAdID"));
  anonymousDemandiAdID = self->_anonymousDemandiAdID;
  if (anonymousDemandiAdID)
    objc_msgSend(v4, "setObject:forKey:", anonymousDemandiAdID, CFSTR("anonymousDemandiAdID"));
  contentiAdID = self->_contentiAdID;
  if (contentiAdID)
    objc_msgSend(v4, "setObject:forKey:", contentiAdID, CFSTR("contentiAdID"));
  subscriptionSourceID = self->_subscriptionSourceID;
  if (subscriptionSourceID)
    objc_msgSend(v4, "setObject:forKey:", subscriptionSourceID, CFSTR("subscriptionSourceID"));
  qToken = self->_qToken;
  if (qToken)
    objc_msgSend(v4, "setObject:forKey:", qToken, CFSTR("qToken"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    event = self->_event;
    if (event >= 5)
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_event));
    else
      v12 = *(&off_100215588 + event);
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("event"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_eventTime));
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("eventTime"));

  }
  if (-[NSMutableArray count](self->_infos, "count"))
  {
    v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_infos, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = self->_infos;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v17);
    }

    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("info"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBLogSubscriptionEventRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSData *iAdID;
  NSData *anonymousDemandiAdID;
  NSData *contentiAdID;
  NSString *subscriptionSourceID;
  NSString *qToken;
  char has;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = v4;
  iAdID = self->_iAdID;
  if (iAdID)
    PBDataWriterWriteDataField(v4, iAdID, 1);
  anonymousDemandiAdID = self->_anonymousDemandiAdID;
  if (anonymousDemandiAdID)
    PBDataWriterWriteDataField(v5, anonymousDemandiAdID, 2);
  contentiAdID = self->_contentiAdID;
  if (contentiAdID)
    PBDataWriterWriteDataField(v5, contentiAdID, 3);
  subscriptionSourceID = self->_subscriptionSourceID;
  if (subscriptionSourceID)
    PBDataWriterWriteStringField(v5, subscriptionSourceID, 4);
  qToken = self->_qToken;
  if (qToken)
    PBDataWriterWriteStringField(v5, qToken, 5);
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field(v5, self->_event, 6);
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteDoubleField(v5, 7, self->_eventTime);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = self->_infos;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), 8);
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_iAdID)
  {
    objc_msgSend(v4, "setIAdID:");
    v4 = v10;
  }
  if (self->_anonymousDemandiAdID)
  {
    objc_msgSend(v10, "setAnonymousDemandiAdID:");
    v4 = v10;
  }
  if (self->_contentiAdID)
  {
    objc_msgSend(v10, "setContentiAdID:");
    v4 = v10;
  }
  if (self->_subscriptionSourceID)
  {
    objc_msgSend(v10, "setSubscriptionSourceID:");
    v4 = v10;
  }
  if (self->_qToken)
  {
    objc_msgSend(v10, "setQToken:");
    v4 = v10;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_event;
    *((_BYTE *)v4 + 72) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_eventTime;
    *((_BYTE *)v4 + 72) |= 1u;
  }
  if (-[APPBLogSubscriptionEventRequest infosCount](self, "infosCount"))
  {
    objc_msgSend(v10, "clearInfos");
    v6 = -[APPBLogSubscriptionEventRequest infosCount](self, "infosCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[APPBLogSubscriptionEventRequest infoAtIndex:](self, "infoAtIndex:", i));
        objc_msgSend(v10, "addInfo:", v9);

      }
    }
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
  NSMutableArray *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_iAdID, "copyWithZone:", a3);
  v7 = (void *)v5[5];
  v5[5] = v6;

  v8 = -[NSData copyWithZone:](self->_anonymousDemandiAdID, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSData copyWithZone:](self->_contentiAdID, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSString copyWithZone:](self->_subscriptionSourceID, "copyWithZone:", a3);
  v13 = (void *)v5[8];
  v5[8] = v12;

  v14 = -[NSString copyWithZone:](self->_qToken, "copyWithZone:", a3);
  v15 = (void *)v5[7];
  v5[7] = v14;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_event;
    *((_BYTE *)v5 + 72) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v5[1] = *(_QWORD *)&self->_eventTime;
    *((_BYTE *)v5 + 72) |= 1u;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = self->_infos;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v17);
        v22 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3, (_QWORD)v24);
        objc_msgSend(v5, "addInfo:", v22);

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v19);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *iAdID;
  NSData *anonymousDemandiAdID;
  NSData *contentiAdID;
  NSString *subscriptionSourceID;
  NSString *qToken;
  NSMutableArray *infos;
  unsigned __int8 v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_24;
  iAdID = self->_iAdID;
  if ((unint64_t)iAdID | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](iAdID, "isEqual:"))
      goto LABEL_24;
  }
  anonymousDemandiAdID = self->_anonymousDemandiAdID;
  if ((unint64_t)anonymousDemandiAdID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](anonymousDemandiAdID, "isEqual:"))
      goto LABEL_24;
  }
  contentiAdID = self->_contentiAdID;
  if ((unint64_t)contentiAdID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](contentiAdID, "isEqual:"))
      goto LABEL_24;
  }
  subscriptionSourceID = self->_subscriptionSourceID;
  if ((unint64_t)subscriptionSourceID | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](subscriptionSourceID, "isEqual:"))
      goto LABEL_24;
  }
  qToken = self->_qToken;
  if ((unint64_t)qToken | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](qToken, "isEqual:"))
      goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0 || self->_event != *((_DWORD *)v4 + 8))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
LABEL_24:
    v11 = 0;
    goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_eventTime != *((double *)v4 + 1))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    goto LABEL_24;
  }
  infos = self->_infos;
  if ((unint64_t)infos | *((_QWORD *)v4 + 6))
    v11 = -[NSMutableArray isEqual:](infos, "isEqual:");
  else
    v11 = 1;
LABEL_25:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  double eventTime;
  double v10;
  long double v11;
  double v12;
  unint64_t v13;

  v3 = (unint64_t)-[NSData hash](self->_iAdID, "hash");
  v4 = (unint64_t)-[NSData hash](self->_anonymousDemandiAdID, "hash");
  v5 = (unint64_t)-[NSData hash](self->_contentiAdID, "hash");
  v6 = -[NSString hash](self->_subscriptionSourceID, "hash");
  v7 = -[NSString hash](self->_qToken, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v8 = 2654435761 * self->_event;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v13 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v13 ^ (unint64_t)-[NSMutableArray hash](self->_infos, "hash");
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  eventTime = self->_eventTime;
  v10 = -eventTime;
  if (eventTime >= 0.0)
    v10 = self->_eventTime;
  v11 = floor(v10 + 0.5);
  v12 = (v10 - v11) * 1.84467441e19;
  v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0)
      v13 += (unint64_t)v12;
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v13 ^ (unint64_t)-[NSMutableArray hash](self->_infos, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  if (*((_QWORD *)v4 + 5))
    -[APPBLogSubscriptionEventRequest setIAdID:](self, "setIAdID:");
  if (*((_QWORD *)v4 + 2))
    -[APPBLogSubscriptionEventRequest setAnonymousDemandiAdID:](self, "setAnonymousDemandiAdID:");
  if (*((_QWORD *)v4 + 3))
    -[APPBLogSubscriptionEventRequest setContentiAdID:](self, "setContentiAdID:");
  if (*((_QWORD *)v4 + 8))
    -[APPBLogSubscriptionEventRequest setSubscriptionSourceID:](self, "setSubscriptionSourceID:");
  if (*((_QWORD *)v4 + 7))
    -[APPBLogSubscriptionEventRequest setQToken:](self, "setQToken:");
  v5 = *((_BYTE *)v4 + 72);
  if ((v5 & 2) != 0)
  {
    self->_event = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 72);
  }
  if ((v5 & 1) != 0)
  {
    self->_eventTime = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 6);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[APPBLogSubscriptionEventRequest addInfo:](self, "addInfo:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (NSData)iAdID
{
  return self->_iAdID;
}

- (void)setIAdID:(id)a3
{
  objc_storeStrong((id *)&self->_iAdID, a3);
}

- (NSData)anonymousDemandiAdID
{
  return self->_anonymousDemandiAdID;
}

- (void)setAnonymousDemandiAdID:(id)a3
{
  objc_storeStrong((id *)&self->_anonymousDemandiAdID, a3);
}

- (NSData)contentiAdID
{
  return self->_contentiAdID;
}

- (void)setContentiAdID:(id)a3
{
  objc_storeStrong((id *)&self->_contentiAdID, a3);
}

- (NSString)subscriptionSourceID
{
  return self->_subscriptionSourceID;
}

- (void)setSubscriptionSourceID:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionSourceID, a3);
}

- (NSString)qToken
{
  return self->_qToken;
}

- (void)setQToken:(id)a3
{
  objc_storeStrong((id *)&self->_qToken, a3);
}

- (double)eventTime
{
  return self->_eventTime;
}

- (NSMutableArray)infos
{
  return self->_infos;
}

- (void)setInfos:(id)a3
{
  objc_storeStrong((id *)&self->_infos, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionSourceID, 0);
  objc_storeStrong((id *)&self->_qToken, 0);
  objc_storeStrong((id *)&self->_infos, 0);
  objc_storeStrong((id *)&self->_iAdID, 0);
  objc_storeStrong((id *)&self->_contentiAdID, 0);
  objc_storeStrong((id *)&self->_anonymousDemandiAdID, 0);
}

@end
