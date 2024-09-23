@implementation TFTypographySettingsContentViewControllerClass

Class __get_TFTypographySettingsContentViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!qword_1ECD7A830)
    qword_1ECD7A830 = _sl_dlopen();
  result = objc_getClass("_TFTypographySettingsContentViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_1ECD7A838 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
