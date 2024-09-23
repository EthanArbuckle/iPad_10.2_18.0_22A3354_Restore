void sub_21272B400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21272DC40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21272E004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_21272FE44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_21272FED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

float32x4_t *CMOQuaternion::operator*@<X0>(uint64_t a1@<X0>, float *a2@<X1>, float32x4_t *a3@<X8>, double a4@<D0>)
{
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float32_t v9;
  float32_t v10;
  float32_t v11;
  float v12;

  v4 = *(float *)(a1 + 8);
  LODWORD(a4) = *(_DWORD *)(a1 + 12);
  v5 = a2[1];
  v6 = *(float *)(a1 + 4);
  v7 = a2[2];
  v8 = a2[3];
  v9 = (float)((float)((float)(v4 * v5) + (float)(*(float *)&a4 * *a2)) - (float)(v6 * v7)) + (float)(*(float *)a1 * v8);
  v10 = (float)((float)((float)(*(float *)&a4 * v5) - (float)(v4 * *a2)) + (float)(*(float *)a1 * v7))
      + (float)(v6 * v8);
  v11 = (float)((float)((float)(v6 * *a2) - (float)(*(float *)a1 * v5)) + (float)(*(float *)&a4 * v7))
      + (float)(v4 * v8);
  v12 = (float)((float)-(float)(v6 * v5) - (float)(*(float *)a1 * *a2)) - (float)(v4 * v7);
  a3->f32[0] = v9;
  a3->f32[1] = v10;
  *(float *)&a4 = v12 + (float)(*(float *)&a4 * v8);
  a3->f32[2] = v11;
  a3->i32[3] = LODWORD(a4);
  return CMOQuaternion::normalize(a3, a4);
}

float32x4_t *CMOQuaternion::conj@<X0>(float32x2_t *this@<X0>, float32x4_t *a2@<X8>, double a3@<D0>)
{
  __int32 v3;

  v3 = this[1].i32[1];
  *(float *)&a3 = -this[1].f32[0];
  *(float32x2_t *)a2->f32 = vneg_f32(*this);
  a2->i32[2] = LODWORD(a3);
  a2->i32[3] = v3;
  return CMOQuaternion::normalize(a2, a3);
}

float CMOQuaternion::roll(CMOQuaternion *this)
{
  float v1;
  float v2;

  v1 = *((float *)this + 1);
  v2 = (float)(*(float *)this * *((float *)this + 2)) - (float)(*((float *)this + 3) * v1);
  return -atan2f(v2 + v2, (float)((float)((float)(v1 * v1) + (float)(*(float *)this * *(float *)this)) * -2.0) + 1.0);
}

float CMOQuaternion::pitch(CMOQuaternion *this)
{
  return asinf((float)((float)(*(float *)this * *((float *)this + 3)) + (float)(*((float *)this + 1) * *((float *)this + 2)))+ (float)((float)(*(float *)this * *((float *)this + 3)) + (float)(*((float *)this + 1) * *((float *)this + 2))));
}

float CMOQuaternion::yaw(CMOQuaternion *this)
{
  float v1;
  float v2;

  v1 = *((float *)this + 2);
  v2 = (float)(*(float *)this * *((float *)this + 1)) - (float)(*((float *)this + 3) * v1);
  return -atan2f(v2 + v2, (float)((float)((float)(v1 * v1) + (float)(*(float *)this * *(float *)this)) * -2.0) + 1.0);
}

float CMOQuaternion::gravity(CMOQuaternion *this)
{
  return (float)((float)(*((float *)this + 3) * *((float *)this + 1)) - (float)(*(float *)this * *((float *)this + 2)))
       + (float)((float)(*((float *)this + 3) * *((float *)this + 1)) - (float)(*(float *)this * *((float *)this + 2)));
}

float CMOQuaternion::north(CMOQuaternion *this)
{
  return (float)((float)((float)(*(float *)this * *(float *)this) + (float)(*((float *)this + 3) * *((float *)this + 3)))
               * 2.0)
       + -1.0;
}

float CMOQuaternion::rotateVectorInPlace(float *a1, float *a2)
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float result;

  v3 = a1[2];
  v2 = a1[3];
  v4 = v2 + v2;
  v5 = *a1;
  v6 = a1[1];
  v7 = v6 + v6;
  v8 = v2 * (float)(v2 + v2);
  v9 = (float)((float)(v6 + v6) * v6) + -1.0;
  v10 = (float)((float)(v3 + v3) * v3) + -1.0;
  v11 = (float)(v5 + v5) * v6;
  v12 = (float)(v5 + v5) * v3;
  v13 = v2 * (float)(v5 + v5);
  v14 = v7 * v3;
  v15 = v2 * v7;
  v16 = v4 * v3;
  v17 = a2[1];
  v18 = a2[2];
  v19 = (float)((float)((float)(v11 + v16) * v17)
              + (float)((float)(v8 + (float)((float)((float)(v5 + v5) * v5) + -1.0)) * *a2))
      + (float)((float)(v12 - v15) * v18);
  v20 = (float)((float)((float)(v8 + v9) * v17) + (float)((float)(v11 - v16) * *a2)) + (float)((float)(v13 + v14) * v18);
  result = (float)((float)((float)(v14 - v13) * v17) + (float)((float)(v12 + v15) * *a2))
         + (float)((float)(v8 + v10) * v18);
  *a2 = v19;
  a2[1] = v20;
  a2[2] = result;
  return result;
}

float CMOQuaternion::rotateVector(float *a1, float a2, float a3, float a4)
{
  float v5[3];

  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a4;
  CMOQuaternion::rotateVectorInPlace(a1, v5);
  return v5[0];
}

float CMOQuaternion::rotateFrameInPlace(float *a1, float *a2)
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float result;

  v3 = a1[2];
  v2 = a1[3];
  v4 = v2 + v2;
  v5 = *a1;
  v6 = a1[1];
  v7 = v6 + v6;
  v8 = v2 * (float)(v2 + v2);
  v9 = (float)((float)(v6 + v6) * v6) + -1.0;
  v10 = (float)((float)(v3 + v3) * v3) + -1.0;
  v11 = (float)(v5 + v5) * v6;
  v12 = (float)(v5 + v5) * v3;
  v13 = v2 * (float)(v5 + v5);
  v14 = v7 * v3;
  v15 = v2 * v7;
  v16 = v4 * v3;
  v17 = a2[1];
  v18 = a2[2];
  v19 = (float)((float)((float)(v11 - v16) * v17)
              + (float)((float)(v8 + (float)((float)((float)(v5 + v5) * v5) + -1.0)) * *a2))
      + (float)((float)(v12 + v15) * v18);
  v20 = (float)((float)((float)(v8 + v9) * v17) + (float)((float)(v11 + v16) * *a2)) + (float)((float)(v14 - v13) * v18);
  result = (float)((float)((float)(v13 + v14) * v17) + (float)((float)(v12 - v15) * *a2))
         + (float)((float)(v8 + v10) * v18);
  *a2 = v19;
  a2[1] = v20;
  a2[2] = result;
  return result;
}

float CMOQuaternion::rotateFrame(float *a1, float a2, float a3, float a4)
{
  float v5[3];

  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a4;
  CMOQuaternion::rotateFrameInPlace(a1, v5);
  return v5[0];
}

void CMOQuaternion::angleAxis(float *a1, float *a2)
{
  uint64_t v4;
  float v5;
  float v6;
  float v7;
  float v8;

  v4 = 0;
  v5 = 0.0;
  do
  {
    v5 = v5 + (float)(a2[v4] * a2[v4]);
    ++v4;
  }
  while (v4 != 3);
  v6 = sqrtf(v5);
  v7 = 0.5;
  v8 = v6 * 0.5;
  if ((float)(v6 * 0.5) > 0.0)
    v7 = (float)(sinf(v6 * 0.5) / v8) * 0.5;
  *a1 = v7 * *a2;
  a1[1] = v7 * a2[1];
  a1[2] = v7 * a2[2];
  a1[3] = cosf(v8);
}

float CMOQuaternion::angleAxis(CMOQuaternion *this)
{
  uint64_t v1;
  float v2;
  int v3;
  int v4;
  float v5;
  float v6;
  float v7;
  _DWORD v9[3];

  v1 = 0;
  v2 = *(float *)this;
  v3 = *((_DWORD *)this + 1);
  v4 = *((_DWORD *)this + 2);
  v9[0] = *(_DWORD *)this;
  v9[1] = v3;
  v9[2] = v4;
  v5 = 0.0;
  do
  {
    v5 = v5 + (float)(*(float *)&v9[v1] * *(float *)&v9[v1]);
    ++v1;
  }
  while (v1 != 3);
  v6 = sqrtf(v5);
  if (v6 >= 0.00000011921)
  {
    v7 = atan2f(v6, *((float *)this + 3));
    return v2 * (float)((float)(v7 + v7) / v6);
  }
  return v2;
}

BOOL CMOQuaternion::northAndGravity(float *a1, float *a2, uint64_t a3, float a4, float a5, float a6, float a7, float a8, float a9, double a10, double a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, float a18)
{
  unsigned __int8 v19;
  uint64_t v20;
  float v21;
  uint64_t v22;
  float v23;
  uint64_t v24;
  float v25;
  uint64_t v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  uint64_t v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  _BOOL8 result;
  uint64_t v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  uint64_t v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  uint64_t v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  uint64_t v64;
  float v65;
  float v66;
  float v67;
  float v68;
  __int128 *v69;
  uint64_t v70;
  float v71;
  float *v72;
  uint64_t v73;
  __int128 *v74;
  uint64_t v75;
  float v76;
  float *v77;
  uint64_t v78;
  __int128 *v79;
  uint64_t v80;
  float v81;
  float *v82;
  float v83;
  float v84;
  float v85;
  uint64_t i;
  uint64_t v87;
  float v88;
  uint64_t v89;
  float v90;
  uint64_t j;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  float v95;
  uint64_t v96;
  float v97;
  uint64_t v98;
  uint64_t v99;
  float v100;
  float v101;
  float v102;
  uint64_t v103;
  float v104;
  __int128 *v105;
  uint64_t v106;
  __int128 *v107;
  uint64_t v108;
  float v109;
  float v110;
  float v111;
  unsigned int v112;
  float v113;
  float v114;
  __int128 v115;
  __int128 v116;
  int v117;
  __int128 v118;
  __int128 v119;
  int v120;
  __int128 v121;
  __int128 v122;
  int v123;
  __int128 v124;
  __int128 v125;
  int v126;
  __int128 v127;
  __int128 v128;
  int v129;
  __int128 v130;
  __int128 v131;
  int v132;
  int v133;
  float v134;
  float v135;
  float v136;
  int v137;
  float v138;
  float v139;
  float v140;
  int v141;
  _BYTE v142[36];
  _OWORD v143[2];
  int v144;
  __int128 v145;
  __int128 v146;
  int v147;
  __int128 v148;
  __int128 v149;
  int v150;
  __int128 v151;
  __int128 v152;
  int v153;
  _OWORD v154[2];
  int v155;
  __int128 v156;
  __int128 v157;
  int v158;
  __int128 v159;
  __int128 v160;
  int v161;
  __int128 v162;
  __int128 v163;
  int v164;
  float v165[3];
  uint64_t v166;
  int v167;
  float v168;
  float v169;
  float v170;
  uint64_t v171;
  float v172;
  unint64_t v173;
  float v174;
  unint64_t v175;
  float v176;

  v175 = __PAIR64__(LODWORD(a5), LODWORD(a4));
  v176 = a6;
  v173 = __PAIR64__(LODWORD(a8), LODWORD(a7));
  v174 = a9;
  v171 = a17;
  v172 = a18;
  if ((v19 & 1) == 0
  {
    CMOQuaternion::northAndGravity(CMVector<float,3ul>,CMVector<float,3ul>,CMVector<float,3ul>,float const*,CMOQuaternion&,CMMatrix<float,3ul,3ul> &)::kMinSineAngle = 1043452116;
  }
  v20 = 0;
  v21 = 0.0;
  do
  {
    v21 = v21 + (float)(*(float *)((char *)&v175 + v20) * *(float *)((char *)&v175 + v20));
    v20 += 4;
  }
  while (v20 != 12);
  if (sqrtf(v21) == 0.0)
    return 0;
  v22 = 0;
  v23 = 0.0;
  do
  {
    v23 = v23 + (float)(*(float *)((char *)&v173 + v22) * *(float *)((char *)&v173 + v22));
    v22 += 4;
  }
  while (v22 != 12);
  if (sqrtf(v23) == 0.0)
    return 0;
  v24 = 0;
  *(_QWORD *)&v162 = v175;
  *((float *)&v162 + 2) = v176;
  v25 = 0.0;
  do
  {
    v25 = v25 + (float)(*(float *)((char *)&v162 + v24) * *(float *)((char *)&v162 + v24));
    v24 += 4;
  }
  while (v24 != 12);
  v26 = 0;
  v27 = sqrtf(v25);
  v28 = *(float *)&v175 / v27;
  v29 = *((float *)&v175 + 1) / v27;
  v30 = v176 / v27;
  *(float *)&v175 = *(float *)&v175 / v27;
  *((float *)&v175 + 1) = *((float *)&v175 + 1) / v27;
  v176 = v176 / v27;
  v31 = *((float *)&v173 + 1);
  v32 = v174;
  *(_QWORD *)&v162 = v173;
  *((float *)&v162 + 2) = v174;
  v33 = 0.0;
  do
  {
    v33 = v33 + (float)(*(float *)((char *)&v162 + v26) * *(float *)((char *)&v162 + v26));
    v26 += 4;
  }
  while (v26 != 12);
  v34 = 0;
  v35 = sqrtf(v33);
  v37 = *((float *)&v173 + 1) / v35;
  v38 = v174 / v35;
  *(float *)&v173 = *(float *)&v173 / v35;
  v36 = *(float *)&v173;
  *((float *)&v173 + 1) = *((float *)&v173 + 1) / v35;
  v174 = v174 / v35;
  v39 = (float)(v29 * (float)(v32 / v35)) - (float)(v30 * (float)(v31 / v35));
  v40 = (float)(v30 * *(float *)&v173) - (float)(v28 * (float)(v32 / v35));
  v41 = (float)(v28 * (float)(v31 / v35)) - (float)(v29 * *(float *)&v173);
  v168 = v39;
  v169 = v40;
  v170 = v41;
  v42 = 0.0;
  do
  {
    v42 = v42 + (float)(*(float *)((char *)&v168 + v34) * *(float *)((char *)&v168 + v34));
    v34 += 4;
  }
  while (v34 != 12);
  v43 = sqrtf(v42);
  if (v43 < *(float *)&CMOQuaternion::northAndGravity(CMVector<float,3ul>,CMVector<float,3ul>,CMVector<float,3ul>,float const*,CMOQuaternion&,CMMatrix<float,3ul,3ul> &)::kMinSineAngle)
    return 0;
  v45 = 0;
  v46 = v39 / v43;
  v47 = v40 / v43;
  v168 = v39 / v43;
  v169 = v40 / v43;
  v48 = v41 / v43;
  v170 = v41 / v43;
  v49 = *((float *)&v171 + 1);
  v50 = v172;
  *(_QWORD *)&v162 = v171;
  *((float *)&v162 + 2) = v172;
  v51 = 0.0;
  do
  {
    v51 = v51 + (float)(*(float *)((char *)&v162 + v45) * *(float *)((char *)&v162 + v45));
    v45 += 4;
  }
  while (v45 != 12);
  v52 = 0;
  v53 = sqrtf(v51);
  *(float *)&v171 = *(float *)&v171 / v53;
  *((float *)&v171 + 1) = *((float *)&v171 + 1) / v53;
  v54 = *((float *)&v171 + 1);
  v172 = v172 / v53;
  v55 = v172;
  v166 = 0;
  v167 = -1082130432;
  v56 = (float)((float)(v50 / v53) * -0.0) - (float)(v49 / v53);
  v110 = -*(float *)&v171;
  v111 = -(float)(v50 / v53);
  v57 = 0.0;
  v112 = v171;
  *(float *)&v162 = v56;
  *((float *)&v162 + 1) = *(float *)&v171 + (float)(v172 * 0.0);
  *((float *)&v162 + 2) = (float)(*((float *)&v171 + 1) * -0.0) + (float)(*(float *)&v171 * 0.0);
  do
  {
    v57 = v57 + (float)(*(float *)((char *)&v162 + v52) * *(float *)((char *)&v162 + v52));
    v52 += 4;
  }
  while (v52 != 12);
  v58 = 0;
  v59 = sqrtf(v57);
  v165[0] = v56 / v59;
  v165[1] = (float)(*(float *)&v171 + (float)(v172 * 0.0)) / v59;
  v165[2] = (float)((float)(*((float *)&v171 + 1) * -0.0) + (float)(*(float *)&v171 * 0.0)) / v59;
  v60 = (float)(v37 * v48) - (float)(v38 * v47);
  v113 = -*(float *)&v173;
  v61 = (float)(v38 * v46) - (float)(*(float *)&v173 * v48);
  v62 = (float)(*(float *)&v173 * v47) - (float)(v37 * v46);
  *(_QWORD *)&v162 = __PAIR64__(LODWORD(v61), LODWORD(v60));
  *((float *)&v162 + 2) = v62;
  v63 = 0.0;
  do
  {
    v63 = v63 + (float)(*(float *)((char *)&v162 + v58) * *(float *)((char *)&v162 + v58));
    v58 += 4;
  }
  while (v58 != 12);
  v64 = 0;
  v65 = sqrtf(v63);
  v66 = v60 / v65;
  v67 = v61 / v65;
  v68 = v62 / v65;
  *(float *)&v175 = v60 / v65;
  *((float *)&v175 + 1) = v67;
  v176 = v62 / v65;
  v164 = 0;
  v162 = 0u;
  v163 = 0u;
  v69 = &v162;
  do
  {
    v70 = 0;
    v71 = *((float *)&v175 + v64);
    v72 = (float *)v69;
    do
    {
      *v72 = v71 * *(float *)((char *)&v171 + v70);
      v72 += 3;
      v70 += 4;
    }
    while (v70 != 12);
    ++v64;
    v69 = (__int128 *)((char *)v69 + 4);
  }
  while (v64 != 3);
  v73 = 0;
  v161 = 0;
  v159 = 0u;
  v160 = 0u;
  v74 = &v159;
  do
  {
    v75 = 0;
    v76 = *((float *)&v173 + v73);
    v77 = (float *)v74;
    do
    {
      *v77 = v76 * *(float *)((char *)&v166 + v75);
      v77 += 3;
      v75 += 4;
    }
    while (v75 != 12);
    ++v73;
    v74 = (__int128 *)((char *)v74 + 4);
  }
  while (v73 != 3);
  v78 = 0;
  v158 = 0;
  v156 = 0u;
  v157 = 0u;
  v79 = &v156;
  do
  {
    v80 = 0;
    v81 = *(&v168 + v78);
    v82 = (float *)v79;
    do
    {
      *v82 = v81 * v165[v80];
      v82 += 3;
      ++v80;
    }
    while (v80 != 3);
    ++v78;
    v79 = (__int128 *)((char *)v79 + 4);
  }
  while (v78 != 3);
  v83 = *a1;
  v84 = (float)((float)(a1[1] * a1[1]) + (float)(v83 * v83)) + (float)((float)(v83 + v83) * a1[1]);
  v154[0] = v156;
  v154[1] = v157;
  v155 = v158;
  v145 = v162;
  v146 = v163;
  v147 = v164;
  v133 = 0;
  v134 = v68;
  v135 = -v67;
  v114 = v84;
  v85 = sqrtf(v84);
  v136 = -v68;
  v137 = 0;
  v138 = v66;
  v139 = v67;
  v140 = -v66;
  v141 = 0;
  operator*<float,3ul,3ul,3ul>((uint64_t)&v133, (uint64_t)&v156, (uint64_t)v142);
  LODWORD(v130) = 0;
  *((float *)&v130 + 1) = v55;
  *((float *)&v130 + 2) = -v54;
  *((float *)&v130 + 3) = v111;
  LODWORD(v131) = 0;
  *(_QWORD *)((char *)&v131 + 4) = __PAIR64__(LODWORD(v54), v112);
  *((float *)&v131 + 3) = v110;
  v132 = 0;
  operator*<float,3ul,3ul,3ul>((uint64_t)v142, (uint64_t)&v130, (uint64_t)v143);
  for (i = 0; i != 36; i += 4)
    *(float *)((char *)&v145 + i) = *(float *)((char *)&v145 + i) - *(float *)((char *)v143 + i);
  v87 = 0;
  v88 = 1.0 / v85;
  v148 = v145;
  v149 = v146;
  v150 = v147;
  do
  {
    *(float *)((char *)&v148 + v87) = (float)(v83 * (float)(1.0 / v85)) * *(float *)((char *)&v148 + v87);
    v87 += 4;
  }
  while (v87 != 36);
  v89 = 0;
  v151 = v148;
  v152 = v149;
  v153 = v150;
  do
  {
    *(float *)((char *)v154 + v89) = *(float *)((char *)&v151 + v89) + *(float *)((char *)v154 + v89);
    v89 += 4;
  }
  while (v89 != 36);
  v90 = a1[1];
  v124 = v159;
  v125 = v160;
  v126 = v161;
  v133 = 0;
  v134 = v38;
  v135 = -v37;
  v136 = -v38;
  v137 = 0;
  v138 = v36;
  v139 = v37;
  v140 = v113;
  v141 = 0;
  operator*<float,3ul,3ul,3ul>((uint64_t)&v133, (uint64_t)&v156, (uint64_t)v142);
  v130 = xmmword_2127A2950;
  v131 = xmmword_2127A2960;
  v132 = 0;
  operator*<float,3ul,3ul,3ul>((uint64_t)v142, (uint64_t)&v130, (uint64_t)v143);
  for (j = 0; j != 36; j += 4)
    *(float *)((char *)&v124 + j) = *(float *)((char *)&v124 + j) - *(float *)((char *)v143 + j);
  v92 = 0;
  v127 = v124;
  v128 = v125;
  v129 = v126;
  do
  {
    *(float *)((char *)&v127 + v92) = (float)(v88 * v90) * *(float *)((char *)&v127 + v92);
    v92 += 4;
  }
  while (v92 != 36);
  v93 = 0;
  v151 = v127;
  v152 = v128;
  v153 = v129;
  do
  {
    *(float *)((char *)v154 + v93) = *(float *)((char *)&v151 + v93) + *(float *)((char *)v154 + v93);
    v93 += 4;
  }
  while (v93 != 36);
  CMOQuaternion::rotationMatrix(a2, (float *)v154);
  v94 = 0;
  v95 = *a1;
  v118 = v162;
  v119 = v163;
  v120 = v164;
  do
  {
    *(float *)((char *)&v118 + v94) = v95 * *(float *)((char *)&v118 + v94);
    v94 += 4;
  }
  while (v94 != 36);
  v96 = 0;
  v123 = v120;
  v121 = v118;
  v122 = v119;
  v97 = a1[1];
  v117 = v161;
  v115 = v159;
  v116 = v160;
  do
  {
    *(float *)((char *)&v115 + v96) = v97 * *(float *)((char *)&v115 + v96);
    v96 += 4;
  }
  while (v96 != 36);
  v98 = 0;
  v143[0] = v115;
  v143[1] = v116;
  v144 = v117;
  do
  {
    *(float *)((char *)&v121 + v98) = *(float *)((char *)v143 + v98) + *(float *)((char *)&v121 + v98);
    v98 += 4;
  }
  while (v98 != 36);
  v99 = 0;
  v151 = v121;
  v152 = v122;
  v153 = v123;
  v100 = 0.0;
  do
  {
    v100 = v100 + (float)(*(float *)((char *)&v151 + v99) * *(float *)((char *)&v151 + v99));
    v99 += 4;
  }
  while (v99 != 36);
  v101 = sqrtf(v100);
  v102 = (float)(v114 - (float)(v101 * v101)) * 0.5;
  result = v102 != 0.0;
  if (v102 != 0.0)
  {
    v103 = 0;
    v104 = v88 * (float)(1.0 / v102);
    v105 = &v151;
    do
    {
      v106 = 0;
      v107 = &v151;
      do
      {
        v108 = 0;
        v109 = 0.0;
        do
        {
          v109 = v109 + (float)(*(float *)((char *)v105 + v108) * *(float *)((char *)v107 + v108));
          v108 += 12;
        }
        while (v108 != 36);
        *(float *)(a3 + 4 * (3 * v106++ + v103)) = v104 * v109;
        v107 = (__int128 *)((char *)v107 + 4);
      }
      while (v106 != 3);
      *(float *)(a3 + 16 * v103) = v88 + *(float *)(a3 + 16 * v103);
      ++v103;
      v105 = (__int128 *)((char *)v105 + 4);
    }
    while (v103 != 3);
  }
  return result;
}

uint64_t operator*<float,3ul,3ul,3ul>@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  float *v4;
  uint64_t v5;
  float v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  float *v10;
  float v11;

  v3 = 0;
  *(_DWORD *)(a3 + 32) = 0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  v4 = (float *)(result + 12);
  do
  {
    v5 = 0;
    v6 = *(float *)(result + 4 * v3);
    v7 = a2 + 4;
    do
    {
      v8 = 0;
      v9 = v6 * *(float *)(a2 + 12 * v5);
      v10 = v4;
      do
      {
        v11 = *v10;
        v10 += 3;
        v9 = v9 + (float)(v11 * *(float *)(v7 + v8));
        v8 += 4;
      }
      while (v8 != 8);
      *(float *)(a3 + 4 * (3 * v5++ + v3)) = v9;
      v7 += 12;
    }
    while (v5 != 3);
    ++v3;
    ++v4;
  }
  while (v3 != 3);
  return result;
}

float CMOQuaternion::rotationMatrix(float *a1, float *a2)
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float result;
  BOOL v8;
  BOOL v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;

  v2 = *a2;
  v3 = a2[4];
  v4 = a2[8];
  v5 = (float)(*a2 + v3) + v4;
  if (v5 <= 0.0)
  {
    if (v2 > v3)
    {
      v8 = v2 == v4;
      v9 = v2 < v4;
    }
    else
    {
      v8 = 1;
      v9 = 0;
    }
    if (v9 || v8)
    {
      if (v3 <= v4)
      {
        v14 = (float)((float)((float)-v2 - v3) + v4) + 1.0;
        v15 = 0.5 / sqrtf(v14);
        a1[2] = v14 * v15;
        a1[3] = v15 * (float)(a2[3] - a2[1]);
        *a1 = v15 * (float)(a2[2] + a2[6]);
        result = v15 * (float)(a2[7] + a2[5]);
        a1[1] = result;
      }
      else
      {
        v10 = (float)((float)(v3 - v2) - v4) + 1.0;
        v11 = 0.5 / sqrtf(v10);
        a1[1] = v10 * v11;
        *a1 = v11 * (float)(a2[3] + a2[1]);
        a1[3] = v11 * (float)(a2[2] - a2[6]);
        result = v11 * (float)(a2[7] + a2[5]);
        a1[2] = result;
      }
    }
    else
    {
      v12 = (float)((float)(v2 - v3) - v4) + 1.0;
      v13 = 0.5 / sqrtf(v12);
      *a1 = v12 * v13;
      a1[1] = v13 * (float)(a2[3] + a2[1]);
      a1[2] = v13 * (float)(a2[2] + a2[6]);
      result = v13 * (float)(a2[7] - a2[5]);
      a1[3] = result;
    }
  }
  else
  {
    v6 = 0.5 / sqrtf(v5 + 1.0);
    a1[3] = (float)(v5 + 1.0) * v6;
    a1[2] = v6 * (float)(a2[3] - a2[1]);
    a1[1] = v6 * (float)(a2[2] - a2[6]);
    result = v6 * (float)(a2[7] - a2[5]);
    *a1 = result;
  }
  return result;
}

float CMOQuaternion::rotationMatrix@<S0>(CMOQuaternion *this@<X0>, float *a2@<X8>)
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float result;

  v3 = *((float *)this + 2);
  v2 = *((float *)this + 3);
  v4 = v2 + v2;
  v5 = *(float *)this;
  v6 = *((float *)this + 1);
  v7 = v6 + v6;
  v8 = v2 * (float)(v2 + v2);
  v9 = (float)((float)(v6 + v6) * v6) + -1.0;
  v10 = (float)((float)(v3 + v3) * v3) + -1.0;
  v11 = (float)(v5 + v5) * v6;
  v12 = (float)(v5 + v5) * v3;
  v13 = v2 * (float)(v5 + v5);
  v14 = v7 * v3;
  v15 = v2 * v7;
  v16 = v4 * v3;
  v17 = v12 + v15;
  result = v12 - v15;
  *a2 = v8 + (float)((float)((float)(*(float *)this + *(float *)this) * *(float *)this) + -1.0);
  a2[1] = v11 - v16;
  a2[2] = v17;
  a2[3] = v11 + v16;
  a2[4] = v8 + v9;
  a2[5] = v14 - v13;
  a2[6] = result;
  a2[7] = v13 + v14;
  a2[8] = v8 + v10;
  return result;
}

float CMOQuaternion::rotationMatrixTranspose@<S0>(CMOQuaternion *this@<X0>, float *a2@<X8>)
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float result;

  v3 = *((float *)this + 2);
  v2 = *((float *)this + 3);
  v4 = v2 + v2;
  v5 = *(float *)this;
  v6 = *((float *)this + 1);
  v7 = v6 + v6;
  v8 = v2 * (float)(v2 + v2);
  v9 = (float)((float)(v6 + v6) * v6) + -1.0;
  v10 = (float)((float)(v3 + v3) * v3) + -1.0;
  v11 = (float)(v5 + v5) * v6;
  v12 = (float)(v5 + v5) * v3;
  v13 = v2 * (float)(v5 + v5);
  v14 = v7 * v3;
  v15 = v2 * v7;
  v16 = v4 * v3;
  v17 = v12 - v15;
  result = v12 + v15;
  *a2 = v8 + (float)((float)((float)(*(float *)this + *(float *)this) * *(float *)this) + -1.0);
  a2[1] = v11 + v16;
  a2[2] = v17;
  a2[3] = v11 - v16;
  a2[4] = v8 + v9;
  a2[5] = v13 + v14;
  a2[6] = result;
  a2[7] = v14 - v13;
  a2[8] = v8 + v10;
  return result;
}

float32x4_t *CMOQuaternion::normalize(float32x4_t *this, double a2)
{
  float32x4_t v2;

  *(float *)&a2 = sqrtf((float)((float)((float)(this->f32[1] * this->f32[1]) + (float)(this->f32[0] * this->f32[0]))+ (float)(this->f32[2] * this->f32[2]))+ (float)(this->f32[3] * this->f32[3]));
  if (fabsf(*(float *)&a2 + -1.0) >= 0.00000011921)
  {
    if (*(float *)&a2 == 0.0)
      v2 = (float32x4_t)xmmword_2127A2970;
    else
      v2 = vdivq_f32(*this, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a2, 0));
    *this = v2;
  }
  return this;
}

BOOL CMOQuaternion::inverted(CMOQuaternion *this)
{
  float v1;
  float v2;
  float v3;
  float v4;
  float v5;

  v1 = *((float *)this + 2);
  v2 = *((float *)this + 3);
  v3 = *((float *)this + 1);
  v4 = (float)((float)(v2 * v3) - (float)(*(float *)this * v1))
     + (float)((float)(v2 * v3) - (float)(*(float *)this * v1));
  v5 = (float)-(float)(v2 * *(float *)this) - (float)(v3 * v1);
  return (float)((float)((float)((float)(v3 * v3) + (float)(*(float *)this * *(float *)this)) * 2.0) + -1.0) > sqrtf((float)((float)(v5 + v5) * (float)(v5 + v5)) + (float)(v4 * v4));
}

void CMOQuaternion::headingReference(CMOQuaternion *this)
{
  unsigned __int8 v1;
  __objc2_meth_list **p_class_meths;
  uint64_t v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  int v21;
  int v22;
  CMOQuaternion *v23;
  float v24[3];
  _QWORD v25[2];
  _DWORD v26[3];
  int v27;
  uint64_t v28;

  p_class_meths = &OBJC_PROTOCOL___NSSecureCoding.class_meths;
  if ((v1 & 1) == 0)
  {
    v23 = this;
    p_class_meths = &OBJC_PROTOCOL___NSSecureCoding.class_meths;
    v22 = v21;
    this = v23;
    if (v22)
    {
      CMOQuaternion::headingReference(void)const::kMinSineAngle = 1043452116;
      p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSSecureCoding + 32);
      this = v23;
    }
  }
  v3 = 0;
  v4 = *((float *)this + 2);
  v5 = *((float *)this + 3);
  v6 = *((float *)this + 1);
  v7 = (float)((float)(v5 * v6) - (float)(*(float *)this * v4))
     + (float)((float)(v5 * v6) - (float)(*(float *)this * v4));
  v8 = (float)-(float)(v5 * *(float *)this) - (float)(v6 * v4);
  v9 = v8 + v8;
  v10 = (float)((float)((float)(v6 * v6) + (float)(*(float *)this * *(float *)this)) * 2.0) + -1.0;
  v11 = sqrtf((float)(v9 * v9) + (float)(v7 * v7));
  v12 = 1.0;
  if (v10 <= v11)
    v12 = -1.0;
  v27 = 0;
  v28 = 1065353216;
  v13 = v10 * v12;
  v14 = (float)(v10 * -0.0) + (float)(v9 * v12);
  v15 = -(float)(v7 * v12);
  v16 = 0.0;
  v17 = v15 + (float)(v10 * 0.0);
  v18 = (float)(v9 * -0.0) + (float)(v7 * 0.0);
  *(float *)v26 = v14;
  *(float *)&v26[1] = v17;
  *(float *)&v26[2] = v18;
  do
  {
    v16 = v16 + (float)(*(float *)&v26[v3] * *(float *)&v26[v3]);
    ++v3;
  }
  while (v3 != 3);
  v19 = sqrtf(v16);
  if (v19 > *((float *)p_class_meths + 390))
  {
    v25[0] = 0;
    v25[1] = 0;
    v20 = (float)-atan2f(v11, v13) / v19;
    v24[0] = v14 * v20;
    v24[1] = v20 * v17;
    v24[2] = v20 * v18;
    CMOQuaternion::angleAxis((float *)v25, v24);
    CMOQuaternion::rotateFrameInPlace((float *)v25, (float *)&v27);
  }
}

float CMOQuaternion::heading(CMOQuaternion *this)
{
  float v2;
  float v3;
  int v4;
  float result;
  float v6;
  float v7;
  int v8;

  CMOQuaternion::headingReference(this);
  v6 = v2;
  v7 = v3;
  v8 = v4;
  CMOQuaternion::rotateFrameInPlace((float *)this, &v6);
  for (result = atan2f(-v7, v6) * 57.296; result < 0.0; result = result + 360.0)
    ;
  for (; result >= 360.0; result = result + -360.0)
    ;
  return result;
}

float *CMMath::wrap(float *this, float *a2)
{
  float v2;

  v2 = *this;
  if (*this < 0.0)
  {
    do
      v2 = v2 + 360.0;
    while (v2 < 0.0);
    *this = v2;
  }
  if (v2 >= 360.0)
  {
    do
      v2 = v2 + -360.0;
    while (v2 >= 360.0);
    *this = v2;
  }
  return this;
}

Class initAMSMediaTask()
{
  Class result;

  if (AppleMediaServicesLibrary_sOnce != -1)
    dispatch_once(&AppleMediaServicesLibrary_sOnce, &__block_literal_global_0);
  result = objc_getClass("AMSMediaTask");
  classAMSMediaTask = (uint64_t)result;
  getAMSMediaTaskClass = (uint64_t (*)())AMSMediaTaskFunction;
  return result;
}

id AMSMediaTaskFunction()
{
  return (id)classAMSMediaTask;
}

Class initAMSBagKeySet()
{
  Class result;

  if (AppleMediaServicesLibrary_sOnce != -1)
    dispatch_once(&AppleMediaServicesLibrary_sOnce, &__block_literal_global_0);
  result = objc_getClass("AMSBagKeySet");
  classAMSBagKeySet = (uint64_t)result;
  getAMSBagKeySetClass = (uint64_t (*)())AMSBagKeySetFunction;
  return result;
}

id AMSBagKeySetFunction()
{
  return (id)classAMSBagKeySet;
}

Class initAMSBag()
{
  Class result;

  if (AppleMediaServicesLibrary_sOnce != -1)
    dispatch_once(&AppleMediaServicesLibrary_sOnce, &__block_literal_global_0);
  result = objc_getClass("AMSBag");
  classAMSBag = (uint64_t)result;
  getAMSBagClass = (uint64_t (*)())AMSBagFunction;
  return result;
}

id AMSBagFunction()
{
  return (id)classAMSBag;
}

Class initACAccountStore()
{
  Class result;

  if (AccountsLibrary_sOnce != -1)
    dispatch_once(&AccountsLibrary_sOnce, &__block_literal_global_232);
  result = objc_getClass("ACAccountStore");
  classACAccountStore = (uint64_t)result;
  getACAccountStoreClass = (uint64_t (*)())ACAccountStoreFunction;
  return result;
}

id ACAccountStoreFunction()
{
  return (id)classACAccountStore;
}

id initValACAccountTypeIdentifieriTunesStore()
{
  id *v0;

  if (AccountsLibrary_sOnce != -1)
    dispatch_once(&AccountsLibrary_sOnce, &__block_literal_global_232);
  v0 = (id *)dlsym((void *)AccountsLibrary_sLib, "ACAccountTypeIdentifieriTunesStore");
  if (v0)
    objc_storeStrong((id *)&constantValACAccountTypeIdentifieriTunesStore, *v0);
  getACAccountTypeIdentifieriTunesStore = (uint64_t (*)())ACAccountTypeIdentifieriTunesStoreFunction;
  return (id)constantValACAccountTypeIdentifieriTunesStore;
}

id ACAccountTypeIdentifieriTunesStoreFunction()
{
  return (id)constantValACAccountTypeIdentifieriTunesStore;
}

Class initAMSMediaArtwork()
{
  Class result;

  if (AppleMediaServicesLibrary_sOnce != -1)
    dispatch_once(&AppleMediaServicesLibrary_sOnce, &__block_literal_global_0);
  result = objc_getClass("AMSMediaArtwork");
  classAMSMediaArtwork = (uint64_t)result;
  getAMSMediaArtworkClass = (uint64_t (*)())AMSMediaArtworkFunction;
  return result;
}

id AMSMediaArtworkFunction()
{
  return (id)classAMSMediaArtwork;
}

uint64_t initValAMSMediaArtworkCropStyleBoundedBox()
{
  uint64_t *v0;
  uint64_t result;

  if (AppleMediaServicesLibrary_sOnce != -1)
    dispatch_once(&AppleMediaServicesLibrary_sOnce, &__block_literal_global_0);
  v0 = (uint64_t *)dlsym((void *)AppleMediaServicesLibrary_sLib, "AMSMediaArtworkCropStyleBoundedBox");
  if (v0)
  {
    result = *v0;
    constantValAMSMediaArtworkCropStyleBoundedBox = result;
  }
  else
  {
    result = constantValAMSMediaArtworkCropStyleBoundedBox;
  }
  getAMSMediaArtworkCropStyleBoundedBox = AMSMediaArtworkCropStyleBoundedBoxFunction;
  return result;
}

uint64_t AMSMediaArtworkCropStyleBoundedBoxFunction()
{
  return constantValAMSMediaArtworkCropStyleBoundedBox;
}

uint64_t initValAMSMediaArtworkFormatPNG()
{
  uint64_t *v0;
  uint64_t result;

  if (AppleMediaServicesLibrary_sOnce != -1)
    dispatch_once(&AppleMediaServicesLibrary_sOnce, &__block_literal_global_0);
  v0 = (uint64_t *)dlsym((void *)AppleMediaServicesLibrary_sLib, "AMSMediaArtworkFormatPNG");
  if (v0)
  {
    result = *v0;
    constantValAMSMediaArtworkFormatPNG = result;
  }
  else
  {
    result = constantValAMSMediaArtworkFormatPNG;
  }
  getAMSMediaArtworkFormatPNG = AMSMediaArtworkFormatPNGFunction;
  return result;
}

uint64_t AMSMediaArtworkFormatPNGFunction()
{
  return constantValAMSMediaArtworkFormatPNG;
}

Class initISIcon()
{
  Class result;

  if (IconServicesLibrary_sOnce != -1)
    dispatch_once(&IconServicesLibrary_sOnce, &__block_literal_global_239);
  result = objc_getClass("ISIcon");
  classISIcon = (uint64_t)result;
  getISIconClass = (uint64_t (*)())ISIconFunction;
  return result;
}

id ISIconFunction()
{
  return (id)classISIcon;
}

Class initISImageDescriptor()
{
  Class result;

  if (IconServicesLibrary_sOnce != -1)
    dispatch_once(&IconServicesLibrary_sOnce, &__block_literal_global_239);
  result = objc_getClass("ISImageDescriptor");
  classISImageDescriptor = (uint64_t)result;
  getISImageDescriptorClass = (uint64_t (*)())ISImageDescriptorFunction;
  return result;
}

id ISImageDescriptorFunction()
{
  return (id)classISImageDescriptor;
}

void sub_2127334F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21273355C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)SFAirDropMagicHeadViewController;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_2127336D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  id *v15;

  objc_destroyWeak(v15);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_212733750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2127337D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21273416C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22)
{
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_2127345B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_212734790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_212734B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_212734FD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27)
{
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  _Unwind_Resume(a1);
}

void sub_212735118(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_212735188(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_212735258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_212735334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_2127354CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_21273556C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2127355C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_212735608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_212735650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2127356EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_2127357C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2127358AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2127359C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_212735AE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_212735E10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  void *v9;

  _Unwind_Resume(a1);
}

void sub_212735F10(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_212735F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_212736000(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_212736050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2127360B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21273611C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_212736188(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2127362A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

Class initCMMotionManager(void)
{
  Class result;

  if (CoreMotionLibrary(void)::sOnce != -1)
    dispatch_once(&CoreMotionLibrary(void)::sOnce, &__block_literal_global_1);
  result = objc_getClass("CMMotionManager");
  classCMMotionManager = (uint64_t)result;
  getCMMotionManagerClass = (uint64_t (*)(void))CMMotionManagerFunction;
  return result;
}

id CMMotionManagerFunction(void)
{
  return (id)classCMMotionManager;
}

id SFAdjustmentFiltersForAssetTypeAndURL(int a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  float v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  float v18;
  __int128 v19;
  int v20;
  float v21;
  __int128 v22;
  int v23;
  float v24;
  _BYTE v25[28];
  int v26;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:error:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (a1 == 1 || a1 == 2)
    {
      CFDictionaryGetTypeID();
      CFDictionaryGetTypedValue();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    v26 = 0;
    CFDictionaryGetDouble();
    v8 = v7;
    v9 = objc_alloc(MEMORY[0x24BDE56B0]);
    v10 = (void *)objc_msgSend(v9, "initWithType:", *MEMORY[0x24BDE5A00]);
    v18 = v8;
    v19 = *(_OWORD *)(MEMORY[0x24BDE53E8] + 4);
    v20 = *(_DWORD *)(MEMORY[0x24BDE53E8] + 20);
    v21 = v8;
    v22 = *(_OWORD *)(MEMORY[0x24BDE53E8] + 28);
    v23 = *(_DWORD *)(MEMORY[0x24BDE53E8] + 44);
    v24 = v8;
    *(_OWORD *)v25 = *(_OWORD *)(MEMORY[0x24BDE53E8] + 52);
    *(_OWORD *)&v25[12] = *(_OWORD *)(MEMORY[0x24BDE53E8] + 64);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCAColorMatrix:", &v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forKey:", v11, CFSTR("inputColorMatrix"));

    objc_msgSend(v4, "addObject:", v10);
    CFDictionaryGetDouble();
    if (!v26)
    {
      v13 = v12;
      v14 = objc_alloc(MEMORY[0x24BDE56B0]);
      v15 = (void *)objc_msgSend(v14, "initWithType:", *MEMORY[0x24BDE59A0]);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setValue:forKey:", v16, CFSTR("inputAmount"));

      objc_msgSend(v4, "addObject:", v15);
    }

  }
  return v4;
}

id SFPlaybackTimeRangesFromFeaturesTimeURL(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  Float64 v9;
  double v10;
  Float64 v11;
  void *v12;
  CMTimeRange v14;
  CMTime duration;
  CMTime start;
  CMTimeRange v17;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithContentsOfURL:error:", v1, 0);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v6)
        objc_enumerationMutation(v3);
      v18 = 0;
      CFDictionaryGetDouble();
      if (v18)
        break;
      v9 = v8;
      CFDictionaryGetDouble();
      if (v18)
        break;
      v11 = v10;
      memset(&v17, 0, sizeof(v17));
      CMTimeMakeWithSeconds(&start, v9, 1000);
      CMTimeMakeWithSeconds(&duration, v11, 1000);
      CMTimeRangeMake(&v17, &start, &duration);
      v14 = v17;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCMTimeRange:", &v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v12);

      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  return v2;
}

void sub_212739944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id a33)
{
  id *v33;
  id *v34;

  objc_destroyWeak(v34);
  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a33);
  _Unwind_Resume(a1);
}

void sub_21273A700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_21273C57C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21273CEB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21273D5D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class initLPLinkMetadataObserver()
{
  Class result;

  if (LinkPresentationLibrary_sOnce != -1)
    dispatch_once(&LinkPresentationLibrary_sOnce, &__block_literal_global_3);
  result = objc_getClass("LPLinkMetadataObserver");
  classLPLinkMetadataObserver = (uint64_t)result;
  getLPLinkMetadataObserverClass = (uint64_t (*)())LPLinkMetadataObserverFunction;
  return result;
}

id LPLinkMetadataObserverFunction()
{
  return (id)classLPLinkMetadataObserver;
}

id OUTLINED_FUNCTION_0_1(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

uint64_t operationCallBack(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "handleOperationCallback:event:withResults:", a1, a2, a3);
}

const __CFString *SFOperationEventToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xE)
    return CFSTR("?");
  else
    return off_24CE0F630[a1 - 1];
}

void sub_21273F8DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

Class initNFHardwareManager()
{
  Class result;

  if (NearFieldLibrary_sOnce != -1)
    dispatch_once(&NearFieldLibrary_sOnce, &__block_literal_global_301);
  result = objc_getClass("NFHardwareManager");
  classNFHardwareManager = (uint64_t)result;
  getNFHardwareManagerClass = (uint64_t (*)())NFHardwareManagerFunction;
  return result;
}

id NFHardwareManagerFunction()
{
  return (id)classNFHardwareManager;
}

Class initUMUserManager()
{
  Class result;

  if (UserManagementLibrary_sOnce != -1)
    dispatch_once(&UserManagementLibrary_sOnce, &__block_literal_global_304);
  result = objc_getClass("UMUserManager");
  classUMUserManager = (uint64_t)result;
  getUMUserManagerClass = (uint64_t (*)())UMUserManagerFunction;
  return result;
}

id UMUserManagerFunction()
{
  return (id)classUMUserManager;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_21274006C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;
  id *v25;
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2127452CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_212748274(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_212748E48(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_212748F0C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2127492B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_212749908(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21274A038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_21274A270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21274A480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21274AAA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21274B0B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t operationCallBack_0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "handleOperationCallback:event:withResults:", a1, a2, a3);
}

Class __getPLPhotoLibraryClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!PhotoLibraryServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24CE0FA28;
    v5 = 0;
    PhotoLibraryServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PhotoLibraryServicesLibraryCore_frameworkLibrary)
    __getPLPhotoLibraryClass_block_invoke_cold_1(&v3);
  result = objc_getClass("PLPhotoLibrary");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPLPhotoLibraryClass_block_invoke_cold_2();
  getPLPhotoLibraryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

BOOL cnCropStyleFromSFCropStyle(uint64_t a1)
{
  return a1 == 2;
}

uint64_t cnBackgroundStyleFromSFBackgroundStyle(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) >= 3)
    return 0;
  else
    return a1 - 1;
}

void sub_21274C79C(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_21274DC7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_21274E40C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

id getCachedPreferredItemSizesByString()
{
  void *v0;
  id v1;
  void *v2;

  v0 = (void *)__cachedPreferredItemSizesByString;
  if (!__cachedPreferredItemSizesByString)
  {
    v1 = objc_alloc_init(MEMORY[0x24BDBCE40]);
    v2 = (void *)__cachedPreferredItemSizesByString;
    __cachedPreferredItemSizesByString = (uint64_t)v1;

    v0 = (void *)__cachedPreferredItemSizesByString;
  }
  return v0;
}

id createNameLabel(void *a1)
{
  objc_class *v1;
  NSString *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSComparisonResult v10;
  uint64_t v11;

  v1 = (objc_class *)MEMORY[0x24BEBD708];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 6)
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v6);

  objc_msgSend(v3, "_screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _SFPersonLabelFont();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v8);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v9);

  v10 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x24BEBE098], v2);
  if (v10 == NSOrderedAscending)
    v11 = 4;
  else
    v11 = 1;
  objc_msgSend(v3, "setTextAlignment:", v11);
  objc_msgSend(v3, "setNumberOfLines:", 2);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v3;
}

double getChickletSize()
{
  void *v0;
  double v1;
  double v2;

  objc_msgSend(MEMORY[0x24BE8F640], "_activityImageForActionRepresentationImage:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "size");
  v2 = v1;

  return v2;
}

void sub_212751698(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_2127517F8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2127518CC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_212751A24(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id _SFPersonLabelFont()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  if (v1 == 6)
  {
    objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:weight:", *MEMORY[0x24BEBE1F0], *MEMORY[0x24BEBB600]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE1E8]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v3, 0.0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

id _SFPersonCollectionViewMaximumSizeCategory(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  id v4;
  _QWORD block[4];
  id v7;

  v1 = a1;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___SFPersonCollectionViewMaximumSizeCategory_block_invoke;
  block[3] = &unk_24CE0ED80;
  v7 = v1;
  v2 = _SFPersonCollectionViewMaximumSizeCategory_onceToken;
  v3 = v1;
  if (v2 != -1)
    dispatch_once(&_SFPersonCollectionViewMaximumSizeCategory_onceToken, block);
  v4 = (id)_SFPersonCollectionViewMaximumSizeCategory_maxCategory;

  return v4;
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_212754B58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_212754F80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SFFontForTextStyleWithAdditionalSymbolicTraits(void *a1, int a2)
{
  return SFFontForTextStyleWithAdditionalSymbolicTraitsOfSize(a1, a2, 0.0);
}

id SFFontForTextStyleWithAdditionalSymbolicTraitsOfSize(void *a1, int a2, double a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x24BEBDAB0];
  v6 = *MEMORY[0x24BEBE0C0];
  v7 = a1;
  objc_msgSend(v5, "traitCollectionWithPreferredContentSizeCategory:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v9, "symbolicTraits") | a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v10, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id SFVisualEffectViewWrapperForView(void *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BEBDB38];
  v4 = a2;
  v5 = a1;
  v6 = (void *)objc_msgSend([v3 alloc], "initWithEffect:", v4);

  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v5);

  v18 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v6, "leftAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leftAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v20;
  objc_msgSend(v6, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v9;
  objc_msgSend(v6, "rightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v12;
  objc_msgSend(v6, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v16);

  return v6;
}

id SFImageStackFromImages(void *a1, CGFloat a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  unint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  CGSize v20;

  v3 = a1;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v5;

  v7 = objc_msgSend(v3, "count");
  if (v7 >= 3)
    v8 = 3;
  else
    v8 = v7;
  v9 = a2 - (float)((float)v8 * 5.0);
  v10 = 2;
  if (v8 > 2)
    v10 = v8;
  v11 = (void *)objc_msgSend(objc_alloc((Class)getPUStackViewClass[0]()), "initWithFrame:", 0.0, 15.0, v9, (float)((float)(v10 - 2) * 5.0) + a2);
  objc_msgSend(v11, "setStyle:", 0);
  v12 = objc_alloc_init((Class)getPUPhotoDecorationClass[0]());
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBorderColor:", v13);

  objc_msgSend(v12, "setBorderWidth:", 1.0 / v6);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 1.0, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setForegroundColor:", v14);

  objc_msgSend(v11, "setPhotoDecoration:", v12);
  objc_msgSend(v11, "setStackSize:", v9 + 1.0 / v6 * -2.0, v9 + 1.0 / v6 * -2.0);
  objc_msgSend(v11, "setStackPerspectiveOffset:", 0.0, -10.0);
  objc_msgSend(v11, "setStackPerspectiveInsets:", 5.0, 5.0, 5.0, 5.0);
  objc_msgSend(v11, "setNumberOfVisibleItems:", v8);
  if (v8)
  {
    for (i = 0; i != v8; ++i)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setImage:forItemAtIndex:", v16, i);
      objc_msgSend(v16, "size");
      objc_msgSend(v11, "setImageSize:forItemAtIndex:", i);

    }
  }
  v20.width = a2 - (float)((float)v8 * 5.0);
  v20.height = a2;
  UIGraphicsBeginImageContextWithOptions(v20, 0, v6);
  objc_msgSend(v11, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "renderInContext:", UIGraphicsGetCurrentContext());

  UIGraphicsGetImageFromCurrentImageContext();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v18;
}

id SFScaleAndRotateImage(void *a1, double a2)
{
  id v3;
  uint64_t v4;
  id v5;
  CGImage *v6;
  double Width;
  size_t Height;
  double v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  __int128 v22;
  __int128 v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  BOOL v27;
  CGContext *CurrentContext;
  CGContext *v29;
  double v30;
  CGContext *v31;
  double v32;
  id v33;
  CGContext *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  CGAffineTransform v39;
  CGAffineTransform transform;
  CGAffineTransform v41;
  CGSize v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v3 = a1;
  v4 = objc_msgSend(v3, "imageOrientation");
  v5 = objc_retainAutorelease(v3);
  v6 = (CGImage *)objc_msgSend(v5, "CGImage");
  Width = (double)CGImageGetWidth(v6);
  Height = CGImageGetHeight(v6);
  v9 = (double)Height;
  v10 = Width <= a2 && v9 <= a2;
  v11 = Width;
  v12 = (double)Height;
  if (!v10)
  {
    v13 = Width / v9;
    v14 = 0;
    v15 = 0;
    if (Width / v9 <= 1.0)
    {
      v18 = Width;
      v19 = a2;
      v11 = v13 * CGRectGetHeight(*(CGRect *)&v14);
      v12 = a2;
    }
    else
    {
      v16 = a2;
      v17 = (double)Height;
      v11 = a2;
      v12 = CGRectGetWidth(*(CGRect *)&v14) / v13;
    }
  }
  v43.origin.x = 0.0;
  v43.origin.y = 0.0;
  v43.size.width = v11;
  v43.size.height = v12;
  v20 = CGRectGetWidth(v43) / Width;
  v37 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v38 = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v41.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v41.c = v37;
  v36 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  *(_OWORD *)&v41.tx = v36;
  v44.origin.x = 0.0;
  v44.origin.y = 0.0;
  v44.size.width = v11;
  v44.size.height = v12;
  v21 = CGRectGetHeight(v44);
  switch(v4)
  {
    case 1:
      CGAffineTransformMakeTranslation(&v41, Width, v9);
      v39 = v41;
      CGAffineTransformRotate(&transform, &v39, 3.14159265);
      goto LABEL_16;
    case 2:
      v45.origin.x = 0.0;
      v45.origin.y = 0.0;
      v45.size.width = v11;
      v45.size.height = v12;
      v12 = CGRectGetWidth(v45);
      CGAffineTransformMakeTranslation(&v41, 0.0, Width);
      *(_OWORD *)&v39.a = *(_OWORD *)&v41.a;
      *(_OWORD *)&v39.c = *(_OWORD *)&v41.c;
      v23 = *(_OWORD *)&v41.tx;
      goto LABEL_19;
    case 3:
      v46.origin.x = 0.0;
      v46.origin.y = 0.0;
      v46.size.width = v11;
      v46.size.height = v12;
      v12 = CGRectGetWidth(v46);
      CGAffineTransformMakeTranslation(&v41, v9, 0.0);
      goto LABEL_21;
    case 4:
      CGAffineTransformMakeTranslation(&v41, Width, 0.0);
      v39 = v41;
      v24 = -1.0;
      v25 = 1.0;
      goto LABEL_15;
    case 5:
      CGAffineTransformMakeTranslation(&v41, 0.0, v9);
      v39 = v41;
      v24 = 1.0;
      v25 = -1.0;
LABEL_15:
      CGAffineTransformScale(&transform, &v39, v24, v25);
LABEL_16:
      *(_OWORD *)&v41.a = *(_OWORD *)&transform.a;
      *(_OWORD *)&v41.c = *(_OWORD *)&transform.c;
      v22 = *(_OWORD *)&transform.tx;
      goto LABEL_17;
    case 6:
      v47.origin.x = 0.0;
      v47.origin.y = 0.0;
      v47.size.width = v11;
      v47.size.height = v12;
      v12 = CGRectGetWidth(v47);
      CGAffineTransformMakeTranslation(&v41, v9, Width);
      v39 = v41;
      CGAffineTransformScale(&transform, &v39, -1.0, 1.0);
      v23 = *(_OWORD *)&transform.tx;
      v41 = transform;
      *(_OWORD *)&v39.a = *(_OWORD *)&transform.a;
      *(_OWORD *)&v39.c = *(_OWORD *)&transform.c;
LABEL_19:
      *(_OWORD *)&v39.tx = v23;
      v26 = 4.71238898;
      goto LABEL_22;
    case 7:
      v48.origin.x = 0.0;
      v48.origin.y = 0.0;
      v48.size.width = v11;
      v48.size.height = v12;
      v12 = CGRectGetWidth(v48);
      CGAffineTransformMakeScale(&v41, -1.0, 1.0);
LABEL_21:
      v39 = v41;
      v26 = 1.57079633;
LABEL_22:
      CGAffineTransformRotate(&transform, &v39, v26);
      v41 = transform;
      v11 = v21;
      break;
    default:
      *(_OWORD *)&v41.a = v38;
      *(_OWORD *)&v41.c = v37;
      v22 = v36;
LABEL_17:
      *(_OWORD *)&v41.tx = v22;
      break;
  }
  if (v20 == 1.0 && (transform = v41, CGAffineTransformIsIdentity(&transform))
    || (v11 == *MEMORY[0x24BDBF148] ? (v27 = v12 == *(double *)(MEMORY[0x24BDBF148] + 8)) : (v27 = 0), v27))
  {
    v33 = v5;
  }
  else
  {
    v42.width = v11;
    v42.height = v12;
    UIGraphicsBeginImageContext(v42);
    CurrentContext = UIGraphicsGetCurrentContext();
    v29 = CurrentContext;
    if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      CGContextScaleCTM(CurrentContext, -v20, v20);
      v30 = 0.0;
      v31 = v29;
      v32 = -v9;
    }
    else
    {
      CGContextScaleCTM(CurrentContext, v20, -v20);
      v32 = 0.0;
      v31 = v29;
      v30 = -v9;
    }
    CGContextTranslateCTM(v31, v32, v30);
    transform = v41;
    CGContextConcatCTM(v29, &transform);
    v34 = UIGraphicsGetCurrentContext();
    v49.origin.x = 0.0;
    v49.origin.y = 0.0;
    v49.size.width = Width;
    v49.size.height = v9;
    CGContextDrawImage(v34, v49, v6);
    UIGraphicsGetImageFromCurrentImageContext();
    v33 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }

  return v33;
}

double SFRoundToScreen(double a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = round(v3 * a1);
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v4 / v6;

  return v7;
}

id activityImageForCurrentTraitCollectionWithName(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BEBD640];
  v2 = (void *)MEMORY[0x24BDD1488];
  v3 = a1;
  objc_msgSend(v2, "bundleWithIdentifier:", CFSTR("com.apple.Sharing"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BEBDAB0];
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v8 = (void *)MEMORY[0x24BEBDAB0];
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "traitCollectionWithUserInterfaceIdiom:", objc_msgSend(v9, "userInterfaceIdiom"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollectionWithTraitsFromCollections:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageNamed:inBundle:compatibleWithTraitCollection:", v3, v4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id SFDeviceImageFromDeviceModel(CGFloat a1, CGFloat a2)
{
  void *v4;
  void *v5;

  SFAirDropModelImageNameFromModelString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SFDeviceImageFromImageName(v4, a1, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id SFDeviceImageFromImageName(void *a1, CGFloat a2, CGFloat a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  double v19;
  CGFloat v20;
  CGContext *CurrentContext;
  id v22;
  const CGFloat *Components;
  id v24;
  CGImage *v25;
  void *v26;
  CGAffineTransform v28;
  CGSize v29;
  CGRect v30;
  CGRect v31;

  v5 = (void *)MEMORY[0x24BEBD640];
  v6 = (void *)MEMORY[0x24BDD1488];
  v7 = a1;
  objc_msgSend(v6, "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "size");
  objc_msgSend(v9, "scale");
  UIRectCenteredAboutPointScale();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scale");
  v20 = v19;
  v29.width = a2;
  v29.height = a3;
  UIGraphicsBeginImageContextWithOptions(v29, 0, v20);

  CurrentContext = UIGraphicsGetCurrentContext();
  v28.b = 0.0;
  v28.c = 0.0;
  v28.a = 1.0;
  *(_OWORD *)&v28.d = xmmword_2127A2BE0;
  v28.ty = a3;
  CGContextConcatCTM(CurrentContext, &v28);
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  Components = CGColorGetComponents((CGColorRef)objc_msgSend(v22, "CGColor"));
  CGContextSetFillColor(CurrentContext, Components);

  v30.origin.x = 0.0;
  v30.origin.y = 0.0;
  v30.size.width = a2;
  v30.size.height = a3;
  CGContextFillEllipseInRect(CurrentContext, v30);
  v24 = objc_retainAutorelease(v9);
  v25 = (CGImage *)objc_msgSend(v24, "CGImage");
  v31.origin.x = v11;
  v31.origin.y = v13;
  v31.size.width = v15;
  v31.size.height = v17;
  CGContextDrawImage(CurrentContext, v31, v25);
  UIGraphicsGetImageFromCurrentImageContext();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v26;
}

double SFMathMap(double a1, double a2, double a3, double a4, double a5)
{
  return a4 + (a5 - a4) * ((a1 - a2) / (a3 - a2));
}

double SFMathClampedMap(double a1, double a2, double a3, double a4, double a5)
{
  double result;

  result = a4 + (a5 - a4) * ((a1 - a2) / (a3 - a2));
  if (result >= a5)
    result = a5;
  if (result < a4)
    return a4;
  return result;
}

double SFMathClamp(double result, double a2, double a3)
{
  if (result >= a3)
    result = a3;
  if (result < a2)
    return a2;
  return result;
}

double SFMathTransition(double a1, double a2, double a3)
{
  return a2 * a3 + a1 * (1.0 - a3);
}

double SFMathProgress(double a1, double a2, double a3)
{
  return (a1 - a2) / (a3 - a2) + 0.0;
}

double SFMathClampedProgress(double a1, double a2, double a3)
{
  double result;

  result = fmin((a1 - a2) / (a3 - a2) + 0.0, 1.0);
  if (result < 0.0)
    return 0.0;
  return result;
}

double SFMathAddToValueWithRubberbanding(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double result;
  double v13;

  v6 = -a5;
  if (a1 >= a3)
    v7 = a6;
  else
    v7 = v6;
  if (a3 >= a1)
    v8 = a3;
  else
    v8 = a1;
  if (v8 > a4)
    v8 = a4;
  v9 = -v7;
  if (v7 >= 0.0)
    v9 = v7;
  if (v9 != 0.0)
    v8 = v8 + (-1.0 / ((a1 - v8) / v7 + -1.0) + -1.0) / 0.55 * v7;
  v10 = v8 + a2;
  if (v10 >= a3)
    v11 = a6;
  else
    v11 = v6;
  if (v10 <= a3)
    result = a3;
  else
    result = v10;
  if (result > a4)
    result = a4;
  v13 = -v11;
  if (v11 >= 0.0)
    v13 = v11;
  if (v13 != 0.0)
    return result + (1.0 - 1.0 / ((v10 - result) / v11 * 0.55 + 1.0)) * v11;
  return result;
}

double SFMathUnrubberband(double result, double a2, double a3, double a4, double a5)
{
  double v5;
  double v6;
  double v7;

  v5 = result;
  if (result >= a2)
    v6 = a5;
  else
    v6 = -a4;
  if (a2 >= result)
    result = a2;
  if (result > a3)
    result = a3;
  v7 = -v6;
  if (v6 >= 0.0)
    v7 = v6;
  if (v7 != 0.0)
    return result + (-1.0 / ((v5 - result) / v6 + -1.0) + -1.0) / 0.55 * v6;
  return result;
}

double SFMathRubberband(double result, double a2, double a3, double a4, double a5)
{
  double v5;
  double v6;
  double v7;

  v5 = result;
  if (result >= a2)
    v6 = a5;
  else
    v6 = -a4;
  if (a2 >= result)
    result = a2;
  if (result > a3)
    result = a3;
  v7 = -v6;
  if (v6 >= 0.0)
    v7 = v6;
  if (v7 != 0.0)
    return result + (1.0 - 1.0 / ((v5 - result) / v6 * 0.55 + 1.0)) * v6;
  return result;
}

double SFSpringConvertMassStiffnessDampingToDampingRatioResponse(double *a1, double *a2, double result, double a4, double a5)
{
  double v5;

  if (a1)
  {
    v5 = sqrt(result * a4);
    *a1 = a5 / (v5 + v5);
  }
  if (a2)
  {
    result = 6.28318531 / sqrt(a4 / result);
    *a2 = result;
  }
  return result;
}

double SFSpringConvertDampingRatioResponseToStiffnessDamping(double *a1, double *a2, double result, double a4)
{
  double v4;
  double v5;

  v4 = 6.28318531 / a4 * (6.28318531 / a4);
  if (a1)
    *a1 = v4;
  if (a2)
  {
    v5 = sqrt(v4);
    result = (v5 + v5) * result;
    *a2 = result;
  }
  return result;
}

double SFSpringConvertStiffnessDampingToDampingRatioResponse(double *a1, double *a2, double a3, double a4)
{
  double result;

  result = sqrt(a3);
  if (a1)
    *a1 = a4 / (result + result);
  if (a2)
  {
    result = 6.28318531 / result;
    *a2 = result;
  }
  return result;
}

double SFSpringConvertMassStiffnessDampingToStiffnessDamping(double *a1, double *a2, double result, double a4, double a5)
{
  double v5;
  double v6;
  double v7;
  double v8;

  v5 = sqrt(a4 / result);
  v6 = 6.28318531 / (6.28318531 / v5) * (6.28318531 / (6.28318531 / v5));
  if (a1)
    *a1 = v6;
  if (a2)
  {
    v7 = sqrt(result * a4);
    v8 = sqrt(v6);
    result = a5 / (v7 + v7) * (v8 + v8);
    *a2 = result;
  }
  return result;
}

double SFScreenScale()
{
  void *v0;
  double v1;
  double v2;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scale");
  v2 = v1;

  return v2;
}

CGImageSource *SFCreateThumbnailImage(void *a1, double a2, double a3, double a4)
{
  void *v7;
  const __CFURL *v8;
  const __CFDictionary *v9;
  CGImageSource *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const __CFDictionary *v15;
  _QWORD v17[4];
  _QWORD v18[4];
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v19 = *MEMORY[0x24BDD97D0];
  v20[0] = MEMORY[0x24BDBD1C0];
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = a1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v10 = CGImageSourceCreateWithURL(v8, v9);

  if (v10)
  {
    if (a2 >= a3)
      v11 = a2;
    else
      v11 = a3;
    v12 = *MEMORY[0x24BDD97D8];
    v17[0] = *MEMORY[0x24BDD9778];
    v17[1] = v12;
    v18[0] = MEMORY[0x24BDBD1C8];
    v18[1] = MEMORY[0x24BDBD1C8];
    v18[2] = MEMORY[0x24BDBD1C8];
    v13 = *MEMORY[0x24BDD9808];
    v17[2] = *MEMORY[0x24BDD9788];
    v17[3] = v13;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11 * a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[3] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
    v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:", CGImageSourceCreateThumbnailAtIndex(v10, 0, v15));
    v10 = (CGImageSource *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

void SFGenerateWebPreviewImage(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  const char *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[16];

  v3 = a1;
  v4 = a2;
  if (v3)
  {
    if (!objc_msgSend(v3, "isFileURL"))
    {
      v7 = objc_alloc_init(getLPMetadataProviderClass());
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __SFGenerateWebPreviewImage_block_invoke;
      v8[3] = &unk_24CE0FCC0;
      v9 = v3;
      v10 = v4;
      objc_msgSend(v7, "startFetchingMetadataForURL:completionHandler:", v9, v8);

      goto LABEL_10;
    }
    sharing_ui_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Unable to generate web preview for fileURL";
LABEL_7:
      _os_log_impl(&dword_212728000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    }
  }
  else
  {
    sharing_ui_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Unable to generate web preview for nil URL";
      goto LABEL_7;
    }
  }

  (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
LABEL_10:

}

Class initPUStackView()
{
  Class result;

  if (PhotosUIPrivateLibrary_sOnce != -1)
    dispatch_once(&PhotosUIPrivateLibrary_sOnce, &__block_literal_global_9);
  result = objc_getClass("PUStackView");
  classPUStackView = (uint64_t)result;
  getPUStackViewClass[0] = (uint64_t (*)())PUStackViewFunction;
  return result;
}

id PUStackViewFunction()
{
  return (id)classPUStackView;
}

Class initPUPhotoDecoration()
{
  Class result;

  if (PhotosUIPrivateLibrary_sOnce != -1)
    dispatch_once(&PhotosUIPrivateLibrary_sOnce, &__block_literal_global_9);
  result = objc_getClass("PUPhotoDecoration");
  classPUPhotoDecoration = (uint64_t)result;
  getPUPhotoDecorationClass[0] = (uint64_t (*)())PUPhotoDecorationFunction;
  return result;
}

id PUPhotoDecorationFunction()
{
  return (id)classPUPhotoDecoration;
}

Class initLPMetadataProvider()
{
  Class result;

  if (LinkPresentationLibrary_sOnce_0 != -1)
    dispatch_once(&LinkPresentationLibrary_sOnce_0, &__block_literal_global_22);
  result = objc_getClass("LPMetadataProvider");
  classLPMetadataProvider = (uint64_t)result;
  getLPMetadataProviderClass = (uint64_t (*)())LPMetadataProviderFunction;
  return result;
}

id LPMetadataProviderFunction()
{
  return (id)classLPMetadataProvider;
}

void sub_212756E4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void SFUILinkMetadataSerializationForLocalUseOnly(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a1;
  v4 = a2;
  dispatch_get_global_queue(25, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __SFUILinkMetadataSerializationForLocalUseOnly_block_invoke;
  v8[3] = &unk_24CE0F088;
  v9 = v3;
  v10 = v4;
  v6 = v4;
  v7 = v3;
  dispatch_async(v5, v8);

}

id SFUILinkMetadataSerializationForLocalLowFidelityUseOnly(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "dataRepresentationForLocalLowFidelityUseOnly", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

double avatarImageScale()
{
  void *v0;
  double v1;
  double v2;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scale");
  v2 = v1;

  return v2;
}

void sub_21275952C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

Class initMTMaterialView()
{
  Class result;

  if (MaterialKitLibrary_sOnce != -1)
    dispatch_once(&MaterialKitLibrary_sOnce, &__block_literal_global_11);
  result = objc_getClass("MTMaterialView");
  classMTMaterialView = (uint64_t)result;
  getMTMaterialViewClass = (uint64_t (*)())MTMaterialViewFunction;
  return result;
}

id MTMaterialViewFunction()
{
  return (id)classMTMaterialView;
}

uint64_t IntentsLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = IntentsLibraryCore_frameworkLibrary;
  v6 = IntentsLibraryCore_frameworkLibrary;
  if (!IntentsLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_24CE0FEE0;
    v8 = *(_OWORD *)&off_24CE0FEF0;
    v1 = _sl_dlopen();
    v4[3] = v1;
    IntentsLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_2127601EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t IntentsLibrary()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = IntentsLibraryCore();
  if (!result)
    IntentsLibrary_cold_1(&v1);
  return result;
}

id getINImageClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getINImageClass_softClass;
  v7 = getINImageClass_softClass;
  if (!getINImageClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getINImageClass_block_invoke;
    v3[3] = &unk_24CE0FA08;
    v3[4] = &v4;
    __getINImageClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2127602F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getINImageClass_block_invoke(uint64_t a1)
{
  Class result;

  IntentsLibrary();
  result = objc_getClass("INImage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getINImageClass_block_invoke_cold_1();
  getINImageClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getINImageServiceConnectionClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getINImageServiceConnectionClass_softClass;
  v7 = getINImageServiceConnectionClass_softClass;
  if (!getINImageServiceConnectionClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getINImageServiceConnectionClass_block_invoke;
    v3[3] = &unk_24CE0FA08;
    v3[4] = &v4;
    __getINImageServiceConnectionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_212760400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getINImageServiceConnectionClass_block_invoke(uint64_t a1)
{
  Class result;

  IntentsLibrary();
  result = objc_getClass("INImageServiceConnection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getINImageServiceConnectionClass_block_invoke_cold_1();
  getINImageServiceConnectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *getINImageDefaultScaledSizeSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getINImageDefaultScaledSizeSymbolLoc_ptr;
  v6 = getINImageDefaultScaledSizeSymbolLoc_ptr;
  if (!getINImageDefaultScaledSizeSymbolLoc_ptr)
  {
    v1 = (void *)IntentsLibrary();
    v0 = dlsym(v1, "INImageDefaultScaledSize");
    v4[3] = (uint64_t)v0;
    getINImageDefaultScaledSizeSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_2127604E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

double getINImageDefaultScaledSize()
{
  void *INImageDefaultScaledSizeSymbolLoc;

  INImageDefaultScaledSizeSymbolLoc = getINImageDefaultScaledSizeSymbolLoc();
  if (!INImageDefaultScaledSizeSymbolLoc)
    getINImageDefaultScaledSize_cold_1();
  return *(double *)INImageDefaultScaledSizeSymbolLoc;
}

uint64_t ContactsUILibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = ContactsUILibraryCore_frameworkLibrary;
  v6 = ContactsUILibraryCore_frameworkLibrary;
  if (!ContactsUILibraryCore_frameworkLibrary)
  {
    v7 = xmmword_24CE0FF00;
    v8 = *(_OWORD *)&off_24CE0FF10;
    v1 = _sl_dlopen();
    v4[3] = v1;
    ContactsUILibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_2127605CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t ContactsUILibrary()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = ContactsUILibraryCore();
  if (!result)
    ContactsUILibrary_cold_1(&v1);
  return result;
}

id getCNAvatarImageRendererClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCNAvatarImageRendererClass_softClass;
  v7 = getCNAvatarImageRendererClass_softClass;
  if (!getCNAvatarImageRendererClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCNAvatarImageRendererClass_block_invoke;
    v3[3] = &unk_24CE0FA08;
    v3[4] = &v4;
    __getCNAvatarImageRendererClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2127606D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCNAvatarImageRendererClass_block_invoke(uint64_t a1)
{
  Class result;

  ContactsUILibrary();
  result = objc_getClass("CNAvatarImageRenderer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCNAvatarImageRendererClass_block_invoke_cold_1();
  getCNAvatarImageRendererClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getCNAvatarImageRenderingScopeClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCNAvatarImageRenderingScopeClass_softClass;
  v7 = getCNAvatarImageRenderingScopeClass_softClass;
  if (!getCNAvatarImageRenderingScopeClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCNAvatarImageRenderingScopeClass_block_invoke;
    v3[3] = &unk_24CE0FA08;
    v3[4] = &v4;
    __getCNAvatarImageRenderingScopeClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2127607E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCNAvatarImageRenderingScopeClass_block_invoke(uint64_t a1)
{
  Class result;

  ContactsUILibrary();
  result = objc_getClass("CNAvatarImageRenderingScope");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCNAvatarImageRenderingScopeClass_block_invoke_cold_1();
  getCNAvatarImageRenderingScopeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getCNAvatarImageRendererSettingsClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCNAvatarImageRendererSettingsClass_softClass;
  v7 = getCNAvatarImageRendererSettingsClass_softClass;
  if (!getCNAvatarImageRendererSettingsClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCNAvatarImageRendererSettingsClass_block_invoke;
    v3[3] = &unk_24CE0FA08;
    v3[4] = &v4;
    __getCNAvatarImageRendererSettingsClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2127608EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCNAvatarImageRendererSettingsClass_block_invoke(uint64_t a1)
{
  Class result;

  ContactsUILibrary();
  result = objc_getClass("CNAvatarImageRendererSettings");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCNAvatarImageRendererSettingsClass_block_invoke_cold_1();
  getCNAvatarImageRendererSettingsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_2127609B4()
{
  return sub_21279E278();
}

uint64_t sub_2127609D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  __n128 v18;
  uint64_t result;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;

  v25 = a5;
  v27 = a1;
  v23 = a2;
  v24 = a3;
  v29 = a4;
  v34 = 0;
  v33 = 0;
  v31 = 0;
  v32 = 0;
  v35 = a4;
  v26 = *(_QWORD *)(a4 - 8);
  v21 = (*(_QWORD *)(v26 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](a1);
  v22 = (char *)&v20 - v21;
  v30 = type metadata accessor for TimelineEntry(0, v5, v6, v7);
  v8 = MEMORY[0x24BDAC7A8](v22);
  v28 = (uint64_t)&v20 - v9;
  v34 = (char *)&v20 - v9;
  v33 = v10;
  v31 = v23;
  v32 = v24;
  (*(void (**)(uint64_t))(v11 + 16))(v8);
  (*(void (**)(uint64_t, char *, uint64_t))(v26 + 32))(v28, v22, v29);
  v12 = v24;
  v13 = v25;
  v14 = v29;
  v15 = v30;
  v16 = v28;
  v17 = (_QWORD *)(v28 + *(int *)(v30 + 28));
  *v17 = v23;
  v17[1] = v12;
  v18 = sub_212760B58(v16, v13, v14, v15);
  (*(void (**)(uint64_t, uint64_t, __n128))(v26 + 8))(v27, v29, v18);
  result = v28;
  sub_212760BB4(v28, v29);
  return result;
}

uint64_t type metadata accessor for TimelineEntry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a4, a4, (uint64_t)&nominal type descriptor for TimelineEntry);
}

__n128 sub_212760B58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __n128 result;

  (*(void (**)(void))(*(_QWORD *)(a3 - 8) + 16))();
  result = *(__n128 *)(a1 + *(int *)(a4 + 28));
  *(__n128 *)(a2 + *(int *)(a4 + 28)) = result;
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_212760BB4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(_QWORD *)(a2 - 8) + 8))();
}

void static ShockwaveEffectState.== infix(_:_:)(uint64_t a1)
{
  __asm { BR              X8 }
}

uint64_t sub_212760C34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, unsigned __int8 a12)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_212760C8C
                                                                                       + dword_212760D04[a12]))(a1, a2, a3, a4, a5, a6);
}

BOOL sub_212760C9C()
{
  uint64_t v1;

  return v1 == 0;
}

void ShockwaveEffectState.hash(into:)()
{
  __asm { BR              X8 }
}

uint64_t sub_212760D6C()
{
  return sub_21279E260();
}

uint64_t ShockwaveEffectState.hashValue.getter()
{
  sub_212760E38();
  return sub_21279E038();
}

unint64_t sub_212760E38()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_254B58680;
  if (!qword_254B58680)
  {
    v0 = MEMORY[0x212BF3218](&protocol conformance descriptor for ShockwaveEffectState, &type metadata for ShockwaveEffectState);
    atomic_store(v0, (unint64_t *)&qword_254B58680);
    return v0;
  }
  return v2;
}

uint64_t sub_212760EA4(uint64_t a1)
{
  char v1;

  static ShockwaveEffectState.== infix(_:_:)(a1);
  return v1 & 1;
}

uint64_t sub_212760EBC()
{
  return ShockwaveEffectState.hashValue.getter();
}

void sub_212760ED0()
{
  ShockwaveEffectState.hash(into:)();
}

uint64_t sub_212760EE4()
{
  return sub_21279DD20();
}

BOOL ShockwaveEffectState.isLogicallyComplete.getter()
{
  unsigned __int8 *v0;
  int v3;

  v3 = *v0;
  return v3 == 1 || v3 == 3 || v3 == 4;
}

void ShockwaveEffectState.assetState.getter()
{
  __asm { BR              X8 }
}

uint64_t sub_212760FBC()
{
  return sub_21279DDB0();
}

uint64_t sub_21276108C()
{
  return sub_2127610A0();
}

uint64_t sub_2127610A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;

  v19 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B589E8);
  v11 = sub_21279E1F4();
  v9 = v0;
  v18 = 0;
  v17 = 1000;
  sub_2127662D4();
  v6 = sub_21279E26C();
  sub_2127609D4((uint64_t)&v18, v6, v1, (uint64_t)&type metadata for ShockwaveEffectState, v9);
  v16 = 2;
  v15 = 480;
  v7 = sub_21279E26C();
  sub_2127609D4((uint64_t)&v16, v7, v2, (uint64_t)&type metadata for ShockwaveEffectState, v9 + 24);
  v14 = 3;
  v13 = 2;
  v8 = sub_21279E284();
  sub_2127609D4((uint64_t)&v14, v8, v3, (uint64_t)&type metadata for ShockwaveEffectState, v9 + 48);
  v12 = 4;
  v10 = sub_2127609B4();
  sub_2127609D4((uint64_t)&v12, v10, v4, (uint64_t)&type metadata for ShockwaveEffectState, v9 + 72);
  sub_212761414();
  swift_bridgeObjectRetain();
  v19 = v11;
  sub_2127693E0();
  return v11;
}

uint64_t sub_212761250()
{
  return sub_212761264();
}

uint64_t sub_212761264()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;

  v19 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B589E8);
  v11 = sub_21279E1F4();
  v9 = v0;
  v18 = 0;
  v17 = 50;
  sub_2127662D4();
  v6 = sub_21279E26C();
  sub_2127609D4((uint64_t)&v18, v6, v1, (uint64_t)&type metadata for ShockwaveEffectState, v9);
  v16 = 2;
  v15 = 480;
  v7 = sub_21279E26C();
  sub_2127609D4((uint64_t)&v16, v7, v2, (uint64_t)&type metadata for ShockwaveEffectState, v9 + 24);
  v14 = 3;
  v13 = 2;
  v8 = sub_21279E284();
  sub_2127609D4((uint64_t)&v14, v8, v3, (uint64_t)&type metadata for ShockwaveEffectState, v9 + 48);
  v12 = 4;
  v10 = sub_2127609B4();
  sub_2127609D4((uint64_t)&v12, v10, v4, (uint64_t)&type metadata for ShockwaveEffectState, v9 + 72);
  sub_212761414();
  swift_bridgeObjectRetain();
  v19 = v11;
  sub_2127693E0();
  return v11;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_212761414()
{
  sub_21279DE7C();
  sub_212766500();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_212761454()
{
  swift_bridgeObjectRetain();
}

uint64_t sub_212761478()
{
  uint64_t *v0;
  uint64_t result;

  result = *v0;
  sub_212761454();
  return result;
}

uint64_t sub_212761490@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  char v3;
  char v4;

  v4 = 0;
  v4 = *a1;
  v3 = v4;
  return sub_212765360((uint64_t)&v3, (uint64_t)&type metadata for ShockwaveEffectState, a2);
}

uint64_t sub_2127614CC@<X0>(_BYTE *a1@<X8>)
{
  char v3;

  swift_retain();
  sub_212761584();
  *a1 = v3;
  return swift_release();
}

uint64_t sub_212761528()
{
  swift_retain();
  sub_212761614();
  return swift_release();
}

uint64_t sub_212761584()
{
  swift_retain();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21279DB34();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_212761614()
{
  swift_retain();
  swift_getKeyPath();
  swift_getKeyPath();
  return sub_21279DB40();
}

void (*sub_2127616A0(_QWORD *a1))(void (***a1)(_QWORD, _QWORD))
{
  uint64_t v3;
  _QWORD *v4;

  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v3;
  swift_retain();
  v4[5] = swift_getKeyPath();
  v4[6] = swift_getKeyPath();
  v4[7] = sub_21279DB28();
  return sub_21276175C;
}

void sub_21276175C(void (***a1)(_QWORD, _QWORD))
{
  void (**v1)(_QWORD, _QWORD);

  v1 = *a1;
  v1[7](v1, 0);
  swift_release();
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_21276181C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v8 = a2;
  v4 = a1;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B58698);
  v7 = *(_QWORD *)(v10 - 8);
  v5 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v9 = (char *)&v3 - v5;
  v6 = *(_QWORD *)MEMORY[0x24BDAC7A8](v4);
  swift_retain();
  v12 = v6;
  v11 = v6;
  sub_212761988();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v8, v9, v10);
  return swift_release();
}

uint64_t sub_2127618DC(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[2];
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5[1] = a1;
  v7 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B58698);
  v6 = (*(_QWORD *)(*(_QWORD *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v2);
  v8 = (uint64_t)v5 - v6;
  (*(void (**)(void))(v3 + 16))();
  v9 = *v7;
  swift_retain();
  v11 = v9;
  v10 = v9;
  sub_2127619F8(v8);
  return swift_release();
}

uint64_t sub_212761988()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B58690);
  sub_21279DB10();
  return swift_endAccess();
}

uint64_t sub_2127619F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;

  v10 = a1;
  v14 = 0;
  v13 = 0;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B58698);
  v9 = *(_QWORD *)(v11 - 8);
  v6 = (*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v11);
  v7 = (char *)&v5 - v6;
  v14 = v2;
  v13 = v1;
  (*(void (**)(void))(v3 + 16))();
  v8 = &v12;
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B58690);
  sub_21279DB1C();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
}

void (*sub_212761AE8(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  size_t __size;
  _QWORD *v7;

  v7 = malloc(0x28uLL);
  *a1 = v7;
  *v7 = v1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B58698);
  v7[1] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v7[2] = v3;
  __size = *(_QWORD *)(v3 + 64);
  v7[3] = malloc(__size);
  v7[4] = malloc(__size);
  sub_212761988();
  return sub_212761BA0;
}

void sub_212761BA0(_QWORD **a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;

  v8 = *a1;
  if ((a2 & 1) != 0)
  {
    v4 = (void *)v8[4];
    v5 = (void *)v8[3];
    v2 = v8[2];
    v3 = v8[1];
    (*(void (**)(void))(v2 + 16))();
    sub_2127619F8((uint64_t)v5);
    (*(void (**)(void *, uint64_t))(v2 + 8))(v4, v3);
    free(v4);
    free(v5);
  }
  else
  {
    v6 = (void *)v8[4];
    v7 = (void *)v8[3];
    sub_2127619F8((uint64_t)v6);
    free(v6);
    free(v7);
  }
  free(v8);
}

uint64_t sub_212761C7C()
{
  uint64_t v0;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC9SharingUI29ShockwaveAnimationCoordinator_animationTask);
  swift_beginAccess();
  v3 = *v2;
  swift_retain();
  swift_endAccess();
  return v3;
}

uint64_t sub_212761CE0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  swift_retain();
  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC9SharingUI29ShockwaveAnimationCoordinator_animationTask);
  swift_beginAccess();
  *v3 = a1;
  swift_release();
  swift_endAccess();
  return swift_release();
}

uint64_t (*sub_212761D5C())()
{
  swift_beginAccess();
  return sub_212761DAC;
}

uint64_t sub_212761DAC()
{
  return swift_endAccess();
}

uint64_t ShockwaveAnimationCoordinator.__allocating_init()()
{
  swift_allocObject();
  return ShockwaveAnimationCoordinator.init()();
}

uint64_t ShockwaveAnimationCoordinator.init()()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;

  v5 = v0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC9SharingUI29ShockwaveAnimationCoordinator_animationTask) = 0;
  v2 = v0 + OBJC_IVAR____TtC9SharingUI29ShockwaveAnimationCoordinator__state;
  swift_beginAccess();
  v4 = 0;
  sub_212761490(&v4, v2);
  swift_endAccess();
  return v3;
}

uint64_t sub_212761E9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _BYTE v34[40];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v19 = a1;
  v18 = a2;
  v24 = MEMORY[0x24BEE6930];
  v37 = 0;
  v36 = 0;
  v35 = 0;
  v20 = 0;
  v28 = sub_21279E0BC();
  v25 = *(_QWORD *)(v28 - 8);
  v21 = *(_QWORD *)(v25 + 64);
  v16 = (v21 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v28);
  v27 = (char *)&v15 - v16;
  v17 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254B591C0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v20);
  v32 = (uint64_t)&v15 - v17;
  v37 = v3;
  v36 = v4;
  v35 = v2;
  v5 = sub_21279DED0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v32, 1);
  v22 = 7;
  v31 = swift_allocObject();
  swift_retain();
  swift_weakInit();
  swift_release();
  swift_retain();
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v27, v18, v28);
  v30 = v34;
  sub_2127654A4(v19, (uint64_t)v34);
  sub_21279DEB8();
  v23 = sub_21279DEAC();
  v26 = (*(unsigned __int8 *)(v25 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  v29 = (v26 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  v6 = (_QWORD *)swift_allocObject();
  v7 = v24;
  v8 = v25;
  v9 = v26;
  v10 = v27;
  v11 = v28;
  v12 = v31;
  v33 = v6;
  v6[2] = v23;
  v6[3] = v7;
  v6[4] = v12;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))((char *)v6 + v9, v10, v11);
  sub_212765610(v30, (char *)v33 + v29);
  swift_release();
  v13 = sub_2127633E8(v32, (uint64_t)&unk_254B586B8, (uint64_t)v33);
  return sub_212761CE0(v13);
}

uint64_t sub_212762108(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6[28] = a6;
  v6[27] = a5;
  v6[26] = a4;
  v6[19] = v6;
  v6[20] = 0;
  v6[21] = 0;
  v6[22] = 0;
  v6[23] = 0;
  v6[17] = 0;
  v6[18] = 0;
  v6[11] = 0;
  v6[12] = 0;
  v6[13] = 0;
  v7 = sub_21279E0D4();
  v6[29] = v7;
  v6[30] = *(_QWORD *)(v7 - 8);
  v6[31] = swift_task_alloc();
  v8 = sub_21279E0BC();
  v6[32] = v8;
  v6[33] = *(_QWORD *)(v8 - 8);
  v6[34] = swift_task_alloc();
  v6[35] = swift_task_alloc();
  v6[36] = swift_task_alloc();
  v6[37] = swift_task_alloc();
  v6[20] = a4 + 16;
  v6[21] = a5;
  v6[22] = a6;
  sub_21279DEB8();
  v6[38] = sub_21279DEAC();
  v6[39] = sub_21279DE88();
  v6[40] = v9;
  return swift_task_switch();
}

uint64_t sub_2127622AC()
{
  uint64_t v0;
  uint64_t Strong;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  _QWORD *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  char v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  *(_QWORD *)(v0 + 152) = v0;
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 328) = Strong;
  v35 = Strong;
  swift_endAccess();
  if (v35)
  {
    v2 = *(_QWORD *)(v34 + 296);
    v3 = *(_QWORD *)(v34 + 264);
    v4 = *(_QWORD *)(v34 + 256);
    v31 = *(_QWORD **)(v34 + 224);
    v5 = *(_QWORD *)(v34 + 216);
    *(_QWORD *)(v34 + 184) = v35;
    v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    *(_QWORD *)(v34 + 336) = v6;
    v6(v2, v5, v4);
    v33 = v31[3];
    v32 = v31[4];
    __swift_project_boxed_opaque_existential_1(v31, v33);
    *(_QWORD *)(v34 + 192) = (*(uint64_t (**)(uint64_t))(v32 + 8))(v33);
    *(_QWORD *)(v34 + 344) = __swift_instantiateConcreteTypeFromMangledName(&qword_254B589B8);
    sub_2127692FC();
    sub_21279DF48();
    do
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B589C8);
      sub_21279E0E0();
      v28 = *(_QWORD *)(v34 + 40);
      v29 = *(_QWORD *)(v34 + 48);
      v30 = *(_QWORD *)(v34 + 56);
      if (v28 == 5)
      {
        v24 = *(_QWORD **)(v34 + 224);
        sub_2127693E0();
        v26 = v24[3];
        v25 = v24[4];
        __swift_project_boxed_opaque_existential_1(v24, v26);
        v27 = (*(uint64_t (**)(uint64_t))(v25 + 8))(v26);
        swift_bridgeObjectRetain();
        *(_QWORD *)(v34 + 200) = v27;
        sub_212769408();
        sub_21279DD2C();
        sub_2127693E0();
        swift_bridgeObjectRelease();
        v11 = *(_QWORD *)(v34 + 296);
        v10 = *(_QWORD *)(v34 + 264);
        v12 = *(_QWORD *)(v34 + 256);
        sub_212761614();
        (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v12);
        swift_release();
        goto LABEL_10;
      }
      *(_BYTE *)(v34 + 88) = v28;
      *(_QWORD *)(v34 + 96) = v29;
      *(_QWORD *)(v34 + 104) = v30;
      sub_21279DEE8();
      v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 336);
      v17 = *(_QWORD *)(v34 + 296);
      v21 = *(_QWORD *)(v34 + 288);
      v20 = *(_QWORD *)(v34 + 280);
      v19 = *(_QWORD *)(v34 + 264);
      v7 = *(_QWORD *)(v34 + 256);
      sub_212763314(v17, v29, v30);
      v18(v21, v17, v7);
      sub_21279E098();
      sub_212769478();
      v23 = sub_21279DD38();
      v22 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
      *(_QWORD *)(v34 + 352) = v22;
      v22(v20, v7);
      v22(v21, v7);
    }
    while ((v23 & 1) == 0);
    v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 336);
    v14 = *(_QWORD *)(v34 + 296);
    v13 = *(_QWORD *)(v34 + 272);
    v15 = *(_QWORD *)(v34 + 256);
    sub_212761614();
    v16(v13, v14, v15);
    *(_QWORD *)(v34 + 112) = 0;
    *(_QWORD *)(v34 + 120) = 0;
    *(_BYTE *)(v34 + 128) = 1;
    sub_2127694E8();
    sub_2127633C8();
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v34 + 360) = v8;
    *v8 = *(_QWORD *)(v34 + 152);
    v8[1] = sub_212762A54;
    return sub_21279DEF4();
  }
  else
  {
LABEL_10:
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(*(_QWORD *)(v34 + 152) + 8))();
  }
}

uint64_t sub_212762A54()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  _QWORD *v7;

  v2 = *v1;
  *(_QWORD *)(v2 + 152) = *v1;
  v2 += 152;
  v7 = (_QWORD *)(v2 - 136);
  *(_QWORD *)(v2 + 216) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    v6 = (void (*)(uint64_t, uint64_t))v7[42];
    v4 = v7[32];
    v5 = v7[30];
    (*(void (**)(_QWORD, _QWORD))(v7[28] + 8))(v7[29], v7[27]);
    v6(v4, v5);
  }
  return swift_task_switch();
}

uint64_t sub_212762B4C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  char v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;

  *(_QWORD *)(v0 + 152) = v0;
  for (i = *(_QWORD *)(v0 + 368); ; i = 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B589C8);
    sub_21279E0E0();
    v25 = *(_QWORD *)(v28 + 40);
    v26 = *(_QWORD *)(v28 + 48);
    v27 = *(_QWORD *)(v28 + 56);
    if (v25 == 5)
    {
      v21 = *(_QWORD **)(v28 + 224);
      sub_2127693E0();
      v23 = v21[3];
      v22 = v21[4];
      __swift_project_boxed_opaque_existential_1(v21, v23);
      v24 = (*(uint64_t (**)(uint64_t))(v22 + 8))(v23);
      swift_bridgeObjectRetain();
      *(_QWORD *)(v28 + 200) = v24;
      sub_212769408();
      sub_21279DD2C();
      sub_2127693E0();
      swift_bridgeObjectRelease();
      v8 = *(_QWORD *)(v28 + 296);
      v7 = *(_QWORD *)(v28 + 264);
      v9 = *(_QWORD *)(v28 + 256);
      sub_212761614();
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
      swift_release();
      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(*(_QWORD *)(v28 + 152) + 8))();
    }
    *(_BYTE *)(v28 + 88) = v25;
    *(_QWORD *)(v28 + 96) = v26;
    *(_QWORD *)(v28 + 104) = v27;
    sub_21279DEE8();
    if (i)
      break;
    v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 336);
    v14 = *(_QWORD *)(v28 + 296);
    v18 = *(_QWORD *)(v28 + 288);
    v17 = *(_QWORD *)(v28 + 280);
    v16 = *(_QWORD *)(v28 + 264);
    v1 = *(_QWORD *)(v28 + 256);
    sub_212763314(v14, v26, v27);
    v15(v18, v14, v1);
    sub_21279E098();
    sub_212769478();
    v20 = sub_21279DD38();
    v19 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
    *(_QWORD *)(v28 + 352) = v19;
    v19(v17, v1);
    v19(v18, v1);
    if ((v20 & 1) != 0)
    {
      v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 336);
      v11 = *(_QWORD *)(v28 + 296);
      v10 = *(_QWORD *)(v28 + 272);
      v12 = *(_QWORD *)(v28 + 256);
      sub_212761614();
      v13(v10, v11, v12);
      *(_QWORD *)(v28 + 112) = 0;
      *(_QWORD *)(v28 + 120) = 0;
      *(_BYTE *)(v28 + 128) = 1;
      sub_2127694E8();
      sub_2127633C8();
      v2 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v28 + 360) = v2;
      *v2 = *(_QWORD *)(v28 + 152);
      v2[1] = sub_212762A54;
      return sub_21279DEF4();
    }
  }
  v6 = *(_QWORD *)(v28 + 296);
  v4 = *(_QWORD *)(v28 + 264);
  v5 = *(_QWORD *)(v28 + 256);
  sub_2127693E0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v6, v5);
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v28 + 152) + 8))();
}

uint64_t sub_2127631D8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;

  v7 = (void (*)(uint64_t, uint64_t))v0[44];
  v8 = v0[37];
  v5 = v0[34];
  v6 = v0[32];
  v1 = v0[31];
  v2 = v0[30];
  v3 = v0[29];
  v0[19] = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v7(v5, v6);
  sub_2127693E0();
  v7(v8, v6);
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[19] + 8))();
}

uint64_t sub_212763314(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD v5[2];
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;

  v9 = a1;
  v6 = a2;
  v5[1] = a3;
  v11 = sub_21279E0BC();
  v8 = *(_QWORD *)(v11 - 8);
  v7 = (*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v5 - v7;
  MEMORY[0x212BF21E0](v3);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v11);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(v9, v10, v11);
}

uint64_t sub_2127633C8()
{
  return sub_21279E0C8();
}

uint64_t sub_2127633E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;

  v7 = sub_21279DED0();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v8 + 48))(a1, 1) == 1)
  {
    sub_21276928C(a1);
  }
  else
  {
    sub_21279DEC4();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
  }
  v4 = *(_QWORD *)(a3 + 16);
  swift_unknownObjectRetain();
  if (v4)
  {
    swift_getObjectType();
    sub_21279DE88();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_2127635C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_21276108C();
  a1[3] = (uint64_t)&unk_24CE10308;
  a1[4] = (uint64_t)&off_24CE10580;
  *a1 = result;
  return result;
}

uint64_t sub_212763604()
{
  return 0;
}

uint64_t *sub_212763610(uint64_t a1, const void *a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t *result;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  _QWORD v56[3];
  uint8_t *v57;
  uint64_t v58;
  uint64_t v59;
  _BYTE **v60;
  uint64_t *v61;
  uint64_t *v62;
  uint64_t v63;
  _BYTE *v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t *v67;
  uint32_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  uint64_t v79;
  NSObject *v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint8_t *v87;
  uint64_t v88;
  uint64_t v89;
  unsigned int v90;
  _BYTE **v91;
  uint64_t *v92;
  uint64_t *v93;
  uint64_t v94;
  char *v95;
  unint64_t v96;
  void (*v97)(char *, char *, uint64_t);
  uint64_t v98;
  unint64_t v99;
  unint64_t v100;
  uint64_t *v101;
  uint32_t v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  uint64_t v106;
  int v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  _QWORD *v119;
  uint64_t v120;
  NSObject *v121;
  int v122;
  unsigned int (*v123)(char *, uint64_t, uint64_t);
  _BOOL4 v124;
  _BOOL4 v125;
  uint64_t *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  char *v132;
  unint64_t v133;
  char *v134;
  uint64_t v135;
  unint64_t v136;
  char *v137;
  unint64_t v138;
  char *v139;
  int v140;
  const void *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  unint64_t v146;
  uint64_t v147;
  unint64_t v148;
  char *v149;
  unint64_t v150;
  char *v151;
  uint64_t v152;
  uint64_t (*v153)(uint64_t, uint64_t, uint64_t);
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  _BYTE *v157;
  uint64_t v158;
  uint32_t v159;
  char v160[8];
  uint64_t (*v161)(uint64_t, uint64_t, uint64_t);
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  _BYTE *v165;
  uint64_t v166;
  uint32_t v167;
  _BYTE v168[4];
  uint64_t v169;
  uint64_t v170;
  char v171;
  uint64_t v172;
  uint64_t v173;
  char *v174;

  v142 = a1;
  v141 = a2;
  v140 = a3;
  v174 = 0;
  v173 = 0;
  v172 = 0;
  v171 = 0;
  v170 = 0;
  v128 = 0;
  v135 = 0;
  v129 = sub_21279DABC();
  v130 = *(_QWORD *)(v129 - 8);
  v131 = (*(_QWORD *)(v130 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v129);
  v132 = (char *)v56 - v131;
  v133 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]((char *)v56 - v131);
  v134 = (char *)v56 - v133;
  v136 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254B586C0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5 = MEMORY[0x24BDAC7A8](v135);
  v137 = (char *)v56 - v136;
  v138 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v5);
  v139 = (char *)v56 - v138;
  v143 = sub_21279E0BC();
  v144 = *(_QWORD *)(v143 - 8);
  v145 = *(_QWORD *)(v144 + 64);
  v146 = (v145 + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = MEMORY[0x24BDAC7A8](v142);
  v147 = (uint64_t)v56 - v146;
  v148 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v149 = (char *)v56 - v148;
  v150 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v151 = (char *)v56 - v150;
  v174 = (char *)v56 - v150;
  v173 = v11;
  v172 = v12;
  v171 = v13 & 1;
  v170 = v3;
  if ((v13 & 1) != 0)
  {
    v152 = sub_212761C7C();
    if (v152)
    {
      v126 = &v152;
      v127 = v152;
      swift_retain();
      sub_212765788();
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B586F0);
      sub_21279DEDC();
      swift_release();
    }
    else
    {
      sub_212765788();
    }
    sub_212761CE0(0);
  }
  v169 = sub_212761C7C();
  v125 = v169 == 0;
  v124 = v125;
  result = &v169;
  sub_212765788();
  if (v124)
  {
    sub_2127657B0(v141, v139);
    v123 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v144 + 48);
    if (v123(v139, 1, v143) == 1)
    {
      v42 = v132;
      sub_21276586C((uint64_t)v139);
      v43 = sub_2127701E4();
      (*(void (**)(char *, uint64_t, uint64_t))(v130 + 16))(v42, v43, v129);
      v64 = v168;
      sub_2127654A4(v142, (uint64_t)v168);
      v71 = 7;
      v72 = swift_allocObject();
      sub_212765610(v64, (void *)(v72 + 16));
      v80 = sub_21279DAA4();
      v81 = sub_21279DF6C();
      v67 = &v166;
      v166 = 12;
      v65 = sub_212766204();
      v66 = sub_21276626C();
      sub_2127662D4();
      sub_21279DE28();
      v68 = v167;
      v69 = 17;
      v74 = swift_allocObject();
      *(_BYTE *)(v74 + 16) = 32;
      v75 = swift_allocObject();
      *(_BYTE *)(v75 + 16) = 8;
      v70 = 32;
      v44 = swift_allocObject();
      v45 = v72;
      v73 = v44;
      *(_QWORD *)(v44 + 16) = sub_212765918;
      *(_QWORD *)(v44 + 24) = v45;
      v46 = swift_allocObject();
      v47 = v73;
      v77 = v46;
      *(_QWORD *)(v46 + 16) = sub_212767488;
      *(_QWORD *)(v46 + 24) = v47;
      v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E0);
      v76 = sub_21279E1F4();
      v78 = v48;
      swift_retain();
      v49 = v74;
      v50 = v78;
      *v78 = sub_21276741C;
      v50[1] = v49;
      swift_retain();
      v51 = v75;
      v52 = v78;
      v78[2] = sub_21276741C;
      v52[3] = v51;
      swift_retain();
      v53 = v77;
      v54 = v78;
      v78[4] = sub_2127674D0;
      v54[5] = v53;
      sub_212761414();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v80, (os_log_type_t)v81))
      {
        v55 = v128;
        v57 = (uint8_t *)sub_21279DFE4();
        v56[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E8);
        v58 = sub_21276633C(0);
        v59 = sub_21276633C(1);
        v60 = &v165;
        v165 = v57;
        v61 = &v164;
        v164 = v58;
        v62 = &v163;
        v163 = v59;
        sub_212766394(2, &v165);
        sub_212766394(1, v60);
        v161 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
        v162 = v74;
        sub_2127663A8(&v161, (uint64_t)v60, (uint64_t)v61, (uint64_t)v62);
        v63 = v55;
        if (v55)
        {
          __break(1u);
        }
        else
        {
          v161 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
          v162 = v75;
          sub_2127663A8(&v161, (uint64_t)&v165, (uint64_t)&v164, (uint64_t)&v163);
          v56[1] = 0;
          v161 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2127674D0;
          v162 = v77;
          sub_2127663A8(&v161, (uint64_t)&v165, (uint64_t)&v164, (uint64_t)&v163);
          _os_log_impl(&dword_212728000, v80, (os_log_type_t)v81, "Starting %s for nearby sharing interaction without a time to coordinate from", v57, v68);
          sub_2127663EC(v58);
          sub_2127663EC(v59);
          sub_21279DFCC();
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v130 + 8))(v132, v129);
    }
    else
    {
      v15 = v134;
      v97 = *(void (**)(char *, char *, uint64_t))(v144 + 32);
      v97(v151, v139, v143);
      v16 = sub_2127701E4();
      (*(void (**)(char *, uint64_t, uint64_t))(v130 + 16))(v15, v16, v129);
      v95 = v160;
      sub_2127654A4(v142, (uint64_t)v160);
      v109 = 7;
      v103 = swift_allocObject();
      sub_212765610(v95, (void *)(v103 + 16));
      (*(void (**)(char *, char *, uint64_t))(v144 + 16))(v149, v151, v143);
      v96 = (*(unsigned __int8 *)(v144 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v144 + 80);
      v98 = swift_allocObject();
      v97((char *)(v98 + v96), v149, v143);
      swift_retain();
      v108 = 32;
      v17 = swift_allocObject();
      v18 = v98;
      v110 = v17;
      *(_QWORD *)(v17 + 16) = sub_212767588;
      *(_QWORD *)(v17 + 24) = v18;
      swift_release();
      v121 = sub_21279DAA4();
      v122 = sub_21279DF78();
      v101 = &v158;
      v158 = 22;
      v99 = sub_212766204();
      v100 = sub_21276626C();
      sub_2127662D4();
      sub_21279DE28();
      v102 = v159;
      v106 = 17;
      v112 = swift_allocObject();
      v105 = 32;
      *(_BYTE *)(v112 + 16) = 32;
      v113 = swift_allocObject();
      v107 = 8;
      *(_BYTE *)(v113 + 16) = 8;
      v19 = swift_allocObject();
      v20 = v103;
      v104 = v19;
      *(_QWORD *)(v19 + 16) = sub_212765918;
      *(_QWORD *)(v19 + 24) = v20;
      v21 = swift_allocObject();
      v22 = v104;
      v114 = v21;
      *(_QWORD *)(v21 + 16) = sub_212767488;
      *(_QWORD *)(v21 + 24) = v22;
      v115 = swift_allocObject();
      *(_BYTE *)(v115 + 16) = v105;
      v116 = swift_allocObject();
      *(_BYTE *)(v116 + 16) = v107;
      v23 = swift_allocObject();
      v24 = v110;
      v111 = v23;
      *(_QWORD *)(v23 + 16) = sub_212767604;
      *(_QWORD *)(v23 + 24) = v24;
      v25 = swift_allocObject();
      v26 = v111;
      v118 = v25;
      *(_QWORD *)(v25 + 16) = sub_212767488;
      *(_QWORD *)(v25 + 24) = v26;
      v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E0);
      v117 = sub_21279E1F4();
      v119 = v27;
      swift_retain();
      v28 = v112;
      v29 = v119;
      *v119 = sub_21276741C;
      v29[1] = v28;
      swift_retain();
      v30 = v113;
      v31 = v119;
      v119[2] = sub_21276741C;
      v31[3] = v30;
      swift_retain();
      v32 = v114;
      v33 = v119;
      v119[4] = sub_2127674D0;
      v33[5] = v32;
      swift_retain();
      v34 = v115;
      v35 = v119;
      v119[6] = sub_21276741C;
      v35[7] = v34;
      swift_retain();
      v36 = v116;
      v37 = v119;
      v119[8] = sub_21276741C;
      v37[9] = v36;
      swift_retain();
      v38 = v118;
      v39 = v119;
      v119[10] = sub_2127674D0;
      v39[11] = v38;
      sub_212761414();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v121, (os_log_type_t)v122))
      {
        v40 = v128;
        v87 = (uint8_t *)sub_21279DFE4();
        v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E8);
        v88 = sub_21276633C(0);
        v89 = sub_21276633C(2);
        v91 = &v157;
        v157 = v87;
        v92 = &v156;
        v156 = v88;
        v93 = &v155;
        v155 = v89;
        v90 = 2;
        sub_212766394(2, &v157);
        sub_212766394(v90, v91);
        v153 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
        v154 = v112;
        sub_2127663A8(&v153, (uint64_t)v91, (uint64_t)v92, (uint64_t)v93);
        v94 = v40;
        if (v40)
        {
          __break(1u);
        }
        else
        {
          v153 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
          v154 = v113;
          sub_2127663A8(&v153, (uint64_t)&v157, (uint64_t)&v156, (uint64_t)&v155);
          v85 = 0;
          v41 = v85;
          v153 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2127674D0;
          v154 = v114;
          sub_2127663A8(&v153, (uint64_t)&v157, (uint64_t)&v156, (uint64_t)&v155);
          v84 = v41;
          v153 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
          v154 = v115;
          sub_2127663A8(&v153, (uint64_t)&v157, (uint64_t)&v156, (uint64_t)&v155);
          v83 = 0;
          v153 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
          v154 = v116;
          sub_2127663A8(&v153, (uint64_t)&v157, (uint64_t)&v156, (uint64_t)&v155);
          v82 = 0;
          v153 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2127674D0;
          v154 = v118;
          sub_2127663A8(&v153, (uint64_t)&v157, (uint64_t)&v156, (uint64_t)&v155);
          _os_log_impl(&dword_212728000, v121, (os_log_type_t)v122, "Starting coordinated %s for nearby sharing interaction %s after connecting", v87, v102);
          sub_2127663EC(v88);
          sub_2127663EC(v89);
          sub_21279DFCC();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v130 + 8))(v134, v129);
      (*(void (**)(char *, uint64_t))(v144 + 8))(v151, v143);
    }
    sub_2127657B0(v141, v137);
    if (v123(v137, 1, v143) == 1)
    {
      sub_21279E098();
      sub_21276586C((uint64_t)v137);
    }
    else
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v144 + 32))(v147, v137, v143);
    }
    sub_212761E9C(v142, v147);
    return (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(v144 + 8))(v147, v143);
  }
  return result;
}

uint64_t sub_212764B1C(_QWORD *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  swift_getDynamicType();
  return sub_21279E290();
}

uint64_t sub_212764B5C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  _QWORD v6[2];
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;

  v11 = a2;
  v6[1] = a1;
  v9 = sub_21279E0BC();
  v7 = *(_QWORD *)(v9 - 8);
  v6[0] = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v9);
  v8 = (char *)v6 - v6[0];
  sub_21279E098();
  v10 = sub_212764C0C();
  v12 = v2;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v8, v9);
  result = v10;
  v4 = v11;
  v5 = v12;
  *v11 = v10;
  v4[1] = v5;
  return result;
}

uint64_t sub_212764C0C()
{
  return sub_21279E0B0();
}

uint64_t sub_212764C2C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t result;
  uint64_t v5;
  char v6;
  char *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  _QWORD v16[3];
  uint64_t *v17;
  _QWORD *v18;
  _BOOL4 v19;
  _BOOL4 v20;
  uint64_t *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t *v34;
  char *v35;
  char v36;
  uint64_t v37[5];
  _QWORD v38[5];
  uint64_t v39;
  uint64_t v40;
  char v41;
  _BYTE v42[16];
  uint64_t v43;
  uint64_t v44;
  char *v45;

  v34 = &v40;
  v30 = a1;
  v44 = 0;
  v43 = 0;
  v45 = 0;
  v27 = 0;
  v23 = sub_21279DC78();
  v24 = *(_QWORD *)(v23 - 8);
  v25 = (*(_QWORD *)(v24 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)v16 - v25;
  v45 = (char *)v16 - v25;
  v28 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254B586C0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v27);
  v29 = (char *)v16 - v28;
  v31 = sub_21279DC84();
  v32 = *(_QWORD *)(v31 - 8);
  v33 = (*(_QWORD *)(v32 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x24BDAC7A8](v30);
  v3 = v34;
  v35 = (char *)v16 - v33;
  v34[6] = v2;
  v3[5] = v1;
  sub_212761584();
  v42[14] = v42[15];
  result = ShockwaveEffectState.isLogicallyComplete.getter();
  if ((result & 1) == 0)
  {
    sub_21279DC90();
    v22 = (*(uint64_t (**)(char *, uint64_t))(v32 + 88))(v35, v31);
    if (v22 == *MEMORY[0x24BE8FE40])
    {
      (*(void (**)(char *, uint64_t))(v32 + 96))(v35, v31);
      v36 = 0;
      sub_212761614();
      v5 = sub_21279DC60();
      return (*(uint64_t (**)(char *))(*(_QWORD *)(v5 - 8) + 8))(v35);
    }
    else if (v22 == *MEMORY[0x24BE8FE50])
    {
      v7 = v26;
      (*(void (**)(char *, uint64_t))(v32 + 96))(v35, v31);
      (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v7, v35, v23);
      v34[7] = (uint64_t)v7;
      v8 = sub_21279DC6C();
      v9 = v34;
      v40 = v8;
      v34[1] = v10;
      v20 = v9[1] != 0;
      v19 = v20;
      sub_2127677B0();
      if (v19)
      {
        v11 = sub_212761250();
        v18 = v38;
        v38[3] = &unk_24CE10330;
        v38[4] = &off_24CE10590;
        v38[0] = v11;
        sub_21279DC54();
        sub_212763610((uint64_t)v18, v29, 1);
        sub_21276586C((uint64_t)v29);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
      }
      else
      {
        sub_21279DC54();
        v17 = &v39;
        sub_2127635C0(&v39);
        v12 = sub_212763604();
        sub_212763610((uint64_t)v17, v29, v12 & 1);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
        sub_21276586C((uint64_t)v29);
      }
      return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v26, v23);
    }
    else if (v22 == *MEMORY[0x24BE8FE48])
    {
      (*(void (**)(char *, uint64_t))(v32 + 96))(v35, v31);
      v13 = sub_212761C7C();
      v14 = v34;
      v34[3] = v13;
      if (v14[3])
      {
        v16[1] = v42;
        v16[2] = v34[3];
        swift_retain();
        sub_212765788();
        __swift_instantiateConcreteTypeFromMangledName(&qword_254B586F0);
        sub_21279DEDC();
        swift_release();
      }
      else
      {
        sub_212765788();
      }
      v41 = 1;
      sub_212761614();
      v15 = sub_21279DC48();
      return (*(uint64_t (**)(char *))(*(_QWORD *)(v15 - 8) + 8))(v35);
    }
    else if (v22 == *MEMORY[0x24BE8FE38])
    {
      sub_21279DC54();
      v21 = v37;
      sub_2127635C0(v37);
      v6 = sub_212763604();
      sub_212763610((uint64_t)v21, v29, v6 & 1);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
      return sub_21276586C((uint64_t)v29);
    }
    else
    {
      v42[13] = 4;
      sub_212761614();
      return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v35, v31);
    }
  }
  return result;
}

uint64_t ShockwaveAnimationCoordinator.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = OBJC_IVAR____TtC9SharingUI29ShockwaveAnimationCoordinator__state;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B58690);
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0 + v3);
  sub_212765788();
  return v4;
}

uint64_t ShockwaveAnimationCoordinator.__deallocating_deinit()
{
  ShockwaveAnimationCoordinator.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_212765298@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for ShockwaveAnimationCoordinator();
  result = sub_21279DAF8();
  *a1 = result;
  return result;
}

uint64_t static ShockwaveAnimationCoordinator.== infix(_:_:)()
{
  swift_retain();
  sub_21279DD50();
  swift_retain();
  sub_21279DD50();
  return sub_21279DD44() & 1;
}

uint64_t sub_212765340()
{
  return static ShockwaveAnimationCoordinator.== infix(_:_:)() & 1;
}

uint64_t sub_212765360@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7 = a3;
  v10 = a1;
  v11 = a2;
  v12 = a2;
  v9 = *(_QWORD *)(a2 - 8);
  v6 = (*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v5 - v6;
  (*(void (**)(void))(v3 + 16))();
  sub_21279DB04();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *a1;
  if (*a1 < 0)
  {
    v2 = MEMORY[0x212BF3200]((char *)a1 + (int)*a1, -(*a1 >> 32), 0);
    *a1 = v2;
    return v2;
  }
  return v4;
}

uint64_t sub_212765468()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2127654A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

uint64_t sub_2127654F0()
{
  uint64_t v0;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v4 = sub_21279E0BC();
  v2 = *(_QWORD *)(v4 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = (v3 + *(_QWORD *)(v2 + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v4);
  __swift_destroy_boxed_opaque_existential_1(v0 + v5);
  return swift_deallocObject();
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  if ((*(_DWORD *)(*(_QWORD *)(v2 - 8) + 80) & 0x20000) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1);
}

void *sub_212765610(const void *a1, void *__dst)
{
  memcpy(__dst, a1, 0x28uLL);
  return __dst;
}

uint64_t sub_212765648(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  *(_QWORD *)(v2 + 16) = v2;
  v3 = *(_QWORD *)(sub_21279E0BC() - 8);
  v9 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v10 = (v9 + *(_QWORD *)(v3 + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
  v6 = v1[2];
  v7 = v1[3];
  v8 = v1[4];
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v4;
  *v4 = *(_QWORD *)(v2 + 16);
  v4[1] = sub_212765728;
  return sub_212762108(a1, v6, v7, v8, (uint64_t)v1 + v9, (uint64_t)v1 + v10);
}

uint64_t sub_212765728()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_212765788()
{
  swift_release();
}

void *sub_2127657B0(const void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v6;
  uint64_t v7;

  v6 = sub_21279E0BC();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586C0);
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t sub_21276586C(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_21279E0BC();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return a1;
}

uint64_t sub_2127658DC()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_212765918()
{
  uint64_t v0;

  return sub_212764B1C((_QWORD *)(v0 + 16));
}

uint64_t sub_212765920()
{
  sub_212768EBC();
  return sub_21279E140();
}

uint64_t sub_21276595C()
{
  sub_212768EBC();
  return sub_21279E164();
}

uint64_t sub_2127659A0()
{
  sub_212768EBC();
  return sub_21279E14C();
}

uint64_t sub_2127659E4()
{
  sub_212768EBC();
  sub_21276900C();
  return sub_21279E194();
}

uint64_t sub_212765A1C()
{
  sub_212768EBC();
  sub_21276900C();
  return sub_21279E170();
}

uint64_t sub_212765A64()
{
  sub_212768EBC();
  sub_21276900C();
  return sub_21279E17C() & 1;
}

uint64_t sub_212765AB0()
{
  sub_212768EBC();
  sub_21276900C();
  return sub_21279E188();
}

uint64_t sub_212765AF8()
{
  sub_212768F2C();
  sub_21276900C();
  return sub_21279E194();
}

uint64_t sub_212765B30()
{
  sub_212768F2C();
  sub_21276900C();
  return sub_21279E170();
}

uint64_t sub_212765B78()
{
  sub_212768F2C();
  sub_21276900C();
  return sub_21279E17C() & 1;
}

uint64_t sub_212765BC4()
{
  sub_212768F2C();
  sub_21276900C();
  return sub_21279E188();
}

uint64_t sub_212765C0C()
{
  sub_212768F9C();
  sub_21276900C();
  return sub_21279E194();
}

uint64_t sub_212765C44()
{
  sub_212768F9C();
  sub_21276900C();
  return sub_21279E170();
}

uint64_t sub_212765C8C()
{
  sub_212768F9C();
  sub_21276900C();
  return sub_21279E17C() & 1;
}

uint64_t sub_212765CD8()
{
  sub_212768F9C();
  sub_21276900C();
  return sub_21279E188();
}

uint64_t sub_212765D20()
{
  sub_212768F2C();
  return sub_21279E140();
}

uint64_t sub_212765D5C()
{
  sub_212768F2C();
  return sub_21279E164();
}

uint64_t sub_212765DA0()
{
  sub_212768F2C();
  return sub_21279E14C();
}

void sub_212765DE4(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  sub_212765E1C();
  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = v2 & 1;
}

void sub_212765E40(_QWORD *a1@<X8>)
{
  uint64_t v1;

  sub_212765E6C();
  *a1 = v1;
}

uint64_t sub_212765E88()
{
  sub_212768A2C();
  return sub_21279E200() & 1;
}

uint64_t sub_212765ED0()
{
  sub_212768B34();
  return sub_21279E200() & 1;
}

void *sub_212765F18@<X0>(_QWORD *a1@<X8>)
{
  void *result;

  result = sub_212765F4C();
  *a1 = result;
  return result;
}

void *sub_212765F4C()
{
  id v0;
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_21279DD5C();
  v0 = v2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v2;
}

uint64_t sub_212765FA4@<X0>(uint64_t *a1@<X8>)
{
  void **v1;
  uint64_t result;
  uint64_t v3;

  result = sub_212765FD4(*v1);
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_212765FD4(void *a1)
{
  id v1;
  uint64_t v4;

  v1 = a1;
  v4 = sub_21279DD68();

  return v4;
}

uint64_t sub_212766020()
{
  sub_212769154();
  sub_212768EBC();
  return sub_21279E158();
}

uint64_t sub_212766068()
{
  sub_2127690E4();
  sub_212768F2C();
  return sub_21279E158();
}

uint64_t sub_2127660B0()
{
  sub_212769074();
  sub_212768F9C();
  return sub_21279E158();
}

uint64_t sub_2127660F8()
{
  sub_212768F9C();
  return sub_21279E140();
}

uint64_t sub_212766134()
{
  sub_212768F9C();
  return sub_21279E164();
}

uint64_t sub_212766178()
{
  sub_212768F9C();
  return sub_21279E14C();
}

uint64_t sub_2127661BC()
{
  sub_212768C3C();
  return sub_21279E200() & 1;
}

unint64_t sub_212766204()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_254B586C8;
  if (!qword_254B586C8)
  {
    v0 = MEMORY[0x212BF3218](MEMORY[0x24BEE4540], MEMORY[0x24BEE44F0]);
    atomic_store(v0, (unint64_t *)&qword_254B586C8);
    return v0;
  }
  return v2;
}

unint64_t sub_21276626C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_254B586D0;
  if (!qword_254B586D0)
  {
    v0 = MEMORY[0x212BF3218](MEMORY[0x24BEE4518], MEMORY[0x24BEE44F0]);
    atomic_store(v0, (unint64_t *)&qword_254B586D0);
    return v0;
  }
  return v2;
}

unint64_t sub_2127662D4()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_254B586D8;
  if (!qword_254B586D8)
  {
    v0 = MEMORY[0x212BF3218](MEMORY[0x24BEE17B0], MEMORY[0x24BEE1768]);
    atomic_store(v0, (unint64_t *)&qword_254B586D8);
    return v0;
  }
  return v2;
}

uint64_t sub_21276633C(uint64_t a1)
{
  if (a1)
    return sub_21279DFE4();
  else
    return 0;
}

uint64_t sub_212766394(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_2127663A8(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_2127663EC(uint64_t result)
{
  if (result)
  {
    sub_21279DFD8();
    return sub_21279DFCC();
  }
  return result;
}

uint64_t sub_212766458(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (*v4)(void);
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v12 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a3 - 8);
  v8 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = (void (*)(void))MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)&v7 - v8;
  v4();
  v13 = sub_21279E1A0();
  v14 = v5;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v11, v12);
  return v13;
}

void sub_212766500()
{
  _QWORD *v0;

  *v0 = *v0;
}

uint64_t sub_21276650C(uint64_t (*a1)(void))
{
  return a1();
}

_QWORD *sub_21276652C(_QWORD *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  uint64_t v8;

  v4 = a4();
  sub_2127665A8(v4, v5, a3);
  v8 = *a1;
  sub_21279DFFC();
  swift_bridgeObjectRelease();
  result = a1;
  *a1 = v8 + 8;
  return result;
}

uint64_t sub_2127665A8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  __int16 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[4];
  uint64_t v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;

  v14 = sub_212766718((uint64_t)&v17, 0, 0, 1, a1, a2);
  v15 = v3;
  v16 = v4;
  v11 = v17;
  if (v14)
  {
    v12[3] = swift_getObjectType();
    v12[0] = v14;
    v6 = *a3;
    if (*a3)
    {
      sub_212769218((uint64_t)v12, v6);
      *a3 = v6 + 32;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  }
  else
  {
    v13[3] = MEMORY[0x24BEE2520];
    v13[0] = a1;
    v13[1] = a2;
    v7 = *a3;
    if (*a3)
    {
      sub_212769218((uint64_t)v13, v7);
      *a3 = v7 + 32;
    }
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }
  return v11;
}

uint64_t sub_212766718(uint64_t result, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  char v13;
  char v14;
  int64_t v15;
  int64_t v16;
  _QWORD *v17;
  _QWORD v21[4];
  char v22;
  char v23;
  uint64_t v24;

  v17 = (_QWORD *)result;
  v24 = a6;
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (a2)
      {
        if (!a3)
          __break(1u);
        v16 = a3 - (_QWORD)a2;
      }
      else
      {
        v16 = 0;
      }
      v15 = (a6 & 0xF00000000000000uLL) >> 56;
      if (v15 < v16)
      {
        if (a2)
        {
          v21[0] = a5;
          v21[1] = a6 & (-(uint64_t)bswap64(0xFFuLL) - 1);
          sub_212766A8C(v21, v15, a2);
          sub_21279E008();
          *v17 = a2;
          v11 = 0;
          v12 = v15;
          v13 = 1;
          v14 = 0;
LABEL_26:
          v21[2] = v11;
          v21[3] = v12;
          v22 = v13 & 1;
          v23 = v14 & 1;
          return (uint64_t)v11;
        }
        goto LABEL_28;
      }
    }
LABEL_13:
    v6 = sub_212766AC8(a5, a6);
    *v17 = v7;
    v11 = v6;
    v12 = v8;
    v13 = 0;
    v14 = 1;
    goto LABEL_26;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0xFFFFFFFFFFFFFFE0)
    {
      v10 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
      goto LABEL_21;
    }
    __break(1u);
  }
  result = sub_21279E050();
  if (!result)
    goto LABEL_29;
  v10 = result;
LABEL_21:
  *v17 = v10;
  if (a6 < 0)
  {
    v9 = 0;
LABEL_25:
    v11 = (_QWORD *)v9;
    v12 = a5 & 0xFFFFFFFFFFFFLL;
    v13 = 0;
    v14 = 0;
    goto LABEL_26;
  }
  if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0)
  {
    swift_unknownObjectRetain();
    v9 = a6 & 0xFFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

void *sub_212766A8C(const void *a1, size_t a2, void *__dst)
{
  memcpy(__dst, a1, a2);
  return __dst;
}

_QWORD *sub_212766AC8(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v6 = sub_212766B78(a1, a2);
  sub_212766CF0();
  v4 = v6[2];
  sub_212766D64(v4);
  sub_212766DE4(v4, 0);
  sub_212766500();
  swift_retain();
  v5 = sub_212766E50((uint64_t)v6);
  swift_bridgeObjectRelease();
  result = (_QWORD *)v5;
  if (!__OFSUB__(v5, 1))
    return v6;
  __break(1u);
  return result;
}

_QWORD *sub_212766B78(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  char v3;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD v8[3];

  v8[2] = a2;
  if ((a2 & 0x1000000000000000) != 0)
  {
    v7 = sub_21279DDD4();
  }
  else if ((a2 & 0x2000000000000000) != 0)
  {
    v7 = (a2 & 0xF00000000000000uLL) >> 56;
  }
  else
  {
    v7 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v7)
    return (_QWORD *)sub_212766FCC();
  v5 = sub_212766E64(v7, 0);
  swift_retain();
  swift_release();
  result = (_QWORD *)sub_21279E044();
  v6 = result;
  if ((v3 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    result = v8;
    v8[0] = 0;
    v8[1] = 0xE000000000000000;
    sub_2127677B0();
    if (v6 == (_QWORD *)v7)
      return v5;
  }
  __break(1u);
  return result;
}

uint64_t sub_212766CF0()
{
  uint64_t *v0;
  uint64_t result;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v4 = *v0;
  result = swift_isUniquelyReferenced_nonNull_native();
  *v0 = v4;
  if ((result & 1) == 0)
  {
    v2 = sub_212766E50(*v3);
    result = sub_212766FF8(0, v2 + 1, 1, *v3);
    *v3 = result;
  }
  return result;
}

uint64_t sub_212766D64(uint64_t result)
{
  uint64_t v1;
  uint64_t *v2;

  if (*(_QWORD *)(*(_QWORD *)v1 + 24) >> 1 < result + 1)
  {
    result = sub_212766FF8(*(_QWORD *)(*(_QWORD *)v1 + 24) >> 1 != 0, result + 1, 1, *v2);
    *v2 = result;
  }
  return result;
}

uint64_t sub_212766DE4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + 1;
  v4 = *v2;
  swift_bridgeObjectRetain();
  *(_QWORD *)(v4 + 16) = v5;
  swift_release();
  v6 = *v2;
  swift_retain();
  *(_BYTE *)(v6 + 32 + a1) = a2;
  return swift_release();
}

uint64_t sub_212766E50(uint64_t a1)
{
  return sub_2127672F4(a1);
}

_QWORD *sub_212766E64(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  size_t v4;
  _QWORD *v6;
  uint64_t v7;

  if (a2 < a1)
    v7 = a1;
  else
    v7 = a2;
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B589B0);
    v6 = (_QWORD *)swift_allocObject();
    if ((_swift_stdlib_has_malloc_size() & 1) != 0)
    {
      v4 = (size_t)v6 + _swift_stdlib_malloc_size(v6);
      swift_retain();
      v6[2] = a1;
      v6[3] = 2 * (v4 - (_QWORD)(v6 + 4));
    }
    else
    {
      swift_retain();
      v6[2] = a1;
      v6[3] = 2 * v7;
    }
    swift_release();
    return v6;
  }
  else
  {
    v3 = MEMORY[0x24BEE4AF8];
    swift_retain();
    return (_QWORD *)v3;
  }
}

uint64_t sub_212766FCC()
{
  uint64_t v1;

  v1 = MEMORY[0x24BEE4AF8];
  swift_retain();
  return v1;
}

uint64_t sub_212766FF8(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t result;
  char *v5;
  size_t v6;
  char *v7;
  _QWORD *v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v16;

  swift_retain();
  result = swift_retain();
  v16 = *(_QWORD *)(a4 + 24) >> 1;
  if ((a3 & 1) != 0)
  {
    if (v16 < a2)
    {
      if ((unsigned __int128)(v16 * (__int128)2) >> 64 != (2 * v16) >> 63)
      {
        __break(1u);
        return result;
      }
      if (2 * v16 < a2)
        v11 = a2;
      else
        v11 = 2 * v16;
    }
    else
    {
      v11 = *(_QWORD *)(a4 + 24) >> 1;
    }
  }
  else
  {
    v11 = a2;
  }
  v10 = *(_QWORD *)(a4 + 16);
  if (v11 < v10)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v11;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B589B0);
    v8 = (_QWORD *)swift_allocObject();
    if ((_swift_stdlib_has_malloc_size() & 1) != 0)
    {
      v6 = (size_t)v8 + _swift_stdlib_malloc_size(v8);
      swift_retain();
      v8[2] = v10;
      v8[3] = 2 * (v6 - (_QWORD)(v8 + 4));
    }
    else
    {
      swift_retain();
      v8[2] = v10;
      v8[3] = 2 * v9;
    }
    swift_release();
    v7 = (char *)v8;
  }
  else
  {
    v5 = (char *)MEMORY[0x24BEE4AF8];
    swift_retain();
    v7 = v5;
  }
  if ((a1 & 1) != 0)
  {
    swift_release();
    swift_bridgeObjectRelease();
    sub_212767330((char *)(a4 + 32), v10, v7 + 32);
    *(_QWORD *)(a4 + 16) = 0;
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_retain();
    swift_release();
    sub_2127672FC((const void *)(a4 + 32), v10, v7 + 32);
    swift_unknownObjectRelease();
  }
  return (uint64_t)v7;
}

uint64_t sub_2127672F4(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

void *sub_2127672FC(const void *a1, size_t a2, void *__dst)
{
  return memcpy(__dst, a1, a2);
}

char *sub_212767330(char *result, size_t a2, char *a3)
{
  if (a3 < result || a3 >= &result[a2] || a3 != result)
    return (char *)memmove(a3, result, a2);
  return result;
}

_BYTE **sub_2127673E0(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_2127673F4()
{
  return swift_deallocObject();
}

_BYTE **sub_21276741C(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_2127673E0(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_212767424()
{
  return swift_deallocObject();
}

uint64_t sub_21276744C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212767488()
{
  uint64_t v0;

  return sub_21276650C(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_212767494()
{
  swift_release();
  return swift_deallocObject();
}

_QWORD *sub_2127674D0(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return sub_21276652C(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_2127674DC()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_212767518()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(sub_21279E0BC() - 8);
  (*(void (**)(unint64_t))(v1 + 8))(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
  return swift_deallocObject();
}

uint64_t sub_212767588@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(sub_21279E0BC() - 8) + 80);
  return sub_212764B5C(v1 + ((v2 + 16) & ~v2), a1);
}

uint64_t sub_2127675C8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212767604()
{
  uint64_t v0;

  return sub_212766458(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), MEMORY[0x24BEE48B8], MEMORY[0x24BEE48E0]);
}

uint64_t sub_212767620()
{
  return swift_deallocObject();
}

uint64_t sub_212767648()
{
  return swift_deallocObject();
}

uint64_t sub_212767670()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2127676AC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2127676E8()
{
  return swift_deallocObject();
}

uint64_t sub_212767710()
{
  return swift_deallocObject();
}

uint64_t sub_212767738()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212767774()
{
  swift_release();
  return swift_deallocObject();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_2127677B0()
{
  swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for ShockwaveAnimationCoordinator()
{
  uint64_t v1;

  v1 = qword_254B58808;
  if (!qword_254B58808)
    return swift_getSingletonMetadata();
  return v1;
}

unint64_t sub_21276783C()
{
  return sub_212767850();
}

unint64_t sub_212767850()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_254B58758[0];
  if (!qword_254B58758[0])
  {
    v0 = MEMORY[0x212BF3218](&protocol conformance descriptor for ShockwaveEffectState, &type metadata for ShockwaveEffectState);
    atomic_store(v0, qword_254B58758);
    return v0;
  }
  return v2;
}

uint64_t sub_2127678BC()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_2127678C8()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_2127678F4()
{
  unint64_t v0;
  uint64_t v2;

  v2 = swift_checkMetadataState();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

unint64_t sub_2127679B0(_QWORD *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  int v9;

  v9 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v9 & 0x20000) != 0)
  {
    v4 = *a2;
    swift_retain();
    *a1 = v4;
    return *a1 + ((v9 + 16) & ~(unint64_t)v9);
  }
  else
  {
    (*(void (**)(_QWORD *, uint64_t *))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 16))(a1, a2);
    *(_OWORD *)((char *)a1 + *(int *)(a3 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 28));
    return (unint64_t)a1;
  }
}

uint64_t sub_212767A78(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
}

__n128 sub_212767AA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __n128 result;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 16))();
  result = *(__n128 *)(a2 + *(int *)(a3 + 28));
  *(__n128 *)(a1 + *(int *)(a3 + 28)) = result;
  return result;
}

uint64_t sub_212767B00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  _QWORD *v4;
  _QWORD *v5;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 24))();
  result = a1;
  v4 = (_QWORD *)(a2 + *(int *)(a3 + 28));
  v5 = (_QWORD *)(a1 + *(int *)(a3 + 28));
  *v5 = *v4;
  v5[1] = v4[1];
  return result;
}

__n128 sub_212767B68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __n128 result;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 32))();
  result = *(__n128 *)(a2 + *(int *)(a3 + 28));
  *(__n128 *)(a1 + *(int *)(a3 + 28)) = result;
  return result;
}

uint64_t sub_212767BC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  _QWORD *v4;
  _QWORD *v5;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))();
  result = a1;
  v4 = (_QWORD *)(a2 + *(int *)(a3 + 28));
  v5 = (_QWORD *)(a1 + *(int *)(a3 + 28));
  *v5 = *v4;
  v5[1] = v4[1];
  return result;
}

uint64_t sub_212767C28()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_212767C44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 48))();
}

uint64_t sub_212767C74()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_212767C90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 56))(a1, a2);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ShockwaveEffectState(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  if (a2)
  {
    if (a2 <= 0xFB)
      goto LABEL_15;
    v7 = ((a2 + 4) >> 8) + 1;
    v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v8 = v2;
    }
    if (v8 == 1)
      v6 = a1[1];
    else
      v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    if (v6)
    {
      v5 = (*a1 | ((v6 - 1) << 8)) + 251;
    }
    else
    {
LABEL_15:
      v3 = *a1 - 5;
      if (v3 < 0)
        v3 = -1;
      v5 = v3;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_BYTE *storeEnumTagSinglePayload for ShockwaveEffectState(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  v7 = 0;
  if (a3 > 0xFB)
  {
    v5 = ((a3 + 4) >> 8) + 1;
    v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v6 = v3;
    }
    v7 = v6;
  }
  if (a2 > 0xFB)
  {
    v4 = ((a2 - 252) >> 8) + 1;
    *result = a2 + 4;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2)
      *result = a2 + 4;
  }
  return result;
}

uint64_t sub_2127680CC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2127680D8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ShockwaveEffectState()
{
  return &type metadata for ShockwaveEffectState;
}

uint64_t dispatch thunk of ShockwaveAnimation.timeline.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

void *type metadata accessor for DefaultShockewaveAnimation()
{
  return &unk_24CE10308;
}

void *type metadata accessor for FastShockwaveAnimation()
{
  return &unk_24CE10330;
}

uint64_t sub_212768134()
{
  return type metadata accessor for ShockwaveAnimationCoordinator();
}

uint64_t sub_21276814C()
{
  unint64_t v0;
  uint64_t updated;

  updated = sub_212768298();
  if (v0 <= 0x3F)
  {
    updated = swift_updateClassMetadata2();
    if (!updated)
      return 0;
  }
  return updated;
}

uint64_t method lookup function for ShockwaveAnimationCoordinator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ShockwaveAnimationCoordinator.state.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of ShockwaveAnimationCoordinator.$state.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of ShockwaveAnimationCoordinator.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of ShockwaveAnimationCoordinator.update(using:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t sub_212768298()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v3;
  uint64_t v4;

  v4 = qword_254B58818[0];
  if (!qword_254B58818[0])
  {
    v3 = sub_21279DB4C();
    v4 = v3;
    if (!v0)
    {
      v1 = v3;
      atomic_store(v3, qword_254B58818);
      return v1;
    }
  }
  return v4;
}

uint64_t type metadata accessor for UIInterfaceOrientationMask()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  v4 = qword_254B58900;
  if (!qword_254B58900)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    v4 = ForeignTypeMetadata;
    if (!v0)
    {
      v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_254B58900);
      return v1;
    }
  }
  return v4;
}

uint64_t type metadata accessor for SFUIUserInterfaceLayoutDirection()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  v4 = qword_254B58908;
  if (!qword_254B58908)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    v4 = ForeignTypeMetadata;
    if (!v0)
    {
      v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_254B58908);
      return v1;
    }
  }
  return v4;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_212768484(uint64_t a1, int a2)
{
  int v3;

  if (a2)
  {
    if (*(_BYTE *)(a1 + 16))
      v3 = *(_OWORD *)a1;
    else
      v3 = -1;
  }
  else
  {
    v3 = -1;
  }
  return (v3 + 1);
}

uint64_t sub_2127685B0(uint64_t result, int a2, int a3)
{
  _BOOL4 v3;

  v3 = a3 != 0;
  if (a2)
  {
    *(_OWORD *)result = (a2 - 1);
    if (a3)
    {
      if (v3)
        *(_BYTE *)(result + 16) = 1;
      else
        __break(1u);
    }
  }
  else if (a3)
  {
    if (v3)
      *(_BYTE *)(result + 16) = 0;
    else
      __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for CGSize()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  v4 = qword_254B58910;
  if (!qword_254B58910)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    v4 = ForeignTypeMetadata;
    if (!v0)
    {
      v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_254B58910);
      return v1;
    }
  }
  return v4;
}

uint64_t type metadata accessor for DocumentType()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  v4 = qword_254B58918;
  if (!qword_254B58918)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    v4 = ForeignTypeMetadata;
    if (!v0)
    {
      v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_254B58918);
      return v1;
    }
  }
  return v4;
}

uint64_t type metadata accessor for DocumentAttributeKey()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  v4 = qword_254B58920;
  if (!qword_254B58920)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    v4 = ForeignTypeMetadata;
    if (!v0)
    {
      v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_254B58920);
      return v1;
    }
  }
  return v4;
}

uint64_t type metadata accessor for URLResourceKey()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  v4 = qword_254B58928;
  if (!qword_254B58928)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    v4 = ForeignTypeMetadata;
    if (!v0)
    {
      v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_254B58928);
      return v1;
    }
  }
  return v4;
}

unint64_t sub_212768A18()
{
  return sub_212768A2C();
}

unint64_t sub_212768A2C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B58930;
  if (!qword_254B58930)
  {
    v0 = type metadata accessor for URLResourceKey();
    v1 = MEMORY[0x212BF3218](&unk_2127A2FBC, v0);
    atomic_store(v1, (unint64_t *)&qword_254B58930);
    return v1;
  }
  return v3;
}

unint64_t sub_212768A9C()
{
  return sub_212768AB0();
}

unint64_t sub_212768AB0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B58938;
  if (!qword_254B58938)
  {
    v0 = type metadata accessor for URLResourceKey();
    v1 = MEMORY[0x212BF3218](&unk_2127A2F90, v0);
    atomic_store(v1, (unint64_t *)&qword_254B58938);
    return v1;
  }
  return v3;
}

unint64_t sub_212768B20()
{
  return sub_212768B34();
}

unint64_t sub_212768B34()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B58940;
  if (!qword_254B58940)
  {
    v0 = type metadata accessor for DocumentAttributeKey();
    v1 = MEMORY[0x212BF3218](&unk_2127A30CC, v0);
    atomic_store(v1, (unint64_t *)&qword_254B58940);
    return v1;
  }
  return v3;
}

unint64_t sub_212768BA4()
{
  return sub_212768BB8();
}

unint64_t sub_212768BB8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B58948;
  if (!qword_254B58948)
  {
    v0 = type metadata accessor for DocumentAttributeKey();
    v1 = MEMORY[0x212BF3218](&unk_2127A30A4, v0);
    atomic_store(v1, (unint64_t *)&qword_254B58948);
    return v1;
  }
  return v3;
}

unint64_t sub_212768C28()
{
  return sub_212768C3C();
}

unint64_t sub_212768C3C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B58950;
  if (!qword_254B58950)
  {
    v0 = type metadata accessor for DocumentType();
    v1 = MEMORY[0x212BF3218](&unk_2127A31CC, v0);
    atomic_store(v1, (unint64_t *)&qword_254B58950);
    return v1;
  }
  return v3;
}

unint64_t sub_212768CAC()
{
  return sub_212768CC0();
}

unint64_t sub_212768CC0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B58958;
  if (!qword_254B58958)
  {
    v0 = type metadata accessor for DocumentType();
    v1 = MEMORY[0x212BF3218](&unk_2127A31A4, v0);
    atomic_store(v1, (unint64_t *)&qword_254B58958);
    return v1;
  }
  return v3;
}

unint64_t sub_212768D30()
{
  return sub_212768D44();
}

unint64_t sub_212768D44()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B58960;
  if (!qword_254B58960)
  {
    v0 = type metadata accessor for DocumentType();
    v1 = MEMORY[0x212BF3218](&unk_2127A3234, v0);
    atomic_store(v1, (unint64_t *)&qword_254B58960);
    return v1;
  }
  return v3;
}

unint64_t sub_212768DB4()
{
  return sub_212768DC8();
}

unint64_t sub_212768DC8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B58968;
  if (!qword_254B58968)
  {
    v0 = type metadata accessor for DocumentAttributeKey();
    v1 = MEMORY[0x212BF3218](&unk_2127A3134, v0);
    atomic_store(v1, (unint64_t *)&qword_254B58968);
    return v1;
  }
  return v3;
}

unint64_t sub_212768E38()
{
  return sub_212768E4C();
}

unint64_t sub_212768E4C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B58970;
  if (!qword_254B58970)
  {
    v0 = type metadata accessor for URLResourceKey();
    v1 = MEMORY[0x212BF3218](&unk_2127A302C, v0);
    atomic_store(v1, (unint64_t *)&qword_254B58970);
    return v1;
  }
  return v3;
}

unint64_t sub_212768EBC()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B58978;
  if (!qword_254B58978)
  {
    v0 = type metadata accessor for URLResourceKey();
    v1 = MEMORY[0x212BF3218](&unk_2127A2FF8, v0);
    atomic_store(v1, (unint64_t *)&qword_254B58978);
    return v1;
  }
  return v3;
}

unint64_t sub_212768F2C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B58980;
  if (!qword_254B58980)
  {
    v0 = type metadata accessor for DocumentAttributeKey();
    v1 = MEMORY[0x212BF3218](&unk_2127A3104, v0);
    atomic_store(v1, (unint64_t *)&qword_254B58980);
    return v1;
  }
  return v3;
}

unint64_t sub_212768F9C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B58988;
  if (!qword_254B58988)
  {
    v0 = type metadata accessor for DocumentType();
    v1 = MEMORY[0x212BF3218](&unk_2127A3204, v0);
    atomic_store(v1, (unint64_t *)&qword_254B58988);
    return v1;
  }
  return v3;
}

unint64_t sub_21276900C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_254B58990;
  if (!qword_254B58990)
  {
    v0 = MEMORY[0x212BF3218](MEMORY[0x24BDCFB40], MEMORY[0x24BEE0D00]);
    atomic_store(v0, (unint64_t *)&qword_254B58990);
    return v0;
  }
  return v2;
}

unint64_t sub_212769074()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B58998;
  if (!qword_254B58998)
  {
    v0 = type metadata accessor for DocumentType();
    v1 = MEMORY[0x212BF3218](&unk_2127A325C, v0);
    atomic_store(v1, (unint64_t *)&qword_254B58998);
    return v1;
  }
  return v3;
}

unint64_t sub_2127690E4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B589A0;
  if (!qword_254B589A0)
  {
    v0 = type metadata accessor for DocumentAttributeKey();
    v1 = MEMORY[0x212BF3218](&unk_2127A332C, v0);
    atomic_store(v1, (unint64_t *)&qword_254B589A0);
    return v1;
  }
  return v3;
}

unint64_t sub_212769154()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B58FB0;
  if (!qword_254B58FB0)
  {
    v0 = type metadata accessor for URLResourceKey();
    v1 = MEMORY[0x212BF3218](&unk_2127A336C, v0);
    atomic_store(v1, (unint64_t *)&qword_254B58FB0);
    return v1;
  }
  return v3;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  int v2;

  v2 = *(_DWORD *)(*(_QWORD *)(a2 - 8) + 80);
  if ((v2 & 0x20000) != 0)
    return (_QWORD *)(*result + ((v2 + 16) & ~(unint64_t)v2));
  return result;
}

uint64_t sub_212769218(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

uint64_t _swift_stdlib_has_malloc_size()
{
  return 1;
}

size_t _swift_stdlib_malloc_size(const void *a1)
{
  return malloc_size(a1);
}

uint64_t sub_21276928C(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_21279DED0();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return a1;
}

unint64_t sub_2127692FC()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B589C0;
  if (!qword_254B589C0)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B589B8);
    v1 = MEMORY[0x212BF3218](MEMORY[0x24BEE12E0], v0);
    atomic_store(v1, (unint64_t *)&qword_254B589C0);
    return v1;
  }
  return v3;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *a1;
  if (*a1 < 0)
  {
    v2 = MEMORY[0x212BF320C](255, (char *)a1 + (int)*a1, -(*a1 >> 32), 0);
    *a1 = v2;
    return v2;
  }
  return v4;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_2127693E0()
{
  swift_bridgeObjectRelease();
}

unint64_t sub_212769408()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B589D0;
  if (!qword_254B589D0)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B589B8);
    v1 = MEMORY[0x212BF3218](MEMORY[0x24BEE12B0], v0);
    atomic_store(v1, (unint64_t *)&qword_254B589D0);
    return v1;
  }
  return v3;
}

unint64_t sub_212769478()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B589D8;
  if (!qword_254B589D8)
  {
    v0 = sub_21279E0BC();
    v1 = MEMORY[0x212BF3218](MEMORY[0x24BEE6DE8], v0);
    atomic_store(v1, (unint64_t *)&qword_254B589D8);
    return v1;
  }
  return v3;
}

unint64_t sub_2127694E8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B589E0;
  if (!qword_254B589E0)
  {
    v0 = sub_21279E0D4();
    v1 = MEMORY[0x212BF3218](MEMORY[0x24BEE6E20], v0);
    atomic_store(v1, (unint64_t *)&qword_254B589E0);
    return v1;
  }
  return v3;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x212BF31AC](a1, v6, a5);
}

uint64_t SFRemoteAlertPresentationRequest.id.getter()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t SFRemoteAlertPresentationRequest.id.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  swift_bridgeObjectRetain();
  *v2 = a1;
  v2[1] = a2;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void (*SFRemoteAlertPresentationRequest.id.modify())()
{
  return sub_212769664;
}

void *SFRemoteAlertPresentationRequest.viewControllerToPresent.getter()
{
  uint64_t v0;
  id v1;
  void *v3;

  v3 = *(void **)(v0 + 16);
  v1 = v3;
  return v3;
}

void SFRemoteAlertPresentationRequest.viewControllerToPresent.setter(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v2 = a1;
  v3 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = a1;

}

void (*SFRemoteAlertPresentationRequest.viewControllerToPresent.modify())()
{
  return sub_212769664;
}

uint64_t SFRemoteAlertPresentationRequest.animated.getter()
{
  uint64_t v0;

  return *(_BYTE *)(v0 + 24) & 1;
}

uint64_t SFRemoteAlertPresentationRequest.animated.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 24) = result & 1;
  return result;
}

void (*SFRemoteAlertPresentationRequest.animated.modify())()
{
  return sub_212769664;
}

uint64_t SFRemoteAlertPresentationRequest.contentOverlaysStatusBar.getter()
{
  uint64_t v0;

  return *(_BYTE *)(v0 + 25) & 1;
}

uint64_t SFRemoteAlertPresentationRequest.contentOverlaysStatusBar.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 25) = result & 1;
  return result;
}

void (*SFRemoteAlertPresentationRequest.contentOverlaysStatusBar.modify())()
{
  return sub_212769664;
}

uint64_t SFRemoteAlertPresentationRequest.supportedInterfaceOrientations.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t SFRemoteAlertPresentationRequest.supportedInterfaceOrientations.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = result;
  return result;
}

void (*SFRemoteAlertPresentationRequest.supportedInterfaceOrientations.modify())()
{
  return sub_212769664;
}

uint64_t SFRemoteAlertPresentationRequest.hideViewController.getter()
{
  uint64_t v0;

  return *(_BYTE *)(v0 + 40) & 1;
}

uint64_t SFRemoteAlertPresentationRequest.hideViewController.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 40) = result & 1;
  return result;
}

void (*SFRemoteAlertPresentationRequest.hideViewController.modify())()
{
  return sub_212769664;
}

uint64_t sub_2127698BC()
{
  uint64_t v0;
  unint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = sub_21279D9C0();
  v3 = *(_QWORD *)(v5 - 8);
  v2 = (*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v5);
  v4 = (char *)&v2 - v2;
  sub_21279D9B4();
  v6 = sub_21279D9A8();
  v7 = v0;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v4, v5);
  return v6;
}

uint64_t sub_21276995C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, char a5@<W4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t a8@<X8>)
{
  *(_QWORD *)a8 = result;
  *(_QWORD *)(a8 + 8) = a2;
  *(_QWORD *)(a8 + 16) = a3;
  *(_BYTE *)(a8 + 24) = a4 & 1;
  *(_BYTE *)(a8 + 25) = a5 & 1;
  *(_QWORD *)(a8 + 32) = a6;
  *(_BYTE *)(a8 + 40) = a7 & 1;
  return result;
}

uint64_t sub_212769990@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  id v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  id v6;
  char v7;
  char v8;
  uint64_t v9;
  char v10;

  swift_beginAccess();
  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(id *)(v1 + 32);
  v7 = *(_BYTE *)(v1 + 40);
  v8 = *(_BYTE *)(v1 + 41);
  v9 = *(_QWORD *)(v1 + 48);
  v10 = *(_BYTE *)(v1 + 56);
  swift_bridgeObjectRetain();
  v2 = v6;
  result = swift_endAccess();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 24) = v7 & 1;
  *(_BYTE *)(a1 + 25) = v8 & 1;
  *(_QWORD *)(a1 + 32) = v9;
  *(_BYTE *)(a1 + 40) = v10 & 1;
  return result;
}

void sub_212769A6C(uint64_t a1)
{
  uint64_t v1;
  id v2;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  char v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD __b[6];

  memset(__b, 0, 0x29uLL);
  v10 = *(_QWORD *)(a1 + 8);
  v11 = *(id *)(a1 + 16);
  v5 = *(_BYTE *)(a1 + 24);
  v6 = *(_BYTE *)(a1 + 25);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_BYTE *)(a1 + 40);
  __b[0] = *(_QWORD *)a1;
  v4 = __b[0];
  __b[1] = v10;
  __b[2] = v11;
  LOBYTE(__b[3]) = v5 & 1;
  BYTE1(__b[3]) = v6 & 1;
  __b[4] = v7;
  LOBYTE(__b[5]) = v8 & 1;
  swift_bridgeObjectRetain();
  v2 = v11;
  swift_beginAccess();
  v9 = *(id *)(v1 + 32);
  *(_QWORD *)(v1 + 16) = v4;
  *(_QWORD *)(v1 + 24) = v10;
  *(_QWORD *)(v1 + 32) = v11;
  *(_BYTE *)(v1 + 40) = v5 & 1;
  *(_BYTE *)(v1 + 41) = v6 & 1;
  *(_QWORD *)(v1 + 48) = v7;
  *(_BYTE *)(v1 + 56) = v8 & 1;
  swift_bridgeObjectRelease();

  swift_endAccess();
  swift_bridgeObjectRelease();

}

uint64_t (*sub_212769BB4())()
{
  swift_beginAccess();
  return sub_212761DAC;
}

void *sub_212769BFC()
{
  uint64_t v0;
  id v1;
  void *v3;

  swift_beginAccess();
  v3 = *(void **)(v0 + 64);
  v1 = v3;
  swift_endAccess();
  return v3;
}

void sub_212769C54(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v2 = a1;
  swift_beginAccess();
  v3 = *(void **)(v1 + 64);
  *(_QWORD *)(v1 + 64) = a1;

  swift_endAccess();
}

uint64_t (*sub_212769CC8())()
{
  swift_beginAccess();
  return sub_212761DAC;
}

uint64_t sub_212769D10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v2;

  result = SFRemoteAlertPresentationRequest.id.getter();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_212769D3C@<X0>(uint64_t (**a1)()@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v4)();
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  swift_retain();
  v7 = sub_212769F54();
  v8 = v1;
  if (v7)
  {
    v2 = swift_allocObject();
    *(_QWORD *)(v2 + 16) = v7;
    *(_QWORD *)(v2 + 24) = v8;
    v4 = sub_212767488;
    v5 = v2;
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  *a1 = v4;
  a1[1] = (uint64_t (*)())v5;
  return swift_release();
}

uint64_t sub_212769E3C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t (*v3)();
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[2];

  sub_212770014(a1, v7);
  v5 = v7[0];
  v6 = v7[1];
  if (v7[0])
  {
    v1 = swift_allocObject();
    *(_QWORD *)(v1 + 16) = v5;
    *(_QWORD *)(v1 + 24) = v6;
    v3 = sub_212767488;
    v4 = v1;
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  swift_retain();
  sub_212769FF0((uint64_t)v3, v4);
  return swift_release();
}

uint64_t sub_212769F54()
{
  uint64_t v0;
  uint64_t v2;

  swift_beginAccess();
  v2 = *(_QWORD *)(v0 + 72);
  sub_212769FB8(v2);
  swift_endAccess();
  return v2;
}

uint64_t sub_212769FB8(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_212769FF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  sub_212769FB8(a1);
  swift_beginAccess();
  v3 = *(_QWORD *)(v2 + 72);
  *(_QWORD *)(v2 + 72) = a1;
  *(_QWORD *)(v2 + 80) = a2;
  sub_21276A07C(v3);
  swift_endAccess();
  return sub_21276A07C(a1);
}

uint64_t sub_21276A07C(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t (*sub_21276A0B4())()
{
  swift_beginAccess();
  return sub_212761DAC;
}

uint64_t sub_21276A0FC@<X0>(uint64_t (**a1)()@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v4)();
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  swift_retain();
  v7 = sub_21276A314();
  v8 = v1;
  if (v7)
  {
    v2 = swift_allocObject();
    *(_QWORD *)(v2 + 16) = v7;
    *(_QWORD *)(v2 + 24) = v8;
    v4 = sub_212767488;
    v5 = v2;
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  *a1 = v4;
  a1[1] = (uint64_t (*)())v5;
  return swift_release();
}

uint64_t sub_21276A1FC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t (*v3)();
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[2];

  sub_212770014(a1, v7);
  v5 = v7[0];
  v6 = v7[1];
  if (v7[0])
  {
    v1 = swift_allocObject();
    *(_QWORD *)(v1 + 16) = v5;
    *(_QWORD *)(v1 + 24) = v6;
    v3 = sub_212767488;
    v4 = v1;
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  swift_retain();
  sub_21276A378((uint64_t)v3, v4);
  return swift_release();
}

uint64_t sub_21276A314()
{
  uint64_t v0;
  uint64_t v2;

  swift_beginAccess();
  v2 = *(_QWORD *)(v0 + 88);
  sub_212769FB8(v2);
  swift_endAccess();
  return v2;
}

uint64_t sub_21276A378(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  sub_212769FB8(a1);
  swift_beginAccess();
  v3 = *(_QWORD *)(v2 + 88);
  *(_QWORD *)(v2 + 88) = a1;
  *(_QWORD *)(v2 + 96) = a2;
  sub_21276A07C(v3);
  swift_endAccess();
  return sub_21276A07C(a1);
}

uint64_t (*sub_21276A404())()
{
  swift_beginAccess();
  return sub_212761DAC;
}

uint64_t sub_21276A44C(unsigned int a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  _QWORD *v4;
  void (*v5)(_QWORD *);
  char v6;
  uint64_t v7;
  char v9;
  _QWORD v10[2];
  uint64_t v11;
  char v12;

  v12 = a1 & 1;
  v11 = v1;
  swift_beginAccess();
  v9 = *(_BYTE *)(v1 + 104);
  swift_endAccess();
  result = a1;
  if ((a1 & 1) != (v9 & 1))
  {
    swift_beginAccess();
    v6 = *(_BYTE *)(v7 + 104);
    result = swift_endAccess();
    if ((v6 & 1) != 0)
    {
      v10[0] = sub_21276A314();
      v10[1] = v3;
      if (v10[0])
      {
        v5 = (void (*)(_QWORD *))v10[0];
        swift_retain();
        v4 = sub_21276A5A8(v10);
        v5(v4);
        swift_release();
      }
      else
      {
        sub_21276A5A8(v10);
      }
      return sub_21276A378(0, 0);
    }
  }
  return result;
}

_QWORD *sub_21276A5A8(_QWORD *a1)
{
  if (*a1)
    swift_release();
  return a1;
}

uint64_t sub_21276A5EC()
{
  uint64_t v0;
  char v2;

  swift_beginAccess();
  v2 = *(_BYTE *)(v0 + 104);
  swift_endAccess();
  return v2 & 1;
}

uint64_t sub_21276A644(char a1)
{
  uint64_t v1;
  char v4;

  swift_beginAccess();
  v4 = *(_BYTE *)(v1 + 104);
  swift_endAccess();
  swift_beginAccess();
  *(_BYTE *)(v1 + 104) = a1 & 1;
  swift_endAccess();
  return sub_21276A44C(v4 & 1);
}

void (*sub_21276A6F4(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  char v4;
  _QWORD *v5;

  v5 = malloc(0x28uLL);
  *a1 = v5;
  v5[3] = v1;
  swift_beginAccess();
  v4 = *(_BYTE *)(v1 + 104);
  swift_endAccess();
  *((_BYTE *)v5 + 32) = v4 & 1;
  return sub_21276A784;
}

void sub_21276A784(uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  sub_21276A644(*(_BYTE *)(*(_QWORD *)a1 + 32) & 1);
  free(v1);
}

uint64_t sub_21276A7EC()
{
  uint64_t v0;
  char v2;

  swift_beginAccess();
  v2 = *(_BYTE *)(v0 + 105);
  swift_endAccess();
  return v2 & 1;
}

uint64_t sub_21276A844(char a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_BYTE *)(v1 + 105) = a1 & 1;
  return swift_endAccess();
}

uint64_t (*sub_21276A8B8())()
{
  swift_beginAccess();
  return sub_212761DAC;
}

uint64_t sub_21276A900(uint64_t a1, void *a2)
{
  swift_allocObject();
  return sub_21276A950(a1, a2);
}

uint64_t sub_21276A950(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD __b[6];

  memset(__b, 0, 0x29uLL);
  v13 = *(_QWORD *)(a1 + 8);
  v14 = *(id *)(a1 + 16);
  v8 = *(_BYTE *)(a1 + 24);
  v9 = *(_BYTE *)(a1 + 25);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_BYTE *)(a1 + 40);
  __b[0] = *(_QWORD *)a1;
  v7 = __b[0];
  __b[1] = v13;
  __b[2] = v14;
  LOBYTE(__b[3]) = v8 & 1;
  BYTE1(__b[3]) = v9 & 1;
  __b[4] = v10;
  LOBYTE(__b[5]) = v11 & 1;
  *(_QWORD *)(v2 + 72) = 0;
  *(_QWORD *)(v2 + 80) = 0;
  *(_QWORD *)(v2 + 88) = 0;
  *(_QWORD *)(v2 + 96) = 0;
  *(_BYTE *)(v2 + 104) = 0;
  *(_BYTE *)(v2 + 105) = 0;
  swift_bridgeObjectRetain();
  v3 = v14;
  *(_QWORD *)(v2 + 16) = v7;
  *(_QWORD *)(v2 + 24) = v13;
  *(_QWORD *)(v2 + 32) = v14;
  *(_BYTE *)(v2 + 40) = v8 & 1;
  *(_BYTE *)(v2 + 41) = v9 & 1;
  *(_QWORD *)(v2 + 48) = v10;
  *(_BYTE *)(v2 + 56) = v11 & 1;
  v4 = a2;
  *(_QWORD *)(v2 + 64) = a2;

  swift_bridgeObjectRelease();
  return v15;
}

void sub_21276AAA4(unsigned int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  id v41[3];
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE **v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t v48;
  uint32_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  NSObject *v59;
  int v60;
  void *v61;
  _BOOL4 v62;
  _BOOL4 v63;
  uint64_t v64;
  void (*v65)(char *, uint64_t);
  _BYTE *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint8_t *v72;
  uint64_t v73;
  uint64_t v74;
  _BYTE **v75;
  uint64_t *v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unsigned int v82;
  unint64_t v83;
  uint64_t v84;
  char *v85;
  unint64_t v86;
  char *v87;
  _QWORD *v88;
  uint64_t v89;
  void (*v90)(char *, uint64_t, uint64_t);
  unint64_t v91;
  unint64_t v92;
  uint64_t *v93;
  unint64_t v94;
  uint64_t v95;
  uint32_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  _QWORD *v105;
  uint64_t v106;
  NSObject *v107;
  int v108;
  uint64_t (*v109)(uint64_t, uint64_t, uint64_t);
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  _BYTE *v113;
  uint64_t aBlock;
  int v115;
  int v116;
  uint64_t (*v117)(uint64_t);
  void *v118;
  uint64_t (*v119)();
  uint64_t v120;
  uint64_t (*v121)(uint64_t, uint64_t, uint64_t);
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  _BYTE *v125[2];
  uint32_t v126;
  id v127;
  id v128;
  _BYTE v129[16];
  id v130;
  uint64_t v131;
  uint32_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  char v136;

  v82 = a1;
  v81 = a2;
  v80 = a3;
  v136 = 0;
  v134 = 0;
  v135 = 0;
  v133 = 0;
  v128 = 0;
  v79 = 0;
  v89 = sub_21279DABC();
  v88 = *(_QWORD **)(v89 - 8);
  v84 = v88[8];
  v83 = (v84 + 15) & 0xFFFFFFFFFFFFFFF0;
  v3 = MEMORY[0x24BDAC7A8](v82);
  v85 = (char *)v41 - v83;
  v86 = v83;
  v4 = MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v41 - v86;
  v87 = (char *)v41 - v86;
  v136 = v4 & 1;
  v134 = v6;
  v135 = v7;
  v133 = v8;
  v9 = sub_212770244();
  v90 = (void (*)(char *, uint64_t, uint64_t))v88[2];
  v90(v5, v9, v89);
  swift_retain();
  v107 = sub_21279DAA4();
  v108 = sub_21279DF78();
  v93 = &v131;
  v131 = 12;
  v91 = sub_212766204();
  v92 = sub_21276626C();
  v94 = sub_2127662D4();
  sub_21279DE28();
  v10 = v95;
  v96 = v132;
  v97 = 17;
  v99 = 7;
  v101 = swift_allocObject();
  *(_BYTE *)(v101 + 16) = 32;
  v102 = swift_allocObject();
  *(_BYTE *)(v102 + 16) = 8;
  v98 = 32;
  v11 = swift_allocObject();
  v100 = v11;
  *(_QWORD *)(v11 + 16) = sub_21276B608;
  *(_QWORD *)(v11 + 24) = v10;
  v12 = swift_allocObject();
  v13 = v100;
  v104 = v12;
  *(_QWORD *)(v12 + 16) = sub_212767488;
  *(_QWORD *)(v12 + 24) = v13;
  v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E0);
  v103 = sub_21279E1F4();
  v105 = v14;
  swift_retain();
  v15 = v101;
  v16 = v105;
  *v105 = sub_21276741C;
  v16[1] = v15;
  swift_retain();
  v17 = v102;
  v18 = v105;
  v105[2] = sub_21276741C;
  v18[3] = v17;
  swift_retain();
  v19 = v104;
  v20 = v105;
  v105[4] = sub_2127674D0;
  v20[5] = v19;
  sub_212761414();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v107, (os_log_type_t)v108))
  {
    v21 = v79;
    v72 = (uint8_t *)sub_21279DFE4();
    v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E8);
    v73 = sub_21276633C(0);
    v74 = sub_21276633C(1);
    v75 = &v113;
    v113 = v72;
    v76 = &v112;
    v112 = v73;
    v77 = &v111;
    v111 = v74;
    sub_212766394(2, &v113);
    sub_212766394(1, v75);
    v109 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
    v110 = v101;
    sub_2127663A8(&v109, (uint64_t)v75, (uint64_t)v76, (uint64_t)v77);
    v78 = v21;
    if (v21)
    {
      __break(1u);
    }
    else
    {
      v109 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
      v110 = v102;
      sub_2127663A8(&v109, (uint64_t)&v113, (uint64_t)&v112, (uint64_t)&v111);
      v69 = 0;
      v23 = v69;
      v109 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2127674D0;
      v110 = v104;
      sub_2127663A8(&v109, (uint64_t)&v113, (uint64_t)&v112, (uint64_t)&v111);
      v68 = v23;
      _os_log_impl(&dword_212728000, v107, (os_log_type_t)v108, "Received request to dismiss remote alert with ID: %s", v72, v96);
      sub_2127663EC(v73);
      sub_2127663EC(v74);
      sub_21279DFCC();
      swift_release();
      swift_release();
      swift_release();
      v70 = v68;
    }
  }
  else
  {
    v22 = v79;
    swift_release();
    swift_release();
    swift_release();
    v70 = v22;
  }
  v64 = v70;

  v65 = (void (*)(char *, uint64_t))v88[1];
  v65(v87, v89);
  v66 = v129;
  sub_212769990((uint64_t)v129);
  v67 = v130;
  v24 = v130;
  sub_21276ED24((uint64_t)v66);
  v128 = v67;
  v127 = objc_msgSend(v67, sel_presentingViewController);
  v63 = v127 != 0;
  v62 = v63;
  sub_21276ED58(&v127);
  if (v62)
  {
    if ((sub_21276A7EC() & 1) == 0)
    {
      sub_21276A844(1);
      sub_212769FB8(v81);
      v25 = swift_allocObject();
      v26 = v80;
      *(_QWORD *)(v25 + 16) = v81;
      *(_QWORD *)(v25 + 24) = v26;
      v119 = sub_21276EEA0;
      v120 = v25;
      aBlock = MEMORY[0x24BDAC760];
      v115 = 1107296256;
      v116 = 0;
      v117 = sub_21276B694;
      v118 = &block_descriptor;
      v61 = _Block_copy(&aBlock);
      swift_release();
      objc_msgSend(v67, sel_dismissViewControllerAnimated_completion_, v82 & 1, v61);
      _Block_release(v61);
    }

  }
  else
  {
    v27 = v85;
    v28 = sub_212770244();
    v90(v27, v28, v89);
    swift_retain();
    v59 = sub_21279DAA4();
    v60 = sub_21279DF78();
    v125[1] = (_BYTE *)12;
    sub_21279DE28();
    v49 = v126;
    v50 = 17;
    v52 = 7;
    v54 = swift_allocObject();
    *(_BYTE *)(v54 + 16) = 32;
    v55 = swift_allocObject();
    *(_BYTE *)(v55 + 16) = 8;
    v51 = 32;
    v29 = swift_allocObject();
    v30 = v95;
    v53 = v29;
    *(_QWORD *)(v29 + 16) = sub_21276B608;
    *(_QWORD *)(v29 + 24) = v30;
    v31 = swift_allocObject();
    v32 = v53;
    v57 = v31;
    *(_QWORD *)(v31 + 16) = sub_212767488;
    *(_QWORD *)(v31 + 24) = v32;
    v56 = sub_21279E1F4();
    v58 = v33;
    swift_retain();
    v34 = v54;
    v35 = v58;
    *v58 = sub_21276741C;
    v35[1] = v34;
    swift_retain();
    v36 = v55;
    v37 = v58;
    v58[2] = sub_21276741C;
    v37[3] = v36;
    swift_retain();
    v38 = v57;
    v39 = v58;
    v58[4] = sub_2127674D0;
    v39[5] = v38;
    sub_212761414();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v59, (os_log_type_t)v60))
    {
      v40 = v64;
      v42 = (uint8_t *)sub_21279DFE4();
      v41[2] = (id)__swift_instantiateConcreteTypeFromMangledName(&qword_254B586E8);
      v43 = sub_21276633C(0);
      v44 = sub_21276633C(1);
      v45 = v125;
      v125[0] = v42;
      v46 = &v124;
      v124 = v43;
      v47 = &v123;
      v123 = v44;
      sub_212766394(2, v125);
      sub_212766394(1, v45);
      v121 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
      v122 = v54;
      sub_2127663A8(&v121, (uint64_t)v45, (uint64_t)v46, (uint64_t)v47);
      v48 = v40;
      if (v40)
      {
        __break(1u);
      }
      else
      {
        v121 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
        v122 = v55;
        sub_2127663A8(&v121, (uint64_t)v125, (uint64_t)&v124, (uint64_t)&v123);
        v41[1] = 0;
        v121 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2127674D0;
        v122 = v57;
        sub_2127663A8(&v121, (uint64_t)v125, (uint64_t)&v124, (uint64_t)&v123);
        _os_log_impl(&dword_212728000, v59, (os_log_type_t)v60, "Invalidating handle for remote alert which is not yet presented with ID: %s", v42, v49);
        sub_2127663EC(v43);
        sub_2127663EC(v44);
        sub_21279DFCC();
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }

    v65(v85, v89);
    v41[0] = sub_212769BFC();
    objc_msgSend(v41[0], sel_invalidate);

  }
}

uint64_t sub_21276B5A8()
{
  id v1;
  uint64_t v2;
  _QWORD v3[6];

  sub_212769990((uint64_t)v3);
  v2 = v3[0];
  v1 = (id)v3[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();

  return v2;
}

uint64_t sub_21276B608()
{
  return sub_21276B5A8();
}

uint64_t sub_21276B610(void (*a1)(void))
{
  uint64_t result;

  sub_212769FB8((uint64_t)a1);
  result = (uint64_t)a1;
  if (a1)
  {
    a1();
    return swift_release();
  }
  return result;
}

uint64_t sub_21276B694(uint64_t a1)
{
  uint64_t v1;
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  v1 = swift_retain();
  v3(v1);
  return swift_release();
}

uint64_t SFRemoteAlertPresentationHandle.deinit()
{
  uint64_t v0;
  uint64_t v2;

  sub_21276ED24(v0 + 16);

  sub_21276A5A8((_QWORD *)(v0 + 72));
  sub_21276A5A8((_QWORD *)(v0 + 88));
  return v2;
}

uint64_t SFRemoteAlertPresentationHandle.__deallocating_deinit()
{
  SFRemoteAlertPresentationHandle.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_21276B764()
{
  id v0;

  v0 = (id)*sub_21276B7B0();
  return swift_dynamicCastClassUnconditional();
}

uint64_t *sub_21276B7B0()
{
  if (qword_254B58620 != -1)
    swift_once();
  return &qword_254B58B70;
}

uint64_t sub_21276B804()
{
  uint64_t v0;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC9SharingUI32SFRemoteAlertPresentationManager_remoteAlertPresentationHandlesByID);
  swift_beginAccess();
  v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_21276B868(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  swift_bridgeObjectRetain();
  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC9SharingUI32SFRemoteAlertPresentationManager_remoteAlertPresentationHandlesByID);
  swift_beginAccess();
  *v3 = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_21276B8E8())()
{
  swift_beginAccess();
  return sub_212761DAC;
}

uint64_t sub_21276B938(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  const void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  uint64_t *v49;
  uint64_t *v50;
  _BYTE **v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t v54;
  uint32_t v55;
  int v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  __int128 v66;
  id v67;
  _OWORD *v68;
  id v69;
  _BYTE *v70;
  uint64_t v71;
  __int128 *v72;
  uint64_t *v73;
  uint64_t *v74;
  uint64_t (*v75)();
  uint64_t v76;
  id v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  void (*v81)(char *, uint64_t);
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint8_t *v92;
  uint64_t v93;
  uint64_t v94;
  unsigned int v95;
  _BYTE **v96;
  uint64_t *v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char *v103;
  unint64_t v104;
  char *v105;
  id v106;
  _QWORD *v107;
  uint64_t v108;
  void (*v109)(char *, uint64_t, uint64_t);
  uint64_t v110;
  _OWORD *v111;
  size_t v112;
  unint64_t v113;
  unint64_t v114;
  uint64_t *v115;
  unint64_t v116;
  uint32_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  int v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  _QWORD *v133;
  uint64_t v134;
  NSObject *v135;
  int v136;
  uint64_t (*v137)(uint64_t, uint64_t, uint64_t);
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  _BYTE *v141;
  uint64_t v142;
  void *v143;
  id v144;
  uint64_t v145;
  __int128 v146;
  uint64_t v147;
  uint64_t v148;
  _BYTE v149[48];
  id v150;
  id v151;
  id v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  _BYTE *v156[2];
  uint32_t v157;
  uint64_t v158;
  uint32_t v159;
  id v160;
  _OWORD __dst[3];
  uint64_t v162;
  __int128 v163;

  v101 = a1;
  v160 = 0;
  v100 = 0;
  v152 = 0;
  v151 = 0;
  v150 = 0;
  v148 = 0;
  v144 = 0;
  v142 = 0;
  v108 = sub_21279DABC();
  v107 = *(_QWORD **)(v108 - 8);
  v102 = (v107[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v108);
  v103 = (char *)&v40 - v102;
  v104 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]((char *)&v40 - v102);
  v2 = (char *)&v40 - v104;
  v105 = (char *)&v40 - v104;
  v111 = __dst;
  v112 = 41;
  memcpy(__dst, v3, 0x29uLL);
  v160 = v106;
  v4 = sub_212770244();
  v109 = (void (*)(char *, uint64_t, uint64_t))v107[2];
  v109(v2, v4, v108);
  sub_21276EF08((uint64_t)v111);
  v110 = 57;
  v123 = 7;
  v118 = swift_allocObject();
  memcpy((void *)(v118 + 16), v111, v112);
  sub_21276EF08((uint64_t)v111);
  v124 = swift_allocObject();
  memcpy((void *)(v124 + 16), v111, v112);
  v135 = sub_21279DAA4();
  v136 = sub_21279DF78();
  v115 = &v158;
  v158 = 22;
  v113 = sub_212766204();
  v114 = sub_21276626C();
  v116 = sub_2127662D4();
  sub_21279DE28();
  v117 = v159;
  v120 = 17;
  v126 = swift_allocObject();
  *(_BYTE *)(v126 + 16) = 32;
  v127 = swift_allocObject();
  v121 = 8;
  *(_BYTE *)(v127 + 16) = 8;
  v122 = 32;
  v5 = swift_allocObject();
  v6 = v118;
  v119 = v5;
  *(_QWORD *)(v5 + 16) = sub_21276EF88;
  *(_QWORD *)(v5 + 24) = v6;
  v7 = swift_allocObject();
  v8 = v119;
  v128 = v7;
  *(_QWORD *)(v7 + 16) = sub_212767488;
  *(_QWORD *)(v7 + 24) = v8;
  v129 = swift_allocObject();
  *(_BYTE *)(v129 + 16) = 64;
  v130 = swift_allocObject();
  *(_BYTE *)(v130 + 16) = v121;
  v9 = swift_allocObject();
  v10 = v124;
  v125 = v9;
  *(_QWORD *)(v9 + 16) = sub_21276EFD4;
  *(_QWORD *)(v9 + 24) = v10;
  v11 = swift_allocObject();
  v12 = v125;
  v132 = v11;
  *(_QWORD *)(v11 + 16) = sub_212767488;
  *(_QWORD *)(v11 + 24) = v12;
  v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E0);
  v131 = sub_21279E1F4();
  v133 = v13;
  swift_retain();
  v14 = v126;
  v15 = v133;
  *v133 = sub_21276741C;
  v15[1] = v14;
  swift_retain();
  v16 = v127;
  v17 = v133;
  v133[2] = sub_21276741C;
  v17[3] = v16;
  swift_retain();
  v18 = v128;
  v19 = v133;
  v133[4] = sub_2127674D0;
  v19[5] = v18;
  swift_retain();
  v20 = v129;
  v21 = v133;
  v133[6] = sub_21276741C;
  v21[7] = v20;
  swift_retain();
  v22 = v130;
  v23 = v133;
  v133[8] = sub_21276741C;
  v23[9] = v22;
  swift_retain();
  v24 = v132;
  v25 = v133;
  v133[10] = sub_21276F2A8;
  v25[11] = v24;
  sub_212761414();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v135, (os_log_type_t)v136))
  {
    v26 = v100;
    v92 = (uint8_t *)sub_21279DFE4();
    v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E8);
    v91 = 1;
    v93 = sub_21276633C(1);
    v94 = sub_21276633C(v91);
    v96 = &v141;
    v141 = v92;
    v97 = &v140;
    v140 = v93;
    v98 = &v139;
    v139 = v94;
    v95 = 2;
    sub_212766394(2, &v141);
    sub_212766394(v95, v96);
    v137 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
    v138 = v126;
    sub_2127663A8(&v137, (uint64_t)v96, (uint64_t)v97, (uint64_t)v98);
    v99 = v26;
    if (v26)
    {
      __break(1u);
    }
    else
    {
      v137 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
      v138 = v127;
      sub_2127663A8(&v137, (uint64_t)&v141, (uint64_t)&v140, (uint64_t)&v139);
      v88 = 0;
      v28 = v88;
      v137 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2127674D0;
      v138 = v128;
      sub_2127663A8(&v137, (uint64_t)&v141, (uint64_t)&v140, (uint64_t)&v139);
      v87 = v28;
      v137 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
      v138 = v129;
      sub_2127663A8(&v137, (uint64_t)&v141, (uint64_t)&v140, (uint64_t)&v139);
      v86 = 0;
      v137 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
      v138 = v130;
      sub_2127663A8(&v137, (uint64_t)&v141, (uint64_t)&v140, (uint64_t)&v139);
      v85 = 0;
      v137 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276F2A8;
      v138 = v132;
      sub_2127663A8(&v137, (uint64_t)&v141, (uint64_t)&v140, (uint64_t)&v139);
      v84 = 0;
      _os_log_impl(&dword_212728000, v135, (os_log_type_t)v136, "Asked to present remote alert using request: %s view controller to present: %@", v92, v117);
      v83 = 1;
      sub_2127663EC(v93);
      sub_2127663EC(v94);
      sub_21279DFCC();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      v89 = v84;
    }
  }
  else
  {
    v27 = v100;
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    v89 = v27;
  }
  v80 = v89;

  v81 = (void (*)(char *, uint64_t))v107[1];
  v81(v105, v108);
  v82 = objc_msgSend((id)objc_opt_self(), sel_identityOfCurrentProcess);
  if (v82)
  {
    v79 = v82;
    v65 = v82;
    v152 = v82;
    v76 = 0;
    sub_21276F350();
    v29 = v65;
    v68 = __dst;
    v66 = __dst[0];
    swift_bridgeObjectRetain();
    v67 = sub_21276C6B4(v65, v66, *((uint64_t *)&v66 + 1));
    v151 = v67;
    v69 = objc_msgSend((id)objc_opt_self(), sel_newHandleWithDefinition_configurationContext_, v67, 0);
    v150 = v69;
    type metadata accessor for SFRemoteAlertPresentationHandle();
    sub_21276EF08((uint64_t)v68);
    v70 = v149;
    memcpy(v149, v68, 0x29uLL);
    v30 = v69;
    v71 = sub_21276A900((uint64_t)v70, v69);
    v148 = v71;
    v163 = __dst[0];
    sub_21276F3D8();
    swift_retain();
    v73 = &v147;
    v147 = v71;
    v72 = &v146;
    v146 = v163;
    v74 = &v145;
    v75 = sub_21276B8E8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B58BA0);
    sub_21279DD14();
    ((void (*)(uint64_t *, _QWORD))v75)(v74, 0);
    sub_21276F400();
    v77 = sub_21276C700();
    v144 = v77;
    v162 = *(_QWORD *)&__dst[2];
    objc_msgSend(v77, sel_setInitialSupportedInterfaceOrientations_, *(_QWORD *)&__dst[2]);
    v31 = v106;
    v143 = &unk_254B8FA50;
    v78 = swift_dynamicCastObjCProtocolConditional();
    if (v78)
    {
      v64 = v78;
    }
    else
    {
      v63 = 0;

      v64 = v63;
    }
    v62 = v64;
    if (v64)
    {
      v61 = v62;
      v60 = v62;
      v142 = v62;
      objc_msgSend(v69, sel_registerObserver_);
      swift_unknownObjectRelease();
    }
    v32 = v77;
    objc_msgSend(v69, sel_activateWithContext_, v77);

    return v71;
  }
  else
  {
    v33 = v103;
    v34 = sub_212770244();
    v109(v33, v34, v108);
    v57 = sub_21279DAA4();
    v56 = sub_21279DF6C();
    v156[1] = (_BYTE *)2;
    sub_21279DE28();
    v55 = v157;
    v58 = sub_21279E1F4();
    if (os_log_type_enabled(v57, (os_log_type_t)v56))
    {
      v35 = v80;
      v45 = (uint8_t *)sub_21279DFE4();
      v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E8);
      v44 = 0;
      v46 = sub_21276633C(0);
      v47 = sub_21276633C(v44);
      v51 = v156;
      v156[0] = v45;
      v52 = &v155;
      v155 = v46;
      v49 = &v154;
      v154 = v47;
      v48 = 0;
      sub_212766394(0, v156);
      sub_212766394(v48, v51);
      v153 = v58;
      v50 = &v40;
      MEMORY[0x24BDAC7A8](&v40);
      v36 = v52;
      v37 = &v40 - 6;
      v53 = &v40 - 6;
      v37[2] = (uint64_t)v51;
      v37[3] = (uint64_t)v36;
      v37[4] = v38;
      v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B58B88);
      sub_21276F2E0();
      sub_21279DE10();
      if (v35)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_212728000, v57, (os_log_type_t)v56, "Failed to get process identity of the current process, dropping request to present view controller", v45, v55);
        v42 = 0;
        sub_2127663EC(v46);
        sub_2127663EC(v47);
        sub_21279DFCC();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v41 = 0;

    v81(v103, v108);
    return v41;
  }
}

uint64_t sub_21276C658(uint64_t *a1)
{
  uint64_t v2;

  v2 = *a1;
  swift_bridgeObjectRetain();
  return v2;
}

void *sub_21276C68C(uint64_t a1)
{
  id v1;
  void *v3;

  v3 = *(void **)(a1 + 16);
  v1 = v3;
  return v3;
}

id sub_21276C6B4(void *a1, uint64_t a2, uint64_t a3)
{
  id v3;

  v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_21276E9FC(a1, a2, a3);
}

id sub_21276C700()
{
  id v0;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_21276EAB8();
}

uint64_t sub_21276C72C(void *a1, char a2, char a3, uint64_t a4, char a5)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v15;
  uint64_t v16;
  _QWORD v17[3];
  __int16 v18;
  uint64_t v19;
  char v20;
  _QWORD __b[6];
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  char v31;
  char v32;
  void *v33;

  memset(__b, 0, 0x29uLL);
  v33 = a1;
  v32 = a2 & 1;
  v31 = a3 & 1;
  v30 = a4;
  v29 = a5 & 1;
  v28 = v5;
  v6 = a1;
  v7 = sub_2127698BC();
  sub_21276995C(v7, v8, (uint64_t)a1, a2 & 1, a3 & 1, a4, a5 & 1, (uint64_t)&v22);
  v15 = v24;
  __b[0] = v22;
  __b[1] = v23;
  __b[2] = v24;
  LOWORD(__b[3]) = v25 & 0x101;
  __b[4] = v26;
  LOBYTE(__b[5]) = v27 & 1;
  v17[0] = v22;
  v17[1] = v23;
  v17[2] = v24;
  v18 = v25 & 0x101;
  v19 = v26;
  v20 = v27 & 1;
  v16 = sub_21276B938((uint64_t)v17);
  swift_bridgeObjectRelease();

  return v16;
}

uint64_t sub_21276C8AC(void *a1, char a2, char a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10;

  v10 = sub_21276C72C(a1, a2 & 1, a3 & 1, a4, a5 & 1);
  swift_retain();
  if (v10)
  {
    sub_212769FB8(a6);
    sub_21276A378(a6, a7);
    swift_release();
  }
  return swift_release();
}

uint64_t sub_21276C9B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[2];
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v12 = a1;
  v13 = a2;
  v11 = v2;
  swift_bridgeObjectRetain();
  v7 = sub_21276B804();
  v9[0] = a1;
  v9[1] = a2;
  v3 = type metadata accessor for SFRemoteAlertPresentationHandle();
  MEMORY[0x212BF1E44](&v10, v9, v7, MEMORY[0x24BEE0D00], v3, MEMORY[0x24BEE0D10]);
  sub_2127677B0();
  v8 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_21276CA68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  char v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v16;
  _QWORD v17[3];
  char v18;
  char v19;
  uint64_t v20;
  char v21;
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v25 = a1;
  v26 = a2;
  v24 = v3;
  swift_bridgeObjectRetain();
  v16 = sub_21276B804();
  v22[0] = a1;
  v22[1] = a2;
  v4 = type metadata accessor for SFRemoteAlertPresentationHandle();
  MEMORY[0x212BF1E44](&v23, v22, v16, MEMORY[0x24BEE0D00], v4, MEMORY[0x24BEE0D10]);
  sub_2127677B0();
  if (v23)
  {
    swift_retain();
    sub_212765788();
    sub_212769990((uint64_t)v17);
    v9 = v17[0];
    v10 = v17[1];
    v11 = v17[2];
    v6 = v18;
    v7 = v19;
    v12 = v20;
    v8 = v21;
    swift_release();
    *(_QWORD *)a3 = v9;
    *(_QWORD *)(a3 + 8) = v10;
    *(_QWORD *)(a3 + 16) = v11;
    *(_QWORD *)(a3 + 24) = v6 & 1 | ((unint64_t)(v7 & 1) << 8);
    *(_QWORD *)(a3 + 32) = v12;
    *(_BYTE *)(a3 + 40) = v8 & 1;
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_212765788();
    result = swift_bridgeObjectRelease();
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)(a3 + 24) = 0;
    *(_QWORD *)(a3 + 32) = 0;
    *(_BYTE *)(a3 + 40) = 0;
  }
  return result;
}

id SFRemoteAlertPresentationManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SFRemoteAlertPresentationManager.init()()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v4;
  char *v5;
  id v6;
  objc_super v7;
  void *v8;

  v1 = v0;
  v8 = v0;
  v4 = OBJC_IVAR____TtC9SharingUI32SFRemoteAlertPresentationManager_remoteAlertPresentationHandlesByID;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B58C10);
  sub_21279E1F4();
  type metadata accessor for SFRemoteAlertPresentationHandle();
  *(_QWORD *)&v5[v4] = sub_21279DCF0();

  v7.receiver = v8;
  v7.super_class = (Class)type metadata accessor for SFRemoteAlertPresentationManager();
  v6 = objc_msgSendSuper2(&v7, sel_init);
  v2 = v6;
  v8 = v6;

  return v6;
}

id SFRemoteAlertPresentationManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SFRemoteAlertPresentationManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21276CDB4(void *a1)
{
  id v1;
  uint64_t v4;

  sub_21276B804();
  type metadata accessor for SFRemoteAlertPresentationHandle();
  sub_21279DCFC();
  v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B58C18);
  sub_21276F4B0();
  sub_21279DDF8();

  sub_2127693E0();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_21276CEA8()
{
  id v1;
  char v2;

  sub_212770180();
  v1 = sub_212769BFC();
  v2 = sub_21279DFB4();

  return v2 & 1;
}

void SFRemoteAlertPresentationManager.remoteAlertHandleDidActivate(_:)(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE **v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t *v36;
  uint32_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  NSObject *v49;
  int v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t, uint64_t);
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _BYTE *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint32_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;

  v63 = a1;
  v77 = 0;
  v76 = 0;
  v75 = 0;
  v74 = 0;
  v70 = 0;
  v71 = 0;
  v58 = 0;
  v59 = sub_21279DABC();
  v60 = *(_QWORD *)(v59 - 8);
  v61 = (*(_QWORD *)(v60 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v62 = (char *)&v18 - v61;
  v77 = MEMORY[0x24BDAC7A8](v63);
  v76 = v1;
  swift_unknownObjectRetain();
  objc_opt_self();
  v64 = swift_dynamicCastObjCClass();
  if (v64)
  {
    v57 = (void *)v64;
  }
  else
  {
    v56 = 0;
    swift_unknownObjectRelease();
    v57 = v56;
  }
  v55 = v57;
  if (v57)
  {
    v54 = v55;
    v52 = v55;
    v75 = v55;
    v53 = sub_21276CDB4(v55);
    if (v53)
    {
      v51 = v53;
      v2 = v62;
      v39 = v53;
      v74 = v53;
      v3 = sub_212770244();
      (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v2, v3, v59);
      swift_retain();
      v49 = sub_21279DAA4();
      v50 = sub_21279DF78();
      v36 = &v72;
      v72 = 12;
      v34 = sub_212766204();
      v35 = sub_21276626C();
      sub_2127662D4();
      sub_21279DE28();
      v37 = v73;
      v38 = 17;
      v41 = 7;
      v43 = swift_allocObject();
      *(_BYTE *)(v43 + 16) = 32;
      v44 = swift_allocObject();
      *(_BYTE *)(v44 + 16) = 8;
      v40 = 32;
      v4 = swift_allocObject();
      v5 = v39;
      v42 = v4;
      *(_QWORD *)(v4 + 16) = sub_21276B608;
      *(_QWORD *)(v4 + 24) = v5;
      v6 = swift_allocObject();
      v7 = v42;
      v46 = v6;
      *(_QWORD *)(v6 + 16) = sub_212767488;
      *(_QWORD *)(v6 + 24) = v7;
      v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E0);
      v45 = sub_21279E1F4();
      v47 = v8;
      swift_retain();
      v9 = v43;
      v10 = v47;
      *v47 = sub_21276741C;
      v10[1] = v9;
      swift_retain();
      v11 = v44;
      v12 = v47;
      v47[2] = sub_21276741C;
      v12[3] = v11;
      swift_retain();
      v13 = v46;
      v14 = v47;
      v47[4] = sub_2127674D0;
      v14[5] = v13;
      sub_212761414();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v49, (os_log_type_t)v50))
      {
        v15 = v58;
        v27 = (uint8_t *)sub_21279DFE4();
        v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E8);
        v28 = sub_21276633C(0);
        v29 = sub_21276633C(1);
        v30 = &v69;
        v69 = v27;
        v31 = &v68;
        v68 = v28;
        v32 = &v67;
        v67 = v29;
        sub_212766394(2, &v69);
        sub_212766394(1, v30);
        v65 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
        v66 = v43;
        sub_2127663A8(&v65, (uint64_t)v30, (uint64_t)v31, (uint64_t)v32);
        v33 = v15;
        if (v15)
        {
          __break(1u);
        }
        else
        {
          v65 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
          v66 = v44;
          sub_2127663A8(&v65, (uint64_t)&v69, (uint64_t)&v68, (uint64_t)&v67);
          v25 = 0;
          v65 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2127674D0;
          v66 = v46;
          sub_2127663A8(&v65, (uint64_t)&v69, (uint64_t)&v68, (uint64_t)&v67);
          _os_log_impl(&dword_212728000, v49, (os_log_type_t)v50, "SFRemoteAlertPresentationManager did activate alert for request: %s", v27, v37);
          sub_2127663EC(v28);
          sub_2127663EC(v29);
          sub_21279DFCC();
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v60 + 8))(v62, v59);
      v23 = sub_212769F54();
      v24 = v16;
      if (v23)
      {
        v21 = v23;
        v22 = v24;
        v20 = v24;
        v19 = (void (*)(uint64_t))v23;
        v70 = v23;
        v71 = v24;
        v17 = swift_retain();
        v19(v17);
        swift_release();
        swift_release();
      }
      swift_release();

    }
    else
    {

    }
  }
}

void SFRemoteAlertPresentationManager.remoteAlertHandleDidDeactivate(_:)(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD v16[4];
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE **v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t *v26;
  uint32_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  NSObject *v39;
  int v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t, uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _BYTE *v59;
  uint64_t v60;
  uint32_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;

  v53 = a1;
  v65 = 0;
  v64 = 0;
  v63 = 0;
  v62 = 0;
  v48 = 0;
  v49 = sub_21279DABC();
  v50 = *(_QWORD *)(v49 - 8);
  v51 = (*(_QWORD *)(v50 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v52 = (char *)v16 - v51;
  v65 = MEMORY[0x24BDAC7A8](v53);
  v64 = v1;
  swift_unknownObjectRetain();
  objc_opt_self();
  v54 = swift_dynamicCastObjCClass();
  if (v54)
  {
    v47 = (void *)v54;
  }
  else
  {
    v46 = 0;
    swift_unknownObjectRelease();
    v47 = v46;
  }
  v45 = v47;
  if (v47)
  {
    v44 = v45;
    v42 = v45;
    v63 = v45;
    v43 = sub_21276CDB4(v45);
    if (v43)
    {
      v41 = v43;
      v2 = v52;
      v29 = v43;
      v62 = v43;
      v3 = sub_212770244();
      (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v2, v3, v49);
      swift_retain();
      v39 = sub_21279DAA4();
      v40 = sub_21279DF78();
      v26 = &v60;
      v60 = 12;
      v24 = sub_212766204();
      v25 = sub_21276626C();
      sub_2127662D4();
      sub_21279DE28();
      v27 = v61;
      v28 = 17;
      v31 = 7;
      v33 = swift_allocObject();
      *(_BYTE *)(v33 + 16) = 32;
      v34 = swift_allocObject();
      *(_BYTE *)(v34 + 16) = 8;
      v30 = 32;
      v4 = swift_allocObject();
      v5 = v29;
      v32 = v4;
      *(_QWORD *)(v4 + 16) = sub_21276B608;
      *(_QWORD *)(v4 + 24) = v5;
      v6 = swift_allocObject();
      v7 = v32;
      v36 = v6;
      *(_QWORD *)(v6 + 16) = sub_212767488;
      *(_QWORD *)(v6 + 24) = v7;
      v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E0);
      v35 = sub_21279E1F4();
      v37 = v8;
      swift_retain();
      v9 = v33;
      v10 = v37;
      *v37 = sub_21276741C;
      v10[1] = v9;
      swift_retain();
      v11 = v34;
      v12 = v37;
      v37[2] = sub_21276741C;
      v12[3] = v11;
      swift_retain();
      v13 = v36;
      v14 = v37;
      v37[4] = sub_2127674D0;
      v14[5] = v13;
      sub_212761414();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v39, (os_log_type_t)v40))
      {
        v15 = v48;
        v17 = (uint8_t *)sub_21279DFE4();
        v16[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E8);
        v18 = sub_21276633C(0);
        v19 = sub_21276633C(1);
        v20 = &v59;
        v59 = v17;
        v21 = &v58;
        v58 = v18;
        v22 = &v57;
        v57 = v19;
        sub_212766394(2, &v59);
        sub_212766394(1, v20);
        v55 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
        v56 = v33;
        sub_2127663A8(&v55, (uint64_t)v20, (uint64_t)v21, (uint64_t)v22);
        v23 = v15;
        if (v15)
        {
          __break(1u);
        }
        else
        {
          v55 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
          v56 = v34;
          sub_2127663A8(&v55, (uint64_t)&v59, (uint64_t)&v58, (uint64_t)&v57);
          v16[1] = 0;
          v55 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2127674D0;
          v56 = v36;
          sub_2127663A8(&v55, (uint64_t)&v59, (uint64_t)&v58, (uint64_t)&v57);
          _os_log_impl(&dword_212728000, v39, (os_log_type_t)v40, "SFRemoteAlertPresentationManager did deactivate for request: %s", v17, v27);
          sub_2127663EC(v18);
          sub_2127663EC(v19);
          sub_21279DFCC();
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v50 + 8))(v52, v49);
      objc_msgSend(v42, sel_invalidate);
      swift_release();

    }
    else
    {

    }
  }
}

void SFRemoteAlertPresentationManager.remoteAlertHandle(_:didInvalidateWithError:)(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[3];
  char *v31;
  uint64_t (*v32)();
  uint64_t v33;
  id v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  unsigned int v46;
  _BYTE **v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t *v53;
  uint32_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  NSObject *v72;
  int v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t, uint64_t);
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _BYTE *v93;
  char v94;
  _QWORD v95[2];
  uint64_t v96;
  _QWORD v97[3];
  uint64_t v98;
  uint32_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;

  v87 = a1;
  v82 = a2;
  v104 = 0;
  v103 = 0;
  v102 = 0;
  v101 = 0;
  v100 = 0;
  v81 = 0;
  v83 = sub_21279DABC();
  v84 = *(_QWORD *)(v83 - 8);
  v85 = (*(_QWORD *)(v84 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v86 = (char *)v30 - v85;
  v104 = MEMORY[0x24BDAC7A8](v87);
  v103 = v3;
  v102 = v2;
  swift_unknownObjectRetain();
  objc_opt_self();
  v88 = swift_dynamicCastObjCClass();
  if (v88)
  {
    v80 = (void *)v88;
  }
  else
  {
    v79 = 0;
    swift_unknownObjectRelease();
    v80 = v79;
  }
  v78 = v80;
  if (v80)
  {
    v77 = v78;
    v75 = v78;
    v101 = v78;
    v76 = sub_21276CDB4(v78);
    if (v76)
    {
      v74 = v76;
      v4 = v86;
      v55 = v76;
      v100 = v76;
      v5 = sub_212770244();
      (*(void (**)(char *, uint64_t, uint64_t))(v84 + 16))(v4, v5, v83);
      swift_retain();
      v6 = v82;
      v60 = 7;
      v61 = swift_allocObject();
      *(_QWORD *)(v61 + 16) = v82;
      sub_21276E9A4();
      swift_bridgeObjectRelease();
      v72 = sub_21279DAA4();
      v73 = sub_21279DF78();
      v53 = &v98;
      v98 = 22;
      v51 = sub_212766204();
      v52 = sub_21276626C();
      sub_2127662D4();
      sub_21279DE28();
      v54 = v99;
      v57 = 17;
      v63 = swift_allocObject();
      *(_BYTE *)(v63 + 16) = 32;
      v64 = swift_allocObject();
      v58 = 8;
      *(_BYTE *)(v64 + 16) = 8;
      v59 = 32;
      v7 = swift_allocObject();
      v8 = v55;
      v56 = v7;
      *(_QWORD *)(v7 + 16) = sub_21276B608;
      *(_QWORD *)(v7 + 24) = v8;
      v9 = swift_allocObject();
      v10 = v56;
      v65 = v9;
      *(_QWORD *)(v9 + 16) = sub_212767488;
      *(_QWORD *)(v9 + 24) = v10;
      v66 = swift_allocObject();
      *(_BYTE *)(v66 + 16) = 64;
      v67 = swift_allocObject();
      *(_BYTE *)(v67 + 16) = v58;
      v11 = swift_allocObject();
      v12 = v61;
      v62 = v11;
      *(_QWORD *)(v11 + 16) = sub_21276F6EC;
      *(_QWORD *)(v11 + 24) = v12;
      v13 = swift_allocObject();
      v14 = v62;
      v69 = v13;
      *(_QWORD *)(v13 + 16) = sub_21276F848;
      *(_QWORD *)(v13 + 24) = v14;
      v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E0);
      v68 = sub_21279E1F4();
      v70 = v15;
      swift_retain();
      v16 = v63;
      v17 = v70;
      *v70 = sub_21276741C;
      v17[1] = v16;
      swift_retain();
      v18 = v64;
      v19 = v70;
      v70[2] = sub_21276741C;
      v19[3] = v18;
      swift_retain();
      v20 = v65;
      v21 = v70;
      v70[4] = sub_2127674D0;
      v21[5] = v20;
      swift_retain();
      v22 = v66;
      v23 = v70;
      v70[6] = sub_21276741C;
      v23[7] = v22;
      swift_retain();
      v24 = v67;
      v25 = v70;
      v70[8] = sub_21276741C;
      v25[9] = v24;
      swift_retain();
      v26 = v69;
      v27 = v70;
      v70[10] = sub_21276F2A8;
      v27[11] = v26;
      sub_212761414();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v72, (os_log_type_t)v73))
      {
        v28 = v81;
        v43 = (uint8_t *)sub_21279DFE4();
        v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E8);
        v42 = 1;
        v44 = sub_21276633C(1);
        v45 = sub_21276633C(v42);
        v47 = &v93;
        v93 = v43;
        v48 = &v92;
        v92 = v44;
        v49 = &v91;
        v91 = v45;
        v46 = 2;
        sub_212766394(2, &v93);
        sub_212766394(v46, v47);
        v89 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
        v90 = v63;
        sub_2127663A8(&v89, (uint64_t)v47, (uint64_t)v48, (uint64_t)v49);
        v50 = v28;
        if (v28)
        {
          __break(1u);
        }
        else
        {
          v89 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
          v90 = v64;
          sub_2127663A8(&v89, (uint64_t)&v93, (uint64_t)&v92, (uint64_t)&v91);
          v40 = 0;
          v29 = v40;
          v89 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2127674D0;
          v90 = v65;
          sub_2127663A8(&v89, (uint64_t)&v93, (uint64_t)&v92, (uint64_t)&v91);
          v39 = v29;
          v89 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
          v90 = v66;
          sub_2127663A8(&v89, (uint64_t)&v93, (uint64_t)&v92, (uint64_t)&v91);
          v38 = 0;
          v89 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
          v90 = v67;
          sub_2127663A8(&v89, (uint64_t)&v93, (uint64_t)&v92, (uint64_t)&v91);
          v37 = 0;
          v89 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276F2A8;
          v90 = v69;
          sub_2127663A8(&v89, (uint64_t)&v93, (uint64_t)&v92, (uint64_t)&v91);
          _os_log_impl(&dword_212728000, v72, (os_log_type_t)v73, "SFRemoteAlertPresentationManager did invalidate for request: %s with error: %@", v43, v54);
          v36 = 1;
          sub_2127663EC(v44);
          sub_2127663EC(v45);
          sub_21279DFCC();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v84 + 8))(v86, v83);
      sub_212769990((uint64_t)v97);
      v30[0] = v97[0];
      v33 = v97[1];
      v34 = (id)v97[2];
      swift_bridgeObjectRetain();
      v30[2] = &v96;
      v96 = 0;
      v30[1] = v95;
      v95[0] = v30[0];
      v95[1] = v33;
      v31 = &v94;
      v32 = sub_21276B8E8();
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B58BA0);
      sub_21279DD14();
      v35 = 1;
      ((void (*)(char *, _QWORD))v32)(v31, 0);
      swift_bridgeObjectRelease();

      sub_21276A644(v35 & 1);
      swift_release();

    }
    else
    {

    }
  }
}

void *sub_21276E980(void *a1)
{
  id v1;

  v1 = a1;
  return a1;
}

uint64_t sub_21276E9A4()
{
  return sub_21279DDB0();
}

id sub_21276E9CC()
{
  id result;

  type metadata accessor for SFRemoteAlertPresentationManager();
  result = SFRemoteAlertPresentationManager.__allocating_init()();
  qword_254B58B70 = (uint64_t)result;
  return result;
}

id sub_21276E9FC(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v8;

  if (a3)
  {
    v5 = sub_21279DD5C();
    swift_bridgeObjectRelease();
    v6 = (void *)v5;
  }
  else
  {
    v6 = 0;
  }
  v4 = objc_msgSend(v8, sel_initWithSceneProvidingProcess_configurationIdentifier_, a1);

  return v4;
}

id sub_21276EAB8()
{
  void *v0;

  return objc_msgSend(v0, sel_init);
}

uint64_t sub_21276EAD8(uint64_t (*a1)(void))
{
  id v2;
  uint64_t v3;

  v2 = (id)a1();
  v3 = sub_21276EB84((void (*)(uint64_t *__return_ptr, void **))sub_21276EB44, 0, v2);

  return v3;
}

uint64_t sub_21276EB44@<X0>(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v2;
  uint64_t result;

  v2 = *a1;
  result = _swift_stdlib_bridgeErrorToNSError();
  *a2 = result;
  return result;
}

uint64_t sub_21276EB84(void (*a1)(uint64_t *__return_ptr, void **), uint64_t a2, void *a3)
{
  id v3;
  uint64_t v5;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  if (!a3)
    return 0;
  v9 = a3;
  v3 = a3;
  a1(&v10, &v9);
  if (v8)
  {

    return v5;
  }

  return v10;
}

uint64_t sub_21276EC5C()
{
  return swift_deallocObject();
}

uint64_t sub_21276EC84()
{
  return swift_deallocObject();
}

uint64_t sub_21276ECAC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21276ECE8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21276ED24(uint64_t a1)
{
  swift_bridgeObjectRelease();

  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21276ED58(id *a1)
{

}

uint64_t sub_21276ED80()
{
  return swift_deallocObject();
}

uint64_t sub_21276EDA8()
{
  return swift_deallocObject();
}

uint64_t sub_21276EDD0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21276EE0C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21276EE48()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_21276EEA0()
{
  uint64_t v0;

  return sub_21276B610(*(void (**)(void))(v0 + 16));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_21276EF08(uint64_t a1)
{
  id v1;
  id v3;

  v3 = *(id *)(a1 + 16);
  swift_bridgeObjectRetain();
  v1 = v3;
  return a1;
}

uint64_t sub_21276EF44()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_21276EF88()
{
  uint64_t v0;

  return sub_21276C658((uint64_t *)(v0 + 16));
}

uint64_t sub_21276EF90()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

void *sub_21276EFD4()
{
  uint64_t v0;

  return sub_21276C68C(v0 + 16);
}

uint64_t sub_21276EFDC()
{
  return swift_deallocObject();
}

uint64_t sub_21276F004()
{
  return swift_deallocObject();
}

uint64_t sub_21276F02C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21276F068()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21276F0A4()
{
  return swift_deallocObject();
}

uint64_t sub_21276F0CC()
{
  return swift_deallocObject();
}

uint64_t sub_21276F0F4()
{
  swift_release();
  return swift_deallocObject();
}

void sub_21276F130(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  _QWORD *v4;
  id v7;
  uint64_t v8;

  v7 = (id)a4();
  v8 = *a1;
  sub_21279DFFC();
  *a1 = v8 + 8;
  v4 = *a2;
  if (*a2)
  {
    *v4 = v7;
    *a2 = v4 + 1;
  }
  else
  {

  }
}

uint64_t sub_21276F26C()
{
  swift_release();
  return swift_deallocObject();
}

void sub_21276F2A8(uint64_t *a1, _QWORD **a2, uint64_t a3)
{
  uint64_t v3;

  sub_21276F130(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_21276F2B4(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  uint64_t *v1;

  return sub_2127663A8(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_21276F2E0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B58B90;
  if (!qword_254B58B90)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B58B88);
    v1 = MEMORY[0x212BF3218](MEMORY[0x24BEE12C8], v0);
    atomic_store(v1, (unint64_t *)&qword_254B58B90);
    return v1;
  }
  return v3;
}

unint64_t sub_21276F350()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_254B58B98;
  if (!qword_254B58B98)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_254B58B98);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t type metadata accessor for SFRemoteAlertPresentationHandle()
{
  return objc_opt_self();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21276F3D8()
{
  swift_bridgeObjectRetain();
}

unint64_t sub_21276F400()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_254B58BA8;
  if (!qword_254B58BA8)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_254B58BA8);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t type metadata accessor for SFRemoteAlertPresentationManager()
{
  return objc_opt_self();
}

uint64_t sub_21276F488()
{
  return sub_21276CEA8() & 1;
}

unint64_t sub_21276F4B0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B58C20;
  if (!qword_254B58C20)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B58C18);
    v1 = MEMORY[0x212BF3218](MEMORY[0x24BEE03C0], v0);
    atomic_store(v1, (unint64_t *)&qword_254B58C20);
    return v1;
  }
  return v3;
}

uint64_t sub_21276F520()
{
  return swift_deallocObject();
}

uint64_t sub_21276F548()
{
  return swift_deallocObject();
}

uint64_t sub_21276F570()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21276F5AC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21276F5E8()
{
  return swift_deallocObject();
}

uint64_t sub_21276F610()
{
  return swift_deallocObject();
}

uint64_t sub_21276F638()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21276F674()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21276F6B0()
{
  uint64_t v0;

  return swift_deallocObject();
}

void *sub_21276F6EC()
{
  uint64_t v0;

  return sub_21276E980(*(void **)(v0 + 16));
}

uint64_t sub_21276F6F4()
{
  return swift_deallocObject();
}

uint64_t sub_21276F71C()
{
  return swift_deallocObject();
}

uint64_t sub_21276F744()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21276F780()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21276F7BC()
{
  return swift_deallocObject();
}

uint64_t sub_21276F7E4()
{
  return swift_deallocObject();
}

uint64_t sub_21276F80C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21276F848()
{
  uint64_t v0;

  return sub_21276EAD8(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_21276F854()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21276F890()
{
  return MEMORY[0x24BEE0D10];
}

uint64_t sub_21276F89C@<X0>(uint64_t (**a1)()@<X8>)
{
  return sub_212769D3C(a1);
}

uint64_t sub_21276F8B0(uint64_t *a1)
{
  return sub_212769E3C(a1);
}

uint64_t sub_21276F8C4@<X0>(uint64_t (**a1)()@<X8>)
{
  return sub_21276A0FC(a1);
}

uint64_t sub_21276F8D8(uint64_t *a1)
{
  return sub_21276A1FC(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for SFRemoteAlertPresentationRequest(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;

  v4 = *a2;
  swift_retain();
  *a1 = v4;
  return *a1 + 16;
}

void destroy for SFRemoteAlertPresentationRequest(uint64_t a1)
{
  swift_bridgeObjectRelease();

}

uint64_t initializeWithCopy for SFRemoteAlertPresentationRequest(uint64_t a1, uint64_t a2)
{
  id v2;
  uint64_t result;
  uint64_t v4;
  void *v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(void **)(a2 + 16);
  v2 = v5;
  result = a1;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return result;
}

uint64_t assignWithCopy for SFRemoteAlertPresentationRequest(uint64_t a1, uint64_t a2)
{
  id v2;
  void *v3;
  uint64_t result;
  uint64_t v5;
  void *v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 8) = v5;
  swift_bridgeObjectRelease();
  v6 = *(void **)(a2 + 16);
  v2 = v6;
  v3 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v6;

  result = a1;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24) & 1;
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25) & 1;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40) & 1;
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> __swift_memcpy41_8(void *a1, const void *a2)
{
  memcpy(a1, a2, 0x29uLL);
}

uint64_t assignWithTake for SFRemoteAlertPresentationRequest(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t result;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  v2 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  result = a1;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24) & 1;
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25) & 1;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40) & 1;
  return result;
}

uint64_t getEnumTagSinglePayload for SFRemoteAlertPresentationRequest(uint64_t a1, int a2)
{
  int v3;
  int v4;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 41))
    {
      v4 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v3 = -1;
      if (!HIDWORD(*(_QWORD *)(a1 + 8)))
        v3 = *(_QWORD *)(a1 + 8);
      v4 = v3;
    }
  }
  else
  {
    v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SFRemoteAlertPresentationRequest(uint64_t result, int a2, int a3)
{
  _BYTE *v3;

  v3 = (_BYTE *)(result + 41);
  if (a2 < 0)
  {
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 + 0x80000000;
    *(_QWORD *)(result + 32) = 0;
    *(_BYTE *)(result + 40) = 0;
    if (a3 < 0)
      *v3 = 1;
  }
  else
  {
    if (a3 < 0)
      *v3 = 0;
    if (a2)
      *(_QWORD *)(result + 8) = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for SFRemoteAlertPresentationRequest()
{
  return &type metadata for SFRemoteAlertPresentationRequest;
}

uint64_t method lookup function for SFRemoteAlertPresentationHandle()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SFRemoteAlertPresentationHandle.onActivate.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of SFRemoteAlertPresentationHandle.onActivate.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of SFRemoteAlertPresentationHandle.onActivate.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of SFRemoteAlertPresentationHandle.onDismiss.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of SFRemoteAlertPresentationHandle.onDismiss.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of SFRemoteAlertPresentationHandle.onDismiss.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of SFRemoteAlertPresentationHandle.dismiss(animated:completion:)(char a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)v1 + 280))(a1 & 1);
}

uint64_t method lookup function for SFRemoteAlertPresentationManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static SFRemoteAlertPresentationManager.shared.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of SFRemoteAlertPresentationManager.present(_:animated:contentOverlaysStatusBar:supportedInterfaceOrientations:hideViewController:)(uint64_t a1, char a2, char a3, uint64_t a4, char a5)
{
  _QWORD *v5;

  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t, _QWORD))((*v5 & *MEMORY[0x24BEE4EA0]) + 0x80))(a1, a2 & 1, a3 & 1, a4, a5 & 1);
}

uint64_t dispatch thunk of SFRemoteAlertPresentationManager.present(_:animated:contentOverlaysStatusBar:supportedInterfaceOrientations:hideViewController:onDismiss:)(uint64_t a1, char a2, char a3, uint64_t a4, char a5)
{
  _QWORD *v5;

  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t, _QWORD))((*v5 & *MEMORY[0x24BEE4EA0]) + 0x88))(a1, a2 & 1, a3 & 1, a4, a5 & 1);
}

uint64_t dispatch thunk of SFRemoteAlertPresentationManager.presentationHandle(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x24BEE4EA0]) + 0x90))();
}

uint64_t dispatch thunk of SFRemoteAlertPresentationManager.presentationRequest(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x24BEE4EA0]) + 0x98))();
}

void *type metadata accessor for SFRemoteAlertPresentationManager.Static()
{
  return &unk_24CE10CF8;
}

_QWORD *sub_212770014(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  if (*a1)
  {
    v3 = *a1;
    v4 = a1[1];
    swift_retain();
    *a2 = v3;
    a2[1] = v4;
  }
  else
  {
    *(_OWORD *)a2 = *(_OWORD *)a1;
  }
  return a2;
}

uint64_t sub_212770090()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2127700CC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212770108()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212770144()
{
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_212770180()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_254B58DB0;
  if (!qword_254B58DB0)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_254B58DB0);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_2127701E4()
{
  uint64_t v0;

  if (qword_254B58630 != -1)
    swift_once();
  v0 = sub_21279DABC();
  return __swift_project_value_buffer(v0, (uint64_t)qword_254B5A4E8);
}

uint64_t sub_212770244()
{
  uint64_t v0;

  if (qword_254B58628 != -1)
    swift_once();
  v0 = sub_21279DABC();
  return __swift_project_value_buffer(v0, (uint64_t)qword_254B5A4D0);
}

uint64_t sub_2127702A4()
{
  uint64_t v1;

  v1 = sub_21279DABC();
  __swift_allocate_value_buffer(v1, qword_254B5A4D0);
  __swift_project_value_buffer(v1, (uint64_t)qword_254B5A4D0);
  sub_21279DDB0();
  sub_21279DDB0();
  return sub_21279DAB0();
}

uint64_t sub_212770344()
{
  uint64_t v1;

  v1 = sub_21279DABC();
  __swift_allocate_value_buffer(v1, qword_254B5A4E8);
  __swift_project_value_buffer(v1, (uint64_t)qword_254B5A4E8);
  sub_21279DDB0();
  sub_21279DDB0();
  return sub_21279DAB0();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a2;
  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
    return *(_QWORD *)a2;
  return v3;
}

uint64_t __swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v5;

  v5 = a2;
  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v2 = swift_slowAlloc();
    *a2 = v2;
    return v2;
  }
  return (uint64_t)v5;
}

uint64_t sub_212770494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  swift_allocObject();
  return sub_212770504(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_212770504(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v14;

  swift_bridgeObjectRetain();
  v6[2] = a1;
  v6[3] = a2;
  swift_bridgeObjectRetain();
  v6[4] = a3;
  v6[5] = a4;
  swift_bridgeObjectRetain();
  v6[6] = a5;
  v6[7] = a6;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_2127705E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  type metadata accessor for TTRReportComponent();
  v7 = sub_21279DDB0();
  v8 = v0;
  v5 = sub_21279DDB0();
  v6 = v1;
  v2 = sub_21279DDB0();
  return sub_212770494(v7, v8, v5, v6, v2, v3);
}

uint64_t type metadata accessor for TTRReportComponent()
{
  return objc_opt_self();
}

uint64_t sub_2127706BC()
{
  uint64_t v1;

  sub_2127677B0();
  sub_2127677B0();
  sub_2127677B0();
  return v1;
}

uint64_t sub_212770704()
{
  sub_2127706BC();
  return swift_deallocClassInstance();
}

id sub_212770740()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  type metadata accessor for TTRReport();
  v7 = sub_21279DDB0();
  v4 = v0;
  v5 = sub_21279DDB0();
  v6 = v1;
  type metadata accessor for TTRReportComponent();
  v2 = sub_2127705E0();
  return sub_212770818(v7, v4, v5, v6, v2);
}

uint64_t type metadata accessor for TTRReport()
{
  return objc_opt_self();
}

id sub_212770818(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_class *v5;
  id v6;

  v6 = objc_allocWithZone(v5);
  return sub_2127708A8(a1, a2, a3, a4, a5);
}

id sub_2127708A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  id v6;
  id v7;
  id v8;
  char *v9;
  char *v10;
  id v11;
  char *v15;
  id v19;
  objc_super v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v24 = a1;
  v25 = a2;
  v22 = a3;
  v23 = a4;
  v21 = a5;
  v6 = v5;
  v7 = v5;
  v8 = v5;
  v26 = v5;
  swift_bridgeObjectRetain();
  v9 = &v15[OBJC_IVAR___TTRReport_title];
  *(_QWORD *)v9 = a1;
  *((_QWORD *)v9 + 1) = a2;

  swift_bridgeObjectRetain();
  v10 = &v15[OBJC_IVAR___TTRReport_desc];
  *(_QWORD *)v10 = a3;
  *((_QWORD *)v10 + 1) = a4;

  swift_retain();
  *(_QWORD *)&v15[OBJC_IVAR___TTRReport_component] = a5;

  v20.receiver = v26;
  v20.super_class = (Class)type metadata accessor for TTRReport();
  v19 = objc_msgSendSuper2(&v20, sel_init);
  v11 = v19;
  v26 = v19;
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v19;
}

id sub_212770A0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;
  uint64_t v7;
  uint64_t v8;
  id v11;

  swift_bridgeObjectRetain();
  v7 = sub_21279DDB0();
  v8 = v3;
  swift_retain();
  v11 = sub_212770818(a1, a2, v7, v8, a3);
  v4 = v11;
  swift_release();
  swift_bridgeObjectRelease();

  return v11;
}

id sub_212770AC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;
  uint64_t v6;
  uint64_t v7;
  id v11;

  v6 = sub_21279DDB0();
  v7 = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  v11 = sub_212770818(v6, v7, a1, a2, a3);
  v4 = v11;
  swift_release();
  swift_bridgeObjectRelease();

  return v11;
}

id sub_212770B7C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v10;

  v5 = sub_21279DDB0();
  v6 = v1;
  v7 = sub_21279DDB0();
  v8 = v2;
  swift_retain();
  v10 = sub_212770818(v5, v6, v7, v8, a1);
  v3 = v10;
  swift_release();

  return v10;
}

uint64_t sub_212770C38()
{
  uint64_t result;
  uint64_t v1;

  if (!"SharingUI.TTRReport")
  {
    sub_21279E0F8();
    __break(1u);
  }
  result = sub_212798594((uint64_t)"SharingUI.TTRReport", 19, (unint64_t)"init()", 6, 2, (unint64_t)"SharingUI/TTRReporter.swift", 27, 2, v1, 0x1FuLL, 7uLL);
  __break(1u);
  return result;
}

id sub_212770D68()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRReport();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_212770E10(void *a1)
{
  objc_class *v1;
  id v2;

  v2 = objc_allocWithZone(v1);
  return sub_212770E48(a1);
}

id sub_212770E48(void *a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;
  char *v6;
  id v8;
  objc_super v9;
  void *v10;
  id v11;

  v10 = a1;
  v2 = v1;
  v11 = v1;
  v3 = a1;
  *(_QWORD *)&v6[OBJC_IVAR___TTRReporter_report] = a1;

  v9.receiver = v11;
  v9.super_class = (Class)type metadata accessor for TTRReporter();
  v8 = objc_msgSendSuper2(&v9, sel_init);
  v4 = v8;
  v11 = v8;

  return v8;
}

uint64_t type metadata accessor for TTRReporter()
{
  return objc_opt_self();
}

uint64_t sub_212770F50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  int v49;
  _QWORD v50[3];
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  _BYTE **v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  id v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t *v63;
  uint32_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  NSObject *v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint8_t *v82;
  uint64_t v83;
  uint64_t v84;
  unsigned int v85;
  uint64_t *v86;
  _QWORD *v87;
  _BYTE **v88;
  _QWORD *v89;
  _QWORD *v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t *v94;
  uint32_t v95;
  int v96;
  NSObject *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint8_t *v101;
  uint64_t v102;
  uint64_t v103;
  _BYTE **v104;
  uint64_t *v105;
  uint64_t *v106;
  uint64_t v107;
  id v108;
  unint64_t v109;
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;
  uint64_t *v113;
  uint32_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  _QWORD *v124;
  uint64_t v125;
  NSObject *v126;
  int v127;
  id v128;
  void (*v129)(char *, char *, uint64_t);
  void (*v130)(char *, uint64_t);
  id v131;
  id v132;
  id v133;
  id v134;
  void *v135;
  void (*v136)(char *, uint64_t, uint64_t);
  id v137;
  const char *v138;
  const char *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  char *v145;
  unint64_t v146;
  char *v147;
  unint64_t v148;
  char *v149;
  uint64_t v150;
  unint64_t v151;
  unint64_t v152;
  uint64_t v153;
  char *v154;
  unint64_t v155;
  char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t (*v160)(uint64_t, uint64_t, uint64_t);
  uint64_t v161;
  _BYTE *v162;
  uint64_t v163;
  uint32_t v164;
  uint64_t (*v165)(uint64_t, uint64_t, uint64_t);
  uint64_t v166;
  _BYTE *v167;
  uint64_t v168;
  uint32_t v169;
  id v170;
  id v171[2];
  _BYTE *v172;
  uint64_t v173;
  uint32_t v174;
  uint64_t v175;
  char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  uint64_t v182;
  _QWORD v183[2];

  v138 = "Fatal error";
  v139 = "Unexpectedly found nil while implicitly unwrapping an Optional value";
  v140 = "SharingUI/TTRReporter.swift";
  v183[1] = *MEMORY[0x24BDAC8D0];
  v176 = 0;
  v175 = 0;
  v141 = 0;
  v170 = 0;
  v150 = 0;
  v142 = sub_21279DABC();
  v143 = *(_QWORD *)(v142 - 8);
  v144 = (*(_QWORD *)(v143 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v142);
  v145 = (char *)v50 - v144;
  v146 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]((char *)v50 - v144);
  v147 = (char *)v50 - v146;
  v148 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]((char *)v50 - v146);
  v149 = (char *)v50 - v148;
  v151 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254B58F90) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v150);
  v158 = (uint64_t)v50 - v151;
  v159 = sub_21279D984();
  v157 = *(_QWORD *)(v159 - 8);
  v153 = *(_QWORD *)(v157 + 64);
  v152 = (v153 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v159);
  v154 = (char *)v50 - v152;
  v155 = (v153 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]((char *)v50 - v152);
  v156 = (char *)v50 - v155;
  v176 = (char *)v50 - v155;
  v175 = v0;
  sub_212772540(v3);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v157 + 48))(v158, 1, v159) == 1)
  {
    v23 = v147;
    sub_2127730D0(v158);
    v24 = sub_212770244();
    (*(void (**)(char *, uint64_t, uint64_t))(v143 + 16))(v23, v24, v142);
    v97 = sub_21279DAA4();
    v96 = sub_21279DF6C();
    v94 = &v173;
    v173 = 2;
    v92 = sub_212766204();
    v93 = sub_21276626C();
    sub_2127662D4();
    sub_21279DE28();
    v95 = v174;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E0);
    v98 = (void *)sub_21279E1F4();
    if (os_log_type_enabled(v97, (os_log_type_t)v96))
    {
      v25 = v141;
      v82 = (uint8_t *)sub_21279DFE4();
      v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E8);
      v81 = 0;
      v83 = sub_21276633C(0);
      v84 = sub_21276633C(v81);
      v88 = &v172;
      v172 = v82;
      v89 = v183;
      v183[0] = v83;
      v86 = &v182;
      v182 = v84;
      v85 = 0;
      sub_212766394(0, &v172);
      sub_212766394(v85, v88);
      v171[1] = v98;
      v87 = v50;
      MEMORY[0x24BDAC7A8](v50);
      v26 = v89;
      v27 = &v50[-6];
      v90 = &v50[-6];
      v27[2] = v88;
      v27[3] = v26;
      v27[4] = v28;
      v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B58B88);
      sub_21276F2E0();
      sub_21279DE10();
      if (v25)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_212728000, v97, (os_log_type_t)v96, "TTR: failed getting a scheme url to report.", v82, v95);
        v79 = 0;
        sub_2127663EC(v83);
        sub_2127663EC(v84);
        sub_21279DFCC();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v143 + 8))(v147, v142);
  }
  else
  {
    v136 = *(void (**)(char *, uint64_t, uint64_t))(v157 + 32);
    v136(v156, v158, v159);
    v181 = 0;
    v137 = objc_msgSend((id)objc_opt_self(), sel_defaultWorkspace);
    if (v137)
    {
      v135 = v137;
    }
    else
    {
      v47 = 2;
      v48 = 72;
      v49 = 0;
      sub_21279E0F8();
      __break(1u);
    }
    v133 = v135;
    v129 = *(void (**)(char *, char *, uint64_t))(v157 + 16);
    v129(v154, v156, v159);
    v132 = (id)sub_21279D924();
    v130 = *(void (**)(char *, uint64_t))(v157 + 8);
    v130(v154, v159);
    v171[0] = v181;
    v134 = objc_msgSend(v133, sel_openURL_configuration_error_, v132, 0, v171);
    v131 = v171[0];
    v4 = v171[0];
    v5 = v181;
    v181 = v131;

    if (v134)
    {
      v128 = v134;
      v6 = v149;
      v108 = v134;
      sub_21279DCE4();
      swift_bridgeObjectRelease();

      v7 = sub_212770244();
      (*(void (**)(char *, uint64_t, uint64_t))(v143 + 16))(v6, v7, v142);
      v129(v154, v156, v159);
      v109 = (*(unsigned __int8 *)(v157 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v157 + 80);
      v117 = 7;
      v110 = swift_allocObject();
      v136((char *)(v110 + v109), (uint64_t)v154, v159);
      swift_retain();
      v116 = 32;
      v8 = swift_allocObject();
      v9 = v110;
      v118 = v8;
      *(_QWORD *)(v8 + 16) = sub_212773584;
      *(_QWORD *)(v8 + 24) = v9;
      swift_release();
      v126 = sub_21279DAA4();
      v127 = sub_21279DF78();
      v113 = &v163;
      v163 = 12;
      v111 = sub_212766204();
      v112 = sub_21276626C();
      sub_2127662D4();
      sub_21279DE28();
      v114 = v164;
      v115 = 17;
      v120 = swift_allocObject();
      *(_BYTE *)(v120 + 16) = 32;
      v121 = swift_allocObject();
      *(_BYTE *)(v121 + 16) = 8;
      v10 = swift_allocObject();
      v11 = v118;
      v119 = v10;
      *(_QWORD *)(v10 + 16) = sub_212773600;
      *(_QWORD *)(v10 + 24) = v11;
      v12 = swift_allocObject();
      v13 = v119;
      v123 = v12;
      *(_QWORD *)(v12 + 16) = sub_212767488;
      *(_QWORD *)(v12 + 24) = v13;
      v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E0);
      v122 = sub_21279E1F4();
      v124 = v14;
      swift_retain();
      v15 = v120;
      v16 = v124;
      *v124 = sub_21276741C;
      v16[1] = v15;
      swift_retain();
      v17 = v121;
      v18 = v124;
      v124[2] = sub_21276741C;
      v18[3] = v17;
      swift_retain();
      v19 = v123;
      v20 = v124;
      v124[4] = sub_2127674D0;
      v20[5] = v19;
      sub_212761414();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v126, (os_log_type_t)v127))
      {
        v21 = v141;
        v101 = (uint8_t *)sub_21279DFE4();
        v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E8);
        v102 = sub_21276633C(0);
        v103 = sub_21276633C(1);
        v104 = &v162;
        v162 = v101;
        v105 = &v178;
        v178 = v102;
        v106 = &v177;
        v177 = v103;
        sub_212766394(2, &v162);
        sub_212766394(1, v104);
        v160 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
        v161 = v120;
        sub_2127663A8(&v160, (uint64_t)v104, (uint64_t)v105, (uint64_t)v106);
        v107 = v21;
        if (v21)
        {
          __break(1u);
        }
        else
        {
          v160 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
          v161 = v121;
          sub_2127663A8(&v160, (uint64_t)&v162, (uint64_t)&v178, (uint64_t)&v177);
          v99 = 0;
          v160 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2127674D0;
          v161 = v123;
          sub_2127663A8(&v160, (uint64_t)&v162, (uint64_t)&v178, (uint64_t)&v177);
          _os_log_impl(&dword_212728000, v126, (os_log_type_t)v127, "TTR: reporting scheme url:%s", v101, v114);
          sub_2127663EC(v102);
          sub_2127663EC(v103);
          sub_21279DFCC();
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v143 + 8))(v149, v142);
    }
    else
    {
      v58 = v181;
      v60 = (id)sub_21279D8C4();

      swift_willThrow();
      v29 = v145;
      v59 = 0;
      v30 = v60;
      v170 = v60;
      v31 = sub_212770244();
      (*(void (**)(char *, uint64_t, uint64_t))(v143 + 16))(v29, v31, v142);
      v32 = v60;
      v68 = 7;
      v66 = swift_allocObject();
      *(_QWORD *)(v66 + 16) = v60;
      sub_21276E9A4();
      swift_bridgeObjectRelease();
      v77 = sub_21279DAA4();
      v78 = sub_21279DF6C();
      v63 = &v168;
      v168 = 12;
      v61 = sub_212766204();
      v62 = sub_21276626C();
      sub_2127662D4();
      sub_21279DE28();
      v64 = v169;
      v65 = 17;
      v71 = swift_allocObject();
      *(_BYTE *)(v71 + 16) = 64;
      v72 = swift_allocObject();
      *(_BYTE *)(v72 + 16) = 8;
      v67 = 32;
      v33 = swift_allocObject();
      v34 = v66;
      v69 = v33;
      *(_QWORD *)(v33 + 16) = sub_21276F6EC;
      *(_QWORD *)(v33 + 24) = v34;
      v35 = swift_allocObject();
      v36 = v69;
      v70 = v35;
      *(_QWORD *)(v35 + 16) = sub_212773490;
      *(_QWORD *)(v35 + 24) = v36;
      v37 = swift_allocObject();
      v38 = v70;
      v74 = v37;
      *(_QWORD *)(v37 + 16) = sub_212767488;
      *(_QWORD *)(v37 + 24) = v38;
      v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E0);
      v73 = sub_21279E1F4();
      v75 = v39;
      swift_retain();
      v40 = v71;
      v41 = v75;
      *v75 = sub_21276741C;
      v41[1] = v40;
      swift_retain();
      v42 = v72;
      v43 = v75;
      v75[2] = sub_21276741C;
      v43[3] = v42;
      swift_retain();
      v44 = v74;
      v45 = v75;
      v75[4] = sub_21276F2A8;
      v45[5] = v44;
      sub_212761414();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v77, (os_log_type_t)v78))
      {
        v46 = v59;
        v51 = (uint8_t *)sub_21279DFE4();
        v50[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E8);
        v52 = sub_21276633C(1);
        v53 = sub_21276633C(0);
        v54 = &v167;
        v167 = v51;
        v55 = &v180;
        v180 = v52;
        v56 = &v179;
        v179 = v53;
        sub_212766394(2, &v167);
        sub_212766394(1, v54);
        v165 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
        v166 = v71;
        sub_2127663A8(&v165, (uint64_t)v54, (uint64_t)v55, (uint64_t)v56);
        v57 = v46;
        if (v46)
        {
          __break(1u);
        }
        else
        {
          v165 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
          v166 = v72;
          sub_2127663A8(&v165, (uint64_t)&v167, (uint64_t)&v180, (uint64_t)&v179);
          v50[1] = 0;
          v165 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276F2A8;
          v166 = v74;
          sub_2127663A8(&v165, (uint64_t)&v167, (uint64_t)&v180, (uint64_t)&v179);
          _os_log_impl(&dword_212728000, v77, (os_log_type_t)v78, "TTR: failed opening scheme url:%@", v51, v64);
          sub_2127663EC(v52);
          sub_2127663EC(v53);
          sub_21279DFCC();
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v143 + 8))(v145, v142);
    }
    return ((uint64_t (*)(char *, uint64_t))v130)(v156, v159);
  }
}

uint64_t sub_2127724C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  v2 = sub_21279D984();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a2, a1);
}

uint64_t *sub_212772540@<X0>(void *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  id v20;
  id v21;
  uint64_t *result;
  void (*v23)(char *, uint64_t);
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __objc2_meth_list **p_class_meths;
  __objc2_meth_list **v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  void (*v54)(char *, char *, uint64_t);
  uint64_t v55;
  int v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char *v78;
  uint64_t v79;
  unint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char *v85;
  unint64_t v86;
  char *v87;
  unint64_t v88;
  char *v89;
  unint64_t v90;
  char *v91;
  unint64_t v92;
  char *v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  char *v106;
  char *v107;
  char *v108;

  v73 = a1;
  v108 = 0;
  v107 = 0;
  v106 = 0;
  v105 = 0;
  v104 = 0;
  v103 = 0;
  v102 = 0;
  v100 = 0;
  v101 = 0;
  v99 = 0;
  v97 = 0;
  v98 = 0;
  v79 = 0;
  v75 = sub_21279D984();
  v76 = *(_QWORD *)(v75 - 8);
  v77 = (*(_QWORD *)(v76 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v75);
  v78 = (char *)&v23 - v77;
  v80 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254B58F90) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v79);
  v81 = (char *)&v23 - v80;
  v82 = sub_21279D8A0();
  v83 = *(_QWORD *)(v82 - 8);
  v84 = (*(_QWORD *)(v83 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x24BDAC7A8](v82);
  v85 = (char *)&v23 - v84;
  v108 = (char *)&v23 - v84;
  v86 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = MEMORY[0x24BDAC7A8](v2);
  v87 = (char *)&v23 - v86;
  v107 = (char *)&v23 - v86;
  v88 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  v6 = MEMORY[0x24BDAC7A8](v4);
  v89 = (char *)&v23 - v88;
  v106 = (char *)&v23 - v88;
  v90 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v91 = (char *)&v23 - v90;
  v92 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v8);
  v93 = (char *)&v23 - v92;
  v105 = (char *)&v23 - v92;
  v104 = v1;
  v103 = sub_21279DCCC();
  v95 = *(char **)(v1 + OBJC_IVAR___TTRReporter_report);
  v10 = v95;
  v94 = *(_QWORD *)&v95[OBJC_IVAR___TTRReport_title];
  v96 = *(_QWORD *)&v95[OBJC_IVAR___TTRReport_title + 8];
  swift_bridgeObjectRetain();

  if (v96)
  {
    v71 = v94;
    v72 = v96;
    v70 = v96;
    v68 = v94;
    v97 = v94;
    v98 = v96;
    v67 = sub_21279DDB0();
    v69 = v11;
    swift_bridgeObjectRetain();
    sub_21279D894();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, char *, uint64_t))(v83 + 16))(v91, v93, v82);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B58DE0);
    sub_21279DE70();
    (*(void (**)(char *, uint64_t))(v83 + 8))(v93, v82);
    swift_bridgeObjectRelease();
  }
  v65 = *(char **)(v74 + OBJC_IVAR___TTRReporter_report);
  v12 = v65;
  v64 = *(_QWORD *)&v65[OBJC_IVAR___TTRReport_desc];
  v66 = *(_QWORD *)&v65[OBJC_IVAR___TTRReport_desc + 8];
  swift_bridgeObjectRetain();

  if (v66)
  {
    v62 = v64;
    v63 = v66;
    v60 = v66;
    v61 = v64;
    v100 = v64;
    v101 = v66;
    v99 = v93;
    v58 = sub_21279DDB0();
    v59 = v13;
    swift_bridgeObjectRetain();
    sub_21279D894();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, char *, uint64_t))(v83 + 16))(v91, v93, v82);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B58DE0);
    sub_21279DE70();
    (*(void (**)(char *, uint64_t))(v83 + 8))(v93, v82);
    swift_bridgeObjectRelease();
  }
  v56 = 1;
  v35 = sub_21279DDB0();
  v38 = v14;
  p_class_meths = &OBJC_PROTOCOL___CAStateControllerDelegate.class_meths;
  v33 = *(char **)(v74 + OBJC_IVAR___TTRReporter_report);
  v15 = v33;
  v46 = &OBJC_PROTOCOL___CAStateControllerDelegate.class_meths;
  v34 = *(_QWORD *)&v33[OBJC_IVAR___TTRReport_component];
  swift_retain();

  v36 = *(_QWORD *)(v34 + 16);
  v37 = *(_QWORD *)(v34 + 24);
  swift_bridgeObjectRetain();
  swift_release();
  sub_21279D894();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v41 = sub_21279DDB0();
  v44 = v16;
  v39 = *(char **)((char *)p_class_meths[443] + v74);
  v17 = v39;
  v40 = *(uint64_t *)((char *)v46[442] + (_QWORD)v39);
  swift_retain();

  v42 = *(_QWORD *)(v40 + 32);
  v43 = *(_QWORD *)(v40 + 40);
  swift_bridgeObjectRetain();
  swift_release();
  sub_21279D894();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v49 = sub_21279DDB0();
  v52 = v18;
  v47 = *(char **)((char *)p_class_meths[443] + v74);
  v19 = v47;
  v48 = *(uint64_t *)((char *)v46[442] + (_QWORD)v47);
  swift_retain();

  v50 = *(_QWORD *)(v48 + 48);
  v51 = *(_QWORD *)(v48 + 56);
  swift_bridgeObjectRetain();
  swift_release();
  sub_21279D894();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v54 = *(void (**)(char *, char *, uint64_t))(v83 + 16);
  v54(v93, v89, v82);
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B58DE0);
  v53 = &v103;
  sub_21279DE70();
  v54(v93, v87, v82);
  sub_21279DE70();
  v54(v93, v85, v82);
  sub_21279DE70();
  sub_212773780();
  sub_21279DDB0();
  v57 = sub_212773140();
  v102 = v57;
  v20 = v57;
  if (v57)
  {
    v32 = v57;
    v31 = v57;
    v29 = v103;
    swift_bridgeObjectRetain();
    v30 = (id)sub_21279DE34();
    swift_bridgeObjectRelease();
    objc_msgSend(v31, sel_setQueryItems_, v30);

  }
  v21 = v57;
  if (v57)
  {
    v28 = v57;
    v26 = v57;
    v27 = objc_msgSend(v57, "URL");
    if (v27)
    {
      v25 = v27;
      v24 = v27;
      sub_21279D954();
      (*(void (**)(char *, char *, uint64_t))(v76 + 32))(v81, v78, v75);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v76 + 56))(v81, 0, 1, v75);

    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v76 + 56))(v81, 1, 1, v75);
    }
    sub_2127737E4(v81, v73);

  }
  else
  {
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(v76 + 56))(v73, 1, 1, v75);
  }

  v23 = *(void (**)(char *, uint64_t))(v83 + 8);
  v23(v85, v82);
  v23(v87, v82);
  v23(v89, v82);
  result = &v103;
  sub_2127693E0();
  return result;
}

uint64_t sub_2127730D0(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_21279D984();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return a1;
}

id sub_212773140()
{
  id v0;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_212773330();
}

uint64_t sub_212773184()
{
  uint64_t result;
  uint64_t v1;

  if (!"SharingUI.TTRReporter")
  {
    sub_21279E0F8();
    __break(1u);
  }
  result = sub_212798594((uint64_t)"SharingUI.TTRReporter", 21, (unint64_t)"init()", 6, 2, (unint64_t)"SharingUI/TTRReporter.swift", 27, 2, v1, 0x3DuLL, 7uLL);
  __break(1u);
  return result;
}

id sub_2127732B4()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRReporter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_212773330()
{
  id v1;
  id v2;
  id v3;

  v2 = (id)sub_21279DD5C();
  v3 = objc_msgSend(v1, sel_initWithString_);

  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_212773388()
{
  uint64_t v0;

  return swift_deallocObject();
}

void *sub_2127733C4(void (*a1)(void))
{
  id v1;
  void *v3;

  a1();
  v3 = (void *)_swift_stdlib_bridgeErrorToNSError();
  v1 = v3;
  swift_unknownObjectRelease();
  return v3;
}

uint64_t sub_212773404()
{
  return swift_deallocObject();
}

uint64_t sub_21277342C()
{
  return swift_deallocObject();
}

uint64_t sub_212773454()
{
  swift_release();
  return swift_deallocObject();
}

void *sub_212773490()
{
  uint64_t v0;

  return sub_2127733C4(*(void (**)(void))(v0 + 16));
}

uint64_t sub_21277349C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2127734D8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212773514()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(sub_21279D984() - 8);
  (*(void (**)(unint64_t))(v1 + 8))(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
  return swift_deallocObject();
}

uint64_t sub_212773584@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(sub_21279D984() - 8) + 80);
  return sub_2127724C4(v1 + ((v2 + 16) & ~v2), a1);
}

uint64_t sub_2127735C4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212773600()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = sub_21279D984();
  v1 = sub_212773648();
  return sub_212766458(v5, v3, v4, v1);
}

unint64_t sub_212773648()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B58FC0;
  if (!qword_254B58FC0)
  {
    v0 = sub_21279D984();
    v1 = MEMORY[0x212BF3218](MEMORY[0x24BDCDB28], v0);
    atomic_store(v1, (unint64_t *)&qword_254B58FC0);
    return v1;
  }
  return v3;
}

uint64_t sub_2127736B8()
{
  return swift_deallocObject();
}

uint64_t sub_2127736E0()
{
  return swift_deallocObject();
}

uint64_t sub_212773708()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212773744()
{
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_212773780()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_254B58DE8;
  if (!qword_254B58DE8)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_254B58DE8);
    return ObjCClassMetadata;
  }
  return v2;
}

void *sub_2127737E4(const void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v6;
  uint64_t v7;

  v6 = sub_21279D984();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B58F90);
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a2, a1, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t static SFSecureWindow._isSecure()()
{
  return 1;
}

id SFSecureWindow.__allocating_init(windowScene:)(void *a1)
{
  objc_class *v1;
  id v4;

  v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithWindowScene_, a1);

  return v4;
}

id SFSecureWindow.init(windowScene:)(void *a1)
{
  id v1;
  id v4;
  objc_super v5;
  void *v6;
  id v7;

  v7 = 0;
  v6 = a1;
  v5.receiver = 0;
  v5.super_class = (Class)type metadata accessor for SFSecureWindow();
  v4 = objc_msgSendSuper2(&v5, sel_initWithWindowScene_, a1);
  v1 = v4;
  v7 = v4;

  return v4;
}

uint64_t type metadata accessor for SFSecureWindow()
{
  return objc_opt_self();
}

id SFSecureWindow.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

id SFSecureWindow.init(frame:)(double a1, double a2, double a3, double a4)
{
  id v4;
  id v10;
  objc_super v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v16 = 0;
  v12 = a1;
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v11.receiver = 0;
  v11.super_class = (Class)type metadata accessor for SFSecureWindow();
  v10 = objc_msgSendSuper2(&v11, sel_initWithFrame_, a1, a2, a3, a4);
  v4 = v10;
  v16 = v10;

  return v10;
}

id SFSecureWindow.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v4;

  v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id SFSecureWindow.init(coder:)(void *a1)
{
  id v1;
  id v5;
  objc_super v6;
  void *v7;
  id v8;

  v8 = 0;
  v7 = a1;
  v6.receiver = 0;
  v6.super_class = (Class)type metadata accessor for SFSecureWindow();
  v5 = objc_msgSendSuper2(&v6, sel_initWithCoder_, a1);
  if (v5)
  {
    v1 = v5;
    v8 = v5;

    return v5;
  }
  else
  {

    return 0;
  }
}

id SFSecureWindow.__allocating_init(contentRect:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithContentRect_, a1, a2, a3, a4);
}

id SFSecureWindow.init(contentRect:)(double a1, double a2, double a3, double a4)
{
  id v4;
  id v11;
  objc_super v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v17 = 0;
  v13 = a1;
  v14 = a2;
  v15 = a3;
  v16 = a4;
  v12.receiver = 0;
  v12.super_class = (Class)type metadata accessor for SFSecureWindow();
  v11 = objc_msgSendSuper2(&v12, sel_initWithContentRect_, a1, a2, a3, a4);
  if (v11)
  {
    v4 = v11;
    v17 = v11;

    return v11;
  }
  else
  {

    return 0;
  }
}

id SFSecureWindow.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SFSecureWindow();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_212773EF4()
{
  uint64_t v1;

  v1 = sub_21279DABC();
  __swift_allocate_value_buffer(v1, qword_254B58F20);
  __swift_project_value_buffer(v1, (uint64_t)qword_254B58F20);
  return sub_21279DA98();
}

uint64_t sub_212773F3C()
{
  uint64_t v0;

  if (qword_254B58638 != -1)
    swift_once();
  v0 = sub_21279DABC();
  return __swift_project_value_buffer(v0, (uint64_t)qword_254B58F20);
}

uint64_t static SCUIInterventionViewController.sf_platformSupportsUserSafety.getter()
{
  return 1;
}

id static SCUIInterventionViewController.openChatWithParents()()
{
  return objc_msgSend((id)objc_opt_self(), sel_openChatWithParents);
}

uint64_t sub_212773FF0()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;

  v2 = sub_21279DABC();
  __swift_allocate_value_buffer(v2, qword_254B58F40);
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_254B58F40);
  v0 = sub_212770244();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v3, v0);
}

uint64_t sub_212774050()
{
  uint64_t v0;

  if (qword_254B58640 != -1)
    swift_once();
  v0 = sub_21279DABC();
  return __swift_project_value_buffer(v0, (uint64_t)qword_254B58F40);
}

void sub_2127740B0()
{
  double v0;
  double v1;

  v1 = sub_212791C34(106);
  v0 = sub_212791C34(106);
  qword_254B58F58 = *(_QWORD *)&v1;
  qword_254B58F60 = *(_QWORD *)&v0;
}

uint64_t *sub_2127740FC()
{
  if (qword_254B58648 != -1)
    swift_once();
  return &qword_254B58F58;
}

double static SFAirDropUtilities.defaultPreviewIconSize.getter()
{
  return *(double *)sub_2127740FC();
}

uint64_t SFAirDropUtilities.FileLoadResult.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  v1 = sub_21279DC24();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1);
}

uint64_t SFAirDropUtilities.FileLoadResult.dataType.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for SFAirDropUtilities.FileLoadResult() + 20));
  swift_bridgeObjectRetain();
  return v2;
}

void *SFAirDropUtilities.FileLoadResult.previewImage.getter()
{
  uint64_t v0;
  id v1;
  void *v3;

  v3 = *(void **)(v0 + *(int *)(type metadata accessor for SFAirDropUtilities.FileLoadResult() + 24));
  v1 = v3;
  return v3;
}

uint64_t SFAirDropUtilities.FileLoadResult.wasString.getter()
{
  uint64_t v0;

  return *(_BYTE *)(v0 + *(int *)(type metadata accessor for SFAirDropUtilities.FileLoadResult() + 28)) & 1;
}

int *sub_212774288@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  int *result;
  _QWORD *v8;

  v6 = sub_21279DC24();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a6, a1);
  result = (int *)type metadata accessor for SFAirDropUtilities.FileLoadResult();
  v8 = (_QWORD *)(a6 + result[5]);
  *v8 = a2;
  v8[1] = a3;
  *(_QWORD *)(a6 + result[6]) = a4;
  *(_BYTE *)(a6 + result[7]) = a5 & 1;
  return result;
}

uint64_t sub_212774320()
{
  return sub_21279E248();
}

uint64_t sub_212774334()
{
  return sub_21279E23C();
}

uint64_t sub_212774348()
{
  return sub_21279E254();
}

uint64_t sub_21277435C()
{
  return sub_21279E230();
}

uint64_t *sub_212774370()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t *result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v8 = sub_21279DA80();
  v7 = sub_21279E1F4();
  v6 = v0;
  sub_21279DA14();
  v4 = *(_QWORD *)(v8 - 8);
  v5 = *(_QWORD *)(v4 + 72);
  v1 = sub_212774548();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v6 + v5, v1, v8);
  sub_21279DA68();
  sub_21279DA44();
  sub_21279DA38();
  sub_21279DA08();
  sub_21279DA74();
  sub_21279DA20();
  sub_21279D9E4();
  sub_212761414();
  v12 = v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B58F70);
  v2 = sub_212791CA0();
  v11 = sub_2127745F4((void (*)(char *, char *))sub_2127745A8, 0, v9, MEMORY[0x24BEE0D00], MEMORY[0x24BEE4078], v2, MEMORY[0x24BEE40A8], v10);
  result = &v12;
  sub_2127693E0();
  qword_254B58F68 = v11;
  return result;
}

uint64_t sub_212774548()
{
  uint64_t v0;

  if (qword_254B58658 != -1)
    swift_once();
  v0 = sub_21279DA80();
  return __swift_project_value_buffer(v0, (uint64_t)qword_254B5A500);
}

uint64_t sub_2127745A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v2;

  result = sub_21279D9D8();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_2127745F4(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v14;
  _QWORD v15[2];
  void (*v16)(char *, _QWORD);
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void (*v30)(char *, char *);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  unint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t AssociatedTypeWitness;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  unint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char *v57;
  unint64_t v58;
  char *v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;

  v30 = a1;
  v31 = a2;
  v53 = a3;
  v44 = a4;
  v32 = a5;
  v52 = a6;
  v34 = a8;
  v35 = "Fatal error";
  v36 = "Index out of bounds";
  v37 = "Swift/Collection.swift";
  v38 = "Range requires lowerBound <= upperBound";
  v39 = "Swift/Range.swift";
  v40 = "Index out of range";
  v67 = a3;
  v66 = a4;
  v65 = a5;
  v41 = *(_QWORD *)(a5 - 8);
  v42 = (*(_QWORD *)(v41 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](a1);
  v43 = (char *)v15 - v42;
  v45 = 0;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v47 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v48 = (*(_QWORD *)(v47 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = MEMORY[0x24BDAC7A8](v45);
  v49 = (char *)v15 - v48;
  v50 = (*(_QWORD *)(*(_QWORD *)(v9 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v8);
  v51 = (char *)v15 - v50;
  v54 = swift_getAssociatedTypeWitness();
  v55 = *(_QWORD *)(v54 - 8);
  v56 = (*(_QWORD *)(v55 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v10 = MEMORY[0x24BDAC7A8](v53);
  v57 = (char *)v15 - v56;
  v58 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v10);
  v59 = (char *)v15 - v58;
  v60 = sub_21279DF18();
  if (v60)
  {
    v64 = sub_21279DCCC();
    v29 = sub_21279E08C();
    sub_21279E068();
    result = sub_21279DF0C();
    if (v60 >= 0)
    {
      v27 = 0;
      for (i = v33; ; i = v18)
      {
        v25 = i;
        v26 = v27;
        if (v27 == v60)
          goto LABEL_17;
        if (v26 < 0 || v26 >= v60)
          goto LABEL_16;
        v62 = v26;
        if (v60 < 0)
          goto LABEL_15;
        if (v26 >= v60)
          break;
        v24 = v26 + 1;
        if (__OFADD__(v26, 1))
        {
          __break(1u);
          return result;
        }
        v63 = 0;
        v23 = v24;
LABEL_18:
        v22 = v23;
        if ((v63 & 1) != 0)
        {
          (*(void (**)(char *, char *, uint64_t))(v55 + 32))(v57, v59, v54);
          sub_21279E02C();
          (*(void (**)(char *, uint64_t))(v55 + 8))(v57, v54);
          v19 = v64;
          swift_retain();
          swift_release();
          v20 = v19;
          v21 = v25;
          return v20;
        }
        v17 = &v61;
        v16 = (void (*)(char *, _QWORD))sub_21279DF54();
        (*(void (**)(char *))(v47 + 16))(v49);
        v16(v17, 0);
        v14 = v25;
        v30(v49, v43);
        v18 = v14;
        if (v14)
        {
          (*(void (**)(char *, uint64_t))(v47 + 8))(v49, AssociatedTypeWitness);
          (*(void (**)(char *, uint64_t))(v55 + 8))(v59, v54);
          sub_212765788();
          (*(void (**)(uint64_t, char *, uint64_t))(v41 + 32))(v34, v43, v32);
          return v15[1];
        }
        (*(void (**)(char *, uint64_t))(v47 + 8))(v49, AssociatedTypeWitness);
        sub_21279E074();
        sub_21279DF24();
        result = v18;
        v27 = v22;
      }
      sub_21279E0F8();
      __break(1u);
LABEL_15:
      sub_21279E0F8();
      __break(1u);
LABEL_16:
      sub_21279E134();
      __break(1u);
LABEL_17:
      v62 = 0;
      v63 = 1;
      v23 = v26;
      goto LABEL_18;
    }
    sub_21279E0F8();
    __break(1u);
  }
  v20 = sub_21279DE58();
  v21 = v33;
  return v20;
}

uint64_t *sub_212774DE0()
{
  if (qword_254B58650 != -1)
    swift_once();
  return &qword_254B58F68;
}

uint64_t static SFAirDropUtilities.standardTypeIdentifiers.getter()
{
  uint64_t v1;

  v1 = *sub_212774DE0();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_212774E68(void *a1, id a2, void *a3)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  char v23;
  void *v27;
  char v28;

  v3 = a2;
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B586F0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v22 = v27;
      v23 = v28;
    }
    else
    {
      v22 = 0;
      v23 = -1;
    }
    v20 = v22;
    v21 = v23;
  }
  else
  {
    v20 = 0;
    v21 = -1;
  }
  if (v21 == 255)
  {
    v5 = a2;
    if (a2)
    {
      v6 = a2;
      sub_212791D10();
      v17 = swift_allocError();
      *(_QWORD *)v7 = a2;
      *(_BYTE *)(v7 + 8) = 0;

      return v17;
    }
    else
    {
      v8 = a3;
      if (a3)
      {
        v9 = a3;
        sub_212791D10();
        v16 = swift_allocError();
        *(_QWORD *)v10 = a3;
        *(_BYTE *)(v10 + 8) = 0;

        return v16;
      }
      else
      {
        v14 = objc_msgSend(a1, sel_registeredTypeIdentifiers);
        v13 = sub_21279DE40();
        sub_212791D10();
        v15 = swift_allocError();
        *(_QWORD *)v11 = v13;
        *(_BYTE *)(v11 + 8) = 1;

        return v15;
      }
    }
  }
  else
  {
    sub_212791D7C(v20, v21);
    sub_212791D10();
    v18 = swift_allocError();
    *(_QWORD *)v4 = v20;
    *(_BYTE *)(v4 + 8) = v21;
    sub_212791DDC(v20, v21);
    return v18;
  }
}

uint64_t static SFAirDropUtilities.suggestedAirDropThumbnailSize()()
{
  id v1;

  v1 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v1, sel_scale);

  return SFSuggestedAirDropThumbnailSize();
}

CGImageSource *static SFAirDropUtilities.previewImage(from:suggestedThumbnailSize:)(uint64_t a1, double a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  CGImageSource *v24;
  uint64_t v25;
  double v26;
  CGImageSource *v27;
  id v28;
  uint64_t v29;
  double v30;
  CGImageSource *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  CGImageSource *v48;
  uint64_t v50;
  id v51;
  uint64_t v52;
  id *v53;
  CGImageSource *v54;
  uint64_t v55;
  uint64_t v56;
  uint8_t *v57;
  uint64_t v58;
  uint64_t v59;
  _BYTE **v60;
  uint64_t *v61;
  uint64_t *v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t *v68;
  uint32_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  NSObject *v81;
  int v82;
  void *v83;
  CGImageSource *v84;
  void (*v85)(uint64_t, uint64_t);
  id v86;
  id v87;
  id v88;
  unsigned int (*v89)(uint64_t, uint64_t, uint64_t);
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  void *v96;
  CGImageSource *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  id v108;
  id v109;
  id v110;
  id v111;
  void (*v112)(uint64_t, uint64_t, uint64_t);
  void (*v113)(uint64_t, uint64_t, uint64_t, uint64_t);
  id v114;
  void *v115;
  CGImageSource *v116;
  void (*v117)(char *, uint64_t);
  int v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t *v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  unint64_t v136;
  char *v137;
  unint64_t v138;
  char *v139;
  unint64_t v140;
  uint64_t v141;
  unint64_t v142;
  char *v143;
  unint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  unint64_t v149;
  char *v150;
  unint64_t v151;
  uint64_t v152;
  uint64_t v153;
  unint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  unint64_t v158;
  char *v159;
  unint64_t v160;
  char *v161;
  double v162;
  double v163;
  uint64_t v164;
  unint64_t v165;
  uint64_t v166;
  char *v167;
  unint64_t v168;
  char *v169;
  double v170;
  double v171;
  double v172;
  double v173;
  uint64_t v174;
  uint64_t v175;
  id v176;
  double v177;
  double v178;
  id v179;
  uint64_t (*v180)(uint64_t, uint64_t, uint64_t);
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  _BYTE *v184;
  uint64_t v185;
  uint32_t v186;
  uint64_t v187;
  CGImageSource *v188;
  uint64_t v189;
  double v190;
  uint64_t v191;
  uint64_t v192;
  char *v193;
  char *v194;
  char *v195;

  v132 = a1;
  v162 = a2;
  v163 = a3;
  v4 = v3;
  v5 = v132;
  v164 = v4;
  v195 = 0;
  v194 = 0;
  v193 = 0;
  v192 = 0;
  v190 = 0.0;
  v191 = 0;
  v189 = 0;
  v133 = 0;
  v179 = 0;
  v176 = 0;
  v174 = 0;
  v175 = 0;
  v153 = 0;
  v134 = sub_21279DABC();
  v135 = *(_QWORD *)(v134 - 8);
  v136 = (*(_QWORD *)(v135 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v134);
  v137 = (char *)&v51 - v136;
  v138 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254B58F90) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v6 = ((uint64_t (*)(uint64_t))MEMORY[0x24BDAC7A8])(v153);
  v139 = (char *)&v51 - v138;
  v140 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = ((uint64_t (*)(uint64_t))MEMORY[0x24BDAC7A8])(v6);
  v141 = (uint64_t)&v51 - v140;
  v142 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  v10 = ((uint64_t (*)(uint64_t))MEMORY[0x24BDAC7A8])(v8);
  v143 = (char *)&v51 - v142;
  v144 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v10);
  v145 = (uint64_t)&v51 - v144;
  v146 = sub_21279D984();
  v147 = *(_QWORD *)(v146 - 8);
  v148 = *(_QWORD *)(v147 + 64);
  v149 = (v148 + 15) & 0xFFFFFFFFFFFFFFF0;
  v12 = ((uint64_t (*)(uint64_t))MEMORY[0x24BDAC7A8])(v146);
  v150 = (char *)&v51 - v149;
  v195 = (char *)&v51 - v149;
  v151 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v12);
  v152 = (uint64_t)&v51 - v151;
  v154 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254B58F98) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v153);
  v155 = (uint64_t)&v51 - v154;
  v156 = sub_21279DA80();
  v157 = *(_QWORD *)(v156 - 8);
  v158 = (*(_QWORD *)(v157 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v156);
  v159 = (char *)&v51 - v158;
  v160 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]((char *)&v51 - v158);
  v161 = (char *)&v51 - v160;
  v194 = (char *)&v51 - v160;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B58FA0);
  v166 = *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64);
  v165 = (v166 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v15);
  v167 = (char *)&v51 - v165;
  v168 = (v166 + 15) & 0xFFFFFFFFFFFFFFF0;
  v16 = MEMORY[0x24BDAC7A8]((char *)&v51 - v165);
  v169 = (char *)&v51 - v168;
  v193 = (char *)&v51 - v168;
  v192 = v5;
  v190 = v16;
  v191 = v17;
  v189 = v18;
  if ((sub_21279D8D0() & 1) != 0)
  {
    v19 = v133;
    v188 = 0;
    v124 = type metadata accessor for URLResourceKey();
    v123 = sub_21279E1F4();
    sub_212791E3C(MEMORY[0x24BDBCBE8], v20);
    v21 = v123;
    sub_212761414();
    v127 = &v187;
    v187 = v21;
    v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B58FA8);
    v126 = sub_212769154();
    sub_212791E70();
    v128 = sub_21279DF00();
    sub_21279D8F4();
    v129 = (uint64_t)v19;
    v130 = v19;
    if (v19)
    {
      v51 = v130;
      v52 = 0;
      swift_bridgeObjectRelease();

      v50 = sub_21279D8B8();
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v50 - 8) + 56))(v169, 1);
      v122 = v52;
    }
    else
    {
      swift_bridgeObjectRelease();
      v22 = sub_21279D8B8();
      (*(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v169, 0, 1);
      v122 = v129;
    }
    v119 = v122;
    sub_212791EE0(v169, v167);
    v120 = sub_21279D8B8();
    v121 = *(_QWORD *)(v120 - 8);
    if ((*(unsigned int (**)(char *, uint64_t))(v121 + 48))(v167, 1) == 1)
    {
      sub_212791F9C((uint64_t)v167);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v157 + 56))(v155, 1, 1, v156);
    }
    else
    {
      sub_21279D8AC();
      (*(void (**)(char *, uint64_t))(v121 + 8))(v167, v120);
    }
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v157 + 48))(v155, 1, v156) == 1)
    {
      v32 = v137;
      sub_21279200C(v155);
      v33 = sub_212774050();
      (*(void (**)(char *, uint64_t, uint64_t))(v135 + 16))(v32, v33, v134);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v147 + 16))(v152, v132, v146);
      v64 = (*(unsigned __int8 *)(v147 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v147 + 80);
      v72 = 7;
      v65 = swift_allocObject();
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v147 + 32))(v65 + v64, v152, v146);
      swift_retain();
      v71 = 32;
      v34 = swift_allocObject();
      v35 = v65;
      v73 = v34;
      *(_QWORD *)(v34 + 16) = sub_212773584;
      *(_QWORD *)(v34 + 24) = v35;
      swift_release();
      v81 = sub_21279DAA4();
      v82 = sub_21279DF6C();
      v68 = &v185;
      v185 = 12;
      v66 = sub_212766204();
      v67 = sub_21276626C();
      sub_2127662D4();
      sub_21279DE28();
      v69 = v186;
      v70 = 17;
      v75 = swift_allocObject();
      *(_BYTE *)(v75 + 16) = 32;
      v76 = swift_allocObject();
      *(_BYTE *)(v76 + 16) = 8;
      v36 = swift_allocObject();
      v37 = v73;
      v74 = v36;
      *(_QWORD *)(v36 + 16) = sub_212773600;
      *(_QWORD *)(v36 + 24) = v37;
      v38 = swift_allocObject();
      v39 = v74;
      v78 = v38;
      *(_QWORD *)(v38 + 16) = sub_212767488;
      *(_QWORD *)(v38 + 24) = v39;
      v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E0);
      v77 = sub_21279E1F4();
      v79 = v40;
      swift_retain();
      v41 = v75;
      v42 = v79;
      *v79 = sub_21276741C;
      v42[1] = v41;
      swift_retain();
      v43 = v76;
      v44 = v79;
      v79[2] = sub_21276741C;
      v44[3] = v43;
      swift_retain();
      v45 = v78;
      v46 = v79;
      v79[4] = sub_2127674D0;
      v46[5] = v45;
      sub_212761414();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v81, (os_log_type_t)v82))
      {
        v47 = v119;
        v57 = (uint8_t *)sub_21279DFE4();
        v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E8);
        v58 = sub_21276633C(0);
        v59 = sub_21276633C(1);
        v60 = &v184;
        v184 = v57;
        v61 = &v183;
        v183 = v58;
        v62 = &v182;
        v182 = v59;
        sub_212766394(2, &v184);
        sub_212766394(1, v60);
        v180 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
        v181 = v75;
        sub_2127663A8(&v180, (uint64_t)v60, (uint64_t)v61, (uint64_t)v62);
        v63 = v47;
        if (v47)
        {
          __break(1u);
        }
        else
        {
          v180 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
          v181 = v76;
          sub_2127663A8(&v180, (uint64_t)&v184, (uint64_t)&v183, (uint64_t)&v182);
          v55 = 0;
          v180 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2127674D0;
          v181 = v78;
          sub_2127663A8(&v180, (uint64_t)&v184, (uint64_t)&v183, (uint64_t)&v182);
          _os_log_impl(&dword_212728000, v81, (os_log_type_t)v82, "Could not find content type for URL %s", v57, v69);
          sub_2127663EC(v58);
          sub_2127663EC(v59);
          sub_21279DFCC();
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v135 + 8))(v137, v134);
      goto LABEL_43;
    }
    (*(void (**)(char *, uint64_t, uint64_t))(v157 + 32))(v161, v155, v156);
    sub_21279DA38();
    v118 = sub_21279DA50();
    v117 = *(void (**)(char *, uint64_t))(v157 + 8);
    v117(v159, v156);
    if ((v118 & 1) != 0)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v147 + 16))(v152, v132, v146);
      v115 = (void *)sub_21279D924();
      (*(void (**)(uint64_t, uint64_t))(v147 + 8))(v152, v146);
      v23 = SFScreenScale();
      v170 = v162;
      v171 = v163;
      v116 = SFCreateThumbnailImage(v115, v162, v163, v23);

      v24 = v188;
      v188 = v116;

LABEL_35:
      v117(v161, v156);
LABEL_43:
      v53 = (id *)&v188;
      v54 = v188;
      v48 = v188;
      sub_212791F9C((uint64_t)v169);
      sub_21276ED58(v53);
      return v54;
    }
    sub_212792368();
    v112 = *(void (**)(uint64_t, uint64_t, uint64_t))(v147 + 16);
    v112(v145, v132, v146);
    v113 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v147 + 56);
    v113(v145, 0, 1, v146);
    v114 = sub_212776890(v145);
    if (v114)
    {
      v111 = v114;
      v109 = v114;
      v176 = v114;
      v110 = objc_msgSend(v114, sel_imagePath);
      if (v110)
      {
        v108 = v110;
        v103 = v110;
        v104 = sub_21279DD68();
        v105 = v25;

        v106 = v104;
        v107 = v105;
      }
      else
      {
        v106 = 0;
        v107 = 0;
      }
      v101 = v107;
      v102 = v106;
      if (v107)
      {
        v99 = v102;
        v100 = v101;
        v98 = v101;
        v174 = v102;
        v175 = v101;
        sub_21279D900();
        v96 = (void *)sub_21279D924();
        (*(void (**)(uint64_t, uint64_t))(v147 + 8))(v152, v146);
        v26 = SFScreenScale();
        v172 = v162;
        v173 = v163;
        v97 = SFCreateThumbnailImage(v96, v162, v163, v26);

        v27 = v188;
        v188 = v97;

        swift_bridgeObjectRelease();
        goto LABEL_35;
      }

    }
    sub_2127923CC();
    v112(v152, v132, v146);
    v95 = sub_2127768CC(v152);
    if (v95)
    {
      v94 = v95;
      v92 = v95;
      v179 = v95;
      v93 = objc_msgSend(v95, sel_photoURL);
      if (v93)
      {
        v91 = v93;
        v90 = v93;
        sub_21279D954();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v147 + 32))(v141, v152, v146);
        v113(v141, 0, 1, v146);

      }
      else
      {
        v113(v141, 1, 1, v146);
      }
      v28 = v92;
      v89 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v147 + 48);
      if (v89(v141, 1, v146) == 1)
      {
        v88 = objc_msgSend(v92, sel_fullSizePhotoURL);
        if (v88)
        {
          v87 = v88;
          v86 = v88;
          sub_21279D954();
          (*(void (**)(char *, uint64_t, uint64_t))(v147 + 32))(v139, v152, v146);
          v113((uint64_t)v139, 0, 1, v146);

        }
        else
        {
          v113((uint64_t)v139, 1, 1, v146);
        }
        sub_2127737E4(v139, v143);
        sub_2127730D0(v141);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v147 + 32))(v143, v141, v146);
        v113((uint64_t)v143, 0, 1, v146);
      }

      if (v89((uint64_t)v143, 1, v146) == 1)
      {
        sub_2127730D0((uint64_t)v143);
      }
      else
      {
        v29 = v152;
        (*(void (**)(char *, char *, uint64_t))(v147 + 32))(v150, v143, v146);
        v112(v29, (uint64_t)v150, v146);
        v83 = (void *)sub_21279D924();
        v85 = *(void (**)(uint64_t, uint64_t))(v147 + 8);
        v85(v152, v146);
        v30 = SFScreenScale();
        v177 = v162;
        v178 = v163;
        v84 = SFCreateThumbnailImage(v83, v162, v163, v30);

        v31 = v188;
        v188 = v84;

        v85((uint64_t)v150, v146);
      }

    }
    goto LABEL_35;
  }
  return 0;
}

id sub_212776890(uint64_t a1)
{
  id v1;

  v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_2127918BC(a1);
}

id sub_2127768CC(uint64_t a1)
{
  id v1;

  v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_212791984(a1);
}

uint64_t sub_212776908(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v33;
  char *v34;
  id v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[3];
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint8_t *v75;
  uint64_t v76;
  uint64_t v77;
  unsigned int v78;
  _BYTE **v79;
  uint64_t *v80;
  uint64_t *v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t *v89;
  uint32_t v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  int v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  _QWORD *v108;
  uint64_t v109;
  NSObject *v110;
  int v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  unint64_t v128;
  unint64_t v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  _BOOL4 v136;
  _BOOL4 v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  NSData *v142;
  uint64_t v143;
  unint64_t v144;
  uint64_t v145;
  unint64_t v146;
  NSData *v147;
  id v148;
  NSData *v149;
  UIImage *v150;
  UIImage *v151;
  UIImage *v152;
  UIImage *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  unint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  unint64_t v174;
  uint64_t *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  id v183;
  uint64_t v184;
  unint64_t v185;
  uint64_t v186;
  uint64_t v187;
  id v188;
  _QWORD *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  id v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  unint64_t v198;
  uint64_t v199;
  uint64_t v200;
  id v201;
  id v202;
  id v203;
  id v204;
  id v205;
  id v206;
  id v207;
  void *v208;
  void *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  unint64_t v213;
  char *v214;
  unint64_t v215;
  char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  unint64_t v220;
  char *v221;
  uint64_t v222;
  uint64_t v223;
  const void *v224;
  uint64_t v225;
  uint64_t v226;
  unint64_t v227;
  char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  id v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t (*v235)(uint64_t, uint64_t, uint64_t);
  uint64_t v236;
  _BYTE *v237;
  uint64_t v238;
  uint32_t v239;
  id v240;
  id v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  id v246;
  id v247;
  uint64_t v248;
  uint64_t v249;
  UIImage *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  unint64_t v259;
  uint64_t v260;
  uint64_t v261;
  void *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  unint64_t v266;
  uint64_t v267;
  unint64_t v268;
  uint64_t v269;
  unint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  unint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;

  v229 = a1;
  v224 = a2;
  v222 = a3;
  v223 = a4;
  v277 = *MEMORY[0x24BDAC8D0];
  v257 = 0;
  v256 = 0;
  v275 = 0;
  v276 = 0;
  v255 = 0;
  v267 = 0;
  v268 = 0;
  v265 = 0;
  v266 = 0;
  v250 = 0;
  v248 = 0;
  v249 = 0;
  v247 = 0;
  v245 = 0;
  v246 = 0;
  v244 = 0;
  v242 = 0;
  v243 = 0;
  v240 = 0;
  v258 = 0;
  v259 = 0;
  v233 = 0;
  v234 = 0;
  v217 = 0;
  v211 = sub_21279DABC();
  v212 = *(_QWORD *)(v211 - 8);
  v213 = (*(_QWORD *)(v212 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v211);
  v214 = (char *)v66 - v213;
  v215 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254B58F98) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v217);
  v216 = (char *)v66 - v215;
  v218 = sub_21279DA80();
  v219 = *(_QWORD *)(v218 - 8);
  v220 = (*(_QWORD *)(v219 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v217);
  v221 = (char *)v66 - v220;
  v225 = sub_21279DD98();
  v226 = *(_QWORD *)(v225 - 8);
  v227 = (*(_QWORD *)(v226 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v229);
  v228 = (char *)v66 - v227;
  v257 = v5;
  v256 = v6;
  v275 = v7;
  v276 = v8;
  v255 = v4;
  v273 = 0;
  v274 = 0xF000000000000000;
  v271 = 0;
  v272 = 0;
  swift_unknownObjectRetain();
  objc_opt_self();
  v230 = swift_dynamicCastObjCClass();
  if (v230)
  {
    v209 = (void *)v230;
  }
  else
  {
    v208 = 0;
    swift_unknownObjectRelease();
    v209 = v208;
  }
  v207 = v209;
  if (v209)
  {
    v206 = v207;
    v202 = v207;
    v247 = v207;
    v201 = objc_msgSend(v207, sel_length);
    v192 = 0;
    v245 = 0;
    v246 = v201;
    v190 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254B59048);
    v191 = sub_21279E1F4();
    v189 = v9 + 1;
    sub_212791E3C(MEMORY[0x24BEBB348], v9);
    sub_212791E3C(MEMORY[0x24BEBB370], v189);
    v10 = v191;
    sub_212761414();
    v193 = v10;
    v196 = type metadata accessor for DocumentAttributeKey();
    v195 = type metadata accessor for DocumentType();
    v198 = sub_2127690E4();
    v200 = sub_21279DCF0();
    v244 = v200;
    v194 = objc_msgSend(v202, sel_string);
    v242 = sub_21279DD68();
    v243 = v11;

    v262 = 0;
    swift_bridgeObjectRetain();
    v197 = MEMORY[0x24BEE4AD8] + 8;
    v199 = sub_21279E110();
    v204 = (id)sub_21279DCD8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v241 = v262;
    v231 = 0;
    v232 = v201;
    v205 = objc_msgSend(v202, sel_dataFromRange_documentAttributes_error_, 0, v201, v204, &v241);
    v203 = v241;
    v12 = v241;
    v13 = v262;
    v262 = v203;

    if (v205)
    {
      v188 = v205;
      v183 = v205;
      v184 = sub_21279D99C();
      v185 = v14;
      v258 = v184;
      v259 = v14;

      sub_21279DD8C();
      v186 = sub_21279DD80();
      v187 = v15;
      if (v15)
      {
        v181 = v186;
        v182 = v187;
        v180 = v187;
        v179 = v186;
        v233 = v186;
        v234 = v187;
        swift_bridgeObjectRetain();
        v242 = v179;
        v243 = v180;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      sub_212792480(v184, v185);
      v178 = v210;
    }
    else
    {
      v83 = v262;
      v86 = (id)sub_21279D8C4();

      swift_willThrow();
      v34 = v214;
      v84 = 0;
      v35 = v86;
      v240 = v86;
      v36 = sub_212774050();
      (*(void (**)(char *, uint64_t, uint64_t))(v212 + 16))(v34, v36, v211);
      v37 = v202;
      v85 = 24;
      v98 = 7;
      v38 = swift_allocObject();
      v39 = v86;
      v91 = v38;
      *(_QWORD *)(v38 + 16) = v202;
      v40 = v39;
      v96 = swift_allocObject();
      *(_QWORD *)(v96 + 16) = v86;
      sub_21276E9A4();
      swift_bridgeObjectRelease();
      v110 = sub_21279DAA4();
      v111 = sub_21279DF6C();
      v89 = &v238;
      v238 = 22;
      v87 = sub_212766204();
      v88 = sub_21276626C();
      sub_2127662D4();
      sub_21279DE28();
      v90 = v239;
      v94 = 17;
      v101 = swift_allocObject();
      v93 = 64;
      *(_BYTE *)(v101 + 16) = 64;
      v102 = swift_allocObject();
      v95 = 8;
      *(_BYTE *)(v102 + 16) = 8;
      v97 = 32;
      v41 = swift_allocObject();
      v42 = v91;
      v92 = v41;
      *(_QWORD *)(v41 + 16) = sub_212792718;
      *(_QWORD *)(v41 + 24) = v42;
      v43 = swift_allocObject();
      v44 = v92;
      v103 = v43;
      *(_QWORD *)(v43 + 16) = sub_212767488;
      *(_QWORD *)(v43 + 24) = v44;
      v104 = swift_allocObject();
      *(_BYTE *)(v104 + 16) = v93;
      v105 = swift_allocObject();
      *(_BYTE *)(v105 + 16) = v95;
      v45 = swift_allocObject();
      v46 = v96;
      v99 = v45;
      *(_QWORD *)(v45 + 16) = sub_21276F6EC;
      *(_QWORD *)(v45 + 24) = v46;
      v47 = swift_allocObject();
      v48 = v99;
      v100 = v47;
      *(_QWORD *)(v47 + 16) = sub_212773490;
      *(_QWORD *)(v47 + 24) = v48;
      v49 = swift_allocObject();
      v50 = v100;
      v107 = v49;
      *(_QWORD *)(v49 + 16) = sub_212767488;
      *(_QWORD *)(v49 + 24) = v50;
      v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E0);
      v106 = sub_21279E1F4();
      v108 = v51;
      swift_retain();
      v52 = v101;
      v53 = v108;
      *v108 = sub_21276741C;
      v53[1] = v52;
      swift_retain();
      v54 = v102;
      v55 = v108;
      v108[2] = sub_21276741C;
      v55[3] = v54;
      swift_retain();
      v56 = v103;
      v57 = v108;
      v108[4] = sub_21276F2A8;
      v57[5] = v56;
      swift_retain();
      v58 = v104;
      v59 = v108;
      v108[6] = sub_21276741C;
      v59[7] = v58;
      swift_retain();
      v60 = v105;
      v61 = v108;
      v108[8] = sub_21276741C;
      v61[9] = v60;
      swift_retain();
      v62 = v107;
      v63 = v108;
      v108[10] = sub_21276F2A8;
      v63[11] = v62;
      sub_212761414();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v110, (os_log_type_t)v111))
      {
        v75 = (uint8_t *)sub_21279DFE4();
        v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E8);
        v76 = sub_21276633C(2);
        v77 = sub_21276633C(0);
        v79 = &v237;
        v237 = v75;
        v80 = &v261;
        v261 = v76;
        v81 = &v260;
        v260 = v77;
        v78 = 2;
        sub_212766394(2, &v237);
        sub_212766394(v78, v79);
        v64 = v84;
        v235 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
        v236 = v101;
        sub_2127663A8(&v235, (uint64_t)v79, (uint64_t)v80, (uint64_t)v81);
        v82 = v64;
        if (v64)
        {
          __break(1u);
        }
        else
        {
          v235 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
          v236 = v102;
          sub_2127663A8(&v235, (uint64_t)&v237, (uint64_t)&v261, (uint64_t)&v260);
          v72 = 0;
          v65 = v72;
          v235 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276F2A8;
          v236 = v103;
          sub_2127663A8(&v235, (uint64_t)&v237, (uint64_t)&v261, (uint64_t)&v260);
          v71 = v65;
          v235 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
          v236 = v104;
          sub_2127663A8(&v235, (uint64_t)&v237, (uint64_t)&v261, (uint64_t)&v260);
          v70 = 0;
          v235 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
          v236 = v105;
          sub_2127663A8(&v235, (uint64_t)&v237, (uint64_t)&v261, (uint64_t)&v260);
          v69 = 0;
          v235 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276F2A8;
          v236 = v107;
          sub_2127663A8(&v235, (uint64_t)&v237, (uint64_t)&v261, (uint64_t)&v260);
          v68 = 0;
          _os_log_impl(&dword_212728000, v110, (os_log_type_t)v111, "Failed to convert NSAttributedString [%@] to HTML due to: %@", v75, v90);
          sub_2127663EC(v76);
          sub_2127663EC(v77);
          sub_21279DFCC();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          v73 = v68;
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        v73 = v84;
      }
      v67 = v73;

      (*(void (**)(char *, uint64_t))(v212 + 8))(v214, v211);
      v178 = v67;
    }
    v176 = v178;
    sub_21279DA74();
    v169 = sub_21279D9D8();
    v170 = v16;
    (*(void (**)(char *, uint64_t))(v219 + 8))(v221, v218);
    v271 = v169;
    v272 = v170;
    swift_bridgeObjectRelease();
    v175 = &v242;
    v171 = v242;
    v172 = v243;
    swift_bridgeObjectRetain();
    sub_21279DD8C();
    sub_212763604();
    v173 = sub_21279DD74();
    v174 = v17;
    (*(void (**)(char *, uint64_t))(v226 + 8))(v228, v225);
    swift_bridgeObjectRelease();
    v18 = v273;
    v19 = v274;
    v273 = v173;
    v274 = v174;
    sub_212792590(v18, v19);
    sub_2127677B0();
    swift_bridgeObjectRelease();

    v177 = v176;
  }
  else
  {
    swift_unknownObjectRetain();
    v167 = &v254;
    v254 = v229;
    v168 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B59040);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v165 = v252;
      v166 = v253;
    }
    else
    {
      v165 = 0;
      v166 = 0;
    }
    v163 = v166;
    v164 = v165;
    if (v166)
    {
      v161 = v164;
      v162 = v163;
      v160 = v163;
      v157 = v164;
      v248 = v164;
      v249 = v163;
      sub_21279DA74();
      v155 = sub_21279D9D8();
      v156 = v20;
      (*(void (**)(char *, uint64_t))(v219 + 8))(v221, v218);
      v271 = v155;
      v272 = v156;
      swift_bridgeObjectRelease();
      sub_21279DD8C();
      sub_212763604();
      v158 = sub_21279DD74();
      v159 = v21;
      (*(void (**)(char *, uint64_t))(v226 + 8))(v228, v225);
      v22 = v273;
      v23 = v274;
      v273 = v158;
      v274 = v159;
      sub_212792590(v22, v23);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_unknownObjectRetain();
      objc_opt_self();
      v154 = swift_dynamicCastObjCClass();
      if (v154)
      {
        v153 = (UIImage *)v154;
      }
      else
      {
        v152 = 0;
        swift_unknownObjectRelease();
        v153 = v152;
      }
      v151 = v153;
      if (v153)
      {
        v150 = v151;
        v148 = v151;
        v250 = v151;
        v149 = UIImageJPEGRepresentation(v151, 1.0);
        if (v149)
        {
          v147 = v149;
          v142 = v149;
          v143 = sub_21279D99C();
          v144 = v24;

          v145 = v143;
          v146 = v144;
        }
        else
        {
          v145 = 0;
          v146 = 0xF000000000000000;
        }
        v25 = v273;
        v26 = v274;
        v273 = v145;
        v274 = v146;
        sub_212792590(v25, v26);
        sub_212792620(v224, v216);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v219 + 48))(v216, 1, v218) == 1)
        {
          v133 = 0;
          sub_21279200C((uint64_t)v216);
          v140 = v133;
          v141 = v133;
        }
        else
        {
          v138 = sub_21279D9FC();
          v139 = v27;
          (*(void (**)(char *, uint64_t))(v219 + 8))(v216, v218);
          v140 = v138;
          v141 = v139;
        }
        v263 = v140;
        v264 = v141;
        v137 = v141 == 0;
        v136 = v137;
        sub_2127677B0();
        if (v136)
        {
          sub_21279DA2C();
          v134 = sub_21279D9D8();
          v135 = v28;
          (*(void (**)(char *, uint64_t))(v219 + 8))(v221, v218);
          v271 = v134;
          v272 = v135;
          swift_bridgeObjectRelease();
        }

      }
      else
      {
        swift_unknownObjectRetain();
        v251 = v229;
        if ((swift_dynamicCast() & 1) != 0)
        {
          v131 = v269;
          v132 = v270;
        }
        else
        {
          v131 = 0;
          v132 = 0xF000000000000000;
        }
        v129 = v132;
        v130 = v131;
        if ((v132 & 0xF000000000000000) == 0xF000000000000000)
        {
          sub_212791D10();
          v125 = swift_allocError();
          *(_QWORD *)v29 = 2;
          *(_BYTE *)(v29 + 8) = 2;
          swift_willThrow();
          sub_2127677B0();
          sub_212792430((uint64_t)&v273);
          v126 = v125;
          return v66[1];
        }
        v127 = v130;
        v128 = v129;
        v124 = v129;
        v123 = v130;
        v267 = v130;
        v268 = v129;
        sub_212792508(v130, v129);
        v30 = v273;
        v31 = v274;
        v273 = v123;
        v274 = v124;
        sub_212792590(v30, v31);
        swift_bridgeObjectRetain();
        v271 = v222;
        v272 = v223;
        swift_bridgeObjectRelease();
        sub_212792480(v123, v124);
      }
    }
    v177 = v210;
  }
  v120 = v177;
  v121 = v273;
  v122 = v274;
  sub_2127925D8(v273, v274);
  if ((v122 & 0xF000000000000000) != 0xF000000000000000)
  {
    v118 = v121;
    v119 = v122;
    v113 = v122;
    v114 = v121;
    v265 = v121;
    v266 = v122;
    v117 = &v271;
    v115 = v271;
    v116 = v272;
    swift_bridgeObjectRetain();
    sub_2127677B0();
    sub_212792430((uint64_t)&v273);
    return v114;
  }
  sub_212791D10();
  v112 = swift_allocError();
  *(_QWORD *)v33 = 0;
  *(_BYTE *)(v33 + 8) = 2;
  swift_willThrow();
  sub_2127677B0();
  sub_212792430((uint64_t)&v273);
  v126 = v112;
  return v66[1];
}

void *sub_212777D98(void *a1)
{
  id v1;

  v1 = a1;
  return a1;
}

uint64_t sub_212777DBC(uint64_t a1, uint64_t a2, char a3, char a4, uint64_t a5, double a6, double a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v8 + 240) = v7;
  *(_QWORD *)(v8 + 232) = a5;
  *(double *)(v8 + 224) = a7;
  *(double *)(v8 + 216) = a6;
  *(_BYTE *)(v8 + 330) = a4 & 1;
  *(_BYTE *)(v8 + 329) = a3 & 1;
  *(_QWORD *)(v8 + 208) = a2;
  *(_QWORD *)(v8 + 200) = a1;
  *(_QWORD *)(v8 + 152) = v8;
  *(_QWORD *)(v8 + 160) = 0;
  *(_BYTE *)(v8 + 328) = 0;
  *(_BYTE *)(v8 + 336) = 0;
  *(_QWORD *)(v8 + 120) = 0;
  *(_QWORD *)(v8 + 128) = 0;
  *(_QWORD *)(v8 + 168) = 0;
  *(_QWORD *)(v8 + 176) = 0;
  *(_QWORD *)(v8 + 184) = 0;
  *(_QWORD *)(v8 + 136) = 0;
  *(_QWORD *)(v8 + 144) = 0;
  *(_QWORD *)(v8 + 192) = 0;
  sub_21279DC24();
  *(_QWORD *)(v8 + 248) = swift_task_alloc();
  type metadata accessor for SFAirDropUtilities.FileLoadResult();
  *(_QWORD *)(v8 + 256) = swift_task_alloc();
  *(_QWORD *)(v8 + 264) = __swift_instantiateConcreteTypeFromMangledName(&qword_254B59060);
  *(_QWORD *)(v8 + 272) = swift_task_alloc();
  *(_QWORD *)(v8 + 280) = swift_task_alloc();
  v9 = sub_21279D984();
  *(_QWORD *)(v8 + 288) = v9;
  *(_QWORD *)(v8 + 296) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 304) = swift_task_alloc();
  *(_QWORD *)(v8 + 312) = swift_task_alloc();
  *(_QWORD *)(v8 + 160) = a2;
  *(_BYTE *)(v8 + 328) = a3 & 1;
  *(_BYTE *)(v8 + 336) = a4 & 1;
  *(double *)(v8 + 120) = a6;
  *(double *)(v8 + 128) = a7;
  *(_QWORD *)(v8 + 168) = a5;
  *(_QWORD *)(v8 + 176) = v7;
  return swift_task_switch();
}

uint64_t sub_212777FF0()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  void *v4;
  uint64_t v5;

  v1 = *(_BYTE *)(v0 + 329);
  *(_QWORD *)(v0 + 152) = v0;
  if ((v1 & 1) != 0)
  {
    v2 = *(_QWORD *)(v5 + 280);
    v4 = *(void **)(v5 + 208);
    *(_DWORD *)(v5 + 332) = *(_DWORD *)(*(_QWORD *)(v5 + 264) + 48);
    *(_QWORD *)(v5 + 16) = *(_QWORD *)(v5 + 152);
    *(_QWORD *)(v5 + 56) = v2;
    *(_QWORD *)(v5 + 24) = sub_212778204;
    *(_QWORD *)(v5 + 112) = swift_continuation_init();
    *(_QWORD *)(v5 + 80) = MEMORY[0x24BDAC760];
    *(_DWORD *)(v5 + 88) = 0x40000000;
    *(_DWORD *)(v5 + 92) = 0;
    *(_QWORD *)(v5 + 96) = sub_2127788C8;
    *(_QWORD *)(v5 + 104) = &block_descriptor_0;
    objc_msgSend(v4, sel_loadFileURLRequiringOpenInPlace_completionHandler_, 0, v5 + 80);
    return __swift_continuation_await_point(v5 + 16);
  }
  else
  {
    sub_212774E68(*(void **)(v5 + 208), *(id *)(v5 + 232), 0);
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(*(_QWORD *)(v5 + 152) + 8))();
  }
}

uint64_t sub_212778204()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = (_QWORD *)*v0;
  v1[19] = *v0;
  v1[40] = v1[6];
  return swift_task_switch();
}

uint64_t sub_2127782A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CGImageSource *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(void);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  v12 = *(int *)(v0 + 332);
  v18 = *(_QWORD *)(v0 + 312);
  v1 = *(_QWORD *)(v0 + 296);
  v13 = *(_QWORD *)(v0 + 280);
  v16 = *(_QWORD *)(v0 + 272);
  v15 = *(_QWORD *)(v0 + 264);
  v21 = *(_BYTE *)(v0 + 330);
  *(_QWORD *)(v0 + 152) = v0;
  v14 = *(int *)(v15 + 48);
  v17 = *(void (**)(void))(v1 + 32);
  v17();
  *(_OWORD *)(v16 + v14) = *(_OWORD *)(v13 + v12);
  v2 = (uint64_t *)(v16 + *(int *)(v15 + 48));
  v19 = *v2;
  v20 = v2[1];
  ((void (*)(uint64_t))v17)(v18);
  *(_QWORD *)(v0 + 136) = v19;
  *(_QWORD *)(v0 + 144) = v20;
  if ((v21 & 1) != 0)
    v10 = static SFAirDropUtilities.previewImage(from:suggestedThumbnailSize:)(*(_QWORD *)(v11 + 312), *(double *)(v11 + 216), *(double *)(v11 + 224));
  else
    v10 = 0;
  v3 = *(_QWORD *)(v11 + 296);
  *(_QWORD *)(v11 + 192) = v10;
  (*(void (**)(void))(v3 + 16))();
  sub_212763604();
  sub_21279DC30();
  v8 = *(_QWORD *)(v11 + 312);
  v6 = *(_QWORD *)(v11 + 296);
  v7 = *(_QWORD *)(v11 + 288);
  v9 = *(_QWORD *)(v11 + 256);
  v5 = *(_QWORD *)(v11 + 200);
  sub_212774288(*(_QWORD *)(v11 + 248), v19, v20, (uint64_t)v10, 0, v9);
  sub_212792B50(v9, v5);
  sub_212792C34(v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v7);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v11 + 152) + 8))();
}

uint64_t sub_212778754()
{
  _QWORD *v0;
  id v1;
  id v2;
  id v4;
  void *v5;
  id v6;

  v0[19] = v0;
  swift_willThrow();
  v6 = (id)v0[40];
  v4 = (id)v0[29];
  v5 = (void *)v0[26];
  v1 = v6;
  v0[23] = v6;
  v2 = v6;
  sub_212774E68(v5, v4, v6);

  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[19] + 8))();
}

void sub_2127788C8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;

  v33 = a1;
  v27 = a2;
  v31 = a3;
  v32 = a4;
  v23 = sub_21279D984();
  v24 = *(_QWORD *)(v23 - 8);
  v25 = (*(_QWORD *)(v24 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v19 - v25;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B59060);
  v29 = (*(_QWORD *)(*(_QWORD *)(v28 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)&v19 - v29;
  v5 = v4;
  v6 = v31;
  v7 = v32;
  v34 = *(_QWORD *)(v33 + 32);
  if (v32)
  {
    v22 = v32;
    v20 = (uint64_t)v32;
    v18 = v32;
    sub_212778A88(v34, v20, v28);
  }
  else
  {
    v8 = v27;
    sub_21279D954();
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v30, v26, v23);
    v21 = &v30[*(int *)(v28 + 48)];
    v9 = v31;
    v10 = sub_21279DD68();
    v11 = v21;
    v12 = v28;
    v13 = v10;
    v14 = v34;
    v16 = v15;
    v17 = (uint64_t)v30;
    *(_QWORD *)v21 = v13;
    *((_QWORD *)v11 + 1) = v16;
    sub_212778AE0(v14, v17, v12);

  }
}

uint64_t sub_212778A88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD v7[2];

  v7[1] = a3;
  v7[0] = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586F0);
  return sub_212792178((uint64_t)v7, a1, a3, v3);
}

uint64_t sub_212778AE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B586F0);
  return sub_212792128(a2, a1, a3);
}

uint64_t sub_212778B30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7, char a8, double a9, double a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  *(_QWORD *)(v11 + 656) = v10;
  *(_QWORD *)(v11 + 648) = v33;
  *(_QWORD *)(v11 + 640) = v32;
  *(_QWORD *)(v11 + 632) = v31;
  *(_QWORD *)(v11 + 624) = v30;
  *(_QWORD *)(v11 + 616) = v29;
  *(_QWORD *)(v11 + 608) = v28;
  *(_QWORD *)(v11 + 600) = v27;
  *(double *)(v11 + 592) = a10;
  *(double *)(v11 + 584) = a9;
  *(_BYTE *)(v11 + 313) = v26 & 1;
  *(_BYTE *)(v11 + 299) = a8 & 1;
  *(_BYTE *)(v11 + 298) = a7 & 1;
  *(_BYTE *)(v11 + 297) = a6 & 1;
  *(_QWORD *)(v11 + 576) = a5;
  *(_QWORD *)(v11 + 568) = a4;
  *(_QWORD *)(v11 + 560) = a3;
  *(_QWORD *)(v11 + 552) = a2;
  *(_QWORD *)(v11 + 544) = a1;
  *(_QWORD *)(v11 + 320) = v11;
  *(_QWORD *)(v11 + 328) = 0;
  *(_QWORD *)(v11 + 336) = 0;
  *(_QWORD *)(v11 + 16) = 0;
  *(_QWORD *)(v11 + 24) = 0;
  *(_BYTE *)(v11 + 1160) = 0;
  *(_BYTE *)(v11 + 1168) = 0;
  *(_BYTE *)(v11 + 1176) = 0;
  *(_BYTE *)(v11 + 1184) = 0;
  *(_QWORD *)(v11 + 32) = 0;
  *(_QWORD *)(v11 + 40) = 0;
  *(_QWORD *)(v11 + 48) = 0;
  *(_QWORD *)(v11 + 56) = 0;
  *(_QWORD *)(v11 + 64) = 0;
  *(_QWORD *)(v11 + 72) = 0;
  *(_QWORD *)(v11 + 344) = 0;
  *(_QWORD *)(v11 + 352) = 0;
  *(_QWORD *)(v11 + 360) = 0;
  *(_QWORD *)(v11 + 368) = 0;
  *(_QWORD *)(v11 + 80) = 0;
  *(_QWORD *)(v11 + 88) = 0;
  *(_QWORD *)(v11 + 96) = 0;
  *(_QWORD *)(v11 + 104) = 0;
  *(_QWORD *)(v11 + 392) = 0;
  *(_QWORD *)(v11 + 424) = 0;
  *(_QWORD *)(v11 + 448) = 0;
  *(_QWORD *)(v11 + 464) = 0;
  *(_QWORD *)(v11 + 304) = 0;
  *(_BYTE *)(v11 + 312) = 0;
  *(_QWORD *)(v11 + 128) = 0;
  *(_QWORD *)(v11 + 136) = 0;
  *(_QWORD *)(v11 + 176) = 0;
  *(_QWORD *)(v11 + 184) = 0;
  *(_QWORD *)(v11 + 192) = 0;
  *(_QWORD *)(v11 + 200) = 0;
  *(_QWORD *)(v11 + 208) = 0;
  *(_QWORD *)(v11 + 216) = 0;
  *(_BYTE *)(v11 + 1192) = 0;
  *(_QWORD *)(v11 + 512) = 0;
  *(_QWORD *)(v11 + 520) = 0;
  *(_QWORD *)(v11 + 528) = 0;
  *(_QWORD *)(v11 + 536) = 0;
  *(_QWORD *)(v11 + 256) = 0;
  *(_QWORD *)(v11 + 264) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B58F98);
  *(_QWORD *)(v11 + 664) = swift_task_alloc();
  v16 = sub_21279DC24();
  *(_QWORD *)(v11 + 672) = v16;
  *(_QWORD *)(v11 + 680) = *(_QWORD *)(v16 - 8);
  *(_QWORD *)(v11 + 688) = swift_task_alloc();
  *(_QWORD *)(v11 + 696) = swift_task_alloc();
  *(_QWORD *)(v11 + 704) = swift_task_alloc();
  *(_QWORD *)(v11 + 712) = swift_task_alloc();
  v17 = sub_21279DA80();
  *(_QWORD *)(v11 + 720) = v17;
  *(_QWORD *)(v11 + 728) = *(_QWORD *)(v17 - 8);
  *(_QWORD *)(v11 + 736) = swift_task_alloc();
  v18 = sub_21279D984();
  *(_QWORD *)(v11 + 744) = v18;
  *(_QWORD *)(v11 + 752) = *(_QWORD *)(v18 - 8);
  *(_QWORD *)(v11 + 760) = swift_task_alloc();
  *(_QWORD *)(v11 + 768) = swift_task_alloc();
  *(_QWORD *)(v11 + 776) = swift_task_alloc();
  *(_QWORD *)(v11 + 784) = swift_task_alloc();
  *(_QWORD *)(v11 + 792) = swift_task_alloc();
  *(_QWORD *)(v11 + 800) = swift_task_alloc();
  *(_QWORD *)(v11 + 808) = swift_task_alloc();
  *(_QWORD *)(v11 + 816) = swift_task_alloc();
  *(_QWORD *)(v11 + 824) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B58F90);
  *(_QWORD *)(v11 + 832) = swift_task_alloc();
  *(_QWORD *)(v11 + 840) = swift_task_alloc();
  *(_QWORD *)(v11 + 848) = swift_task_alloc();
  *(_QWORD *)(v11 + 856) = swift_task_alloc();
  *(_QWORD *)(v11 + 864) = swift_task_alloc();
  *(_QWORD *)(v11 + 872) = swift_task_alloc();
  v19 = sub_21279DABC();
  *(_QWORD *)(v11 + 880) = v19;
  *(_QWORD *)(v11 + 888) = *(_QWORD *)(v19 - 8);
  *(_QWORD *)(v11 + 896) = swift_task_alloc();
  *(_QWORD *)(v11 + 904) = swift_task_alloc();
  *(_QWORD *)(v11 + 912) = swift_task_alloc();
  type metadata accessor for SFAirDropUtilities.FileLoadResult();
  *(_QWORD *)(v11 + 920) = swift_task_alloc();
  *(_QWORD *)(v11 + 928) = swift_task_alloc();
  *(_QWORD *)(v11 + 936) = swift_task_alloc();
  *(_QWORD *)(v11 + 944) = swift_task_alloc();
  *(_QWORD *)(v11 + 952) = swift_task_alloc();
  *(_QWORD *)(v11 + 960) = swift_task_alloc();
  *(_QWORD *)(v11 + 328) = a2;
  *(_QWORD *)(v11 + 336) = a3;
  *(_QWORD *)(v11 + 16) = a4;
  *(_QWORD *)(v11 + 24) = a5;
  *(_BYTE *)(v11 + 1160) = a6 & 1;
  *(_BYTE *)(v11 + 1168) = a7 & 1;
  *(_BYTE *)(v11 + 1176) = a8 & 1;
  *(_BYTE *)(v11 + 1184) = v26 & 1;
  *(double *)(v11 + 32) = a9;
  *(double *)(v11 + 40) = a10;
  *(_QWORD *)(v11 + 48) = v27;
  *(_QWORD *)(v11 + 56) = v28;
  *(_QWORD *)(v11 + 64) = v29;
  *(_QWORD *)(v11 + 72) = v30;
  *(_QWORD *)(v11 + 344) = v31;
  *(_QWORD *)(v11 + 352) = v32;
  *(_QWORD *)(v11 + 360) = v33;
  *(_QWORD *)(v11 + 368) = v10;
  return swift_task_switch();
}

uint64_t sub_21277915C()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  id v8;
  _QWORD *v9;
  void (*v10)(uint64_t, uint64_t);
  _QWORD *v11;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint32_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  NSObject *log;
  os_log_type_t v50;
  uint64_t v51;
  id v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint8_t *buf;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint32_t size;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  NSObject *oslog;
  os_log_type_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint8_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t, uint64_t);
  uint64_t v86;
  uint8_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t, uint64_t);
  uint64_t v91;

  v1 = v0[70];
  v2 = (void *)v0[69];
  v0[40] = v0;
  v79 = static SFAirDropUtilities.highestFidelityDataType(for:conformingToDataTypes:)(v2, v1);
  v80 = v3;
  v0[121] = v79;
  v0[122] = v3;
  v0[10] = v79;
  v0[11] = v3;
  swift_bridgeObjectRetain();
  if (v80)
  {
    v4 = *(_QWORD *)(v78 + 640);
    *(_QWORD *)(v78 + 96) = v79;
    *(_QWORD *)(v78 + 104) = v80;
    *(_QWORD *)(v78 + 376) = v4;
    *(_QWORD *)(v78 + 112) = v79;
    *(_QWORD *)(v78 + 120) = v80;
    *(_QWORD *)(v78 + 984) = __swift_instantiateConcreteTypeFromMangledName(&qword_254B59070);
    sub_212792D40();
    if ((sub_21279DE1C() & 1) != 0)
    {
      v53 = *(void **)(v78 + 648);
      v54 = *(id *)(v78 + 552);
      v13 = v53;
      *(_QWORD *)(v78 + 384) = v53;
      v14 = v54;
      if (*(_QWORD *)(v78 + 384))
      {
        v81 = *(void **)(v78 + 384);
      }
      else
      {
        v52 = objc_msgSend(*(id *)(v78 + 552), sel_registeredTypeIdentifiers);
        v51 = sub_21279DE40();
        sub_212791D10();
        v81 = (void *)swift_allocError();
        *(_QWORD *)v15 = v51;
        *(_BYTE *)(v15 + 8) = 1;

        sub_212792DB0((id *)(v78 + 384));
      }
      v16 = *(_QWORD *)(v78 + 904);
      v28 = *(_QWORD *)(v78 + 888);
      v29 = *(_QWORD *)(v78 + 880);
      v30 = *(id *)(v78 + 552);

      *(_QWORD *)(v78 + 392) = v81;
      v17 = sub_212774050();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v16, v17, v29);
      swift_bridgeObjectRetain();
      v32 = swift_allocObject();
      *(_QWORD *)(v32 + 16) = v79;
      *(_QWORD *)(v32 + 24) = v80;
      v18 = v30;
      v34 = swift_allocObject();
      *(_QWORD *)(v34 + 16) = v30;
      v19 = v81;
      v36 = swift_allocObject();
      *(_QWORD *)(v36 + 16) = v81;
      sub_21276E9A4();
      swift_bridgeObjectRelease();
      log = sub_21279DAA4();
      v50 = sub_21279DF6C();
      *(_QWORD *)(v78 + 400) = 32;
      sub_212766204();
      sub_21276626C();
      sub_2127662D4();
      sub_21279DE28();
      v31 = *(_DWORD *)(v78 + 300);
      v39 = swift_allocObject();
      *(_BYTE *)(v39 + 16) = 32;
      v40 = swift_allocObject();
      *(_BYTE *)(v40 + 16) = 8;
      v33 = swift_allocObject();
      *(_QWORD *)(v33 + 16) = sub_212792E14;
      *(_QWORD *)(v33 + 24) = v32;
      v41 = swift_allocObject();
      *(_QWORD *)(v41 + 16) = sub_212767488;
      *(_QWORD *)(v41 + 24) = v33;
      v42 = swift_allocObject();
      *(_BYTE *)(v42 + 16) = 64;
      v43 = swift_allocObject();
      *(_BYTE *)(v43 + 16) = 8;
      v35 = swift_allocObject();
      *(_QWORD *)(v35 + 16) = sub_212792718;
      *(_QWORD *)(v35 + 24) = v34;
      v44 = swift_allocObject();
      *(_QWORD *)(v44 + 16) = sub_212767488;
      *(_QWORD *)(v44 + 24) = v35;
      v45 = swift_allocObject();
      *(_BYTE *)(v45 + 16) = 64;
      v46 = swift_allocObject();
      *(_BYTE *)(v46 + 16) = 8;
      v37 = swift_allocObject();
      *(_QWORD *)(v37 + 16) = sub_21276F6EC;
      *(_QWORD *)(v37 + 24) = v36;
      v38 = swift_allocObject();
      *(_QWORD *)(v38 + 16) = sub_212773490;
      *(_QWORD *)(v38 + 24) = v37;
      v47 = swift_allocObject();
      *(_QWORD *)(v47 + 16) = sub_212767488;
      *(_QWORD *)(v47 + 24) = v38;
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E0);
      sub_21279E1F4();
      v48 = v20;
      swift_retain();
      *v48 = sub_21276741C;
      v48[1] = v39;
      swift_retain();
      v48[2] = sub_21276741C;
      v48[3] = v40;
      swift_retain();
      v48[4] = sub_2127674D0;
      v48[5] = v41;
      swift_retain();
      v48[6] = sub_21276741C;
      v48[7] = v42;
      swift_retain();
      v48[8] = sub_21276741C;
      v48[9] = v43;
      swift_retain();
      v48[10] = sub_21276F2A8;
      v48[11] = v44;
      swift_retain();
      v48[12] = sub_21276741C;
      v48[13] = v45;
      swift_retain();
      v48[14] = sub_21276741C;
      v48[15] = v46;
      swift_retain();
      v48[16] = sub_21276F2A8;
      v48[17] = v47;
      sub_212761414();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(log, v50))
      {
        v25 = (uint8_t *)sub_21279DFE4();
        __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E8);
        v26 = sub_21276633C(2);
        v27 = sub_21276633C(1);
        v82 = v25;
        v83 = v26;
        v84 = v27;
        sub_212766394(2, &v82);
        sub_212766394(3, &v82);
        v85 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
        v86 = v39;
        sub_2127663A8(&v85, (uint64_t)&v82, (uint64_t)&v83, (uint64_t)&v84);
        v85 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
        v86 = v40;
        sub_2127663A8(&v85, (uint64_t)&v82, (uint64_t)&v83, (uint64_t)&v84);
        v85 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2127674D0;
        v86 = v41;
        sub_2127663A8(&v85, (uint64_t)&v82, (uint64_t)&v83, (uint64_t)&v84);
        v85 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
        v86 = v42;
        sub_2127663A8(&v85, (uint64_t)&v82, (uint64_t)&v83, (uint64_t)&v84);
        v85 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
        v86 = v43;
        sub_2127663A8(&v85, (uint64_t)&v82, (uint64_t)&v83, (uint64_t)&v84);
        v85 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276F2A8;
        v86 = v44;
        sub_2127663A8(&v85, (uint64_t)&v82, (uint64_t)&v83, (uint64_t)&v84);
        v85 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
        v86 = v45;
        sub_2127663A8(&v85, (uint64_t)&v82, (uint64_t)&v83, (uint64_t)&v84);
        v85 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
        v86 = v46;
        sub_2127663A8(&v85, (uint64_t)&v82, (uint64_t)&v83, (uint64_t)&v84);
        v85 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276F2A8;
        v86 = v47;
        sub_2127663A8(&v85, (uint64_t)&v82, (uint64_t)&v83, (uint64_t)&v84);
        _os_log_impl(&dword_212728000, log, v50, "Attempting to load data type %s which was already attempted. Aborting load for item provider %@ with error %@", v25, v31);
        sub_2127663EC(v26);
        sub_2127663EC(v27);
        sub_21279DFCC();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
      v23 = *(_QWORD *)(v78 + 904);
      v22 = *(_QWORD *)(v78 + 888);
      v24 = *(_QWORD *)(v78 + 880);

      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v23, v24);
      swift_willThrow();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(*(_QWORD *)(v78 + 320) + 8))();
    }
    else
    {
      v5 = *(_QWORD *)(v78 + 912);
      v61 = *(_QWORD *)(v78 + 888);
      v62 = *(_QWORD *)(v78 + 880);
      v63 = *(id *)(v78 + 552);
      v6 = sub_212774050();
      v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v61 + 16);
      *(_QWORD *)(v78 + 992) = v7;
      v7(v5, v6, v62);
      swift_bridgeObjectRetain();
      v65 = swift_allocObject();
      *(_QWORD *)(v65 + 16) = v79;
      *(_QWORD *)(v65 + 24) = v80;
      v8 = v63;
      v67 = swift_allocObject();
      *(_QWORD *)(v67 + 16) = v63;
      oslog = sub_21279DAA4();
      v77 = sub_21279DF60();
      *(_QWORD *)(v78 + 408) = 22;
      *(_QWORD *)(v78 + 1000) = sub_212766204();
      *(_QWORD *)(v78 + 1008) = sub_21276626C();
      *(_QWORD *)(v78 + 1016) = sub_2127662D4();
      sub_21279DE28();
      size = *(_DWORD *)(v78 + 316);
      v69 = swift_allocObject();
      *(_BYTE *)(v69 + 16) = 32;
      v70 = swift_allocObject();
      *(_BYTE *)(v70 + 16) = 8;
      v66 = swift_allocObject();
      *(_QWORD *)(v66 + 16) = sub_212792E14;
      *(_QWORD *)(v66 + 24) = v65;
      v71 = swift_allocObject();
      *(_QWORD *)(v71 + 16) = sub_212767488;
      *(_QWORD *)(v71 + 24) = v66;
      v72 = swift_allocObject();
      *(_BYTE *)(v72 + 16) = 64;
      v73 = swift_allocObject();
      *(_BYTE *)(v73 + 16) = 8;
      v68 = swift_allocObject();
      *(_QWORD *)(v68 + 16) = sub_212792718;
      *(_QWORD *)(v68 + 24) = v67;
      v74 = swift_allocObject();
      *(_QWORD *)(v74 + 16) = sub_212767488;
      *(_QWORD *)(v74 + 24) = v68;
      *(_QWORD *)(v78 + 1024) = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E0);
      sub_21279E1F4();
      v75 = v9;
      swift_retain();
      *v75 = sub_21276741C;
      v75[1] = v69;
      swift_retain();
      v75[2] = sub_21276741C;
      v75[3] = v70;
      swift_retain();
      v75[4] = sub_2127674D0;
      v75[5] = v71;
      swift_retain();
      v75[6] = sub_21276741C;
      v75[7] = v72;
      swift_retain();
      v75[8] = sub_21276741C;
      v75[9] = v73;
      swift_retain();
      v75[10] = sub_21276F2A8;
      v75[11] = v74;
      sub_212761414();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(oslog, v77))
      {
        buf = (uint8_t *)sub_21279DFE4();
        __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E8);
        v59 = sub_21276633C(1);
        v60 = sub_21276633C(1);
        v87 = buf;
        v88 = v59;
        v89 = v60;
        sub_212766394(2, &v87);
        sub_212766394(2, &v87);
        v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
        v91 = v69;
        sub_2127663A8(&v90, (uint64_t)&v87, (uint64_t)&v88, (uint64_t)&v89);
        v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
        v91 = v70;
        sub_2127663A8(&v90, (uint64_t)&v87, (uint64_t)&v88, (uint64_t)&v89);
        v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2127674D0;
        v91 = v71;
        sub_2127663A8(&v90, (uint64_t)&v87, (uint64_t)&v88, (uint64_t)&v89);
        v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
        v91 = v72;
        sub_2127663A8(&v90, (uint64_t)&v87, (uint64_t)&v88, (uint64_t)&v89);
        v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
        v91 = v73;
        sub_2127663A8(&v90, (uint64_t)&v87, (uint64_t)&v88, (uint64_t)&v89);
        v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276F2A8;
        v91 = v74;
        sub_2127663A8(&v90, (uint64_t)&v87, (uint64_t)&v88, (uint64_t)&v89);
        _os_log_impl(&dword_212728000, oslog, v77, "Loading data type %s from item provider %@", buf, size);
        sub_2127663EC(v59);
        sub_2127663EC(v60);
        sub_21279DFCC();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
      v56 = *(_QWORD *)(v78 + 912);
      v55 = *(_QWORD *)(v78 + 888);
      v57 = *(_QWORD *)(v78 + 880);

      v10 = *(void (**)(uint64_t, uint64_t))(v55 + 8);
      *(_QWORD *)(v78 + 1032) = v10;
      v10(v56, v57);
      v11 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v78 + 1040) = v11;
      *v11 = *(_QWORD *)(v78 + 320);
      v11[1] = sub_21277B418;
      return sub_212784D00(v79, v80);
    }
  }
  else
  {
    v21 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v78 + 1096) = v21;
    *v21 = *(_QWORD *)(v78 + 320);
    v21[1] = sub_212780758;
    return sub_212777DBC(*(_QWORD *)(v78 + 928), *(_QWORD *)(v78 + 552), *(_BYTE *)(v78 + 297) & 1, *(_BYTE *)(v78 + 299) & 1, *(_QWORD *)(v78 + 648), *(double *)(v78 + 584), *(double *)(v78 + 592));
  }
}

uint64_t sub_21277B418(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[40] = *v2;
  v3[131] = a1;
  v3[132] = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21277B4C4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  _QWORD *v5;
  void *v7;
  __n128 v8;
  uint64_t v9;
  void *v10;
  __n128 v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  CGImageSource *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  _QWORD *v26;
  id v27;
  uint64_t v28;
  _QWORD *v29;
  id v30;
  id v31;
  id v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  char v42;
  char v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  id v59;
  void *v60;
  unsigned __int8 v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(uint64_t, uint64_t);
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint8_t *buf;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void (*v74)(uint64_t, uint64_t, uint64_t);
  uint64_t v75;
  uint64_t v76;
  uint32_t size;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _QWORD *v89;
  NSObject *oslog;
  os_log_type_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  id v108;
  char v109;
  uint64_t v110;
  void *v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
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
  id v135;
  id v136;
  uint64_t v137;
  id v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  id v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  id v165;
  void (*v166)(uint64_t, uint64_t);
  id v167;
  CGImageSource *v168;
  void (*v169)(uint64_t, uint64_t, uint64_t);
  char v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  id v175;
  void *v176;
  uint64_t v177;
  uint64_t v178;
  id v179;
  BOOL v180;
  char v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  CGImageSource *v194;
  char v195;
  unsigned int (*v196)(_QWORD, uint64_t, _QWORD);
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  void (*v207)(uint64_t, uint64_t);
  BOOL v208;
  const void *v209;
  uint64_t v210;
  uint64_t v211;
  void *v212;
  uint64_t v213;
  uint64_t v214;
  id v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  void *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint8_t *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t (*v229)(uint64_t, uint64_t, uint64_t);
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  char v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;

  v224 = v0[131];
  v223 = v0[122];
  v222 = v0[121];
  v0[40] = v0;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v0[52] = v224;
  swift_bridgeObjectRetain();
  v0[16] = v222;
  v0[17] = v223;
  objc_opt_self();
  v225 = swift_dynamicCastObjCClass();
  if (v225)
  {
    v220 = (void *)v225;
  }
  else
  {
    swift_unknownObjectRelease();
    v220 = 0;
  }
  if (v220)
  {
    v215 = objc_msgSend(v220, sel_string);
    v216 = sub_21279DD68();
    v217 = v1;

    v218 = v216;
    v219 = v217;
  }
  else
  {
    v218 = 0;
    v219 = 0;
  }
  *(_QWORD *)(v221 + 160) = v218;
  *(_QWORD *)(v221 + 168) = v219;
  if (*(_QWORD *)(v221 + 168))
  {
    swift_unknownObjectRelease();
    *(_OWORD *)(v221 + 144) = *(_OWORD *)(v221 + 160);
  }
  else
  {
    *(_QWORD *)(v221 + 488) = *(_QWORD *)(v221 + 1048);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B59040);
    if ((swift_dynamicCast() & 1) == 0)
    {
      *(_QWORD *)(v221 + 144) = 0;
      *(_QWORD *)(v221 + 152) = 0;
    }
    sub_2127677B0();
  }
  v213 = *(_QWORD *)(v221 + 144);
  v214 = *(_QWORD *)(v221 + 152);
  *(_QWORD *)(v221 + 1064) = v214;
  *(_QWORD *)(v221 + 176) = v213;
  *(_QWORD *)(v221 + 184) = v214;
  swift_bridgeObjectRetain();
  if (v214)
  {
    v209 = *(const void **)(v221 + 872);
    v212 = *(void **)(v221 + 864);
    v210 = *(_QWORD *)(v221 + 752);
    v211 = *(_QWORD *)(v221 + 744);
    *(_QWORD *)(v221 + 256) = v213;
    *(_QWORD *)(v221 + 264) = v214;
    sub_21279D96C();
    sub_212793674(v209, v212);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v210 + 48))(v212, 1, v211) == 1)
    {
      sub_2127730D0(*(_QWORD *)(v221 + 864));
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v221 + 752) + 32))(*(_QWORD *)(v221 + 824), *(_QWORD *)(v221 + 864), *(_QWORD *)(v221 + 744));
      *(_QWORD *)(v221 + 272) = sub_21279D960();
      *(_QWORD *)(v221 + 280) = v2;
      v208 = *(_QWORD *)(v221 + 280) != 0;
      sub_2127677B0();
      if (v208)
      {
        v205 = *(_QWORD *)(v221 + 824);
        v199 = *(_QWORD *)(v221 + 816);
        v198 = *(_QWORD *)(v221 + 752);
        v206 = *(_QWORD *)(v221 + 744);
        v201 = *(_QWORD *)(v221 + 736);
        v200 = *(_QWORD *)(v221 + 728);
        v202 = *(_QWORD *)(v221 + 720);
        (*(void (**)(uint64_t))(v198 + 16))(v199);
        *(_QWORD *)(v221 + 416) = sub_21279D924();
        swift_unknownObjectRelease();
        v207 = *(void (**)(uint64_t, uint64_t))(v198 + 8);
        v207(v199, v206);
        sub_21279DA14();
        v203 = sub_21279D9D8();
        v204 = v3;
        (*(void (**)(uint64_t, uint64_t))(v200 + 8))(v201, v202);
        *(_QWORD *)(v221 + 128) = v203;
        *(_QWORD *)(v221 + 136) = v204;
        swift_bridgeObjectRelease();
        v207(v205, v206);
      }
      else
      {
        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v221 + 752) + 8))(*(_QWORD *)(v221 + 824), *(_QWORD *)(v221 + 744));
      }
    }
    sub_2127730D0(*(_QWORD *)(v221 + 872));
    swift_bridgeObjectRelease();
  }
  v197 = *(_QWORD *)(v221 + 416);
  swift_unknownObjectRetain();
  *(_QWORD *)(v221 + 496) = v197;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B59040);
  if ((swift_dynamicCast() & 1) != 0)
    (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(v221 + 752) + 56))(*(_QWORD *)(v221 + 856), 0, 1, *(_QWORD *)(v221 + 744));
  else
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v221 + 752) + 56))(*(_QWORD *)(v221 + 856), 1, 1, *(_QWORD *)(v221 + 744));
  v196 = *(unsigned int (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v221 + 752) + 48);
  if (v196(*(_QWORD *)(v221 + 856), 1, *(_QWORD *)(v221 + 744)) != 1)
  {
    v195 = *(_BYTE *)(v221 + 299);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v221 + 752) + 32))(*(_QWORD *)(v221 + 808), *(_QWORD *)(v221 + 856), *(_QWORD *)(v221 + 744));
    if ((v195 & 1) != 0)
      v194 = static SFAirDropUtilities.previewImage(from:suggestedThumbnailSize:)(*(_QWORD *)(v221 + 808), *(double *)(v221 + 584), *(double *)(v221 + 592));
    else
      v194 = 0;
    *(_QWORD *)(v221 + 1072) = v194;
    v4 = *(_BYTE *)(v221 + 313);
    *(_QWORD *)(v221 + 536) = v194;
    if ((v4 & 1) != 0)
    {
      v5 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v221 + 1080) = v5;
      *v5 = *(_QWORD *)(v221 + 320);
      v5[1] = sub_2127801F4;
      return sub_2127864F8(*(_QWORD *)(v221 + 712), *(_QWORD *)(v221 + 808), *(_QWORD *)(v221 + 600), *(_QWORD *)(v221 + 608));
    }
    v7 = *(void **)(v221 + 1056);
    (*(void (**)(void))(*(_QWORD *)(v221 + 752) + 16))();
    sub_212763604();
    sub_21279DC30();
    if (!v7)
    {
      v185 = *(_QWORD *)(v221 + 1072);
      v187 = *(_QWORD *)(v221 + 960);
      v186 = *(_QWORD *)(v221 + 952);
      v192 = *(_QWORD *)(v221 + 808);
      v191 = *(_QWORD *)(v221 + 752);
      v193 = *(_QWORD *)(v221 + 744);
      v190 = *(_QWORD *)(v221 + 712);
      v182 = *(_QWORD *)(v221 + 704);
      v188 = *(_QWORD *)(v221 + 680);
      v189 = *(_QWORD *)(v221 + 672);
      (*(void (**)(void))(v188 + 16))();
      v183 = *(_QWORD *)(v221 + 128);
      v184 = *(_QWORD *)(v221 + 136);
      swift_bridgeObjectRetain();
      sub_212774288(v182, v183, v184, v185, 0, v186);
      v8 = sub_212792CAC(v186, v187);
      (*(void (**)(uint64_t, uint64_t, __n128))(v188 + 8))(v190, v189, v8);
      (*(void (**)(uint64_t, uint64_t))(v191 + 8))(v192, v193);
LABEL_77:
      swift_bridgeObjectRelease();
      sub_2127677B0();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      v92 = *(_QWORD *)(v221 + 960);
      sub_212792B50(v92, *(_QWORD *)(v221 + 544));
      sub_212792C34(v92);
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(*(_QWORD *)(v221 + 320) + 8))();
    }
    v52 = *(_QWORD *)(v221 + 808);
    v51 = *(_QWORD *)(v221 + 752);
    v53 = *(_QWORD *)(v221 + 744);

    (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v52, v53);
    swift_bridgeObjectRelease();
    sub_2127677B0();
    swift_unknownObjectRelease();
    v179 = v7;
    goto LABEL_79;
  }
  v181 = *(_BYTE *)(v221 + 298);
  sub_2127730D0(*(_QWORD *)(v221 + 856));
  swift_bridgeObjectRetain();
  if ((v181 & 1) != 0)
  {
    v233 = v213;
    v234 = v214;
    v180 = v214 != 0;
  }
  else
  {
    v180 = 0;
  }
  swift_bridgeObjectRelease();
  if (v180)
  {
    sub_212791D10();
    v178 = swift_allocError();
    *(_QWORD *)v9 = 1;
    *(_BYTE *)(v9 + 8) = 2;
    swift_willThrow();
    swift_bridgeObjectRelease();
    sub_2127677B0();
    swift_unknownObjectRelease();
    v179 = (id)v178;
    goto LABEL_79;
  }
  swift_unknownObjectRetain();
  objc_opt_self();
  v177 = swift_dynamicCastObjCClass();
  if (v177)
  {
    v176 = (void *)v177;
  }
  else
  {
    swift_unknownObjectRelease();
    v176 = 0;
  }
  if (!v176)
  {
LABEL_62:
    v12 = *(void **)(v221 + 1056);
    v120 = *(char **)(v221 + 664);
    v122 = *(_QWORD *)(v221 + 576);
    v121 = *(_QWORD *)(v221 + 568);
    v117 = *(_QWORD *)(v221 + 128);
    v118 = *(_QWORD *)(v221 + 136);
    swift_bridgeObjectRetain();
    sub_212786E00(v117, v118, 1, v120);
    v119 = *(_QWORD *)(v221 + 416);
    swift_unknownObjectRetain();
    v123 = sub_212776908(v119, v120, v121, v122);
    v124 = v13;
    v125 = v14;
    v126 = v15;
    if (!v12)
    {
      swift_unknownObjectRelease();
      *(_QWORD *)(v221 + 192) = v123;
      *(_QWORD *)(v221 + 200) = v124;
      *(_QWORD *)(v221 + 208) = v125;
      *(_QWORD *)(v221 + 216) = v126;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v221 + 240) = v125;
      *(_QWORD *)(v221 + 248) = v126;
      if (*(_QWORD *)(v221 + 248))
      {
        *(_OWORD *)(v221 + 224) = *(_OWORD *)(v221 + 240);
      }
      else
      {
        sub_212793614((_QWORD *)(v221 + 128), (_QWORD *)(v221 + 224));
        sub_2127677B0();
      }
      v116 = *(_QWORD *)(v221 + 608);
      v113 = *(_QWORD *)(v221 + 224);
      v114 = *(_QWORD *)(v221 + 232);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      *(_QWORD *)(v221 + 128) = v113;
      *(_QWORD *)(v221 + 136) = v114;
      swift_bridgeObjectRelease();
      sub_212792508(v123, v124);
      v112 = (id)sub_21279D990();
      sub_212792480(v123, v124);
      v115 = (id)sub_21279DD5C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      if (v116)
      {
        v110 = sub_21279DD5C();
        swift_bridgeObjectRelease();
        v111 = (void *)v110;
      }
      else
      {
        v111 = 0;
      }
      v106 = *(_QWORD *)(v221 + 816);
      v105 = *(_QWORD *)(v221 + 768);
      v104 = *(_QWORD *)(v221 + 752);
      v107 = *(_QWORD *)(v221 + 744);
      v109 = *(_BYTE *)(v221 + 299);
      swift_bridgeObjectRetain();
      v103 = (id)sub_21279DD5C();
      swift_bridgeObjectRelease();
      v108 = (id)SFSaveDataToTempFile();

      sub_21279D954();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v104 + 32))(v105, v106, v107);

      *(_QWORD *)(v221 + 504) = 0;
      if ((v109 & 1) != 0)
      {
        swift_unknownObjectRetain();
        objc_opt_self();
        v102 = swift_dynamicCastObjCClass();
        if (v102)
        {
          v101 = (void *)v102;
        }
        else
        {
          swift_unknownObjectRelease();
          v101 = 0;
        }
        if (v101)
        {
          *(_QWORD *)(v221 + 512) = v101;
          v16 = v101;
          v17 = *(void **)(v221 + 504);
          *(_QWORD *)(v221 + 504) = v101;

        }
        else
        {
          v18 = static SFAirDropUtilities.previewImage(from:suggestedThumbnailSize:)(*(_QWORD *)(v221 + 768), *(double *)(v221 + 584), *(double *)(v221 + 592));
          v19 = *(void **)(v221 + 504);
          *(_QWORD *)(v221 + 504) = v18;

        }
      }
      v231 = v213;
      v232 = v214;
      v20 = *(_QWORD *)(v221 + 752);
      *(_BYTE *)(v221 + 1192) = v214 != 0;
      (*(void (**)(void))(v20 + 16))();
      sub_212763604();
      sub_21279DC30();
      v96 = *(_QWORD *)(v221 + 960);
      v95 = *(_QWORD *)(v221 + 936);
      v99 = *(_QWORD *)(v221 + 768);
      v97 = *(_QWORD *)(v221 + 752);
      v98 = *(_QWORD *)(v221 + 744);
      v94 = *(_QWORD *)(v221 + 688);
      v100 = *(_QWORD *)(v221 + 664);
      v93 = *(void **)(v221 + 504);
      v21 = v93;
      sub_212774288(v94, v113, v114, (uint64_t)v93, v214 != 0, v95);
      sub_212792CAC(v95, v96);
      sub_21276ED58((id *)(v221 + 504));
      (*(void (**)(uint64_t, uint64_t))(v97 + 8))(v99, v98);
      swift_bridgeObjectRelease();
      sub_212792480(v123, v124);
      sub_21279200C(v100);
      goto LABEL_77;
    }
    v48 = *(_QWORD *)(v221 + 664);
    swift_unknownObjectRelease();
    sub_21279200C(v48);
    swift_bridgeObjectRelease();
    sub_2127677B0();
    swift_unknownObjectRelease();
    v179 = v12;
    goto LABEL_79;
  }
  *(_QWORD *)(v221 + 520) = v176;
  v175 = objc_msgSend(v176, sel_imageURL);
  if (v175)
  {
    v174 = *(_QWORD *)(v221 + 848);
    v171 = *(_QWORD *)(v221 + 816);
    v172 = *(_QWORD *)(v221 + 752);
    v173 = *(_QWORD *)(v221 + 744);
    sub_21279D954();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v172 + 32))(v174, v171, v173);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v172 + 56))(v174, 0, 1, v173);

  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v221 + 752) + 56))(*(_QWORD *)(v221 + 848), 1, 1, *(_QWORD *)(v221 + 744));
  }
  if (v196(*(_QWORD *)(v221 + 848), 1, *(_QWORD *)(v221 + 744)) == 1)
  {
    sub_2127730D0(*(_QWORD *)(v221 + 848));

    goto LABEL_62;
  }
  v170 = *(_BYTE *)(v221 + 299);
  v169 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v221 + 752) + 32);
  v169(*(_QWORD *)(v221 + 792), *(_QWORD *)(v221 + 848), *(_QWORD *)(v221 + 744));
  if ((v170 & 1) != 0)
    v168 = static SFAirDropUtilities.previewImage(from:suggestedThumbnailSize:)(*(_QWORD *)(v221 + 792), *(double *)(v221 + 584), *(double *)(v221 + 592));
  else
    v168 = 0;
  v164 = *(_QWORD *)(v221 + 816);
  v162 = *(_QWORD *)(v221 + 752);
  v163 = *(_QWORD *)(v221 + 744);
  v160 = *(_QWORD *)(v221 + 624);
  v161 = *(_QWORD *)(v221 + 616);
  *(_QWORD *)(v221 + 528) = v168;
  type metadata accessor for SFAirDropUtilities();
  sub_212786C8C(v161, v160, v164);
  v165 = (id)sub_21279D924();
  v166 = *(void (**)(uint64_t, uint64_t))(v162 + 8);
  v166(v164, v163);
  v167 = objc_msgSend(v176, sel_videoURL);
  if (v167)
  {
    v159 = *(_QWORD *)(v221 + 840);
    v156 = *(_QWORD *)(v221 + 816);
    v157 = *(_QWORD *)(v221 + 752);
    v158 = *(_QWORD *)(v221 + 744);
    sub_21279D954();
    v169(v159, v156, v158);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v157 + 56))(v159, 0, 1, v158);

  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v221 + 752) + 56))(*(_QWORD *)(v221 + 840), 1, 1, *(_QWORD *)(v221 + 744));
  }
  if (v196(*(_QWORD *)(v221 + 840), 1, *(_QWORD *)(v221 + 744)) == 1)
  {
    v155 = 0;
  }
  else
  {
    v153 = *(_QWORD *)(v221 + 840);
    v152 = *(_QWORD *)(v221 + 744);
    v154 = sub_21279D924();
    v166(v153, v152);
    v155 = (void *)v154;
  }
  v151 = objc_msgSend(v176, sel_imageURL);
  if (v151)
  {
    v150 = *(_QWORD *)(v221 + 832);
    v147 = *(_QWORD *)(v221 + 816);
    v148 = *(_QWORD *)(v221 + 752);
    v149 = *(_QWORD *)(v221 + 744);
    sub_21279D954();
    v169(v150, v147, v149);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v148 + 56))(v150, 0, 1, v149);

  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v221 + 752) + 56))(*(_QWORD *)(v221 + 832), 1, 1, *(_QWORD *)(v221 + 744));
  }
  if (v196(*(_QWORD *)(v221 + 832), 1, *(_QWORD *)(v221 + 744)) == 1)
  {
    v146 = 0;
  }
  else
  {
    v144 = *(_QWORD *)(v221 + 832);
    v143 = *(_QWORD *)(v221 + 744);
    v145 = sub_21279D924();
    v166(v144, v143);
    v146 = (void *)v145;
  }
  v10 = *(void **)(v221 + 1056);
  v137 = *(_QWORD *)(v221 + 816);
  v140 = *(_QWORD *)(v221 + 784);
  v142 = *(_QWORD *)(v221 + 776);
  v139 = *(_QWORD *)(v221 + 752);
  v141 = *(_QWORD *)(v221 + 744);
  v135 = objc_msgSend(v176, sel_uniqueIdentifier);
  sub_21279DD68();
  v136 = (id)sub_21279DD5C();
  swift_bridgeObjectRelease();

  v138 = (id)SFCreateLivePhotoBundle();
  sub_21279D954();
  v169(v140, v137, v141);

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v139 + 16))(v142, v140, v141);
  sub_212763604();
  sub_21279DC30();
  if (!v10)
  {
    v131 = *(_QWORD *)(v221 + 960);
    v130 = *(_QWORD *)(v221 + 944);
    v133 = *(_QWORD *)(v221 + 792);
    v132 = *(_QWORD *)(v221 + 784);
    v134 = *(_QWORD *)(v221 + 744);
    v127 = *(_QWORD *)(v221 + 696);
    v128 = *(_QWORD *)(v221 + 128);
    v129 = *(_QWORD *)(v221 + 136);
    swift_bridgeObjectRetain();
    sub_212774288(v127, v128, v129, (uint64_t)v168, 0, v130);
    v11 = sub_212792CAC(v130, v131);
    ((void (*)(uint64_t, uint64_t, __n128))v166)(v132, v134, v11);
    v166(v133, v134);

    goto LABEL_77;
  }
  v49 = *(_QWORD *)(v221 + 792);
  v50 = *(_QWORD *)(v221 + 744);
  ((void (*)(_QWORD))v166)(*(_QWORD *)(v221 + 784));

  v166(v49, v50);
  swift_bridgeObjectRelease();
  sub_2127677B0();
  swift_unknownObjectRelease();
  v179 = v10;
LABEL_79:
  *(_QWORD *)(v221 + 1112) = v179;
  v74 = *(void (**)(uint64_t, uint64_t, uint64_t))(v221 + 992);
  v75 = *(_QWORD *)(v221 + 968);
  v22 = *(_QWORD *)(v221 + 896);
  v73 = *(_QWORD *)(v221 + 880);
  v76 = *(_QWORD *)(v221 + 976);
  v23 = v179;
  *(_QWORD *)(v221 + 424) = v179;
  v24 = sub_212774050();
  v74(v22, v24, v73);
  swift_bridgeObjectRetain();
  v78 = swift_allocObject();
  *(_QWORD *)(v78 + 16) = v75;
  *(_QWORD *)(v78 + 24) = v76;
  v25 = v179;
  v80 = swift_allocObject();
  *(_QWORD *)(v80 + 16) = v179;
  sub_21276E9A4();
  swift_bridgeObjectRelease();
  oslog = sub_21279DAA4();
  v91 = sub_21279DF6C();
  *(_QWORD *)(v221 + 432) = 22;
  sub_21279DE28();
  size = *(_DWORD *)(v221 + 1164);
  v83 = swift_allocObject();
  *(_BYTE *)(v83 + 16) = 32;
  v84 = swift_allocObject();
  *(_BYTE *)(v84 + 16) = 8;
  v79 = swift_allocObject();
  *(_QWORD *)(v79 + 16) = sub_212792E14;
  *(_QWORD *)(v79 + 24) = v78;
  v85 = swift_allocObject();
  *(_QWORD *)(v85 + 16) = sub_212767488;
  *(_QWORD *)(v85 + 24) = v79;
  v86 = swift_allocObject();
  *(_BYTE *)(v86 + 16) = 64;
  v87 = swift_allocObject();
  *(_BYTE *)(v87 + 16) = 8;
  v81 = swift_allocObject();
  *(_QWORD *)(v81 + 16) = sub_21276F6EC;
  *(_QWORD *)(v81 + 24) = v80;
  v82 = swift_allocObject();
  *(_QWORD *)(v82 + 16) = sub_212773490;
  *(_QWORD *)(v82 + 24) = v81;
  v88 = swift_allocObject();
  *(_QWORD *)(v88 + 16) = sub_212767488;
  *(_QWORD *)(v88 + 24) = v82;
  sub_21279E1F4();
  v89 = v26;
  swift_retain();
  *v89 = sub_21276741C;
  v89[1] = v83;
  swift_retain();
  v89[2] = sub_21276741C;
  v89[3] = v84;
  swift_retain();
  v89[4] = sub_2127674D0;
  v89[5] = v85;
  swift_retain();
  v89[6] = sub_21276741C;
  v89[7] = v86;
  swift_retain();
  v89[8] = sub_21276741C;
  v89[9] = v87;
  swift_retain();
  v89[10] = sub_21276F2A8;
  v89[11] = v88;
  sub_212761414();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v91))
  {
    buf = (uint8_t *)sub_21279DFE4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E8);
    v71 = sub_21276633C(1);
    v72 = sub_21276633C(1);
    v226 = buf;
    v227 = v71;
    v228 = v72;
    sub_212766394(2, &v226);
    sub_212766394(2, &v226);
    v229 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
    v230 = v83;
    sub_2127663A8(&v229, (uint64_t)&v226, (uint64_t)&v227, (uint64_t)&v228);
    v229 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
    v230 = v84;
    sub_2127663A8(&v229, (uint64_t)&v226, (uint64_t)&v227, (uint64_t)&v228);
    v229 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2127674D0;
    v230 = v85;
    sub_2127663A8(&v229, (uint64_t)&v226, (uint64_t)&v227, (uint64_t)&v228);
    v229 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
    v230 = v86;
    sub_2127663A8(&v229, (uint64_t)&v226, (uint64_t)&v227, (uint64_t)&v228);
    v229 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
    v230 = v87;
    sub_2127663A8(&v229, (uint64_t)&v226, (uint64_t)&v227, (uint64_t)&v228);
    v229 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276F2A8;
    v230 = v88;
    sub_2127663A8(&v229, (uint64_t)&v226, (uint64_t)&v227, (uint64_t)&v228);
    _os_log_impl(&dword_212728000, oslog, v91, "Failed to load item for type identifier %s with error: %@", buf, size);
    sub_2127663EC(v71);
    sub_2127663EC(v72);
    sub_21279DFCC();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  v64 = *(void (**)(uint64_t, uint64_t))(v221 + 1032);
  v66 = *(_QWORD *)(v221 + 968);
  v62 = *(_QWORD *)(v221 + 896);
  v63 = *(_QWORD *)(v221 + 880);
  v65 = *(_QWORD *)(v221 + 560);
  v67 = *(_QWORD *)(v221 + 976);

  v64(v62, v63);
  swift_bridgeObjectRetain();
  *(_QWORD *)(v221 + 440) = v65;
  swift_bridgeObjectRetain();
  v68 = swift_task_alloc();
  *(_QWORD *)(v68 + 16) = v66;
  *(_QWORD *)(v68 + 24) = v67;
  sub_2127935A4();
  v69 = sub_21279E05C();
  *(_QWORD *)(v221 + 1120) = v69;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v221 + 448) = v69;
  v27 = v179;
  *(_QWORD *)(v221 + 456) = v179;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B586F0);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v60 = *(void **)(v221 + 288);
    v61 = *(_BYTE *)(v221 + 296);
  }
  else
  {
    v60 = 0;
    v61 = -1;
  }
  if (v61 != 255)
  {
    *(_QWORD *)(v221 + 304) = v60;
    *(_BYTE *)(v221 + 312) = v61;
    sub_212791D7C(v60, v61);
    if (v61 == 2 && v60 == (void *)1)
    {
      sub_212791D7C((id)1, v61);
      sub_212791D10();
      swift_allocError();
      *(_QWORD *)v28 = 1;
      *(_BYTE *)(v28 + 8) = v61;
      swift_willThrow();
      sub_212791DDC((void *)1, v61);
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(*(_QWORD *)(v221 + 320) + 8))();
    }
    sub_212791DDC(v60, v61);
    sub_212791DDC(v60, v61);
  }
  v55 = *(_QWORD *)(v221 + 968);
  v59 = *(id *)(v221 + 648);
  v56 = *(_QWORD *)(v221 + 976);
  sub_21279E1F4();
  v57 = v29;
  swift_bridgeObjectRetain();
  *v57 = v55;
  v57[1] = v56;
  sub_212761414();
  v58 = sub_21279DE4C();
  *(_QWORD *)(v221 + 1128) = v58;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v221 + 464) = v58;
  v30 = v59;
  *(_QWORD *)(v221 + 480) = v59;
  v31 = v179;
  if (*(_QWORD *)(v221 + 480))
  {
    *(_QWORD *)(v221 + 472) = *(_QWORD *)(v221 + 480);
  }
  else
  {
    v32 = v179;
    *(_QWORD *)(v221 + 472) = v179;
    sub_212792DB0((id *)(v221 + 480));
  }

  v54 = *(_QWORD *)(v221 + 472);
  *(_QWORD *)(v221 + 1136) = v54;
  v33 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v221 + 1144) = v33;
  *v33 = *(_QWORD *)(v221 + 320);
  v33[1] = sub_212780AFC;
  v34 = *(_QWORD *)(v221 + 920);
  v35 = *(_QWORD *)(v221 + 632);
  v36 = *(_QWORD *)(v221 + 624);
  v37 = *(_QWORD *)(v221 + 616);
  v38 = *(_QWORD *)(v221 + 608);
  v39 = *(_QWORD *)(v221 + 600);
  v40 = *(double *)(v221 + 592);
  v41 = *(double *)(v221 + 584);
  v42 = *(_BYTE *)(v221 + 299);
  v43 = *(_BYTE *)(v221 + 298);
  v44 = *(_BYTE *)(v221 + 297);
  v45 = *(_QWORD *)(v221 + 576);
  v46 = *(_QWORD *)(v221 + 568);
  v47 = *(_QWORD *)(v221 + 552);
  v235 = *(_BYTE *)(v221 + 313) & 1;
  v236 = v39;
  v237 = v38;
  v238 = v37;
  v239 = v36;
  v240 = v35;
  v241 = v58;
  v242 = v54;
  return sub_212778B30(v34, v47, v69, v46, v45, v44 & 1, v43 & 1, v42 & 1, v41, v40);
}

uint64_t sub_2127801F4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 320) = *v1;
  *(_QWORD *)(v2 + 1088) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_212780298()
{
  _QWORD *v0;
  __n128 v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v0[40] = v0;
  v6 = v0[134];
  v8 = v0[120];
  v7 = v0[119];
  v13 = v0[101];
  v12 = v0[94];
  v14 = v0[93];
  v11 = v0[89];
  v3 = v0[88];
  v9 = v0[85];
  v10 = v0[84];
  (*(void (**)(void))(v9 + 16))();
  v4 = v0[16];
  v5 = v0[17];
  swift_bridgeObjectRetain();
  sub_212774288(v3, v4, v5, v6, 0, v7);
  v1 = sub_212792CAC(v7, v8);
  (*(void (**)(uint64_t, uint64_t, __n128))(v9 + 8))(v11, v10, v1);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v13, v14);
  swift_bridgeObjectRelease();
  sub_2127677B0();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  v15 = v0[120];
  sub_212792B50(v15, v0[68]);
  sub_212792C34(v15);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[40] + 8))();
}

uint64_t sub_212780758()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 320) = *v1;
  *(_QWORD *)(v2 + 1104) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2127807FC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v1 = v0[120];
  v2 = v0[116];
  v0[40] = v0;
  sub_212792CAC(v2, v1);
  v4 = v0[120];
  sub_212792B50(v4, v0[68]);
  sub_212792C34(v4);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[40] + 8))();
}

uint64_t sub_212780AFC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;

  v2 = *v1;
  v4 = *v1 + 16;
  *(_QWORD *)(v2 + 320) = *v1;
  *(_QWORD *)(v2 + 1152) = v0;
  swift_task_dealloc();
  if (!v0)

  return swift_task_switch();
}

uint64_t sub_212780BB8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  id v4;
  uint64_t v5;

  v4 = (id)v0[139];
  v1 = v0[120];
  v2 = v0[115];
  v0[40] = v0;
  sub_212792CAC(v2, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v5 = v0[120];
  sub_212792B50(v5, v0[68]);
  sub_212792C34(v5);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[40] + 8))();
}

uint64_t sub_212780F4C()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;
  id v6;
  uint64_t v7;
  _QWORD *v9;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  char v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  id v33;
  void *v34;
  unsigned __int8 v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint8_t *buf;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t, uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint32_t size;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  NSObject *oslog;
  os_log_type_t v66;
  uint8_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t, uint64_t);
  uint64_t v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  *(_QWORD *)(v0 + 320) = v0;
  v51 = *(id *)(v0 + 1056);
  *(_QWORD *)(v0 + 1112) = v51;
  v48 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 992);
  v50 = *(_QWORD *)(v0 + 976);
  v49 = *(_QWORD *)(v0 + 968);
  v1 = *(_QWORD *)(v0 + 896);
  v47 = *(_QWORD *)(v0 + 880);
  v2 = v51;
  *(_QWORD *)(v0 + 424) = v51;
  v3 = sub_212774050();
  v48(v1, v3, v47);
  swift_bridgeObjectRetain();
  v53 = swift_allocObject();
  *(_QWORD *)(v53 + 16) = v49;
  *(_QWORD *)(v53 + 24) = v50;
  v4 = v51;
  v55 = swift_allocObject();
  *(_QWORD *)(v55 + 16) = v51;
  sub_21276E9A4();
  swift_bridgeObjectRelease();
  oslog = sub_21279DAA4();
  v66 = sub_21279DF6C();
  *(_QWORD *)(v0 + 432) = 22;
  sub_21279DE28();
  size = *(_DWORD *)(v0 + 1164);
  v58 = swift_allocObject();
  *(_BYTE *)(v58 + 16) = 32;
  v59 = swift_allocObject();
  *(_BYTE *)(v59 + 16) = 8;
  v54 = swift_allocObject();
  *(_QWORD *)(v54 + 16) = sub_212792E14;
  *(_QWORD *)(v54 + 24) = v53;
  v60 = swift_allocObject();
  *(_QWORD *)(v60 + 16) = sub_212767488;
  *(_QWORD *)(v60 + 24) = v54;
  v61 = swift_allocObject();
  *(_BYTE *)(v61 + 16) = 64;
  v62 = swift_allocObject();
  *(_BYTE *)(v62 + 16) = 8;
  v56 = swift_allocObject();
  *(_QWORD *)(v56 + 16) = sub_21276F6EC;
  *(_QWORD *)(v56 + 24) = v55;
  v57 = swift_allocObject();
  *(_QWORD *)(v57 + 16) = sub_212773490;
  *(_QWORD *)(v57 + 24) = v56;
  v63 = swift_allocObject();
  *(_QWORD *)(v63 + 16) = sub_212767488;
  *(_QWORD *)(v63 + 24) = v57;
  sub_21279E1F4();
  v64 = v5;
  swift_retain();
  *v64 = sub_21276741C;
  v64[1] = v58;
  swift_retain();
  v64[2] = sub_21276741C;
  v64[3] = v59;
  swift_retain();
  v64[4] = sub_2127674D0;
  v64[5] = v60;
  swift_retain();
  v64[6] = sub_21276741C;
  v64[7] = v61;
  swift_retain();
  v64[8] = sub_21276741C;
  v64[9] = v62;
  swift_retain();
  v64[10] = sub_21276F2A8;
  v64[11] = v63;
  sub_212761414();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v66))
  {
    buf = (uint8_t *)sub_21279DFE4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E8);
    v45 = sub_21276633C(1);
    v46 = sub_21276633C(1);
    v67 = buf;
    v68 = v45;
    v69 = v46;
    sub_212766394(2, &v67);
    sub_212766394(2, &v67);
    v70 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
    v71 = v58;
    sub_2127663A8(&v70, (uint64_t)&v67, (uint64_t)&v68, (uint64_t)&v69);
    v70 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
    v71 = v59;
    sub_2127663A8(&v70, (uint64_t)&v67, (uint64_t)&v68, (uint64_t)&v69);
    v70 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2127674D0;
    v71 = v60;
    sub_2127663A8(&v70, (uint64_t)&v67, (uint64_t)&v68, (uint64_t)&v69);
    v70 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
    v71 = v61;
    sub_2127663A8(&v70, (uint64_t)&v67, (uint64_t)&v68, (uint64_t)&v69);
    v70 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
    v71 = v62;
    sub_2127663A8(&v70, (uint64_t)&v67, (uint64_t)&v68, (uint64_t)&v69);
    v70 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276F2A8;
    v71 = v63;
    sub_2127663A8(&v70, (uint64_t)&v67, (uint64_t)&v68, (uint64_t)&v69);
    _os_log_impl(&dword_212728000, oslog, v66, "Failed to load item for type identifier %s with error: %@", buf, size);
    sub_2127663EC(v45);
    sub_2127663EC(v46);
    sub_21279DFCC();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  v38 = *(void (**)(uint64_t, uint64_t))(v0 + 1032);
  v40 = *(_QWORD *)(v0 + 968);
  v36 = *(_QWORD *)(v0 + 896);
  v37 = *(_QWORD *)(v0 + 880);
  v39 = *(_QWORD *)(v0 + 560);
  v41 = *(_QWORD *)(v0 + 976);

  v38(v36, v37);
  swift_bridgeObjectRetain();
  *(_QWORD *)(v0 + 440) = v39;
  swift_bridgeObjectRetain();
  v42 = swift_task_alloc();
  *(_QWORD *)(v42 + 16) = v40;
  *(_QWORD *)(v42 + 24) = v41;
  sub_2127935A4();
  v43 = sub_21279E05C();
  *(_QWORD *)(v0 + 1120) = v43;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 448) = v43;
  v6 = v51;
  *(_QWORD *)(v0 + 456) = v51;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B586F0);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v34 = *(void **)(v0 + 288);
    v35 = *(_BYTE *)(v0 + 296);
  }
  else
  {
    v34 = 0;
    v35 = -1;
  }
  if (v35 != 255)
  {
    *(_QWORD *)(v0 + 304) = v34;
    *(_BYTE *)(v0 + 312) = v35;
    sub_212791D7C(v34, v35);
    if (v35 == 2 && v34 == (void *)1)
    {
      sub_212791D7C((id)1, v35);
      sub_212791D10();
      swift_allocError();
      *(_QWORD *)v7 = 1;
      *(_BYTE *)(v7 + 8) = v35;
      swift_willThrow();
      sub_212791DDC((void *)1, v35);
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 320) + 8))();
    }
    sub_212791DDC(v34, v35);
    sub_212791DDC(v34, v35);
  }
  v29 = *(_QWORD *)(v0 + 968);
  v33 = *(id *)(v0 + 648);
  v30 = *(_QWORD *)(v0 + 976);
  sub_21279E1F4();
  v31 = v9;
  swift_bridgeObjectRetain();
  *v31 = v29;
  v31[1] = v30;
  sub_212761414();
  v32 = sub_21279DE4C();
  *(_QWORD *)(v0 + 1128) = v32;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 464) = v32;
  v10 = v33;
  *(_QWORD *)(v0 + 480) = v33;
  v11 = v51;
  if (*(_QWORD *)(v0 + 480))
  {
    *(_QWORD *)(v0 + 472) = *(_QWORD *)(v0 + 480);
  }
  else
  {
    v12 = v51;
    *(_QWORD *)(v0 + 472) = v51;
    sub_212792DB0((id *)(v0 + 480));
  }

  v28 = *(_QWORD *)(v0 + 472);
  *(_QWORD *)(v0 + 1136) = v28;
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 1144) = v13;
  *v13 = *(_QWORD *)(v0 + 320);
  v13[1] = sub_212780AFC;
  v14 = *(_QWORD *)(v0 + 920);
  v15 = *(_QWORD *)(v0 + 632);
  v16 = *(_QWORD *)(v0 + 624);
  v17 = *(_QWORD *)(v0 + 616);
  v18 = *(_QWORD *)(v0 + 608);
  v19 = *(_QWORD *)(v0 + 600);
  v20 = *(double *)(v0 + 592);
  v21 = *(double *)(v0 + 584);
  v22 = *(_BYTE *)(v0 + 299);
  v23 = *(_BYTE *)(v0 + 298);
  v24 = *(_BYTE *)(v0 + 297);
  v25 = *(_QWORD *)(v0 + 576);
  v26 = *(_QWORD *)(v0 + 568);
  v27 = *(_QWORD *)(v0 + 552);
  v72 = *(_BYTE *)(v0 + 313) & 1;
  v73 = v19;
  v74 = v18;
  v75 = v17;
  v76 = v16;
  v77 = v15;
  v78 = v32;
  v79 = v28;
  return sub_212778B30(v14, v27, v43, v26, v25, v24 & 1, v23 & 1, v22 & 1, v21, v20);
}

uint64_t sub_212782724()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  id v7;
  uint64_t v8;
  _QWORD *v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  char v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  id v34;
  void *v35;
  unsigned __int8 v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t *buf;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t, uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint32_t size;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  NSObject *oslog;
  os_log_type_t v71;
  uint8_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t, uint64_t);
  uint64_t v76;
  char v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;

  v1 = (void *)v0[134];
  v49 = v0[101];
  v48 = v0[94];
  v50 = v0[93];
  v0[40] = v0;

  (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v49, v50);
  swift_bridgeObjectRelease();
  sub_2127677B0();
  swift_unknownObjectRelease();
  v55 = *(id *)(v56 + 1088);
  *(_QWORD *)(v56 + 1112) = v55;
  v52 = *(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 992);
  v54 = *(_QWORD *)(v56 + 976);
  v53 = *(_QWORD *)(v56 + 968);
  v2 = *(_QWORD *)(v56 + 896);
  v51 = *(_QWORD *)(v56 + 880);
  v3 = v55;
  *(_QWORD *)(v56 + 424) = v55;
  v4 = sub_212774050();
  v52(v2, v4, v51);
  swift_bridgeObjectRetain();
  v58 = swift_allocObject();
  *(_QWORD *)(v58 + 16) = v53;
  *(_QWORD *)(v58 + 24) = v54;
  v5 = v55;
  v60 = swift_allocObject();
  *(_QWORD *)(v60 + 16) = v55;
  sub_21276E9A4();
  swift_bridgeObjectRelease();
  oslog = sub_21279DAA4();
  v71 = sub_21279DF6C();
  *(_QWORD *)(v56 + 432) = 22;
  sub_21279DE28();
  size = *(_DWORD *)(v56 + 1164);
  v63 = swift_allocObject();
  *(_BYTE *)(v63 + 16) = 32;
  v64 = swift_allocObject();
  *(_BYTE *)(v64 + 16) = 8;
  v59 = swift_allocObject();
  *(_QWORD *)(v59 + 16) = sub_212792E14;
  *(_QWORD *)(v59 + 24) = v58;
  v65 = swift_allocObject();
  *(_QWORD *)(v65 + 16) = sub_212767488;
  *(_QWORD *)(v65 + 24) = v59;
  v66 = swift_allocObject();
  *(_BYTE *)(v66 + 16) = 64;
  v67 = swift_allocObject();
  *(_BYTE *)(v67 + 16) = 8;
  v61 = swift_allocObject();
  *(_QWORD *)(v61 + 16) = sub_21276F6EC;
  *(_QWORD *)(v61 + 24) = v60;
  v62 = swift_allocObject();
  *(_QWORD *)(v62 + 16) = sub_212773490;
  *(_QWORD *)(v62 + 24) = v61;
  v68 = swift_allocObject();
  *(_QWORD *)(v68 + 16) = sub_212767488;
  *(_QWORD *)(v68 + 24) = v62;
  sub_21279E1F4();
  v69 = v6;
  swift_retain();
  *v69 = sub_21276741C;
  v69[1] = v63;
  swift_retain();
  v69[2] = sub_21276741C;
  v69[3] = v64;
  swift_retain();
  v69[4] = sub_2127674D0;
  v69[5] = v65;
  swift_retain();
  v69[6] = sub_21276741C;
  v69[7] = v66;
  swift_retain();
  v69[8] = sub_21276741C;
  v69[9] = v67;
  swift_retain();
  v69[10] = sub_21276F2A8;
  v69[11] = v68;
  sub_212761414();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v71))
  {
    buf = (uint8_t *)sub_21279DFE4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E8);
    v46 = sub_21276633C(1);
    v47 = sub_21276633C(1);
    v72 = buf;
    v73 = v46;
    v74 = v47;
    sub_212766394(2, &v72);
    sub_212766394(2, &v72);
    v75 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
    v76 = v63;
    sub_2127663A8(&v75, (uint64_t)&v72, (uint64_t)&v73, (uint64_t)&v74);
    v75 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
    v76 = v64;
    sub_2127663A8(&v75, (uint64_t)&v72, (uint64_t)&v73, (uint64_t)&v74);
    v75 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2127674D0;
    v76 = v65;
    sub_2127663A8(&v75, (uint64_t)&v72, (uint64_t)&v73, (uint64_t)&v74);
    v75 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
    v76 = v66;
    sub_2127663A8(&v75, (uint64_t)&v72, (uint64_t)&v73, (uint64_t)&v74);
    v75 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
    v76 = v67;
    sub_2127663A8(&v75, (uint64_t)&v72, (uint64_t)&v73, (uint64_t)&v74);
    v75 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276F2A8;
    v76 = v68;
    sub_2127663A8(&v75, (uint64_t)&v72, (uint64_t)&v73, (uint64_t)&v74);
    _os_log_impl(&dword_212728000, oslog, v71, "Failed to load item for type identifier %s with error: %@", buf, size);
    sub_2127663EC(v46);
    sub_2127663EC(v47);
    sub_21279DFCC();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  v39 = *(void (**)(uint64_t, uint64_t))(v56 + 1032);
  v41 = *(_QWORD *)(v56 + 968);
  v37 = *(_QWORD *)(v56 + 896);
  v38 = *(_QWORD *)(v56 + 880);
  v40 = *(_QWORD *)(v56 + 560);
  v42 = *(_QWORD *)(v56 + 976);

  v39(v37, v38);
  swift_bridgeObjectRetain();
  *(_QWORD *)(v56 + 440) = v40;
  swift_bridgeObjectRetain();
  v43 = swift_task_alloc();
  *(_QWORD *)(v43 + 16) = v41;
  *(_QWORD *)(v43 + 24) = v42;
  sub_2127935A4();
  v44 = sub_21279E05C();
  *(_QWORD *)(v56 + 1120) = v44;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v56 + 448) = v44;
  v7 = v55;
  *(_QWORD *)(v56 + 456) = v55;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B586F0);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v35 = *(void **)(v56 + 288);
    v36 = *(_BYTE *)(v56 + 296);
  }
  else
  {
    v35 = 0;
    v36 = -1;
  }
  if (v36 != 255)
  {
    *(_QWORD *)(v56 + 304) = v35;
    *(_BYTE *)(v56 + 312) = v36;
    sub_212791D7C(v35, v36);
    if (v36 == 2 && v35 == (void *)1)
    {
      sub_212791D7C((id)1, v36);
      sub_212791D10();
      swift_allocError();
      *(_QWORD *)v8 = 1;
      *(_BYTE *)(v8 + 8) = v36;
      swift_willThrow();
      sub_212791DDC((void *)1, v36);
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(*(_QWORD *)(v56 + 320) + 8))();
    }
    sub_212791DDC(v35, v36);
    sub_212791DDC(v35, v36);
  }
  v30 = *(_QWORD *)(v56 + 968);
  v34 = *(id *)(v56 + 648);
  v31 = *(_QWORD *)(v56 + 976);
  sub_21279E1F4();
  v32 = v10;
  swift_bridgeObjectRetain();
  *v32 = v30;
  v32[1] = v31;
  sub_212761414();
  v33 = sub_21279DE4C();
  *(_QWORD *)(v56 + 1128) = v33;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v56 + 464) = v33;
  v11 = v34;
  *(_QWORD *)(v56 + 480) = v34;
  v12 = v55;
  if (*(_QWORD *)(v56 + 480))
  {
    *(_QWORD *)(v56 + 472) = *(_QWORD *)(v56 + 480);
  }
  else
  {
    v13 = v55;
    *(_QWORD *)(v56 + 472) = v55;
    sub_212792DB0((id *)(v56 + 480));
  }

  v29 = *(_QWORD *)(v56 + 472);
  *(_QWORD *)(v56 + 1136) = v29;
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v56 + 1144) = v14;
  *v14 = *(_QWORD *)(v56 + 320);
  v14[1] = sub_212780AFC;
  v15 = *(_QWORD *)(v56 + 920);
  v16 = *(_QWORD *)(v56 + 632);
  v17 = *(_QWORD *)(v56 + 624);
  v18 = *(_QWORD *)(v56 + 616);
  v19 = *(_QWORD *)(v56 + 608);
  v20 = *(_QWORD *)(v56 + 600);
  v21 = *(double *)(v56 + 592);
  v22 = *(double *)(v56 + 584);
  v23 = *(_BYTE *)(v56 + 299);
  v24 = *(_BYTE *)(v56 + 298);
  v25 = *(_BYTE *)(v56 + 297);
  v26 = *(_QWORD *)(v56 + 576);
  v27 = *(_QWORD *)(v56 + 568);
  v28 = *(_QWORD *)(v56 + 552);
  v77 = *(_BYTE *)(v56 + 313) & 1;
  v78 = v20;
  v79 = v19;
  v80 = v18;
  v81 = v17;
  v82 = v16;
  v83 = v33;
  v84 = v29;
  return sub_212778B30(v15, v28, v44, v27, v26, v25 & 1, v24 & 1, v23 & 1, v22, v21);
}

uint64_t sub_212783F58()
{
  _QWORD *v0;
  void *v1;
  id v3;

  v1 = (void *)v0[142];
  v3 = (id)v0[139];
  v0[40] = v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[40] + 8))();
}

uint64_t sub_212784298()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 320) = v0;
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 320) + 8))();
}

uint64_t static SFAirDropUtilities.highestFidelityDataType(for:conformingToDataTypes:)(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  void (*v33)(char *, uint64_t);
  id v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  int v38;
  uint64_t v39;
  unsigned int (*v40)(char *, uint64_t, uint64_t);
  uint64_t v41;
  unint64_t v42;
  uint64_t i;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  unint64_t v47;
  char *v48;
  uint64_t v49;
  id v50;
  unint64_t v51;
  char *v52;
  unint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;

  v50 = a1;
  v49 = a2;
  v77 = 0;
  v76 = 0;
  v75 = 0;
  v74 = 0;
  v72 = 0;
  v73 = 0;
  v55 = 0;
  v68 = 0;
  v69 = 0;
  v63 = 0;
  v64 = 0;
  v62 = 0;
  v57 = sub_21279DA80();
  v44 = *(_QWORD *)(v57 - 8);
  v45 = (*(_QWORD *)(v44 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v57);
  v46 = (char *)&v12 - v45;
  v47 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]((char *)&v12 - v45);
  v48 = (char *)&v12 - v47;
  v77 = (char *)&v12 - v47;
  v51 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254B58F98) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v50);
  v52 = (char *)&v12 - v51;
  v53 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v5);
  v54 = (char *)&v12 - v53;
  v76 = v6;
  v75 = v7;
  v74 = v2;
  v71 = v7;
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B59070);
  sub_212792D40();
  v8 = sub_21279DDE0();
  v58 = 0;
  v59 = v8;
  v70 = v8;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B58F70);
  v42 = sub_212791CA0();
  sub_21279DF48();
  for (i = v58; ; i = v39)
  {
    v39 = i;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B59098);
    sub_21279E0E0();
    v40 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48);
    if (v40(v54, 1, v57) == 1)
      break;
    v9 = v46;
    (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v48, v54, v57);
    (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v9, v48, v57);
    v34 = (id)sub_21279D9F0();
    v33 = *(void (**)(char *, uint64_t))(v44 + 8);
    v33(v46, v57);
    v35 = objc_msgSend(v50, sel_registeredContentTypesConformingToContentType_, v34);

    v36 = sub_21279DE40();
    v62 = v36;

    swift_bridgeObjectRetain();
    v37 = &v61;
    v61 = v36;
    v38 = sub_21279DF3C();
    sub_2127693E0();
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v32 = &v60;
      v60 = v36;
      sub_21279DF30();
      sub_2127693E0();
      if (v40(v52, 1, v57) == 1)
      {
        v23 = 0;
        sub_21279200C((uint64_t)v52);
        v30 = v23;
        v31 = v23;
      }
      else
      {
        v28 = sub_21279D9D8();
        v29 = v10;
        v33(v52, v57);
        v30 = v28;
        v31 = v29;
      }
      v25 = v31;
      v24 = v30;
      swift_bridgeObjectRelease();
      v33(v48, v57);
      sub_2127693E0();
      v26 = v24;
      v27 = v25;
      return v26;
    }
    swift_bridgeObjectRelease();
    v33(v48, v57);
  }
  sub_2127693E0();
  swift_bridgeObjectRetain();
  v67 = v49;
  sub_212793730();
  sub_21279DF48();
  for (j = v39; ; j = v19)
  {
    v19 = j;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B590A8);
    sub_21279E0E0();
    v20 = v65;
    v21 = v66;
    if (!v66)
      break;
    v17 = v20;
    v18 = v21;
    v14 = v21;
    v13 = v20;
    v63 = v20;
    v64 = v21;
    swift_bridgeObjectRetain();
    v15 = (id)sub_21279DD5C();
    swift_bridgeObjectRelease();
    v16 = objc_msgSend(v50, sel_hasItemConformingToTypeIdentifier_, v15);

    if ((v16 & 1) != 0)
    {
      sub_2127693E0();
      v26 = v13;
      v27 = v14;
      return v26;
    }
    swift_bridgeObjectRelease();
  }
  v12 = 0;
  sub_2127693E0();
  v26 = v12;
  v27 = v12;
  return v26;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_212784CD0()
{
  swift_bridgeObjectRetain();
}

uint64_t sub_212784D00(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[46] = v2;
  v3[45] = a2;
  v3[44] = a1;
  v3[34] = v3;
  v3[28] = 0;
  v3[29] = 0;
  v3[35] = 0;
  v3[38] = 0;
  v3[32] = 0;
  v3[33] = 0;
  v3[42] = 0;
  v3[43] = 0;
  v4 = sub_21279D984();
  v3[47] = v4;
  v3[48] = *(_QWORD *)(v4 - 8);
  v3[49] = swift_task_alloc();
  v3[50] = swift_task_alloc();
  v5 = sub_21279DABC();
  v3[51] = v5;
  v3[52] = *(_QWORD *)(v5 - 8);
  v3[53] = swift_task_alloc();
  v6 = sub_21279DA80();
  v3[54] = v6;
  v3[55] = *(_QWORD *)(v6 - 8);
  v3[56] = swift_task_alloc();
  v3[57] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B58F98);
  v3[58] = swift_task_alloc();
  v3[59] = swift_task_alloc();
  v3[28] = a1;
  v3[29] = a2;
  v3[35] = v2;
  return swift_task_switch();
}

uint64_t sub_212784EF0()
{
  uint64_t v0;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = *(char **)(v0 + 472);
  v7 = *(id *)(v0 + 368);
  v5 = *(_QWORD *)(v0 + 360);
  v4 = *(_QWORD *)(v0 + 352);
  *(_QWORD *)(v0 + 272) = v0;
  swift_bridgeObjectRetain();
  sub_212786E00(v4, v5, 1, v3);
  swift_bridgeObjectRetain();
  v6 = sub_21279DD5C();
  *(_QWORD *)(v0 + 480) = v6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 272);
  *(_QWORD *)(v0 + 56) = v0 + 296;
  *(_QWORD *)(v0 + 24) = sub_212785048;
  *(_QWORD *)(v0 + 176) = swift_continuation_init();
  *(_QWORD *)(v0 + 144) = MEMORY[0x24BDAC760];
  *(_DWORD *)(v0 + 152) = 0x40000000;
  *(_DWORD *)(v0 + 156) = 0;
  *(_QWORD *)(v0 + 160) = sub_2127908C0;
  *(_QWORD *)(v0 + 168) = &block_descriptor_202;
  objc_msgSend(v7, sel_loadItemForTypeIdentifier_options_completionHandler_, v6, 0, v0 + 144);
  return __swift_continuation_await_point(v2 + 16);
}

uint64_t sub_212785048()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = (_QWORD *)*v0;
  v1[34] = *v0;
  v1[61] = v1[6];
  return swift_task_switch();
}

uint64_t sub_212785144()
{
  _QWORD *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t *buf;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint32_t size;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  NSObject *oslog;
  os_log_type_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t);
  char v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  const void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint8_t *v60;
  uint64_t (*v61)(uint64_t, uint64_t, uint64_t);
  uint64_t v62;
  id v63;
  uint64_t v64;
  _QWORD v65[2];

  v65[1] = *MEMORY[0x24BDAC8D0];
  v54 = (void *)v0[60];
  v56 = (const void *)v0[59];
  v59 = (void *)v0[58];
  v57 = v0[55];
  v58 = v0[54];
  v0[34] = v0;
  v55 = v0[37];
  swift_unknownObjectRetain();
  v0[36] = v55;

  sub_212792620(v56, v59);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v57 + 48))(v59, 1, v58) == 1)
  {
    v52 = *(_QWORD *)(v53 + 464);
    swift_unknownObjectRelease();
    sub_21279200C(v52);
  }
  else
  {
    v49 = *(_QWORD *)(v53 + 448);
    v47 = *(_QWORD *)(v53 + 440);
    v48 = *(_QWORD *)(v53 + 432);
    (*(void (**)(_QWORD, _QWORD))(v47 + 32))(*(_QWORD *)(v53 + 456), *(_QWORD *)(v53 + 464));
    sub_21279DA14();
    v51 = sub_21279DA50();
    v50 = *(void (**)(uint64_t, uint64_t))(v47 + 8);
    v50(v49, v48);
    if ((v51 & 1) != 0)
    {
      *(_QWORD *)(v53 + 312) = v55;
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B59040);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v45 = *(_QWORD *)(v53 + 240);
        v46 = *(_QWORD *)(v53 + 248);
      }
      else
      {
        v45 = 0;
        v46 = 0xF000000000000000;
      }
      if ((v46 & 0xF000000000000000) == 0xF000000000000000)
      {
        v50(*(_QWORD *)(v53 + 456), *(_QWORD *)(v53 + 432));
      }
      else
      {
        *(_QWORD *)(v53 + 256) = v45;
        *(_QWORD *)(v53 + 264) = v46;
        v63 = 0;
        v40 = (id)objc_opt_self();
        sub_212792508(v45, v46);
        v43 = (void *)sub_21279D990();
        sub_212792480(v45, v46);
        swift_bridgeObjectRetain();
        v42 = (void *)sub_21279DD5C();
        swift_bridgeObjectRelease();
        *(_QWORD *)(v53 + 320) = 0;
        v44 = objc_msgSend(v40, sel_objectWithItemProviderData_typeIdentifier_error_, v43, v42, v53 + 320);
        v41 = *(void **)(v53 + 320);
        v1 = v41;
        v2 = v63;
        v63 = v41;

        if (v44)
        {
          v39 = v44;
        }
        else
        {
          v11 = (id)sub_21279D8C4();

          swift_willThrow();
          v39 = 0;
        }
        if (v39)
        {
          *(_QWORD *)(v53 + 344) = v39;
          v3 = v39;
          *(_QWORD *)(v53 + 288) = v39;
          swift_unknownObjectRelease();

        }
        else
        {
          sub_2127937A0();
          sub_212793804();
          v38 = (void *)sub_21279DF84();
          if (v38)
          {
            *(_QWORD *)(v53 + 336) = v38;
            v4 = v38;
            *(_QWORD *)(v53 + 288) = v38;
            swift_unknownObjectRelease();

          }
          else
          {
            v5 = *(_QWORD *)(v53 + 424);
            v26 = *(_QWORD *)(v53 + 416);
            v27 = *(_QWORD *)(v53 + 408);
            v28 = *(id *)(v53 + 368);
            v6 = sub_212774050();
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v5, v6, v27);
            v7 = v28;
            v30 = swift_allocObject();
            *(_QWORD *)(v30 + 16) = v28;
            oslog = sub_21279DAA4();
            v37 = sub_21279DF6C();
            *(_QWORD *)(v53 + 328) = 12;
            sub_212766204();
            sub_21276626C();
            sub_2127662D4();
            sub_21279DE28();
            size = *(_DWORD *)(v53 + 512);
            v32 = swift_allocObject();
            *(_BYTE *)(v32 + 16) = 64;
            v33 = swift_allocObject();
            *(_BYTE *)(v33 + 16) = 8;
            v31 = swift_allocObject();
            *(_QWORD *)(v31 + 16) = sub_212792718;
            *(_QWORD *)(v31 + 24) = v30;
            v34 = swift_allocObject();
            *(_QWORD *)(v34 + 16) = sub_212767488;
            *(_QWORD *)(v34 + 24) = v31;
            __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E0);
            sub_21279E1F4();
            v35 = v8;
            swift_retain();
            *v35 = sub_21276741C;
            v35[1] = v32;
            swift_retain();
            v35[2] = sub_21276741C;
            v35[3] = v33;
            swift_retain();
            v35[4] = sub_21276F2A8;
            v35[5] = v34;
            sub_212761414();
            swift_bridgeObjectRelease();
            if (os_log_type_enabled(oslog, v37))
            {
              buf = (uint8_t *)sub_21279DFE4();
              __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E8);
              v24 = sub_21276633C(1);
              v25 = sub_21276633C(0);
              v60 = buf;
              v64 = v24;
              v65[0] = v25;
              sub_212766394(2, &v60);
              sub_212766394(1, &v60);
              v61 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
              v62 = v32;
              sub_2127663A8(&v61, (uint64_t)&v60, (uint64_t)&v64, (uint64_t)v65);
              v61 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
              v62 = v33;
              sub_2127663A8(&v61, (uint64_t)&v60, (uint64_t)&v64, (uint64_t)v65);
              v61 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276F2A8;
              v62 = v34;
              sub_2127663A8(&v61, (uint64_t)&v60, (uint64_t)&v64, (uint64_t)v65);
              _os_log_impl(&dword_212728000, oslog, v37, "Unable to coerce URL-typed item to an NSURL for item provider: %@", buf, size);
              sub_2127663EC(v24);
              sub_2127663EC(v25);
              sub_21279DFCC();
              swift_release();
              swift_release();
              swift_release();
            }
            else
            {
              swift_release();
              swift_release();
              swift_release();
            }
            v21 = *(_QWORD *)(v53 + 424);
            v20 = *(_QWORD *)(v53 + 416);
            v22 = *(_QWORD *)(v53 + 408);

            (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v21, v22);
          }
        }
        v18 = *(_QWORD *)(v53 + 456);
        v19 = *(_QWORD *)(v53 + 432);
        sub_212792480(v45, v46);
        v50(v18, v19);
      }
    }
    else
    {
      v16 = *(_QWORD *)(v53 + 456);
      v17 = *(_QWORD *)(v53 + 432);
      swift_unknownObjectRelease();
      v50(v16, v17);
    }
  }
  swift_unknownObjectRetain();
  objc_opt_self();
  v15 = swift_dynamicCastObjCClass();
  if (v15)
  {
    v14 = (void *)v15;
  }
  else
  {
    swift_unknownObjectRelease();
    v14 = 0;
  }
  *(_QWORD *)(v53 + 496) = v14;
  if (v14)
  {
    *(_QWORD *)(v53 + 304) = v14;
    if ((objc_msgSend(v14, sel_isFileURL) & 1) != 0)
    {
      v9 = *(_QWORD *)(v53 + 400);
      *(_QWORD *)(v53 + 80) = *(_QWORD *)(v53 + 272);
      *(_QWORD *)(v53 + 120) = v9;
      *(_QWORD *)(v53 + 88) = sub_212785FE0;
      *(_QWORD *)(v53 + 216) = swift_continuation_init();
      *(_QWORD *)(v53 + 184) = MEMORY[0x24BDAC760];
      *(_DWORD *)(v53 + 192) = 0x40000000;
      *(_DWORD *)(v53 + 196) = 0;
      *(_QWORD *)(v53 + 200) = sub_2127909D8;
      *(_QWORD *)(v53 + 208) = &block_descriptor_204;
      objc_msgSend(v14, sel_coordinateReadingWithSaveToTempDir_completionHandler_, 1, v53 + 184);
      return __swift_continuation_await_point(v53 + 80);
    }

  }
  v13 = *(_QWORD *)(v53 + 472);
  v12 = *(_QWORD *)(v53 + 288);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  sub_21279200C(v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v53 + 272) + 8))(v12);
}

uint64_t sub_212785FE0()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = (_QWORD *)*v0;
  v1[34] = *v0;
  v1[63] = v1[14];
  return swift_task_switch();
}

uint64_t sub_2127860DC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v6 = (id)v0[62];
  v1 = v0[50];
  v4 = v0[49];
  v3 = v0[48];
  v5 = v0[47];
  v0[34] = v0;
  (*(void (**)(uint64_t, uint64_t))(v3 + 32))(v4, v1);
  v0[36] = sub_21279D924();
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);

  v8 = v0[59];
  v7 = v0[36];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  sub_21279200C(v8);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0[34] + 8))(v7);
}

uint64_t sub_21278626C()
{
  _QWORD *v0;
  id v2;
  uint64_t v3;

  v2 = (id)v0[60];
  v3 = v0[59];
  v0[34] = v0;
  swift_willThrow();

  sub_21279200C(v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)())(v0[34] + 8))();
}

uint64_t sub_2127863AC()
{
  _QWORD *v0;
  id v2;
  uint64_t v3;

  v2 = (id)v0[62];
  v3 = v0[59];
  v0[34] = v0;
  swift_willThrow();

  swift_unknownObjectRelease();
  sub_21279200C(v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)())(v0[34] + 8))();
}

uint64_t sub_2127864F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[12] = a4;
  v5[11] = a3;
  v5[10] = a2;
  v5[9] = a1;
  v5[6] = v5;
  v5[7] = 0;
  v5[2] = 0;
  v5[3] = 0;
  v5[8] = 0;
  v5[4] = 0;
  v5[5] = 0;
  v6 = sub_21279D984();
  v5[13] = v6;
  v5[14] = *(_QWORD *)(v6 - 8);
  v5[15] = swift_task_alloc();
  v7 = sub_21279DC24();
  v5[16] = v7;
  v5[17] = *(_QWORD *)(v7 - 8);
  v5[18] = swift_task_alloc();
  v5[19] = swift_task_alloc();
  v5[7] = a2;
  v5[2] = a3;
  v5[3] = a4;
  v5[8] = v4;
  return swift_task_switch();
}

uint64_t sub_21278662C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;

  v1 = *(_QWORD *)(v0 + 112);
  *(_QWORD *)(v0 + 48) = v0;
  (*(void (**)(void))(v1 + 16))();
  sub_212763604();
  sub_21279DC30();
  v17 = v18[12];
  swift_bridgeObjectRetain();
  if (v17)
  {
    v16 = v18[12];
    v18[4] = v18[11];
    v18[5] = v16;
    if ((sub_21279DDC8() & 1) == 0)
    {
      v10 = v18[19];
      v13 = v18[18];
      v8 = v18[17];
      v11 = v18[16];
      v14 = v18[11];
      v9 = sub_21279E1F4();
      v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
      v12(v2, v10, v11);
      sub_212761414();
      v18[20] = v9;
      v12(v13, v10, v11);
      swift_bridgeObjectRetain();
      v15 = (_QWORD *)swift_task_alloc();
      v18[21] = v15;
      v15[2] = v13;
      v15[3] = v14;
      v15[4] = v16;
      v3 = (_QWORD *)swift_task_alloc();
      v18[22] = v3;
      *v3 = v18[6];
      v3[1] = sub_2127869C0;
      return sub_21279DC0C();
    }
    swift_bridgeObjectRelease();
  }
  v7 = v18[19];
  v5 = v18[17];
  v6 = v18[16];
  (*(void (**)(_QWORD))(v5 + 16))(v18[9]);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v7, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v18[6] + 8))();
}

uint64_t sub_2127869C0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v2 = *v1;
  *(_QWORD *)(v2 + 48) = *v1;
  v2 += 48;
  v8 = (_QWORD *)(v2 - 32);
  *(_QWORD *)(v2 + 136) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    v6 = v8[16];
    v5 = v8[15];
    v7 = v8[14];
    swift_task_dealloc();
    v3 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v8[22] = v3;
    v3(v6, v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_212786ACC()
{
  _QWORD *v0;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);

  v4 = (void (*)(uint64_t, uint64_t))v0[24];
  v2 = v0[19];
  v3 = v0[16];
  v0[6] = v0;
  swift_bridgeObjectRelease();
  v4(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[6] + 8))();
}

uint64_t sub_212786B88()
{
  _QWORD *v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  v4 = v0[19];
  v3 = v0[18];
  v2 = v0[17];
  v5 = v0[16];
  v0[6] = v0;
  swift_task_dealloc();
  v6 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v6(v3, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6(v4, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[6] + 8))();
}

uint64_t sub_212786C8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  NSString *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v19 = a3;
  v20 = a1;
  v21 = a2;
  v26 = 0;
  v27 = 0;
  v25 = 0;
  v23 = sub_21279D984();
  v17 = *(_QWORD *)(v23 - 8);
  v12 = *(_QWORD *)(v17 + 64);
  v11 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v20);
  v18 = (char *)&v10 - v11;
  v13 = v11;
  MEMORY[0x24BDAC7A8](v3);
  v22 = (char *)&v10 - v13;
  v26 = v4;
  v27 = v5;
  v25 = v6;
  v15 = NSTemporaryDirectory();
  sub_21279DD68();
  v14 = v7;
  sub_21279D900();
  swift_bridgeObjectRelease();

  sub_21279DDB0();
  v16 = v8;
  sub_21279D930();
  swift_bridgeObjectRelease();
  v24 = *(void (**)(char *, uint64_t))(v17 + 8);
  v24(v18, v23);
  sub_21279D930();
  return ((uint64_t (*)(char *, uint64_t))v24)(v22, v23);
}

uint64_t sub_212786E00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, char *a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id v11;
  void (*v14)(char *, uint64_t, uint64_t);
  void (*v15)(char *, char *, uint64_t);
  void (*v16)(char *, uint64_t);
  id v17;
  id v18;
  char *v19;
  unint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  unint64_t v30;
  uint64_t v31;
  char *v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  id v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;

  v19 = a4;
  v35 = a1;
  v36 = a2;
  v24 = a3;
  v43 = 0;
  v42 = 0;
  v40 = 0;
  v41 = 0;
  v39 = 0;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B58F98);
  v20 = (*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v4);
  v21 = (char *)&v14 - v20;
  v22 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]((char *)&v14 - v20);
  v23 = (uint64_t)&v14 - v22;
  v25 = 0;
  v26 = sub_21279DA80();
  v27 = *(_QWORD *)(v26 - 8);
  v31 = *(_QWORD *)(v27 + 64);
  v28 = (v31 + 15) & 0xFFFFFFFFFFFFFFF0;
  v6 = MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v14 - v28;
  v30 = (v31 + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = MEMORY[0x24BDAC7A8](v6);
  v32 = (char *)&v14 - v30;
  v43 = (char *)&v14 - v30;
  v33 = (v31 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v7);
  v34 = (char *)&v14 - v33;
  v42 = (char *)&v14 - v33;
  v40 = v8;
  v41 = v9;
  v37 = 1;
  v39 = v10 & 1;
  sub_212793A0C();
  swift_bridgeObjectRetain();
  v38 = sub_21278EAC8(v35, v36, v37 & 1);
  if (!v38)
    goto LABEL_6;
  v18 = v38;
  v17 = v38;
  v11 = v38;
  sub_212793A70();
  sub_21279E224();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v21, 1, v26) == 1)
  {
LABEL_6:
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 56))(v23, 1, 1, v26);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v27 + 32))(v23, v21, v26);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v27 + 56))(v23, 0, 1, v26);
  }
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48))(v23, 1, v26) == 1)
  {
    sub_21279200C(v23);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56))(v19, 1, 1, v26);
  }
  else
  {
    v14 = *(void (**)(char *, uint64_t, uint64_t))(v27 + 32);
    v14(v32, v23, v26);
    v15 = *(void (**)(char *, char *, uint64_t))(v27 + 16);
    v15(v29, v32, v26);
    v14(v34, (uint64_t)v29, v26);
    v16 = *(void (**)(char *, uint64_t))(v27 + 8);
    v16(v32, v26);
    v15(v19, v34, v26);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v19, 0, 1, v26);
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(char *, uint64_t))v16)(v34, v26);
  }
}

uint64_t sub_2127871D0()
{
  return (sub_21279DDBC() ^ 1) & 1;
}

uint64_t static SFAirDropUtilities.loadFile(from:dataTypesToTry:customDataType:acceptOtherFileRepresentations:ignoreStrings:generatePreviewImage:renameURLs:suggestedThumbnailSize:filename:sessionID:fileIndex:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7, char a8, double a9, double a10)
{
  uint64_t v10;
  uint64_t v11;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  *(_QWORD *)(v11 + 216) = v10;
  *(_QWORD *)(v11 + 208) = v18;
  *(_QWORD *)(v11 + 200) = v17;
  *(_QWORD *)(v11 + 192) = v16;
  *(_QWORD *)(v11 + 184) = v15;
  *(_QWORD *)(v11 + 176) = v14;
  *(double *)(v11 + 168) = a10;
  *(double *)(v11 + 160) = a9;
  *(_BYTE *)(v11 + 252) = v13 & 1;
  *(_BYTE *)(v11 + 251) = a8 & 1;
  *(_BYTE *)(v11 + 250) = a7 & 1;
  *(_BYTE *)(v11 + 249) = a6 & 1;
  *(_QWORD *)(v11 + 152) = a5;
  *(_QWORD *)(v11 + 144) = a4;
  *(_QWORD *)(v11 + 136) = a3;
  *(_QWORD *)(v11 + 128) = a2;
  *(_QWORD *)(v11 + 120) = a1;
  *(_QWORD *)(v11 + 80) = v11;
  *(_QWORD *)(v11 + 88) = 0;
  *(_QWORD *)(v11 + 96) = 0;
  *(_QWORD *)(v11 + 16) = 0;
  *(_QWORD *)(v11 + 24) = 0;
  *(_BYTE *)(v11 + 248) = 0;
  *(_BYTE *)(v11 + 256) = 0;
  *(_BYTE *)(v11 + 264) = 0;
  *(_BYTE *)(v11 + 272) = 0;
  *(_QWORD *)(v11 + 32) = 0;
  *(_QWORD *)(v11 + 40) = 0;
  *(_QWORD *)(v11 + 48) = 0;
  *(_QWORD *)(v11 + 56) = 0;
  *(_QWORD *)(v11 + 64) = 0;
  *(_QWORD *)(v11 + 72) = 0;
  *(_QWORD *)(v11 + 104) = 0;
  *(_QWORD *)(v11 + 112) = 0;
  *(_QWORD *)(v11 + 88) = a2;
  *(_QWORD *)(v11 + 96) = a3;
  *(_QWORD *)(v11 + 16) = a4;
  *(_QWORD *)(v11 + 24) = a5;
  *(_BYTE *)(v11 + 248) = a6 & 1;
  *(_BYTE *)(v11 + 256) = a7 & 1;
  *(_BYTE *)(v11 + 264) = a8 & 1;
  *(_BYTE *)(v11 + 272) = v13 & 1;
  *(double *)(v11 + 32) = a9;
  *(double *)(v11 + 40) = a10;
  *(_QWORD *)(v11 + 48) = v14;
  *(_QWORD *)(v11 + 56) = v15;
  *(_QWORD *)(v11 + 64) = v16;
  *(_QWORD *)(v11 + 72) = v17;
  *(_QWORD *)(v11 + 104) = v18;
  *(_QWORD *)(v11 + 112) = v10;
  return swift_task_switch();
}

uint64_t sub_2127873FC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v3;

  *(_QWORD *)(v0 + 80) = v0;
  *(_QWORD *)(v0 + 224) = sub_21279E1F4();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 232) = v1;
  *v1 = *(_QWORD *)(v3 + 80);
  v1[1] = sub_212787528;
  return sub_212778B30(*(_QWORD *)(v3 + 120), *(_QWORD *)(v3 + 128), *(_QWORD *)(v3 + 136), *(_QWORD *)(v3 + 144), *(_QWORD *)(v3 + 152), *(_BYTE *)(v3 + 249) & 1, *(_BYTE *)(v3 + 250) & 1, *(_BYTE *)(v3 + 251) & 1, *(double *)(v3 + 160), *(double *)(v3 + 168));
}

_QWORD *sub_212787528()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = *v1;
  *(_QWORD *)(v2 + 80) = *v1;
  v4 = (_QWORD *)(v2 + 80);
  *(_QWORD *)(v2 + 240) = v0;
  swift_task_dealloc();
  if (v0)
    return (_QWORD *)swift_task_switch();
  swift_bridgeObjectRelease();
  return (*(_QWORD *(**)(_QWORD *__return_ptr))(*v4 + 8))(v4);
}

uint64_t sub_21278766C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 80) = v0;
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 80) + 8))();
}

uint64_t sub_2127876EC@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v5;

  v3 = *a1;
  v5 = a1[1];
  swift_bridgeObjectRetain();
  return sub_212786E00(v3, v5, 1, a2);
}

uint64_t static SFAirDropUtilities.guessedDataType(for:dataTypesToTry:)(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[2];
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  _BOOL4 v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  id v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[2];
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v37 = a1;
  v40 = a2;
  v60 = 0;
  v59 = 0;
  v58 = 0;
  v41 = v55;
  v55[0] = 0;
  v55[1] = 0;
  v43 = 0;
  v44 = 0;
  v33 = sub_21279DA80();
  v34 = *(_QWORD *)(v33 - 8);
  v35 = (*(_QWORD *)(v34 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v33);
  v36 = (char *)v8 - v35;
  v38 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254B58F98) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v40);
  v39 = (uint64_t)v8 - v38;
  v60 = v3;
  v59 = v4;
  v58 = v2;
  v56 = 0;
  v57 = 0;
  swift_bridgeObjectRetain();
  v54 = v40;
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B59070);
  sub_212793730();
  sub_21279DF48();
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B590A8);
    sub_21279E0E0();
    v31 = v52;
    v32 = v53;
    if (!v53)
      break;
    v29 = v31;
    v30 = v32;
    v26 = v32;
    v25 = v31;
    v43 = v31;
    v44 = v32;
    swift_bridgeObjectRetain();
    v27 = (id)sub_21279DD5C();
    swift_bridgeObjectRelease();
    v28 = objc_msgSend(v37, sel_hasItemConformingToTypeIdentifier_, v27);

    if ((v28 & 1) != 0)
    {
      swift_bridgeObjectRetain();
      v56 = v25;
      v57 = v26;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      break;
    }
    swift_bridgeObjectRelease();
  }
  sub_2127693E0();
  v23 = v56;
  v24 = v57;
  swift_bridgeObjectRetain();
  v50 = v23;
  v51 = v24;
  v22 = v24 == 0;
  v21 = v22;
  sub_2127677B0();
  if (v21)
  {
    v17 = objc_msgSend(v37, sel_registeredContentTypes);
    v20 = sub_21279DE40();
    swift_bridgeObjectRetain();
    v19 = &v45;
    v45 = v20;
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B58F70);
    sub_212791CA0();
    sub_21279DF30();
    sub_2127693E0();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v34 + 48))(v39, 1, v33) == 1)
    {
      v12 = 0;

      sub_21279200C(v39);
      v15 = v12;
      v16 = v12;
    }
    else
    {
      v13 = sub_21279D9D8();
      v14 = v5;
      (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v39, v33);

      v15 = v13;
      v16 = v14;
    }
    v56 = v15;
    v57 = v16;
    swift_bridgeObjectRelease();
  }
  v10 = v56;
  v11 = v57;
  swift_bridgeObjectRetain();
  v46 = v10;
  v47 = v11;
  if (v11)
  {
    v48 = v46;
    v49 = v47;
  }
  else
  {
    sub_21279DA14();
    v48 = sub_21279D9D8();
    v49 = v6;
    (*(void (**)(char *, uint64_t))(v34 + 8))(v36, v33);
    sub_2127677B0();
  }
  v9 = v48;
  v8[1] = v49;
  sub_2127677B0();
  return v9;
}

uint64_t static SFAirDropUtilities.imageData(for:)(void *a1)
{
  id v1;
  id v3;
  uint64_t v4;
  id v6;
  void *v7;

  v1 = a1;
  if (a1)
  {
    v6 = objc_msgSend(a1, sel_CGImage);

    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  if (!v7)
    return 0;
  v3 = (id)SFDataFromCGImage();
  v4 = sub_21279D99C();

  return v4;
}

uint64_t static SFAirDropUtilities.shouldIgnoreString(for:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE **v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t *v39;
  uint32_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  NSObject *v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  void (*v61)(char *, char *, uint64_t);
  int v62;
  void (*v63)(char *, uint64_t);
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t i;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  char *v76;
  unint64_t v77;
  char *v78;
  unint64_t v79;
  char *v80;
  unint64_t v81;
  char *v82;
  uint64_t v83;
  unint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t, uint64_t);
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  _BYTE *v96;
  uint64_t v97;
  uint32_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unsigned __int8 v104;
  char v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;

  v83 = a1;
  v108 = 0;
  v107 = 0;
  v106 = 0;
  v105 = 0;
  v104 = 0;
  v86 = 0;
  v102 = 0;
  v100 = 0;
  v101 = 0;
  v68 = 0;
  v69 = sub_21279DABC();
  v70 = *(_QWORD *)(v69 - 8);
  v71 = (*(_QWORD *)(v70 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0);
  v72 = (char *)&v24 - v71;
  v73 = sub_21279DA80();
  v74 = *(_QWORD *)(v73 - 8);
  v75 = (*(_QWORD *)(v74 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v73);
  v76 = (char *)&v24 - v75;
  v77 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]((char *)&v24 - v75);
  v78 = (char *)&v24 - v77;
  v79 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]((char *)&v24 - v77);
  v80 = (char *)&v24 - v79;
  v81 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]((char *)&v24 - v79);
  v82 = (char *)&v24 - v81;
  v108 = (char *)&v24 - v81;
  v84 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254B58F98) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v83);
  v85 = (char *)&v24 - v84;
  v107 = v5;
  v106 = v1;
  v105 = 0;
  v104 = 0;
  v103 = v5;
  v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B590E8);
  v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B58F70);
  v89 = sub_212793AE0();
  sub_212793B50();
  v6 = sub_21279DE04();
  v90 = 0;
  v91 = v6;
  v66 = v6;
  v102 = v6;
  swift_bridgeObjectRetain();
  v99 = v66;
  sub_212791CA0();
  sub_21279DF48();
  for (i = v90; ; i = v65)
  {
    v65 = i;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B59098);
    sub_21279E0E0();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v74 + 48))(v85, 1, v73) == 1)
      break;
    (*(void (**)(char *, char *, uint64_t))(v74 + 32))(v82, v85, v73);
    sub_21279DA74();
    v64 = sub_21279DA50();
    v63 = *(void (**)(char *, uint64_t))(v74 + 8);
    v63(v80, v73);
    if ((v64 & 1) != 0)
    {
      v105 = 1;
    }
    else
    {
      sub_21279DA38();
      v62 = sub_21279DA50();
      v63(v80, v73);
      v61 = *(void (**)(char *, char *, uint64_t))(v74 + 16);
      v61(v78, v82, v73);
      if ((v62 & 1) != 0)
      {
        v60 = 1;
      }
      else
      {
        sub_21279DA14();
        v59 = sub_21279DA50();
        v63(v80, v73);
        v60 = v59;
      }
      v58 = v60;
      v63(v78, v73);
      v61(v76, v82, v73);
      if ((v58 & 1) != 0)
      {
        v57 = 1;
      }
      else
      {
        sub_21279DA20();
        v56 = sub_21279DA50();
        v63(v80, v73);
        v57 = v56;
      }
      v55 = v57;
      v63(v76, v73);
      if ((v55 & 1) != 0)
        v104 = 1;
    }
    v63(v82, v73);
  }
  sub_2127693E0();
  if ((v105 & 1) != 0)
    v54 = v104;
  else
    v54 = 0;
  if ((v54 & 1) != 0)
  {
    v7 = v72;
    v8 = sub_212774050();
    (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))(v7, v8, v69);
    swift_bridgeObjectRetain();
    v43 = 7;
    v36 = swift_allocObject();
    *(_QWORD *)(v36 + 16) = v83;
    swift_retain();
    v42 = 32;
    v9 = swift_allocObject();
    v10 = v36;
    v44 = v9;
    *(_QWORD *)(v9 + 16) = sub_212793BFC;
    *(_QWORD *)(v9 + 24) = v10;
    swift_release();
    v52 = sub_21279DAA4();
    v53 = sub_21279DF78();
    v39 = &v97;
    v97 = 12;
    v37 = sub_212766204();
    v38 = sub_21276626C();
    sub_2127662D4();
    sub_21279DE28();
    v40 = v98;
    v41 = 17;
    v46 = swift_allocObject();
    *(_BYTE *)(v46 + 16) = 32;
    v47 = swift_allocObject();
    *(_BYTE *)(v47 + 16) = 8;
    v11 = swift_allocObject();
    v12 = v44;
    v45 = v11;
    *(_QWORD *)(v11 + 16) = sub_212793C40;
    *(_QWORD *)(v11 + 24) = v12;
    v13 = swift_allocObject();
    v14 = v45;
    v49 = v13;
    *(_QWORD *)(v13 + 16) = sub_212767488;
    *(_QWORD *)(v13 + 24) = v14;
    v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E0);
    v48 = sub_21279E1F4();
    v50 = v15;
    swift_retain();
    v16 = v46;
    v17 = v50;
    *v50 = sub_21276741C;
    v17[1] = v16;
    swift_retain();
    v18 = v47;
    v19 = v50;
    v50[2] = sub_21276741C;
    v19[3] = v18;
    swift_retain();
    v20 = v49;
    v21 = v50;
    v50[4] = sub_2127674D0;
    v21[5] = v20;
    sub_212761414();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v52, (os_log_type_t)v53))
    {
      v22 = v65;
      v29 = (uint8_t *)sub_21279DFE4();
      v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E8);
      v30 = sub_21276633C(0);
      v31 = sub_21276633C(1);
      v32 = &v96;
      v96 = v29;
      v33 = &v95;
      v95 = v30;
      v34 = &v94;
      v94 = v31;
      sub_212766394(2, &v96);
      sub_212766394(1, v32);
      v92 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
      v93 = v46;
      sub_2127663A8(&v92, (uint64_t)v32, (uint64_t)v33, (uint64_t)v34);
      v35 = v22;
      if (v22)
      {
        __break(1u);
      }
      else
      {
        v92 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
        v93 = v47;
        sub_2127663A8(&v92, (uint64_t)&v96, (uint64_t)&v95, (uint64_t)&v94);
        v27 = 0;
        v92 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2127674D0;
        v93 = v49;
        sub_2127663A8(&v92, (uint64_t)&v96, (uint64_t)&v95, (uint64_t)&v94);
        _os_log_impl(&dword_212728000, v52, (os_log_type_t)v53, "Returning shouldIgnoreString = true for item providers %s", v29, v40);
        sub_2127663EC(v30);
        sub_2127663EC(v31);
        sub_21279DFCC();
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }

    (*(void (**)(char *, uint64_t))(v70 + 8))(v72, v69);
  }
  if ((v105 & 1) != 0)
    v26 = v104;
  else
    v26 = 0;
  v25 = v26;
  swift_bridgeObjectRelease();
  return v25 & 1;
}

void sub_212788A3C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;

  v3 = objc_msgSend(*a1, sel_registeredContentTypes);
  sub_21279DA80();
  *a2 = sub_21279DE40();

}

uint64_t sub_212788AAC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;

  swift_bridgeObjectRetain();
  result = a1;
  *a2 = a1;
  return result;
}

uint64_t sub_212788ADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5[19] = a5;
  v5[18] = a4;
  v5[17] = a3;
  v5[16] = a2;
  v5[15] = a1;
  v5[8] = v5;
  v5[9] = 0;
  v5[10] = 0;
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = 0;
  v5[5] = 0;
  v5[13] = 0;
  v6 = sub_21279DABC();
  v5[20] = v6;
  v5[21] = *(_QWORD *)(v6 - 8);
  v5[22] = swift_task_alloc();
  v7 = sub_21279D8DC();
  v5[23] = v7;
  v5[24] = *(_QWORD *)(v7 - 8);
  v5[25] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B58F90);
  v5[26] = swift_task_alloc();
  v8 = sub_21279D984();
  v5[27] = v8;
  v5[28] = *(_QWORD *)(v8 - 8);
  v5[29] = swift_task_alloc();
  v5[30] = swift_task_alloc();
  v5[31] = swift_task_alloc();
  v5[32] = swift_task_alloc();
  v5[33] = swift_task_alloc();
  v5[9] = a2;
  v5[10] = a3;
  v5[2] = a4;
  v5[3] = a5;
  return swift_task_switch();
}

uint64_t sub_212788CF4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t *buf;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint32_t size;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  NSObject *oslog;
  os_log_type_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(void);
  uint64_t v56;
  void (*v57)(uint64_t, uint64_t);
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  unsigned __int8 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint8_t *v71;
  uint64_t (*v72)(uint64_t, uint64_t, uint64_t);
  uint64_t v73;
  id v74;
  uint64_t v75;
  _QWORD v76[2];

  v76[1] = *MEMORY[0x24BDAC8D0];
  v68 = v0[28];
  v69 = v0[27];
  v70 = v0[26];
  v67 = v0[16];
  v0[8] = v0;
  swift_bridgeObjectRetain();
  v0[11] = v67;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B59110);
  sub_212793DC4();
  sub_21279DF30();
  sub_2127693E0();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v68 + 48))(v70, 1, v69) == 1)
  {
    v64 = *(_QWORD *)(v66 + 136);
    v65 = *(_QWORD *)(v66 + 120);
    sub_2127730D0(*(_QWORD *)(v66 + 208));
    v1 = sub_21279DC24();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(v65, v64);
  }
  else
  {
    v53 = *(_QWORD *)(v66 + 264);
    v54 = *(_QWORD *)(v66 + 248);
    v58 = *(_QWORD *)(v66 + 240);
    v52 = *(_QWORD *)(v66 + 224);
    v56 = *(_QWORD *)(v66 + 216);
    v50 = *(_QWORD *)(v66 + 200);
    v49 = *(_QWORD *)(v66 + 192);
    v51 = *(_QWORD *)(v66 + 184);
    v48 = *(_QWORD *)(v66 + 152);
    v47 = *(_QWORD *)(v66 + 144);
    (*(void (**)(uint64_t, _QWORD))(v52 + 32))(v53, *(_QWORD *)(v66 + 208));
    *(_QWORD *)(v66 + 32) = sub_21279D8E8();
    *(_QWORD *)(v66 + 40) = v2;
    sub_21279D948();
    *(_QWORD *)(v66 + 48) = v47;
    *(_QWORD *)(v66 + 56) = v48;
    sub_212795C5C();
    sub_212789C50(v50);
    sub_21279D978();
    (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v50, v51);
    sub_21279D93C();
    v57 = *(void (**)(uint64_t, uint64_t))(v52 + 8);
    v57(v58, v56);
    v74 = 0;
    v62 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    v55 = *(void (**)(void))(v52 + 16);
    ((void (*)(uint64_t, uint64_t, uint64_t))v55)(v58, v53, v56);
    v61 = (void *)sub_21279D924();
    v57(v58, v56);
    ((void (*)(uint64_t, uint64_t, uint64_t))v55)(v58, v54, v56);
    v60 = (void *)sub_21279D924();
    v57(v58, v56);
    *(_QWORD *)(v66 + 96) = 0;
    v63 = objc_msgSend(v62, sel_moveItemAtURL_toURL_error_, v61, v60, v66 + 96);
    v59 = *(void **)(v66 + 96);
    v3 = v59;
    v4 = v74;
    v74 = v59;

    if ((v63 & 1) != 0)
    {
      v55();
      sub_212763604();
      sub_21279DC30();
      v45 = *(_QWORD *)(v66 + 264);
      v44 = *(_QWORD *)(v66 + 256);
      v46 = *(_QWORD *)(v66 + 216);
      ((void (*)(_QWORD))v57)(*(_QWORD *)(v66 + 248));
      v57(v44, v46);
      swift_bridgeObjectRelease();
      v57(v45, v46);
    }
    else
    {
      v12 = (void *)sub_21279D8C4();

      swift_willThrow();
      v6 = *(_QWORD *)(v66 + 176);
      v25 = *(_QWORD *)(v66 + 168);
      v26 = *(_QWORD *)(v66 + 160);
      v28 = *(_QWORD *)(v66 + 152);
      v27 = *(_QWORD *)(v66 + 144);
      v7 = v12;
      *(_QWORD *)(v66 + 104) = v12;
      v8 = sub_212774050();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v6, v8, v26);
      swift_bridgeObjectRetain();
      v30 = swift_allocObject();
      *(_QWORD *)(v30 + 16) = v27;
      *(_QWORD *)(v30 + 24) = v28;
      v9 = v12;
      v32 = swift_allocObject();
      *(_QWORD *)(v32 + 16) = v12;
      sub_21276E9A4();
      swift_bridgeObjectRelease();
      oslog = sub_21279DAA4();
      v43 = sub_21279DF6C();
      *(_QWORD *)(v66 + 112) = 22;
      sub_212766204();
      sub_21276626C();
      sub_2127662D4();
      sub_21279DE28();
      size = *(_DWORD *)(v66 + 272);
      v35 = swift_allocObject();
      *(_BYTE *)(v35 + 16) = 32;
      v36 = swift_allocObject();
      *(_BYTE *)(v36 + 16) = 8;
      v31 = swift_allocObject();
      *(_QWORD *)(v31 + 16) = sub_212792E14;
      *(_QWORD *)(v31 + 24) = v30;
      v37 = swift_allocObject();
      *(_QWORD *)(v37 + 16) = sub_212767488;
      *(_QWORD *)(v37 + 24) = v31;
      v38 = swift_allocObject();
      *(_BYTE *)(v38 + 16) = 64;
      v39 = swift_allocObject();
      *(_BYTE *)(v39 + 16) = 8;
      v33 = swift_allocObject();
      *(_QWORD *)(v33 + 16) = sub_21276F6EC;
      *(_QWORD *)(v33 + 24) = v32;
      v34 = swift_allocObject();
      *(_QWORD *)(v34 + 16) = sub_212773490;
      *(_QWORD *)(v34 + 24) = v33;
      v40 = swift_allocObject();
      *(_QWORD *)(v40 + 16) = sub_212767488;
      *(_QWORD *)(v40 + 24) = v34;
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E0);
      sub_21279E1F4();
      v41 = v10;
      swift_retain();
      *v41 = sub_21276741C;
      v41[1] = v35;
      swift_retain();
      v41[2] = sub_21276741C;
      v41[3] = v36;
      swift_retain();
      v41[4] = sub_2127674D0;
      v41[5] = v37;
      swift_retain();
      v41[6] = sub_21276741C;
      v41[7] = v38;
      swift_retain();
      v41[8] = sub_21276741C;
      v41[9] = v39;
      swift_retain();
      v41[10] = sub_21276F2A8;
      v41[11] = v40;
      sub_212761414();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(oslog, v43))
      {
        buf = (uint8_t *)sub_21279DFE4();
        __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E8);
        v23 = sub_21276633C(1);
        v24 = sub_21276633C(1);
        v71 = buf;
        v75 = v23;
        v76[0] = v24;
        sub_212766394(2, &v71);
        sub_212766394(2, &v71);
        v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
        v73 = v35;
        sub_2127663A8(&v72, (uint64_t)&v71, (uint64_t)&v75, (uint64_t)v76);
        v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
        v73 = v36;
        sub_2127663A8(&v72, (uint64_t)&v71, (uint64_t)&v75, (uint64_t)v76);
        v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2127674D0;
        v73 = v37;
        sub_2127663A8(&v72, (uint64_t)&v71, (uint64_t)&v75, (uint64_t)v76);
        v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
        v73 = v38;
        sub_2127663A8(&v72, (uint64_t)&v71, (uint64_t)&v75, (uint64_t)v76);
        v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
        v73 = v39;
        sub_2127663A8(&v72, (uint64_t)&v71, (uint64_t)&v75, (uint64_t)v76);
        v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276F2A8;
        v73 = v40;
        sub_2127663A8(&v72, (uint64_t)&v71, (uint64_t)&v75, (uint64_t)v76);
        _os_log_impl(&dword_212728000, oslog, v43, "Failed to rename file to filename %s: %@", buf, size);
        sub_2127663EC(v23);
        sub_2127663EC(v24);
        sub_21279DFCC();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
      v20 = *(_QWORD *)(v66 + 264);
      v19 = *(_QWORD *)(v66 + 256);
      v18 = *(_QWORD *)(v66 + 248);
      v21 = *(_QWORD *)(v66 + 216);
      v14 = *(_QWORD *)(v66 + 176);
      v13 = *(_QWORD *)(v66 + 168);
      v15 = *(_QWORD *)(v66 + 160);
      v16 = *(_QWORD *)(v66 + 136);
      v17 = *(_QWORD *)(v66 + 120);

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
      v11 = sub_21279DC24();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v17, v16);

      v57(v18, v21);
      v57(v19, v21);
      swift_bridgeObjectRelease();
      v57(v20, v21);
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v66 + 64) + 8))();
}

uint64_t sub_212789C50@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  unsigned int v3;

  v3 = *MEMORY[0x24BDCD7A0];
  v1 = sub_21279D8DC();
  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 8) + 104))(a1, v3);
}

uint64_t static SFAirDropUtilities.standardPreviewImage(for:size:)(uint64_t a1, double a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v4 + 136) = v3;
  *(double *)(v4 + 128) = a3;
  *(double *)(v4 + 120) = a2;
  *(_QWORD *)(v4 + 112) = a1;
  *(_QWORD *)(v4 + 48) = v4;
  *(_QWORD *)(v4 + 56) = 0;
  *(_QWORD *)(v4 + 16) = 0;
  *(_QWORD *)(v4 + 24) = 0;
  *(_QWORD *)(v4 + 64) = 0;
  *(_QWORD *)(v4 + 72) = 0;
  *(_QWORD *)(v4 + 32) = 0;
  *(_QWORD *)(v4 + 40) = 0;
  *(_QWORD *)(v4 + 88) = 0;
  v5 = sub_21279DC24();
  *(_QWORD *)(v4 + 144) = v5;
  *(_QWORD *)(v4 + 152) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v4 + 160) = swift_task_alloc();
  *(_QWORD *)(v4 + 168) = swift_task_alloc();
  v6 = sub_21279D984();
  *(_QWORD *)(v4 + 176) = v6;
  *(_QWORD *)(v4 + 184) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v4 + 192) = swift_task_alloc();
  *(_QWORD *)(v4 + 200) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B58F90);
  *(_QWORD *)(v4 + 208) = swift_task_alloc();
  *(_QWORD *)(v4 + 56) = a1;
  *(double *)(v4 + 16) = a2;
  *(double *)(v4 + 24) = a3;
  *(_QWORD *)(v4 + 64) = v3;
  return swift_task_switch();
}

{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v4 + 144) = v3;
  *(double *)(v4 + 136) = a3;
  *(double *)(v4 + 128) = a2;
  *(_QWORD *)(v4 + 120) = a1;
  *(_QWORD *)(v4 + 32) = v4;
  *(_QWORD *)(v4 + 40) = 0;
  *(_QWORD *)(v4 + 16) = 0;
  *(_QWORD *)(v4 + 24) = 0;
  *(_QWORD *)(v4 + 48) = 0;
  *(_QWORD *)(v4 + 88) = 0;
  v5 = sub_21279DBF4();
  *(_QWORD *)(v4 + 152) = v5;
  *(_QWORD *)(v4 + 160) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v4 + 168) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B58F90);
  *(_QWORD *)(v4 + 176) = swift_task_alloc();
  v6 = sub_21279D984();
  *(_QWORD *)(v4 + 184) = v6;
  *(_QWORD *)(v4 + 192) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v4 + 200) = swift_task_alloc();
  v7 = sub_21279DC9C();
  *(_QWORD *)(v4 + 208) = v7;
  *(_QWORD *)(v4 + 216) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v4 + 224) = swift_task_alloc();
  *(_QWORD *)(v4 + 40) = a1;
  *(double *)(v4 + 16) = a2;
  *(double *)(v4 + 24) = a3;
  *(_QWORD *)(v4 + 48) = v3;
  return swift_task_switch();
}

uint64_t sub_212789E20()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CGImageSource *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = v0[14];
  v0[6] = v0;
  v0[9] = sub_21279E1F4();
  swift_bridgeObjectRetain();
  v0[10] = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B59110);
  sub_212793DC4();
  sub_21279DF48();
  while (1)
  {
    v18 = *(_QWORD *)(v20 + 208);
    v17 = *(_QWORD *)(v20 + 184);
    v19 = *(_QWORD *)(v20 + 176);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B59120);
    sub_21279E0E0();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v18, 1, v19) == 1)
      break;
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v20 + 184) + 32))(*(_QWORD *)(v20 + 200), *(_QWORD *)(v20 + 208), *(_QWORD *)(v20 + 176));
    if ((sub_21279D8D0() & 1) == 0)
    {
      v1 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v20 + 216) = v1;
      *v1 = *(_QWORD *)(v20 + 48);
      v1[1] = sub_21278A398;
      return static SFAirDropUtilities.generateWebPreviewImage(url:)(*(_QWORD *)(v20 + 200));
    }
    v16 = static SFAirDropUtilities.previewImage(from:suggestedThumbnailSize:)(*(_QWORD *)(v20 + 200), *(double *)(v20 + 120), *(double *)(v20 + 128));
    if (v16)
    {
      v3 = *(_QWORD *)(v20 + 200);
      v4 = *(_QWORD *)(v20 + 184);
      v5 = *(_QWORD *)(v20 + 176);
      *(_QWORD *)(v20 + 88) = v16;
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
      sub_2127693E0();
      sub_2127693E0();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(CGImageSource *))(*(_QWORD *)(v20 + 48) + 8))(v16);
    }
    (*(void (**)(void))(*(_QWORD *)(v20 + 184) + 16))();
    sub_212763604();
    sub_21279DC30();
    v14 = *(_QWORD *)(v20 + 200);
    v13 = *(_QWORD *)(v20 + 184);
    v15 = *(_QWORD *)(v20 + 176);
    v11 = *(_QWORD *)(v20 + 168);
    v10 = *(_QWORD *)(v20 + 152);
    v12 = *(_QWORD *)(v20 + 144);
    (*(void (**)(void))(v10 + 16))();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B59138);
    sub_21279DE70();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v12);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
  }
  sub_2127693E0();
  v9 = *(_QWORD *)(v20 + 72);
  *(_QWORD *)(v20 + 232) = v9;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B59128);
  v7 = sub_21279E1F4();
  *(_QWORD *)(v20 + 240) = v7;
  v8 = sub_21279E1F4();
  *(_QWORD *)(v20 + 248) = v8;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v20 + 256) = v6;
  *v6 = *(_QWORD *)(v20 + 48);
  v6[1] = sub_21278A574;
  return static SFAirDropUtilities.generatePreviewIcon(for:fileTypes:fileSubTypes:size:)(v9, v7, v8, *(double *)(v20 + 120), *(double *)(v20 + 128));
}

uint64_t sub_21278A398(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v3 + 48) = *v1;
  *(_QWORD *)(v3 + 224) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21278A40C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[28];
  v0[6] = v0;
  v0[13] = v1;
  if (v0[13])
  {
    *(_QWORD *)(v4 + 96) = *(_QWORD *)(v4 + 104);
  }
  else
  {
    sub_212793E34();
    *(_QWORD *)(v4 + 96) = sub_21276C700();
    sub_21276ED58((id *)(v4 + 104));
  }
  v3 = *(_QWORD *)(v4 + 96);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v4 + 184) + 8))(*(_QWORD *)(v4 + 200), *(_QWORD *)(v4 + 176));
  sub_2127693E0();
  sub_2127693E0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v4 + 48) + 8))(v3);
}

uint64_t sub_21278A574(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[6] = *v2;
  v3 += 6;
  v3[27] = a1;
  v3[28] = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_21278A654()
{
  uint64_t v0;
  uint64_t v2;

  *(_QWORD *)(v0 + 48) = v0;
  sub_2127693E0();
  v2 = *(_QWORD *)(v0 + 264);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v0 + 48) + 8))(v2);
}

uint64_t sub_21278A710()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 48) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2127693E0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)())(*(_QWORD *)(v0 + 48) + 8))();
}

uint64_t static SFAirDropUtilities.generateWebPreviewImage(url:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[6] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[4] = 0;
  v3 = sub_21279D984();
  v2[7] = v3;
  v2[8] = *(_QWORD *)(v3 - 8);
  v2[9] = swift_task_alloc();
  v2[3] = a1;
  v2[4] = v1;
  return swift_task_switch();
}

uint64_t sub_21278A898()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = v0[9];
  v4 = v0[8];
  v5 = v0[7];
  v6 = v0[6];
  v0[2] = v0;
  sub_21279DDB0();
  v0[10] = v1;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v7, v6, v5);
  v9 = swift_task_alloc();
  v0[11] = v9;
  *(_QWORD *)(v9 + 16) = v7;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 96) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B59150);
  *v2 = *(_QWORD *)(v8 + 16);
  v2[1] = sub_21278A9BC;
  return sub_21279E1AC();
}

uint64_t sub_21278A9BC()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v0 + 72);
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 64);
  v4 = *(_QWORD *)(*(_QWORD *)v0 + 56);
  *(_QWORD *)(*(_QWORD *)v0 + 16) = *(_QWORD *)v0;
  swift_task_dealloc();
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v4);
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_21278AA74()
{
  uint64_t v0;
  uint64_t v2;

  *(_QWORD *)(v0 + 16) = v0;
  v2 = *(_QWORD *)(v0 + 40);
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v0 + 16) + 8))(v2);
}

uint64_t static SFAirDropUtilities.generatePreviewIcon(for:fileTypes:fileSubTypes:size:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(double *)(v6 + 248) = a5;
  *(double *)(v6 + 240) = a4;
  *(_QWORD *)(v6 + 232) = a3;
  *(_QWORD *)(v6 + 224) = a2;
  *(_QWORD *)(v6 + 216) = a1;
  *(_QWORD *)(v6 + 128) = v6;
  *(_QWORD *)(v6 + 136) = 0;
  *(_QWORD *)(v6 + 144) = 0;
  *(_QWORD *)(v6 + 152) = 0;
  *(_QWORD *)(v6 + 16) = 0;
  *(_QWORD *)(v6 + 24) = 0;
  *(_QWORD *)(v6 + 160) = 0;
  *(_QWORD *)(v6 + 48) = 0;
  *(_QWORD *)(v6 + 56) = 0;
  *(_QWORD *)(v6 + 64) = 0;
  *(_QWORD *)(v6 + 72) = 0;
  *(_QWORD *)(v6 + 176) = 0;
  *(_QWORD *)(v6 + 96) = 0;
  *(_QWORD *)(v6 + 104) = 0;
  *(_QWORD *)(v6 + 112) = 0;
  *(_QWORD *)(v6 + 120) = 0;
  *(_QWORD *)(v6 + 256) = __swift_instantiateConcreteTypeFromMangledName(&qword_254B58F90);
  *(_QWORD *)(v6 + 264) = swift_task_alloc();
  v7 = sub_21279D984();
  *(_QWORD *)(v6 + 272) = v7;
  *(_QWORD *)(v6 + 280) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v6 + 288) = swift_task_alloc();
  *(_QWORD *)(v6 + 296) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B58F98);
  *(_QWORD *)(v6 + 304) = swift_task_alloc();
  *(_QWORD *)(v6 + 312) = swift_task_alloc();
  *(_QWORD *)(v6 + 320) = swift_task_alloc();
  v8 = sub_21279DA80();
  *(_QWORD *)(v6 + 328) = v8;
  *(_QWORD *)(v6 + 336) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v6 + 344) = swift_task_alloc();
  *(_QWORD *)(v6 + 352) = swift_task_alloc();
  *(_QWORD *)(v6 + 360) = swift_task_alloc();
  *(_QWORD *)(v6 + 368) = swift_task_alloc();
  *(_QWORD *)(v6 + 376) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B59158);
  *(_QWORD *)(v6 + 384) = swift_task_alloc();
  v9 = sub_21279DC24();
  *(_QWORD *)(v6 + 392) = v9;
  *(_QWORD *)(v6 + 400) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v6 + 408) = swift_task_alloc();
  *(_QWORD *)(v6 + 136) = a1;
  *(_QWORD *)(v6 + 144) = a2;
  *(_QWORD *)(v6 + 152) = a3;
  *(double *)(v6 + 16) = a4;
  *(double *)(v6 + 24) = a5;
  *(_QWORD *)(v6 + 160) = v5;
  return swift_task_switch();
}

uint64_t sub_21278AD80()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  double v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(void);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t, uint64_t);
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  unsigned int (*v55)(char *, uint64_t, uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  double *v67;
  uint64_t v68;

  v68 = *(_QWORD *)(v0 + 216);
  *(_QWORD *)(v0 + 128) = v0;
  swift_bridgeObjectRetain();
  if (v68)
  {
    v66 = *((_QWORD *)v67 + 27);
    swift_bridgeObjectRetain();
    *((_QWORD *)v67 + 26) = v66;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B59138);
    sub_2127940F0();
    sub_21279DF30();
    sub_2127693E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*((_QWORD *)v67 + 50) + 56))(*((_QWORD *)v67 + 48), 1, 1, *((_QWORD *)v67 + 49));
  }
  if ((*(unsigned int (**)(_QWORD, uint64_t, _QWORD))(*((_QWORD *)v67 + 50) + 48))(*((_QWORD *)v67 + 48), 1, *((_QWORD *)v67 + 49)) != 1)
  {
    v60 = *((_QWORD *)v67 + 51);
    v59 = *((_QWORD *)v67 + 50);
    v61 = *((_QWORD *)v67 + 49);
    v64 = *((_QWORD *)v67 + 31);
    v63 = *((_QWORD *)v67 + 30);
    (*(void (**)(void))(v59 + 32))();
    v62 = sub_21279E1F4();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v59 + 16))(v1, v60, v61);
    sub_212761414();
    *((_QWORD *)v67 + 52) = v62;
    v65 = swift_task_alloc();
    *((_QWORD *)v67 + 53) = v65;
    *(_QWORD *)(v65 + 16) = v63;
    *(_QWORD *)(v65 + 24) = v64;
    v2 = (_QWORD *)swift_task_alloc();
    *((_QWORD *)v67 + 54) = v2;
    sub_212793E34();
    *v2 = *((_QWORD *)v67 + 16);
    v2[1] = sub_21278BC84;
    return sub_21279DC0C();
  }
  v56 = *((_QWORD *)v67 + 28);
  sub_212793EA0(*((_QWORD *)v67 + 48));
  swift_bridgeObjectRetain();
  *((_QWORD *)v67 + 21) = v56;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B59160);
  sub_212793F10();
  sub_21279DF30();
  sub_2127693E0();
  v57 = *((_QWORD *)v67 + 4);
  v58 = *((_QWORD *)v67 + 5);
  *((_QWORD *)v67 + 56) = v58;
  if (v58 == 1)
    goto LABEL_22;
  *((_QWORD *)v67 + 6) = v57;
  *((_QWORD *)v67 + 7) = v58;
  swift_bridgeObjectRetain();
  if (!v58)
  {
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  v52 = *((_QWORD *)v67 + 42);
  v54 = *((_QWORD *)v67 + 41);
  v53 = (char *)*((_QWORD *)v67 + 40);
  *((_QWORD *)v67 + 8) = v57;
  *((_QWORD *)v67 + 9) = v58;
  swift_bridgeObjectRetain();
  sub_212786E00(v57, v58, 1, v53);
  v55 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v52 + 48);
  if (v55(v53, 1, v54) == 1)
  {
    sub_21279200C(*((_QWORD *)v67 + 40));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_22:
    v12 = sub_21279DC00();
    sub_212793F80();
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v12 - 8) + 104))(v11, *MEMORY[0x24BE8FBD0]);
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)())(*((_QWORD *)v67 + 16) + 8))();
  }
  v47 = *((_QWORD *)v67 + 47);
  v48 = *((_QWORD *)v67 + 46);
  v46 = *((_QWORD *)v67 + 42);
  v51 = *((_QWORD *)v67 + 41);
  v50 = (char *)*((_QWORD *)v67 + 39);
  v45 = *(void (**)(void))(v46 + 32);
  v45();
  v49 = *(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 16);
  v49(v48, v47, v51);
  v4 = sub_21279DDB0();
  sub_212786E00(v4, v5, 1, v50);
  if (v55(v50, 1, v51) == 1)
  {
    sub_21279200C(*((_QWORD *)v67 + 39));
  }
  else
  {
    v45();
    if ((sub_21279DA50() & 1) == 0
      || (v42 = *((_QWORD *)v67 + 29),
          swift_bridgeObjectRetain(),
          *((_QWORD *)v67 + 24) = v42,
          sub_21279DF30(),
          sub_2127693E0(),
          v43 = *((_QWORD *)v67 + 10),
          v44 = *((_QWORD *)v67 + 11),
          v44 == 1))
    {
      (*(void (**)(_QWORD, _QWORD))(*((_QWORD *)v67 + 42) + 8))(*((_QWORD *)v67 + 45), *((_QWORD *)v67 + 41));
    }
    else
    {
      *((_QWORD *)v67 + 12) = v43;
      *((_QWORD *)v67 + 13) = v44;
      swift_bridgeObjectRetain();
      if (v44)
      {
        v41 = *((_QWORD *)v67 + 41);
        v40 = (char *)*((_QWORD *)v67 + 38);
        *((_QWORD *)v67 + 14) = v43;
        *((_QWORD *)v67 + 15) = v44;
        swift_bridgeObjectRetain();
        sub_212786E00(v43, v44, 1, v40);
        if (v55(v40, 1, v41) == 1)
        {
          v35 = *((_QWORD *)v67 + 45);
          v34 = *((_QWORD *)v67 + 42);
          v36 = *((_QWORD *)v67 + 41);
          sub_21279200C(*((_QWORD *)v67 + 38));
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v35, v36);
        }
        else
        {
          v28 = *((_QWORD *)v67 + 46);
          v31 = *((_QWORD *)v67 + 45);
          v30 = *((_QWORD *)v67 + 44);
          v27 = *((_QWORD *)v67 + 43);
          v29 = *((_QWORD *)v67 + 42);
          v32 = *((_QWORD *)v67 + 41);
          v45();
          v49(v27, v30, v32);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 40))(v28, v27, v32);
          v33 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
          v33(v30, v32);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v33(v31, v32);
        }
      }
      else
      {
        v38 = *((_QWORD *)v67 + 45);
        v37 = *((_QWORD *)v67 + 42);
        v39 = *((_QWORD *)v67 + 41);
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v38, v39);
      }
    }
  }
  sub_21279DDB0();
  sub_21279D96C();
  swift_bridgeObjectRelease();
  sub_21279DDB0();
  sub_21279DDB0();
  sub_21279DFF0();
  v20 = *((_QWORD *)v67 + 46);
  v23 = *((_QWORD *)v67 + 43);
  v21 = *((_QWORD *)v67 + 42);
  v22 = *((_QWORD *)v67 + 41);
  v16 = *((_QWORD *)v67 + 37);
  v17 = *((_QWORD *)v67 + 36);
  v14 = *((_QWORD *)v67 + 35);
  v15 = *((_QWORD *)v67 + 34);
  v13 = *((_QWORD *)v67 + 33);
  v18 = v67[31];
  v19 = v67[30];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2127730D0(v13);
  sub_212793FF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v17, v16, v15);
  v6 = SFScreenScale();
  v25 = sub_21278D72C(v17, v19, v18, v6);
  *((_QWORD *)v67 + 57) = v25;
  *((_QWORD *)v67 + 22) = v25;
  v49(v23, v20, v22);
  v24 = (id)sub_21279D9F0();
  v7 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
  *((_QWORD *)v67 + 58) = v7;
  v7(v23, v22);
  objc_msgSend(v25, sel_setContentType_, v24);

  objc_msgSend(v25, sel_setIconMode_, 1);
  objc_msgSend(v25, sel_setIconVariant_, 1);
  sub_21279DDB0();
  *((_QWORD *)v67 + 59) = v8;
  v9 = v25;
  v26 = swift_task_alloc();
  *((_QWORD *)v67 + 60) = v26;
  *(_QWORD *)(v26 + 16) = v25;
  v10 = (_QWORD *)swift_task_alloc();
  *((_QWORD *)v67 + 61) = v10;
  sub_212793E34();
  *v10 = *((_QWORD *)v67 + 16);
  v10[1] = sub_21278BEAC;
  return sub_21279E218();
}

uint64_t sub_21278BC84()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 128) = *v1;
  *(_QWORD *)(v2 + 440) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_task_dealloc();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_21278BD4C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v1 = v0[51];
  v2 = v0[50];
  v3 = v0[49];
  v0[16] = v0;
  v5 = v0[25];
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0[16] + 8))(v5);
}

uint64_t sub_21278BEAC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v4;
  uint64_t v5;

  v2 = *v1;
  *(_QWORD *)(v2 + 128) = *v1;
  v2 += 128;
  v5 = v2 - 112;
  *(_QWORD *)(v2 + 368) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    v4 = *(void **)(v5 + 440);
    swift_task_dealloc();

    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_21278BF84()
{
  _QWORD *v0;
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;

  v9 = (void (*)(uint64_t, uint64_t))v0[58];
  v1 = (void *)v0[57];
  v7 = v0[47];
  v6 = v0[46];
  v8 = v0[41];
  v4 = v0[37];
  v3 = v0[35];
  v5 = v0[34];
  v0[16] = v0;
  v10 = v0[23];

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
  v9(v6, v8);
  v9(v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0[16] + 8))(v10);
}

uint64_t sub_21278C170()
{
  _QWORD *v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = v0[51];
  v2 = v0[50];
  v4 = v0[49];
  v0[16] = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)())(v0[16] + 8))();
}

uint64_t sub_21278C2F8()
{
  _QWORD *v0;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);

  v9 = (void (*)(uint64_t, uint64_t))v0[58];
  v2 = (id)v0[57];
  v7 = v0[47];
  v6 = v0[46];
  v8 = v0[41];
  v4 = v0[37];
  v3 = v0[35];
  v5 = v0[34];
  v0[16] = v0;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
  v9(v6, v8);
  v9(v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)())(v0[16] + 8))();
}

uint64_t sub_21278C674()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
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

  v22 = v0[28];
  v21 = v0[27];
  v23 = v0[26];
  v0[4] = v0;
  sub_21279DBB8();
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v21 + 88))(v22, v23) == *MEMORY[0x24BE8FF10])
  {
    v17 = *(_QWORD *)(v20 + 192);
    v18 = *(_QWORD *)(v20 + 184);
    v19 = *(_QWORD *)(v20 + 176);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v20 + 216) + 8))(*(_QWORD *)(v20 + 224), *(_QWORD *)(v20 + 208));
    v16 = sub_21279DBE8();
    swift_bridgeObjectRetain();
    *(_QWORD *)(v20 + 96) = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B591B0);
    sub_2127941D0();
    sub_21279DF30();
    sub_2127693E0();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v19, 1, v18) != 1)
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v20 + 192) + 32))(*(_QWORD *)(v20 + 200), *(_QWORD *)(v20 + 176), *(_QWORD *)(v20 + 184));
      swift_bridgeObjectRelease();
      v1 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v20 + 232) = v1;
      *v1 = *(_QWORD *)(v20 + 32);
      v1[1] = sub_21278CC0C;
      return static SFAirDropUtilities.generateWebPreviewImage(url:)(*(_QWORD *)(v20 + 200));
    }
    sub_2127730D0(*(_QWORD *)(v20 + 176));
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v20 + 216) + 8))(*(_QWORD *)(v20 + 224), *(_QWORD *)(v20 + 208));
  }
  v15 = *(_QWORD *)(v20 + 168);
  v12 = *(_QWORD *)(v20 + 160);
  v14 = *(_QWORD *)(v20 + 152);
  v13 = *(_QWORD *)(v20 + 120);
  *(_QWORD *)(v20 + 64) = sub_21279DBA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v15, v13, v14);
  if (*(_QWORD *)(v20 + 64))
  {
    *(_QWORD *)(v20 + 56) = *(_QWORD *)(v20 + 64);
  }
  else
  {
    *(_QWORD *)(v20 + 56) = sub_21279DBAC();
    sub_21276ED58((id *)(v20 + 64));
  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v20 + 160) + 8))(*(_QWORD *)(v20 + 168), *(_QWORD *)(v20 + 152));
  v11 = *(void **)(v20 + 56);
  if (v11)
  {
    *(_QWORD *)(v20 + 88) = v11;
    sub_212793E34();
    v10 = sub_21278CFB0(v11);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(id))(*(_QWORD *)(v20 + 32) + 8))(v10);
  }
  else
  {
    *(_QWORD *)(v20 + 72) = sub_21279DBC4();
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B591A0);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B59128);
    v8 = sub_212794160();
    v9 = sub_2127745F4((void (*)(char *, char *))sub_21278CFEC, 0, v5, v6, MEMORY[0x24BEE4078], v8, MEMORY[0x24BEE40A8], v7);
    *(_QWORD *)(v20 + 248) = v9;
    sub_2127693E0();
    *(_QWORD *)(v20 + 80) = sub_21279DBC4();
    v4 = sub_2127745F4((void (*)(char *, char *))sub_21278D038, 0, v5, v6, MEMORY[0x24BEE4078], v8, MEMORY[0x24BEE40A8], v7);
    *(_QWORD *)(v20 + 256) = v4;
    sub_2127693E0();
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v20 + 264) = v3;
    *v3 = *(_QWORD *)(v20 + 32);
    v3[1] = sub_21278CDC0;
    return static SFAirDropUtilities.generatePreviewIcon(for:fileTypes:fileSubTypes:size:)(0, v9, v4, *(double *)(v20 + 128), *(double *)(v20 + 136));
  }
}

uint64_t sub_21278CC0C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v3 + 32) = *v1;
  *(_QWORD *)(v3 + 240) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21278CC80()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[30];
  v0[4] = v0;
  v0[14] = v1;
  if (v0[14])
  {
    *(_QWORD *)(v4 + 104) = *(_QWORD *)(v4 + 112);
  }
  else
  {
    sub_212793E34();
    *(_QWORD *)(v4 + 104) = sub_21276C700();
    sub_21276ED58((id *)(v4 + 112));
  }
  v3 = *(_QWORD *)(v4 + 104);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v4 + 192) + 8))(*(_QWORD *)(v4 + 200), *(_QWORD *)(v4 + 184));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v4 + 32) + 8))(v3);
}

_QWORD *sub_21278CDC0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  _QWORD *v6;

  v3 = *v2;
  *(_QWORD *)(v3 + 32) = *v2;
  v6 = (_QWORD *)(v3 + 32);
  *(_QWORD *)(v3 + 272) = v1;
  swift_task_dealloc();
  if (v1)
    return (_QWORD *)swift_task_switch();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(_QWORD *(**)(_QWORD *__return_ptr, uint64_t))(*v6 + 8))(v6, a1);
}

uint64_t sub_21278CF00()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 32) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)())(*(_QWORD *)(v0 + 32) + 8))();
}

id sub_21278CFB0(void *a1)
{
  id v1;

  v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_212791A00(a1);
}

uint64_t sub_21278CFEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v2;

  result = sub_21279DBDC();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_21278D038@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v2;

  result = sub_21279DBD0();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_21278D084(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v4;
  uint64_t v5;

  *(double *)(v4 + 88) = a4;
  *(double *)(v4 + 80) = a3;
  *(_QWORD *)(v4 + 72) = a2;
  *(_QWORD *)(v4 + 64) = a1;
  *(_QWORD *)(v4 + 32) = v4;
  *(_QWORD *)(v4 + 40) = 0;
  *(_QWORD *)(v4 + 16) = 0;
  *(_QWORD *)(v4 + 24) = 0;
  *(_QWORD *)(v4 + 56) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B58F90);
  *(_QWORD *)(v4 + 96) = swift_task_alloc();
  v5 = sub_21279D984();
  *(_QWORD *)(v4 + 104) = v5;
  *(_QWORD *)(v4 + 112) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v4 + 120) = swift_task_alloc();
  *(_QWORD *)(v4 + 128) = swift_task_alloc();
  *(_QWORD *)(v4 + 40) = a2;
  *(double *)(v4 + 16) = a3;
  *(double *)(v4 + 24) = a4;
  return swift_task_switch();
}

uint64_t sub_21278D190()
{
  _QWORD *v0;
  uint64_t v1;
  double v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v18 = v0[14];
  v19 = v0[13];
  v20 = v0[12];
  v17 = v0[9];
  v0[4] = v0;
  swift_bridgeObjectRetain();
  v0[6] = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B59110);
  sub_212793DC4();
  sub_21279DF30();
  sub_2127693E0();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v20, 1, v19) == 1)
  {
    sub_2127730D0(*((_QWORD *)v16 + 12));
    v15 = sub_21279DC00();
    sub_212793F80();
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v15 - 8) + 104))(v1, *MEMORY[0x24BE8FBD0]);
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(*((_QWORD *)v16 + 4) + 8))();
  }
  else
  {
    v9 = *((_QWORD *)v16 + 16);
    v10 = *((_QWORD *)v16 + 15);
    v7 = *((_QWORD *)v16 + 14);
    v8 = *((_QWORD *)v16 + 13);
    v11 = v16[11];
    v12 = v16[10];
    (*(void (**)(void))(v7 + 32))();
    sub_212793FF0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v10, v9, v8);
    v3 = SFScreenScale();
    v13 = sub_21278D72C(v10, v12, v11, v3);
    *((_QWORD *)v16 + 17) = v13;
    *((_QWORD *)v16 + 7) = v13;
    objc_msgSend(v13, sel_setIconMode_, 1);
    objc_msgSend(v13, sel_setIconVariant_, 1);
    sub_21279DDB0();
    *((_QWORD *)v16 + 18) = v4;
    v5 = v13;
    v14 = swift_task_alloc();
    *((_QWORD *)v16 + 19) = v14;
    *(_QWORD *)(v14 + 16) = v13;
    v6 = (_QWORD *)swift_task_alloc();
    *((_QWORD *)v16 + 20) = v6;
    sub_212793E34();
    *v6 = *((_QWORD *)v16 + 4);
    v6[1] = sub_21278D4D4;
    return sub_21279E218();
  }
}

uint64_t sub_21278D4D4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v4;
  uint64_t v5;

  v2 = *v1;
  *(_QWORD *)(v2 + 32) = *v1;
  v2 += 32;
  v5 = v2 - 16;
  *(_QWORD *)(v2 + 136) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    v4 = *(void **)(v5 + 120);
    swift_task_dealloc();

    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_21278D5AC()
{
  _QWORD *v0;
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = (void *)v0[17];
  v5 = v0[16];
  v3 = v0[14];
  v4 = v0[13];
  v0[4] = v0;

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v5, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[4] + 8))();
}

uint64_t sub_21278D650()
{
  _QWORD *v0;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (id)v0[17];
  v4 = v0[16];
  v3 = v0[14];
  v5 = v0[13];
  v0[4] = v0;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[4] + 8))();
}

id sub_21278D72C(uint64_t a1, double a2, double a3, double a4)
{
  id v4;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_212791A44(a1, a2, a3, a4);
}

void sub_21278D788(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t aBlock;
  int v17;
  int v18;
  uint64_t (*v19)(uint64_t, void *, void *);
  void *v20;
  void (*v21)(void *, void *);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a1;
  v13 = a2;
  v24 = 0;
  v23 = 0;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B59330);
  v8 = *(_QWORD *)(v11 - 8);
  v7 = *(_QWORD *)(v8 + 64);
  v5 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v4 - v5;
  v24 = v2;
  v23 = v3;
  v15 = objc_msgSend((id)objc_opt_self(), sel_sharedGenerator);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v6, v11);
  v9 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v12 + v9, v10, v11);
  v21 = sub_2127959C8;
  v22 = v12;
  aBlock = MEMORY[0x24BDAC760];
  v17 = 1107296256;
  v18 = 0;
  v19 = sub_21278DAE0;
  v20 = &block_descriptor_348;
  v14 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v15, sel_generateBestRepresentationForRequest_completionHandler_, v13, v14);
  _Block_release(v14);

}

void sub_21278D92C(void *a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(a1, sel_UIImage);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B59330);
    sub_21279DEA0();

  }
  else
  {
    v3 = a2;
    if (a2)
    {
      v5 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B59330);
      sub_21279DE94();

    }
    else
    {
      v6 = sub_21279DC00();
      sub_212793F80();
      swift_allocError();
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v6 - 8) + 104))(v4, *MEMORY[0x24BE8FBD0]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B59330);
      sub_21279DE94();
    }
  }
}

uint64_t sub_21278DAE0(uint64_t a1, void *a2, void *a3)
{
  id v3;
  id v4;
  void *v6;
  void (*v7)(void *);

  v7 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v3 = a2;
  v4 = a3;
  if (a3)
    v6 = a3;
  else
    v6 = 0;
  v7(a2);

  return swift_release();
}

void sub_21278DB94(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t aBlock;
  int v17;
  int v18;
  uint64_t (*v19)(uint64_t, void *, void *);
  void *v20;
  void (*v21)(void *, void *);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a1;
  v13 = a2;
  v24 = 0;
  v23 = 0;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B59330);
  v8 = *(_QWORD *)(v11 - 8);
  v7 = *(_QWORD *)(v8 + 64);
  v5 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v4 - v5;
  v24 = v2;
  v23 = v3;
  v15 = objc_msgSend((id)objc_opt_self(), sel_sharedGenerator);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v6, v11);
  v9 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v12 + v9, v10, v11);
  v21 = sub_2127959C8;
  v22 = v12;
  aBlock = MEMORY[0x24BDAC760];
  v17 = 1107296256;
  v18 = 0;
  v19 = sub_21278DAE0;
  v20 = &block_descriptor_354;
  v14 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v15, sel_generateBestRepresentationForRequest_completionHandler_, v13, v14);
  _Block_release(v14);

}

void sub_21278DD38(uint64_t a1, uint64_t a2)
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t aBlock;
  int v23;
  int v24;
  uint64_t (*v25)(uint64_t, void *);
  void *v26;
  uint64_t (*v27)(void *);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v13 = a1;
  v8 = a2;
  v30 = 0;
  v29 = 0;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B59370);
  v15 = *(_QWORD *)(v18 - 8);
  v14 = *(_QWORD *)(v15 + 64);
  v7 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v18);
  v17 = (char *)&v6 - v7;
  v11 = sub_21279D984();
  v10 = *(_QWORD *)(v11 - 8);
  v9 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x24BDAC7A8](v13);
  v12 = (char *)&v6 - v9;
  v30 = v3;
  v29 = v4;
  (*(void (**)(char *, double))(v5 + 16))((char *)&v6 - v9, v2);
  v21 = (void *)sub_21279D924();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v13, v18);
  v16 = (*(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  v19 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v15 + 32))(v19 + v16, v17, v18);
  v27 = sub_212795BB8;
  v28 = v19;
  aBlock = MEMORY[0x24BDAC760];
  v23 = 1107296256;
  v24 = 0;
  v25 = sub_21278DF90;
  v26 = &block_descriptor_360;
  v20 = _Block_copy(&aBlock);
  swift_release();
  SFGenerateWebPreviewImage(v21, v20);
  _Block_release(v20);

}

uint64_t sub_21278DF28(void *a1)
{
  id v1;

  v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B59370);
  return sub_21279DEA0();
}

uint64_t sub_21278DF90(uint64_t a1, void *a2)
{
  id v2;
  void (*v4)(void *);

  v4 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v2 = a2;
  v4(a2);

  return swift_release();
}

uint64_t static SFAirDropUtilities.createItemPromises(from:sessionID:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  int v40;
  id v41;
  unsigned int v42;
  id v43;
  id v44;
  int v45;
  int v46;
  id v47;
  void (*v48)(char *, uint64_t);
  int v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  unint64_t v60;
  char *v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char *v67;
  unint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char *v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unsigned __int8 v89;
  char v90;
  char v91;
  unsigned __int8 v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  _QWORD v106[3];
  uint64_t v107;
  char v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;

  v81 = a1;
  v74 = a2;
  v75 = a3;
  v114 = 0;
  v113 = 0;
  v111 = 0;
  v112 = 0;
  v110 = 0;
  v109 = 0;
  v108 = 0;
  v107 = 0;
  v84 = v106;
  memset(v106, 0, sizeof(v106));
  v100 = 0;
  v99 = 0;
  v93 = 0;
  v94 = 0;
  v90 = 0;
  v89 = 0;
  v87 = 0;
  v88 = 0;
  v86 = 0;
  v85 = 0;
  v77 = 0;
  v76 = sub_21279DB64();
  v60 = (*(_QWORD *)(*(_QWORD *)(v76 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v76);
  v61 = (char *)&v28 - v60;
  v62 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254B591C0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v77);
  v63 = (uint64_t)&v28 - v62;
  v64 = sub_21279DB7C();
  v65 = *(_QWORD *)(v64 - 8);
  v66 = (*(_QWORD *)(v65 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v77);
  v67 = (char *)&v28 - v66;
  v68 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v5);
  v69 = (char *)&v28 - v68;
  v114 = (char *)&v28 - v68;
  v70 = sub_21279DA80();
  v71 = *(_QWORD *)(v70 - 8);
  v72 = (*(_QWORD *)(v71 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v70);
  v73 = (char *)&v28 - v72;
  v78 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254B58F98) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v77);
  v79 = (char *)&v28 - v78;
  v113 = v81;
  v111 = v6;
  v112 = v7;
  v110 = v3;
  v109 = sub_21279E1F4();
  v80 = static SFAirDropUtilities.shouldIgnoreString(for:)(v81);
  v108 = v80 & 1;
  v82 = *sub_212774DE0();
  swift_bridgeObjectRetain();
  v107 = v82;
  v104 = v81;
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B590E8);
  sub_212793AE0();
  sub_21279DDEC();
  v103 = v105;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B591C8);
  sub_21279E11C();
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B591D0);
    sub_21279E128();
    v57 = v101;
    v58 = v102;
    if (!v102)
      break;
    v55 = v57;
    v56 = v58;
    v54 = v58;
    v53 = v57;
    v100 = v57;
    v99 = v58;
    v95 = static SFAirDropUtilities.highestFidelityDataType(for:conformingToDataTypes:)(v58, v82);
    v96 = v8;
    v9 = v54;
    swift_bridgeObjectRetain();
    if (v96)
    {
      v97 = v95;
      v98 = v96;
    }
    else
    {
      v97 = static SFAirDropUtilities.guessedDataType(for:dataTypesToTry:)(v54, v82);
      v98 = v10;
      sub_2127677B0();
    }

    swift_bridgeObjectRelease();
    v51 = v97;
    v52 = v98;
    v93 = v97;
    v94 = v98;
    swift_bridgeObjectRetain();
    sub_21279DA8C();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v71 + 48))(v79, 1, v70) == 1)
    {
      sub_21279200C((uint64_t)v79);
      v50 = 2;
    }
    else
    {
      sub_21279DA5C();
      v49 = sub_21279DA50();
      v48 = *(void (**)(char *, uint64_t))(v71 + 8);
      v48(v73, v70);
      v48(v79, v70);
      v50 = v49 & 1;
    }
    v91 = v50;
    if (v50 == 2)
      v92 = 0;
    else
      v92 = v91 & 1;
    v45 = v92;
    v46 = 1;
    v90 = v92 & 1;
    sub_212793A0C();
    swift_bridgeObjectRetain();
    v47 = sub_21278EAC8(v51, v52, v46 & 1);
    if (v47)
    {
      v44 = v47;
      v43 = v47;
      v85 = v47;
      sub_21279DA74();
      v41 = (id)sub_21279D9F0();
      (*(void (**)(char *, uint64_t))(v71 + 8))(v73, v70);
      v42 = objc_msgSend(v43, sel_conformsToType_, v41);

      v89 = v42 & 1;
    }
    else
    {
      v89 = 0;
    }
    v40 = v89;
    if ((v80 & 1) != 0)
      v39 = v40;
    else
      v39 = 0;
    if ((v39 & 1) != 0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      static SFAirDropUtilities.suggestedAirDropThumbnailSize()();
      v34 = v11;
      v35 = v12;
      v87 = v11;
      v88 = v12;
      v36 = 0;
      v33 = 1;
      v32 = sub_21279DDB0();
      v31 = v13;
      v30 = v89;
      sub_21278EB3C();
      sub_21279DB70();
      v14 = sub_21279DED0();
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v14 - 8) + 56))(v63, v33);
      v15 = v54;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v16 = swift_allocObject();
      v17 = v82;
      v18 = v33;
      v19 = v80;
      v20 = v34;
      v21 = v35;
      v22 = v74;
      v23 = v75;
      v24 = v53;
      v25 = v59;
      v26 = v54;
      v37 = v16;
      *(_QWORD *)(v16 + 16) = 0;
      *(_QWORD *)(v16 + 24) = 0;
      *(_QWORD *)(v16 + 32) = v26;
      *(_QWORD *)(v16 + 40) = v17;
      *(_BYTE *)(v16 + 48) = v19 & v18;
      *(_QWORD *)(v16 + 56) = v20;
      *(_QWORD *)(v16 + 64) = v21;
      *(_QWORD *)(v16 + 72) = v22;
      *(_QWORD *)(v16 + 80) = v23;
      *(_QWORD *)(v16 + 88) = v24;
      *(_QWORD *)(v16 + 96) = v25;
      sub_21279DB94();
      v38 = sub_2127633E8(v63, (uint64_t)&unk_254B591E0, v37);
      v86 = v38;
      swift_retain();
      (*(void (**)(char *, char *, uint64_t))(v65 + 16))(v67, v69, v64);
      sub_21279DB58();
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B591E8);
      sub_21279DE70();
      swift_release();
      (*(void (**)(char *, uint64_t))(v65 + 8))(v69, v64);
    }

  }
  sub_2127693E0();
  v28 = &v109;
  v29 = v109;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_2127693E0();
  return v29;
}

id sub_21278EAC8(uint64_t a1, uint64_t a2, char a3)
{
  id v5;
  id v6;

  v5 = (id)sub_21279DD5C();
  v6 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel__typeWithIdentifier_allowUndeclared_, v5, a3 & 1);

  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_21278EB3C()
{
  return 0;
}

uint64_t sub_21278EB44(uint64_t a1, double a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v23;
  uint64_t v24;

  *(_QWORD *)(v10 + 176) = v24;
  *(_QWORD *)(v10 + 168) = v23;
  *(_QWORD *)(v10 + 160) = a10;
  *(_QWORD *)(v10 + 152) = a9;
  *(double *)(v10 + 144) = a3;
  *(double *)(v10 + 136) = a2;
  *(_BYTE *)(v10 + 345) = a8 & 1;
  *(_QWORD *)(v10 + 128) = a7;
  *(_QWORD *)(v10 + 120) = a6;
  *(_QWORD *)(v10 + 112) = a1;
  *(_QWORD *)(v10 + 64) = v10;
  *(_QWORD *)(v10 + 72) = 0;
  *(_QWORD *)(v10 + 80) = 0;
  *(_BYTE *)(v10 + 344) = 0;
  *(_QWORD *)(v10 + 16) = 0;
  *(_QWORD *)(v10 + 24) = 0;
  *(_QWORD *)(v10 + 32) = 0;
  *(_QWORD *)(v10 + 40) = 0;
  *(_QWORD *)(v10 + 88) = 0;
  *(_QWORD *)(v10 + 96) = 0;
  *(_QWORD *)(v10 + 48) = 0;
  *(_QWORD *)(v10 + 56) = 0;
  v11 = sub_21279DABC();
  *(_QWORD *)(v10 + 184) = v11;
  *(_QWORD *)(v10 + 192) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v10 + 200) = swift_task_alloc();
  v12 = sub_21279D984();
  *(_QWORD *)(v10 + 208) = v12;
  *(_QWORD *)(v10 + 216) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v10 + 224) = swift_task_alloc();
  *(_QWORD *)(v10 + 232) = swift_task_alloc();
  v13 = sub_21279DC24();
  *(_QWORD *)(v10 + 240) = v13;
  *(_QWORD *)(v10 + 248) = *(_QWORD *)(v13 - 8);
  *(_QWORD *)(v10 + 256) = swift_task_alloc();
  *(_QWORD *)(v10 + 264) = swift_task_alloc();
  v14 = sub_21279DB7C();
  *(_QWORD *)(v10 + 272) = v14;
  *(_QWORD *)(v10 + 280) = *(_QWORD *)(v14 - 8);
  *(_QWORD *)(v10 + 288) = swift_task_alloc();
  *(_QWORD *)(v10 + 296) = swift_task_alloc();
  *(_QWORD *)(v10 + 304) = type metadata accessor for SFAirDropUtilities.FileLoadResult();
  *(_QWORD *)(v10 + 312) = swift_task_alloc();
  *(_QWORD *)(v10 + 72) = a6;
  *(_QWORD *)(v10 + 80) = a7;
  *(_BYTE *)(v10 + 344) = a8 & 1;
  *(double *)(v10 + 16) = a2;
  *(double *)(v10 + 24) = a3;
  *(_QWORD *)(v10 + 32) = a9;
  *(_QWORD *)(v10 + 40) = a10;
  *(_QWORD *)(v10 + 88) = v23;
  return swift_task_switch();
}

uint64_t sub_21278EDE8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  *(_QWORD *)(v0 + 64) = v0;
  sub_21279DDB0();
  *(_QWORD *)(v0 + 320) = v1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 328) = v2;
  *v2 = *(_QWORD *)(v4 + 64);
  v2[1] = sub_21278EF00;
  return static SFAirDropUtilities.loadFile(from:dataTypesToTry:customDataType:acceptOtherFileRepresentations:ignoreStrings:generatePreviewImage:renameURLs:suggestedThumbnailSize:filename:sessionID:fileIndex:)(*(_QWORD *)(v4 + 312), *(_QWORD *)(v4 + 120), *(_QWORD *)(v4 + 128), 0, 0, 0, *(_BYTE *)(v0 + 345) & 1, 1, *(double *)(v4 + 136), *(double *)(v4 + 144));
}

uint64_t sub_21278EF00()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 64) = *v1;
  *(_QWORD *)(v2 + 336) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_21278EFB8()
{
  _QWORD *v0;
  uint64_t v1;
  id v2;
  unint64_t v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v17 = v0[39];
  v1 = v0[38];
  v18 = v0[37];
  v19 = v0[36];
  v13 = v0[35];
  v14 = v0[34];
  v20 = v0[33];
  v21 = v0[32];
  v6 = v0[31];
  v11 = v0[30];
  v22 = v0[29];
  v23 = v0[28];
  v7 = v0[27];
  v9 = v0[26];
  v0[8] = v0;
  v5 = *(id *)(v17 + *(int *)(v1 + 24));
  v2 = v5;
  v15 = static SFAirDropUtilities.imageData(for:)(v5);
  v16 = v3;

  v0[6] = v15;
  v0[7] = v16;
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v12(v20, v17, v11);
  sub_21279DC18();
  v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v8(v20, v11);
  sub_21279D918();
  v10 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v10(v22, v9);
  swift_bridgeObjectRetain();
  v12(v21, v17, v11);
  sub_21279DC18();
  v8(v21, v11);
  sub_21279D90C();
  v10(v23, v9);
  sub_2127925D8(v15, v16);
  sub_21278EB3C();
  sub_21279DB70();
  v12(v20, v17, v11);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v19, v18, v14);
  sub_21279DB88();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v18, v14);
  sub_212792590(v15, v16);
  sub_212792C34(v17);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[8] + 8))();
}

uint64_t sub_21278F2F4()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint8_t *buf;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint32_t size;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t, uint64_t);
  uint64_t v45;

  v20 = *(id *)(v0 + 336);
  v1 = *(_QWORD *)(v0 + 200);
  v15 = *(_QWORD *)(v0 + 192);
  v16 = *(_QWORD *)(v0 + 184);
  v17 = *(_QWORD *)(v0 + 168);
  v19 = *(_QWORD *)(v0 + 160);
  v18 = *(_QWORD *)(v0 + 152);
  *(_QWORD *)(v0 + 64) = v0;
  swift_bridgeObjectRelease();
  v2 = v20;
  *(_QWORD *)(v0 + 96) = v20;
  v3 = sub_212774050();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v1, v3, v16);
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = v17;
  swift_bridgeObjectRetain();
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = v18;
  *(_QWORD *)(v24 + 24) = v19;
  v4 = v20;
  v26 = swift_allocObject();
  *(_QWORD *)(v26 + 16) = v20;
  sub_21276E9A4();
  swift_bridgeObjectRelease();
  v39 = sub_21279DAA4();
  v40 = sub_21279DF6C();
  *(_QWORD *)(v0 + 104) = 32;
  sub_212766204();
  sub_21276626C();
  sub_2127662D4();
  sub_21279DE28();
  size = *(_DWORD *)(v0 + 348);
  v29 = swift_allocObject();
  *(_BYTE *)(v29 + 16) = 0;
  v30 = swift_allocObject();
  *(_BYTE *)(v30 + 16) = 8;
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = sub_212795504;
  *(_QWORD *)(v23 + 24) = v22;
  v31 = swift_allocObject();
  *(_QWORD *)(v31 + 16) = sub_212795644;
  *(_QWORD *)(v31 + 24) = v23;
  v32 = swift_allocObject();
  *(_BYTE *)(v32 + 16) = 32;
  v33 = swift_allocObject();
  *(_BYTE *)(v33 + 16) = 8;
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = sub_212792E14;
  *(_QWORD *)(v25 + 24) = v24;
  v34 = swift_allocObject();
  *(_QWORD *)(v34 + 16) = sub_212767488;
  *(_QWORD *)(v34 + 24) = v25;
  v35 = swift_allocObject();
  *(_BYTE *)(v35 + 16) = 64;
  v36 = swift_allocObject();
  *(_BYTE *)(v36 + 16) = 8;
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = sub_21276F6EC;
  *(_QWORD *)(v27 + 24) = v26;
  v28 = swift_allocObject();
  *(_QWORD *)(v28 + 16) = sub_212773490;
  *(_QWORD *)(v28 + 24) = v27;
  v37 = swift_allocObject();
  *(_QWORD *)(v37 + 16) = sub_212767488;
  *(_QWORD *)(v37 + 24) = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E0);
  sub_21279E1F4();
  v38 = v5;
  swift_retain();
  *v38 = sub_21276741C;
  v38[1] = v29;
  swift_retain();
  v38[2] = sub_21276741C;
  v38[3] = v30;
  swift_retain();
  v38[4] = sub_21279568C;
  v38[5] = v31;
  swift_retain();
  v38[6] = sub_21276741C;
  v38[7] = v32;
  swift_retain();
  v38[8] = sub_21276741C;
  v38[9] = v33;
  swift_retain();
  v38[10] = sub_2127674D0;
  v38[11] = v34;
  swift_retain();
  v38[12] = sub_21276741C;
  v38[13] = v35;
  swift_retain();
  v38[14] = sub_21276741C;
  v38[15] = v36;
  swift_retain();
  v38[16] = sub_21276F2A8;
  v38[17] = v37;
  sub_212761414();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v39, v40))
  {
    buf = (uint8_t *)sub_21279DFE4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B586E8);
    v12 = sub_21276633C(1);
    v13 = sub_21276633C(1);
    v41 = buf;
    v42 = v12;
    v43 = v13;
    sub_212766394(2, &v41);
    sub_212766394(3, &v41);
    v44 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
    v45 = v29;
    sub_2127663A8(&v44, (uint64_t)&v41, (uint64_t)&v42, (uint64_t)&v43);
    v44 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
    v45 = v30;
    sub_2127663A8(&v44, (uint64_t)&v41, (uint64_t)&v42, (uint64_t)&v43);
    v44 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21279568C;
    v45 = v31;
    sub_2127663A8(&v44, (uint64_t)&v41, (uint64_t)&v42, (uint64_t)&v43);
    v44 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
    v45 = v32;
    sub_2127663A8(&v44, (uint64_t)&v41, (uint64_t)&v42, (uint64_t)&v43);
    v44 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
    v45 = v33;
    sub_2127663A8(&v44, (uint64_t)&v41, (uint64_t)&v42, (uint64_t)&v43);
    v44 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2127674D0;
    v45 = v34;
    sub_2127663A8(&v44, (uint64_t)&v41, (uint64_t)&v42, (uint64_t)&v43);
    v44 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
    v45 = v35;
    sub_2127663A8(&v44, (uint64_t)&v41, (uint64_t)&v42, (uint64_t)&v43);
    v44 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276741C;
    v45 = v36;
    sub_2127663A8(&v44, (uint64_t)&v41, (uint64_t)&v42, (uint64_t)&v43);
    v44 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21276F2A8;
    v45 = v37;
    sub_2127663A8(&v44, (uint64_t)&v41, (uint64_t)&v42, (uint64_t)&v43);
    _os_log_impl(&dword_212728000, v39, v40, "Failed to load item %ld for session %s: %@", buf, size);
    sub_2127663EC(v12);
    sub_2127663EC(v13);
    sub_21279DFCC();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  v9 = (id)v14[42];
  v10 = v14[25];
  v7 = v14[24];
  v8 = v14[23];

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v8);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v14[8] + 8))();
}

uint64_t SFAirDropUtilities.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SFAirDropUtilities.__deallocating_deinit()
{
  SFAirDropUtilities.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2127900D0()
{
  swift_allocObject();
  return sub_212790108();
}

uint64_t sub_212790108()
{
  uint64_t v0;

  return v0;
}

uint64_t SFAirDropUtilities.FileLoadError.description.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v3;
  uint64_t v4;
  void *v6;

  v6 = *(void **)v0;
  if (*(_BYTE *)(v0 + 8))
  {
    if (*(_BYTE *)(v0 + 8) == 1)
    {
      swift_bridgeObjectRetain();
      sub_21279E1E8();
      sub_21279DDB0();
      sub_21279E1DC();
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B59070);
      sub_212794398();
      sub_21279E1C4();
      sub_21279DDB0();
      sub_21279E1DC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_2127677B0();
      v3 = sub_21279DDA4();
      swift_bridgeObjectRelease();
      return v3;
    }
    else
    {
      return sub_21279DDB0();
    }
  }
  else
  {
    v1 = v6;
    sub_21279E1E8();
    sub_21279DDB0();
    sub_21279E1DC();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B586F0);
    sub_21279E1B8();
    sub_21279DDB0();
    sub_21279E1DC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2127677B0();
    v4 = sub_21279DDA4();

    return v4;
  }
}

uint64_t sub_212790490()
{
  return SFAirDropUtilities.FileLoadError.description.getter();
}

uint64_t sub_2127904A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[3];
  int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t);
  void (*v20)(char *, char *, uint64_t);
  void (*v21)(char *, uint64_t);
  char *v22;
  const char *v23;
  const char *v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  unint64_t v28;
  uint64_t v29;
  char *v30;
  unint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;

  v22 = a3;
  v33 = a1;
  v34 = a2;
  v23 = "Fatal error";
  v24 = "SharingUI/SFUISwiftUtilities.swift";
  v46 = 0;
  v45 = 0;
  v43 = 0;
  v44 = 0;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B58F98);
  v25 = (*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v3);
  v36 = (char *)v13 - v25;
  v38 = sub_21279DA80();
  v35 = *(_QWORD *)(v38 - 8);
  v29 = *(_QWORD *)(v35 + 64);
  v26 = (v29 + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = MEMORY[0x24BDAC7A8](v34);
  v27 = (char *)v13 - v26;
  v28 = (v29 + 15) & 0xFFFFFFFFFFFFFFF0;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v30 = (char *)v13 - v28;
  v46 = (char *)v13 - v28;
  v31 = (v29 + 15) & 0xFFFFFFFFFFFFFFF0;
  v6 = MEMORY[0x24BDAC7A8](v5);
  v32 = (char *)v13 - v31;
  v45 = (char *)v13 - v31;
  v43 = v7;
  v44 = v6;
  swift_bridgeObjectRetain();
  v37 = 1;
  sub_212786E00(v33, v34, 0, v36);
  if ((*(unsigned int (**)(char *, _QWORD, uint64_t))(v35 + 48))(v36, v37, v38) == 1)
  {
    sub_21279200C((uint64_t)v36);
    swift_bridgeObjectRetain();
    v13[1] = 46;
    v9 = sub_21279E1E8();
    v16 = &v41;
    v41 = v9;
    v42 = v10;
    v14 = 1;
    sub_21279DDB0();
    v13[2] = v11;
    sub_21279E1DC();
    swift_bridgeObjectRelease();
    v39 = v33;
    v40 = v34;
    sub_21279E1D0();
    sub_21279DDB0();
    v15 = v12;
    sub_21279E1DC();
    swift_bridgeObjectRelease();
    v18 = v41;
    v17 = v42;
    swift_bridgeObjectRetain();
    sub_2127677B0();
    sub_21279DDA4();
    result = sub_21279E104();
    __break(1u);
  }
  else
  {
    v19 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
    v19(v30, v36, v38);
    v20 = *(void (**)(char *, char *, uint64_t))(v35 + 16);
    v20(v27, v30, v38);
    v19(v32, v27, v38);
    v21 = *(void (**)(char *, uint64_t))(v35 + 8);
    v21(v30, v38);
    v20(v22, v32, v38);
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(char *, uint64_t))v21)(v32, v38);
  }
  return result;
}

uint64_t sub_212790858()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  char *v4;

  v3 = sub_21279DA80();
  __swift_allocate_value_buffer(v3, qword_254B5A500);
  v4 = (char *)__swift_project_value_buffer(v3, (uint64_t)qword_254B5A500);
  v0 = sub_21279DDB0();
  return sub_2127904A4(v0, v1, v4);
}

uint64_t sub_2127908C0(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v12;
  uint64_t v13;

  swift_unknownObjectRetain();
  v3 = a3;
  v12 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v6 = a3;
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B59040);
    sub_212778A88(v12, (uint64_t)a3, v7);
  }
  else
  {
    swift_unknownObjectRetain();
    if (a2)
    {
      v8 = a2;
    }
    else
    {
      sub_21279E20C();
      __break(1u);
    }
    v13 = v8;
    v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B59040);
    sub_212778AE0(v12, (uint64_t)&v13, v4);
  }

  return swift_unknownObjectRelease();
}

void sub_2127909D8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10[2];
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  v19 = a1;
  v11 = a2;
  v18 = a3;
  v12 = sub_21279D984();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = (*(_QWORD *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v10 - v14;
  v16 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v4);
  v17 = (uint64_t)v10 - v16;
  v6 = v5;
  v7 = v18;
  v20 = *(_QWORD *)(v19 + 32);
  if (v18)
  {
    v10[1] = (uint64_t)v18;
    v10[0] = (uint64_t)v18;
    v9 = v18;
    sub_212778A88(v20, v10[0], v12);
  }
  else
  {
    v8 = v11;
    sub_21279D954();
    (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v17, v15, v12);
    sub_212778AE0(v20, v17, v12);

  }
}

uint64_t SFUIPeopleSuggestionImageProvider.previewCornerIcon(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[9] = v2;
  v3[8] = a2;
  v3[7] = a1;
  v3[4] = v3;
  v3[2] = 0;
  v3[3] = 0;
  v3[5] = 0;
  v3[2] = a1;
  v3[3] = a2;
  v3[5] = v2;
  return swift_task_switch();
}

uint64_t sub_212790B80()
{
  _QWORD *v0;
  uint64_t v1;
  id v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;

  v7 = (id)v0[9];
  v6 = v0[8];
  v5 = v0[7];
  v0[4] = v0;
  sub_21279DDB0();
  v0[10] = v1;
  swift_bridgeObjectRetain();
  v2 = v7;
  v9 = (_QWORD *)swift_task_alloc();
  v0[11] = v9;
  v9[2] = v5;
  v9[3] = v6;
  v9[4] = v7;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 96) = v3;
  sub_212793E34();
  *v3 = *(_QWORD *)(v8 + 32);
  v3[1] = sub_212790CA8;
  return sub_21279E218();
}

uint64_t sub_212790CA8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v4;
  uint64_t v5;

  v2 = *v1;
  *(_QWORD *)(v2 + 32) = *v1;
  v2 += 32;
  v5 = v2 - 16;
  *(_QWORD *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    v4 = *(void **)(v5 + 56);
    swift_task_dealloc();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_212790D90()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 32) = v0;
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v0 + 32) + 8))(*(_QWORD *)(v0 + 48));
}

uint64_t sub_212790DB8()
{
  uint64_t v0;
  id v2;

  v2 = *(id *)(v0 + 72);
  *(_QWORD *)(v0 + 32) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)())(*(_QWORD *)(v0 + 32) + 8))();
}

void sub_212790E44(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t aBlock;
  int v39;
  int v40;
  uint64_t (*v41)(uint64_t);
  void *v42;
  void (*v43)();
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v19 = a1;
  v21 = a2;
  v22 = a3;
  v23 = a4;
  v48 = 0;
  v46 = 0;
  v47 = 0;
  v45 = 0;
  v29 = 0;
  v32 = sub_21279DCA8();
  v30 = *(_QWORD *)(v32 - 8);
  v16 = (*(_QWORD *)(v30 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0);
  v31 = (char *)&v16 - v16;
  v35 = sub_21279DCC0();
  v33 = *(_QWORD *)(v35 - 8);
  v17 = (*(_QWORD *)(v33 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v35);
  v34 = (char *)&v16 - v17;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B59330);
  v24 = *(_QWORD *)(v27 - 8);
  v20 = *(_QWORD *)(v24 + 64);
  v18 = (v20 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v29);
  v26 = (char *)&v16 - v18;
  v48 = v4;
  v46 = v5;
  v47 = v6;
  v45 = v7;
  sub_212795024();
  v37 = (id)sub_21279DF90();
  swift_bridgeObjectRetain();
  v8 = v23;
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v26, v19, v27);
  v25 = (*(unsigned __int8 *)(v24 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  v9 = (_QWORD *)swift_allocObject();
  v10 = v22;
  v11 = v23;
  v12 = v24;
  v13 = v25;
  v14 = v26;
  v15 = v27;
  v28 = v9;
  v9[2] = v21;
  v9[3] = v10;
  v9[4] = v11;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))((char *)v9 + v13, v14, v15);
  v43 = sub_212795120;
  v44 = v28;
  aBlock = MEMORY[0x24BDAC760];
  v39 = 1107296256;
  v40 = 0;
  v41 = sub_21276B694;
  v42 = &block_descriptor_273;
  v36 = _Block_copy(&aBlock);
  sub_212791814();
  sub_212791828();
  MEMORY[0x212BF20D8](v29, v34, v31, v36);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v32);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v34, v35);
  _Block_release(v36);
  swift_release();

}

void sub_212791104(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  uint64_t aBlock;
  int v38;
  int v39;
  uint64_t (*v40)(uint64_t, void *, char, void *);
  void *v41;
  void (*v42)(void *, char, void *);
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v33 = a1;
  v31 = a2;
  v34 = a3;
  v24 = a4;
  v47 = 0;
  v48 = 0;
  v46 = 0;
  v45 = 0;
  v44 = 0;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B59330);
  v26 = *(_QWORD *)(v29 - 8);
  v25 = *(_QWORD *)(v26 + 64);
  v15 = (v25 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v33);
  v28 = (char *)&v14 - v15;
  v47 = v4;
  v48 = v5;
  v46 = v6;
  v45 = v7;
  v23 = 0;
  sub_21279529C();
  v17 = "CornerIconProvidingSuggestion";
  v18 = 29;
  v16 = 1;
  v19 = sub_21279DDB0();
  v20 = v8;
  v21 = sub_21279DDB0();
  v22 = v9;
  swift_bridgeObjectRetain();
  v36 = sub_2127913B4(v19, v20, v21, v22, v33, v31, v23, (uint64_t)v23, 0);
  v44 = v36;
  v10 = v36;
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v28, v24, v29);
  swift_bridgeObjectRetain();
  v27 = (*(unsigned __int8 *)(v26 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  v30 = (v27 + v25 + 7) & 0xFFFFFFFFFFFFFFF8;
  v32 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v26 + 32))(v32 + v27, v28, v29);
  v11 = v31;
  v12 = v32;
  v13 = (_QWORD *)(v32 + v30);
  *v13 = v33;
  v13[1] = v11;
  v42 = sub_212795398;
  v43 = v12;
  aBlock = MEMORY[0x24BDAC760];
  v38 = 1107296256;
  v39 = 0;
  v40 = sub_212791754;
  v41 = &block_descriptor_279;
  v35 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v34, sel_requestTransportImageForPeopleSuggestion_resultHandler_, v36, v35);
  _Block_release(v35);
  swift_unknownObjectRelease();

}

id sub_2127913B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9)
{
  id v9;

  v9 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_212791AF0(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

void sub_21279143C(void *a1, char a2, void *a3)
{
  id v3;
  id v4;
  id v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;

  if ((a2 & 1) == 0)
  {
    v3 = a1;
    if (a1)
    {
      v5 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B59330);
      sub_21279DEA0();

    }
    else
    {
      v4 = a3;
      if (a3)
      {
        v10 = a3;
        __swift_instantiateConcreteTypeFromMangledName(&qword_254B59330);
        sub_21279DE94();

      }
      else
      {
        v13 = sub_21279DC3C();
        sub_21279546C();
        swift_allocError();
        v14 = v6;
        sub_21279E1E8();
        sub_21279DDB0();
        sub_21279E1DC();
        swift_bridgeObjectRelease();
        sub_21279E1D0();
        sub_21279DDB0();
        sub_21279E1DC();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_2127677B0();
        v11 = sub_21279DDA4();
        v12 = v7;
        v8 = sub_21279DDB0();
        *v14 = v11;
        v14[1] = v12;
        v14[2] = v8;
        v14[3] = v9;
        v14[4] = 555;
        (*(void (**)(void))(*(_QWORD *)(v13 - 8) + 104))();
        __swift_instantiateConcreteTypeFromMangledName(&qword_254B59330);
        sub_21279DE94();
      }
    }
  }
}

uint64_t sub_212791754(uint64_t a1, void *a2, char a3, void *a4)
{
  id v4;
  id v5;
  void *v7;
  void (*v9)(void *, _QWORD);

  v9 = *(void (**)(void *, _QWORD))(a1 + 32);
  swift_retain();
  v4 = a2;
  v5 = a4;
  if (a4)
    v7 = a4;
  else
    v7 = 0;
  v9(a2, a3 & 1);

  return swift_release();
}

uint64_t sub_212791814()
{
  return sub_21279DCB4();
}

uint64_t sub_212791828()
{
  sub_2127921E8(0);
  sub_21279DCA8();
  sub_2127951BC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B59348);
  sub_21279522C();
  return sub_21279E020();
}

id sub_2127918BC(uint64_t a1)
{
  id v1;
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v8;
  uint64_t v9;

  v8 = sub_21279D984();
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v9 + 48))(a1, 1) == 1)
  {
    v1 = objc_msgSend(v6, sel_initWithBundleAtURL_, 0);
  }
  else
  {
    v5 = sub_21279D924();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
    v1 = objc_msgSend(v6, sel_initWithBundleAtURL_, v5);
  }
  v4 = v1;

  return v4;
}

id sub_212791984(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v4;
  id v6;

  v4 = (id)sub_21279D924();
  v6 = objc_msgSend(v1, sel_initWithAssetBundleAtURL_);

  v2 = sub_21279D984();
  (*(void (**)(uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1);
  return v6;
}

id sub_212791A00(void *a1)
{
  void *v1;
  id v4;

  v4 = objc_msgSend(v1, sel_initWithCGImage_);

  return v4;
}

id sub_212791A44(uint64_t a1, double a2, double a3, double a4)
{
  void *v4;
  uint64_t v5;
  id v10;
  id v12;

  v10 = (id)sub_21279D924();
  v12 = objc_msgSend(v4, sel_initWithFileAtURL_size_scale_representationTypes_, a2, a3, a4);

  v5 = sub_21279D984();
  (*(void (**)(uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1);
  return v12;
}

id sub_212791AF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9)
{
  id v10;
  uint64_t v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v15 = (void *)sub_21279DD5C();
  v16 = (void *)sub_21279DD5C();
  v17 = (void *)sub_21279DD5C();
  if (a9)
  {
    v11 = sub_21279DD5C();
    swift_bridgeObjectRelease();
    v12 = (void *)v11;
  }
  else
  {
    v12 = 0;
  }
  v10 = objc_msgSend(v14, sel_initWithIdentifier_displayName_transportBundleIdentifier_contact_deviceModelIdentifier_, v15, v16, v17, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return v10;
}

double sub_212791C34(uint64_t a1)
{
  return (double)a1;
}

uint64_t type metadata accessor for SFAirDropUtilities.FileLoadResult()
{
  uint64_t v1;

  v1 = qword_254B592F0;
  if (!qword_254B592F0)
    return swift_getSingletonMetadata();
  return v1;
}

unint64_t sub_212791CA0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B58F78;
  if (!qword_254B58F78)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B58F70);
    v1 = MEMORY[0x212BF3218](MEMORY[0x24BEE12E0], v0);
    atomic_store(v1, (unint64_t *)&qword_254B58F78);
    return v1;
  }
  return v3;
}

unint64_t sub_212791D10()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_254B58F80;
  if (!qword_254B58F80)
  {
    v0 = MEMORY[0x212BF3218](&protocol conformance descriptor for SFAirDropUtilities.FileLoadError, &type metadata for SFAirDropUtilities.FileLoadError);
    atomic_store(v0, (unint64_t *)&qword_254B58F80);
    return v0;
  }
  return v2;
}

id sub_212791D7C(id result, char a2)
{
  if (!a2)
    return result;
  if (a2 == 1)
    return (id)swift_bridgeObjectRetain();
  return result;
}

void sub_212791DDC(void *a1, char a2)
{
  if (a2)
  {
    if (a2 == 1)
      swift_bridgeObjectRelease();
  }
  else
  {

  }
}

_QWORD *sub_212791E3C(id *a1, _QWORD *a2)
{
  id v2;
  _QWORD *result;
  id v4;

  v4 = *a1;
  v2 = *a1;
  result = a2;
  *a2 = v4;
  return result;
}

unint64_t sub_212791E70()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B58FB8;
  if (!qword_254B58FB8)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B58FA8);
    v1 = MEMORY[0x212BF3218](MEMORY[0x24BEE12C8], v0);
    atomic_store(v1, (unint64_t *)&qword_254B58FB8);
    return v1;
  }
  return v3;
}

void *sub_212791EE0(const void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v6;
  uint64_t v7;

  v6 = sub_21279D8B8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B58FA0);
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t sub_212791F9C(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_21279D8B8();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return a1;
}

uint64_t sub_21279200C(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_21279DA80();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return a1;
}

uint64_t sub_21279207C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(sub_21279D984() - 8);
  (*(void (**)(unint64_t))(v1 + 8))(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
  return swift_deallocObject();
}

uint64_t sub_2127920EC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212792128(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(*(_QWORD *)(*(_QWORD *)(a2 + 64) + 40), a1);
  return swift_continuation_throwingResume();
}

uint64_t sub_212792178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  swift_allocError();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(v4, a1);
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_2127921E8(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v4 = result;
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    if (result > 0)
    {
      sub_21279DCA8();
      v1 = sub_21279DE64();
      *(_QWORD *)(v1 + 16) = v4;
      v3 = v1;
    }
    else
    {
      v2 = MEMORY[0x24BEE4AF8];
      swift_retain();
      v3 = v2;
    }
    sub_21279DCA8();
    return v3;
  }
  return result;
}

uint64_t sub_2127922A0()
{
  return swift_deallocObject();
}

uint64_t sub_2127922C8()
{
  return swift_deallocObject();
}

uint64_t sub_2127922F0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21279232C()
{
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_212792368()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_254B58FD0;
  if (!qword_254B58FD0)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_254B58FD0);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t sub_2127923CC()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_254B58FD8;
  if (!qword_254B58FD8)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_254B58FD8);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_212792430(uint64_t a1)
{
  if ((*(_QWORD *)(a1 + 8) & 0xF000000000000000) != 0xF000000000000000)
    sub_212792480(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  return a1;
}

uint64_t sub_212792480(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (((a2 >> 62) & 3) == 1)
    return swift_release();
  if (((a2 >> 62) & 3) == 2)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_212792508(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (((a2 >> 62) & 3) == 1)
    return swift_retain();
  if (((a2 >> 62) & 3) == 2)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_212792590(uint64_t result, unint64_t a2)
{
  if ((a2 & 0xF000000000000000) != 0xF000000000000000)
    return sub_212792480(result, a2);
  return result;
}

uint64_t sub_2127925D8(uint64_t result, unint64_t a2)
{
  if ((a2 & 0xF000000000000000) != 0xF000000000000000)
    return sub_212792508(result, a2);
  return result;
}

void *sub_212792620(const void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v6;
  uint64_t v7;

  v6 = sub_21279DA80();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B58F98);
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t sub_2127926DC()
{
  uint64_t v0;

  return swift_deallocObject();
}

void *sub_212792718()
{
  uint64_t v0;

  return sub_212777D98(*(void **)(v0 + 16));
}

uint64_t sub_212792720()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_21279275C()
{
  return swift_deallocObject();
}

uint64_t sub_212792784()
{
  return swift_deallocObject();
}

uint64_t sub_2127927AC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  double v7;
  void (*v8)(double);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[3];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[16];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v15 = a1;
  v18 = a6;
  v13[1] = a7;
  v22 = a6;
  v16 = *(_QWORD *)(a6 - 8);
  v13[0] = (*(_QWORD *)(v16 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = MEMORY[0x24BDAC7A8](a1);
  v17 = (uint64_t)v13 - v13[0];
  v8(v7);
  v14 = sub_21279E0EC() >> 3;
  v20 = *v15;
  v21 = v20 + v14;
  sub_2127928EC(v17, sub_212795920, (uint64_t)v19, v18, MEMORY[0x24BEE4078], MEMORY[0x24BEE4AE0] + 8, MEMORY[0x24BEE40A8], v13[2]);
  v9 = v16;
  v10 = v17;
  v11 = v18;
  *v15 += v14;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
}

uint64_t sub_2127928C8()
{
  return sub_21279DFFC();
}

uint64_t sub_2127928EC(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t (*v17)(void);
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v17 = a2;
  v13 = a5;
  v14 = a8;
  v23 = a4;
  v22 = a5;
  v21 = a6;
  v15 = *(_QWORD *)(a5 - 8);
  v16 = (*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v9 = MEMORY[0x24BDAC7A8]();
  v18 = (char *)&v12 - v16;
  v20 = v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64);
  result = v17();
  v19 = v8;
  if (v8)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v15 + 32))(v14, v18, v13);
  return result;
}

uint64_t sub_2127929D0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212792A0C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212792A48()
{
  return swift_deallocObject();
}

uint64_t sub_212792A70()
{
  return swift_deallocObject();
}

uint64_t sub_212792A98()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212792AD4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212792B10()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212792B50(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  id v4;
  uint64_t result;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int *v10;

  v2 = sub_21279DC24();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a2, a1);
  v10 = (int *)type metadata accessor for SFAirDropUtilities.FileLoadResult();
  v3 = (_QWORD *)(a1 + v10[5]);
  v6 = (_QWORD *)(a2 + v10[5]);
  *v6 = *v3;
  v7 = v3[1];
  swift_bridgeObjectRetain();
  v6[1] = v7;
  v8 = v10[6];
  v9 = *(void **)(a1 + v8);
  v4 = v9;
  result = a2;
  *(_QWORD *)(a2 + v8) = v9;
  *(_BYTE *)(a2 + v10[7]) = *(_BYTE *)(a1 + v10[7]);
  return result;
}

uint64_t sub_212792C34(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v1 = sub_21279DC24();
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(a1);
  v3 = type metadata accessor for SFAirDropUtilities.FileLoadResult();
  swift_bridgeObjectRelease();

  return a1;
}

__n128 sub_212792CAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int *v3;
  __n128 result;

  v2 = sub_21279DC24();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 32))(a2, a1);
  v3 = (int *)type metadata accessor for SFAirDropUtilities.FileLoadResult();
  result = *(__n128 *)(a1 + v3[5]);
  *(__n128 *)(a2 + v3[5]) = result;
  *(_QWORD *)(a2 + v3[6]) = *(_QWORD *)(a1 + v3[6]);
  *(_BYTE *)(a2 + v3[7]) = *(_BYTE *)(a1 + v3[7]);
  return result;
}

unint64_t sub_212792D40()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B59078;
  if (!qword_254B59078)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B59070);
    v1 = MEMORY[0x212BF3218](MEMORY[0x24BEE12C8], v0);
    atomic_store(v1, (unint64_t *)&qword_254B59078);
    return v1;
  }
  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_212792DB0(id *a1)
{

}

uint64_t sub_212792DD8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_212792E14()
{
  uint64_t v0;
  uint64_t result;

  result = *(_QWORD *)(v0 + 16);
  sub_212784CD0();
  return result;
}

uint64_t sub_212792E20()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_212792E5C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_212792E98()
{
  return swift_deallocObject();
}

uint64_t sub_212792EC0()
{
  return swift_deallocObject();
}

uint64_t sub_212792EE8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212792F24()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212792F60()
{
  return swift_deallocObject();
}

uint64_t sub_212792F88()
{
  return swift_deallocObject();
}

uint64_t sub_212792FB0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212792FEC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212793028()
{
  return swift_deallocObject();
}

uint64_t sub_212793050()
{
  return swift_deallocObject();
}

uint64_t sub_212793078()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2127930B4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2127930F0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21279312C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_212793168()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2127931A4()
{
  return swift_deallocObject();
}

uint64_t sub_2127931CC()
{
  return swift_deallocObject();
}

uint64_t sub_2127931F4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212793230()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21279326C()
{
  return swift_deallocObject();
}

uint64_t sub_212793294()
{
  return swift_deallocObject();
}

uint64_t sub_2127932BC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2127932F8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212793334()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_212793370()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2127933AC()
{
  return swift_deallocObject();
}

uint64_t sub_2127933D4()
{
  return swift_deallocObject();
}

uint64_t sub_2127933FC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212793438()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212793474()
{
  return swift_deallocObject();
}

uint64_t sub_21279349C()
{
  return swift_deallocObject();
}

uint64_t sub_2127934C4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212793500()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21279353C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212793578()
{
  return sub_2127871D0() & 1;
}

unint64_t sub_2127935A4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B59088;
  if (!qword_254B59088)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B59070);
    v1 = MEMORY[0x212BF3218](MEMORY[0x24BEE12F0], v0);
    atomic_store(v1, (unint64_t *)&qword_254B59088);
    return v1;
  }
  return v3;
}

_QWORD *sub_212793614(_QWORD *a1, _QWORD *a2)
{
  _QWORD *result;
  uint64_t v4;

  *a2 = *a1;
  v4 = a1[1];
  swift_bridgeObjectRetain();
  result = a2;
  a2[1] = v4;
  return result;
}

uint64_t type metadata accessor for SFAirDropUtilities()
{
  return objc_opt_self();
}

void *sub_212793674(const void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v6;
  uint64_t v7;

  v6 = sub_21279D984();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B58F90);
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

unint64_t sub_212793730()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B590A0;
  if (!qword_254B590A0)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B59070);
    v1 = MEMORY[0x212BF3218](MEMORY[0x24BEE12E0], v0);
    atomic_store(v1, (unint64_t *)&qword_254B590A0);
    return v1;
  }
  return v3;
}

unint64_t sub_2127937A0()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_254B590B0;
  if (!qword_254B590B0)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_254B590B0);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t sub_212793804()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_254B590B8;
  if (!qword_254B590B8)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_254B590B8);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_212793868()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2127938A4()
{
  return swift_deallocObject();
}

uint64_t sub_2127938CC()
{
  return swift_deallocObject();
}

uint64_t sub_2127938F4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212793930()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21279396C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v3 + 16) = v3;
  v7 = v2[2];
  v8 = v2[3];
  v9 = v2[4];
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v4;
  *v4 = *(_QWORD *)(v3 + 16);
  v4[1] = sub_212765728;
  return sub_212788ADC(a1, a2, v7, v8, v9);
}

unint64_t sub_212793A0C()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_254B590D0;
  if (!qword_254B590D0)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_254B590D0);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t sub_212793A70()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B590D8;
  if (!qword_254B590D8)
  {
    v0 = sub_21279DA80();
    v1 = MEMORY[0x212BF3218](MEMORY[0x24BEE63F8], v0);
    atomic_store(v1, (unint64_t *)&qword_254B590D8);
    return v1;
  }
  return v3;
}

unint64_t sub_212793AE0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B590F0;
  if (!qword_254B590F0)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B590E8);
    v1 = MEMORY[0x212BF3218](MEMORY[0x24BEE12C8], v0);
    atomic_store(v1, (unint64_t *)&qword_254B590F0);
    return v1;
  }
  return v3;
}

unint64_t sub_212793B50()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B590F8;
  if (!qword_254B590F8)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B58F70);
    v1 = MEMORY[0x212BF3218](MEMORY[0x24BEE12C8], v0);
    atomic_store(v1, (unint64_t *)&qword_254B590F8);
    return v1;
  }
  return v3;
}

uint64_t sub_212793BC0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_212793BFC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_212788AAC(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_212793C04()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212793C40()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B590E8);
  v1 = sub_212793C8C();
  return sub_212766458(v5, v3, v4, v1);
}

unint64_t sub_212793C8C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B59100;
  if (!qword_254B59100)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B590E8);
    v1 = MEMORY[0x212BF3218](MEMORY[0x24BEE12F8], v0);
    atomic_store(v1, (unint64_t *)&qword_254B59100);
    return v1;
  }
  return v3;
}

uint64_t sub_212793CFC()
{
  return swift_deallocObject();
}

uint64_t sub_212793D24()
{
  return swift_deallocObject();
}

uint64_t sub_212793D4C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212793D88()
{
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_212793DC4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B59118;
  if (!qword_254B59118)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B59110);
    v1 = MEMORY[0x212BF3218](MEMORY[0x24BEE12E0], v0);
    atomic_store(v1, (unint64_t *)&qword_254B59118);
    return v1;
  }
  return v3;
}

unint64_t sub_212793E34()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_254B59148;
  if (!qword_254B59148)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_254B59148);
    return ObjCClassMetadata;
  }
  return v2;
}

void sub_212793E98(uint64_t a1)
{
  uint64_t v1;

  sub_21278DD38(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_212793EA0(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_21279DC24();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return a1;
}

unint64_t sub_212793F10()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B59168;
  if (!qword_254B59168)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B59160);
    v1 = MEMORY[0x212BF3218](MEMORY[0x24BEE12E0], v0);
    atomic_store(v1, (unint64_t *)&qword_254B59168);
    return v1;
  }
  return v3;
}

unint64_t sub_212793F80()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B59170;
  if (!qword_254B59170)
  {
    v0 = sub_21279DC00();
    v1 = MEMORY[0x212BF3218](MEMORY[0x24BE8FBE8], v0);
    atomic_store(v1, (unint64_t *)&qword_254B59170);
    return v1;
  }
  return v3;
}

unint64_t sub_212793FF0()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_254B59178;
  if (!qword_254B59178)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_254B59178);
    return ObjCClassMetadata;
  }
  return v2;
}

void sub_212794054(uint64_t a1)
{
  uint64_t v1;

  sub_21278DB94(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_21279405C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  double v7;
  double v8;

  *(_QWORD *)(v3 + 16) = v3;
  v7 = *(double *)(v2 + 16);
  v8 = *(double *)(v2 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v4;
  *v4 = *(_QWORD *)(v3 + 16);
  v4[1] = sub_212765728;
  return sub_21278D084(a1, a2, v7, v8);
}

unint64_t sub_2127940F0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B59190;
  if (!qword_254B59190)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B59138);
    v1 = MEMORY[0x212BF3218](MEMORY[0x24BEE12E0], v0);
    atomic_store(v1, (unint64_t *)&qword_254B59190);
    return v1;
  }
  return v3;
}

unint64_t sub_212794160()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B591A8;
  if (!qword_254B591A8)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B591A0);
    v1 = MEMORY[0x212BF3218](MEMORY[0x24BEE12E0], v0);
    atomic_store(v1, (unint64_t *)&qword_254B591A8);
    return v1;
  }
  return v3;
}

unint64_t sub_2127941D0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B591B8;
  if (!qword_254B591B8)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B591B0);
    v1 = MEMORY[0x212BF3218](MEMORY[0x24BEE1728], v0);
    atomic_store(v1, (unint64_t *)&qword_254B591B8);
    return v1;
  }
  return v3;
}

uint64_t sub_212794240()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_212794294(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = *(_QWORD *)(v1 + 32);
  v8 = *(_QWORD *)(v1 + 40);
  v9 = *(_BYTE *)(v1 + 48);
  v10 = *(double *)(v1 + 56);
  v11 = *(double *)(v1 + 64);
  v12 = *(_QWORD *)(v1 + 72);
  v13 = *(_QWORD *)(v1 + 80);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_212765728;
  return sub_21278EB44(a1, v10, v11, v5, v6, v7, v8, v9 & 1, v12, v13);
}

unint64_t sub_212794398()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B591F0;
  if (!qword_254B591F0)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B59070);
    v1 = MEMORY[0x212BF3218](MEMORY[0x24BEE12F8], v0);
    atomic_store(v1, (unint64_t *)&qword_254B591F0);
    return v1;
  }
  return v3;
}

void sub_212794408(uint64_t a1)
{
  uint64_t v1;

  sub_212790E44(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t method lookup function for SFAirDropUtilities()
{
  return swift_lookUpClassMethod();
}

unint64_t initializeBufferWithCopyOfBuffer for SFAirDropUtilities.FileLoadResult(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v16;

  v16 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v16 & 0x20000) != 0)
  {
    v11 = *a2;
    swift_retain();
    *a1 = v11;
    return *a1 + ((v16 + 16) & ~(unint64_t)v16);
  }
  else
  {
    v3 = sub_21279DC24();
    (*(void (**)(_QWORD *, _QWORD *))(*(_QWORD *)(v3 - 8) + 16))(a1, a2);
    v4 = a3[5];
    v7 = (char *)a1 + v4;
    *(_QWORD *)((char *)a1 + v4) = *(_QWORD *)((char *)a2 + v4);
    v8 = *(_QWORD *)((char *)a2 + v4 + 8);
    swift_bridgeObjectRetain();
    *((_QWORD *)v7 + 1) = v8;
    v9 = a3[6];
    v10 = *(void **)((char *)a2 + v9);
    v5 = v10;
    *(_QWORD *)((char *)a1 + v9) = v10;
    *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    return (unint64_t)a1;
  }
}

void destroy for SFAirDropUtilities.FileLoadResult(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = sub_21279DC24();
  (*(void (**)(uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1);
  swift_bridgeObjectRelease();

}

uint64_t initializeWithCopy for SFAirDropUtilities.FileLoadResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  id v5;
  uint64_t result;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = sub_21279DC24();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, a2);
  v4 = (_QWORD *)(a2 + a3[5]);
  v7 = (_QWORD *)(a1 + a3[5]);
  *v7 = *v4;
  v8 = v4[1];
  swift_bridgeObjectRetain();
  v7[1] = v8;
  v9 = a3[6];
  v10 = *(void **)(a2 + v9);
  v5 = v10;
  result = a1;
  *(_QWORD *)(a1 + v9) = v10;
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  return result;
}

uint64_t assignWithCopy for SFAirDropUtilities.FileLoadResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  id v6;
  uint64_t result;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  id v12;

  v3 = sub_21279DC24();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 24))(a1, a2);
  v4 = (_QWORD *)(a2 + a3[5]);
  v8 = (_QWORD *)(a1 + a3[5]);
  *v8 = *v4;
  v9 = v4[1];
  swift_bridgeObjectRetain();
  v8[1] = v9;
  swift_bridgeObjectRelease();
  v5 = a3[6];
  v10 = (_QWORD *)(a1 + v5);
  v12 = *(id *)(a1 + v5);
  v11 = *(void **)(a2 + v5);
  v6 = v11;
  *v10 = v11;

  result = a1;
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]) & 1;
  return result;
}

__n128 initializeWithTake for SFAirDropUtilities.FileLoadResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  __n128 result;

  v3 = sub_21279DC24();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32))(a1, a2);
  result = *(__n128 *)(a2 + a3[5]);
  *(__n128 *)(a1 + a3[5]) = result;
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  return result;
}

uint64_t assignWithTake for SFAirDropUtilities.FileLoadResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  void **v6;
  void *v7;
  uint64_t result;

  v3 = sub_21279DC24();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(a1, a2);
  v4 = (_QWORD *)(a2 + a3[5]);
  v5 = (_QWORD *)(a1 + a3[5]);
  *v5 = *v4;
  v5[1] = v4[1];
  swift_bridgeObjectRelease();
  v6 = (void **)(a1 + a3[6]);
  v7 = *v6;
  *v6 = *(void **)(a2 + a3[6]);

  result = a1;
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]) & 1;
  return result;
}

uint64_t getEnumTagSinglePayload for SFAirDropUtilities.FileLoadResult()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_212794910(uint64_t a1, unsigned int a2, uint64_t a3)
{
  int v4;
  unsigned int v5;
  uint64_t v9;
  uint64_t v10;

  v9 = sub_21279DC24();
  v10 = *(_QWORD *)(v9 - 8);
  if (a2 == *(_DWORD *)(v10 + 84))
  {
    return (*(unsigned int (**)(uint64_t, _QWORD, uint64_t))(v10 + 48))(a1, a2, v9);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    v4 = -1;
    if (*(_QWORD *)(a1 + *(int *)(a3 + 20) + 8) < 0x100000000uLL)
      v4 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
    return (v4 + 1);
  }
  else
  {
    __break(1u);
  }
  return v5;
}

uint64_t storeEnumTagSinglePayload for SFAirDropUtilities.FileLoadResult()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_212794A0C(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_21279DC24();
  v9 = *(_QWORD *)(result - 8);
  if (a3 == *(_DWORD *)(v9 + 84))
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(v9 + 56))(a1, a2, a2, result);
  if (a3 == 0x7FFFFFFF)
    *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = a2 - 1;
  else
    __break(1u);
  return result;
}

uint64_t sub_212794AC0()
{
  unint64_t v0;
  uint64_t v2;

  v2 = sub_21279DC24();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

uint64_t initializeBufferWithCopyOfBuffer for SFAirDropUtilities.FileLoadError(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  id v3;
  char v4;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_212791D7C(*(id *)a2, v4);
  result = a1;
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return result;
}

void destroy for SFAirDropUtilities.FileLoadError(uint64_t a1)
{
  sub_212791DDC(*(void **)a1, *(_BYTE *)(a1 + 8));
}

uint64_t assignWithCopy for SFAirDropUtilities.FileLoadError(uint64_t a1, uint64_t a2)
{
  void *v2;
  char v3;
  id v5;
  char v6;

  v5 = *(id *)a2;
  v6 = *(_BYTE *)(a2 + 8);
  sub_212791D7C(*(id *)a2, v6);
  v2 = *(void **)a1;
  v3 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v5;
  *(_BYTE *)(a1 + 8) = v6;
  sub_212791DDC(v2, v3);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)result = *(_QWORD *)a2;
  *(_BYTE *)(result + 8) = *(_BYTE *)(a2 + 8);
  return result;
}

uint64_t assignWithTake for SFAirDropUtilities.FileLoadError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  char v4;
  void *v5;
  char v6;

  v3 = *a2;
  v4 = *((_BYTE *)a2 + 8);
  v5 = *(void **)a1;
  v6 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  sub_212791DDC(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SFAirDropUtilities.FileLoadError(uint64_t a1, unsigned int a2)
{
  unsigned int v2;
  int v4;

  if (a2)
  {
    if (a2 > 0xFD && *(_BYTE *)(a1 + 9))
    {
      v4 = *(_QWORD *)a1 + 253;
    }
    else
    {
      v2 = 255 - *(unsigned __int8 *)(a1 + 8);
      if (v2 >= 0xFD)
        v2 = -1;
      v4 = v2;
    }
  }
  else
  {
    v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SFAirDropUtilities.FileLoadError(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;
  _BYTE *v4;

  v3 = result;
  v4 = (_BYTE *)(result + 9);
  if (a2 > 0xFD)
  {
    result = 0;
    *(_BYTE *)(v3 + 8) = 0;
    *(_QWORD *)v3 = a2 - 254;
    if (a3 >= 0xFE)
      *v4 = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *v4 = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_212794F98(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) < 2u)
    return *(unsigned __int8 *)(a1 + 8);
  else
    return *(_QWORD *)a1 + 2;
}

uint64_t sub_212794FBC(uint64_t result, unsigned int a2)
{
  if (a2 < 2)
  {
    *(_BYTE *)(result + 8) = a2;
  }
  else
  {
    *(_QWORD *)result = a2 - 2;
    *(_BYTE *)(result + 8) = 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SFAirDropUtilities.FileLoadError()
{
  return &type metadata for SFAirDropUtilities.FileLoadError;
}

unint64_t sub_212795024()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_254B59338;
  if (!qword_254B59338)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_254B59338);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_212795088()
{
  uint64_t v0;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B59330);
  v2 = *(_QWORD *)(v4 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_bridgeObjectRelease();

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v4);
  return swift_deallocObject();
}

void sub_212795120()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254B59330) - 8) + 80);
  sub_212791104(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32), v0 + ((v1 + 40) & ~v1));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t sub_2127951BC()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B59340;
  if (!qword_254B59340)
  {
    v0 = sub_21279DCA8();
    v1 = MEMORY[0x212BF3218](MEMORY[0x24BEE5468], v0);
    atomic_store(v1, (unint64_t *)&qword_254B59340);
    return v1;
  }
  return v3;
}

unint64_t sub_21279522C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B59350;
  if (!qword_254B59350)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B59348);
    v1 = MEMORY[0x212BF3218](MEMORY[0x24BEE12C8], v0);
    atomic_store(v1, (unint64_t *)&qword_254B59350);
    return v1;
  }
  return v3;
}

unint64_t sub_21279529C()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_254B59358;
  if (!qword_254B59358)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_254B59358);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_212795300()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254B59330) - 8);
  (*(void (**)(unint64_t))(v1 + 8))(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_212795398(void *a1, char a2, void *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B59330);
  sub_21279143C(a1, a2 & 1, a3);
}

uint64_t block_copy_helper_277(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_278()
{
  return swift_release();
}

unint64_t sub_21279546C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B59360;
  if (!qword_254B59360)
  {
    v0 = sub_21279DC3C();
    v1 = MEMORY[0x212BF3218](MEMORY[0x24BE8FE00], v0);
    atomic_store(v1, (unint64_t *)&qword_254B59360);
    return v1;
  }
  return v3;
}

uint64_t sub_2127954DC()
{
  return swift_deallocObject();
}

uint64_t sub_212795504()
{
  uint64_t v0;

  return nullsub_1(*(_QWORD *)(v0 + 16));
}

uint64_t sub_21279550C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_212795548()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_212795584()
{
  return swift_deallocObject();
}

uint64_t sub_2127955AC()
{
  return swift_deallocObject();
}

uint64_t sub_2127955D4@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_212795608()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212795644@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_2127955D4(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_212795650()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21279568C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = sub_2127956EC();
  return sub_2127927AC(a1, a2, a3, v8, v9, MEMORY[0x24BEE1768], v4);
}

unint64_t sub_2127956EC()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_254B59368;
  if (!qword_254B59368)
  {
    v0 = MEMORY[0x212BF3218](MEMORY[0x24BEE17C8], MEMORY[0x24BEE1768]);
    atomic_store(v0, (unint64_t *)&qword_254B59368);
    return v0;
  }
  return v2;
}

uint64_t sub_212795754()
{
  return swift_deallocObject();
}

uint64_t sub_21279577C()
{
  return swift_deallocObject();
}

uint64_t sub_2127957A4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2127957E0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21279581C()
{
  return swift_deallocObject();
}

uint64_t sub_212795844()
{
  return swift_deallocObject();
}

uint64_t sub_21279586C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2127958A8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2127958E4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212795920()
{
  return sub_2127928C8();
}

void sub_21279594C(uint64_t a1)
{
  uint64_t v1;

  sub_21278D788(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_212795954()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254B59330) - 8);
  (*(void (**)(unint64_t))(v1 + 8))(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
  return swift_deallocObject();
}

void sub_2127959C8(void *a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B59330);
  sub_21278D92C(a1, a2);
}

uint64_t block_copy_helper_346(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_347()
{
  return swift_release();
}

uint64_t sub_212795A74()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254B59330) - 8);
  (*(void (**)(unint64_t))(v1 + 8))(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
  return swift_deallocObject();
}

uint64_t block_copy_helper_352(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_353()
{
  return swift_release();
}

uint64_t sub_212795B44()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254B59370) - 8);
  (*(void (**)(unint64_t))(v1 + 8))(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
  return swift_deallocObject();
}

uint64_t sub_212795BB8(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B59370);
  return sub_21278DF28(a1);
}

uint64_t block_copy_helper_358(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_359()
{
  return swift_release();
}

unint64_t sub_212795C5C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_254B59378;
  if (!qword_254B59378)
  {
    v0 = MEMORY[0x212BF3218](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(v0, (unint64_t *)&qword_254B59378);
    return v0;
  }
  return v2;
}

uint64_t sub_212795CC4()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_212795D00()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_212795D3C()
{
  return swift_deallocObject();
}

uint64_t sub_212795D64()
{
  return swift_deallocObject();
}

uint64_t sub_212795D8C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212795DC8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212795E04()
{
  return swift_deallocObject();
}

uint64_t sub_212795E2C()
{
  return swift_deallocObject();
}

uint64_t sub_212795E54()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212795E90()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212795ECC()
{
  swift_release();
  return swift_deallocObject();
}

id sub_212795F08()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id sub_212795F2C()
{
  id v0;
  id v2;
  objc_super v3;
  id v4;

  v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for SFUIShareSheetRemoteSettingsHelperSwift();
  v2 = objc_msgSendSuper2(&v3, sel_init);
  v0 = v2;
  v4 = v2;

  return v2;
}

uint64_t type metadata accessor for SFUIShareSheetRemoteSettingsHelperSwift()
{
  return objc_opt_self();
}

uint64_t static SFUIShareSheetRemoteSettingsHelperSwift.updateHostingController(hostingController:context:hostProcessType:hostPresentationStyle:optionGroups:collaborationOptionsData:cloudShareRequest:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v30[3];
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  unint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;
  unint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;

  v32 = a1;
  v34 = a2;
  v35 = a3;
  v36 = a4;
  v37 = a5;
  v38 = a6;
  v39 = a7;
  v8 = v7;
  v9 = v32;
  v44 = v8;
  v57 = 0;
  v56 = 0;
  v55 = 0;
  v54 = 0;
  v53 = 0;
  v52 = 0;
  v51 = 0;
  v50 = 0;
  v49 = 0;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFF2D8);
  v33 = (*(_QWORD *)(*(_QWORD *)(v10 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v10);
  v47 = (uint64_t)v30 - v33;
  v48 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253CFF380);
  v46 = *(_QWORD *)(v48 - 8);
  v41 = *(_QWORD *)(v46 + 64);
  v40 = (v41 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v48);
  v42 = (char *)v30 - v40;
  v43 = (v41 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]((char *)v30 - v40);
  v45 = (char *)v30 - v43;
  v57 = (char *)v30 - v43;
  v56 = v9;
  v55 = v11;
  v54 = v12;
  v53 = v13;
  v52 = v14;
  v51 = v15;
  v50 = v16;
  v49 = v44;
  sub_21279DFA8();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v46 + 48))(v47, 1, v48) == 1)
    return sub_2127962C8(v47);
  v17 = v45;
  (*(void (**)(char *, uint64_t, uint64_t))(v46 + 32))(v45, v47, v48);
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v42, v17, v48);
  v18 = v34;
  swift_bridgeObjectRetain();
  v19 = v38;
  v20 = v39;
  v30[2] = v30;
  MEMORY[0x24BDAC7A8](v30[0]);
  v21 = v37;
  v22 = v38;
  v23 = &v30[-10];
  v30[1] = &v30[-10];
  v23[2] = v24;
  v23[3] = v25;
  v23[4] = v26;
  v23[5] = v27;
  v23[6] = v21;
  v23[7] = v22;
  v23[8] = v28;
  swift_getOpaqueTypeConformance2();
  sub_21279DAC8();
  v31 = *(void (**)(char *, uint64_t))(v46 + 8);
  v31(v42, v48);

  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v31)(v45, v48);
}

uint64_t sub_2127962C8(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253CFF380);
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return a1;
}

uint64_t sub_21279633C(int a1, id a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  id v7;
  id v8;
  id v9;

  v7 = a2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253CFF380);
  swift_getOpaqueTypeConformance2();
  sub_212799598();
  sub_2127995FC();
  sub_21279DAEC();
  sub_212765E6C();
  sub_212799668();
  sub_21279DAD4();
  sub_2127996D4();
  sub_21279DAD4();
  type metadata accessor for SHSheetOptionGroups();
  swift_bridgeObjectRetain();
  SHSheetOptionGroups.__allocating_init(groups:)(a5);
  sub_212799740();
  sub_21279DAE0();
  type metadata accessor for SHSheetCollaborationOptions();
  v8 = a6;
  SHSheetCollaborationOptions.__allocating_init(shareOptionsData:)(a6);
  sub_2127997AC();
  sub_21279DAEC();
  type metadata accessor for SHSheetCloudSharingRequest();
  v9 = a7;
  SHSheetCloudSharingRequest.__allocating_init(request:)(a7);
  sub_212799818();
  return sub_21279DAEC();
}

uint64_t sub_2127965DC()
{
  uint64_t v0;

  return sub_21279633C(*(_QWORD *)(v0 + 16), *(id *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(void **)(v0 + 56), *(void **)(v0 + 64));
}

id SHSheetOptionGroups.__allocating_init(groups:)(uint64_t a1)
{
  objc_class *v1;
  id v2;

  v2 = objc_allocWithZone(v1);
  return SHSheetOptionGroups.init(groups:)(a1);
}

id SHSheetCollaborationOptions.__allocating_init(shareOptionsData:)(void *a1)
{
  objc_class *v1;
  id v2;

  v2 = objc_allocWithZone(v1);
  return SHSheetCollaborationOptions.init(shareOptionsData:)(a1);
}

id SHSheetCloudSharingRequest.__allocating_init(request:)(void *a1)
{
  objc_class *v1;
  id v2;

  v2 = objc_allocWithZone(v1);
  return SHSheetCloudSharingRequest.init(request:)(a1);
}

id SFUIShareSheetRemoteSettingsHelperSwift.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SFUIShareSheetRemoteSettingsHelperSwift();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void *sub_21279681C()
{
  return &unk_2127A3770;
}

uint64_t static SHSheetRemoteSetting.ClientContext.defaultValue.getter()
{
  return 0;
}

uint64_t sub_212796830@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static SHSheetRemoteSetting.ClientContext.defaultValue.getter();
  *a1 = result;
  return result;
}

void *sub_212796858()
{
  return &unk_2127A3778;
}

uint64_t static SHSheetRemoteSetting.HostProcessType.defaultValue.getter()
{
  return 0;
}

uint64_t sub_21279686C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static SHSheetRemoteSetting.HostProcessType.defaultValue.getter();
  *a1 = result;
  return result;
}

void *sub_212796894()
{
  return &unk_2127A3780;
}

uint64_t static SHSheetRemoteSetting.HostPresentationStyle.defaultValue.getter()
{
  return 0;
}

uint64_t sub_2127968A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static SHSheetRemoteSetting.HostPresentationStyle.defaultValue.getter();
  *a1 = result;
  return result;
}

id sub_2127968D0()
{
  id result;

  type metadata accessor for SHSheetOptionGroups();
  result = SHSheetOptionGroups.__allocating_init(groups:)(0);
  qword_253CFF310 = (uint64_t)result;
  return result;
}

uint64_t *sub_212796910()
{
  if (qword_253CFF320 != -1)
    swift_once();
  return &qword_253CFF310;
}

void *static SHSheetRemoteSetting.OptionGroups.defaultValue.getter()
{
  id v0;
  void *v2;

  v2 = (void *)*sub_212796910();
  v0 = v2;
  return v2;
}

void *sub_212796990@<X0>(_QWORD *a1@<X8>)
{
  void *result;

  result = static SHSheetRemoteSetting.OptionGroups.defaultValue.getter();
  *a1 = result;
  return result;
}

void *sub_2127969B8()
{
  return &unk_2127A3788;
}

uint64_t static SHSheetRemoteSetting.CollaborationOptions.defaultValue.getter()
{
  return 0;
}

uint64_t sub_2127969CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static SHSheetRemoteSetting.CollaborationOptions.defaultValue.getter();
  *a1 = result;
  return result;
}

void *sub_2127969F4()
{
  return &unk_2127A3790;
}

uint64_t static SHSheetRemoteSetting.CloudShareRequest.defaultValue.getter()
{
  return 0;
}

uint64_t sub_212796A08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static SHSheetRemoteSetting.CloudShareRequest.defaultValue.getter();
  *a1 = result;
  return result;
}

void *SHSheetCollaborationOptions.shareOptionsData.getter()
{
  uint64_t v0;
  id v1;
  void *v3;

  v3 = *(void **)(v0 + OBJC_IVAR____TtC9SharingUI27SHSheetCollaborationOptions_shareOptionsData);
  v1 = v3;
  return v3;
}

id SHSheetCollaborationOptions.init(shareOptionsData:)(void *a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v7;
  char *v9;
  objc_super v11;
  void *v12;
  void *v13;
  id v14;

  v12 = 0;
  v13 = a1;
  v2 = v1;
  v14 = v1;
  v3 = a1;
  if (a1)
  {
    v12 = a1;
    v4 = a1;
    *(_QWORD *)&v9[OBJC_IVAR____TtC9SharingUI27SHSheetCollaborationOptions_shareOptionsData] = a1;

    v11.receiver = v14;
    v11.super_class = (Class)type metadata accessor for SHSheetCollaborationOptions();
    v7 = objc_msgSendSuper2(&v11, sel_init);
    v5 = v7;
    v14 = v7;

    return v7;
  }
  else
  {

    type metadata accessor for SHSheetCollaborationOptions();
    swift_deallocPartialClassInstance();
    return 0;
  }
}

void sub_212796BAC(void *a1)
{
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  void *v6;

  swift_getObjectType();
  v6 = *(void **)(v1 + OBJC_IVAR____TtC9SharingUI27SHSheetCollaborationOptions_shareOptionsData);
  v2 = v6;
  if (v6)
    v4 = v6;
  else
    v4 = 0;
  sub_21279DDB0();
  v3 = (id)sub_21279DD5C();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_encodeObject_forKey_, v4, v3);

}

id SHSheetCollaborationOptions.__allocating_init(bsxpcCoder:)(void *a1)
{
  objc_class *v1;
  id v2;

  v2 = objc_allocWithZone(v1);
  return SHSheetCollaborationOptions.init(bsxpcCoder:)(a1);
}

id SHSheetCollaborationOptions.init(bsxpcCoder:)(void *a1)
{
  void *v1;
  id v2;
  id v3;
  objc_class *v4;
  id v5;
  id v7;
  id v8;
  void *v10;
  void *v11;
  char *v12;
  uint64_t ObjCClassFromMetadata;
  id v15;
  id v16;
  char v17[32];
  void *v18;
  objc_super v19;
  void *v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  void *v26;
  id v27;

  v20 = 0;
  v26 = a1;
  v2 = v1;
  v27 = v1;
  swift_getObjectType();
  sub_212797AEC();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  sub_21279DDB0();
  v15 = (id)sub_21279DD5C();
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(a1, sel_decodeObjectOfClass_forKey_, ObjCClassFromMetadata, v15);

  if (v16)
  {
    sub_21279E014();
    sub_212797BF4((uint64_t)v17, (uint64_t)&v21);
    swift_unknownObjectRelease();
  }
  else
  {
    v21 = 0uLL;
    v22 = 0;
    v23 = 0;
  }
  sub_212797B50(&v21, &v24);
  if (v25)
  {
    if ((swift_dynamicCast() & 1) != 0)
      v10 = v18;
    else
      v10 = 0;
    v11 = v10;
  }
  else
  {
    sub_212797BB4((uint64_t)&v24);
    v11 = 0;
  }
  if (v11)
  {
    v20 = v11;
    v3 = v11;
    *(_QWORD *)&v12[OBJC_IVAR____TtC9SharingUI27SHSheetCollaborationOptions_shareOptionsData] = v11;

    v7 = v27;
    v4 = (objc_class *)type metadata accessor for SHSheetCollaborationOptions();
    v19.receiver = v7;
    v19.super_class = v4;
    v8 = objc_msgSendSuper2(&v19, sel_init);
    v5 = v8;
    v27 = v8;
    swift_unknownObjectRelease();

    return v8;
  }
  else
  {

    swift_unknownObjectRelease();
    type metadata accessor for SHSheetCollaborationOptions();
    swift_deallocPartialClassInstance();
    return 0;
  }
}

uint64_t static SHSheetCollaborationOptions.supportsBSXPCSecureCoding()()
{
  return 1;
}

id SHSheetCollaborationOptions.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t SHSheetCollaborationOptions.init()()
{
  uint64_t result;
  uint64_t v1;

  if (!"SharingUI.SHSheetCollaborationOptions")
  {
    sub_21279E0F8();
    __break(1u);
  }
  result = sub_212798594((uint64_t)"SharingUI.SHSheetCollaborationOptions", 37, (unint64_t)"init()", 6, 2, (unint64_t)"SharingUI/SFUIShareSheetRemoteSettingsHelperSwift.swift", 55, 2, v1, 0x56uLL, 0xEuLL);
  __break(1u);
  return result;
}

id SHSheetCollaborationOptions.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SHSheetCollaborationOptions();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t SHSheetOptionGroups.groups.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SharingUI19SHSheetOptionGroups_groups);
  swift_bridgeObjectRetain();
  return v2;
}

id SHSheetOptionGroups.init(groups:)(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;
  char *v5;
  id v7;
  objc_super v8;
  uint64_t v9;
  id v10;

  v9 = a1;
  v2 = v1;
  v10 = v1;
  swift_bridgeObjectRetain();
  *(_QWORD *)&v5[OBJC_IVAR____TtC9SharingUI19SHSheetOptionGroups_groups] = a1;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for SHSheetOptionGroups();
  v7 = objc_msgSendSuper2(&v8, sel_init);
  v3 = v7;
  v10 = v7;
  swift_bridgeObjectRelease();

  return v7;
}

uint64_t sub_21279731C(void *a1)
{
  uint64_t v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  swift_getObjectType();
  v8 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9SharingUI19SHSheetOptionGroups_groups);
  swift_bridgeObjectRetain();
  if (v8)
  {
    sub_212797A40();
    v5 = sub_21279DE34();
    swift_bridgeObjectRelease();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  if (v6)
    v4 = v6;
  else
    v4 = 0;
  sub_21279DDB0();
  v3 = (id)sub_21279DD5C();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_encodeCollection_forKey_, v4, v3);

  return swift_unknownObjectRelease();
}

id SHSheetOptionGroups.__allocating_init(bsxpcCoder:)(void *a1)
{
  objc_class *v1;
  id v2;

  v2 = objc_allocWithZone(v1);
  return SHSheetOptionGroups.init(bsxpcCoder:)(a1);
}

id SHSheetOptionGroups.init(bsxpcCoder:)(void *a1)
{
  void *v1;
  id v2;
  char v3;
  objc_class *v4;
  id v5;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t ObjCClassFromMetadata;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  objc_super v18;
  uint64_t v19;
  void *v20;
  id v21;

  v19 = 0;
  v20 = a1;
  v2 = v1;
  v21 = v1;
  swift_getObjectType();
  sub_212798958();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  sub_212797A40();
  v14 = swift_getObjCClassFromMetadata();
  sub_21279DDB0();
  v15 = (void *)sub_21279DD5C();
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(a1, sel_decodeCollectionOfClass_containingClass_forKey_, ObjCClassFromMetadata, v14, v15);

  if (v16)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B59400);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B59408);
    v3 = swift_dynamicCast();
    if ((v3 & 1) != 0)
      v9 = v17;
    else
      v9 = 0;
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }
  v19 = v10;
  swift_bridgeObjectRetain();
  *(_QWORD *)&v11[OBJC_IVAR____TtC9SharingUI19SHSheetOptionGroups_groups] = v10;

  swift_bridgeObjectRelease();
  v7 = v21;
  v4 = (objc_class *)type metadata accessor for SHSheetOptionGroups();
  v18.receiver = v7;
  v18.super_class = v4;
  v8 = objc_msgSendSuper2(&v18, sel_init);
  v5 = v8;
  v21 = v8;
  swift_unknownObjectRelease();

  return v8;
}

uint64_t static SHSheetOptionGroups.supportsBSXPCSecureCoding()()
{
  return 1;
}

id SHSheetOptionGroups.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t SHSheetOptionGroups.init()()
{
  uint64_t result;
  uint64_t v1;

  if (!"SharingUI.SHSheetOptionGroups")
  {
    sub_21279E0F8();
    __break(1u);
  }
  result = sub_212798594((uint64_t)"SharingUI.SHSheetOptionGroups", 29, (unint64_t)"init()", 6, 2, (unint64_t)"SharingUI/SFUIShareSheetRemoteSettingsHelperSwift.swift", 55, 2, v1, 0x72uLL, 0xEuLL);
  __break(1u);
  return result;
}

id SHSheetOptionGroups.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SHSheetOptionGroups();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void *SHSheetCloudSharingRequest.request.getter()
{
  uint64_t v0;
  id v1;
  void *v3;

  v3 = *(void **)(v0 + OBJC_IVAR____TtC9SharingUI26SHSheetCloudSharingRequest_request);
  v1 = v3;
  return v3;
}

id SHSheetCloudSharingRequest.init(request:)(void *a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;
  char *v6;
  id v8;
  objc_super v9;
  void *v10;
  id v11;

  v10 = a1;
  v2 = v1;
  v11 = v1;
  v3 = a1;
  *(_QWORD *)&v6[OBJC_IVAR____TtC9SharingUI26SHSheetCloudSharingRequest_request] = a1;

  v9.receiver = v11;
  v9.super_class = (Class)type metadata accessor for SHSheetCloudSharingRequest();
  v8 = objc_msgSendSuper2(&v9, sel_init);
  v4 = v8;
  v11 = v8;

  return v8;
}

unint64_t sub_212797A40()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_254B57CC8;
  if (!qword_254B57CC8)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_254B57CC8);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t type metadata accessor for SHSheetOptionGroups()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for SHSheetCollaborationOptions()
{
  return objc_opt_self();
}

unint64_t sub_212797AEC()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_254B57CA8;
  if (!qword_254B57CA8)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_254B57CA8);
    return ObjCClassMetadata;
  }
  return v2;
}

_OWORD *sub_212797B50(_OWORD *a1, _OWORD *a2)
{
  *a2 = *a1;
  a2[1] = a1[1];
  return a2;
}

uint64_t sub_212797BB4(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 24))
    __swift_destroy_boxed_opaque_existential_1(a1);
  return a1;
}

__n128 sub_212797BF4(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_OWORD *)a2 = *(_OWORD *)a1;
  result = *(__n128 *)(a1 + 16);
  *(__n128 *)(a2 + 16) = result;
  return result;
}

void sub_212797C10(void *a1)
{
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  void *v6;

  swift_getObjectType();
  v6 = *(void **)(v1 + OBJC_IVAR____TtC9SharingUI26SHSheetCloudSharingRequest_request);
  v2 = v6;
  if (v6)
    v4 = v6;
  else
    v4 = 0;
  sub_21279DDB0();
  v3 = (id)sub_21279DD5C();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_encodeObject_forKey_, v4, v3);

}

id SHSheetCloudSharingRequest.__allocating_init(bsxpcCoder:)(void *a1)
{
  objc_class *v1;
  id v2;

  v2 = objc_allocWithZone(v1);
  return SHSheetCloudSharingRequest.init(bsxpcCoder:)(a1);
}

id SHSheetCloudSharingRequest.init(bsxpcCoder:)(void *a1)
{
  void *v1;
  id v2;
  id v3;
  objc_class *v4;
  id v5;
  id v7;
  id v8;
  void *v9;
  id v10;
  char *v11;
  uint64_t ObjCClassFromMetadata;
  id v14;
  id v15;
  char v16[32];
  void *v17;
  objc_super v18;
  id v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  void *v25;
  id v26;

  v19 = 0;
  v25 = a1;
  v2 = v1;
  v26 = v1;
  swift_getObjectType();
  sub_2127989E0();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  sub_21279DDB0();
  v14 = (id)sub_21279DD5C();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(a1, sel_decodeObjectOfClass_forKey_, ObjCClassFromMetadata, v14);

  if (v15)
  {
    sub_21279E014();
    sub_212797BF4((uint64_t)v16, (uint64_t)&v20);
    swift_unknownObjectRelease();
  }
  else
  {
    v20 = 0uLL;
    v21 = 0;
    v22 = 0;
  }
  sub_212797B50(&v20, &v23);
  if (v24)
  {
    if ((swift_dynamicCast() & 1) != 0)
      v9 = v17;
    else
      v9 = 0;
    v10 = v9;
  }
  else
  {
    sub_212797BB4((uint64_t)&v23);
    v10 = 0;
  }
  v19 = v10;
  v3 = v10;
  *(_QWORD *)&v11[OBJC_IVAR____TtC9SharingUI26SHSheetCloudSharingRequest_request] = v10;

  v7 = v26;
  v4 = (objc_class *)type metadata accessor for SHSheetCloudSharingRequest();
  v18.receiver = v7;
  v18.super_class = v4;
  v8 = objc_msgSendSuper2(&v18, sel_init);
  v5 = v8;
  v26 = v8;
  swift_unknownObjectRelease();

  return v8;
}

uint64_t static SHSheetCloudSharingRequest.supportsBSXPCSecureCoding()()
{
  return 1;
}

id SHSheetCloudSharingRequest.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t SHSheetCloudSharingRequest.init()()
{
  uint64_t result;
  uint64_t v1;

  if (!"SharingUI.SHSheetCloudSharingRequest")
  {
    sub_21279E0F8();
    __break(1u);
  }
  result = sub_212798594((uint64_t)"SharingUI.SHSheetCloudSharingRequest", 36, (unint64_t)"init()", 6, 2, (unint64_t)"SharingUI/SFUIShareSheetRemoteSettingsHelperSwift.swift", 55, 2, v1, 0x8BuLL, 0xEuLL);
  __break(1u);
  return result;
}

id SHSheetCloudSharingRequest.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SHSheetCloudSharingRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_212798220(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_212798250(uint64_t (*a1)(uint64_t *, uint64_t), uint64_t a2, unsigned int a3)
{
  uint64_t result;
  uint64_t v4;
  unsigned int v5;
  int v6;
  int v7;
  uint64_t v8;

  if (a3 < 0x80uLL)
  {
    if (a3 > 0xFF)
      goto LABEL_12;
    v5 = (a3 + 1);
  }
  else
  {
    v7 = (a3 & 0x3F) << 8;
    if (a3 >> 6 < 0x20uLL)
    {
      v5 = (v7 | (a3 >> 6)) + 33217;
    }
    else
    {
      v6 = (v7 | (a3 >> 6) & 0x3F) << 8;
      if (a3 >> 12 < 0x10uLL)
        v5 = (v6 | (a3 >> 12)) + 8487393;
      else
        v5 = ((a3 >> 18) | ((v6 | (a3 >> 12) & 0x3F) << 8)) - 2122219023;
    }
  }
  v4 = 4 - ((uint64_t)__clz(v5) >> 3);
  v8 = (v5 - 0x101010101010101) & ((1 << ((8 * v4) & 0x3F)) - 1);
  if (v4 >= 0)
    return a1(&v8, v4);
  sub_21279E134();
  __break(1u);
LABEL_12:
  result = sub_21279E0F8();
  __break(1u);
  return result;
}

uint64_t sub_212798594@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, unint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>, unint64_t a10, unint64_t a11)
{
  unsigned int v11;
  uint64_t result;
  char v13[8];
  uint64_t v14;
  uint64_t (*v15)@<X0>(uint64_t@<X0>, uint64_t@<X1>, uint64_t@<X8>);
  char *v16;
  uint64_t v17[2];
  uint64_t *v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  int v27;
  unint64_t v28;
  unint64_t v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  char v38;
  unint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;

  v20 = a9;
  v21 = a1;
  v22 = a2;
  v23 = a3;
  v24 = a4;
  v25 = a6;
  v26 = a7;
  v27 = a8;
  v28 = a10;
  v29 = a11;
  v30 = "Fatal error";
  v31 = "Unexpectedly found nil while unwrapping an Optional value";
  v32 = "Swift/StaticString.swift";
  v33 = "Not enough bits to represent the passed value";
  v34 = "Swift/Integers.swift";
  v35 = "UnsafeBufferPointer with negative count";
  v36 = "Swift/UnsafeBufferPointer.swift";
  v37 = 0;
  v39 = a6;
  v40 = a7;
  v41 = a8;
  v42 = a1;
  v43 = a2;
  v44 = a10;
  v45 = a11;
  if ((a5 & 1) != 0)
  {
    if (v23 <= 0xFFFFFFFF)
    {
      v19 = v23;
      if ((v23 < 0xD800 || v19 > 0xDFFF) && v19 <= 0x10FFFF)
      {
        v18 = v17;
        MEMORY[0x24BDAC7A8](v17);
        v15 = sub_212798FCC;
        v16 = &v38;
        sub_212798250((uint64_t (*)(uint64_t *, uint64_t))sub_21279900C, (uint64_t)v13, v11);
        return (uint64_t)v18;
      }
      v13[0] = 2;
      v14 = 148;
      LODWORD(v15) = 0;
      sub_21279E0F8();
      __break(1u);
    }
    v13[0] = 2;
    v14 = 3455;
    LODWORD(v15) = 0;
    sub_21279E0F8();
    __break(1u);
  }
  if (v23)
    v46 = v23;
  else
    v46 = 0;
  v17[0] = v46;
  if (!v46)
  {
    v13[0] = 2;
    v14 = 136;
    LODWORD(v15) = 0;
    sub_21279E0F8();
    __break(1u);
  }
  if (v24 >= 0)
    return sub_212798C38(v17[0], v24, v25, v26, v27, v21, v22, v28, v20, v29);
  result = sub_21279E134();
  __break(1u);
  return result;
}

unint64_t sub_212798958()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_254B57CB8;
  if (!qword_254B57CB8)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_254B57CB8);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t type metadata accessor for SHSheetCloudSharingRequest()
{
  return objc_opt_self();
}

unint64_t sub_2127989E0()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_254B57C98;
  if (!qword_254B57C98)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_254B57C98);
    return ObjCClassMetadata;
  }
  return v2;
}

ValueMetadata *type metadata accessor for SHSheetRemoteSetting()
{
  return &type metadata for SHSheetRemoteSetting;
}

ValueMetadata *type metadata accessor for SHSheetRemoteSetting.ClientContext()
{
  return &type metadata for SHSheetRemoteSetting.ClientContext;
}

ValueMetadata *type metadata accessor for SHSheetRemoteSetting.HostProcessType()
{
  return &type metadata for SHSheetRemoteSetting.HostProcessType;
}

ValueMetadata *type metadata accessor for SHSheetRemoteSetting.HostPresentationStyle()
{
  return &type metadata for SHSheetRemoteSetting.HostPresentationStyle;
}

ValueMetadata *type metadata accessor for SHSheetRemoteSetting.OptionGroups()
{
  return &type metadata for SHSheetRemoteSetting.OptionGroups;
}

ValueMetadata *type metadata accessor for SHSheetRemoteSetting.CollaborationOptions()
{
  return &type metadata for SHSheetRemoteSetting.CollaborationOptions;
}

ValueMetadata *type metadata accessor for SHSheetRemoteSetting.CloudShareRequest()
{
  return &type metadata for SHSheetRemoteSetting.CloudShareRequest;
}

uint64_t method lookup function for SHSheetCollaborationOptions()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SHSheetCollaborationOptions.__allocating_init(shareOptionsData:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of SHSheetCollaborationOptions.encode(withBSXPCCoder:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x24BEE4EA0]) + 0x60))();
}

uint64_t dispatch thunk of SHSheetCollaborationOptions.__allocating_init(bsxpcCoder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t method lookup function for SHSheetOptionGroups()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SHSheetOptionGroups.__allocating_init(groups:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of SHSheetOptionGroups.encode(withBSXPCCoder:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x24BEE4EA0]) + 0x60))();
}

uint64_t dispatch thunk of SHSheetOptionGroups.__allocating_init(bsxpcCoder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t method lookup function for SHSheetCloudSharingRequest()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SHSheetCloudSharingRequest.__allocating_init(request:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of SHSheetCloudSharingRequest.encode(withBSXPCCoder:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x24BEE4EA0]) + 0x60))();
}

uint64_t dispatch thunk of SHSheetCloudSharingRequest.__allocating_init(bsxpcCoder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_212798C38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, unint64_t a8@<X7>, uint64_t a9@<X8>, unint64_t a10)
{
  unsigned int v10;
  uint64_t result;
  char v12[8];
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;

  v20 = a9;
  v21 = a1;
  v22 = a2;
  v23 = a3;
  v24 = a4;
  v25 = a6;
  v26 = a7;
  v27 = a8;
  v28 = a10;
  v29 = "Fatal error";
  v30 = "Unexpectedly found nil while unwrapping an Optional value";
  v31 = "Swift/StaticString.swift";
  v32 = "Not enough bits to represent the passed value";
  v33 = "Swift/Integers.swift";
  v34 = "UnsafeBufferPointer with negative count";
  v35 = "Swift/UnsafeBufferPointer.swift";
  v36 = 0;
  v38 = a6;
  v39 = a7;
  v40 = a1;
  v41 = a2;
  v42 = a8;
  v43 = a10;
  if ((a5 & 1) != 0)
  {
    if (v23 <= 0xFFFFFFFF)
    {
      v19 = v23;
      if ((v23 < 0xD800 || v19 > 0xDFFF) && v19 <= 0x10FFFF)
      {
        v18 = &v16;
        MEMORY[0x24BDAC7A8](&v16);
        v14 = sub_21279957C;
        v15 = &v37;
        sub_212798250((uint64_t (*)(uint64_t *, uint64_t))sub_21279900C, (uint64_t)v12, v10);
        return (uint64_t)v18;
      }
      v12[0] = 2;
      v13 = 148;
      LODWORD(v14) = 0;
      sub_21279E0F8();
      __break(1u);
    }
    v12[0] = 2;
    v13 = 3455;
    LODWORD(v14) = 0;
    sub_21279E0F8();
    __break(1u);
  }
  if (v23)
    v44 = v23;
  else
    v44 = 0;
  v17 = v44;
  if (!v44)
  {
    v12[0] = 2;
    v13 = 136;
    LODWORD(v14) = 0;
    sub_21279E0F8();
    __break(1u);
  }
  if (v24 >= 0)
    return sub_212799034(v17, v24, v25, v26, v21, v22, v27, v28);
  result = sub_21279E134();
  __break(1u);
  return result;
}

uint64_t sub_212798FCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_212798C38(a1, a2, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_BYTE *)(v3 + 32), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 48), *(_QWORD *)(v3 + 56), a3, *(_QWORD *)(v3 + 64));
}

uint64_t sub_21279900C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_212798220(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_212799034(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, unint64_t a8)
{
  uint64_t result;

  if (!a3)
  {
    sub_21279E0F8();
    __break(1u);
  }
  if (a4 >= (uint64_t)0xFFFFFFFF80000000)
  {
    if (a4 <= 0x7FFFFFFF)
    {
      if (!a5)
      {
        sub_21279E0F8();
        __break(1u);
      }
      if (a6 >= (uint64_t)0xFFFFFFFF80000000)
      {
        if (a6 <= 0x7FFFFFFF)
        {
          if (!a1)
          {
            sub_21279E0F8();
            __break(1u);
          }
          if (a2 >= (uint64_t)0xFFFFFFFF80000000)
          {
            if (a2 <= 0x7FFFFFFF)
            {
              if (a7 <= 0xFFFFFFFF)
              {
                if (a8 <= 0xFFFFFFFF)
                  return _swift_stdlib_reportUnimplementedInitializerInFile();
                sub_21279E0F8();
                __break(1u);
              }
              sub_21279E0F8();
              __break(1u);
            }
            sub_21279E0F8();
            __break(1u);
          }
          sub_21279E0F8();
          __break(1u);
        }
        sub_21279E0F8();
        __break(1u);
      }
      sub_21279E0F8();
      __break(1u);
    }
    sub_21279E0F8();
    __break(1u);
  }
  result = sub_21279E0F8();
  __break(1u);
  return result;
}

uint64_t sub_21279957C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_212799034(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56));
}

unint64_t sub_212799598()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_253CFF390;
  if (!qword_253CFF390)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_253CFF390);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t sub_2127995FC()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_253CFF338;
  if (!qword_253CFF338)
  {
    v0 = MEMORY[0x212BF3218](&protocol conformance descriptor for SHSheetRemoteSetting.ClientContext, &type metadata for SHSheetRemoteSetting.ClientContext);
    atomic_store(v0, (unint64_t *)&qword_253CFF338);
    return v0;
  }
  return v2;
}

unint64_t sub_212799668()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_253CFF370;
  if (!qword_253CFF370)
  {
    v0 = MEMORY[0x212BF3218](&protocol conformance descriptor for SHSheetRemoteSetting.HostPresentationStyle, &type metadata for SHSheetRemoteSetting.HostPresentationStyle);
    atomic_store(v0, (unint64_t *)&qword_253CFF370);
    return v0;
  }
  return v2;
}

unint64_t sub_2127996D4()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_253CFF348;
  if (!qword_253CFF348)
  {
    v0 = MEMORY[0x212BF3218](&protocol conformance descriptor for SHSheetRemoteSetting.HostProcessType, &type metadata for SHSheetRemoteSetting.HostProcessType);
    atomic_store(v0, (unint64_t *)&qword_253CFF348);
    return v0;
  }
  return v2;
}

unint64_t sub_212799740()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_253CFF330;
  if (!qword_253CFF330)
  {
    v0 = MEMORY[0x212BF3218](&protocol conformance descriptor for SHSheetRemoteSetting.OptionGroups, &type metadata for SHSheetRemoteSetting.OptionGroups);
    atomic_store(v0, (unint64_t *)&qword_253CFF330);
    return v0;
  }
  return v2;
}

unint64_t sub_2127997AC()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_253CFF368;
  if (!qword_253CFF368)
  {
    v0 = MEMORY[0x212BF3218](&protocol conformance descriptor for SHSheetRemoteSetting.CollaborationOptions, &type metadata for SHSheetRemoteSetting.CollaborationOptions);
    atomic_store(v0, (unint64_t *)&qword_253CFF368);
    return v0;
  }
  return v2;
}

unint64_t sub_212799818()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_253CFF350[0];
  if (!qword_253CFF350[0])
  {
    v0 = MEMORY[0x212BF3218](&protocol conformance descriptor for SHSheetRemoteSetting.CloudShareRequest, &type metadata for SHSheetRemoteSetting.CloudShareRequest);
    atomic_store(v0, qword_253CFF350);
    return v0;
  }
  return v2;
}

uint64_t sub_212799884()
{
  uint64_t result;

  sub_2127998D8();
  result = sub_21279DFC0();
  qword_254B59480 = result;
  return result;
}

unint64_t sub_2127998D8()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_254B59490;
  if (!qword_254B59490)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_254B59490);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t *sub_21279993C()
{
  if (qword_254B58668 != -1)
    swift_once();
  return &qword_254B59480;
}

uint64_t sub_212799990()
{
  uint64_t *v0;
  id v1;
  id v2;
  id v3;
  uint64_t result;
  uint64_t *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254B59498);
  v6 = sub_21279E1F4();
  v5 = v0;
  v9 = (void *)*MEMORY[0x24BDBA2F0];
  v1 = (id)*MEMORY[0x24BDBA2F0];
  sub_21279DD68();
  *v5 = sub_21279DD5C();
  v8 = (void *)*MEMORY[0x24BDBA2E8];
  v2 = (id)*MEMORY[0x24BDBA2E8];
  sub_21279DD68();
  v5[1] = sub_21279DD5C();
  v7 = (id)*MEMORY[0x24BDBA3E8];
  v3 = (id)*MEMORY[0x24BDBA3E8];
  sub_21279DD68();
  v5[2] = sub_21279DD5C();
  sub_212761414();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  result = v6;
  qword_254B59488 = v6;
  return result;
}

uint64_t *sub_212799AA8()
{
  if (qword_254B58670 != -1)
    swift_once();
  return &qword_254B59488;
}

id SFUIContactIconProvider.__allocating_init(diameter:layoutDirection:)(uint64_t a1, double a2)
{
  objc_class *v2;
  id v3;

  v3 = objc_allocWithZone(v2);
  return SFUIContactIconProvider.init(diameter:layoutDirection:)(a1, a2);
}

id SFUIContactIconProvider.init(diameter:layoutDirection:)(uint64_t a1, double a2)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v10;
  char *v13;
  id v14;
  objc_super v15;
  uint64_t v16;
  double v17;
  void *v18;

  v17 = a2;
  v16 = a1;
  v3 = v2;
  v4 = v2;
  v5 = v2;
  v6 = v2;
  v18 = v2;
  v10 = OBJC_IVAR____TtC9SharingUI23SFUIContactIconProvider_contactStore;
  sub_212799C88();
  *(_QWORD *)&v13[v10] = sub_21276C700();

  v7 = objc_msgSend((id)objc_opt_self(), sel_avatarImageRender);
  *(_QWORD *)&v13[OBJC_IVAR____TtC9SharingUI23SFUIContactIconProvider_avatarImageRenderer] = v7;

  *(double *)&v13[OBJC_IVAR____TtC9SharingUI23SFUIContactIconProvider_diameter] = a2;
  *(_QWORD *)&v13[OBJC_IVAR____TtC9SharingUI23SFUIContactIconProvider_layoutDirection] = a1;

  v15.receiver = v18;
  v15.super_class = (Class)type metadata accessor for SFUIContactIconProvider();
  v14 = objc_msgSendSuper2(&v15, sel_init);
  v8 = v14;
  v18 = v14;

  return v14;
}

unint64_t sub_212799C88()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_254B594A8;
  if (!qword_254B594A8)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_254B594A8);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t type metadata accessor for SFUIContactIconProvider()
{
  return objc_opt_self();
}

uint64_t sub_212799D10()
{
  uint64_t v0;
  _QWORD *v1;

  v1[6] = v0;
  v1[2] = v1;
  v1[3] = 0;
  v1[4] = 0;
  v1[5] = 0;
  v1[3] = v0;
  return swift_task_switch();
}

uint64_t sub_212799D4C()
{
  uint64_t v0;
  id v1;
  id v2;
  _QWORD *v4;
  id v5;
  _QWORD *v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = *(id *)(v0 + 48);
  *(_QWORD *)(v0 + 16) = v0;
  v1 = v7;
  v9 = objc_msgSend(v7, sel_imageCache);

  v8 = (id)*sub_21279993C();
  v2 = v8;
  v10 = objc_msgSend(v9, sel_objectForKey_, v8);

  if (v10)
  {
    v6[5] = v10;
    return (*(uint64_t (**)(void))(v6[2] + 8))();
  }
  else
  {
    sub_21279A090();
    v5 = sub_21276C700();
    v6[7] = v5;
    v4 = (_QWORD *)swift_task_alloc();
    v6[8] = v4;
    *v4 = v6[2];
    v4[1] = sub_212799EAC;
    return sub_21279AE7C((uint64_t)v5);
  }
}

uint64_t sub_212799EAC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v5;

  v3 = (_QWORD *)*v2;
  v3[2] = *v2;
  v5 = v3 + 2;
  v3[9] = a1;
  v3[10] = v1;
  swift_task_dealloc();
  if (!v1)

  return swift_task_switch();
}

uint64_t sub_212799F6C()
{
  _QWORD *v0;
  id v1;
  id v2;
  id v4;
  uint64_t v5;
  id v6;
  id v7;

  v5 = v0[9];
  v4 = (id)v0[6];
  v0[2] = v0;
  v0[4] = v5;
  v1 = v4;
  v7 = objc_msgSend(v4, sel_imageCache);

  v6 = (id)*sub_21279993C();
  v2 = v6;
  objc_msgSend(v7, sel_setObject_forKey_, v5, v6);

  return (*(uint64_t (**)(_QWORD))(v0[2] + 8))(v0[9]);
}

uint64_t sub_21279A038()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 56);
  *(_QWORD *)(v0 + 16) = v0;

  return (*(uint64_t (**)())(*(_QWORD *)(v0 + 16) + 8))();
}

unint64_t sub_21279A090()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_254B594D0;
  if (!qword_254B594D0)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_254B594D0);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_21279A0F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[24] = v2;
  v3[23] = a2;
  v3[22] = a1;
  v3[14] = v3;
  v3[8] = 0;
  v3[9] = 0;
  v3[15] = 0;
  v3[16] = 0;
  v3[19] = 0;
  v3[20] = 0;
  v3[21] = 0;
  v3[8] = a1;
  v3[9] = a2;
  v3[15] = v2;
  return swift_task_switch();
}

uint64_t sub_21279A1B8()
{
  uint64_t v0;
  id v1;
  uint64_t result;
  _QWORD *v3;
  id v4;
  id v5;
  id v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  unsigned __int8 v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id v38;

  v35 = *(void **)(v0 + 192);
  *(_QWORD *)(v0 + 112) = v0;
  v1 = v35;
  v37 = objc_msgSend(v35, sel_imageCache);

  swift_bridgeObjectRetain();
  v36 = (void *)sub_21279DD5C();
  v38 = objc_msgSend(v37, sel_objectForKey_);

  swift_bridgeObjectRelease();
  if (v38)
  {
    *(_QWORD *)(v34 + 168) = v38;
    sub_21276A07C(0);
    sub_21276A07C(0);
    return (*(uint64_t (**)(id))(*(_QWORD *)(v34 + 112) + 8))(v38);
  }
  v26 = *(_QWORD *)(v34 + 192);
  v22 = *(_QWORD *)(v34 + 184);
  v20 = *(_QWORD *)(v34 + 176);
  sub_21279B68C();
  sub_212799AA8();
  swift_bridgeObjectRetain();
  v30 = sub_21279AD68();
  *(_QWORD *)(v34 + 200) = v30;
  *(_QWORD *)(v34 + 128) = v30;
  v23 = (id)objc_opt_self();
  sub_21279E1F4();
  v21 = v3;
  swift_bridgeObjectRetain();
  *v21 = v20;
  v21[1] = v22;
  sub_212761414();
  v24 = (id)sub_21279DE34();
  swift_bridgeObjectRelease();
  v25 = objc_msgSend(v23, sel_predicateForContactsWithIdentifiers_, v24);

  objc_msgSend(v30, sel_setPredicate_, v25);
  *(_QWORD *)(v34 + 136) = 0;
  v29 = *(void **)(v26 + OBJC_IVAR____TtC9SharingUI23SFUIContactIconProvider_contactStore);
  v4 = v29;
  v27 = swift_allocObject();
  *(_QWORD *)(v34 + 208) = v27;
  *(_QWORD *)(v27 + 16) = v34 + 136;
  v28 = swift_allocObject();
  *(_QWORD *)(v28 + 16) = sub_21279B718;
  *(_QWORD *)(v28 + 24) = v27;
  swift_retain();
  *(_QWORD *)(v34 + 48) = sub_21279B748;
  *(_QWORD *)(v34 + 56) = v28;
  *(_QWORD *)(v34 + 16) = MEMORY[0x24BDAC760];
  *(_DWORD *)(v34 + 24) = 1107296256;
  *(_DWORD *)(v34 + 28) = 0;
  *(_QWORD *)(v34 + 32) = sub_21279AE24;
  *(_QWORD *)(v34 + 40) = &block_descriptor_1;
  v33 = _Block_copy((const void *)(v34 + 16));
  swift_release();
  *(_QWORD *)(v34 + 144) = 0;
  v31 = objc_msgSend(v29, sel_enumerateContactsWithFetchRequest_error_usingBlock_, v30, v34 + 144, v33);
  v32 = *(void **)(v34 + 144);
  v5 = v32;

  _Block_release(v33);
  result = swift_isEscapingClosureAtFileLocation();
  if ((result & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    sub_21276A07C((uint64_t)sub_21279B748);

    if ((v31 & 1) != 0)
    {
      v19 = *(void **)(v34 + 136);
      *(_QWORD *)(v34 + 216) = v19;
      v6 = v19;
      if (v19)
      {
        *(_QWORD *)(v34 + 152) = v19;
        v18 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v34 + 224) = v18;
        *v18 = *(_QWORD *)(v34 + 112);
        v18[1] = sub_21279A9D0;
        return sub_21279AE7C((uint64_t)v19);
      }
      v13 = *(_QWORD *)(v34 + 184);
      v12 = *(_QWORD *)(v34 + 176);
      v16 = sub_21279DC3C();
      sub_21279546C();
      swift_allocError();
      v17 = v7;
      *(_QWORD *)(v34 + 80) = sub_21279E1E8();
      *(_QWORD *)(v34 + 88) = v8;
      sub_21279DDB0();
      sub_21279E1DC();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v34 + 96) = v12;
      *(_QWORD *)(v34 + 104) = v13;
      sub_21279E1D0();
      sub_21279DDB0();
      sub_21279E1DC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_2127677B0();
      v14 = sub_21279DDA4();
      v15 = v9;
      v10 = sub_21279DDB0();
      *v17 = v14;
      v17[1] = v15;
      v17[2] = v10;
      v17[3] = v11;
      v17[4] = 62;
      (*(void (**)(void))(*(_QWORD *)(v16 - 8) + 104))();
      swift_willThrow();
      sub_21276ED58((id *)(v34 + 136));

    }
    else
    {
      sub_21279D8C4();

      swift_willThrow();
      sub_21276ED58((id *)(v34 + 136));

    }
    sub_21276A07C((uint64_t)sub_21279B718);
    return (*(uint64_t (**)())(*(_QWORD *)(v34 + 112) + 8))();
  }
  return result;
}

uint64_t sub_21279A9D0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[14] = *v2;
  v3[29] = a1;
  v3[30] = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21279AAD8()
{
  uint64_t v0;
  id v1;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  v4 = *(_QWORD *)(v0 + 232);
  v7 = *(id *)(v0 + 216);
  v8 = *(id *)(v0 + 200);
  v3 = *(id *)(v0 + 192);
  *(_QWORD *)(v0 + 112) = v0;
  *(_QWORD *)(v0 + 160) = v4;
  v1 = v3;
  v6 = objc_msgSend(v3, sel_imageCache);

  swift_bridgeObjectRetain();
  v5 = (id)sub_21279DD5C();
  objc_msgSend(v6, sel_setObject_forKey_, v4);

  swift_bridgeObjectRelease();
  sub_21276ED58((id *)(v0 + 136));

  v9 = *(_QWORD *)(v0 + 232);
  sub_21276A07C((uint64_t)sub_21279B718);
  sub_21276A07C(0);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v0 + 112) + 8))(v9);
}

uint64_t sub_21279AC78()
{
  uint64_t v0;
  void *v1;
  id v3;

  v1 = *(void **)(v0 + 216);
  v3 = *(id *)(v0 + 200);
  *(_QWORD *)(v0 + 112) = v0;

  sub_21276ED58((id *)(v0 + 136));
  sub_21276A07C((uint64_t)sub_21279B718);
  return (*(uint64_t (**)())(*(_QWORD *)(v0 + 112) + 8))();
}

id sub_21279AD68()
{
  id v0;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_21279BAE0();
}

void sub_21279ADA4(void *a1, _BYTE *a2, void **a3)
{
  id v3;
  void *v4;

  v3 = a1;
  v4 = *a3;
  *a3 = a1;

  *a2 = 1;
}

uint64_t sub_21279AE04(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

void sub_21279AE24(uint64_t a1, id a2, uint64_t a3)
{
  id v3;
  void (*v5)(id, uint64_t);

  v5 = *(void (**)(id, uint64_t))(a1 + 32);
  v3 = a2;
  v5(a2, a3);

}

uint64_t sub_21279AE7C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 144) = v1;
  *(_QWORD *)(v2 + 136) = a1;
  *(_QWORD *)(v2 + 48) = v2;
  *(_QWORD *)(v2 + 56) = 0;
  *(_QWORD *)(v2 + 64) = 0;
  *(_QWORD *)(v2 + 72) = 0;
  *(_BYTE *)(v2 + 200) = 0;
  *(_QWORD *)(v2 + 112) = 0;
  *(_QWORD *)(v2 + 120) = 0;
  *(_QWORD *)(v2 + 128) = 0;
  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = v1;
  return swift_task_switch();
}

uint64_t sub_21279AED8()
{
  _QWORD *v0;

  v0[6] = v0;
  v0[19] = objc_opt_self();
  v0[20] = sub_21279DEB8();
  v0[21] = sub_21279DEAC();
  sub_21279DE88();
  return swift_task_switch();
}

uint64_t sub_21279AF64()
{
  _QWORD *v0;
  void *v1;

  v1 = (void *)v0[19];
  v0[6] = v0;
  v0[22] = objc_msgSend(v1, sel_mainScreen);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_21279AFD4()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 48) = v0;
  *(_QWORD *)(v0 + 184) = sub_21279DEAC();
  sub_21279DE88();
  return swift_task_switch();
}

uint64_t sub_21279B040()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;

  v1 = (void *)v0[22];
  v0[6] = v0;
  objc_msgSend(v1, sel_scale);
  v0[24] = v2;
  swift_release();
  return swift_task_switch();
}

uint64_t sub_21279B0A4()
{
  uint64_t v0;
  void *v1;
  id v2;
  _QWORD *v3;
  id v4;
  id v5;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  _QWORD *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  char v29;

  v28 = *(double *)(v0 + 192);
  v1 = *(void **)(v0 + 176);
  v27 = *(_QWORD *)(v0 + 144);
  *(_QWORD *)(v0 + 48) = v0;
  *(double *)(v0 + 72) = v28;

  *(_QWORD *)(v0 + 80) = *(_QWORD *)(v27 + OBJC_IVAR____TtC9SharingUI23SFUIContactIconProvider_layoutDirection);
  *(_QWORD *)(v0 + 88) = 1;
  type metadata accessor for SFUIUserInterfaceLayoutDirection();
  sub_21279B7B0();
  v29 = sub_21279E200();
  *(_BYTE *)(v0 + 200) = v29 & 1;
  sub_21279B820();
  *(_QWORD *)(v0 + 104) = sub_21279B884(v29 & 1, 1, 0, *(double *)(v27 + OBJC_IVAR____TtC9SharingUI23SFUIContactIconProvider_diameter), *(double *)(v27 + OBJC_IVAR____TtC9SharingUI23SFUIContactIconProvider_diameter), v28);
  sub_21279DDB0();
  sub_21279DDB0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B59508);
  sub_21279DFF0();
  v19 = *(_QWORD *)(v26 + 144);
  v21 = *(id *)(v26 + 136);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21276ED58((id *)(v26 + 104));
  v22 = *(void **)(v26 + 96);
  *(_QWORD *)(v26 + 112) = v22;
  v24 = *(void **)(v19 + OBJC_IVAR____TtC9SharingUI23SFUIContactIconProvider_avatarImageRenderer);
  v2 = v24;
  sub_21279A090();
  sub_21279E1F4();
  v20 = v3;
  v4 = v21;
  *v20 = v21;
  sub_212761414();
  v23 = (void *)sub_21279DE34();
  swift_bridgeObjectRelease();
  v25 = objc_msgSend(v24, sel_avatarImageForContacts_scope_, v23, v22);

  *(_QWORD *)(v26 + 120) = v25;
  v5 = v25;
  if (v25)
  {
    *(_QWORD *)(v26 + 128) = v25;

    return (*(uint64_t (**)(id))(*(_QWORD *)(v26 + 48) + 8))(v25);
  }
  else
  {
    v13 = *(id *)(v26 + 136);
    v17 = sub_21279DC3C();
    sub_21279546C();
    swift_allocError();
    v18 = v7;
    *(_QWORD *)(v26 + 16) = sub_21279E1E8();
    *(_QWORD *)(v26 + 24) = v8;
    sub_21279DDB0();
    sub_21279E1DC();
    swift_bridgeObjectRelease();
    v14 = objc_msgSend(v13, sel_identifier);
    *(_QWORD *)(v26 + 32) = sub_21279DD68();
    *(_QWORD *)(v26 + 40) = v9;
    sub_21279E1D0();
    sub_2127677B0();

    sub_21279DDB0();
    sub_21279E1DC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2127677B0();
    v15 = sub_21279DDA4();
    v16 = v10;
    v11 = sub_21279DDB0();
    *v18 = v15;
    v18[1] = v16;
    v18[2] = v11;
    v18[3] = v12;
    v18[4] = 81;
    (*(void (**)(void))(*(_QWORD *)(v17 - 8) + 104))();
    swift_willThrow();

    return (*(uint64_t (**)())(*(_QWORD *)(v26 + 48) + 8))();
  }
}

unint64_t sub_21279B68C()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_254B594E8;
  if (!qword_254B594E8)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_254B594E8);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_21279B6F0()
{
  return swift_deallocObject();
}

void sub_21279B718(void *a1, _BYTE *a2)
{
  uint64_t v2;

  sub_21279ADA4(a1, a2, *(void ***)(v2 + 16));
}

uint64_t sub_21279B720()
{
  return swift_deallocObject();
}

uint64_t sub_21279B748(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_21279AE04(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

unint64_t sub_21279B7B0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_254B594F8;
  if (!qword_254B594F8)
  {
    v0 = type metadata accessor for SFUIUserInterfaceLayoutDirection();
    v1 = MEMORY[0x212BF3218](&unk_2127A32F4, v0);
    atomic_store(v1, (unint64_t *)&qword_254B594F8);
    return v1;
  }
  return v3;
}

unint64_t sub_21279B820()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_254B59500;
  if (!qword_254B59500)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_254B59500);
    return ObjCClassMetadata;
  }
  return v2;
}

id sub_21279B884(char a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6)
{
  return objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_scopeWithPointSize_scale_rightToLeft_style_backgroundStyle_, a1 & 1, a2, a3, a4, a5, a6);
}

id SFUIContactIconProvider.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t SFUIContactIconProvider.init()()
{
  uint64_t result;
  uint64_t v1;

  if (!"SharingUI.SFUIContactIconProvider")
  {
    sub_21279E0F8();
    __break(1u);
  }
  result = sub_212798594((uint64_t)"SharingUI.SFUIContactIconProvider", 33, (unint64_t)"init()", 6, 2, (unint64_t)"SharingUI/SFUIContactIconProvider.swift", 39, 2, v1, 0x16uLL, 0xEuLL);
  __break(1u);
  return result;
}

id SFUIContactIconProvider.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SFUIContactIconProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_21279BAE0()
{
  id v1;
  id v2;
  id v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254B59498);
  v2 = (id)sub_21279DE34();
  v3 = objc_msgSend(v1, sel_initWithKeysToFetch_);

  swift_bridgeObjectRelease();
  return v3;
}

uint64_t method lookup function for SFUIContactIconProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SFUIContactIconProvider.__allocating_init(diameter:layoutDirection:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of SFUIContactIconProvider.contactIconFallBack()()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  *(_QWORD *)(v1 + 16) = v1;
  v4 = (uint64_t (*)(void))(*(_QWORD *)((*v0 & *MEMORY[0x24BEE4EA0]) + 0x78)
                         + **(int **)((*v0 & *MEMORY[0x24BEE4EA0]) + 0x78));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = sub_21279BC10;
  return v4();
}

uint64_t sub_21279BC10(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(*v1 + 16) = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 16) + 8))(a1);
}

uint64_t dispatch thunk of SFUIContactIconProvider.icon(for:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v7)(uint64_t, uint64_t);

  *(_QWORD *)(v3 + 16) = v3;
  v7 = (uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)((*v2 & *MEMORY[0x24BEE4EA0]) + 0x80)
                                                + **(int **)((*v2 & *MEMORY[0x24BEE4EA0]) + 0x80));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v4;
  *v4 = *(_QWORD *)(v3 + 16);
  v4[1] = sub_21279BC10;
  return v7(a1, a2);
}

uint64_t sub_21279BD18()
{
  sub_212790108();
  return swift_deallocClassInstance();
}

id sub_21279BD54()
{
  id result;

  sub_21279BE54();
  type metadata accessor for ResourceBundleClass();
  result = sub_21279BD98();
  qword_254B59550 = (uint64_t)result;
  return result;
}

id sub_21279BD98()
{
  uint64_t ObjCClassFromMetadata;

  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  return objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleForClass_, ObjCClassFromMetadata);
}

uint64_t *sub_21279BDDC()
{
  if (qword_254B58678 != -1)
    swift_once();
  return &qword_254B59550;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

unint64_t sub_21279BE54()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_254B595F0;
  if (!qword_254B595F0)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_254B595F0);
    return ObjCClassMetadata;
  }
  return v2;
}

void __getPLPhotoLibraryClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *PhotoLibraryServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SFAirDropActivityViewController.m"), 29, CFSTR("%s"), *a1);

  __break(1u);
}

void __getPLPhotoLibraryClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPLPhotoLibraryClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SFAirDropActivityViewController.m"), 30, CFSTR("Unable to find class %s"), "PLPhotoLibrary");

  __break(1u);
}

void IntentsLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *IntentsLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SFUIPeopleSoftLinking.m"), 11, CFSTR("%s"), *a1);

  __break(1u);
}

void __getINImageClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getINImageClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SFUIPeopleSoftLinking.m"), 12, CFSTR("Unable to find class %s"), "INImage");

  __break(1u);
}

void __getINImageServiceConnectionClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getINImageServiceConnectionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SFUIPeopleSoftLinking.m"), 13, CFSTR("Unable to find class %s"), "INImageServiceConnection");

  __break(1u);
}

void getINImageDefaultScaledSize_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "typeof (((typeof (INImageDefaultScaledSize) (*)(void))0)()) getINImageDefaultScaledSize(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SFUIPeopleSoftLinking.m"), 14, CFSTR("%s"), dlerror());

  __break(1u);
}

void ContactsUILibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ContactsUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SFUIPeopleSoftLinking.m"), 25, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCNAvatarImageRendererClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCNAvatarImageRendererClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SFUIPeopleSoftLinking.m"), 26, CFSTR("Unable to find class %s"), "CNAvatarImageRenderer");

  __break(1u);
}

void __getCNAvatarImageRenderingScopeClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCNAvatarImageRenderingScopeClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SFUIPeopleSoftLinking.m"), 27, CFSTR("Unable to find class %s"), "CNAvatarImageRenderingScope");

  __break(1u);
}

void __getCNAvatarImageRendererSettingsClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCNAvatarImageRendererSettingsClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SFUIPeopleSoftLinking.m"), 30, CFSTR("Unable to find class %s"), "CNAvatarImageRendererSettings");

  __break(1u);
  sub_21279D894();
}

uint64_t sub_21279D894()
{
  return MEMORY[0x24BDCB958]();
}

uint64_t sub_21279D8A0()
{
  return MEMORY[0x24BDCB988]();
}

uint64_t sub_21279D8AC()
{
  return MEMORY[0x24BEE6118]();
}

uint64_t sub_21279D8B8()
{
  return MEMORY[0x24BDCC818]();
}

uint64_t sub_21279D8C4()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_21279D8D0()
{
  return MEMORY[0x24BDCD748]();
}

uint64_t sub_21279D8DC()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_21279D8E8()
{
  return MEMORY[0x24BDCD810]();
}

uint64_t sub_21279D8F4()
{
  return MEMORY[0x24BDCD848]();
}

uint64_t sub_21279D900()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_21279D90C()
{
  return MEMORY[0x24BDCD888]();
}

uint64_t sub_21279D918()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_21279D924()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_21279D930()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_21279D93C()
{
  return MEMORY[0x24BDCD938]();
}

uint64_t sub_21279D948()
{
  return MEMORY[0x24BDCD968]();
}

uint64_t sub_21279D954()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_21279D960()
{
  return MEMORY[0x24BDCDA48]();
}

uint64_t sub_21279D96C()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_21279D978()
{
  return MEMORY[0x24BDCDAA8]();
}

uint64_t sub_21279D984()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_21279D990()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_21279D99C()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_21279D9A8()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_21279D9B4()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_21279D9C0()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_21279D9CC()
{
  return MEMORY[0x24BEE5B78]();
}

uint64_t sub_21279D9D8()
{
  return MEMORY[0x24BEE6190]();
}

uint64_t sub_21279D9E4()
{
  return MEMORY[0x24BEE61C0]();
}

uint64_t sub_21279D9F0()
{
  return MEMORY[0x24BEE6238]();
}

uint64_t sub_21279D9FC()
{
  return MEMORY[0x24BEE6250]();
}

uint64_t sub_21279DA08()
{
  return MEMORY[0x24BEE6280]();
}

uint64_t sub_21279DA14()
{
  return MEMORY[0x24BEE6290]();
}

uint64_t sub_21279DA20()
{
  return MEMORY[0x24BEE62A8]();
}

uint64_t sub_21279DA2C()
{
  return MEMORY[0x24BEE62D8]();
}

uint64_t sub_21279DA38()
{
  return MEMORY[0x24BEE6310]();
}

uint64_t sub_21279DA44()
{
  return MEMORY[0x24BEE6318]();
}

uint64_t sub_21279DA50()
{
  return MEMORY[0x24BEE6368]();
}

uint64_t sub_21279DA5C()
{
  return MEMORY[0x24BEE6390]();
}

uint64_t sub_21279DA68()
{
  return MEMORY[0x24BEE63A8]();
}

uint64_t sub_21279DA74()
{
  return MEMORY[0x24BEE63B0]();
}

uint64_t sub_21279DA80()
{
  return MEMORY[0x24BEE63B8]();
}

uint64_t sub_21279DA8C()
{
  return MEMORY[0x24BEE6410]();
}

uint64_t sub_21279DA98()
{
  return MEMORY[0x24BE8F770]();
}

uint64_t sub_21279DAA4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21279DAB0()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_21279DABC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21279DAC8()
{
  return MEMORY[0x24BEBC7F0]();
}

uint64_t sub_21279DAD4()
{
  return MEMORY[0x24BEBC7F8]();
}

uint64_t sub_21279DAE0()
{
  return MEMORY[0x24BEBC800]();
}

uint64_t sub_21279DAEC()
{
  return MEMORY[0x24BEBC818]();
}

uint64_t sub_21279DAF8()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_21279DB04()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_21279DB10()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_21279DB1C()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t sub_21279DB28()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t sub_21279DB34()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_21279DB40()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_21279DB4C()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_21279DB58()
{
  return MEMORY[0x24BE8F7D0]();
}

uint64_t sub_21279DB64()
{
  return MEMORY[0x24BE8F7D8]();
}

uint64_t sub_21279DB70()
{
  return MEMORY[0x24BE8F7F0]();
}

uint64_t sub_21279DB7C()
{
  return MEMORY[0x24BE8F7F8]();
}

uint64_t sub_21279DB88()
{
  return MEMORY[0x24BE8F810]();
}

uint64_t sub_21279DB94()
{
  return MEMORY[0x24BE8F828]();
}

uint64_t sub_21279DBA0()
{
  return MEMORY[0x24BE8FB38]();
}

uint64_t sub_21279DBAC()
{
  return MEMORY[0x24BE8FB40]();
}

uint64_t sub_21279DBB8()
{
  return MEMORY[0x24BE8FB50]();
}

uint64_t sub_21279DBC4()
{
  return MEMORY[0x24BE8FB58]();
}

uint64_t sub_21279DBD0()
{
  return MEMORY[0x24BE8FB60]();
}

uint64_t sub_21279DBDC()
{
  return MEMORY[0x24BE8FB68]();
}

uint64_t sub_21279DBE8()
{
  return MEMORY[0x24BE8FB90]();
}

uint64_t sub_21279DBF4()
{
  return MEMORY[0x24BE8FB98]();
}

uint64_t sub_21279DC00()
{
  return MEMORY[0x24BE8FBD8]();
}

uint64_t sub_21279DC0C()
{
  return MEMORY[0x24BE8FD00]();
}

uint64_t sub_21279DC18()
{
  return MEMORY[0x24BE8FD10]();
}

uint64_t sub_21279DC24()
{
  return MEMORY[0x24BE8FD18]();
}

uint64_t sub_21279DC30()
{
  return MEMORY[0x24BE8FD28]();
}

uint64_t sub_21279DC3C()
{
  return MEMORY[0x24BE8FDF0]();
}

uint64_t sub_21279DC48()
{
  return MEMORY[0x24BE8FE10]();
}

uint64_t sub_21279DC54()
{
  return MEMORY[0x24BE8FE18]();
}

uint64_t sub_21279DC60()
{
  return MEMORY[0x24BE8FE20]();
}

uint64_t sub_21279DC6C()
{
  return MEMORY[0x24BE8FE28]();
}

uint64_t sub_21279DC78()
{
  return MEMORY[0x24BE8FE30]();
}

uint64_t sub_21279DC84()
{
  return MEMORY[0x24BE8FE58]();
}

uint64_t sub_21279DC90()
{
  return MEMORY[0x24BE8FE60]();
}

uint64_t sub_21279DC9C()
{
  return MEMORY[0x24BE8FF18]();
}

uint64_t sub_21279DCA8()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_21279DCB4()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_21279DCC0()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_21279DCCC()
{
  return MEMORY[0x24BEE01B8]();
}

uint64_t sub_21279DCD8()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_21279DCE4()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_21279DCF0()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_21279DCFC()
{
  return MEMORY[0x24BEE03E0]();
}

uint64_t sub_21279DD08()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_21279DD14()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_21279DD20()
{
  return MEMORY[0x24BEE0630]();
}

uint64_t sub_21279DD2C()
{
  return MEMORY[0x24BEE0780]();
}

uint64_t sub_21279DD38()
{
  return MEMORY[0x24BEE07F8]();
}

uint64_t sub_21279DD44()
{
  return MEMORY[0x24BEE0928]();
}

uint64_t sub_21279DD50()
{
  return MEMORY[0x24BEE0950]();
}

uint64_t sub_21279DD5C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21279DD68()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21279DD74()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_21279DD80()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_21279DD8C()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_21279DD98()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_21279DDA4()
{
  return MEMORY[0x24BEE0AE0]();
}

uint64_t sub_21279DDB0()
{
  return MEMORY[0x24BEE0AF8]();
}

uint64_t sub_21279DDBC()
{
  return MEMORY[0x24BEE0B08]();
}

uint64_t sub_21279DDC8()
{
  return MEMORY[0x24BEE0BF8]();
}

uint64_t sub_21279DDD4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21279DDE0()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_21279DDEC()
{
  return MEMORY[0x24BEE0E48]();
}

uint64_t sub_21279DDF8()
{
  return MEMORY[0x24BEE0E98]();
}

uint64_t sub_21279DE04()
{
  return MEMORY[0x24BEE0ED0]();
}

uint64_t sub_21279DE10()
{
  return MEMORY[0x24BEE0EE0]();
}

uint64_t sub_21279DE1C()
{
  return MEMORY[0x24BEE0F30]();
}

uint64_t sub_21279DE28()
{
  return MEMORY[0x24BEE0F48]();
}

uint64_t sub_21279DE34()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_21279DE40()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_21279DE4C()
{
  return MEMORY[0x24BEE1170]();
}

uint64_t sub_21279DE58()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_21279DE64()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_21279DE70()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_21279DE7C()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_21279DE88()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_21279DE94()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_21279DEA0()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_21279DEAC()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_21279DEB8()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_21279DEC4()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_21279DED0()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_21279DEDC()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_21279DEE8()
{
  return MEMORY[0x24BEE6B20]();
}

uint64_t sub_21279DEF4()
{
  return MEMORY[0x24BEE6B38]();
}

uint64_t sub_21279DF00()
{
  return MEMORY[0x24BEE16F8]();
}

uint64_t sub_21279DF0C()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_21279DF18()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_21279DF24()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_21279DF30()
{
  return MEMORY[0x24BEE1980]();
}

uint64_t sub_21279DF3C()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_21279DF48()
{
  return MEMORY[0x24BEE1A10]();
}

uint64_t sub_21279DF54()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_21279DF60()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_21279DF6C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21279DF78()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_21279DF84()
{
  return MEMORY[0x24BDCFFB0]();
}

uint64_t sub_21279DF90()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_21279DF9C()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_21279DFA8()
{
  return MEMORY[0x24BEBCDE0]();
}

uint64_t sub_21279DFB4()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_21279DFC0()
{
  return MEMORY[0x24BDD0248]();
}

uint64_t sub_21279DFCC()
{
  return MEMORY[0x24BEE1BE0]();
}

uint64_t sub_21279DFD8()
{
  return MEMORY[0x24BEE1C00]();
}

uint64_t sub_21279DFE4()
{
  return MEMORY[0x24BEE1C20]();
}

uint64_t sub_21279DFF0()
{
  return MEMORY[0x24BE90098]();
}

uint64_t sub_21279DFFC()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21279E008()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21279E014()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_21279E020()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21279E02C()
{
  return MEMORY[0x24BEE2378]();
}

uint64_t sub_21279E038()
{
  return MEMORY[0x24BEE2380]();
}

uint64_t sub_21279E044()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21279E050()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21279E05C()
{
  return MEMORY[0x24BEE28C0]();
}

uint64_t sub_21279E068()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_21279E074()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_21279E080()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_21279E08C()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_21279E098()
{
  return MEMORY[0x24BEE6DB0]();
}

uint64_t sub_21279E0A4()
{
  return MEMORY[0x24BEE6DB8]();
}

uint64_t sub_21279E0B0()
{
  return MEMORY[0x24BEE6DC0]();
}

uint64_t sub_21279E0BC()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_21279E0C8()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_21279E0D4()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_21279E0E0()
{
  return MEMORY[0x24BEE2BF8]();
}

uint64_t sub_21279E0EC()
{
  return MEMORY[0x24BEE2D18]();
}

uint64_t sub_21279E0F8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21279E104()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_21279E110()
{
  return MEMORY[0x24BEE2F60]();
}

uint64_t sub_21279E11C()
{
  return MEMORY[0x24BEE2F90]();
}

uint64_t sub_21279E128()
{
  return MEMORY[0x24BEE2F98]();
}

uint64_t sub_21279E134()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21279E140()
{
  return MEMORY[0x24BEE31C0]();
}

uint64_t sub_21279E14C()
{
  return MEMORY[0x24BEE31C8]();
}

uint64_t sub_21279E158()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_21279E164()
{
  return MEMORY[0x24BEE31D8]();
}

uint64_t sub_21279E170()
{
  return MEMORY[0x24BEE31E0]();
}

uint64_t sub_21279E17C()
{
  return MEMORY[0x24BEE31E8]();
}

uint64_t sub_21279E188()
{
  return MEMORY[0x24BEE31F0]();
}

uint64_t sub_21279E194()
{
  return MEMORY[0x24BEE31F8]();
}

uint64_t sub_21279E1A0()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21279E1AC()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_21279E1B8()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_21279E1C4()
{
  return MEMORY[0x24BEE3938]();
}

uint64_t sub_21279E1D0()
{
  return MEMORY[0x24BEE3940]();
}

uint64_t sub_21279E1DC()
{
  return MEMORY[0x24BEE3948]();
}

uint64_t sub_21279E1E8()
{
  return MEMORY[0x24BEE3950]();
}

uint64_t sub_21279E1F4()
{
  return MEMORY[0x24BEE3A18]();
}

uint64_t sub_21279E200()
{
  return MEMORY[0x24BEE3BB8]();
}

uint64_t sub_21279E20C()
{
  return MEMORY[0x24BEE3D40]();
}

uint64_t sub_21279E218()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_21279E224()
{
  return MEMORY[0x24BEE3E40]();
}

uint64_t sub_21279E230()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21279E23C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21279E248()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_21279E254()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21279E260()
{
  return MEMORY[0x24BEE42F0]();
}

uint64_t sub_21279E26C()
{
  return MEMORY[0x24BEE4840]();
}

uint64_t sub_21279E278()
{
  return MEMORY[0x24BEE4898]();
}

uint64_t sub_21279E284()
{
  return MEMORY[0x24BEE48A8]();
}

uint64_t sub_21279E290()
{
  return MEMORY[0x24BEE4A98]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

uint64_t CFDictionaryGetDouble()
{
  return MEMORY[0x24BE28F70]();
}

uint64_t CFDictionaryGetInt64Ranged()
{
  return MEMORY[0x24BE28F90]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x24BE28F98]();
}

CFTypeID CFErrorGetTypeID(void)
{
  return MEMORY[0x24BDBBEA8]();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x24BDBD8C8](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8F8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x24BDBDAF8](color);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
  MEMORY[0x24BDBDCB0](c, *(_QWORD *)&clockwise, x, y, radius, startAngle, endAngle);
}

void CGContextBeginPath(CGContextRef c)
{
  MEMORY[0x24BDBDD00](c);
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
  MEMORY[0x24BDBDD30](c, mask, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x24BDBDD50](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE60](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

void CGContextSetFillColor(CGContextRef c, const CGFloat *components)
{
  MEMORY[0x24BDBDFC8](c, components);
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
  MEMORY[0x24BDBE020](c, *(_QWORD *)&cap);
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
  MEMORY[0x24BDBE030](c, *(_QWORD *)&join);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x24BDBE038](c, width);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBE0D0](c, color);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x24BDBE118](c);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE778](image);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9168](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9180](url, options);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF038]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x24BDC0420](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x24BDC0450](time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x24BDC0490](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x24BDC0498](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x24BDC04C0](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x24BDC0558](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x24BDC0580](retstr, start, duration);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x24BDC05A0](retstr, lhs, rhs);
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return MEMORY[0x24BE04658]();
}

uint64_t CUDispatchTimerSet()
{
  return MEMORY[0x24BE29128]();
}

uint64_t IsAppleInternalBuild()
{
  return MEMORY[0x24BE295B0]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x24BE295F0]();
}

uint64_t NSAppendPrintF()
{
  return MEMORY[0x24BE29648]();
}

uint64_t NSErrorF()
{
  return MEMORY[0x24BE29688]();
}

uint64_t NSErrorWithOSStatusF()
{
  return MEMORY[0x24BE296B8]();
}

uint64_t NSPrintF()
{
  return MEMORY[0x24BE296C0]();
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x24BDD1238]();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BEBD2C8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t SFAddSuffixForCurrentDeviceClass()
{
  return MEMORY[0x24BE901E8]();
}

uint64_t SFAirDropModelImageNameFromModelString()
{
  return MEMORY[0x24BE90210]();
}

uint64_t SFCompactStringFromCollection()
{
  return MEMORY[0x24BE90220]();
}

uint64_t SFContentTypes()
{
  return MEMORY[0x24BE90228]();
}

uint64_t SFCreateLivePhotoBundle()
{
  return MEMORY[0x24BE90230]();
}

uint64_t SFDataFromCGImage()
{
  return MEMORY[0x24BE90238]();
}

uint64_t SFDeviceSupportsAirDrop()
{
  return MEMORY[0x24BE90298]();
}

uint64_t SFDeviceTimeLimitEveryoneMode()
{
  return MEMORY[0x24BE902A8]();
}

uint64_t SFFakeFilesAndItemsArrayForURLs()
{
  return MEMORY[0x24BE902B0]();
}

uint64_t SFIsCredential()
{
  return MEMORY[0x24BE902B8]();
}

uint64_t SFIsFindMyFriendsLink()
{
  return MEMORY[0x24BE902C0]();
}

uint64_t SFIsImage()
{
  return MEMORY[0x24BE902C8]();
}

uint64_t SFIsLivePhotos()
{
  return MEMORY[0x24BE902D0]();
}

uint64_t SFIsPass()
{
  return MEMORY[0x24BE902D8]();
}

uint64_t SFIsPasskeyCredentialLink()
{
  return MEMORY[0x24BE902E0]();
}

uint64_t SFIsVideo()
{
  return MEMORY[0x24BE902E8]();
}

uint64_t SFLocalizedNameForBluetoothProductID()
{
  return MEMORY[0x24BE902F0]();
}

uint64_t SFLocalizedStringEx()
{
  return MEMORY[0x24BE902F8]();
}

uint64_t SFLocalizedStringForKey()
{
  return MEMORY[0x24BE90300]();
}

uint64_t SFLocalizedStringForKeyInStringsFileNamed()
{
  return MEMORY[0x24BE90308]();
}

uint64_t SFMainQueue()
{
  return MEMORY[0x24BE90310]();
}

uint64_t SFMetricsLog()
{
  return MEMORY[0x24BE90318]();
}

uint64_t SFNonBreakingStringFromDeviceName()
{
  return MEMORY[0x24BE90320]();
}

uint64_t SFOperationCancel()
{
  return MEMORY[0x24BE90338]();
}

uint64_t SFOperationCreate()
{
  return MEMORY[0x24BE90340]();
}

uint64_t SFOperationResume()
{
  return MEMORY[0x24BE90348]();
}

uint64_t SFOperationSetClient()
{
  return MEMORY[0x24BE90350]();
}

uint64_t SFOperationSetDispatchQueue()
{
  return MEMORY[0x24BE90358]();
}

uint64_t SFOperationSetProperty()
{
  return MEMORY[0x24BE90360]();
}

uint64_t SFSaveDataToTempFile()
{
  return MEMORY[0x24BE90368]();
}

uint64_t SFSuggestedAirDropThumbnailSize()
{
  return MEMORY[0x24BE903A0]();
}

uint64_t SFUpTicksDiffFromNowToString()
{
  return MEMORY[0x24BE903A8]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x24BEBE040]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x24BEBE080](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x24BEBE0B0](category);
}

uint64_t UIFloorToViewScale()
{
  return MEMORY[0x24BEBE168]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x24BEBE278]((__n128)size, *(__n128 *)&size.height);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BEBE280](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BEBE298]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BEBE2A8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BEBE2B0]();
}

void UIGraphicsPopContext(void)
{
  MEMORY[0x24BEBE2B8]();
}

void UIGraphicsPushContext(CGContextRef context)
{
  MEMORY[0x24BEBE2C0](context);
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x24BEBE2D8](image, compressionQuality);
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x24BEBE650]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x24BEBE6B8]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x24BEBE6D0]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x24BEBE6E0]();
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x24BDC15A8](inUTI, inConformsToUTI);
}

CFStringRef UTTypeCopyDescription(CFStringRef inUTI)
{
  return (CFStringRef)MEMORY[0x24BDC15C0](inUTI);
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return (CFStringRef)MEMORY[0x24BDC15D0](inUTI, inTagClass);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x24BDC15E0](inTagClass, inTag, inConformingToUTI);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x24BE29B48]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x24BDD19C0](commaSeparatedKeysString, firstValue);
}

uint64_t _UTTypeCreateSuggestedFilename()
{
  return MEMORY[0x24BDC1638]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializerInFile()
{
  return MEMORY[0x24BEE4B40]();
}

uint64_t airdrop_log()
{
  return MEMORY[0x24BE903B0]();
}

uint64_t airdrop_ui_log()
{
  return MEMORY[0x24BE903B8]();
}

float asinf(float a1)
{
  float result;

  MEMORY[0x24BDAD190](a1);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAD228](a1, a2);
  return result;
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
  MEMORY[0x24BEDA8D8](atoken, auidp, euidp, egidp, ruidp, rgidp, pidp, asidp);
}

float cosf(float a1)
{
  float result;

  MEMORY[0x24BDADBE8](a1);
  return result;
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x24BDAE148]();
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAE3F8](a1, a2);
  return result;
}

uint64_t framework_log()
{
  return MEMORY[0x24BE903C0]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

uint64_t magic_head_log()
{
  return MEMORY[0x24BE90480]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A0](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A8](state);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x24BDAF410](log, ptr);
}

uint64_t people_ui_log()
{
  return MEMORY[0x24BE90488]();
}

uint64_t sf_dispatch_on_main_queue()
{
  return MEMORY[0x24BE90490]();
}

uint64_t share_sheet_log()
{
  return MEMORY[0x24BE90498]();
}

uint64_t sharingXPCHelperLog()
{
  return MEMORY[0x24BE904A0]();
}

uint64_t sharing_ui_log()
{
  return MEMORY[0x24BE904A8]();
}

float sinf(float a1)
{
  float result;

  MEMORY[0x24BDAFE20](a1);
  return result;
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x24BEE4C48]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x24BEE4C70]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

