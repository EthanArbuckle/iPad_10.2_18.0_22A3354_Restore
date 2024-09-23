@implementation CRLCollaboratorAvatarRenderer

- (CNContact)contact
{
  return (CNContact *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC8Freeform29CRLCollaboratorAvatarRenderer_contact));
}

- (void)setContact:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform29CRLCollaboratorAvatarRenderer_contact);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform29CRLCollaboratorAvatarRenderer_contact) = (Class)a3;
  v3 = a3;

}

- (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform29CRLCollaboratorAvatarRenderer_size);
  v3 = *(double *)&self->contact[OBJC_IVAR____TtC8Freeform29CRLCollaboratorAvatarRenderer_size];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSize:(CGSize)a3
{
  *(CGSize *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform29CRLCollaboratorAvatarRenderer_size) = a3;
}

- (_TtC8Freeform29CRLCollaboratorAvatarRenderer)initWithContact:(id)a3 size:(CGSize)a4
{
  id v5;
  _TtC8Freeform29CRLCollaboratorAvatarRenderer *v6;
  objc_super v8;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform29CRLCollaboratorAvatarRenderer_contact) = (Class)a3;
  *(CGSize *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform29CRLCollaboratorAvatarRenderer_size) = a4;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CRLCollaboratorAvatarRenderer();
  v5 = a3;
  v6 = -[CRLCollaboratorAvatarRenderer init](&v8, "init");

  return v6;
}

- (id)renderAvatarImageWithContentsScale:(double)a3
{
  _TtC8Freeform29CRLCollaboratorAvatarRenderer *v4;
  id v5;

  v4 = self;
  v5 = sub_1008A0738(a3);

  return v5;
}

- (id)renderPlaceholderAvatarImageWithContentsScale:(double)a3
{
  _TtC8Freeform29CRLCollaboratorAvatarRenderer *v4;
  id v5;

  v4 = self;
  v5 = sub_1008A09D4(a3);

  return v5;
}

- (_TtC8Freeform29CRLCollaboratorAvatarRenderer)init
{
  _TtC8Freeform29CRLCollaboratorAvatarRenderer *result;

  result = (_TtC8Freeform29CRLCollaboratorAvatarRenderer *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCollaboratorAvatarRenderer", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
