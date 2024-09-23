@implementation SEFidoEvents

+ (NSString)fidoKeyCreated
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)fidoKeySignatureGenerated
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)fidoKeyFound
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)fidoKeyNotFound
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)fidoVerificationSucceeded
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)fidoVerificationFailed
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)callerError
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)serviceError
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)viewNotSyncedError
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)keychainNotEnabledError
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)keyCreationError
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)keyExportError
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)keyAttestationError
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)keyDecodeError
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)signatureError
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)keychainAddError
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)keychainQueryError
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)baaError
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)unspecifiedError
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (_TtC10seserviced12SEFidoEvents)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[SEFidoEvents init](&v3, "init");
}

@end
