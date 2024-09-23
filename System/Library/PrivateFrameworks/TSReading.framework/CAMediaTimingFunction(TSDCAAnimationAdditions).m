@implementation CAMediaTimingFunction(TSDCAAnimationAdditions)

- (void)TSD_valueAtPercent:()TSDCAAnimationAdditions
{
  void *v5;
  uint64_t v6;
  uint64_t v8;
  void *v9;
  float v10[2];
  float v11[2];
  float v12[2];
  float v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a2 < 0.0 || a2 > 1.0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CAMediaTimingFunction(TSDCAAnimationAdditions) TSD_valueAtPercent:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CAAnimationAdditions.m"), 56, CFSTR("percent(%0.3f) is outside [0,1]!"), *(_QWORD *)&a2);
  }
  if (a2 != 0.0 && a2 != 1.0)
  {
    if (TSD_valueAtPercent__onceToken != -1)
      dispatch_once(&TSD_valueAtPercent__onceToken, &__block_literal_global_52);
    v8 = 0;
    while (!objc_msgSend(a1, "isEqual:", TSD_valueAtPercent__s_CAMediaTimingFunctionsCacheArray[v8]))
    {
      if (++v8 == 5)
      {
        objc_msgSend(a1, "getControlPointAtIndex:values:", 0, v13);
        objc_msgSend(a1, "getControlPointAtIndex:values:", 1, v12);
        objc_msgSend(a1, "getControlPointAtIndex:values:", 2, v11);
        objc_msgSend(a1, "getControlPointAtIndex:values:", 3, v10);
        v9 = (void *)objc_opt_new();
        objc_msgSend(v9, "moveToPoint:", v13[0], v13[1]);
        objc_msgSend(v9, "curveToPoint:controlPoint1:controlPoint2:", v10[0], v10[1], v12[0], v12[1], v11[0], v11[1]);
        objc_msgSend(v9, "yValueFromXValue:", a2);

        return;
      }
    }
    objc_msgSend((id)TSD_valueAtPercent__s_TSDBezierPathsCacheArray[v8], "yValueFromXValue:", a2);
  }
}

@end
