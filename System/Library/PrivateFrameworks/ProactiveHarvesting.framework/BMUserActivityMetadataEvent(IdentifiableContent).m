@implementation BMUserActivityMetadataEvent(IdentifiableContent)

- (void)forwardInvocation:()IdentifiableContent
{
  id v4;
  char *v5;
  objc_super v6;

  v4 = a3;
  if (sel_isEqual((SEL)objc_msgSend(v4, "selector"), sel_uniqueId))
  {
    v5 = sel_hv_uniqueId;
  }
  else
  {
    if (!sel_isEqual((SEL)objc_msgSend(v4, "selector"), sel_bundleId))
    {
      v6.receiver = a1;
      v6.super_class = (Class)&off_25511A1E8;
      objc_msgSendSuper2(&v6, sel_forwardInvocation_, v4);
      goto LABEL_7;
    }
    v5 = sel_hv_bundleId;
  }
  objc_msgSend(v4, "setSelector:", v5);
  objc_msgSend(v4, "invoke");
LABEL_7:

}

@end
