@implementation SMSuggestion

- (SMSuggestion)initWithSuggestionTrigger:(unint64_t)a3 suggestionUserType:(unint64_t)a4 suppressionReason:(unint64_t)a5 sessionType:(unint64_t)a6 sourceLocation:(id)a7 destinationLocation:(id)a8 buddy:(id)a9 dateInterval:(id)a10 creationDate:(id)a11 locationOfInterest:(id)a12
{
  id v17;
  NSObject *v18;
  const char *v19;
  SMSuggestion *v20;
  SMSuggestion *v21;
  id *p_isa;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  objc_super v31;
  uint8_t buf[16];

  v30 = a7;
  v29 = a8;
  v28 = a9;
  v27 = a10;
  v17 = a11;
  v26 = a12;
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Invalid parameter not satisfying: creationDate";
      goto LABEL_13;
    }
LABEL_7:

    v20 = 0;
    goto LABEL_11;
  }
  if (a6 != 4 && !v30)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Invalid parameter not satisfying: sourceLocation";
LABEL_13:
      _os_log_error_impl(&dword_245521000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  v31.receiver = self;
  v31.super_class = (Class)SMSuggestion;
  v21 = -[SMSuggestion init](&v31, sel_init);
  p_isa = (id *)&v21->super.isa;
  if (v21)
  {
    v21->_suggestionTrigger = a3;
    v21->_suggestionUserType = a4;
    v21->_suppressionReason = a5;
    v21->_sessionType = a6;
    objc_storeStrong((id *)&v21->_sourceLocation, a7);
    objc_storeStrong(p_isa + 6, a8);
    objc_storeStrong(p_isa + 7, a9);
    objc_storeStrong(p_isa + 8, a10);
    objc_storeStrong(p_isa + 9, a11);
    objc_storeStrong(p_isa + 10, a12);
  }
  self = p_isa;
  v20 = self;
LABEL_11:

  return v20;
}

- (SMSuggestion)initWithSuggestionTrigger:(unint64_t)a3 suggestionUserType:(unint64_t)a4 suppressionReason:(unint64_t)a5 sessionType:(unint64_t)a6 sourceLocation:(id)a7 destinationLocation:(id)a8 buddy:(id)a9 dateInterval:(id)a10 creationDate:(id)a11
{
  return -[SMSuggestion initWithSuggestionTrigger:suggestionUserType:suppressionReason:sessionType:sourceLocation:destinationLocation:buddy:dateInterval:creationDate:locationOfInterest:](self, "initWithSuggestionTrigger:suggestionUserType:suppressionReason:sessionType:sourceLocation:destinationLocation:buddy:dateInterval:creationDate:locationOfInterest:", a3, a4, a5, a6, a7, a8, a9, a10, a11, 0);
}

- (id)description
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
  void *v13;
  id v14;
  id v15;
  void *v16;

  v14 = (id)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "stringFromSMSuggestionTrigger:", -[SMSuggestion suggestionTrigger](self, "suggestionTrigger"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "stringFromSMSuggestionUserType:", -[SMSuggestion suggestionUserType](self, "suggestionUserType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "stringFromSMSuggestionSuppressionReason:", -[SMSuggestion suppressionReason](self, "suppressionReason"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMSessionConfiguration sessionTypeToString:](SMSessionConfiguration, "sessionTypeToString:", -[SMSuggestion sessionType](self, "sessionType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSuggestion sourceLocation](self, "sourceLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSuggestion destinationLocation](self, "destinationLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSuggestion buddy](self, "buddy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSuggestion dateInterval](self, "dateInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSuggestion creationDate](self, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSuggestion locationOfInterest](self, "locationOfInterest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("trigger, %@, user type, %@, suppression reason, %@, session type, %@, source location, %@, destination location, %@, buddy, %@, date interval, %@, creationDate, %@, locationOfInterest, %@"), v13, v16, v3, v4, v5, v6, v7, v8, v10, v11);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)stringFromSMSuggestionTrigger:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return CFSTR("Unknown");
  else
    return off_25166DA58[a3 - 1];
}

+ (id)stringFromSMSuggestionUserType:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return CFSTR("Unknown");
  else
    return off_25166DA78[a3 - 1];
}

+ (id)stringFromSMSuggestionSuppressionReason:(unint64_t)a3
{
  if (a3 - 1 > 0xB)
    return CFSTR("Unknown");
  else
    return off_25166DA98[a3 - 1];
}

- (BOOL)isSuppressed
{
  return -[SMSuggestion suppressionReason](self, "suppressionReason") != 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMSuggestion)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SMSuggestion *v13;
  uint64_t v15;

  v3 = a3;
  v15 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("Trigger"));
  v4 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("UserType"));
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("SuppressionReason"));
  v6 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("sSssionType"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SourceLocation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DestinationLocation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Buddy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DateInterval"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CreationDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LocationOfInterest"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[SMSuggestion initWithSuggestionTrigger:suggestionUserType:suppressionReason:sessionType:sourceLocation:destinationLocation:buddy:dateInterval:creationDate:locationOfInterest:](self, "initWithSuggestionTrigger:suggestionUserType:suppressionReason:sessionType:sourceLocation:destinationLocation:buddy:dateInterval:creationDate:locationOfInterest:", v15, v4, v5, v6, v7, v8, v9, v10, v11, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t suggestionTrigger;
  id v5;

  suggestionTrigger = self->_suggestionTrigger;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", suggestionTrigger, CFSTR("Trigger"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_suggestionUserType, CFSTR("UserType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_suppressionReason, CFSTR("SuppressionReason"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sessionType, CFSTR("sSssionType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceLocation, CFSTR("SourceLocation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_destinationLocation, CFSTR("DestinationLocation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_buddy, CFSTR("Buddy"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateInterval, CFSTR("DateInterval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("CreationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_locationOfInterest, CFSTR("LocationOfInterest"));

}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  void *v22;
  void *v23;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMSuggestion suggestionTrigger](self, "suggestionTrigger"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v23, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMSuggestion suggestionUserType](self, "suggestionUserType"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v22, "hash") ^ v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMSuggestion suppressionReason](self, "suppressionReason"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMSuggestion sessionType](self, "sessionType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4 ^ v6 ^ objc_msgSend(v7, "hash");
  -[SMSuggestion sourceLocation](self, "sourceLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  -[SMSuggestion destinationLocation](self, "destinationLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");
  -[SMSuggestion buddy](self, "buddy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[SMSuggestion dateInterval](self, "dateInterval");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");
  -[SMSuggestion creationDate](self, "creationDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");
  -[SMSuggestion locationOfInterest](self, "locationOfInterest");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v8 ^ v18 ^ objc_msgSend(v19, "hash");

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SMSuggestion *v5;
  SMSuggestion *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;

  v5 = (SMSuggestion *)a3;
  if (self == v5)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v7 = -[SMSuggestion suggestionTrigger](self, "suggestionTrigger");
      if (v7 != -[SMSuggestion suggestionTrigger](v6, "suggestionTrigger")
        || (v8 = -[SMSuggestion suggestionUserType](self, "suggestionUserType"),
            v8 != -[SMSuggestion suggestionUserType](v6, "suggestionUserType"))
        || (v9 = -[SMSuggestion suppressionReason](self, "suppressionReason"),
            v9 != -[SMSuggestion suppressionReason](v6, "suppressionReason"))
        || (v10 = -[SMSuggestion sessionType](self, "sessionType"), v10 != -[SMSuggestion sessionType](v6, "sessionType")))
      {
        v14 = 0;
LABEL_13:

        goto LABEL_14;
      }
      -[SMSuggestion sourceLocation](self, "sourceLocation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSuggestion sourceLocation](v6, "sourceLocation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[SMSuggestion sourceLocation](self, "sourceLocation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMSuggestion sourceLocation](v6, "sourceLocation");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v13;
        if (!objc_msgSend(v13, "isEqual:", v52))
        {
          v14 = 0;
          goto LABEL_43;
        }
      }
      -[SMSuggestion destinationLocation](self, "destinationLocation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSuggestion destinationLocation](v6, "destinationLocation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 != v17)
      {
        -[SMSuggestion destinationLocation](self, "destinationLocation");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMSuggestion destinationLocation](v6, "destinationLocation");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:"))
        {
          v14 = 0;
LABEL_41:

LABEL_42:
          if (v11 == v12)
          {
LABEL_44:

            goto LABEL_13;
          }
LABEL_43:

          goto LABEL_44;
        }
      }
      -[SMSuggestion buddy](self, "buddy");
      v18 = objc_claimAutoreleasedReturnValue();
      -[SMSuggestion buddy](v6, "buddy");
      v19 = objc_claimAutoreleasedReturnValue();
      v50 = (void *)v18;
      v20 = v18 == v19;
      v21 = (void *)v19;
      if (!v20)
      {
        -[SMSuggestion buddy](self, "buddy");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMSuggestion buddy](v6, "buddy");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v22;
        if (!objc_msgSend(v22, "isEqual:", v45))
        {
          v14 = 0;
          v23 = v50;
LABEL_39:

LABEL_40:
          if (v16 == v17)
            goto LABEL_42;
          goto LABEL_41;
        }
      }
      -[SMSuggestion dateInterval](self, "dateInterval");
      v24 = objc_claimAutoreleasedReturnValue();
      -[SMSuggestion dateInterval](v6, "dateInterval");
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = (void *)v24;
      v47 = v21;
      if (v24 == v48)
      {
        v41 = v17;
      }
      else
      {
        v25 = v3;
        -[SMSuggestion dateInterval](self, "dateInterval");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMSuggestion dateInterval](v6, "dateInterval");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v26;
        if (!objc_msgSend(v26, "isEqual:", v43))
        {
          v14 = 0;
          v29 = (void *)v48;
          v3 = v25;
LABEL_37:

LABEL_38:
          v21 = v47;
          v23 = v50;
          if (v50 == v47)
            goto LABEL_40;
          goto LABEL_39;
        }
        v41 = v17;
        v3 = v25;
      }
      -[SMSuggestion creationDate](self, "creationDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSuggestion creationDate](v6, "creationDate");
      v42 = objc_claimAutoreleasedReturnValue();
      if (v27 == (void *)v42)
      {
        v37 = v3;
        v38 = v16;
      }
      else
      {
        -[SMSuggestion creationDate](self, "creationDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMSuggestion creationDate](v6, "creationDate");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v28;
        if (!objc_msgSend(v28, "isEqual:", v39))
        {
          v14 = 0;
          v17 = v41;
          v35 = (void *)v42;
          goto LABEL_35;
        }
        v37 = v3;
        v38 = v16;
      }
      -[SMSuggestion locationOfInterest](self, "locationOfInterest");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSuggestion locationOfInterest](v6, "locationOfInterest");
      v31 = objc_claimAutoreleasedReturnValue();
      if (v30 == (void *)v31)
      {

        v14 = 1;
      }
      else
      {
        v32 = (void *)v31;
        -[SMSuggestion locationOfInterest](self, "locationOfInterest");
        v36 = v27;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMSuggestion locationOfInterest](v6, "locationOfInterest");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v33, "isEqual:", v34);

        v27 = v36;
      }
      v17 = v41;
      v35 = (void *)v42;
      v3 = v37;
      v16 = v38;
      if (v27 == (void *)v42)
      {
LABEL_36:

        v29 = (void *)v48;
        if (v49 == (void *)v48)
          goto LABEL_38;
        goto LABEL_37;
      }
LABEL_35:

      goto LABEL_36;
    }
    v14 = 0;
  }
LABEL_14:

  return v14;
}

- (unint64_t)suggestionTrigger
{
  return self->_suggestionTrigger;
}

- (unint64_t)suggestionUserType
{
  return self->_suggestionUserType;
}

- (unint64_t)suppressionReason
{
  return self->_suppressionReason;
}

- (void)setSuppressionReason:(unint64_t)a3
{
  self->_suppressionReason = a3;
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (RTLocation)sourceLocation
{
  return self->_sourceLocation;
}

- (RTLocation)destinationLocation
{
  return self->_destinationLocation;
}

- (SMContactInformation)buddy
{
  return self->_buddy;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (RTLocationOfInterest)locationOfInterest
{
  return self->_locationOfInterest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationOfInterest, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_buddy, 0);
  objc_storeStrong((id *)&self->_destinationLocation, 0);
  objc_storeStrong((id *)&self->_sourceLocation, 0);
}

@end
