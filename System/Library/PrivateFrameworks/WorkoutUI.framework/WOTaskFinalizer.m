@implementation WOTaskFinalizer

- (WOTaskFinalizer)init
{
  return (WOTaskFinalizer *)sub_24A7262D8();
}

+ (void)appendTaskWithIdentifier:(id)a3 task:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = _Block_copy(a4);
  v5 = sub_24A77B9B0();
  v7 = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v4;
  if (qword_2579469E8 != -1)
    swift_once();
  sub_24A7265E0(v5, v7, (uint64_t)sub_24A72A50C, v8);
  swift_bridgeObjectRelease();
  swift_release();
}

+ (void)replaceTasksWithIdentifier:(id)a3 with:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = _Block_copy(a4);
  v5 = sub_24A77B9B0();
  v7 = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v4;
  if (qword_2579469E8 != -1)
    swift_once();
  sub_24A727224(v5, v7, (uint64_t)sub_24A72A034, v8);
  swift_bridgeObjectRelease();
  swift_release();
}

+ (void)finalizeWithIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_24A77B9B0();
  v5 = v4;
  if (qword_2579469E8 != -1)
    swift_once();
  sub_24A727844(v3, v5);
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
