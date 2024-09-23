@implementation SharingXPCHelperGroupContactIcon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SharingXPCHelperGroupContactIcon)initWithContacts:(id)a3 iconData:(id)a4 atIndex:(int64_t)a5 cacheLookupKey:(id)a6
{
  id v11;
  SharingXPCHelperGroupContactIcon *v12;
  SharingXPCHelperGroupContactIcon *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SharingXPCHelperGroupContactIcon;
  v12 = -[SharingXPCHelperContactIcon initWithContact:iconData:atIndex:cacheLookupKey:](&v15, "initWithContact:iconData:atIndex:cacheLookupKey:", 0, a4, a5, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_contacts, a3);

  return v13;
}

- (SharingXPCHelperGroupContactIcon)initWithContacts:(id)a3 icon:(CGImage *)a4 atIndex:(int64_t)a5 cacheLookupKey:(id)a6
{
  id v11;
  SharingXPCHelperGroupContactIcon *v12;
  SharingXPCHelperGroupContactIcon *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SharingXPCHelperGroupContactIcon;
  v12 = -[SharingXPCHelperContactIcon initWithContact:icon:atIndex:cacheLookupKey:](&v15, "initWithContact:icon:atIndex:cacheLookupKey:", 0, a4, a5, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_contacts, a3);

  return v13;
}

- (SharingXPCHelperGroupContactIcon)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  SharingXPCHelperGroupContactIcon *v6;
  uint64_t v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SharingXPCHelperGroupContactIcon;
  v6 = -[SharingXPCHelperContactIcon initWithCoder:](&v9, "initWithCoder:", v4);
  if (v6)
  {
    v7 = objc_opt_class(CNContact, v5);
    NSDecodeNSArrayOfClassIfPresent(v4, CFSTR("SharingXPCHelperGroupContactIcon-Contacts"), v7, &v6->_contacts);
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSArray *contacts;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SharingXPCHelperGroupContactIcon;
  -[SharingXPCHelperContactIcon encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  contacts = self->_contacts;
  if (contacts)
    objc_msgSend(v4, "encodeObject:forKey:", contacts, CFSTR("SharingXPCHelperGroupContactIcon-Contacts"));

}

- (id)contactIDs
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SharingXPCHelperGroupContactIcon contacts](self, "contacts", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), "identifier"));
        objc_msgSend(v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortedArrayUsingSelector:", "compare:"));
  return v10;
}

- (id)description
{
  NSArray *contacts;
  void *v4;
  const __CFString *v5;
  id v6;
  id v8;

  v8 = 0;
  contacts = self->_contacts;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SharingXPCHelperContactIcon iconData](self, "iconData"));
  if (v4)
    v5 = CFSTR("has");
  else
    v5 = CFSTR("does not have");
  NSAppendPrintF(&v8, "SharingXPCHelperGroupContactIcon for contacts %{private}@ %@ iconData at index %llu", contacts, v5, -[SharingXPCHelperContactIcon iconIndex](self, "iconIndex"));
  v6 = v8;

  return v6;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contacts, 0);
}

@end
