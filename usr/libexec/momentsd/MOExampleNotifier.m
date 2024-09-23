@implementation MOExampleNotifier

- (MOExampleNotifier)initWithName:(id)a3
{
  char *v3;
  MOExampleNotifier *v4;
  char *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MOExampleNotifier;
  v3 = -[MONotifier initWithName:](&v7, "initWithName:", a3);
  v4 = (MOExampleNotifier *)v3;
  if (v3)
  {
    *(_DWORD *)(v3 + 33) = 0;
    v5 = v3;
  }

  return v4;
}

- (void)onEnable
{
  *(_DWORD *)(&self->super._enabled + 1) = 0;
  -[MOExampleNotifier tick](self, "tick");
}

- (void)tick
{
  void *v3;
  unint64_t v4;
  void *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD block[5];

  if (-[MONotifier isEnabled](self, "isEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(&self->super._enabled + 1)));
    -[MONotifier notify:withPayload:](self, "notify:withPayload:", 0, v3);

    HIDWORD(v4) = -286331153 * *(_DWORD *)(&self->super._enabled + 1) + 143165576;
    LODWORD(v4) = HIDWORD(v4);
    if ((v4 >> 2) <= 0x4444444)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
      -[MONotifier notify:withPayload:](self, "notify:withPayload:", 1, v5);

    }
    v6 = dispatch_time(0, 1000000000);
    v7 = objc_claimAutoreleasedReturnValue(-[MONotifier queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __25__MOExampleNotifier_tick__block_invoke;
    block[3] = &unk_1002AD8A8;
    block[4] = self;
    dispatch_after(v6, v7, block);

  }
}

id __25__MOExampleNotifier_tick__block_invoke(uint64_t a1)
{
  ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 33);
  return objc_msgSend(*(id *)(a1 + 32), "tick");
}

@end
