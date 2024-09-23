@implementation PXVideoFormatMetadata

- (unint64_t)videoHDRType
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC12PhotosUICore21PXVideoFormatMetadata_videoHDRType);
}

- (BOOL)isProResLog
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC12PhotosUICore21PXVideoFormatMetadata_isProResLog);
}

- (_TtC12PhotosUICore21PXVideoFormatMetadata)init
{
  _TtC12PhotosUICore21PXVideoFormatMetadata *result;

  result = (_TtC12PhotosUICore21PXVideoFormatMetadata *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
