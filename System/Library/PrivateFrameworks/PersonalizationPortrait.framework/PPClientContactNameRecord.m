@implementation PPClientContactNameRecord

- (PPClientContactNameRecord)initWithIdentifier:(id)a3 score:(double)a4 source:(unsigned __int8)a5 sourceIdentifier:(id)a6 changeType:(unsigned __int8)a7 firstName:(id)a8 phoneticFirstName:(id)a9 middleName:(id)a10 phoneticMiddleName:(id)a11 lastName:(id)a12 phoneticLastName:(id)a13 organizationName:(id)a14 jobTitle:(id)a15 nickname:(id)a16 relatedNames:(id)a17 streetNames:(id)a18 cityNames:(id)a19
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id *v28;
  PPClientContactNameRecord *v29;
  id v34;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  objc_super v45;

  v44 = a3;
  v43 = a6;
  v34 = a8;
  v42 = a8;
  v41 = a9;
  v40 = a10;
  v39 = a11;
  v38 = a12;
  v37 = a13;
  v36 = a14;
  v23 = a15;
  v24 = a16;
  v25 = a17;
  v26 = a18;
  v27 = a19;
  v45.receiver = self;
  v45.super_class = (Class)PPClientContactNameRecord;
  v28 = -[PPContactNameRecord init_](&v45, sel_init_);
  v29 = (PPClientContactNameRecord *)v28;
  if (v28)
  {
    objc_storeStrong(v28 + 1, a3);
    v29->_score = a4;
    v29->_source = a5;
    objc_storeStrong((id *)&v29->_sourceIdentifier, a6);
    v29->_changeType = a7;
    objc_storeStrong((id *)&v29->_firstName, v34);
    objc_storeStrong((id *)&v29->_phoneticFirstName, a9);
    objc_storeStrong((id *)&v29->_middleName, a10);
    objc_storeStrong((id *)&v29->_phoneticMiddleName, a11);
    objc_storeStrong((id *)&v29->_lastName, a12);
    objc_storeStrong((id *)&v29->_phoneticLastName, a13);
    objc_storeStrong((id *)&v29->_organizationName, a14);
    objc_storeStrong((id *)&v29->_jobTitle, a15);
    objc_storeStrong((id *)&v29->_nickname, a16);
    objc_storeStrong((id *)&v29->_relatedNames, a17);
    objc_storeStrong((id *)&v29->_streetNames, a18);
    objc_storeStrong((id *)&v29->_cityNames, a19);
  }

  return v29;
}

- (id)identifier
{
  return self->_identifier;
}

- (double)score
{
  return self->_score;
}

- (unsigned)source
{
  return self->_source;
}

- (unsigned)changeType
{
  return self->_changeType;
}

- (id)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (id)firstName
{
  return self->_firstName;
}

- (id)phoneticFirstName
{
  return self->_phoneticFirstName;
}

- (id)middleName
{
  return self->_middleName;
}

- (id)phoneticMiddleName
{
  return self->_phoneticMiddleName;
}

- (id)lastName
{
  return self->_lastName;
}

- (id)phoneticLastName
{
  return self->_phoneticLastName;
}

- (id)organizationName
{
  return self->_organizationName;
}

- (id)jobTitle
{
  return self->_jobTitle;
}

- (id)nickname
{
  return self->_nickname;
}

- (id)relatedNames
{
  return self->_relatedNames;
}

- (id)streetNames
{
  return self->_streetNames;
}

- (id)cityNames
{
  return self->_cityNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cityNames, 0);
  objc_storeStrong((id *)&self->_streetNames, 0);
  objc_storeStrong((id *)&self->_relatedNames, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_jobTitle, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_phoneticLastName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_phoneticMiddleName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_phoneticFirstName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
