@implementation DOCRenameThumbnailView

- (UIImage)image
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  return -[DOCAspectImageView image](&v3, "image");
}

- (void)setImage:(id)a3
{
  id v4;
  id v5;
  unsigned __int8 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self);
  v4 = a3;
  v5 = v7.receiver;
  -[DOCAspectImageView setImage:](&v7, "setImage:", v4);
  v6 = sub_100281F3C();
  sub_10028A4B8(v5, v6 & 1);

}

- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCRenameThumbnailView)initWithCoder:(id)a3
{
  id v4;
  _TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCRenameThumbnailView *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCRenameThumbnailView_item) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCRenameThumbnailView_initialThumbnail) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCRenameThumbnailView_fullSizeThumbnail) = 0;
  v4 = a3;

  result = (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCRenameThumbnailView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010050DA60, "Files/DOCFilenameViewController.swift", 37, 2, 298, 0);
  __break(1u);
  return result;
}

- (void)didMoveToWindow
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType(self);
  v2 = v6.receiver;
  -[DOCRenameThumbnailView didMoveToWindow](&v6, "didMoveToWindow");
  v3 = objc_msgSend(v2, "window", v6.receiver, v6.super_class);

  if (v3)
    sub_100281CA0(v4, v5);

}

- (void)layoutSubviews
{
  id v2;
  unsigned __int8 v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self);
  v2 = v4.receiver;
  -[DOCRenameThumbnailView layoutSubviews](&v4, "layoutSubviews");
  v3 = sub_100281F3C();
  sub_10028A4B8(v2, v3 & 1);

}

- (void)thumbnailLoaded:(id)a3
{
  sub_100282C08(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_1005D76F8, (uint64_t)&unk_1005D7720, (uint64_t)sub_10028A9A0, (uint64_t)&unk_1005D7738);
}

- (CGSize)intrinsicContentSize
{
  objc_class *ObjectType;
  double v4;
  double v5;
  _TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCRenameThumbnailView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGSize result;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = *(double *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCRenameThumbnailView_maxThumbnailSize);
  v5 = *(double *)&self->super.aspectConstraint[OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCRenameThumbnailView_maxThumbnailSize];
  v20.receiver = self;
  v20.super_class = ObjectType;
  v6 = self;
  -[DOCRenameThumbnailView intrinsicContentSize](&v20, "intrinsicContentSize");
  v8 = v7;
  v10 = v9;
  v11 = -[DOCRenameThumbnailView traitCollection](v6, "traitCollection", v20.receiver, v20.super_class);
  objc_msgSend(v11, "displayScale");
  v13 = v12;

  DOCAdaptSizeToRect(0, 0.0, 0.0, v4, v5, v8, v10, v13);
  v15 = v14;
  v17 = v16;

  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCRenameThumbnailView)initWithImage:(id)a3
{
  sub_100283014((uint64_t)self, (uint64_t)a2, a3, (uint64_t)"Files.DOCRenameThumbnailView", 28, (uint64_t)"init(image:)", 12);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCRenameThumbnailView_item));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCRenameThumbnailView_initialThumbnail));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCRenameThumbnailView_fullSizeThumbnail));
}

@end
