@implementation WBSReaderResources

+ (id)readerHTMLSourceURL
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "safari_safariSharedBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("ReaderWithSummary"), CFSTR("html"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)+[WBSReaderResources readerHTMLSourceURL]::readerSourcePathURL;
  +[WBSReaderResources readerHTMLSourceURL]::readerSourcePathURL = v3;

  return (id)+[WBSReaderResources readerHTMLSourceURL]::readerSourcePathURL;
}

+ (id)localizedStringsScriptURL
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "safari_safariSharedBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("WBSLocalizedStrings"), CFSTR("js"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (OpaqueJSScript)articleFinderScriptForContext:(OpaqueJSContext *)a3
{
  OpaqueJSScript *result;

    return (OpaqueJSScript *)+[WBSReaderResources articleFinderScriptForContext:]::articleFinderScript;
  JSContextGetGroup(a3);
  result = (OpaqueJSScript *)JSScriptCreateReferencingImmortalASCIIText();
  +[WBSReaderResources articleFinderScriptForContext:]::articleFinderScript = (uint64_t)result;
  return result;
}

+ (OpaqueJSScript)sharedUIScriptForContext:(OpaqueJSContext *)a3
{
  OpaqueJSScript *result;

  JSContextGetGroup(a3);
  result = (OpaqueJSScript *)JSScriptCreateReferencingImmortalASCIIText();
  +[WBSReaderResources sharedUIScriptForContext:]::sharedUIScript = (uint64_t)result;
  return result;
}

+ (OpaqueJSScript)sharedUINormalWorldScriptForContext:(OpaqueJSContext *)a3
{
  OpaqueJSScript *result;

    return (OpaqueJSScript *)+[WBSReaderResources sharedUINormalWorldScriptForContext:]::sharedUINormalWorldScript;
  JSContextGetGroup(a3);
  result = (OpaqueJSScript *)JSScriptCreateReferencingImmortalASCIIText();
  +[WBSReaderResources sharedUINormalWorldScriptForContext:]::sharedUINormalWorldScript = (uint64_t)result;
  return result;
}

@end
