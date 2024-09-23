@implementation PPSWStringDonationConsumer

- (PPSWStringDonationConsumer)initWithTopicStore:(id)a3 entityStore:(id)a4 locationStore:(id)a5 entityDissector:(id)a6 topicDissector:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  return (PPSWStringDonationConsumer *)StringDonationConsumer.init(topicStore:entityStore:locationStore:entityDissector:topicDissector:)((uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7);
}

- (PPSWStringDonationConsumer)init
{
  PPSWStringDonationConsumer *result;

  StringDonationConsumer.init()();
  return result;
}

- (void)consumeWithDonation:(PPSWStringDonation *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  PPSWStringDonation *v8;
  PPSWStringDonationConsumer *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_1C394C9A4((uint64_t)&unk_1EF8E4EE8, (uint64_t)v7);
}

- (PPSWStringDonationConsumer)initWithTopicStore:(id)a3 entityStore:(id)a4 locationStore:(id)a5 writebackDissector:(id)a6 entityDissector:(id)a7 topicDissector:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  sub_1C394CA80();
}

@end
