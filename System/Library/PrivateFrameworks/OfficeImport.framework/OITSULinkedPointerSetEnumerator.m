@implementation OITSULinkedPointerSetEnumerator

- (OITSULinkedPointerSetEnumerator)initWithFirstEntry:(id)a3
{
  OITSULinkedPointerSetEnumerator *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OITSULinkedPointerSetEnumerator;
  result = -[OITSULinkedPointerSetEnumerator init](&v5, sel_init);
  if (result)
  {
    result->mHead = (OITSULinkedPointerSetEntry *)a3;
    result->mLastUsed = 0;
  }
  return result;
}

- (id)nextObject
{
  OITSULinkedPointerSetEntry *mLastUsed;
  OITSULinkedPointerSetEntry *mNext;
  id mObject;
  OITSULinkedPointerSetEntry *mHead;
  id v6;

  mLastUsed = self->mLastUsed;
  if (mLastUsed)
  {
    mNext = mLastUsed->mNext;
    self->mLastUsed = mNext;
    if (mNext)
    {
      mObject = mNext->mObject;
      if (!mObject)
        return mObject;
LABEL_7:
      v6 = mObject;
      return mObject;
    }
  }
  mHead = self->mHead;
  if (!mHead)
    return 0;
  mObject = mHead->mObject;
  self->mLastUsed = mHead;
  self->mHead = 0;
  if (mObject)
    goto LABEL_7;
  return mObject;
}

@end
