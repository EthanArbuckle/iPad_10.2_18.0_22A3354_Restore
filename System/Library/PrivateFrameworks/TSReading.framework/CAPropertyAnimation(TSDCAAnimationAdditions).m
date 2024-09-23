@implementation CAPropertyAnimation(TSDCAAnimationAdditions)

- (uint64_t)p_adjustedResultWithValue:()TSDCAAnimationAdditions
{
  double v5;
  double v6;
  uint64_t v8;

  if (!a3)
    return (uint64_t)a3;
  if ((objc_msgSend((id)objc_msgSend(a1, "keyPath"), "isEqualToString:", CFSTR("transform.rotation")) & 1) == 0
    && (objc_msgSend((id)objc_msgSend(a1, "keyPath"), "isEqualToString:", CFSTR("transform.rotation.x")) & 1) == 0
    && (objc_msgSend((id)objc_msgSend(a1, "keyPath"), "isEqualToString:", CFSTR("transform.rotation.y")) & 1) == 0
    && !objc_msgSend((id)objc_msgSend(a1, "keyPath"), "isEqualToString:", CFSTR("transform.rotation.z")))
  {
    if ((objc_msgSend((id)objc_msgSend(a1, "keyPath"), "isEqualToString:", CFSTR("hidden")) & 1) != 0
      || objc_msgSend((id)objc_msgSend(a1, "keyPath"), "isEqualToString:", CFSTR("doubleSided")))
    {
      v8 = objc_msgSend(a3, "charValue");
      return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithChar:", v8);
    }
    return (uint64_t)a3;
  }
  objc_msgSend(a3, "doubleValue");
  v6 = fmod(v5 + 3.14159265, 6.28318531) + -3.14159265;
  if (v6 < -3.14159265)
    v6 = v6 + 6.28318531;
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6);
}

- (uint64_t)p_interpolatedValueFrom:()TSDCAAnimationAdditions to:percent:
{
  CFTypeID v8;
  void *v9;

  v8 = CFGetTypeID(cf);
  if (v8 != CGColorGetTypeID())
    return objc_msgSend(cf, "mixedObjectWithFraction:ofObject:", a5, a4);
  v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithCGColor:", cf);
  return objc_msgSend((id)objc_msgSend(v9, "blendedColorWithFraction:ofColor:", objc_msgSend(MEMORY[0x24BEB3C40], "colorWithCGColor:", a5), a4), "CGColor");
}

- (double)TSD_animationPercentFromAnimationTime:()TSDCAAnimationAdditions
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(a1, "beginTime");
  v5 = a2 - v4;
  objc_msgSend(a1, "timeOffset");
  v7 = v5 - v6;
  objc_msgSend(a1, "duration");
  return v7 / v8;
}

- (uint64_t)TSD_containsAnimationForKeyPath:()TSDCAAnimationAdditions
{
  return objc_msgSend((id)objc_msgSend(a1, "keyPath"), "isEqualToString:", a3);
}

- (void)TSD_animationForKeyPath:()TSDCAAnimationAdditions atTime:
{
  if (objc_msgSend((id)objc_msgSend(a1, "keyPath"), "isEqualToString:", a3))
    return a1;
  else
    return 0;
}

@end
