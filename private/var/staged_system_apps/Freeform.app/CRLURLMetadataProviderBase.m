@implementation CRLURLMetadataProviderBase

- (_TtC8Freeform26CRLURLMetadataProviderBase)init
{
  _TtC8Freeform26CRLURLMetadataProviderBase *result;

  result = (_TtC8Freeform26CRLURLMetadataProviderBase *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLURLMetadataProviderBase", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8Freeform26CRLURLMetadataProviderBase_url;
  v4 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->filename[OBJC_IVAR____TtC8Freeform26CRLURLMetadataProviderBase_filename]);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Freeform26CRLURLMetadataProviderBase_linkPresentationMetadataTask));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform26CRLURLMetadataProviderBase__linkPresentationMetadata));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform26CRLURLMetadataProviderBase____lazy_storage___linkPresentationMetadataProvider));
  swift_bridgeObjectRelease(*(_QWORD *)&self->filename[OBJC_IVAR____TtC8Freeform26CRLURLMetadataProviderBase__title]);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Freeform26CRLURLMetadataProviderBase_iconProviderTask));

}

@end
