@implementation PXPhotosViewConfiguration.AssociatedData

- (_TtCE12PhotosUICoreCSo25PXPhotosViewConfigurationP33_6438FB509F59F0C2CC485B5197EC0EE114AssociatedData)init
{
  char *v2;
  _TtCE12PhotosUICoreCSo25PXPhotosViewConfigurationP33_6438FB509F59F0C2CC485B5197EC0EE114AssociatedData *v3;
  objc_super v5;

  v2 = (char *)self
     + OBJC_IVAR____TtCE12PhotosUICoreCSo25PXPhotosViewConfigurationP33_6438FB509F59F0C2CC485B5197EC0EE114AssociatedData_titleModel;
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((_QWORD *)v2 + 4) = 0;
  v3 = self;
  sub_1A7ADF534();
  *(Class *)((char *)&v3->super.isa
           + OBJC_IVAR____TtCE12PhotosUICoreCSo25PXPhotosViewConfigurationP33_6438FB509F59F0C2CC485B5197EC0EE114AssociatedData_previewKeyAsset) = 0;

  v5.receiver = v3;
  v5.super_class = (Class)_s14AssociatedDataCMa_7();
  return -[PXPhotosViewConfiguration.AssociatedData init](&v5, sel_init);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1A694E38C((uint64_t)self+ OBJC_IVAR____TtCE12PhotosUICoreCSo25PXPhotosViewConfigurationP33_6438FB509F59F0C2CC485B5197EC0EE114AssociatedData_titleModel, (unint64_t *)&qword_1EE8C3428, (unint64_t *)&qword_1EE8C2790);
  v3 = (char *)self
     + OBJC_IVAR____TtCE12PhotosUICoreCSo25PXPhotosViewConfigurationP33_6438FB509F59F0C2CC485B5197EC0EE114AssociatedData_environmentValues;
  v4 = sub_1A7ADF540();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
}

@end
