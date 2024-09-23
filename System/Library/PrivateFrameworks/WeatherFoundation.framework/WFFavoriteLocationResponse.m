@implementation WFFavoriteLocationResponse

- (WFFavoriteLocationResponse)initWithIdentifier:(id)a3 favorites:(id)a4
{
  id v7;
  WFFavoriteLocationResponse *v8;
  WFFavoriteLocationResponse *v9;
  WFFavoriteLocationResponse *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WFFavoriteLocationResponse;
  v8 = -[WFResponse initWithIdentifier:](&v12, sel_initWithIdentifier_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_favoriteLocations, a4);
    v10 = v9;
  }

  return v9;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("WFFavoriteLocationResponse %p: %@"), self, self->_favoriteLocations);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFFavoriteLocationResponse)initWithCoder:(id)a3
{
  id v4;
  WFFavoriteLocationResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *favoriteLocations;
  WFFavoriteLocationResponse *v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFFavoriteLocationResponse;
  v5 = -[WFResponse initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("favoriteLocations"));
    v9 = objc_claimAutoreleasedReturnValue();
    favoriteLocations = v5->_favoriteLocations;
    v5->_favoriteLocations = (NSArray *)v9;

    v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFFavoriteLocationResponse;
  v4 = a3;
  -[WFResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_favoriteLocations, CFSTR("favoriteLocations"), v5.receiver, v5.super_class);

}

- (NSArray)favoriteLocations
{
  return self->_favoriteLocations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favoriteLocations, 0);
}

@end
