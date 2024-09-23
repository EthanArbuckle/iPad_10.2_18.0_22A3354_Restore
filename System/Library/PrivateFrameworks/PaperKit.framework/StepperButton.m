@implementation StepperButton

- (_TtC8PaperKit13StepperButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized StepperButton.init(coder:)();
}

- (BOOL)isSelected
{
  return @objc StepperButton.isSelected.getter(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  @objc StepperButton.isSelected.setter(self, (uint64_t)a2, a3, (const char **)&selRef_setSelected_);
}

- (BOOL)isHighlighted
{
  return @objc StepperButton.isSelected.getter(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  @objc StepperButton.isSelected.setter(self, (uint64_t)a2, a3, (const char **)&selRef_setHighlighted_);
}

- (BOOL)isEnabled
{
  return @objc StepperButton.isSelected.getter(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  @objc StepperButton.isSelected.setter(self, (uint64_t)a2, a3, (const char **)&selRef_setEnabled_);
}

- (void)addTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
  _TtC8PaperKit13StepperButton *v8;
  _TtC8PaperKit13StepperButton *v9;
  _OWORD v10[2];

  if (a3)
  {
    v8 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v9 = self;
  }
  StepperButton.addTarget(_:action:for:)((uint64_t)v10, (uint64_t)a4, a5);

  outlined destroy of Any?((uint64_t)v10);
}

- (void)removeTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
  _TtC8PaperKit13StepperButton *v8;
  _TtC8PaperKit13StepperButton *v9;
  _OWORD v10[2];

  if (a3)
  {
    v8 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v9 = self;
  }
  StepperButton.removeTarget(_:action:for:)((uint64_t)v10, (uint64_t)a4, a5);

  outlined destroy of Any?((uint64_t)v10);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v6.receiver;
  -[StepperButton traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, v4);
  StepperButton.updateUI()();

}

- (_TtC8PaperKit13StepperButton)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit13StepperButton *result;

  result = (_TtC8PaperKit13StepperButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit13StepperButton_contentButton));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit13StepperButton_imageConfiguration));

}

@end
