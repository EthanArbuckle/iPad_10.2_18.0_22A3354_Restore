@implementation PickerView.PickerButton

- (_TtCV17PasswordManagerUIP33_8E851724D6AC9CB982E7B82E4755373C10PickerView12PickerButton)initWithCoder:(id)a3
{
  _TtCV17PasswordManagerUIP33_8E851724D6AC9CB982E7B82E4755373C10PickerView12PickerButton *result;

  result = (_TtCV17PasswordManagerUIP33_8E851724D6AC9CB982E7B82E4755373C10PickerView12PickerButton *)sub_243850984();
  __break(1u);
  return result;
}

- (_TtCV17PasswordManagerUIP33_8E851724D6AC9CB982E7B82E4755373C10PickerView12PickerButton)init
{
  return (_TtCV17PasswordManagerUIP33_8E851724D6AC9CB982E7B82E4755373C10PickerView12PickerButton *)sub_24373382C();
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  objc_class *v5;
  id v6;
  _TtCV17PasswordManagerUIP33_8E851724D6AC9CB982E7B82E4755373C10PickerView12PickerButton *v7;
  double v8;
  double v9;
  CGFloat MaxX;
  double v11;
  double v12;
  objc_super v13;
  objc_super v14;
  CGPoint result;
  CGRect v16;

  v5 = (objc_class *)type metadata accessor for PickerView.PickerButton();
  v14.receiver = self;
  v14.super_class = v5;
  v6 = a3;
  v7 = self;
  -[PickerView.PickerButton menuAttachmentPointForConfiguration:](&v14, sel_menuAttachmentPointForConfiguration_, v6);
  v9 = v8;
  v13.receiver = v7;
  v13.super_class = v5;
  -[PickerView.PickerButton frame](&v13, sel_frame);
  MaxX = CGRectGetMaxX(v16);

  v11 = MaxX;
  v12 = v9;
  result.y = v12;
  result.x = v11;
  return result;
}

- (NSString)accessibilityLabel
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtCV17PasswordManagerUIP33_8E851724D6AC9CB982E7B82E4755373C10PickerView12PickerButton *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_24384DA08();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_24384D9FC();
  sub_24384D9F0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  v8 = (void *)sub_243850234();
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

- (NSString)accessibilityValue
{
  _TtCV17PasswordManagerUIP33_8E851724D6AC9CB982E7B82E4755373C10PickerView12PickerButton *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;

  v2 = self;
  v3 = -[PickerView.PickerButton titleLabel](v2, sel_titleLabel);
  if (v3 && (v4 = v3, v5 = objc_msgSend(v3, sel_text), v4, v5))
  {
    sub_243850264();

  }
  else
  {

  }
  v6 = (void *)sub_243850234();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtCV17PasswordManagerUIP33_8E851724D6AC9CB982E7B82E4755373C10PickerView12PickerButton)initWithFrame:(CGRect)a3
{
  _TtCV17PasswordManagerUIP33_8E851724D6AC9CB982E7B82E4755373C10PickerView12PickerButton *result;

  result = (_TtCV17PasswordManagerUIP33_8E851724D6AC9CB982E7B82E4755373C10PickerView12PickerButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
