@implementation RUISwiftUIContainerElement

- (_TtC8RemoteUI26RUISwiftUIContainerElement)initWithElement:(id)a3 parent:(id)a4
{
  id v5;
  id v6;
  _TtC8RemoteUI26RUISwiftUIContainerElement *result;

  v5 = a3;
  v6 = a4;
  RUISwiftUIContainerElement.init(element:parent:)(v5, a4);
  return result;
}

+ (BOOL)supportsElementNamed:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id *v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  id v8;

  v3 = sub_209F672C4();
  v5 = v4;
  v6 = (id *)sub_209EFF884();
  v7 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & *(_QWORD *)*v6) + 0x98);
  v8 = *v6;
  LOBYTE(v3) = v7(v3, v5);
  swift_bridgeObjectRelease();

  return v3 & 1;
}

- (id)willLayoutSubviewsHandler
{
  return sub_209F0C610((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8RemoteUI26RUISwiftUIContainerElement_willLayoutSubviewsHandler, (uint64_t)&block_descriptor_25);
}

- (void)setWillLayoutSubviewsHandler:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  _TtC8RemoteUI26RUISwiftUIContainerElement *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_209F110FC;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_209F1020C((uint64_t)v7, v6);
  sub_209F0F414((uint64_t)v7);

}

- (id)didLayoutSubviewsHandler
{
  return sub_209F0C610((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8RemoteUI26RUISwiftUIContainerElement_didLayoutSubviewsHandler, (uint64_t)&block_descriptor_18);
}

- (void)setDidLayoutSubviewsHandler:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  _TtC8RemoteUI26RUISwiftUIContainerElement *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_209F11048;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_209F10330((uint64_t)v7, v6);
  sub_209F0F414((uint64_t)v7);

}

- (id)subElementWithID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  _TtC8RemoteUI26RUISwiftUIContainerElement *v8;
  void *v9;

  if (a3)
  {
    v4 = sub_209F672C4();
    v6 = v5;
    v7 = *(uint64_t (**)(uint64_t, uint64_t))(**(_QWORD **)((char *)&self->super.super.isa
                                                                  + OBJC_IVAR____TtC8RemoteUI26RUISwiftUIContainerElement_childElementDirectory)
                                                    + 120);
    v8 = self;
    v9 = (void *)v7(v4, v6);

    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)prepareToPreload
{
  _TtC8RemoteUI26RUISwiftUIContainerElement *v2;

  v2 = self;
  sub_209F0CAC0();

}

- (void)loadElement
{
  void (*v2)(void);
  _TtC8RemoteUI26RUISwiftUIContainerElement *v3;

  v2 = *(void (**)(void))(qword_2545C6ED8
                        + (**(_QWORD **)((char *)&self->super.super.isa
                                       + OBJC_IVAR____TtC8RemoteUI26RUISwiftUIContainerElement_container) & *MEMORY[0x24BEE4EA0])
                        + 192);
  v3 = self;
  v2();

}

- (void)loadElementIfNeeded
{
  void (*v2)(void);
  _TtC8RemoteUI26RUISwiftUIContainerElement *v3;

  v2 = *(void (**)(void))(qword_2545C6ED8
                        + (**(_QWORD **)((char *)&self->super.super.isa
                                       + OBJC_IVAR____TtC8RemoteUI26RUISwiftUIContainerElement_container) & *MEMORY[0x24BEE4EA0])
                        + 184);
  v3 = self;
  v2();

}

- (_TtC8RemoteUI26RUISwiftUIContainerElement)initWithAttributes:(id)a3 parent:(id)a4
{
  id v4;
  _TtC8RemoteUI26RUISwiftUIContainerElement *result;

  v4 = a4;
  result = (_TtC8RemoteUI26RUISwiftUIContainerElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8RemoteUI26RUISwiftUIContainerElement)init
{
  _TtC8RemoteUI26RUISwiftUIContainerElement *result;

  result = (_TtC8RemoteUI26RUISwiftUIContainerElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_unknownObjectWeakDestroy();
  sub_209F0F414(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC8RemoteUI26RUISwiftUIContainerElement_willLayoutSubviewsHandler));
  sub_209F0F414(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC8RemoteUI26RUISwiftUIContainerElement_didLayoutSubviewsHandler));
}

- (id)view
{
  return objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8RemoteUI26RUISwiftUIContainerElement_container), sel_view);
}

- (id)viewController
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                 + OBJC_IVAR____TtC8RemoteUI26RUISwiftUIContainerElement_container));
}

- (void)setObjectModel:(id)a3
{
  void (*v5)(id);
  id v6;
  _TtC8RemoteUI26RUISwiftUIContainerElement *v7;

  v5 = *(void (**)(id))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.super.isa) + 0x80);
  v6 = a3;
  v7 = self;
  v5(a3);

}

@end
