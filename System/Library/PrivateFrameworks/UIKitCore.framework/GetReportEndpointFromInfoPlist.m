@implementation GetReportEndpointFromInfoPlist

void __GetReportEndpointFromInfoPlist_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  uint8_t v8[16];

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForInfoDictionaryKey:", CFSTR("NSAdvertisingAttributionReportEndpoint"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:encodingInvalidCharacters:", v3, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_MergedGlobals_1171;
  _MergedGlobals_1171 = v4;

  if (!_MergedGlobals_1171)
  {
    v6 = qword_1ECD7F538;
    if (!qword_1ECD7F538)
    {
      v6 = __UILogCategoryGetNode("EventAttribution", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&qword_1ECD7F538);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Application created an instance of UIEventAttribution but could not find a report endpoint URL. Event attributions from this app will not be sent to the browser. Ensure you have defined an appropriate URL in your app's Info.plist under the NSAdvertisingAttributionReportEndpoint key.", v8, 2u);
    }
  }

}

@end
