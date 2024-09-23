@implementation PhotosMenu.AssociatedData

- (_TtCC12PhotosUICoreP33_D60E6F91601E8B5A6706ADD365AE349710PhotosMenu14AssociatedData)init
{
  _QWORD *v3;
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC12PhotosUICoreP33_D60E6F91601E8B5A6706ADD365AE349710PhotosMenu14AssociatedData_onOpenAction);
  *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC12PhotosUICoreP33_D60E6F91601E8B5A6706ADD365AE349710PhotosMenu14AssociatedData_onCloseAction);
  v5 = (objc_class *)type metadata accessor for PhotosMenu.AssociatedData();
  *v4 = 0;
  v4[1] = 0;
  v7.receiver = self;
  v7.super_class = v5;
  return -[PhotosMenu.AssociatedData init](&v7, sel_init);
}

- (void).cxx_destruct
{
  sub_1A6855D80(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC12PhotosUICoreP33_D60E6F91601E8B5A6706ADD365AE349710PhotosMenu14AssociatedData_onOpenAction));
  sub_1A6855D80(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC12PhotosUICoreP33_D60E6F91601E8B5A6706ADD365AE349710PhotosMenu14AssociatedData_onCloseAction));
}

@end
