@implementation PMAppStoreReviewHelper

- (void)attemptToRequestReview:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v4 = (void *)getSKStoreReviewControllerClass_softClass;
  v10 = getSKStoreReviewControllerClass_softClass;
  if (!getSKStoreReviewControllerClass_softClass)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __getSKStoreReviewControllerClass_block_invoke;
    v6[3] = &unk_2513E7198;
    v6[4] = &v7;
    __getSKStoreReviewControllerClass_block_invoke((uint64_t)v6);
    v4 = (void *)v8[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v7, 8);
  objc_msgSend(v5, "requestReviewInScene:", v3);

}

@end
