@implementation _PUPosterEditingLook

- (_PUPosterEditingLook)initWithIdentifier:(id)a3 displayName:(id)a4 pu_timeAppearance:(unint64_t)a5 pu_timeFontIdentifier:(id)a6 pu_timeFontColor:(id)a7
{
  id v13;
  id v14;
  _PUPosterEditingLook *v15;
  _PUPosterEditingLook *v16;

  v13 = a6;
  v14 = a7;
  v15 = -[_PUPosterEditingLook initWithIdentifier:displayName:](self, "initWithIdentifier:displayName:", a3, a4);
  v16 = v15;
  if (v15)
  {
    v15->_pu_timeAppearance = a5;
    objc_storeStrong((id *)&v15->_pu_timeFontIdentifier, a6);
    objc_storeStrong((id *)&v16->_pu_timeFontColor, a7);
  }

  return v16;
}

- (_PUPosterEditingLook)initWithIdentifier:(id)a3 displayName:(id)a4
{
  id v6;
  id v7;
  _PUPosterEditingLook *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSString *displayName;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PUPosterEditingLook;
  v8 = -[_PUPosterEditingLook init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    displayName = v8->_displayName;
    v8->_displayName = (NSString *)v11;

  }
  return v8;
}

- (_PUPosterEditingLook)initWithDisplayName:(id)a3
{
  return -[_PUPosterEditingLook initWithIdentifier:displayName:](self, "initWithIdentifier:displayName:", a3, a3);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_PUPosterEditingLook identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PUPosterEditingLook displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_PUPosterEditingLook pu_timeAppearance](self, "pu_timeAppearance");
  -[_PUPosterEditingLook pu_timeFontIdentifier](self, "pu_timeFontIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PUPosterEditingLook pu_timeFontColor](self, "pu_timeFontColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier = %@, displayName = %@, timeAppearance = %lu, fontIdentifier = %@, fontColor = %@>"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)pu_timeAppearance
{
  return self->_pu_timeAppearance;
}

- (NSString)pu_timeFontIdentifier
{
  return self->_pu_timeFontIdentifier;
}

- (PRPosterColor)pu_timeFontColor
{
  return self->_pu_timeFontColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pu_timeFontColor, 0);
  objc_storeStrong((id *)&self->_pu_timeFontIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
