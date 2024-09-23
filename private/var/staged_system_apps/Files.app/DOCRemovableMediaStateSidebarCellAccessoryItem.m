@implementation DOCRemovableMediaStateSidebarCellAccessoryItem

- (void)didMoveToSuperview
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCRemovableMediaStateSidebarCellAccessoryItem(0);
  v2 = (char *)v3.receiver;
  -[DOCRemovableMediaStateSidebarCellAccessoryItem didMoveToSuperview](&v3, "didMoveToSuperview");
  sub_1004A26C0((uint64_t)objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC5Files46DOCRemovableMediaStateSidebarCellAccessoryItem_formattingOperation], "operationState", v3.receiver, v3.super_class));

}

- (_TtC5Files46DOCRemovableMediaStateSidebarCellAccessoryItem)initWithFrame:(CGRect)a3
{
  _TtC5Files46DOCRemovableMediaStateSidebarCellAccessoryItem *result;

  result = (_TtC5Files46DOCRemovableMediaStateSidebarCellAccessoryItem *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCRemovableMediaStateSidebarCellAccessoryItem", 52, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files46DOCRemovableMediaStateSidebarCellAccessoryItem_formattingStateObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files46DOCRemovableMediaStateSidebarCellAccessoryItem_formattingOperation));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files46DOCRemovableMediaStateSidebarCellAccessoryItem_preferredIconColor));
  sub_10000CB4C((uint64_t)self + OBJC_IVAR____TtC5Files46DOCRemovableMediaStateSidebarCellAccessoryItem_imageProperties, &qword_10064B4F8);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files46DOCRemovableMediaStateSidebarCellAccessoryItem____lazy_storage___progressIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files46DOCRemovableMediaStateSidebarCellAccessoryItem____lazy_storage___errorImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files46DOCRemovableMediaStateSidebarCellAccessoryItem____lazy_storage___finishedImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files46DOCRemovableMediaStateSidebarCellAccessoryItem____lazy_storage___mainContainer));
}

@end
