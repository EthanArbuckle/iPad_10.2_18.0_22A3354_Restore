@implementation AEABlockCancelable

- (void)cancel
{
  void (*v2)(uint64_t);
  uint64_t v4;
  uint64_t v5;

  v2 = *(void (**)(uint64_t))self->cancelHandler;
  if (v2)
  {
    v4 = *(_QWORD *)&self->cancelHandler[8];
    *(_QWORD *)self->cancelHandler = 0;
    *(_QWORD *)&self->cancelHandler[8] = 0;
    swift_retain(self);
    sub_10000828C((uint64_t)v2, v4);
    v5 = sub_100008370((uint64_t)v2, v4);
    v2(v5);
    sub_100008370((uint64_t)v2, v4);
    swift_release(self);
  }
}

@end
