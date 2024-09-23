@implementation PFMutualExclusionAssertion

- (void)enterCriticalSection
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  PFMutualExclusionAssertion *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_inCriticalSection)
    _PFAssertFailHandler((uint64_t)"-[PFMutualExclusionAssertion enterCriticalSection]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoFoundation/Source/PFAssert.m", 480, CFSTR("Enter while already in critical section"), v2, v3, v4, v5, v6);
  obj->_inCriticalSection = 1;
  objc_sync_exit(obj);

}

- (void)leaveCriticalSection
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  PFMutualExclusionAssertion *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!obj->_inCriticalSection)
    _PFAssertFailHandler((uint64_t)"-[PFMutualExclusionAssertion leaveCriticalSection]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoFoundation/Source/PFAssert.m", 488, CFSTR("Leave while not in critical section"), v2, v3, v4, v5, v6);
  obj->_inCriticalSection = 0;
  objc_sync_exit(obj);

}

- (void)performCriticalSection:(id)a3
{
  void (**v4)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[PFMutualExclusionAssertion enterCriticalSection](self, "enterCriticalSection");
  v4[2](v4);

  -[PFMutualExclusionAssertion leaveCriticalSection](self, "leaveCriticalSection");
}

@end
