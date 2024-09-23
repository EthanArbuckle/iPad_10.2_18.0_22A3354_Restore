@implementation UICollectionView(Utilities)

- (void)stk_performRippleAnimationAtIndexPath:()Utilities delay:
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  double v12;

  v6 = a4;
  objc_msgSend(a1, "visibleCells");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cellForItemAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __75__UICollectionView_Utilities__stk_performRippleAnimationAtIndexPath_delay___block_invoke;
  v10[3] = &unk_251918A60;
  v10[4] = a1;
  v11 = v7;
  v12 = a2;
  v8 = v7;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

}

- (id)animationForCell:()Utilities sourceCell:triggerDelay:
{
  id v7;
  id v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  long double v31;
  double v32;
  long double v33;
  double v34;
  double v35;
  __double2 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  double v61;
  _OWORD v62[8];
  CATransform3D v63;
  _OWORD v64[2];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v73;
  CATransform3D v74;
  CATransform3D v75;
  _QWORD v76[3];

  v76[2] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  if (v7 == v8)
  {
    objc_msgSend(MEMORY[0x24BDE5638], "animation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "bounds");
    objc_msgSend(v7, "convertRect:toView:", 0);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(v8, "bounds");
    objc_msgSend(v8, "convertRect:toView:", 0);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v61 = a1;
    v24 = v23;
    v25 = STKCenterOfRect(v10, v12, v14, v16);
    v27 = v26;
    v28 = STKCenterOfRect(v18, v20, v22, v24);
    v30 = v29;
    v31 = STKDistance(v28, v29, v25, v27);
    v32 = STKSubtractPoints(v28, v30, v25);
    v34 = STKNiceAngleFromDelta(v32, v33);
    v35 = STKExponentialDecay(0.2, 0.004, v31);
    v36 = __sincos_stret(v34);
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&v75, 0, sizeof(v75));
    CATransform3DMakeScale(&v75, v35 * 0.5 + 1.0, v35 * 0.5 + 1.0, 1.0);
    memset(&v74, 0, sizeof(v74));
    CATransform3DMakeTranslation(&v74, v36.__cosval * (v35 * -100.0), v36.__sinval * (v35 * -100.0), 0.0);
    a = v75;
    b = v74;
    CATransform3DConcat(&v73, &a, &b);
    v75 = v73;
    v60 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    v69 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    v59 = v69;
    v70 = v60;
    v56 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    v67 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    v55 = v67;
    v68 = v56;
    v58 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    v65 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    v57 = v65;
    v66 = v58;
    v54 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    v64[0] = *MEMORY[0x24BDE5598];
    v53 = v64[0];
    v64[1] = v54;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v64, "{CATransform3D=dddddddddddddddd}");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setFromValue:", v38);

    v63 = v75;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v63, "{CATransform3D=dddddddddddddddd}");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setToValue:", v39);

    objc_msgSend(v37, "setBeginTime:", (double)(v31 * 0.000833333333));
    objc_msgSend(v37, "setDuration:", 0.2);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setTimingFunction:", v40);

    objc_msgSend(MEMORY[0x24BDE5760], "animationWithKeyPath:", CFSTR("transform"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setFillMode:", *MEMORY[0x24BDE5978]);
    v62[4] = v55;
    v62[5] = v56;
    v62[6] = v59;
    v62[7] = v60;
    v62[0] = v53;
    v62[1] = v54;
    v62[2] = v57;
    v62[3] = v58;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v62, "{CATransform3D=dddddddddddddddd}");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setToValue:", v42);

    objc_msgSend(v37, "toValue");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setFromValue:", v43);

    objc_msgSend(v41, "setMass:", 1.0);
    objc_msgSend(v41, "setDamping:", 24.87471);
    objc_msgSend(v41, "setStiffness:", 275.004);
    objc_msgSend(v37, "beginTime");
    v45 = v44;
    objc_msgSend(v37, "duration");
    objc_msgSend(v41, "setBeginTime:", v45 + v46);
    objc_msgSend(v41, "settlingDuration");
    objc_msgSend(v41, "setDuration:");
    objc_msgSend(MEMORY[0x24BDE5638], "animation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = v37;
    v76[1] = v41;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v76, 2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setAnimations:", v48);

    objc_msgSend(v41, "duration");
    v50 = v49;
    objc_msgSend(v41, "beginTime");
    objc_msgSend(v47, "setDuration:", v50 + v51);
    objc_msgSend(v47, "setBeginTime:", CACurrentMediaTime() + v61);

  }
  return v47;
}

@end
