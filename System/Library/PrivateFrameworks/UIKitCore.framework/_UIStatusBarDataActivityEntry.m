@implementation _UIStatusBarDataActivityEntry

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDataActivityEntry;
  v3 = self->_type ^ -[_UIStatusBarDataEntry hash](&v5, sel_hash);
  return v3 ^ -[NSString hash](self->_displayId, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataActivityEntry;
  v4 = -[_UIStatusBarDataEntry copyWithZone:](&v7, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setType:", self->_type);
  v5 = (void *)-[NSString copy](self->_displayId, "copy");
  objc_msgSend(v4, "setDisplayId:", v5);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDataActivityEntry;
  v4 = a3;
  -[_UIStatusBarDataEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("type"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayId, CFSTR("displayId"));

}

- (_UIStatusBarDataActivityEntry)initWithCoder:(id)a3
{
  id v3;
  _UIStatusBarDataActivityEntry *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataActivityEntry;
  v3 = a3;
  v4 = -[_UIStatusBarDataEntry initWithCoder:](&v7, sel_initWithCoder_, v3);
  -[_UIStatusBarDataActivityEntry setType:](v4, "setType:", objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("type"), v7.receiver, v7.super_class));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIStatusBarDataActivityEntry setDisplayId:](v4, "setDisplayId:", v5);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t type;
  NSString *displayId;
  void *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  BOOL v12;
  char v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIStatusBarDataActivityEntry;
  if (-[_UIStatusBarDataEntry isEqual:](&v15, sel_isEqual_, v4))
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEnabled") & 1) != 0 || -[_UIStatusBarDataEntry isEnabled](self, "isEnabled"))
    {
      type = self->_type;
      if (type == objc_msgSend(v5, "type"))
      {
        displayId = self->_displayId;
        objc_msgSend(v5, "displayId");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = displayId;
        v10 = v8;
        v11 = v10;
        if (v9 == v10)
        {
          v13 = 1;
        }
        else
        {
          if (v9)
            v12 = v10 == 0;
          else
            v12 = 1;
          if (v12)
            v13 = 0;
          else
            v13 = -[NSString isEqual:](v9, "isEqual:", v10);
        }

      }
      else
      {
        v13 = 0;
      }
    }
    else
    {
      v13 = 1;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_ui_descriptionBuilder
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)_UIStatusBarDataActivityEntry;
  -[_UIStatusBarDataEntry _ui_descriptionBuilder](&v8, sel__ui_descriptionBuilder);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  NSStringFromSelector(sel_displayId);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendKeys:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)displayId
{
  return self->_displayId;
}

- (void)setDisplayId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayId, 0);
}

@end
