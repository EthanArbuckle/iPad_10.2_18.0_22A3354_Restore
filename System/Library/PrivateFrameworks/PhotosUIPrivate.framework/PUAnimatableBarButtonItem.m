@implementation PUAnimatableBarButtonItem

- (NSString)currentImageName
{
  uint64_t v2;
  void *v3;

  sub_1AAC56600();
  if (v2)
  {
    v3 = (void *)sub_1AB08D468();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setCurrentImageName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  PUAnimatableBarButtonItem *v7;

  if (a3)
  {
    v4 = sub_1AB08D498();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_1AAC566A4(v4, v6);

}

+ (id)barButtonItemWithSystemImageName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;

  v3 = sub_1AB08D498();
  v5 = v4;
  swift_getObjCClassMetadata();
  v6 = sub_1AAC566D4(v3, v5);
  swift_bridgeObjectRelease();
  return v6;
}

- (void)setImageNamed:(id)a3 animation:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  PUAnimatableBarButtonItem *v9;

  v6 = sub_1AB08D498();
  v8 = v7;
  v9 = self;
  sub_1AAC56DCC(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (void)addTarget:(id)a3 action:(SEL)a4 for:(unint64_t)a5
{
  PUAnimatableBarButtonItem *v8;
  PUAnimatableBarButtonItem *v9;
  _OWORD v10[2];

  if (a3)
  {
    v8 = self;
    swift_unknownObjectRetain();
    sub_1AB08DCA8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v9 = self;
  }
  sub_1AAC5796C((uint64_t)v10, (uint64_t)a4, a5);

  sub_1AAB849A4((uint64_t)v10);
}

- (PUAnimatableBarButtonItem)init
{
  PUAnimatableBarButtonItem *result;

  sub_1AAC57B00();
  return result;
}

- (PUAnimatableBarButtonItem)initWithCoder:(id)a3
{
  PUAnimatableBarButtonItem *result;

  sub_1AAC57B9C(a3);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
