@implementation _UICollectionViewLegacyReorderingGestureRecognizer

- (_UICollectionViewLegacyReorderingGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UICollectionViewLegacyReorderingGestureRecognizer *v4;
  _UICollectionViewLegacyReorderingGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UICollectionViewLegacyReorderingGestureRecognizer;
  v4 = -[UILongPressGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UIGestureRecognizer setName:](v4, "setName:", CFSTR("cv.legacy.reordering"));
    -[UIGestureRecognizer _setKeepTouchesOnContinuation:](v5, "_setKeepTouchesOnContinuation:", 1);
    -[UILongPressGestureRecognizer set_prefersNotToBePreventedByCompetingLongPressGestureRecognizers:](v5, "set_prefersNotToBePreventedByCompetingLongPressGestureRecognizers:", 1);
  }
  return v5;
}

@end
