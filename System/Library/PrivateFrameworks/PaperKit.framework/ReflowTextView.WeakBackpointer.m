@implementation ReflowTextView.WeakBackpointer

- (void)stepAnimation
{
  uint64_t v2;
  void *v3;

  v2 = MEMORY[0x1DF0E666C](self->reflowView, a2);
  if (v2)
  {
    v3 = (void *)v2;
    swift_retain();
    ReflowTextView.stepAnimation()();

    swift_release();
  }
}

@end
