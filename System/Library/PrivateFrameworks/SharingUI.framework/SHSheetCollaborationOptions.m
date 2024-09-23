@implementation SHSheetCollaborationOptions

- (void)encodeWithBSXPCCoder:(id)a3
{
  _TtC9SharingUI27SHSheetCollaborationOptions *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_212796BAC(a3);

  swift_unknownObjectRelease();
}

- (_TtC9SharingUI27SHSheetCollaborationOptions)initWithBSXPCCoder:(id)a3
{
  swift_unknownObjectRetain();
  return (_TtC9SharingUI27SHSheetCollaborationOptions *)SHSheetCollaborationOptions.init(bsxpcCoder:)(a3);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  static SHSheetCollaborationOptions.supportsBSXPCSecureCoding()();
  return sub_21279D9CC() & 1;
}

- (_TtC9SharingUI27SHSheetCollaborationOptions)init
{
  return (_TtC9SharingUI27SHSheetCollaborationOptions *)SHSheetCollaborationOptions.init()();
}

- (void).cxx_destruct
{
  sub_21276ED58((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9SharingUI27SHSheetCollaborationOptions_shareOptionsData));
}

@end
