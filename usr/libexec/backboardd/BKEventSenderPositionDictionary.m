@implementation BKEventSenderPositionDictionary

- (id)description
{
  return +[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyToObjectDictionary, 0);
}

@end
