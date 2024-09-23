@implementation VisionCoreSparseOpticalFlowQuad

- (VisionCoreSparseOpticalFlowQuad)initWithTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomRight:(CGPoint)a5 bottomLeft:(CGPoint)a6 indentifier:(id)a7
{
  return -[VisionCoreSparseOpticalFlowQuad initWithTopLeft:topRight:bottomRight:bottomLeft:indentifier:homographyGroupID:](self, "initWithTopLeft:topRight:bottomRight:bottomLeft:indentifier:homographyGroupID:", a7, 0xFFFFFFFFLL, a3.x, a3.y, a4.x, a4.y, a5.x, a5.y, a6.x, a6.y);
}

- (VisionCoreSparseOpticalFlowQuad)initWithTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomRight:(CGPoint)a5 bottomLeft:(CGPoint)a6 indentifier:(id)a7 homographyGroupID:(int)a8
{
  CGFloat y;
  double x;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v19;
  VisionCoreSparseOpticalFlowQuad *v20;
  VisionCoreSparseOpticalFlowQuad *v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  objc_super v26;

  y = a6.y;
  x = a6.x;
  v12 = a5.y;
  v13 = a5.x;
  v14 = a4.y;
  v15 = a4.x;
  v16 = a3.y;
  v17 = a3.x;
  v19 = a7;
  v26.receiver = self;
  v26.super_class = (Class)VisionCoreSparseOpticalFlowQuad;
  v20 = -[VisionCoreSparseOpticalFlowQuad init](&v26, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_topLeft.x = v17;
    v20->_topLeft.y = v16;
    v20->_topRight.x = v15;
    v20->_topRight.y = v14;
    v20->_bottomRight.x = v13;
    v20->_bottomRight.y = v12;
    v20->_bottomLeft.x = x;
    v20->_bottomLeft.y = y;
    objc_storeStrong((id *)&v20->_UUID, a7);
    v21->_homographyGroupID = a8;
    v21->_boundingBox.origin.x = VisionCoreBoundingBoxForQuadrilateralPoints(v17, v16, v15, v14, v13, v12, x);
    v21->_boundingBox.origin.y = v22;
    v21->_boundingBox.size.width = v23;
    v21->_boundingBox.size.height = v24;
  }

  return v21;
}

- (double)getEmptyDistanceBetweenCenters:(id)a3
{
  id v4;
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
  double y;
  double v68;
  double v69;
  double v70;
  double x;
  double v72;

  v4 = a3;
  x = self->_topLeft.x;
  v72 = self->_bottomLeft.x;
  y = self->_topLeft.y;
  v68 = self->_bottomLeft.y;
  v69 = self->_topRight.x;
  v70 = self->_bottomRight.x;
  v65 = self->_topRight.y;
  v66 = self->_bottomRight.y;
  objc_msgSend(v4, "bottomLeft");
  v64 = v5;
  objc_msgSend(v4, "topLeft");
  v63 = v6;
  objc_msgSend(v4, "bottomRight");
  v62 = v7;
  objc_msgSend(v4, "topRight");
  v61 = v8;
  objc_msgSend(v4, "bottomLeft");
  v60 = v9;
  objc_msgSend(v4, "topLeft");
  v59 = v10;
  objc_msgSend(v4, "bottomRight");
  v58 = v11;
  objc_msgSend(v4, "topRight");
  v57 = v12;
  v55 = self->_bottomLeft.x;
  v56 = self->_bottomRight.x;
  v51 = self->_bottomRight.y;
  v52 = self->_topRight.y;
  v53 = self->_topLeft.x;
  v54 = self->_topRight.x;
  v49 = self->_bottomLeft.y;
  v50 = self->_topLeft.y;
  objc_msgSend(v4, "bottomRight");
  v48 = v13;
  objc_msgSend(v4, "bottomLeft");
  v47 = v14;
  objc_msgSend(v4, "topRight");
  v46 = v15;
  objc_msgSend(v4, "topLeft");
  v45 = v16;
  objc_msgSend(v4, "bottomRight");
  v44 = v17;
  objc_msgSend(v4, "bottomLeft");
  v43 = v18;
  objc_msgSend(v4, "topRight");
  v42 = v19;
  objc_msgSend(v4, "topLeft");
  v21 = v20;
  objc_msgSend(v4, "topLeft");
  v23 = v22;
  objc_msgSend(v4, "bottomLeft");
  v25 = v24;
  objc_msgSend(v4, "topRight");
  v27 = v26;
  objc_msgSend(v4, "bottomRight");
  v29 = v28;
  objc_msgSend(v4, "topLeft");
  v31 = v30;
  objc_msgSend(v4, "bottomLeft");
  v33 = v32;
  objc_msgSend(v4, "topRight");
  v35 = v34;
  objc_msgSend(v4, "bottomRight");
  v37 = (v31 - v33 + v35 - v36) * 0.5;
  v38 = fmax(vabdd_f64((v64 + v63 + v62 + v61) * 0.25, (v72 + x + v70 + v69) * 0.25)- ((v56 - v55 + v54 - v53) * 0.5+ (v54 - v56 + v53 - v55) * 0.5+ (v48 - v47 + v46 - v45) * 0.5+ (v23 - v25 + v27 - v29) * 0.5)* 0.25, 0.0);
  v39 = fmax(vabdd_f64((v60 + v59 + v58 + v57) * 0.25, (v68 + y + v66 + v65) * 0.25)- ((v51 - v49 + v52 - v50) * 0.5 + (v52 - v51 + v50 - v49) * 0.5 + (v44 - v43 + v42 - v21) * 0.5 + v37) * 0.25, 0.0);
  v40 = v38 * v38 + v39 * v39;

  return v40;
}

- (void)generateGridKeypointsWithMaxKeypoints:(char *)a3@<X8> minGridFrequency:(float)a4@<S0>
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  char *v23;
  int v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  int v30;
  float v31;
  float v32;
  unint64_t v33;
  char *v34;
  float v35;
  int v36;
  int v37;
  int v38;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  __int16 v53;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  __int16 v63;
  float v64;
  float v65;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;

  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  v4 = a1[7];
  v5 = a1[8];
  v6 = a1[9];
  v7 = a1[10];
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[3];
  v11 = a1[4];
  v12 = (v4 - v6 + v8 - v10) * 0.5;
  v13 = (v5 - v7 + v9 - v11) * 0.5;
  v14 = (v8 - v4 + v10 - v6) * 0.5;
  v15 = (v9 - v5 + v11 - v7) * 0.5;
  v16 = sqrtf((float)(v13 * v13) + (float)(v12 * v12));
  v17 = 1.0;
  if (v16 < 1.0)
    v16 = 1.0;
  v18 = sqrtf((float)(v15 * v15) + (float)(v14 * v14));
  if (v18 >= 1.0)
    v17 = v18;
  v19 = sqrtf((float)(v16 * a4) / v17);
  if (v19 >= (float)a2)
    v20 = v19;
  else
    v20 = (float)a2;
  v21 = sqrtf((float)(v17 * a4) / v16);
  if (v21 < (float)a2)
    v21 = (float)a2;
  v69 = v21;
  if (v21 > 0.0)
  {
    v23 = 0;
    v24 = 0;
    v25 = v13 / v20;
    v26 = v14 / v21;
    v67 = v25 * 0.5;
    v68 = (float)(v12 / v20) * 0.5;
    v72 = v26 + (float)(v12 / v20);
    v73 = v12 / v20;
    v64 = v15 / v21;
    v65 = v26;
    v70 = (float)(v15 / v21) + v25;
    v71 = v25;
    v27 = 0.0;
    do
    {
      if ((v24 & 1) != 0)
        v28 = v67;
      else
        v28 = 0.0;
      if ((v24 & 1) != 0)
        v29 = v68;
      else
        v29 = 0.0;
      if (v20 > 0.0)
      {
        v30 = 0;
        v31 = a1[9] + (float)(v65 * v27);
        v32 = a1[10] + (float)(v64 * v27);
        v33 = (unint64_t)a3[2];
        v34 = *a3;
        v35 = 0.0;
        v36 = v24;
        do
        {
          v37 = rand();
          v38 = rand();
          _S8 = (float)(v29 + (float)(v31 + (float)(v35 * v73)))
              + (float)(v72 * (float)((float)((float)v37 * 4.6566e-10) + -0.5));
          if ((unint64_t)v23 >= v33)
          {
            v46 = v23 - v34;
            if (v23 - v34 <= -3)
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            v47 = v46 >> 1;
            if (v33 - (unint64_t)v34 <= (v46 >> 1) + 1)
              v48 = v47 + 1;
            else
              v48 = v33 - (_QWORD)v34;
            if (v33 - (unint64_t)v34 >= 0x7FFFFFFFFFFFFFFELL)
              v49 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v49 = v48;
            if (v49)
              v49 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<half>>(v49);
            else
              v50 = 0;
            v51 = (char *)(v49 + 2 * v47);
            __asm { FCVT            H0, S8 }
            *(_WORD *)v51 = _H0;
            v45 = v51 + 2;
            while (v23 != v34)
            {
              v53 = *((_WORD *)v23 - 1);
              v23 -= 2;
              *((_WORD *)v51 - 1) = v53;
              v51 -= 2;
            }
            v33 = v49 + 2 * v50;
            *a3 = v51;
            a3[1] = v45;
            a3[2] = (char *)v33;
            if (v34)
              operator delete(v34);
            v34 = v51;
            v24 = v36;
          }
          else
          {
            __asm { FCVT            H0, S8 }
            *(_WORD *)v23 = _H0;
            v45 = v23 + 2;
          }
          a3[1] = v45;
          _S8 = (float)(v28 + (float)(v32 + (float)(v35 * v71)))
              + (float)(v70 * (float)((float)((float)v38 * 4.6566e-10) + -0.5));
          if ((unint64_t)v45 >= v33)
          {
            v56 = v45 - v34;
            if (v45 - v34 <= -3)
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            v57 = v56 >> 1;
            if (v33 - (unint64_t)v34 <= (v56 >> 1) + 1)
              v58 = v57 + 1;
            else
              v58 = v33 - (_QWORD)v34;
            if (v33 - (unint64_t)v34 >= 0x7FFFFFFFFFFFFFFELL)
              v59 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v59 = v58;
            if (v59)
              v59 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<half>>(v59);
            else
              v60 = 0;
            v61 = (char *)(v59 + 2 * v57);
            __asm { FCVT            H0, S8 }
            *(_WORD *)v61 = _H0;
            v23 = v61 + 2;
            while (v45 != v34)
            {
              v63 = *((_WORD *)v45 - 1);
              v45 -= 2;
              *((_WORD *)v61 - 1) = v63;
              v61 -= 2;
            }
            v33 = v59 + 2 * v60;
            *a3 = v61;
            a3[1] = v23;
            a3[2] = (char *)v33;
            if (v34)
              operator delete(v34);
            v34 = v61;
            v24 = v36;
          }
          else
          {
            __asm { FCVT            H0, S8 }
            *(_WORD *)v45 = _H0;
            v23 = v45 + 2;
          }
          a3[1] = v23;
          v35 = (float)++v30;
        }
        while (v20 > (float)v30);
      }
      v27 = (float)++v24;
    }
    while (v69 > (float)v24);
  }
}

- (CGPoint)topLeft
{
  double x;
  double y;
  CGPoint result;

  x = self->_topLeft.x;
  y = self->_topLeft.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)topRight
{
  double x;
  double y;
  CGPoint result;

  x = self->_topRight.x;
  y = self->_topRight.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)bottomRight
{
  double x;
  double y;
  CGPoint result;

  x = self->_bottomRight.x;
  y = self->_bottomRight.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)bottomLeft
{
  double x;
  double y;
  CGPoint result;

  x = self->_bottomLeft.x;
  y = self->_bottomLeft.y;
  result.y = y;
  result.x = x;
  return result;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int)homographyGroupID
{
  return self->_homographyGroupID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
