@implementation CRLSEAudioPreviewView

- (_TtC24FreeformSharingExtension21CRLSEAudioPreviewView)initWithCoder:(id)a3
{
  id v4;
  _TtC24FreeformSharingExtension21CRLSEAudioPreviewView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24FreeformSharingExtension21CRLSEAudioPreviewView_gradientBackground) = 0;
  v4 = a3;

  result = (_TtC24FreeformSharingExtension21CRLSEAudioPreviewView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000546D0, "FreeformSharingExtension/CRLSEAudioPreviewView.swift", 52, 2, 137, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLSEAudioPreviewView(0);
  v2 = (char *)v5.receiver;
  -[CRLSEAudioPreviewView layoutSubviews](&v5, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC24FreeformSharingExtension21CRLSEAudioPreviewView_gradientBackground];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v2, "bounds", v5.receiver, v5.super_class);
    objc_msgSend(v4, "setFrame:");

    v2 = v4;
  }

}

- (_TtC24FreeformSharingExtension21CRLSEAudioPreviewView)initWithFrame:(CGRect)a3
{
  _TtC24FreeformSharingExtension21CRLSEAudioPreviewView *result;

  result = (_TtC24FreeformSharingExtension21CRLSEAudioPreviewView *)_swift_stdlib_reportUnimplementedInitializer("FreeformSharingExtension.CRLSEAudioPreviewView", 46, "init(frame:)", 12, 0, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC24FreeformSharingExtension21CRLSEAudioPreviewView_metadata));
  v3 = (char *)self + OBJC_IVAR____TtC24FreeformSharingExtension21CRLSEAudioPreviewView_url;
  v4 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension21CRLSEAudioPreviewView_gradientBackground));
}

@end
