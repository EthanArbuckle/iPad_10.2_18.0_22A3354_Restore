@implementation NRDOrphanedConnection

- (id)description
{
  id v3;
  NSUUID *v4;
  OS_xpc_object *connection;
  id v6;

  v3 = objc_alloc((Class)NSString);
  if (self)
  {
    v4 = self->_nrUUID;
    connection = self->_connection;
  }
  else
  {
    v4 = 0;
    connection = 0;
  }
  v6 = objc_msgSend(v3, "initWithFormat:", CFSTR("[OrphanedConnection:%@,%@]"), v4, connection);

  return v6;
}

- (unint64_t)hash
{
  NSUUID *nrUUID;
  NSUUID *v4;
  id v5;
  OS_xpc_object *connection;
  unint64_t v7;

  if (self)
    nrUUID = self->_nrUUID;
  else
    nrUUID = 0;
  v4 = nrUUID;
  v5 = -[NSUUID hash](v4, "hash");
  if (self)
    connection = self->_connection;
  else
    connection = 0;
  v7 = (unint64_t)connection + (_QWORD)v5;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD *v6;
  NSUUID *nrUUID;
  NSUUID *v8;
  void *v9;
  id v10;
  OS_xpc_object *connection;
  OS_xpc_object *v12;
  BOOL v13;

  v4 = a3;
  v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    if (self)
      nrUUID = self->_nrUUID;
    else
      nrUUID = 0;
    v8 = nrUUID;
    if (v6)
      v9 = (void *)v6[1];
    else
      v9 = 0;
    v10 = v9;
    if (!-[NSUUID isEqual:](v8, "isEqual:", v10))
    {
      v13 = 0;
      goto LABEL_13;
    }
    if (self)
    {
      connection = self->_connection;
      if (v6)
      {
LABEL_9:
        v12 = (OS_xpc_object *)v6[2];
LABEL_10:
        v13 = connection == v12;
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      connection = 0;
      if (v6)
        goto LABEL_9;
    }
    v12 = 0;
    goto LABEL_10;
  }
  v13 = 0;
LABEL_14:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_nrUUID, 0);
}

@end
