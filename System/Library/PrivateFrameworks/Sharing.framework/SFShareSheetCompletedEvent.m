@implementation SFShareSheetCompletedEvent

+ (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.sharing.sharesheetCompleted");
}

- (NSDictionary)eventPayload
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  _QWORD v15[6];
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("sessionID");
  -[SFShareSheetCompletedEvent sessionID](self, "sessionID");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = &stru_1E483B8E8;
  v16[0] = v5;
  v15[1] = CFSTR("presentationMs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SFShareSheetCompletedEvent presentationMs](self, "presentationMs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = CFSTR("totalShareTimeMs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SFShareSheetCompletedEvent totalShareTimeMs](self, "totalShareTimeMs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v7;
  v15[3] = CFSTR("success");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFShareSheetCompletedEvent success](self, "success"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v8;
  v15[4] = CFSTR("activityType");
  -[SFShareSheetCompletedEvent activityType](self, "activityType");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = &stru_1E483B8E8;
  v16[4] = v11;
  v15[5] = CFSTR("isCollaborative");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFShareSheetCompletedEvent isCollaborative](self, "isCollaborative"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v13;
}

- (void)submitEvent
{
  void *v3;
  id v4;

  +[SFShareSheetCompletedEvent eventName](SFShareSheetCompletedEvent, "eventName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SFShareSheetCompletedEvent eventPayload](self, "eventPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SFMetricsLog(v4, v3);

}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)presentationMs
{
  return self->_presentationMs;
}

- (void)setPresentationMs:(unint64_t)a3
{
  self->_presentationMs = a3;
}

- (unint64_t)totalShareTimeMs
{
  return self->_totalShareTimeMs;
}

- (void)setTotalShareTimeMs:(unint64_t)a3
{
  self->_totalShareTimeMs = a3;
}

- (BOOL)isCollaborative
{
  return self->_isCollaborative;
}

- (void)setIsCollaborative:(BOOL)a3
{
  self->_isCollaborative = a3;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
