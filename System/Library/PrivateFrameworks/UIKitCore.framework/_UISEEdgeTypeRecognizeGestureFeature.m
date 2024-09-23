@implementation _UISEEdgeTypeRecognizeGestureFeature

- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3
{
  int64_t var3;
  BOOL v4;

  if (a3->var0 == 1)
  {
    var3 = a3->var3;
    v4 = var3 == 1 || var3 == 4;
    if (v4 || self->_initialFromEdgeTip)
      -[_UISEGestureFeature _setState:](self, "_setState:", 1);
  }
  else if (!a3->var0)
  {
    self->_initialFromEdgeTip = a3->var3 == 1;
  }
}

@end
