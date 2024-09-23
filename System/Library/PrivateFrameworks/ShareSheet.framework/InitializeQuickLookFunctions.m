@implementation InitializeQuickLookFunctions

void *__InitializeQuickLookFunctions_block_invoke()
{
  void *v0;
  void *result;

  if (QuickLookLibrary_sOnce_2 != -1)
    dispatch_once(&QuickLookLibrary_sOnce_2, &__block_literal_global_26);
  v0 = (void *)QuickLookLibrary_sLib_2;
  QLPreviewControllerSupportsContentTypeFx = dlsym((void *)QuickLookLibrary_sLib_2, "QLPreviewControllerSupportsContentType");
  QLPreviewNeedsHelpUnzippingURLFx = dlsym(v0, "QLPreviewNeedsHelpUnzippingURL");
  result = dlsym(v0, "QLTypeCopyUTIForURLAndMimeType");
  QLTypeCopyUTIForURLAndMimeTypeFx = (uint64_t (*)(_QWORD, _QWORD))result;
  return result;
}

@end
