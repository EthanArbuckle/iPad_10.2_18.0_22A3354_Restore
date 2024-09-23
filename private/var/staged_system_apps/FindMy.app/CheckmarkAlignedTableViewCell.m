@implementation CheckmarkAlignedTableViewCell

- (int64_t)accessoryType
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CheckmarkAlignedTableViewCell();
  return -[CheckmarkAlignedTableViewCell accessoryType](&v3, "accessoryType");
}

- (void)setAccessoryType:(int64_t)a3
{
  _TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F29CheckmarkAlignedTableViewCell *v4;
  _TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F29CheckmarkAlignedTableViewCell *v5;
  double v6;
  double v7;
  id v8;
  objc_super v9;

  v4 = self;
  v5 = v4;
  if (a3 == 3)
  {
    -[CheckmarkAlignedTableViewCell setAccessoryView:](v4, "setAccessoryView:", 0);
  }
  else
  {
    v6 = sub_100094C94();
    v8 = objc_msgSend(objc_allocWithZone((Class)UIView), "initWithFrame:", 0.0, 0.0, v6, v7);
    -[CheckmarkAlignedTableViewCell setAccessoryView:](v5, "setAccessoryView:", v8);

  }
  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for CheckmarkAlignedTableViewCell();
  -[CheckmarkAlignedTableViewCell setAccessoryType:](&v9, "setAccessoryType:", a3);

}

- (_TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F29CheckmarkAlignedTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSString v9;
  char *v10;
  _TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F29CheckmarkAlignedTableViewCell *v11;
  objc_super v13;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
    v8 = (char *)self
       + OBJC_IVAR____TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F29CheckmarkAlignedTableViewCell____lazy_storage___checkmarkSpacingSize;
    *(_QWORD *)v8 = 0;
    *((_QWORD *)v8 + 1) = 0;
    v8[16] = 1;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v9 = 0;
    v10 = (char *)self
        + OBJC_IVAR____TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F29CheckmarkAlignedTableViewCell____lazy_storage___checkmarkSpacingSize;
    *(_QWORD *)v10 = 0;
    *((_QWORD *)v10 + 1) = 0;
    v10[16] = 1;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for CheckmarkAlignedTableViewCell();
  v11 = -[CheckmarkAlignedTableViewCell initWithStyle:reuseIdentifier:](&v13, "initWithStyle:reuseIdentifier:", a3, v9);

  return v11;
}

- (_TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F29CheckmarkAlignedTableViewCell)initWithCoder:(id)a3
{
  char *v4;
  objc_super v6;

  v4 = (char *)self
     + OBJC_IVAR____TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F29CheckmarkAlignedTableViewCell____lazy_storage___checkmarkSpacingSize;
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v4[16] = 1;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CheckmarkAlignedTableViewCell();
  return -[CheckmarkAlignedTableViewCell initWithCoder:](&v6, "initWithCoder:", a3);
}

@end
