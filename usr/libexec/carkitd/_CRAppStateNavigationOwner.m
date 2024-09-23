@implementation _CRAppStateNavigationOwner

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_CRAppStateNavigationOwner identifier](self, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_CRAppStateNavigationOwner connection](self, "connection"));
  v6 = objc_msgSend(v5, "processIdentifier");
  if (-[_CRAppStateNavigationOwner supportsAccNav](self, "supportsAccNav"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_CRAppStateNavigationOwner connection](self, "connection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p %@(%d) supportsAccNav=%@ connection=%p>"), v3, self, v4, v6, v7, v8));

  return v9;
}

- (BOOL)isEqualToOwner:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_CRAppStateNavigationOwner identifier](self, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_CRAppStateNavigationOwner connection](self, "connection"));
    v8 = objc_msgSend(v7, "processIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connection"));
    v10 = v8 == objc_msgSend(v9, "processIdentifier");

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _CRAppStateNavigationOwner *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (_CRAppStateNavigationOwner *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class(_CRAppStateNavigationOwner);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
      v6 = -[_CRAppStateNavigationOwner isEqualToOwner:](self, "isEqualToOwner:", v4);
    else
      v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_CRAppStateNavigationOwner identifier](self, "identifier"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_CRAppStateNavigationOwner connection](self, "connection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v5, "processIdentifier")));
  v7 = (unint64_t)objc_msgSend(v6, "hash") ^ v4;

  return v7;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)supportsAccNav
{
  return self->_supportsAccNav;
}

- (void)setSupportsAccNav:(BOOL)a3
{
  self->_supportsAccNav = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
