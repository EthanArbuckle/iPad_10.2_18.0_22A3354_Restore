@implementation STOnBoardingConfigurationUser

- (NSString)altDSID
{
  return (NSString *)sub_219B911EC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___STOnBoardingConfigurationUser_altDSID);
}

- (NSString)childName
{
  return (NSString *)sub_219B911EC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___STOnBoardingConfigurationUser_childName);
}

- (int64_t)demographic
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___STOnBoardingConfigurationUser_demographic);
}

- (NSNumber)dsid
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___STOnBoardingConfigurationUser_dsid));
}

- (BOOL)isChild
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR___STOnBoardingConfigurationUser_demographic) == 0;
}

- (NSNumber)ageBridge
{
  id v2;

  if ((self->age[OBJC_IVAR___STOnBoardingConfigurationUser_age] & 1) != 0)
    v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_init);
  else
    v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, *(Class *)((char *)&self->super.isa + OBJC_IVAR___STOnBoardingConfigurationUser_age));
  return (NSNumber *)v2;
}

- (STOnBoardingConfigurationUser)init
{
  STOnBoardingConfigurationUser *result;

  result = (STOnBoardingConfigurationUser *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
