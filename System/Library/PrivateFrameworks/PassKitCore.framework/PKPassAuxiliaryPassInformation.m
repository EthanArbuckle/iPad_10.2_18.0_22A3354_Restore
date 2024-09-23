@implementation PKPassAuxiliaryPassInformation

- (PKPassAuxiliaryPassInformation)initWithInformation:(id)a3 bundle:(id)a4 privateBundle:(id)a5 passType:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  PKPassAuxiliaryPassInformation *v13;
  uint64_t v14;
  NSString *identifier;
  void *v16;
  uint64_t v17;
  NSString *title;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  PKPassAuxiliaryPassInformationItem *v25;
  uint64_t v26;
  NSArray *items;
  PKPassAuxiliaryPassInformation *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v34.receiver = self;
  v34.super_class = (Class)PKPassAuxiliaryPassInformation;
  v13 = -[PKPassAuxiliaryPassInformation init](&v34, sel_init);
  if (v13)
  {
    objc_msgSend(v10, "PKStringForKey:", CFSTR("identifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    objc_msgSend(v10, "PKStringForKey:", CFSTR("title"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPassStringForPassBundle(v16, v11, v12);
    v17 = objc_claimAutoreleasedReturnValue();
    title = v13->_title;
    v29 = v13;
    v13->_title = (NSString *)v17;

    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v10, "objectForKey:", CFSTR("values"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v31 != v23)
            objc_enumerationMutation(v20);
          v25 = -[PKPassAuxiliaryPassInformationItem initWithItemInformation:bundle:privateBundle:passType:]([PKPassAuxiliaryPassInformationItem alloc], "initWithItemInformation:bundle:privateBundle:passType:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i), v11, v12, a6);
          objc_msgSend(v19, "safelyAddObject:", v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v22);
    }

    v26 = objc_msgSend(v19, "copy");
    v13 = v29;
    items = v29->_items;
    v29->_items = (NSArray *)v26;

  }
  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_title, "hash") - v3 + 32 * v3;
  return -[NSArray hash](self->_items, "hash") - v4 + 32 * v4 + 506447;
}

- (PKPassAuxiliaryPassInformation)initWithCoder:(id)a3
{
  id v4;
  PKPassAuxiliaryPassInformation *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *title;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *items;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPassAuxiliaryPassInformation;
  v5 = -[PKPassAuxiliaryPassInformation init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("values"));
    v13 = objc_claimAutoreleasedReturnValue();
    items = v5->_items;
    v5->_items = (NSArray *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_items, CFSTR("values"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPassAuxiliaryPassInformation *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSArray *items;

  v5 = -[PKPassAuxiliaryPassInformation init](+[PKPassAuxiliaryPassInformation allocWithZone:](PKPassAuxiliaryPassInformation, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  title = v5->_title;
  v5->_title = (NSString *)v8;

  v10 = -[NSArray copyWithZone:](self->_items, "copyWithZone:", a3);
  items = v5->_items;
  v5->_items = (NSArray *)v10;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("title: '%@'; "), self->_title);
  objc_msgSend(v3, "appendFormat:", CFSTR("items: '%@'; "), self->_items);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
