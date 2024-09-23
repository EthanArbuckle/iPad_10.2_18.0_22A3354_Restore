@implementation SHSheetOptionGroups

- (void)encodeWithBSXPCCoder:(id)a3
{
  _TtC9SharingUI19SHSheetOptionGroups *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_21279731C(a3);

  swift_unknownObjectRelease();
}

- (_TtC9SharingUI19SHSheetOptionGroups)initWithBSXPCCoder:(id)a3
{
  swift_unknownObjectRetain();
  return (_TtC9SharingUI19SHSheetOptionGroups *)SHSheetOptionGroups.init(bsxpcCoder:)(a3);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  static SHSheetOptionGroups.supportsBSXPCSecureCoding()();
  return sub_21279D9CC() & 1;
}

- (_TtC9SharingUI19SHSheetOptionGroups)init
{
  return (_TtC9SharingUI19SHSheetOptionGroups *)SHSheetOptionGroups.init()();
}

- (void).cxx_destruct
{
  sub_2127693E0();
}

@end
