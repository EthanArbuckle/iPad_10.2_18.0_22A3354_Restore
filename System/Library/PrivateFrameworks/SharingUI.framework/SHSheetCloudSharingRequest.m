@implementation SHSheetCloudSharingRequest

- (void)encodeWithBSXPCCoder:(id)a3
{
  _TtC9SharingUI26SHSheetCloudSharingRequest *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_212797C10(a3);

  swift_unknownObjectRelease();
}

- (_TtC9SharingUI26SHSheetCloudSharingRequest)initWithBSXPCCoder:(id)a3
{
  swift_unknownObjectRetain();
  return (_TtC9SharingUI26SHSheetCloudSharingRequest *)SHSheetCloudSharingRequest.init(bsxpcCoder:)(a3);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  static SHSheetCloudSharingRequest.supportsBSXPCSecureCoding()();
  return sub_21279D9CC() & 1;
}

- (_TtC9SharingUI26SHSheetCloudSharingRequest)init
{
  return (_TtC9SharingUI26SHSheetCloudSharingRequest *)SHSheetCloudSharingRequest.init()();
}

- (void).cxx_destruct
{
  sub_21276ED58((id *)((char *)&self->super.isa + OBJC_IVAR____TtC9SharingUI26SHSheetCloudSharingRequest_request));
}

@end
