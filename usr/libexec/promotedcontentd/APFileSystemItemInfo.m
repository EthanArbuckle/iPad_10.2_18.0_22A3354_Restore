@implementation APFileSystemItemInfo

- (BOOL)isEqual:(id)a3
{
  id *v4;
  NSString *name;
  NSString *v6;
  id v7;
  NSString *filePath;
  NSString *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;

  v4 = (id *)a3;
  if (v4)
  {
    if (self)
      name = self->_name;
    else
      name = 0;
    v6 = name;
    v7 = v4[3];
    if (-[NSString isEqualToString:](v6, "isEqualToString:", v7))
    {
      if (self)
        filePath = self->_filePath;
      else
        filePath = 0;
      v9 = filePath;
      v10 = v4[4];
      if (-[NSString isEqualToString:](v9, "isEqualToString:", v10)
        && (-[NSDate timeIntervalSince1970](self->_createdDate, "timeIntervalSince1970"),
            v12 = v11,
            objc_msgSend(v4[1], "timeIntervalSince1970"),
            v12 == v13))
      {
        -[NSDate timeIntervalSince1970](self->_modifiedDate, "timeIntervalSince1970");
        v15 = v14;
        objc_msgSend(v4[2], "timeIntervalSince1970");
        v17 = v15 == v16;
      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (APStorageManager)fileManager
{
  return self->_fileManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_modifiedDate, 0);
  objc_storeStrong((id *)&self->_createdDate, 0);
}

@end
