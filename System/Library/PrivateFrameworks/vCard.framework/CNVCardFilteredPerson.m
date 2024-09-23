@implementation CNVCardFilteredPerson

+ (id)os_log
{
  if (os_log_cn_once_token_1_1 != -1)
    dispatch_once(&os_log_cn_once_token_1_1, &__block_literal_global_6);
  return (id)os_log_cn_once_object_1_1;
}

void __31__CNVCardFilteredPerson_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNVCardFilteredPerson");
  v1 = (void *)os_log_cn_once_object_1_1;
  os_log_cn_once_object_1_1 = (uint64_t)v0;

}

+ (id)filteredPersonWithPerson:(id)a3 scope:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEmpty"))
    v8 = v6;
  else
    v8 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithPerson:scope:", v6, v7);
  v9 = v8;

  return v9;
}

- (CNVCardFilteredPerson)initWithPerson:(id)a3 scope:(id)a4
{
  id v7;
  id v8;
  CNVCardFilteredPerson *v9;
  CNVCardFilteredPerson *v10;
  CNVCardFilteredPerson *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNVCardFilteredPerson;
  v9 = -[CNVCardFilteredPerson init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_person, a3);
    objc_storeStrong((id *)&v10->_scope, a4);
    v11 = v10;
  }

  return v10;
}

- (NSString)firstName
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("First"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson firstName](self->_person, "firstName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (NSString)lastName
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("Last"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson lastName](self->_person, "lastName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (NSString)middleName
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("Middle"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson middleName](self->_person, "middleName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (NSString)title
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("Title"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson title](self->_person, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (NSString)suffix
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("Suffix"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson suffix](self->_person, "suffix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (NSString)nickname
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("Nickname"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson nickname](self->_person, "nickname");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (NSString)maidenName
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_cn_any:", &__block_literal_global_4_0);

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson maidenName](self->_person, "maidenName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (NSString)phoneticFirstName
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("FirstPhonetic"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson phoneticFirstName](self->_person, "phoneticFirstName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (NSString)phoneticMiddleName
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("MiddlePhonetic"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson phoneticMiddleName](self->_person, "phoneticMiddleName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (NSString)phoneticLastName
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("LastPhonetic"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson phoneticLastName](self->_person, "phoneticLastName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (NSString)pronunciationFirstName
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("FirstPronunciation"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson pronunciationFirstName](self->_person, "pronunciationFirstName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (NSString)pronunciationLastName
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("LastPronunciation"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson pronunciationLastName](self->_person, "pronunciationLastName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (NSArray)addressingGrammars
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v7;
  void *v8;
  uint8_t v9[16];

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("AddressingGrammar"));

  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D3C07000, v5, OS_LOG_TYPE_DEFAULT, "Excluding pronouns from VCard", v9, 2u);
    }

    return (NSArray *)0;
  }
  else
  {
    -[CNVCardPerson addressingGrammars](self->_person, "addressingGrammars");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVCardFilteredPerson filterItems:property:](self, "filterItems:property:", v7, CFSTR("AddressingGrammar"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSArray *)v8;
  }
}

- (NSString)organization
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("Organization"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson organization](self->_person, "organization");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (NSString)phoneticOrganization
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("OrganizationPhonetic"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson phoneticOrganization](self->_person, "phoneticOrganization");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (NSString)department
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("ABDepartment"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson department](self->_person, "department");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (NSString)jobTitle
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("JobTitle"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson jobTitle](self->_person, "jobTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (BOOL)isMe
{
  return -[CNVCardPerson isMe](self->_person, "isMe");
}

- (BOOL)isCompany
{
  return -[CNVCardPerson isCompany](self->_person, "isCompany");
}

- (int)nameOrder
{
  return -[CNVCardPerson nameOrder](self->_person, "nameOrder");
}

- (NSArray)emailAddresses
{
  void *v3;
  void *v4;

  -[CNVCardPerson emailAddresses](self->_person, "emailAddresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardFilteredPerson filterItems:property:](self, "filterItems:property:", v3, CFSTR("Email"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)phoneNumbers
{
  void *v3;
  void *v4;

  -[CNVCardPerson phoneNumbers](self->_person, "phoneNumbers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardFilteredPerson filterItems:property:](self, "filterItems:property:", v3, CFSTR("Phone"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)postalAddresses
{
  void *v3;
  void *v4;

  -[CNVCardPerson postalAddresses](self->_person, "postalAddresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardFilteredPerson filterItems:property:](self, "filterItems:property:", v3, CFSTR("Address"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)socialProfiles
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[CNVCardPerson socialProfiles](self->_person, "socialProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[CNVCardFilteredPersonScope filterOptions](self->_scope, "filterOptions") & 1) == 0)
  {
    objc_msgSend(v3, "_cn_map:", &__block_literal_global_6);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  -[CNVCardFilteredPerson filterItems:property:](self, "filterItems:property:", v3, CFSTR("SocialProfile"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

id __39__CNVCardFilteredPerson_socialProfiles__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeObjectForKey:", CFSTR("bundleIdentifiers"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("teamIdentifier"));
  objc_msgSend(v2, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNVCardPropertyItem itemWithValue:label:identifier:](CNVCardPropertyItem, "itemWithValue:label:identifier:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)instantMessagingAddresses
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[CNVCardPerson instantMessagingAddresses](self->_person, "instantMessagingAddresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[CNVCardFilteredPersonScope filterOptions](self->_scope, "filterOptions") & 1) == 0)
  {
    objc_msgSend(v3, "_cn_map:", &__block_literal_global_7);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  -[CNVCardFilteredPerson filterItems:property:](self, "filterItems:property:", v3, CFSTR("InstantMessage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

id __50__CNVCardFilteredPerson_instantMessagingAddresses__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeObjectForKey:", CFSTR("teamIdentifier"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("bundleIdentifiers"));
  objc_msgSend(v2, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNVCardPropertyItem itemWithValue:label:identifier:](CNVCardPropertyItem, "itemWithValue:label:identifier:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)urls
{
  void *v3;
  void *v4;

  -[CNVCardPerson urls](self->_person, "urls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardFilteredPerson filterItems:property:](self, "filterItems:property:", v3, CFSTR("URLs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)calendarURIs
{
  void *v3;
  void *v4;

  -[CNVCardPerson calendarURIs](self->_person, "calendarURIs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardFilteredPerson filterItems:property:](self, "filterItems:property:", v3, CFSTR("calendarURIs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSDictionary)activityAlerts
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("ActivityAlert"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson activityAlerts](self->_person, "activityAlerts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDictionary *)v5;
}

- (id)filterItems:(id)a3 property:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  CNVCardFilteredPerson *v12;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__CNVCardFilteredPerson_filterItems_property___block_invoke;
  v10[3] = &unk_1E956FB00;
  v11 = v6;
  v12 = self;
  v7 = v6;
  objc_msgSend(a3, "_cn_filter:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __46__CNVCardFilteredPerson_filterItems_property___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "excludedFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6) ^ 1;

  return v8;
}

- (NSArray)imageReferences
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("com.apple.image.thumbnail"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson imageReferences](self->_person, "imageReferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)v5;
}

- (NSDictionary)imageCropRects
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("com.apple.image.thumbnail"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson imageCropRects](self->_person, "imageCropRects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDictionary *)v5;
}

- (NSDictionary)largeImageCropRects
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("com.apple.image.thumbnail"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson largeImageCropRects](self->_person, "largeImageCropRects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDictionary *)v5;
}

- (NSData)largeImageData
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("com.apple.image.thumbnail"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson largeImageData](self->_person, "largeImageData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSData *)v5;
}

- (NSData)imageData
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("com.apple.image.thumbnail"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson imageData](self->_person, "imageData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSData *)v5;
}

- (id)largeImageHashOfType:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", CFSTR("com.apple.image.thumbnail"));

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[CNVCardPerson largeImageHashOfType:](self->_person, "largeImageHashOfType:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (NSData)wallpaper
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("wallpaper"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson wallpaper](self->_person, "wallpaper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSData *)v5;
}

- (NSData)watchWallpaperImageData
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("watchWallpaperImageData"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson watchWallpaperImageData](self->_person, "watchWallpaperImageData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSData *)v5;
}

- (int)sharedPhotoDisplayPreference
{
  void *v3;
  char v4;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("sharedPhotoDisplayPreference"));

  if ((v4 & 1) != 0)
    return 0;
  else
    return -[CNVCardPerson sharedPhotoDisplayPreference](self->_person, "sharedPhotoDisplayPreference");
}

- (NSData)imageBackgroundColorsData
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("imageBackgroundColorsData"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson imageBackgroundColorsData](self->_person, "imageBackgroundColorsData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSData *)v5;
}

- (NSData)sensitiveContentConfiguration
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("sensitiveContentConfiguration"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson sensitiveContentConfiguration](self->_person, "sensitiveContentConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSData *)v5;
}

- (NSDateComponents)birthdayComponents
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_cn_any:", &__block_literal_global_11);

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson birthdayComponents](self->_person, "birthdayComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDateComponents *)v5;
}

- (NSDateComponents)alternateBirthdayComponents
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_cn_any:", &__block_literal_global_12);

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson alternateBirthdayComponents](self->_person, "alternateBirthdayComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDateComponents *)v5;
}

- (NSArray)otherDateComponents
{
  void *v3;
  void *v4;

  -[CNVCardPerson otherDateComponents](self->_person, "otherDateComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardFilteredPerson filterItems:property:](self, "filterItems:property:", v3, CFSTR("ABDateComponents"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)relatedNames
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("ABRelatedNames"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson relatedNames](self->_person, "relatedNames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVCardFilteredPerson filterItems:property:](self, "filterItems:property:", v6, CFSTR("ABRelatedNames"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSArray *)v5;
}

- (NSString)note
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("Note"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson note](self->_person, "note");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (NSArray)namesOfParentGroups
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("ABParentGroups"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson namesOfParentGroups](self->_person, "namesOfParentGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)v5;
}

- (NSString)cardDAVUID
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("externalUUID"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson cardDAVUID](self->_person, "cardDAVUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (NSString)uid
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("UID"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson uid](self->_person, "uid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (NSString)phonemeData
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("PhonemeData"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson phonemeData](self->_person, "phonemeData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (NSString)preferredLikenessSource
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("PreferredLikenessSource"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson preferredLikenessSource](self->_person, "preferredLikenessSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (NSString)preferredApplePersonaIdentifier
{
  void *v3;
  char v4;
  void *v5;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("PreferredApplePersonaIdentifier"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNVCardPerson preferredApplePersonaIdentifier](self->_person, "preferredApplePersonaIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (int)downtimeWhitelistAuthorization
{
  void *v3;
  char v4;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("GuardianWhitelisted"));

  if ((v4 & 1) != 0)
    return 0;
  else
    return -[CNVCardPerson downtimeWhitelistAuthorization](self->_person, "downtimeWhitelistAuthorization");
}

- (NSString)imageType
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "containsObject:", CFSTR("com.apple.image.thumbnail")))
  {

  }
  else
  {
    -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", CFSTR("imageType"));

    if ((v5 & 1) == 0)
    {
      -[CNVCardPerson imageType](self->_person, "imageType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return (NSString *)v6;
    }
  }
  v6 = 0;
  return (NSString *)v6;
}

- (NSData)imageHash
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "containsObject:", CFSTR("com.apple.image.thumbnail")))
  {

  }
  else
  {
    -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", CFSTR("imageHash"));

    if ((v5 & 1) == 0)
    {
      -[CNVCardPerson imageHash](self->_person, "imageHash");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return (NSData *)v6;
    }
  }
  v6 = 0;
  return (NSData *)v6;
}

- (NSData)memojiMetadata
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "containsObject:", CFSTR("com.apple.image.thumbnail")))
  {

  }
  else
  {
    -[CNVCardFilteredPersonScope excludedFields](self->_scope, "excludedFields");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", CFSTR("memojiMetadata"));

    if ((v5 & 1) == 0)
    {
      -[CNVCardPerson memojiMetadata](self->_person, "memojiMetadata");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return (NSData *)v6;
    }
  }
  v6 = 0;
  return (NSData *)v6;
}

- (NSArray)unknownProperties
{
  return -[CNVCardPerson unknownProperties](self->_person, "unknownProperties");
}

- (CNVCardPerson)person
{
  return self->_person;
}

- (CNVCardFilteredPersonScope)scope
{
  return self->_scope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

@end
