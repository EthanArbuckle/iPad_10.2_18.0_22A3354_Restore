@implementation UserDetailsEditCell

- (_TtC16MusicApplication19UserDetailsEditCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication19UserDetailsEditCell *)sub_2D6598(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication19UserDetailsEditCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2D845C();
}

- (NSString)name
{
  return (NSString *)sub_2D6B00(self, (uint64_t)a2, (uint64_t (*)(void))sub_2D7C5C);
}

- (void)setName:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  _TtC16MusicApplication19UserDetailsEditCell *v8;
  id v9;
  id v10;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = a3;
  v8 = self;
  v9 = sub_2D7C5C();
  v10 = String._bridgeToObjectiveC()();
  objc_msgSend(v9, "setText:", v10);

  swift_bridgeObjectRelease(v6);
}

- (NSString)nickname
{
  return (NSString *)sub_2D6B00(self, (uint64_t)a2, (uint64_t (*)(void))sub_2D7C70);
}

- (void)setNickname:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  _TtC16MusicApplication19UserDetailsEditCell *v9;
  id v10;
  NSString v11;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v8 = a3;
  v9 = self;
  v10 = sub_2D7C70();
  v11 = String._bridgeToObjectiveC()();
  objc_msgSend(v10, "setText:", v11);

  sub_2D815C(v5, v7);
  swift_bridgeObjectRelease(v7);
}

- (void)music_inheritedLayoutInsetsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UserDetailsEditCell();
  v2 = v3.receiver;
  -[UserDetailsEditCell music_inheritedLayoutInsetsDidChange](&v3, "music_inheritedLayoutInsetsDidChange");
  objc_msgSend(v2, "layoutSubviews", v3.receiver, v3.super_class);

}

- (BOOL)becomeFirstResponder
{
  _TtC16MusicApplication19UserDetailsEditCell *v2;
  id v3;
  unsigned __int8 v4;

  v2 = self;
  v3 = sub_2D7C5C();
  v4 = objc_msgSend(v3, "becomeFirstResponder");

  return v4;
}

- (BOOL)resignFirstResponder
{
  _TtC16MusicApplication19UserDetailsEditCell *v2;
  id v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  _TtC16MusicApplication19UserDetailsEditCell *v6;

  v2 = self;
  v3 = sub_2D7C5C();
  v4 = objc_msgSend(v3, "resignFirstResponder");

  if ((v4 & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = (_TtC16MusicApplication19UserDetailsEditCell *)sub_2D7C70();
    v5 = -[UserDetailsEditCell resignFirstResponder](v6, "resignFirstResponder");

    v2 = v6;
  }

  return v5;
}

- (void)layoutSubviews
{
  _TtC16MusicApplication19UserDetailsEditCell *v2;

  v2 = self;
  sub_2D6D58();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication19UserDetailsEditCell *v6;

  v5 = a3;
  v6 = self;
  sub_2D73D4((uint64_t)a3);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  _TtC16MusicApplication19UserDetailsEditCell *v15;

  length = a4.length;
  location = a4.location;
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v12 = v11;
  v13 = a3;
  v14 = a5;
  v15 = self;
  LOBYTE(length) = sub_2D7800(v13, location, length, v10, v12);

  swift_bridgeObjectRelease(v12);
  return length & 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  sub_64880((uint64_t)self + OBJC_IVAR____TtC16MusicApplication19UserDetailsEditCell_editDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19UserDetailsEditCell_validationRule));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19UserDetailsEditCell____lazy_storage___nameTextField));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19UserDetailsEditCell____lazy_storage___nicknameTextField));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19UserDetailsEditCell____lazy_storage___divider));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19UserDetailsEditCell____lazy_storage___nicknamePrefixLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19UserDetailsEditCell____lazy_storage___nameTextFieldTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19UserDetailsEditCell____lazy_storage___nicknameTextFieldTitleLabel));
}

@end
