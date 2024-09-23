@implementation WBSTabEntity

- (WBSTabEntity)initWithUUID:(id)a3 title:(id)a4 address:(id)a5 isPrivate:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  WBSTabEntity *v13;
  uint64_t v14;
  NSUUID *uuid;
  uint64_t v16;
  NSString *title;
  uint64_t v18;
  NSString *address;
  WBSTabEntity *v20;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)WBSTabEntity;
  v13 = -[WBSTabEntity init](&v22, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    uuid = v13->_uuid;
    v13->_uuid = (NSUUID *)v14;

    v16 = objc_msgSend(v11, "copy");
    title = v13->_title;
    v13->_title = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    address = v13->_address;
    v13->_address = (NSString *)v18;

    v13->_isPrivate = a6;
    v20 = v13;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (unsigned __int8 *)v4;
    v6 = WBSIsEqual()
      && WBSIsEqual()
      && WBSIsEqual()
      && v5[8] == self->_isPrivate;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_uuid, "hash");
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)address
{
  return self->_address;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
