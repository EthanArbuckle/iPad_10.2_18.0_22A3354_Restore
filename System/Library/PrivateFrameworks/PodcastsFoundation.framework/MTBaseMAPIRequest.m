@implementation MTBaseMAPIRequest

- (MTBaseMAPIRequest)init
{
  objc_class *v3;
  id v4;
  MTBaseMAPIRequest *v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;

  v3 = (objc_class *)type metadata accessor for MediaRequestController();
  v4 = objc_allocWithZone(v3);
  v5 = self;
  v6 = objc_msgSend(v4, sel_init);
  v7 = (Class *)((char *)&v5->super.isa + OBJC_IVAR___MTBaseMAPIRequest_mediaRequestController);
  v7[3] = v3;
  v7[4] = &protocol witness table for MediaRequestController;
  *v7 = v6;
  swift_beginAccess();
  v8 = v7[3];
  v9 = v7[4];
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v7, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(1, v8, v9);
  swift_endAccess();

  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for BaseMAPIRequest();
  return -[MTBaseMAPIRequest init](&v11, sel_init);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___MTBaseMAPIRequest_mediaRequestController);
}

@end
