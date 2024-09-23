@implementation TSULinkedPointerSetEnumerator

- (TSULinkedPointerSetEnumerator)initWithFirstEntry:(id)a3
{
  TSULinkedPointerSetEnumerator *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSULinkedPointerSetEnumerator;
  result = -[TSULinkedPointerSetEnumerator init](&v5, sel_init);
  if (result)
  {
    result->mHead = (TSULinkedPointerSetEntry *)a3;
    result->mLastUsed = 0;
  }
  return result;
}

- (id)nextObject
{
  TSULinkedPointerSetEntry *mLastUsed;
  TSULinkedPointerSetEntry *mNext;
  id mObject;
  TSULinkedPointerSetEntry *mHead;
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
