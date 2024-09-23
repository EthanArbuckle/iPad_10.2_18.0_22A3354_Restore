@implementation SMHandleFormatting

+ (id)canonicalIDSAddressForAddress:(id)a3
{
  id v3;
  id v4;
  void (*IMChatCanonicalIDSIDsForAddressSymbolLoc)(id);
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  if (!_MergedGlobals_12)
    _MergedGlobals_12 = _sl_dlopen();
  if (_MergedGlobals_12 && getIMChatCanonicalIDSIDsForAddressSymbolLoc())
  {
    v4 = v3;
    IMChatCanonicalIDSIDsForAddressSymbolLoc = (void (*)(id))getIMChatCanonicalIDSIDsForAddressSymbolLoc();
    if (!IMChatCanonicalIDSIDsForAddressSymbolLoc)
    {
      dlerror();
      abort_report_np();
    }
    IMChatCanonicalIDSIDsForAddressSymbolLoc(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "_stripFZIDPrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && (objc_msgSend(v7, "isEqualToString:", CFSTR("(null)")) & 1) == 0)
      v8 = v7;
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
