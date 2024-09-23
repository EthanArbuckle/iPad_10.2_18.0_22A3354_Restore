@implementation ExternalURLQuery

- (ExternalURLQuery)initWithQuery:(id)a3 coordinate:(CLLocationCoordinate2D)a4 muid:(unint64_t)a5 resultProviderId:(int)a6 contentProvider:(id)a7
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v13;
  id v14;
  ExternalURLQuery *v15;
  NSString *v16;
  NSString *query;
  NSString *v18;
  NSString *contentProvider;
  objc_super v21;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v13 = a3;
  v14 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ExternalURLQuery;
  v15 = -[ExternalURLQuery init](&v21, "init");
  if (v15)
  {
    v16 = (NSString *)objc_msgSend(v13, "copy");
    query = v15->_query;
    v15->_query = v16;

    v15->_coordinate.latitude = latitude;
    v15->_coordinate.longitude = longitude;
    v15->_muid = a5;
    v15->_resultProviderId = a6;
    v18 = (NSString *)objc_msgSend(v14, "copy");
    contentProvider = v15->_contentProvider;
    v15->_contentProvider = v18;

  }
  return v15;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ExternalURLQuery query](self, "query"));
  -[ExternalURLQuery coordinate](self, "coordinate");
  v6 = v5;
  -[ExternalURLQuery coordinate](self, "coordinate");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[ExternalURLQuery muid](self, "muid")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[ExternalURLQuery resultProviderId](self, "resultProviderId")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ExternalURLQuery contentProvider](self, "contentProvider"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p query=%@ coordinate=%lf,%lf muid=%@ resultProviderId=%@ contentProvider=%@>"), v3, self, v4, v6, v8, v9, v10, v11));

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  double v5;
  double v6;
  long double v7;
  double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  long double v15;
  double v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ExternalURLQuery query](self, "query"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  -[ExternalURLQuery coordinate](self, "coordinate");
  v6 = -v5;
  if (v5 >= 0.0)
    v6 = v5;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = fmod(v7, 1.84467441e19);
  v10 = 2654435761u * (unint64_t)v9;
  v11 = v10 + (unint64_t)v8;
  if (v8 <= 0.0)
    v11 = 2654435761u * (unint64_t)v9;
  v12 = v10 - (unint64_t)fabs(v8);
  if (v8 < 0.0)
    v13 = v12;
  else
    v13 = v11;
  -[ExternalURLQuery coordinate](self, "coordinate");
  if (v14 < 0.0)
    v14 = -v14;
  v15 = floor(v14 + 0.5);
  v16 = (v14 - v15) * 1.84467441e19;
  v17 = fmod(v15, 1.84467441e19);
  v18 = 2654435761u * (unint64_t)v17;
  v19 = v18 + (unint64_t)v16;
  if (v16 <= 0.0)
    v19 = 2654435761u * (unint64_t)v17;
  v20 = v18 - (unint64_t)fabs(v16);
  if (v16 < 0.0)
    v21 = v20;
  else
    v21 = v19;
  v22 = v13 ^ v4 ^ v21 ^ (2654435761u * -[ExternalURLQuery muid](self, "muid"));
  v23 = 2654435761 * -[ExternalURLQuery resultProviderId](self, "resultProviderId");
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ExternalURLQuery contentProvider](self, "contentProvider"));
  v25 = v22 ^ v23 ^ (unint64_t)objc_msgSend(v24, "hash");

  return v25;
}

- (BOOL)isEqualToExternalURLQuery:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  int v9;
  unsigned __int8 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  uint64_t v24;

  v7 = a3;
  if (!v7)
  {
    v10 = 0;
    goto LABEL_23;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ExternalURLQuery query](self, "query"));
  if (v8 || (v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "query"))) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ExternalURLQuery query](self, "query"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "query"));
    if ((objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
    {

      v10 = 0;
      goto LABEL_20;
    }
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
  -[ExternalURLQuery coordinate](self, "coordinate");
  v12 = v11;
  objc_msgSend(v7, "coordinate");
  if (v12 == v13)
  {
    -[ExternalURLQuery coordinate](self, "coordinate");
    v15 = v14;
    objc_msgSend(v7, "coordinate");
    if (v15 == v16)
    {
      v17 = -[ExternalURLQuery muid](self, "muid");
      if (v17 == objc_msgSend(v7, "muid"))
      {
        v18 = -[ExternalURLQuery resultProviderId](self, "resultProviderId");
        if (v18 == objc_msgSend(v7, "resultProviderId"))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[ExternalURLQuery contentProvider](self, "contentProvider"));
          if (v19 || (v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentProvider"))) != 0)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[ExternalURLQuery contentProvider](self, "contentProvider"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentProvider"));
            v10 = objc_msgSend(v20, "isEqualToString:", v21);

            if (v19)
            {

              if ((v9 & 1) == 0)
                goto LABEL_20;
              goto LABEL_19;
            }
            v23 = (void *)v24;
          }
          else
          {
            v23 = 0;
            v10 = 1;
          }

          if ((v9 & 1) == 0)
            goto LABEL_20;
LABEL_19:

          goto LABEL_20;
        }
      }
    }
  }
  v10 = 0;
  if (v9)
    goto LABEL_19;
LABEL_20:
  if (!v8)

LABEL_23:
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  ExternalURLQuery *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (ExternalURLQuery *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class(ExternalURLQuery);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
      v6 = -[ExternalURLQuery isEqualToExternalURLQuery:](self, "isEqualToExternalURLQuery:", v4);
    else
      v6 = 0;
  }

  return v6;
}

- (NSString)query
{
  return self->_query;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (int)resultProviderId
{
  return self->_resultProviderId;
}

- (NSString)contentProvider
{
  return self->_contentProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProvider, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end
