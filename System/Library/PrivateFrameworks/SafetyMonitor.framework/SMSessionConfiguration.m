@implementation SMSessionConfiguration

- (id)initTimeBoundSessionConfigurationWithConversation:(id)a3 sessionID:(id)a4 time:(id)a5 sessionSupportsHandoff:(BOOL)a6 sosReceivers:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  SMSessionConfiguration *v18;
  uint64_t v20;

  v12 = (void *)MEMORY[0x24BDBCE60];
  v13 = a7;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v12, "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = a6;
  v18 = -[SMSessionConfiguration initWithConversation:sessionID:sessionStartDate:sessionType:time:destination:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:sessionWorkoutType:](self, "initWithConversation:sessionID:sessionStartDate:sessionType:time:destination:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:sessionWorkoutType:", v16, v15, v17, 1, v14, 0, 0, v20, v13, 0);

  return v18;
}

- (id)initTimeBoundSessionConfigurationWithConversation:(id)a3 sessionID:(id)a4 time:(id)a5 sessionStartDate:(id)a6 sessionSupportsHandoff:(BOOL)a7 sosReceivers:(id)a8
{
  uint64_t v9;

  LOBYTE(v9) = a7;
  return -[SMSessionConfiguration initWithConversation:sessionID:sessionStartDate:sessionType:time:destination:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:sessionWorkoutType:](self, "initWithConversation:sessionID:sessionStartDate:sessionType:time:destination:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:sessionWorkoutType:", a3, a4, a6, 1, a5, 0, 0, v9, a8, 0);
}

- (id)initDestinationBoundSessionConfigurationWithConversation:(id)a3 sessionID:(id)a4 destination:(id)a5 sessionStartDate:(id)a6 userResponseSafeDate:(id)a7 sessionSupportsHandoff:(BOOL)a8 sosReceivers:(id)a9
{
  uint64_t v10;

  LOBYTE(v10) = a8;
  return -[SMSessionConfiguration initWithConversation:sessionID:sessionStartDate:sessionType:time:destination:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:sessionWorkoutType:](self, "initWithConversation:sessionID:sessionStartDate:sessionType:time:destination:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:sessionWorkoutType:", a3, a4, a6, 2, 0, a5, a7, v10, a9, 0);
}

- (id)initRoundTripSessionConfigurationWithConversation:(id)a3 sessionID:(id)a4 destination:(id)a5 sessionStartDate:(id)a6 userResponseSafeDate:(id)a7 sessionSupportsHandoff:(BOOL)a8 sosReceivers:(id)a9
{
  uint64_t v10;

  LOBYTE(v10) = a8;
  return -[SMSessionConfiguration initWithConversation:sessionID:sessionStartDate:sessionType:time:destination:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:sessionWorkoutType:](self, "initWithConversation:sessionID:sessionStartDate:sessionType:time:destination:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:sessionWorkoutType:", a3, a4, a6, 3, 0, a5, a7, v10, a9, 0);
}

- (id)initWorkoutBoundSessionConfigurationWithConversation:(id)a3 sessionID:(id)a4 sessionStartDate:(id)a5 sessionSupportsHandoff:(BOOL)a6 sosReceivers:(id)a7 sessionWorkoutType:(unint64_t)a8
{
  SMSessionConfiguration *v8;
  SMSessionConfiguration *v9;
  NSObject *v10;
  uint64_t v12;
  uint8_t buf[16];

  v8 = self;
  if (a8)
  {
    LOBYTE(v12) = a6;
    v8 = -[SMSessionConfiguration initWithConversation:sessionID:sessionStartDate:sessionType:time:destination:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:sessionWorkoutType:](self, "initWithConversation:sessionID:sessionStartDate:sessionType:time:destination:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:sessionWorkoutType:", a3, a4, a5, 4, 0, 0, 0, v12, a7, a8);
    v9 = v8;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245521000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionWorkoutType != RTHKWorkoutActivityTypeUnknown", buf, 2u);
    }

    v9 = 0;
  }

  return v9;
}

- (SMSessionConfiguration)initWithConversation:(id)a3 sessionID:(id)a4 sessionStartDate:(id)a5 sessionType:(unint64_t)a6 time:(id)a7 destination:(id)a8 userResponseSafeDate:(id)a9 sessionSupportsHandoff:(BOOL)a10 sosReceivers:(id)a11 sessionWorkoutType:(unint64_t)a12
{
  id v18;
  id v19;
  SMSessionConfiguration *v20;
  SMSessionConfiguration *v21;
  SMSessionConfiguration *v22;
  NSObject *v23;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  objc_super v31;
  uint8_t buf[16];

  v30 = a3;
  v18 = a4;
  v29 = a5;
  v28 = a7;
  v27 = a8;
  v26 = a9;
  v19 = a11;
  if (v18)
  {
    v31.receiver = self;
    v31.super_class = (Class)SMSessionConfiguration;
    v20 = -[SMSessionConfiguration init](&v31, sel_init);
    v21 = v20;
    if (v20)
    {
      objc_storeStrong((id *)&v20->_conversation, a3);
      objc_storeStrong((id *)&v21->_sessionID, a4);
      objc_storeStrong((id *)&v21->_sessionStartDate, a5);
      v21->_sessionType = a6;
      objc_storeStrong((id *)&v21->_time, a7);
      objc_storeStrong((id *)&v21->_destination, a8);
      objc_storeStrong((id *)&v21->_userResponseSafeDate, a9);
      v21->_sessionSupportsHandoff = a10;
      objc_storeStrong((id *)&v21->_sosReceivers, a11);
      v21->_sessionWorkoutType = a12;
    }
    self = v21;
    v22 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245521000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionID", buf, 2u);
    }

    v22 = 0;
  }

  return v22;
}

- (id)copyConfigurationWithNewSessionID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  SMSessionConfiguration *v13;
  uint64_t v15;
  SMSessionConfiguration *v16;

  v4 = a3;
  v16 = [SMSessionConfiguration alloc];
  -[SMSessionConfiguration conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionConfiguration sessionStartDate](self, "sessionStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SMSessionConfiguration sessionType](self, "sessionType");
  -[SMSessionConfiguration time](self, "time");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionConfiguration destination](self, "destination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionConfiguration userResponseSafeDate](self, "userResponseSafeDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SMSessionConfiguration sessionSupportsHandoff](self, "sessionSupportsHandoff");
  -[SMSessionConfiguration sosReceivers](self, "sosReceivers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = v11;
  v13 = -[SMSessionConfiguration initWithConversation:sessionID:sessionStartDate:sessionType:time:destination:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:sessionWorkoutType:](v16, "initWithConversation:sessionID:sessionStartDate:sessionType:time:destination:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:sessionWorkoutType:", v5, v4, v6, v7, v8, v9, v10, v15, v12, -[SMSessionConfiguration sessionWorkoutType](self, "sessionWorkoutType"));

  return v13;
}

- (id)estimatedEndDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[SMSessionConfiguration sessionType](self, "sessionType") == 2)
  {
    -[SMSessionConfiguration destination](self, "destination");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[SMSessionConfiguration destination](self, "destination");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "eta");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "etaDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
      return v6;
    }
  }
  if (-[SMSessionConfiguration sessionType](self, "sessionType") == 1)
  {
    -[SMSessionConfiguration time](self, "time");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[SMSessionConfiguration time](self, "time");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timeBound");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  if (-[SMSessionConfiguration sessionType](self, "sessionType") == 4)
  {
    -[NSDate dateByAddingTimeInterval:](self->_sessionStartDate, "dateByAddingTimeInterval:", 3600.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)coarseEstimatedEndDate
{
  void *v2;
  void *v3;

  -[SMSessionConfiguration estimatedEndDate](self, "estimatedEndDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "roundedTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)sessionTypeToString:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return CFSTR("Unknown");
  else
    return *(&off_25166EC08 + a3 - 1);
}

+ (BOOL)configurationIsValid:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "conversation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      if (!objc_msgSend(v3, "sessionType"))
        goto LABEL_11;
      if (objc_msgSend(v3, "sessionType") != 2
        || (objc_msgSend(v3, "destination"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, v4))
      {
        if (objc_msgSend(v3, "sessionType") != 1
          || (objc_msgSend(v3, "time"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, v4))
        {
          if (objc_msgSend(v3, "sessionType") != 4 || objc_msgSend(v3, "sessionWorkoutType"))
          {
            LOBYTE(v4) = 1;
            goto LABEL_12;
          }
LABEL_11:
          LOBYTE(v4) = 0;
        }
      }
    }
  }
LABEL_12:

  return (char)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMSessionConfiguration)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  SMSessionConfiguration *v13;
  uint64_t v15;
  void *v16;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionConfigurationConversationKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionConfigurationSessionIDKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionConfigurationStartDateKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("__kSMSessionConfigurationTypeKey"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionConfigurationTimeKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionConfigurationDestinationKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionConfigurationUserResponseSafeDateKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("__kSMSessionConfigurationSessionSupportsHandoffKey"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionConfigurationSOSReceiversKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("__kSMSessionConfigurationSessionWorkoutTypeKey"));

  LOBYTE(v15) = v10;
  v13 = -[SMSessionConfiguration initWithConversation:sessionID:sessionStartDate:sessionType:time:destination:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:sessionWorkoutType:](self, "initWithConversation:sessionID:sessionStartDate:sessionType:time:destination:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:sessionWorkoutType:", v16, v4, v5, v6, v7, v8, v9, v15, v11, v12);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  SMConversation *conversation;
  id v5;

  conversation = self->_conversation;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", conversation, CFSTR("__kSMSessionConfigurationConversationKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionID, CFSTR("__kSMSessionConfigurationSessionIDKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionStartDate, CFSTR("__kSMSessionConfigurationStartDateKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sessionType, CFSTR("__kSMSessionConfigurationTypeKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_time, CFSTR("__kSMSessionConfigurationTimeKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_destination, CFSTR("__kSMSessionConfigurationDestinationKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userResponseSafeDate, CFSTR("__kSMSessionConfigurationUserResponseSafeDateKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_sessionSupportsHandoff, CFSTR("__kSMSessionConfigurationSessionSupportsHandoffKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sosReceivers, CFSTR("__kSMSessionConfigurationSOSReceiversKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sessionWorkoutType, CFSTR("__kSMSessionConfigurationSessionWorkoutTypeKey"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;

  -[SMSessionConfiguration conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SMSessionConfiguration sessionID](self, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SMSessionConfiguration sessionStartDate](self, "sessionStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[SMSessionConfiguration sessionType](self, "sessionType");
  -[SMSessionConfiguration time](self, "time");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[SMSessionConfiguration destination](self, "destination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");
  -[SMSessionConfiguration userResponseSafeDate](self, "userResponseSafeDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9 ^ v13 ^ objc_msgSend(v14, "hash");
  v16 = -[SMSessionConfiguration sessionSupportsHandoff](self, "sessionSupportsHandoff");
  -[SMSessionConfiguration sosReceivers](self, "sosReceivers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v15 ^ v16 ^ objc_msgSend(v17, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMSessionConfiguration sessionWorkoutType](self, "sessionWorkoutType"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 ^ objc_msgSend(v19, "hash");

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SMSessionConfiguration *v6;
  SMSessionConfiguration *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  unint64_t v19;
  BOOL v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  _BOOL4 v34;
  uint64_t v36;
  void *v37;
  int v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;

  v6 = (SMSessionConfiguration *)a3;
  if (self == v6)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[SMSessionConfiguration conversation](self, "conversation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSessionConfiguration conversation](v7, "conversation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[SMSessionConfiguration conversation](self, "conversation");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMSessionConfiguration conversation](v7, "conversation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v10))
        {
          v11 = 0;
          goto LABEL_36;
        }
        v56 = v10;
        v57 = v3;
      }
      -[SMSessionConfiguration sessionID](self, "sessionID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSessionConfiguration sessionID](v7, "sessionID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 != v13)
      {
        -[SMSessionConfiguration sessionID](self, "sessionID");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMSessionConfiguration sessionID](v7, "sessionID");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
          goto LABEL_19;
      }
      v55 = v4;
      -[SMSessionConfiguration sessionStartDate](self, "sessionStartDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSince1970");
      v16 = v15;
      -[SMSessionConfiguration sessionStartDate](v7, "sessionStartDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSince1970");
      if (v16 != v18
        || (v54 = v3,
            v19 = -[SMSessionConfiguration sessionType](self, "sessionType"),
            v20 = v19 == -[SMSessionConfiguration sessionType](v7, "sessionType"),
            v3 = v54,
            !v20))
      {

        v4 = v55;
        if (v12 == v13)
        {

          goto LABEL_21;
        }
LABEL_19:

LABEL_21:
        v11 = 0;
        goto LABEL_35;
      }
      v51 = v17;
      v21 = v14;
      -[SMSessionConfiguration time](self, "time");
      v22 = objc_claimAutoreleasedReturnValue();
      -[SMSessionConfiguration time](v7, "time");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (void *)v22;
      if ((void *)v22 != v52)
      {
        -[SMSessionConfiguration time](self, "time");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMSessionConfiguration time](v7, "time");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v23;
        if (!objc_msgSend(v23, "isEqual:", v48))
        {
          v11 = 0;
          v24 = v21;
          v25 = v51;
LABEL_29:

LABEL_30:
          if (v12 == v13)
          {

            goto LABEL_34;
          }
LABEL_31:

LABEL_32:
LABEL_34:

LABEL_35:
          v10 = v56;
          v3 = v57;
          if (v8 == v9)
          {
LABEL_37:

            goto LABEL_38;
          }
LABEL_36:

          goto LABEL_37;
        }
      }
      v47 = v21;
      -[SMSessionConfiguration destination](self, "destination");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSessionConfiguration destination](v7, "destination");
      v50 = objc_claimAutoreleasedReturnValue();
      if (v26 != (void *)v50)
      {
        -[SMSessionConfiguration destination](self, "destination");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMSessionConfiguration destination](v7, "destination");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v27;
        if (!objc_msgSend(v27, "isEqual:", v45))
        {
          v11 = 0;
          v28 = (void *)v50;
          goto LABEL_28;
        }
      }
      -[SMSessionConfiguration userResponseSafeDate](self, "userResponseSafeDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "timeIntervalSince1970");
      v31 = v30;
      -[SMSessionConfiguration userResponseSafeDate](v7, "userResponseSafeDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "timeIntervalSince1970");
      if (v31 != v33
        || (v44 = v32,
            v34 = -[SMSessionConfiguration sessionSupportsHandoff](self, "sessionSupportsHandoff"),
            v20 = v34 == -[SMSessionConfiguration sessionSupportsHandoff](v7, "sessionSupportsHandoff"),
            v32 = v44,
            !v20))
      {

        v11 = 0;
        v28 = (void *)v50;
        v3 = v54;
        if (v26 != (void *)v50)
          goto LABEL_28;
        goto LABEL_46;
      }
      -[SMSessionConfiguration sosReceivers](self, "sosReceivers");
      v36 = objc_claimAutoreleasedReturnValue();
      -[SMSessionConfiguration sosReceivers](v7, "sosReceivers");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)v36;
      if ((void *)v36 == v42)
      {
        v3 = v54;
      }
      else
      {
        -[SMSessionConfiguration sosReceivers](self, "sosReceivers");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMSessionConfiguration sosReceivers](v7, "sosReceivers");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v37;
        v38 = objc_msgSend(v37, "isEqual:", v40);
        v3 = v54;
        if (!v38)
        {
          v11 = 0;
LABEL_44:

LABEL_45:
          v28 = (void *)v50;
          if (v26 != (void *)v50)
          {
LABEL_28:

            v24 = v47;
            v25 = v51;
            if (v53 == v52)
              goto LABEL_30;
            goto LABEL_29;
          }
LABEL_46:

          if (v53 != v52)
          {

          }
          if (v12 == v13)
            goto LABEL_32;
          goto LABEL_31;
        }
      }
      v39 = -[SMSessionConfiguration sessionWorkoutType](self, "sessionWorkoutType");
      v11 = v39 == -[SMSessionConfiguration sessionWorkoutType](v7, "sessionWorkoutType");
      if (v43 == v42)
        goto LABEL_45;
      goto LABEL_44;
    }
    v11 = 0;
  }
LABEL_38:

  return v11;
}

- (BOOL)isSameSession:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  -[SMSessionConfiguration conversation](self, "conversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "conversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != v8)
  {
    -[SMSessionConfiguration conversation](self, "conversation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "conversation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqual:", v4))
    {
      v9 = 0;
LABEL_8:

      goto LABEL_9;
    }
  }
  -[SMSessionConfiguration sessionID](self, "sessionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sessionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == v11)
  {
    v9 = 1;
  }
  else
  {
    -[SMSessionConfiguration sessionID](self, "sessionID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v12, "isEqual:", v13);

  }
  if (v7 != v8)
    goto LABEL_8;
LABEL_9:

  return v9;
}

- (SMSessionConfiguration)initWithDictionary:(id)a3
{
  id v3;
  SMSessionTime *v4;
  SMSessionDestination *v5;
  SMConversation *v6;
  NSObject *v7;
  SMHandle *v8;
  SMHandle *v9;
  SMConversation *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  SMConversation *v27;
  void *v28;
  SMConversation *v29;
  SMSessionConfiguration *v30;
  SMSessionConfiguration *v31;
  NSObject *v32;
  SMSessionConfiguration *v33;
  id v34;
  uint64_t v36;
  SMSessionDestination *v37;
  SMSessionTime *v38;
  void *v39;
  void *v40;
  void *v42;
  SMHandle *v43;
  uint8_t buf[4];
  const char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = -[SMSessionTime initWithDictionary:]([SMSessionTime alloc], "initWithDictionary:", v3);
  v5 = -[SMSessionDestination initWithDictionary:]([SMSessionDestination alloc], "initWithDictionary:", v3);
  v6 = -[SMConversation initWithDictionary:]([SMConversation alloc], "initWithDictionary:", v3);
  if (v6)
  {
LABEL_6:
    objc_msgSend(v3, "valueForKey:", CFSTR("__kSMSessionConfigurationStartDateKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v12;
    if (v12)
    {
      v13 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(v12, "doubleValue");
      objc_msgSend(v13, "dateWithTimeIntervalSince1970:");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v42 = 0;
    }
    objc_msgSend(v3, "valueForKey:", CFSTR("__kSMSessionConfigurationUserResponseSafeDateKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(v14, "doubleValue");
      objc_msgSend(v16, "dateWithTimeIntervalSince1970:");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v40 = 0;
    }
    objc_msgSend(v3, "valueForKey:", CFSTR("__kSMSessionConfigurationTypeKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "intValue");
    v19 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v3, "valueForKey:", CFSTR("__kSMSessionConfigurationSessionIDKey"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithUUIDString:", v20);

    if (v21)
    {
      v37 = v5;
      v38 = v4;
      v22 = v18;
      objc_msgSend(v3, "valueForKey:", CFSTR("__kSMSessionConfigurationSessionSupportsHandoffKey"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "BOOLValue");

      objc_msgSend(v3, "valueForKey:", CFSTR("__kSMSessionConfigurationSessionWorkoutTypeKey"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "integerValue");

      v27 = [SMConversation alloc];
      objc_msgSend(v3, "valueForKey:", CFSTR("__kSMSessionConfigurationSOSReceiversKey"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[SMConversation initWithDictionary:](v27, "initWithDictionary:", v28);

      switch(v22)
      {
        case 1:
          v4 = v38;
          v30 = (SMSessionConfiguration *)-[SMSessionConfiguration initTimeBoundSessionConfigurationWithConversation:sessionID:time:sessionStartDate:sessionSupportsHandoff:sosReceivers:](self, "initTimeBoundSessionConfigurationWithConversation:sessionID:time:sessionStartDate:sessionSupportsHandoff:sosReceivers:", v6, v21, v38, v42, v24, v29);
          v31 = v30;
          v5 = v37;
          break;
        case 2:
          v5 = v37;
          v34 = -[SMSessionConfiguration initDestinationBoundSessionConfigurationWithConversation:sessionID:destination:sessionStartDate:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:](self, "initDestinationBoundSessionConfigurationWithConversation:sessionID:destination:sessionStartDate:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:", v6, v21, v37, v42, v40, v24, v29);
          goto LABEL_23;
        case 3:
          v5 = v37;
          v34 = -[SMSessionConfiguration initRoundTripSessionConfigurationWithConversation:sessionID:destination:sessionStartDate:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:](self, "initRoundTripSessionConfigurationWithConversation:sessionID:destination:sessionStartDate:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:", v6, v21, v37, v42, v40, v24, v29);
LABEL_23:
          v30 = (SMSessionConfiguration *)v34;
          v31 = v30;
          v4 = v38;
          break;
        case 4:
          v30 = (SMSessionConfiguration *)-[SMSessionConfiguration initWorkoutBoundSessionConfigurationWithConversation:sessionID:sessionStartDate:sessionSupportsHandoff:sosReceivers:sessionWorkoutType:](self, "initWorkoutBoundSessionConfigurationWithConversation:sessionID:sessionStartDate:sessionSupportsHandoff:sosReceivers:sessionWorkoutType:", v6, v21, v42, v24, v29, v26);
          v31 = v30;
          v5 = v37;
          v4 = v38;
          break;
        default:
          LOBYTE(v36) = v24;
          v30 = -[SMSessionConfiguration initWithConversation:sessionID:sessionStartDate:sessionType:time:destination:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:sessionWorkoutType:]([SMSessionConfiguration alloc], "initWithConversation:sessionID:sessionStartDate:sessionType:time:destination:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:sessionWorkoutType:", v6, v21, 0, v22, 0, 0, 0, v36, v29, 0);
          v5 = v37;
          v4 = v38;
          v31 = self;
          break;
      }
      v32 = v30;

      v33 = (SMSessionConfiguration *)v32;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v45 = "-[SMSessionConfiguration initWithDictionary:]";
        _os_log_error_impl(&dword_245521000, v32, OS_LOG_TYPE_ERROR, "%s, sessionID is nil", buf, 0xCu);
      }
      v33 = 0;
      v31 = self;
    }

    goto LABEL_28;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[SMSessionConfiguration initWithDictionary:]";
    _os_log_error_impl(&dword_245521000, v7, OS_LOG_TYPE_ERROR, "%s, conversation is nil", buf, 0xCu);
  }

  v8 = -[SMHandle initWithDictionary:]([SMHandle alloc], "initWithDictionary:", v3);
  if (v8)
  {
    v9 = v8;
    v10 = [SMConversation alloc];
    v43 = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SMConversation initWithReceiverHandles:identifier:displayName:](v10, "initWithReceiverHandles:identifier:displayName:", v11, 0, 0);

    goto LABEL_6;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = (SMConversation *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[SMSessionConfiguration initWithDictionary:]";
    _os_log_error_impl(&dword_245521000, &v6->super, OS_LOG_TYPE_ERROR, "%s, toHandle is nil", buf, 0xCu);
  }
  v33 = 0;
  v31 = self;
LABEL_28:

  return v33;
}

- (id)outputToDictionary
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v3 = (void *)objc_opt_new();
  -[SMSessionConfiguration conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputToDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "addEntriesFromDictionary:", v5);
  -[SMSessionConfiguration conversation](self, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "receiverHandles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "outputToDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v3, "addEntriesFromDictionary:", v9);
  -[SMSessionConfiguration time](self, "time");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SMSessionConfiguration time](self, "time");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "outputToDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addEntriesFromDictionary:", v12);

  }
  -[SMSessionConfiguration destination](self, "destination");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SMSessionConfiguration destination](self, "destination");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "outputToDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addEntriesFromDictionary:", v15);

  }
  -[SMSessionConfiguration sessionStartDate](self, "sessionStartDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)MEMORY[0x24BDD16E0];
    -[SMSessionConfiguration sessionStartDate](self, "sessionStartDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSince1970");
    objc_msgSend(v17, "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("__kSMSessionConfigurationStartDateKey"));

  }
  -[SMSessionConfiguration userResponseSafeDate](self, "userResponseSafeDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = (void *)MEMORY[0x24BDD16E0];
    -[SMSessionConfiguration userResponseSafeDate](self, "userResponseSafeDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "timeIntervalSince1970");
    objc_msgSend(v21, "numberWithDouble:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("__kSMSessionConfigurationUserResponseSafeDateKey"));

  }
  -[SMSessionConfiguration sosReceivers](self, "sosReceivers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[SMSessionConfiguration sosReceivers](self, "sosReceivers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "outputToDictionary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("__kSMSessionConfigurationSOSReceiversKey"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SMSessionConfiguration sessionSupportsHandoff](self, "sessionSupportsHandoff"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("__kSMSessionConfigurationSessionSupportsHandoffKey"));

  -[SMSessionConfiguration sessionID](self, "sessionID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "UUIDString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("__kSMSessionConfigurationSessionIDKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMSessionConfiguration sessionType](self, "sessionType"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("__kSMSessionConfigurationTypeKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMSessionConfiguration sessionWorkoutType](self, "sessionWorkoutType"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("__kSMSessionConfigurationSessionWorkoutTypeKey"));

  return v3;
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
  _BOOL4 v10;
  void *v11;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v15 = (id)MEMORY[0x24BDD17C8];
  -[SMSessionConfiguration conversation](self, "conversation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "receiverHandles");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionConfiguration conversation](self, "conversation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionConfiguration sessionID](self, "sessionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionConfiguration sessionStartDate](self, "sessionStartDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringFromDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMSessionConfiguration sessionTypeToString:](SMSessionConfiguration, "sessionTypeToString:", -[SMSessionConfiguration sessionType](self, "sessionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionConfiguration time](self, "time");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionConfiguration destination](self, "destination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionConfiguration userResponseSafeDate](self, "userResponseSafeDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SMSessionConfiguration sessionSupportsHandoff](self, "sessionSupportsHandoff");
  -[SMSessionConfiguration sosReceivers](self, "sosReceivers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("{ReceiverHandles:%@, GroupID:%@, SessionID:%@, SessionStartDate:%@, SessionType:%@, Time:%@, Destination:%@ , userResponseSafeDate:%@, SessionSupportsHandoff:%d,SOSReceivers:%@, SessionWorkoutType:%lu}"), v14, v13, v3, v4, v5, v6, v7, v9, v10, v11, -[SMSessionConfiguration sessionWorkoutType](self, "sessionWorkoutType"));
  v16 = (id)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (SMHandle)handle
{
  void *v2;
  void *v3;
  void *v4;

  -[SMSessionConfiguration conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "receiverHandles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SMHandle *)v4;
}

- (SMConversation)conversation
{
  return self->_conversation;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (SMSessionTime)time
{
  return self->_time;
}

- (SMSessionDestination)destination
{
  return self->_destination;
}

- (NSDate)sessionStartDate
{
  return self->_sessionStartDate;
}

- (NSDate)userResponseSafeDate
{
  return self->_userResponseSafeDate;
}

- (BOOL)sessionSupportsHandoff
{
  return self->_sessionSupportsHandoff;
}

- (void)setSessionSupportsHandoff:(BOOL)a3
{
  self->_sessionSupportsHandoff = a3;
}

- (unint64_t)sessionWorkoutType
{
  return self->_sessionWorkoutType;
}

- (void)setSessionWorkoutType:(unint64_t)a3
{
  self->_sessionWorkoutType = a3;
}

- (SMConversation)sosReceivers
{
  return self->_sosReceivers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sosReceivers, 0);
  objc_storeStrong((id *)&self->_userResponseSafeDate, 0);
  objc_storeStrong((id *)&self->_sessionStartDate, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
}

@end
