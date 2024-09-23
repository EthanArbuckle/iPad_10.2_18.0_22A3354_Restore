@implementation FolderComposerFilterCellDateEdited

- (_TtC11MobileNotes34FolderComposerFilterCellDateEdited)initWithFrame:(CGRect)a3
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
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType(self);
  return -[FolderComposerFilterCellDate initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC11MobileNotes34FolderComposerFilterCellDateEdited)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  return -[FolderComposerFilterCellDate initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
