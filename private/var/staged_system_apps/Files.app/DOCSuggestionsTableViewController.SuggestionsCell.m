@implementation DOCSuggestionsTableViewController.SuggestionsCell

- (_TtCC5Files33DOCSuggestionsTableViewControllerP33_2E368D64BBCB136E81D511D6E5A68E0E15SuggestionsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  _TtCC5Files33DOCSuggestionsTableViewControllerP33_2E368D64BBCB136E81D511D6E5A68E0E15SuggestionsCell *v9;
  objc_super v11;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for DOCSuggestionsTableViewController.SuggestionsCell();
  v9 = -[DOCSuggestionsTableViewController.SuggestionsCell initWithStyle:reuseIdentifier:](&v11, "initWithStyle:reuseIdentifier:", a3, v8);

  return v9;
}

- (_TtCC5Files33DOCSuggestionsTableViewControllerP33_2E368D64BBCB136E81D511D6E5A68E0E15SuggestionsCell)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCSuggestionsTableViewController.SuggestionsCell();
  return -[DOCSuggestionsTableViewController.SuggestionsCell initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
