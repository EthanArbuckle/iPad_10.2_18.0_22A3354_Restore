@implementation PGPersonRelationshipAnalyzerProperties

- (void)registerAttendance:(unint64_t)a3 amongFamilyHolidays:(unint64_t)a4
{
  double v4;

  if (a3)
  {
    if (a4)
    {
      v4 = (double)a3 / (double)a4;
      self->_familyHolidayAttendanceRatio = v4;
      self->_familyScore = v4 + self->_familyScore;
    }
  }
}

- (void)registerParentContactName
{
  self->_hasParentContactName = 1;
  __asm { FMOV            V1.2D, #1.0 }
  *(float64x2_t *)&self->_familyScore = vaddq_f64(*(float64x2_t *)&self->_familyScore, _Q1);
}

- (void)registerSameFamilyNameAsMePerson
{
  self->_hasSameFamilyNameAsMePerson = 1;
  self->_familyScore = self->_familyScore + 1.0;
}

- (void)registerNumberOfMomentsAtHome:(unint64_t)a3 amongMomentsAtHome:(unint64_t)a4
{
  double v4;

  if (a3)
  {
    if (a4)
    {
      self->_numberOfMomentsAtHome = a3;
      v4 = (double)a3 / (double)a4;
      self->_ratioOfOfMomentsAtHome = v4;
      self->_familyScore = v4 + self->_familyScore;
    }
  }
}

- (void)registerAnniversaryDate
{
  self->_hasAnniversaryDate = 1;
  self->_partnerScore = self->_partnerScore + 1.0;
}

- (void)registerTopTwoPersonSocialGroup
{
  self->_isTopTwoPersonSocialGroup = 1;
  self->_partnerScore = self->_partnerScore + 1.0;
}

- (void)registerNumberOfExchangedLoveEmojis:(unint64_t)a3 amongExchangedLoveEmojis:(unint64_t)a4
{
  if (a3)
  {
    if (a4)
    {
      self->_numberOfLoveEmojisExchanged = a3;
      self->_partnerScore = (double)a3 / (double)a4 + self->_partnerScore;
    }
  }
}

- (void)registerTopPersonAmongTopPeople:(unint64_t)a3
{
  double v3;

  if (a3)
  {
    self->_isTopPerson = 1;
    v3 = 1.0 / (double)a3;
    self->_friendScore = v3 + self->_friendScore;
    self->_partnerScore = self->_partnerScore + v3 * 0.5;
  }
}

- (void)registerNumberOfNightsOut:(unint64_t)a3 amongNightsOut:(unint64_t)a4
{
  double v4;

  if (a3)
  {
    if (a4)
    {
      v4 = (double)a3 / (double)a4;
      self->_friendNightOutAttendanceRatio = v4;
      self->_friendScore = v4 + self->_friendScore;
    }
  }
}

- (void)registerOneOnOneTripAppearance:(unint64_t)a3 amongOneOnOneTrips:(unint64_t)a4
{
  double v4;

  if (a3)
  {
    if (a4)
    {
      v4 = (double)a3 / (double)a4;
      self->_oneOnOneTripAttendanceRatio = v4;
      self->_partnerScore = v4 + self->_partnerScore;
    }
  }
}

- (void)registerNumberOfTrips:(unint64_t)a3 withTripsScore:(double)a4 amongTrips:(unint64_t)a5
{
  double v6;
  double v7;

  if (a3)
  {
    if (a4 > 0.0 && a5 != 0)
    {
      v6 = (double)a3 / (double)a5;
      self->_tripAttendanceRatio = v6;
      v7 = v6 * a4;
      self->_friendScore = v7 + self->_friendScore;
      self->_familyScore = self->_familyScore + v7 * 0.25;
    }
  }
}

- (void)registerNumberOfWeekendMoments:(unint64_t)a3 amongWeekends:(unint64_t)a4
{
  double v4;

  if (a3)
  {
    if (a4)
    {
      v4 = (double)a3 / (double)a4;
      self->_weekendAppearanceRatio = v4;
      self->_friendScore = v4 + self->_friendScore;
    }
  }
}

- (void)registerAttendance:(unint64_t)a3 amongWorkCalendarEvents:(unint64_t)a4
{
  double v4;

  if (a4)
  {
    v4 = (double)a3 / (double)a4;
    self->_calendarEventAttendanceRatio = v4;
    self->_coworkerScore = v4 + self->_coworkerScore;
  }
}

- (void)registerNumberOfMomentsAtWork:(unint64_t)a3 amongMomentsAtWork:(unint64_t)a4
{
  double v4;

  if (a3)
  {
    if (a4)
    {
      v4 = (double)a3 / (double)a4;
      self->_momentsAtWorkAppearancesRatio = v4;
      self->_coworkerScore = v4 + self->_coworkerScore;
    }
  }
}

- (void)registerPersonOldEnoughToBeMeNodeParentOrMyGrandparent
{
  self->_personOldEnoughToBeMeNodeParentOrGrandparent = 1;
  self->_familyScore = self->_familyScore + 1.0;
}

- (void)penalizePersonAgeCategoryDifferentThanMeNode
{
  self->_personAgeDifferentThanMeNode = 1;
  self->_friendScore = self->_friendScore * 0.75;
  self->_partnerScore = self->_partnerScore * 0.75;
}

- (void)penalizePersonScoresForChild
{
  self->_personInferredToBeChild = 1;
  self->_partnerScore = 0.0;
  self->_coworkerScore = 0.0;
  self->_parentScore = 0.0;
}

- (void)registerPersonAsMeNodeChild
{
  if (!self->_hasParentContactName)
  {
    self->_personInferredToBeMeNodeChild = 1;
    self->_childScore = self->_childScore + 1.0;
  }
}

- (BOOL)isInferredHighRecallChild
{
  return self->_personInferredToBeMeNodeChild;
}

- (BOOL)isInferredHighRecallHouseholdMember
{
  return self->_ratioOfOfMomentsAtHome > 0.1;
}

- (id)description
{
  void *v2;
  void *v3;

  -[PGPersonRelationshipAnalyzerProperties edgeProperties](self, "edgeProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)edgeProperties
{
  void *v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_familyHolidayAttendanceRatio > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("rfamhol"));

  }
  if (self->_hasParentContactName)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("rparnam"));

  }
  if (self->_hasSameFamilyNameAsMePerson)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("rfamnam"));

  }
  if (self->_numberOfMomentsAtHome)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("gwnummmtshome"));

  }
  if (self->_hasAnniversaryDate)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("rhasanniv"));

  }
  if (self->_isTopTwoPersonSocialGroup)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("rtop2sg"));

  }
  if (self->_numberOfLoveEmojisExchanged)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("rlovexch"));

  }
  if (self->_isTopPerson)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("rtop"));

  }
  if (self->_friendNightOutAttendanceRatio > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("rfrndnghtout"));

  }
  if (self->_oneOnOneTripAttendanceRatio > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("rprtnrtrip"));

  }
  if (self->_tripAttendanceRatio > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("rfrfamtrip"));

  }
  if (self->_weekendAppearanceRatio > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("rwkend"));

  }
  if (self->_momentsAtWorkAppearancesRatio > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("rwork"));

  }
  if (self->_calendarEventAttendanceRatio > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("rcal"));

  }
  if (self->_personAgeDifferentThanMeNode)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("ragediff"));

  }
  if (self->_personOldEnoughToBeMeNodeParentOrGrandparent)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("rold"));

  }
  if (self->_personInferredToBeMeNodeChild)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("rchild"));

  }
  return v3;
}

- (double)oneOnOneTripAttendanceRatio
{
  return self->_oneOnOneTripAttendanceRatio;
}

- (void)setOneOnOneTripAttendanceRatio:(double)a3
{
  self->_oneOnOneTripAttendanceRatio = a3;
}

- (double)tripAttendanceRatio
{
  return self->_tripAttendanceRatio;
}

- (void)setTripAttendanceRatio:(double)a3
{
  self->_tripAttendanceRatio = a3;
}

- (double)familyHolidayAttendanceRatio
{
  return self->_familyHolidayAttendanceRatio;
}

- (void)setFamilyHolidayAttendanceRatio:(double)a3
{
  self->_familyHolidayAttendanceRatio = a3;
}

- (BOOL)hasParentContactName
{
  return self->_hasParentContactName;
}

- (void)setHasParentContactName:(BOOL)a3
{
  self->_hasParentContactName = a3;
}

- (BOOL)hasSameFamilyNameAsMePerson
{
  return self->_hasSameFamilyNameAsMePerson;
}

- (void)setHasSameFamilyNameAsMePerson:(BOOL)a3
{
  self->_hasSameFamilyNameAsMePerson = a3;
}

- (unint64_t)numberOfMomentsAtHome
{
  return self->_numberOfMomentsAtHome;
}

- (void)setNumberOfMomentsAtHome:(unint64_t)a3
{
  self->_numberOfMomentsAtHome = a3;
}

- (double)ratioOfOfMomentsAtHome
{
  return self->_ratioOfOfMomentsAtHome;
}

- (void)setRatioOfOfMomentsAtHome:(double)a3
{
  self->_ratioOfOfMomentsAtHome = a3;
}

- (BOOL)hasAnniversaryDate
{
  return self->_hasAnniversaryDate;
}

- (void)setHasAnniversaryDate:(BOOL)a3
{
  self->_hasAnniversaryDate = a3;
}

- (BOOL)isTopTwoPersonSocialGroup
{
  return self->_isTopTwoPersonSocialGroup;
}

- (void)setIsTopTwoPersonSocialGroup:(BOOL)a3
{
  self->_isTopTwoPersonSocialGroup = a3;
}

- (unint64_t)numberOfLoveEmojisExchanged
{
  return self->_numberOfLoveEmojisExchanged;
}

- (void)setNumberOfLoveEmojisExchanged:(unint64_t)a3
{
  self->_numberOfLoveEmojisExchanged = a3;
}

- (BOOL)isTopPerson
{
  return self->_isTopPerson;
}

- (void)setIsTopPerson:(BOOL)a3
{
  self->_isTopPerson = a3;
}

- (double)friendNightOutAttendanceRatio
{
  return self->_friendNightOutAttendanceRatio;
}

- (void)setFriendNightOutAttendanceRatio:(double)a3
{
  self->_friendNightOutAttendanceRatio = a3;
}

- (double)weekendAppearanceRatio
{
  return self->_weekendAppearanceRatio;
}

- (void)setWeekendAppearanceRatio:(double)a3
{
  self->_weekendAppearanceRatio = a3;
}

- (double)calendarEventAttendanceRatio
{
  return self->_calendarEventAttendanceRatio;
}

- (void)setCalendarEventAttendanceRatio:(double)a3
{
  self->_calendarEventAttendanceRatio = a3;
}

- (double)momentsAtWorkAppearancesRatio
{
  return self->_momentsAtWorkAppearancesRatio;
}

- (void)setMomentsAtWorkAppearancesRatio:(double)a3
{
  self->_momentsAtWorkAppearancesRatio = a3;
}

- (BOOL)personAgeDifferentThanMeNode
{
  return self->_personAgeDifferentThanMeNode;
}

- (void)setPersonAgeDifferentThanMeNode:(BOOL)a3
{
  self->_personAgeDifferentThanMeNode = a3;
}

- (BOOL)personInferredToBeChild
{
  return self->_personInferredToBeChild;
}

- (void)setPersonInferredToBeChild:(BOOL)a3
{
  self->_personInferredToBeChild = a3;
}

- (BOOL)personOldEnoughToBeMeNodeParentOrGrandparent
{
  return self->_personOldEnoughToBeMeNodeParentOrGrandparent;
}

- (void)setPersonOldEnoughToBeMeNodeParentOrGrandparent:(BOOL)a3
{
  self->_personOldEnoughToBeMeNodeParentOrGrandparent = a3;
}

- (BOOL)personInferredToBeMeNodeChild
{
  return self->_personInferredToBeMeNodeChild;
}

- (void)setPersonInferredToBeMeNodeChild:(BOOL)a3
{
  self->_personInferredToBeMeNodeChild = a3;
}

- (double)partnerScore
{
  return self->_partnerScore;
}

- (double)familyScore
{
  return self->_familyScore;
}

- (double)parentScore
{
  return self->_parentScore;
}

- (double)friendScore
{
  return self->_friendScore;
}

- (double)coworkerScore
{
  return self->_coworkerScore;
}

- (double)childScore
{
  return self->_childScore;
}

@end
