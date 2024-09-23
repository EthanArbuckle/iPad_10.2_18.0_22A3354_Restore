@implementation DOCViewEditMenuInteraction

- (void)longPressGesture:(id)a3
{
  id v4;
  _TtC5Files26DOCViewEditMenuInteraction *v5;

  v4 = a3;
  v5 = self;
  sub_10042BC10(v4);

}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v7;
  id v8;
  _TtC5Files26DOCViewEditMenuInteraction *v9;
  Class v10;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = sub_10042C584();

  return v10;
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  char *v5;
  uint64_t v6;

  v5 = (char *)self + OBJC_IVAR____TtC5Files26DOCViewEditMenuInteraction_activePresentationContext;
  v6 = *(_QWORD *)&self->targetView[OBJC_IVAR____TtC5Files26DOCViewEditMenuInteraction_activePresentationContext + 7];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v5[24] = 0;
  *((_QWORD *)v5 + 2) = 0;
  swift_bridgeObjectRelease(v6);
}

- (_TtC5Files26DOCViewEditMenuInteraction)init
{
  _TtC5Files26DOCViewEditMenuInteraction *result;

  result = (_TtC5Files26DOCViewEditMenuInteraction *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCViewEditMenuInteraction", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Files26DOCViewEditMenuInteraction_targetView);
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files26DOCViewEditMenuInteraction_delegate);

  swift_bridgeObjectRelease(*(_QWORD *)&self->targetView[OBJC_IVAR____TtC5Files26DOCViewEditMenuInteraction_activePresentationContext
                                                       + 7]);
}

@end
