@implementation PFPosterOrientedLayout

- (char)initWithImageSize:(double)a3 deviceResolution:(double)a4 parallaxPadding:(double)a5 visibleFrame:(double)a6 inactiveFrame:(double)a7 timeFrame:(uint64_t)a8 clockLayerOrder:(void *)a9 clockIntersection:(uint64_t)a10 hasTopEdgeContact:(char)a11 debugLayouts:(void *)a12
{
  id v32;
  id v33;
  char *v34;
  uint64_t v35;
  void *v36;
  objc_super v40;

  v32 = a9;
  v33 = a12;
  v40.receiver = a1;
  v40.super_class = (Class)PFPosterOrientedLayout;
  v34 = (char *)objc_msgSendSuper2(&v40, sel_init);
  *((double *)v34 + 5) = a2;
  *((double *)v34 + 6) = a3;
  *((double *)v34 + 7) = a4;
  *((double *)v34 + 8) = a5;
  *((double *)v34 + 9) = a6;
  *((double *)v34 + 10) = a7;
  *(_OWORD *)(v34 + 88) = a15;
  *((_QWORD *)v34 + 13) = a16;
  *((_QWORD *)v34 + 14) = a17;
  *(_OWORD *)(v34 + 120) = a18;
  *((_QWORD *)v34 + 17) = a19;
  *((_QWORD *)v34 + 18) = a20;
  *(_OWORD *)(v34 + 152) = a21;
  *((_QWORD *)v34 + 21) = a22;
  *((_QWORD *)v34 + 22) = a23;
  objc_storeStrong((id *)v34 + 2, a9);
  *((_QWORD *)v34 + 3) = a10;
  v34[8] = a11;
  if (v33)
  {
    v35 = objc_msgSend(v33, "copy");
    v36 = (void *)*((_QWORD *)v34 + 4);
    *((_QWORD *)v34 + 4) = v35;
  }
  else
  {
    v36 = (void *)*((_QWORD *)v34 + 4);
    *((_QWORD *)v34 + 4) = MEMORY[0x1E0C9AA60];
  }

  return v34;
}

- (uint64_t)initWithImageSize:(uint64_t)a3 deviceResolution:(uint64_t)a4 parallaxPadding:(uint64_t)a5 visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:debugLayouts:
{
  return objc_msgSend(a1, "initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:", a3, a4, 0, a5);
}

- (int64_t)orientation
{
  if (self->_deviceResolution.width <= self->_deviceResolution.height)
    return 1;
  else
    return 2;
}

- (CGRect)imageExtent
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PFPosterOrientedLayout imageSize](self, "imageSize");
  v5 = v4;
  v7 = v6;
  v8 = v2;
  v9 = v3;
  result.size.height = v7;
  result.size.width = v5;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)screenExtent
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PFPosterOrientedLayout deviceResolution](self, "deviceResolution");
  v5 = v4;
  v7 = v6;
  v8 = v2;
  v9 = v3;
  result.size.height = v7;
  result.size.width = v5;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGSize)extendedImageSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  if (PFPosterEnableHeadroom() && -[PFPosterOrientedLayout canApplyHeadroom](self, "canApplyHeadroom"))
  {
    -[PFPosterOrientedLayout imageExtent](self, "imageExtent");
    v4 = v3;
    -[PFPosterOrientedLayout imageExtent](self, "imageExtent");
    v6 = v5 * 1.35;
  }
  else
  {
    -[PFPosterOrientedLayout imageExtent](self, "imageExtent");
    v4 = v7;
    -[PFPosterOrientedLayout imageExtent](self, "imageExtent");
    v6 = v8;
  }
  v9 = v4;
  result.height = v6;
  result.width = v9;
  return result;
}

- (CGRect)extendedImageExtent
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PFPosterOrientedLayout extendedImageSize](self, "extendedImageSize");
  v5 = v4;
  v7 = v6;
  v8 = v2;
  v9 = v3;
  result.size.height = v7;
  result.size.width = v5;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)normalizedVisibleFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
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
  BOOL v19;
  double v20;
  double v21;
  CGRect result;

  -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PFPosterOrientedLayout imageExtent](self, "imageExtent");
  v13 = v12;
  v15 = v14;
  v17 = v4 - v16;
  v18 = 0.0;
  v19 = v12 == 0.0;
  v20 = 0.0;
  if (!v19)
  {
    v17 = v17 / v13;
    v20 = v8 / v13;
  }
  v21 = v6 - v11;
  if (v15 != 0.0)
  {
    v21 = v21 / v15;
    v18 = v10 / v15;
  }
  result.size.height = v18;
  result.size.width = v20;
  result.origin.y = v21;
  result.origin.x = v17;
  return result;
}

- (CGRect)parallaxVisibleFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v27;

  -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PFPosterOrientedLayout parallaxPadding](self, "parallaxPadding");
  v12 = -v11;
  -[PFPosterOrientedLayout parallaxPadding](self, "parallaxPadding");
  v14 = -v13;
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  v24 = CGRectInset(v23, v12, v14);
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  -[PFPosterOrientedLayout imageExtent](self, "imageExtent");
  v27.origin.x = v19;
  v27.origin.y = v20;
  v27.size.width = v21;
  v27.size.height = v22;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  return CGRectIntersection(v25, v27);
}

- (CGRect)parallaxInactiveFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v27;

  -[PFPosterOrientedLayout parallaxPadding](self, "parallaxPadding");
  v4 = v3;
  -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
  v6 = v4 / v5;
  -[PFPosterOrientedLayout parallaxPadding](self, "parallaxPadding");
  v8 = v7;
  -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
  v10 = v8 / v9;
  -[PFPosterOrientedLayout inactiveFrame](self, "inactiveFrame");
  v12 = v11;
  -[PFPosterOrientedLayout inactiveFrame](self, "inactiveFrame");
  v14 = v13;
  -[PFPosterOrientedLayout inactiveFrame](self, "inactiveFrame");
  v24 = CGRectInset(v23, -(v12 * v6), -(v14 * v10));
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  -[PFPosterOrientedLayout imageExtent](self, "imageExtent");
  v27.origin.x = v19;
  v27.origin.y = v20;
  v27.size.width = v21;
  v27.size.height = v22;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  return CGRectIntersection(v25, v27);
}

- (BOOL)canApplyHeadroom
{
  return !-[PFPosterOrientedLayout hasTopEdgeContact](self, "hasTopEdgeContact");
}

- (PFParallaxLayoutConfiguration)configuration
{
  double y;
  double x;
  double width;
  double v6;
  double height;
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
  PFParallaxLayoutConfiguration *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double v27;
  double v28;

  x = self->_timeFrame.origin.x;
  y = self->_timeFrame.origin.y;
  width = self->_timeFrame.size.width;
  v6 = self->_visibleFrame.size.width;
  height = self->_visibleFrame.size.height;
  v8 = x - self->_visibleFrame.origin.x;
  v9 = 0.0;
  v10 = 0.0;
  if (v6 != 0.0)
  {
    v8 = v8 / v6;
    v10 = width / v6;
  }
  v27 = v10;
  v11 = self->_timeFrame.size.height;
  v12 = y - self->_visibleFrame.origin.y;
  if (height != 0.0)
  {
    v12 = v12 / height;
    v9 = v11 / height;
  }
  v28 = v9;
  v14 = self->_inactiveFrame.size.width;
  v13 = self->_inactiveFrame.size.height;
  v15 = x - self->_inactiveFrame.origin.x;
  v16 = 0.0;
  v17 = 0.0;
  if (v14 != 0.0)
  {
    v15 = v15 / v14;
    v17 = width / v14;
  }
  v18 = y - self->_inactiveFrame.origin.y;
  if (v13 != 0.0)
  {
    v18 = v18 / v13;
    v16 = v11 / v13;
  }
  v19 = [PFParallaxLayoutConfiguration alloc];
  -[PFPosterOrientedLayout screenExtent](self, "screenExtent");
  v21 = v20;
  v23 = v22;
  -[PFPosterOrientedLayout parallaxPadding](self, "parallaxPadding");
  return -[PFParallaxLayoutConfiguration initWithScreenSize:timeRect:inactiveTimeRect:parallaxPadding:](v19, "initWithScreenSize:timeRect:inactiveTimeRect:parallaxPadding:", v21, v23, v8, v12, v27, v28, *(_QWORD *)&v15, *(_QWORD *)&v18, *(_QWORD *)&v17, *(_QWORD *)&v16, v24, v25);
}

- (id)layoutByUpdatingVisibleFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
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
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  PFPosterOrientedLayout *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  PFPosterOrientedLayout *v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  _BOOL8 v94;
  PFPosterOrientedLayout *v96;
  SEL v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsEmpty(a3)
    || (v106.origin.x = x, v106.origin.y = y, v106.size.width = width, v106.size.height = height, CGRectIsInfinite(v106)))
  {
    v96 = (PFPosterOrientedLayout *)_PFAssertFailHandler();
    return -[PFPosterOrientedLayout layoutByUpdatingInactiveFrame:](v96, v97, v111);
  }
  else
  {
    -[PFPosterOrientedLayout extendedImageExtent](self, "extendedImageExtent");
    v104 = height;
    v11 = y + height;
    v13 = v8 + v12;
    if (x + width >= v13)
      v14 = v13;
    else
      v14 = x + width;
    if (v8 >= v14)
      v14 = v8;
    v15 = v9 + v10;
    if (v11 >= v15)
      v16 = v15;
    else
      v16 = y + height;
    if (v9 >= v16)
      v16 = v9;
    v17 = y + v16 - v11;
    if (x + v14 - (x + width) < v13)
      v13 = x + v14 - (x + width);
    if (v8 >= v13)
      v18 = v8;
    else
      v18 = v13;
    if (v17 >= v15)
      v19 = v15;
    else
      v19 = v17;
    if (v9 >= v19)
      v19 = v9;
    v105 = v19;
    -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    -[PFPosterOrientedLayout imageExtent](self, "imageExtent");
    v32 = v21 - v31;
    v33 = 0.0;
    v34 = 0.0;
    if (v29 != 0.0)
    {
      v32 = v32 / v29;
      v34 = v25 / v29;
    }
    v35 = v23 - v28;
    if (v30 != 0.0)
    {
      v35 = v35 / v30;
      v33 = v27 / v30;
    }
    -[PFPosterOrientedLayout screenExtent](self, "screenExtent");
    v107.origin.x = v36 + v32 * v37;
    v107.origin.y = v38 + v35 * v39;
    v107.size.width = v34 * v37;
    v107.size.height = v33 * v39;
    v108 = CGRectIntegral(v107);
    v40 = v108.origin.x;
    v41 = v108.origin.y;
    v42 = v108.size.width;
    v43 = v108.size.height;
    -[PFPosterOrientedLayout imageExtent](self, "imageExtent");
    v103 = v18;
    v48 = v18 - v47;
    v49 = 0.0;
    v50 = 0.0;
    if (v45 != 0.0)
    {
      v48 = v48 / v45;
      v50 = width / v45;
    }
    v102 = width;
    v51 = v105 - v44;
    if (v46 != 0.0)
    {
      v51 = v51 / v46;
      v49 = v104 / v46;
    }
    -[PFPosterOrientedLayout screenExtent](self, "screenExtent");
    v109.origin.x = v52 + v48 * v53;
    v109.origin.y = v54 + v51 * v55;
    v109.size.width = v50 * v53;
    v109.size.height = v49 * v55;
    v112 = CGRectIntegral(v109);
    v110.origin.x = v40;
    v110.origin.y = v41;
    v110.size.width = v42;
    v110.size.height = v43;
    if (CGRectEqualToRect(v110, v112))
    {
      v56 = self;
    }
    else
    {
      -[PFPosterOrientedLayout timeFrame](self, "timeFrame");
      v58 = v57;
      v60 = v59;
      v62 = v61;
      v64 = v63;
      -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
      v69 = v58 - v68;
      v70 = 0.0;
      v71 = 0.0;
      if (v66 != 0.0)
      {
        v69 = v69 / v66;
        v71 = v62 / v66;
      }
      v72 = v60 - v65;
      if (v67 != 0.0)
      {
        v72 = v72 / v67;
        v70 = v64 / v67;
      }
      v73 = v103 + v69 * v102;
      v74 = v105 + v72 * v104;
      v75 = v102 * v71;
      v76 = v104 * v70;
      -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
      v78 = v77;
      v80 = v79;
      -[PFPosterOrientedLayout parallaxPadding](self, "parallaxPadding");
      v100 = v74;
      v101 = v73;
      v98 = v76;
      v99 = v75;
      if (v78 != 0.0 && v80 != 0.0 && (v78 != *MEMORY[0x1E0D71130] || v80 != *(double *)(MEMORY[0x1E0D71130] + 8)))
      {
        v81 = v81 * (v102 / v78);
        v82 = v82 * (v104 / v80);
      }
      v83 = v81;
      v84 = v82;
      v85 = [PFPosterOrientedLayout alloc];
      -[PFPosterOrientedLayout imageSize](self, "imageSize");
      v87 = v86;
      v89 = v88;
      -[PFPosterOrientedLayout deviceResolution](self, "deviceResolution");
      v91 = v90;
      v93 = v92;
      v94 = -[PFPosterOrientedLayout hasTopEdgeContact](self, "hasTopEdgeContact");
      v56 = -[PFPosterOrientedLayout initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:](v85, "initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:", 0, 0, v94, 0, v87, v89, v91, v93, v83, v84, *(_QWORD *)&v103, *(_QWORD *)&v105, *(_QWORD *)&v102, *(_QWORD *)&v104, *MEMORY[0x1E0C9D628], *(_QWORD *)(MEMORY[0x1E0C9D628] + 8),
              *(_QWORD *)(MEMORY[0x1E0C9D628] + 16),
              *(_QWORD *)(MEMORY[0x1E0C9D628] + 24),
              *(_QWORD *)&v101,
              *(_QWORD *)&v100,
              *(_QWORD *)&v99,
              *(_QWORD *)&v98);
    }
    return v56;
  }
}

- (id)layoutByUpdatingInactiveFrame:(CGRect)a3
{
  PFPosterOrientedLayout *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  PFPosterOrientedLayout *v28;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v4 = [PFPosterOrientedLayout alloc];
  -[PFPosterOrientedLayout imageSize](self, "imageSize");
  v34 = v6;
  v35 = v5;
  -[PFPosterOrientedLayout deviceResolution](self, "deviceResolution");
  v32 = v8;
  v33 = v7;
  -[PFPosterOrientedLayout parallaxPadding](self, "parallaxPadding");
  v30 = v10;
  v31 = v9;
  -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[PFPosterOrientedLayout timeFrame](self, "timeFrame");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  -[PFPosterOrientedLayout clockLayerOrder](self, "clockLayerOrder");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[PFPosterOrientedLayout initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:](v4, "initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:", v27, -[PFPosterOrientedLayout clockIntersection](self, "clockIntersection"), -[PFPosterOrientedLayout hasTopEdgeContact](self, "hasTopEdgeContact"), 0, v35, v34, v33, v32, v31, v30, v12, v14, v16, v18, *(_QWORD *)&x, *(_QWORD *)&y,
          *(_QWORD *)&width,
          *(_QWORD *)&height,
          v20,
          v22,
          v24,
          v26);

  return v28;
}

- (id)layoutByUpdatingClockLayerOrder:(id)a3
{
  id v4;
  void *v5;
  int v6;
  PFPosterOrientedLayout *v7;
  PFPosterOrientedLayout *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  _BOOL8 v36;
  void *v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;

  v4 = a3;
  -[PFPosterOrientedLayout clockLayerOrder](self, "clockLayerOrder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if (v6)
  {
    v7 = self;
  }
  else
  {
    v8 = [PFPosterOrientedLayout alloc];
    -[PFPosterOrientedLayout imageSize](self, "imageSize");
    v47 = v10;
    v48 = v9;
    -[PFPosterOrientedLayout deviceResolution](self, "deviceResolution");
    v45 = v12;
    v46 = v11;
    -[PFPosterOrientedLayout parallaxPadding](self, "parallaxPadding");
    v43 = v14;
    v44 = v13;
    -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
    v41 = v16;
    v42 = v15;
    v39 = v18;
    v40 = v17;
    -[PFPosterOrientedLayout inactiveFrame](self, "inactiveFrame");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    -[PFPosterOrientedLayout timeFrame](self, "timeFrame");
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v35 = -[PFPosterOrientedLayout clockIntersection](self, "clockIntersection");
    v36 = -[PFPosterOrientedLayout hasTopEdgeContact](self, "hasTopEdgeContact");
    -[PFPosterOrientedLayout debugLayouts](self, "debugLayouts");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PFPosterOrientedLayout initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:](v8, "initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:", v4, v35, v36, v37, v48, v47, v46, v45, v44, v43, v42, v41, v40, v39, v20, v22,
           v24,
           v26,
           v28,
           v30,
           v32,
           v34);

  }
  return v7;
}

- (id)layoutByUpdatingClockIntersection:(unint64_t)a3
{
  PFPosterOrientedLayout *v5;
  PFPosterOrientedLayout *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _BOOL8 v34;
  void *v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;

  if (-[PFPosterOrientedLayout clockIntersection](self, "clockIntersection") == a3)
  {
    v5 = self;
  }
  else
  {
    v6 = [PFPosterOrientedLayout alloc];
    -[PFPosterOrientedLayout imageSize](self, "imageSize");
    v45 = v8;
    v46 = v7;
    -[PFPosterOrientedLayout deviceResolution](self, "deviceResolution");
    v44 = v9;
    v43 = v10;
    -[PFPosterOrientedLayout parallaxPadding](self, "parallaxPadding");
    v41 = v12;
    v42 = v11;
    -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
    v39 = v14;
    v40 = v13;
    v37 = v16;
    v38 = v15;
    -[PFPosterOrientedLayout inactiveFrame](self, "inactiveFrame");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    -[PFPosterOrientedLayout timeFrame](self, "timeFrame");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    -[PFPosterOrientedLayout clockLayerOrder](self, "clockLayerOrder");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[PFPosterOrientedLayout hasTopEdgeContact](self, "hasTopEdgeContact");
    -[PFPosterOrientedLayout debugLayouts](self, "debugLayouts");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PFPosterOrientedLayout initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:](v6, "initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:", v33, a3, v34, v35, v46, v45, v44, v43, v42, v41, v40, v39, v38, v37, v18, v20,
           v22,
           v24,
           v26,
           v28,
           v30,
           v32);

  }
  return v5;
}

- (id)layoutByUpdatingImageSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
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
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  PFPosterOrientedLayout *v53;
  double v54;
  double v55;
  void *v56;
  unint64_t v57;
  _BOOL8 v58;
  void *v59;
  PFPosterOrientedLayout *v60;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;

  height = a3.height;
  width = a3.width;
  -[PFPosterOrientedLayout imageSize](self, "imageSize");
  if (width == v7 && height == v6)
  {
    v60 = self;
  }
  else
  {
    v9 = *MEMORY[0x1E0C9D538];
    v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[PFPosterOrientedLayout imageSize](self, "imageSize");
    v12 = v11;
    v14 = v13;
    -[PFPosterOrientedLayout imageSize](self, "imageSize");
    v71 = v15;
    -[PFPosterOrientedLayout parallaxPadding](self, "parallaxPadding");
    v78 = v17;
    v80 = v16;
    -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
    v83 = v9;
    v22 = v21 - v9;
    v23 = 0.0;
    v24 = 0.0;
    if (v12 != 0.0)
    {
      v22 = v22 / v12;
      v24 = v19 / v12;
    }
    v74 = v24;
    v25 = v18 - v10;
    if (v14 != 0.0)
    {
      v25 = v25 / v14;
      v23 = v20 / v14;
    }
    v72 = v23;
    v82 = height;
    -[PFPosterOrientedLayout inactiveFrame](self, "inactiveFrame");
    v30 = v29 - v83;
    v31 = 0.0;
    v32 = 0.0;
    if (v12 != 0.0)
    {
      v30 = v30 / v12;
      v32 = v27 / v12;
    }
    v67 = v32;
    v33 = v10;
    v34 = v26 - v10;
    if (v14 != 0.0)
    {
      v34 = v34 / v14;
      v31 = v28 / v14;
    }
    v69 = v31;
    v77 = v83 + v22 * width;
    v75 = width * v74;
    v76 = v33 + v25 * v82;
    v73 = v82 * v72;
    v35 = width / v71;
    -[PFPosterOrientedLayout timeFrame](self, "timeFrame");
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v65 = v42;
    -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
    v47 = v37 - v46;
    v48 = 0.0;
    v49 = 0.0;
    if (v44 != 0.0)
    {
      v47 = v47 / v44;
      v49 = v41 / v44;
    }
    v79 = v78 * v35;
    v81 = v80 * v35;
    v84 = v83 + v30 * width;
    v50 = v39 - v43;
    v68 = width * v67;
    v70 = v82 * v69;
    if (v45 != 0.0)
    {
      v50 = v50 / v45;
      v48 = v65 / v45;
    }
    v64 = v76 + v50 * v73;
    v66 = v77 + v47 * v75;
    v51 = v75 * v49;
    v52 = v73 * v48;
    v53 = [PFPosterOrientedLayout alloc];
    -[PFPosterOrientedLayout deviceResolution](self, "deviceResolution");
    v62 = v55;
    v63 = v54;
    -[PFPosterOrientedLayout clockLayerOrder](self, "clockLayerOrder");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = -[PFPosterOrientedLayout clockIntersection](self, "clockIntersection");
    v58 = -[PFPosterOrientedLayout hasTopEdgeContact](self, "hasTopEdgeContact");
    -[PFPosterOrientedLayout debugLayouts](self, "debugLayouts");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = -[PFPosterOrientedLayout initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:](v53, "initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:", v56, v57, v58, v59, width, v82, v63, v62, v81, v79, *(_QWORD *)&v77, *(_QWORD *)&v76, *(_QWORD *)&v75, *(_QWORD *)&v73, *(_QWORD *)&v84, v33 + v34 * v82,
            *(_QWORD *)&v68,
            *(_QWORD *)&v70,
            *(_QWORD *)&v66,
            *(_QWORD *)&v64,
            *(_QWORD *)&v51,
            *(_QWORD *)&v52);

  }
  return v60;
}

- (id)layoutByUpdatingNormalizedVisibleFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PFPosterOrientedLayout imageExtent](self, "imageExtent");
  return -[PFPosterOrientedLayout layoutByUpdatingVisibleFrame:](self, "layoutByUpdatingVisibleFrame:", v8 + x * v9, v10 + y * v11, width * v9, height * v11);
}

- (id)layoutByUpdatingConfiguration:(id)a3
{
  id v4;
  void *v5;
  int v6;
  PFPosterOrientedLayout *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
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
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  BOOL v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  BOOL v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  _BOOL4 IsNull;
  double v59;
  double v60;
  double v61;
  double v62;
  _BOOL4 v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  PFPosterOrientedLayout *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  CGFloat v99;
  double v100;
  double v101;
  double v102;
  double v103;
  uint8_t buf[4];
  double v105;
  __int16 v106;
  double v107;
  __int16 v108;
  uint64_t v109;
  uint64_t v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;

  v110 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PFPosterOrientedLayout configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToLayoutConfiguration:", v5);

  if (v6)
  {
    v7 = self;
  }
  else
  {
    -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[PFPosterOrientedLayout inactiveFrame](self, "inactiveFrame");
    v97 = v17;
    v99 = v16;
    v19 = v18;
    v21 = v20;
    -[PFPosterOrientedLayout timeFrame](self, "timeFrame");
    v23 = v22;
    v25 = v24;
    v111.origin.x = v9;
    v111.origin.y = v11;
    v111.size.width = v13;
    v111.size.height = v15;
    v93 = v25;
    if (CGRectIsEmpty(v111))
    {
      v89 = v23;
      v91 = v21;
      v26 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v101 = *MEMORY[0x1E0C9D538];
      -[PFPosterOrientedLayout imageSize](self, "imageSize");
      v28 = v27;
      v30 = v29;
      -[PFPosterOrientedLayout deviceResolution](self, "deviceResolution");
      v33 = v31;
      v34 = v32;
      if (v31 == 0.0
        || v32 == 0.0
        || (v31 == *MEMORY[0x1E0D71130] ? (v35 = v32 == *(double *)(MEMORY[0x1E0D71130] + 8)) : (v35 = 0), v35))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134218496;
          v105 = v33;
          v106 = 2048;
          v107 = v34;
          v108 = 2048;
          v109 = 0x3FF0000000000000;
          _os_log_fault_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
        }
      }
      v36 = v19;
      PFSizeWithAspectRatioFittingSize();
      v13 = v37;
      v15 = v38;
      v95 = v101 + v28 * 0.5 + v37 * -0.5;
      v102 = v26 + v30 * 0.5 + v38 * -0.5;
      v23 = v89;
      v21 = v91;
    }
    else
    {
      v102 = v11;
      v95 = v9;
      v36 = v19;
    }
    -[PFPosterOrientedLayout deviceResolution](self, "deviceResolution");
    v40 = v39;
    v42 = v41;
    objc_msgSend(v4, "screenSize");
    v45 = v44 / v43;
    if (v44 / v43 <= v42 / v40)
    {
      if (v44 / v43 < v42 / v40)
      {
        v54 = v13 * v45;
        objc_msgSend(v4, "timeRect");
        v57 = v23 - (v55 * v54 + 0.0) + (v93 - v54 * v56) * 0.25;
        v87 = v102;
        v48 = v99;
        if (v57 >= v102)
        {
          v87 = v23 - (v55 * v54 + 0.0) + (v93 - v54 * v56) * 0.25;
          if (v54 + v57 > v15 + v102)
            v87 = v15 + v102 - v54;
        }
        v113.origin.x = v99;
        v113.origin.y = v36;
        v113.size.width = v97;
        v113.size.height = v21;
        IsNull = CGRectIsNull(v113);
        v59 = v97 * v45;
        v51 = v97;
        if (IsNull)
          v59 = v21;
        v90 = v59;
        v92 = v97;
        v15 = v13 * v45;
        v47 = v95;
        v94 = v95;
        v52 = v102;
        v53 = v87;
      }
      else
      {
        v47 = v95;
        v51 = v97;
        v94 = v95;
        v52 = v102;
        v53 = v102;
        v90 = v21;
        v92 = v97;
        v48 = v99;
      }
    }
    else
    {
      v46 = v13;
      v13 = v15 / v45;
      v47 = v95;
      v94 = v95 + (v46 - v15 / v45) * 0.5;
      v48 = v99;
      v112.origin.x = v99;
      v112.origin.y = v36;
      v112.size.width = v97;
      v112.size.height = v21;
      v49 = CGRectIsNull(v112);
      v50 = v21 / v45;
      v51 = v97;
      if (v49)
        v50 = v97;
      v92 = v50;
      v52 = v102;
      v53 = v102;
      v90 = v21;
    }
    v98 = v13;
    v60 = v48;
    v61 = v36;
    v62 = v21;
    v63 = CGRectIsNull(*(CGRect *)(&v51 - 2));
    v64 = v94 - v47;
    if (v63)
      v64 = -0.0;
    v103 = v48 + v64;
    if (v63)
      v65 = -0.0;
    else
      v65 = v53 - v52;
    v100 = v36 + v65;
    objc_msgSend(v4, "timeRect");
    v96 = v94 + v66 * v13;
    v86 = v13 * v68;
    v88 = v53 + v67 * v15;
    v70 = v15 * v69;
    v71 = [PFPosterOrientedLayout alloc];
    -[PFPosterOrientedLayout imageSize](self, "imageSize");
    v84 = v73;
    v85 = v72;
    objc_msgSend(v4, "screenSize");
    v75 = v74;
    v77 = v76;
    -[PFPosterOrientedLayout parallaxPadding](self, "parallaxPadding");
    v79 = v78;
    v81 = v80;
    -[PFPosterOrientedLayout clockLayerOrder](self, "clockLayerOrder");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PFPosterOrientedLayout initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:](v71, "initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:", v82, -[PFPosterOrientedLayout clockIntersection](self, "clockIntersection"), -[PFPosterOrientedLayout hasTopEdgeContact](self, "hasTopEdgeContact"), 0, v85, v84, v75, v77, v79, v81, *(_QWORD *)&v94, *(_QWORD *)&v53, *(_QWORD *)&v98, *(_QWORD *)&v15, *(_QWORD *)&v103, *(_QWORD *)&v100,
           *(_QWORD *)&v92,
           *(_QWORD *)&v90,
           *(_QWORD *)&v96,
           *(_QWORD *)&v88,
           *(_QWORD *)&v86,
           *(_QWORD *)&v70);

  }
  return v7;
}

- (id)layoutByUpgradingToConfiguration:(id)a3
{
  id v4;
  void *v5;
  int v6;
  PFPosterOrientedLayout *v7;
  void *v8;
  void *v9;
  double *v10;
  double v11;
  double v12;
  double v13;
  double v14;
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
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  BOOL v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  BOOL v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  uint64_t v55;
  double v56;
  double v57;
  double MinY;
  double v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  double v76;
  void *v77;
  void *v78;
  NSObject *v79;
  const char *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  PFPosterOrientedLayout *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  void *v101;
  uint64_t v103;
  double v104;
  double v105;
  double v106;
  double rect;
  double recta;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  uint8_t buf[4];
  double v124;
  __int16 v125;
  double v126;
  __int16 v127;
  uint64_t v128;
  uint64_t v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;

  v129 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PFPosterOrientedLayout configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToLayoutConfiguration:", v5);

  if (v6)
  {
    v7 = self;
    goto LABEL_58;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    -[PFPosterOrientedLayout debugDescription](self, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "debugDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v124 = *(double *)&v8;
    v125 = 2112;
    v126 = *(double *)&v9;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Upgrading %@ to %@", buf, 0x16u);

  }
  v10 = (double *)MEMORY[0x1E0C9D538];
  v121 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PFPosterOrientedLayout imageSize](self, "imageSize");
  v111 = v11;
  v114 = v12;
  -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[PFPosterOrientedLayout inactiveFrame](self, "inactiveFrame");
  v118 = v21;
  v106 = v22;
  v109 = v23;
  v116 = v24;
  -[PFPosterOrientedLayout timeFrame](self, "timeFrame");
  v103 = v25;
  v104 = v26;
  v105 = v27;
  rect = v28;
  v130.origin.x = v14;
  v130.origin.y = v16;
  v130.size.width = v18;
  v130.size.height = v20;
  if (CGRectIsEmpty(v130))
  {
    v29 = *v10;
    -[PFPosterOrientedLayout deviceResolution](self, "deviceResolution");
    v32 = v30;
    v33 = v31;
    if (v30 == 0.0
      || v31 == 0.0
      || (v30 == *MEMORY[0x1E0D71130] ? (v34 = v31 == *(double *)(MEMORY[0x1E0D71130] + 8)) : (v34 = 0), v34))
    {
      v35 = v121;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218496;
        v124 = v32;
        v125 = 2048;
        v126 = v33;
        v127 = 2048;
        v128 = 0x3FF0000000000000;
        _os_log_fault_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
      }
    }
    else
    {
      v35 = v121;
    }
    v36 = v29 + v111 * 0.5;
    v37 = v35 + v114 * 0.5;
    PFSizeWithAspectRatioFittingSize();
    v18 = v38;
    v20 = v39;
    v14 = v36 + v38 * -0.5;
    v16 = v37 + v39 * -0.5;
  }
  objc_msgSend(v4, "screenSize");
  v42 = v41 / v40;
  v43 = sqrt(v20 * v18 / (v41 / v40));
  v44 = sqrt(v20 * v18 * (v41 / v40));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("{{%.2f, %.2f}, {%.2f, %.2f}}"), *(_QWORD *)&v14, *(_QWORD *)&v16, *(_QWORD *)&v43, *(_QWORD *)&v44);
    *(_DWORD *)buf = 138412290;
    v124 = *(double *)&v45;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "newVisibleFrame after scaling: %@", buf, 0xCu);

  }
  v113 = v43;
  v46 = v43 <= v111 && v44 <= v114;
  v47 = v44;
  v48 = v106;
  if (!v46)
  {
    PFSizeWithAspectRatioFittingSize();
    v50 = v49;
    v47 = v51;
    v113 = v49;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("{{%.2f, %.2f}, {%.2f, %.2f}}"), *(_QWORD *)&v14, *(_QWORD *)&v16, *(_QWORD *)&v50, *(_QWORD *)&v47);
      *(_DWORD *)buf = 138412290;
      v124 = *(double *)&v52;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "newVisibleFrame after more scaling: %@", buf, 0xCu);

    }
  }
  v110 = v47;
  v53 = v105;
  v120 = v16;
  v54 = v14;
  if (rect <= v105)
  {
    v55 = v103;
    v56 = v104;
    v57 = rect;
    MinY = CGRectGetMinY(*(CGRect *)(&v53 - 2));
    v131.origin.x = v14;
    v131.origin.y = v16;
    v131.size.width = v18;
    v131.size.height = v20;
    v120 = v16;
    v54 = v14;
    if (MinY >= CGRectGetMidY(v131))
    {
      objc_msgSend(v4, "timeRect");
      v54 = v14 + (v18 - v113) * 0.5;
      v61 = v104 - (v59 * v110 + 0.0) + (rect - v110 * v60) * 0.25;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("{{%.2f, %.2f}, {%.2f, %.2f}}"), *(_QWORD *)&v54, *(_QWORD *)&v61, *(_QWORD *)&v113, *(_QWORD *)&v110);
        *(_DWORD *)buf = 138412290;
        v124 = *(double *)&v62;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "newVisibleFrame after centering: %@", buf, 0xCu);

      }
      if (v61 < v121)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("{{%.2f, %.2f}, {%.2f, %.2f}}"), *(_QWORD *)&v54, *(_QWORD *)&v121, *(_QWORD *)&v113, *(_QWORD *)&v110);
          *(_DWORD *)buf = 138412290;
          v124 = *(double *)&v63;
          _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "newVisibleFrame after clamp 1: %@", buf, 0xCu);

        }
        v120 = v121;
        goto LABEL_36;
      }
      v64 = v14 + (v18 - v113) * 0.5;
      v65 = v121 + v114;
      if (v110 + v61 <= v121 + v114)
      {
        v120 = v61;
LABEL_36:
        v48 = v106;
        goto LABEL_37;
      }
      v66 = v65 - v110;
      v48 = v106;
      v120 = v65 - v110;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("{{%.2f, %.2f}, {%.2f, %.2f}}"), *(_QWORD *)&v64, *(_QWORD *)&v66, *(_QWORD *)&v113, *(_QWORD *)&v110);
        *(_DWORD *)buf = 138412290;
        v124 = *(double *)&v67;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "newVisibleFrame after clamp 2: %@", buf, 0xCu);

      }
    }
  }
LABEL_37:
  v68 = v118;
  v132.origin.x = v118;
  v132.origin.y = v48;
  v132.size.width = v109;
  v69 = v116;
  v132.size.height = v116;
  if (!CGRectIsNull(v132))
  {
    v70 = v54;
    v71 = sqrt(v109 * v116 / v42);
    v69 = sqrt(v109 * v116 * v42);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("{{%.2f, %.2f}, {%.2f, %.2f}}"), *(_QWORD *)&v118, *(_QWORD *)&v48, *(_QWORD *)&v71, *(_QWORD *)&v69);
      *(_DWORD *)buf = 138412290;
      v124 = *(double *)&v72;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "newInactiveFrame after scaling: %@", buf, 0xCu);

    }
    v48 = v121;
    if (v71 > v111 || v69 > v114)
    {
      PFSizeWithAspectRatioFittingSize();
      v71 = v73;
      v69 = v74;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("{{%.2f, %.2f}, {%.2f, %.2f}}"), *(_QWORD *)&v118, *(_QWORD *)&v106, *(_QWORD *)&v71, *(_QWORD *)&v69);
        *(_DWORD *)buf = 138412290;
        v124 = *(double *)&v75;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "newInactiveFrame after more scaling: %@", buf, 0xCu);

      }
    }
    v68 = v118 + v70 - v14;
    v76 = v106 + v120 - v16;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("{{%.2f, %.2f}, {%.2f, %.2f}}"), *(_QWORD *)&v68, *(_QWORD *)&v76, *(_QWORD *)&v71, *(_QWORD *)&v69);
      *(_DWORD *)buf = 138412290;
      v124 = *(double *)&v77;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "newInactiveFrame after offset: %@", buf, 0xCu);

    }
    v109 = v71;
    if (v76 >= v121)
    {
      if (v76 + v69 <= v121 + v114)
      {
        v48 = v76;
        goto LABEL_54;
      }
      v48 = v121 + v114 - v69;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("{{%.2f, %.2f}, {%.2f, %.2f}}"), *(_QWORD *)&v68, *(_QWORD *)&v48, *(_QWORD *)&v71, *(_QWORD *)&v69);
        *(_DWORD *)buf = 138412290;
        v124 = *(double *)&v78;
        v79 = MEMORY[0x1E0C81028];
        v80 = "newInactiveFrame after clamp 2: %@";
        goto LABEL_52;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("{{%.2f, %.2f}, {%.2f, %.2f}}"), *(_QWORD *)&v68, *(_QWORD *)&v121, *(_QWORD *)&v71, *(_QWORD *)&v69);
      *(_DWORD *)buf = 138412290;
      v124 = *(double *)&v78;
      v79 = MEMORY[0x1E0C81028];
      v80 = "newInactiveFrame after clamp 1: %@";
LABEL_52:
      _os_log_impl(&dword_1A16EE000, v79, OS_LOG_TYPE_DEFAULT, v80, buf, 0xCu);

    }
LABEL_54:
    v54 = v70;
  }
  v117 = v69;
  v119 = v68;
  v122 = v48;
  objc_msgSend(v4, "timeRect");
  v115 = v54;
  v82 = v54 + v81 * v113;
  v84 = v120 + v83 * v110;
  v86 = v113 * v85;
  v88 = v110 * v87;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("{{%.2f, %.2f}, {%.2f, %.2f}}"), *(_QWORD *)&v82, *(_QWORD *)&v84, *(_QWORD *)&v86, *(_QWORD *)&v88);
    *(_DWORD *)buf = 138412290;
    v124 = *(double *)&v89;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "newTimeRect: %@", buf, 0xCu);

  }
  v90 = [PFPosterOrientedLayout alloc];
  -[PFPosterOrientedLayout imageSize](self, "imageSize");
  v112 = v91;
  recta = v92;
  objc_msgSend(v4, "screenSize");
  v94 = v93;
  v96 = v95;
  -[PFPosterOrientedLayout parallaxPadding](self, "parallaxPadding");
  v98 = v97;
  v100 = v99;
  -[PFPosterOrientedLayout clockLayerOrder](self, "clockLayerOrder");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PFPosterOrientedLayout initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:](v90, "initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:", v101, -[PFPosterOrientedLayout clockIntersection](self, "clockIntersection"), -[PFPosterOrientedLayout hasTopEdgeContact](self, "hasTopEdgeContact"), 0, v112, recta, v94, v96, v98, v100, *(_QWORD *)&v115, *(_QWORD *)&v120, *(_QWORD *)&v113, *(_QWORD *)&v110, *(_QWORD *)&v119, *(_QWORD *)&v122,
         *(_QWORD *)&v109,
         *(_QWORD *)&v117,
         *(_QWORD *)&v82,
         *(_QWORD *)&v84,
         *(_QWORD *)&v86,
         *(_QWORD *)&v88);

LABEL_58:
  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PFPosterOrientedLayout imageSize](self, "imageSize");
  v6 = v5;
  -[PFPosterOrientedLayout imageSize](self, "imageSize");
  v8 = v7;
  -[PFPosterOrientedLayout deviceResolution](self, "deviceResolution");
  v10 = v9;
  -[PFPosterOrientedLayout deviceResolution](self, "deviceResolution");
  v12 = v11;
  -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
  v14 = v13;
  -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
  v16 = v15;
  -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
  v18 = v17;
  -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
  v20 = v19;
  -[PFPosterOrientedLayout clockLayerOrder](self, "clockLayerOrder");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p img:%.0fx%.0f res:%.0fx%.0f vis:%.0f,%.0f %.0fx%.0f clock:%@>"), v4, self, v6, v8, v10, v12, v14, v16, v18, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PFPosterOrientedLayout imageSize](self, "imageSize");
  v43 = v5;
  -[PFPosterOrientedLayout imageSize](self, "imageSize");
  v42 = v6;
  -[PFPosterOrientedLayout deviceResolution](self, "deviceResolution");
  v41 = v7;
  -[PFPosterOrientedLayout deviceResolution](self, "deviceResolution");
  v40 = v8;
  -[PFPosterOrientedLayout parallaxPadding](self, "parallaxPadding");
  v39 = v9;
  -[PFPosterOrientedLayout parallaxPadding](self, "parallaxPadding");
  v38 = v10;
  -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
  v37 = v11;
  -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
  v36 = v12;
  -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
  v35 = v13;
  -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
  v34 = v14;
  -[PFPosterOrientedLayout inactiveFrame](self, "inactiveFrame");
  v16 = v15;
  -[PFPosterOrientedLayout inactiveFrame](self, "inactiveFrame");
  v18 = v17;
  -[PFPosterOrientedLayout inactiveFrame](self, "inactiveFrame");
  v20 = v19;
  -[PFPosterOrientedLayout inactiveFrame](self, "inactiveFrame");
  v22 = v21;
  -[PFPosterOrientedLayout timeFrame](self, "timeFrame");
  v24 = v23;
  -[PFPosterOrientedLayout timeFrame](self, "timeFrame");
  v26 = v25;
  -[PFPosterOrientedLayout timeFrame](self, "timeFrame");
  v28 = v27;
  -[PFPosterOrientedLayout timeFrame](self, "timeFrame");
  v30 = v29;
  -[PFPosterOrientedLayout clockLayerOrder](self, "clockLayerOrder");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> img:%.0fx%.0f res:%.0fx%.0f pad:%.0fx%.0fx vis:%.0f,%.0f %.0fx%.0f inact:%.0f,%.0f %.0fx%.0f time:%.0f,%.0f %.0fx%.0f clock:%@"), v4, self, v43, v42, v41, v40, v39, v38, v37, v36, v35, v34, v16, v18, v20, v22,
    v24,
    v26,
    v28,
    v30,
    v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (BOOL)canApplyParallax
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  _BOOL4 v35;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PFPosterOrientedLayout parallaxPadding](self, "parallaxPadding");
  v12 = -v11;
  -[PFPosterOrientedLayout parallaxPadding](self, "parallaxPadding");
  v14 = -v13;
  v37.origin.x = v4;
  v37.origin.y = v6;
  v37.size.width = v8;
  v37.size.height = v10;
  v38 = CGRectInset(v37, v12, v14);
  x = v38.origin.x;
  y = v38.origin.y;
  width = v38.size.width;
  height = v38.size.height;
  -[PFPosterOrientedLayout parallaxPadding](self, "parallaxPadding");
  v20 = v19;
  -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
  v22 = v20 / v21;
  -[PFPosterOrientedLayout parallaxPadding](self, "parallaxPadding");
  v24 = v23;
  -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
  v26 = v24 / v25;
  -[PFPosterOrientedLayout inactiveFrame](self, "inactiveFrame");
  v28 = v27;
  -[PFPosterOrientedLayout inactiveFrame](self, "inactiveFrame");
  v30 = v29;
  -[PFPosterOrientedLayout inactiveFrame](self, "inactiveFrame");
  v40 = CGRectInset(v39, -(v28 * v22), -(v30 * v26));
  v31 = v40.origin.x;
  v32 = v40.origin.y;
  v33 = v40.size.width;
  v34 = v40.size.height;
  -[PFPosterOrientedLayout imageExtent](self, "imageExtent");
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  v35 = CGRectContainsRect(v41, v43);
  if (v35)
  {
    -[PFPosterOrientedLayout imageExtent](self, "imageExtent");
    v44.origin.x = v31;
    v44.origin.y = v32;
    v44.size.width = v33;
    v44.size.height = v34;
    LOBYTE(v35) = CGRectContainsRect(v42, v44);
  }
  return v35;
}

- (BOOL)isUsingHeadroom
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
  v4 = v3;
  -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
  v6 = v4 + v5;
  -[PFPosterOrientedLayout imageSize](self, "imageSize");
  return v6 - v7 > 0.0;
}

- (id)dictionaryRepresentation
{
  id v3;
  CFDictionaryRef v4;
  CFDictionaryRef v5;
  CFDictionaryRef v6;
  CFDictionaryRef v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CFDictionaryRef v13;
  CFDictionaryRef DictionaryRepresentation;
  _QWORD v16[8];
  _QWORD v17[9];
  CGSize v18;
  CGSize v19;
  CGSize v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v17[8] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  v16[0] = CFSTR("imageSize");
  -[PFPosterOrientedLayout imageSize](self, "imageSize");
  DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v18);
  v17[0] = DictionaryRepresentation;
  v16[1] = CFSTR("deviceResolution");
  -[PFPosterOrientedLayout deviceResolution](self, "deviceResolution");
  v4 = CGSizeCreateDictionaryRepresentation(v19);
  v17[1] = v4;
  v16[2] = CFSTR("visibleFrame");
  -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
  v5 = CGRectCreateDictionaryRepresentation(v21);
  v17[2] = v5;
  v16[3] = CFSTR("timeFrame");
  -[PFPosterOrientedLayout timeFrame](self, "timeFrame");
  v6 = CGRectCreateDictionaryRepresentation(v22);
  v17[3] = v6;
  v16[4] = CFSTR("parallaxPadding");
  -[PFPosterOrientedLayout parallaxPadding](self, "parallaxPadding");
  v7 = CGSizeCreateDictionaryRepresentation(v20);
  v17[4] = v7;
  v16[5] = CFSTR("clockLayerOrder");
  -[PFPosterOrientedLayout clockLayerOrder](self, "clockLayerOrder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v8;
  v16[6] = CFSTR("clockIntersection");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PFPosterOrientedLayout clockIntersection](self, "clockIntersection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v9;
  v16[7] = CFSTR("hasTopEdgeContact");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PFPosterOrientedLayout hasTopEdgeContact](self, "hasTopEdgeContact"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithDictionary:", v11);

  -[PFPosterOrientedLayout inactiveFrame](self, "inactiveFrame");
  if (!CGRectIsNull(v23))
  {
    -[PFPosterOrientedLayout inactiveFrame](self, "inactiveFrame");
    v13 = CGRectCreateDictionaryRepresentation(v24);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("inactiveFrame"));

  }
  return v12;
}

- (id)debugSwiftCode
{
  id v3;
  double v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __CFString *v34;
  __CFString *v35;
  const __CFString *v36;
  void *v37;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[PFPosterOrientedLayout imageSize](self, "imageSize");
  v5 = (int)v4;
  -[PFPosterOrientedLayout imageSize](self, "imageSize");
  objc_msgSend(v3, "appendFormat:", CFSTR("XCTAssertEqual(item.originalLayout.imageSize, CGSize(width: %d, height: %d), \"Bad original layout image size\")\n"), v5, (int)v6);
  -[PFPosterOrientedLayout deviceResolution](self, "deviceResolution");
  v8 = (int)v7;
  -[PFPosterOrientedLayout deviceResolution](self, "deviceResolution");
  objc_msgSend(v3, "appendFormat:", CFSTR("XCTAssertEqual(item.originalLayout.deviceResolution, CGSize(width: %d, height: %d), \"Bad original layout device resolution\")\n"), v8, (int)v9);
  -[PFPosterOrientedLayout parallaxPadding](self, "parallaxPadding");
  v11 = v10;
  -[PFPosterOrientedLayout parallaxPadding](self, "parallaxPadding");
  objc_msgSend(v3, "appendFormat:", CFSTR("XCTAssertEqual(item.originalLayout.parallaxPadding, CGSize(width: %.0f, height: %.0f), accuracy: 1.0, \"Bad original layout parallax padding\")\n"), v11, v12);
  -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
  v14 = v13;
  -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
  v16 = v15;
  -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
  v18 = v17;
  -[PFPosterOrientedLayout visibleFrame](self, "visibleFrame");
  objc_msgSend(v3, "appendFormat:", CFSTR("XCTAssertEqual(item.originalLayout.visibleFrame, CGRect(x: %.0f, y: %.0f, width: %.0f, height: %.0f), accuracy: 1.0, \"Bad original layout visibleFrame\")\n"), v14, v16, v18, v19);
  -[PFPosterOrientedLayout inactiveFrame](self, "inactiveFrame");
  v21 = v20;
  -[PFPosterOrientedLayout inactiveFrame](self, "inactiveFrame");
  v23 = v22;
  -[PFPosterOrientedLayout inactiveFrame](self, "inactiveFrame");
  v25 = v24;
  -[PFPosterOrientedLayout inactiveFrame](self, "inactiveFrame");
  objc_msgSend(v3, "appendFormat:", CFSTR("XCTAssertEqual(item.originalLayout.inactiveFrame, CGRect(x: %.0f, y: %.0f, width: %.0f, height: %.0f), accuracy: 1.0, \"Bad original layout inactiveFrame\")\n"), v21, v23, v25, v26);
  -[PFPosterOrientedLayout timeFrame](self, "timeFrame");
  v28 = v27;
  -[PFPosterOrientedLayout timeFrame](self, "timeFrame");
  v30 = v29;
  -[PFPosterOrientedLayout timeFrame](self, "timeFrame");
  v32 = v31;
  -[PFPosterOrientedLayout timeFrame](self, "timeFrame");
  objc_msgSend(v3, "appendFormat:", CFSTR("XCTAssertEqual(item.originalLayout.timeFrame, CGRect(x: %.0f, y: %.0f, width: %.0f, height: %.0f), accuracy: 1.0, \"Bad original layout timeFrame\")\n"), v28, v30, v32, v33);
  -[PFPosterOrientedLayout clockLayerOrder](self, "clockLayerOrder");
  v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v34 == CFSTR("ClockAboveForeground"))
  {
    v36 = CFSTR(".aboveForeground");
  }
  else
  {
    -[PFPosterOrientedLayout clockLayerOrder](self, "clockLayerOrder");
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v36 = CFSTR(".aboveBackground");
    if (v35 != CFSTR("ClockAboveBackground"))
      v36 = 0;
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("XCTAssertEqual(item.originalLayout.clockLayerOrder, %@, \"Bad original layout clock layer order\")\n"), v36);
  v37 = (void *)objc_msgSend(v3, "copy");

  return v37;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)deviceResolution
{
  double width;
  double height;
  CGSize result;

  width = self->_deviceResolution.width;
  height = self->_deviceResolution.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)parallaxPadding
{
  double width;
  double height;
  CGSize result;

  width = self->_parallaxPadding.width;
  height = self->_parallaxPadding.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGRect)visibleFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleFrame.origin.x;
  y = self->_visibleFrame.origin.y;
  width = self->_visibleFrame.size.width;
  height = self->_visibleFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)inactiveFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_inactiveFrame.origin.x;
  y = self->_inactiveFrame.origin.y;
  width = self->_inactiveFrame.size.width;
  height = self->_inactiveFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)timeFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_timeFrame.origin.x;
  y = self->_timeFrame.origin.y;
  width = self->_timeFrame.size.width;
  height = self->_timeFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSString)clockLayerOrder
{
  return self->_clockLayerOrder;
}

- (unint64_t)clockIntersection
{
  return self->_clockIntersection;
}

- (BOOL)hasTopEdgeContact
{
  return self->_hasTopEdgeContact;
}

- (NSArray)debugLayouts
{
  return self->_debugLayouts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugLayouts, 0);
  objc_storeStrong((id *)&self->_clockLayerOrder, 0);
}

+ (id)layoutWithDictionaryRepresentation:(id)a3
{
  id v3;
  CGSize v4;
  const __CFDictionary *v5;
  _BOOL4 v6;
  const __CFDictionary *v7;
  _BOOL4 v8;
  const __CFDictionary *v9;
  _BOOL4 v10;
  const __CFDictionary *v11;
  BOOL v12;
  const __CFDictionary *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const __CFDictionary *v19;
  void *v20;
  uint64_t v21;
  _BOOL4 v22;
  CGFloat v23;
  PFPosterOrientedLayout *v24;
  PFPosterOrientedLayout *v25;
  CGSize v27;
  CGPoint origin;
  _BOOL4 v29;
  CGSize v30;
  _BOOL4 v31;
  uint8_t buf[16];
  CGSize v33;
  CGRect v34;
  CGRect v35;
  CGRect rect;
  CGSize v37;
  CGSize size;

  v3 = a3;
  v37 = (CGSize)*MEMORY[0x1E0C9D820];
  size = v37;
  v30 = v37;
  v4 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  rect.size = v4;
  v35.origin = rect.origin;
  v35.size = v4;
  v27 = v4;
  origin = rect.origin;
  v34.origin = rect.origin;
  v34.size = v4;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("imageSize"));
  v5 = (const __CFDictionary *)(id)objc_claimAutoreleasedReturnValue();
  v6 = !v5
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || !CGSizeMakeWithDictionaryRepresentation(v5, &size);
  v31 = v6;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("deviceResolution"));
  v7 = (const __CFDictionary *)(id)objc_claimAutoreleasedReturnValue();
  v8 = !v7
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || !CGSizeMakeWithDictionaryRepresentation(v7, &v37);
  v29 = v8;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("visibleFrame"));
  v9 = (const __CFDictionary *)(id)objc_claimAutoreleasedReturnValue();
  v10 = !v9
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
     || !CGRectMakeWithDictionaryRepresentation(v9, &rect);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("inactiveFrame"));
  v11 = (const __CFDictionary *)(id)objc_claimAutoreleasedReturnValue();
  v12 = v11
     && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     && CGRectMakeWithDictionaryRepresentation(v11, &v35);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("timeFrame"));
  v13 = (const __CFDictionary *)(id)objc_claimAutoreleasedReturnValue();
  v14 = !v13
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
     || !CGRectMakeWithDictionaryRepresentation(v13, &v34);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("clockLayerOrder"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PFParallaxLayoutClockLayerOrderNamed(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("clockIntersection"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "integerValue");

  v33 = v30;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("parallaxPadding"));
  v19 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hasTopEdgeContact"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "BOOLValue");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = CGSizeMakeWithDictionaryRepresentation(v19, &v33);
    if (v12)
      goto LABEL_29;
    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = v19 != 0;
    -[__CFDictionary doubleValue](v19, "doubleValue");
    v33.width = v23;
    v33.height = v23;
    if (v12)
      goto LABEL_29;
    goto LABEL_28;
  }
  v22 = 0;
  if (!v12)
  {
LABEL_28:
    v35.origin = origin;
    v35.size = v27;
  }
LABEL_29:
  if (v31 || v29 || v10 || v14 || !v22)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to read layout data", buf, 2u);
    }
    v25 = 0;
  }
  else
  {
    v24 = [PFPosterOrientedLayout alloc];
    v25 = -[PFPosterOrientedLayout initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:](v24, "initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:", v16, v18, v21, 0, size.width, size.height, v37.width, v37.height, v33.width, v33.height, *(_QWORD *)&rect.origin.x, *(_QWORD *)&rect.origin.y, *(_QWORD *)&rect.size.width, *(_QWORD *)&rect.size.height, *(_QWORD *)&v35.origin.x, *(_QWORD *)&v35.origin.y,
            *(_QWORD *)&v35.size.width,
            *(_QWORD *)&v35.size.height,
            *(_QWORD *)&v34.origin.x,
            *(_QWORD *)&v34.origin.y,
            *(_QWORD *)&v34.size.width,
            *(_QWORD *)&v34.size.height);
  }

  return v25;
}

@end
