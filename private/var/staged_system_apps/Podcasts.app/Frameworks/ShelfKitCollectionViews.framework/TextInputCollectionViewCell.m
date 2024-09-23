@implementation TextInputCollectionViewCell

- (_TtC23ShelfKitCollectionViews27TextInputCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews27TextInputCollectionViewCell *)sub_2D31B0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews27TextInputCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2D4F0C();
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews27TextInputCollectionViewCell *v2;

  v2 = self;
  sub_2D3900();

}

- (BOOL)canBecomeFirstResponder
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews27TextInputCollectionViewCell_textInputField), "canBecomeFirstResponder");
}

- (BOOL)becomeFirstResponder
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews27TextInputCollectionViewCell_textInputField), "becomeFirstResponder");
}

- (BOOL)canResignFirstResponder
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews27TextInputCollectionViewCell_textInputField), "canResignFirstResponder");
}

- (BOOL)resignFirstResponder
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews27TextInputCollectionViewCell_textInputField), "resignFirstResponder");
}

- (void)textFieldValueChanged
{
  _TtC23ShelfKitCollectionViews27TextInputCollectionViewCell *v2;

  v2 = self;
  sub_2D47C8();

}

- (void)textFieldEditingDidEndOnExit
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  _TtC23ShelfKitCollectionViews27TextInputCollectionViewCell *v5;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC23ShelfKitCollectionViews27TextInputCollectionViewCell_returnPressedCallback);
  if (v2)
  {
    v3 = *(_QWORD *)&self->textLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews27TextInputCollectionViewCell_returnPressedCallback];
    v4 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC23ShelfKitCollectionViews27TextInputCollectionViewCell_textInputField);
    v5 = self;
    sub_2C690((uint64_t)v2, v3);
    v2(v4);
    sub_1D618((uint64_t)v2, v3);

  }
}

- (void)prepareForReuse
{
  _TtC23ShelfKitCollectionViews27TextInputCollectionViewCell *v2;

  v2 = self;
  sub_2D494C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews27TextInputCollectionViewCell_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews27TextInputCollectionViewCell_textInputField));
  sub_1D618(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews27TextInputCollectionViewCell_textChangedCallback), *(_QWORD *)&self->textLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews27TextInputCollectionViewCell_textChangedCallback]);
  sub_1D618(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews27TextInputCollectionViewCell_returnPressedCallback), *(_QWORD *)&self->textLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews27TextInputCollectionViewCell_returnPressedCallback]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews27TextInputCollectionViewCell_bottomDivider));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews27TextInputCollectionViewCell_topDivider));
}

@end
