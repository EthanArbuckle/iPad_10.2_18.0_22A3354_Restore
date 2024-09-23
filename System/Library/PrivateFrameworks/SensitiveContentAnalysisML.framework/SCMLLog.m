@implementation SCMLLog

+ (id)handler
{
  if (handler_onceToken != -1)
    dispatch_once(&handler_onceToken, &__block_literal_global_0);
  return (id)handler__framework;
}

void __18__SCMLLog_handler__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SensitiveContentAnalysisML", "handler");
  v1 = (void *)handler__framework;
  handler__framework = (uint64_t)v0;

}

+ (id)imageAnalyzer
{
  if (imageAnalyzer_onceToken != -1)
    dispatch_once(&imageAnalyzer_onceToken, &__block_literal_global_2);
  return (id)imageAnalyzer__framework;
}

void __24__SCMLLog_imageAnalyzer__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SensitiveContentAnalysisML", "imageAnalyzer");
  v1 = (void *)imageAnalyzer__framework;
  imageAnalyzer__framework = (uint64_t)v0;

}

+ (id)textAnalyzer
{
  if (textAnalyzer_onceToken != -1)
    dispatch_once(&textAnalyzer_onceToken, &__block_literal_global_4);
  return (id)textAnalyzer__framework;
}

void __23__SCMLLog_textAnalyzer__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SensitiveContentAnalysisML", "textAnalyzer");
  v1 = (void *)textAnalyzer__framework;
  textAnalyzer__framework = (uint64_t)v0;

}

+ (id)videoAnalyzer
{
  if (videoAnalyzer_onceToken != -1)
    dispatch_once(&videoAnalyzer_onceToken, &__block_literal_global_6);
  return (id)videoAnalyzer__framework;
}

void __24__SCMLLog_videoAnalyzer__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SensitiveContentAnalysisML", "videoAnalyzer");
  v1 = (void *)videoAnalyzer__framework;
  videoAnalyzer__framework = (uint64_t)v0;

}

+ (id)signpost
{
  if (signpost_onceToken != -1)
    dispatch_once(&signpost_onceToken, &__block_literal_global_8);
  return (id)signpost__framework;
}

void __19__SCMLLog_signpost__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SensitiveContentAnalysisML", "signpost");
  v1 = (void *)signpost__framework;
  signpost__framework = (uint64_t)v0;

}

@end
