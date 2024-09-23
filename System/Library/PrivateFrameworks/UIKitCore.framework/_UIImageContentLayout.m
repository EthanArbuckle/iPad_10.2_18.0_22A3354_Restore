@implementation _UIImageContentLayout

- (CGAffineTransform)contentsTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[4].d;
  return self;
}

- (double)contentsScaleFactor
{
  return self->_contentsScaleFactor;
}

- (id)contents
{
  -[_UIImageContentLayout _materializeRenditionContents]((uint64_t)self);
  return self->_contentInfo.contents;
}

+ (id)layoutForSource:(id)a3 inTarget:(id)a4 withSize:(CGSize)a5
{
  char *v5;
  double height;
  double width;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  UIUserInterfaceLayoutDirection v29;
  uint64_t v30;
  uint64_t v31;
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
  BOOL v53;
  double v54;
  double v55;
  char v56;
  uint64_t v57;
  id v58;
  char *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  float64x2_t *v64;
  double v65;
  double v66;
  double v67;
  uint64_t v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  CGFloat x;
  CGFloat y;
  CGFloat v79;
  CGFloat v80;
  double MinY;
  CGFloat v82;
  uint64_t v83;
  double MinX;
  CGFloat v85;
  uint64_t v86;
  uint64_t v87;
  double MaxY;
  CGFloat v89;
  uint64_t v90;
  uint64_t v91;
  double MaxX;
  CGFloat v93;
  uint64_t v94;
  double v95;
  double v96;
  id v97;
  id v98;
  void *v99;
  double v100;
  double v101;
  CGFloat v102;
  void *v103;
  void *v104;
  double v105;
  double v106;
  double v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v113;
  void *v114;
  double v115;
  void (**v116)(_QWORD *__return_ptr);
  double v117;
  double v118;
  double v119;
  unint64_t v120;
  uint64_t v121;
  CGAffineTransform v122;
  _QWORD aBlock[4];
  id v124;
  char *v125;
  uint64_t *v126;
  double v127;
  double v128;
  unint64_t v129;
  uint64_t v130;
  uint64_t v131;
  double v132;
  double v133;
  double v134;
  double v135;
  char v136;
  uint64_t v137;
  float64x2_t *v138;
  uint64_t v139;
  void *v140;
  double v141;
  double v142;
  id v143;
  id v144;
  uint64_t v145;
  objc_super v146;
  CGAffineTransform v147;
  double v148;
  double v149;
  double v150;
  CGFloat v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;

  v5 = 0;
  if (a3 && a4)
  {
    height = a5.height;
    width = a5.width;
    v10 = a4;
    v11 = a3;
    v5 = (char *)objc_alloc((Class)a1);
    v12 = v11;
    v13 = v10;
    if (v5)
    {
      v146.receiver = v5;
      v146.super_class = (Class)_UIImageContentLayout;
      v5 = objc_msgSendSuper2(&v146, sel_init);
      if (v5)
      {
        objc_msgSend(v12, "content");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v144 = 0;
        v145 = 0;
        v143 = 0;
        __copy_assignment_8_8_s0_s8_t16w8((uint64_t)(v5 + 24), (uint64_t)&v143);
        objc_msgSend(v14, "size");
        *((_QWORD *)v5 + 11) = v15;
        *((_QWORD *)v5 + 12) = v16;
        v17 = MEMORY[0x1E0C9BAA8];
        v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)(v5 + 184) = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)(v5 + 200) = v18;
        *(_OWORD *)(v5 + 216) = *(_OWORD *)(v17 + 32);
        objc_msgSend(v13, "preferredContentScaleFactor");
        *((_QWORD *)v5 + 8) = v19;
        objc_msgSend(v14, "vectorScale");
        *(_OWORD *)(v5 + 120) = 0u;
        *((_QWORD *)v5 + 6) = v20;
        *(_OWORD *)(v5 + 136) = 0u;
        *(_OWORD *)(v5 + 152) = 0u;
        *(_OWORD *)(v5 + 168) = 0u;
        *(_OWORD *)(v5 + 104) = *MEMORY[0x1E0C9D820];
        *((_QWORD *)v5 + 9) = 0;
        *((_QWORD *)v5 + 10) = 0;
        v5[8] &= ~1u;
        v21 = objc_msgSend(v13, "contentMode");
        objc_msgSend(v12, "_fullSize");
        v117 = v23;
        v118 = v22;
        objc_msgSend(v14, "size");
        v119 = v24;
        v115 = v25;
        objc_msgSend(v12, "_contentInsets");
        v26 = UISizeRoundToScale(width, height, *((double *)v5 + 8));
        v28 = v27;
        v29 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v13, "semanticContentAttribute"));
        v30 = objc_msgSend(v12, "_imageOrientationConsideringRTLForUserInterfaceLayoutDirection:", v29);
        v31 = objc_msgSend(v12, "_imageOrientationForSymbolLayerConsideringRTLForUserInterfaceLayoutDirection:", v29);
        objc_msgSend(v12, "alignmentRectInsets");
        v33 = v32;
        v35 = v34;
        v37 = v36;
        v39 = v38;
        objc_msgSend(v13, "_additionalAlignmentRectInsetsForRenderingSource:", v12);
        v41 = v33 + v40;
        v43 = v35 + v42;
        v45 = v37 + v44;
        *((double *)v5 + 19) = v33 + v40;
        *((double *)v5 + 20) = v35 + v42;
        v47 = v39 + v46;
        *((double *)v5 + 21) = v37 + v44;
        *((double *)v5 + 22) = v39 + v46;
        v48 = v41;
        v49 = v35 + v42;
        v50 = v37 + v44;
        switch(v30)
        {
          case 0:
            goto LABEL_17;
          case 1:
          case 5:
            v48 = v45;
            v49 = v47;
            v50 = v41;
            v47 = v43;
            goto LABEL_10;
          case 2:
          case 6:
            v48 = v47;
            v49 = v41;
            v50 = v43;
            v47 = v45;
            goto LABEL_10;
          case 3:
          case 7:
            v48 = v43;
            v49 = v45;
            v50 = v47;
            v47 = v41;
            goto LABEL_10;
          case 4:
            goto LABEL_10;
          default:
            v48 = v41;
            v49 = v43;
            v50 = v45;
LABEL_10:
            if ((unint64_t)(v30 - 6) < 2)
            {
              v51 = v50;
              v52 = v49;
              v50 = v48;
            }
            else
            {
              v51 = v48;
              if ((unint64_t)(v30 - 4) <= 1)
              {
                v52 = v47;
                goto LABEL_16;
              }
              v52 = v49;
            }
            v49 = v47;
LABEL_16:
            *((double *)v5 + 19) = v51;
            *((double *)v5 + 20) = v52;
            *((double *)v5 + 21) = v50;
            *((double *)v5 + 22) = v49;
LABEL_17:
            v53 = v28 <= 0.0 || v26 <= 0.0;
            if ((!v53 || v21 >= 4) && v119 > 0.0 && v115 > 0.0)
            {
              if (objc_msgSend(v14, "canScaleImageToTargetResolution", v115, v49, v50, v48)
                && !objc_msgSend(v12, "_isResizable"))
              {
                v56 = 1;
              }
              else
              {
                objc_msgSend(v14, "scale");
                *((double *)v5 + 8) = v54;
                v26 = UISizeRoundToScale(width, height, v54);
                v28 = v55;
                v56 = 0;
              }
              v113 = v14;
              if (objc_msgSend(v13, "_layoutShouldFlipHorizontalOrientations"))
              {
                v57 = v30 - 2;
                if ((unint64_t)(v30 - 2) <= 5 && ((0x33u >> v57) & 1) != 0)
                  v30 = qword_18667F800[v57];
              }
              v137 = 0;
              v138 = (float64x2_t *)&v137;
              v139 = 0x3010000000;
              v140 = &unk_18685B0AF;
              v141 = v119;
              v142 = v115;
              aBlock[0] = MEMORY[0x1E0C809B0];
              aBlock[1] = 3221225472;
              aBlock[2] = __56___UIImageContentLayout_initWithSource_target_withSize___block_invoke;
              aBlock[3] = &unk_1E16CCB18;
              v127 = v119;
              v128 = v115;
              v58 = v12;
              v124 = v58;
              v120 = v21;
              v129 = v21;
              v130 = 0;
              v131 = 0;
              v132 = v26;
              v133 = v28;
              v134 = v118;
              v135 = v117;
              v59 = v5;
              v136 = v56;
              v125 = v59;
              v126 = &v137;
              v116 = (void (**)(_QWORD *__return_ptr))_Block_copy(aBlock);
              ((void (**)(CGAffineTransform *__return_ptr))v116)[2](&v147);
              v60 = *(_OWORD *)&v147.c;
              *(_OWORD *)(v5 + 184) = *(_OWORD *)&v147.a;
              *(_OWORD *)(v5 + 200) = v60;
              *(_OWORD *)(v5 + 216) = *(_OWORD *)&v147.tx;
              if (v30 == v31)
              {
                v61 = *(_OWORD *)(v5 + 184);
                v62 = *(_OWORD *)(v5 + 200);
                *(_OWORD *)(v59 + 264) = *(_OWORD *)(v5 + 216);
                *(_OWORD *)(v59 + 248) = v62;
                *(_OWORD *)(v59 + 232) = v61;
              }
              else
              {
                ((void (**)(CGAffineTransform *__return_ptr))v116)[2](&v147);
                v63 = *(_OWORD *)&v147.c;
                *(_OWORD *)(v59 + 232) = *(_OWORD *)&v147.a;
                *(_OWORD *)(v59 + 248) = v63;
                *(_OWORD *)(v59 + 264) = *(_OWORD *)&v147.tx;
                v59[56] = 1;
              }
              v64 = v138;
              v138[2] = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v138[2]), (int8x16_t)vnegq_f64(v138[2]), (int8x16_t)v138[2]);
              *(float64x2_t *)(v5 + 104) = v64[2];
              objc_msgSend(v58, "baselineOffsetFromBottom", v113);
              v66 = v65;
              if (v65 == 0.0)
              {
                v67 = *((double *)v5 + 10);
              }
              else
              {
                memset(&v147, 0, sizeof(v147));
                LayerContentModeTransform(v120, (uint64_t)&v147, 0.0, 0.0, v26, v28, v118, v117);
                UIRoundToScale(v147.ty + v147.b * 0.0 + v66 * v147.d, *((double *)v5 + 8));
                *((double *)v5 + 10) = v67;
              }
              UIRoundToScale(v28 - v67, *((double *)v5 + 8));
              *((_QWORD *)v5 + 9) = v68;
              objc_msgSend(v58, "_contentInsets");
              v70 = *MEMORY[0x1E0C9D538] + v69;
              v72 = *(double *)(MEMORY[0x1E0C9D538] + 8) + v71;
              v74 = v118 - (v69 + v73);
              v76 = v117 - (v71 + v75);
              memset(&v147, 0, sizeof(v147));
              LayerContentModeTransform(v120, (uint64_t)&v147, 0.0, 0.0, v26, v28, v118, v117);
              v122 = v147;
              v152.origin.x = v70;
              v152.origin.y = v72;
              v152.size.width = v74;
              v152.size.height = v76;
              v153 = CGRectApplyAffineTransform(v152, &v122);
              x = v153.origin.x;
              y = v153.origin.y;
              v79 = v153.size.width;
              v80 = v153.size.height;
              MinY = CGRectGetMinY(v153);
              v154.origin.x = 0.0;
              v154.origin.y = 0.0;
              v154.size.width = v26;
              v154.size.height = v28;
              v82 = CGRectGetMinY(v154);
              UIRoundToScale(MinY - v82, *((double *)v5 + 8));
              v121 = v83;
              v155.origin.x = x;
              v155.origin.y = y;
              v155.size.width = v79;
              v155.size.height = v80;
              MinX = CGRectGetMinX(v155);
              v156.origin.x = 0.0;
              v156.origin.y = 0.0;
              v156.size.width = v26;
              v156.size.height = v28;
              v85 = CGRectGetMinX(v156);
              UIRoundToScale(MinX - v85, *((double *)v5 + 8));
              v87 = v86;
              v157.origin.x = 0.0;
              v157.origin.y = 0.0;
              v157.size.width = v26;
              v157.size.height = v28;
              MaxY = CGRectGetMaxY(v157);
              v158.origin.x = x;
              v158.origin.y = y;
              v158.size.width = v79;
              v158.size.height = v80;
              v89 = CGRectGetMaxY(v158);
              UIRoundToScale(MaxY - v89, *((double *)v5 + 8));
              v91 = v90;
              v159.origin.x = 0.0;
              v159.origin.y = 0.0;
              v159.size.width = v26;
              v159.size.height = v28;
              MaxX = CGRectGetMaxX(v159);
              v160.origin.x = x;
              v160.origin.y = y;
              v160.size.width = v79;
              v160.size.height = v80;
              v93 = CGRectGetMaxX(v160);
              UIRoundToScale(MaxX - v93, *((double *)v5 + 8));
              *((_QWORD *)v5 + 15) = v121;
              *((_QWORD *)v59 + 16) = v87;
              *((_QWORD *)v59 + 17) = v91;
              *((_QWORD *)v59 + 18) = v94;
              v95 = v138[2].f64[0];
              v96 = v138[2].f64[1];
              v97 = v58;
              v98 = v13;
              objc_msgSend(v97, "content");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              v100 = *((double *)v5 + 8);
              objc_msgSend(v98, "preferredContentScaleFactor");
              v102 = v101;
              if ((unint64_t)objc_msgSend(v98, "contentMode") > 3 || v95 != 0.0 && v96 != 0.0)
              {
                objc_msgSend(v98, "_effectForRenderingSource:", v97);
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                if (v103)
                {
                  +[_UIImageContentContextualEffect contextualEffectWithEffect:source:]((uint64_t)_UIImageContentContextualEffect, v103, v97);
                  v104 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v104 = 0;
                }

                objc_msgSend(v99, "size");
                if (vabdd_f64(v96, v106) < 0.00000011920929
                  && vabdd_f64(v95, v105) < 0.00000011920929
                  && (objc_msgSend(v99, "scale"), v100 == v107)
                  && objc_msgSend(v98, "_supportsContents")
                  && objc_msgSend(v99, "prefersProvidingNonCGImageContentsDirectlyForRendering"))
                {
                  *(_QWORD *)&v147.a = MEMORY[0x1E0C809B0];
                  *(_QWORD *)&v147.b = 3221225472;
                  *(_QWORD *)&v147.c = __61___UIImageContentLayout__prepareContentOfSize_source_target___block_invoke;
                  *(_QWORD *)&v147.d = &unk_1E16CCB40;
                  *(_QWORD *)&v147.tx = v99;
                  v147.ty = v102;
                  v108 = _Block_copy(&v147);
                  v109 = (void *)*((_QWORD *)v59 + 2);
                  *((_QWORD *)v59 + 2) = v108;

                  v5[8] &= ~1u;
                }
                else
                {
                  *(_QWORD *)&v147.a = MEMORY[0x1E0C809B0];
                  *(_QWORD *)&v147.b = 3221225472;
                  *(_QWORD *)&v147.c = __61___UIImageContentLayout__prepareContentOfSize_source_target___block_invoke_2;
                  *(_QWORD *)&v147.d = &unk_1E16CCB68;
                  *(_QWORD *)&v147.tx = v99;
                  v148 = v95;
                  v149 = v96;
                  v150 = v100;
                  *(_QWORD *)&v147.ty = v104;
                  v151 = v102;
                  v110 = _Block_copy(&v147);
                  v111 = (void *)*((_QWORD *)v59 + 2);
                  *((_QWORD *)v59 + 2) = v110;

                  v5[8] |= 1u;
                }

              }
              _Block_object_dispose(&v137, 8);
              v14 = v114;
            }

            break;
        }
      }
    }

  }
  return v5;
}

- (BOOL)hasContents
{
  return self->_contentInfo.contents || self->_contentInfoGenerator != 0;
}

- (double)baselineOffsetFromBottom
{
  return self->_baselineOffsetFromBottom;
}

- (void).cxx_destruct
{

  objc_storeStrong(&self->_contentInfoGenerator, 0);
}

- (UIColor)contentsMultiplyColor
{
  _UIImageContentRendition *rendition;

  -[_UIImageContentLayout _materializeRenditionContents]((uint64_t)self);
  rendition = self->_contentInfo.rendition;
  if (rendition)
    return rendition->_multiplyColor;
  else
    return 0;
}

- (void)_materializeRenditionContents
{
  void (**v2)(_QWORD *__return_ptr, void *);
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a1)
  {
    v2 = (void (**)(_QWORD *__return_ptr, void *))_Block_copy(*(const void **)(a1 + 16));
    if (v2)
    {
      v3 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = 0;

      v2[2](&v8, v2);
      v4 = v8;
      v8 = 0;
      v5 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v4;

      v6 = v9;
      v9 = 0;
      v7 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v6;

      *(_QWORD *)(a1 + 40) = v10;
    }

  }
}

- (NSArray)contentEffects
{
  _UIImageContentRendition *rendition;

  -[_UIImageContentLayout _materializeRenditionContents]((uint64_t)self);
  rendition = self->_contentInfo.rendition;
  if (rendition)
    return rendition->_effects;
  else
    return 0;
}

- (unsigned)contentDrawMode
{
  _UIImageContentRendition *rendition;

  -[_UIImageContentLayout _materializeRenditionContents]((uint64_t)self);
  rendition = self->_contentInfo.rendition;
  if (rendition)
    return rendition->_drawMode;
  else
    return 0;
}

- (_UIImageContentRBSymbolConfiguration)rbSymbolConfiguration
{
  -[_UIImageContentLayout _materializeRenditionContents]((uint64_t)self);
  return (_UIImageContentRBSymbolConfiguration *)-[_UIImageContentRendition rbSymbolConfiguration](&self->_contentInfo.rendition->super.isa);
}

- (void)drawInContext:(CGContext *)a3 withSize:(CGSize)a4
{
  double height;
  double width;
  double contentsScaleFactor;
  void *v9;
  double v10;
  double var0;
  CGFloat v12;
  CGFloat v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;

  height = a4.height;
  width = a4.width;
  -[_UIImageContentLayout _materializeRenditionContents]((uint64_t)self);
  CGContextSaveGState(a3);
  CGContextScaleCTM(a3, width / self->_renderSize.width, height / self->_renderSize.height);
  contentsScaleFactor = self->_contentsScaleFactor;
  if (contentsScaleFactor <= 0.0)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scale");
    contentsScaleFactor = v10;

  }
  CGContextScaleCTM(a3, contentsScaleFactor / self->_contentsVectorScale, contentsScaleFactor / self->_contentsVectorScale);
  CGContextTranslateCTM(a3, -self->_contentInsets.left, -self->_contentInsets.top);
  CGContextScaleCTM(a3, 1.0 / self->_contentsScaleFactor, 1.0 / self->_contentsScaleFactor);
  memset(&v16, 0, sizeof(v16));
  CGContextGetCTM(&v16, a3);
  var0 = self->_contentInfo.var0;
  v12 = self->_contentInsets.left * var0;
  v13 = var0 * self->_contentInsets.top;
  v14 = v16;
  CGAffineTransformTranslate(&v15, &v14, v12, v13);
  v16 = v15;
  CGContextSetCTM();
  -[_UIImageContentRendition drawInContext:]((uint64_t)self->_contentInfo.rendition);
  CGContextRestoreGState(a3);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  CGFloat a;
  CGFloat b;
  CGFloat c;
  CGFloat d;
  CGFloat tx;
  CGFloat ty;
  const __CFString *v11;
  int v12;
  __CFString *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  a = self->_contentsTransform.a;
  b = self->_contentsTransform.b;
  c = self->_contentsTransform.c;
  d = self->_contentsTransform.d;
  tx = self->_contentsTransform.tx;
  ty = self->_contentsTransform.ty;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v11 = CFSTR("(CGImage)");
  else
    v11 = &stru_1E16EDF20;
  if (self->_contentInfoGenerator)
  {
    v12 = 0;
    v13 = CFSTR("pending");
  }
  else if (self->_contentInfo.contents)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), self->_contentInfo.contents);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v12 = 1;
  }
  else
  {
    v12 = 0;
    v13 = CFSTR("none");
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p transform=(%g,%g,%g,%g;%g,%g) contents=%@%@ scale=%g insets=(%g,%g,%g,%g)>"),
    v4,
    self,
    *(_QWORD *)&a,
    *(_QWORD *)&b,
    *(_QWORD *)&c,
    *(_QWORD *)&d,
    *(_QWORD *)&tx,
    *(_QWORD *)&ty,
    v11,
    v13,
    *(_QWORD *)&self->_contentsScaleFactor,
    *(_QWORD *)&self->_contentInsets.top,
    *(_QWORD *)&self->_contentInsets.left,
    *(_QWORD *)&self->_contentInsets.bottom,
    *(_QWORD *)&self->_contentInsets.right);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)

  return v14;
}

- (CGAffineTransform)symbolLayerPositionTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[5].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[4].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[5].d;
  return self;
}

- (BOOL)symbolLayerNeedsHorizontalFlip
{
  return self->_symbolLayerNeedsHorizontalFlip;
}

- (CGSize)contentsSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentsSize.width;
  height = self->_contentsSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_alignmentRectInsets.top;
  left = self->_alignmentRectInsets.left;
  bottom = self->_alignmentRectInsets.bottom;
  right = self->_alignmentRectInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGSize)renderSize
{
  double width;
  double height;
  CGSize result;

  width = self->_renderSize.width;
  height = self->_renderSize.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
