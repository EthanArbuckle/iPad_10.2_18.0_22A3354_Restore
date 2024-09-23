@implementation PPStringDonationHandler

- (PPStringDonationHandler)init
{
  PPStringDonationHandler *v2;
  uint64_t v3;
  PPSWStringDonationConsumer *consumer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PPStringDonationHandler;
  v2 = -[PPStringDonationHandler init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    consumer = v2->_consumer;
    v2->_consumer = (PPSWStringDonationConsumer *)v3;

  }
  return v2;
}

- (PPStringDonationHandler)initWithTopicStore:(id)a3 entityStore:(id)a4 topicDissector:(id)a5 entityDissector:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PPStringDonationHandler *v14;
  PPSWStringDonationConsumer *v15;
  PPSWStringDonationConsumer *consumer;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PPStringDonationHandler;
  v14 = -[PPStringDonationHandler init](&v18, sel_init);
  if (v14)
  {
    v15 = -[PPSWStringDonationConsumer initWithTopicStore:entityStore:locationStore:entityDissector:topicDissector:]([PPSWStringDonationConsumer alloc], "initWithTopicStore:entityStore:locationStore:entityDissector:topicDissector:", v10, v11, 0, v13, v12);
    consumer = v14->_consumer;
    v14->_consumer = v15;

  }
  return v14;
}

- (void)donateLabeledStrings:(id)a3 bundleId:(id)a4 groupId:(id)a5 documentId:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  PPSWStringDonation *v17;
  PPSWStringDonationConsumer *consumer;
  id v19;
  _QWORD v20[4];
  id v21;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[PPSWStringDonation initWithLabeledStrings:bundleId:groupId:documentId:]([PPSWStringDonation alloc], "initWithLabeledStrings:bundleId:groupId:documentId:", v16, v15, v14, v13);

  consumer = self->_consumer;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __87__PPStringDonationHandler_donateLabeledStrings_bundleId_groupId_documentId_completion___block_invoke;
  v20[3] = &unk_1E7E1B2B0;
  v21 = v12;
  v19 = v12;
  -[PPSWStringDonationConsumer consumeWithDonation:completionHandler:](consumer, "consumeWithDonation:completionHandler:", v17, v20);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consumer, 0);
}

uint64_t __87__PPStringDonationHandler_donateLabeledStrings_bundleId_groupId_documentId_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
