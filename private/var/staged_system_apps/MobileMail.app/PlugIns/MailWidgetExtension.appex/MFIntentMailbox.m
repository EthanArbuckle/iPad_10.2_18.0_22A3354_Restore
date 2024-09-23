@implementation MFIntentMailbox

+ (BOOL)supportsSecureCoding
{
  char v2;

  swift_getObjCClassMetadata(a1);
  swift_getObjCClassMetadata(a1);
  v2 = static MFIntentMailbox.supportsSecureCoding.getter();
  return _convertBoolToObjCBool(_:)(v2 & 1) & 1;
}

- (MFIntentMailbox)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  MFIntentMailbox *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v5 = a3;
  v6 = a4;
  v7 = a5;
  if (a3)
  {
    v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v20 = v8;

    v21 = v19;
    v22 = v20;
  }
  else
  {
    v21 = 0;
    v22 = 0;
  }
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v18 = v9;
  if (a5)
  {
    v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v14 = v10;

    v15 = v13;
    v16 = v14;
  }
  else
  {
    v15 = 0;
    v16 = 0;
  }
  v12 = (MFIntentMailbox *)MFIntentMailbox.init(identifier:display:pronunciationHint:)(v21, v22, v17, v18, v15, v16);

  return v12;
}

- (MFIntentMailbox)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (MFIntentMailbox *)MFIntentMailbox.init(coder:)(a3);
}

@end
