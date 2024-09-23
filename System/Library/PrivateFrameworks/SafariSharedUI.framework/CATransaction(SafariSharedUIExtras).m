@implementation CATransaction(SafariSharedUIExtras)

+ (uint64_t)safari_performWithActionsDisabled:()SafariSharedUIExtras
{
  void (**v4)(_QWORD);

  v4 = a3;
  objc_msgSend(a1, "begin");
  objc_msgSend(a1, "setDisableActions:", 1);
  v4[2](v4);

  return objc_msgSend(a1, "commit");
}

@end
