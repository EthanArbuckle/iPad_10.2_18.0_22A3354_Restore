@implementation PPEventNameRecord

- (PPEventNameRecord)initWithIdentifier:(id)a3 score:(double)a4 eventIdentifier:(id)a5 changeType:(unsigned __int8)a6 title:(id)a7 location:(id)a8 participantNames:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  PPEventNameRecord *v21;
  uint64_t v22;
  NSString *identifier;
  uint64_t v24;
  NSString *eventIdentifier;
  uint64_t v26;
  NSString *title;
  uint64_t v28;
  NSString *location;
  objc_super v31;

  v16 = a3;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v31.receiver = self;
  v31.super_class = (Class)PPEventNameRecord;
  v21 = -[PPEventNameRecord init](&v31, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v16, "copy");
    identifier = v21->_identifier;
    v21->_identifier = (NSString *)v22;

    v21->_score = a4;
    v24 = objc_msgSend(v17, "copy");
    eventIdentifier = v21->_eventIdentifier;
    v21->_eventIdentifier = (NSString *)v24;

    v21->_changeType = a6;
    v26 = objc_msgSend(v18, "copy");
    title = v21->_title;
    v21->_title = (NSString *)v26;

    v28 = objc_msgSend(v19, "copy");
    location = v21->_location;
    v21->_location = (NSString *)v28;

    objc_storeStrong((id *)&v21->_participantNames, a9);
  }

  return v21;
}

- (id)description
{
  id v3;
  NSArray *participantNames;
  double score;
  void *v6;
  void *v7;
  __int128 v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v9 = *(_OWORD *)&self->_title;
  participantNames = self->_participantNames;
  score = self->_score;
  +[PPEventNameRecord describeChangeType:](PPEventNameRecord, "describeChangeType:", -[PPEventNameRecord changeType](self, "changeType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<PPEventNameRecord t:'%@' l:'%@' p:%@ s:%f ct:%@>"), v9, participantNames, *(_QWORD *)&score, v6);

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = (unint64_t)self->_score - v3 + 32 * v3;
  v5 = self->_changeType - v4 + 32 * v4;
  v6 = -[NSString hash](self->_title, "hash") - v5 + 32 * v5;
  v7 = -[NSString hash](self->_location, "hash") - v6 + 32 * v6;
  v8 = -[NSArray hash](self->_participantNames, "hash") - v7 + 32 * v7;
  return -[NSString hash](self->_eventIdentifier, "hash") - v8 + 32 * v8;
}

- (PPEventNameRecord)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  double v12;
  double v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PPEventNameRecord *v20;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("ide"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("eid"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
  {
    pp_events_log_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v4;
      _os_log_error_impl(&dword_18BE3A000, v11, OS_LOG_TYPE_ERROR, "failed to decode identifier or eventIdentifier from %@", buf, 0xCu);
    }

    v20 = 0;
  }
  else
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("scr"));
    v13 = v12;
    v14 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("cht"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("ttl"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("loc"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x18D7805AC]();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v6, v5, 0);
    objc_autoreleasePoolPop(v17);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("pnm"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[PPEventNameRecord initWithIdentifier:score:eventIdentifier:changeType:title:location:participantNames:](self, "initWithIdentifier:score:eventIdentifier:changeType:title:location:participantNames:", v7, v9, v14, v15, v16, v19, v13);

    v20 = self;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("ide"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("scr"), self->_score);
  objc_msgSend(v5, "encodeObject:forKey:", self->_eventIdentifier, CFSTR("eid"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_changeType, CFSTR("cht"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("ttl"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_location, CFSTR("loc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_participantNames, CFSTR("pnm"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
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

  objc_opt_class();
  v5 = objc_opt_new();
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
    v7 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v6;

    *(_BYTE *)(v5 + 8) = self->_changeType;
    *(double *)(v5 + 24) = self->_score;
    v8 = -[NSString copyWithZone:](self->_eventIdentifier, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v8;

    v10 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v10;

    v12 = -[NSString copyWithZone:](self->_location, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v12;

    v14 = -[NSArray copyWithZone:](self->_participantNames, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v14;

  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  PPEventNameRecord *v4;
  PPEventNameRecord *v5;
  BOOL v6;

  v4 = (PPEventNameRecord *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPEventNameRecord isEqualToEventNameRecord:](self, "isEqualToEventNameRecord:", v5);

  return v6;
}

- (BOOL)hasScoreSimilarToRecord:(id)a3
{
  return vabdd_f64(self->_score, *((double *)a3 + 3)) < 0.000001;
}

- (BOOL)isEqualToEventNameRecord:(id)a3
{
  id *v4;
  id *v5;
  NSString *title;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  NSString *eventIdentifier;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  char v15;
  NSString *location;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  char v20;
  char v21;
  NSArray *v23;
  NSArray *v24;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_14;
  title = self->_title;
  v7 = (NSString *)v4[5];
  if (title == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = title;
    v10 = -[NSString isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_14;
  }
  if (self->_score != *((double *)v5 + 3) || self->_changeType != *((unsigned __int8 *)v5 + 8))
    goto LABEL_14;
  eventIdentifier = self->_eventIdentifier;
  v12 = (NSString *)v5[4];
  if (eventIdentifier == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = eventIdentifier;
    v15 = -[NSString isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_14;
  }
  location = self->_location;
  v17 = (NSString *)v5[6];
  if (location == v17)
  {

  }
  else
  {
    v18 = v17;
    v19 = location;
    v20 = -[NSString isEqual:](v19, "isEqual:", v18);

    if ((v20 & 1) == 0)
    {
LABEL_14:
      v21 = 0;
      goto LABEL_15;
    }
  }
  v23 = self->_participantNames;
  v24 = v23;
  if (v23 == v5[7])
    v21 = 1;
  else
    v21 = -[NSArray isEqual:](v23, "isEqual:");

LABEL_15:
  return v21;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (unsigned)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(unsigned __int8)a3
{
  self->_changeType = a3;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (void)setEventIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_eventIdentifier, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSArray)participantNames
{
  return self->_participantNames;
}

- (void)setParticipantNames:(id)a3
{
  objc_storeStrong((id *)&self->_participantNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantNames, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)eventNameRecordWithScore:(double)a3 eventIdentifier:(id)a4 changeType:(unsigned __int8)a5 title:(id)a6 location:(id)a7 participantNames:(id)a8
{
  uint64_t v10;
  id v13;
  id v14;
  id v15;
  id v16;
  PPEventNameRecord *v17;
  void *v18;
  void *v19;
  PPEventNameRecord *v20;

  v10 = a5;
  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a4;
  v17 = [PPEventNameRecord alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[PPEventNameRecord initWithIdentifier:score:eventIdentifier:changeType:title:location:participantNames:](v17, "initWithIdentifier:score:eventIdentifier:changeType:title:location:participantNames:", v19, v16, v10, v15, v14, v13, a3);

  return v20;
}

+ (id)describeChangeType:(unsigned __int8)a3
{
  __CFString *v3;

  if (a3 >= 4u)
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid (%lu)"), a3);
  else
    v3 = off_1E226A6B8[a3];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
