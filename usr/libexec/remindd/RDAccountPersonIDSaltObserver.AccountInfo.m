@implementation RDAccountPersonIDSaltObserver.AccountInfo

- (REMObjectID)objectID
{
  return (REMObjectID *)*(id *)self->objectID;
}

- (int64_t)type
{
  return *(_QWORD *)self->type;
}

@end
