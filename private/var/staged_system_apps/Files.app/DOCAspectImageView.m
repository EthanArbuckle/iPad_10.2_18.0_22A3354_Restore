@implementation DOCAspectImageView

- (UIImage)image
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCAspectImageView();
  return -[DOCAspectImageView image](&v3, "image");
}

- (void)setImage:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCAspectImageView();
  v4 = a3;
  v5 = v6.receiver;
  -[DOCAspectImageView setImage:](&v6, "setImage:", v4);
  sub_100281A90();

}

- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7518DOCAspectImageView)initWithImage:(id)a3
{
  id v4;
  _TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7518DOCAspectImageView *v5;
  objc_super v7;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7518DOCAspectImageView_aspectConstraint) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DOCAspectImageView();
  v4 = a3;
  v5 = -[DOCAspectImageView initWithImage:](&v7, "initWithImage:", v4);
  sub_100281A90();

  return v5;
}

- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7518DOCAspectImageView)initWithCoder:(id)a3
{
  id v4;
  _TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7518DOCAspectImageView *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7518DOCAspectImageView_aspectConstraint) = 0;
  v4 = a3;

  result = (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7518DOCAspectImageView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010050DA60, "Files/DOCFilenameViewController.swift", 37, 2, 224, 0);
  __break(1u);
  return result;
}

- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7518DOCAspectImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5;
  id v6;
  _TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7518DOCAspectImageView *result;

  v5 = a3;
  v6 = a4;
  result = (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7518DOCAspectImageView *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCAspectImageView", 24, "init(image:highlightedImage:)", 29, 0);
  __break(1u);
  return result;
}

- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7518DOCAspectImageView)initWithFrame:(CGRect)a3
{
  sub_100226BB0((uint64_t)self, (uint64_t)a2, (uint64_t)"Files.DOCAspectImageView", 24);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7518DOCAspectImageView_aspectConstraint));
}

@end
