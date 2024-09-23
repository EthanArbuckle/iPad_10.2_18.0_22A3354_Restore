@implementation CAMediaTimingFunction(TSDAdditions)

- (id)bezierPath
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v2 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
  v12[0] = 0;
  objc_msgSend(a1, "getControlPointAtIndex:values:", 0, v12);
  v3 = *(float *)v12;
  v4 = *((float *)v12 + 1);
  objc_msgSend(a1, "getControlPointAtIndex:values:", 1, v12);
  v5 = *(float *)v12;
  v6 = *((float *)v12 + 1);
  objc_msgSend(a1, "getControlPointAtIndex:values:", 2, v12);
  v7 = *(float *)v12;
  v8 = *((float *)v12 + 1);
  objc_msgSend(a1, "getControlPointAtIndex:values:", 3, v12);
  v9 = *(float *)v12;
  v10 = *((float *)v12 + 1);
  objc_msgSend(v2, "moveToPoint:", v3, v4);
  objc_msgSend(v2, "curveToPoint:controlPoint1:controlPoint2:", v9, v10, v5, v6, v7, v8);
  return v2;
}

- (uint64_t)solveForTime:()TSDAdditions
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "bezierPath");
  TSUClamp();
  return objc_msgSend(v1, "yValueFromXValue:");
}

@end
