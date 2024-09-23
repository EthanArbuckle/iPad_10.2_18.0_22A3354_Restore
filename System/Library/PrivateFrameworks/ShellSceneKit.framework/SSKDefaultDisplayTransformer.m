@implementation SSKDefaultDisplayTransformer

- (SSKDefaultDisplayTransformer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[SSKDefaultDisplayTransformer init](&v3, sel_init);
}

- (id)transformDisplayConfiguration:(id)a3
{
  uint64_t v4;
  id v5;
  SSKDefaultDisplayTransformer *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = qword_25441BDC0;
  v5 = a3;
  v6 = self;
  if (v4 != -1)
    swift_once();
  v7 = (void *)qword_25441BE50;
  type metadata accessor for DefaultDisplayTransformerRegistry();
  swift_dynamicCastClassUnconditional();
  v8 = v7;
  sub_246002734(v5);

  sub_245FFC180(0, (unint64_t *)&unk_25441BE90);
  sub_2460035BC();
  v9 = (void *)sub_246017E60();
  swift_bridgeObjectRelease();
  return v9;
}

@end
