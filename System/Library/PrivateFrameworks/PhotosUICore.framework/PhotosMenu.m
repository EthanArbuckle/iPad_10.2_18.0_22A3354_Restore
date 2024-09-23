@implementation PhotosMenu

- (id)copyWithZone:(void *)a3
{
  _TtC12PhotosUICoreP33_D60E6F91601E8B5A6706ADD365AE349710PhotosMenu *v4;
  void *v5;
  _QWORD v7[4];

  v4 = self;
  sub_1A70A35A4((uint64_t)a3, v7);

  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  v5 = (void *)sub_1A7AE4D9C();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return v5;
}

- (id)menuByReplacingChildren:(id)a3
{
  _TtC12PhotosUICoreP33_D60E6F91601E8B5A6706ADD365AE349710PhotosMenu *v4;
  void *v5;

  sub_1A70A3960();
  sub_1A7AE3A10();
  v4 = self;
  v5 = (void *)sub_1A70A374C();

  swift_bridgeObjectRelease();
  return v5;
}

- (_TtC12PhotosUICoreP33_D60E6F91601E8B5A6706ADD365AE349710PhotosMenu)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PhotosMenu();
  return -[UIMenuElement initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
