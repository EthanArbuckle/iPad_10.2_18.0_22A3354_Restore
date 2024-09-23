@implementation PKPeerPaymentPreferencesUpdateRequest

- (PKPeerPaymentPreferencesUpdateRequest)initWithUpdatedPreferences:(id)a3 section:(int64_t)a4
{
  id v7;
  PKPeerPaymentPreferencesUpdateRequest *v8;
  NSMutableSet *v9;
  NSMutableSet *sections;
  NSMutableSet *v11;
  void *v12;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPeerPaymentPreferencesUpdateRequest;
  v8 = -[PKPeerPaymentPreferencesUpdateRequest init](&v14, sel_init);
  if (v8)
  {
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    sections = v8->_sections;
    v8->_sections = v9;

    v11 = v8->_sections;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](v11, "addObject:", v12);

    objc_storeStrong((id *)&v8->_updatedPreferences, a3);
  }

  return v8;
}

- (void)coalesceWithRequest:(id)a3
{
  id v4;
  PKPeerPaymentPreferences *v5;
  PKPeerPaymentPreferences *updatedPreferences;
  NSMutableSet *sections;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "updatedPreferences");
  v5 = (PKPeerPaymentPreferences *)objc_claimAutoreleasedReturnValue();
  updatedPreferences = self->_updatedPreferences;
  self->_updatedPreferences = v5;

  sections = self->_sections;
  objc_msgSend(v4, "sections");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableSet unionSet:](sections, "unionSet:", v8);
}

- (id)description
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("updatedPreferences: '%@'; "), self->_updatedPreferences);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (PKPeerPaymentPreferences)updatedPreferences
{
  return self->_updatedPreferences;
}

- (NSSet)sections
{
  return &self->_sections->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedPreferences, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
