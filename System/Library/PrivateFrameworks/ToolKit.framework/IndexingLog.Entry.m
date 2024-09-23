@implementation IndexingLog.Entry

+ (unsigned)latestDataVersion
{
  return 1;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = sub_2490E6C70();
  v8 = v7;

  swift_getObjCClassMetadata();
  sub_248D9EE88(v6, v8, a4);
  v10 = v9;
  sub_248D9E628(v6, v8);
  return v10;
}

- (id)serialize
{
  _TtCC7ToolKit11IndexingLog5Entry *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = sub_248D9F074();
  v5 = v4;

  if (v5 >> 60 == 15)
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)sub_2490E6C40();
    sub_248D9E66C(v3, v5);
  }
  return v6;
}

- (_TtCC7ToolKit11IndexingLog5Entry)init
{
  sub_248D9F160();
}

- (void).cxx_destruct
{
  sub_248D9F550((uint64_t)self + OBJC_IVAR____TtCC7ToolKit11IndexingLog5Entry_protoEntry);
}

@end
