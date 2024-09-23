@implementation WFLinkAction(ChronoServices)

- (void)setWidgetFamily:()ChronoServices
{
  uint64_t *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&off_255905570;
  objc_msgSendSuper2(&v5, sel_setWidgetFamily_);
  switch(objc_msgSend(a1, "widgetFamily"))
  {
    case 1:
      v2 = (uint64_t *)MEMORY[0x24BE5F908];
      goto LABEL_8;
    case 2:
    case 5:
    case 13:
      v2 = (uint64_t *)MEMORY[0x24BE5F900];
      goto LABEL_8;
    case 3:
    case 4:
    case 6:
      v2 = (uint64_t *)MEMORY[0x24BE5F8F8];
      goto LABEL_8;
    case 10:
      v2 = (uint64_t *)MEMORY[0x24BE5F8E0];
      goto LABEL_8;
    case 11:
      v2 = (uint64_t *)MEMORY[0x24BE5F8F0];
      goto LABEL_8;
    case 12:
      v2 = (uint64_t *)MEMORY[0x24BE5F8E8];
LABEL_8:
      v3 = *v2;
      objc_msgSend(a1, "actionConfigurationContext");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setWidgetFamily:", v3);

      break;
    default:
      return;
  }
}

@end
