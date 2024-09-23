@implementation BYAnalyticsEventAppleIDSignIn

- (BYAnalyticsEventAppleIDSignIn)initWithAnalyticsManager:(id)a3 context:(unint64_t)a4
{
  id v6;
  BYAnalyticsEventAppleIDSignIn *v7;
  BYAnalyticsEventAppleIDSignIn *v8;
  _QWORD v10[4];
  BYAnalyticsEventAppleIDSignIn *v11;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BYAnalyticsEventAppleIDSignIn;
  v7 = -[BYAnalyticsEventAppleIDSignIn init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_context = a4;
    v7->_authenticationStartDate = (NSDate *)(id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__BYAnalyticsEventAppleIDSignIn_initWithAnalyticsManager_context___block_invoke;
    v10[3] = &unk_1E4E27B08;
    v11 = v8;
    objc_msgSend(v6, "addEvent:withPayloadBlock:persist:", CFSTR("com.apple.setupassistant.ios.appleid.signin.duration"), v10, 0);

  }
  return v8;
}

uint64_t __66__BYAnalyticsEventAppleIDSignIn_initWithAnalyticsManager_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventPayload");
}

- (void)markSignInStartedAfterAuthenticationCompleted
{
  self->_signInStartDate = (NSDate *)(id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (void)markSignInCompleted
{
  void *v3;
  id v4;

  -[BYAnalyticsEventAppleIDSignIn signInStartDate](self, "signInStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("Attempted to mark sign-in as completed without completing authentication"), 0, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  self->_completionDate = (NSDate *)(id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (id)_eventPayload
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  -[BYAnalyticsEventAppleIDSignIn completionDate](self, "completionDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[BYAnalyticsEventAppleIDSignIn context](self, "context");
    if (v4 > 2)
      v5 = 0;
    else
      v5 = off_1E4E27F70[v4];
    -[BYAnalyticsEventAppleIDSignIn signInStartDate](self, "signInStartDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BYAnalyticsEventAppleIDSignIn authenticationStartDate](self, "authenticationStartDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v8);
    v10 = v9;

    -[BYAnalyticsEventAppleIDSignIn completionDate](self, "completionDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BYAnalyticsEventAppleIDSignIn signInStartDate](self, "signInStartDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v12);
    v14 = v13;

    v19[0] = CFSTR("authenticateDuration");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v15;
    v19[1] = CFSTR("signInDuration");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v16;
    v19[2] = CFSTR("totalDuration");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10 + v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = CFSTR("context");
    v20[2] = v17;
    v20[3] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (NSDate)authenticationStartDate
{
  return self->_authenticationStartDate;
}

- (void)setAuthenticationStartDate:(id)a3
{
  self->_authenticationStartDate = (NSDate *)a3;
}

- (NSDate)signInStartDate
{
  return self->_signInStartDate;
}

- (void)setSignInStartDate:(id)a3
{
  self->_signInStartDate = (NSDate *)a3;
}

- (NSDate)completionDate
{
  return self->_completionDate;
}

- (void)setCompletionDate:(id)a3
{
  self->_completionDate = (NSDate *)a3;
}

@end
