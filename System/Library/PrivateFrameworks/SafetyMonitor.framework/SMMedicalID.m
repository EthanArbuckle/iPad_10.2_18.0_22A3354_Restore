@implementation SMMedicalID

- (SMMedicalID)init
{
  void *v3;
  void *v4;
  SMMedicalID *v5;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = -[SMMedicalID initWithIdentifier:age:allergiesAndRestrictions:bloodType:height:medicalConditions:medicalNotes:name:primaryLanguage:weight:emergencyContacts:](self, "initWithIdentifier:age:allergiesAndRestrictions:bloodType:height:medicalConditions:medicalNotes:name:primaryLanguage:weight:emergencyContacts:", v3, 0, &stru_251671BC8, &stru_251671BC8, 0, &stru_251671BC8, &stru_251671BC8, &stru_251671BC8, &stru_251671BC8, 0, v4);

  return v5;
}

- (SMMedicalID)initWithIdentifier:(id)a3 age:(int64_t)a4 allergiesAndRestrictions:(id)a5 bloodType:(id)a6 height:(int64_t)a7 medicalConditions:(id)a8 medicalNotes:(id)a9 name:(id)a10 primaryLanguage:(id)a11 weight:(int64_t)a12 emergencyContacts:(id)a13
{
  id v18;
  SMMedicalID *v19;
  SMMedicalID *v20;
  SMMedicalID *v21;
  NSObject *v22;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  objc_super v33;
  uint8_t buf[16];

  v18 = a3;
  v32 = a5;
  v31 = a6;
  v30 = a8;
  v29 = a9;
  v28 = a10;
  v27 = a11;
  v26 = a13;
  if (v18)
  {
    v33.receiver = self;
    v33.super_class = (Class)SMMedicalID;
    v19 = -[SMMedicalID init](&v33, sel_init);
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_identifier, a3);
      v20->_age = a4;
      objc_storeStrong((id *)&v20->_allergiesAndRestrictions, a5);
      objc_storeStrong((id *)&v20->_bloodType, a6);
      v20->_height = a7;
      objc_storeStrong((id *)&v20->_medicalConditions, a8);
      objc_storeStrong((id *)&v20->_medicalNotes, a9);
      objc_storeStrong((id *)&v20->_name, a10);
      objc_storeStrong((id *)&v20->_primaryLanguage, a11);
      v20->_weight = a12;
      objc_storeStrong((id *)&v20->_emergencyContacts, a13);
    }
    self = v20;
    v21 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245521000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", buf, 2u);
    }

    v21 = 0;
  }

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMMedicalID)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  SMMedicalID *v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (int)objc_msgSend(v3, "decodeIntForKey:", CFSTR("age"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allergiesAndRestrictions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bloodType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (int)objc_msgSend(v3, "decodeIntForKey:", CFSTR("height"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("medicalConditions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("medicalNotes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryLanguage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (int)objc_msgSend(v3, "decodeIntForKey:", CFSTR("weight"));
  v11 = (void *)MEMORY[0x24BDBCF20];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v13, CFSTR("emergencyContacts"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[SMMedicalID initWithIdentifier:age:allergiesAndRestrictions:bloodType:height:medicalConditions:medicalNotes:name:primaryLanguage:weight:emergencyContacts:](self, "initWithIdentifier:age:allergiesAndRestrictions:bloodType:height:medicalConditions:medicalNotes:name:primaryLanguage:weight:emergencyContacts:", v19, v18, v4, v5, v17, v6, v7, v8, v9, v10, v14);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[SMMedicalID identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SMMedicalID age](self, "age"), CFSTR("age"));
  -[SMMedicalID allergiesAndRestrictions](self, "allergiesAndRestrictions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("allergiesAndRestrictions"));

  -[SMMedicalID bloodType](self, "bloodType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("bloodType"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SMMedicalID height](self, "height"), CFSTR("height"));
  -[SMMedicalID medicalConditions](self, "medicalConditions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("medicalConditions"));

  -[SMMedicalID medicalNotes](self, "medicalNotes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("medicalNotes"));

  -[SMMedicalID name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("name"));

  -[SMMedicalID primaryLanguage](self, "primaryLanguage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("primaryLanguage"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SMMedicalID weight](self, "weight"), CFSTR("weight"));
  -[SMMedicalID emergencyContacts](self, "emergencyContacts");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("emergencyContacts"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  int64_t v15;
  void *v16;

  v16 = (void *)MEMORY[0x24BDD17C8];
  -[SMMedicalID identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SMMedicalID age](self, "age");
  -[SMMedicalID allergiesAndRestrictions](self, "allergiesAndRestrictions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMMedicalID bloodType](self, "bloodType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SMMedicalID height](self, "height");
  -[SMMedicalID medicalConditions](self, "medicalConditions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMMedicalID medicalNotes](self, "medicalNotes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMMedicalID name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMMedicalID primaryLanguage](self, "primaryLanguage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SMMedicalID weight](self, "weight");
  -[SMMedicalID emergencyContacts](self, "emergencyContacts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("identifier, %@, age, %li, allergiesAndRestrictions, %@, bloodType, %@, height, %li, medicalConditions, %@, medicalNotes, %@, name, %@, primaryLanguage, %@, weight, %li, emergencyContacts, %@"), v3, v15, v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (int64_t)age
{
  return self->_age;
}

- (NSString)allergiesAndRestrictions
{
  return self->_allergiesAndRestrictions;
}

- (NSString)bloodType
{
  return self->_bloodType;
}

- (int64_t)height
{
  return self->_height;
}

- (NSString)medicalConditions
{
  return self->_medicalConditions;
}

- (NSString)medicalNotes
{
  return self->_medicalNotes;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)primaryLanguage
{
  return self->_primaryLanguage;
}

- (int64_t)weight
{
  return self->_weight;
}

- (NSSet)emergencyContacts
{
  return self->_emergencyContacts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emergencyContacts, 0);
  objc_storeStrong((id *)&self->_primaryLanguage, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_medicalNotes, 0);
  objc_storeStrong((id *)&self->_medicalConditions, 0);
  objc_storeStrong((id *)&self->_bloodType, 0);
  objc_storeStrong((id *)&self->_allergiesAndRestrictions, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
