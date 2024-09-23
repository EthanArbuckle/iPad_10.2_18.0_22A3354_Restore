@implementation CustomSizeMeasurer

- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  _TtC25RemindersSharingExtensionP33_8326BBA138680702F00C183C494E669A18CustomSizeMeasurer *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  v11 = self;
  v12 = sub_10000B7B8(v10, width, height);
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (_TtC25RemindersSharingExtensionP33_8326BBA138680702F00C183C494E669A18CustomSizeMeasurer)init
{
  _TtC25RemindersSharingExtensionP33_8326BBA138680702F00C183C494E669A18CustomSizeMeasurer *result;

  result = (_TtC25RemindersSharingExtensionP33_8326BBA138680702F00C183C494E669A18CustomSizeMeasurer *)_swift_stdlib_reportUnimplementedInitializer("RemindersSharingExtension.CustomSizeMeasurer", 44, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtC25RemindersSharingExtensionP33_8326BBA138680702F00C183C494E669A18CustomSizeMeasurer_hostCell, a2);
}

@end
