@implementation CRFormContourBasedDetector

- (CRFormContourBasedDetector)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  CRFormContourBasedDetector *v7;
  CRFormContourBasedDetector *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRFormContourBasedDetector;
  v7 = -[CRFormContourBasedDetector init](&v10, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_configuration, a3);

  return v8;
}

- (id)detectFormFieldsInImage:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  double v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  _BYTE *CRLogger;
  void *v21;
  CRLogger *v22;
  _BYTE *v23;
  void *v24;
  CRLogger *v25;
  _BYTE *v26;
  CGImage *ImageFromContour;
  void *v28;
  CGImage *v29;
  void *v30;
  int32x2_t *v31;
  int32x2_t *v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  double x;
  double y;
  double width;
  CGFloat height;
  _QWORD *v42;
  _QWORD *v43;
  CRNormalizedQuad *v44;
  CRFormField *v45;
  void **v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  _QWORD *v57;
  _QWORD *v58;
  CRNormalizedQuad *v59;
  CRFormField *v60;
  CRNormalizedQuad *v61;
  _BYTE *v62;
  int32x2_t *v63;
  CGImageRef v64;
  void *v65;
  void *v66;
  CGImage *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  _OWORD v78[2];
  uint64_t v79[3];
  _QWORD v80[4];
  CRNormalizedQuad *v81;
  void *__p;
  int32x2_t *v83;
  uint64_t v84;
  void **v85;
  _QWORD *v86;
  unint64_t v87;
  _OWORD v88[2];
  uint64_t v89[3];
  _OWORD v90[2];
  uint64_t v91[3];
  void **v92;
  void **v93;
  uint64_t v94;
  uint64_t v95;
  __int128 v96;
  __int128 v97;
  uint64_t v98;
  int v99;
  _OWORD v100[2];
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  CGRect v105;
  CGRect v106;

  v3 = a3;
  v4 = objc_msgSend(v3, "width");
  v5 = objc_msgSend(v3, "height");
  v6 = fmin((double)(unint64_t)objc_msgSend(v3, "width"), (double)(unint64_t)objc_msgSend(v3, "height"));
  if (v6 > 1224.0)
  {
    objc_msgSend(v3, "imageByScalingToWidth:height:", (unint64_t)(1224.0 / v6 * (double)(unint64_t)objc_msgSend(v3, "width")), (unint64_t)(1224.0 / v6 * (double)(unint64_t)objc_msgSend(v3, "height")));
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v7;
  }
  objc_msgSend(v3, "imageByConvertingToColorSpace:forceDataCopy:", 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v3, "url");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v8;
  objc_msgSend(v13, "URLByDeletingPathExtension");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastPathComponent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("null%lu"), objc_msgSend(v3, "hash"));
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  if (v8)
  {
    objc_msgSend(v8, "vImage");
    v19 = *((_QWORD *)&v97 + 1);
    v103 = 0u;
    v104 = 0u;
    objc_msgSend(v8, "vImage");
  }
  else
  {
    v19 = 0;
    v103 = 0u;
    v104 = 0u;
  }
  *(_QWORD *)&v101 = malloc_type_malloc(v19 * (unint64_t)v12, 0xA9050F13uLL);
  *((_QWORD *)&v101 + 1) = (unint64_t)v12;
  *(_QWORD *)&v102 = (unint64_t)v10;
  *((_QWORD *)&v102 + 1) = v19;
  CRLogger = CRLogger::getCRLogger((CRLogger *)v101);
  if (*CRLogger && (CRLogger[8] & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/form_%@_contours_1_src.png"), v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v103;
    v97 = v104;
    writeBufferWithMetadata((uint64_t)&v96, v21, 0);

  }
  if ((unint64_t)v104 < 0x33 || *((_QWORD *)&v103 + 1) < 0x33uLL)
  {
    free((void *)v101);
    v63 = (int32x2_t *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v100[0] = v103;
    v100[1] = v104;
    adaptiveThresholdIntegralImage((uint64_t)v100, (uint64_t *)&v101, 50, 10);
    v23 = CRLogger::getCRLogger(v22);
    if (*v23 && (v23[8] & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/form_%@_contours_2_img.png"), v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = v101;
      v97 = v102;
      writeBufferWithMetadata((uint64_t)&v96, v24, 0);

    }
    v98 = 0x340200000;
    v99 = 1080033280;
    RectangleFinder::traceAllContoursWithoutFiltering((RectangleFinder *)&v101, (const vImage_Buffer *)0xFF, &v94);
    v74 = v18;
    v75 = v3;
    RectangleFinder::identifyRectangleContours(&v94, (uint64_t *)&v92);
    v26 = CRLogger::getCRLogger(v25);
    if (*v26 && (v26[8] & 8) != 0)
    {
      memset(v91, 0, sizeof(v91));
      std::vector<std::vector<PixelPosition>>::__init_with_size[abi:ne180100]<std::vector<PixelPosition>*,std::vector<PixelPosition>*>(v91, v94, v95, 0xAAAAAAAAAAAAAAABLL * ((v95 - v94) >> 3));
      v90[0] = v101;
      v90[1] = v102;
      ImageFromContour = createImageFromContour(v91, (uint64_t)v90);
      v85 = (void **)v91;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v85);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/form_%@_contours_3_lines.png"), v18);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      writeCGImageWithMetadata(ImageFromContour, v28, 0);
      CGImageRelease(ImageFromContour);
      memset(v89, 0, sizeof(v89));
      std::vector<std::vector<PixelPosition>>::__init_with_size[abi:ne180100]<std::vector<PixelPosition>*,std::vector<PixelPosition>*>(v89, (uint64_t)v92, (uint64_t)v93, 0xAAAAAAAAAAAAAAABLL * (v93 - v92));
      v88[0] = v101;
      v88[1] = v102;
      v29 = createImageFromContour(v89, (uint64_t)v88);
      v85 = (void **)v89;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v85);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/form_%@_contours_3_rects.png"), v18);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      writeCGImageWithMetadata(v29, v30, 0);
      CGImageRelease(v29);

    }
    v85 = 0;
    v86 = 0;
    v87 = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v31 = (int32x2_t *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    v77 = (double)v4;
    v33 = (double)v5;
    v34 = v94;
    if (v95 != v94)
    {
      v35 = 0;
      v36 = 0;
      do
      {
        __p = 0;
        v83 = 0;
        v84 = 0;
        std::vector<PixelPosition>::__init_with_size[abi:ne180100]<PixelPosition*,PixelPosition*>(&__p, *(const void **)(v34 + v35), *(_QWORD *)(v34 + v35 + 8), (uint64_t)(*(_QWORD *)(v34 + v35 + 8) - *(_QWORD *)(v34 + v35)) >> 3);
        v31 = (int32x2_t *)__p;
        if ((unint64_t)((char *)v83 - (_BYTE *)__p) >= 0x58)
        {
          *(_QWORD *)&v105.origin.x = *(_OWORD *)&boxForContour((int32x2_t *)__p, v83);
          x = v105.origin.x;
          y = v105.origin.y;
          width = v105.size.width;
          height = v105.size.height;
          if (CGRectGetWidth(v105) > 20.0)
          {
            v106.origin.x = x;
            v106.origin.y = y;
            v106.size.width = width;
            v106.size.height = height;
            if (CGRectGetHeight(v106) < 6.0 && y > 30.0)
            {
              v42 = v86;
              if ((unint64_t)v86 >= v87)
              {
                v43 = (_QWORD *)std::vector<std::vector<PixelPosition>>::__push_back_slow_path<std::vector<PixelPosition> const&>((uint64_t *)&v85, (uint64_t)&__p);
              }
              else
              {
                *v86 = 0;
                v42[1] = 0;
                v42[2] = 0;
                std::vector<PixelPosition>::__init_with_size[abi:ne180100]<PixelPosition*,PixelPosition*>(v42, __p, (uint64_t)v83, ((char *)v83 - (_BYTE *)__p) >> 3);
                v43 = v42 + 3;
              }
              v86 = v43;
              v44 = -[CRNormalizedQuad initWithNormalizedBoundingBox:size:]([CRNormalizedQuad alloc], "initWithNormalizedBoundingBox:size:", x / v10, fmax(y + -30.0, 0.0) / v12, width / v10, 30.0 / v12, v77, v33);
              v45 = -[CRFormField initWithQuad:type:source:value:contentType:maxCharacterCount:]([CRFormField alloc], "initWithQuad:type:source:value:contentType:maxCharacterCount:", v44, 1, 2, 0, 0, 0x7FFFFFFFFFFFFFFFLL);
              -[CRFormField setHasBoundedWidth:](v45, "setHasBoundedWidth:", 1);
              -[CRFormField setHasBoundedHeight:](v45, "setHasBoundedHeight:", 0);
              -[int32x2_t addObject:](v32, "addObject:", v45);

            }
          }
          v31 = (int32x2_t *)__p;
        }
        if (v31)
        {
          v83 = v31;
          operator delete(v31);
        }
        ++v36;
        v34 = v94;
        v35 += 24;
      }
      while (v36 < 0xAAAAAAAAAAAAAAABLL * ((v95 - v94) >> 3));
    }
    v46 = v92;
    if (v93 != v92)
    {
      v47 = 0;
      v48 = 0;
      v49 = MEMORY[0x1E0C809B0];
      do
      {
        __p = 0;
        v83 = 0;
        v84 = 0;
        std::vector<PixelPosition>::__init_with_size[abi:ne180100]<PixelPosition*,PixelPosition*>(&__p, v46[v47], (uint64_t)v46[v47 + 1], ((_BYTE *)v46[v47 + 1] - (_BYTE *)v46[v47]) >> 3);
        *(_QWORD *)&v50 = *(_OWORD *)&boxForContour((int32x2_t *)__p, v83);
        v52 = v51;
        v54 = v53;
        v56 = v55;
        v57 = v86;
        if ((unint64_t)v86 >= v87)
        {
          v58 = (_QWORD *)std::vector<std::vector<PixelPosition>>::__push_back_slow_path<std::vector<PixelPosition> const&>((uint64_t *)&v85, (uint64_t)&__p);
        }
        else
        {
          *v86 = 0;
          v57[1] = 0;
          v57[2] = 0;
          std::vector<PixelPosition>::__init_with_size[abi:ne180100]<PixelPosition*,PixelPosition*>(v57, __p, (uint64_t)v83, ((char *)v83 - (_BYTE *)__p) >> 3);
          v58 = v57 + 3;
        }
        v86 = v58;
        v59 = -[CRNormalizedQuad initWithNormalizedBoundingBox:size:]([CRNormalizedQuad alloc], "initWithNormalizedBoundingBox:size:", v50 / v10, v52 / v12, v54 / v10, v56 / v12, v77, v33);
        v60 = -[CRFormField initWithQuad:type:source:value:contentType:maxCharacterCount:]([CRFormField alloc], "initWithQuad:type:source:value:contentType:maxCharacterCount:", v59, 1, 2, 0, 0, 0x7FFFFFFFFFFFFFFFLL);
        -[CRFormField setHasBoundedWidth:](v60, "setHasBoundedWidth:", 1);
        -[CRFormField setHasBoundedHeight:](v60, "setHasBoundedHeight:", 1);
        v80[0] = v49;
        v80[1] = 3221225472;
        v80[2] = __54__CRFormContourBasedDetector_detectFormFieldsInImage___block_invoke;
        v80[3] = &unk_1E98D9FE8;
        v61 = v59;
        v81 = v61;
        if (-[int32x2_t indexOfObjectPassingTest:](v32, "indexOfObjectPassingTest:", v80) == 0x7FFFFFFFFFFFFFFFLL)
          -[int32x2_t addObject:](v32, "addObject:", v60);

        v31 = (int32x2_t *)__p;
        if (__p)
        {
          v83 = (int32x2_t *)__p;
          operator delete(__p);
        }
        ++v48;
        v46 = v92;
        v47 += 3;
      }
      while (v48 < 0xAAAAAAAAAAAAAAABLL * (v93 - v92));
    }
    v62 = CRLogger::getCRLogger((CRLogger *)v31);
    v18 = v74;
    v3 = v75;
    v8 = v76;
    v63 = v32;
    if (*v62 && (v62[8] & 8) != 0)
    {
      memset(v79, 0, sizeof(v79));
      std::vector<std::vector<PixelPosition>>::__init_with_size[abi:ne180100]<std::vector<PixelPosition>*,std::vector<PixelPosition>*>(v79, (uint64_t)v85, (uint64_t)v86, 0xAAAAAAAAAAAAAAABLL * ((void **)v86 - v85));
      v78[0] = v101;
      v78[1] = v102;
      v64 = createImageFromContour(v79, (uint64_t)v78);
      __p = v79;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      objc_msgSend(v75, "url");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "URLByDeletingPathExtension");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v64;
      objc_msgSend(v66, "lastPathComponent");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v68;
      if (v68)
      {
        v70 = v68;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("null%lu"), objc_msgSend(v75, "hash"));
        v70 = (id)objc_claimAutoreleasedReturnValue();
      }
      v71 = v70;

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/form_%@_contours_4_final.png"), v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      writeCGImageWithMetadata(v67, v72, 0);
      CGImageRelease(v67);

    }
    free((void *)v101);
    __p = &v85;
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
    v85 = (void **)&v92;
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v85);
    v92 = (void **)&v94;
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v92);
  }

  return v63;
}

uint64_t __54__CRFormContourBasedDetector_detectFormFieldsInImage___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "boundingQuad");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)v7)
    *a4 = 1;
  return v7;
}

- (CRFormAnalyzerConfiguration)configuration
{
  return (CRFormAnalyzerConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
