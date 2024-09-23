@implementation UIQOSAdjustableDeadlineOffset

void ___UIQOSAdjustableDeadlineOffset_block_invoke()
{
  void *v0;
  void *v1;
  double v2;
  double v3;
  unint64_t v4;
  uint64_t v5;
  id v6;

  _UIKitPreferencesOnce();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("QOSAdjustableDeadlineOffset"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "doubleValue");
    v3 = v2;
    v4 = _UIMachDurationForMediaDuration(fabs(v2));
    if (v3 > 0.0)
      v5 = v4;
    else
      v5 = -(uint64_t)v4;
    qword_1ECD82120 = v5;
  }

}

@end
