@implementation UICollectionView

void __75__UICollectionView_Utilities__stk_performRippleAnimationAtIndexPath_delay___block_invoke(double *a1, void *a2)
{
  void *v2;
  uint64_t v3;
  double v4;
  id v5;
  void *v6;
  id v7;

  v2 = (void *)*((_QWORD *)a1 + 4);
  v3 = *((_QWORD *)a1 + 5);
  v4 = a1[6];
  v5 = a2;
  objc_msgSend(v2, "animationForCell:sourceCell:triggerDelay:", v5, v3, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAnimation:forKey:", v7, CFSTR("ripple"));
}

@end
