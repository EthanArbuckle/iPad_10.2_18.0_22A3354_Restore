@implementation TTRIRemindersListDisclosureButton

- (_TtC15RemindersUICoreP33_4EB1E94F0FA08F88AB1C838BE39CB2DF33TTRIRemindersListDisclosureButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC15RemindersUICoreP33_4EB1E94F0FA08F88AB1C838BE39CB2DF33TTRIRemindersListDisclosureButton *v7;
  void *v8;
  _TtC15RemindersUICoreP33_4EB1E94F0FA08F88AB1C838BE39CB2DF33TTRIRemindersListDisclosureButton *v9;
  id v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)swift_getObjectType();
  v7 = -[TTRIExpandedHitTestButton initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  v8 = (void *)objc_opt_self();
  v9 = v7;
  v10 = objc_msgSend(v8, sel_secondaryLabelColor);
  -[TTRIRemindersListDisclosureButton setTintColor:](v9, sel_setTintColor_, v10);

  return v9;
}

- (_TtC15RemindersUICoreP33_4EB1E94F0FA08F88AB1C838BE39CB2DF33TTRIRemindersListDisclosureButton)initWithCoder:(id)a3
{
  _TtC15RemindersUICoreP33_4EB1E94F0FA08F88AB1C838BE39CB2DF33TTRIRemindersListDisclosureButton *result;

  result = (_TtC15RemindersUICoreP33_4EB1E94F0FA08F88AB1C838BE39CB2DF33TTRIRemindersListDisclosureButton *)sub_1B4908144();
  __break(1u);
  return result;
}

- (CGRect)contentRectForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v7;
  _TtC15RemindersUICoreP33_4EB1E94F0FA08F88AB1C838BE39CB2DF33TTRIRemindersListDisclosureButton *v8;
  CGSize v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = qword_1ED4E53B0;
  v8 = self;
  if (v7 != -1)
    swift_once();
  v9 = (CGSize)xmmword_1ED4E53A0;
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v10 = CGRectGetMidX(v19) - v9.width * 0.5;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v21.origin.y = CGRectGetMidY(v20) - v9.height * 0.5;
  v21.origin.x = v10;
  v21.size = v9;
  v22 = CGRectIntegral(v21);
  v11 = v22.origin.x;
  v12 = v22.origin.y;
  v13 = v22.size.width;
  v14 = v22.size.height;

  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

@end
