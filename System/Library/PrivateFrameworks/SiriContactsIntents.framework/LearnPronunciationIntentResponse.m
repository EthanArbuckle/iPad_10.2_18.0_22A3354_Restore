@implementation LearnPronunciationIntentResponse

- (int64_t)code
{
  return LearnPronunciationIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
  LearnPronunciationIntentResponse.code.setter(a3);
}

- (LearnPronunciationIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (LearnPronunciationIntentResponse *)LearnPronunciationIntentResponse.init(code:userActivity:)(a3, a4);
}

- (LearnPronunciationIntentResponse)init
{
  return (LearnPronunciationIntentResponse *)LearnPronunciationIntentResponse.init()();
}

- (LearnPronunciationIntentResponse)initWithCoder:(id)a3
{
  id v3;
  LearnPronunciationIntentResponse *result;

  v3 = a3;
  LearnPronunciationIntentResponse.init(coder:)();
  return result;
}

- (LearnPronunciationIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  LearnPronunciationIntentResponse *result;

  v3 = a3;
  LearnPronunciationIntentResponse.init(backingStore:)();
  return result;
}

- (LearnPronunciationIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  LearnPronunciationIntentResponse *result;

  if (a3)
    v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  else
    v3 = 0;
  LearnPronunciationIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
