@implementation TSULinkedPointerSetReverseEnumerator

- (TSULinkedPointerSetReverseEnumerator)initWithLastEntry:(id)a3
{
  TSULinkedPointerSetReverseEnumerator *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSULinkedPointerSetReverseEnumerator;
  result = -[TSULinkedPointerSetReverseEnumerator init](&v5, sel_init);
  if (result)
  {
    result->mTail = (TSULinkedPointerSetEntry *)a3;
    result->mLastUsed = 0;
  }
  return result;
}

- (id)nextObject
{
  TSULinkedPointerSetEntry *mLastUsed;
  TSULinkedPointerSetEntry *mPrevious;
  id mObject;
  TSULinkedPointerSetEntry *mTail;
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
