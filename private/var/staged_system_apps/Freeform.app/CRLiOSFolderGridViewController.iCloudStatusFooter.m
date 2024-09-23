@implementation CRLiOSFolderGridViewController.iCloudStatusFooter

- (_TtCC8Freeform30CRLiOSFolderGridViewController18iCloudStatusFooter)initWithFrame:(CGRect)a3
{
  _TtCC8Freeform30CRLiOSFolderGridViewController18iCloudStatusFooter *result;

  sub_1004DCC04(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtCC8Freeform30CRLiOSFolderGridViewController18iCloudStatusFooter)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtCC8Freeform30CRLiOSFolderGridViewController18iCloudStatusFooter *result;

  v5 = OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController18iCloudStatusFooter_iCloudStatusLabel;
  v6 = objc_allocWithZone((Class)UILabel);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController18iCloudStatusFooter_syncDidEndObserver) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController18iCloudStatusFooter_syncDidBeginObserver) = 0;

  result = (_TtCC8Freeform30CRLiOSFolderGridViewController18iCloudStatusFooter *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100FAD6F0, "Freeform/CRLiOSFolderGridViewController-Cells.swift", 51, 2, 277, 0);
  __break(1u);
  return result;
}

- (void)dealloc
{
  _TtCC8Freeform30CRLiOSFolderGridViewController18iCloudStatusFooter *v2;

  v2 = self;
  sub_1004DD6FC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController18iCloudStatusFooter_iCloudStatusLabel));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController18iCloudStatusFooter_syncDidEndObserver));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController18iCloudStatusFooter_syncDidBeginObserver));
}

@end
