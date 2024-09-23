@implementation UNCBulletin

- (UNCBulletin)initWithBulletinID:(id)a3 sectionID:(id)a4 universalSectionID:(id)a5 dismissalID:(id)a6 date:(id)a7 title:(id)a8 subtitle:(id)a9 message:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  UNCBulletin *v24;
  uint64_t v25;
  NSString *bulletinID;
  uint64_t v27;
  NSString *sectionID;
  uint64_t v29;
  NSString *universalSectionID;
  uint64_t v31;
  NSString *dismissalID;
  uint64_t v33;
  NSDate *date;
  uint64_t v35;
  NSString *title;
  uint64_t v37;
  NSString *subtitle;
  uint64_t v39;
  NSString *message;
  objc_super v42;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v42.receiver = self;
  v42.super_class = (Class)UNCBulletin;
  v24 = -[UNCBulletin init](&v42, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v16, "copy");
    bulletinID = v24->_bulletinID;
    v24->_bulletinID = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    sectionID = v24->_sectionID;
    v24->_sectionID = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    universalSectionID = v24->_universalSectionID;
    v24->_universalSectionID = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    dismissalID = v24->_dismissalID;
    v24->_dismissalID = (NSString *)v31;

    v33 = objc_msgSend(v20, "copy");
    date = v24->_date;
    v24->_date = (NSDate *)v33;

    v35 = objc_msgSend(v21, "copy");
    title = v24->_title;
    v24->_title = (NSString *)v35;

    v37 = objc_msgSend(v22, "copy");
    subtitle = v24->_subtitle;
    v24->_subtitle = (NSString *)v37;

    v39 = objc_msgSend(v23, "copy");
    message = v24->_message;
    v24->_message = (NSString *)v39;

  }
  return v24;
}

- (id)description
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[UNCBulletin bulletinID](self, "bulletinID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCBulletin sectionID](self, "sectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCBulletin universalSectionID](self, "universalSectionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCBulletin dismissalID](self, "dismissalID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCBulletin date](self, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCBulletin title](self, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCBulletin subtitle](self, "subtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCBulletin message](self, "message");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v4, "initWithBulletinID:sectionID:universalSectionID:dismissalID:date:title:subtitle:message:", v5, v6, v7, v8, v9, v10, v11, v12);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  id v11;

  v4 = a3;
  -[UNCBulletin bulletinID](self, "bulletinID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bulletinID"));

  -[UNCBulletin sectionID](self, "sectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sectionID"));

  -[UNCBulletin universalSectionID](self, "universalSectionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("universalSectionID"));

  -[UNCBulletin date](self, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("date"));

  -[UNCBulletin title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("title"));

  -[UNCBulletin subtitle](self, "subtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("subtitle"));

  -[UNCBulletin message](self, "message");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("message"));

}

- (UNCBulletin)initWithCoder:(id)a3
{
  id v4;
  UNCBulletin *v5;
  uint64_t v6;
  NSString *bulletinID;
  uint64_t v8;
  NSString *sectionID;
  uint64_t v10;
  NSString *universalSectionID;
  uint64_t v12;
  NSDate *date;
  uint64_t v14;
  NSString *title;
  uint64_t v16;
  NSString *subtitle;
  uint64_t v18;
  NSString *message;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)UNCBulletin;
  v5 = -[UNCBulletin init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bulletinID"));
    v6 = objc_claimAutoreleasedReturnValue();
    bulletinID = v5->_bulletinID;
    v5->_bulletinID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sectionID"));
    v8 = objc_claimAutoreleasedReturnValue();
    sectionID = v5->_sectionID;
    v5->_sectionID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("universalSectionID"));
    v10 = objc_claimAutoreleasedReturnValue();
    universalSectionID = v5->_universalSectionID;
    v5->_universalSectionID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v12 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v14 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v16 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
    v18 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v18;

  }
  return v5;
}

- (NSString)bulletinID
{
  return self->_bulletinID;
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (NSString)universalSectionID
{
  return self->_universalSectionID;
}

- (NSString)dismissalID
{
  return self->_dismissalID;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_dismissalID, 0);
  objc_storeStrong((id *)&self->_universalSectionID, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_bulletinID, 0);
}

@end
