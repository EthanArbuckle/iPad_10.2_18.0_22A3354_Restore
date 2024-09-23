@implementation TrackRunningCoordinator

- (BOOL)canShowTrackPrompt
{
  swift_beginAccess();
  return self->canShowTrackPrompt[0];
}

- (void)setCanShowTrackPrompt:(BOOL)a3
{
  swift_beginAccess();
  self->canShowTrackPrompt[0] = a3;
}

- (BOOL)didShowTrackPrompt
{
  swift_beginAccess();
  return self->didShowTrackPrompt[0];
}

- (void)setDidShowTrackPrompt:(BOOL)a3
{
  swift_beginAccess();
  self->didShowTrackPrompt[0] = a3;
}

- (BOOL)trackModeEnabled
{
  BOOL v3;

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_22874C640();
  swift_release();
  swift_release();
  swift_release();
  return v3;
}

- (void)setTrackModeEnabled:(BOOL)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_22874C64C();
}

- (void)reset
{
  swift_retain();
  sub_228700950();
  swift_release();
}

- (void)didUpdateKeyValueDomain:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_2287017A4();
  swift_release();

}

@end
