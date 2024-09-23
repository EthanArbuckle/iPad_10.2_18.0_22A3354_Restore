@implementation SPPARSession

+ (id)spotlightPARSession
{
  if (spotlightPARSession_onceToken != -1)
    dispatch_once(&spotlightPARSession_onceToken, &__block_literal_global_5);
  return (id)spotlightPARSession_gSession;
}

void __35__SPPARSession_spotlightPARSession__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE1FA78]), "initWithId:userAgent:factory:", CFSTR("com.apple.spotlight"), CFSTR("spotlight/1.0"), 0);
  objc_msgSend(MEMORY[0x24BE1FA70], "sessionWithConfiguration:", v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)spotlightPARSession_gSession;
  spotlightPARSession_gSession = v0;

}

@end
