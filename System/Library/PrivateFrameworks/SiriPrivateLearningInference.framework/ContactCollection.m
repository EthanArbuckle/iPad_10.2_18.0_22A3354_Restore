@implementation ContactCollection

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_254D3DF10;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_254D3DF10 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  _TtC28SiriPrivateLearningInference17ContactCollection *v6;
  void *v7;
  id v8;

  sub_213DB9CDC(0, &qword_254D3DF20);
  v5 = a3;
  v6 = self;
  v7 = (void *)sub_213EF2A30();
  v8 = (id)sub_213EF2844();
  objc_msgSend(v5, sel_encodeObject_forKey_, v7, v8);

}

- (_TtC28SiriPrivateLearningInference17ContactCollection)initWithCoder:(id)a3
{
  return (_TtC28SiriPrivateLearningInference17ContactCollection *)ContactCollection.init(coder:)(a3);
}

- (_TtC28SiriPrivateLearningInference17ContactCollection)init
{
  _TtC28SiriPrivateLearningInference17ContactCollection *result;

  result = (_TtC28SiriPrivateLearningInference17ContactCollection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
