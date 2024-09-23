@implementation PrivateDataActionProvider

- (_TtC10StocksCoreP33_8188EFB552A1879D25D8FDAD94CCB0E125PrivateDataActionProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PrivateDataActionProvider init](&v3, sel_init);
}

- (void)consumeNonDestructiveActionsSyncWithBlock:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  _TtC10StocksCoreP33_8188EFB552A1879D25D8FDAD94CCB0E125PrivateDataActionProvider *v6;
  void *v7;
  void *v8;
  _QWORD v9[6];

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
    v6 = self;
    _Block_copy(v5);
    v7 = (void *)sub_1ABF319FC();
    v9[4] = nullsub_2;
    v9[5] = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 1107296256;
    v9[2] = sub_1ABD127EC;
    v9[3] = &block_descriptor_30;
    v8 = _Block_copy(v9);
    swift_release();
    ((void (**)(_QWORD, void *, void *))v5)[2](v5, v7, v8);
    _Block_release(v8);

    _Block_release(v5);
    _Block_release(v5);

  }
  else
  {
    __break(1u);
  }
}

@end
