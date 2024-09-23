@implementation CRFormDetector

- (CRFormDetector)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v7;
  CRFormDetector *v8;
  CRFormDetector *v9;
  CRFormDetectorModel *v10;
  CRFormDetectorModel *model;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRFormDetector;
  v8 = -[CRFormDetector init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_configuration, a3);
    v10 = -[CRFormDetectorModel initWithConfiguration:error:]([CRFormDetectorModel alloc], "initWithConfiguration:error:", v7, a4);
    model = v9->_model;
    v9->_model = v10;

  }
  return v9;
}

+ (id)_multiArrayFromPixelBuffer:(__CVBuffer *)a3
{
  OSType PixelFormatType;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *BaseAddress;
  void *v9;
  _QWORD v11[8];

  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType == 32)
  {
    v6 = 1;
    v7 = 2;
    v5 = 3;
    goto LABEL_5;
  }
  if (PixelFormatType == 1111970369)
  {
    v5 = 0;
    v6 = 2;
    v7 = 1;
LABEL_5:
    CVPixelBufferLockBaseAddress(a3, 0);
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E970]), "initWithShape:dataType:error:", &unk_1E993CFC8, 65568, 0);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __45__CRFormDetector__multiArrayFromPixelBuffer___block_invoke;
    v11[3] = &__block_descriptor_64_e24_v32__0_v8q16__NSArray_24l;
    v11[4] = BaseAddress;
    v11[5] = v6;
    v11[6] = v7;
    v11[7] = v5;
    objc_msgSend(v9, "getMutableBytesWithHandler:", v11);
    CVPixelBufferUnlockBaseAddress(a3, 0);
    return v9;
  }
  return 0;
}

__n128 __45__CRFormDetector__multiArrayFromPixelBuffer___block_invoke(_QWORD *a1, uint64_t a2, __n128 result)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;

  v3 = 0;
  v4 = a1[4];
  v5 = v4 + a1[7];
  v6 = v4 + a1[6];
  v7 = v4 + a1[5];
  do
  {
    result.n128_u8[0] = *(_BYTE *)(v7 + v3);
    *(float *)&v8 = (float)result.n128_u32[0] / 255.0;
    v9 = a2 + v3;
    *(float *)v9 = *(float *)&v8;
    LOBYTE(v8) = *(_BYTE *)(v6 + v3);
    *(float *)&v10 = (float)v8 / 255.0;
    *(float *)(v9 + 1638400) = *(float *)&v10;
    LOBYTE(v10) = *(_BYTE *)(v5 + v3);
    result.n128_f32[0] = (float)v10 / 255.0;
    *(_DWORD *)(v9 + 3276800) = result.n128_u32[0];
    v3 += 4;
  }
  while (v3 != 1638400);
  return result;
}

+ (id)_detectorResultsFromSortedResults:(const void *)a3 imageSize:(CGSize)a4 originalImageSize:(CGSize)a5
{
  double height;
  double width;
  double v7;
  double v8;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  CRNormalizedQuad *v13;
  unint64_t v14;
  CRFormField *v15;

  height = a5.height;
  width = a5.width;
  v7 = a4.height;
  v8 = a4.width;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 4));
  v11 = *(_QWORD *)a3;
  v12 = *((_QWORD *)a3 + 1);
  if (*(_QWORD *)a3 != v12)
  {
    do
    {
      v13 = -[CRNormalizedQuad initWithNormalizedBoundingBox:size:]([CRNormalizedQuad alloc], "initWithNormalizedBoundingBox:size:", *(double *)(v11 + 8) / v8, *(double *)(v11 + 16) / v7, *(double *)(v11 + 24) / v8, *(double *)(v11 + 32) / v7, width, height);
      v14 = *(_QWORD *)(v11 + 40) - 1;
      if (v14 < 7)
      {
        v15 = -[CRFormField initWithQuad:type:source:value:contentType:maxCharacterCount:]([CRFormField alloc], "initWithQuad:type:source:value:contentType:maxCharacterCount:", v13, qword_1D513A790[v14], 1, 0, 0, 0x7FFFFFFFFFFFFFFFLL);
        -[CRFormField setHasBoundedHeight:](v15, "setHasBoundedHeight:", (*(_QWORD *)(v11 + 40) < 8uLL) & (0xC4u >> *(_QWORD *)(v11 + 40)));
        -[CRFormField setHasBoundedWidth:](v15, "setHasBoundedWidth:", (*(_QWORD *)(v11 + 40) < 8uLL) & (0xDCu >> *(_QWORD *)(v11 + 40)));
        objc_msgSend(v10, "addObject:", v15);

      }
      v11 += 48;
    }
    while (v11 != v12);
  }
  return v10;
}

+ (void)_saveDebugImage:(id)a3 byOverlayingResults:(const void *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  double *v21;
  char *v22;
  __int128 v23;
  char *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  char *__p;
  char *v34;
  char *v35;

  v5 = a3;
  __p = 0;
  v34 = 0;
  v35 = 0;
  v6 = *(_QWORD *)a4;
  v7 = *((_QWORD *)a4 + 1);
  if (*(_QWORD *)a4 != v7)
  {
    do
    {
      v8 = *(_QWORD *)(v6 + 8);
      v9 = (double)(unint64_t)objc_msgSend(v5, "height");
      v11 = *(_QWORD *)(v6 + 24);
      v10 = *(double *)(v6 + 32);
      v12 = v9 - (*(double *)(v6 + 16) + v10);
      v13 = v34;
      if (v34 >= v35)
      {
        v15 = __p;
        v16 = (v34 - __p) >> 5;
        v17 = v16 + 1;
        if ((unint64_t)(v16 + 1) >> 59)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        v18 = v35 - __p;
        if ((v35 - __p) >> 4 > v17)
          v17 = v18 >> 4;
        if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFE0)
          v19 = 0x7FFFFFFFFFFFFFFLL;
        else
          v19 = v17;
        if (v19)
        {
          v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGRect>>((uint64_t)&v35, v19);
          v15 = __p;
          v13 = v34;
        }
        else
        {
          v20 = 0;
        }
        v21 = (double *)&v20[32 * v16];
        *(_QWORD *)v21 = v8;
        v21[1] = v12;
        *((_QWORD *)v21 + 2) = v11;
        v21[3] = v10;
        if (v13 == v15)
        {
          v24 = &v20[32 * v16];
        }
        else
        {
          v22 = &v20[32 * v16];
          do
          {
            v23 = *((_OWORD *)v13 - 1);
            v24 = v22 - 32;
            *((_OWORD *)v22 - 2) = *((_OWORD *)v13 - 2);
            *((_OWORD *)v22 - 1) = v23;
            v13 -= 32;
            v22 -= 32;
          }
          while (v13 != v15);
        }
        v14 = (char *)(v21 + 4);
        __p = v24;
        v35 = &v20[32 * v19];
        if (v15)
          operator delete(v15);
      }
      else
      {
        *(_QWORD *)v34 = v8;
        *((double *)v34 + 1) = v12;
        v14 = v34 + 32;
        *((_QWORD *)v34 + 2) = v11;
        *((double *)v34 + 3) = v10;
      }
      v34 = v14;
      v6 += 48;
    }
    while (v6 != v7);
  }
  objc_msgSend(v5, "imageByOverlayingRects:count:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "url");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "URLByDeletingPathExtension");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "lastPathComponent");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    v30 = v28;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("null%lu"), objc_msgSend(v5, "hash"));
    v30 = (id)objc_claimAutoreleasedReturnValue();
  }
  v31 = v30;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/form_%@_detection.png"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "writeToFile:", v32);

  if (__p)
    operator delete(__p);

}

- (void)_denormalizeResults:(void *)a3 imageSize:(CGSize *)a4 translation:(CGVector *)a5
{
  void *v8;
  int v9;
  CGSize v10;
  float64x2_t v11;
  unint64_t width;
  uint64_t v13;
  uint64_t v14;
  CGVector v15;

  -[CRFormDetector configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "resizeInputImage");

  v10 = *a4;
  if (v9)
  {
    v11 = vdivq_f64((float64x2_t)vdupq_n_s64(0x4084000000000000uLL), (float64x2_t)v10);
  }
  else
  {
    width = (unint64_t)v10.width;
    if ((unint64_t)v10.width <= (unint64_t)v10.height)
      width = (unint64_t)v10.height;
    v11 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(640.0 / (double)width), 0);
  }
  v13 = *(_QWORD *)a3;
  v14 = *((_QWORD *)a3 + 1);
  if (*(_QWORD *)a3 != v14)
  {
    v15 = *a5;
    do
    {
      *(float64x2_t *)(v13 + 24) = vdivq_f64(*(float64x2_t *)(v13 + 24), v11);
      *(float64x2_t *)(v13 + 8) = vaddq_f64((float64x2_t)v15, vdivq_f64(*(float64x2_t *)(v13 + 8), v11));
      v13 += 48;
    }
    while (v13 != v14);
  }
}

+ (BOOL)validateHorizontalTiles:(const void *)a3 document:(id)a4
{
  id v5;
  double MaxY;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  CGFloat *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double MinX;
  double MinY;
  double Width;
  CGFloat Height;
  double *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  double v29;
  double v30;
  double v31;
  double v32;
  char *v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  uint64_t v38;
  unint64_t v39;
  _BOOL4 v40;
  char v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  char *v56;
  uint64_t v57;
  unint64_t v58;
  _BOOL4 v59;
  char v60;
  BOOL v61;
  void *v63;
  double obj;
  id obja;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  void *__p;
  _BYTE *v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;

  v83 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  obj = CGRectGetMaxX(*(CGRect *)(*((_QWORD *)a3 + 1) - 32));
  MaxY = CGRectGetMaxY(*(CGRect *)(*((_QWORD *)a3 + 1) - 32));
  std::vector<CGRect>::vector(&__p, (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 5);
  v7 = *(_QWORD *)a3;
  if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
  {
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = (CGFloat *)(v7 + v8);
      v11 = *v10;
      v12 = v10[1];
      v13 = v10[2];
      v14 = v10[3];
      v84.origin.x = *v10;
      v84.origin.y = v12;
      v84.size.width = v13;
      v84.size.height = v14;
      MinX = CGRectGetMinX(v84);
      v85.origin.x = v11;
      v85.origin.y = v12;
      v85.size.width = v13;
      v85.size.height = v14;
      MinY = CGRectGetMinY(v85);
      v86.origin.x = v11;
      v86.origin.y = v12;
      v86.size.width = v13;
      v86.size.height = v14;
      Width = CGRectGetWidth(v86);
      v87.origin.x = v11;
      v87.origin.y = v12;
      v87.size.width = v13;
      v87.size.height = v14;
      Height = CGRectGetHeight(v87);
      v19 = (double *)((char *)__p + v8);
      *v19 = MinX / obj;
      v19[1] = MinY / MaxY;
      v19[2] = Width / obj;
      v19[3] = Height / MaxY;
      ++v9;
      v7 = *(_QWORD *)a3;
      v8 += 32;
    }
    while (v9 < (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 5);
  }
  objc_msgSend(v5, "contentsWithTypes:", 8);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentsWithTypes:", 64);
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  obja = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v75 != v21)
          objc_enumerationMutation(obja);
        v23 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        objc_msgSend(v23, "colQuads");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v5;
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
        if (v26)
        {
          v27 = *(_QWORD *)v71;
          while (2)
          {
            for (j = 0; j != v26; ++j)
            {
              if (*(_QWORD *)v71 != v27)
                objc_enumerationMutation(v24);
              objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * j), "boundingBox");
              v33 = (char *)__p;
              if (v79 == __p)
                goto LABEL_41;
              v34 = v29;
              v35 = v30;
              v36 = v31;
              v37 = v32;
              v38 = 0;
              v39 = 1;
              do
              {
                v88.origin.x = v34;
                v88.origin.y = v35;
                v88.size.width = v36;
                v88.size.height = v37;
                v40 = CGRectContainsRect(*(CGRect *)&v33[v38], v88);
                v33 = (char *)__p;
                v41 = v39++ >= (v79 - (_BYTE *)__p) >> 5 || v40;
                v38 += 32;
              }
              while ((v41 & 1) == 0);
              if (!v40)
              {
LABEL_41:

                v5 = v25;
                v61 = 0;
                v42 = obja;
                goto LABEL_42;
              }
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
            if (v26)
              continue;
            break;
          }
        }

        v5 = v25;
      }
      v20 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
    }
    while (v20);
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v42 = v63;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
  if (v43)
  {
    v44 = 0;
    v45 = *(_QWORD *)v67;
    do
    {
      for (k = 0; k != v43; ++k)
      {
        if (*(_QWORD *)v67 != v45)
          objc_enumerationMutation(v42);
        objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * k), "boundingQuad");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "boundingBox");
        v49 = v48;
        v51 = v50;
        v53 = v52;
        v55 = v54;

        v56 = (char *)__p;
        if (v79 == __p)
        {
          v59 = 0;
        }
        else
        {
          v57 = 0;
          v58 = 1;
          do
          {
            v89.origin.x = v49;
            v89.origin.y = v51;
            v89.size.width = v53;
            v89.size.height = v55;
            v59 = CGRectContainsRect(*(CGRect *)&v56[v57], v89);
            v56 = (char *)__p;
            v60 = v58++ >= (v79 - (_BYTE *)__p) >> 5 || v59;
            v57 += 32;
          }
          while ((v60 & 1) == 0);
        }
        v44 += !v59;
      }
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
    }
    while (v43);
    v61 = v44 < 2;
  }
  else
  {
    v61 = 1;
  }
LABEL_42:

  if (__p)
  {
    v79 = __p;
    operator delete(__p);
  }

  return v61;
}

- (id)detectFormFieldsInImage:(id)a3 document:(id)a4 outputCandidateResults:(id *)a5
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  void *v10;
  char v11;
  double v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  double *v25;
  double *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  double *v31;
  id v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  int v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  __CVBuffer *v42;
  void *v43;
  CRFormDetectorModelInput *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  void *v53;
  void *v54;
  unint64_t v55;
  id v56;
  float *v57;
  id v58;
  float *v59;
  float *v60;
  void *v61;
  __n128 v62;
  uint64_t v63;
  BOOL v64;
  uint64_t v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  double v72;
  float v73;
  uint64_t i;
  float v75;
  double v76;
  uint64_t v77;
  double v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  double v87;
  double v88;
  double v89;
  double v90;
  _BOOL4 v91;
  _BOOL4 v92;
  BOOL v93;
  uint64_t v94;
  void *v95;
  __n128 *v96;
  unint64_t v97;
  __n128 *v98;
  uint64_t v99;
  __n128 v100;
  __n128 v101;
  uint64_t v102;
  void *v103;
  __n128 *v104;
  unint64_t v105;
  __n128 *v106;
  uint64_t v107;
  __n128 v108;
  void *v109;
  void *v110;
  unint64_t v111;
  float *v112;
  unint64_t v113;
  NSObject *v114;
  uint64_t v115;
  uint64_t v116;
  BOOL v117;
  _BYTE *CRLogger;
  void *v120;
  unint64_t v121;
  uint64_t v122;
  unint64_t v123;
  uint64_t v124;
  CRLogger *v125;
  _BYTE *v126;
  void *v127;
  unint64_t v128;
  unint64_t v129;
  unint64_t v130;
  unint64_t v131;
  double v132;
  void *v133;
  double *v134;
  double *v135;
  _BYTE *v136;
  uint64_t v137;
  unint64_t v139;
  unint64_t v140;
  double v141;
  double v142;
  uint64_t v143;
  unint64_t v144;
  uint64_t v145;
  unint64_t v146;
  char *v147;
  uint64_t v148;
  unint64_t v149;
  uint64_t v150;
  unint64_t v151;
  char *v152;
  char *v153;
  double *v154;
  double v155;
  double v156;
  double *v157;
  double *v158;
  double *v159;
  uint64_t v160;
  unint64_t v161;
  uint64_t v162;
  unint64_t v163;
  char *v164;
  char *v165;
  char *v166;
  __int128 v167;
  char *v168;
  double v169;
  double v170;
  double *v171;
  double *v172;
  uint64_t v173;
  unint64_t v174;
  uint64_t v175;
  unint64_t v176;
  char *v177;
  char *v178;
  double *v179;
  double v180;
  double v181;
  double *v182;
  uint64_t v183;
  unint64_t v184;
  uint64_t v185;
  unint64_t v186;
  char *v187;
  char *v188;
  char *v189;
  __int128 v190;
  char *v191;
  __int128 v192;
  __int128 v193;
  void *v195;
  id v196;
  id v197;
  id v198;
  void *v199;
  id v200;
  id v201;
  NSObject *v202;
  void *v203;
  uint64_t v204;
  id v205;
  double *v206;
  id v207;
  void *v208;
  NSObject *v209;
  float v211;
  float v212;
  float v213;
  float v214;
  float v215;
  __int128 v216;
  void *v217[2];
  uint64_t v218;
  void *v219[2];
  uint64_t v220;
  id v221;
  void *v222[2];
  uint64_t v223;
  void *v224[2];
  uint64_t v225;
  void *__p;
  double *v227;
  char *v228;
  int64x2_t v229;
  float v230;
  _BYTE buf[24];
  double v232;
  uint64_t v233;

  v233 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v196 = a4;
  v229 = vdupq_n_s64(0x4084000000000000uLL);
  v7 = objc_msgSend(v6, "width");
  v8 = objc_msgSend(v6, "height");
  v9 = fmax((double)(unint64_t)objc_msgSend(v6, "width"), (double)(unint64_t)objc_msgSend(v6, "height"));
  v207 = v6;
  __p = 0;
  v227 = 0;
  v228 = 0;
  if (v9 >= 1280.0)
  {
    -[CRFormDetector configuration](self, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "tileInputImage");

    if ((v11 & 1) != 0)
    {
      v12 = fmin((double)v7, (double)v8);
      objc_msgSend(v207, "imageByScalingToWidth:height:", (unint64_t)(640.0 / v12 * (double)(unint64_t)objc_msgSend(v207, "width")), (unint64_t)(640.0 / v12 * (double)(unint64_t)objc_msgSend(v207, "height")));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == (double)(unint64_t)objc_msgSend(v207, "height"))
      {
        v14 = objc_msgSend(v13, "width");
        v15 = objc_msgSend(v13, "height");
        v16 = (double)(unint64_t)objc_msgSend(v13, "height");
        v17 = fmax((double)v14 * 0.6, (double)v15);
        v143 = ((char *)v227 - (_BYTE *)__p) >> 5;
        v144 = v143 + 1;
        if ((unint64_t)(v143 + 1) >> 59)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        v145 = v228 - (_BYTE *)__p;
        if ((v228 - (_BYTE *)__p) >> 4 > v144)
          v144 = v145 >> 4;
        if ((unint64_t)v145 >= 0x7FFFFFFFFFFFFFE0)
          v146 = 0x7FFFFFFFFFFFFFFLL;
        else
          v146 = v144;
        if (v146)
          v147 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGRect>>((uint64_t)&v228, v146);
        else
          v147 = 0;
        v153 = &v147[32 * v143];
        *(_QWORD *)v153 = 0;
        *((_QWORD *)v153 + 1) = 0;
        *((double *)v153 + 2) = v17;
        *((double *)v153 + 3) = v16;
        v154 = (double *)(v153 + 32);
        __p = v153;
        v228 = &v147[32 * v146];
        v227 = v154;
        v155 = (double)(unint64_t)objc_msgSend(v13, "width") - v17;
        v156 = (double)(unint64_t)objc_msgSend(v13, "height");
        v157 = v154;
        if (v154 >= (double *)v228)
        {
          v159 = (double *)__p;
          v160 = ((char *)v227 - (_BYTE *)__p) >> 5;
          v161 = v160 + 1;
          if ((unint64_t)(v160 + 1) >> 59)
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          v162 = v228 - (_BYTE *)__p;
          if ((v228 - (_BYTE *)__p) >> 4 > v161)
            v161 = v162 >> 4;
          if ((unint64_t)v162 >= 0x7FFFFFFFFFFFFFE0)
            v163 = 0x7FFFFFFFFFFFFFFLL;
          else
            v163 = v161;
          if (v163)
          {
            v164 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGRect>>((uint64_t)&v228, v163);
            v159 = (double *)__p;
            v157 = v227;
          }
          else
          {
            v164 = 0;
          }
          v165 = &v164[32 * v160];
          *(double *)v165 = v155;
          *((_QWORD *)v165 + 1) = 0;
          v166 = &v164[32 * v163];
          *((double *)v165 + 2) = v17;
          *((double *)v165 + 3) = v156;
          v158 = (double *)(v165 + 32);
          if (v157 == v159)
          {
            v168 = v165;
          }
          else
          {
            do
            {
              v167 = *((_OWORD *)v157 - 1);
              v168 = v165 - 32;
              *((_OWORD *)v165 - 2) = *((_OWORD *)v157 - 2);
              *((_OWORD *)v165 - 1) = v167;
              v157 -= 4;
              v165 -= 32;
            }
            while (v157 != v159);
          }
          __p = v168;
          v227 = v158;
          v228 = v166;
          if (v159)
            operator delete(v159);
        }
        else
        {
          *v227 = v155;
          v154[1] = 0.0;
          v158 = v154 + 4;
          v157[2] = v17;
          v157[3] = v156;
        }
        v227 = v158;
        if (objc_msgSend((id)objc_opt_class(), "validateHorizontalTiles:document:", &__p, v196))
        {
          v26 = v227;
          goto LABEL_15;
        }
        v227 = (double *)__p;
        v169 = (double)(unint64_t)objc_msgSend(v13, "width");
        v170 = (double)(unint64_t)objc_msgSend(v13, "height");
        v171 = v227;
        if (v227 < (double *)v228)
        {
          *v227 = 0.0;
          v171[1] = 0.0;
          v26 = v171 + 4;
          v171[2] = v169;
          v171[3] = v170;
LABEL_212:
          v227 = v26;
          goto LABEL_15;
        }
        v172 = (double *)__p;
        v173 = ((char *)v227 - (_BYTE *)__p) >> 5;
        v174 = v173 + 1;
        if ((unint64_t)(v173 + 1) >> 59)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        v175 = v228 - (_BYTE *)__p;
        if ((v228 - (_BYTE *)__p) >> 4 > v174)
          v174 = v175 >> 4;
        if ((unint64_t)v175 >= 0x7FFFFFFFFFFFFFE0)
          v176 = 0x7FFFFFFFFFFFFFFLL;
        else
          v176 = v174;
        if (v176)
        {
          v177 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGRect>>((uint64_t)&v228, v176);
          v172 = (double *)__p;
          v171 = v227;
        }
        else
        {
          v177 = 0;
        }
        v188 = &v177[32 * v173];
        *(_QWORD *)v188 = 0;
        *((_QWORD *)v188 + 1) = 0;
        v189 = &v177[32 * v176];
        *((double *)v188 + 2) = v169;
        *((double *)v188 + 3) = v170;
        v26 = (double *)(v188 + 32);
        if (v171 != v172)
        {
          do
          {
            v192 = *((_OWORD *)v171 - 1);
            v191 = v188 - 32;
            *((_OWORD *)v188 - 2) = *((_OWORD *)v171 - 2);
            *((_OWORD *)v188 - 1) = v192;
            v171 -= 4;
            v188 -= 32;
          }
          while (v171 != v172);
          goto LABEL_210;
        }
      }
      else
      {
        v139 = objc_msgSend(v13, "height");
        v140 = objc_msgSend(v13, "width");
        v141 = (double)(unint64_t)objc_msgSend(v13, "width");
        v142 = fmax((double)v139 * 0.6, (double)v140);
        v148 = ((char *)v227 - (_BYTE *)__p) >> 5;
        v149 = v148 + 1;
        if ((unint64_t)(v148 + 1) >> 59)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        v150 = v228 - (_BYTE *)__p;
        if ((v228 - (_BYTE *)__p) >> 4 > v149)
          v149 = v150 >> 4;
        if ((unint64_t)v150 >= 0x7FFFFFFFFFFFFFE0)
          v151 = 0x7FFFFFFFFFFFFFFLL;
        else
          v151 = v149;
        if (v151)
          v152 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGRect>>((uint64_t)&v228, v151);
        else
          v152 = 0;
        v178 = &v152[32 * v148];
        *(_QWORD *)v178 = 0;
        *((_QWORD *)v178 + 1) = 0;
        *((double *)v178 + 2) = v141;
        *((double *)v178 + 3) = v142;
        v179 = (double *)(v178 + 32);
        __p = v178;
        v228 = &v152[32 * v151];
        v227 = v179;
        v180 = (double)(unint64_t)objc_msgSend(v13, "height") - v142;
        v181 = (double)(unint64_t)objc_msgSend(v13, "width");
        v182 = v179;
        if (v179 < (double *)v228)
        {
          *v227 = 0.0;
          v179[1] = v180;
          v179[2] = v181;
          v26 = v179 + 4;
          v179[3] = v142;
          goto LABEL_212;
        }
        v172 = (double *)__p;
        v183 = ((char *)v227 - (_BYTE *)__p) >> 5;
        v184 = v183 + 1;
        if ((unint64_t)(v183 + 1) >> 59)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        v185 = v228 - (_BYTE *)__p;
        if ((v228 - (_BYTE *)__p) >> 4 > v184)
          v184 = v185 >> 4;
        if ((unint64_t)v185 >= 0x7FFFFFFFFFFFFFE0)
          v186 = 0x7FFFFFFFFFFFFFFLL;
        else
          v186 = v184;
        if (v186)
        {
          v187 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGRect>>((uint64_t)&v228, v186);
          v172 = (double *)__p;
          v182 = v227;
        }
        else
        {
          v187 = 0;
        }
        v188 = &v187[32 * v183];
        *(_QWORD *)v188 = 0;
        v189 = &v187[32 * v186];
        *((double *)v188 + 1) = v180;
        *((double *)v188 + 2) = v181;
        *((double *)v188 + 3) = v142;
        v26 = (double *)(v188 + 32);
        if (v182 != v172)
        {
          do
          {
            v190 = *((_OWORD *)v182 - 1);
            v191 = v188 - 32;
            *((_OWORD *)v188 - 2) = *((_OWORD *)v182 - 2);
            *((_OWORD *)v188 - 1) = v190;
            v182 -= 4;
            v188 -= 32;
          }
          while (v182 != v172);
LABEL_210:
          __p = v191;
          v227 = v26;
          v228 = v189;
          if (v172)
            operator delete(v172);
          goto LABEL_212;
        }
      }
      v191 = v188;
      goto LABEL_210;
    }
  }
  v18 = (double)(unint64_t)objc_msgSend(v207, "width");
  v19 = (double)(unint64_t)objc_msgSend(v207, "height");
  v20 = ((char *)v227 - (_BYTE *)__p) >> 5;
  v21 = v20 + 1;
  if ((unint64_t)(v20 + 1) >> 59)
    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
  v22 = v228 - (_BYTE *)__p;
  if ((v228 - (_BYTE *)__p) >> 4 > v21)
    v21 = v22 >> 4;
  if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFE0)
    v23 = 0x7FFFFFFFFFFFFFFLL;
  else
    v23 = v21;
  if (v23)
    v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGRect>>((uint64_t)&v228, v23);
  else
    v24 = 0;
  v25 = (double *)&v24[32 * v20];
  *v25 = 0.0;
  v25[1] = 0.0;
  v25[2] = v18;
  v25[3] = v19;
  v26 = v25 + 4;
  __p = v25;
  v228 = &v24[32 * v23];
  v227 = v25 + 4;
  v13 = v207;
LABEL_15:
  v224[0] = 0;
  v224[1] = 0;
  v225 = 0;
  v222[0] = 0;
  v222[1] = 0;
  v223 = 0;
  v27 = (char *)v26 - (_BYTE *)__p;
  v195 = v13;
  if (v26 == __p)
  {
    v206 = 0;
  }
  else
  {
    if (v27 < 0)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v206 = (double *)operator new((unint64_t)v27 >> 1);
    bzero(v206, (unint64_t)v27 >> 1);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v27 >> 5);
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (char *)__p;
  if (v227 == __p)
  {
LABEL_31:
    v45 = objc_alloc_init(MEMORY[0x1E0C9E9B0]);
    v209 = v45;
    -[CRFormDetector model](self, "model");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v221 = 0;
    objc_msgSend(v46, "predictionsFromInputs:options:error:", v208, v45, &v221);
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v221;

    if (v32)
    {
      CROSLogForCategory(0);
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v32, "description");
        v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v49 = objc_msgSend(v48, "UTF8String");
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v49;
        _os_log_impl(&dword_1D4FB8000, v47, OS_LOG_TYPE_FAULT, "Form detection inference error: %s", buf, 0xCu);

      }
    }
    else
    {
      v50 = objc_msgSend(v203, "count");
      if (v50 == ((char *)v227 - (_BYTE *)__p) >> 5)
      {
        if (v227 != __p)
        {
          v202 = 0;
          v52 = 0;
          *(_QWORD *)&v51 = 134218240;
          v193 = v51;
          while (1)
          {
            v204 = v52;
            objc_msgSend(v203, "objectAtIndexedSubscript:", v193);
            v199 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v199, "boundingBoxes");
            v205 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v199, "classLogits");
            v200 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v199, "anchors");
            v201 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v205, "shape");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "objectAtIndexedSubscript:", 1);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend(v54, "unsignedIntegerValue");

            v56 = objc_retainAutorelease(v201);
            v57 = (float *)objc_msgSend(v56, "dataPointer");
            v58 = objc_retainAutorelease(v205);
            v59 = (float *)objc_msgSend(v58, "dataPointer");
            v198 = objc_retainAutorelease(v200);
            v60 = (float *)objc_msgSend(v198, "dataPointer");
            v219[0] = 0;
            v219[1] = 0;
            v220 = 0;
            v197 = v58;
            v61 = v56;
            v217[0] = 0;
            v217[1] = 0;
            v218 = 0;
            if (v55)
            {
              v63 = 0;
              v64 = 1;
              while (1)
              {
                v65 = 0;
                v67 = *v57;
                v66 = v57[1];
                v68 = v57[2];
                v69 = v57[3];
                v214 = *v59;
                v215 = *v57 + v68;
                v213 = v59[1];
                v70 = v59[2] / 5.0;
                v71 = (float)(v59[3] / 5.0) <= 4.1352 ? v59[3] / 5.0 : 4.1352;
                v72 = *v60 + -0.592243;
                v73 = v72;
                for (i = 1; i != 9; ++i)
                {
                  if (v60[i] > v73)
                  {
                    v65 = i;
                    v73 = v60[i];
                  }
                }
                if (v70 > 4.1352)
                  v70 = 4.1352;
                v212 = expf(v70);
                v75 = v68 - v67;
                v211 = expf(v71);
                *(_QWORD *)&v216 = v65;
                v76 = exp(v72 - v73);
                v77 = 0;
                v78 = 0.0;
                do
                {
                  if (v65 != v77)
                  {
                    if (v77)
                      v78 = v78 + expf(v60[v77] - v73);
                    else
                      v78 = v76 + v78;
                  }
                  ++v77;
                }
                while (v77 != 9);
                v79 = v66 + v69;
                v80 = v66;
                v81 = (float)(v215 * 0.5) + (float)((float)(v214 / 10.0) * v75);
                v82 = v75 * v212;
                v83 = (float)(v79 * 0.5) + (float)((float)(v213 / 10.0) * (float)(v69 - v80));
                v84 = (float)(v69 - v80) * v211;
                v85 = log1p(v78) + v73;
                v86 = v73 - v85;
                v230 = v73 - v85;
                if (v65)
                {
                  v87 = (float)(v81 - (float)(v82 * 0.5));
                  v88 = (float)(v83 - (float)(v84 * 0.5));
                  v89 = v82;
                  *(double *)buf = v87;
                  *(double *)&buf[8] = v88;
                  v90 = v84;
                  *(double *)&buf[16] = v82;
                  v232 = v90;
                  v91 = v65 == 8;
                  v92 = v86 > 2.709313;
                  v93 = v91 && v92;
                  v117 = !v91 || !v92;
                  v94 = 8;
                  if (v117)
                    v94 = v65;
                }
                else
                {
                  v93 = 0;
                  v87 = (float)(v81 - (float)(v82 * 0.5));
                  v88 = (float)(v83 - (float)(v84 * 0.5));
                  v89 = v82;
                  v90 = v84;
                  v94 = 2;
                }
                *(_QWORD *)&v216 = v94;
                *(double *)buf = v87;
                *(double *)&buf[8] = v88;
                *(double *)&buf[16] = v89;
                v232 = v90;
                if (v93)
                  break;
                v57 += 4;
                v59 += 4;
                v60 += 9;
                v64 = ++v63 < v55;
                v45 = v209;
                if (v63 == v55)
                  goto LABEL_61;
              }
              CROSLogForCategory(6);
              v114 = objc_claimAutoreleasedReturnValue();
              v45 = v209;
              if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG))
              {
                v116 = *((_QWORD *)v219[1] - 3);
                v115 = *((_QWORD *)v219[1] - 2);
                *(_DWORD *)buf = v193;
                *(_QWORD *)&buf[4] = v116;
                *(_WORD *)&buf[12] = 2048;
                *(_QWORD *)&buf[14] = v115;
                _os_log_impl(&dword_1D4FB8000, v114, OS_LOG_TYPE_DEBUG, "Gating form detection result with rejection box found with size %.2f x %.2f", buf, 0x16u);
              }

              v13 = v195;
              v109 = v197;
              v110 = v198;
              v202 = MEMORY[0x1E0C9AA60];
            }
            else
            {
LABEL_61:
              v95 = v219[0];
              v96 = (__n128 *)v219[1];
              v97 = 0xAAAAAAAAAAAAAAABLL * (((char *)v219[1] - (char *)v219[0]) >> 4);
              if ((char *)v219[1] - (char *)v219[0] <= 6144)
              {
                v13 = v195;
                v102 = v204;
              }
              else
              {
                v13 = v195;
                v102 = v204;
                if (v98)
                  operator delete(v98);
              }
              v103 = v217[0];
              v104 = (__n128 *)v217[1];
              v105 = 0xAAAAAAAAAAAAAAABLL * (((char *)v217[1] - (char *)v217[0]) >> 4);
              if ((char *)v217[1] - (char *)v217[0] <= 6144)
              {
                v109 = v197;
              }
              else
              {
                v109 = v197;
                if (v106)
                  operator delete(v106);
              }
              v110 = v198;
              if (v219[0] == v219[1])
              {
                v113 = 0;
              }
              else
              {
                v111 = 0;
                v112 = (float *)((char *)v219[0] + 48);
                do
                {
                  v113 = v111 + 1;
                  if (*(v112 - 12) < -11.902)
                    break;
                  if (v111 > 0x2BA)
                    break;
                  ++v111;
                  v117 = v112 == v219[1];
                  v112 += 12;
                }
                while (!v117);
              }
              v117 = v113 >= 0xAAAAAAAAAAAAAAABLL * (((char *)v219[1] - (char *)v219[0]) >> 4)
                  || (char *)v219[0] + 48 * v113 == v219[1];
              if (!v117)
                v219[1] = (char *)v219[0] + 48 * v113;
              if (0xAAAAAAAAAAAAAAABLL * (((char *)v217[1] - (char *)v217[0]) >> 4) >= 0x2BD
                && (char *)v217[0] + 33600 != v217[1])
              {
                v217[1] = (char *)v217[0] + 33600;
              }
              if (v219[0])
              {
                v219[1] = v219[0];
                operator delete(v219[0]);
              }
              *(_OWORD *)v219 = *(_OWORD *)buf;
              v220 = *(_QWORD *)&buf[16];
              if (v217[0])
              {
                v217[1] = v217[0];
                operator delete(v217[0]);
              }
              *(_OWORD *)v217 = *(_OWORD *)buf;
              v218 = *(_QWORD *)&buf[16];
              *(_OWORD *)buf = *(_OWORD *)&v206[2 * v102];
              v216 = 0uLL;
              v216 = *((_OWORD *)__p + 2 * v102);
              -[CRFormDetector _denormalizeResults:imageSize:translation:](self, "_denormalizeResults:imageSize:translation:", v219, buf, &v216);
              CRLogger = CRLogger::getCRLogger((CRLogger *)-[CRFormDetector _denormalizeResults:imageSize:translation:](self, "_denormalizeResults:imageSize:translation:", v217, buf, &v216));
              if (*CRLogger && (CRLogger[8] & 8) != 0)
              {
                objc_msgSend(v207, "url");
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "setUrl:", v120);

                objc_msgSend((id)objc_opt_class(), "_saveDebugImage:byOverlayingResults:", v13, v219);
              }
              v64 = 0;
            }
            if (v217[0])
            {
              v217[1] = v217[0];
              operator delete(v217[0]);
            }
            if (v219[0])
            {
              v219[1] = v219[0];
              operator delete(v219[0]);
            }

            if (v64)
              goto LABEL_133;
            v52 = v204 + 1;
            if (v204 + 1 >= (unint64_t)(((char *)v227 - (_BYTE *)__p) >> 5))
            {
              if ((unint64_t)((char *)v227 - (_BYTE *)__p) >= 0x21)
              {
                v121 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)v224[1] - (char *)v224[0]) >> 4));
                if (v224[1] == v224[0])
                  v122 = 0;
                else
                  v122 = v121;
                v123 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)v222[1] - (char *)v222[0]) >> 4));
                if (v222[1] == v222[0])
                  v124 = 0;
                else
                  v124 = v123;
              }
              break;
            }
          }
        }
        if (0xAAAAAAAAAAAAAAABLL * (((char *)v222[1] - (char *)v222[0]) >> 4) >= 0x12D
          && (char *)v222[0] + 14400 != v222[1])
        {
          v222[1] = (char *)v222[0] + 14400;
        }
        if (v224[0])
        {
          v224[1] = v224[0];
          operator delete(v224[0]);
        }
        *(_OWORD *)v224 = *(_OWORD *)buf;
        v225 = *(_QWORD *)&buf[16];
        v125 = (CRLogger *)v222[0];
        if (v222[0])
        {
          v222[1] = v222[0];
          operator delete(v222[0]);
        }
        *(_OWORD *)v222 = *(_OWORD *)buf;
        v223 = *(_QWORD *)&buf[16];
        v126 = CRLogger::getCRLogger(v125);
        if (*v126 && (v126[8] & 8) != 0)
        {
          objc_msgSend(v207, "url");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setUrl:", v127);

          objc_msgSend((id)objc_opt_class(), "_saveDebugImage:byOverlayingResults:", v13, v224);
        }
        v128 = objc_msgSend(v207, "width");
        v129 = objc_msgSend(v207, "height");
        v130 = objc_msgSend(v13, "width");
        v131 = objc_msgSend(v13, "height");
        v132 = (double)v128;
        objc_msgSend((id)objc_opt_class(), "_detectorResultsFromSortedResults:imageSize:originalImageSize:", v224, (double)v130, (double)v131, (double)v128, (double)v129);
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        if (a5)
        {
          objc_msgSend((id)objc_opt_class(), "_detectorResultsFromSortedResults:imageSize:originalImageSize:", v222, (double)v130, (double)v131, v132, (double)v129);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        v47 = v133;
        v202 = v47;
LABEL_132:

LABEL_133:
        goto LABEL_134;
      }
      CROSLogForCategory(0);
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
      {
        v136 = __p;
        v135 = v227;
        v137 = objc_msgSend(v203, "count");
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = ((char *)v135 - v136) >> 5;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v137;
        _os_log_impl(&dword_1D4FB8000, v47, OS_LOG_TYPE_FAULT, "Form detection inference error, expected %ld outputs, got %ld.", buf, 0x16u);
      }
    }
    v202 = 0;
    goto LABEL_132;
  }
  v29 = 0;
  v30 = 0;
  v31 = v206 + 1;
  while (1)
  {
    objc_msgSend(v13, "imageByCroppingRectangle:", *(double *)&v28[v29], *(double *)&v28[v29 + 8], *(double *)&v28[v29 + 16], *(double *)&v28[v29 + 24]);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "width");
    v34 = objc_msgSend(v32, "height");
    *(v31 - 1) = (double)v33;
    *v31 = (double)v34;
    -[CRFormDetector configuration](self, "configuration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "resizeInputImage");

    if (v36)
    {
      v37 = objc_msgSend(v32, "width");
      v38 = objc_msgSend(v32, "height");
      v39 = v38 >= v37 ? v37 : v38;
    }
    else
    {
      v40 = objc_msgSend(v32, "width");
      v41 = objc_msgSend(v32, "height");
      v39 = v40 <= v41 ? v41 : v40;
    }
    v42 = (__CVBuffer *)objc_msgSend(v32, "pixelBufferWithScale:paddedToSize:", 640.0 / (double)v39, 640.0, 640.0);
    if (!v42)
      break;
    objc_msgSend((id)objc_opt_class(), "_multiArrayFromPixelBuffer:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferRelease(v42);
    if (!v43)
    {

      v202 = 0;
      v134 = v206;
      goto LABEL_135;
    }
    v44 = -[CRFormDetectorModelInput initWithMLMultiArray:]([CRFormDetectorModelInput alloc], "initWithMLMultiArray:", v43);
    objc_msgSend(v208, "addObject:", v44);

    ++v30;
    v28 = (char *)__p;
    v31 += 2;
    v29 += 32;
    if (v30 >= ((char *)v227 - (_BYTE *)__p) >> 5)
      goto LABEL_31;
  }
  CROSLogForCategory(0);
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4FB8000, v45, OS_LOG_TYPE_FAULT, "Error while creating buffer for form detection.", buf, 2u);
  }
  v202 = 0;
LABEL_134:

  v134 = v206;
  if (v206)
LABEL_135:
    operator delete(v134);
  if (v222[0])
  {
    v222[1] = v222[0];
    operator delete(v222[0]);
  }
  if (v224[0])
  {
    v224[1] = v224[0];
    operator delete(v224[0]);
  }
  if (__p)
  {
    v227 = (double *)__p;
    operator delete(__p);
  }

  return v202;
}

- (CRFormAnalyzerConfiguration)configuration
{
  return (CRFormAnalyzerConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (CRFormDetectorModel)model
{
  return (CRFormDetectorModel *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (__n128)detectFormFieldsInImage:(unint64_t)a3 document:(__n128 *)a4 outputCandidateResults:(uint64_t)a5
{
  uint64_t v7;
  __n128 *v8;
  __n128 v9;
  __n128 v10;
  __n128 v11;
  __n128 v12;
  unsigned __int32 *v14;
  uint64_t v15;
  uint64_t v16;
  __n128 *v17;
  uint64_t v18;
  float *v19;
  __int128 v20;
  uint64_t v21;
  __n128 *v23;
  unint64_t v24;
  __n128 *v25;
  unint64_t v26;
  __n128 v27;
  __n128 *v28;
  __n128 *v29;
  __n128 *v30;
  __n128 v31;
  __n128 v32;
  uint64_t v33;
  __n128 *v34;
  __n128 v35;
  uint64_t v36;
  __n128 *v37;
  __n128 v38;
  __int128 v39;
  _BYTE v40[28];

  if (a3 >= 2)
  {
    v7 = a1;
    if (a3 == 2)
    {
      v8 = a2 - 3;
      result.n128_u32[0] = a2[-3].n128_u32[0];
      if (result.n128_f32[0] > *(float *)a1)
      {
        result = *(__n128 *)a1;
        v9 = *(__n128 *)(a1 + 16);
        v10 = *(__n128 *)(a1 + 32);
        v12 = a2[-2];
        v11 = a2[-1];
        *(__n128 *)a1 = *v8;
        *(__n128 *)(a1 + 16) = v12;
        *(__n128 *)(a1 + 32) = v11;
        a2[-2] = v9;
        a2[-1] = v10;
        *v8 = result;
      }
    }
    else if ((uint64_t)a3 > 128)
    {
      v23 = a4;
      v24 = a3 >> 1;
      v25 = (__n128 *)(a1 + 48 * (a3 >> 1));
      v26 = a3 >> 1;
      if ((uint64_t)a3 <= a5)
      {
        v28 = &v23[3 * v24];
        v29 = &v23[3 * a3];
        v30 = v28;
        while (v30 != v29)
        {
          if (v30->n128_f32[0] <= v23->n128_f32[0])
          {
            result = *v23;
            v32 = v23[2];
            *(__n128 *)(v7 + 16) = v23[1];
            *(__n128 *)(v7 + 32) = v32;
            *(__n128 *)v7 = result;
            v23 += 3;
          }
          else
          {
            result = *v30;
            v31 = v30[2];
            *(__n128 *)(v7 + 16) = v30[1];
            *(__n128 *)(v7 + 32) = v31;
            *(__n128 *)v7 = result;
            v30 += 3;
          }
          v7 += 48;
          if (v23 == v28)
          {
            if (v30 != v29)
            {
              v33 = 0;
              do
              {
                v34 = (__n128 *)(v7 + v33 * 16);
                result = v30[v33];
                v35 = v30[v33 + 2];
                v34[1] = v30[v33 + 1];
                v34[2] = v35;
                *v34 = result;
                v33 += 3;
              }
              while (&v30[v33] != v29);
            }
            return result;
          }
        }
        if (v23 != v28)
        {
          v36 = 0;
          do
          {
            v37 = (__n128 *)(v7 + v36 * 16);
            result = v23[v36];
            v38 = v23[v36 + 2];
            v37[1] = v23[v36 + 1];
            v37[2] = v38;
            *v37 = result;
            v36 += 3;
          }
          while (&v23[v36] != v28);
        }
      }
      else
      {
      }
    }
    else if ((__n128 *)a1 != a2)
    {
      v14 = (unsigned __int32 *)(a1 + 48);
      if ((__n128 *)(a1 + 48) != a2)
      {
        v15 = 0;
        v16 = a1;
        do
        {
          v17 = (__n128 *)v14;
          result.n128_u32[0] = *v14;
          if (*(float *)v14 > *(float *)v16)
          {
            v39 = *(_OWORD *)(v16 + 52);
            *(_OWORD *)v40 = *(_OWORD *)(v16 + 68);
            *(_OWORD *)&v40[12] = *(_OWORD *)(v16 + 80);
            v18 = v15;
            while (1)
            {
              v19 = (float *)(a1 + v18);
              v20 = *(_OWORD *)(a1 + v18 + 16);
              *((_OWORD *)v19 + 3) = *(_OWORD *)(a1 + v18);
              *((_OWORD *)v19 + 4) = v20;
              *((_OWORD *)v19 + 5) = *(_OWORD *)(a1 + v18 + 32);
              if (!v18)
                break;
              v18 -= 48;
              if (result.n128_f32[0] <= *(v19 - 12))
              {
                v21 = a1 + v18 + 48;
                goto LABEL_15;
              }
            }
            v21 = a1;
LABEL_15:
            *(_DWORD *)v21 = result.n128_u32[0];
            *(_OWORD *)(v21 + 4) = v39;
            *(_OWORD *)(v21 + 20) = *(_OWORD *)v40;
            result = *(__n128 *)&v40[12];
            *(_OWORD *)(v21 + 32) = *(_OWORD *)&v40[12];
          }
          v14 = (unsigned __int32 *)&v17[3];
          v15 += 48;
          v16 = (uint64_t)v17;
        }
        while (&v17[3] != a2);
      }
    }
  }
  return result;
}

- (__n128)detectFormFieldsInImage:(unint64_t)a3 document:(__n128 *)a4 outputCandidateResults:(__n128)result
{
  __n128 *v5;
  __n128 *v8;
  __n128 v9;
  __n128 *v10;
  __n128 v11;
  __n128 v12;
  __n128 v13;
  __n128 v14;
  __n128 v15;
  __n128 *v16;
  uint64_t v17;
  __n128 *v18;
  __n128 *v19;
  float v20;
  __n128 *v21;
  __n128 v22;
  uint64_t v23;
  __n128 v24;
  __n128 v25;
  __n128 v26;
  __n128 v27;
  __n128 *v28;
  __n128 *v29;
  __n128 v30;
  __n128 v31;
  uint64_t v32;
  __n128 *v33;
  __n128 v34;
  uint64_t v35;
  __n128 *v36;
  __n128 v37;

  if (a3)
  {
    v5 = a4;
    v8 = a1;
    if (a3 == 2)
    {
      v10 = a2 - 3;
      if (a2[-3].n128_f32[0] <= a1->n128_f32[0])
      {
        v26 = *a1;
        v27 = a1[2];
        a4[1] = a1[1];
        a4[2] = v27;
        *a4 = v26;
        result = *v10;
        v13 = a2[-2];
        v14 = a2[-1];
      }
      else
      {
        v11 = *v10;
        v12 = a2[-1];
        a4[1] = a2[-2];
        a4[2] = v12;
        *a4 = v11;
        result = *a1;
        v13 = a1[1];
        v14 = a1[2];
      }
      a4[4] = v13;
      a4[5] = v14;
      a4[3] = result;
    }
    else if (a3 == 1)
    {
      result = *a1;
      v9 = a1[2];
      a4[1] = a1[1];
      a4[2] = v9;
      *a4 = result;
    }
    else if ((uint64_t)a3 > 8)
    {
      v28 = &a1[3 * (a3 >> 1)];
      v29 = &v8[3 * (a3 >> 1)];
      while (v29 != a2)
      {
        if (v29->n128_f32[0] <= v8->n128_f32[0])
        {
          result = *v8;
          v31 = v8[2];
          v5[1] = v8[1];
          v5[2] = v31;
          *v5 = result;
          v8 += 3;
        }
        else
        {
          result = *v29;
          v30 = v29[2];
          v5[1] = v29[1];
          v5[2] = v30;
          *v5 = result;
          v29 += 3;
        }
        v5 += 3;
        if (v8 == v28)
        {
          if (v29 != a2)
          {
            v32 = 0;
            do
            {
              v33 = &v5[v32];
              result = v29[v32];
              v34 = v29[v32 + 2];
              v33[1] = v29[v32 + 1];
              v33[2] = v34;
              *v33 = result;
              v32 += 3;
            }
            while (&v29[v32] != a2);
          }
          return result;
        }
      }
      if (v8 != v28)
      {
        v35 = 0;
        do
        {
          v36 = &v5[v35];
          result = v8[v35];
          v37 = v8[v35 + 2];
          v36[1] = v8[v35 + 1];
          v36[2] = v37;
          *v36 = result;
          v35 += 3;
        }
        while (&v8[v35] != v28);
      }
    }
    else if (a1 != a2)
    {
      result = *a1;
      v15 = a1[2];
      a4[1] = a1[1];
      a4[2] = v15;
      *a4 = result;
      v16 = a1 + 3;
      if (&a1[3] != a2)
      {
        v17 = 0;
        v18 = a4;
        do
        {
          v19 = v18;
          v20 = v18->n128_f32[0];
          v18 += 3;
          v21 = v18;
          if (v16->n128_f32[0] > v20)
          {
            v22 = v19[1];
            *v18 = *v19;
            v18[1] = v22;
            v18[2] = v19[2];
            v21 = a4;
            if (v19 != a4)
            {
              v23 = v17;
              while (1)
              {
                v21 = (__n128 *)((char *)a4 + v23);
                if (v16->n128_f32[0] <= *(float *)((char *)a4[-3].n128_f32 + v23))
                  break;
                v24 = *(__n128 *)((char *)a4 + v23 - 32);
                *v21 = *(__n128 *)((char *)a4 + v23 - 48);
                v21[1] = v24;
                v21[2] = *(__n128 *)((char *)a4 + v23 - 16);
                v23 -= 48;
                if (!v23)
                {
                  v21 = a4;
                  break;
                }
              }
            }
          }
          result = *v16;
          v25 = v16[2];
          v21[1] = v16[1];
          v21[2] = v25;
          *v21 = result;
          v16 += 3;
          v17 += 48;
        }
        while (v16 != a2);
      }
    }
  }
  return result;
}

- (char)detectFormFieldsInImage:(char *)a3 document:(uint64_t)a4 outputCandidateResults:(uint64_t)a5
{
  uint64_t v9;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  float *v22;
  char *v23;
  float v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  float *v28;
  char *v29;
  float v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  __int128 v41;
  __int128 v42;
  float *v43;
  char *v44;
  float v45;
  float v46;
  char *v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  char *v51;
  __int128 v52;
  __int128 v53;
  float *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  char *v59;
  __int128 v60;
  __int128 v61;
  unint64_t v62;
  char *v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  char *v67;
  char *__src;
  __int128 v69;
  __int128 v70;
  __int128 v71;

  if (a5)
  {
    v9 = a5;
    v11 = result;
    while (a4 > a7 && v9 > a7)
    {
      if (!a4)
        return result;
      v12 = 0;
      v13 = -a4;
      while (*(float *)a2 <= *(float *)&v11[v12])
      {
        v12 += 48;
        if (__CFADD__(v13++, 1))
          return result;
      }
      v15 = -v13;
      v67 = a3;
      __src = a6;
      v66 = a7;
      if (-v13 >= v9)
      {
        if (v13 == -1)
        {
          v59 = &v11[v12];
          v70 = *(_OWORD *)&v11[v12 + 16];
          v71 = *(_OWORD *)&v11[v12 + 32];
          v69 = *(_OWORD *)&v11[v12];
          v60 = *(_OWORD *)a2;
          v61 = *((_OWORD *)a2 + 2);
          *((_OWORD *)v59 + 1) = *((_OWORD *)a2 + 1);
          *((_OWORD *)v59 + 2) = v61;
          *(_OWORD *)v59 = v60;
          *(_OWORD *)a2 = v69;
          *((_OWORD *)a2 + 1) = v70;
          *((_OWORD *)a2 + 2) = v71;
          return result;
        }
        if (v13 > 0)
          v15 = 1 - v13;
        v25 = v15 >> 1;
        v19 = &v11[48 * (v15 >> 1) + v12];
        v18 = a2;
        if (a2 != a3)
        {
          v26 = 0xAAAAAAAAAAAAAAABLL * ((a3 - a2) >> 4);
          v18 = a2;
          do
          {
            v27 = v26 >> 1;
            v28 = (float *)&v18[48 * (v26 >> 1)];
            v30 = *v28;
            v29 = (char *)(v28 + 12);
            v26 += ~(v26 >> 1);
            if (v30 > *(float *)v19)
              v18 = v29;
            else
              v26 = v27;
          }
          while (v26);
        }
        v17 = 0xAAAAAAAAAAAAAAABLL * ((v18 - a2) >> 4);
      }
      else
      {
        if (v9 >= 0)
          v16 = v9;
        else
          v16 = v9 + 1;
        v17 = v16 >> 1;
        v18 = &a2[48 * (v16 >> 1)];
        v19 = a2;
        if (a2 - v11 != v12)
        {
          v20 = 0xAAAAAAAAAAAAAAABLL * ((a2 - v11 - v12) >> 4);
          v19 = &v11[v12];
          do
          {
            v21 = v20 >> 1;
            v22 = (float *)&v19[48 * (v20 >> 1)];
            v24 = *v22;
            v23 = (char *)(v22 + 12);
            v20 += ~(v20 >> 1);
            if (*(float *)v18 > v24)
              v20 = v21;
            else
              v19 = v23;
          }
          while (v20);
        }
        v25 = 0xAAAAAAAAAAAAAAABLL * ((v19 - v11 - v12) >> 4);
      }
      a4 = -v25 - v13;
      v31 = v9 - v17;
      v32 = v25;
      v34 = v32;
      v35 = v33;
      if (v34 + v17 >= v9 - (v34 + v17) - v13)
      {
        v38 = v34;
        a2 = v19;
        a7 = v66;
        v31 = v17;
        a6 = __src;
        a4 = v38;
        a3 = v35;
        v11 += v12;
      }
      else
      {
        v36 = v19;
        v37 = v17;
        a6 = __src;
        a7 = v66;
        v11 = v35;
        a2 = v18;
        a3 = v67;
      }
      v9 = v31;
      if (!v31)
        return result;
    }
    if (a4 <= v9)
    {
      if (v11 != a2)
      {
        v50 = 0;
        do
        {
          v51 = &a6[v50];
          v52 = *(_OWORD *)&v11[v50];
          v53 = *(_OWORD *)&v11[v50 + 32];
          *((_OWORD *)v51 + 1) = *(_OWORD *)&v11[v50 + 16];
          *((_OWORD *)v51 + 2) = v53;
          *(_OWORD *)v51 = v52;
          v50 += 48;
        }
        while (&v11[v50] != a2);
        if (v50)
        {
          v54 = (float *)a6;
          while (a2 != a3)
          {
            if (*(float *)a2 <= *v54)
            {
              v57 = *(_OWORD *)v54;
              v58 = *((_OWORD *)v54 + 2);
              *((_OWORD *)v11 + 1) = *((_OWORD *)v54 + 1);
              *((_OWORD *)v11 + 2) = v58;
              *(_OWORD *)v11 = v57;
              v54 += 12;
            }
            else
            {
              v55 = *(_OWORD *)a2;
              v56 = *((_OWORD *)a2 + 2);
              *((_OWORD *)v11 + 1) = *((_OWORD *)a2 + 1);
              *((_OWORD *)v11 + 2) = v56;
              *(_OWORD *)v11 = v55;
              a2 += 48;
            }
            v11 += 48;
            if (&a6[v50] == (char *)v54)
              return result;
          }
          return (char *)memmove(v11, v54, a6 - (char *)v54 + v50);
        }
      }
    }
    else if (a3 != a2)
    {
      v39 = 0;
      do
      {
        v40 = &a6[v39];
        v41 = *(_OWORD *)&a2[v39];
        v42 = *(_OWORD *)&a2[v39 + 32];
        *((_OWORD *)v40 + 1) = *(_OWORD *)&a2[v39 + 16];
        *((_OWORD *)v40 + 2) = v42;
        *(_OWORD *)v40 = v41;
        v39 += 48;
      }
      while (&a2[v39] != a3);
      if (v39)
      {
        v43 = (float *)&a6[v39];
        v44 = a3 - 48;
        while (a2 != v11)
        {
          v45 = *(v43 - 12);
          v46 = *((float *)a2 - 12);
          if (v45 <= v46)
            v47 = (char *)(v43 - 12);
          else
            v47 = a2 - 48;
          if (v45 <= v46)
            v43 -= 12;
          else
            a2 -= 48;
          v48 = *(_OWORD *)v47;
          v49 = *((_OWORD *)v47 + 2);
          *((_OWORD *)v44 + 1) = *((_OWORD *)v47 + 1);
          *((_OWORD *)v44 + 2) = v49;
          *(_OWORD *)v44 = v48;
          v44 -= 48;
          if (v43 == (float *)a6)
            return result;
        }
        v62 = 0;
        do
        {
          v63 = &v44[v62 * 4];
          v64 = *(_OWORD *)&v43[v62 - 12];
          v65 = *(_OWORD *)&v43[v62 - 4];
          *((_OWORD *)v63 + 1) = *(_OWORD *)&v43[v62 - 8];
          *((_OWORD *)v63 + 2) = v65;
          *(_OWORD *)v63 = v64;
          v62 -= 12;
        }
        while (&v43[v62] != (float *)a6);
      }
    }
  }
  return result;
}

- (void)detectFormFieldsInImage:(uint64_t)a3 document:(char)a4 outputCandidateResults:
{
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  float *v14;
  float *v15;
  __int128 v16;
  __int128 v17;
  float v18;
  uint64_t v19;
  float v20;
  unint64_t v21;
  float *v22;
  float v23;
  float v24;
  float *v25;
  __int128 v26;
  __int128 v27;
  float v28;
  float v29;
  __int128 v30;
  __int128 v31;
  BOOL v32;
  float v33;
  unint64_t v34;
  float *v35;
  float v36;
  __int128 v37;
  __int128 v38;
  float v39;
  float v40;
  __int128 v41;
  __int128 v42;
  float *v43;
  float v44;
  __int128 v45;
  __int128 v46;
  __int128 *v47;
  __int128 *v48;
  __int128 *v49;
  float *v50;
  float v51;
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
  float *v65;
  BOOL v67;
  uint64_t v68;
  unint64_t v69;
  float *v70;
  float v71;
  uint64_t v72;
  float *v73;
  __int128 v74;
  uint64_t v75;
  int64_t v76;
  int64_t v77;
  int64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  float v82;
  _OWORD *v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  uint64_t v87;
  int64_t v88;
  uint64_t v89;
  float *v90;
  float *v91;
  uint64_t v92;
  int64_t v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint64_t v98;
  unint64_t v99;
  float *v100;
  float v101;
  float *v102;
  __int128 v103;
  __int128 v104;
  uint64_t v106;
  float v107;
  float *v108;
  __int128 v109;
  float v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[28];
  _BYTE v115[28];
  _BYTE v116[28];
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
  _BYTE v132[28];
  _BYTE v133[28];
  __int128 v134;
  _BYTE v135[28];
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;

@end
