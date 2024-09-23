@implementation WFOnScreenContentService

- (void)getOnScreenContentWithOptions:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[VCVoiceShortcutClient standardClient](VCVoiceShortcutClient, "standardClient");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getOnScreenContentWithOptions:completion:", v6, v5);

}

- (void)getOnScreenContentWithOptions:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[VCVoiceShortcutClient standardClient](VCVoiceShortcutClient, "standardClient");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getOnScreenContentWithOptions:completionHandler:", v6, v5);

}

+ (id)sharedService
{
  if (sharedService_onceToken != -1)
    dispatch_once(&sharedService_onceToken, &__block_literal_global_16454);
  return (id)sharedService_service;
}

void __41__WFOnScreenContentService_sharedService__block_invoke()
{
  WFOnScreenContentService *v0;
  void *v1;

  v0 = objc_alloc_init(WFOnScreenContentService);
  v1 = (void *)sharedService_service;
  sharedService_service = (uint64_t)v0;

}

@end
