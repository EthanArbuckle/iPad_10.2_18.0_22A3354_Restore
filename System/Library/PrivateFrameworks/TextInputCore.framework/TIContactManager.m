@implementation TIContactManager

+ (id)sharedTIContactManager
{
  return 0;
}

+ (id)singletonInstance
{
  return 0;
}

- (id)addContactObserver:(id)a3
{
  return 0;
}

- (NSUUID)contactCollectionUUID
{
  return self->contactCollectionUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->contactCollectionUUID, 0);
}

@end
