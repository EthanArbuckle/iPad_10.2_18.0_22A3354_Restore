@implementation IPAPerspectiveOperator

- (id)transformForGeometry:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double v15;
  float64_t v16;
  float64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double MidX;
  double MidY;
  double v49;
  double v50;
  double v51;
  CGSize v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  int v56;
  double v57;
  double v58;
  double v59;
  CGRect *v60;
  CGSize size;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  IPAImageGeometry *v69;
  IPAPerspectiveTransform *v70;
  double v72;
  double v73;
  double v74;
  double v75;
  CGFloat v76;
  CGFloat v77;
  double v78;
  float64x2_t v79;
  __int128 v80;
  float64x2_t v81;
  __int128 v82;
  float64x2_t v83;
  __int128 v84;
  float64x2_t v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[48];
  __int128 v96;
  __int128 v97;
  _BYTE v98[48];
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  float64x2_t v103;
  __int128 v104;
  float64x2_t v105;
  __int128 v106;
  float64x2_t v107[4];
  float64x2_t v108[4];
  _BYTE v109[48];
  __int128 v110;
  __int128 v111;
  _BYTE v112[48];
  float64x2_t v113;
  uint64_t v114;
  float64x2_t v115;
  uint64_t v116;
  float64x2_t v117;
  uint64_t v118;
  float64x2_t v119;
  uint64_t v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  double v130;
  double v131;
  double v132;
  double v133;
  _BYTE v134[48];
  __int128 v135;
  float64x2_t v136;
  __int128 v137;
  float64x2_t v138;
  __int128 v139;
  float64x2_t v140;
  uint64_t v141;
  float64x2_t v142;
  uint64_t v143;
  float64x2_t v144;
  uint64_t v145;
  float64x2_t v146;
  uint64_t v147;
  float64x2_t v148[4];
  float64x2_t v149[4];
  _BYTE v150[48];
  __int128 v151;
  __int128 v152;
  _BYTE v153[48];
  _BYTE v154[48];
  __int128 v155;
  float64x2_t v156;
  _BYTE v157[48];
  double v158;
  __int128 v159;
  __int128 v160;
  double v161;
  __int128 v162;
  __int128 v163;
  uint64_t v164;
  __int128 v165;
  __int128 v166;
  uint64_t v167;
  _BYTE v168[48];
  __int128 v169;
  float64x2_t v170;
  _BYTE v171[48];
  float64x2_t v172;
  float64x2_t v173;
  float64x2_t v174;
  float64x2_t v175;
  double v176;
  __int128 v177;
  __int128 v178;
  double v179;
  __int128 v180;
  __int128 v181;
  uint64_t v182;
  __int128 v183;
  __int128 v184;
  uint64_t v185;
  _QWORD v186[4];
  CGRect v187;
  CGRect v188;
  float64x2_t v189;
  float64x2_t v190;
  float64x2_t v191;
  float64x2_t v192;
  CGRect v193;
  float64x2_t v194;
  __int128 v195;
  float64x2_t v196;
  __int128 v197;
  float64x2_t v198;
  __int128 v199;
  float64x2_t v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  uint64_t v208;
  CGRect v209;
  CGRect v210;
  CGRect v211;

  v208 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v177 = 0u;
  v178 = 0u;
  v176 = 1.0;
  v179 = 1.0;
  v180 = 0u;
  v181 = 0u;
  v183 = 0u;
  v184 = 0u;
  v182 = 0x3FF0000000000000;
  v185 = 0x3FF0000000000000;
  if (v4)
  {
    objc_msgSend(v4, "imageQuad");
  }
  else
  {
    v175 = 0uLL;
    v174 = 0uLL;
    v173 = 0uLL;
    v172 = 0uLL;
  }
  v206 = 0u;
  v207 = 0u;
  v204 = 0u;
  v205 = 0u;
  v202 = 0u;
  v203 = 0u;
  memset(&v168[8], 0, 32);
  *(_QWORD *)v168 = 0x3FF0000000000000;
  *(_QWORD *)&v168[40] = 0x3FF0000000000000;
  v169 = 0u;
  v170 = 0u;
  memset(&v171[8], 0, 32);
  *(_QWORD *)v171 = 0x3FF0000000000000;
  *(_QWORD *)&v171[40] = 0x3FF0000000000000;
  v159 = 0u;
  v160 = 0u;
  v158 = 1.0;
  v161 = 1.0;
  v162 = 0u;
  v163 = 0u;
  v165 = 0u;
  v166 = 0u;
  v164 = 0x3FF0000000000000;
  v167 = 0x3FF0000000000000;
  memset(&v154[8], 0, 32);
  *(_QWORD *)v154 = 0x3FF0000000000000;
  *(_QWORD *)&v154[40] = 0x3FF0000000000000;
  v155 = 0u;
  v156 = 0u;
  memset(&v157[8], 0, 32);
  *(_QWORD *)v157 = 0x3FF0000000000000;
  *(_QWORD *)&v157[40] = 0x3FF0000000000000;
  memset(&v150[8], 0, 32);
  *(_QWORD *)v150 = 0x3FF0000000000000;
  *(_QWORD *)&v150[40] = 0x3FF0000000000000;
  v151 = 0u;
  v152 = 0u;
  memset(&v153[8], 0, 32);
  *(_QWORD *)v153 = 0x3FF0000000000000;
  *(_QWORD *)&v153[40] = 0x3FF0000000000000;
  objc_msgSend(v5, "extent");
  v10 = v9;
  if (self->_xAngle == 0.0 && self->_yAngle == 0.0)
  {
    v64 = v6;
    width = v7;
    height = v8;
    v66 = 1.0;
    v67 = 1.0;
    v65 = 1.0;
    v68 = 1.0;
    goto LABEL_43;
  }
  v149[0] = v172;
  v149[1] = v173;
  v149[2] = v174;
  v149[3] = v175;
  v209.origin.x = PA::Quad2d::boundingRect(v149);
  x = v209.origin.x;
  y = v209.origin.y;
  width = v209.size.width;
  height = v209.size.height;
  if (CGRectIsEmpty(v209))
  {
    _PFAssertFailHandler();
    goto LABEL_48;
  }
  v77 = y;
  v76 = x;
  if (width >= height)
    v15 = width;
  else
    v15 = height;
  v177 = 0u;
  v178 = 0u;
  v180 = 0u;
  v181 = 0u;
  v183 = 0u;
  v184 = 0u;
  v176 = 1.0 / v15;
  v179 = 1.0 / v15;
  v182 = 0x3FF0000000000000;
  v185 = 0x3FF0000000000000;
  PA::operator*((uint64_t)v148, &v176, (__int128 *)v149);
  v140 = v148[0];
  v142 = v148[1];
  v141 = 0;
  v143 = 0;
  v144 = v148[2];
  v146 = v148[3];
  v145 = 0;
  v147 = 0;
  v16 = PA::Quad2d::areaCenter(v148);
  v18 = v17;
  memset(&v134[8], 0, 32);
  *(_QWORD *)v134 = 0x3FF0000000000000;
  *(_QWORD *)&v134[40] = 0x3FF0000000000000;
  v135 = 0u;
  v136 = 0u;
  v137 = xmmword_1D4CCD0F0;
  v138.f64[0] = v16;
  v138.f64[1] = v17;
  v78 = v16;
  v139 = xmmword_1D4CCD100;
  *(_QWORD *)&v122 = 0;
  v121 = 0x3FF0000000000000uLL;
  PA::Matrix4d::rotateAxis((__int128 *)v134, (uint64_t)&v121, self->_xAngle);
  v121 = xmmword_1D4CCD100;
  *(_QWORD *)&v122 = 0;
  PA::Matrix4d::rotateAxis((__int128 *)v134, (uint64_t)&v121, self->_yAngle);
  v138 = vaddq_f64(v138, vmlaq_f64(vmlsq_lane_f64(vmulq_n_f64(*(float64x2_t *)&v134[32], -v18), *(float64x2_t *)v134, v78, 0), (float64x2_t)0, v136));
  *(double *)&v139 = *(double *)&v139 + -(v18 * *(double *)&v135) - *(double *)&v134[16] * v78 + *(double *)&v137 * 0.0;
  PA::operator*((uint64_t)&v129, (double *)v134, (__int128 *)&v140);
  v19 = v130;
  if (v130 >= v131)
    v20 = v131;
  else
    v20 = v130;
  if (v130 < v131)
    v19 = v131;
  if (v20 >= v132)
    v20 = v132;
  if (v20 >= v133)
    v21 = v133;
  else
    v21 = v20;
  if (v19 < v132)
    v19 = v132;
  if (v19 >= v133)
    v22 = v19;
  else
    v22 = v133;
  v23 = v78 - v78;
  v24 = v18 - v18;
  v25 = sqrt(v24 * v24 + v23 * v23 + (v22 + 1.0 - v21) * (v22 + 1.0 - v21));
  *(double *)&v26 = (v78 - v78) / v25;
  *(double *)&v27 = (v18 - v18) / v25;
  *(double *)&v28 = (v22 + 1.0 - v21) / v25;
  v29 = *(double *)&v28 + *(double *)&v27 * -0.0;
  v30 = *(double *)&v28 * -0.0 + *(double *)&v26 * 0.0;
  v31 = -(*(double *)&v26 - *(double *)&v27 * 0.0);
  v32 = sqrt(v30 * v30 + v29 * v29 + v31 * v31);
  v33 = v30 / v32;
  v34 = v31 / v32;
  *(double *)&v121 = v29 / v32;
  *((double *)&v121 + 1) = *(double *)&v27 * v34 - *(double *)&v28 * v33;
  v122 = v26;
  *(double *)&v123 = v33;
  *((double *)&v123 + 1) = *(double *)&v28 * (v29 / v32) - *(double *)&v26 * v34;
  v124 = v27;
  *(double *)&v125 = v34;
  *((double *)&v125 + 1) = *(double *)&v26 * v33 - *(double *)&v27 * (v29 / v32);
  v126 = v28;
  *(double *)&v127 = -(v33 * v18) - v29 / v32 * v78 - v34 * (v22 + 1.0);
  *((double *)&v127 + 1) = -((*(double *)&v28 * *(double *)&v121 - *(double *)&v26 * v34) * v18)
                         - *((double *)&v121 + 1) * v78
                         - (*(double *)&v26 * v33 - *(double *)&v27 * *(double *)&v121) * (v22 + 1.0);
  *(double *)&v128 = -(*(double *)&v27 * v18) - *(double *)&v26 * v78 - *(double *)&v28 * (v22 + 1.0);
  *((_QWORD *)&v128 + 1) = 0x3FF0000000000000;
  PA::operator*((uint64_t)&v113, (double *)&v121, &v129);
  v111 = v125;
  *(_OWORD *)v112 = v126;
  *(_OWORD *)&v112[16] = v127;
  *(_OWORD *)&v112[32] = v128;
  *(_OWORD *)v109 = v121;
  *(_OWORD *)&v109[16] = v122;
  *(_OWORD *)&v109[32] = v123;
  v110 = v124;
  PA::Matrix4d::operator*=((double *)v109, (double *)v134);
  v206 = *(_OWORD *)&v109[8];
  v207 = *(_OWORD *)&v109[24];
  v204 = v110;
  v205 = v111;
  v202 = *(_OWORD *)&v112[8];
  v203 = *(_OWORD *)&v112[24];
  if (v78 == 0.0 || v18 == 0.0 || (v35 = v22 - v21 + 1.0, v35 == 1.0) || v35 <= 0.0)
  {
LABEL_47:
    _PFAssertFailHandler();
LABEL_48:
    __break(1u);
  }
  v73 = *(double *)&v109[40];
  v74 = *(double *)v109;
  v75 = *(double *)v112;
  v36 = 0;
  v72 = *(double *)&v112[40];
  memset(&v168[8], 0, 32);
  v169 = 0uLL;
  *(double *)v168 = 2.0 / (v78 + v78);
  *(double *)&v168[40] = 2.0 / (v18 + v18);
  v170.f64[0] = v23 / (v78 + v78);
  v170.f64[1] = v24 / (v18 + v18);
  *(double *)v171 = -(v35 + 1.0) / (v35 + -1.0);
  *(_OWORD *)&v171[16] = 0uLL;
  *(_QWORD *)&v171[8] = 0xBFF0000000000000;
  *(double *)&v171[32] = v35 * -2.0 / (v35 + -1.0);
  *(_QWORD *)&v171[40] = 0;
  v194 = v113;
  *(_QWORD *)&v195 = v114;
  *((_QWORD *)&v195 + 1) = 0x3FF0000000000000;
  v196 = v115;
  *(_QWORD *)&v197 = v116;
  *((_QWORD *)&v197 + 1) = 0x3FF0000000000000;
  v198 = v117;
  *(_QWORD *)&v199 = v118;
  *((_QWORD *)&v199 + 1) = 0x3FF0000000000000;
  v200 = v119;
  *(_QWORD *)&v201 = v120;
  *((_QWORD *)&v201 + 1) = 0x3FF0000000000000;
  v10 = v76;
  do
  {
    v37 = (char *)&v194 + v36 * 8;
    *(double *)v37 = PA::operator*((double *)v168, &v194.f64[v36]);
    *((_QWORD *)v37 + 1) = v38;
    if (*(double *)&v40 == 0.0)
      goto LABEL_47;
    *(float64x2_t *)v37 = vdivq_f64(*(float64x2_t *)v37, (float64x2_t)vdupq_lane_s64(v40, 0));
    *((double *)v37 + 2) = v39 / *(double *)&v40;
    *((double *)v37 + 3) = *(double *)&v40 / *(double *)&v40;
    v36 += 4;
  }
  while (v36 != 16);
  v108[0] = v194;
  v108[1] = v196;
  v108[2] = v198;
  v108[3] = v200;
  PA::Quad2d::boundingRect(v108);
  if (v41 >= v42)
    v43 = v42;
  else
    v43 = v41;
  v44 = 1.0 / v43;
  v159 = 0u;
  v160 = 0u;
  v162 = 0u;
  v163 = 0u;
  v165 = 0u;
  v166 = 0u;
  v158 = width * v44;
  v161 = height * v44;
  v164 = 0x3FF0000000000000;
  v167 = 0x3FF0000000000000;
  PA::operator*((uint64_t)v107, &v158, (__int128 *)v108);
  v45 = PA::Quad2d::boundingRect(v107);
  memset(&v154[8], 0, 32);
  v155 = 0u;
  v156 = 0u;
  *(_QWORD *)v154 = 0x3FF0000000000000;
  *(_QWORD *)&v154[40] = 0x3FF0000000000000;
  *(_OWORD *)v157 = xmmword_1D4CCD0F0;
  *(double *)&v157[16] = -v45;
  *(double *)&v157[24] = -v46;
  *(_OWORD *)&v157[32] = xmmword_1D4CCD100;
  PA::operator*((uint64_t)&v189, (double *)v154, (__int128 *)v107);
  v107[0] = v189;
  v107[1] = v190;
  v107[2] = v191;
  v107[3] = v192;
  v210.origin.x = v76;
  v210.origin.y = v77;
  v210.size.width = width;
  v210.size.height = height;
  MidX = CGRectGetMidX(v210);
  v211.origin.x = v76;
  v211.origin.y = v77;
  v211.size.width = width;
  v211.size.height = height;
  MidY = CGRectGetMidY(v211);
  v49 = PA::Quad2d::areaCenter(v107) + MidX * 0.5 * self->_dx;
  v51 = v50 + MidY * 0.5 * self->_dy;
  v52 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v188.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  v188.size = v52;
  v187.origin.x = PA::Quad2d::boundingRect(v107);
  v187.origin.y = v53;
  v187.size.width = v54;
  v187.size.height = v55;
  v186[0] = &off_1E986D888;
  *(double *)&v186[1] = v49;
  *(double *)&v186[2] = v51;
  v56 = 100;
  *(double *)&v186[3] = width / height;
  do
  {
    v193.origin.x = (*(double (**)(PA::centerRectFinder *, const CGRect *, const CGRect *))(v186[0] + 16))((PA::centerRectFinder *)v186, &v187, &v188);
    v193.origin.y = v57;
    v193.size.width = v58;
    v193.size.height = v59;
    v189.f64[0] = v193.origin.x;
    v189.f64[1] = v57;
    v190.f64[0] = v193.origin.x + v58;
    v190.f64[1] = v57;
    v191.f64[0] = v193.origin.x;
    v191.f64[1] = v57 + v59;
    v192.f64[0] = v193.origin.x + v58;
    v192.f64[1] = v57 + v59;
    if ((*(BOOL (**)(PA::centerRectFinder *, const CGRect *, const CGRect *, double))(v186[0] + 24))((PA::centerRectFinder *)v186, &v193, &v187, 0.5)&& PA::Quad2d::simpleContains((PA::Quad2d *)v107, (const Vector2d *)&v189))
    {
      break;
    }
    v60 = PA::Quad2d::simpleContains((PA::Quad2d *)v107, (const Vector2d *)&v189) ? &v188 : &v187;
    size = v193.size;
    v60->origin = v193.origin;
    v60->size = size;
    --v56;
  }
  while (v56);
  v62 = width / v193.size.width * 0.0;
  v63 = -(v51 * (height / v193.size.height * 0.0));
  *(double *)v150 = width / v193.size.width;
  *(double *)&v150[8] = v62;
  *(double *)&v150[16] = v62;
  *(double *)&v150[24] = v62;
  *(double *)&v150[32] = height / v193.size.height * 0.0;
  *(double *)&v150[40] = height / v193.size.height;
  *(double *)&v151 = *(double *)&v150[32];
  *((double *)&v151 + 1) = *(double *)&v150[32];
  v152 = 0uLL;
  *(_OWORD *)v153 = xmmword_1D4CCD0F0;
  *(double *)&v153[16] = MidX + v63 - width / v193.size.width * v49 + 0.0;
  *(double *)&v153[24] = MidY + -(v51 * (height / v193.size.height)) - v62 * v49 + 0.0;
  *(double *)&v153[32] = v63 - v62 * v49 + 0.0;
  *(_QWORD *)&v153[40] = 0x3FF0000000000000;
  PA::operator*((uint64_t)&v172, (double *)v150, (__int128 *)v107);
  v64 = v77;
  v66 = v74;
  v65 = v75;
  v68 = v72;
  v67 = v73;
LABEL_43:
  v103 = v170;
  v104 = *(_OWORD *)v171;
  v105 = *(float64x2_t *)&v171[16];
  v106 = *(_OWORD *)&v171[32];
  v99 = *(_OWORD *)v168;
  v100 = *(_OWORD *)&v168[16];
  v101 = *(_OWORD *)&v168[32];
  v102 = v169;
  *(_OWORD *)&v95[24] = v207;
  *(_OWORD *)&v95[8] = v206;
  *(double *)v95 = v66;
  *(double *)&v95[40] = v67;
  v96 = v204;
  v97 = v205;
  *(_OWORD *)&v98[24] = v203;
  *(_OWORD *)&v98[8] = v202;
  *(double *)v98 = v65;
  *(double *)&v98[40] = v68;
  PA::Matrix4d::operator*=((double *)v95, &v176);
  v125 = v97;
  v126 = *(_OWORD *)v98;
  v127 = *(_OWORD *)&v98[16];
  v128 = *(_OWORD *)&v98[32];
  v121 = *(_OWORD *)v95;
  v122 = *(_OWORD *)&v95[16];
  v123 = *(_OWORD *)&v95[32];
  v124 = v96;
  PA::Matrix4d::operator*=((double *)&v99, (double *)&v121);
  v136 = v103;
  v137 = v104;
  v138 = v105;
  v139 = v106;
  *(_OWORD *)v134 = v99;
  *(_OWORD *)&v134[16] = v100;
  *(_OWORD *)&v134[32] = v101;
  v135 = v102;
  v89 = *(_OWORD *)&v150[32];
  v90 = v151;
  v87 = *(_OWORD *)v150;
  v88 = *(_OWORD *)&v150[16];
  v93 = *(_OWORD *)&v153[16];
  v94 = *(_OWORD *)&v153[32];
  v91 = v152;
  v92 = *(_OWORD *)v153;
  v81 = *(float64x2_t *)&v154[32];
  v82 = v155;
  v79 = *(float64x2_t *)v154;
  v80 = *(_OWORD *)&v154[16];
  v85 = *(float64x2_t *)&v157[16];
  v86 = *(_OWORD *)&v157[32];
  v83 = v156;
  v84 = *(_OWORD *)v157;
  PA::Matrix4d::operator*=(v79.f64, &v158);
  v198 = v83;
  v199 = v84;
  v200 = v85;
  v201 = v86;
  v194 = v79;
  v195 = v80;
  v196 = v81;
  v197 = v82;
  PA::Matrix4d::operator*=((double *)&v87, v194.f64);
  v125 = v91;
  v126 = v92;
  v127 = v93;
  v128 = v94;
  v121 = v87;
  v122 = v88;
  v123 = v89;
  v124 = v90;
  v69 = -[IPAImageGeometry initWithIdentifier:extent:imageQuad:]([IPAImageGeometry alloc], "initWithIdentifier:extent:imageQuad:", CFSTR("perspectived"), &v172, v10, v64, width, height);
  v70 = -[IPAPerspectiveTransform initWithInputGeometry:intrinsicGeometry:projectionTransform:viewingTransform:]([IPAPerspectiveTransform alloc], "initWithInputGeometry:intrinsicGeometry:projectionTransform:viewingTransform:", v5, v69, v134, &v121);

  return v70;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@.%p xAngle:%f yAngle:%f dx:%f dy:%F>"), v5, self, *(_QWORD *)&self->_xAngle, *(_QWORD *)&self->_yAngle, *(_QWORD *)&self->_dx, *(_QWORD *)&self->_dy);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)operatorWithAngleX:(double)a3 Y:(double)a4 dx:(double)a5 dy:(double)a6
{
  return (id)objc_msgSend(a1, "operatorWithIdentifier:angleX:Y:dx:dy:", CFSTR("perspective"), a3, a4, a5, a6);
}

+ (id)operatorWithIdentifier:(id)a3 angleX:(double)a4 Y:(double)a5 dx:(double)a6 dy:(double)a7
{
  id v11;
  IPAPerspectiveOperator *v12;
  id result;

  v11 = a3;
  if (a4 < -0.785398163
    || a4 > 0.785398163
    || a5 < -0.785398163
    || a5 > 0.785398163
    || a6 < -1.0
    || a6 > 1.0
    || a7 < -1.0
    || a7 > 1.0)
  {
    result = (id)_PFAssertFailHandler();
    __break(1u);
  }
  else
  {
    v12 = -[IPAGeometryOperator initWithIdentifier:]([IPAPerspectiveOperator alloc], "initWithIdentifier:", v11);
    v12->_xAngle = a4;
    v12->_yAngle = a5;
    v12->_dx = a6;
    v12->_dy = a7;

    return v12;
  }
  return result;
}

@end
