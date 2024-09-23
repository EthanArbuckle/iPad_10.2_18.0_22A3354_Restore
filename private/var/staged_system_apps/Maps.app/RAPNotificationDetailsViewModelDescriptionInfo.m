@implementation RAPNotificationDetailsViewModelDescriptionInfo

- (NSString)imageName
{
  return (NSString *)sub_10009F538((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___RAPNotificationDetailsViewModelDescriptionInfo_imageName);
}

- (UIColor)imageBackgroundColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR___RAPNotificationDetailsViewModelDescriptionInfo_imageBackgroundColor));
}

- (NSString)titleText
{
  return (NSString *)sub_10009F538((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___RAPNotificationDetailsViewModelDescriptionInfo_titleText);
}

- (NSString)descriptionText
{
  return (NSString *)sub_10009F538((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___RAPNotificationDetailsViewModelDescriptionInfo_descriptionText);
}

- (RAPNotificationDetailsViewModelDescriptionInfo)init
{
  RAPNotificationDetailsViewModelDescriptionInfo *result;

  result = (RAPNotificationDetailsViewModelDescriptionInfo *)_swift_stdlib_reportUnimplementedInitializer("Maps.DescriptionInfo", 20, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->imageName[OBJC_IVAR___RAPNotificationDetailsViewModelDescriptionInfo_imageName]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___RAPNotificationDetailsViewModelDescriptionInfo_imageBackgroundColor));
  swift_bridgeObjectRelease(*(_QWORD *)&self->imageName[OBJC_IVAR___RAPNotificationDetailsViewModelDescriptionInfo_titleText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->imageName[OBJC_IVAR___RAPNotificationDetailsViewModelDescriptionInfo_descriptionText]);
}

@end
