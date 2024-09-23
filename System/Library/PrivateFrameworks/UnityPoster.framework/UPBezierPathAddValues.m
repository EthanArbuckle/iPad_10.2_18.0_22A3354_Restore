@implementation UPBezierPathAddValues

void __UPBezierPathAddValues_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  float v5;
  float v6;
  float v7;
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
  double v18;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKey:", v4);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  objc_msgSend(v30, "floatValue");
  v8 = v7;
  v9 = *(double *)(a1 + 72);
  v10 = *(double *)(a1 + 80);
  v11 = *(double *)(a1 + 88);
  v12 = *(double *)(a1 + 96);
  v29 = v6;
  v13 = UPTangentialPointFromLine(v9, v10, v11, v12, v6, v7);
  v15 = v14;
  v16 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v28 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 40), "currentPoint");
  if (v18 != v13 || v17 != v15)
  {
    v20 = (v16 + v29) * 0.5;
    v21 = UPTangentialPointFromLine(v9, v10, v11, v12, v20, v8);
    v26 = v22;
    v27 = v21;
    v23 = UPTangentialPointFromLine(v9, v10, v11, v12, v20, v28);
    objc_msgSend(*(id *)(a1 + 40), "addCurveToPoint:controlPoint1:controlPoint2:", v13, v15, v23, v24, v27, v26);
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v29;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v8;
  v25 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  *(double *)(v25 + 32) = v13;
  *(double *)(v25 + 40) = v15;

}

@end
