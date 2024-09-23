@implementation SharingXPCHelperContactIcon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SharingXPCHelperContactIcon)initWithContact:(id)a3 iconData:(id)a4 atIndex:(int64_t)a5 cacheLookupKey:(id)a6
{
  id v11;
  SharingXPCHelperContactIcon *v12;
  SharingXPCHelperContactIcon *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SharingXPCHelperContactIcon;
  v12 = -[SharingXPCHelperImageItem initWithImageTitle:imageData:cacheLookupKey:](&v15, "initWithImageTitle:imageData:cacheLookupKey:", 0, a4, a6);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contact, a3);
    v13->_iconIndex = a5;
  }

  return v13;
}

- (SharingXPCHelperContactIcon)initWithContact:(id)a3 icon:(CGImage *)a4 atIndex:(int64_t)a5 cacheLookupKey:(id)a6
{
  id v11;
  SharingXPCHelperContactIcon *v12;
  SharingXPCHelperContactIcon *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SharingXPCHelperContactIcon;
  v12 = -[SharingXPCHelperImageItem initWithImageTitle:image:cacheLookupKey:](&v15, "initWithImageTitle:image:cacheLookupKey:", 0, a4, a6);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contact, a3);
    v13->_iconIndex = a5;
  }

  return v13;
}

- (SharingXPCHelperContactIcon)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  SharingXPCHelperContactIcon *v6;
  uint64_t v7;
  id v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SharingXPCHelperContactIcon;
  v6 = -[SharingXPCHelperImageItem initWithCoder:](&v10, "initWithCoder:", v4);
  if (v6)
  {
    v7 = objc_opt_class(CNContact, v5);
    NSDecodeObjectIfPresent(v4, CFSTR("cn"), v7, &v6->_contact);
    v8 = v4;
    if (objc_msgSend(v8, "containsValueForKey:", CFSTR("ici")))
      v6->_iconIndex = (int64_t)objc_msgSend(v8, "decodeIntegerForKey:", CFSTR("ici"));

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CNContact *contact;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SharingXPCHelperContactIcon;
  -[SharingXPCHelperImageItem encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  contact = self->_contact;
  if (contact)
    objc_msgSend(v4, "encodeObject:forKey:", contact, CFSTR("cn"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_iconIndex, CFSTR("ici"));

}

- (id)contactIDs
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  uint8_t v13[16];
  __CFString *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharingXPCHelperContactIcon contact](self, "contact"));

  if (!v3)
  {
    v4 = sharingXPCHelperLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "monogramImagesForMultipleContacts called with nil contact, will use fallback.", v13, 2u);
    }

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SharingXPCHelperContactIcon contact](self, "contact"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v8 = (void *)v7;
  v9 = CFSTR("FALLBACK");
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  v14 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));

  return v11;
}

- (id)description
{
  CNContact *contact;
  void *v4;
  const __CFString *v5;
  id v6;
  id v8;

  v8 = 0;
  contact = self->_contact;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SharingXPCHelperContactIcon iconData](self, "iconData"));
  v5 = CFSTR("has");
  if (!v4)
    v5 = CFSTR("does not have");
  NSAppendPrintF(&v8, "SharingXPCHelperContactIcon for contact %{private}@ %@ iconData at index %llu", contact, v5, self->_iconIndex);
  v6 = v8;

  return v6;
}

- (CNContact)contact
{
  return self->_contact;
}

- (int64_t)iconIndex
{
  return self->_iconIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
