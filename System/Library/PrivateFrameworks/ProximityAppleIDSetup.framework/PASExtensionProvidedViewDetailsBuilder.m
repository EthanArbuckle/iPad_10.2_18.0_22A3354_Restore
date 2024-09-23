@implementation PASExtensionProvidedViewDetailsBuilder

- (_TtC21ProximityAppleIDSetup38PASExtensionProvidedViewDetailsBuilder)init
{
  _QWORD *v3;
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC21ProximityAppleIDSetup38PASExtensionProvidedViewDetailsBuilder_proxCardSubtitle);
  *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC21ProximityAppleIDSetup38PASExtensionProvidedViewDetailsBuilder_biometricsNotEnrolledErrorSubtitle);
  v5 = (objc_class *)type metadata accessor for PASExtensionProvidedViewDetailsBuilder();
  *v4 = 0;
  v4[1] = 0;
  v7.receiver = self;
  v7.super_class = v5;
  return -[PASExtensionProvidedViewDetailsBuilder init](&v7, sel_init);
}

- (void).cxx_destruct
{
  sub_21F6F25A0();
}

@end
