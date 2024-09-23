@implementation CRPairedRegionMutualGeometryInfo

- (id)initFromGeometryInfo1:(id)a3 geometryInfo2:(id)a4
{
  id v6;
  id v7;
  char *v8;
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
  float64x2_t v36;
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
  double v54;
  double v55;
  double v56;
  BOOL v57;
  objc_super v59;

  v6 = a3;
  v7 = a4;
  v59.receiver = self;
  v59.super_class = (Class)CRPairedRegionMutualGeometryInfo;
  v8 = -[CRPairedRegionMutualGeometryInfo init](&v59, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "topLeft");
    v10 = v9;
    objc_msgSend(v6, "topLeft");
    v12 = v10 - v11;
    objc_msgSend(v7, "topLeft");
    v14 = v13;
    objc_msgSend(v6, "topLeft");
    v16 = v14 - v15;
    objc_msgSend(v7, "topRight");
    v18 = v17;
    objc_msgSend(v6, "topRight");
    v20 = v18 - v19;
    objc_msgSend(v7, "topRight");
    v22 = v21;
    objc_msgSend(v6, "topRight");
    v24 = v22 - v23;
    objc_msgSend(v6, "baselineVector");
    v27 = sqrt(v25 * v25 + v26 * v26);
    objc_msgSend(v6, "baselineVector");
    v29 = v28;
    objc_msgSend(v6, "baselineVector");
    v31 = (v16 * v30 + v12 * v29) / v27;
    objc_msgSend(v6, "baselineVector");
    v33 = v32;
    objc_msgSend(v6, "baselineVector");
    v35 = (v24 * v34 + v20 * v33) / v27;
    *((double *)v8 + 5) = v35;
    *((double *)v8 + 3) = v31;
    *((double *)v8 + 4) = sqrt(round(v16 * v16 + v12 * v12) - round(v31 * v31));
    *((double *)v8 + 6) = sqrt(round(v24 * v24 + v20 * v20) - round(v35 * v35));
    if (objc_msgSend(v6, "layoutDirection") == 2 && objc_msgSend(v7, "layoutDirection") == 2)
    {
      *(float64x2_t *)(v8 + 56) = vnegq_f64(*(float64x2_t *)(v8 + 40));
      v36 = vnegq_f64(*(float64x2_t *)(v8 + 24));
    }
    else
    {
      *(_OWORD *)(v8 + 56) = *(_OWORD *)(v8 + 24);
      v36 = *(float64x2_t *)(v8 + 40);
    }
    *(float64x2_t *)(v8 + 72) = v36;
    objc_msgSend(v6, "size");
    v38 = v31 - v37;
    objc_msgSend(v7, "size");
    *((double *)v8 + 2) = fmin(v38, fabs(v31) - v39);
    objc_msgSend(v6, "estimatedLineHeight");
    v41 = v40;
    objc_msgSend(v7, "estimatedLineHeight");
    v43 = (v41 + v42) * 0.5;
    objc_msgSend(v6, "midPoint");
    v45 = v44;
    v47 = v46;
    objc_msgSend(v7, "midPoint");
    v50 = *MEMORY[0x1E0C9D820];
    if (*MEMORY[0x1E0C9D820] > 0.0)
    {
      v51 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      if (v51 > 0.0)
      {
        v45 = v45 * v50;
        v47 = v47 * v51;
        v48 = v48 * v50;
        v49 = v49 * v51;
      }
    }
    v52 = sqrt((v47 - v49) * (v47 - v49) + (v45 - v48) * (v45 - v48));
    objc_msgSend(v6, "size");
    v54 = v53;
    objc_msgSend(v7, "size");
    v56 = vabdd_f64(v54, v55);
    v57 = v56 / v43 > fmin((v52 + v52) / v43, 1.5);
    if (v52 >= v43 * 1.5 && (vabdd_f64(v31, v35) - v56 * 0.5) * 0.5 >= v43 * 0.5)
      v57 = 0;
    v8[8] = v57;
  }

  return v8;
}

- (CGVector)leftOffsetAlongBaseline
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGVector result;

  objc_copyStruct(v4, &self->_leftOffsetAlongBaseline, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.dy = v3;
  result.dx = v2;
  return result;
}

- (CGVector)rightOffsetAlongBaseline
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGVector result;

  objc_copyStruct(v4, &self->_rightOffsetAlongBaseline, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.dy = v3;
  result.dx = v2;
  return result;
}

- (CGVector)leadingOffsetAlongBaseline
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGVector result;

  objc_copyStruct(v4, &self->_leadingOffsetAlongBaseline, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.dy = v3;
  result.dx = v2;
  return result;
}

- (CGVector)trailingOffsetAlongBaseline
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGVector result;

  objc_copyStruct(v4, &self->_trailingOffsetAlongBaseline, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.dy = v3;
  result.dx = v2;
  return result;
}

- (double)inlineSpacingAlongBaseline
{
  return self->_inlineSpacingAlongBaseline;
}

- (BOOL)isCenterJustified
{
  return self->_isCenterJustified;
}

@end
