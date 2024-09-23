@implementation WBSSiteIconKeyColorExtractor

+ (id)keyColorForIcon:(id)a3
{
  _OWORD v4[2];
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  memset(v4, 0, sizeof(v4));
  objc_msgSend(a1, "keyColorForIcon:allowAllColors:confidence:nonTransparentConfidence:insets:", a3, 0, &v6, &v5, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)keyColorForIcon:(id)a3 allowAllColors:(BOOL)a4 confidence:(double *)a5 nonTransparentConfidence:(double *)a6 insets:(UIEdgeInsets *)a7
{
  _BOOL4 v10;
  id v12;
  void *v13;
  WBSSiteIconKeyColorExtractorCache *v14;
  WBSSiteIconKeyColorExtractorCache *v15;
  uint64_t v16;
  uint64_t v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  CGImage *v23;
  size_t Height;
  size_t Width;
  unint64_t v26;
  char *v27;
  _BYTE *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  unint64_t v33;
  unint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  _BYTE *v39;
  unint64_t v40;
  double v41;
  unsigned int v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double *v48;
  double v49;
  unsigned int v50;
  uint64_t v51;
  char *v52;
  char *v53;
  unint64_t v54;
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
  WBSSiteIconKeyColorExtractorCache *v65;
  double v67;
  unint64_t v68;
  double v69;
  double *v70;
  id v71;

  v10 = a4;
  v12 = a3;
  v13 = v12;
  if (v12)
  {
    objc_getAssociatedObject(v12, &keyColorForIcon_allowAllColors_confidence_nonTransparentConfidence_insets__iconColorImageKey);
    v14 = (WBSSiteIconKeyColorExtractorCache *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v10 && v14)
    {
      -[WBSSiteIconKeyColorExtractorCache confidence](v14, "confidence");
      *(_QWORD *)a5 = v16;
      -[WBSSiteIconKeyColorExtractorCache nonTransparentConfidence](v15, "nonTransparentConfidence");
      *(_QWORD *)a6 = v17;
      -[WBSSiteIconKeyColorExtractorCache insets](v15, "insets");
      a7->top = v18;
      a7->left = v19;
      a7->bottom = v20;
      a7->right = v21;
      -[WBSSiteIconKeyColorExtractorCache color](v15, "color");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v71 = objc_retainAutorelease(v13);
      v23 = (CGImage *)objc_msgSend(v71, "CGImage");
      Height = CGImageGetHeight(v23);
      Width = CGImageGetWidth(v23);
      if (Width * Height)
      {
        v26 = Width;
        v68 = Width * Height;
        v70 = a6;
        v27 = (char *)malloc_type_calloc(0x200uLL, 0x28uLL, 0x10000400A747E1EuLL);
        v28 = (_BYTE *)objc_msgSend(a1, "_createRGBAPixelBufferFromImage:", v23);
        v32 = (double)Height;
        v33 = 0;
        if (Height)
        {
          v34 = 0;
          v35 = 0.0;
          v36 = (double)Height;
          v37 = (double)v26;
          v38 = 0.0;
          v39 = v28;
          do
          {
            if (v26)
            {
              v40 = 0;
              v41 = (double)v34;
              do
              {
                v42 = v39[3];
                if (v42 >= 0xA)
                {
                  v43 = (double)v40;
                  if (v36 >= v41)
                    v36 = (double)v34;
                  if (v37 >= v43)
                    v37 = (double)v40;
                  if (v35 <= v41)
                    v35 = (double)v34;
                  v44 = (double)v42;
                  v45 = 255.0 / (double)v42;
                  LOBYTE(v29) = v39[2];
                  v46 = v45 * (double)*(unint64_t *)&v29;
                  LOBYTE(v30) = v39[1];
                  v30 = v45 * (double)*(unint64_t *)&v30;
                  LOBYTE(v31) = *v39;
                  v47 = v45 * (double)*(unint64_t *)&v31;
                  if (v38 <= v43)
                    v38 = (double)v40;
                  v48 = (double *)&v27[40
                                     * (((int)v30 >> 2) & 0x38 | ((int)v46 >> 5 << 6) | ((int)v47 >> 5))];
                  v31 = v48[1];
                  v49 = v46 + *v48;
                  ++*((_QWORD *)v48 + 4);
                  *v48 = v49;
                  v48[1] = v30 + v31;
                  v29 = v48[3];
                  v48[2] = v47 + v48[2];
                  v48[3] = v29 + v44;
                  ++v33;
                }
                v39 += 4;
                ++v40;
              }
              while (v26 != v40);
            }
            ++v34;
          }
          while (v34 != Height);
        }
        else
        {
          v38 = 0.0;
          v35 = 0.0;
          v37 = (double)v26;
          v36 = (double)0;
        }
        free(v28);
        v50 = 0;
        v51 = 0;
        v52 = v27;
        v53 = v27;
        do
        {
          if ((v10 || v51 && v51 != 511) && *((_QWORD *)v52 + 4) > (unint64_t)v50)
          {
            v53 = v52;
            v50 = *((_QWORD *)v52 + 4);
          }
          ++v51;
          v52 += 40;
        }
        while (v51 != 512);
        if (v10 || v53 != v27)
        {
          v54 = *((_QWORD *)v53 + 4);
          if (v54)
          {
            v55 = (double)(255 * v54);
            v56 = *(double *)v53;
            v57 = *((double *)v53 + 1);
            v58 = *((double *)v53 + 2);
            v59 = *((double *)v53 + 3);
            *a5 = (double)v54 / (double)v68;
            v60 = v56 / v55;
            v67 = v57 / v55;
            v69 = v58 / v55;
            *v70 = (double)v54 / (double)v33;
            v61 = v59 / v55;
            objc_msgSend(v71, "size");
            v63 = v62 / (double)v26;
            objc_msgSend(v71, "size");
            a7->top = v36 * (v64 / v32);
            a7->left = v37 * v63;
            a7->bottom = v35 * (v64 / v32);
            a7->right = v38 * v63;
            free(v27);
            objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v60 * v61, v67 * v61, v69 * v61, 1.0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v10)
            {
              v65 = objc_alloc_init(WBSSiteIconKeyColorExtractorCache);

              -[WBSSiteIconKeyColorExtractorCache setColor:](v65, "setColor:", v22);
              -[WBSSiteIconKeyColorExtractorCache setConfidence:](v65, "setConfidence:", *a5);
              -[WBSSiteIconKeyColorExtractorCache setNonTransparentConfidence:](v65, "setNonTransparentConfidence:", *v70);
              -[WBSSiteIconKeyColorExtractorCache setInsets:](v65, "setInsets:", a7->top, a7->left, a7->bottom, a7->right);
              objc_setAssociatedObject(v71, &keyColorForIcon_allowAllColors_confidence_nonTransparentConfidence_insets__iconColorImageKey, v65, (void *)1);
              v15 = v65;
            }
            goto LABEL_39;
          }
        }
        free(v27);
      }
      v22 = 0;
    }
LABEL_39:

    goto LABEL_40;
  }
  v22 = 0;
LABEL_40:

  return v22;
}

+ (char)_createRGBAPixelBufferFromImage:(CGImage *)a3
{
  unint64_t Width;
  unint64_t Height;
  void *v6;
  CGColorSpace *DeviceRGB;
  CGContext *v8;
  CGRect v10;

  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  v6 = malloc_type_malloc(4 * Width * Height, 0xFC65C75FuLL);
  bzero(v6, 4 * Width * Height);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v8 = CGBitmapContextCreate(v6, Width, Height, 8uLL, 4 * Width, DeviceRGB, 0x2002u);
  CGColorSpaceRelease(DeviceRGB);
  v10.size.width = (double)Width;
  v10.size.height = (double)Height;
  v10.origin.x = 0.0;
  v10.origin.y = 0.0;
  CGContextDrawImage(v8, v10, a3);
  CGContextRelease(v8);
  return (char *)v6;
}

@end
