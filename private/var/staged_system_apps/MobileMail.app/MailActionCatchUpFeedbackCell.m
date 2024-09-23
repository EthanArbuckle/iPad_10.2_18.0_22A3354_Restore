@implementation MailActionCatchUpFeedbackCell

- (_TtP10MobileMail37MailActionCatchUpFeedbackCellDelegate_)delegate
{
  _TtC10MobileMail29MailActionCatchUpFeedbackCell *v2;
  id v5;

  v2 = self;
  v5 = (id)sub_1002B1904();

  return (_TtP10MobileMail37MailActionCatchUpFeedbackCellDelegate_ *)v5;
}

- (void)setDelegate:(id)a3
{
  _TtC10MobileMail29MailActionCatchUpFeedbackCell *v4;

  swift_unknownObjectRetain(a3);
  v4 = self;
  sub_1002B19B4((uint64_t)a3);

}

+ (NSString)reusableIdentifier
{
  uint64_t v2;
  uint64_t v5;
  id v6;

  swift_getObjCClassMetadata(a1);
  swift_getObjCClassMetadata(a1);
  sub_1002B1FD8();
  v5 = v2;
  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  return (NSString *)v6;
}

- (_TtC10MobileMail29MailActionCatchUpFeedbackCell)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail29MailActionCatchUpFeedbackCell *)sub_1002B2014(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10MobileMail29MailActionCatchUpFeedbackCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002B21DC();
}

- (BOOL)_disableRasterizeInAnimations
{
  _TtC10MobileMail29MailActionCatchUpFeedbackCell *v2;
  char v5;

  v2 = self;
  v5 = sub_1002B2318();

  return _convertBoolToObjCBool(_:)(v5 & 1) & 1;
}

- (void)handleThumbsUpWithSender:(id)a3
{
  id v4;
  _TtC10MobileMail29MailActionCatchUpFeedbackCell *v5;

  v4 = a3;
  v5 = self;
  sub_1002B2760((uint64_t)a3);

}

- (void)handleThumbsDownWithSender:(id)a3
{
  id v4;
  _TtC10MobileMail29MailActionCatchUpFeedbackCell *v5;

  v4 = a3;
  v5 = self;
  sub_1002B2854((uint64_t)a3);

}

- (void).cxx_destruct
{
  sub_100221900((uint64_t)self + OBJC_IVAR____TtC10MobileMail29MailActionCatchUpFeedbackCell_delegate);
  sub_1001F20D8((id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail29MailActionCatchUpFeedbackCell____lazy_storage___thumbsUpButton));
  sub_1001F20D8((id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail29MailActionCatchUpFeedbackCell____lazy_storage___thumbsDownButton));
}

@end
