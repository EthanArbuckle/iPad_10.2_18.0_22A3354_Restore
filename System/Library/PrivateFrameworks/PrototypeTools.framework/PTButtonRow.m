@implementation PTButtonRow

+ (id)rowWithTitle:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "row");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "staticTitle:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "action:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)rowWithTitle:(id)a3 outletKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "row");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "staticTitle:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "outletKeyPath:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)restoreDefaultSettingsButton
{
  void *v3;
  void *v4;

  +[PTRestoreDefaultSettingsRowAction action](PTRestoreDefaultSettingsRowAction, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rowWithTitle:action:", CFSTR("Restore Defaults"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)outletKeyPath:(id)a3
{
  -[PTButtonRow setOutletKeyPath:](self, "setOutletKeyPath:", a3);
  return self;
}

- (id)_defaultAction
{
  void *v2;
  _QWORD v4[5];

  if (self->_outletKeyPath)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __29__PTButtonRow__defaultAction__block_invoke;
    v4[3] = &unk_1E70581A0;
    v4[4] = self;
    +[PTRowAction actionWithHandler:](PTRowAction, "actionWithHandler:", v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

uint64_t __29__PTButtonRow__defaultAction__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_invokeActions");
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  PTButtonRow *v4;
  char v5;
  objc_super v7;

  v4 = (PTButtonRow *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PTButtonRow;
    if (-[PTRow isEqual:](&v7, sel_isEqual_, v4))
      v5 = BSEqualStrings();
    else
      v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;
  _QWORD v8[5];

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = 3221225472;
  v8[2] = __19__PTButtonRow_hash__block_invoke;
  v8[3] = &unk_1E7058178;
  v8[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v4 = (id)objc_msgSend(v3, "appendHashingBlocks:", v8, 0);
  v5 = (id)objc_msgSend(v3, "appendString:", self->_outletKeyPath);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

id __19__PTButtonRow_hash__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)PTButtonRow;
  return objc_msgSendSuper2(&v2, sel_hash);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PTButtonRow;
  v4 = -[PTRow copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setOutletKeyPath:", self->_outletKeyPath);
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
  v5.super_class = (Class)PTButtonRow;
  v4 = a3;
  -[PTRow encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_outletKeyPath, CFSTR("outletKeyPath"), v5.receiver, v5.super_class);

}

- (PTButtonRow)initWithCoder:(id)a3
{
  id v4;
  PTButtonRow *v5;
  uint64_t v6;
  NSString *outletKeyPath;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTButtonRow;
  v5 = -[PTRow initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("outletKeyPath"));
    v6 = objc_claimAutoreleasedReturnValue();
    outletKeyPath = v5->_outletKeyPath;
    v5->_outletKeyPath = (NSString *)v6;

  }
  return v5;
}

- (NSString)outletKeyPath
{
  return self->_outletKeyPath;
}

- (void)setOutletKeyPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outletKeyPath, 0);
}

@end
