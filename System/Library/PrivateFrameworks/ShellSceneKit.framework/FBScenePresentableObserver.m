@implementation FBScenePresentableObserver

- (_TtC13ShellSceneKit26FBScenePresentableObserver)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  _QWORD *v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC13ShellSceneKit26FBScenePresentableObserver_displayConfigRequestHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC13ShellSceneKit26FBScenePresentableObserver_preferredSceneLevelHandler);
  *v5 = 0;
  v5[1] = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[FBScenePresentableObserver init](&v7, sel_init);
}

- (void).cxx_destruct
{
  sub_246005F50(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13ShellSceneKit26FBScenePresentableObserver_displayConfigRequestHandler));
  sub_246005F50(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13ShellSceneKit26FBScenePresentableObserver_preferredSceneLevelHandler));
}

- (void)scene:(id)a3 didUpdateClientSettings:(id)a4
{
  id v6;
  id v7;
  _TtC13ShellSceneKit26FBScenePresentableObserver *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2460159A4(v7);

}

@end
