@implementation SPRInstallDelegate

- (void)onSuccessWithInstallData:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_244DB6310(v3);

  swift_release();
}

- (void)onFailureWithError:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_244DB66BC(v3);
  swift_release();

}

- (void)onUpdateWithEvent:(int64_t)a3 progress:(int64_t)a4
{
  void (*v5)(int64_t);

  if (a3 == 3)
  {
    v5 = *(void (**)(int64_t))self->installProgress;
    swift_retain();
    v5(a4);
    swift_release();
  }
}

@end
