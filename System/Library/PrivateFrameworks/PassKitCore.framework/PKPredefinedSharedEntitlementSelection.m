@implementation PKPredefinedSharedEntitlementSelection

- (PKPredefinedSharedEntitlementSelection)init
{

  return 0;
}

- (PKPredefinedSharedEntitlementSelection)initWithTitle:(id)a3 description:(id)a4 sharedEntitlements:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKPredefinedSharedEntitlementSelection *v11;
  uint64_t v12;
  NSString *localizedTitle;
  uint64_t v14;
  NSString *localizedDescription;
  uint64_t v16;
  NSArray *sharedEntitlements;
  uint64_t v18;
  NSString *identifier;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PKPredefinedSharedEntitlementSelection;
  v11 = -[PKPredefinedSharedEntitlementSelection init](&v21, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    localizedTitle = v11->_localizedTitle;
    v11->_localizedTitle = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    localizedDescription = v11->_localizedDescription;
    v11->_localizedDescription = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    sharedEntitlements = v11->_sharedEntitlements;
    v11->_sharedEntitlements = (NSArray *)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-%@-%lu"), v8, v9, -[NSArray count](v11->_sharedEntitlements, "count"));
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v18;

  }
  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (NSString)iconName
{
  return self->_iconName;
}

- (NSArray)sharedEntitlements
{
  return self->_sharedEntitlements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedEntitlements, 0);
  objc_storeStrong((id *)&self->_iconName, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
