@implementation CALayer(FrameUsingCenterAndBounds)

- (double)frameUsingCenterAndBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  objc_msgSend(a1, "anchorPoint");
  v3 = v2;
  v5 = v4;
  objc_msgSend(a1, "setAnchorPointWithoutChangingPosition:", 0.5, 0.5);
  objc_msgSend(a1, "bounds");
  objc_msgSend(a1, "position");
  v7 = v6;
  objc_msgSend(a1, "bounds");
  v9 = v7 - v8 * 0.5;
  objc_msgSend(a1, "position");
  objc_msgSend(a1, "bounds");
  objc_msgSend(a1, "setAnchorPointWithoutChangingPosition:", v3, v5);
  return v9;
}

- (uint64_t)setFrameUsingCenterAndBounds:()FrameUsingCenterAndBounds
{
  double v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  double v18;
  double v19;
  _OWORD v21[8];
  _OWORD v22[8];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(a1, "transform");
  objc_msgSend(a1, "anchorPoint");
  v11 = v10;
  v13 = v12;
  v14 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  v22[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v22[5] = v14;
  v15 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v22[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v22[7] = v15;
  v16 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v22[0] = *MEMORY[0x24BDE5598];
  v22[1] = v16;
  v17 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v22[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v22[3] = v17;
  objc_msgSend(a1, "setTransform:", v22);
  objc_msgSend(a1, "setAnchorPointWithoutChangingPosition:", 0.5, 0.5);
  objc_msgSend(a1, "bounds");
  v19 = v18;
  objc_msgSend(a1, "bounds");
  objc_msgSend(a1, "setBounds:", v19);
  objc_msgSend(a1, "setPosition:", a2 + a4 * 0.5, a3 + a5 * 0.5);
  objc_msgSend(a1, "setAnchorPointWithoutChangingPosition:", v11, v13);
  v21[4] = v27;
  v21[5] = v28;
  v21[6] = v29;
  v21[7] = v30;
  v21[0] = v23;
  v21[1] = v24;
  v21[2] = v25;
  v21[3] = v26;
  return objc_msgSend(a1, "setTransform:", v21);
}

@end
