@implementation PAEKeyer

- (BOOL)sampleEdge:(void *)a3 renderInfo:(id *)a4 width:(float)a5 height:(float)a6
{
  FxHostCapabilities *v11;
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
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float *v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
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
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  BOOL v65;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  BOOL v70;
  int v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  _BOOL4 v78;
  _BOOL8 v79;
  uint64_t v80;
  unsigned int v81;
  int v82;
  unint64_t v83;
  unint64_t v84;
  int v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  float v92;
  float v93;
  float v94;
  float *v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  int v99;
  float v100;
  float v101;
  float v102;
  float v103;
  float v104;
  float v105;
  float v106;
  float v107;
  float v108;
  float *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  float v116;
  float v117;
  uint64_t v118;
  uint64_t v119;
  float v120;
  float v121;
  PAEKeyerSetupUtil *v122;
  float32x2_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  float32x2_t v136;
  int32x2_t v137;
  float32x2_t v138;
  int32x2_t v139;
  _BOOL4 v140;
  BOOL v141;
  BOOL v142;
  PAEKeyer *v143;
  FxHostCapabilities *v144;
  float v145;
  float v146;
  $E4FA4CFD4E311E26FBF98BD02AE1CAB1 *v147;
  float v148;
  uint64_t v149;
  float v150;
  unint64_t v151;
  float v152;
  int v153;
  float v154;
  uint64_t v155;
  float v156;
  _BOOL8 v157;
  uint64_t *v158;
  float32x2_t v159;
  float32x2_t v160;
  float32x2_t v161;
  float v162[3];
  float v163;
  float v164;
  float v165;
  _OWORD v166[3];
  id v167;
  _QWORD v168[2];
  uint64_t v169;
  uint64_t v170;

  (*(void (**)(uint64_t *__return_ptr, void *, SEL))(*(_QWORD *)a3 + 16))(&v170, a3, a2);
  (*(void (**)(uint64_t *__return_ptr, void *))(*(_QWORD *)a3 + 24))(&v169, a3);
  v11 = -[FxHostCapabilities initWithAPIManager:]([FxHostCapabilities alloc], "initWithAPIManager:", self->super.super._apiManager);
  if (-[FxHostCapabilities hostIsMotion](v11, "hostIsMotion"))
  {
    v12 = *(float *)&v170;
  }
  else
  {
    v12 = *(float *)&v169;
    v13 = 1.0 - *((float *)&v169 + 1);
    LODWORD(v169) = v170;
    *((float *)&v169 + 1) = 1.0 - *((float *)&v170 + 1);
    *((float *)&v170 + 1) = v13;
  }
  v158 = (uint64_t *)((char *)a3 + 48);
  *((_QWORD *)a3 + 7) = *((_QWORD *)a3 + 6);
  v14 = 0.0;
  v15 = 0.0;
  if (v12 >= 0.0)
  {
    v15 = 1.0;
    if (v12 <= 1.0)
      v15 = v12;
  }
  *(float *)&v170 = v15;
  if (*((float *)&v170 + 1) >= 0.0)
  {
    v14 = 1.0;
    if (*((float *)&v170 + 1) <= 1.0)
      v14 = *((float *)&v170 + 1);
  }
  *((float *)&v170 + 1) = v14;
  v16 = 0.0;
  v17 = 0.0;
  if (*(float *)&v169 >= 0.0)
  {
    v17 = 1.0;
    if (*(float *)&v169 <= 1.0)
      v17 = *(float *)&v169;
  }
  v18 = a5 * 0.5;
  *(float *)&v169 = v17;
  if (*((float *)&v169 + 1) >= 0.0)
  {
    v16 = 1.0;
    if (*((float *)&v169 + 1) <= 1.0)
      v16 = *((float *)&v169 + 1);
  }
  *((float *)&v169 + 1) = v16;
  v19 = (float)(v15 * a5) - v18;
  v20 = -v18;
  v21 = -v18;
  if (v19 >= (float)-v18)
  {
    v21 = a5 * 0.5;
    if (v19 <= v18)
      v21 = v19;
  }
  v22 = a6 * 0.5;
  v23 = (float)(v17 * a5) - v18;
  v24 = -v18;
  if (v23 >= v20)
  {
    v24 = a5 * 0.5;
    if (v23 <= v18)
      v24 = (float)(v17 * a5) - v18;
  }
  v25 = (float)(v14 * a6) - v22;
  v26 = -v22;
  v27 = -v22;
  if (v25 >= (float)-v22)
  {
    v27 = a6 * 0.5;
    if (v25 <= v22)
      v27 = v25;
  }
  v148 = v27;
  v150 = v24;
  v152 = v21;
  v154 = a5;
  v156 = a6;
  v28 = (float)(v16 * a6) - v22;
  v29 = -v22;
  if (v28 >= v26)
  {
    v29 = a6 * 0.5;
    if (v28 <= v22)
      v29 = v28;
  }
  v146 = v29;
  v30 = (float *)*((_QWORD *)a3 + 3);
  v31 = *v30;
  v32 = v30[1];
  v34 = v30[2];
  v33 = v30[3];
  if (-[FxHostCapabilities hostIsMotion](v11, "hostIsMotion"))
  {
    v35 = v34;
    v34 = v31;
    v31 = v35;
    v36 = v33;
  }
  else
  {
    v36 = 1.0 - v32;
    v32 = 1.0 - v33;
  }
  v37 = (float)(v34 * v154) - v18;
  if (v37 <= v18)
    v38 = (float)(v34 * v154) - v18;
  else
    v38 = v18;
  if (v37 >= v20)
    v39 = v38;
  else
    v39 = -v18;
  v40 = rintf(v39);
  v41 = (float)(v31 * v154) - v18;
  if (v41 <= v18)
    v42 = (float)(v31 * v154) - v18;
  else
    v42 = v18;
  if (v41 >= v20)
    v43 = v42;
  else
    v43 = -v18;
  v44 = rintf(v43);
  v45 = (float)(v32 * v156) - v22;
  if (v45 <= v22)
    v46 = (float)(v32 * v156) - v22;
  else
    v46 = v22;
  if (v45 >= v26)
    v47 = v46;
  else
    v47 = -v22;
  v48 = (float)(v36 * v156) - v22;
  if (v48 >= v26)
  {
    v26 = v22;
    if (v48 <= v22)
      v26 = (float)(v36 * v156) - v22;
  }
  v49 = rintf(v47);
  v50 = rintf(v26);
  if (v44 < v40 || v44 == v40 && v49 > v50)
  {
    v51 = v40;
    v52 = v49;
  }
  else
  {
    v51 = v44;
    v52 = v50;
    v44 = v40;
    v50 = v49;
  }
  v145 = v31;
  if (v44 == v51)
  {
    v56 = v32;
    v57 = v34;
    v58 = v36;
    v55 = 0.0;
    v53 = 0.0;
    v54 = 0.0;
LABEL_64:
    v59 = 0.0;
    goto LABEL_65;
  }
  v53 = (float)(v52 - v50) / (float)(v51 - v44);
  v54 = 0.0;
  if (v53 == 0.0)
    v55 = 0.0;
  else
    v55 = 1.0 / v53;
  v56 = v32;
  v57 = v34;
  v58 = v36;
  if (v53 >= 0.0)
    goto LABEL_64;
  v59 = (float)(int)(float)(v50 - v52);
  v54 = (float)(int)(float)(v51 - v44);
LABEL_65:
  v60 = rintf(v152);
  v61 = rintf(v150);
  v62 = rintf(v148);
  v63 = rintf(v146);
  v64 = fabsf(v53);
  if (v44 == v51 || v64 >= 1.0)
  {
    v60 = v60 + -3.0;
    v61 = v61 + 3.0;
  }
  else
  {
    v62 = v62 + -3.0;
    v63 = v63 + 3.0;
  }
  if (vabds_f32(v62, v63) < 6.0 || vabds_f32(v60, v61) < 6.0)
    return 0;
  v168[0] = HGRectMake4i((int)v60, (int)v62, (int)v61, (int)v63);
  v168[1] = v67;
  v167 = 0;
  v68 = *(_OWORD *)&a4->var2;
  v69 = *(_OWORD *)&a4->var4;
  v166[0] = *(_OWORD *)&a4->var0.var0;
  v166[1] = v68;
  v166[2] = v69;
  v70 = -[PAEFilterDefaultBase getInputBitmap:withInfo:atTime:withROI:](self, "getInputBitmap:withInfo:atTime:withROI:", &v167, v166, a4->var0.var1, v168);
  v65 = v70;
  if (v70)
  {
    v147 = a4;
    v142 = v70;
    v71 = objc_msgSend(v167, "width");
    v72 = objc_msgSend(v167, "height");
    v73 = objc_msgSend(v167, "dataPtr");
    v74 = objc_msgSend(v167, "pixelFormat");
    v157 = v74 != 0;
    if (v74)
      v75 = 2;
    else
      v75 = 1;
    if (v74)
      v76 = 3;
    else
      v76 = 2;
    v151 = (unint64_t)(int)objc_msgSend(v167, "rowBytes") >> 2;
    v77 = v151 * v72;
    v78 = -[PAEKeyer isLutExpandedForHDR](self, "isLutExpandedForHDR");
    v153 = v71;
    v155 = v72;
    v143 = self;
    v144 = v11;
    if (v64 < 1.0)
    {
      v79 = v157;
      v80 = v72;
      v81 = v71;
      if (v71 >= 1)
      {
        v97 = 0;
        v149 = v81;
        do
        {
          v98 = v73
              + 4 * (4 * v97)
              + 4 * (int)(float)((float)(v53 * (float)(int)v97) + v59) * (int)v151;
          v99 = 6;
          do
          {
            if (v98 >= v73 && v77 > (int)((v98 - v73 + 12) >> 2))
            {
              if (v78)
              {
                v100 = *(float *)(v98 + 4 * v79);
                if (v100 < 0.0)
                  v100 = 0.0;
                v101 = *(float *)(v98 + 4 * v75);
                if (v101 < 0.0)
                  v101 = 0.0;
                v102 = *(float *)(v98 + 4 * v76);
                if (v102 < 0.0)
                  v102 = 0.0;
              }
              else
              {
                v103 = *(float *)(v98 + 4 * v79);
                if (v103 <= 1.0)
                  v104 = *(float *)(v98 + 4 * v79);
                else
                  v104 = 1.0;
                if (v103 >= 0.0)
                  v100 = v104;
                else
                  v100 = 0.0;
                v105 = *(float *)(v98 + 4 * v75);
                if (v105 <= 1.0)
                  v106 = *(float *)(v98 + 4 * v75);
                else
                  v106 = 1.0;
                if (v105 >= 0.0)
                  v101 = v106;
                else
                  v101 = 0.0;
                v107 = *(float *)(v98 + 4 * v76);
                if (v107 <= 1.0)
                  v108 = *(float *)(v98 + 4 * v76);
                else
                  v108 = 1.0;
                if (v107 >= 0.0)
                  v102 = v108;
                else
                  v102 = 0.0;
              }
              v163 = v100;
              v164 = v101;
              v165 = v102;
              v109 = (float *)*((_QWORD *)a3 + 7);
              if ((unint64_t)v109 >= *((_QWORD *)a3 + 8))
              {
                v110 = std::vector<Vec3f>::__push_back_slow_path<Vec3f const&>(v158, &v163);
                v81 = v153;
                v80 = v155;
                v79 = v157;
              }
              else
              {
                *v109 = v100;
                v109[1] = v164;
                v109[2] = v165;
                v110 = (uint64_t)(v109 + 3);
              }
              *((_QWORD *)a3 + 7) = v110;
              v98 += 4 * (int)v151;
            }
            --v99;
          }
          while (v99);
          ++v97;
        }
        while (v97 != v149);
      }
    }
    else
    {
      v79 = v157;
      v80 = v72;
      v81 = v71;
      if ((int)v72 >= 1)
      {
        v82 = 0;
        v83 = v73;
        do
        {
          v84 = v83 + 16 * (int)(float)((float)(v55 * (float)v82) + v54);
          v85 = 6;
          do
          {
            if (v84 >= v73 && v77 > (int)((v84 - v73 + 12) >> 2))
            {
              if (v78)
              {
                v86 = *(float *)(v84 + 4 * v79);
                if (v86 < 0.0)
                  v86 = 0.0;
                v87 = *(float *)(v84 + 4 * v75);
                if (v87 < 0.0)
                  v87 = 0.0;
                v88 = *(float *)(v84 + 4 * v76);
                if (v88 < 0.0)
                  v88 = 0.0;
              }
              else
              {
                v89 = *(float *)(v84 + 4 * v79);
                if (v89 <= 1.0)
                  v90 = *(float *)(v84 + 4 * v79);
                else
                  v90 = 1.0;
                if (v89 >= 0.0)
                  v86 = v90;
                else
                  v86 = 0.0;
                v91 = *(float *)(v84 + 4 * v75);
                if (v91 <= 1.0)
                  v92 = *(float *)(v84 + 4 * v75);
                else
                  v92 = 1.0;
                if (v91 >= 0.0)
                  v87 = v92;
                else
                  v87 = 0.0;
                v93 = *(float *)(v84 + 4 * v76);
                if (v93 <= 1.0)
                  v94 = *(float *)(v84 + 4 * v76);
                else
                  v94 = 1.0;
                if (v93 >= 0.0)
                  v88 = v94;
                else
                  v88 = 0.0;
              }
              v163 = v86;
              v164 = v87;
              v165 = v88;
              v95 = (float *)*((_QWORD *)a3 + 7);
              if ((unint64_t)v95 >= *((_QWORD *)a3 + 8))
              {
                v96 = std::vector<Vec3f>::__push_back_slow_path<Vec3f const&>(v158, &v163);
                v81 = v153;
                v80 = v155;
                v79 = v157;
              }
              else
              {
                *v95 = v86;
                v95[1] = v164;
                v95[2] = v165;
                v96 = (uint64_t)(v95 + 3);
              }
              *((_QWORD *)a3 + 7) = v96;
              v84 += 16;
            }
            --v85;
          }
          while (v85);
          v83 += 4 * (int)v151;
          ++v82;
        }
        while (v82 != (_DWORD)v80);
      }
    }
    v111 = (int)(4 * v81 - 4);
    if (v57 <= v145)
      v112 = 0;
    else
      v112 = (int)(4 * v81 - 4);
    if (v57 > v145)
      v111 = 0;
    v113 = (v80 << 32) - 0x100000000;
    if (v56 <= v58)
      v114 = 0;
    else
      v114 = (v80 << 32) - 0x100000000;
    v115 = v73 + ((uint64_t)(v114 * v151) >> 30) + 4 * v112;
    v116 = *(float *)(v115 + 4 * v75);
    v117 = *(float *)(v115 + 4 * v76);
    v163 = *(float *)(v115 + 4 * v79);
    v164 = v116;
    v165 = v117;
    if (v56 <= v58)
      v118 = v113;
    else
      v118 = 0;
    v119 = v73 + ((uint64_t)(v118 * v151) >> 30) + 4 * v111;
    v120 = *(float *)(v119 + 4 * v75);
    v121 = *(float *)(v119 + 4 * v76);
    v162[0] = *(float *)(v119 + 4 * v79);
    v162[1] = v120;
    v162[2] = v121;
    v122 = -[PAEKeyerSetupUtil initWithAPIManager:colorPrimaries:atTime:]([PAEKeyerSetupUtil alloc], "initWithAPIManager:colorPrimaries:atTime:", v143->super.super._apiManager, -[PAEKeyer getColorPrimaries](v143, "getColorPrimaries"), v147->var0.var1);
    OMKeyer2D::getTolCenterCbCr((OMKeyer2D *)-[PAEKeyerSetupUtil omKeyer](v122, "omKeyer"), &v161);
    v123 = vmul_f32(v161, (float32x2_t)0x3F0000003F000000);

    OMColorUtil::getCbCrFromRGB(&v163, 1, v124, v125, v126, v127, v128, v129, (float *)&v161);
    OMColorUtil::getCbCrFromRGB(v162, 1, v130, v131, v132, v133, v134, v135, (float *)&v160);
    v136 = vsub_f32(v123, v161);
    v137 = (int32x2_t)vmul_f32(v136, v136);
    v138 = vsub_f32(v123, v160);
    v139 = (int32x2_t)vmul_f32(v138, v138);
    v159 = vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v139, v137), (float32x2_t)vzip2_s32(v139, v137)));
    v140 = -[FxHostCapabilities hostIsMotion](v144, "hostIsMotion");
    v141 = v159.f32[0] < v159.f32[1];
    if (!v140)
      v141 = v159.f32[0] > v159.f32[1];
    *((_BYTE *)a3 + 84) = v141;

    return v142;
  }
  else
  {
    fwrite("Failed to retrieve input bitmap in Keyer \n", 0x2AuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
  }
  return v65;
}

- (BOOL)sampleRect:(void *)a3 renderInfo:(id *)a4 width:(float)a5 height:(float)a6
{
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  BOOL v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  _BOOL8 v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  _BOOL4 v51;
  uint64_t v52;
  float v53;
  uint64_t v54;
  uint64_t v55;
  float *v56;
  float *v57;
  float *v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  float *v69;
  float *v70;
  float *v71;
  unint64_t v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float v77;
  float v78;
  float *v79;
  uint64_t v80;
  BOOL v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t *v87;
  float v88;
  float v89;
  float v90;
  _OWORD v91[3];
  id v92;
  _QWORD v93[2];
  unint64_t v94;
  unint64_t v95;

  (*(void (**)(unint64_t *__return_ptr, void *, SEL))(*(_QWORD *)a3 + 16))(&v95, a3, a2);
  (*(void (**)(unint64_t *__return_ptr, void *))(*(_QWORD *)a3 + 24))(&v94, a3);
  v87 = (uint64_t *)((char *)a3 + 48);
  *((_QWORD *)a3 + 7) = *((_QWORD *)a3 + 6);
  v11 = 0.0;
  v12 = 0.0;
  if (*(float *)&v95 >= 0.0)
  {
    v12 = 1.0;
    if (*(float *)&v95 <= 1.0)
      LODWORD(v12) = v95;
  }
  v13 = 1.0;
  if (*((float *)&v95 + 1) <= 1.0)
    v14 = *((float *)&v95 + 1);
  else
    v14 = 1.0;
  if (*((float *)&v95 + 1) >= 0.0)
    v15 = v14;
  else
    v15 = 0.0;
  v95 = __PAIR64__(LODWORD(v15), LODWORD(v12));
  if (*(float *)&v94 >= 0.0)
  {
    v11 = 1.0;
    if (*(float *)&v94 <= 1.0)
      LODWORD(v11) = v94;
  }
  v16 = 0;
  if (*((float *)&v94 + 1) <= 1.0)
    v13 = *((float *)&v94 + 1);
  if (*((float *)&v94 + 1) >= 0.0)
    v17 = v13;
  else
    v17 = 0.0;
  v94 = __PAIR64__(LODWORD(v17), LODWORD(v11));
  if ((float)(v11 - v12) != 0.0 && (float)(v17 - v15) != 0.0)
  {
    v18 = a5 * 0.5;
    v19 = a6 * 0.5;
    v20 = (float)(v12 * a5) - (float)(a5 * 0.5);
    v21 = -(float)(a5 * 0.5);
    if (v20 <= (float)(a5 * 0.5))
      v22 = v20;
    else
      v22 = a5 * 0.5;
    if (v20 >= v21)
      v23 = v22;
    else
      v23 = -(float)(a5 * 0.5);
    v24 = rintf(v23);
    v25 = (float)(v11 * a5) - v18;
    if (v25 <= v18)
      v26 = v25;
    else
      v26 = a5 * 0.5;
    if (v25 >= v21)
      v27 = v26;
    else
      v27 = -(float)(a5 * 0.5);
    v28 = rintf(v27);
    v29 = (float)(v15 * a6) - v19;
    v30 = -v19;
    if (v29 <= v19)
      v31 = (float)(v15 * a6) - v19;
    else
      v31 = a6 * 0.5;
    if (v29 >= v30)
      v32 = v31;
    else
      v32 = -v19;
    v33 = rintf(v32);
    v34 = (float)(v17 * a6) - v19;
    if (v34 <= v19)
      v35 = (float)(v17 * a6) - v19;
    else
      v35 = a6 * 0.5;
    if (v34 >= v30)
      v30 = v35;
    v36 = rintf(v30);
    v37 = v24 + 1.0;
    if (v28 != v24)
      v37 = v28;
    v38 = v18 + -1.0;
    if (v24 == v18 && v28 == v18)
      v37 = v28;
    else
      v38 = v24;
    if (v33 == v19 && v36 == v19)
    {
      v33 = v19 + -1.0;
    }
    else if (v36 == v33)
    {
      v36 = v33 + 1.0;
    }
    if (vabds_f32(v33, v36) >= 6.0 && vabds_f32(v38, v37) >= 6.0)
    {
      v93[0] = HGRectMake4i((int)v38, (int)v33, (int)v37, (int)v36);
      v93[1] = v41;
      v92 = 0;
      v42 = *(_OWORD *)&a4->var2;
      v43 = *(_OWORD *)&a4->var4;
      v91[0] = *(_OWORD *)&a4->var0.var0;
      v91[1] = v42;
      v91[2] = v43;
      v16 = -[PAEFilterDefaultBase getInputBitmap:withInfo:atTime:withROI:](self, "getInputBitmap:withInfo:atTime:withROI:", &v92, v91, a4->var0.var1, v93);
      if (v16)
      {
        v44 = objc_msgSend(v92, "dataPtr");
        v45 = objc_msgSend(v92, "pixelFormat");
        v46 = v45 != 0;
        if (v45)
          v47 = 2;
        else
          v47 = 1;
        if (v45)
          v48 = 3;
        else
          v48 = 2;
        v49 = objc_msgSend(v92, "width");
        v50 = objc_msgSend(v92, "height");
        v51 = -[PAEKeyer isLutExpandedForHDR](self, "isLutExpandedForHDR");
        v86 = v50;
        v81 = v16;
        if (-[PAEKeyer isSimpleKey](self, "isSimpleKey"))
        {
          if (v50)
          {
            v52 = 0;
            v53 = (float)v50 * 0.5;
            v54 = 4 * v46;
            v82 = 4 * v48;
            v84 = 4 * v47;
            do
            {
              if (v49)
              {
                v55 = 0;
                v56 = (float *)(v44 + v54);
                v57 = (float *)(v44 + v84);
                v58 = (float *)(v44 + v82);
                do
                {
                  if (sqrtf((float)((float)((float)((float)(int)v52 * 0.5) - v53)* (float)((float)((float)(int)v52 * 0.5) - v53))+ (float)((float)((float)((float)(int)v55 * 0.5) - (float)((float)v49 * 0.5))* (float)((float)((float)(int)v55 * 0.5) - (float)((float)v49 * 0.5)))) < (float)((float)v49 * 0.5))
                  {
                    if (v51)
                    {
                      v59 = *v56;
                      if (*v56 < 0.0)
                        v59 = 0.0;
                      v60 = *v57;
                      if (*v57 < 0.0)
                        v60 = 0.0;
                      v61 = *v58;
                      if (*v58 < 0.0)
                        v61 = 0.0;
                    }
                    else
                    {
                      if (*v56 <= 1.0)
                        v62 = *v56;
                      else
                        v62 = 1.0;
                      if (*v56 >= 0.0)
                        v59 = v62;
                      else
                        v59 = 0.0;
                      if (*v57 <= 1.0)
                        v63 = *v57;
                      else
                        v63 = 1.0;
                      if (*v57 >= 0.0)
                        v60 = v63;
                      else
                        v60 = 0.0;
                      if (*v58 <= 1.0)
                        v64 = *v58;
                      else
                        v64 = 1.0;
                      if (*v58 >= 0.0)
                        v61 = v64;
                      else
                        v61 = 0.0;
                    }
                    v88 = v59;
                    v89 = v60;
                    v90 = v61;
                    v65 = (float *)*((_QWORD *)a3 + 7);
                    if ((unint64_t)v65 >= *((_QWORD *)a3 + 8))
                    {
                      v66 = std::vector<Vec3f>::__push_back_slow_path<Vec3f const&>(v87, &v88);
                    }
                    else
                    {
                      *v65 = v59;
                      v65[1] = v89;
                      v65[2] = v90;
                      v66 = (uint64_t)(v65 + 3);
                    }
                    *((_QWORD *)a3 + 7) = v66;
                  }
                  ++v55;
                  v56 += 4;
                  v57 += 4;
                  v58 += 4;
                }
                while (v49 != v55);
              }
              v44 += objc_msgSend(v92, "rowBytes") & 0xFFFFFFFFFFFFFFFCLL;
              ++v52;
            }
            while (v52 != v86);
          }
        }
        else if (v50)
        {
          v67 = 0;
          v83 = 4 * v47;
          v85 = 4 * v46;
          v68 = 4 * v48;
          do
          {
            if (v49)
            {
              v69 = (float *)(v44 + v85);
              v70 = (float *)(v44 + v83);
              v71 = (float *)(v44 + v68);
              v72 = v49;
              do
              {
                if (v51)
                {
                  v73 = *v69;
                  if (*v69 < 0.0)
                    v73 = 0.0;
                  v74 = *v70;
                  if (*v70 < 0.0)
                    v74 = 0.0;
                  v75 = *v71;
                  if (*v71 < 0.0)
                    v75 = 0.0;
                }
                else
                {
                  if (*v69 <= 1.0)
                    v76 = *v69;
                  else
                    v76 = 1.0;
                  if (*v69 >= 0.0)
                    v73 = v76;
                  else
                    v73 = 0.0;
                  if (*v70 <= 1.0)
                    v77 = *v70;
                  else
                    v77 = 1.0;
                  if (*v70 >= 0.0)
                    v74 = v77;
                  else
                    v74 = 0.0;
                  if (*v71 <= 1.0)
                    v78 = *v71;
                  else
                    v78 = 1.0;
                  if (*v71 >= 0.0)
                    v75 = v78;
                  else
                    v75 = 0.0;
                }
                v88 = v73;
                v89 = v74;
                v90 = v75;
                v79 = (float *)*((_QWORD *)a3 + 7);
                if ((unint64_t)v79 >= *((_QWORD *)a3 + 8))
                {
                  v80 = std::vector<Vec3f>::__push_back_slow_path<Vec3f const&>(v87, &v88);
                }
                else
                {
                  *v79 = v73;
                  v79[1] = v89;
                  v79[2] = v90;
                  v80 = (uint64_t)(v79 + 3);
                }
                *((_QWORD *)a3 + 7) = v80;
                v69 += 4;
                v70 += 4;
                v71 += 4;
                --v72;
              }
              while (v72);
            }
            v44 += objc_msgSend(v92, "rowBytes") & 0xFFFFFFFFFFFFFFFCLL;
            ++v67;
          }
          while (v67 != v86);
        }

        return v81;
      }
      else
      {
        fwrite("Failed to retrieve input bitmap in Keyer \n", 0x2AuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
      }
    }
    else
    {
      return 0;
    }
  }
  return v16;
}

- (void)setInitialSamples:(void *)a3
{
  char *v5;
  uint64_t v6;
  float v7;
  float v8;
  double v9;
  PAEKeyerAutokeySetupUtil *v10;

  v10 = -[PAEKeyerAutokeySetupUtil initWithAPIManager:]([PAEKeyerAutokeySetupUtil alloc], "initWithAPIManager:", self->super.super._apiManager);
  v6 = *((_QWORD *)a3 + 6);
  v5 = (char *)a3 + 48;
  *((_QWORD *)v5 + 1) = v6;
  if (-[PAEKeyer use32x32Histogram](self, "use32x32Histogram"))
    v7 = 0.015625;
  else
    v7 = 0.0078125;
  -[PAEKeyerAutokeySetupUtil getHistogramScale](v10, "getHistogramScale");
  *(float *)&v9 = v7 * v8;
  +[PAEKeyerInitialize setInitialSamples:autokeySetupUtil:sampleBoxHalfDim:](PAEKeyerInitialize, "setInitialSamples:autokeySetupUtil:sampleBoxHalfDim:", v5, v10, v9);

}

- (void)getInputWidth:(float *)a3 height:(float *)a4 renderInfo:(id *)a5
{
  __int128 v8;
  __int128 v9;
  FxHostCapabilities *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _OWORD v20[3];
  id v21;

  v21 = 0;
  v8 = *(_OWORD *)&a5->var2;
  v9 = *(_OWORD *)&a5->var4;
  v20[0] = *(_OWORD *)&a5->var0.var0;
  v20[1] = v8;
  v20[2] = v9;
  -[PAESharedDefaultBase getHeliumImage:source:withInfo:atTime:](self, "getHeliumImage:source:withInfo:atTime:", &v21, 1, v20, a5->var0.var1);
  *a3 = (float)(unint64_t)objc_msgSend(v21, "width");
  *a4 = (float)(unint64_t)objc_msgSend(v21, "height");
  v10 = -[FxHostCapabilities initWithAPIManager:]([FxHostCapabilities alloc], "initWithAPIManager:", self->super.super._apiManager);
  if (!-[FxHostCapabilities hostIsMotion](v10, "hostIsMotion") && objc_msgSend(v21, "fieldOrder"))
  {
    v11 = (void *)objc_msgSend(v21, "inversePixelTransform");
    v12 = *a3;
    v13 = *a4;
    objc_msgSend(v11, "transform2DPoint:", 0.0, 0.0);
    v15 = v14;
    v17 = v16;
    objc_msgSend(v11, "transform2DPoint:", v12, v13);
    *(float *)&v18 = v18 - v15;
    *a3 = fabsf(*(float *)&v18);
    *(float *)&v18 = v19 - v17;
    *a4 = fabsf(*(float *)&v18);
  }

}

- (void)computeModel:(BOOL)a3 atTime:(id)a4
{
  _BOOL4 v5;
  OMKeyer2D *v7;
  double v8;
  float v9;
  int v10;
  OMSamples *omSamples;
  double v12;
  float v13;
  double v14;
  float v15;
  double v16;
  float v17;
  PAEKeyerSetupUtil *v18;

  v5 = a3;
  v18 = -[PAEKeyerSetupUtil initWithAPIManager:colorPrimaries:atTime:]([PAEKeyerSetupUtil alloc], "initWithAPIManager:colorPrimaries:atTime:", self->super.super._apiManager, -[PAEKeyer getColorPrimaries](self, "getColorPrimaries"), a4.var1);
  v7 = -[PAEKeyerSetupUtil omKeyer](v18, "omKeyer");
  if (-[PAEKeyer isSimpleKey](self, "isSimpleKey"))
    -[PAEKeyerSetupUtil simpleKeyAmount](v18, "simpleKeyAmount");
  else
    -[PAEKeyerSetupUtil autoAdjustSoftGap](v18, "autoAdjustSoftGap");
  v9 = v8;
  v10 = -[PAEKeyerSetupUtil tight](v18, "tight");
  omSamples = (OMSamples *)self->_omSamples;
  -[PAEKeyerSetupUtil shadowsGain](v18, "shadowsGain");
  v13 = v12;
  -[PAEKeyerSetupUtil highlightsGain](v18, "highlightsGain");
  v15 = v14;
  -[PAEKeyerSetupUtil spreadGain](v18, "spreadGain");
  v17 = v16;
  OMKeyer2D::computeModel(v7, v5, v9, v10, omSamples, v13, v15, v17, -[PAEKeyer isLumaKey](self, "isLumaKey"), -[PAEKeyer isSimpleKey](self, "isSimpleKey"));
  -[PAEKeyerSetupUtil syncWithDB:setAsDefault:](v18, "syncWithDB:setAsDefault:", a4.var1, 0);

}

- (PAEKeyer)initWithAPIManager:(id)a3
{
  char *v3;
  FxHostCapabilities *v4;
  PAEKeyerPreprocess *v5;
  OMSamples *v6;
  __int128 v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PAEKeyer;
  v3 = -[PAESharedDefaultBase initWithAPIManager:](&v9, sel_initWithAPIManager_, a3);
  v4 = -[FxHostCapabilities initWithAPIManager:]([FxHostCapabilities alloc], "initWithAPIManager:", *((_QWORD *)v3 + 1));
  if (v4)
    v3[32] = -[FxHostCapabilities hostIsMotion](v4, "hostIsMotion");
  v3[33] = 0;
  *((_QWORD *)v3 + 19) = objc_alloc_init(PAEKeyerMatteTools);
  v5 = objc_alloc_init(PAEKeyerPreprocess);
  *((_QWORD *)v3 + 20) = v5;
  v5->_apiManager = (id)*((_QWORD *)v3 + 1);
  objc_msgSend(*((id *)v3 + 20), "setKeyer:", v3);
  v6 = (OMSamples *)operator new();
  OMSamples::OMSamples(v6);
  *((_QWORD *)v3 + 3) = v6;
  v7 = *MEMORY[0x1E0CA2E68];
  *(_QWORD *)(v3 + 52) = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  *(_OWORD *)(v3 + 36) = v7;
  *((_QWORD *)v3 + 8) = v3 + 36;
  v3[168] = 0;
  *((_DWORD *)v3 + 43) = 0;
  return (PAEKeyer *)v3;
}

- (id)properties
{
  unsigned int v2;
  uint64_t v3;
  _QWORD block[5];

  v2 = objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190), "versionAtCreation");
  v3 = 1;
  if (v2 > 6)
    v3 = 2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__PAEKeyer_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v3;
  if (-[PAEKeyer properties]::once != -1)
    dispatch_once(&-[PAEKeyer properties]::once, block);
  return (id)-[PAEKeyer properties]::sPropertiesDict;
}

uint64_t __22__PAEKeyer_properties__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v2 = objc_alloc(MEMORY[0x1E0C99D80]);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 65792);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 590080);
  result = objc_msgSend(v2, "initWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("SupportsLargeRenderScale"), v5, CFSTR("SupportsHeliumRendering"), v6, CFSTR("DesiredProcessingColorInfo"), v7, CFSTR("SDRWorkingSpace"), v8, CFSTR("HDRWorkingSpace"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32)), CFSTR("AutoColorProcessingSupport"), 0);
  -[PAEKeyer properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)isApplyTuningForRec2020
{
  void *v3;

  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  return -[PAEKeyer getColorPrimaries](self, "getColorPrimaries") == 1
      && objc_msgSend(v3, "versionAtCreation") > 6;
}

- (int)getColorPrimaries
{
  void *v3;
  uint64_t v4;

  if (objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190), "versionAtCreation") < 4|| (v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A2958)) == 0|| (v4 = objc_msgSend(v3, "colorPrimaries"), v4 != 1))
  {
    LODWORD(v4) = 0;
  }
  return v4;
}

- (BOOL)addParameters
{
  __CFBundle *MainBundle;
  const __CFString *Identifier;
  const __CFString *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  BOOL v11;
  void *v13;
  _BOOL8 v14;
  _BOOL4 v15;
  _BOOL4 v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  const __CFString *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  PCBlend *v35;
  PCString *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  void *v42;
  int v43;
  unsigned int v44;
  objc_super v45;

  v45.receiver = self;
  v45.super_class = (Class)PAEKeyer;
  -[PAESharedDefaultBase addParameters](&v45, sel_addParameters);
  MainBundle = CFBundleGetMainBundle();
  if (MainBundle
    && (Identifier = CFBundleGetIdentifier(MainBundle)) != 0
    && ((v5 = Identifier, CFStringCompare(Identifier, CFSTR("com.apple.FinalCut"), 0) == kCFCompareEqualTo)
     || CFStringCompare(v5, CFSTR("com.apple.FinalCutTrial"), 0) == kCFCompareEqualTo))
  {
    v6 = 2 * self->_isMotion;
  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  v8 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A52B8);
  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v9)
    v10 = objc_msgSend(v9, "versionAtCreation");
  else
    v10 = 3;
  if (v7)
    v11 = v8 == 0;
  else
    v11 = 1;
  if (v11)
    return 1;
  v42 = (void *)v8;
  v13 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v14 = -[PAEKeyer isLumaKey](self, "isLumaKey");
  v15 = -[PAEKeyer isSimpleKey](self, "isSimpleKey");
  v17 = self->_isMotion || v10 > 1;
  v18 = !v15;
  if (v14)
    v19 = 2;
  else
    v19 = 0;
  if (v15)
    v20 = 2;
  else
    v20 = 0;
  v43 = v17 & v18;
  if ((v17 & v18) != 0)
    v21 = 0;
  else
    v21 = 2;
  v44 = v21;
  LODWORD(v39) = 563;
  objc_msgSend(v7, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::OSCState"), 0, 0), 35, 0, 0, 2, 0, 0x100000001, v39);
  objc_msgSend(v7, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::DefaultSoftness"), CFSTR("DefaultSoftness"), 0), 1, 546, 9.0, 0.0, 20.0, 0.0, 20.0, 0.1);
  if (v14)
  {
    objc_msgSend(v7, "addCustomParameterWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::LumaWidget"), CFSTR("Luma"), 0), 5, objc_alloc_init(PAEKeyerLumaSetup), 576);
    objc_msgSend(v7, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::MatteInvert"), CFSTR("Invert"), 0), 50, 0, 545);
    objc_msgSend(v7, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::LumaRolloff"), CFSTR("Luma Rolloff"), 0), 14, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.001);
  }
  objc_msgSend(v7, "addCustomParameterWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::Selection"), CFSTR("Define Mask"), 0), 19, &stru_1E65EDDA0, v20 | v19 | 0x251);
  if (-[PAEKeyer isSimpleKey](self, "isSimpleKey"))
  {
    v22 = v6 | v19 | 0x201u;
    v23 = CFSTR("Softness");
    v24 = 0.00001;
    v25 = 0.5;
    v26 = 2.0;
    v27 = 1.0;
    v28 = v7;
    v29 = 0.00001;
  }
  else
  {
    v23 = (const __CFString *)objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::Strength"), CFSTR("Strength"), 0);
    v22 = v6 | v19 | 0x201u;
    v25 = 1.0;
    v24 = 0.0;
    v26 = 2.0;
    v29 = 0.0;
    v27 = 1.0;
    v28 = v7;
  }
  objc_msgSend(v28, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", v23, 36, v22, v25, v24, v26, v29, v27, 0.001);
  LODWORD(v40) = 547;
  objc_msgSend(v7, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::ViewChannel"), 0, 0), 27, 0, 0, 4, 0, 0x100000004, v40);
  objc_msgSend(v7, "addCustomParameterWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::NavigateCtrl"), CFSTR("Navigate"), 0), 37, &stru_1E65EDDA0, v20 | v19 | 0x251);
  objc_msgSend(v7, "addCustomParameterWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::ViewChannelCtrl"), CFSTR("View"), 0), 34, &stru_1E65EDDA0, v20 | 0x271);
  v41 = v14
     || -[PAEKeyerMatteTools addParametersWithParamAPI:hideSimpleViewParam:isLumaKey:](self->_matteTools, "addParametersWithParamAPI:hideSimpleViewParam:isLumaKey:", v7, v20, 0);
  objc_msgSend(v7, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::Spill Level"), CFSTR("Spill Level"), 0), 20, v20 | v19, 0.46, 0.0, 1.0, 0.0, 1.0, 0.001);
  if (!v14)
    objc_msgSend(v7, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::MatteInvert"), CFSTR("Invert"), 0), 50, 0, v20 | 0x201);
  objc_msgSend(v7, "addCustomParameterWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::Autokey"), 0, 0), 4, objc_alloc_init(PAEKeyerAutokeySetup), 34);
  if (!(v43 ^ 1 | v14))
    objc_msgSend(v7, "startParameterSubGroup:parmId:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::Advanced"), CFSTR("Advanced"), 0), 18, 8);
  v30 = objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::EditMode"), CFSTR("Graph"), 0);
  v31 = v44 | v19;
  v32 = v31 | v20;
  objc_msgSend(v7, "addCustomParameterWithName:parmId:defaultValue:parmFlags:", v30, 45, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14), v32 | 0x261);
  objc_msgSend(v7, "addCustomParameterWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::ChromaWidget"), CFSTR("Chroma"), 0), 6, objc_alloc_init(PAEKeyerCbCrSetup), v32 | 0x260);
  if (!v14)
    objc_msgSend(v7, "addCustomParameterWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::LumaWidget"), CFSTR("Luma"), 0), 5, objc_alloc_init(PAEKeyerLumaSetup), v44 | 0x260);
  objc_msgSend(v7, "addCustomParameterWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::Histogram"), CFSTR("Histogram"), 0), 9, objc_alloc_init(PAEKeyerHistogram), 66);
  v33 = v31 | 0x20;
  objc_msgSend(v7, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::ChromaRolloff"), CFSTR("Chroma Rolloff"), 0), 16, v31 | 0x20u, 0.1, 0.0, 1.0, 0.0, 1.0, 0.001);
  objc_msgSend(v7, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::ChromaErode"), CFSTR("Chroma Erode"), 0), 17, 34, 0.0, -0.5, 0.5, -0.25, 0.25, 0.02);
  if (!v14)
    objc_msgSend(v7, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::LumaRolloff"), CFSTR("Luma Rolloff"), 0), 14, v44 | 0x120, 0.1, 0.0, 1.0, 0.0, 1.0, 0.001);
  -[PAEKeyerPreprocess addAdvancedParametersWithParamAPI:paramFlags:](self->_preprocessTools, "addAdvancedParametersWithParamAPI:paramFlags:", v7, v31 | v20);
  if (!(v43 ^ 1 | v14))
    objc_msgSend(v7, "endParameterSubGroup");
  if ((v43 & 1) != 0)
    objc_msgSend(v7, "startParameterSubGroup:parmId:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::MatteTools"), CFSTR("Matte Tools"), 0), 47, 40);
  if (v14)
    v41 = -[PAEKeyerMatteTools addParametersWithParamAPI:hideSimpleViewParam:isLumaKey:](self->_matteTools, "addParametersWithParamAPI:hideSimpleViewParam:isLumaKey:", v7, 0, 1);
  -[PAEKeyerMatteTools addLevelsParametersWithParamAPI:hideSimpleViewParam:](self->_matteTools, "addLevelsParametersWithParamAPI:hideSimpleViewParam:", v42, v44);
  -[PAEKeyerMatteTools addAdvancedParametersWithParamAPI:hideSimpleViewParam:](self->_matteTools, "addAdvancedParametersWithParamAPI:hideSimpleViewParam:", v7, v44);
  if ((v43 & 1) != 0)
    objc_msgSend(v7, "endParameterSubGroup");
  objc_msgSend(v7, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::MinGreen"), CFSTR("MinGreen"), 0), 38, 547, -3.0, -10.0, 10.0, -10.0, 10.0, 0.1);
  objc_msgSend(v7, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::MaxGreen"), CFSTR("MaxGreen"), 0), 39, 547, -1.7, -10.0, 10.0, -10.0, 10.0, 0.1);
  objc_msgSend(v7, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::GreenChroma"), CFSTR("GreenChroma"), 0), 40, 547, 0.09, -10.0, 10.0, -10.0, 10.0, 0.1);
  objc_msgSend(v7, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::MinBlue"), CFSTR("MinBlue"), 0), 41, 547, -1.25, -10.0, 10.0, -10.0, 10.0, 0.1);
  objc_msgSend(v7, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::MaxBlue"), CFSTR("MaxBlue"), 0), 42, 547, 0.125, -10.0, 10.0, -10.0, 10.0, 0.1);
  objc_msgSend(v7, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::BlueChroma"), CFSTR("BlueChroma"), 0), 43, 547, 0.09, -10.0, 10.0, -10.0, 10.0, 0.1);
  objc_msgSend(v7, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::AddTolerance"), CFSTR("Add Tolerance"), 0), 11, 0, 563);
  objc_msgSend(v7, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::DefineEdge"), CFSTR("Define Edge"), 0), 12, 0, 563);
  if (v14 | v43 ^ 1u)
  {
    objc_msgSend(v42, "addLevelsWithName:parmId:hideGamma:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::SpillLevels"), CFSTR("Spill Levels"), 0), 26, 1, v32);
    objc_msgSend(v7, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::SubClr"), CFSTR("Sub Clr"), 0), 23, v33 | v20, 0.04, 0.0, 1.0, 0.0, 1.0, 0.001);
    objc_msgSend(v7, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::LateralSat"), CFSTR("Lateral Sat"), 0), 24, v33 | v20, 0.75, 0.0, 1.0, 0.0, 1.0, 0.001);
    if ((v43 & 1) == 0)
      goto LABEL_60;
    goto LABEL_59;
  }
  objc_msgSend(v7, "startParameterSubGroup:parmId:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::SpillSuppression"), CFSTR("Spill Suppression"), 0), 28, 8);
  objc_msgSend(v42, "addLevelsWithName:parmId:hideGamma:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::SpillLevels"), CFSTR("Spill Levels"), 0), 26, 1, v32);
  objc_msgSend(v7, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::SubClr"), CFSTR("Sub Clr"), 0), 23, v33 | v20, 0.04, 0.0, 1.0, 0.0, 1.0, 0.001);
  objc_msgSend(v7, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::LateralSat"), CFSTR("Lateral Sat"), 0), 24, v33 | v20, 0.75, 0.0, 1.0, 0.0, 1.0, 0.001);
  objc_msgSend(v7, "endParameterSubGroup");
  if ((v43 & 1) != 0)
LABEL_59:
    objc_msgSend(v7, "startParameterSubGroup:parmId:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::LightWrap"), CFSTR("Light Wrap"), 0), 33, 8);
LABEL_60:
  v34 = v44 | 0x20;
  objc_msgSend(v7, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::LightWrapAmount"), CFSTR("Amount"), 0), 29, v34, 0.0, 0.0, 200.0, 0.0, 50.0, 1.0);
  objc_msgSend(v7, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::LightWrapIntensity"), CFSTR("Intensity"), 0), 30, v34, 1.0, 0.00100000005, 2.0, 0.00100000005, 1.0, 0.001);
  objc_msgSend(v7, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::LightWrapOpacity"), CFSTR("Opacity"), 0), 31, v34, 1.0, 0.0, 1.0, 0.0, 1.0, 0.001);
  v35 = (PCBlend *)objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::LightWrapMode"), CFSTR("Mode"), 0);
  v36 = PCBlend::lightWrapModeMenuString(v35);
  objc_msgSend(v7, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", v35, 32, 0, objc_msgSend((id)objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::LightWrapModes"), PCString::ns_str(v36), 0), "componentsSeparatedByString:", CFSTR(";")),
    v44 | 0x221);
  if ((v43 & 1) != 0)
    objc_msgSend(v7, "endParameterSubGroup");
  objc_msgSend(v7, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::LumaErode"), CFSTR("Luma Erode"), 0), 15, 34, 0.0, -0.5, 0.5, -0.25, 0.25, 0.02);
  objc_msgSend(v7, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::computeModel"), CFSTR("computeModel"), 0), 13, 0, 563);
  v37 = objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::NoPremultiply"), CFSTR("Preserve RGB"), 0);
  if (v14)
    v38 = 545;
  else
    v38 = 547;
  objc_msgSend(v7, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", v37, 7, 0, v38);
  objc_msgSend(v7, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Keyer::KeyerIsInitialized"), CFSTR("KeyerIsInitialized"), 0), 8, v14, 547);
  return v41;
}

- (HGRef<HGNode>)getKeyerNode:(HGRef<HGNode>)a3 omKeyer:(void *)a4 atTime:(id)a5
{
  _QWORD *v5;

  *v5 = 0;
  return (HGRef<HGNode>)self;
}

- (BOOL)isLumaKey
{
  return 0;
}

- (BOOL)isSimpleKey
{
  return 0;
}

- (BOOL)pullInitialKey:(id *)a3
{
  if (a3)
    *a3 = 0;
  return 1;
}

- (double)autokeyAmountToHistoPercent:(double)a3
{
  void *v4;

  v4 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (a3 <= 1.0 || objc_msgSend(v4, "versionAtCreation") > 6)
    return a3 * 0.9;
  else
    return (a3 + -1.0) * 0.1 + 0.9;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  int v13;
  unint64_t v14;
  unint64_t v15;
  _BOOL4 v16;
  double v17;
  float v18;
  int v19;
  float v20;
  float v21;
  __int16 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  float v27;
  PAEKeyerPreprocess *preprocessTools;
  __int128 v29;
  PAEKeyerSetupUtil *v30;
  _BOOL4 v31;
  double v32;
  _BOOL4 v33;
  _BOOL4 v34;
  int v35;
  _BOOL8 v36;
  HgcAlphaMult *v37;
  PAEKeyerMatteTools *matteTools;
  __int128 v39;
  int v40;
  int v41;
  double v42;
  double v43;
  double v44;
  HgcAlphaMult *v45;
  HgcCopyAlpha *v46;
  __n128 v47;
  char *v48;
  HGSolidColor *v49;
  HGHWBlendFlipped *v50;
  int v51;
  double v52;
  HgcAlphaMult *v53;
  HgcPostKeyer *v54;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var1;
  float v56;
  int v57;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v58;
  double v59;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v60;
  double v61;
  void *v62;
  unsigned int v63;
  double v64;
  float v65;
  uint64_t v66;
  uint64_t v67;
  float v68;
  float v69;
  float v70;
  HgcSpillRemoval *v71;
  float v72;
  float v73;
  float v74;
  __n128 v75;
  uint64_t v77;
  uint64_t v78;
  PAEKeyerSetupUtil *v79;
  id v80;
  id v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  float v92;
  float v93;
  float v94;
  float v95;
  float v96;
  float v97;
  float v98;
  float v99;
  float v100;
  float v101;
  float v102;
  float v103;
  float v104;
  float v105;
  double v106[2];
  float v107;
  float v108;
  float v109;
  float v110;
  float v111;
  float v112;
  float v113;
  float v114;
  uint64_t v115;
  double v116;
  double v117;
  uint64_t v118;
  int v119;
  int v120;
  _OWORD v121[3];
  HgcAlphaMult *v122;
  unsigned __int8 v123;
  _OWORD v124[3];
  double v125;
  double v126;
  double v127;
  HgcAlphaMult *v128;
  HgcAlphaMult *v129;
  HgcAlphaMult *v130;
  HgcAlphaMult *v131;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4F90);
  if (v9)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (v11)
    goto LABEL_110;
  v12 = (void *)v10;
  v13 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
  if (!v13)
    return v13;
  if (objc_msgSend(a4, "imageType") != 3)
  {
LABEL_110:
    LOBYTE(v13) = 0;
    return v13;
  }
  v14 = objc_msgSend(a4, "width");
  v15 = objc_msgSend(a4, "height");
  v16 = -[FxHostCapabilities upscalesFields](-[FxHostCapabilities initWithAPIManager:]([FxHostCapabilities alloc], "initWithAPIManager:", self->super.super._apiManager), "upscalesFields");
  v80 = a3;
  objc_msgSend(a3, "pixelAspect");
  v18 = v17;
  if (a5->var2)
    v19 = v16;
  else
    v19 = 1;
  if (v19)
    v20 = 1.0;
  else
    v20 = 2.0;
  if (v19)
    v21 = v18;
  else
    v21 = v18 + v18;
  v22 = objc_msgSend(a4, "nclcValue");
  v81 = a4;
  if (a4)
  {
    objc_msgSend(a4, "heliumRef");
    v130 = v131;
    if (v131)
    {
      (*(void (**)(HgcAlphaMult *))(*(_QWORD *)v131 + 16))(v131);
      v129 = v131;
      (*(void (**)(HgcAlphaMult *))(*(_QWORD *)v131 + 16))(v131);
      v128 = v131;
      (*(void (**)(HgcAlphaMult *))(*(_QWORD *)v131 + 16))(v131);
      v127 = *(double *)&v131;
      (*(void (**)(HgcAlphaMult *))(*(_QWORD *)v131 + 16))(v131);
      goto LABEL_23;
    }
  }
  else
  {
    v130 = 0;
    v131 = 0;
  }
  v129 = 0;
  *(double *)&v128 = 0.0;
  v127 = 0.0;
LABEL_23:
  -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
  *(float *)&v23 = (float)v14;
  *(float *)&v24 = (float)v15;
  HIDWORD(v25) = HIDWORD(v125);
  HIDWORD(v26) = HIDWORD(v126);
  *(float *)&v25 = v125;
  v27 = v126;
  *(float *)&v26 = fabsf(v27);
  preprocessTools = self->_preprocessTools;
  v29 = *(_OWORD *)&a5->var2;
  v124[0] = *(_OWORD *)&a5->var0.var0;
  v124[1] = v29;
  v124[2] = *(_OWORD *)&a5->var4;
  if (-[PAEKeyerPreprocess doPreprocessKeyerFootageWithParamAPI:withInfo:linearInput:scaleX:scaleY:width:height:fixDVResult:degrainResult:outputNode:](preprocessTools, "doPreprocessKeyerFootageWithParamAPI:withInfo:linearInput:scaleX:scaleY:width:height:fixDVResult:degrainResult:outputNode:", v9, v124, (v22 & 0xFF00) == 2048, &v129, &v130, &v128, v25, v26, v23, v24))
  {
    v123 = 0;
    objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v123, 50, a5->var0.var1);
    v30 = -[PAEKeyerSetupUtil initWithAPIManager:colorPrimaries:atTime:]([PAEKeyerSetupUtil alloc], "initWithAPIManager:colorPrimaries:atTime:", self->super.super._apiManager, -[PAEKeyer getColorPrimaries](self, "getColorPrimaries"), a5->var0.var1);
    v31 = -[PAEKeyerSetupUtil keyerActiveAt:](v30, "keyerActiveAt:", a5->var0.var1);
    v79 = v30;
    v78 = -[PAEKeyerSetupUtil omKeyer](v30, "omKeyer");
    if (v31)
    {
      v122 = v128;
      if (*(double *)&v128 != 0.0)
        (*(void (**)(HgcAlphaMult *))(*(_QWORD *)v128 + 16))(v128);
      -[PAEKeyer getKeyerNode:omKeyer:atTime:](self, "getKeyerNode:omKeyer:atTime:", &v122, v78, a5->var0.var1);
      if (v122)
        (*(void (**)(HgcAlphaMult *))(*(_QWORD *)v122 + 24))(v122);
      v32 = v106[0];
      if (v128 != *(HgcAlphaMult **)&v106[0])
      {
        if (*(double *)&v128 != 0.0)
        {
          (*(void (**)(HgcAlphaMult *))(*(_QWORD *)v128 + 24))(v128);
          v32 = v106[0];
        }
        *(double *)&v128 = v32;
        if (v32 != 0.0)
          (*(void (**)(double))(**(_QWORD **)&v32 + 16))(COERCE_DOUBLE(*(_QWORD *)&v32));
      }
      v33 = -[PAEKeyer isLumaKey](self, "isLumaKey");
      v34 = -[PAEKeyer isLumaKey](self, "isLumaKey");
      if (*(_QWORD *)&v106[0])
        (*(void (**)(_QWORD))(**(_QWORD **)&v106[0] + 24))(*(_QWORD *)&v106[0]);
      v35 = !v33;
      v36 = !v34;
    }
    else
    {
      v123 = 0;
      v37 = v131;
      if (v128 != v131)
      {
        if (*(double *)&v128 != 0.0)
        {
          (*(void (**)(HgcAlphaMult *))(*(_QWORD *)v128 + 24))(v128);
          v37 = v131;
        }
        v128 = v37;
        if (v37)
          (*(void (**)(HgcAlphaMult *))(*(_QWORD *)v37 + 16))(v37);
      }
      v35 = 0;
      v36 = 0;
    }
    matteTools = self->_matteTools;
    v39 = *(_OWORD *)&a5->var2;
    v121[0] = *(_OWORD *)&a5->var0.var0;
    v121[1] = v39;
    v121[2] = *(_OWORD *)&a5->var4;
    v40 = v123;
    -[PAESharedDefaultBase getBlendingGamma](self, "getBlendingGamma");
    LODWORD(v42) = v41;
    LOBYTE(v77) = 1;
    *(float *)&v43 = v21;
    *(float *)&v44 = v20;
    if (-[PAEKeyerMatteTools doMatteManipulationWithParamAPI:withPrivateParamAPI:withInfo:pixelAspectRatio:fieldHeight:doInvertMatte:inputIsInverted:fillHoles:scaling:blendingGamma:preKeyedInputNode:outputNode:](matteTools, "doMatteManipulationWithParamAPI:withPrivateParamAPI:withInfo:pixelAspectRatio:fieldHeight:doInvertMatte:inputIsInverted:fillHoles:scaling:blendingGamma:preKeyedInputNode:outputNode:", v9, v12, v121, v40 != 0, v36, 1, v43, v44, v42, v77, &v127, &v128))
    {
      v120 = 0;
      objc_msgSend(v9, "getIntValue:fromParm:atFxTime:", &v120, 27, a5->var0.var1);
      switch(v120)
      {
        case 1:
          if (v31)
          {
            v45 = (HgcAlphaMult *)HGObject::operator new(0x1A0uLL);
            HgcAlphaMult::HgcAlphaMult(v45);
            (*(void (**)(HgcAlphaMult *, _QWORD, double))(*(_QWORD *)v45 + 120))(v45, 0, COERCE_DOUBLE(*(_QWORD *)&v127));
            (*(void (**)(HgcAlphaMult *, uint64_t, HgcAlphaMult *))(*(_QWORD *)v45 + 120))(v45, 1, v128);
            if (v128 != v45)
            {
              if (*(double *)&v128 != 0.0)
                (*(void (**)(void))(*(_QWORD *)v128 + 24))();
              v128 = v45;
              (*(void (**)(HgcAlphaMult *))(*(_QWORD *)v45 + 16))(v45);
            }
            (*(void (**)(HgcAlphaMult *))(*(_QWORD *)v45 + 24))(v45);
          }
          v46 = (HgcCopyAlpha *)HGObject::operator new(0x1A0uLL);
          *((_OWORD *)v46 + 24) = 0u;
          *((_OWORD *)v46 + 25) = 0u;
          *((_OWORD *)v46 + 22) = 0u;
          *((_OWORD *)v46 + 23) = 0u;
          *((_OWORD *)v46 + 20) = 0u;
          *((_OWORD *)v46 + 21) = 0u;
          *((_OWORD *)v46 + 18) = 0u;
          *((_OWORD *)v46 + 19) = 0u;
          *((_OWORD *)v46 + 16) = 0u;
          *((_OWORD *)v46 + 17) = 0u;
          *((_OWORD *)v46 + 14) = 0u;
          *((_OWORD *)v46 + 15) = 0u;
          *((_OWORD *)v46 + 12) = 0u;
          *((_OWORD *)v46 + 13) = 0u;
          *((_OWORD *)v46 + 10) = 0u;
          *((_OWORD *)v46 + 11) = 0u;
          *((_OWORD *)v46 + 8) = 0u;
          *((_OWORD *)v46 + 9) = 0u;
          *((_OWORD *)v46 + 6) = 0u;
          *((_OWORD *)v46 + 7) = 0u;
          *((_OWORD *)v46 + 4) = 0u;
          *((_OWORD *)v46 + 5) = 0u;
          *((_OWORD *)v46 + 2) = 0u;
          *((_OWORD *)v46 + 3) = 0u;
          *(_OWORD *)v46 = 0u;
          *((_OWORD *)v46 + 1) = 0u;
          HgcCopyAlpha::HgcCopyAlpha(v46);
          *(_QWORD *)v46 = &unk_1E64E2318;
          v47.n128_u32[0] = 1.0;
          HgcCopyAlpha::SetParameter(v46, 0, v47, 1.0, 1.0, 1.0, v48);
          (*(void (**)(HgcCopyAlpha *, _QWORD, HgcAlphaMult *))(*(_QWORD *)v46 + 120))(v46, 0, v128);
          (*(void (**)(HgcCopyAlpha *, uint64_t, HgcAlphaMult *))(*(_QWORD *)v46 + 120))(v46, 1, v128);
          v49 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
          HGSolidColor::HGSolidColor(v49);
          (*(void (**)(HGSolidColor *, _QWORD, float, float, float, float))(*(_QWORD *)v49 + 96))(v49, 0, 0.0, 0.0, 0.0, 1.0);
          v50 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
          HGHWBlendFlipped::HGHWBlendFlipped(v50);
          (*(void (**)(HGHWBlendFlipped *, _QWORD, float, float, float, float))(*(_QWORD *)v50 + 96))(v50, 0, 0.0, 0.0, 0.0, 0.0);
          -[PAESharedDefaultBase getBlendingGamma](self, "getBlendingGamma");
          (*(void (**)(HGHWBlendFlipped *, uint64_t))(*(_QWORD *)v50 + 96))(v50, 5);
          (*(void (**)(HGHWBlendFlipped *, uint64_t, HGSolidColor *))(*(_QWORD *)v50 + 120))(v50, 1, v49);
          (*(void (**)(HGHWBlendFlipped *, _QWORD, HgcCopyAlpha *))(*(_QWORD *)v50 + 120))(v50, 0, v46);
          if (v128 != v50)
          {
            if (*(double *)&v128 != 0.0)
              (*(void (**)(void))(*(_QWORD *)v128 + 24))();
            v128 = v50;
            (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v50 + 16))(v50);
          }
          (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v50 + 24))(v50);
          (*(void (**)(HGSolidColor *))(*(_QWORD *)v49 + 24))(v49);
          (*(void (**)(HgcCopyAlpha *))(*(_QWORD *)v46 + 24))(v46);
          goto LABEL_93;
        case 2:
          v52 = *(double *)&v128;
          v53 = v131;
          if (v128 == v131)
            goto LABEL_94;
          if (*(double *)&v128 != 0.0)
          {
            (*(void (**)(void))(*(_QWORD *)v128 + 24))();
            v53 = v131;
          }
          goto LABEL_67;
        case 3:
          v52 = *(double *)&v128;
          v53 = v130;
          if (v128 == v130)
            goto LABEL_94;
          if (*(double *)&v128 != 0.0)
          {
            (*(void (**)(void))(*(_QWORD *)v128 + 24))();
            v53 = v130;
          }
          goto LABEL_67;
        case 4:
          v52 = *(double *)&v128;
          v53 = v129;
          if (v128 == v129)
            goto LABEL_94;
          if (*(double *)&v128 != 0.0)
          {
            (*(void (**)(void))(*(_QWORD *)v128 + 24))();
            v53 = v129;
          }
LABEL_67:
          v128 = v53;
          if (v53)
          {
            (*(void (**)(HgcAlphaMult *))(*(_QWORD *)v53 + 16))(v53);
LABEL_93:
            v52 = *(double *)&v128;
LABEL_94:
            v106[0] = v52;
            if (v52 != 0.0)
              (*(void (**)(double))(**(_QWORD **)&v52 + 16))(COERCE_DOUBLE(*(_QWORD *)&v52));
          }
          else
          {
            v106[0] = 0.0;
          }
          -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", v106, v81, v80);

          objc_msgSend(v80, "setHeliumRef:", v106);
          if (*(_QWORD *)&v106[0])
            (*(void (**)(_QWORD))(**(_QWORD **)&v106[0] + 24))(*(_QWORD *)&v106[0]);
          v51 = 0;
          break;
        default:
          v52 = v127;
          if (*(HgcAlphaMult **)&v127 == v128)
            goto LABEL_94;
          v54 = (HgcPostKeyer *)HGObject::operator new(0x1A0uLL);
          HgcPostKeyer::HgcPostKeyer(v54);
          (*(void (**)(HgcPostKeyer *, _QWORD, HgcAlphaMult *))(*(_QWORD *)v54 + 120))(v54, 0, v128);
          (*(void (**)(HgcPostKeyer *, uint64_t, double))(*(_QWORD *)v54 + 120))(v54, 1, COERCE_DOUBLE(*(_QWORD *)&v127));
          var1 = a5->var0.var1;
          v106[0] = 0.0;
          objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", v106, 20, var1);
          v56 = v106[0];
          if (v56 >= 0.1)
            v57 = v35;
          else
            v57 = 0;
          if (v57 == 1)
          {
            v118 = 0x3F0000003F000000;
            v119 = 1056964608;
            v58 = a5->var0.var1;
            v106[0] = 0.0;
            objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", v106, 23, v58);
            v59 = v106[0];
            v60 = a5->var0.var1;
            v106[0] = 0.0;
            objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", v106, 24, v60);
            v61 = v106[0];
            v116 = 0.0;
            v117 = 0.0;
            v115 = 0;
            objc_msgSend(v12, "getLevelsBlack:White:Gamma:fromParm:atTime:", &v117, &v116, &v115, 26, a5->var0.var1);
            v62 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
            if (v62)
              v63 = objc_msgSend(v62, "versionAtCreation");
            else
              v63 = 3;
            v64 = v117;
            if (v63 <= 2)
              v65 = v116 + -1.0;
            else
              v65 = 0.0;
            v66 = -[PAEKeyer getColorPrimaries](self, "getColorPrimaries");
            v67 = -[PAEKeyer isApplyTuningForRec2020](self, "isApplyTuningForRec2020");
            v68 = v61;
            v69 = (v56 + -0.100000001) / 9.0;
            v70 = v64;
            OMKeyer2D::getSpillSuppressTransf(v78, (uint64_t)&v118, (uint64_t)v106, (uint64_t)&v94, (uint64_t)&v82, v66, v67, v69, v70, v65, 0.0, v68);
            if (v63 < 3)
            {
              v71 = (HgcSpillRemoval *)HGObject::operator new(0x1A0uLL);
              HgcSpillRemoval::HgcSpillRemoval(v71);
              (*(void (**)(HgcSpillRemoval *, _QWORD, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 0, v94, v95, v96, v97);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 1, v98, v99, v100, v101);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 2, v102, v103, v104, v105);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 3, v111, v112, v113, v114);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 4, v107, v108, v109, v110);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 5, 0.0, 0.0, 0.0, 0.0);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 6, v82, v83, v84, v85);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 7, v86, v87, v88, v89);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 8, v90, v91, v92, v93);
              v74 = v59 * 20.0;
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 9, v74, v74, v74, v74);
            }
            else
            {
              v71 = (HgcSpillRemoval *)HGObject::operator new(0x1A0uLL);
              HgcSpillRemovalDarkEdges::HgcSpillRemovalDarkEdges(v71);
              (*(void (**)(HgcSpillRemoval *, _QWORD, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 0, v94, v95, v96, v97);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 1, v98, v99, v100, v101);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 2, v102, v103, v104, v105);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 3, v111, v112, v113, v114);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 4, v107, v108, v109, v110);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 5, 0.0, 0.0, 0.0, 0.0);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 6, v82, v83, v84, v85);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 7, v86, v87, v88, v89);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 8, v90, v91, v92, v93);
              v72 = v59 * 20.0;
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 9, v72, v72, v72, v72);
              v73 = v116;
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 10, v73, v73, v73, 1.0);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 11, 10.0, 10.0, 10.0, 10.0);
            }
            (*(void (**)(HgcSpillRemoval *, _QWORD, double))(*(_QWORD *)v71 + 120))(v71, 0, COERCE_DOUBLE(*(_QWORD *)&v127));
            (*(void (**)(HgcPostKeyer *, uint64_t, HgcSpillRemoval *))(*(_QWORD *)v54 + 120))(v54, 2, v71);
            (*(void (**)(HgcSpillRemoval *))(*(_QWORD *)v71 + 24))(v71);
          }
          else
          {
            (*(void (**)(HgcPostKeyer *, uint64_t, double))(*(_QWORD *)v54 + 120))(v54, 2, COERCE_DOUBLE(*(_QWORD *)&v127));
          }
          LOBYTE(v106[0]) = 0;
          objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", v106, 7, a5->var0.var1);
          v75.n128_u32[0] = 1.0;
          if (!LOBYTE(v106[0]))
            v75.n128_f32[0] = -1.0;
          (*(void (**)(HgcPostKeyer *, _QWORD, __n128, float, float, float))(*(_QWORD *)v54 + 96))(v54, 0, v75, v75.n128_f32[0], v75.n128_f32[0], v75.n128_f32[0]);
          if (v128 != v54)
          {
            if (*(double *)&v128 != 0.0)
              (*(void (**)(void))(*(_QWORD *)v128 + 24))();
            v128 = v54;
            (*(void (**)(HgcPostKeyer *))(*(_QWORD *)v54 + 16))(v54);
          }
          (*(void (**)(HgcPostKeyer *))(*(_QWORD *)v54 + 24))(v54);
          goto LABEL_93;
      }
      goto LABEL_99;
    }

  }
  v51 = 1;
LABEL_99:
  if (v127 != 0.0)
    (*(void (**)(double))(**(_QWORD **)&v127 + 24))(COERCE_DOUBLE(*(_QWORD *)&v127));
  if (*(double *)&v128 != 0.0)
    (*(void (**)(HgcAlphaMult *))(*(_QWORD *)v128 + 24))(v128);
  if (v129)
    (*(void (**)(HgcAlphaMult *))(*(_QWORD *)v129 + 24))(v129);
  if (v130)
    (*(void (**)(HgcAlphaMult *))(*(_QWORD *)v130 + 24))(v130);
  if (v131)
    (*(void (**)(HgcAlphaMult *))(*(_QWORD *)v131 + 24))(v131);
  if (v51)
    goto LABEL_110;
  LOBYTE(v13) = 1;
  return v13;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  __int128 v6;
  _OWORD v8[3];

  *a6 = 0;
  *a5 = 0;
  v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  -[PAESharedDefaultBase overrideFrameSetupForRenderMode:hardware:software:](self, "overrideFrameSetupForRenderMode:hardware:software:", v8, a5, a6);
  return 1;
}

- (void)dealloc
{
  void *omSamples;
  void *lutsBitmapLoaderCache;
  objc_super v5;

  omSamples = self->_omSamples;
  if (omSamples)
    (*(void (**)(void *, SEL))(*(_QWORD *)omSamples + 8))(omSamples, a2);

  lutsBitmapLoaderCache = self->_lutsBitmapLoaderCache;
  if (lutsBitmapLoaderCache)
    (*(void (**)(void *))(*(_QWORD *)lutsBitmapLoaderCache + 24))(lutsBitmapLoaderCache);
  v5.receiver = self;
  v5.super_class = (Class)PAEKeyer;
  -[PAESharedDefaultBase dealloc](&v5, sel_dealloc);
}

- (id)getBlendOptionsAtTime:(id)a3
{
  void *v5;
  void *v6;
  PCFxLightWrapOptions *v7;
  double v8;
  float v9;
  float v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int v17;
  double v18;
  int v19;
  double v20;

  v5 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (!v5)
    return 0;
  v6 = v5;
  v19 = 0;
  objc_msgSend(v5, "getIntValue:fromParm:atFxTime:", &v19, 27, a3.var1);
  v18 = 0.0;
  objc_msgSend(v6, "getFloatValue:fromParm:atFxTime:", &v18, 29, a3.var1);
  v7 = 0;
  v8 = v18 * 0.5;
  v18 = v18 * 0.5;
  if (!v19 && v8 > 0.0)
  {
    v17 = 0;
    objc_msgSend(v6, "getIntValue:fromParm:atFxTime:", &v17, 32, a3.var1);
    v20 = 0.0;
    objc_msgSend(v6, "getFloatValue:fromParm:atFxTime:", &v20, 30, a3.var1);
    v9 = v20;
    if (-[PAEKeyer isWideGamutHDR](self, "isWideGamutHDR"))
      v10 = 42.333;
    else
      v10 = 1.0;
    v20 = 0.0;
    objc_msgSend(v6, "getFloatValue:fromParm:atFxTime:", &v20, 31, a3.var1);
    v11 = v20;
    v7 = objc_alloc_init(PCFxLightWrapOptions);
    -[PCFxBlendOptions setBlendMode:](v7, "setBlendMode:", 35);
    HIDWORD(v12) = HIDWORD(v18);
    *(float *)&v12 = v18;
    -[PCFxLightWrapOptions setAmount:](v7, "setAmount:", v12);
    *(float *)&v13 = v9;
    -[PCFxLightWrapOptions setIntensity:](v7, "setIntensity:", v13);
    *(float *)&v14 = v10;
    -[PCFxLightWrapOptions setIntensityScale:](v7, "setIntensityScale:", v14);
    *(float *)&v15 = v11;
    -[PCFxLightWrapOptions setOpacity:](v7, "setOpacity:", v15);
    -[PCFxLightWrapOptions setLRBlendMode:](v7, "setLRBlendMode:", PCBlend::lrBlendToPCBlend(v17));
  }
  return v7;
}

- (BOOL)use32x32Histogram
{
  return 1;
}

- (int)lut2DSize
{
  PAEKeyerAutokeySetupUtil *v3;
  float v4;
  int v5;

  if (!self->_lut2DSizeCached)
  {
    v3 = -[PAEKeyerAutokeySetupUtil initWithAPIManager:]([PAEKeyerAutokeySetupUtil alloc], "initWithAPIManager:", self->super.super._apiManager);
    -[PAEKeyerAutokeySetupUtil getHistogramScale](v3, "getHistogramScale");
    v5 = (int)v4 << 8;
    if (v5 <= 512)
      v5 = 512;
    self->_lut2DSize = v5;

    self->_lut2DSizeCached = 1;
  }
  return self->_lut2DSize;
}

- (id)apiManager
{
  return self->super.super._apiManager;
}

- (void).cxx_destruct
{
  PCMutex::~PCMutex(&self->_cacheMutex);
}

- (id).cxx_construct
{
  PCMutex::PCMutex(&self->_cacheMutex);
  return self;
}

@end
