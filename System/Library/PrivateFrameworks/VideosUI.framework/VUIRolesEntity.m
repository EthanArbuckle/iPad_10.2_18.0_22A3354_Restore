@implementation VUIRolesEntity

- (VUIRolesEntity)initWithDictionary:(id)a3
{
  id v4;
  VUIRolesEntity *v5;
  uint64_t v6;
  NSString *type;
  uint64_t v8;
  NSString *roleTitle;
  uint64_t v10;
  NSString *personName;
  uint64_t v12;
  NSString *characterName;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VUIRolesEntity;
  v5 = -[VUIRolesEntity init](&v15, sel_init);
  if (v5 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "vui_stringForKey:", CFSTR("type"));
    v6 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v6;

    objc_msgSend(v4, "vui_stringForKey:", CFSTR("roleTitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    roleTitle = v5->_roleTitle;
    v5->_roleTitle = (NSString *)v8;

    objc_msgSend(v4, "vui_stringForKey:", CFSTR("personName"));
    v10 = objc_claimAutoreleasedReturnValue();
    personName = v5->_personName;
    v5->_personName = (NSString *)v10;

    objc_msgSend(v4, "vui_stringForKey:", CFSTR("characterName"));
    v12 = objc_claimAutoreleasedReturnValue();
    characterName = v5->_characterName;
    v5->_characterName = (NSString *)v12;

  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Role type: %@, title: %@, person: %@, character: %@ "), self->_type, self->_roleTitle, self->_personName, self->_characterName);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSString)roleTitle
{
  return self->_roleTitle;
}

- (void)setRoleTitle:(id)a3
{
  objc_storeStrong((id *)&self->_roleTitle, a3);
}

- (NSString)personName
{
  return self->_personName;
}

- (void)setPersonName:(id)a3
{
  objc_storeStrong((id *)&self->_personName, a3);
}

- (NSString)characterName
{
  return self->_characterName;
}

- (void)setCharacterName:(id)a3
{
  objc_storeStrong((id *)&self->_characterName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characterName, 0);
  objc_storeStrong((id *)&self->_personName, 0);
  objc_storeStrong((id *)&self->_roleTitle, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
