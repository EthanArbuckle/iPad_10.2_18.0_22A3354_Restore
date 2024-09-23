@implementation CALayer(TSDAdditions)

- (uint64_t)setIfDifferentFrame:()TSDAdditions orTransform:
{
  __int128 v11;
  void *v12;
  uint64_t v13;
  uint64_t result;
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
  __int128 v29;
  __int128 v30;
  _OWORD v31[3];
  CGAffineTransform t2;
  CGAffineTransform t1;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CGRect v37;
  CGRect v38;

  if ((TSDRectHasNaNComponents() & 1) != 0
    || (v11 = a6[1], v34 = *a6, v35 = v11, v36 = a6[2], TSDTransformHasNaNComponents()))
  {
    v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CALayer(TSDAdditions) setIfDifferentFrame:orTransform:]");
    return objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CALayerAdditions.mm"), 74, CFSTR("Attempting to set frame or transform on layer with NaN values."));
  }
  else
  {
    objc_msgSend(a1, "anchorPoint");
    v17 = TSDPointFromNormalizedRect(v15, v16, a2, a3, a4);
    v19 = v18;
    v20 = TSDRectWithSize();
    v22 = v21;
    v24 = v23;
    v26 = v25;
    objc_msgSend(a1, "position");
    if (v28 != v17 || v27 != v19)
      objc_msgSend(a1, "setPosition:", v17, v19);
    objc_msgSend(a1, "bounds");
    v38.origin.x = v20;
    v38.origin.y = v22;
    v38.size.width = v24;
    v38.size.height = v26;
    if (!CGRectEqualToRect(v37, v38))
      objc_msgSend(a1, "setBounds:", v20, v22, v24, v26);
    if (a1)
      objc_msgSend(a1, "affineTransform");
    else
      memset(&t1, 0, sizeof(t1));
    v29 = a6[1];
    *(_OWORD *)&t2.a = *a6;
    *(_OWORD *)&t2.c = v29;
    *(_OWORD *)&t2.tx = a6[2];
    result = CGAffineTransformEqualToTransform(&t1, &t2);
    if ((result & 1) == 0)
    {
      v30 = a6[1];
      v31[0] = *a6;
      v31[1] = v30;
      v31[2] = a6[2];
      return objc_msgSend(a1, "setAffineTransform:", v31);
    }
  }
  return result;
}

- (id)layerByAddingReflectionWithHeight:()TSDAdditions startOpacity:
{
  void *v7;
  uint64_t v8;
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
  CGImage *v20;
  CGContext *v21;
  CGContext *v22;
  uint64_t v23;
  char *Data;
  size_t BytesPerRow;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  char *v32;
  uint64_t v33;
  CGImage *Image;
  void *v35;
  CGRect v36;
  CGRect v37;

  if (a2 < 0.0 || a2 > 1.0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CALayer(TSDAdditions) layerByAddingReflectionWithHeight:startOpacity:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CALayerAdditions.mm"), 94, CFSTR("Height should be in unit coordinate space [0,1]!"));
  }
  if (a2 == 0.0)
    return (id)objc_msgSend(a1, "copy");
  objc_msgSend(a1, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16 * a2;
  v18 = (double)(uint64_t)(v16 * a2);
  v19 = v16 + v18;
  v20 = (CGImage *)objc_msgSend(a1, "newRasterizedImageRef");
  v21 = TSDBitmapContextCreate(3, v15);
  if (v21)
  {
    v22 = v21;
    v23 = (uint64_t)v17;
    CGContextTranslateCTM(v21, 0.0, v18);
    objc_msgSend(a1, "bounds");
    CGContextDrawImage(v22, v36, v20);
    CGContextScaleCTM(v22, 1.0, -1.0);
    objc_msgSend(a1, "bounds");
    CGContextDrawImage(v22, v37, v20);
    Data = (char *)CGBitmapContextGetData(v22);
    BytesPerRow = CGBitmapContextGetBytesPerRow(v22);
    v26 = (uint64_t)v17 - 1;
    if ((uint64_t)v17 >= 1)
    {
      v27 = BytesPerRow;
      v28 = 0;
      do
      {
        v29 = pow((double)(v26 - v28) / (double)v26, 1.8);
        objc_msgSend(a1, "frame");
        if (v27 >= 1)
        {
          v31 = v30 + (double)v28;
          v32 = &Data[v27 * (uint64_t)v31];
          v33 = v27;
          do
          {
            LOBYTE(v31) = *v32;
            v31 = v29 * a3 * (double)*(unint64_t *)&v31;
            *v32++ = (int)v31;
            --v33;
          }
          while (v33);
        }
        ++v28;
      }
      while (v28 != v23);
    }
    Image = CGBitmapContextCreateImage(v22);
    CGContextRelease(v22);
  }
  else
  {
    Image = 0;
  }
  CGImageRelease(v20);
  v35 = (void *)objc_msgSend(MEMORY[0x24BDE56D0], "layer");
  objc_msgSend(v35, "setFrame:", v11, v13, v15, v19);
  objc_msgSend(v35, "setContents:", Image);
  CGImageRelease(Image);
  return v35;
}

- (uint64_t)addReflectionSubLayerWithHeight:()TSDAdditions startOpacity:
{
  void *v5;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  size_t v30;
  size_t v31;
  size_t v32;
  void *v33;
  CGColorSpace *DeviceRGB;
  CGContext *v35;
  CGImage *v36;
  uint64_t v37;
  _BYTE *v38;
  double v39;
  double v40;
  double v41;
  _BYTE *v42;
  size_t v43;
  CGImage *Image;
  double MidX;
  double MaxY;
  double v47;
  double v48;
  double v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  v5 = (void *)result;
  if (a2 < 0.0 || a2 > 1.0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CALayer(TSDAdditions) addReflectionSubLayerWithHeight:startOpacity:]");
    result = objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CALayerAdditions.mm"), 150, CFSTR("Height should be in unit coordinate space [0,1]!"));
  }
  if (a2 != 0.0)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    objc_msgSend(v5, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v5, "contentsRect");
    v48 = v18;
    v49 = v19;
    v50.origin.x = v11;
    v50.origin.y = v13;
    v50.size.width = v15;
    v50.size.height = v17;
    CGRectGetMinX(v50);
    v51.origin.x = v11;
    v51.origin.y = v13;
    v51.size.width = v15;
    v51.size.height = v17;
    CGRectGetMaxX(v51);
    TSUMix();
    v21 = v20;
    v52.origin.x = v11;
    v52.origin.y = v13;
    v52.size.width = v15;
    v52.size.height = v17;
    CGRectGetMinY(v52);
    v53.origin.x = v11;
    v53.origin.y = v13;
    v53.size.width = v15;
    v53.size.height = v17;
    CGRectGetMaxY(v53);
    TSUMix();
    v23 = TSDRoundedRect(v21, v22, v15 * v49, v17 * v48 * a2);
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v30 = (unint64_t)v28;
    v31 = (unint64_t)v26;
    v32 = 4 * (unint64_t)v26;
    v33 = malloc_type_calloc(v32, (unint64_t)v28, 0x1DE55C1FuLL);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v35 = CGBitmapContextCreate(v33, v31, v30, 8uLL, v32, DeviceRGB, 2u);
    CGColorSpaceRelease(DeviceRGB);
    CGContextTranslateCTM(v35, 0.0, (double)(unint64_t)v29);
    CGContextScaleCTM(v35, 1.0, -1.0);
    v36 = (CGImage *)objc_msgSend(v5, "contents");
    objc_msgSend(v5, "frame");
    CGContextDrawImage(v35, v54, v36);
    if (v30)
    {
      v37 = 0;
      v38 = v33;
      do
      {
        v39 = pow((double)(v30 - 1 - v37) / (double)(v30 - 1), 1.8);
        if (v32)
        {
          v41 = v39 * a3;
          v42 = v38;
          v43 = v32;
          do
          {
            LOBYTE(v40) = *v42;
            v40 = v41 * (double)*(unint64_t *)&v40;
            *v42++ = (int)v40;
            --v43;
          }
          while (v43);
        }
        ++v37;
        v38 += v32;
      }
      while (v37 != v30);
    }
    Image = CGBitmapContextCreateImage(v35);
    objc_msgSend(v9, "setContents:", Image);
    CGImageRelease(Image);
    CGContextRelease(v35);
    free(v33);
    objc_msgSend(v9, "setFrame:", v23, v25, v27, v29);
    objc_msgSend(v5, "bounds");
    MidX = CGRectGetMidX(v55);
    objc_msgSend(v5, "bounds");
    MaxY = CGRectGetMaxY(v56);
    objc_msgSend(v9, "frame");
    objc_msgSend(v9, "setPosition:", MidX, MaxY + v47 * 0.5);
    objc_msgSend(v9, "setName:", objc_msgSend((id)objc_msgSend(v5, "name"), "stringByAppendingString:", CFSTR("-reflection")));
    objc_msgSend(v5, "addSublayer:", v9);
    return objc_msgSend(v5, "setShouldRasterize:", 1);
  }
  return result;
}

- (double)p_perspectiveZDistanceUsingSize:()TSDAdditions
{
  if (a1 >= a2)
    a1 = a2;
  return a1 * 2.64490471;
}

- (uint64_t)addPerspectiveProjection
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _OWORD v11[8];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  objc_msgSend(v2, "scale");
  v8 = v7;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  if (a1)
    objc_msgSend(a1, "transform");
  objc_msgSend(a1, "p_perspectiveZDistanceUsingSize:", TSDMultiplySizeScalar(v4, v6, v8));
  *((double *)&v17 + 1) = -1.0 / v9;
  v11[6] = v18;
  v11[7] = v19;
  v11[0] = v12;
  v11[1] = v13;
  v11[2] = v14;
  v11[3] = v15;
  v11[4] = v16;
  v11[5] = v17;
  return objc_msgSend(a1, "setTransform:", v11);
}

- (uint64_t)addPerspectiveSublayerProjectionUsingScreenSize:()TSDAdditions
{
  double v6;
  _OWORD v8[8];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  if (a1)
    objc_msgSend(a1, "sublayerTransform");
  objc_msgSend(a1, "p_perspectiveZDistanceUsingSize:", a2, a3);
  *((double *)&v14 + 1) = -1.0 / v6;
  v8[6] = v15;
  v8[7] = v16;
  v8[0] = v9;
  v8[1] = v10;
  v8[2] = v11;
  v8[3] = v12;
  v8[4] = v13;
  v8[5] = v14;
  return objc_msgSend(a1, "setSublayerTransform:", v8);
}

- (double)durationOfAllAnimations
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = (void *)objc_msgSend(a1, "animationKeys", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v3)
    return 0.0;
  v4 = v3;
  v5 = *(_QWORD *)v15;
  v6 = 0.0;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v15 != v5)
        objc_enumerationMutation(v2);
      v8 = (void *)objc_msgSend(a1, "animationForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
      objc_msgSend(v8, "beginTime");
      v10 = v9;
      objc_msgSend(v8, "duration");
      v12 = v10 + v11;
      if (v6 <= v12)
        v6 = v12;
    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  }
  while (v4);
  return v6;
}

- (uint64_t)removeAllAnimationsOnLayerTree
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "removeAllAnimations");
  result = objc_msgSend(a1, "sublayers");
  if (result)
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v3 = (void *)objc_msgSend(a1, "sublayers", 0);
    result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "removeAllAnimationsOnLayerTree");
        }
        while (v4 != v6);
        result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (CGFloat)transform3DByApplyingAnimation:()TSDAdditions atTime:offset:parentFrame:animationCache:
{
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  int v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  int v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
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
  __int128 *v80;
  double v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  int v86;
  double v87;
  double v88;
  double v89;
  double v90;
  __int128 v91;
  __int128 v92;
  double v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  double v147;
  CGFloat v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  CGFloat v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  CGFloat result;
  __int128 v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  CGFloat v185;
  double v186;
  double v187;
  CGFloat v188;
  CGFloat v189;
  double v191;
  double v192;
  double v193;
  double tz;
  CATransform3D v195;
  CATransform3D v196;
  CATransform3D v197;
  CATransform3D v198;
  CATransform3D v199;
  CATransform3D v200;
  CATransform3D v201;
  CATransform3D v202;
  CATransform3D v203;
  CATransform3D v204;
  CATransform3D v205;
  CATransform3D v206;
  CATransform3D v207;
  CATransform3D v208;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v211;
  CATransform3D v212;

  if ((void *)objc_msgSend(a3, "animation") != a2)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CALayer(TSDAdditions) transform3DByApplyingAnimation:atTime:offset:parentFrame:animationCache:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CALayerAdditions.mm"), 293, CFSTR("Animation is different from animationCache!"));
  }
  objc_msgSend(a3, "transformRotationXInitialValue");
  v14 = v13;
  objc_msgSend(a3, "transformRotationYInitialValue");
  v16 = v15;
  objc_msgSend(a3, "transformRotationZInitialValue");
  v18 = v17;
  if (objc_msgSend(a3, "transformRotationXAnimationExists"))
  {
    objc_msgSend(a3, "transformRotationXCachedValueAtTime:layer:animation:", a1, a2, a5);
    v14 = v19;
  }
  if (objc_msgSend(a3, "transformRotationYAnimationExists"))
  {
    objc_msgSend(a3, "transformRotationYCachedValueAtTime:layer:animation:", a1, a2, a5);
    v16 = v20;
  }
  if (objc_msgSend(a3, "transformRotationZAnimationExists"))
  {
    objc_msgSend(a3, "transformRotationZCachedValueAtTime:layer:animation:", a1, a2, a5);
    v18 = v21;
  }
  v188 = v16;
  v185 = v14;
  if (objc_msgSend(a3, "transformRotationAnimationExists"))
  {
    if (v18 != 0.0)
    {
      v22 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v23 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CALayer(TSDAdditions) transform3DByApplyingAnimation:atTime:offset:parentFrame:animationCache:]");
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CALayerAdditions.mm"), 313, CFSTR("Found multiple rotation animations!"));
    }
    objc_msgSend(a3, "transformRotationCachedValueAtTime:layer:animation:", a1, a2, a5);
    v18 = v24;
  }
  objc_msgSend(a3, "anchorPointInitialValue");
  v26 = v25;
  v28 = v27;
  v29 = (double *)MEMORY[0x24BDBEFB0];
  v30 = *MEMORY[0x24BDBEFB0];
  v31 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  if (objc_msgSend(a3, "anchorPointAnimationExists"))
  {
    objc_msgSend((id)objc_msgSend(a2, "TSD_valueForKeyPath:atTime:animationCache:", CFSTR("anchorPoint"), a3, a5), "CGPointValue");
    v26 = v32;
    v28 = v33;
    objc_msgSend(a3, "anchorPointInitialValue");
    v30 = TSDSubtractPoints(v26, v28, v34);
    v31 = -v35;
  }
  objc_msgSend(a3, "anchorPointZInitialValue");
  tz = v36;
  v37 = objc_msgSend(a3, "anchorPointZAnimationExists");
  v189 = v18;
  v187 = v30;
  v180 = v26;
  v181 = v28;
  if (v37)
  {
    objc_msgSend(a3, "anchorPointZCachedValueAtTime:layer:animation:", a1, a2, a5);
    tz = v38;
  }
  objc_msgSend(a3, "boundsInitialValue");
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v45 = *v29;
  v46 = v29[1];
  v47 = objc_msgSend(a3, "boundsAnimationExists");
  v48 = 1.0;
  v49 = 1.0;
  v191 = v44;
  v192 = v42;
  v193 = v42;
  if (v47)
  {
    objc_msgSend(a3, "boundsCachedValueAtTime:layer:animation:", a1, a2, a5, 1.0);
    v51 = v50;
    v53 = v52;
    v45 = TSDSubtractPoints(v54, v55, v40);
    v46 = v56;
    v193 = v51;
    v48 = v51 / v192;
    v49 = v53 / v191;
  }
  v57 = 1.0;
  v58 = 1.0;
  if (objc_msgSend(a3, "transformScaleXYAnimationExists", *(_QWORD *)&v48, *(_QWORD *)&v49))
  {
    objc_msgSend(a3, "transformScaleXYCachedValueAtTime:layer:animation:", a1, a2, a5);
    v58 = TSDMultiplySizeScalar(1.0, 1.0, v59);
    v57 = v60;
  }
  if (objc_msgSend(a3, "transformScaleXAnimationExists"))
  {
    objc_msgSend(a3, "transformScaleXCachedValueAtTime:layer:animation:", a1, a2, a5);
    v58 = v58 * v61;
  }
  v186 = v31;
  v183 = v46;
  if (objc_msgSend(a3, "transformScaleYAnimationExists"))
  {
    objc_msgSend(a3, "transformScaleYCachedValueAtTime:layer:animation:", a1, a2, a5);
    v57 = v57 * v62;
  }
  v63 = *v29;
  v64 = v29[1];
  if (objc_msgSend(a3, "positionAnimationExists"))
  {
    objc_msgSend(a3, "positionInitialValue");
    v66 = v65;
    objc_msgSend(a3, "positionCachedValueAtTime:layer:animation:", a1, a2, a5);
    v63 = TSDSubtractPoints(v67, v68, v66);
    v64 = v69;
  }
  v184 = v45;
  v70 = 0.0;
  if (objc_msgSend(a3, "zPositionAnimationExists"))
  {
    objc_msgSend(a3, "zPositionInitialValue");
    v72 = v71;
    objc_msgSend(a3, "zPositionCachedValueAtTime:layer:animation:", a1, a2, a5);
    v70 = v73 - v72;
  }
  objc_msgSend(a3, "transformTranslationInitialValue");
  v75 = v74;
  if (objc_msgSend(a3, "transformTranslationAnimationExists"))
  {
    objc_msgSend(a3, "transformTranslationCachedValueAtTime:layer:animation:", a1, a2, a5);
    v75 = v76;
  }
  v77 = TSDAddPoints(v63, v64, v75);
  if (objc_msgSend(a3, "transformTranslationXAnimationExists"))
  {
    objc_msgSend(a3, "transformTranslationXCachedValueAtTime:layer:animation:", a1, a2, a5);
    v77 = v77 + v78;
  }
  if (objc_msgSend(a3, "transformTranslationYAnimationExists"))
    objc_msgSend(a3, "transformTranslationYCachedValueAtTime:layer:animation:", a1, a2, a5);
  if (objc_msgSend(a3, "transformTranslationZAnimationExists"))
  {
    objc_msgSend(a3, "transformTranslationZCachedValueAtTime:layer:animation:", a1, a2, a5);
    v70 = v70 + v79;
  }
  v80 = (__int128 *)MEMORY[0x24BDE5598];
  v81 = 1.0 - v181;
  v82 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  *(_OWORD *)&v212.m31 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  *(_OWORD *)&v212.m33 = v82;
  v83 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  *(_OWORD *)&v212.m41 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  *(_OWORD *)&v212.m43 = v83;
  v84 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  *(_OWORD *)&v212.m11 = *MEMORY[0x24BDE5598];
  *(_OWORD *)&v212.m13 = v84;
  v85 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  *(_OWORD *)&v212.m21 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  *(_OWORD *)&v212.m23 = v85;
  v86 = objc_msgSend(a3, "transformAnimationExists");
  if (v86)
  {
    if (a3)
      objc_msgSend(a3, "transformCachedValueAtTime:layer:animation:", a1, a2, a5);
    else
      memset(&v211, 0, sizeof(v211));
    v212 = v211;
  }
  v182 = v77;
  v87 = TSDMultiplyPointBySize(v180, v81, v192);
  v89 = v88;
  v90 = v178 * v58;
  v92 = v80[4];
  v91 = v80[5];
  v93 = v179 * v57;
  v94 = v80[3];
  a4[4] = v92;
  a4[5] = v91;
  v96 = v80[6];
  v95 = v80[7];
  v97 = v80[5];
  a4[6] = v96;
  a4[7] = v95;
  v98 = v80[1];
  v99 = *v80;
  v100 = v98;
  *a4 = *v80;
  a4[1] = v98;
  v102 = v80[2];
  v101 = v80[3];
  a4[2] = v102;
  a4[3] = v101;
  *(_OWORD *)&a.m43 = v80[7];
  *(_OWORD *)&a.m41 = v96;
  *(_OWORD *)&a.m33 = v97;
  *(_OWORD *)&a.m31 = v92;
  *(_OWORD *)&a.m23 = v94;
  *(_OWORD *)&a.m21 = v102;
  *(_OWORD *)&a.m13 = v100;
  *(_OWORD *)&a.m11 = v99;
  CATransform3DMakeTranslation(&b, -v87, -v89, -tz);
  CATransform3DConcat(&v211, &a, &b);
  v103 = *(_OWORD *)&v211.m33;
  a4[4] = *(_OWORD *)&v211.m31;
  a4[5] = v103;
  v104 = *(_OWORD *)&v211.m43;
  a4[6] = *(_OWORD *)&v211.m41;
  a4[7] = v104;
  v105 = *(_OWORD *)&v211.m13;
  *a4 = *(_OWORD *)&v211.m11;
  a4[1] = v105;
  v106 = *(_OWORD *)&v211.m23;
  a4[2] = *(_OWORD *)&v211.m21;
  a4[3] = v106;
  if (v90 != *MEMORY[0x24BDBF148] || v93 != *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    v107 = a4[5];
    *(_OWORD *)&v208.m31 = a4[4];
    *(_OWORD *)&v208.m33 = v107;
    v108 = a4[7];
    *(_OWORD *)&v208.m41 = a4[6];
    *(_OWORD *)&v208.m43 = v108;
    v109 = a4[1];
    *(_OWORD *)&v208.m11 = *a4;
    *(_OWORD *)&v208.m13 = v109;
    v110 = a4[3];
    *(_OWORD *)&v208.m21 = a4[2];
    *(_OWORD *)&v208.m23 = v110;
    CATransform3DMakeScale(&v207, v90, v93, 1.0);
    CATransform3DConcat(&v211, &v208, &v207);
    v111 = *(_OWORD *)&v211.m33;
    a4[4] = *(_OWORD *)&v211.m31;
    a4[5] = v111;
    v112 = *(_OWORD *)&v211.m43;
    a4[6] = *(_OWORD *)&v211.m41;
    a4[7] = v112;
    v113 = *(_OWORD *)&v211.m13;
    *a4 = *(_OWORD *)&v211.m11;
    a4[1] = v113;
    v114 = *(_OWORD *)&v211.m23;
    a4[2] = *(_OWORD *)&v211.m21;
    a4[3] = v114;
  }
  if (v185 != 0.0)
  {
    v115 = a4[5];
    *(_OWORD *)&v206.m31 = a4[4];
    *(_OWORD *)&v206.m33 = v115;
    v116 = a4[7];
    *(_OWORD *)&v206.m41 = a4[6];
    *(_OWORD *)&v206.m43 = v116;
    v117 = a4[1];
    *(_OWORD *)&v206.m11 = *a4;
    *(_OWORD *)&v206.m13 = v117;
    v118 = a4[3];
    *(_OWORD *)&v206.m21 = a4[2];
    *(_OWORD *)&v206.m23 = v118;
    CATransform3DMakeRotation(&v205, v185, -1.0, 0.0, 0.0);
    CATransform3DConcat(&v211, &v206, &v205);
    v119 = *(_OWORD *)&v211.m33;
    a4[4] = *(_OWORD *)&v211.m31;
    a4[5] = v119;
    v120 = *(_OWORD *)&v211.m43;
    a4[6] = *(_OWORD *)&v211.m41;
    a4[7] = v120;
    v121 = *(_OWORD *)&v211.m13;
    *a4 = *(_OWORD *)&v211.m11;
    a4[1] = v121;
    v122 = *(_OWORD *)&v211.m23;
    a4[2] = *(_OWORD *)&v211.m21;
    a4[3] = v122;
  }
  if (v188 != 0.0)
  {
    v123 = a4[5];
    *(_OWORD *)&v204.m31 = a4[4];
    *(_OWORD *)&v204.m33 = v123;
    v124 = a4[7];
    *(_OWORD *)&v204.m41 = a4[6];
    *(_OWORD *)&v204.m43 = v124;
    v125 = a4[1];
    *(_OWORD *)&v204.m11 = *a4;
    *(_OWORD *)&v204.m13 = v125;
    v126 = a4[3];
    *(_OWORD *)&v204.m21 = a4[2];
    *(_OWORD *)&v204.m23 = v126;
    CATransform3DMakeRotation(&v203, v188, 0.0, 1.0, 0.0);
    CATransform3DConcat(&v211, &v204, &v203);
    v127 = *(_OWORD *)&v211.m33;
    a4[4] = *(_OWORD *)&v211.m31;
    a4[5] = v127;
    v128 = *(_OWORD *)&v211.m43;
    a4[6] = *(_OWORD *)&v211.m41;
    a4[7] = v128;
    v129 = *(_OWORD *)&v211.m13;
    *a4 = *(_OWORD *)&v211.m11;
    a4[1] = v129;
    v130 = *(_OWORD *)&v211.m23;
    a4[2] = *(_OWORD *)&v211.m21;
    a4[3] = v130;
  }
  if (v189 != 0.0)
  {
    v131 = a4[5];
    *(_OWORD *)&v202.m31 = a4[4];
    *(_OWORD *)&v202.m33 = v131;
    v132 = a4[7];
    *(_OWORD *)&v202.m41 = a4[6];
    *(_OWORD *)&v202.m43 = v132;
    v133 = a4[1];
    *(_OWORD *)&v202.m11 = *a4;
    *(_OWORD *)&v202.m13 = v133;
    v134 = a4[3];
    *(_OWORD *)&v202.m21 = a4[2];
    *(_OWORD *)&v202.m23 = v134;
    CATransform3DMakeRotation(&v201, v189, 0.0, 0.0, -1.0);
    CATransform3DConcat(&v211, &v202, &v201);
    v135 = *(_OWORD *)&v211.m33;
    a4[4] = *(_OWORD *)&v211.m31;
    a4[5] = v135;
    v136 = *(_OWORD *)&v211.m43;
    a4[6] = *(_OWORD *)&v211.m41;
    a4[7] = v136;
    v137 = *(_OWORD *)&v211.m13;
    *a4 = *(_OWORD *)&v211.m11;
    a4[1] = v137;
    v138 = *(_OWORD *)&v211.m23;
    a4[2] = *(_OWORD *)&v211.m21;
    a4[3] = v138;
  }
  if (v86)
  {
    v139 = a4[5];
    *(_OWORD *)&v200.m31 = a4[4];
    *(_OWORD *)&v200.m33 = v139;
    v140 = a4[7];
    *(_OWORD *)&v200.m41 = a4[6];
    *(_OWORD *)&v200.m43 = v140;
    v141 = a4[1];
    *(_OWORD *)&v200.m11 = *a4;
    *(_OWORD *)&v200.m13 = v141;
    v142 = a4[3];
    *(_OWORD *)&v200.m21 = a4[2];
    *(_OWORD *)&v200.m23 = v142;
    v199 = v212;
    CATransform3DConcat(&v211, &v200, &v199);
    v143 = *(_OWORD *)&v211.m33;
    a4[4] = *(_OWORD *)&v211.m31;
    a4[5] = v143;
    v144 = *(_OWORD *)&v211.m43;
    a4[6] = *(_OWORD *)&v211.m41;
    a4[7] = v144;
    v145 = *(_OWORD *)&v211.m13;
    *a4 = *(_OWORD *)&v211.m11;
    a4[1] = v145;
    v146 = *(_OWORD *)&v211.m23;
    a4[2] = *(_OWORD *)&v211.m21;
    a4[3] = v146;
  }
  v147 = 0.0;
  if (v37)
    v147 = -tz;
  v148 = v147 + v70;
  v149 = TSDMultiplyPointScalar(v187, v186, -1.0);
  v151 = TSDMultiplyPointBySize(v149, v150, v193);
  v152 = TSDAddPoints(v184, v183, v151);
  v154 = TSDAddPoints(v152, v153, a6);
  v156 = TSDAddPoints(v154, v155, v182);
  v158 = v157;
  v159 = a4[5];
  *(_OWORD *)&v198.m31 = a4[4];
  *(_OWORD *)&v198.m33 = v159;
  v160 = a4[7];
  *(_OWORD *)&v198.m41 = a4[6];
  *(_OWORD *)&v198.m43 = v160;
  v161 = a4[1];
  *(_OWORD *)&v198.m11 = *a4;
  *(_OWORD *)&v198.m13 = v161;
  v162 = a4[3];
  *(_OWORD *)&v198.m21 = a4[2];
  *(_OWORD *)&v198.m23 = v162;
  CATransform3DMakeTranslation(&v197, v87, v89, tz);
  CATransform3DConcat(&v211, &v198, &v197);
  v163 = *(_OWORD *)&v211.m33;
  a4[4] = *(_OWORD *)&v211.m31;
  a4[5] = v163;
  v164 = *(_OWORD *)&v211.m43;
  a4[6] = *(_OWORD *)&v211.m41;
  a4[7] = v164;
  v165 = *(_OWORD *)&v211.m13;
  *a4 = *(_OWORD *)&v211.m11;
  a4[1] = v165;
  v166 = *(_OWORD *)&v211.m23;
  a4[2] = *(_OWORD *)&v211.m21;
  a4[3] = v166;
  v167 = *a4;
  v168 = a4[1];
  v169 = a4[3];
  *(_OWORD *)&v196.m21 = a4[2];
  *(_OWORD *)&v196.m23 = v169;
  *(_OWORD *)&v196.m11 = v167;
  *(_OWORD *)&v196.m13 = v168;
  v170 = a4[4];
  v171 = a4[5];
  v172 = a4[7];
  *(_OWORD *)&v196.m41 = a4[6];
  *(_OWORD *)&v196.m43 = v172;
  *(_OWORD *)&v196.m31 = v170;
  *(_OWORD *)&v196.m33 = v171;
  CATransform3DMakeTranslation(&v195, v156, v158, v148);
  CATransform3DConcat(&v211, &v196, &v195);
  v173 = *(_OWORD *)&v211.m33;
  a4[4] = *(_OWORD *)&v211.m31;
  a4[5] = v173;
  v174 = *(_OWORD *)&v211.m43;
  a4[6] = *(_OWORD *)&v211.m41;
  a4[7] = v174;
  v175 = *(_OWORD *)&v211.m13;
  *a4 = *(_OWORD *)&v211.m11;
  a4[1] = v175;
  result = v211.m21;
  v177 = *(_OWORD *)&v211.m23;
  a4[2] = *(_OWORD *)&v211.m21;
  a4[3] = v177;
  return result;
}

- (double)opacityByApplyingAnimation:()TSDAdditions atTime:animationCache:
{
  float v9;
  double result;

  objc_msgSend(a1, "opacity");
  if (!a4)
    return v9;
  objc_msgSend(a5, "opacityCachedValueAtTime:layer:animation:", a1, a4, a2);
  return result;
}

- (uint64_t)addJiggleAnimation
{
  return objc_msgSend(a1, "addJiggleAnimationWithDuration:angle:", 0.75, 0.628318531);
}

- (uint64_t)addJiggleAnimationWithDuration:()TSDAdditions angle:
{
  double v6;
  int v7;
  void *v8;
  int v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  double v21;
  double v22;

  objc_msgSend(a1, "removeJiggleAnimation");
  v22 = a2;
  v6 = a2 * 7.0;
  if (a2 * 7.0 < 1.0)
    v6 = 1.0;
  v7 = (int)v6;
  v8 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (v7 >= 1)
  {
    v9 = 0;
    v10 = (double)v7;
    v21 = 1.0 / (double)v7 * a2;
    v11 = v21 * 0.5;
    v12 = *MEMORY[0x24BDE5D20];
    v13 = 0.0;
    do
    {
      v14 = v13 / v10 * v22;
      v15 = (1.0 - v13 / v10) * a3;
      ++v9;
      v13 = v13 + 1.0;
      v16 = (1.0 - (double)v9 / v10) * a3;
      v17 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.rotation"), *(_QWORD *)&v21);
      objc_msgSend(v17, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15));
      objc_msgSend(v17, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (v15 + v16) * -0.5));
      objc_msgSend(v17, "setBeginTime:", v14);
      objc_msgSend(v17, "setDuration:", v11);
      objc_msgSend(v17, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v12));
      objc_msgSend(v8, "addObject:", v17);
      v18 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.rotation"));
      objc_msgSend(v18, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (v15 + v16) * -0.5));
      objc_msgSend(v18, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16));
      objc_msgSend(v18, "setBeginTime:", v14 + v21 * 0.5);
      objc_msgSend(v18, "setDuration:", v11);
      objc_msgSend(v18, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v12));
      objc_msgSend(v8, "addObject:", v18);
    }
    while (v7 != v9);
  }
  v19 = objc_alloc_init(MEMORY[0x24BDE5638]);
  objc_msgSend(v19, "setAnimations:", v8);
  objc_msgSend(v19, "setDuration:", v22);
  objc_msgSend(v19, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D30]));
  return objc_msgSend(a1, "addAnimation:forKey:", v19, CFSTR("kTSDJiggleAnimationKey"));
}

- (uint64_t)removeJiggleAnimation
{
  return objc_msgSend(a1, "removeAnimationForKey:", CFSTR("kTSDJiggleAnimationKey"));
}

- (uint64_t)addWaveAnimation
{
  return objc_msgSend(a1, "addWaveAnimationWithOffset:zPosition:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8), 0.0);
}

- (uint64_t)addWaveAnimationWithOffset:()TSDAdditions zPosition:
{
  return objc_msgSend(a1, "addWaveAnimationWithScale:offset:zPosition:", 0.0, a3, a4, a5);
}

- (uint64_t)addWaveAnimationWithScale:()TSDAdditions offset:zPosition:
{
  return objc_msgSend(a1, "addWaveAnimationWithScale:offset:zPosition:addPerspectiveProjection:", 1);
}

- (uint64_t)addWaveAnimationWithScale:()TSDAdditions offset:zPosition:addPerspectiveProjection:
{
  double v13;
  double v14;
  double v15;
  double v16;
  long double v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  double v41;
  id v42;

  objc_msgSend(a1, "removeWaveAnimation");
  if (a2 == 0.0)
    v13 = 0.2;
  else
    v13 = a2 + -1.0;
  v14 = v13 * 0.25;
  if (v13 * 0.0625 >= 0.0125)
    v15 = 0.0196349541;
  else
    v15 = v13 * 0.0625 * 1.57079633;
  if (a7)
    objc_msgSend(a1, "addPerspectiveProjection");
  v16 = v13 + v14;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE60], "date"), "timeIntervalSinceReferenceDate");
  v18 = 1.0 - fmod(v17, 1.0);
  v19 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v20 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  objc_msgSend(v20, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0));
  objc_msgSend(v20, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13 + v14));
  objc_msgSend(v20, "setDuration:", v18);
  v21 = *MEMORY[0x24BDE5D20];
  objc_msgSend(v20, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]));
  objc_msgSend(v20, "setAdditive:", 1);
  v22 = *MEMORY[0x24BDE5978];
  objc_msgSend(v20, "setFillMode:", *MEMORY[0x24BDE5978]);
  objc_msgSend(v19, "addObject:", v20);
  v23 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.rotation.x"));
  objc_msgSend(v23, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15));
  objc_msgSend(v23, "setDuration:", v18);
  objc_msgSend(v23, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v21));
  objc_msgSend(v19, "addObject:", v23);
  if (a3 != 0.0)
  {
    v24 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.translation.x"));
    objc_msgSend(v24, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3));
    objc_msgSend(v24, "setDuration:", v18);
    objc_msgSend(v24, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v21));
    objc_msgSend(v24, "setAdditive:", 1);
    objc_msgSend(v24, "setFillMode:", v22);
    objc_msgSend(v19, "addObject:", v24);
  }
  if (a4 != 0.0)
  {
    v25 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.translation.y"));
    objc_msgSend(v25, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4));
    objc_msgSend(v25, "setDuration:", v18);
    objc_msgSend(v25, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v21));
    objc_msgSend(v25, "setAdditive:", 1);
    objc_msgSend(v25, "setFillMode:", v22);
    objc_msgSend(v19, "addObject:", v25);
  }
  v26 = v13 - v14;
  if (a5 != 0.0)
  {
    v27 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("zPosition"));
    objc_msgSend(v27, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5));
    objc_msgSend(v27, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5));
    objc_msgSend(v27, "setDuration:", v18);
    objc_msgSend(v27, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v21));
    objc_msgSend(v19, "addObject:", v27);
  }
  v28 = objc_alloc_init(MEMORY[0x24BDE5638]);
  objc_msgSend(v28, "setAnimations:", v19);
  objc_msgSend(v28, "setDuration:", v18);
  v29 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v30 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  objc_msgSend(v30, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16));
  objc_msgSend(v30, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v26));
  objc_msgSend(v30, "setDuration:", 0.5);
  objc_msgSend(v30, "setBeginTime:", 0.0);
  objc_msgSend(v30, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v21));
  objc_msgSend(v30, "setAdditive:", 1);
  objc_msgSend(v29, "addObject:", v30);
  v31 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  objc_msgSend(v31, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v26));
  objc_msgSend(v31, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16));
  objc_msgSend(v31, "setDuration:", 0.5);
  objc_msgSend(v31, "setBeginTime:", 0.5);
  objc_msgSend(v31, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v21));
  objc_msgSend(v31, "setAdditive:", 1);
  objc_msgSend(v29, "addObject:", v31);
  v32 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.rotation.x"));
  objc_msgSend(v32, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -v15));
  objc_msgSend(v32, "setDuration:", 0.5);
  objc_msgSend(v32, "setBeginTime:", 0.0);
  objc_msgSend(v32, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v21));
  objc_msgSend(v29, "addObject:", v32);
  v33 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.rotation.x"));
  objc_msgSend(v33, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15));
  objc_msgSend(v33, "setDuration:", 0.5);
  objc_msgSend(v33, "setBeginTime:", 0.5);
  objc_msgSend(v33, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v21));
  objc_msgSend(v29, "addObject:", v33);
  v34 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.rotation.y"));
  objc_msgSend(v34, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15));
  objc_msgSend(v34, "setDuration:", 0.25);
  objc_msgSend(v34, "setBeginTime:", 0.0);
  objc_msgSend(v34, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]));
  objc_msgSend(v29, "addObject:", v34);
  v35 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.rotation.y"));
  objc_msgSend(v35, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -v15));
  objc_msgSend(v35, "setDuration:", 0.5);
  objc_msgSend(v35, "setBeginTime:", 0.25);
  objc_msgSend(v35, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v21));
  objc_msgSend(v29, "addObject:", v35);
  v36 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.rotation.y"));
  objc_msgSend(v36, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0));
  objc_msgSend(v36, "setDuration:", 0.25);
  objc_msgSend(v36, "setBeginTime:", 0.75);
  objc_msgSend(v36, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D18]));
  objc_msgSend(v29, "addObject:", v36);
  if (a3 != 0.0)
  {
    v37 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.translation.x"));
    objc_msgSend(v37, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3));
    objc_msgSend(v37, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3));
    objc_msgSend(v37, "setDuration:", 0.5);
    objc_msgSend(v37, "setFillMode:", v22);
    objc_msgSend(v37, "setAdditive:", 1);
    objc_msgSend(v29, "addObject:", v37);
  }
  if (a4 != 0.0)
  {
    v38 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.translation.y"));
    objc_msgSend(v38, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4));
    objc_msgSend(v38, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4));
    objc_msgSend(v38, "setDuration:", 0.5);
    objc_msgSend(v38, "setFillMode:", v22);
    objc_msgSend(v38, "setAdditive:", 1);
    objc_msgSend(v29, "addObject:", v38);
  }
  if (a5 != 0.0)
  {
    v39 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("zPosition"));
    objc_msgSend(v39, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5));
    objc_msgSend(v39, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5));
    objc_msgSend(v39, "setDuration:", 0.5);
    objc_msgSend(v39, "setFillMode:", v22);
    objc_msgSend(v29, "addObject:", v39);
  }
  v40 = objc_alloc_init(MEMORY[0x24BDE5638]);
  objc_msgSend(v40, "setAnimations:", v29);
  objc_msgSend(v40, "setDuration:", 1.0);
  LODWORD(v41) = 1176256512;
  objc_msgSend(v40, "setRepeatCount:", v41);
  objc_msgSend(v40, "setBeginTime:", v18);
  v42 = objc_alloc_init(MEMORY[0x24BDE5638]);
  objc_msgSend(v42, "setAnimations:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v28, v40, 0));
  objc_msgSend(v42, "setDuration:", 10000.0);
  return objc_msgSend(a1, "addAnimation:forKey:", v42, CFSTR("kTSDWaveAnimationKey"));
}

- (uint64_t)removeWaveAnimationAnimated:()TSDAdditions
{
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  if (!a3)
    return objc_msgSend(a1, "removeAnimationForKey:", CFSTR("kTSDWaveAnimationKey"));
  v4 = (void *)objc_msgSend(a1, "presentationLayer");
  objc_msgSend((id)objc_msgSend(v4, "valueForKeyPath:", CFSTR("transform.rotation")), "doubleValue");
  v6 = v5;
  objc_msgSend((id)objc_msgSend(v4, "valueForKeyPath:", CFSTR("transform.scale")), "doubleValue");
  v8 = v7;
  objc_msgSend((id)objc_msgSend(v4, "valueForKeyPath:", CFSTR("transform.scale")), "CGPointValue");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "zPosition");
  v14 = v13;
  v15 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale"));
  objc_msgSend(v15, "setDuration:", 0.25);
  objc_msgSend(v15, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8));
  objc_msgSend(v15, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.0));
  v16 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.rotation"));
  objc_msgSend(v16, "setDuration:", 0.25);
  objc_msgSend(v16, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6));
  objc_msgSend(v16, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0));
  v17 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.translation"));
  objc_msgSend(v17, "setDuration:", 0.25);
  objc_msgSend(v17, "setFromValue:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v10, v12));
  objc_msgSend(v17, "setToValue:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8)));
  v18 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("zPosition"));
  objc_msgSend(v18, "setDuration:", 0.25);
  objc_msgSend(v18, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14));
  objc_msgSend(v18, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14));
  v19 = objc_alloc_init(MEMORY[0x24BDE5638]);
  objc_msgSend(v19, "setAnimations:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v15, v16, v18, 0));
  objc_msgSend(a1, "removeAnimationForKey:", CFSTR("kTSDWaveAnimationKey"));
  return objc_msgSend(a1, "addAnimation:forKey:", v19, CFSTR("kTSDWaveAnimationKey"));
}

- (uint64_t)removeWaveAnimation
{
  return objc_msgSend(a1, "removeWaveAnimationAnimated:", 0);
}

- (uint64_t)addPulseAnimation
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  id v9;

  objc_msgSend(a1, "addPerspectiveProjection");
  v2 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  objc_msgSend(v2, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.25));
  objc_msgSend(v2, "setDuration:", 0.5);
  v3 = *MEMORY[0x24BDE5D20];
  objc_msgSend(v2, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]));
  v4 = objc_alloc_init(MEMORY[0x24BDE5638]);
  objc_msgSend(v4, "setAnimations:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v2, 0));
  objc_msgSend(v4, "setDuration:", 1.0);
  v5 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  objc_msgSend(v5, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.25));
  objc_msgSend(v5, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.15));
  objc_msgSend(v5, "setDuration:", 0.5);
  objc_msgSend(v5, "setBeginTime:", 0.0);
  objc_msgSend(v5, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v3));
  v6 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  objc_msgSend(v6, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.15));
  objc_msgSend(v6, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.25));
  objc_msgSend(v6, "setDuration:", 0.5);
  objc_msgSend(v6, "setBeginTime:", 0.5);
  objc_msgSend(v6, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v3));
  v7 = objc_alloc_init(MEMORY[0x24BDE5638]);
  objc_msgSend(v7, "setAnimations:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v5, v6, 0));
  objc_msgSend(v7, "setDuration:", 1.0);
  LODWORD(v8) = 1176256512;
  objc_msgSend(v7, "setRepeatCount:", v8);
  objc_msgSend(v7, "setBeginTime:", 0.5);
  v9 = objc_alloc_init(MEMORY[0x24BDE5638]);
  objc_msgSend(v9, "setAnimations:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v4, v7, 0));
  objc_msgSend(v9, "setDuration:", 10000.0);
  return objc_msgSend(a1, "addAnimation:forKey:", v9, CFSTR("kTSDPulseAnimationKey"));
}

- (uint64_t)removePulseAnimation
{
  void *v2;
  void *v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v5 = 0u;
  v6 = 0u;
  v2 = (void *)objc_msgSend(a1, "presentationLayer");
  if (v2)
  {
    objc_msgSend(v2, "transform");
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v5 = 0u;
    v6 = 0u;
  }
  v3 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform"), v5, v6, v7, v8, v9, v10, v11, v12);
  objc_msgSend(v3, "setDuration:", 0.2);
  objc_msgSend(v3, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0));
  objc_msgSend(v3, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.0));
  objc_msgSend(a1, "removeAnimationForKey:", CFSTR("kTSDPulseAnimationKey"));
  return objc_msgSend(a1, "addAnimation:forKey:", v3, CFSTR("kTSDPulseAnimationKey"));
}

- (uint64_t)addDragRotationAnimationWithDelta:()TSDAdditions
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  objc_msgSend(a1, "removeDragRotationAnimation");
  objc_msgSend(a1, "addPerspectiveProjection");
  v6 = TSDPointLength(a2, a3);
  v7 = TSDNormalizePoint(a2, a3);
  v9 = v8;
  if (v6 >= 25.0)
    v10 = 1.57079633;
  else
    v10 = v6 / 25.0 * 1.57079633;
  v11 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.rotation.x"));
  objc_msgSend(v11, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -(v9 * v10)));
  objc_msgSend(v11, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0));
  objc_msgSend(v11, "setDuration:", 0.025);
  v12 = *MEMORY[0x24BDE5D28];
  objc_msgSend(v11, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]));
  v13 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.rotation.y"));
  objc_msgSend(v13, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7 * v10));
  objc_msgSend(v13, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0));
  objc_msgSend(v13, "setDuration:", 0.025);
  objc_msgSend(v13, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v12));
  v14 = objc_alloc_init(MEMORY[0x24BDE5638]);
  objc_msgSend(v14, "setAnimations:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v11, v13, 0));
  objc_msgSend(v14, "setDuration:", 0.025);
  return objc_msgSend(a1, "addAnimation:forKey:", v14, CFSTR("kTSDDragRotationAnimationKey"));
}

- (uint64_t)removeDragRotationAnimation
{
  return objc_msgSend(a1, "removeAnimationForKey:", CFSTR("kTSDDragRotationAnimationKey"));
}

- (uint64_t)addFlipTransitionAnimationToLayer:()TSDAdditions
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;

  objc_msgSend(a1, "removeFlipTransitionAnimation");
  objc_msgSend(a3, "removeFlipTransitionAnimation");
  objc_msgSend(a1, "addPerspectiveProjection");
  objc_msgSend(a3, "addPerspectiveProjection");
  objc_msgSend(a1, "position");
  v6 = v5;
  objc_msgSend(a3, "position");
  v8 = v7;
  v9 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("position"));
  v12 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(a3, "position");
  objc_msgSend(v11, "setToValue:", objc_msgSend(v12, "valueWithCGPoint:"));
  objc_msgSend(v11, "setDuration:", 0.5);
  v13 = *MEMORY[0x24BDE5D20];
  objc_msgSend(v11, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]));
  objc_msgSend(v9, "addObject:", v11);
  v14 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("position"));
  v15 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(a1, "position");
  objc_msgSend(v14, "setFromValue:", objc_msgSend(v15, "valueWithCGPoint:"));
  objc_msgSend(v14, "setDuration:", 0.5);
  objc_msgSend(v14, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v13));
  objc_msgSend(v10, "addObject:", v14);
  objc_msgSend(a1, "frame");
  v17 = v16;
  objc_msgSend(a3, "frame");
  if (v17 <= v18)
    v19 = a3;
  else
    v19 = a1;
  objc_msgSend(v19, "frame");
  v21 = v20;
  if (v6 >= v8)
    v22 = -1.0;
  else
    v22 = 1.0;
  v23 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("zPosition"));
  objc_msgSend(v23, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v21));
  objc_msgSend(v23, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v21));
  objc_msgSend(v23, "setDuration:", 0.5);
  objc_msgSend(v23, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v13));
  objc_msgSend(v9, "addObject:", v23);
  v24 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("zPosition"));
  objc_msgSend(v24, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v21));
  objc_msgSend(v24, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v21));
  objc_msgSend(v24, "setDuration:", 0.5);
  objc_msgSend(v24, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v13));
  objc_msgSend(v10, "addObject:", v24);
  v25 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.rotation.y"));
  objc_msgSend(v25, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v22 * 3.14159265));
  objc_msgSend(v25, "setDuration:", 0.5);
  objc_msgSend(v25, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v13));
  objc_msgSend(v9, "addObject:", v25);
  v26 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.rotation.y"));
  objc_msgSend(v26, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v22 * -3.14159265));
  objc_msgSend(v26, "setDuration:", 0.5);
  objc_msgSend(v26, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v13));
  objc_msgSend(v10, "addObject:", v26);
  v27 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("hidden"));
  objc_msgSend(v27, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0));
  objc_msgSend(v27, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0));
  objc_msgSend(v27, "setDuration:", 0.25);
  objc_msgSend(v9, "addObject:", v27);
  v28 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("hidden"));
  objc_msgSend(v28, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1));
  objc_msgSend(v28, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1));
  objc_msgSend(v28, "setDuration:", 0.25);
  objc_msgSend(v28, "setBeginTime:", 0.25);
  objc_msgSend(v9, "addObject:", v28);
  v29 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("hidden"));
  objc_msgSend(v29, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1));
  objc_msgSend(v29, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1));
  objc_msgSend(v29, "setDuration:", 0.25);
  objc_msgSend(v10, "addObject:", v29);
  v30 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("hidden"));
  objc_msgSend(v30, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0));
  objc_msgSend(v30, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0));
  objc_msgSend(v30, "setDuration:", 0.25);
  objc_msgSend(v30, "setBeginTime:", 0.25);
  objc_msgSend(v10, "addObject:", v30);
  v31 = objc_alloc_init(MEMORY[0x24BDE5638]);
  objc_msgSend(v31, "setAnimations:", v9);
  objc_msgSend(v31, "setDuration:", 0.5);
  objc_msgSend(a1, "addAnimation:forKey:", v31, CFSTR("kTSDFlipTransitionAnimationKey"));
  v32 = objc_alloc_init(MEMORY[0x24BDE5638]);
  objc_msgSend(v32, "setAnimations:", v10);
  objc_msgSend(v32, "setDuration:", 0.5);
  return objc_msgSend(a3, "addAnimation:forKey:", v32, CFSTR("kTSDFlipTransitionAnimationKey"));
}

- (uint64_t)removeFlipTransitionAnimation
{
  return objc_msgSend(a1, "removeAnimationForKey:", CFSTR("kTSDFlipTransitionAnimationKey"));
}

- (uint64_t)addSproingAnimationFromPoint:()TSDAdditions
{
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  CGRect v26;
  CGRect v27;

  objc_msgSend(a1, "removeSproingAnimation");
  objc_msgSend(a1, "frame");
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  v10 = (a2 - CGRectGetMinX(v26)) / v26.size.width;
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  v11 = (a3 - CGRectGetMinY(v27)) / height;
  v12 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("anchorPoint"));
  v13 = objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v10, v11);
  objc_msgSend(v12, "setToValue:", v13);
  objc_msgSend(v12, "setFromValue:", v13);
  objc_msgSend(v12, "setDuration:", 1.0);
  objc_msgSend(a1, "anchorPoint");
  v15 = width * TSDSubtractPoints(v10, v11, v14);
  v17 = height * v16;
  v18 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("position"));
  v19 = objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v15, v17);
  objc_msgSend(v18, "setToValue:", v19);
  objc_msgSend(v18, "setFromValue:", v19);
  objc_msgSend(v18, "setDuration:", 0.2);
  objc_msgSend(v18, "setAdditive:", 1);
  v20 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  objc_msgSend(v20, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0));
  objc_msgSend(v20, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.05));
  objc_msgSend(v20, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]));
  objc_msgSend(v20, "setDuration:", 0.1);
  v21 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  objc_msgSend(v21, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.05));
  objc_msgSend(v21, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.95));
  v22 = *MEMORY[0x24BDE5D20];
  objc_msgSend(v21, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]));
  objc_msgSend(v21, "setBeginTime:", 0.1);
  objc_msgSend(v21, "setDuration:", 0.06);
  v23 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  objc_msgSend(v23, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.95));
  objc_msgSend(v23, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.0));
  objc_msgSend(v23, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v22));
  objc_msgSend(v23, "setBeginTime:", 0.16);
  objc_msgSend(v23, "setDuration:", 0.04);
  v24 = objc_alloc_init(MEMORY[0x24BDE5638]);
  objc_msgSend(v24, "setAnimations:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v12, v18, v20, v21, v23, 0));
  objc_msgSend(v24, "setDuration:", 0.2);
  return objc_msgSend(a1, "addAnimation:forKey:", v24, CFSTR("kTSDSproingAnimationKey"));
}

- (uint64_t)removeSproingAnimation
{
  return objc_msgSend(a1, "removeAnimationForKey:", CFSTR("kTSDSproingAnimationKey"));
}

- (uint64_t)addPopInAnimation:()TSDAdditions
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a1, "removePopInAnimation");
  v5 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  objc_msgSend(v5, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0));
  objc_msgSend(v5, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.0));
  objc_msgSend(v5, "setDuration:", 0.2);
  v6 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  objc_msgSend(v6, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0));
  objc_msgSend(v6, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.2));
  objc_msgSend(v6, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]));
  objc_msgSend(v6, "setDuration:", 0.16);
  v7 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  objc_msgSend(v7, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.2));
  objc_msgSend(v7, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.0));
  objc_msgSend(v7, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]));
  objc_msgSend(v7, "setBeginTime:", 0.16);
  objc_msgSend(v7, "setDuration:", 0.04);
  v8 = objc_alloc_init(MEMORY[0x24BDE5638]);
  objc_msgSend(v8, "setAnimations:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v5, v6, v7, 0));
  objc_msgSend(v8, "setDuration:", 0.2);
  objc_msgSend(v8, "setDelegate:", a3);
  return objc_msgSend(a1, "addAnimation:forKey:", v8, CFSTR("kTSDPopInAnimationKey"));
}

- (uint64_t)removePopInAnimation
{
  return objc_msgSend(a1, "removeAnimationForKey:", CFSTR("kTSDPopInAnimationKey"));
}

- (BOOL)hasPopInAnimation
{
  return objc_msgSend(a1, "animationForKey:", CFSTR("kTSDPopInAnimationKey")) != 0;
}

- (uint64_t)addPopOutAnimation:()TSDAdditions
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a1, "removePopOutAnimation");
  v5 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  objc_msgSend(v5, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.0));
  objc_msgSend(v5, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0));
  objc_msgSend(v5, "setDuration:", 0.2);
  v6 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  objc_msgSend(v6, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.0));
  objc_msgSend(v6, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.2));
  objc_msgSend(v6, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]));
  objc_msgSend(v6, "setDuration:", 0.04);
  v7 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  objc_msgSend(v7, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.2));
  objc_msgSend(v7, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0));
  objc_msgSend(v7, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]));
  objc_msgSend(v7, "setBeginTime:", 0.04);
  objc_msgSend(v7, "setDuration:", 0.16);
  v8 = objc_alloc_init(MEMORY[0x24BDE5638]);
  objc_msgSend(v8, "setAnimations:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v5, v6, v7, 0));
  objc_msgSend(v8, "setDuration:", 0.2);
  objc_msgSend(v8, "setDelegate:", a3);
  return objc_msgSend(a1, "addAnimation:forKey:", v8, CFSTR("kTSDPopOutAnimationKey"));
}

- (uint64_t)removePopOutAnimation
{
  return objc_msgSend(a1, "removeAnimationForKey:", CFSTR("kTSDPopOutAnimationKey"));
}

- (void)addDistortAnimationWithVector:()TSDAdditions
{
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
  void *v16;
  CATransform3D v17;
  CATransform3D v18;
  CATransform3D v19;
  CATransform3D v20;
  CATransform3D v21;
  CATransform3D v22;

  objc_msgSend(a1, "removeDistortAnimation");
  objc_msgSend(a1, "frame");
  v7 = v6;
  objc_msgSend(a1, "frame");
  v9 = v8;
  objc_msgSend(a1, "frame");
  if (v7 <= v9)
    v12 = v11;
  else
    v12 = v10;
  v13 = TSDDistance(*MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), a2, a3);
  v14 = v13 / v12 * (v13 / v12) * 8.0 + 1.0;
  if (v14 >= 1.001)
  {
    v15 = TSDAngleFromDelta(a2, a3);
    memset(&v22, 0, sizeof(v22));
    if (a1)
      objc_msgSend(a1, "transform");
    v20 = v22;
    CATransform3DRotate(&v21, &v20, v15, 0.0, 0.0, 1.0);
    v22 = v21;
    v19 = v21;
    CATransform3DScale(&v21, &v19, v14, 1.0 / v14, 1.0);
    v22 = v21;
    v18 = v21;
    CATransform3DRotate(&v21, &v18, -v15, 0.0, 0.0, 1.0);
    v22 = v21;
    v16 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform"));
    v17 = v22;
    objc_msgSend(v16, "setFromValue:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v17));
    objc_msgSend(v16, "setDuration:", 0.025);
    objc_msgSend(v16, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]));
    objc_msgSend(a1, "addAnimation:forKey:", v16, CFSTR("kTSDDistortAnimationKey"));
  }
}

- (uint64_t)removeDistortAnimation
{
  return objc_msgSend(a1, "removeAnimationForKey:", CFSTR("kTSDDistortAnimationKey"));
}

- (uint64_t)addRotateInAnimationWithDuration:()TSDAdditions delay:
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(a1, "removeRotateInAnimation");
  objc_msgSend(a1, "addPerspectiveProjection");
  v6 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  objc_msgSend(v6, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0));
  objc_msgSend(v6, "setBeginTime:", a3);
  objc_msgSend(v6, "setDuration:", a2);
  v7 = *MEMORY[0x24BDE5D28];
  objc_msgSend(v6, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]));
  v8 = *MEMORY[0x24BDE5970];
  objc_msgSend(v6, "setFillMode:", *MEMORY[0x24BDE5970]);
  v9 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.rotation.y"));
  objc_msgSend(v9, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v7));
  objc_msgSend(v9, "setBeginTime:", a3);
  objc_msgSend(v9, "setDuration:", a2);
  objc_msgSend(v9, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -1.57079633));
  v10 = objc_alloc_init(MEMORY[0x24BDE5638]);
  objc_msgSend(v10, "setAnimations:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v6, v9, 0));
  objc_msgSend(v10, "setDuration:", a2 + a3);
  objc_msgSend(v10, "setFillMode:", v8);
  return objc_msgSend(a1, "addAnimation:forKey:", v10, CFSTR("kTSDRotateInAnimationKey"));
}

- (uint64_t)removeRotateInAnimation
{
  return objc_msgSend(a1, "removeAnimationForKey:", CFSTR("kTSDRotateInAnimationKey"));
}

- (uint64_t)addRippleAnimationFromPosition:()TSDAdditions
{
  return objc_msgSend(a1, "addRippleAnimationFromPosition:withScale:", a3, a4, 1.0);
}

- (uint64_t)addRippleAnimationFromPosition:()TSDAdditions withScale:
{
  return objc_msgSend(a1, "addRippleAnimationFromPosition:withScale:addPerspectiveProjection:", 1);
}

- (void)addRippleAnimationFromPosition:()TSDAdditions withScale:addPerspectiveProjection:
{
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
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
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  double v53;
  double v54;

  objc_msgSend(a1, "removeRippleAnimation");
  v10 = *MEMORY[0x24BDE5D20];
  v11 = objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  LODWORD(v12) = 1060320051;
  LODWORD(v13) = 1036831949;
  LODWORD(v14) = 1063675494;
  LODWORD(v15) = 1.0;
  v16 = objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v12, v13, v14, v15);
  objc_msgSend(a1, "position");
  v19 = TSDSubtractPoints(v17, v18, a2);
  v21 = v20;
  v22 = TSDPointLength(v19, v20);
  v24 = TSDMultiplyPointScalar(v19, v21, 1.0 / v22);
  v25 = 0.0;
  if (a4 * 350.0 - v22 >= 0.0)
    v25 = a4 * 350.0 - v22;
  v26 = v25 / (a4 * 350.0);
  v27 = v26 * v26 * a4;
  if (v27 != 0.0)
  {
    v54 = v23;
    v28 = 1.0 - v26;
    if (a6)
      objc_msgSend(a1, "addPerspectiveProjection");
    v29 = v28 * 0.55;
    v30 = v27 * 0.549778714;
    v31 = 1.5;
    v32 = sqrt(v22);
    v33 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v34 = v54;
    if (v54 != 0.0)
    {
      v35 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.rotation.x"));
      objc_msgSend(v35, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v30 * 0.0 * -v54));
      objc_msgSend(v35, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v30 * -v54));
      objc_msgSend(v35, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v10));
      objc_msgSend(v35, "setDuration:", 0.0225);
      objc_msgSend(v35, "setBeginTime:", v29 + 0.0);
      v36 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.rotation.x"));
      objc_msgSend(v36, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v30 * -v54));
      objc_msgSend(v36, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v30 * -0.5 * -v54));
      objc_msgSend(v36, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v10));
      objc_msgSend(v36, "setDuration:", 0.315);
      objc_msgSend(v36, "setBeginTime:", v29 + 0.0225);
      v37 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.rotation.x"));
      v31 = 1.5;
      objc_msgSend(v37, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v30 * -0.5 * -v54));
      objc_msgSend(v37, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0));
      objc_msgSend(v37, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]));
      objc_msgSend(v37, "setDuration:", 0.1125);
      objc_msgSend(v37, "setBeginTime:", v29 + 0.3375);
      objc_msgSend(v33, "addObject:", v35);
      objc_msgSend(v33, "addObject:", v36);
      objc_msgSend(v33, "addObject:", v37);
    }
    v38 = v32 * v31;
    v39 = v27 * 0.15;
    if (v24 == 0.0)
    {
      v41 = v29 + 0.0;
    }
    else
    {
      v53 = v32 * v31;
      v40 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.rotation.y"), v34);
      objc_msgSend(v40, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v24 * v30));
      objc_msgSend(v40, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v10));
      objc_msgSend(v40, "setDuration:", 0.0225);
      v41 = v29 + 0.0;
      objc_msgSend(v40, "setBeginTime:", v29 + 0.0);
      v42 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.rotation.y"));
      objc_msgSend(v42, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v24 * v30));
      objc_msgSend(v42, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v24 * (v30 * -0.5)));
      objc_msgSend(v42, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v10));
      objc_msgSend(v42, "setDuration:", 0.315);
      objc_msgSend(v42, "setBeginTime:", v29 + 0.0225);
      v43 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.rotation.y"));
      objc_msgSend(v43, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v24 * (v30 * -0.5)));
      objc_msgSend(v43, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0));
      objc_msgSend(v43, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]));
      objc_msgSend(v43, "setDuration:", 0.1125);
      objc_msgSend(v43, "setBeginTime:", v29 + 0.3375);
      objc_msgSend(v33, "addObject:", v40);
      objc_msgSend(v33, "addObject:", v42);
      objc_msgSend(v33, "addObject:", v43);
      v38 = v53;
    }
    v44 = v38 * v27;
    v45 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
    objc_msgSend(v45, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v39 + 1.0));
    objc_msgSend(v45, "setTimingFunction:", v16);
    objc_msgSend(v45, "setDuration:", 0.2025);
    objc_msgSend(v45, "setBeginTime:", v41);
    v46 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
    objc_msgSend(v46, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v39 + 1.0));
    objc_msgSend(v46, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v39 * 0.0 + 1.0));
    objc_msgSend(v46, "setTimingFunction:", v11);
    objc_msgSend(v46, "setDuration:", 0.2475);
    objc_msgSend(v46, "setBeginTime:", v29 + 0.2025);
    objc_msgSend(v33, "addObject:", v45);
    objc_msgSend(v33, "addObject:", v46);
    if (v24 != 0.0)
    {
      v47 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.translation.x"));
      v48 = v24 * v44;
      objc_msgSend(v47, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v48));
      objc_msgSend(v47, "setTimingFunction:", v11);
      objc_msgSend(v47, "setDuration:", 0.1125);
      objc_msgSend(v47, "setBeginTime:", v41);
      v49 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.translation.x"));
      objc_msgSend(v49, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v48));
      objc_msgSend(v49, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0));
      objc_msgSend(v49, "setTimingFunction:", v11);
      objc_msgSend(v49, "setDuration:", 0.225);
      objc_msgSend(v49, "setBeginTime:", v29 + 0.1125);
      objc_msgSend(v33, "addObject:", v47);
      objc_msgSend(v33, "addObject:", v49);
    }
    if (v54 != 0.0)
    {
      v50 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.translation.y"));
      objc_msgSend(v50, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v54 * v44));
      objc_msgSend(v50, "setTimingFunction:", v11);
      objc_msgSend(v50, "setDuration:", 0.2025);
      objc_msgSend(v50, "setBeginTime:", v41);
      v51 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.translation.y"));
      objc_msgSend(v51, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v54 * v44));
      objc_msgSend(v51, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0));
      objc_msgSend(v51, "setTimingFunction:", v11);
      objc_msgSend(v51, "setDuration:", 0.2475);
      objc_msgSend(v51, "setBeginTime:", v29 + 0.2025);
      objc_msgSend(v33, "addObject:", v50);
      objc_msgSend(v33, "addObject:", v51);
    }
    v52 = objc_alloc_init(MEMORY[0x24BDE5638]);
    objc_msgSend(v52, "setAnimations:", v33);
    objc_msgSend(v52, "setDuration:", v29 + 0.45);
    objc_msgSend(v52, "setFillMode:", *MEMORY[0x24BDE5978]);
    objc_msgSend(a1, "addAnimation:forKey:", v52, CFSTR("kTSDRippleAnimationKey"));
  }
}

- (uint64_t)removeRippleAnimation
{
  return objc_msgSend(a1, "removeAnimationForKey:", CFSTR("kTSDRippleAnimationKey"));
}

- (uint64_t)addResetAnimationWithDelegate:()TSDAdditions
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t result;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(a1, "presentationLayer");
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("transform.translation.x"), CFSTR("transform.translation.y"), CFSTR("transform.translation.z"), CFSTR("transform.rotation.x"), CFSTR("transform.rotation.y"), CFSTR("transform.rotation.z"), CFSTR("transform.scale.x"), CFSTR("transform.scale.y"), CFSTR("transform.scale.z"), CFSTR("position.x"), CFSTR("position.y"), CFSTR("zPosition"), CFSTR("opacity"), 0);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    v10 = *MEMORY[0x24BDE5D20];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend((id)objc_msgSend(a1, "valueForKeyPath:", v12), "isEqual:", objc_msgSend(v4, "valueForKeyPath:", v12)) & 1) == 0)
        {
          v13 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", v12);
          objc_msgSend(v13, "setFromValue:", objc_msgSend(v4, "valueForKeyPath:", v12));
          objc_msgSend(v13, "setToValue:", objc_msgSend(a1, "valueForKeyPath:", v12));
          objc_msgSend(v13, "setDuration:", 0.2);
          objc_msgSend(v13, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v10));
          objc_msgSend(v5, "addObject:", v13);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  objc_msgSend(a1, "removeAllAnimations");
  result = objc_msgSend(v5, "count");
  if (result)
  {
    v15 = objc_alloc_init(MEMORY[0x24BDE5638]);
    objc_msgSend(v15, "setAnimations:", v5);
    objc_msgSend(v15, "setDuration:", 0.2);
    if (a3)
      objc_msgSend(v15, "setDelegate:");
    return objc_msgSend(a1, "addAnimation:forKey:", v15, CFSTR("kTSDResetAnimationKey"));
  }
  return result;
}

- (uint64_t)addResetAnimation
{
  return objc_msgSend(a1, "addResetAnimationWithDelegate:", 0);
}

- (uint64_t)removeResetAnimation
{
  return objc_msgSend(a1, "removeAnimationForKey:", CFSTR("kTSDResetAnimationKey"));
}

- (uint64_t)addZoomAnimation
{
  objc_msgSend(a1, "position");
  return objc_msgSend(a1, "addZoomAnimationFromPoint:startingScale:");
}

- (uint64_t)addZoomAnimationFromPoint:()TSDAdditions
{
  return objc_msgSend(a1, "addZoomAnimationFromPoint:startingScale:", a3, a4, 0.5);
}

- (uint64_t)addZoomAnimationFromPoint:()TSDAdditions startingScale:
{
  void *v8;
  double v9;
  double v10;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  CGRect v35;
  CGRect v36;

  objc_msgSend(a1, "removeZoomAnimation");
  v8 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  objc_msgSend(a1, "position");
  if (a2 != v10 || a3 != v9)
  {
    objc_msgSend(a1, "frame");
    v12 = a2 - CGRectGetMinX(v35);
    objc_msgSend(a1, "frame");
    v14 = v12 / v13;
    objc_msgSend(a1, "frame");
    v15 = a3 - CGRectGetMinY(v36);
    objc_msgSend(a1, "frame");
    v17 = v15 / v16;
    v18 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("anchorPoint"));
    v19 = objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v14, v17);
    objc_msgSend(v18, "setToValue:", v19);
    objc_msgSend(v18, "setFromValue:", v19);
    objc_msgSend(v18, "setDuration:", 0.2);
    objc_msgSend(v8, "addObject:", v18);
    objc_msgSend(a1, "anchorPoint");
    v21 = TSDSubtractPoints(v14, v17, v20);
    v23 = v22;
    objc_msgSend(a1, "frame");
    v25 = v21 * v24;
    objc_msgSend(a1, "frame");
    v27 = v23 * v26;
    v28 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("position"));
    v29 = objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v25, v27);
    objc_msgSend(v28, "setToValue:", v29);
    objc_msgSend(v28, "setFromValue:", v29);
    objc_msgSend(v28, "setDuration:", 0.2);
    objc_msgSend(v28, "setAdditive:", 1);
    objc_msgSend(v8, "addObject:", v28);
  }
  v30 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  objc_msgSend(v30, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4));
  objc_msgSend(v30, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.0));
  v31 = *MEMORY[0x24BDE5D28];
  objc_msgSend(v30, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]));
  objc_msgSend(v30, "setDuration:", 0.2);
  objc_msgSend(v8, "addObject:", v30);
  v32 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  objc_msgSend(v32, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0));
  objc_msgSend(v32, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.0));
  objc_msgSend(v32, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v31));
  objc_msgSend(v32, "setDuration:", 0.2);
  objc_msgSend(v8, "addObject:", v32);
  v33 = objc_alloc_init(MEMORY[0x24BDE5638]);
  objc_msgSend(v33, "setAnimations:", v8);
  objc_msgSend(v33, "setDuration:", 0.2);
  return objc_msgSend(a1, "addAnimation:forKey:", v33, CFSTR("kTSDZoomAnimationKey"));
}

- (uint64_t)removeZoomAnimation
{
  return objc_msgSend(a1, "removeAnimationForKey:", CFSTR("kTSDZoomAnimationKey"));
}

- (uint64_t)addZoomDownAnimation
{
  objc_msgSend(a1, "position");
  return objc_msgSend(a1, "addZoomDownAnimationFromPoint:endingScale:delay:");
}

- (uint64_t)addZoomDownAnimationFromPoint:()TSDAdditions
{
  return objc_msgSend(a1, "addZoomDownAnimationFromPoint:endingScale:delay:", a3, a4, 0.5, 0.0);
}

- (uint64_t)addZoomDownAnimationFromPoint:()TSDAdditions endingScale:delay:
{
  void *v10;
  double v11;
  double v12;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  CGRect v37;
  CGRect v38;

  objc_msgSend(a1, "removeZoomDownAnimation");
  v10 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  objc_msgSend(a1, "position");
  if (a2 != v12 || a3 != v11)
  {
    objc_msgSend(a1, "frame");
    v14 = a2 - CGRectGetMinX(v37);
    objc_msgSend(a1, "frame");
    v16 = v14 / v15;
    objc_msgSend(a1, "frame");
    v17 = a3 - CGRectGetMinY(v38);
    objc_msgSend(a1, "frame");
    v19 = v17 / v18;
    v20 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("anchorPoint"));
    v21 = objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v16, v19);
    objc_msgSend(v20, "setToValue:", v21);
    objc_msgSend(v20, "setFromValue:", v21);
    objc_msgSend(v20, "setDuration:", 0.2);
    objc_msgSend(v20, "setBeginTime:", a5);
    objc_msgSend(v10, "addObject:", v20);
    objc_msgSend(a1, "anchorPoint");
    v23 = TSDSubtractPoints(v16, v19, v22);
    v25 = v24;
    objc_msgSend(a1, "frame");
    v27 = v23 * v26;
    objc_msgSend(a1, "frame");
    v29 = v25 * v28;
    v30 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("position"));
    v31 = objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v27, v29);
    objc_msgSend(v30, "setToValue:", v31);
    objc_msgSend(v30, "setFromValue:", v31);
    objc_msgSend(v30, "setDuration:", 0.2);
    objc_msgSend(v30, "setBeginTime:", a5);
    objc_msgSend(v30, "setAdditive:", 1);
    objc_msgSend(v10, "addObject:", v30);
  }
  v32 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  objc_msgSend(v32, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.0));
  objc_msgSend(v32, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4));
  v33 = *MEMORY[0x24BDE5D18];
  objc_msgSend(v32, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D18]));
  objc_msgSend(v32, "setDuration:", 0.2);
  objc_msgSend(v32, "setBeginTime:", a5);
  objc_msgSend(v10, "addObject:", v32);
  v34 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  objc_msgSend(v34, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.0));
  objc_msgSend(v34, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0));
  objc_msgSend(v34, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v33));
  objc_msgSend(v34, "setDuration:", 0.2);
  objc_msgSend(v34, "setBeginTime:", a5);
  objc_msgSend(v10, "addObject:", v34);
  v35 = objc_alloc_init(MEMORY[0x24BDE5638]);
  objc_msgSend(v35, "setAnimations:", v10);
  objc_msgSend(v35, "setDuration:", a5 + 0.2);
  return objc_msgSend(a1, "addAnimation:forKey:", v35, CFSTR("kTSDZoomDownAnimationKey"));
}

- (uint64_t)removeZoomDownAnimation
{
  return objc_msgSend(a1, "removeAnimationForKey:", CFSTR("kTSDZoomDownAnimationKey"));
}

- (uint64_t)zoomDownAnimation
{
  return objc_msgSend(a1, "animationForKey:", CFSTR("kTSDZoomDownAnimationKey"));
}

- (uint64_t)animationDidStop:()TSDAdditions finished:
{
  uint64_t result;

  result = objc_msgSend(a3, "valueForKey:", CFSTR("kTSDLayerToRemove"));
  if (result)
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("kTSDLayerToRemove")), "nonretainedObjectValue"), "removeFromSuperlayer");
  return result;
}

- (double)frameIncludingSublayers
{
  double v2;
  double x;
  double v4;
  CGFloat y;
  double v6;
  CGFloat width;
  double v8;
  CGFloat height;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "frame");
  x = v2;
  y = v4;
  width = v6;
  height = v8;
  if ((objc_msgSend(a1, "masksToBounds") & 1) == 0)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = (void *)objc_msgSend(a1, "sublayers", 0);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v15, "frameIncludingSublayers");
          objc_msgSend(a1, "convertRect:fromLayer:", objc_msgSend(v15, "superlayer"), v16, v17, v18, v19);
          v33.origin.x = v20;
          v33.origin.y = v21;
          v33.size.width = v22;
          v33.size.height = v23;
          v31.origin.x = x;
          v31.origin.y = y;
          v31.size.width = width;
          v31.size.height = height;
          v32 = CGRectUnion(v31, v33);
          x = v32.origin.x;
          y = v32.origin.y;
          width = v32.size.width;
          height = v32.size.height;
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v12);
    }
  }
  return x;
}

- (CGImage)newRasterizedImageRef
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double MinX;
  double v12;
  double MinY;
  double v14;
  CGContext *v15;
  CGContext *v16;
  double v17;
  float v18;
  double v19;
  float v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGImage *Image;
  double v34;
  __int128 v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  CGAffineTransform v45;
  CGAffineTransform transform;
  CGAffineTransform v47;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v50;
  CGAffineTransform v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  CATransform3D v54;
  CATransform3D v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v2 = a1;
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a1, "sublayers"), "count") <= 1)
  {
    v2 = a1;
    while (1)
    {
      objc_msgSend(v2, "borderWidth");
      if (v17 != 0.0)
        break;
      if (objc_msgSend(v2, "mask"))
        break;
      objc_msgSend(v2, "opacity");
      if (v18 != 1.0)
        break;
      objc_msgSend(v2, "cornerRadius");
      if (v19 != 0.0)
        break;
      objc_msgSend(v2, "shadowOpacity");
      if (v20 != 0.0 || objc_msgSend(v2, "backgroundColor"))
        break;
      if (v2)
        objc_msgSend(v2, "transform");
      else
        memset(&v55, 0, sizeof(v55));
      if (!CATransform3DIsIdentity(&v55))
        break;
      objc_msgSend(v2, "contentsRect");
      v62.origin.x = 0.0;
      v62.origin.y = 0.0;
      v62.size.width = 1.0;
      v62.size.height = 1.0;
      if (!CGRectEqualToRect(v60, v62))
        break;
      if (objc_msgSend((id)objc_msgSend(v2, "sublayers"), "count") != 1)
      {
        if (!objc_msgSend(v2, "contents"))
          break;
        Image = (CGImage *)objc_msgSend(v2, "contents");
        CGImageRetain(Image);
        return Image;
      }
      objc_msgSend(v2, "bounds");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "sublayers"), "lastObject"), "bounds");
      v63.origin.x = v29;
      v63.origin.y = v30;
      v63.size.width = v31;
      v63.size.height = v32;
      v61.origin.x = v22;
      v61.origin.y = v24;
      v61.size.width = v26;
      v61.size.height = v28;
      if (CGRectEqualToRect(v61, v63))
      {
        v2 = (void *)objc_msgSend((id)objc_msgSend(v2, "sublayers"), "lastObject");
        if ((unint64_t)objc_msgSend((id)objc_msgSend(v2, "sublayers"), "count") <= 1)
          continue;
      }
      break;
    }
  }
  objc_msgSend(a1, "frameIncludingSublayers");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(a1, "frame");
  MinX = CGRectGetMinX(v56);
  v57.origin.x = v4;
  v57.origin.y = v6;
  v57.size.width = v8;
  v57.size.height = v10;
  v12 = CGRectGetMinX(v57);
  objc_msgSend(a1, "frame");
  MinY = CGRectGetMinY(v58);
  v59.origin.x = v4;
  v59.origin.y = v6;
  v59.size.width = v8;
  v59.size.height = v10;
  v14 = CGRectGetMinY(v59);
  v15 = TSDBitmapContextCreate(11, v8);
  if (!v15)
    return 0;
  v16 = v15;
  if (v2)
    objc_msgSend(v2, "transform");
  else
    memset(&v54, 0, sizeof(v54));
  v34 = MinX - v12;
  if (!CATransform3DIsIdentity(&v54))
  {
    v35 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v53.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v53.c = v35;
    *(_OWORD *)&v53.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    *(_OWORD *)&v52.a = *(_OWORD *)&v53.a;
    *(_OWORD *)&v52.c = v35;
    *(_OWORD *)&v52.tx = *(_OWORD *)&v53.tx;
    CGAffineTransformTranslate(&v53, &v52, -v4, -v6);
    objc_msgSend(a1, "anchorPoint");
    v37 = v36;
    v39 = v38;
    objc_msgSend(a1, "bounds");
    v41 = TSDMultiplyPointBySize(v37, v39, v40);
    v43 = v42;
    v50 = v53;
    CGAffineTransformTranslate(&v51, &v50, v41, v42);
    v53 = v51;
    if (a1)
      objc_msgSend(a1, "affineTransform");
    else
      memset(&t1, 0, sizeof(t1));
    t2 = v53;
    CGAffineTransformConcat(&v51, &t1, &t2);
    v53 = v51;
    v47 = v51;
    CGAffineTransformTranslate(&v51, &v47, -v41, -v43);
    v53 = v51;
    transform = v51;
    CGContextConcatCTM(v16, &transform);
  }
  CGAffineTransformMakeTranslation(&v45, v34, MinY - v14);
  CGContextConcatCTM(v16, &v45);
  objc_msgSend(a1, "renderInContext:", v16);
  Image = CGBitmapContextCreateImage(v16);
  CGContextRelease(v16);
  return Image;
}

- (void)bakedLayer
{
  uint64_t v2;
  CGImage *v3;
  void *v4;

  v2 = objc_msgSend(a1, "newRasterizedImageRef");
  if (!v2)
    return 0;
  v3 = (CGImage *)v2;
  v4 = (void *)objc_msgSend(MEMORY[0x24BDE56D0], "layer");
  objc_msgSend(a1, "frameIncludingSublayers");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v4, "setContents:", v3);
  CGImageRelease(v3);
  return v4;
}

- (uint64_t)pause
{
  return objc_msgSend(a1, "pauseAtTime:", CACurrentMediaTime());
}

- (uint64_t)pauseAtTime:()TSDAdditions
{
  double v2;
  double v3;

  objc_msgSend(a1, "convertTime:fromLayer:", 0);
  v3 = v2;
  LODWORD(v2) = 0;
  objc_msgSend(a1, "setSpeed:", v2);
  return objc_msgSend(a1, "setTimeOffset:", v3);
}

- (uint64_t)resume
{
  return objc_msgSend(a1, "resumeAtTime:", CACurrentMediaTime());
}

- (uint64_t)resumeAtTime:()TSDAdditions
{
  double v4;
  double v5;
  double v6;

  objc_msgSend(a1, "timeOffset");
  v5 = v4;
  LODWORD(v4) = 1.0;
  objc_msgSend(a1, "setSpeed:", v4);
  objc_msgSend(a1, "setTimeOffset:", 0.0);
  objc_msgSend(a1, "setBeginTime:", 0.0);
  objc_msgSend(a1, "convertTime:fromLayer:", 0, a2);
  return objc_msgSend(a1, "setBeginTime:", v6 - v5);
}

- (CGFloat)transformToScale:()TSDAdditions aroundBoundsPoint:afterOffset:
{
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  CGFloat result;
  __int128 v49;
  double v50;
  CATransform3D v51;
  CATransform3D v52;
  CATransform3D v53;
  CATransform3D v54;

  *(_OWORD *)&a2->m41 = 0u;
  *(_OWORD *)&a2->m43 = 0u;
  *(_OWORD *)&a2->m31 = 0u;
  *(_OWORD *)&a2->m33 = 0u;
  *(_OWORD *)&a2->m21 = 0u;
  *(_OWORD *)&a2->m23 = 0u;
  *(_OWORD *)&a2->m11 = 0u;
  *(_OWORD *)&a2->m13 = 0u;
  CATransform3DMakeTranslation(a2, a6, a7, 0.0);
  objc_msgSend(a1, "bounds");
  v13 = v12;
  objc_msgSend(a1, "anchorPoint");
  v15 = v14;
  v50 = -v13;
  v16 = a4 - v13 * v14;
  objc_msgSend(a1, "bounds");
  v18 = v17;
  objc_msgSend(a1, "anchorPoint");
  v20 = v19;
  v21 = *(_OWORD *)&a2->m33;
  *(_OWORD *)&v53.m31 = *(_OWORD *)&a2->m31;
  *(_OWORD *)&v53.m33 = v21;
  v22 = *(_OWORD *)&a2->m43;
  *(_OWORD *)&v53.m41 = *(_OWORD *)&a2->m41;
  *(_OWORD *)&v53.m43 = v22;
  v23 = *(_OWORD *)&a2->m13;
  *(_OWORD *)&v53.m11 = *(_OWORD *)&a2->m11;
  *(_OWORD *)&v53.m13 = v23;
  v24 = *(_OWORD *)&a2->m23;
  *(_OWORD *)&v53.m21 = *(_OWORD *)&a2->m21;
  *(_OWORD *)&v53.m23 = v24;
  CATransform3DTranslate(&v54, &v53, v16, a5 - v18 * v19, 0.0);
  v25 = *(_OWORD *)&v54.m33;
  *(_OWORD *)&a2->m31 = *(_OWORD *)&v54.m31;
  *(_OWORD *)&a2->m33 = v25;
  v26 = *(_OWORD *)&v54.m43;
  *(_OWORD *)&a2->m41 = *(_OWORD *)&v54.m41;
  *(_OWORD *)&a2->m43 = v26;
  v27 = *(_OWORD *)&v54.m13;
  *(_OWORD *)&a2->m11 = *(_OWORD *)&v54.m11;
  *(_OWORD *)&a2->m13 = v27;
  v28 = *(_OWORD *)&v54.m23;
  *(_OWORD *)&a2->m21 = *(_OWORD *)&v54.m21;
  *(_OWORD *)&a2->m23 = v28;
  v29 = *(_OWORD *)&a2->m11;
  v30 = *(_OWORD *)&a2->m13;
  v31 = *(_OWORD *)&a2->m23;
  *(_OWORD *)&v52.m21 = *(_OWORD *)&a2->m21;
  *(_OWORD *)&v52.m23 = v31;
  *(_OWORD *)&v52.m11 = v29;
  *(_OWORD *)&v52.m13 = v30;
  v32 = *(_OWORD *)&a2->m31;
  v33 = *(_OWORD *)&a2->m33;
  v34 = *(_OWORD *)&a2->m43;
  *(_OWORD *)&v52.m41 = *(_OWORD *)&a2->m41;
  *(_OWORD *)&v52.m43 = v34;
  *(_OWORD *)&v52.m31 = v32;
  *(_OWORD *)&v52.m33 = v33;
  CATransform3DScale(&v54, &v52, a3, a3, 1.0);
  v35 = *(_OWORD *)&v54.m33;
  *(_OWORD *)&a2->m31 = *(_OWORD *)&v54.m31;
  *(_OWORD *)&a2->m33 = v35;
  v36 = *(_OWORD *)&v54.m43;
  *(_OWORD *)&a2->m41 = *(_OWORD *)&v54.m41;
  *(_OWORD *)&a2->m43 = v36;
  v37 = *(_OWORD *)&v54.m13;
  *(_OWORD *)&a2->m11 = *(_OWORD *)&v54.m11;
  *(_OWORD *)&a2->m13 = v37;
  v38 = *(_OWORD *)&v54.m23;
  *(_OWORD *)&a2->m21 = *(_OWORD *)&v54.m21;
  *(_OWORD *)&a2->m23 = v38;
  v39 = *(_OWORD *)&a2->m11;
  v40 = *(_OWORD *)&a2->m13;
  v41 = *(_OWORD *)&a2->m23;
  *(_OWORD *)&v51.m21 = *(_OWORD *)&a2->m21;
  *(_OWORD *)&v51.m23 = v41;
  *(_OWORD *)&v51.m11 = v39;
  *(_OWORD *)&v51.m13 = v40;
  v42 = *(_OWORD *)&a2->m31;
  v43 = *(_OWORD *)&a2->m33;
  v44 = *(_OWORD *)&a2->m43;
  *(_OWORD *)&v51.m41 = *(_OWORD *)&a2->m41;
  *(_OWORD *)&v51.m43 = v44;
  *(_OWORD *)&v51.m31 = v42;
  *(_OWORD *)&v51.m33 = v43;
  CATransform3DTranslate(&v54, &v51, -(a4 + v50 * v15), -(a5 + -v18 * v20), 0.0);
  v45 = *(_OWORD *)&v54.m33;
  *(_OWORD *)&a2->m31 = *(_OWORD *)&v54.m31;
  *(_OWORD *)&a2->m33 = v45;
  v46 = *(_OWORD *)&v54.m43;
  *(_OWORD *)&a2->m41 = *(_OWORD *)&v54.m41;
  *(_OWORD *)&a2->m43 = v46;
  v47 = *(_OWORD *)&v54.m13;
  *(_OWORD *)&a2->m11 = *(_OWORD *)&v54.m11;
  *(_OWORD *)&a2->m13 = v47;
  result = v54.m21;
  v49 = *(_OWORD *)&v54.m23;
  *(_OWORD *)&a2->m21 = *(_OWORD *)&v54.m21;
  *(_OWORD *)&a2->m23 = v49;
  return result;
}

- (double)transformToScale:()TSDAdditions aroundAnchorPoint:afterOffset:
{
  double v14;
  double v15;
  double v16;
  double result;

  objc_msgSend(a1, "bounds");
  v15 = v14;
  objc_msgSend(a1, "bounds");
  if (a1)
  {
    objc_msgSend(a1, "transformToScale:aroundBoundsPoint:afterOffset:", a3, a4 * v15, a5 * v16, a6, a7);
  }
  else
  {
    result = 0.0;
    a2[6] = 0u;
    a2[7] = 0u;
    a2[4] = 0u;
    a2[5] = 0u;
    a2[2] = 0u;
    a2[3] = 0u;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

- (uint64_t)scale:()TSDAdditions aroundBoundsPoint:afterOffset:
{
  _OWORD v3[8];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  if (a1)
  {
    objc_msgSend(a1, "transformToScale:aroundBoundsPoint:afterOffset:");
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    v4 = 0u;
    v5 = 0u;
  }
  v3[4] = v8;
  v3[5] = v9;
  v3[6] = v10;
  v3[7] = v11;
  v3[0] = v4;
  v3[1] = v5;
  v3[2] = v6;
  v3[3] = v7;
  return objc_msgSend(a1, "setTransform:", v3);
}

- (uint64_t)scale:()TSDAdditions aroundAnchorPoint:afterOffset:
{
  _OWORD v3[8];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  if (a1)
  {
    objc_msgSend(a1, "transformToScale:aroundAnchorPoint:afterOffset:");
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    v4 = 0u;
    v5 = 0u;
  }
  v3[4] = v8;
  v3[5] = v9;
  v3[6] = v10;
  v3[7] = v11;
  v3[0] = v4;
  v3[1] = v5;
  v3[2] = v6;
  v3[3] = v7;
  return objc_msgSend(a1, "setTransform:", v3);
}

- (double)center
{
  double v2;
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
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;

  objc_msgSend(a1, "anchorPoint");
  v3 = v2;
  v5 = v4;
  objc_msgSend(a1, "bounds");
  v9 = TSDPointFromNormalizedRect(v3, v5, v6, v7, v8);
  objc_msgSend(a1, "position");
  v12 = TSDSubtractPoints(v10, v11, v9);
  v14 = v13;
  objc_msgSend(a1, "bounds");
  v19 = TSDCenterOfRect(v15, v16, v17, v18);
  return TSDAddPoints(v12, v14, v19);
}

@end
