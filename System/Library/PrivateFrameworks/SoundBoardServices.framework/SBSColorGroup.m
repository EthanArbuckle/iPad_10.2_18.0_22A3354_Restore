@implementation SBSColorGroup

- (NSData)data
{
  return (NSData *)objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
}

- (SBSColorGroup)initWithData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  SBSColorGroup *v7;
  uint64_t v9;

  v4 = (void *)MEMORY[0x24BDD1620];
  v5 = a3;
  v9 = 0;
  objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (SBSColorGroup)initWithBackground:(id)a3 primaryText:(id)a4 secondaryText:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBSColorGroup *v12;
  SBSColorGroup *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SBSColorGroup;
  v12 = -[SBSColorGroup init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_background, a3);
    objc_storeStrong((id *)&v13->_primaryText, a4);
    objc_storeStrong((id *)&v13->_secondaryText, a5);
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  SBSColor *background;
  id v5;

  background = self->_background;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", background, CFSTR("background"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryText, CFSTR("primaryText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondaryText, CFSTR("secondaryText"));

}

- (SBSColorGroup)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SBSColorGroup *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("background"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SBSColorGroup initWithBackground:primaryText:secondaryText:]([SBSColorGroup alloc], "initWithBackground:primaryText:secondaryText:", v5, v6, v7);
  return v8;
}

- (SBSColor)background
{
  return self->_background;
}

- (SBSColor)primaryText
{
  return self->_primaryText;
}

- (SBSColor)secondaryText
{
  return self->_secondaryText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_background, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
