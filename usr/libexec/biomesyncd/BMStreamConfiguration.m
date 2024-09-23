@implementation BMStreamConfiguration

- (NSString)syncIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamConfiguration syncPolicy](self, "syncPolicy"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "legacyDescriptor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamConfiguration streamUUID](self, "streamUUID"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));

  }
  return (NSString *)v7;
}

- (id)syncIdentifierForTransport:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  if (a3 == 2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamConfiguration syncPolicy](self, "syncPolicy"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "legacyDescriptor"));
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamConfiguration streamUUID](self, "streamUUID"));
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));

    }
  }
  else
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[BMStreamConfiguration syncIdentifier](self, "syncIdentifier"));
  }
  return v7;
}

@end
