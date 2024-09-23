@implementation VUIAppInstallerHelper

- (VUIAppInstallerHelper)initWithPunchoutAction:(id)a3
{
  id v3;
  VUIAppInstallerHelper *result;

  v3 = a3;
  AppInstallerHelper.init(punchoutAction:)();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (VUIAppInstallerHelper)initWithAppBundleIDs:(id)a3
{
  uint64_t v3;
  VUIAppInstallerHelper *result;

  v3 = sub_1DA1440FC();
  AppInstallerHelper.init(appBundleIDs:)(v3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (VUIAppInstallerHelper)init
{
  AppInstallerHelper.init()();
}

- (void).cxx_destruct
{

  sub_1D970F43C((uint64_t)self + OBJC_IVAR___VUIAppInstallerHelper_punchoutURL, &qword_1EDA92BE0);
  OUTLINED_FUNCTION_43_6();
  OUTLINED_FUNCTION_43_6();
  swift_bridgeObjectRelease();

}

@end
