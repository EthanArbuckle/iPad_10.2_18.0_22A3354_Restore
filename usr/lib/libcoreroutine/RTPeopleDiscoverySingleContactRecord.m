@implementation RTPeopleDiscoverySingleContactRecord

- (RTPeopleDiscoverySingleContactRecord)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithContactID_withAdvertisement_);
}

- (RTPeopleDiscoverySingleContactRecord)initWithContactID:(id)a3 withAdvertisement:(id)a4
{
  id v7;
  id v8;
  RTPeopleDiscoverySingleContactRecord *v9;
  RTPeopleDiscoverySingleContactRecord *v10;
  uint64_t v11;
  NSDate *firstObservation;
  uint64_t v13;
  NSDate *latestAdvertisementDate;
  void *v15;
  uint64_t v16;
  NSMutableDictionary *RSSIDistribution;
  NSArray *v18;
  NSArray *interactionSessions;
  objc_super v21;
  _QWORD v22[5];
  _QWORD v23[6];

  v23[5] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)RTPeopleDiscoverySingleContactRecord;
  v9 = -[RTPeopleDiscoverySingleContactRecord init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactID, a3);
    objc_msgSend(v8, "scanDate");
    v11 = objc_claimAutoreleasedReturnValue();
    firstObservation = v10->_firstObservation;
    v10->_firstObservation = (NSDate *)v11;

    objc_msgSend(v8, "scanDate");
    v13 = objc_claimAutoreleasedReturnValue();
    latestAdvertisementDate = v10->_latestAdvertisementDate;
    v10->_latestAdvertisementDate = (NSDate *)v13;

    v10->_numAdvReceived = 1;
    v22[0] = &unk_1E9326FF0;
    v22[1] = &unk_1E9327020;
    v23[0] = &unk_1E9327008;
    v23[1] = &unk_1E9327008;
    v22[2] = &unk_1E9327038;
    v22[3] = &unk_1E9327050;
    v23[2] = &unk_1E9327008;
    v23[3] = &unk_1E9327008;
    v22[4] = &unk_1E9327068;
    v23[4] = &unk_1E9327008;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v15);
    RSSIDistribution = v10->_RSSIDistribution;
    v10->_RSSIDistribution = (NSMutableDictionary *)v16;

    -[RTPeopleDiscoverySingleContactRecord updateRSSIDistribution:](v10, "updateRSSIDistribution:", objc_msgSend(v8, "rssi"));
    v18 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    interactionSessions = v10->_interactionSessions;
    v10->_interactionSessions = v18;

  }
  return v10;
}

- (void)updateSingleContactRecordOnAdvReceived:(id)a3
{
  id v4;
  void *v5;
  NSDate *latestAdvertisementDate;
  void *v7;
  uint64_t v8;
  NSDate *v9;
  NSDate *v10;
  NSObject *v11;
  uint8_t v12[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    latestAdvertisementDate = self->_latestAdvertisementDate;
    objc_msgSend(v4, "scanDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSDate compare:](latestAdvertisementDate, "compare:", v7);

    if (v8 != 1)
    {
      objc_msgSend(v5, "scanDate");
      v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v10 = self->_latestAdvertisementDate;
      self->_latestAdvertisementDate = v9;

      -[RTPeopleDiscoverySingleContactRecord updateRSSIDistribution:](self, "updateRSSIDistribution:", objc_msgSend(v5, "rssi"));
    }
    ++self->_numAdvReceived;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: advertisement", v12, 2u);
    }

  }
}

- (void)closeInteractionSession:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  NSDate **p_latestAdvertisementDate;
  NSDate *latestAdvertisementDate;
  NSObject *v10;
  NSDate *v11;
  NSDate *v12;
  NSDate *v13;
  NSString *contactID;
  int v15;
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      contactID = self->_contactID;
      v15 = 138412290;
      v16 = contactID;
      _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "Closing current interaction session for contact %@", (uint8_t *)&v15, 0xCu);
    }

    v7 = objc_alloc(MEMORY[0x1E0D18408]);
    latestAdvertisementDate = self->_latestAdvertisementDate;
    p_latestAdvertisementDate = &self->_latestAdvertisementDate;
    v10 = objc_msgSend(v7, "initWithFirstObject:secondObject:", *(p_latestAdvertisementDate - 1), latestAdvertisementDate);
    v11 = (NSDate *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", p_latestAdvertisementDate[3]);
    -[NSDate addObject:](v11, "addObject:", v10);
    v12 = p_latestAdvertisementDate[3];
    p_latestAdvertisementDate[3] = v11;
    v13 = v11;

    objc_storeStrong((id *)p_latestAdvertisementDate - 1, a3);
    objc_storeStrong((id *)p_latestAdvertisementDate, a3);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: nextSessionStartDate", (uint8_t *)&v15, 2u);
    }
  }

}

- (double)getTotalInteractionDuration
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = self->_interactionSessions;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "secondObject", (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "timeIntervalSinceDate:", v11);
        v7 = v7 + v12;

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  -[NSDate timeIntervalSinceDate:](self->_latestAdvertisementDate, "timeIntervalSinceDate:", self->_firstObservation);
  return v7 + v13;
}

- (void)updateRSSIDistribution:(int64_t)a3
{
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  int64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_RSSIDistribution;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
      if (objc_msgSend(v10, "integerValue", (_QWORD)v15) < a3)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v11 = v10;

    if (!v11)
      goto LABEL_12;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_RSSIDistribution, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue") + 1;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_RSSIDistribution, "setObject:forKeyedSubscript:", v14, v11);

  }
  else
  {
LABEL_9:

LABEL_12:
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v20 = a3;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Update RSSI distribution failed, RSSI: %ld", buf, 0xCu);
    }
  }

}

- (void)mergeWithAnotherSingleContactRecord:(id)a3
{
  id v4;
  NSString *contactID;
  NSString *v6;
  NSDate *firstObservation;
  void *v8;
  NSDate *v9;
  NSDate *v10;
  void *v11;
  NSDate *latestAdvertisementDate;
  void *v13;
  NSDate *v14;
  NSDate *v15;
  NSDate *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  contactID = self->_contactID;
  objc_msgSend(v4, "contactID");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (contactID == v6)
  {
    self->_numAdvReceived += objc_msgSend(v4, "numAdvReceived");
    firstObservation = self->_firstObservation;
    objc_msgSend(v4, "firstObservation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDate earlierDate:](firstObservation, "earlierDate:", v8);
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v10 = self->_firstObservation;
    self->_firstObservation = v9;

    objc_msgSend(v4, "latestAdvertisementDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    latestAdvertisementDate = self->_latestAdvertisementDate;
    if (v11)
    {
      objc_msgSend(v4, "latestAdvertisementDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDate laterDate:](latestAdvertisementDate, "laterDate:", v13);
      v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v15 = self->_latestAdvertisementDate;
      self->_latestAdvertisementDate = v14;

    }
    else
    {
      v16 = latestAdvertisementDate;
      v13 = self->_latestAdvertisementDate;
      self->_latestAdvertisementDate = v16;
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v4, "RSSIDistribution");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v32 != v19)
            objc_enumerationMutation(obj);
          v21 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_RSSIDistribution, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            -[NSMutableDictionary objectForKeyedSubscript:](self->_RSSIDistribution, "objectForKeyedSubscript:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "integerValue");
            objc_msgSend(v4, "RSSIDistribution");
            v25 = v4;
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectForKeyedSubscript:", v21);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "integerValue") + v24;

            v4 = v25;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_RSSIDistribution, "setObject:forKeyedSubscript:", v29, v21);

          }
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v18);
    }

  }
}

- (id)descriptionDictionary
{
  NSDate *firstObservation;
  NSString *contactID;
  void *v5;
  NSDate *latestAdvertisementDate;
  __CFString *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  contactID = self->_contactID;
  firstObservation = self->_firstObservation;
  v12[0] = contactID;
  v11[0] = CFSTR("ContactID");
  v11[1] = CFSTR("firstObservation");
  -[NSDate getFormattedDateString](firstObservation, "getFormattedDateString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v11[2] = CFSTR("lastObservation");
  latestAdvertisementDate = self->_latestAdvertisementDate;
  if (latestAdvertisementDate)
  {
    -[NSDate getFormattedDateString](self->_latestAdvertisementDate, "getFormattedDateString");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("-");
  }
  v12[2] = v7;
  v11[3] = CFSTR("numOfObservations");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numAdvReceived);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (latestAdvertisementDate)
  return v9;
}

- (id)description
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  objc_class *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[RTPeopleDiscoverySingleContactRecord descriptionDictionary](self, "descriptionDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONStringFromNSDictionary:error:", v2, &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v4;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "%@ instance failed to create description:%@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v3;
  }
  v7 = v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = (void *)-[NSString copy](self->_contactID, "copy");
  v6 = (void *)-[NSDate copy](self->_firstObservation, "copy");
  v7 = (void *)objc_msgSend(v4, "initWithContactID:withAdvertisement:", v5, v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTPeopleDiscoverySingleContactRecord)initWithCoder:(id)a3
{
  id v4;
  RTPeopleDiscoverySingleContactRecord *v5;
  uint64_t v6;
  NSString *contactID;
  uint64_t v8;
  NSDate *firstObservation;
  uint64_t v10;
  NSDate *latestAdvertisementDate;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *RSSIDistribution;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)RTPeopleDiscoverySingleContactRecord;
  v5 = -[RTPeopleDiscoverySingleContactRecord init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ContactID"));
    v6 = objc_claimAutoreleasedReturnValue();
    contactID = v5->_contactID;
    v5->_contactID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstObservation"));
    v8 = objc_claimAutoreleasedReturnValue();
    firstObservation = v5->_firstObservation;
    v5->_firstObservation = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastObservation"));
    v10 = objc_claimAutoreleasedReturnValue();
    latestAdvertisementDate = v5->_latestAdvertisementDate;
    v5->_latestAdvertisementDate = (NSDate *)v10;

    v5->_numAdvReceived = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("numOfObservations"));
    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("RSSIDistribution"));
    v15 = objc_claimAutoreleasedReturnValue();
    RSSIDistribution = v5->_RSSIDistribution;
    v5->_RSSIDistribution = (NSMutableDictionary *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *contactID;
  id v5;

  contactID = self->_contactID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contactID, CFSTR("ContactID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firstObservation, CFSTR("firstObservation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_latestAdvertisementDate, CFSTR("lastObservation"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numAdvReceived, CFSTR("numOfObservations"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_RSSIDistribution, CFSTR("RSSIDistribution"));

}

- (NSString)contactID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDate)firstObservation
{
  return self->_firstObservation;
}

- (NSDate)latestAdvertisementDate
{
  return self->_latestAdvertisementDate;
}

- (NSMutableDictionary)RSSIDistribution
{
  return self->_RSSIDistribution;
}

- (unint64_t)numAdvReceived
{
  return self->_numAdvReceived;
}

- (NSArray)interactionSessions
{
  return self->_interactionSessions;
}

- (void)setInteractionSessions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionSessions, 0);
  objc_storeStrong((id *)&self->_RSSIDistribution, 0);
  objc_storeStrong((id *)&self->_latestAdvertisementDate, 0);
  objc_storeStrong((id *)&self->_firstObservation, 0);
  objc_storeStrong((id *)&self->_contactID, 0);
}

@end
