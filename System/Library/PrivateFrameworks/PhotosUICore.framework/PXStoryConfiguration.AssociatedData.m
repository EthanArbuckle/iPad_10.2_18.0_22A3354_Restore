@implementation PXStoryConfiguration.AssociatedData

- (_TtCE12PhotosUICoreCSo20PXStoryConfigurationP33_27B58BDBD52885D8CE4F3AB1064A7A5514AssociatedData)init
{
  objc_super v4;

  sub_1A7ADF534();
  v4.receiver = self;
  v4.super_class = (Class)_s14AssociatedDataCMa_3();
  return -[PXStoryConfiguration.AssociatedData init](&v4, sel_init);
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self
     + OBJC_IVAR____TtCE12PhotosUICoreCSo20PXStoryConfigurationP33_27B58BDBD52885D8CE4F3AB1064A7A5514AssociatedData_environmentValues;
  v3 = sub_1A7ADF540();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
