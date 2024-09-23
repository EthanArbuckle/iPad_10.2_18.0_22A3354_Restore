@implementation IntentsUIComponentViewModel

- (_TtC9SnippetUI27IntentsUIComponentViewModel)init
{
  sub_21F015408();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9SnippetUI27IntentsUIComponentViewModel__resolvedViews;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25549E240);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
}

- (id)maximumSizesBySystemVersionForRemoteViewController:(id)a3
{
  id v4;
  _TtC9SnippetUI27IntentsUIComponentViewModel *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_21F015634();

  sub_21EE3A6EC(0, (unint64_t *)&qword_253F9DF90);
  sub_21EE3A6EC(0, &qword_25549E228);
  sub_21F015CA0(&qword_25549E230, (unint64_t *)&qword_253F9DF90);
  v6 = (void *)sub_21F1135D0();
  swift_bridgeObjectRelease();
  return v6;
}

@end
