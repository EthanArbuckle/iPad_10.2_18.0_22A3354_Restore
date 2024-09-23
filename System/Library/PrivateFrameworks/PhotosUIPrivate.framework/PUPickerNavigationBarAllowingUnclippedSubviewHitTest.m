@implementation PUPickerNavigationBarAllowingUnclippedSubviewHitTest

id __98___PUPickerNavigationBarAllowingUnclippedSubviewHitTest__unclippedViewPassingHitTest_point_event___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  void *v7;

  v4 = a2;
  v5 = a3;
  if ((objc_msgSend(v4, "isHidden") & 1) == 0)
  {
    objc_msgSend(v4, "alpha");
    if (v6 > 0.01)
    {
      if (objc_msgSend(v4, "isUserInteractionEnabled"))
      {
        objc_msgSend(v4, "subviews");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v7);

      }
    }
  }

  return v5;
}

@end
