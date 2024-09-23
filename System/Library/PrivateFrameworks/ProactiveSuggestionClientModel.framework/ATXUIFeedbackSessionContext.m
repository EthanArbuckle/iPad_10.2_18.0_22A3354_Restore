@implementation ATXUIFeedbackSessionContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessions, 0);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_sessions, CFSTR("sessions"));
}

- (ATXUIFeedbackSessionContext)init
{
  void *v3;
  ATXUIFeedbackSessionContext *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXUIFeedbackSessionContext initWithSessions:](self, "initWithSessions:", v3);

  return v4;
}

- (ATXUIFeedbackSessionContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ATXUIFeedbackSessionContext *v14;

  v4 = a3;
  v5 = (void *)MEMORY[0x1AF421DC4]();
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v5);
  v10 = (void *)MEMORY[0x1E0D81610];
  __atxlog_handle_blending_ecosystem();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v9, CFSTR("sessions"), v4, 1, CFSTR("com.apple.proactive.ATXProactiveSuggestionUIFeedbackSession"), -1, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && (objc_msgSend(v4, "error"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v13, !v13))
  {
    self = -[ATXUIFeedbackSessionContext initWithSessions:](self, "initWithSessions:", v12);
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (ATXUIFeedbackSessionContext)initWithSessions:(id)a3
{
  id v5;
  ATXUIFeedbackSessionContext *v6;
  ATXUIFeedbackSessionContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXUIFeedbackSessionContext;
  v6 = -[ATXUIFeedbackSessionContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sessions, a3);

  return v7;
}

- (void)trackNewUIFeedbackSessionWithSessionIdentifier:(id)a3 startDate:(id)a4
{
  id v6;
  NSMutableDictionary *sessions;
  id v8;
  NSObject *v9;
  ATXProactiveSuggestionUIFeedbackSession *v10;

  v6 = a3;
  sessions = self->_sessions;
  v8 = a4;
  if ((unint64_t)-[NSMutableDictionary count](sessions, "count") >= 0xA)
  {
    __atxlog_handle_blending_ecosystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ATXUIFeedbackSessionContext trackNewUIFeedbackSessionWithSessionIdentifier:startDate:].cold.1((uint64_t)self, (uint64_t)v6, v9);

    -[NSMutableDictionary removeAllObjects](self->_sessions, "removeAllObjects");
  }
  v10 = -[ATXProactiveSuggestionUIFeedbackSession initWithSessionIdentifier:]([ATXProactiveSuggestionUIFeedbackSession alloc], "initWithSessionIdentifier:", v6);
  -[ATXProactiveSuggestionUIFeedbackSession updateSessionStartDateIfUnset:](v10, "updateSessionStartDateIfUnset:", v8);

  -[NSMutableDictionary setValue:forKey:](self->_sessions, "setValue:forKey:", v10, v6);
}

- (id)uiFeedbackSessionWithSessionIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary valueForKey:](self->_sessions, "valueForKey:", a3);
}

- (id)returnAndRemoveUIFeedbackSessionWithSessionIdentifier:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  -[ATXUIFeedbackSessionContext uiFeedbackSessionWithSessionIdentifier:](self, "uiFeedbackSessionWithSessionIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateSessionEndDateIfUnset:", v6);

  -[NSMutableDictionary removeObjectForKey:](self->_sessions, "removeObjectForKey:", v7);
  return v8;
}

- (NSDictionary)sessions
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_sessions, "copy");
}

- (BOOL)isEqual:(id)a3
{
  ATXUIFeedbackSessionContext *v4;
  ATXUIFeedbackSessionContext *v5;
  BOOL v6;

  v4 = (ATXUIFeedbackSessionContext *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXUIFeedbackSessionContext isEqualToATXUIFeedbackSessionContext:](self, "isEqualToATXUIFeedbackSessionContext:", v5);

  return v6;
}

- (BOOL)isEqualToATXUIFeedbackSessionContext:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  char v6;

  v4 = self->_sessions;
  v5 = v4;
  if (v4 == *((NSMutableDictionary **)a3 + 1))
    v6 = 1;
  else
    v6 = -[NSMutableDictionary isEqual:](v4, "isEqual:");

  return v6;
}

- (unint64_t)hash
{
  return -[NSMutableDictionary hash](self->_sessions, "hash");
}

- (void)trackNewUIFeedbackSessionWithSessionIdentifier:(NSObject *)a3 startDate:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = v6;
  v9 = 2048;
  v10 = 10;
  v11 = 2112;
  v12 = a2;
  _os_log_error_impl(&dword_1AA841000, a3, OS_LOG_TYPE_ERROR, "%@ - reached max count of %lu tracked sessions, pruning all before starting new session with identifier: %@", (uint8_t *)&v7, 0x20u);

}

@end
