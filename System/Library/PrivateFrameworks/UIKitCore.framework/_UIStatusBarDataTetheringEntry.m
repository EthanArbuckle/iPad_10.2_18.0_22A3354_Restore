@implementation _UIStatusBarDataTetheringEntry

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarDataTetheringEntry;
  return self->_connectionCount ^ -[_UIStatusBarDataEntry hash](&v3, sel_hash);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarDataTetheringEntry;
  v4 = -[_UIStatusBarDataEntry copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setConnectionCount:", self->_connectionCount);
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
  v5.super_class = (Class)_UIStatusBarDataTetheringEntry;
  v4 = a3;
  -[_UIStatusBarDataEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_connectionCount, CFSTR("connectionCount"), v5.receiver, v5.super_class);

}

- (_UIStatusBarDataTetheringEntry)initWithCoder:(id)a3
{
  id v3;
  _UIStatusBarDataTetheringEntry *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataTetheringEntry;
  v3 = a3;
  v4 = -[_UIStatusBarDataEntry initWithCoder:](&v7, sel_initWithCoder_, v3);
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("connectionCount"), v7.receiver, v7.super_class);

  -[_UIStatusBarDataTetheringEntry setConnectionCount:](v4, "setConnectionCount:", v5);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t connectionCount;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIStatusBarDataTetheringEntry;
  if (-[_UIStatusBarDataEntry isEqual:](&v9, sel_isEqual_, v4))
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEnabled") & 1) != 0 || -[_UIStatusBarDataEntry isEnabled](self, "isEnabled"))
    {
      connectionCount = self->_connectionCount;
      v7 = connectionCount == objc_msgSend(v5, "connectionCount");
    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_ui_descriptionBuilder
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataTetheringEntry;
  -[_UIStatusBarDataEntry _ui_descriptionBuilder](&v7, sel__ui_descriptionBuilder);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_connectionCount);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendKeys:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)connectionCount
{
  return self->_connectionCount;
}

- (void)setConnectionCount:(int64_t)a3
{
  self->_connectionCount = a3;
}

@end
