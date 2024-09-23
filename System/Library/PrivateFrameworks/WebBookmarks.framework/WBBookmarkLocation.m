@implementation WBBookmarkLocation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_position, 0);
}

- (WBBookmarkLocation)initWithParentID:(int)a3 position:(id)a4
{
  id v7;
  WBBookmarkLocation *v8;
  WBBookmarkLocation *v9;
  WBBookmarkLocation *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WBBookmarkLocation;
  v8 = -[WBBookmarkLocation init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_parentID = a3;
    objc_storeStrong((id *)&v8->_position, a4);
    v10 = v9;
  }

  return v9;
}

- (WBBookmarkLocation)locationWithParentID:(int)a3
{
  return (WBBookmarkLocation *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithParentID:position:", *(_QWORD *)&a3, self->_position);
}

- (WBBookmarkLocation)init
{
  return -[WBBookmarkLocation initWithParentID:position:](self, "initWithParentID:position:", 0x7FFFFFFFLL, 0);
}

- (BOOL)isEqual:(id)a3
{
  WBBookmarkLocation *v4;
  WBBookmarkLocation *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (WBBookmarkLocation *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[WBBookmarkLocation parentID](v5, "parentID");
      if (v6 == -[WBBookmarkLocation parentID](self, "parentID"))
      {
        -[WBBookmarkLocation position](v5, "position");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBBookmarkLocation position](self, "position");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = WBSIsEqual();

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
  }

  return v9;
}

- (int)parentID
{
  return self->_parentID;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBBookmarkLocation)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  WBBookmarkLocation *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("Parent"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Position"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WBBookmarkLocation initWithParentID:position:](self, "initWithParentID:position:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t parentID;
  id v5;

  parentID = self->_parentID;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", parentID, CFSTR("Parent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_position, CFSTR("Position"));

}

- (unint64_t)hash
{
  uint64_t parentID;

  parentID = self->_parentID;
  return -[WBSCRDTPosition hash](self->_position, "hash") ^ parentID;
}

- (WBBookmarkLocation)locationWithPosition:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithParentID:position:", self->_parentID, v4);

  return (WBBookmarkLocation *)v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p; parent ID: %d, position: %@>"),
               objc_opt_class(),
               self,
               self->_parentID,
               self->_position);
}

- (WBSCRDTPosition)position
{
  return self->_position;
}

@end
