@implementation PXPeopleNameSelection

- (PXPeopleNameSelection)initWithName:(id)a3
{
  return -[PXPeopleNameSelection initWithName:contact:person:type:](self, "initWithName:contact:person:type:", a3, 0, 0, 3);
}

- (PXPeopleNameSelection)initWithContact:(id)a3
{
  return -[PXPeopleNameSelection initWithName:contact:person:type:](self, "initWithName:contact:person:type:", 0, a3, 0, 2);
}

- (PXPeopleNameSelection)initWithSelectedPerson:(id)a3
{
  return -[PXPeopleNameSelection initWithName:contact:person:type:](self, "initWithName:contact:person:type:", 0, 0, a3, 1);
}

- (PXPeopleNameSelection)initWithName:(id)a3 contact:(id)a4 person:(id)a5 type:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  PXPeopleNameSelection *v14;
  PXPeopleNameSelection *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PXPeopleNameSelection;
  v14 = -[PXPeopleNameSelection init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_name, a3);
    objc_storeStrong((id *)&v15->_contact, a4);
    objc_storeStrong((id *)&v15->_person, a5);
    v15->_selectionType = a6;
  }

  return v15;
}

- (void)setLinkedPerson:(id)a3
{
  id v5;

  v5 = a3;
  if (-[PXPeopleNameSelection selectionType](self, "selectionType") == 2)
    objc_storeStrong((id *)&self->_person, a3);

}

- (NSString)localizedName
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[PXPeopleNameSelection selectionType](self, "selectionType");
  switch(v3)
  {
    case 1uLL:
      -[PXPeopleNameSelection person](self, "person");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "px_localizedName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

      return (NSString *)v4;
    case 2uLL:
      -[PXPeopleNameSelection contact](self, "contact");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD16C0], "px_localizedNameFromContact:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "length"))
      {
        v7 = v6;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CD16C0], "fullNameFromContact:", v5);
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      v4 = v7;

      goto LABEL_11;
    case 3uLL:
      -[PXPeopleNameSelection name](self, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = 0;
      break;
  }
  return (NSString *)v4;
}

- (NSString)fullName
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[PXPeopleNameSelection selectionType](self, "selectionType");
  switch(v3)
  {
    case 1uLL:
      -[PXPeopleNameSelection person](self, "person");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 2uLL:
      v6 = (void *)MEMORY[0x1E0CD16C0];
      -[PXPeopleNameSelection contact](self, "contact");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fullNameFromContact:", v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 3uLL:
      -[PXPeopleNameSelection name](self, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = 0;
      break;
  }
  return (NSString *)v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXPeopleNameSelection;
  -[PXPeopleNameSelection description](&v11, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[PXPeopleNameSelection _selectionTypeString](self, "_selectionTypeString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(": selectionType: %@, "), v5);

  -[PXPeopleNameSelection person](self, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("person: %@, "), v6);

  -[PXPeopleNameSelection contact](self, "contact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("contact: %@, "), v7);

  -[PXPeopleNameSelection name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("name: %@, "), v8);

  -[PXPeopleNameSelection localizedName](self, "localizedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("localizedName: %@"), v9);

  return v4;
}

- (id)_selectionTypeString
{
  unint64_t v2;

  v2 = -[PXPeopleNameSelection selectionType](self, "selectionType");
  if (v2 - 1 > 2)
    return CFSTR("PXPeopleNameSelectionTypeNone");
  else
    return off_1E5139070[v2 - 1];
}

- (unint64_t)selectionType
{
  return self->_selectionType;
}

- (PXPerson)person
{
  return self->_person;
}

- (CNContact)contact
{
  return self->_contact;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

@end
