@implementation SKPartition

- (id)buildWithScheme:(int)a3 sectorSize:(unint64_t)a4
{
  unsigned __int16 v5;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  uint8_t v16[12];
  int v17;

  v5 = a3;
  v17 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartition fs](self, "fs"));
  v8 = objc_msgSend(v7, "contentMask");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartition name](self, "name"));
  v10 = (void *)MKCFBuildPartition(v5, 0, v8, v9, -[SKPartition size](self, "size") / a4, 0, &v17, 0);

  if (v17)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](SKBaseManager, "sharedManager"));
    objc_msgSend(v11, "logEvent:eventPayloadBuilder:", CFSTR("com.apple.StorageKit.log.fault"), &stru_1000455B8);

    v12 = sub_10000BA9C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "Failed to create partition", v16, 2u);
    }

    v14 = 0;
  }
  else
  {
    v14 = v10;
  }

  return v14;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (SKFilesystem)fs
{
  return self->_fs;
}

- (void)setFs:(id)a3
{
  objc_storeStrong((id *)&self->_fs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fs, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
