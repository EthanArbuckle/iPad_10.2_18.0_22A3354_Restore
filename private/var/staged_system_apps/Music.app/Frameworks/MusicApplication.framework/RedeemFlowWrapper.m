@implementation RedeemFlowWrapper

+ (id)redeemViewControllerWithInitialCode:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v4 = (void *)getSKUIRedeemViewControllerClass_softClass;
  v12 = getSKUIRedeemViewControllerClass_softClass;
  if (!getSKUIRedeemViewControllerClass_softClass)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __getSKUIRedeemViewControllerClass_block_invoke;
    v8[3] = &unk_1339000;
    v8[4] = &v9;
    __getSKUIRedeemViewControllerClass_block_invoke((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v9, 8);
  v6 = objc_msgSend([v5 alloc], "initWithRedeemCategory:", 1);
  objc_msgSend(v6, "setAttempsAutomaticRedeem:", 1);
  if (v3)
    objc_msgSend(v6, "setInitialCode:", v3);

  return v6;
}

@end
