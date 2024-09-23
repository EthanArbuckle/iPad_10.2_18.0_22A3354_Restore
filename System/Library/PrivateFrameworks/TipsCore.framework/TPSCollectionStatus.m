@implementation TPSCollectionStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)featuredDate
{
  return self->_featuredDate;
}

- (NSDate)activatedDate
{
  return self->_activatedDate;
}

- (void)setActivatedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (TPSCollectionStatus)initWithIdentifier:(id)a3
{
  id v5;
  TPSCollectionStatus *v6;
  TPSCollectionStatus *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSCollectionStatus;
  v6 = -[TPSCollectionStatus init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v7->_canNotify = 1;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredDate, 0);
  objc_storeStrong((id *)&self->_firstViewedDate, 0);
  objc_storeStrong((id *)&self->_activatedDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activatedDate, CFSTR("activatedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firstViewedDate, CFSTR("firstViewedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_featuredDate, CFSTR("featuredDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_canNotify, CFSTR("canNotify"));

}

- (void)setFeaturedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (TPSCollectionStatus)initWithCoder:(id)a3
{
  id v4;
  TPSCollectionStatus *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSDate *activatedDate;
  uint64_t v10;
  NSDate *firstViewedDate;
  uint64_t v12;
  NSDate *featuredDate;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TPSCollectionStatus;
  v5 = -[TPSCollectionStatus init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activatedDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    activatedDate = v5->_activatedDate;
    v5->_activatedDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstViewedDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    firstViewedDate = v5->_firstViewedDate;
    v5->_firstViewedDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("featuredDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    featuredDate = v5->_featuredDate;
    v5->_featuredDate = (NSDate *)v12;

    v5->_canNotify = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canNotify"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TPSCollectionStatus *v4;
  TPSCollectionStatus *v5;

  v4 = +[TPSCollectionStatus allocWithZone:](TPSCollectionStatus, "allocWithZone:", a3);
  -[TPSCollectionStatus setIdentifier:](v4, "setIdentifier:", self->_identifier);
  -[TPSCollectionStatus setActivatedDate:](v4, "setActivatedDate:", self->_activatedDate);
  -[TPSCollectionStatus setFirstViewedDate:](v4, "setFirstViewedDate:", self->_firstViewedDate);
  -[TPSCollectionStatus setFeaturedDate:](v4, "setFeaturedDate:", self->_featuredDate);
  -[TPSCollectionStatus setCanNotify:](v4, "setCanNotify:", self->_canNotify);
  v5 = self;

  return v5;
}

- (id)debugDescription
{
  void *v3;
  NSDate *activatedDate;
  NSDate *firstViewedDate;
  NSDate *featuredDate;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@"), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("\n %@ = %@\n"), CFSTR("identifier"), self->_identifier);
  activatedDate = self->_activatedDate;
  if (activatedDate)
    objc_msgSend(v3, "appendFormat:", CFSTR(" %@ = %@\n"), CFSTR("activatedDate"), activatedDate);
  firstViewedDate = self->_firstViewedDate;
  if (firstViewedDate)
    objc_msgSend(v3, "appendFormat:", CFSTR(" %@ = %@\n"), CFSTR("firstViewedDate"), firstViewedDate);
  featuredDate = self->_featuredDate;
  if (featuredDate)
    objc_msgSend(v3, "appendFormat:", CFSTR(" %@ = %@\n"), CFSTR("featuredDate"), featuredDate);
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@ = %d\n"), CFSTR("canNotify"), self->_canNotify);
  return v3;
}

- (BOOL)canNotify
{
  return self->_canNotify;
}

- (void)setCanNotify:(BOOL)a3
{
  self->_canNotify = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)firstViewedDate
{
  return self->_firstViewedDate;
}

- (void)setFirstViewedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
