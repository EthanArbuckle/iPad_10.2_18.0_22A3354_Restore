@implementation TLKSnippetModernizationEnabled

uint64_t __TLKSnippetModernizationEnabled_block_invoke()
{
  uint64_t result;

  if (+[TLKUtilities isSiri](TLKUtilities, "isSiri"))
    result = _os_feature_enabled_impl();
  else
    result = 1;
  TLKSnippetModernizationEnabled_snippetModernizationEnabled = result;
  return result;
}

@end
