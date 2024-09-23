@implementation Search.Bar

- (_TtCC16MusicApplication6Search3Bar)initWithFrame:(CGRect)a3
{
  _TtCC16MusicApplication6Search3Bar *result;

  sub_66AB58(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtCC16MusicApplication6Search3Bar)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_66EE60();
}

- (void)layoutSubviews
{
  _TtCC16MusicApplication6Search3Bar *v2;

  v2 = self;
  sub_66BB90();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtCC16MusicApplication6Search3Bar *v6;

  v5 = a3;
  v6 = self;
  sub_66BCD8((uint64_t)a3);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtCC16MusicApplication6Search3Bar *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_66BE5C((uint64_t)a4, x, y);

  return v10;
}

- (void)setShowsScopeBar:(BOOL)a3 animated:(BOOL)a4
{
  _TtCC16MusicApplication6Search3Bar *v6;

  v6 = self;
  sub_66C01C(a3, a4);

}

- (NSArray)scopeButtonTitles
{
  return (NSArray *)Array._bridgeToObjectiveC()().super.isa;
}

- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged
{
  return 1;
}

- (NSString)text
{
  char *v2;
  uint64_t v3;
  NSString v4;
  _BYTE v6[24];

  v2 = (char *)self + OBJC_IVAR____TtCC16MusicApplication6Search3Bar_barText;
  swift_beginAccess((char *)self + OBJC_IVAR____TtCC16MusicApplication6Search3Bar_barText, v6, 0, 0);
  v3 = *((_QWORD *)v2 + 1);
  if (!v3)
    return (NSString *)0;
  swift_bridgeObjectRetain(v3);
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (void)setText:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  _TtCC16MusicApplication6Search3Bar *v8;
  char v9[24];

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtCC16MusicApplication6Search3Bar_barText);
  swift_beginAccess((char *)self + OBJC_IVAR____TtCC16MusicApplication6Search3Bar_barText, v9, 1, 0);
  *v7 = v4;
  v7[1] = v6;
  v8 = self;
  swift_bridgeObjectRelease();
  sub_66CBE0();

}

- (NSString)placeholder
{
  _TtCC16MusicApplication6Search3Bar *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_66C7FC();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setPlaceholder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtCC16MusicApplication6Search3Bar *v8;
  _BYTE v9[24];

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (char *)self + OBJC_IVAR____TtCC16MusicApplication6Search3Bar_barText;
  swift_beginAccess((char *)self + OBJC_IVAR____TtCC16MusicApplication6Search3Bar_barText, v9, 1, 0);
  *((_QWORD *)v7 + 4) = v4;
  *((_QWORD *)v7 + 5) = v6;
  v8 = self;
  swift_bridgeObjectRelease();
  sub_66CBE0();

}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
  _TtCC16MusicApplication6Search3Bar *v5;

  v4 = a3;
  v5 = self;
  sub_66CBE0();

}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;
  _TtCC16MusicApplication6Search3Bar *v5;

  v4 = a3;
  v5 = self;
  sub_66EFE0();

}

- (void)textFieldDidChange:(id)a3
{
  id v4;
  _TtCC16MusicApplication6Search3Bar *v5;

  v4 = a3;
  v5 = self;
  sub_66C9FC(v4);

}

- (BOOL)showsScopeBar
{
  return *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtCC16MusicApplication6Search3Bar__showsScopeBar);
}

- (void)setShowsScopeBar:(BOOL)a3
{
  -[Search.Bar setShowsScopeBar:animated:](self, "setShowsScopeBar:animated:", a3, 0);
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtCC16MusicApplication6Search3Bar____lazy_storage___impressionsTracker));
  v3 = *(_QWORD *)&self->selectedSource[OBJC_IVAR____TtCC16MusicApplication6Search3Bar_barText];
  v4 = *(_QWORD *)&self->barText[OBJC_IVAR____TtCC16MusicApplication6Search3Bar_barText + 22];
  objc_release(*(id *)&self->$__lazy_storage_$_impressionsTracker[OBJC_IVAR____TtCC16MusicApplication6Search3Bar_barText
                                                                + 7]);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication6Search3Bar_scopeBarContentView));
}

@end
