@implementation UIKeyboardGetSupportedSoftwareKeyboardsForInputModeAndIdiom

uint64_t __UIKeyboardGetSupportedSoftwareKeyboardsForInputModeAndIdiom_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("Korean10Key")))
  {
    v3 = MGGetSInt32Answer() == 1;
  }
  else if (objc_msgSend(&unk_1E1A93800, "containsObject:", v2))
  {
    v3 = _os_feature_enabled_impl();
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

@end
