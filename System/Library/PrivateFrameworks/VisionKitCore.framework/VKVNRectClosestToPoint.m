@implementation VKVNRectClosestToPoint

uint64_t __VKVNRectClosestToPoint_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;

  v5 = a3;
  objc_msgSend(a2, "boundingBox");
  v10 = VKMCenterOfRect(v6, v7, v8, v9);
  v12 = v11;
  objc_msgSend(v5, "boundingBox");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = VKMCenterOfRect(v14, v16, v18, v20);
  v23 = v22;
  v24 = *(double *)(a1 + 32);
  v25 = *(double *)(a1 + 40);
  v26 = VKMDistanceSquared(v10, v12, v24, v25);
  v27 = VKMDistanceSquared(v21, v23, v24, v25);
  if (v26 >= v27)
    return v27 < v26;
  else
    return -1;
}

@end
