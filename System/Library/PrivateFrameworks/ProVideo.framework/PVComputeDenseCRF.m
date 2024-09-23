@implementation PVComputeDenseCRF

- (PVComputeDenseCRF)initWithColor:(id)a3 proximity:(id)a4
{
  id v7;
  id v8;
  PVComputeDenseCRF *v9;
  PVComputeDenseCRF *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PVComputeDenseCRF;
  v9 = -[PVComputeDenseCRF init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_color, a3);
    objc_storeStrong((id *)&v10->_proxy, a4);
  }

  return v10;
}

- (void)generateMatte:(id)a3
{
  id v4;
  __CVBuffer *v5;
  __CVBuffer *v6;
  HGCVPixelBuffer *v7;
  uint64_t v8;
  int v9;
  int v10;
  unint64_t v11;
  int v12;
  int v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  float *v17;
  uint64_t v18;
  float *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  float *v23;
  float *v24;
  uint64_t v25;
  float v26;
  float v27;
  HGBitmap *v28;
  _QWORD *v29;
  HGBitmap *v30;
  uint64_t v31;
  uint64_t v32;
  float *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  float *v38;
  float *v39;
  uint64_t v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  _QWORD *v52;
  HGBitmap *v53;
  uint64_t v54;
  uint64_t v55;
  float *v56;
  float *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  float *v63;
  float *v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  uint64_t v70;
  float v71;
  const __CFUUID *v72;
  _QWORD *v73;
  id v74;
  HGBitmap *v75;
  _QWORD *v76;
  _QWORD *v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  int v84;
  uint64_t v85;
  HFDenseCRF *v86[2];
  HGBitmap *v87;
  uint64_t v88;
  HGBitmap *v89;

  v4 = a3;
  v5 = -[PVImageBuffer cvPixelBuffer](self->_color, "cvPixelBuffer");
  v6 = -[PVImageBuffer cvPixelBuffer](self->_proxy, "cvPixelBuffer");
  v7 = (HGCVPixelBuffer *)objc_msgSend(v4, "cvPixelBuffer");
  HGCVBitmap::create((HGCVPixelBuffer *)v5, 21, 0, &v89);
  HGCVBitmap::create((HGCVPixelBuffer *)v6, 21, 0, &v88);
  HGCVBitmap::create(v7, 28, 0, &v87);
  v8 = v88;
  v9 = *((_DWORD *)v89 + 7);
  v10 = *((_DWORD *)v89 + 5);
  v11 = (v9 - v10);
  if ((_DWORD)v11 == *(_DWORD *)(v88 + 28) - *(_DWORD *)(v88 + 20)
    && (v12 = *((_DWORD *)v89 + 8),
        v13 = *((_DWORD *)v89 + 6),
        v14 = (v12 - v13),
        (_DWORD)v14 == *(_DWORD *)(v88 + 32) - *(_DWORD *)(v88 + 24))
    && (_DWORD)v11 == *((_DWORD *)v87 + 7) - *((_DWORD *)v87 + 5)
    && (_DWORD)v14 == *((_DWORD *)v87 + 8) - *((_DWORD *)v87 + 6))
  {
    v74 = v4;
    v15 = HGObject::operator new(0x80uLL);
    HGBitmap::HGBitmap(v15, *(_QWORD *)(v8 + 20), *(_QWORD *)(v8 + 28), 7);
    if (v12 != v13)
    {
      v16 = 0;
      v17 = *(float **)(v88 + 80);
      v18 = *(_QWORD *)(v88 + 64);
      v19 = (float *)v15[10];
      v20 = v15[8];
      if (v11 <= 1)
        v21 = 1;
      else
        v21 = (v9 - v10);
      if (v14 <= 1)
        v22 = 1;
      else
        v22 = (v12 - v13);
      do
      {
        v23 = v17;
        v24 = v19;
        v25 = v21;
        if (v9 != v10)
        {
          do
          {
            v26 = *v23;
            v23 += 3;
            v27 = v26;
            if (v26 >= 0.25)
              v27 = 0.0;
            *v24++ = v27;
            --v25;
          }
          while (v25);
        }
        ++v16;
        v19 = (float *)((char *)v19 + v20);
        v17 = (float *)((char *)v17 + v18);
      }
      while (v16 != v22);
    }
    v79 = (v12 - v13);
    v28 = v89;
    v77 = v15;
    v29 = HGObject::operator new(0x80uLL);
    HGBitmap::HGBitmap(v29, *(_QWORD *)((char *)v28 + 20), *(_QWORD *)((char *)v28 + 28), 7);
    v30 = v89;
    if (v12 != v13)
    {
      v31 = 0;
      v32 = *((_QWORD *)v89 + 8);
      v33 = (float *)v29[10];
      v34 = v29[8];
      if (v11 <= 1)
        v35 = 1;
      else
        v35 = (v9 - v10);
      v36 = (v12 - v13);
      if (v79 <= 1)
        v36 = 1;
      v37 = *((_QWORD *)v89 + 10) + 8;
      do
      {
        v38 = (float *)v37;
        v39 = v33;
        v40 = v35;
        if (v9 != v10)
        {
          do
          {
            v41 = *(v38 - 2);
            v42 = *(v38 - 1);
            v43 = *v38;
            if (*v38 <= v41)
              v44 = *(v38 - 2);
            else
              v44 = *v38;
            if (*v38 >= v41)
              v45 = *(v38 - 2);
            else
              v45 = *v38;
            if (v42 <= v41)
              v46 = *(v38 - 2);
            else
              v46 = *(v38 - 1);
            if (v42 >= v41)
              v47 = *(v38 - 2);
            else
              v47 = *(v38 - 1);
            if (v43 <= v42)
              v44 = v46;
            if (v43 >= v42)
              v45 = v47;
            v48 = v44 - v45;
            if (v48 == 0.0)
            {
              v51 = 0.0;
            }
            else
            {
              v49 = (float)((float)(v43 - v42) / v48) + 4.0;
              if (v42 == v44)
                v49 = (float)((float)(v41 - v43) / v48) + 2.0;
              v50 = (float)(v42 - v41) / v48;
              if (v43 != v44)
                v50 = v49;
              v51 = v50 / 6.0;
              if (v51 < 0.0)
                v51 = v51 + 1.0;
            }
            *v39++ = v51;
            v38 += 3;
            --v40;
          }
          while (v40);
        }
        ++v31;
        v33 = (float *)((char *)v33 + v34);
        v37 += v32;
      }
      while (v31 != v36);
    }
    v73 = v29;
    v52 = HGObject::operator new(0x80uLL);
    HGBitmap::HGBitmap(v52, *(_QWORD *)((char *)v30 + 20), *(_QWORD *)((char *)v30 + 28), 7);
    v53 = v89;
    v76 = v52;
    v84 = v10;
    v75 = (HGBitmap *)HGObject::operator new(0x80uLL);
    HGBitmap::HGBitmap(v75, *(_QWORD *)((char *)v53 + 20), *(_QWORD *)((char *)v53 + 28), 13);
    v54 = (v12 - v13);
    if (v12 != v13)
    {
      v55 = 0;
      v56 = (float *)v77[10];
      v57 = (float *)v52[10];
      v81 = v76[8];
      v82 = v77[8];
      v58 = *((_QWORD *)v75 + 10);
      v85 = *((_QWORD *)v75 + 8);
      if (v11 <= 1)
        v59 = 1;
      else
        v59 = v11;
      if (v79 <= 1)
        v54 = 1;
      v80 = v54;
      v60 = 2 * v59;
      v78 = *((_QWORD *)v75 + 10);
      v83 = v9;
      do
      {
        if (v9 != v84)
        {
          v61 = 0;
          v62 = 0;
          v63 = v56;
          v64 = v57;
          do
          {
            v65 = *v63;
            v66 = 1.0 / (float)(expf((float)((float)(*v64 * 8.0) + -0.35) * -5.0) + 1.0);
            v67 = 1.0 - v66;
            if (v65 <= 0.0)
            {
              v70 = 2 * v62;
              *(float *)(v58 + 4 * v61) = v67 * 2.0794;
              v71 = v66 * 2.0794;
            }
            else
            {
              v68 = v67 * 1.0986;
              if (v66 <= 0.5)
                v69 = v68;
              else
                v69 = 0.28768;
              *(float *)(v58 + 4 * v61) = v69;
              v70 = v61;
              v71 = 2.0794;
            }
            *(float *)(v78 + v85 * v55 + ((4 * v70) | 4)) = v71;
            ++v62;
            v61 += 2;
            ++v64;
            ++v63;
          }
          while (v60 != v61);
        }
        ++v55;
        v58 += v85;
        v57 = (float *)((char *)v57 + v81);
        v56 = (float *)((char *)v56 + v82);
        v9 = v83;
      }
      while (v55 != v80);
    }
    v72 = CFUUIDGetConstantUUIDWithBytes(0, 0xD0u, 0xEDu, 0xE3u, 0xC7u, 0xB1u, 0x48u, 0x47u, 0x4Eu, 0x88u, 0xB6u, 0xF1u, 0xD5u, 0x7Cu, 0xC9u, 0xDFu, 0x6Au);
    HFDenseCRFInterface::HFDenseCRFInterface((HFDenseCRFInterface *)v86, v72);
    v4 = v74;
    if (HFDenseCRFInterface::GenerateMask(v86, v89, v75, v87, 20.0, 10.0, 5.0, 40.0, 0.01, 15.0, 5))
      puts("Error: segmentation failed");
    HFDenseCRFInterface::~HFDenseCRFInterface((HFDenseCRFInterface *)v86);
    if (v75)
      (*(void (**)(HGBitmap *))(*(_QWORD *)v75 + 24))(v75);
    if (v76)
      (*(void (**)(_QWORD *))(*v76 + 24))(v76);
    if (v73)
      (*(void (**)(_QWORD *))(*v73 + 24))(v73);
    if (v77)
      (*(void (**)(_QWORD *))(*v77 + 24))(v77);
  }
  else
  {
    NSLog(CFSTR("Error: inputs to CRF must be the same size"));
  }
  if (v87)
    (*(void (**)(HGBitmap *))(*(_QWORD *)v87 + 24))(v87);
  if (v88)
    (*(void (**)(uint64_t))(*(_QWORD *)v88 + 24))(v88);
  if (v89)
    (*(void (**)(HGBitmap *))(*(_QWORD *)v89 + 24))(v89);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
