@implementation SMEmergencyContact

- (SMEmergencyContact)init
{
  void *v3;
  SMEmergencyContact *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[SMEmergencyContact initWithIdentifier:name:phoneNumber:](self, "initWithIdentifier:name:phoneNumber:", v3, &stru_251671BC8, &stru_251671BC8);

  return v4;
}

- (SMEmergencyContact)initWithIdentifier:(id)a3 name:(id)a4 phoneNumber:(id)a5
{
  id v9;
  id v10;
  id v11;
  SMEmergencyContact *v12;
  id *p_isa;
  SMEmergencyContact *v14;
  NSObject *v15;
  objc_super v17;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    v17.receiver = self;
    v17.super_class = (Class)SMEmergencyContact;
    v12 = -[SMEmergencyContact init](&v17, sel_init);
    p_isa = (id *)&v12->super.isa;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_identifier, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
    }
    self = p_isa;
    v14 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245521000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", buf, 2u);
    }

    v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMEmergencyContact)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SMEmergencyContact *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SMEmergencyContact initWithIdentifier:name:phoneNumber:](self, "initWithIdentifier:name:phoneNumber:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SMEmergencyContact identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[SMEmergencyContact name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("name"));

  -[SMEmergencyContact phoneNumber](self, "phoneNumber");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("phoneNumber"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SMEmergencyContact identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMEmergencyContact name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMEmergencyContact phoneNumber](self, "phoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("objectId, %@, name, %@, phoneNumber, %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
