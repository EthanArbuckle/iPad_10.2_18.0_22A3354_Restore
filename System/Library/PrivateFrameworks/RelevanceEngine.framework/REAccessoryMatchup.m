@implementation REAccessoryMatchup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REAccessoryMatchup)initWithHomeTeamImage:(id)a3 homeTeamName:(id)a4 homeTeamDetail:(id)a5 awayTeamImage:(id)a6 awayTeamName:(id)a7 awayTeamDetail:(id)a8 progress:(id)a9 startDate:(id)a10 status:(unint64_t)a11 dateFetched:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  REAccessoryMatchup *v27;
  uint64_t v28;
  REImage *homeTeamImage;
  uint64_t v30;
  NSString *homeTeamName;
  uint64_t v32;
  NSString *homeTeamDetail;
  uint64_t v34;
  REImage *awayTeamImage;
  uint64_t v36;
  NSString *awayTeamName;
  uint64_t v38;
  NSString *awayTeamDetail;
  uint64_t v40;
  NSString *matchupProgress;
  uint64_t v42;
  NSDate *matchupStartDate;
  uint64_t v44;
  NSDate *matchupDateFetched;
  objc_super v47;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a12;
  v47.receiver = self;
  v47.super_class = (Class)REAccessoryMatchup;
  v27 = -[REAccessoryMatchup init](&v47, sel_init);
  if (v27)
  {
    v28 = objc_msgSend(v18, "copy");
    homeTeamImage = v27->_homeTeamImage;
    v27->_homeTeamImage = (REImage *)v28;

    v30 = objc_msgSend(v19, "copy");
    homeTeamName = v27->_homeTeamName;
    v27->_homeTeamName = (NSString *)v30;

    v32 = objc_msgSend(v20, "copy");
    homeTeamDetail = v27->_homeTeamDetail;
    v27->_homeTeamDetail = (NSString *)v32;

    v34 = objc_msgSend(v21, "copy");
    awayTeamImage = v27->_awayTeamImage;
    v27->_awayTeamImage = (REImage *)v34;

    v36 = objc_msgSend(v22, "copy");
    awayTeamName = v27->_awayTeamName;
    v27->_awayTeamName = (NSString *)v36;

    v38 = objc_msgSend(v23, "copy");
    awayTeamDetail = v27->_awayTeamDetail;
    v27->_awayTeamDetail = (NSString *)v38;

    v40 = objc_msgSend(v24, "copy");
    matchupProgress = v27->_matchupProgress;
    v27->_matchupProgress = (NSString *)v40;

    v42 = objc_msgSend(v25, "copy");
    matchupStartDate = v27->_matchupStartDate;
    v27->_matchupStartDate = (NSDate *)v42;

    v27->_status = a11;
    v44 = objc_msgSend(v26, "copy");
    matchupDateFetched = v27->_matchupDateFetched;
    v27->_matchupDateFetched = (NSDate *)v44;

  }
  return v27;
}

- (REAccessoryMatchup)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  REAccessoryMatchup *v13;
  void *v15;
  void *v16;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("REAccessoryMatchupCodingHomeImageKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("REAccessoryMatchupCodingHomeNameKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("REAccessoryMatchupCodingHomeDetailKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("REAccessoryMatchupCodingAwayImageKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("REAccessoryMatchupCodingAwayNameKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("REAccessoryMatchupCodingAwayDetailKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("REAccessoryMatchupCodingMatchupProgressKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("REAccessoryMatchupCodingStartDateKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("REAccessoryMatchupCodingStatusKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("REAccessoryMatchupCodingDateFetchedKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[REAccessoryMatchup initWithHomeTeamImage:homeTeamName:homeTeamDetail:awayTeamImage:awayTeamName:awayTeamDetail:progress:startDate:status:dateFetched:](self, "initWithHomeTeamImage:homeTeamName:homeTeamDetail:awayTeamImage:awayTeamName:awayTeamDetail:progress:startDate:status:dateFetched:", v16, v15, v4, v5, v6, v7, v8, v9, v11, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  REImage *homeTeamImage;
  void *v5;
  id v6;

  homeTeamImage = self->_homeTeamImage;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", homeTeamImage, CFSTR("REAccessoryMatchupCodingHomeImageKey"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_homeTeamName, CFSTR("REAccessoryMatchupCodingHomeNameKey"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_homeTeamDetail, CFSTR("REAccessoryMatchupCodingHomeDetailKey"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_awayTeamImage, CFSTR("REAccessoryMatchupCodingAwayImageKey"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_awayTeamName, CFSTR("REAccessoryMatchupCodingAwayNameKey"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_awayTeamDetail, CFSTR("REAccessoryMatchupCodingAwayDetailKey"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_matchupStartDate, CFSTR("REAccessoryMatchupCodingStartDateKey"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_status);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("REAccessoryMatchupCodingStatusKey"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_matchupDateFetched, CFSTR("REAccessoryMatchupCodingDateFetchedKey"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t status;
  void *v13;
  REAccessoryMatchup *v14;
  id v16;
  REAccessoryMatchup *v17;

  v17 = [REAccessoryMatchup alloc];
  v16 = -[REImage copyWithZone:](self->_homeTeamImage, "copyWithZone:", a3);
  v5 = (void *)-[NSString copyWithZone:](self->_homeTeamName, "copyWithZone:", a3);
  v6 = (void *)-[NSString copyWithZone:](self->_homeTeamDetail, "copyWithZone:", a3);
  v7 = -[REImage copyWithZone:](self->_awayTeamImage, "copyWithZone:", a3);
  v8 = (void *)-[NSString copyWithZone:](self->_awayTeamName, "copyWithZone:", a3);
  v9 = (void *)-[NSString copyWithZone:](self->_awayTeamDetail, "copyWithZone:", a3);
  v10 = (void *)-[NSString copyWithZone:](self->_matchupProgress, "copyWithZone:", a3);
  v11 = (void *)-[NSDate copyWithZone:](self->_matchupStartDate, "copyWithZone:", a3);
  status = self->_status;
  v13 = (void *)-[NSDate copyWithZone:](self->_matchupDateFetched, "copyWithZone:", a3);
  v14 = -[REAccessoryMatchup initWithHomeTeamImage:homeTeamName:homeTeamDetail:awayTeamImage:awayTeamName:awayTeamDetail:progress:startDate:status:dateFetched:](v17, "initWithHomeTeamImage:homeTeamName:homeTeamDetail:awayTeamImage:awayTeamName:awayTeamDetail:progress:startDate:status:dateFetched:", v16, v5, v6, v7, v8, v9, v10, v11, status, v13);

  return v14;
}

- (REImage)homeTeamImage
{
  return self->_homeTeamImage;
}

- (NSString)homeTeamName
{
  return self->_homeTeamName;
}

- (NSString)homeTeamDetail
{
  return self->_homeTeamDetail;
}

- (REImage)awayTeamImage
{
  return self->_awayTeamImage;
}

- (NSString)awayTeamName
{
  return self->_awayTeamName;
}

- (NSString)awayTeamDetail
{
  return self->_awayTeamDetail;
}

- (NSString)matchupProgress
{
  return self->_matchupProgress;
}

- (unint64_t)status
{
  return self->_status;
}

- (NSDate)matchupStartDate
{
  return self->_matchupStartDate;
}

- (NSDate)matchupDateFetched
{
  return self->_matchupDateFetched;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchupDateFetched, 0);
  objc_storeStrong((id *)&self->_matchupStartDate, 0);
  objc_storeStrong((id *)&self->_matchupProgress, 0);
  objc_storeStrong((id *)&self->_awayTeamDetail, 0);
  objc_storeStrong((id *)&self->_awayTeamName, 0);
  objc_storeStrong((id *)&self->_awayTeamImage, 0);
  objc_storeStrong((id *)&self->_homeTeamDetail, 0);
  objc_storeStrong((id *)&self->_homeTeamName, 0);
  objc_storeStrong((id *)&self->_homeTeamImage, 0);
}

@end
