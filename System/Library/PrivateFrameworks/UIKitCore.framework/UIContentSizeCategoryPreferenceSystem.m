@implementation UIContentSizeCategoryPreferenceSystem

void __97___UIContentSizeCategoryPreferenceSystem__updateContentSizeCategory_carPlay_postingNotification___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "_userInterfaceIdiom") == 3)
    objc_msgSend(v2, "_updateTraits");

}

void __97___UIContentSizeCategoryPreferenceSystem__updateContentSizeCategory_carPlay_postingNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "_userInterfaceIdiom") != 3)
    objc_msgSend(v2, "_updateTraits");

}

@end
