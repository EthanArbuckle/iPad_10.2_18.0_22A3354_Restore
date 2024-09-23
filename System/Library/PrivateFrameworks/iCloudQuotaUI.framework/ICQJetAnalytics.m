@implementation ICQJetAnalytics

+ (void)preloadWithAccount:(id)a3
{
  id v4;

  swift_beginAccess();
  if (qword_2554D5330)
  {
    v4 = a3;
  }
  else
  {
    qword_2554D5330 = sub_21F3F4600(a3);
    swift_retain();
    swift_release();
  }
  swift_retain();

  swift_release();
}

- (ICQJetAnalytics)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for JetAnalytics();
  return -[ICQJetAnalytics init](&v3, sel_init);
}

@end
