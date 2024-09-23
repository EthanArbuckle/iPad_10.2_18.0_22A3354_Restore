@implementation TextFieldCell

- (_TtC16MusicApplication13TextFieldCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication13TextFieldCell *)sub_1495B0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication13TextFieldCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_14AACC();
}

- (BOOL)canBecomeFirstResponder
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication13TextFieldCell_valueTextField), "canBecomeFirstResponder");
}

- (BOOL)becomeFirstResponder
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication13TextFieldCell_valueTextField), "becomeFirstResponder");
}

- (BOOL)canResignFirstResponder
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication13TextFieldCell_valueTextField), "canResignFirstResponder");
}

- (BOOL)resignFirstResponder
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication13TextFieldCell_valueTextField), "resignFirstResponder");
}

- (BOOL)isFirstResponder
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication13TextFieldCell_valueTextField), "isFirstResponder");
}

- (void)music_inheritedLayoutInsetsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TextFieldCell();
  v2 = v3.receiver;
  -[TextFieldCell music_inheritedLayoutInsetsDidChange](&v3, "music_inheritedLayoutInsetsDidChange");
  objc_msgSend(v2, "setNeedsLayout", v3.receiver, v3.super_class);

}

- (void)layoutSubviews
{
  _TtC16MusicApplication13TextFieldCell *v2;

  v2 = self;
  sub_149BE4();

}

- (NSDirectionalEdgeInsets)_preferredSeparatorInsetsForProposedInsets:(NSDirectionalEdgeInsets)a3
{
  CGFloat trailing;
  CGFloat bottom;
  CGFloat top;
  void *v6;
  _TtC16MusicApplication13TextFieldCell *v7;
  CGFloat MinX;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v13;
  NSDirectionalEdgeInsets result;

  trailing = a3.trailing;
  bottom = a3.bottom;
  top = a3.top;
  v6 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication13TextFieldCell_descriptionLabel);
  v7 = self;
  objc_msgSend(v6, "frame");
  MinX = CGRectGetMinX(v13);

  v9 = top;
  v10 = MinX;
  v11 = bottom;
  v12 = trailing;
  result.trailing = v12;
  result.bottom = v11;
  result.leading = v10;
  result.top = v9;
  return result;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
  _TtC16MusicApplication13TextFieldCell *v5;

  v4 = a3;
  v5 = self;
  sub_14A078(v4);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  _TtC16MusicApplication13TextFieldCell *v14;

  length = a4.length;
  location = a4.location;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v11 = v10;
  v12 = a3;
  v13 = a5;
  v14 = self;
  sub_14A2EC(v12, location, length);

  swift_bridgeObjectRelease(v11);
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  char *v5;
  uint64_t Strong;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void);
  id v10;
  _TtC16MusicApplication13TextFieldCell *v11;

  v5 = (char *)self + OBJC_IVAR____TtC16MusicApplication13TextFieldCell_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC16MusicApplication13TextFieldCell_delegate);
  if (Strong)
  {
    v7 = Strong;
    v8 = *((_QWORD *)v5 + 1);
    swift_getObjectType();
    v9 = *(void (**)(void))(v8 + 24);
    v10 = a3;
    v11 = self;
    v9();

    swift_unknownObjectRelease(v7);
  }
  return 0;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  char *v5;
  uint64_t Strong;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void);
  id v10;
  _TtC16MusicApplication13TextFieldCell *v11;

  v5 = (char *)self + OBJC_IVAR____TtC16MusicApplication13TextFieldCell_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC16MusicApplication13TextFieldCell_delegate);
  if (Strong)
  {
    v7 = Strong;
    v8 = *((_QWORD *)v5 + 1);
    swift_getObjectType();
    v9 = *(void (**)(void))(v8 + 32);
    v10 = a3;
    v11 = self;
    v9();

    swift_unknownObjectRelease(v7);
  }
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v5;
  _TtC16MusicApplication13TextFieldCell *v6;
  id v7;

  swift_getObjectType();
  v5 = a3;
  v6 = self;
  v7 = -[TextFieldCell traitCollection](v6, "traitCollection");
  sub_14A640(v7, 0.0);

  objc_msgSend(v5, "frame");
  objc_msgSend(v5, "setFrame:");

  return v5;
}

- (void).cxx_destruct
{
  sub_64880((uint64_t)self + OBJC_IVAR____TtC16MusicApplication13TextFieldCell_delegate);
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC16MusicApplication13TextFieldCell_descriptionText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC16MusicApplication13TextFieldCell_placeholder]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC16MusicApplication13TextFieldCell_valueImmutablePrefixText]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13TextFieldCell_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13TextFieldCell_valueTextField));
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC16MusicApplication13TextFieldCell__valueText]);
}

@end
