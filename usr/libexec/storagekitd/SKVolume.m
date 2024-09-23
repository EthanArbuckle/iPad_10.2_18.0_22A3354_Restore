@implementation SKVolume

- (SKVolume)initWithDisk:(id)a3 filesystem:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKVolume *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[SKVolume initWithDisk:filesystem:name:password:]([SKVolume alloc], "initWithDisk:filesystem:name:password:", v10, v9, v8, 0);

  return v11;
}

- (SKVolume)initWithDisk:(id)a3 filesystem:(id)a4 name:(id)a5 password:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SKVolume *v15;
  SKVolume *v16;
  void *v17;
  uint64_t v18;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SKVolume;
  v15 = -[SKVolume init](&v20, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_disk, a3);
    objc_storeStrong((id *)&v16->_name, a5);
    objc_storeStrong((id *)&v16->_password, a6);
    if (v14 && (objc_msgSend(v12, "isEncrypted") & 1) == 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "majorType"));
      v18 = objc_claimAutoreleasedReturnValue(+[SKFilesystem filesystemFor:caseSensitive:encrypted:isExtension:](SKFilesystem, "filesystemFor:caseSensitive:encrypted:isExtension:", v17, objc_msgSend(v12, "isCaseSensitive"), 1, objc_msgSend(v12, "isExtension")));

      v12 = (id)v18;
    }
    objc_storeStrong((id *)&v16->_filesystem, v12);
  }

  return v16;
}

- (id)formatArgs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKVolume filesystem](self, "filesystem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "formatArgs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(" ")));

  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
    v8 = objc_msgSend(v7, "isEqualToString:", &stru_100046738);

    if ((v8 & 1) == 0)
      objc_msgSend(v3, "addObjectsFromArray:", v6);
  }
  v9 = objc_claimAutoreleasedReturnValue(-[SKVolume password](self, "password"));
  if (v9)
  {
    v10 = (void *)v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKVolume password](self, "password"));
    v12 = objc_msgSend(v11, "length");

    if (v12)
    {
      objc_msgSend(v3, "addObject:", CFSTR("-E"));
      objc_msgSend(v3, "addObject:", CFSTR("-S"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKVolume password](self, "password"));
      objc_msgSend(v3, "addObject:", v13);

    }
  }
  objc_msgSend(v3, "addObject:", CFSTR("-v"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SKVolume name](self, "name"));
  objc_msgSend(v3, "addObject:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SKVolume disk](self, "disk"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "diskIdentifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/dev/%@"), v16));
  objc_msgSend(v3, "addObject:", v17);

  return v3;
}

- (id)formatter
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SKVolume filesystem](self, "filesystem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "formatExecutable"));

  return v3;
}

- (id)redactedDescription
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKVolume disk](self, "disk"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKVolume filesystem](self, "filesystem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: { disk: \"%@\", filesystem: \"%@\"}>"), v5, v6, v7));

  return v8;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKVolume disk](self, "disk"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKVolume filesystem](self, "filesystem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKVolume name](self, "name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: { disk: \"%@\", filesystem: \"%@\", name: \"%@\"}>"), v5, v6, v7, v8));

  return v9;
}

- (SKDisk)disk
{
  return self->_disk;
}

- (SKFilesystem)filesystem
{
  return self->_filesystem;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)password
{
  return self->_password;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_filesystem, 0);
  objc_storeStrong((id *)&self->_disk, 0);
}

@end
