@implementation DOCItemCollectionCellSpringLoadedInteractionBehavior

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Files52DOCItemCollectionCellSpringLoadedInteractionBehavior_targetCell);
}

- (BOOL)shouldAllowInteraction:(id)a3 withContext:(id)a4
{
  id v6;
  _TtC5Files52DOCItemCollectionCellSpringLoadedInteractionBehavior *v7;
  char v8;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  v8 = sub_100271EA8((uint64_t)a4);

  swift_unknownObjectRelease(a4);
  return v8 & 1;
}

- (void)interactionDidFinish:(id)a3
{
  uint64_t Strong;
  id v6;
  _TtC5Files52DOCItemCollectionCellSpringLoadedInteractionBehavior *v7;
  id v8;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Files52DOCItemCollectionCellSpringLoadedInteractionBehavior_targetCell, a2);
  if (Strong)
  {
    v8 = (id)Strong;
    v6 = a3;
    v7 = self;
    objc_msgSend(v8, "setHighlighted:", 0);

  }
}

- (_TtC5Files52DOCItemCollectionCellSpringLoadedInteractionBehavior)init
{
  _TtC5Files52DOCItemCollectionCellSpringLoadedInteractionBehavior *result;

  result = (_TtC5Files52DOCItemCollectionCellSpringLoadedInteractionBehavior *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCItemCollectionCellSpringLoadedInteractionBehavior", 58, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
