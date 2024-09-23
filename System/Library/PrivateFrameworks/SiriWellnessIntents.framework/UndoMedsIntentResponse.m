@implementation UndoMedsIntentResponse

- (int64_t)code
{
  UndoMedsIntentResponse *v2;
  int64_t v5;

  v2 = self;
  v5 = UndoMedsIntentResponse.code.getter();

  return v5;
}

- (void)setCode:(int64_t)a3
{
  UndoMedsIntentResponse *v3;

  v3 = self;
  UndoMedsIntentResponse.code.setter(a3);

}

- (UndoMedsIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v4;

  v4 = a4;
  return (UndoMedsIntentResponse *)UndoMedsIntentResponse.init(code:userActivity:)(a3, a4);
}

- (UndoMedsIntentResponse)init
{
  return (UndoMedsIntentResponse *)UndoMedsIntentResponse.init()();
}

- (UndoMedsIntentResponse)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (UndoMedsIntentResponse *)UndoMedsIntentResponse.init(coder:)(a3);
}

- (UndoMedsIntentResponse)initWithBackingStore:(id)a3
{
  id v3;

  v3 = a3;
  return (UndoMedsIntentResponse *)UndoMedsIntentResponse.init(backingStore:)(a3);
}

- (UndoMedsIntentResponse)initWithPropertiesByName:(id)a3
{
  id v3;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  if (a3)
  {
    v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (UndoMedsIntentResponse *)UndoMedsIntentResponse.init(propertiesByName:)(v6);
}

@end
