@implementation YearInReviewEligibilityServiceFactory

- (void)deleteCloudDataWithCompletion:(id)a3
{
  void *v4;
  const void *v5;
  void (*v6)(const void *, uint64_t, _QWORD);

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = (void (*)(const void *, uint64_t, _QWORD))*((_QWORD *)v4 + 2);
    swift_retain(self);
    v6(v5, 1, 0);
    _Block_release(v5);
    swift_release(self);
  }
}

@end
