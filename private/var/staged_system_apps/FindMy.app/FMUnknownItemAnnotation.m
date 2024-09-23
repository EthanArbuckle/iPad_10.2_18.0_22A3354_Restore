@implementation FMUnknownItemAnnotation

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC6FindMy23FMUnknownItemAnnotation_item;
  v4 = type metadata accessor for FMIPUnknownItem(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

@end
