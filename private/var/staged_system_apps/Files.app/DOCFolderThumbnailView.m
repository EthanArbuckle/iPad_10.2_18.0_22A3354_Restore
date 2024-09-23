@implementation DOCFolderThumbnailView

- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCFolderThumbnailView)initWithCoder:(id)a3
{
  id v4;
  _TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCFolderThumbnailView *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCFolderThumbnailView_thumbnail) = 0;
  v4 = a3;

  result = (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCFolderThumbnailView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010050DA60, "Files/DOCFilenameViewController.swift", 37, 2, 400, 0);
  __break(1u);
  return result;
}

- (void)didMoveToWindow
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCFolderThumbnailView();
  v2 = v4.receiver;
  -[DOCFolderThumbnailView didMoveToWindow](&v4, "didMoveToWindow");
  v3 = objc_msgSend(v2, "window", v4.receiver, v4.super_class);

  if (v3)
    sub_100282CF0();

}

- (void)thumbnailLoaded:(id)a3
{
  sub_100282C08(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_1005D7680, (uint64_t)&unk_1005D76A8, (uint64_t)sub_10028A968, (uint64_t)&unk_1005D76C0);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGSize result;

  v2 = *(double *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCFolderThumbnailView_maxThumbnailSize);
  v3 = *(double *)&self->super.aspectConstraint[OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCFolderThumbnailView_maxThumbnailSize];
  v18.receiver = self;
  v18.super_class = (Class)type metadata accessor for DOCFolderThumbnailView();
  v4 = v18.receiver;
  -[DOCFolderThumbnailView intrinsicContentSize](&v18, "intrinsicContentSize");
  v6 = v5;
  v8 = v7;
  v9 = objc_msgSend(v4, "traitCollection", v18.receiver, v18.super_class);
  objc_msgSend(v9, "displayScale");
  v11 = v10;

  DOCAdaptSizeToRect(0, 0.0, 0.0, v2, v3, v6, v8, v11);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCFolderThumbnailView)initWithImage:(id)a3
{
  sub_100283014((uint64_t)self, (uint64_t)a2, a3, (uint64_t)"Files.DOCFolderThumbnailView", 28, (uint64_t)"init(image:)", 12);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCFolderThumbnailView_item));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCFolderThumbnailView_thumbnail));
}

@end
