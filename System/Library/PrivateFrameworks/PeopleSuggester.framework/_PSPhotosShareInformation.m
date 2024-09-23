@implementation _PSPhotosShareInformation

- (_PSPhotosShareInformation)initWithInteractionCount:(unint64_t)a3 totalInteractionCount:(unint64_t)a4
{
  _PSPhotosShareInformation *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_PSPhotosShareInformation;
  result = -[_PSPhotosShareInformation init](&v7, sel_init);
  if (result)
  {
    result->_interactionCount = a3;
    result->_totalInteractionCount = a4;
  }
  return result;
}

- (unint64_t)interactionCount
{
  return self->_interactionCount;
}

- (unint64_t)totalInteractionCount
{
  return self->_totalInteractionCount;
}

@end
