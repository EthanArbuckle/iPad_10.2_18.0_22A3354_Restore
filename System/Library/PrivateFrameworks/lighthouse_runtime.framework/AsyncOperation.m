@implementation AsyncOperation

- (void)dealloc
{
  _TtC18lighthouse_runtime14AsyncOperation *v3;
  _TtC18lighthouse_runtime14AsyncOperation *v4;
  objc_super v5;

  if (*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_task))
  {
    v3 = self;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFB8);
    sub_24B6ADDA4();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AsyncOperation();
  -[AsyncOperation dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{

  swift_release();
  swift_release();

}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  return sub_24B6ABEE0(self);
}

- (void)setExecuting:(BOOL)a3
{
  _BOOL4 v3;
  _TtC18lighthouse_runtime14AsyncOperation *v4;

  v3 = a3;
  v4 = self;
  sub_24B6AC030(v3, 0x7475636578457369, 0xEB00000000676E69, (uint64_t)sub_24B6ACFE0);

}

- (BOOL)isFinished
{
  return sub_24B6ABEE0(self);
}

- (void)setFinished:(BOOL)a3
{
  _BOOL4 v3;
  _TtC18lighthouse_runtime14AsyncOperation *v4;

  v3 = a3;
  v4 = self;
  sub_24B6AC030(v3, 0x6873696E69467369, 0xEA00000000006465, (uint64_t)sub_24B6ACFC8);

}

- (void)start
{
  _TtC18lighthouse_runtime14AsyncOperation *v2;

  v2 = self;
  if (-[AsyncOperation isCancelled](v2, sel_isCancelled))
  {
    -[AsyncOperation setExecuting:](v2, sel_setExecuting_, 0);
    -[AsyncOperation setFinished:](v2, sel_setFinished_, 1);
  }
  else
  {
    -[AsyncOperation setFinished:](v2, sel_setFinished_, 0);
    -[AsyncOperation setExecuting:](v2, sel_setExecuting_, 1);
    -[AsyncOperation main](v2, sel_main);
  }

}

- (void)main
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _TtC18lighthouse_runtime14AsyncOperation *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFC8);
  MEMORY[0x24BDAC7A8](v3, v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_24B6ADD8C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v8;
  v10 = self;
  v11 = sub_24B6AC7BC((uint64_t)v6, (uint64_t)&unk_2579AD468, (uint64_t)v9);
  sub_24B6ACEE4((uint64_t)v6);
  *(Class *)((char *)&v10->super.super.isa + OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_task) = (Class)v11;

  swift_release();
}

- (void)cancel
{
  _TtC18lighthouse_runtime14AsyncOperation *v3;
  _TtC18lighthouse_runtime14AsyncOperation *v4;
  objc_super v5;

  if (*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_task))
  {
    v3 = self;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFB8);
    sub_24B6ADDA4();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AsyncOperation();
  -[AsyncOperation cancel](&v5, sel_cancel);

}

- (_TtC18lighthouse_runtime14AsyncOperation)init
{
  _TtC18lighthouse_runtime14AsyncOperation *result;

  result = (_TtC18lighthouse_runtime14AsyncOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
