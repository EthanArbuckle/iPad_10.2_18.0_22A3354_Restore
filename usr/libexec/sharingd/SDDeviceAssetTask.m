@implementation SDDeviceAssetTask

- (SDDeviceAssetTask)init
{
  SDDeviceAssetTask *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SDDeviceAssetTask;
  result = -[SDDeviceAssetTask init](&v3, "init");
  if (result)
    result->_state = 0;
  return result;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  unint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[SDDeviceAssetTask state](self, "state");
  if (v6 > 2)
    v7 = "?";
  else
    v7 = (&off_100714D30)[v6];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDDeviceAssetTask date](self, "date"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDDeviceAssetTask query](self, "query"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p, state: %s, date: %@, query: \"%@\">"), v5, self, v7, v8, v10));

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  SDDeviceAssetTask *v5;
  uint64_t v6;
  SDDeviceAssetTask *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;

  v5 = (SDDeviceAssetTask *)a3;
  if (v5 == self)
  {
    v13 = 1;
  }
  else
  {
    v6 = objc_opt_class(self, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = -[SDDeviceAssetTask state](self, "state");
      if (v8 == (id)-[SDDeviceAssetTask state](v7, "state"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDDeviceAssetTask date](self, "date"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDDeviceAssetTask date](v7, "date"));
        if (objc_msgSend(v9, "isEqual:", v10))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDDeviceAssetTask query](self, "query"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDDeviceAssetTask query](v7, "query"));
          v13 = objc_msgSend(v11, "isEqual:", v12);

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDDeviceAssetTask date](self, "date"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDDeviceAssetTask query](self, "query"));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (SFDeviceAssetQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
