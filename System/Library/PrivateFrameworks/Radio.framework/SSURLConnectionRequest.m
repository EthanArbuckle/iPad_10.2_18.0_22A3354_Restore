@implementation SSURLConnectionRequest

void __103__SSURLConnectionRequest_RadioAdditions__newRadioRequestWithRequestContext_requestProperties_storeBag___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)newRadioRequestWithRequestContext_requestProperties_storeBag__sDateFormatter;
  newRadioRequestWithRequestContext_requestProperties_storeBag__sDateFormatter = (uint64_t)v0;

  objc_msgSend((id)newRadioRequestWithRequestContext_requestProperties_storeBag__sDateFormatter, "setDateFormat:", CFSTR("yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"));
  objc_msgSend((id)newRadioRequestWithRequestContext_requestProperties_storeBag__sDateFormatter, "setLocale:", v4);
  v2 = (void *)newRadioRequestWithRequestContext_requestProperties_storeBag__sDateFormatter;
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

}

@end
