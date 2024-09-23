@implementation KNGaussianBlurEffect

- (KNGaussianBlurEffect)initWithContext:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)KNGaussianBlurEffect;
  v5 = -[KNGaussianBlurEffect init](&v13, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
    v7 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v6;

    v8 = *(_OWORD *)&CATransform3DIdentity.m33;
    *(_OWORD *)(v5 + 264) = *(_OWORD *)&CATransform3DIdentity.m31;
    *(_OWORD *)(v5 + 280) = v8;
    v9 = *(_OWORD *)&CATransform3DIdentity.m43;
    *(_OWORD *)(v5 + 296) = *(_OWORD *)&CATransform3DIdentity.m41;
    *(_OWORD *)(v5 + 312) = v9;
    v10 = *(_OWORD *)&CATransform3DIdentity.m13;
    *(_OWORD *)(v5 + 200) = *(_OWORD *)&CATransform3DIdentity.m11;
    *(_OWORD *)(v5 + 216) = v10;
    v11 = *(_OWORD *)&CATransform3DIdentity.m23;
    *(_OWORD *)(v5 + 232) = *(_OWORD *)&CATransform3DIdentity.m21;
    *(_OWORD *)(v5 + 248) = v11;
    *((_QWORD *)v5 + 24) = 0x3FF0000000000000;
    v5[176] = 0;
  }

  return (KNGaussianBlurEffect *)v5;
}

- (BOOL)p_textureSizeIsValid:(CGSize)a3
{
  return a3.width > 0.0 || a3.width < 0.0;
}

- (double)p_scaleFactorForTextureToFitWithinMaxSizeWithSize:(CGSize)a3 scaleFactor:(double)a4 maxTextureSize:(CGSize)a5
{
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double height;
  double width;
  double v15;
  double v16;
  double v17;
  double v19;
  double v20;

  if (a4 == 0.0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3.width, a3.height));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNGaussianBlurEffect p_scaleFactorForTextureToFitWithinMaxSizeWithSize:scaleFactor:maxTextureSize:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KNGaussianBlurEffect.m"));
    v8 = CFSTR("Scale factor cannot be zero.");
    v9 = v5;
    v10 = v6;
    v11 = v7;
    v12 = 153;
LABEL_10:
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, v11, v12, v8);

    return 1.0;
  }
  height = a5.height;
  width = a5.width;
  v15 = a4;
  v16 = a3.height;
  v17 = a3.width;
  if (!-[KNGaussianBlurEffect p_textureSizeIsValid:](self, "p_textureSizeIsValid:")
    || !-[KNGaussianBlurEffect p_textureSizeIsValid:](self, "p_textureSizeIsValid:", width, height))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNGaussianBlurEffect p_scaleFactorForTextureToFitWithinMaxSizeWithSize:scaleFactor:maxTextureSize:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KNGaussianBlurEffect.m"));
    v8 = CFSTR("Invalid texture size");
    v9 = v5;
    v10 = v6;
    v11 = v7;
    v12 = 158;
    goto LABEL_10;
  }
  v19 = TSDMultiplySizeScalar(v17, v16, 1.0 / v15);
  if (v19 >= width)
  {
    v15 = v15 / (width / v19);
    TSDMultiplySizeScalar(v17, v16, 1.0 / v15);
  }
  if (v20 >= height)
    return v15 / (height / v20);
  return v15;
}

- (void)createBlurTexturesWithBlurSteps:(unint64_t)a3 maxBlurRadius:(double)a4 stepsToDecreaseRadius:(double)a5 commandBuffer:(id)a6 capabilities:(id)a7
{
  -[KNGaussianBlurEffect createBlurTexturesUsingShadersWithBlurSteps:maxBlurRadius:stepsToDecreaseRadius:commandBuffer:capabilities:](self, "createBlurTexturesUsingShadersWithBlurSteps:maxBlurRadius:stepsToDecreaseRadius:commandBuffer:capabilities:", a3, a6, a7, a4, a5);
}

- (void)createBlurTexturesUsingShadersWithBlurSteps:(unint64_t)a3 maxBlurRadius:(double)a4 stepsToDecreaseRadius:(double)a5 commandBuffer:(id)a6 capabilities:(id)a7
{
  id v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  double Width;
  double Height;
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  void *v30;
  unint64_t v31;
  double x;
  double y;
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
  double v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  CGFloat v61;
  float v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  double v76;
  double v77;
  double v78;
  KNGaussianBlurTexture *v79;
  void *v80;
  KNGaussianBlurTexture *v81;
  void *v82;
  id v83;
  id v84;
  id v85;
  uint64_t v86;
  void *i;
  void *v88;
  id v89;
  double v90;
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
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  size_t v106;
  TSDMTLDataBuffer *v107;
  TSDMTLDataBuffer *metalDataBuffer;
  id v109;
  id v110;
  double v111;
  double v112;
  unint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  KNGaussianBlurEffect *v126;
  id v127;
  void *v128;
  id v129;
  id v130;
  id v131;
  double v132;
  double v133;
  CGFloat sx;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double r2;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  CGAffineTransform v146;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v149;
  CATransform3D v150;
  float64x2_t v151;
  float64x2_t v152;
  float64x2_t v153;
  float64x2_t v154;
  float64x2_t v155;
  float64x2_t v156;
  float64x2_t v157;
  float64x2_t v158;
  _BYTE v159[128];
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;

  v131 = a6;
  v12 = a7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TSDMetalContext device](self->_metalContext, "device"));
  objc_msgSend(v12, "maximumMetalTextureSizeForDevice:", v13);
  v120 = v15;
  v121 = v14;
  v16 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  objc_msgSend(v16, "setPixelFormat:", -[TSDMetalContext pixelFormat](self->_metalContext, "pixelFormat"));
  v130 = objc_msgSend(objc_alloc((Class)TSDMetalShader), "initDefaultTextureShaderWithDevice:colorAttachment:", v13, v16);
  v129 = objc_msgSend(objc_alloc((Class)TSDMetalShader), "initDefaultGaussianBlurShaderWithDevice:colorAttachment:halfSizedRadius:", v13, v16, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  Width = (double)CGImageGetWidth((CGImageRef)-[TSDTexturedRectangle image](self->_texture, "image"));
  Height = (double)CGImageGetHeight((CGImageRef)-[TSDTexturedRectangle image](self->_texture, "image"));
  -[TSDTexturedRectangle size](self->_texture, "size");
  v21 = v20;
  v22 = -[TSDTexturedRectangle size](self->_texture, "size");
  v24 = v23;
  v25 = TSDRectWithSize(v22);
  v118 = v26;
  v119 = v25;
  v117 = v27;
  r2 = v28;
  v123 = TSDRectUnit[1];
  v124 = TSDRectUnit[0];
  v122 = TSDRectUnit[2];
  v125 = TSDRectUnit[3];
  v126 = self;
  v127 = +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v13);
  v29 = objc_claimAutoreleasedReturnValue(-[TSDTexturedRectangle metalTextureWithContext:](self->_texture, "metalTextureWithContext:", self->_metalContext));
  v30 = (void *)v29;
  if (v29)
  {
    v109 = v16;
    v110 = v12;
    v31 = 0;
    v138 = Width;
    v112 = Width / v21;
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    v34 = CGRectNull.size.width;
    v35 = CGRectNull.size.height;
    v136 = (double)a3;
    v137 = Height;
    v36 = 1.0;
    v111 = Height / v24;
    v115 = v17;
    v116 = v13;
    v139 = a4;
    v140 = a5;
    v113 = a3;
    v114 = (void *)v29;
    do
    {
      v37 = (double)v31 / v136 * ((double)v31 / v136) * a4;
      v38 = 2.0;
      if (a5 != 0.0)
      {
        v39 = floor(v37 / a5);
        if (v39 <= v36)
          v38 = 2.0;
        else
          v38 = v39 + v39;
      }
      if (v37 <= 0.0)
      {
        v81 = -[KNGaussianBlurTexture initWithMetalTexture:frame:blurAmount:]([KNGaussianBlurTexture alloc], "initWithMetalTexture:frame:blurAmount:", v30, v119, v118, v117, r2, v37);
        v164.origin.x = x;
        v164.origin.y = y;
        v164.size.width = v34;
        v164.size.height = v35;
        v167.origin.x = v119;
        v167.origin.y = v118;
        v167.size.width = v117;
        a4 = v139;
        a5 = v140;
        v167.size.height = r2;
        v165 = CGRectUnion(v164, v167);
        x = v165.origin.x;
        y = v165.origin.y;
        v34 = v165.size.width;
        v35 = v165.size.height;
      }
      else
      {
        v40 = TSDMultiplySizeScalar(v138, v137, 1.0 / v38);
        v42 = v37 / v38;
        v135 = v42;
        if (fabs(v42 + -5.0) > 0.100000001)
        {
          v38 = v38 / (5.0 / v42);
          v40 = TSDMultiplySizeScalar(v138, v137, 1.0 / v38);
          if (v40 >= v138)
          {
            v38 = 1.0;
            v41 = v137;
            v40 = v138;
          }
        }
        -[KNGaussianBlurEffect p_scaleFactorForTextureToFitWithinMaxSizeWithSize:scaleFactor:maxTextureSize:](v126, "p_scaleFactorForTextureToFitWithinMaxSizeWithSize:scaleFactor:maxTextureSize:", v40, v41, v38, v121, v120);
        v44 = v43;
        v132 = TSDMultiplySizeScalar(v138, v137, 1.0 / v43);
        v133 = v45;
        -[TSDTexturedRectangle offset](v126->_texture, "offset");
        v47 = fabs(v46) * v112 + 10.0;
        -[TSDTexturedRectangle offset](v126->_texture, "offset");
        v49 = v44;
        v50 = v44 * (v47 + 5.0);
        v51 = v44 * (fabs(v48) * v111 + 10.0 + 5.0);
        v157 = 0u;
        v158 = 0u;
        v155 = 0u;
        v156 = 0u;
        v153 = 0u;
        v154 = 0u;
        v151 = 0u;
        v152 = 0u;
        TSDTransform3DMakeOrtho(0.0, v50 + v138, 0.0, v51 + v137, -1.0, 1.0);
        memset(&v150, 0, sizeof(v150));
        CATransform3DMakeTranslation(&v150, v50 * 0.5, v51 * 0.5, 0.0);
        a = v150;
        *(float64x2_t *)&b.m31 = v155;
        *(float64x2_t *)&b.m33 = v156;
        *(float64x2_t *)&b.m41 = v157;
        *(float64x2_t *)&b.m43 = v158;
        *(float64x2_t *)&b.m11 = v151;
        *(float64x2_t *)&b.m13 = v152;
        *(float64x2_t *)&b.m21 = v153;
        *(float64x2_t *)&b.m23 = v154;
        CATransform3DConcat(&v149, &a, &b);
        v155 = *(float64x2_t *)&v149.m31;
        v156 = *(float64x2_t *)&v149.m33;
        v157 = *(float64x2_t *)&v149.m41;
        v158 = *(float64x2_t *)&v149.m43;
        v151 = *(float64x2_t *)&v149.m11;
        v152 = *(float64x2_t *)&v149.m13;
        v153 = *(float64x2_t *)&v149.m21;
        v154 = *(float64x2_t *)&v149.m23;
        sx = v49;
        v52 = v50 / v49;
        v53 = v51 / v49;
        memset(&v149, 0, sizeof(v149));
        TSDTransform3DMakeOrtho(0.0, v132 + v52, 0.0, v133 + v53, -1.0, 1.0);
        v54 = objc_msgSend(objc_alloc((Class)TSDMetalRenderTarget), "initWithSize:metalContext:", v126->_metalContext, v132 + v52, v133 + v53);
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "passDescriptor"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "renderCommandEncoderWithDescriptor:", v55));

        *(float32x4_t *)&a.m11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v151), v152);
        *(float32x4_t *)&a.m13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v153), v154);
        *(float32x4_t *)&a.m21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v155), v156);
        *(float32x4_t *)&a.m23 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v157), v158);
        objc_msgSend(v130, "setPipelineStateWithEncoder:vertexBytes:", v56, &a);
        objc_msgSend(v56, "setFragmentTexture:atIndex:", v30, 0);
        objc_msgSend(v127, "drawWithEncoder:atIndex:", v56, objc_msgSend(v130, "bufferIndex"));
        v57 = +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v13, TSDRectWithSize(objc_msgSend(v56, "endEncoding")));
        v58 = objc_msgSend(objc_alloc((Class)TSDMetalRenderTarget), "initWithSize:metalContext:", v126->_metalContext, v132 + v52, v133 + v53);
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "passDescriptor"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "renderCommandEncoderWithDescriptor:", v59));

        *(float32x4_t *)&a.m11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v149.m11), *(float64x2_t *)&v149.m13);
        *(float32x4_t *)&a.m13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v149.m21), *(float64x2_t *)&v149.m23);
        *(float32x4_t *)&a.m21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v149.m31), *(float64x2_t *)&v149.m33);
        *(float32x4_t *)&a.m23 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v149.m41), *(float64x2_t *)&v149.m43);
        *(float *)&v61 = 1.0 / (v132 + v52);
        v62 = 1.0 / (v133 + v53);
        *((float *)&v61 + 1) = v62;
        b.m11 = v61;
        *(_QWORD *)&b.m12 = 1;
        objc_msgSend(v129, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v60, &a, &b);
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "texture"));
        objc_msgSend(v60, "setFragmentTexture:atIndex:", v63, 0);

        objc_msgSend(v57, "drawWithEncoder:atIndex:", v60, objc_msgSend(v129, "bufferIndex"));
        objc_msgSend(v60, "endEncoding");
        v64 = objc_msgSend(objc_alloc((Class)TSDMetalRenderTarget), "initWithSize:metalContext:", v126->_metalContext, v132 + v52, v133 + v53);
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "passDescriptor"));
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "renderCommandEncoderWithDescriptor:", v65));

        LOBYTE(b.m12) = 0;
        objc_msgSend(v129, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v66, &a, &b);
        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "texture"));
        objc_msgSend(v66, "setFragmentTexture:atIndex:", v67, 0);

        objc_msgSend(v57, "drawWithEncoder:atIndex:", v66, objc_msgSend(v129, "bufferIndex"));
        v68 = TSDRectWithOriginAndSize(objc_msgSend(v66, "endEncoding"), v52 * -0.5, v53 * -0.5, v132 + v52, v133 + v53);
        v70 = v69;
        v72 = v71;
        v74 = v73;
        CGAffineTransformMakeScale(&v146, sx, sx);
        v160.origin.x = v68;
        v160.origin.y = v70;
        v160.size.width = v72;
        v160.size.height = v74;
        v161 = CGRectApplyAffineTransform(v160, &v146);
        v75 = v161.origin.x;
        v76 = v161.origin.y;
        v77 = v161.size.width;
        v78 = v161.size.height;
        v79 = [KNGaussianBlurTexture alloc];
        v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "texture"));
        v81 = -[KNGaussianBlurTexture initWithMetalTexture:frame:blurAmount:](v79, "initWithMetalTexture:frame:blurAmount:", v80, v75, v76, v77, v78, v135);

        v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "texture"));
        objc_msgSend(v128, "addObject:", v82);

        v162.origin.x = x;
        v162.origin.y = y;
        v162.size.width = v34;
        v162.size.height = v35;
        v166.origin.x = v75;
        v166.origin.y = v76;
        v166.size.width = v77;
        v166.size.height = v78;
        v163 = CGRectUnion(v162, v166);
        x = v163.origin.x;
        y = v163.origin.y;
        v34 = v163.size.width;
        v35 = v163.size.height;

        v30 = v114;
        v13 = v116;

        v17 = v115;
        a4 = v139;
        a5 = v140;
        a3 = v113;
      }
      objc_msgSend(v17, "addObject:", v81);

      ++v31;
      v36 = 1.0;
    }
    while (v31 <= a3);
    v144 = 0u;
    v145 = 0u;
    v142 = 0u;
    v143 = 0u;
    v83 = v17;
    v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v142, v159, 16);
    if (v84)
    {
      v85 = v84;
      v86 = *(_QWORD *)v143;
      do
      {
        for (i = 0; i != v85; i = (char *)i + 1)
        {
          if (*(_QWORD *)v143 != v86)
            objc_enumerationMutation(v83);
          v88 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * (_QWORD)i);
          v89 = objc_msgSend(v88, "frame");
          v91 = v90;
          v93 = v92;
          v94 = TSDAddPoints(v89);
          v96 = v95;
          v97 = TSDNormalizedPointInRect(v91, v93, x, y, v34, v35);
          v99 = v98;
          v100 = TSDNormalizedPointInRect(v94, v96, x, y, v34, v35);
          TSDRectWithPoints(v97, v99, v100, v101);
          objc_msgSend(v88, "setBounds:");
        }
        v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v142, v159, 16);
      }
      while (v85);
    }

    objc_storeStrong((id *)&v126->_blurTextures, v17);
    -[TSDTexturedRectangle size](v126->_texture, "size");
    v103 = v102 / (double)CGImageGetWidth((CGImageRef)-[TSDTexturedRectangle image](v126->_texture, "image"));
    -[TSDTexturedRectangle size](v126->_texture, "size");
    v105 = v104;
    v106 = CGImageGetHeight((CGImageRef)-[TSDTexturedRectangle image](v126->_texture, "image"));
    v107 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v13, x * v103, y * (v105 / (double)v106), v34 * v103, v35 * (v105 / (double)v106), v124, v123, v122, v125);
    metalDataBuffer = v126->_metalDataBuffer;
    v126->_metalDataBuffer = v107;

    v16 = v109;
    v12 = v110;
  }

}

- (void)setupEffectIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  id v8;
  void *v9;
  TSDMetalShader *v10;
  TSDMetalShader *metalShader;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  id v15;

  if (!self->_texture)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNGaussianBlurEffect setupEffectIfNecessary]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KNGaussianBlurEffect.m"));
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 363, CFSTR("invalid nil value for '%s'"), "_texture");

  }
  if (self->_metalContext)
  {
    v15 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
    objc_msgSend(v15, "setPixelFormat:", -[TSDMetalContext pixelFormat](self->_metalContext, "pixelFormat"));
    objc_msgSend(v15, "setBlendingEnabled:", 1);
    objc_msgSend(v15, "setDestinationRGBBlendFactor:", 5);
    objc_msgSend(v15, "setDestinationAlphaBlendFactor:", 5);
    if (self->_saturateBlurTextures)
      v6 = CFSTR("KNBuildBlurColorizedFragmentShader");
    else
      v6 = CFSTR("KNBuildBlurFragmentShader");
    v7 = v6;
    v8 = objc_alloc((Class)TSDMetalShader);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TSDMetalContext device](self->_metalContext, "device"));
    v10 = (TSDMetalShader *)objc_msgSend(v8, "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:", CFSTR("KNBuildBlurVertexShader"), v7, v9, CFSTR("KeynoteMetalLibrary"), v15);

    metalShader = self->_metalShader;
    self->_metalShader = v10;

    v12 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_MVPMatrix.m21), *(float64x2_t *)&self->_MVPMatrix.m23);
    v13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_MVPMatrix.m31), *(float64x2_t *)&self->_MVPMatrix.m33);
    v14 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_MVPMatrix.m41), *(float64x2_t *)&self->_MVPMatrix.m43);
    *(float32x4_t *)self->_anon_30 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_MVPMatrix.m11), *(float64x2_t *)&self->_MVPMatrix.m13);
    *(float32x4_t *)&self->_anon_30[16] = v12;
    *(float32x4_t *)&self->_anon_30[32] = v13;
    *(float32x4_t *)&self->_anon_30[48] = v14;

  }
}

- (void)renderEffectAtPercent:(double)a3 withContext:(id)a4
{
  double v6;
  double v7;
  long double v8;
  char *v9;
  char *v10;
  void *v11;
  void *v12;
  float64_t v13;
  float64x2_t v14;
  float64_t v15;
  float64x2_t v16;
  float opacity;
  $D95091CE36CE643C3DF27B9C91787738 *p_fragmentUniforms;
  float64_t v19;
  float64x2_t v20;
  float64_t v21;
  float64x2_t v22;
  void *v23;
  void *v24;
  id v25;

  if (self->_metalDataBuffer)
  {
    v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "renderEncoder"));
    v6 = (double)(-[NSArray count](self->_blurTextures, "count") - 1) * a3;
    v7 = 1.0;
    v8 = fmod(v6, 1.0);
    v9 = (char *)vcvtmd_u64_f64(v6);
    v10 = v9 + 1;
    if (v9 + 1 >= (char *)-[NSArray count](self->_blurTextures, "count"))
    {
      v10 = (char *)-[NSArray count](self->_blurTextures, "count") - 1;
      v9 = (char *)-[NSArray count](self->_blurTextures, "count") - 2;
    }
    else
    {
      v7 = v8;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_blurTextures, "objectAtIndexedSubscript:", v9));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_blurTextures, "objectAtIndexedSubscript:", v10));
    objc_msgSend(v11, "bounds");
    v14.f64[1] = v13;
    v16.f64[1] = v15;
    *(float32x4_t *)&self->_anon_30[64] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v16), v14);
    objc_msgSend(v12, "bounds");
    opacity = self->_opacity;
    self->_fragmentUniforms.Opacity = opacity;
    p_fragmentUniforms = &self->_fragmentUniforms;
    v20.f64[1] = v19;
    v22.f64[1] = v21;
    *(float32x4_t *)&p_fragmentUniforms[-2].Opacity = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v22), v20);
    *(float *)v22.f64 = v7;
    p_fragmentUniforms->Percent = *(float *)v22.f64;
    objc_msgSend(*(id *)&p_fragmentUniforms[-15], "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v25, &p_fragmentUniforms[-12], p_fragmentUniforms);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "texture"));
    objc_msgSend(v25, "setFragmentTexture:atIndex:", v23, 0);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "texture"));
    objc_msgSend(v25, "setFragmentTexture:atIndex:", v24, 1);

    objc_msgSend(*(id *)&p_fragmentUniforms[-14], "drawWithEncoder:atIndex:", v25, objc_msgSend(*(id *)&p_fragmentUniforms[-15], "bufferIndex"));
  }
}

- (void)teardown
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSArray *blurTextures;
  TSDMTLDataBuffer *metalDataBuffer;
  TSDMetalShader *metalShader;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_blurTextures;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v7), "teardown", (_QWORD)v11);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  blurTextures = self->_blurTextures;
  self->_blurTextures = 0;

  metalDataBuffer = self->_metalDataBuffer;
  self->_metalDataBuffer = 0;

  metalShader = self->_metalShader;
  self->_metalShader = 0;

}

- (TSDTexturedRectangle)texture
{
  return self->_texture;
}

- (void)setTexture:(id)a3
{
  self->_texture = (TSDTexturedRectangle *)a3;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (CATransform3D)MVPMatrix
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[1].m34;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[1].m32;
  *(_OWORD *)&retstr->m13 = v3;
  v4 = *(_OWORD *)&self[1].m44;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[1].m42;
  *(_OWORD *)&retstr->m23 = v4;
  v5 = *(_OWORD *)&self[2].m14;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[2].m12;
  *(_OWORD *)&retstr->m33 = v5;
  v6 = *(_OWORD *)&self[2].m24;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[2].m22;
  *(_OWORD *)&retstr->m43 = v6;
  return self;
}

- (void)setMVPMatrix:(CATransform3D *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)&a3->m11;
  v4 = *(_OWORD *)&a3->m13;
  v5 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_MVPMatrix.m23 = *(_OWORD *)&a3->m23;
  *(_OWORD *)&self->_MVPMatrix.m21 = v5;
  *(_OWORD *)&self->_MVPMatrix.m13 = v4;
  *(_OWORD *)&self->_MVPMatrix.m11 = v3;
  v6 = *(_OWORD *)&a3->m31;
  v7 = *(_OWORD *)&a3->m33;
  v8 = *(_OWORD *)&a3->m43;
  *(_OWORD *)&self->_MVPMatrix.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_MVPMatrix.m43 = v8;
  *(_OWORD *)&self->_MVPMatrix.m31 = v6;
  *(_OWORD *)&self->_MVPMatrix.m33 = v7;
}

- (BOOL)saturateBlurTextures
{
  return self->_saturateBlurTextures;
}

- (void)setSaturateBlurTextures:(BOOL)a3
{
  self->_saturateBlurTextures = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalDataBuffer, 0);
  objc_storeStrong((id *)&self->_metalShader, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_blurTextures, 0);
}

@end
