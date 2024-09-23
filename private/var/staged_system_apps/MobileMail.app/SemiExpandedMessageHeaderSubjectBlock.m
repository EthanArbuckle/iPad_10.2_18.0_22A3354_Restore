@implementation SemiExpandedMessageHeaderSubjectBlock

- (_TtC10MobileMail37SemiExpandedMessageHeaderSubjectBlock)initWithHandler:(id)a3
{
  uint64_t v3;
  void *v5;

  v5 = _Block_copy(a3);
  v3 = swift_allocObject(&unk_10052E7C8, 24, 7);
  *(_QWORD *)(v3 + 16) = v5;
  return (_TtC10MobileMail37SemiExpandedMessageHeaderSubjectBlock *)sub_100348924((uint64_t)sub_10031A2F8, v3);
}

- (void)displayMessageUsingViewModel:(id)a3
{
  id v4;
  _TtC10MobileMail37SemiExpandedMessageHeaderSubjectBlock *v5;

  v4 = a3;
  v5 = self;
  sub_100348CD4(a3);

}

- (void)createPrimaryViews
{
  _TtC10MobileMail37SemiExpandedMessageHeaderSubjectBlock *v2;

  v2 = self;
  sub_100349058();

}

- (void)tappedHeader:(id)a3
{
  id v4;
  _TtC10MobileMail37SemiExpandedMessageHeaderSubjectBlock *v5;

  v4 = a3;
  v5 = self;
  sub_10034A360((uint64_t)a3);

}

- (_TtC10MobileMail37SemiExpandedMessageHeaderSubjectBlock)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail37SemiExpandedMessageHeaderSubjectBlock *)sub_10034A638();
}

- (void).cxx_destruct
{

  sub_1001F20D8((id *)&self->MFMessageHeaderViewBlock_opaque[OBJC_IVAR____TtC10MobileMail37SemiExpandedMessageHeaderSubjectBlock_tappedRecognizer]);
  swift_release();
}

@end
