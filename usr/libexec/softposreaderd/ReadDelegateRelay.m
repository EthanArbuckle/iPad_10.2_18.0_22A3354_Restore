@implementation ReadDelegateRelay

- (void)onUpdateWithEvent:(int64_t)a3 mode:(int64_t)a4
{
  swift_retain();
  sub_1000AFF20(a3, a4);
  swift_release(self);
}

- (void)onFailureWithError:(id)a3
{
  id v4;

  v4 = a3;
  swift_retain();
  sub_1000B013C((uint64_t)v4);
  swift_release(self);

}

- (void)onSuccessWithTransactionData:(id)a3
{
  void (*v5)(id, _QWORD);
  id v6;

  v5 = *(void (**)(id, _QWORD))self->completion;
  v6 = a3;
  swift_retain(self);
  v5(a3, 0);

  swift_release(self);
}

@end
