@implementation UIStatusBarWifiSignalView

void __115___UIStatusBarWifiSignalView__barImageWithSize_forScale_distance_angle_centerPoint_cornerRadius_thickness_rounded___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_5_12;
  _MergedGlobals_5_12 = v0;

}

double __115___UIStatusBarWifiSignalView__barImageWithSize_forScale_distance_angle_centerPoint_cornerRadius_thickness_rounded___block_invoke_2(uint64_t a1, double a2)
{
  double v2;

  v2 = *(double *)(a1 + 32);
  return v2 - __sincos_stret(*(double *)(a1 + 48)).__cosval * a2;
}

double __115___UIStatusBarWifiSignalView__barImageWithSize_forScale_distance_angle_centerPoint_cornerRadius_thickness_rounded___block_invoke_3(uint64_t a1, double a2)
{
  return *(double *)(a1 + 32) - a2;
}

void __115___UIStatusBarWifiSignalView__barImageWithSize_forScale_distance_angle_centerPoint_cornerRadius_thickness_rounded___block_invoke_4(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v2 = *(double *)(a1 + 48);
  if (*(_BYTE *)(a1 + 96) && v2 == 0.0)
  {
    +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, *(double *)(a1 + 56), *(double *)(a1 + 64) - *(double *)(a1 + 72) * 0.5, *(double *)(a1 + 72) * 0.5, 0.0, 6.28318531);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLineWidth:", *(double *)(a1 + 88));
  }
  else
  {
    v3 = (*(double (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v2);
    v5 = v4;
    +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "moveToPoint:", v3, v5);
    objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, *(double *)(a1 + 56), *(double *)(a1 + 64), v2, *(double *)(a1 + 80) + 3.14159265, 6.28318531 - *(double *)(a1 + 80));
    v6 = *(double *)(a1 + 72);
    if (*(_BYTE *)(a1 + 96))
      v6 = v6 * 0.5;
    v7 = v2 + v6;
    (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    if (*(_BYTE *)(a1 + 96))
    {
      objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0);
      v7 = v7 + *(double *)(a1 + 72) * 0.5;
    }
    else
    {
      objc_msgSend(v8, "addLineToPoint:");
    }
    objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, *(double *)(a1 + 56), *(double *)(a1 + 64), v7, 6.28318531 - *(double *)(a1 + 80), *(double *)(a1 + 80) + 3.14159265);
    if (*(_BYTE *)(a1 + 96))
    {
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v7 - *(double *)(a1 + 72) * 0.5);
      objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0);
    }
    else
    {
      objc_msgSend(v8, "setLineJoinStyle:", 1);
    }
    objc_msgSend(v8, "setLineWidth:", *(double *)(a1 + 88));
  }
  objc_msgSend(v8, "closePath");
  objc_msgSend(v8, "fill");
  objc_msgSend(v8, "stroke");

}

uint64_t __46___UIStatusBarWifiSignalView__updateFromMode___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_updateActiveBars");
  return result;
}

@end
