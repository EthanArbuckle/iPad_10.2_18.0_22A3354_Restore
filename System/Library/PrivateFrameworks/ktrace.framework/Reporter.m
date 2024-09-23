@implementation Reporter

- (void)failWithReason:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);

  v4 = sub_1AF3E78C8();
  v6 = v5;
  v7 = (void (*)(uint64_t, uint64_t))*((_QWORD *)self->super.isa + 29);
  swift_retain();
  v7(v4, v6);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)warnWithMessage:(id)a3
{
  sub_1AF3E78C8();
  swift_retain();
  sub_1AF3E7970();
  (*((void (**)(uint64_t, unint64_t, uint64_t, _QWORD))self->super.isa + 27))(0x3A676E696E726177, 0xE900000000000020, 1, 0);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
