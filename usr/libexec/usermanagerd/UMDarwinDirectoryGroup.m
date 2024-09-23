@implementation UMDarwinDirectoryGroup

- (BOOL)isEqual:(id)a3
{
  UMDarwinDirectoryGroup *v4;
  uint64_t v5;
  UMDarwinDirectoryGroup *v6;
  NSString *name;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  unsigned int gid;
  unsigned int v12;
  NSUUID *uuid;
  NSUUID *v14;
  NSUUID *v15;
  NSUUID *v16;
  NSString *fullName;
  NSString *v18;
  NSString *v19;
  unsigned __int8 v20;

  v4 = (UMDarwinDirectoryGroup *)a3;
  if (self == v4)
  {
    v20 = 1;
  }
  else
  {
    v5 = objc_opt_class(UMDarwinDirectoryGroup);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      if (self)
        name = self->_name;
      else
        name = 0;
      v8 = name;
      if (v6)
        v9 = v6->_name;
      else
        v9 = 0;
      v10 = v9;
      if (!-[NSString isEqualToString:](v8, "isEqualToString:", v10))
        goto LABEL_23;
      if (self)
      {
        gid = self->_gid;
        if (v6)
        {
LABEL_10:
          v12 = v6->_gid;
          goto LABEL_11;
        }
      }
      else
      {
        gid = 0;
        if (v6)
          goto LABEL_10;
      }
      v12 = 0;
LABEL_11:
      if (gid == v12)
      {
        if (self)
          uuid = self->_uuid;
        else
          uuid = 0;
        v14 = uuid;
        if (v6)
          v15 = v6->_uuid;
        else
          v15 = 0;
        v16 = v15;
        if (!-[NSUUID isEqual:](v14, "isEqual:", v16))
        {
          v20 = 0;
          goto LABEL_25;
        }
        if (self)
        {
          fullName = self->_fullName;
          if (v6)
          {
LABEL_19:
            v18 = v6->_fullName;
LABEL_20:
            v19 = fullName;
            v20 = -[NSString isEqualToString:](v19, "isEqualToString:", v18);

LABEL_25:
            goto LABEL_26;
          }
        }
        else
        {
          fullName = 0;
          if (v6)
            goto LABEL_19;
        }
        v18 = 0;
        goto LABEL_20;
      }
LABEL_23:
      v20 = 0;
LABEL_26:

      goto LABEL_27;
    }
    v20 = 0;
  }
LABEL_27:

  return v20;
}

- (unint64_t)hash
{
  NSString *name;
  NSString *v4;
  char *v5;
  char *v6;
  NSUUID *uuid;
  NSUUID *v8;
  id v9;
  NSString *fullName;
  char *v11;

  if (self)
    name = self->_name;
  else
    name = 0;
  v4 = name;
  v5 = -[NSString hash](v4, "hash");
  v6 = v5;
  if (self)
  {
    v6 = &v5[self->_gid];
    uuid = self->_uuid;
  }
  else
  {
    uuid = 0;
  }
  v8 = uuid;
  v9 = -[NSUUID hash](v8, "hash");
  if (self)
    fullName = self->_fullName;
  else
    fullName = 0;
  v11 = &v6[(_QWORD)v9 + -[NSString hash](fullName, "hash")];

  return (unint64_t)v11;
}

- (id)description
{
  NSString *v3;
  uint64_t gid;
  NSUUID *v5;
  NSString *fullName;
  void *v7;

  if (self)
  {
    v3 = self->_name;
    gid = self->_gid;
    v5 = self->_uuid;
    fullName = self->_fullName;
  }
  else
  {
    v5 = 0;
    v3 = 0;
    gid = 0;
    fullName = 0;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<UMDarwinDirectoryGroup name:%@ gid:%d uuid:%@ fullName:%@"), v3, gid, v5, fullName));

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
