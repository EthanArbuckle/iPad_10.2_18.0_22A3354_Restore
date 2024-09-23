@implementation TUCollaborationInitiator

- (TUCollaborationInitiator)init
{
  return -[TUCollaborationInitiator initWithNameComponents:handle:](self, "initWithNameComponents:handle:", 0, 0);
}

- (TUCollaborationInitiator)initWithNameComponents:(id)a3 handle:(id)a4
{
  id v6;
  id v7;
  TUCollaborationInitiator *v8;
  uint64_t v9;
  NSPersonNameComponents *nameComponents;
  uint64_t v11;
  NSString *handle;
  TUCollaborationInitiator *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TUCollaborationInitiator;
  v8 = -[TUCollaborationInitiator init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    nameComponents = v8->_nameComponents;
    v8->_nameComponents = (NSPersonNameComponents *)v9;

    v11 = objc_msgSend(v7, "copy");
    handle = v8->_handle;
    v8->_handle = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p "), objc_opt_class(), self);
  NSStringFromSelector(sel_nameComponents);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v4, self->_nameComponents);

  NSStringFromSelector(sel_handle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", %@=%@"), v5, self->_handle);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSPersonNameComponents *nameComponents;
  void *v6;
  NSString *handle;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    nameComponents = self->_nameComponents;
    objc_msgSend(v4, "nameComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (TUObjectsAreEqualOrNil((unint64_t)nameComponents, (uint64_t)v6))
    {
      handle = self->_handle;
      objc_msgSend(v4, "handle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = TUObjectsAreEqualOrNil((unint64_t)handle, (uint64_t)v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSPersonNameComponents hash](self->_nameComponents, "hash");
  return -[NSString hash](self->_handle, "hash") ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithNameComponents:handle:", self->_nameComponents, self->_handle);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUCollaborationInitiator)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  TUCollaborationInitiator *v11;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_nameComponents);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_handle);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[TUCollaborationInitiator initWithNameComponents:handle:](self, "initWithNameComponents:handle:", v7, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSPersonNameComponents *nameComponents;
  id v5;
  void *v6;
  NSString *handle;
  id v8;

  nameComponents = self->_nameComponents;
  v5 = a3;
  NSStringFromSelector(sel_nameComponents);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", nameComponents, v6);

  handle = self->_handle;
  NSStringFromSelector(sel_handle);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", handle, v8);

}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (NSString)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
}

@end
