@implementation ExternalAppInstallTemplateController

- (void)vui_viewDidAppear:(BOOL)a3
{
  _TtC8VideosUI36ExternalAppInstallTemplateController *v4;

  v4 = self;
  sub_1DA0D970C(a3);

}

- (_TtC8VideosUI36ExternalAppInstallTemplateController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC8VideosUI36ExternalAppInstallTemplateController *result;

  if (a3)
  {
    v5 = sub_1DA143E80();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  sub_1DA0D98A0(v5, v7, a4);
  OUTLINED_FUNCTION_9();
  return result;
}

- (_TtC8VideosUI36ExternalAppInstallTemplateController)initWithCoder:(id)a3
{
  _TtC8VideosUI36ExternalAppInstallTemplateController *result;

  sub_1DA0D997C(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  sub_1D970F43C((uint64_t)self + OBJC_IVAR____TtC8VideosUI36ExternalAppInstallTemplateController_appInfo, qword_1F023BFE8);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI36ExternalAppInstallTemplateController_appInstallerVC));
  OUTLINED_FUNCTION_36_3(*(id *)((char *)&self->super.super.super.super.isa
                               + OBJC_IVAR____TtC8VideosUI36ExternalAppInstallTemplateController_installerHelper));
}

@end
