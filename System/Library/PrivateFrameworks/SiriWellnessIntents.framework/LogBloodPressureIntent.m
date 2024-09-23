@implementation LogBloodPressureIntent

- (LogBloodPressureIntent)init
{
  return (LogBloodPressureIntent *)LogBloodPressureIntent.init()();
}

- (LogBloodPressureIntent)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (LogBloodPressureIntent *)LogBloodPressureIntent.init(coder:)(a3);
}

- (LogBloodPressureIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  v5 = a4;
  if (a3)
  {
    v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v9 = v6;

    v10 = v8;
    v11 = v9;
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }
  return (LogBloodPressureIntent *)LogBloodPressureIntent.init(identifier:backingStore:)(v10, v11, a4);
}

- (LogBloodPressureIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  LogBloodPressureIntent *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;

  v5 = a3;
  v6 = a4;
  v7 = a5;
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v17 = v8;
  v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v20 = v9;
  if (a5)
  {
    v12 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    v13 = v12;
  }
  else
  {
    v13 = 0;
  }
  v11 = (LogBloodPressureIntent *)LogBloodPressureIntent.init(domain:verb:parametersByName:)(v16, v17, v19, v20, v13);

  return v11;
}

@end
