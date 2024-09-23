@implementation TUCallRecordingSession

- (TUCallRecordingSession)initWithUUID:(id)a3 state:(int)a4 callUUID:(id)a5 requestUUID:(id)a6 recordingStartedDate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  TUCallRecordingSession *v17;
  TUCallRecordingSession *v18;
  objc_super v20;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)TUCallRecordingSession;
  v17 = -[TUCallRecordingSession init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_UUID, a3);
    v18->_recordingState = a4;
    objc_storeStrong((id *)&v18->_callUUID, a5);
    objc_storeStrong((id *)&v18->_requestUUID, a6);
    objc_storeStrong((id *)&v18->_recordingStartedDate, a7);
  }

  return v18;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallRecordingSession UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" UUID=%@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(" state=%d"), -[TUCallRecordingSession recordingState](self, "recordingState"));
  -[TUCallRecordingSession callUUID](self, "callUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" callUUID=%@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *UUID;
  id v5;

  UUID = self->_UUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", UUID, CFSTR("UUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestUUID, CFSTR("requestUUID"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_recordingState, CFSTR("recordingState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_callUUID, CFSTR("callUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordingStartedDate, CFSTR("recordingStartedDate"));

}

- (TUCallRecordingSession)initWithCoder:(id)a3
{
  id v4;
  TUCallRecordingSession *v5;
  uint64_t v6;
  NSUUID *UUID;
  uint64_t v8;
  NSUUID *requestUUID;
  uint64_t v10;
  NSString *callUUID;
  uint64_t v12;
  NSDate *recordingStartedDate;

  v4 = a3;
  v5 = -[TUCallRecordingSession init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestUUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    requestUUID = v5->_requestUUID;
    v5->_requestUUID = (NSUUID *)v8;

    v5->_recordingState = objc_msgSend(v4, "decodeIntForKey:", CFSTR("recordingState"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callUUID"));
    v10 = objc_claimAutoreleasedReturnValue();
    callUUID = v5->_callUUID;
    v5->_callUUID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recordingStartedDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    recordingStartedDate = v5->_recordingStartedDate;
    v5->_recordingStartedDate = (NSDate *)v12;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[TUCallRecordingSession UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUUID:", v5);

  -[TUCallRecordingSession callUUID](self, "callUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCallUUID:", v6);

  -[TUCallRecordingSession requestUUID](self, "requestUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequestUUID:", v7);

  objc_msgSend(v4, "setRecordingState:", -[TUCallRecordingSession recordingState](self, "recordingState"));
  -[TUCallRecordingSession recordingStartedDate](self, "recordingStartedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRecordingStartedDate:", v8);

  return v4;
}

- (int)recordingState
{
  return self->_recordingState;
}

- (void)setRecordingState:(int)a3
{
  self->_recordingState = a3;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
}

- (NSString)callUUID
{
  return self->_callUUID;
}

- (void)setCallUUID:(id)a3
{
  objc_storeStrong((id *)&self->_callUUID, a3);
}

- (NSDate)recordingStartedDate
{
  return self->_recordingStartedDate;
}

- (void)setRecordingStartedDate:(id)a3
{
  objc_storeStrong((id *)&self->_recordingStartedDate, a3);
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (void)setRequestUUID:(id)a3
{
  objc_storeStrong((id *)&self->_requestUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestUUID, 0);
  objc_storeStrong((id *)&self->_recordingStartedDate, 0);
  objc_storeStrong((id *)&self->_callUUID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
