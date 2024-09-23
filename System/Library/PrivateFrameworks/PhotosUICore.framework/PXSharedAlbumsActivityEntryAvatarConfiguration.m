@implementation PXSharedAlbumsActivityEntryAvatarConfiguration

- (PXSharedAlbumsActivityEntryAvatarConfiguration)initWithEmail:(id)a3 phone:(id)a4 firstName:(id)a5 lastName:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PXSharedAlbumsActivityEntryAvatarConfiguration *v14;
  uint64_t v15;
  NSString *email;
  uint64_t v17;
  NSString *phone;
  uint64_t v19;
  NSString *firstName;
  uint64_t v21;
  NSString *lastName;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PXSharedAlbumsActivityEntryAvatarConfiguration;
  v14 = -[PXSharedAlbumsActivityEntryAvatarConfiguration init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    email = v14->_email;
    v14->_email = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    phone = v14->_phone;
    v14->_phone = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    firstName = v14->_firstName;
    v14->_firstName = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    lastName = v14->_lastName;
    v14->_lastName = (NSString *)v21;

  }
  return v14;
}

- (NSString)email
{
  return self->_email;
}

- (NSString)phone
{
  return self->_phone;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_phone, 0);
  objc_storeStrong((id *)&self->_email, 0);
}

@end
