@implementation CNVCardTagInclusionPermissivePolicy

- (BOOL)shouldParseTag:(id)a3
{
  return 1;
}

- (BOOL)shouldCaptureUnknownTags
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC5vCard35CNVCardTagInclusionPermissivePolicy_shouldCaptureUnknownTags);
}

- (void)setShouldCaptureUnknownTags:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC5vCard35CNVCardTagInclusionPermissivePolicy_shouldCaptureUnknownTags) = a3;
}

- (_TtC5vCard35CNVCardTagInclusionPermissivePolicy)init
{
  objc_super v3;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC5vCard35CNVCardTagInclusionPermissivePolicy_shouldCaptureUnknownTags) = 1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CNVCardTagInclusionPermissivePolicy();
  return -[CNVCardTagInclusionPermissivePolicy init](&v3, sel_init);
}

@end
