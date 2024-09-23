@implementation PPSWStringDonation

- (NSString)uniqueId
{
  return (NSString *)sub_1C394B82C((uint64_t)self, (uint64_t)a2, (void (*)(void))StringDonation.uniqueId.getter);
}

- (void)setUniqueId:(id)a3
{
  sub_1C394B8A0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))StringDonation.uniqueId.setter);
}

- (double)absoluteTimestamp
{
  return StringDonation.absoluteTimestamp.getter();
}

- (void)setAbsoluteTimestamp:(double)a3
{
  StringDonation.absoluteTimestamp.setter(a3);
}

- (PPSource)source
{
  id v2;

  sub_1C394B79C();
  return (PPSource *)v2;
}

- (void)setSource:(id)a3
{
  id v5;
  PPSWStringDonation *v6;

  v5 = a3;
  v6 = self;
  sub_1C394B80C((uint64_t)a3);

}

- (NSString)extractionContent
{
  return (NSString *)sub_1C394B82C((uint64_t)self, (uint64_t)a2, sub_1C394B860);
}

- (void)setExtractionContent:(id)a3
{
  sub_1C394B8A0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1C394B900);
}

- (BOOL)shouldConsume
{
  return sub_1C394B940() & 1;
}

- (void)setShouldConsume:(BOOL)a3
{
  sub_1C394B974(a3);
}

- (PPSWStringDonation)initWithLabeledStrings:(id)a3 bundleId:(id)a4 groupId:(id)a5 documentId:(id)a6
{
  PPSWStringDonation *result;

  sub_1C3AB7F48();
  sub_1C3AB7F6C();
  sub_1C3AB7F6C();
  sub_1C3AB7F6C();
  StringDonation.init(labeledStrings:bundleId:groupId:documentId:)();
  return result;
}

- (PPSWStringDonation)init
{
  StringDonation.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
