@implementation TodayIntentResponse

- (TodayIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;
  TodayIntentResponse *v7;
  TodayIntentResponse *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)TodayIntentResponse;
  v7 = -[TodayIntentResponse init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    v7->_code = a3;
    -[TodayIntentResponse setUserActivity:](v7, "setUserActivity:", v6);
  }

  return v8;
}

- (int64_t)code
{
  return self->_code;
}

- (void)setCode:(int64_t)a3
{
  self->_code = a3;
}

@end
