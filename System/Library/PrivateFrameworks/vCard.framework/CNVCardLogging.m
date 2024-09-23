@implementation CNVCardLogging

+ (OS_os_log)vCard
{
  if (vCard_cn_once_token_1 != -1)
    dispatch_once(&vCard_cn_once_token_1, &__block_literal_global_2);
  return (OS_os_log *)(id)vCard_cn_once_object_1;
}

void __23__CNVCardLogging_vCard__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "vcard");
  v1 = (void *)vCard_cn_once_object_1;
  vCard_cn_once_object_1 = (uint64_t)v0;

}

+ (OS_os_log)meCard
{
  if (meCard_cn_once_token_2 != -1)
    dispatch_once(&meCard_cn_once_token_2, &__block_literal_global_3);
  return (OS_os_log *)(id)meCard_cn_once_object_2;
}

void __24__CNVCardLogging_meCard__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "mecard");
  v1 = (void *)meCard_cn_once_object_2;
  meCard_cn_once_object_2 = (uint64_t)v0;

}

@end
