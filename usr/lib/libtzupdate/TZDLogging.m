@implementation TZDLogging

+ (BOOL)canLogMessageAtLevel:(int64_t)a3
{
  void *v4;
  int64_t v5;

  +[TZPreferencesController sharedPreferencesController](TZPreferencesController, "sharedPreferencesController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "loggingLevel");

  return v5 >= a3;
}

@end
