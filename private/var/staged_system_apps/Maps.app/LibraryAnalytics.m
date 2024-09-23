@implementation LibraryAnalytics

+ (void)captureAddOrEditNoteActionForPlaceMUID:(unint64_t)a3 isNewNote:(BOOL)a4
{
  _s4Maps16LibraryAnalyticsC26captureAddOrEditNoteAction9placeMUID05isNewH0ys6UInt64V_SbtFZ_0(a3, a4);
}

+ (void)captureAddOrRemoveFromLibraryWithPlaceMUID:(unint64_t)a3 captureAdd:(BOOL)a4 target:(int)a5
{
  _s4Maps16LibraryAnalyticsC022captureAddOrRemoveFromB09placeMUID0dE06targetys6UInt64V_SbSo11GEOUITargetVtFZ_0(a3, a4, *(uint64_t *)&a5);
}

+ (void)captureAddOrRemovePinWithPlaceMUID:(unint64_t)a3 captureAdd:(BOOL)a4 target:(int)a5
{
  _s4Maps16LibraryAnalyticsC21captureAddOrRemovePin9placeMUID0dE06targetys6UInt64V_SbSo11GEOUITargetVtFZ_0(a3, a4, *(uint64_t *)&a5);
}

- (_TtC4Maps16LibraryAnalytics)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[LibraryAnalytics init](&v3, "init");
}

@end
