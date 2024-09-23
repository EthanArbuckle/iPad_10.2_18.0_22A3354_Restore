@implementation CKOperationGroup

+ (id)CKKSGroupWithName:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)CKOperationGroup);
  objc_msgSend(v4, "setExpectedSendSize:", 1);
  objc_msgSend(v4, "setExpectedReceiveSize:", 1);
  objc_msgSend(v4, "setName:", v3);

  return v4;
}

@end
