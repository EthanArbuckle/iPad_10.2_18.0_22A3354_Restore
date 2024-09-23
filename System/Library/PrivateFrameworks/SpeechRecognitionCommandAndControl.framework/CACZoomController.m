@implementation CACZoomController

+ (id)sharedController
{
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, &__block_literal_global_24);
  return (id)sharedController_sZoomController;
}

void __37__CACZoomController_sharedController__block_invoke()
{
  CACZoomController *v0;
  void *v1;

  v0 = -[CACZoomController initWithZoomFactor:]([CACZoomController alloc], "initWithZoomFactor:", 1.0);
  v1 = (void *)sharedController_sZoomController;
  sharedController_sZoomController = (uint64_t)v0;

}

- (CACZoomController)initWithContainingView:(id)a3
{
  id v4;
  CACZoomController *v5;
  CACZoomController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CACZoomController;
  v5 = -[CACZoomController init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CACZoomController setZoomFactor:](v5, "setZoomFactor:", 1.0);
    -[CACZoomController setContainingView:](v6, "setContainingView:", v4);
  }

  return v6;
}

- (CACZoomController)initWithZoomFactor:(double)a3
{
  CACZoomController *v4;
  CACZoomController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CACZoomController;
  v4 = -[CACZoomController init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[CACZoomController setZoomFactor:](v4, "setZoomFactor:", a3);
  return v5;
}

- (void)loadView
{
  CACZoomMainView *v3;
  void *v4;
  CACZoomMainView *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CACZWLensChromeView *v31;
  CACZWLensChromeView *v32;
  void *v33;
  _OWORD v34[8];

  v3 = [CACZoomMainView alloc];
  -[CACZoomController containingView](self, "containingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v5 = -[CACZoomMainView initWithFrame:](v3, "initWithFrame:");
  -[CACZoomController setView:](self, "setView:", v5);

  -[CACZoomController containingView](self, "containingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");
  v8 = v7 * 0.5;
  -[CACZoomController containingView](self, "containingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  v11 = v10 * 0.5;
  -[CACZoomController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPosition:", v8, v11);

  -[CACZoomController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNeedsDisplayOnBoundsChange:", 1);

  v15 = objc_alloc(MEMORY[0x24BEBDB00]);
  -[CACZoomController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v17 = (void *)objc_msgSend(v15, "initWithFrame:");

  v18 = objc_alloc_init(MEMORY[0x24BDE5748]);
  objc_msgSend(v18, "setAllowsHitTesting:", 0);
  -[CACZoomController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "frame");
  objc_msgSend(v18, "setFrame:");

  objc_msgSend(v17, "bounds");
  objc_msgSend(v18, "setBounds:");
  objc_msgSend(v18, "setInstanceCount:", 2);
  -[CACZoomController setDockedReplicatorLayer:](self, "setDockedReplicatorLayer:", v18);
  v20 = objc_alloc_init(MEMORY[0x24BDE5640]);
  objc_msgSend(v20, "setAllowsHitTesting:", 0);
  objc_msgSend(v20, "setEnabled:", 1);
  objc_msgSend(v20, "bounds");
  objc_msgSend(v20, "setBackdropRect:");
  objc_msgSend(v20, "setGroupName:", CFSTR("Zoomed"));
  objc_msgSend(v20, "setMasksToBounds:", 1);
  v21 = CACZWLensCornerRadius();
  -[CACZoomController zoomFactor](self, "zoomFactor");
  objc_msgSend(v20, "setCornerRadius:", v21 / v22);
  -[CACZoomController setZoomedRegionBackdropLayer:](self, "setZoomedRegionBackdropLayer:", v20);
  -[CACZoomController dockedReplicatorLayer](self, "dockedReplicatorLayer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSublayer:", v20);

  objc_msgSend(v17, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSublayer:", v18);

  -[CACZoomController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addSubview:", v17);

  -[CACZoomController dockedReplicatorLayer](self, "dockedReplicatorLayer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  v34[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v34[5] = v27;
  v28 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v34[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v34[7] = v28;
  v29 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v34[0] = *MEMORY[0x24BDE5598];
  v34[1] = v29;
  v30 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v34[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v34[3] = v30;
  objc_msgSend(v26, "setTransform:", v34);

  v31 = [CACZWLensChromeView alloc];
  v32 = -[CACZWLensChromeView initWithFrame:](v31, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[CACZoomController setLensChromeView:](self, "setLensChromeView:", v32);
  -[CACZWLensChromeView setTranslatesAutoresizingMaskIntoConstraints:](v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CACZoomController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addSubview:", v32);

}

- (void)show
{
  id v2;

  -[CACZoomController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

}

- (void)hide
{
  id v2;

  -[CACZoomController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

}

- (void)moveZoomRegion:(CGRect)a3
{
  _QWORD v3[5];
  CGRect v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __36__CACZoomController_moveZoomRegion___block_invoke;
  v3[3] = &unk_24F2AA928;
  v3[4] = self;
  v4 = a3;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v3, 0.5);
}

uint64_t __36__CACZoomController_moveZoomRegion___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  double MinX;
  CGFloat v49;
  double MinY;
  CGFloat v51;
  void *v52;
  void *v53;
  double v55;
  double v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CATransform3D v62;
  CATransform3D v63;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v66;
  CATransform3D v67;
  CATransform3D v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  objc_msgSend(*(id *)(a1 + 32), "setZoomedRegionFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(double *)(a1 + 56);
  if (v2 != 0.0)
    objc_msgSend(*(id *)(a1 + 32), "setZoomFactor:", 280.0 / v2);
  v3 = CACZWLensCornerRadius();
  objc_msgSend(*(id *)(a1 + 32), "zoomFactor");
  v5 = v3 / v4;
  objc_msgSend(*(id *)(a1 + 32), "zoomedRegionBackdropLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", v5);

  objc_msgSend(*(id *)(a1 + 32), "bestDockFromZoomRegion:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v60 = v8;
  v61 = v7;
  v58 = v10;
  v59 = v9;
  objc_msgSend(*(id *)(a1 + 32), "zoomedRegionFrame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v57 = v17;
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(*(id *)(a1 + 32), "zoomedRegionFrame");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_msgSend(*(id *)(a1 + 32), "zoomedRegionBackdropLayer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrame:", v19, v21, v23, v25);

  objc_msgSend(*(id *)(a1 + 32), "zoomedRegionBackdropLayer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bounds");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  objc_msgSend(*(id *)(a1 + 32), "zoomedRegionBackdropLayer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setBackdropRect:", v29, v31, v33, v35);

  objc_msgSend(*(id *)(a1 + 32), "dockedReplicatorLayer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "position");
  v39 = v38 - v12;
  objc_msgSend(*(id *)(a1 + 32), "zoomFactor");
  v56 = v39 * (v40 + -1.0);

  objc_msgSend(*(id *)(a1 + 32), "dockedReplicatorLayer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "position");
  v43 = v42 - v14;
  objc_msgSend(*(id *)(a1 + 32), "zoomFactor");
  v55 = v43 * (v44 + -1.0);

  memset(&v68, 0, sizeof(v68));
  objc_msgSend(*(id *)(a1 + 32), "zoomFactor");
  v46 = v45;
  objc_msgSend(*(id *)(a1 + 32), "zoomFactor");
  CATransform3DMakeScale(&v68, v46, v47, 1.0);
  memset(&v67, 0, sizeof(v67));
  v69.origin.x = v12;
  v69.origin.y = v14;
  v69.size.width = v16;
  v69.size.height = v57;
  MinX = CGRectGetMinX(v69);
  v70.origin.x = v61;
  v70.origin.y = v60;
  v70.size.width = v59;
  v70.size.height = v58;
  v49 = -(MinX - CGRectGetMinX(v70) - v56);
  v71.origin.x = v12;
  v71.origin.y = v14;
  v71.size.width = v16;
  v71.size.height = v57;
  MinY = CGRectGetMinY(v71);
  v72.origin.x = v61;
  v72.origin.y = v60;
  v72.size.width = v59;
  v72.size.height = v58;
  v51 = CGRectGetMinY(v72);
  CATransform3DMakeTranslation(&v67, v49, -(MinY - v51 - v55), 0.0);
  memset(&v66, 0, sizeof(v66));
  a = v68;
  b = v67;
  CATransform3DConcat(&v66, &a, &b);
  v63 = v66;
  objc_msgSend(*(id *)(a1 + 32), "dockedReplicatorLayer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v63;
  objc_msgSend(v52, "setInstanceTransform:", &v62);

  objc_msgSend(*(id *)(a1 + 32), "lensChromeView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setFrame:", v61, v60, v59, v58);

  return objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (CGRect)bestDockFromZoomRegion:(CGRect)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  -[CACZoomController zoomFactor](self, "zoomFactor", a3.origin.x, a3.origin.y);
  v7 = width * v6;
  v8 = height * v6;
  -[CACZoomController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "center");
  v11 = v10 - v7 * 0.5;
  -[CACZoomController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "center");
  v14 = v13 - v8 * 0.5;

  -[CACZoomController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  v17 = v16 * 0.9;
  -[CACZoomController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  v20 = v19 * 0.9;

  if (v7 <= v17)
    v21 = v8;
  else
    v21 = v20;
  if (v7 <= v17)
    v22 = v7;
  else
    v22 = v17;
  v23 = 280.0;
  if (v22 <= 280.0)
    v24 = v21;
  else
    v24 = 280.0;
  if (v22 <= 280.0)
    v23 = v22;
  v25 = v11;
  v26 = v14;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (void)setZoomFactor:(double)a3
{
  if (self->_zoomFactor != a3)
    self->_zoomFactor = a3;
}

- (CGSize)_prescaledSizeForFinalSize:(CGSize)a3 withScaleFactor:(double)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = a3.width / a4;
  v5 = a3.height / a4;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGRect)_effectiveRectForBounds:(CGRect)a3 position:(CGPoint)a4 scaleFactor:(double)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  v5 = a3.size.width * a5;
  v6 = a3.size.height * a5;
  v7 = a4.x - v5 * 0.5;
  v8 = a4.y - v6 * 0.5;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (void)layerize:(id)a3 color:(id)a4
{
  id v5;
  id v6;
  CGColor *v7;
  id v8;

  v5 = a4;
  v8 = a3;
  objc_msgSend(v8, "setBorderWidth:", 3.0);
  v6 = objc_retainAutorelease(v5);
  v7 = (CGColor *)objc_msgSend(v6, "CGColor");

  objc_msgSend(v8, "setBorderColor:", CGColorCreateCopyWithAlpha(v7, 0.3));
}

- (void)printLayers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  CACZoomController *v38;
  id obj;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;

  v76 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v38 = self;
  -[CACZoomController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v41 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
  if (v41)
  {
    v40 = *(_QWORD *)v68;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v68 != v40)
          objc_enumerationMutation(obj);
        v42 = v6;
        v7 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v6);
        objc_msgSend(v3, "appendFormat:", CFSTR("\n %@"), v7);
        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        objc_msgSend(v7, "layer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "sublayers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v43 = v9;
        v47 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
        if (v47)
        {
          v45 = *(_QWORD *)v64;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v64 != v45)
                objc_enumerationMutation(v43);
              v11 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v10);
              objc_msgSend(v11, "frame");
              NSStringFromCGRect(v77);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v49 = v10;
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v11, "groupName");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "appendFormat:", CFSTR("\n\t %@, frame: %@, name: %@"), v11, v12, v13);

              }
              else
              {
                objc_msgSend(v3, "appendFormat:", CFSTR("\n\t %@, frame: %@, name: %@"), v11, v12, CFSTR("N/A"));
              }

              v61 = 0u;
              v62 = 0u;
              v59 = 0u;
              v60 = 0u;
              objc_msgSend(v11, "sublayers");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
              if (v15)
              {
                v16 = v15;
                v17 = *(_QWORD *)v60;
                do
                {
                  for (i = 0; i != v16; ++i)
                  {
                    if (*(_QWORD *)v60 != v17)
                      objc_enumerationMutation(v14);
                    v19 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
                    objc_msgSend(v19, "frame");
                    NSStringFromCGRect(v78);
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(v19, "groupName");
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\t %@, frame: %@ name: %@"), v19, v20, v21);

                    }
                    else
                    {
                      objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\t %@, frame: %@ name: %@"), v19, v20, CFSTR("N/A"));
                    }

                  }
                  v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
                }
                while (v16);
              }

              v10 = v49 + 1;
            }
            while (v49 + 1 != v47);
            v47 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
          }
          while (v47);
        }

        v6 = v42 + 1;
      }
      while (v42 + 1 != v41);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
    }
    while (v41);
  }

  -[CACZoomController view](v38, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n %@"), v22);

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  -[CACZoomController view](v38, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sublayers");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = v25;
  v48 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v55, v72, 16);
  if (v48)
  {
    v46 = *(_QWORD *)v56;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v56 != v46)
          objc_enumerationMutation(v44);
        v27 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v26);
        objc_msgSend(v27, "frame");
        NSStringFromCGRect(v79);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v50 = v26;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v27, "groupName");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("\n\t %@, frame: %@, name: %@"), v27, v28, v29);

        }
        else
        {
          objc_msgSend(v3, "appendFormat:", CFSTR("\n\t %@, frame: %@, name: %@"), v27, v28, CFSTR("N/A"));
        }

        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        objc_msgSend(v27, "sublayers");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v51, v71, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v52;
          do
          {
            for (j = 0; j != v32; ++j)
            {
              if (*(_QWORD *)v52 != v33)
                objc_enumerationMutation(v30);
              v35 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
              objc_msgSend(v35, "frame");
              NSStringFromCGRect(v80);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v35, "groupName");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\t %@, frame: %@ name: %@"), v35, v36, v37);

              }
              else
              {
                objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\t %@, frame: %@ name: %@"), v35, v36, CFSTR("N/A"));
              }

            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v51, v71, 16);
          }
          while (v32);
        }

        v26 = v50 + 1;
      }
      while (v50 + 1 != v48);
      v48 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v55, v72, 16);
    }
    while (v48);
  }

  NSLog(CFSTR("\n%@"), v3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CACZWLensChromeView)lensChromeView
{
  return self->_lensChromeView;
}

- (void)setLensChromeView:(id)a3
{
  objc_storeStrong((id *)&self->_lensChromeView, a3);
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (CABackdropLayer)screenBackdropLayer
{
  return self->_screenBackdropLayer;
}

- (void)setScreenBackdropLayer:(id)a3
{
  objc_storeStrong((id *)&self->_screenBackdropLayer, a3);
}

- (CABackdropLayer)zoomedRegionBackdropLayer
{
  return self->_zoomedRegionBackdropLayer;
}

- (void)setZoomedRegionBackdropLayer:(id)a3
{
  objc_storeStrong((id *)&self->_zoomedRegionBackdropLayer, a3);
}

- (CAReplicatorLayer)dockedReplicatorLayer
{
  return self->_dockedReplicatorLayer;
}

- (void)setDockedReplicatorLayer:(id)a3
{
  objc_storeStrong((id *)&self->_dockedReplicatorLayer, a3);
}

- (CGRect)zoomedRegionFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_zoomedRegionFrame.origin.x;
  y = self->_zoomedRegionFrame.origin.y;
  width = self->_zoomedRegionFrame.size.width;
  height = self->_zoomedRegionFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setZoomedRegionFrame:(CGRect)a3
{
  self->_zoomedRegionFrame = a3;
}

- (CGRect)dockedLensFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_dockedLensFrame.origin.x;
  y = self->_dockedLensFrame.origin.y;
  width = self->_dockedLensFrame.size.width;
  height = self->_dockedLensFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setDockedLensFrame:(CGRect)a3
{
  self->_dockedLensFrame = a3;
}

- (UIView)containingView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_containingView);
}

- (void)setContainingView:(id)a3
{
  objc_storeWeak((id *)&self->_containingView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containingView);
  objc_storeStrong((id *)&self->_dockedReplicatorLayer, 0);
  objc_storeStrong((id *)&self->_zoomedRegionBackdropLayer, 0);
  objc_storeStrong((id *)&self->_screenBackdropLayer, 0);
  objc_storeStrong((id *)&self->_lensChromeView, 0);
}

@end
