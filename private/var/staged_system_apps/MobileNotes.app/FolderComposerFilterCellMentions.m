@implementation FolderComposerFilterCellMentions

- (_TtC11MobileNotes32FolderComposerFilterCellMentions)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes32FolderComposerFilterCellMentions____lazy_storage___menu) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes32FolderComposerFilterCellMentions____lazy_storage___menuActionOff) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes32FolderComposerFilterCellMentions____lazy_storage___menuActionAnyone) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes32FolderComposerFilterCellMentions____lazy_storage___menuActionMe) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes32FolderComposerFilterCellMentions____lazy_storage___menuActionSpecificUsers) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes32FolderComposerFilterCellMentions____lazy_storage___menuActionNone) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FolderComposerFilterCellMentions();
  return -[FolderComposerFilterCell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC11MobileNotes32FolderComposerFilterCellMentions)initWithCoder:(id)a3
{
  return (_TtC11MobileNotes32FolderComposerFilterCellMentions *)sub_100112B24(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes32FolderComposerFilterCellMentions____lazy_storage___menu));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes32FolderComposerFilterCellMentions____lazy_storage___menuActionOff));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes32FolderComposerFilterCellMentions____lazy_storage___menuActionAnyone));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes32FolderComposerFilterCellMentions____lazy_storage___menuActionMe));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes32FolderComposerFilterCellMentions____lazy_storage___menuActionSpecificUsers));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes32FolderComposerFilterCellMentions____lazy_storage___menuActionNone));
}

@end
