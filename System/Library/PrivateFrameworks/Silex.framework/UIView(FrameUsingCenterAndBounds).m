@implementation UIView(FrameUsingCenterAndBounds)

- (double)frameUsingCenterAndBounds
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  objc_msgSend(a1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anchorPoint");
  v4 = v3;
  v6 = v5;

  objc_msgSend(a1, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAnchorPointWithoutChangingPosition:", 0.5, 0.5);

  objc_msgSend(a1, "bounds");
  objc_msgSend(a1, "center");
  v9 = v8;
  objc_msgSend(a1, "bounds");
  v11 = v9 - v10 * 0.5;
  objc_msgSend(a1, "center");
  objc_msgSend(a1, "bounds");
  objc_msgSend(a1, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAnchorPointWithoutChangingPosition:", v4, v6);

  return v11;
}

- (void)setFrameUsingCenterAndBounds:()FrameUsingCenterAndBounds
{
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  _OWORD v27[8];
  _OWORD v28[8];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(a1, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "transform");
  }
  else
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
  }

  objc_msgSend(a1, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "anchorPoint");
  v14 = v13;
  v16 = v15;

  objc_msgSend(a1, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  v28[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v28[5] = v18;
  v19 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v28[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v28[7] = v19;
  v20 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v28[0] = *MEMORY[0x24BDE5598];
  v28[1] = v20;
  v21 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v28[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v28[3] = v21;
  objc_msgSend(v17, "setTransform:", v28);

  objc_msgSend(a1, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAnchorPointWithoutChangingPosition:", 0.5, 0.5);

  objc_msgSend(a1, "bounds");
  v24 = v23;
  objc_msgSend(a1, "bounds");
  objc_msgSend(a1, "setBounds:", v24);
  objc_msgSend(a1, "setCenter:", a2 + a4 * 0.5, a3 + a5 * 0.5);
  objc_msgSend(a1, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAnchorPointWithoutChangingPosition:", v14, v16);

  objc_msgSend(a1, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v33;
  v27[5] = v34;
  v27[6] = v35;
  v27[7] = v36;
  v27[0] = v29;
  v27[1] = v30;
  v27[2] = v31;
  v27[3] = v32;
  objc_msgSend(v26, "setTransform:", v27);

}

@end
