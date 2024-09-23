@implementation OBSetupAssistantMultitaskingHeaderView

- (double)iconToHeaderLabelPadding
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  double result;
  objc_super v8;

  +[OBDevice currentDevice](OBDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "templateType");

  if (v4 == 6)
  {
    +[OBDevice currentDevice](OBDevice, "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isMiniPad");

    result = 16.0;
    if (v6)
      return 8.0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)OBSetupAssistantMultitaskingHeaderView;
    -[OBHeaderView iconToHeaderLabelPadding](&v8, sel_iconToHeaderLabelPadding);
  }
  return result;
}

@end
