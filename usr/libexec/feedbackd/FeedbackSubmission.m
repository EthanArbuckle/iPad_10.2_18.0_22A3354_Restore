@implementation FeedbackSubmission

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9feedbackd18FeedbackSubmission *v5;

  v4 = a3;
  v5 = self;
  sub_10000A108(v4);

}

- (_TtC9feedbackd18FeedbackSubmission)initWithCoder:(id)a3
{
  return (_TtC9feedbackd18FeedbackSubmission *)sub_10000A2F0(a3);
}

- (_TtC9feedbackd18FeedbackSubmission)init
{
  _TtC9feedbackd18FeedbackSubmission *result;

  result = (_TtC9feedbackd18FeedbackSubmission *)_swift_stdlib_reportUnimplementedInitializer("feedbackd.FeedbackSubmission", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(_QWORD *)&self->formIdentifier[OBJC_IVAR____TtC9feedbackd18FeedbackSubmission_formIdentifier]);
  v3 = (char *)self + OBJC_IVAR____TtC9feedbackd18FeedbackSubmission_date;
  v4 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->formIdentifier[OBJC_IVAR____TtC9feedbackd18FeedbackSubmission_build]);
}

@end
