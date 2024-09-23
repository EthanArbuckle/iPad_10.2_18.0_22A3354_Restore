@implementation UMDarwinDirectoryUser

- (BOOL)isEqual:(id)a3
{
  UMDarwinDirectoryUser *v4;
  uint64_t v5;
  UMDarwinDirectoryUser *v6;
  NSString *name;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  unsigned int uid;
  unsigned int v12;
  NSUUID *uuid;
  NSUUID *v14;
  NSUUID *v15;
  NSUUID *v16;
  NSUUID *primaryGroupUUID;
  NSUUID *v18;
  NSUUID *v19;
  NSUUID *v20;
  NSString *fullName;
  NSString *v22;
  NSString *v23;
  NSString *homeDirectory;
  NSString *v25;
  NSString *shell;
  NSString *v27;
  NSMutableSet *memberships;
  NSMutableSet *v29;
  unsigned __int8 v30;
  NSMutableSet *v32;
  NSString *v33;
  NSString *v34;
  NSString *v35;
  NSString *v36;
  NSString *v37;

  v4 = (UMDarwinDirectoryUser *)a3;
  if (self == v4)
  {
    v30 = 1;
  }
  else
  {
    v5 = objc_opt_class(UMDarwinDirectoryUser);
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
        goto LABEL_43;
      if (self)
      {
        uid = self->_uid;
        if (v6)
        {
LABEL_10:
          v12 = v6->_uid;
          goto LABEL_11;
        }
      }
      else
      {
        uid = 0;
        if (v6)
          goto LABEL_10;
      }
      v12 = 0;
LABEL_11:
      if (uid == v12)
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
          v30 = 0;
LABEL_53:

          goto LABEL_54;
        }
        if (self)
          primaryGroupUUID = self->_primaryGroupUUID;
        else
          primaryGroupUUID = 0;
        v18 = primaryGroupUUID;
        if (v6)
          v19 = v6->_primaryGroupUUID;
        else
          v19 = 0;
        v20 = v19;
        if (!-[NSUUID isEqual:](v18, "isEqual:", v20))
        {
          v30 = 0;
LABEL_52:

          goto LABEL_53;
        }
        if (self)
          fullName = self->_fullName;
        else
          fullName = 0;
        v37 = fullName;
        if (v6)
          v22 = v6->_fullName;
        else
          v22 = 0;
        v23 = v22;
        if (!-[NSString isEqualToString:](v37, "isEqualToString:", v23))
        {
          v30 = 0;
LABEL_51:

          goto LABEL_52;
        }
        if (self)
          homeDirectory = self->_homeDirectory;
        else
          homeDirectory = 0;
        v36 = homeDirectory;
        if (v6)
          v25 = v6->_homeDirectory;
        else
          v25 = 0;
        v35 = v25;
        if (!-[NSString isEqualToString:](v36, "isEqualToString:"))
        {
          v30 = 0;
LABEL_50:

          goto LABEL_51;
        }
        if (self)
          shell = self->_shell;
        else
          shell = 0;
        v34 = shell;
        if (v6)
          v27 = v6->_shell;
        else
          v27 = 0;
        v33 = v27;
        if (!-[NSString isEqualToString:](v34, "isEqualToString:"))
        {
          v30 = 0;
          goto LABEL_49;
        }
        if (self)
        {
          memberships = self->_memberships;
          if (v6)
          {
LABEL_39:
            v29 = v6->_memberships;
LABEL_40:
            v32 = memberships;
            v30 = -[NSMutableSet isEqual:](v32, "isEqual:", v29);

LABEL_49:
            goto LABEL_50;
          }
        }
        else
        {
          memberships = 0;
          if (v6)
            goto LABEL_39;
        }
        v29 = 0;
        goto LABEL_40;
      }
LABEL_43:
      v30 = 0;
LABEL_54:

      goto LABEL_55;
    }
    v30 = 0;
  }
LABEL_55:

  return v30;
}

- (unint64_t)hash
{
  NSString *name;
  char *v4;
  char *v5;
  NSUUID *uuid;
  NSUUID *v7;
  NSUUID *primaryGroupUUID;
  NSUUID *v9;
  id v10;
  NSString *fullName;
  NSString *v12;
  NSUInteger v13;
  NSString *homeDirectory;
  NSString *v15;
  NSUInteger v16;
  NSString *shell;
  NSString *v18;
  char *v19;
  NSMutableSet *memberships;
  char *v21;
  char *v22;
  char *v24;
  NSString *v25;

  if (self)
    name = self->_name;
  else
    name = 0;
  v25 = name;
  v4 = -[NSString hash](v25, "hash");
  v5 = v4;
  if (self)
  {
    v5 = &v4[self->_uid];
    uuid = self->_uuid;
  }
  else
  {
    uuid = 0;
  }
  v7 = uuid;
  v24 = (char *)-[NSUUID hash](v7, "hash");
  if (self)
    primaryGroupUUID = self->_primaryGroupUUID;
  else
    primaryGroupUUID = 0;
  v9 = primaryGroupUUID;
  v10 = -[NSUUID hash](v9, "hash");
  if (self)
    fullName = self->_fullName;
  else
    fullName = 0;
  v12 = fullName;
  v13 = -[NSString hash](v12, "hash");
  if (self)
    homeDirectory = self->_homeDirectory;
  else
    homeDirectory = 0;
  v15 = homeDirectory;
  v16 = -[NSString hash](v15, "hash");
  if (self)
    shell = self->_shell;
  else
    shell = 0;
  v18 = shell;
  v19 = -[NSString hash](v18, "hash");
  if (self)
    memberships = self->_memberships;
  else
    memberships = 0;
  v21 = &v5[(_QWORD)v24 + (unint64_t)v10 + v13];
  v22 = &v21[(unint64_t)&v19[v16 + (_QWORD)-[NSMutableSet hash](memberships, "hash", v24)]];

  return (unint64_t)v22;
}

- (id)description
{
  NSString *v3;
  uint64_t uid;
  NSUUID *v5;
  NSUUID *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSMutableSet *memberships;
  void *v11;

  if (self)
  {
    v3 = self->_name;
    uid = self->_uid;
    v5 = self->_uuid;
    v6 = self->_primaryGroupUUID;
    v7 = self->_fullName;
    v8 = self->_homeDirectory;
    v9 = self->_shell;
    memberships = self->_memberships;
  }
  else
  {
    v9 = 0;
    v7 = 0;
    v5 = 0;
    v3 = 0;
    uid = 0;
    v6 = 0;
    v8 = 0;
    memberships = 0;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<UMDarwinDirectoryUser name:%@ uid:%d uuid:%@ primaryGroupUUID:%@ fullName:%@ homeDirectory:%@ shell:%@ memberships:%@"), v3, uid, v5, v6, v7, v8, v9, memberships));

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberships, 0);
  objc_storeStrong((id *)&self->_shell, 0);
  objc_storeStrong((id *)&self->_homeDirectory, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_primaryGroupUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
