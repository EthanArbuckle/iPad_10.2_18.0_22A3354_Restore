@implementation VITextLookupFlowCompatible

- (_TtC18VisualIntelligence26VITextLookupFlowCompatible)init
{
  _TtC18VisualIntelligence26VITextLookupFlowCompatible *v2;
  objc_super v4;

  v2 = self;
  *(Class *)((char *)&v2->super.isa + OBJC_IVAR____TtC18VisualIntelligence26VITextLookupFlowCompatible_flow) = (Class)sub_1D48C5F0C(0, (uint64_t)sub_1D48C5A78, 0);

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for VITextLookupFlowCompatible();
  return -[VITextLookupFlowCompatible init](&v4, sel_init);
}

- (id)lookupTextWithQuery:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC18VisualIntelligence26VITextLookupFlowCompatible *v8;
  id v9;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  v9 = sub_1D48C6064((uint64_t)v7, (uint64_t)v8, v6);
  _Block_release(v6);
  _Block_release(v6);

  return v9;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
