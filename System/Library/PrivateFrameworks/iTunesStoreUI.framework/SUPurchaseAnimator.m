@implementation SUPurchaseAnimator

+ (void)performHopAnimationForView:(id)a3 relativeToView:(id)a4 finalAlpha:(float)a5 scale:(float)a6
{
  id v11;
  double v12;
  double v13;

  v11 = +[SUClientDispatch tabBarController](SUClientDispatch, "tabBarController");
  *(float *)&v12 = a5;
  *(float *)&v13 = a6;
  objc_msgSend(a1, "performHopAnimationForView:relativeToView:tabBarController:finalAlpha:scale:", a3, a4, v11, v12, v13);
}

+ (void)performHopAnimationForView:(id)a3 relativeToView:(id)a4 tabBarController:(id)a5 finalAlpha:(float)a6 scale:(float)a7
{
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  unint64_t v29;
  float v30;
  float v31;
  double v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  CGPath *Mutable;
  unint64_t v39;
  unint64_t v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  CGFloat v46;
  float v47;
  void *v48;
  double v49;
  uint64_t v50;
  double v51;
  SUPurchaseAnimationDelegate *v52;
  double v53;
  double v54;
  double v55;
  float v56;
  double v57;
  CGAffineTransform v58;
  CGAffineTransform v59;
  CGAffineTransform v60;

  v13 = objc_msgSend(a5, "view");
  if (a3)
  {
    v14 = (void *)v13;
    if (v13)
    {
      v56 = a6;
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "beginIgnoringInteractionEvents");
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUPurchaseAnimationWillBeginNotification"), a1);
      objc_msgSend(v14, "bounds");
      v54 = v16;
      v55 = v15;
      objc_msgSend(a3, "frame");
      objc_msgSend(v14, "convertRect:fromView:", a4);
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;
      objc_msgSend(a3, "setFrame:");
      objc_msgSend(v14, "addSubview:", a3);
      v25 = (void *)objc_msgSend(a5, "tabBar");
      objc_msgSend(v25, "bounds");
      v27 = v26;
      v57 = v28;
      v29 = objc_msgSend((id)objc_msgSend(v25, "items"), "count");
      v53 = v27;
      v30 = v27 / (double)v29;
      v31 = a7;
      v32 = floorf(v30);
      v33 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom");
      if (v33 == 1)
        v34 = 30.0;
      else
        v34 = 0.0;
      if (v33 == 1)
        v35 = 80.0;
      else
        v35 = v32;
      if (v31 < 0.0)
      {
        v36 = v22 / v35;
        if (v22 / v35 >= v24 / v57)
          v36 = v24 / v57;
        v31 = v36;
      }
      v37 = (void *)objc_msgSend(MEMORY[0x24BDE56C0], "animation");
      Mutable = CGPathCreateMutable();
      CGPathMoveToPoint(Mutable, 0, v18 + ceil(v22 * 0.5), v20 + ceil(v24 * 0.5));
      objc_opt_class();
      v39 = 0x7FFFFFFFFFFFFFFFLL;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v39 = objc_msgSend(a5, "indexOfViewControllerWithSectionType:", 2);
        if (v39 == 0x7FFFFFFFFFFFFFFFLL)
          v39 = objc_msgSend(a5, "indexOfViewControllerWithSectionType:", 6);
      }
      if (v29 - 1 >= v39)
        v40 = v39;
      else
        v40 = v29 - 1;
      v41 = v22 * v31;
      v42 = floorf(v41);
      v43 = (v53 - (double)v29 * v35 - (double)(v29 - 1) * v34) * 0.5;
      v44 = (v34 + v35) * (double)v40;
      v45 = v42 * 0.5 + (v35 - v42) * 0.5;
      v46 = floorf(v43) + floorf(v44) + floorf(v45);
      v47 = v55 + v54 - v57 * 0.5;
      CGPathAddQuadCurveToPoint(Mutable, 0, v46, 0.0, v46, floorf(v47));
      objc_msgSend(v37, "setKeyPath:", CFSTR("position"));
      v48 = (void *)MEMORY[0x24BDBCE30];
      LODWORD(v49) = 0;
      v50 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v49);
      LODWORD(v51) = 1.0;
      objc_msgSend(v37, "setKeyTimes:", objc_msgSend(v48, "arrayWithObjects:", v50, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v51), 0));
      objc_msgSend(v37, "setPath:", Mutable);
      objc_msgSend(v37, "setDuration:", 0.5);
      objc_msgSend(v37, "setCalculationMode:", *MEMORY[0x24BDE5848]);
      objc_msgSend(v37, "setFillMode:", CFSTR("frozen"));
      objc_msgSend(v37, "setRemovedOnCompletion:", 0);
      v52 = -[SUPurchaseAnimationDelegate initWithView:]([SUPurchaseAnimationDelegate alloc], "initWithView:", a3);
      objc_msgSend(v37, "setDelegate:", v52);

      objc_msgSend((id)objc_msgSend(a3, "layer"), "addAnimation:forKey:", v37, CFSTR("position"));
      CGPathRelease(Mutable);
      objc_msgSend(MEMORY[0x24BDF6F90], "beginAnimations:", 0);
      objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationDuration:", 0.5);
      objc_msgSend(a3, "transform");
      v58 = v60;
      CGAffineTransformScale(&v59, &v58, v31, v31);
      v60 = v59;
      objc_msgSend(a3, "setTransform:", &v59);
      objc_msgSend(a3, "setAlpha:", v56);
      objc_msgSend(MEMORY[0x24BDF6F90], "endAnimations");
    }
  }
}

@end
