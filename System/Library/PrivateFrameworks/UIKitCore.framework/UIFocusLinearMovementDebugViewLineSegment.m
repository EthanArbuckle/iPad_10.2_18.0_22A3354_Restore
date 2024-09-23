@implementation UIFocusLinearMovementDebugViewLineSegment

void __61___UIFocusLinearMovementDebugViewLineSegment__calculatePaths__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGAffineTransform v19;

  v7 = a2;
  objc_msgSend(v7, "point");
  v9 = v8;
  v11 = v10;
  if (objc_msgSend(v7, "type"))
  {
    if (objc_msgSend(v7, "type") == 1)
    {
      if (*(_QWORD *)(a1 + 48) - 2 == a3 || hypot(*(double *)(a1 + 56) - v9, *(double *)(a1 + 64) - v11) <= 10.0)
      {
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        *(double *)(v12 + 32) = v9;
        *(double *)(v12 + 40) = v11;
        v13 = *(double *)(a1 + 56);
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v15 = *(double *)(v14 + 32);
        v16 = v13 - v15;
        v17 = *(double *)(a1 + 64);
        if (v13 >= v15)
          v18 = atan((v17 - *(double *)(v14 + 40)) / v16);
        else
          v18 = atan((v17 - *(double *)(v14 + 40)) / v16) + 3.14159265;
        CGAffineTransformMakeRotation(&v19, v18);
        objc_msgSend(*(id *)(a1 + 32), "addLineToPoint:", v13 - (v19.tx + v19.c * 0.0 + v19.a * 10.5), v17 - (v19.ty + v19.d * 0.0 + v19.b * 10.5));
        *a4 = 1;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "addLineToPoint:", v9, v11);
      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "moveToPoint:", v9, v11);
  }

}

void __68___UIFocusLinearMovementDebugViewLineSegment__pathElementsFromPath___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[_UIFocusLinearMovementDebugViewLineElement elementWithCGPathElement:](_UIFocusLinearMovementDebugViewLineElement, "elementWithCGPathElement:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __81___UIFocusLinearMovementDebugViewLineSegment__flattenedBezierPathFromBezierPath___block_invoke(uint64_t *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v21 = a2;
  switch(objc_msgSend(v21, "type"))
  {
    case 0u:
      v4 = (void *)a1[4];
      objc_msgSend(v21, "point");
      objc_msgSend(v4, "moveToPoint:");
      break;
    case 1u:
    case 2u:
      v3 = (void *)a1[4];
      objc_msgSend(v21, "point");
      objc_msgSend(v3, "addLineToPoint:");
      break;
    case 3u:
      v6 = a1[4];
      v5 = (void *)a1[5];
      v7 = *(_QWORD *)(a1[6] + 8);
      objc_msgSend(v21, "cp1");
      v9 = v8;
      v11 = v10;
      objc_msgSend(v21, "cp2");
      v13 = v12;
      v15 = v14;
      objc_msgSend(v21, "point");
      objc_msgSend(v5, "_subdivideBezier:startPoint:controlPoint1:controlPoint2:endPoint:", v6, *(double *)(v7 + 32), *(double *)(v7 + 40), v9, v11, v13, v15, v16, v17);
      break;
    case 4u:
      objc_msgSend((id)a1[4], "closePath");
      break;
    default:
      break;
  }
  objc_msgSend(v21, "point");
  v18 = *(_QWORD *)(a1[6] + 8);
  *(_QWORD *)(v18 + 32) = v19;
  *(_QWORD *)(v18 + 40) = v20;

}

@end
