@implementation OITSULinkedPointerSetReverseEnumerator

- (OITSULinkedPointerSetReverseEnumerator)initWithLastEntry:(id)a3
{
  OITSULinkedPointerSetReverseEnumerator *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OITSULinkedPointerSetReverseEnumerator;
  result = -[OITSULinkedPointerSetReverseEnumerator init](&v5, sel_init);
  if (result)
  {
    result->mTail = (OITSULinkedPointerSetEntry *)a3;
    result->mLastUsed = 0;
  }
  return result;
}

- (id)nextObject
{
  OITSULinkedPointerSetEntry *mLastUsed;
  OITSULinkedPointerSetEntry *mPrevious;
  id mObject;
  OITSULinkedPointerSetEntry *mTail;
  id v6;

  mLastUsed = self->mLastUsed;
  if (mLastUsed)
  {
    mPrevious = mLastUsed->mPrevious;
    self->mLastUsed = mPrevious;
    if (mPrevious)
    {
      mObject = mPrevious->mObject;
      if (!mObject)
        return mObject;
LABEL_7:
      v6 = mObject;
      return mObject;
    }
  }
  mTail = self->mTail;
  if (!mTail)
    return 0;
  mObject = mTail->mObject;
  self->mLastUsed = mTail;
  self->mTail = 0;
  if (mObject)
    goto LABEL_7;
  return mObject;
}

@end
