@implementation PopOverManager

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (void)prepareForPopoverPresentation:(id)a3
{
  sub_21EE0472C();
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3
{
  id v4;
  _TtC9SnippetUI14PopOverManager *v5;

  v4 = a3;
  v5 = self;
  sub_21EE04760();

  return 1;
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  sub_21EE04804();
}

- (_TtC9SnippetUI14PopOverManager)init
{
  return (_TtC9SnippetUI14PopOverManager *)sub_21EE04834();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_21EDE841C((uint64_t)self + OBJC_IVAR____TtC9SnippetUI14PopOverManager_layout, (uint64_t *)&unk_25548F600);
  v3 = (char *)self + OBJC_IVAR____TtC9SnippetUI14PopOverManager__selection;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F9E7C8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy();
}

@end
