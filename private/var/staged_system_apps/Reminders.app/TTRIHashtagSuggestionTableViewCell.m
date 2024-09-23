@implementation TTRIHashtagSuggestionTableViewCell

- (_TtC9Reminders34TTRIHashtagSuggestionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC9Reminders34TTRIHashtagSuggestionTableViewCell *)sub_10008112C(a3, (uint64_t)a4, v6);
}

- (_TtC9Reminders34TTRIHashtagSuggestionTableViewCell)initWithCoder:(id)a3
{
  id v4;
  _TtC9Reminders34TTRIHashtagSuggestionTableViewCell *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9Reminders34TTRIHashtagSuggestionTableViewCell____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9Reminders34TTRIHashtagSuggestionTableViewCell____lazy_storage___leadingImageView) = 0;
  v4 = a3;

  result = (_TtC9Reminders34TTRIHashtagSuggestionTableViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010055F310, "Reminders/TTRIHashtagSuggestionTableViewCell.swift", 50, 2, 36, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders34TTRIHashtagSuggestionTableViewCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders34TTRIHashtagSuggestionTableViewCell____lazy_storage___leadingImageView));
}

@end
