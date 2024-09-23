@implementation PodcastsApplicationStateMonitor

+ (PodcastsApplicationStateMonitor)shared
{
  if (qword_1ED2AA358 != -1)
    swift_once();
  return (PodcastsApplicationStateMonitor *)(id)qword_1ED2AB238;
}

- (unint64_t)currentState
{
  uint64_t v2;
  _QWORD *v3;
  os_unfair_lock_s *v4;
  PodcastsApplicationStateMonitor *v5;
  unint64_t v6;
  unint64_t v8;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PodcastsApplicationStateMonitor_applicationState);
  v3 = (_QWORD *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 24);
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_1A910F090(v3, &v8);
  os_unfair_lock_unlock(v4);
  v6 = v8;

  return v6;
}

- (BOOL)isActive
{
  uint64_t v2;
  _QWORD *v3;
  os_unfair_lock_s *v4;
  PodcastsApplicationStateMonitor *v5;
  uint64_t v6;
  uint64_t v8;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PodcastsApplicationStateMonitor_applicationState);
  v3 = (_QWORD *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 24);
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_1A910F090(v3, &v8);
  os_unfair_lock_unlock(v4);
  v6 = v8;

  return v6 == 1;
}

- (BOOL)isBackground
{
  uint64_t v2;
  _QWORD *v3;
  os_unfair_lock_s *v4;
  PodcastsApplicationStateMonitor *v5;
  uint64_t v6;
  uint64_t v8;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PodcastsApplicationStateMonitor_applicationState);
  v3 = (_QWORD *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 24);
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_1A910F090(v3, &v8);
  os_unfair_lock_unlock(v4);
  v6 = v8;

  return v6 == 2;
}

- (BOOL)isUnknown
{
  uint64_t v2;
  _QWORD *v3;
  os_unfair_lock_s *v4;
  PodcastsApplicationStateMonitor *v5;
  uint64_t v6;
  uint64_t v8;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PodcastsApplicationStateMonitor_applicationState);
  v3 = (_QWORD *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 24);
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_1A910F090(v3, &v8);
  os_unfair_lock_unlock(v4);
  v6 = v8;

  return v6 == 0;
}

- (void)updateCurrentState:(unint64_t)a3
{
  uint64_t v3;
  _QWORD *v4;
  os_unfair_lock_s *v5;
  PodcastsApplicationStateMonitor *v6;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PodcastsApplicationStateMonitor_applicationState);
  v4 = (_QWORD *)(v3 + 16);
  v5 = (os_unfair_lock_s *)(v3 + 24);
  v6 = self;
  os_unfair_lock_lock(v5);
  sub_1A922DE9C(v4);
  os_unfair_lock_unlock(v5);

}

+ (id)descriptionForState:(unint64_t)a3
{
  void *v3;
  id result;

  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
      v3 = (void *)sub_1A93F8010();
      swift_bridgeObjectRelease();
      result = v3;
      break;
    default:
      result = (id)sub_1A93F921C();
      __break(1u);
      break;
  }
  return result;
}

- (PodcastsApplicationStateMonitor)init
{
  return (PodcastsApplicationStateMonitor *)ApplicationStateMonitor.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
