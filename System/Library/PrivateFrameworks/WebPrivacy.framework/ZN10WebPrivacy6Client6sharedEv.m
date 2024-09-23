@implementation ZN10WebPrivacy6Client6sharedEv

WebPrivacy::Client *___ZN10WebPrivacy6Client6sharedEv_block_invoke()
{
  WebPrivacy::Client *v0;
  WebPrivacy::Client *result;

  v0 = (WebPrivacy::Client *)operator new();
  result = WebPrivacy::Client::Client(v0);
  WebPrivacy::Client::shared(void)::sharedInstance = (uint64_t)v0;
  return result;
}

@end
