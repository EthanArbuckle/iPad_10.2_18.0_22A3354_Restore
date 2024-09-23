@implementation WFReportShortcutActivity

+ (NSString)activityType
{
  return (NSString *)sub_2201A4E98();
}

- (UIActivityViewController)activityControler
{
  sub_2201A4F0C();
}

- (void)setActivityControler:(id)a3
{
  id v5;
  WFReportShortcutActivity *v6;

  v5 = a3;
  v6 = self;
  sub_2201A4F64(a3);

}

- (WFReportShortcutActivity)initWithWorkflow:(id)a3 completion:(id)a4
{
  void *v5;
  WFReportShortcutActivity *result;

  v5 = _Block_copy(a4);
  *(_QWORD *)(swift_allocObject() + 16) = v5;
  ReportShortcutActivity.init(workflow:completion:)((uint64_t)a3);
  return result;
}

- (NSString)activityType
{
  WFReportShortcutActivity *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_2201A5180();
  v4 = v3;

  return (NSString *)v4;
}

- (NSString)activityTitle
{
  WFReportShortcutActivity *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_2201A5230();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_220306FFC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (BOOL)_isDisabled
{
  return sub_2201A531C() & 1;
}

- (id)_systemImageName
{
  void *v2;

  sub_2201A532C();
  v2 = (void *)sub_220306FFC();
  swift_bridgeObjectRelease();
  return v2;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v4;
  WFReportShortcutActivity *v5;
  BOOL v6;

  v4 = sub_220307164();
  v5 = self;
  v6 = sub_2201A5384(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (UIViewController)activityViewController
{
  WFReportShortcutActivity *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_2201A5880();
  v4 = v3;

  return (UIViewController *)v4;
}

- (WFReportShortcutActivity)init
{
  ReportShortcutActivity.init()();
}

- (void).cxx_destruct
{
  sub_2201A5D60(*(void **)((char *)&self->super.super.isa + OBJC_IVAR___WFReportShortcutActivity_item), *(int64_t *)((char *)&self->super._defaultPriority + OBJC_IVAR___WFReportShortcutActivity_item), *(uint64_t *)((char *)&self->super._activityImageLoader + OBJC_IVAR___WFReportShortcutActivity_item), *((_BYTE *)&self->super._activitySettingsImageLoader + OBJC_IVAR___WFReportShortcutActivity_item));
  swift_release();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___WFReportShortcutActivity____lazy_storage___reportShortcutHostingViewController));
}

@end
