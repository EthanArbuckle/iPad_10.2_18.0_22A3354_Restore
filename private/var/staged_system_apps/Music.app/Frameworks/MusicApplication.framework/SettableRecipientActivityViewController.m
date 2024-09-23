@implementation SettableRecipientActivityViewController

- (void)_prepareActivity:(id)a3
{
  id v4;
  _TtC16MusicApplicationP33_B8BEB5E19410BDA0BB2B4503F9E0BB4139SettableRecipientActivityViewController *v5;

  v4 = a3;
  v5 = self;
  sub_77732C(v4);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.recipientEmail[OBJC_IVAR____TtC16MusicApplicationP33_B8BEB5E19410BDA0BB2B4503F9E0BB4139SettableRecipientActivityViewController_recipientEmail]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.recipientEmail[OBJC_IVAR____TtC16MusicApplicationP33_B8BEB5E19410BDA0BB2B4503F9E0BB4139SettableRecipientActivityViewController_recipientPhoneNumber]);
}

@end
