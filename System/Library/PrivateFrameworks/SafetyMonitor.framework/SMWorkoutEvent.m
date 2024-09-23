@implementation SMWorkoutEvent

- (SMWorkoutEvent)initWithIdentifier:(id)a3 sessionIdentifier:(id)a4 location:(id)a5 activityType:(unint64_t)a6 locationType:(int64_t)a7 swimmingLocationType:(int64_t)a8 sessionState:(unint64_t)a9 isResumedSessionState:(BOOL)a10 date:(id)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  SMWorkoutEvent *v19;
  SMWorkoutEvent *v20;
  SMWorkoutEvent *v21;
  objc_super v26;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a11;
  v26.receiver = self;
  v26.super_class = (Class)SMWorkoutEvent;
  v19 = -[SMWorkoutEvent init](&v26, sel_init);
  v20 = v19;
  if (!v19)
    goto LABEL_5;
  v21 = 0;
  if (v16 && v18)
  {
    objc_storeStrong((id *)&v19->_identifier, a3);
    objc_storeStrong((id *)&v20->_sessionIdentifier, a4);
    objc_storeStrong((id *)&v20->_location, a5);
    v20->_activityType = a6;
    v20->_locationType = a7;
    v20->_swimmingLocationType = a8;
    v20->_sessionState = a9;
    v20->_isResumedSessionState = a10;
    objc_storeStrong((id *)&v20->_date, a11);
LABEL_5:
    v21 = v20;
  }

  return v21;
}

- (SMWorkoutEvent)initWithDictionary:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  SMLocation *v11;
  void *v12;
  SMLocation *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  char v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  SMWorkoutEvent *v28;
  uint64_t v30;

  v3 = (objc_class *)MEMORY[0x24BDD1880];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "objectForKey:", CFSTR("__kSMWorkoutEventIdentifierKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);

  v8 = objc_alloc(MEMORY[0x24BDD1880]);
  objc_msgSend(v4, "objectForKey:", CFSTR("__kSMWorkoutEventSessionIdentifierKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithUUIDString:", v9);

  v11 = [SMLocation alloc];
  objc_msgSend(v4, "objectForKey:", CFSTR("__kSMWorkoutEventLocationKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SMLocation initWithDictionary:](v11, "initWithDictionary:", v12);

  objc_msgSend(v4, "objectForKey:", CFSTR("__kSMWorkoutEventActivityTypeKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("__kSMWorkoutEventLocationTypeKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("__kSMWorkoutEventSwimmingLocationTypeKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedIntValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("__kSMWorkoutEventSessionStateKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "unsignedIntValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("__kSMWorkoutEventIsResumedSessionStateKey"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "BOOLValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("__kSMWorkoutEventDateKey"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "doubleValue");
  v26 = v25;

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v30) = v23;
  v28 = -[SMWorkoutEvent initWithIdentifier:sessionIdentifier:location:activityType:locationType:swimmingLocationType:sessionState:isResumedSessionState:date:](self, "initWithIdentifier:sessionIdentifier:location:activityType:locationType:swimmingLocationType:sessionState:isResumedSessionState:date:", v7, v10, v13, v15, v17, v19, v21, v30, v27);

  return v28;
}

- (id)outputToDictionary
{
  id v3;
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
  double v20;
  double v21;
  void *v22;
  void *v23;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[SMWorkoutEvent identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SMWorkoutEvent identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("__kSMWorkoutEventIdentifierKey"));

  }
  -[SMWorkoutEvent sessionIdentifier](self, "sessionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SMWorkoutEvent sessionIdentifier](self, "sessionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("__kSMWorkoutEventSessionIdentifierKey"));

  }
  -[SMWorkoutEvent location](self, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SMWorkoutEvent location](self, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "outputToDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("__kSMWorkoutEventLocationKey"));
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMWorkoutEvent activityType](self, "activityType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("__kSMWorkoutEventActivityTypeKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SMWorkoutEvent locationType](self, "locationType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("__kSMWorkoutEventLocationTypeKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SMWorkoutEvent swimmingLocationType](self, "swimmingLocationType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("__kSMWorkoutEventSwimmingLocationTypeKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMWorkoutEvent sessionState](self, "sessionState"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("__kSMWorkoutEventSessionStateKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SMWorkoutEvent isResumedSessionState](self, "isResumedSessionState"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("__kSMWorkoutEventIsResumedSessionStateKey"));

  -[SMWorkoutEvent date](self, "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[SMWorkoutEvent date](self, "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSince1970");
    v21 = v20;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("__kSMWorkoutEventDateKey"));

  }
  v23 = (void *)objc_msgSend(v3, "copy");

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMWorkoutEvent)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void *v12;
  SMWorkoutEvent *v13;
  uint64_t v15;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMWorkoutEventIdentifierKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMWorkoutEventSessionIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMWorkoutEventLocationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (int)objc_msgSend(v3, "decodeIntForKey:", CFSTR("__kSMWorkoutEventActivityTypeKey"));
  v8 = (int)objc_msgSend(v3, "decodeIntForKey:", CFSTR("__kSMWorkoutEventLocationTypeKey"));
  v9 = (int)objc_msgSend(v3, "decodeIntForKey:", CFSTR("__kSMWorkoutEventSwimmingLocationTypeKey"));
  v10 = (int)objc_msgSend(v3, "decodeIntForKey:", CFSTR("__kSMWorkoutEventSessionStateKey"));
  v11 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("__kSMWorkoutEventIsResumedSessionStateKey"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMWorkoutEventDateKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v15) = v11;
  v13 = -[SMWorkoutEvent initWithIdentifier:sessionIdentifier:location:activityType:locationType:swimmingLocationType:sessionState:isResumedSessionState:date:](self, "initWithIdentifier:sessionIdentifier:location:activityType:locationType:swimmingLocationType:sessionState:isResumedSessionState:date:", v4, v5, v6, v7, v8, v9, v10, v15, v12);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SMWorkoutEvent identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("__kSMWorkoutEventIdentifierKey"));

  -[SMWorkoutEvent sessionIdentifier](self, "sessionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("__kSMWorkoutEventSessionIdentifierKey"));

  -[SMWorkoutEvent location](self, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("__kSMWorkoutEventLocationKey"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SMWorkoutEvent activityType](self, "activityType"), CFSTR("__kSMWorkoutEventActivityTypeKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SMWorkoutEvent locationType](self, "locationType"), CFSTR("__kSMWorkoutEventLocationTypeKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SMWorkoutEvent swimmingLocationType](self, "swimmingLocationType"), CFSTR("__kSMWorkoutEventSwimmingLocationTypeKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SMWorkoutEvent sessionState](self, "sessionState"), CFSTR("__kSMWorkoutEventSessionStateKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SMWorkoutEvent isResumedSessionState](self, "isResumedSessionState"), CFSTR("__kSMWorkoutEventIsResumedSessionStateKey"));
  -[SMWorkoutEvent date](self, "date");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("__kSMWorkoutEventDateKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  LOBYTE(v6) = self->_isResumedSessionState;
  return (id)objc_msgSend(v4, "initWithIdentifier:sessionIdentifier:location:activityType:locationType:swimmingLocationType:sessionState:isResumedSessionState:date:", self->_identifier, self->_sessionIdentifier, self->_location, self->_activityType, self->_locationType, self->_swimmingLocationType, self->_sessionState, v6, self->_date);
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  int64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;

  -[SMWorkoutEvent sessionIdentifier](self, "sessionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SMWorkoutEvent sessionIdentifier](self, "sessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SMWorkoutEvent location](self, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ objc_msgSend(v8, "hash");
  v10 = -[SMWorkoutEvent activityType](self, "activityType");
  v11 = v10 ^ -[SMWorkoutEvent locationType](self, "locationType");
  v12 = v11 ^ -[SMWorkoutEvent swimmingLocationType](self, "swimmingLocationType");
  v13 = v9 ^ v12 ^ -[SMWorkoutEvent sessionState](self, "sessionState");
  v14 = -[SMWorkoutEvent isResumedSessionState](self, "isResumedSessionState");
  -[SMWorkoutEvent date](self, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v13 ^ v14 ^ objc_msgSend(v15, "hash");

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  SMWorkoutEvent *v4;
  SMWorkoutEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  int64_t v18;
  int64_t v19;
  unint64_t v20;
  _BOOL4 v21;
  BOOL v22;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v4 = (SMWorkoutEvent *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SMWorkoutEvent identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMWorkoutEvent identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != v7)
      {
        -[SMWorkoutEvent identifier](self, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMWorkoutEvent identifier](v5, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v8, "isEqual:", v9))
        {
          v10 = 0;
          goto LABEL_24;
        }
        v37 = v9;
        v38 = v8;
      }
      -[SMWorkoutEvent sessionIdentifier](self, "sessionIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMWorkoutEvent sessionIdentifier](v5, "sessionIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[SMWorkoutEvent sessionIdentifier](self, "sessionIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMWorkoutEvent sessionIdentifier](v5, "sessionIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:", v14))
        {
          v10 = 0;
          goto LABEL_22;
        }
        v35 = v14;
        v36 = v13;
      }
      -[SMWorkoutEvent location](self, "location");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMWorkoutEvent location](v5, "location");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isEquivalent:", v16)
        && (v17 = -[SMWorkoutEvent activityType](self, "activityType"),
            v17 == -[SMWorkoutEvent activityType](v5, "activityType"))
        && (v18 = -[SMWorkoutEvent locationType](self, "locationType"),
            v18 == -[SMWorkoutEvent locationType](v5, "locationType"))
        && (v19 = -[SMWorkoutEvent swimmingLocationType](self, "swimmingLocationType"),
            v19 == -[SMWorkoutEvent swimmingLocationType](v5, "swimmingLocationType"))
        && (v20 = -[SMWorkoutEvent sessionState](self, "sessionState"),
            v20 == -[SMWorkoutEvent sessionState](v5, "sessionState"))
        && (v21 = -[SMWorkoutEvent isResumedSessionState](self, "isResumedSessionState"),
            v21 == -[SMWorkoutEvent isResumedSessionState](v5, "isResumedSessionState")))
      {
        -[SMWorkoutEvent date](self, "date");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "timeIntervalSince1970");
        v26 = v25;
        -[SMWorkoutEvent date](v5, "date");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "timeIntervalSince1970");
        if (v26 == v27)
        {
          v10 = 1;
        }
        else
        {
          -[SMWorkoutEvent date](self, "date");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "timeIntervalSince1970");
          v29 = v28;
          -[SMWorkoutEvent date](v5, "date");
          v33 = v24;
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "timeIntervalSince1970");
          v10 = vabdd_f64(v29, v31) < 2.22044605e-16;

          v24 = v33;
        }

        v22 = v10;
      }
      else
      {

        v10 = 0;
        v22 = 0;
      }
      v14 = v35;
      v13 = v36;
      if (v11 == v12)
      {

        v10 = v22;
        goto LABEL_23;
      }
LABEL_22:

LABEL_23:
      v9 = v37;
      v8 = v38;
      if (v6 == v7)
      {
LABEL_25:

        goto LABEL_26;
      }
LABEL_24:

      goto LABEL_25;
    }
    v10 = 0;
  }
LABEL_26:

  return v10;
}

- (id)description
{
  void *v2;
  _BOOL8 isResumedSessionState;
  unint64_t sessionState;
  void *v5;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v9 = *(_OWORD *)&self->_location;
  v10 = *(_OWORD *)&self->_identifier;
  v8 = *(_OWORD *)&self->_locationType;
  isResumedSessionState = self->_isResumedSessionState;
  sessionState = self->_sessionState;
  -[NSDate stringFromDate](self->_date, "stringFromDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("identifier, %@, sessionIdentifier, %@, location, %@, activityType, %lu, locationType, %lu swimmingLocationType, %lu sessionState, %lu, isResumedSessionState, %d, date, %@"), v10, v9, v8, sessionState, isResumedSessionState, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (SMLocation)location
{
  return self->_location;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (int64_t)locationType
{
  return self->_locationType;
}

- (int64_t)swimmingLocationType
{
  return self->_swimmingLocationType;
}

- (unint64_t)sessionState
{
  return self->_sessionState;
}

- (BOOL)isResumedSessionState
{
  return self->_isResumedSessionState;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
