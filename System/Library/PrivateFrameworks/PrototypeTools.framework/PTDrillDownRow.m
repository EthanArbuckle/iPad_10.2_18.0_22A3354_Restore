@implementation PTDrillDownRow

+ (id)rowWithTitle:(id)a3 childSettingsKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithChildKeyPath:", v6);

  objc_msgSend(v8, "setStaticTitle:", v7);
  return v8;
}

+ (id)rowWithTitleKeyPath:(id)a3 childSettingsKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithChildKeyPath:", v6);

  objc_msgSend(v8, "setTitleKeyPath:", v7);
  return v8;
}

- (PTDrillDownRow)initWithChildKeyPath:(id)a3
{
  id v5;
  PTDrillDownRow *v6;
  PTDrillDownRow *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTDrillDownRow;
  v6 = -[PTRow init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_childKeyPath, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[PTSettings removeKeyPathObserver:](self->_childSettings, "removeKeyPathObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PTDrillDownRow;
  -[PTRow dealloc](&v3, sel_dealloc);
}

- (void)setSettings:(id)a3
{
  PTSettings *childSettings;
  id v5;
  PTSettings *v6;
  void *v7;
  PTSettings *v8;
  PTSettings *v9;
  objc_super v10;

  childSettings = self->_childSettings;
  v5 = a3;
  -[PTSettings removeKeyPathObserver:](childSettings, "removeKeyPathObserver:", self);
  v6 = self->_childSettings;
  self->_childSettings = 0;

  v10.receiver = self;
  v10.super_class = (Class)PTDrillDownRow;
  -[PTRow setSettings:](&v10, sel_setSettings_, v5);

  if (self->_childKeyPath)
  {
    -[PTRow settings](self, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForKeyPath:", self->_childKeyPath);
    v8 = (PTSettings *)objc_claimAutoreleasedReturnValue();
    v9 = self->_childSettings;
    self->_childSettings = v8;

    -[PTSettings addKeyPathObserver:](self->_childSettings, "addKeyPathObserver:", self);
  }
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  PTSettings *v6;
  id v7;
  objc_super v8;

  v6 = (PTSettings *)a3;
  v7 = a4;
  if (self->_childSettings == v6)
    -[PTRow _sendValueChanged](self, "_sendValueChanged");
  v8.receiver = self;
  v8.super_class = (Class)PTDrillDownRow;
  -[PTRow settings:changedValueForKeyPath:](&v8, sel_settings_changedValueForKeyPath_, v6, v7);

}

- (id)value
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PTDrillDownRow;
  -[PTRow value](&v8, sel_value);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[PTSettings drillDownSummary](self->_childSettings, "drillDownSummary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PTDrillDownRow *v4;
  char v5;
  objc_super v7;

  v4 = (PTDrillDownRow *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PTDrillDownRow;
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
  v8[2] = __22__PTDrillDownRow_hash__block_invoke;
  v8[3] = &unk_1E7058178;
  v8[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v4 = (id)objc_msgSend(v3, "appendHashingBlocks:", v8, 0);
  v5 = (id)objc_msgSend(v3, "appendString:", self->_childKeyPath);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

id __22__PTDrillDownRow_hash__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)PTDrillDownRow;
  return objc_msgSendSuper2(&v2, sel_hash);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PTDrillDownRow;
  v4 = -[PTRow copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 19, self->_childKeyPath);
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
  v5.super_class = (Class)PTDrillDownRow;
  v4 = a3;
  -[PTRow encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_childKeyPath, CFSTR("childKeyPath"), v5.receiver, v5.super_class);

}

- (PTDrillDownRow)initWithCoder:(id)a3
{
  id v4;
  PTDrillDownRow *v5;
  uint64_t v6;
  NSString *childKeyPath;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTDrillDownRow;
  v5 = -[PTRow initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("childKeyPath"));
    v6 = objc_claimAutoreleasedReturnValue();
    childKeyPath = v5->_childKeyPath;
    v5->_childKeyPath = (NSString *)v6;

  }
  return v5;
}

- (NSString)childKeyPath
{
  return self->_childKeyPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childKeyPath, 0);
  objc_storeStrong((id *)&self->_childSettings, 0);
}

@end
