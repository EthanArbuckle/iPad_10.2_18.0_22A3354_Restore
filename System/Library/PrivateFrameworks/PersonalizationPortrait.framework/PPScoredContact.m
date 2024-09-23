@implementation PPScoredContact

- (PPScoredContact)initWithContact:(id)a3 scoredPhoneNumbers:(id)a4 scoredEmailAddresses:(id)a5 scoredSocialProfiles:(id)a6 scoredPostalAddresses:(id)a7 score:(double)a8 flags:(unsigned __int8)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  PPScoredContact *v20;
  PPScoredContact *v21;
  id v24;
  objc_super v25;

  v24 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v25.receiver = self;
  v25.super_class = (Class)PPScoredContact;
  v20 = -[PPScoredContact init](&v25, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_contact, a3);
    objc_storeStrong((id *)&v21->_scoredPhoneNumbers, a4);
    objc_storeStrong((id *)&v21->_scoredEmailAddresses, a5);
    objc_storeStrong((id *)&v21->_scoredSocialProfiles, a6);
    objc_storeStrong((id *)&v21->_scoredPostalAddresses, a7);
    v21->_score = a8;
    v21->_flags = a9;
  }

  return v21;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<PPScoredContact c:%@ p:%@ e:%@ so:%@ ps:%@ s:%f f:%u>"), self->_contact, self->_scoredPhoneNumbers, self->_scoredEmailAddresses, self->_scoredSocialProfiles, self->_scoredPostalAddresses, *(_QWORD *)&self->_score, self->_flags);
}

- (int64_t)compare:(id)a3
{
  id v4;
  double score;
  double v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  score = self->_score;
  objc_msgSend(v4, "score");
  v7 = +[PPUtils compareDouble:withDouble:](PPUtils, "compareDouble:withDouble:", score, v6);
  if (!v7)
  {
    -[PPContact familyName](self->_contact, "familyName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "familyName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "compare:", v10);

    if (!v7)
    {
      -[PPContact givenName](self->_contact, "givenName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contact");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "givenName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v11, "compare:", v13);

      if (!v7)
      {
        -[PPContact middleName](self->_contact, "middleName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "contact");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "middleName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v14, "compare:", v16);

        if (!v7)
        {
          -[PPContact identifier](self->_contact, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "contact");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v17, "compare:", v19);

        }
      }
    }
  }

  return v7;
}

- (int64_t)reverseCompare:(id)a3
{
  return objc_msgSend(a3, "compare:", self);
}

- (PPScoredContact)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  PPScoredContact *v15;
  double v16;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D7805AC]();
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("con"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("sph"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("sem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("ssp"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("spo"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = 0;
  if (v9 && v10 && v11 && v12 && v13)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("sco"));
    self = -[PPScoredContact initWithContact:scoredPhoneNumbers:scoredEmailAddresses:scoredSocialProfiles:scoredPostalAddresses:score:flags:](self, "initWithContact:scoredPhoneNumbers:scoredEmailAddresses:scoredSocialProfiles:scoredPostalAddresses:score:flags:", v9, v10, v11, v12, v14, objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("fla")), v16);
    v15 = self;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  PPContact *contact;
  id v5;

  contact = self->_contact;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contact, CFSTR("con"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scoredPhoneNumbers, CFSTR("sph"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scoredEmailAddresses, CFSTR("sem"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scoredSocialProfiles, CFSTR("ssp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scoredPostalAddresses, CFSTR("spo"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("sco"), self->_score);
  objc_msgSend(v5, "encodeInt32:forKey:", self->_flags, CFSTR("fla"));

}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v3 = -[PPContact hash](self->_contact, "hash");
  v4 = -[NSArray hash](self->_scoredPhoneNumbers, "hash") - v3 + 32 * v3;
  v5 = -[NSArray hash](self->_scoredEmailAddresses, "hash") - v4 + 32 * v4;
  v6 = -[NSArray hash](self->_scoredSocialProfiles, "hash") - v5 + 32 * v5;
  v7 = -[NSArray hash](self->_scoredPostalAddresses, "hash") - v6 + 32 * v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash") - v7 + 32 * v7;

  return self->_flags - v9 + 32 * v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_opt_class();
  v6 = -[PPContact copyWithZone:](self->_contact, "copyWithZone:", a3);
  v7 = (void *)-[NSArray copyWithZone:](self->_scoredPhoneNumbers, "copyWithZone:", a3);
  v8 = (void *)-[NSArray copyWithZone:](self->_scoredEmailAddresses, "copyWithZone:", a3);
  v9 = (void *)-[NSArray copyWithZone:](self->_scoredSocialProfiles, "copyWithZone:", a3);
  v10 = (void *)-[NSArray copyWithZone:](self->_scoredPostalAddresses, "copyWithZone:", a3);
  objc_msgSend(v5, "scoredContactWithContact:scoredPhoneNumbers:scoredEmailAddresses:scoredSocialProfiles:scoredPostalAddresses:score:flags:", v6, v7, v8, v9, v10, self->_flags, self->_score);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  PPScoredContact *v4;
  PPScoredContact *v5;
  BOOL v6;

  v4 = (PPScoredContact *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPScoredContact isEqualToScoredContact:](self, "isEqualToScoredContact:", v5);

  return v6;
}

- (BOOL)isEqualToScoredContact:(id)a3
{
  id *v4;
  id *v5;
  PPContact *contact;
  PPContact *v7;
  PPContact *v8;
  PPContact *v9;
  BOOL v10;
  NSArray *scoredPhoneNumbers;
  NSArray *v12;
  NSArray *v13;
  NSArray *v14;
  char v15;
  NSArray *scoredEmailAddresses;
  NSArray *v17;
  NSArray *v18;
  NSArray *v19;
  char v20;
  NSArray *scoredSocialProfiles;
  NSArray *v22;
  NSArray *v23;
  NSArray *v24;
  char v25;
  NSArray *scoredPostalAddresses;
  NSArray *v27;
  NSArray *v28;
  NSArray *v29;
  char v30;
  BOOL v31;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_24;
  contact = self->_contact;
  v7 = (PPContact *)v4[2];
  if (contact == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = contact;
    v10 = -[PPContact isEqual:](v9, "isEqual:", v8);

    if (!v10)
      goto LABEL_24;
  }
  scoredPhoneNumbers = self->_scoredPhoneNumbers;
  v12 = (NSArray *)v5[4];
  if (scoredPhoneNumbers == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = scoredPhoneNumbers;
    v15 = -[NSArray isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_24;
  }
  scoredEmailAddresses = self->_scoredEmailAddresses;
  v17 = (NSArray *)v5[5];
  if (scoredEmailAddresses == v17)
  {

  }
  else
  {
    v18 = v17;
    v19 = scoredEmailAddresses;
    v20 = -[NSArray isEqual:](v19, "isEqual:", v18);

    if ((v20 & 1) == 0)
      goto LABEL_24;
  }
  scoredSocialProfiles = self->_scoredSocialProfiles;
  v22 = (NSArray *)v5[6];
  if (scoredSocialProfiles == v22)
  {

  }
  else
  {
    v23 = v22;
    v24 = scoredSocialProfiles;
    v25 = -[NSArray isEqual:](v24, "isEqual:", v23);

    if ((v25 & 1) == 0)
      goto LABEL_24;
  }
  scoredPostalAddresses = self->_scoredPostalAddresses;
  v27 = (NSArray *)v5[7];
  if (scoredPostalAddresses == v27)
  {

  }
  else
  {
    v28 = v27;
    v29 = scoredPostalAddresses;
    v30 = -[NSArray isEqual:](v29, "isEqual:", v28);

    if ((v30 & 1) == 0)
      goto LABEL_24;
  }
  if (self->_score != *((double *)v5 + 3))
  {
LABEL_24:
    v31 = 0;
    goto LABEL_25;
  }
  v31 = self->_flags == *((unsigned __int8 *)v5 + 8);
LABEL_25:

  return v31;
}

- (PPContact)contact
{
  return self->_contact;
}

- (double)score
{
  return self->_score;
}

- (unsigned)flags
{
  return self->_flags;
}

- (NSArray)scoredPhoneNumbers
{
  return self->_scoredPhoneNumbers;
}

- (NSArray)scoredEmailAddresses
{
  return self->_scoredEmailAddresses;
}

- (NSArray)scoredSocialProfiles
{
  return self->_scoredSocialProfiles;
}

- (NSArray)scoredPostalAddresses
{
  return self->_scoredPostalAddresses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoredPostalAddresses, 0);
  objc_storeStrong((id *)&self->_scoredSocialProfiles, 0);
  objc_storeStrong((id *)&self->_scoredEmailAddresses, 0);
  objc_storeStrong((id *)&self->_scoredPhoneNumbers, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

+ (id)scoredContactWithContact:(id)a3 scoredPhoneNumbers:(id)a4 scoredEmailAddresses:(id)a5 scoredSocialProfiles:(id)a6 scoredPostalAddresses:(id)a7 score:(double)a8 flags:(unsigned __int8)a9
{
  uint64_t v9;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;

  v9 = a9;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContact:scoredPhoneNumbers:scoredEmailAddresses:scoredSocialProfiles:scoredPostalAddresses:score:flags:", v20, v19, v18, v17, v16, v9, a8);

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
