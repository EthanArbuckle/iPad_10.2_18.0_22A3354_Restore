@implementation SCRCPhotoEvaluatorBlur

+ (id)detect:(id)a3 inRect:(CGRect)a4
{
  CGFloat height;
  double width;
  CGFloat y;
  double x;
  id v9;
  SCRCPhotoEvaluatorResultBlur *v10;
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
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  _QWORD v77[3];
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v86 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  if (detect_inRect__onceToken != -1)
    dispatch_once(&detect_inRect__onceToken, &__block_literal_global_6);
  v87.origin.x = x;
  v87.origin.y = y;
  v87.size.width = width;
  v87.size.height = height;
  if (!CGRectIsEmpty(v87))
  {
    v88.origin.x = x;
    v88.origin.y = y;
    v88.size.width = width;
    v88.size.height = height;
    if (!CGRectIsNull(v88))
    {
      v89.origin.x = x;
      v89.origin.y = y;
      v89.size.width = width;
      v89.size.height = height;
      if (!CGRectIsInfinite(v89))
      {
        v12 = objc_msgSend(v9, "width");
        v13 = objc_msgSend(v9, "data");
        v14 = objc_msgSend(v9, "bytesPerPixel");
        v15 = objc_msgSend(v9, "width");
        objc_msgSend(v9, "height");
        v77[2] = v77;
        v16 = v15 - (uint64_t)width;
        if (v16 >= (uint64_t)x)
          v16 = (uint64_t)x;
        if ((uint64_t)x >= 0)
          v17 = v16;
        else
          v17 = 0;
        v18 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
        v25 = (_QWORD *)((char *)v77 - v23);
        v85 = v15;
        v78 = v9;
        if (v26 < 1)
        {
          v42 = 0;
        }
        else
        {
          v83 = v18;
          v27 = 0;
          v28 = (uint64_t)fmax((double)v12 / 500.0, 1.0);
          v29 = (double)(v22 - v28);
          v84 = v28;
          v30 = (double)v28;
          v31 = (double)v21;
          v82 = v19;
          if (v19 <= 1)
            v32 = 1;
          else
            v32 = v19;
          v33 = v32;
          v34 = (_QWORD *)((char *)v77 - v23);
          do
          {
            v35 = v20;
            v36 = (uint64_t)(v30 + (double)rand() / 2147483650.0 * v29);
            v37 = rand();
            v20 = v35;
            v24 = v85;
            v38 = v17 + v36 + (v35 + (uint64_t)((double)v37 / 2147483650.0 * v31)) * v85;
            v39 = ((21846
                  * (*(unsigned __int8 *)(v13 + v38 * v14 + 1)
                   + *(unsigned __int8 *)(v13 + v38 * v14)
                   + *(unsigned __int8 *)(v13 + v38 * v14 + 2))) >> 16)
                - (unint64_t)((21846
                                    * (*(unsigned __int8 *)(v13 + (v38 - v84) * v14 + 1)
                                     + *(unsigned __int8 *)(v13 + (v38 - v84) * v14)
                                     + *(unsigned __int8 *)(v13 + (v38 - v84) * v14 + 2))) >> 16);
            *v34++ = v39;
            v27 += v39;
            --v33;
          }
          while (v33);
          v40 = 0;
          do
          {
            v41 = *v25++;
            v40 = (uint64_t)((double)(v41 - v27 / v82) * (double)(v41 - v27 / v82) + (double)v40);
            --v32;
          }
          while (v32);
          v42 = v40 / v82;
          v43 = 0.0;
          v9 = v78;
          v18 = v83;
          if (v40 / v82 > 150)
          {
LABEL_52:
            v10 = -[SCRCPhotoEvaluatorResultBlur initWithBlurLevel:]([SCRCPhotoEvaluatorResultBlur alloc], "initWithBlurLevel:", v43);
            goto LABEL_7;
          }
        }
        v77[0] = v42;
        v77[1] = v77;
        v44 = (double)(v18 / 15 * (v24 / 15)) * 0.25;
        if (v44 < 150.0)
          v44 = 150.0;
        v45 = (uint64_t)v44;
        v46 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
        v47 = MEMORY[0x24BDAC7A8](v46);
        v52 = (char *)v77 - v51;
        v53 = 0;
        v54 = 0;
        v55 = 0;
        if ((unint64_t)(v56 + 14) < 0x1D)
          v57 = 1;
        else
          v57 = v49;
        v79 = v57;
        v80 = v47;
        v58 = (double)(v57 - 1);
        v59 = (double)v47;
        v60 = *(double *)(v48 + 1464);
        v81 = v50;
        do
        {
          v61 = 0;
          v62 = v53 * v79;
          v82 = v53;
          do
          {
            if (v45 < 1)
            {
              v68 = 0;
            }
            else
            {
              v83 = v61;
              v84 = v54;
              v63 = 0;
              v64 = v61 * v80;
              do
              {
                v65 = (uint64_t)((double)rand() / v60 * v58 + 1.0);
                v66 = (v62 + v65 + (v64 + (uint64_t)((double)rand() / v60 * v59)) * v85) * v14;
                v67 = ((21846
                      * (*(unsigned __int8 *)(v13 + v66 + 1)
                       + *(unsigned __int8 *)(v13 + v66)
                       + *(unsigned __int8 *)(v13 + v66 + 2))) >> 16)
                    - (unint64_t)((21846
                                        * (*(unsigned __int8 *)(v13 + v66 - v14 + 1)
                                         + *(unsigned __int8 *)(v13 + v66 - v14)
                                         + *(unsigned __int8 *)(v13 + v66 - v14 + 2))) >> 16);
                *(_QWORD *)&v52[8 * v63] = v67;
                v55 += v67;
                ++v63;
              }
              while (v45 != v63);
              v68 = 0;
              v69 = v45;
              v70 = (uint64_t *)v52;
              do
              {
                v71 = *v70++;
                v68 = (uint64_t)((double)(v71 - v55 / v45) * (double)(v71 - v55 / v45) + (double)v68);
                --v69;
              }
              while (v69);
              v50 = v81;
              v53 = v82;
              v61 = v83;
              v54 = v84;
            }
            v72 = v68 / v45;
            *(_QWORD *)(v50 + 8 * (v53 - v61 + 16 * v61)) = v72;
            v54 += v72;
            ++v61;
          }
          while (v61 != 15);
          ++v53;
        }
        while (v53 != 15);
        v9 = v78;
        if (v77[0] > 59)
          goto LABEL_47;
        v73 = 0;
        v74 = 0;
        do
        {
          if (*(uint64_t *)(v50 + v73) < 100)
            ++v74;
          v73 += 8;
        }
        while (v73 != 1800);
        v43 = (double)v74 / 225.0;
        if (v43 <= 0.7 || v43 < 0.0)
        {
LABEL_47:
          v75 = 0;
          v76 = 0;
          do
          {
            if (*(_QWORD *)(v50 + v75) < v54 / 225)
              ++v76;
            v75 += 8;
          }
          while (v75 != 1800);
          v43 = (double)v76 / 225.0;
        }
        goto LABEL_52;
      }
    }
  }
  objc_msgSend(a1, "detect:", v9);
  v10 = (SCRCPhotoEvaluatorResultBlur *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v10;
}

void __40__SCRCPhotoEvaluatorBlur_detect_inRect___block_invoke()
{
  CFAbsoluteTime Current;

  Current = CFAbsoluteTimeGetCurrent();
  srand(Current);
}

@end
