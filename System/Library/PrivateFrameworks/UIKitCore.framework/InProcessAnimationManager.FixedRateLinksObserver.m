@implementation InProcessAnimationManager.FixedRateLinksObserver

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  _TtCC5UIKit25InProcessAnimationManager22FixedRateLinksObserver *v10;
  id v11;
  _TtCC5UIKit25InProcessAnimationManager22FixedRateLinksObserver *v12;
  void (*v13)(uint64_t);
  uint64_t v14;
  _OWORD v15[2];

  if (a3)
  {
    sub_1865074F8();
    if (a4)
      goto LABEL_3;
  }
  else if (a4)
  {
LABEL_3:
    swift_unknownObjectRetain();
    v9 = a5;
    v10 = self;
    sub_186507B1C();
    swift_unknownObjectRelease();
    if (!a5)
      goto LABEL_7;
    goto LABEL_4;
  }
  memset(v15, 0, sizeof(v15));
  v11 = a5;
  v12 = self;
  if (a5)
  {
LABEL_4:
    type metadata accessor for NSKeyValueChangeKey(0);
    sub_1852478E0(&qword_1EDD84C00, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_186669068);
    sub_1865073A8();

  }
LABEL_7:
  v13 = *(void (**)(uint64_t))((char *)&self->super.isa
                                       + OBJC_IVAR____TtCC5UIKit25InProcessAnimationManager22FixedRateLinksObserver_handler);
  if (v13)
  {
    v14 = swift_retain();
    v13(v14);
    sub_18518D718((uint64_t)v13);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_18519F088((uint64_t)v15, &qword_1ECD75B20);
}

- (_TtCC5UIKit25InProcessAnimationManager22FixedRateLinksObserver)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC5UIKit25InProcessAnimationManager22FixedRateLinksObserver_handler);
  v4 = (objc_class *)type metadata accessor for InProcessAnimationManager.FixedRateLinksObserver();
  *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[InProcessAnimationManager.FixedRateLinksObserver init](&v6, sel_init);
}

- (void).cxx_destruct
{
  sub_18518D718(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC5UIKit25InProcessAnimationManager22FixedRateLinksObserver_handler));
}

@end
