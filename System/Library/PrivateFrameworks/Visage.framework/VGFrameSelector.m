@implementation VGFrameSelector

+ (id)invalidPose
{
  if (+[VGFrameSelector invalidPose]::onceToken != -1)
    dispatch_once(&+[VGFrameSelector invalidPose]::onceToken, &__block_literal_global_1);
  return (id)+[VGFrameSelector invalidPose]::invalidPose;
}

void __30__VGFrameSelector_invalidPose__block_invoke()
{
  VGCapturedPose *v0;
  void *v1;

  v0 = objc_alloc_init(VGCapturedPose);
  v1 = (void *)+[VGFrameSelector invalidPose]::invalidPose;
  +[VGFrameSelector invalidPose]::invalidPose = (uint64_t)v0;

}

+ (optional<std::vector<TargetPoseData>>)_computeTargetPosesForFrameCount:(SEL)a3 limit:(unint64_t)a4 desiredFrontPoseFrustumOffsets:(float)a5 desiredFrontPoseFrustumOffset:(optional<const VGFrameSelectorFrustumOffsets> *)a6 anglesDegrees:(optional<const VGFrameSelectorFrustumOffsets> *)a7 motionType:(id)a8 detectFrontPose:(int)a9 options:(BOOL)a10
{
  _BOOL4 v11;
  id v17;
  NSObject *v18;
  float v19;
  float pitchOffsetDegreesTop;
  float pitchOffsetDegreesBottom;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  NSObject *v27;
  float v28;
  float v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  float v34;
  float v35;
  float v36;
  float v37;
  _OWORD *v38;
  __float2 v39;
  __int128 v40;
  uint64_t v41;
  float *v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  uint64_t v48;
  void *v49;
  void *v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  uint64_t v56;
  float v57;
  uint64_t v58;
  void *v59;
  NSObject *v60;
  char *v61;
  char v62;
  optional<std::vector<TargetPoseData>> *v63;
  std::string *p_buf;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  std::string::size_type v68;
  double v69;
  const __CFString *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  int64x2_t v75;
  optional<std::vector<TargetPoseData>> *result;
  float v78;
  float v79;
  float v80;
  float v81;
  float yawOffsetDegreesRight;
  float yawOffsetDegreesLeft;
  float v84;
  float v85;
  id v86;
  __int128 v87;
  TargetPoseData *v88;
  std::string buf;
  const __CFString *v90;
  __int16 v91;
  double v92;
  __int16 v93;
  double v94;
  __int16 v95;
  double v96;
  __int16 v97;
  double v98;
  uint8_t v99[4];
  std::string *v100;
  uint64_t v101;

  v11 = a10;
  v101 = *MEMORY[0x24BDAC8D0];
  v17 = a8;
  v86 = a11;
  if (a9 < 2)
  {
    std::vector<TargetPoseData>::vector(&v87, a4);
    v19 = a5 + a5;
    if (v17)
    {
      if (!a6->var1)
      {
        __VGLogSharedInstance();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(buf.__r_.__value_.__l.__data_) = 0;
        }

        v62 = 0;
        v63 = retstr;
        retstr->var0.var0 = 0;
        goto LABEL_90;
      }
      pitchOffsetDegreesTop = a6->var0.var1.pitchOffsetDegreesTop;
      pitchOffsetDegreesBottom = a6->var0.var1.pitchOffsetDegreesBottom;
      v79 = a5 + a5;
      v80 = pitchOffsetDegreesBottom;
      yawOffsetDegreesRight = a6->var0.var1.yawOffsetDegreesRight;
      yawOffsetDegreesLeft = a6->var0.var1.yawOffsetDegreesLeft;
      v81 = pitchOffsetDegreesTop;
      if (a7->var1)
      {
        pitchOffsetDegreesTop = a7->var0.var1.pitchOffsetDegreesTop;
        v84 = a7->var0.var1.yawOffsetDegreesRight;
        v85 = a7->var0.var1.yawOffsetDegreesLeft;
        pitchOffsetDegreesBottom = a7->var0.var1.pitchOffsetDegreesBottom;
        if (!a4)
          goto LABEL_72;
      }
      else
      {
        v84 = a6->var0.var1.yawOffsetDegreesRight;
        v85 = a6->var0.var1.yawOffsetDegreesLeft;
        if (!a4)
          goto LABEL_72;
      }
    }
    else
    {
      if (a4 >= 3)
        v19 = v19 / (float)(a4 - 1);
      v22 = (float)((float)(v19 * 0.5) * 180.0) / 3.14159265;
      v23 = v22;
      v24 = v22;
      v25 = v22;
      v26 = v22;
      if (a6->var1)
      {
        v23 = fabsf(a6->var0.var1.yawOffsetDegreesLeft);
        v24 = fabsf(a6->var0.var1.yawOffsetDegreesRight);
        v25 = fabsf(a6->var0.var1.pitchOffsetDegreesTop);
        v26 = fabsf(a6->var0.var1.pitchOffsetDegreesBottom);
        if (a9 == 1)
        {
          if (v25 > v22)
            v25 = (float)((float)(v19 * 0.5) * 180.0) / 3.14159265;
          if (v26 > v22)
            v26 = (float)((float)(v19 * 0.5) * 180.0) / 3.14159265;
        }
        else
        {
          if (v23 > v22)
            v23 = (float)((float)(v19 * 0.5) * 180.0) / 3.14159265;
          if (v24 > v22)
            v24 = (float)((float)(v19 * 0.5) * 180.0) / 3.14159265;
        }
      }
      v79 = v19;
      v80 = v26;
      yawOffsetDegreesRight = v24;
      yawOffsetDegreesLeft = v23;
      v81 = v25;
      if (a7->var1)
      {
        v84 = fabsf(a7->var0.var1.yawOffsetDegreesRight);
        v85 = fabsf(a7->var0.var1.yawOffsetDegreesLeft);
        pitchOffsetDegreesTop = fabsf(a7->var0.var1.pitchOffsetDegreesTop);
        pitchOffsetDegreesBottom = fabsf(a7->var0.var1.pitchOffsetDegreesBottom);
        if (a9 == 1)
        {
          if (pitchOffsetDegreesTop > v22)
            pitchOffsetDegreesTop = (float)((float)(v19 * 0.5) * 180.0) / 3.14159265;
          if (pitchOffsetDegreesBottom > v22)
            pitchOffsetDegreesBottom = (float)((float)(v19 * 0.5) * 180.0) / 3.14159265;
          if (!a4)
            goto LABEL_72;
        }
        else
        {
          if (v85 <= v22)
            v28 = v85;
          else
            v28 = (float)((float)(v19 * 0.5) * 180.0) / 3.14159265;
          v29 = v84;
          if (v84 > v22)
            v29 = (float)((float)(v19 * 0.5) * 180.0) / 3.14159265;
          v84 = v29;
          v85 = v28;
          if (!a4)
            goto LABEL_72;
        }
      }
      else
      {
        v84 = v24;
        v85 = v23;
        pitchOffsetDegreesTop = v25;
        pitchOffsetDegreesBottom = v26;
        if (!a4)
        {
LABEL_72:
          __VGLogSharedInstance();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
          {
            v61 = &vg::frame_selection::motionTypeToString(vg::frame_selection::MotionType)::kMotionTypeToString[24 * a9];
            if (v61[23] < 0)
              std::string::__init_copy_ctor_external(&buf, *(const std::string::value_type **)v61, 0);
            else
              buf = *(std::string *)v61;
            p_buf = &buf;
            if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
              p_buf = (std::string *)buf.__r_.__value_.__r.__words[0];
            *(_DWORD *)v99 = 136315138;
            v100 = p_buf;
            _os_log_impl(&dword_249CAD000, v60, OS_LOG_TYPE_DEBUG, " Generated target poses for MotionType: %s ", v99, 0xCu);
            if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
              operator delete(buf.__r_.__value_.__l.__data_);
          }

          v66 = *((_QWORD *)&v87 + 1);
          v65 = v87;
          if ((_QWORD)v87 == *((_QWORD *)&v87 + 1))
          {
            v75 = vdupq_n_s64(v87);
          }
          else
          {
            do
            {
              __VGLogSharedInstance();
              v67 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
              {
                v68 = *(_QWORD *)(v65 + 72);
                v69 = *(float *)(v65 + 68);
                if (*(_BYTE *)(v65 + 80))
                  v70 = CFSTR("YES");
                else
                  v70 = CFSTR("NO");
                v71 = *(float *)(v65 + 84);
                v72 = *(float *)(v65 + 88);
                v73 = *(float *)(v65 + 92);
                v74 = *(float *)(v65 + 96);
                LODWORD(buf.__r_.__value_.__l.__data_) = 134219522;
                *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v68;
                WORD2(buf.__r_.__value_.__r.__words[1]) = 2048;
                *(double *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v69;
                HIWORD(buf.__r_.__value_.__r.__words[2]) = 2112;
                v90 = v70;
                v91 = 2048;
                v92 = v71;
                v93 = 2048;
                v94 = v72;
                v95 = 2048;
                v96 = v73;
                v97 = 2048;
                v98 = v74;
                _os_log_impl(&dword_249CAD000, v67, OS_LOG_TYPE_DEBUG, " PoseIdx: %zu Angle in degrees: %g Is front pose: %@ Alignment frustum: [(%g, %g), (%g, %g)] [(minYawAngleDegrees, maxYawAngleDegrees), (minPitchAngleDegrees, maxPitchAngleDegrees)] ", (uint8_t *)&buf, 0x48u);
              }

              v65 += 112;
            }
            while (v65 != v66);
            v75 = (int64x2_t)v87;
          }
          v63 = retstr;
          *(int64x2_t *)&retstr->var0.var0 = v75;
          retstr->var0.var1.__end_cap_.__value_ = v88;
          v88 = 0;
          v87 = 0uLL;
          v62 = 1;
LABEL_90:
          v63->var1 = v62;
          buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&v87;
          std::vector<TargetPoseData>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
          goto LABEL_91;
        }
      }
    }
    v30 = 0;
    v31 = 0;
    if (v11)
      v32 = (a4 >> 1);
    else
      v32 = 0xFFFFFFFFLL;
    v78 = 1.5708 - a5;
    do
    {
      if (v17)
      {
        objc_msgSend(v17, "objectAtIndexedSubscript:", v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "floatValue");
        v35 = v34;

        v36 = v35 * 3.14159265 / 180.0;
        v37 = v36 + 1.5708;
      }
      else
      {
        v37 = v78 + (float)((float)v31 * v79);
      }
      v38 = (_OWORD *)(v87 + v30);
      *(_DWORD *)(v87 + v30 + 64) = a9;
      v39 = __sincosf_stret(v37);
      if (a9 == 1)
      {
        LODWORD(v40) = 0;
        HIDWORD(v40) = 0;
        DWORD1(v40) = LODWORD(v39.__cosval);
      }
      else
      {
        HIDWORD(v40) = 0;
        *(_QWORD *)&v40 = LODWORD(v39.__cosval);
      }
      DWORD2(v40) = LODWORD(v39.__sinval);
      *v38 = v40;
      v41 = v87;
      v42 = (float *)(v87 + v30);
      v43 = (float)(atan2f(-*(float *)(v87 + v30), *(float *)(v87 + v30 + 8)) * 180.0) / 3.14159265;
      v44 = (float)(asinf(v42[1]) * -180.0) / 3.14159265;
      if ((v32 & 0x80000000) != 0 || v32 != v31)
      {
        v53 = v43 - yawOffsetDegreesRight;
        if ((float)(v43 - yawOffsetDegreesRight) >= v43)
          v53 = v43;
        v54 = yawOffsetDegreesLeft + v43;
        if ((float)(yawOffsetDegreesLeft + v43) <= v43)
          v54 = v43;
        v55 = v44 - v80;
        if ((float)(v44 - v80) >= v44)
          v55 = v44;
        v42[21] = v53;
        v42[22] = v54;
        if ((float)(v81 + v44) > v44)
          v44 = v81 + v44;
        v42[23] = v55;
        v42[24] = v44;
      }
      else
      {
        v45 = v43 - v84;
        if ((float)(v43 - v84) >= v43)
          v45 = v43;
        v46 = v85 + v43;
        if ((float)(v85 + v43) <= v43)
          v46 = v43;
        v47 = v44 - pitchOffsetDegreesBottom;
        if ((float)(v44 - pitchOffsetDegreesBottom) >= v44)
          v47 = v44;
        v48 = v41 + 112 * v32;
        *(float *)(v48 + 84) = v45;
        *(float *)(v48 + 88) = v46;
        if ((float)(pitchOffsetDegreesTop + v44) > v44)
          v44 = pitchOffsetDegreesTop + v44;
        *(float *)(v48 + 92) = v47;
        *(float *)(v48 + 96) = v44;
        *(_BYTE *)(v48 + 80) = 1;
        objc_msgSend(v86, "bodyPoseGuidanceOptions");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (v49)
        {
          objc_msgSend(v86, "bodyPoseGuidanceOptions");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "bestAlignmentToleranceAngleFrontPose");
          v52 = v51 * 3.14159265 / 180.0;
          *(float *)(v87 + 112 * v32 + 56) = fmaxf(v52, 0.0);

        }
        else
        {
          *(_DWORD *)(v87 + 112 * v32 + 56) = 0;
        }

        v41 = v87;
      }
      v56 = v41 + v30;
      *(_QWORD *)(v56 + 72) = v31;
      v57 = (float)((float)(v37 + -1.5708) * 180.0) / 3.14159265;
      *(float *)(v56 + 68) = v57;
      *(_DWORD *)(v56 + 60) = 0;
      +[VGFrameSelector invalidPose](VGFrameSelector, "invalidPose");
      v58 = objc_claimAutoreleasedReturnValue();
      v59 = *(void **)(v87 + v30 + 16);
      *(_QWORD *)(v87 + v30 + 16) = v58;

      ++v31;
      v30 += 112;
    }
    while (a4 != v31);
    goto LABEL_72;
  }
  __VGLogSharedInstance();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 67109120;
    HIDWORD(buf.__r_.__value_.__r.__words[0]) = a9;
    _os_log_impl(&dword_249CAD000, v18, OS_LOG_TYPE_DEBUG, " VGFrameSelector received unknown / unsupported MotionType: %d ", (uint8_t *)&buf, 8u);
  }

  retstr->var0.var0 = 0;
  retstr->var1 = 0;
LABEL_91:

  return result;
}

- (VGFrameSelector)initWithOptions:(id)a3
{
  id v5;
  VGFrameSelector *v6;
  VGFrameSelector *v7;
  id *p_options;
  uint64_t v9;
  uint64_t v10;
  float v11;
  float v12;
  float v13;
  float v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  void *v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  void *v36;
  double v37;
  void *v38;
  VGUserBodyPoseGuidance *v39;
  void *v40;
  uint64_t v41;
  VGUserBodyPoseGuidance *userBodyPoseGuidance;
  VGFrameSelector *v43;
  NSObject *v44;
  NSObject *v45;
  _BYTE v47[20];
  _DWORD v48[4];
  char v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  _DWORD v53[4];
  char v54;
  _DWORD v55[4];
  char v56;
  uint8_t buf[8];
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  objc_super v63;
  uint8_t *v64;

  v5 = a3;
  v63.receiver = self;
  v63.super_class = (Class)VGFrameSelector;
  v6 = -[VGFrameSelector init](&v63, sel_init);
  v7 = v6;
  if (v6)
  {
    p_options = (id *)&v6->_options;
    objc_storeStrong((id *)&v6->_options, a3);
    v9 = -[VGFrameSelectorOptions yawFrameCount](v7->_options, "yawFrameCount");
    v10 = objc_msgSend(*p_options, "pitchFrameCount");
    v7->_requiredPosesCount = v10 + v9;
    v7->_remainingPosesCount = v10 + v9;
    if (-[VGFrameSelectorOptions useSimpleSelector](v7->_options, "useSimpleSelector"))
    {
      objc_msgSend(*p_options, "simpleSelectorMinOffsetAngle");
      v12 = v11 * 3.14159265 / 180.0;
      v7->_simpleSelectorMaxAlignment = cosf(v12);
      -[VGFrameSelectorOptions simpleSelectorMaxOffsetAngle](v7->_options, "simpleSelectorMaxOffsetAngle");
      v14 = v13 * 3.14159265 / 180.0;
      v7->_simpleSelectorMinAlignment = cosf(v14);
    }
    if (v7->_requiredPosesCount)
    {
      v60 = 0;
      v61 = 0;
      v62 = 0;
      if (objc_msgSend(v5, "yawFrameCount"))
      {
        v15 = objc_msgSend(*p_options, "yawFrameCount");
        objc_msgSend(*p_options, "yawLimit");
        v17 = v16;
        objc_msgSend(*p_options, "yawPosesFrustumOffsets");
        v55[0] = v18;
        v55[1] = v19;
        v55[2] = v20;
        v55[3] = v21;
        v56 = 1;
        objc_msgSend(*p_options, "frontPoseFrustumOffsets");
        v53[0] = v22;
        v53[1] = v23;
        v53[2] = v24;
        v53[3] = v25;
        v54 = 1;
        objc_msgSend(*p_options, "yawAngles");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(*p_options, "detectFrontPose");
        LODWORD(v28) = v17;
        +[VGFrameSelector _computeTargetPosesForFrameCount:limit:desiredFrontPoseFrustumOffsets:desiredFrontPoseFrustumOffset:anglesDegrees:motionType:detectFrontPose:options:](VGFrameSelector, "_computeTargetPosesForFrameCount:limit:desiredFrontPoseFrustumOffsets:desiredFrontPoseFrustumOffset:anglesDegrees:motionType:detectFrontPose:options:", v15, v55, v53, v26, 0, v27, v28, v5);

        if (!v59)
        {
          v43 = 0;
LABEL_30:
          *(_QWORD *)buf = &v60;
          std::vector<TargetPoseData>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
          goto LABEL_31;
        }
        std::vector<TargetPoseData>::__assign_with_size[abi:ne180100]<TargetPoseData*,TargetPoseData*>(&v60, *(uint64_t *)buf, v58, 0x6DB6DB6DB6DB6DB7 * ((v58 - *(_QWORD *)buf) >> 4));
        if (v59)
        {
          v50 = buf;
          std::vector<TargetPoseData>::__destroy_vector::operator()[abi:ne180100]((void ***)&v50);
        }
      }
      v50 = 0;
      v51 = 0;
      v52 = 0;
      if (objc_msgSend(v5, "pitchFrameCount"))
      {
        v29 = objc_msgSend(*p_options, "pitchFrameCount");
        objc_msgSend(*p_options, "pitchLimit");
        v31 = v30;
        objc_msgSend(*p_options, "pitchPosesFrustumOffsets");
        v48[0] = v32;
        v48[1] = v33;
        v48[2] = v34;
        v48[3] = v35;
        v49 = 1;
        v47[0] = 0;
        v47[16] = 0;
        objc_msgSend(*p_options, "pitchAngles");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v37) = v31;
        +[VGFrameSelector _computeTargetPosesForFrameCount:limit:desiredFrontPoseFrustumOffsets:desiredFrontPoseFrustumOffset:anglesDegrees:motionType:detectFrontPose:options:](VGFrameSelector, "_computeTargetPosesForFrameCount:limit:desiredFrontPoseFrustumOffsets:desiredFrontPoseFrustumOffset:anglesDegrees:motionType:detectFrontPose:options:", v29, v48, v47, v36, 1, 0, v37, v5);

        if (!v59)
          goto LABEL_28;
        std::vector<TargetPoseData>::__assign_with_size[abi:ne180100]<TargetPoseData*,TargetPoseData*>((uint64_t *)&v50, *(uint64_t *)buf, v58, 0x6DB6DB6DB6DB6DB7 * ((v58 - *(_QWORD *)buf) >> 4));
        if (v59)
        {
          v64 = buf;
          std::vector<TargetPoseData>::__destroy_vector::operator()[abi:ne180100]((void ***)&v64);
        }
      }
      std::vector<TargetPoseData>::__insert_with_size[abi:ne180100]<std::move_iterator<std::__wrap_iter<TargetPoseData*>>,std::move_iterator<std::__wrap_iter<TargetPoseData*>>>((uint64_t *)&v7->_targetPosesData, (uint64_t)v7->_targetPosesData.__end_, v60, v61, 0x6DB6DB6DB6DB6DB7 * ((v61 - v60) >> 4));
      std::vector<TargetPoseData>::__insert_with_size[abi:ne180100]<std::move_iterator<std::__wrap_iter<TargetPoseData*>>,std::move_iterator<std::__wrap_iter<TargetPoseData*>>>((uint64_t *)&v7->_targetPosesData, (uint64_t)v7->_targetPosesData.__end_, (uint64_t)v50, v51, 0x6DB6DB6DB6DB6DB7 * ((v51 - (uint64_t)v50) >> 4));
      if (v7->_targetPosesData.__end_ != v7->_targetPosesData.__begin_)
      {
        if (objc_msgSend(*p_options, "detectFrontPose")
          && objc_msgSend(*p_options, "useVNFilters"))
        {
          *(_WORD *)buf = 256;
          vg::shared::VNWarmupDetector(buf);
        }
        objc_msgSend(*p_options, "bodyPoseGuidanceOptions");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          v39 = [VGUserBodyPoseGuidance alloc];
          objc_msgSend(*p_options, "bodyPoseGuidanceOptions");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = -[VGUserBodyPoseGuidance initWithOptions:](v39, "initWithOptions:", v40);
          userBodyPoseGuidance = v7->_userBodyPoseGuidance;
          v7->_userBodyPoseGuidance = (VGUserBodyPoseGuidance *)v41;

        }
        v43 = v7;
        goto LABEL_29;
      }
      __VGLogSharedInstance();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_249CAD000, v45, OS_LOG_TYPE_DEBUG, " No target poses have been computed from the selector options ", buf, 2u);
      }

LABEL_28:
      v43 = 0;
LABEL_29:
      *(_QWORD *)buf = &v50;
      std::vector<TargetPoseData>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
      goto LABEL_30;
    }
    __VGLogSharedInstance();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_249CAD000, v44, OS_LOG_TYPE_DEBUG, " VGFrameSelector expects at least a single frame ", buf, 2u);
    }

  }
  v43 = 0;
LABEL_31:

  return v43;
}

- (FrameRejectionState)applyVisionFilters:(SEL)a3 bestTargetPoseData:(id)a4 frameTimestampMS:(const void *)a5
{
  id v9;
  NSObject *v10;
  size_t Width;
  size_t Height;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __CVBuffer *CroppedCVPixelBuffer;
  void (**v23)(_QWORD);
  void *v24;
  void *v30;
  float v31;
  NSString *v32;
  FrameRejectionState *result;
  id v34[3];
  __int128 v35;
  char v36;
  char v37;
  _QWORD v38[5];

  v9 = a4;
  if (*((_BYTE *)a5 + 80) && -[VGFrameSelectorOptions useVNFilters](self->_options, "useVNFilters"))
  {
    VGLogVGFrameSelector();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      LOWORD(v34[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_249CAD000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ApplyVisionFilters", (const char *)&unk_249D51699, (uint8_t *)v34, 2u);
    }

    Width = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v9, "rgbRectified"));
    Height = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v9, "rgbRectified"));
    objc_msgSend(v9, "face");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    CroppedCVPixelBuffer = createCroppedCVPixelBuffer((__CVBuffer *)objc_msgSend(v9, "rgbRectified"), (unint64_t)(v15 * (float)Width), (unint64_t)(v17 * (float)Height), (unint64_t)((v15 + v19) * (float)Width), (unint64_t)((v17 + v21) * (float)Height));
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __74__VGFrameSelector_applyVisionFilters_bestTargetPoseData_frameTimestampMS___block_invoke_470;
    v38[3] = &__block_descriptor_40_e5_v8__0l;
    v38[4] = CroppedCVPixelBuffer;
    v23 = (void (**)(_QWORD))MEMORY[0x24BD03294](v38);
    CVPixelBufferGetIOSurface(CroppedCVPixelBuffer);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = 0;
    v34[2] = 0;
    v34[0] = v24;
    __asm { FMOV            V0.2D, #1.0 }
    v35 = _Q0;
    v36 = 1;
    v37 = 0;
    vg::shared::VNGetFaceAttributes((uint64_t)v34);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGFrameSelectorOptions vnFrontPoseBlinkThreshold](self->_options, "vnFrontPoseBlinkThreshold");
    if (vg::shared::VNGetIsBlinking(v30, v31))
    {
      retstr->reason = 28;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("blinking was detected on front pose (Vision)"));
      v32 = (NSString *)objc_claimAutoreleasedReturnValue();
      retstr->debugDictionary = 0;
      retstr->description = v32;
    }
    else
    {
      retstr->reason = 0;
      retstr->debugDictionary = 0;
      retstr->description = 0;
    }
    *(_QWORD *)&retstr->outOfFovOffset = 0;

    v23[2](v23);
    __74__VGFrameSelector_applyVisionFilters_bestTargetPoseData_frameTimestampMS___block_invoke();
  }
  else
  {
    retstr->reason = 0;
    *(_QWORD *)&retstr->outOfFovOffset = 0;
    retstr->debugDictionary = 0;
    retstr->description = 0;
  }

  return result;
}

void __74__VGFrameSelector_applyVisionFilters_bestTargetPoseData_frameTimestampMS___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  VGLogVGFrameSelector();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ApplyVisionFilters", (const char *)&unk_249D51699, v1, 2u);
  }

}

void __74__VGFrameSelector_applyVisionFilters_bestTargetPoseData_frameTimestampMS___block_invoke_470(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

- (FrameRejectionState)applyVisionFaceLandmarksFilter:(SEL)a3 bestTargetPoseData:(id)a4 frameTimestampMS:(const void *)a5
{
  id v9;
  NSObject *v10;
  size_t Width;
  size_t Height;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __CVBuffer *CroppedCVPixelBuffer;
  void (**v23)(_QWORD);
  void *v24;
  void *v30;
  void *v31;
  float v32;
  void *v33;
  float v34;
  NSString *v35;
  FrameRejectionState *result;
  __int128 buf;
  __int128 v38;
  char v39;
  _QWORD v40[5];

  v9 = a4;
  if (*((_BYTE *)a5 + 80)
    && -[VGFrameSelectorOptions useVNFaceLandmarksFilter](self->_options, "useVNFaceLandmarksFilter"))
  {
    VGLogVGFrameSelector();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_249CAD000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ApplyVisionFaceLandmarkFilter", (const char *)&unk_249D51699, (uint8_t *)&buf, 2u);
    }

    Width = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v9, "rgbRectified"));
    Height = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v9, "rgbRectified"));
    objc_msgSend(v9, "face");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    CroppedCVPixelBuffer = createCroppedCVPixelBuffer((__CVBuffer *)objc_msgSend(v9, "rgbRectified"), (unint64_t)(v15 * (float)Width), (unint64_t)(v17 * (float)Height), (unint64_t)((v15 + v19) * (float)Width), (unint64_t)((v17 + v21) * (float)Height));
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __86__VGFrameSelector_applyVisionFaceLandmarksFilter_bestTargetPoseData_frameTimestampMS___block_invoke_475;
    v40[3] = &__block_descriptor_40_e5_v8__0l;
    v40[4] = CroppedCVPixelBuffer;
    v23 = (void (**)(_QWORD))MEMORY[0x24BD03294](v40);
    CVPixelBufferGetIOSurface(CroppedCVPixelBuffer);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    buf = 0uLL;
    __asm { FMOV            V0.2D, #1.0 }
    v38 = _Q0;
    v39 = 1;
    vg::shared::VNDetectFaceLandmarks2D(v24, &buf);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30 && (objc_msgSend(v30, "confidence"), v32 < 0.8))
    {
      retstr->reason = 9;
      v33 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v31, "confidence");
      objc_msgSend(v33, "stringWithFormat:", CFSTR("face landmarks not detected [confidence: %g < %g]"), v34, 0x3FE99999A0000000);
      v35 = (NSString *)objc_claimAutoreleasedReturnValue();
      retstr->debugDictionary = 0;
      retstr->description = v35;
    }
    else
    {
      retstr->reason = 0;
      retstr->debugDictionary = 0;
      retstr->description = 0;
    }
    *(_QWORD *)&retstr->outOfFovOffset = 0;

    v23[2](v23);
    __86__VGFrameSelector_applyVisionFaceLandmarksFilter_bestTargetPoseData_frameTimestampMS___block_invoke();
  }
  else
  {
    retstr->reason = 0;
    *(_QWORD *)&retstr->outOfFovOffset = 0;
    retstr->debugDictionary = 0;
    retstr->description = 0;
  }

  return result;
}

void __86__VGFrameSelector_applyVisionFaceLandmarksFilter_bestTargetPoseData_frameTimestampMS___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  VGLogVGFrameSelector();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ApplyVisionFaceLandmarkFilter", (const char *)&unk_249D51699, v1, 2u);
  }

}

void __86__VGFrameSelector_applyVisionFaceLandmarksFilter_bestTargetPoseData_frameTimestampMS___block_invoke_475(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

- (void)checkDepthFoVFilter:(uint64_t)a3@<X3> framePose:(double *)a4@<X4> bestTargetPoseData:(uint64_t)a5@<X5> validDataBounds:(uint64_t)a6@<X8> frameTimestampMS:(__n128)a7@<Q3>
{
  id v12;
  void *v13;
  float64_t v14;
  float64_t v15;
  float64_t v16;
  float64_t v17;
  void *v18;
  void *v19;
  void *v20;
  float v21;
  float v22;
  float v23;
  double v24;
  double v25;
  float v26;
  float v27;
  double v28;
  double v29;
  float v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  float32x2_t v47;
  float v48;
  float32x2_t v49;
  float v50;
  float v51;
  float v52;
  int v53;
  float v54;
  double v55;
  float v56;
  double v57;
  float v58;
  float64x2_t v59;
  float64x2_t v60;
  float64x2_t v61;
  float64x2_t v62;
  uint8_t buf[4];
  uint64_t v64;
  __int16 v65;
  float64_t v66;
  __int16 v67;
  float64_t v68;
  __int16 v69;
  float64_t v70;
  __int16 v71;
  float64_t v72;
  __int16 v73;
  double v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  float64_t v82;
  __int16 v83;
  float64_t v84;
  __int16 v85;
  float64_t v86;
  __int16 v87;
  float64_t v88;
  __int16 v89;
  void *v90;
  _QWORD v91[3];
  _QWORD v92[3];
  _QWORD v93[2];
  _QWORD v94[3];
  CGRect v95;
  CGRect v96;

  v58 = a7.n128_f32[2];
  v94[2] = *MEMORY[0x24BDAC8D0];
  v12 = a2;
  objc_msgSend(v12, "face");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v61.f64[0] = v14;
  v61.f64[1] = v15;
  v62.f64[0] = v16;
  v62.f64[1] = v17;

  if (!*(_BYTE *)(a3 + 112))
  {
    v19 = *(void **)(a1 + 40);
LABEL_5:
    objc_msgSend(v19, "yawMarginRatio");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (*(_BYTE *)(a3 + 80))
  {
    objc_msgSend(*(id *)(a1 + 40), "frontPoseMarginRatio");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v19 = *(void **)(a1 + 40);
  if (!*(_DWORD *)(a3 + 64))
    goto LABEL_5;
  objc_msgSend(v19, "pitchMarginRatio");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v20 = v18;
  if (v18)
  {
    v57 = *a4;
    objc_msgSend(v18, "leftMarginHeadRatio");
    v56 = v21;
    v55 = a4[1];
    objc_msgSend(v20, "topMarginHeadRatio");
    v23 = v22;
    v24 = *a4;
    v25 = a4[2];
    objc_msgSend(v20, "rightMarginHeadRatio");
    v27 = v26;
    v28 = a4[1];
    v29 = a4[3];
    objc_msgSend(v20, "bottomMarginHeadRatio");
    v59.f64[0] = v57 + v62.f64[0] * v56;
    v59.f64[1] = v55 + v62.f64[1] * v23;
    v60.f64[0] = fmax(v24 + v25 - v62.f64[0] * v27 - v59.f64[0], 0.0);
    v60.f64[1] = fmax(v28 + v29 - v62.f64[1] * v30 - v59.f64[1], 0.0);
    v91[0] = CFSTR("validDataBounds");
    +[VGSerializationHelpers cgRectToDict:](VGSerializationHelpers, "cgRectToDict:", a4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v92[0] = v31;
    v91[1] = CFSTR("faceBounds");
    +[VGSerializationHelpers cgRectToDict:](VGSerializationHelpers, "cgRectToDict:", &v61);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v92[1] = v32;
    v91[2] = CFSTR("fovBounds");
    +[VGSerializationHelpers cgRectToDict:](VGSerializationHelpers, "cgRectToDict:", &v59);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v92[2] = v33;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v92, v91, 3);
    v34 = objc_claimAutoreleasedReturnValue();

    v95.origin = (CGPoint)v59;
    v95.size = (CGSize)v60;
    v96.origin = (CGPoint)v61;
    v96.size = (CGSize)v62;
    if (CGRectContainsRect(v95, v96))
    {
      *(_DWORD *)a6 = 0;
      *(_QWORD *)(a6 + 8) = 0;
      *(_QWORD *)(a6 + 16) = 0;
    }
    else
    {
      __VGLogSharedInstance();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        v38 = *a4;
        v39 = *((_QWORD *)a4 + 1);
        v40 = *((_QWORD *)a4 + 2);
        v41 = *((_QWORD *)a4 + 3);
        *(_DWORD *)buf = 134221315;
        v64 = a5;
        v65 = 2049;
        v66 = v61.f64[0];
        v67 = 2049;
        v68 = v61.f64[1];
        v69 = 2049;
        v70 = v62.f64[0];
        v71 = 2049;
        v72 = v62.f64[1];
        v73 = 2049;
        v74 = v38;
        v75 = 2049;
        v76 = v39;
        v77 = 2049;
        v78 = v40;
        v79 = 2049;
        v80 = v41;
        v81 = 2049;
        v82 = v59.f64[0];
        v83 = 2049;
        v84 = v59.f64[1];
        v85 = 2049;
        v86 = v60.f64[0];
        v87 = 2049;
        v88 = v60.f64[1];
        v89 = 2113;
        v90 = v20;
        _os_log_impl(&dword_249CAD000, v37, OS_LOG_TYPE_DEBUG, " Frame#%zu face out of depth FoV. face bounds: [%{private}g %{private}g %{private}g %{private}g], valid depth bounds: [%{private}g %{private}g %{private}g %{private}g], fov bounds: [%{private}g %{private}g %{private}g %{private}g]margins: [%{private}@],  ", buf, 0x8Eu);
      }

      __asm { FMOV            V2.2D, #0.5 }
      v47 = vsub_f32(vcvt_f32_f64(vmlaq_f64(v61, _Q2, v62)), vcvt_f32_f64(vmlaq_f64(v59, _Q2, v60)));
      v48 = fabsf(v47.f32[0]);
      v49 = v47;
      v50 = fabsf(v47.f32[1]);
      if (v48 <= v50)
      {
        objc_msgSend(v12, "videoIntrinsics");
        v52 = (float)((float)(v58 / v54) * 0.1)
            * (float)(v50 * (float)CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v12, "yuvRectified")));
        if (v49.f32[1] >= 0.0)
          v53 = 14;
        else
          v53 = 13;
      }
      else
      {
        objc_msgSend(v12, "videoIntrinsics");
        v52 = (float)((float)(v58 / v51) * 0.1)
            * (float)(v48 * (float)CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v12, "yuvRectified")));
        if (v49.f32[0] >= 0.0)
          v53 = 12;
        else
          v53 = 11;
      }
      *(_DWORD *)a6 = v53;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("out of FoV offset: %g cm"), v52);
      *(_QWORD *)(a6 + 8) = objc_claimAutoreleasedReturnValue();
      *(float *)(a6 + 16) = v52;
      *(_DWORD *)(a6 + 20) = 0;
    }
    *(_QWORD *)(a6 + 24) = v34;
  }
  else
  {
    *(_DWORD *)a6 = 0;
    *(_QWORD *)(a6 + 8) = 0;
    *(_QWORD *)(a6 + 16) = 0;
    v93[0] = CFSTR("validDataBounds");
    +[VGSerializationHelpers cgRectToDict:](VGSerializationHelpers, "cgRectToDict:", a4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v93[1] = CFSTR("faceBounds");
    v94[0] = v35;
    +[VGSerializationHelpers cgRectToDict:](VGSerializationHelpers, "cgRectToDict:", &v61);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v94[1] = v36;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v94, v93, 2);
    *(_QWORD *)(a6 + 24) = objc_claimAutoreleasedReturnValue();

  }
}

- (FrameRejectionState)applyExpressionFilters:(SEL)a3 trackingData:(const void *)a4 frameTimestampMS:(id)a5 score:(unint64_t)a6
{
  id v11;
  NSObject *v12;
  const __CFString *v13;
  void (**v14)(_QWORD);
  void *v15;
  VGFrameSelectorOptions *options;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  float v23;
  float v24;
  const __CFString *v25;
  NSString *v26;
  FrameRejectionState *result;
  void (**v28)(_QWORD);
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  uint8_t v34[128];
  uint8_t buf[4];
  const __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v11 = a5;
  VGLogVGFrameSelector();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    if (*((_BYTE *)a4 + 80))
      v13 = CFSTR("true");
    else
      v13 = CFSTR("false");
    *(_DWORD *)buf = 138543362;
    v36 = v13;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ExpressionFilters", "isFrontPose:%{public}@", buf, 0xCu);
  }

  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __78__VGFrameSelector_applyExpressionFilters_trackingData_frameTimestampMS_score___block_invoke;
  v33[3] = &__block_descriptor_40_e5_v8__0l;
  v33[4] = a4;
  v14 = (void (**)(_QWORD))MEMORY[0x24BD03294](v33);
  if (*((_BYTE *)a4 + 80))
  {
    -[VGFrameSelectorOptions frontExpressionFilters](self->_options, "frontExpressionFilters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    options = self->_options;
    if (*((_DWORD *)a4 + 16))
      -[VGFrameSelectorOptions pitchExpressionFilters](options, "pitchExpressionFilters");
    else
      -[VGFrameSelectorOptions yawExpressionFilters](options, "yawExpressionFilters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = v15;
  if (v15)
  {
    v28 = v14;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v18 = v15;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v30 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v22, "filter:", v11);
          v24 = v23 * *a7;
          *a7 = v24;
          if (v24 == 0.0)
          {
            retstr->reason = objc_msgSend(v22, "rejectionReason");
            if (*((_BYTE *)a4 + 80))
              v25 = CFSTR("YES");
            else
              v25 = CFSTR("NO");
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("expression filter [%@], isFrontPose: %@"), v22, v25);
            v26 = (NSString *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)&retstr->outOfFovOffset = 0;
            retstr->debugDictionary = 0;
            retstr->description = v26;

            v14 = v28;
            goto LABEL_27;
          }
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v19)
          continue;
        break;
      }
    }

    v14 = v28;
  }
  retstr->reason = 0;
  *(_QWORD *)&retstr->outOfFovOffset = 0;
  retstr->debugDictionary = 0;
  retstr->description = 0;
LABEL_27:

  v14[2](v14);
  return result;
}

void __78__VGFrameSelector_applyExpressionFilters_trackingData_frameTimestampMS_score___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  VGLogVGFrameSelector();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 80))
      v3 = CFSTR("true");
    else
      v3 = CFSTR("false");
    v4 = 138543362;
    v5 = v3;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ExpressionFilters", "isFrontPose:%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

- (id)processHeadPoseSimple:(HeadPoseData)a3 frameTimestampMS:(unint64_t)a4
{
  void *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  float32x4_t v11;
  float v12;
  float simpleSelectorMaxAlignment;
  float simpleSelectorMinAlignment;
  void *v16;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;

  v6 = (void *)objc_opt_new();
  v7 = self->_requiredPosesCount - self->_remainingPosesCount;
  objc_msgSend(v6, "setPoseIndex:", v7);
  objc_msgSend(v6, "setMotionType:", *((unsigned int *)self->_targetPosesData.__begin_ + 28 * v7 + 16));
  if (self->_requiredPosesCount)
  {
    v8 = 0;
    v9 = 0;
    while (1)
    {
      v10 = *(id *)((char *)self->_targetPosesData.__begin_ + v8 + 16);
      if ((objc_msgSend(v10, "valid") & 1) != 0)
      {
        v11 = vmulq_f32(*(float32x4_t *)(a4 + 16), *(float32x4_t *)((char *)self->_targetPosesData.__begin_ + v8 + 32));
        v12 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2), vaddq_f32(v11, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v11.f32, 1))).f32[0];
        simpleSelectorMinAlignment = self->_simpleSelectorMinAlignment;
        simpleSelectorMaxAlignment = self->_simpleSelectorMaxAlignment;
        if (simpleSelectorMaxAlignment < v12 || v12 < simpleSelectorMinAlignment)
          break;
      }

      ++v9;
      v8 += 112;
      if (v9 >= self->_requiredPosesCount)
        goto LABEL_9;
    }
    v22 = 24;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("viewdir alignment to previously selected poses does not satisfy the limit criteria; %g not within (%g, %g)"),
      v12,
      simpleSelectorMinAlignment,
      simpleSelectorMaxAlignment);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v25 = 0;
    v23 = v16;
    if (v6)
      objc_msgSend(v6, "setRejectionState:", &v22);
    else

  }
  else
  {
LABEL_9:
    *((_OWORD *)self->_targetPosesData.__begin_ + 7 * v7 + 2) = *(_OWORD *)(a4 + 16);
    v18 = 0;
    v20 = 0;
    v21 = 0;
    v19 = 0;
    if (v6)
      objc_msgSend(v6, "setRejectionState:", &v18);
  }
  return v6;
}

- (id)processHeadPose:(HeadPoseData)a3 captureData:(id)a4 trackingData:(id)a5 validDataBounds:(const void *)a6 frameTimestampMS:(unint64_t)a7
{
  uint64_t v7;
  uint64_t v8;
  NSObject *v13;
  void *v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  uint64_t v19;
  VGUserBodyPoseGuidance *userBodyPoseGuidance;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  uint64_t v26;
  unint64_t requiredPosesCount;
  uint64_t v28;
  float v29;
  float v30;
  float *v31;
  float v32;
  uint64_t v33;
  float32x4_t v34;
  float v35;
  VGFrameSelector *v36;
  VGFrameSelector *v37;
  TargetPoseData *begin;
  NSObject *v39;
  const __CFString *v40;
  char *v41;
  unsigned int *v42;
  int v43;
  __CFString *v44;
  NSObject *v45;
  char *v46;
  char *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  BOOL v52;
  id v53;
  BOOL v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  double v59;
  id v60;
  id v61;
  id v62;
  float v63;
  float *v64;
  float *v65;
  float v66;
  float v67;
  void *v68;
  char *v69;
  int v70;
  float *v71;
  float v72;
  double v73;
  double v74;
  id v75;
  id v76;
  int *v77;
  void *v78;
  float v79;
  float v80;
  void *v81;
  float v82;
  _BOOL4 v83;
  void *v84;
  float v85;
  float v86;
  void *v87;
  float v88;
  void *v89;
  id v90;
  char *v92;
  float *v93;
  id v94;
  double v95;
  double v96;
  void (**v97)(_QWORD);
  double v98;
  __CFString *v99;
  double v100;
  void *v101;
  id v102;
  void *v103;
  int v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  int v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  int v112;
  id v113;
  uint64_t v114;
  id v115;
  int v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  int v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  int v124;
  id v125;
  uint64_t v126;
  id v127;
  float v128;
  int v129;
  id v130;
  uint64_t v131;
  id v132;
  _QWORD v133[5];
  int v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  VGFrameSelector *v138;
  CMTime time;
  int v140;
  void *v141;
  uint64_t v142;
  uint64_t v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  uint8_t buf[32];
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  int v153;
  char v154;
  uint8_t v155[16];
  __int128 v156;
  __int128 v157;
  __int128 v158;
  uint64_t v159;

  v8 = v7;
  v159 = *MEMORY[0x24BDAC8D0];
  v102 = a5;
  v103 = (id)a6;
  VGLogVGFrameSelector();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ProcessHeadPose", (const char *)&unk_249D51699, buf, 2u);
  }

  v14 = (void *)objc_opt_new();
  if (v103)
  {
    if (self->_userBodyPoseGuidance)
    {
      -[VGFrameSelector parseAtlasToCameraTransformation:](self, "parseAtlasToCameraTransformation:", v103);
      if ((_BYTE)v151)
      {
        objc_msgSend(v102, "cameraToDeviceTransform");
        v19 = 0;
        v144 = *(_OWORD *)buf;
        v145 = *(_OWORD *)&buf[16];
        v146 = v149;
        v147 = v150;
        do
        {
          *(float32x4_t *)&v155[v19] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v15, COERCE_FLOAT(*(__int128 *)((char *)&v144 + v19))), v16, *(float32x2_t *)((char *)&v144 + v19), 1), v17, *(float32x4_t *)((char *)&v144 + v19), 2), v18, *(float32x4_t *)((char *)&v144 + v19), 3);
          v19 += 16;
        }
        while (v19 != 64);
        v98 = *(double *)&v156;
        v100 = *(double *)v155;
        v95 = *(double *)&v158;
        v96 = *(double *)&v157;
        userBodyPoseGuidance = self->_userBodyPoseGuidance;
        objc_msgSend(v102, "skeleton");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v102)
          objc_msgSend(v102, "timestamp");
        else
          memset(&time, 0, sizeof(time));
        -[VGUserBodyPoseGuidance calculatePoseGuidanceFromSkeleton:andAtlasToDeviceTransform:atTimestamp:](userBodyPoseGuidance, "calculatePoseGuidanceFromSkeleton:andAtlasToDeviceTransform:atTimestamp:", v21, v100, v98, v96, v95, CMTimeGetSeconds(&time));
        v101 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v101, "frameState");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setBodyPoseFrameState:", v25);

        if (v101)
        {
          objc_msgSend(v101, "rejection");
          v26 = *((_QWORD *)&v156 + 1);
        }
        else
        {
          v26 = 0;
          *(_OWORD *)v155 = 0u;
          v156 = 0u;
        }
        objc_msgSend(v14, "addDebugDataForKey:debugData:", CFSTR("poseGuidance"), v26);

LABEL_23:
        requiredPosesCount = self->_requiredPosesCount;
        if (requiredPosesCount)
        {
          v28 = 0;
          v29 = *(float *)a4;
          v30 = *((float *)a4 + 1);
          v31 = (float *)((char *)self->_targetPosesData.__begin_ + 96);
          v32 = 0.0;
          v33 = -1;
          do
          {
            if (*(v31 - 3) <= v29 && *(v31 - 2) >= v29 && *(v31 - 1) <= v30 && *v31 >= v30)
            {
              v34 = vmulq_f32(*((float32x4_t *)a4 + 1), *(float32x4_t *)(v31 - 24));
              v35 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v34, 2), vaddq_f32(v34, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v34.f32, 1))).f32[0];
              if (v35 > v32)
              {
                v32 = v35;
                v33 = v28;
              }
            }
            ++v28;
            v31 += 28;
          }
          while (requiredPosesCount != v28);
          v36 = self;
          v138 = v36;
          if (v33 != -1)
          {
            v37 = v36;
            begin = self->_targetPosesData.__begin_;
            VGLogVGFrameSelector();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v39))
            {
              if (*((_BYTE *)begin + 112 * v33 + 80))
                v40 = CFSTR("true");
              else
                v40 = CFSTR("false");
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v40;
              _os_signpost_emit_with_name_impl(&dword_249CAD000, v39, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ProcessHeadPose_PoseFilters", "isFrontPose:%{public}@", buf, 0xCu);
            }

            v133[0] = MEMORY[0x24BDAC760];
            v133[1] = 3221225472;
            v133[2] = __93__VGFrameSelector_processHeadPose_captureData_trackingData_validDataBounds_frameTimestampMS___block_invoke_504;
            v133[3] = &__block_descriptor_40_e5_v8__0l;
            v133[4] = (char *)begin + 112 * v33;
            v97 = (void (**)(_QWORD))MEMORY[0x24BD03294](v133);
            v41 = (char *)begin + 112 * v33;
            v43 = *((_DWORD *)v41 + 16);
            v42 = (unsigned int *)(v41 + 64);
            if (v43)
              v44 = CFSTR("pitch");
            else
              v44 = CFSTR("yaw");
            v99 = v44;
            __VGLogSharedInstance();
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218498;
              *(_QWORD *)&buf[4] = v8;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v99;
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = v33;
              _os_log_impl(&dword_249CAD000, v45, OS_LOG_TYPE_DEBUG, " Frame#%zu acquired by %@ selector with poseIdx %d ", buf, 0x1Cu);
            }

            objc_msgSend(v14, "setPoseIndex:", v33);
            objc_msgSend(v14, "setMotionType:", *v42);
            *(_OWORD *)buf = *((_OWORD *)begin + 7 * v33);
            v46 = (char *)begin + 112 * v33;
            v48 = (void *)*((_QWORD *)v46 + 2);
            v47 = v46 + 16;
            *(_QWORD *)&buf[16] = v48;
            v149 = *((_OWORD *)v47 + 1);
            v49 = *((_OWORD *)v47 + 2);
            v50 = *((_OWORD *)v47 + 3);
            v51 = *((_OWORD *)v47 + 4);
            v153 = *((_DWORD *)v47 + 20);
            v151 = v50;
            v152 = v51;
            v150 = v49;
            v154 = 1;
            -[VGFrameSelector processHeadPose:captureData:trackingData:validDataBounds:frameTimestampMS:]::$_3::operator()((id *)&v138, v102, (double *)a4, (uint64_t)buf, a7, v8, v14);
            if (v154)

            if (v14)
            {
              objc_msgSend(v14, "rejectionState");
              v52 = *(_DWORD *)buf == 0;

              if (!v52)
              {
                v53 = v14;
LABEL_94:

                v97[2](v97);
                self = v138;
LABEL_95:

                goto LABEL_96;
              }
            }
            else
            {
              memset(buf, 0, sizeof(buf));

            }
            -[VGFrameSelector applyVisionFaceLandmarksFilter:bestTargetPoseData:frameTimestampMS:](v37, "applyVisionFaceLandmarksFilter:bestTargetPoseData:frameTimestampMS:", v102, (char *)begin + 112 * v33, v8);
            if (*(_DWORD *)buf)
            {
              v129 = *(_DWORD *)buf;
              v57 = *(id *)&buf[8];
              v130 = v57;
              v131 = *(_QWORD *)&buf[16];
              v58 = *(id *)&buf[24];
              v132 = v58;
              if (v14)
              {
                objc_msgSend(v14, "setRejectionState:", &v129);
              }
              else
              {

              }
              v62 = v14;
              goto LABEL_93;
            }
            v128 = 1.0;
            -[VGFrameSelector applyExpressionFilters:trackingData:frameTimestampMS:score:](v37, "applyExpressionFilters:trackingData:frameTimestampMS:score:", (char *)begin + 112 * v33, v103, v8, &v128);
            if (*(_DWORD *)v155)
            {
              v124 = *(_DWORD *)v155;
              v60 = *(id *)&v155[8];
              v125 = v60;
              v126 = v156;
              v61 = *((id *)&v156 + 1);
              v127 = v61;
              if (v14)
              {
                objc_msgSend(v14, "setRejectionState:", &v124);
              }
              else
              {

              }
              goto LABEL_91;
            }
            v63 = v128;
            v64 = (float *)((char *)begin + 112 * v33);
            v66 = v64[15];
            v65 = v64 + 15;
            v67 = v66;
            if (v128 < v66)
            {
              v120 = 23;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("lower score [%g < %g]"), v128, v67);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              v122 = 0;
              v123 = 0;
              v121 = v68;
              if (v14)
              {
                objc_msgSend(v14, "setRejectionState:", &v120);
LABEL_91:
                v90 = v14;
LABEL_92:

LABEL_93:
                goto LABEL_94;
              }
              goto LABEL_90;
            }
            v69 = (char *)begin + 112 * v33;
            v70 = v69[52];
            if (v69[52])
            {
              v71 = (float *)((char *)begin + 112 * v33);
              v72 = acosf(v71[12]);
              *(float *)&v59 = cosf(v72 + v71[14]);
            }
            else
            {
              LODWORD(v59) = -1.0;
            }
            if (v63 == v67 && v32 <= *(float *)&v59)
            {
              v116 = 25;
              v73 = *(float *)&v59;
              if (v70)
                v74 = *((float *)begin + 28 * v33 + 12);
              else
                v74 = -1.0;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("lower alignment [%g <= %g] (tolerance (radians): %g, best alignment: %g)"), v32, *(_QWORD *)&v73, *((float *)begin + 28 * v33 + 14), *(_QWORD *)&v74);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              v118 = 0;
              v119 = 0;
              v117 = v68;
              if (v14)
              {
                objc_msgSend(v14, "setRejectionState:", &v116);
                goto LABEL_91;
              }
LABEL_90:

              goto LABEL_91;
            }
            -[VGFrameSelector applyVisionFilters:bestTargetPoseData:frameTimestampMS:](v37, "applyVisionFilters:bestTargetPoseData:frameTimestampMS:", v102, (char *)begin + 112 * v33, v8, v59);
            if ((_DWORD)v144)
            {
              v112 = v144;
              v75 = *((id *)&v144 + 1);
              v113 = v75;
              v114 = v145;
              v76 = *((id *)&v145 + 1);
              v115 = v76;
              if (v14)
              {
                v77 = &v112;
LABEL_102:
                objc_msgSend(v14, "setRejectionState:", v77);
LABEL_105:
                v94 = v14;

                goto LABEL_92;
              }
              v87 = v76;
            }
            else
            {
              if (!*((_BYTE *)begin + 112 * v33 + 80))
                goto LABEL_97;
              if (!v101)
                goto LABEL_97;
              objc_msgSend(v101, "frameState");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "aggregatedScore");
              v80 = v79;
              objc_msgSend(*(id *)v47, "bodyPoseFrameState");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v81, "aggregatedScore");
              v83 = v80 < v82;

              if (!v83)
              {
LABEL_97:
                v92 = (char *)begin + 112 * v33;
                v93 = (float *)(v92 + 48);
                if (v92[52] && *v93 >= v32)
                  v32 = *v93;
                *v93 = v32;
                v92[52] = 1;
                *v65 = v128;
                v104 = 0;
                v106 = 0;
                v107 = 0;
                v105 = 0;
                if (!v14)
                  goto LABEL_105;
                v77 = &v104;
                goto LABEL_102;
              }
              v108 = 41;
              v84 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v101, "frameState");
              v75 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "aggregatedScore");
              v86 = v85;
              objc_msgSend(*(id *)v47, "bodyPoseFrameState");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "aggregatedScore");
              objc_msgSend(v84, "stringWithFormat:", CFSTR("lower body pose aggregated score [%g < %g]"), v86, v88);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              v110 = 0;
              v111 = 0;
              v109 = v89;
              if (v14)
                objc_msgSend(v14, "setRejectionState:", &v108);
              else

            }
            goto LABEL_105;
          }
        }
        else
        {
          v138 = self;
        }
        if (!-[VGFrameSelectorOptions useDepthFovFilterForBadAlignment](self->_options, "useDepthFovFilterForBadAlignment"))goto LABEL_54;
        buf[0] = 0;
        v154 = 0;
        -[VGFrameSelector processHeadPose:captureData:trackingData:validDataBounds:frameTimestampMS:]::$_3::operator()((id *)&v138, v102, (double *)a4, (uint64_t)buf, a7, v8, v14);
        if (v154)

        if (!v14
          || (objc_msgSend(v14, "rejectionState"),
              v54 = *(_DWORD *)buf == 0,
              *(id *)&buf[24],
              *(id *)&buf[8],
              v54))
        {
LABEL_54:
          v134 = 24;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("bad alignment [yaw %g pitch %g] with all target poses"), *(float *)a4, *((float *)a4 + 1));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v136 = 0;
          v137 = 0;
          v135 = v55;
          if (v14)
            objc_msgSend(v14, "setRejectionState:", &v134);
          else

        }
        v56 = v14;
        goto LABEL_95;
      }
      __VGLogSharedInstance();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v155 = 134217984;
        *(_QWORD *)&v155[4] = v8;
        _os_log_impl(&dword_249CAD000, v23, OS_LOG_TYPE_DEBUG, " Frame#%zu unable to parse atlasToCameraTransform, skipping Body Pose Guidance filter ", v155, 0xCu);
      }

    }
    v101 = 0;
    goto LABEL_23;
  }
  v140 = 2;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("no tracking data"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = 0;
  v143 = 0;
  v141 = v22;
  if (v14)
    objc_msgSend(v14, "setRejectionState:", &v140);
  else

  v24 = v14;
LABEL_96:

  __93__VGFrameSelector_processHeadPose_captureData_trackingData_validDataBounds_frameTimestampMS___block_invoke();
  return v14;
}

void __93__VGFrameSelector_processHeadPose_captureData_trackingData_validDataBounds_frameTimestampMS___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  VGLogVGFrameSelector();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ProcessHeadPose", (const char *)&unk_249D51699, v1, 2u);
  }

}

- (void)processHeadPose:captureData:trackingData:validDataBounds:frameTimestampMS:
{
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  int v18;
  id v19;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;

  v13 = a2;
  v14 = a7;
  if (*(_BYTE *)(a5 + 32))
  {
    if (*a1)
    {
      objc_msgSend(*a1, "checkDepthFoVFilter:framePose:bestTargetPoseData:validDataBounds:frameTimestampMS:", v13, a4, a5, a6, a3[4], a3[6], a3[8], a3[10]);
      v15 = *((_QWORD *)&v23 + 1);
    }
    else
    {
      v15 = 0;
      v22 = 0u;
      v23 = 0u;
    }
    objc_msgSend(v14, "addDebugDataForKey:debugData:", CFSTR("depthFovFilter"), v15);
    if ((_DWORD)v22)
    {
      v18 = v22;
      v16 = *((id *)&v22 + 1);
      v19 = v16;
      v20 = v23;
      v17 = *((id *)&v23 + 1);
      v21 = v17;
      if (v14)
      {
        objc_msgSend(v14, "setRejectionState:", &v18);
      }
      else
      {

      }
    }

  }
}

void __93__VGFrameSelector_processHeadPose_captureData_trackingData_validDataBounds_frameTimestampMS___block_invoke_504(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  VGLogVGFrameSelector();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 80))
      v3 = CFSTR("true");
    else
      v3 = CFSTR("false");
    v4 = 138543362;
    v5 = v3;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ProcessHeadPose_PoseFilters", "isFrontPose:%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

- (optional<simd_float4x4>)parseAtlasToCameraTransformation:(id)a3
{
  _BYTE *v3;
  _BYTE *v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t i;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  _OWORD *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  float v20;
  void *v21;
  void *v22;
  void *v23;
  int32x4_t v24;
  void *v25;
  int32x4_t v26;
  void *v27;
  int32x4_t v28;
  void *v29;
  int32x4_t v30;
  float32x4_t v31;
  uint64_t v32;
  int32x4_t v33;
  int32x4_t v34;
  int32x4_t v35;
  int32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  uint64_t v41;
  __int128 v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  char v49;
  optional<simd_float4x4> v50;
  int32x4_t v51;
  int32x4_t v52;
  int32x4_t v53;
  int32x4_t v54;
  _BYTE *v55;
  void *v56;
  void *v57;
  float32x4_t v58;
  float32x4_t v59;
  float32x4_t v60;
  _OWORD v61[4];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[16];
  __int128 v67;
  __int128 v68;
  __int128 v69;

  v4 = v3;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("tracked_faces"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v57, "count"))
  {
    __VGLogSharedInstance();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = " Could not extract atlas joint. No Faces tracked ";
      goto LABEL_7;
    }
LABEL_8:

    *v4 = 0;
    v4[64] = 0;
    goto LABEL_26;
  }
  if ((unint64_t)objc_msgSend(v57, "count") >= 2)
  {
    __VGLogSharedInstance();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = " Could not extract atlas joint. Multiple faces tracked in FaceKitDictionary. Discarding all. ";
LABEL_7:
      _os_log_impl(&dword_249CAD000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  objc_msgSend(v57, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("raw_data"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("pose"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v55 = v4;
    v9 = v7;
    for (i = 0; i != 3; ++i)
    {
      for (j = 0; j != 3; ++j)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("rotation"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "floatValue");
        v15 = &v61[i];
        *((_DWORD *)v15 + j) = v16;

      }
      *((_DWORD *)v15 + 3) = 0;
    }
    v17 = 0;
    v58 = (float32x4_t)v61[3];
    v7 = v9;
    do
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("translation"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "floatValue");
      v60 = v58;
      *(float *)((unint64_t)&v60 & 0xFFFFFFFFFFFFFFF3 | (4 * (v17 & 3))) = v20 * 0.001;
      v58 = v60;

      ++v17;
    }
    while (v17 != 3);
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kAtlasToFaceKitTransform"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "vg_float4ByInvokingFloatValue");
      v54 = v24;

      objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "vg_float4ByInvokingFloatValue");
      v53 = v26;

      objc_msgSend(v22, "objectAtIndexedSubscript:", 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "vg_float4ByInvokingFloatValue");
      v52 = v28;

      objc_msgSend(v22, "objectAtIndexedSubscript:", 3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "vg_float4ByInvokingFloatValue");
      v51 = v30;
      v31 = v58;
      v31.i32[3] = 1.0;
      v59 = v31;

      v32 = 0;
      v33 = vzip1q_s32(v54, v52);
      v34 = vzip2q_s32(v54, v52);
      v35 = vzip1q_s32(v53, v51);
      v36 = vzip2q_s32(v53, v51);
      v37 = (float32x4_t)vzip1q_s32(v33, v35);
      v38 = (float32x4_t)vzip2q_s32(v33, v35);
      v39 = (float32x4_t)vzip1q_s32(v34, v36);
      v40 = (float32x4_t)vzip2q_s32(v34, v36);
      v62 = xmmword_249D3A940;
      v63 = xmmword_249D3A950;
      v64 = xmmword_249D3A960;
      v65 = xmmword_249D3A970;
      do
      {
        *(float32x4_t *)&buf[v32] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v37, COERCE_FLOAT(*(__int128 *)((char *)&v62 + v32))), v38, *(float32x2_t *)((char *)&v62 + v32), 1), v39, *(float32x4_t *)((char *)&v62 + v32), 2), v40, *(float32x4_t *)((char *)&v62 + v32), 3);
        v32 += 16;
      }
      while (v32 != 64);
      v41 = 0;
      v42 = v69;
      HIDWORD(v42) = 1.0;
      v43 = (float32x4_t)v61[0];
      v44 = (float32x4_t)v61[1];
      v45 = (float32x4_t)v61[2];
      v62 = *(_OWORD *)buf;
      v63 = v67;
      v64 = v68;
      v65 = v42;
      do
      {
        *(float32x4_t *)&buf[v41] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v43, COERCE_FLOAT(*(__int128 *)((char *)&v62 + v41))), v44, *(float32x2_t *)((char *)&v62 + v41), 1), v45, *(float32x4_t *)((char *)&v62 + v41), 2), v59, *(float32x4_t *)((char *)&v62 + v41), 3);
        v41 += 16;
      }
      while (v41 != 64);
      v46 = v67;
      v47 = v68;
      v48 = v69;
      *(_OWORD *)v55 = *(_OWORD *)buf;
      *((_OWORD *)v55 + 1) = v46;
      *((_OWORD *)v55 + 2) = v47;
      *((_OWORD *)v55 + 3) = v48;
      v49 = 1;
    }
    else
    {
      v49 = 0;
      *v55 = 0;
    }
    v55[64] = v49;

  }
  else
  {
    *v4 = 0;
    v4[64] = 0;
  }

LABEL_26:
  return v50;
}

- (id)processCaptureData:(int32x4_t)a3 trackingData:(int32x4_t)a4 framePose:(float32x4_t)a5 validDataFrameBounds:(uint64_t)a6
{
  void *v9;
  NSObject *v13;
  double Seconds;
  NSObject *v15;
  unint64_t v16;
  int32x4_t v17;
  float32x2_t v18;
  float32x2_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float v22;
  double v23;
  float v24;
  float v25;
  NSObject *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  int v30;
  float v31;
  float v32;
  float v33;
  NSObject *v34;
  float v35;
  void *v36;
  double v37;
  void *v38;
  double v39;
  uint64_t *v40;
  __CVBuffer *v41;
  double v42;
  void *v43;
  int v44;
  std::string *p_p;
  void *v46;
  __CFString *v47;
  int v48;
  const __CFString *v49;
  NSDictionary *v50;
  double v51;
  vg::shared::VisualLogger *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double *v58;
  uint64_t v59;
  uint64_t v60;
  float *v61;
  double v62;
  uint64_t v63;
  unsigned __int8 *v64;
  __CVBuffer *v65;
  __CVBuffer *ZeroPixelBuffer;
  double v67;
  double v68;
  uint64_t v69;
  _DWORD *v70;
  int v71;
  __CFString *v72;
  NSObject *v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  double v81;
  uint64_t v82;
  void **v83;
  void *v84;
  void *v85;
  int v86;
  void *v87;
  id v89;
  float32x4_t v94;
  __CFString *v95;
  id v96;
  CMTime v97;
  CMTime v98;
  CMTime v99;
  std::string __p;
  id v101;
  CMTime v102;
  _DWORD v103[2];
  uint64_t v104;
  float32x4_t v105;
  int32x4_t v106;
  int32x4_t v107;
  int32x4_t v108;
  float32x4_t v109;
  _DWORD v110[2];
  uint64_t v111;
  float32x4_t v112;
  int32x4_t v113;
  int32x4_t v114;
  int32x4_t v115;
  float32x4_t v116;
  CMTime time;
  _QWORD v118[3];
  _QWORD v119[3];
  uint8_t buf[32];
  __int16 v121;
  double v122;
  __int16 v123;
  double v124;
  __int16 v125;
  double v126;
  uint64_t v127;

  v127 = *MEMORY[0x24BDAC8D0];
  v96 = a7;
  v89 = a8;
  VGLogVGFrameSelector();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ProcessCaptureData", (const char *)&unk_249D51699, buf, 2u);
  }

  if (v96)
    objc_msgSend(v96, "timestamp");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);
  __VGLogSharedInstance();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (unint64_t)(Seconds * 1000.0);
  v17 = (int32x4_t)vmulq_f32(a5, a5);
  v17.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v17, 2), vadd_f32(*(float32x2_t *)v17.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v17.i8, 1))).u32[0];
  v18 = vrsqrte_f32((float32x2_t)v17.u32[0]);
  v19 = vmul_f32(v18, vrsqrts_f32((float32x2_t)v17.u32[0], vmul_f32(v18, v18)));
  v20 = vmulq_n_f32(a5, vmul_f32(v19, vrsqrts_f32((float32x2_t)v17.u32[0], vmul_f32(v19, v19))).f32[0]);
  v21 = (float32x4_t)vtrn2q_s32(a2, a3);
  v21.i32[2] = a4.i32[1];
  v94 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)vzip1q_s32(vzip1q_s32(a2, a4), a3), v20.f32[0]), v21, *(float32x2_t *)v20.f32, 1), (float32x4_t)vzip1q_s32(vzip2q_s32(a2, a4), vdupq_laneq_s32(a3, 2)), v20, 2);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v22 = (float)(asinf(v94.f32[0]) * 180.0) / 3.14159265;
    v23 = v22;
    v24 = asinf(v94.f32[1]);
    *(_DWORD *)buf = 134219265;
    *(_QWORD *)&buf[4] = (unint64_t)(Seconds * 1000.0);
    *(_WORD *)&buf[12] = 2049;
    *(double *)&buf[14] = a5.f32[0];
    *(_WORD *)&buf[22] = 2049;
    *(double *)&buf[24] = a5.f32[1];
    v25 = (float)(v24 * 180.0) / 3.14159265;
    v121 = 2049;
    v122 = a5.f32[2];
    v123 = 2049;
    v124 = v23;
    v125 = 2049;
    v126 = v25;
    _os_log_impl(&dword_249CAD000, v15, OS_LOG_TYPE_DEBUG, " Frame#%zu acquired by pose selector with position x:%{private}g y:%{private}g z:%{private}g view direction x:%{private}g y:%{private}g ", buf, 0x3Eu);
  }

  __VGLogSharedInstance();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v96, "allFaces");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v28 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v96, "allFaces");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = CFSTR("n/a");
    }
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = (unint64_t)(Seconds * 1000.0);
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v29;
    _os_log_impl(&dword_249CAD000, v26, OS_LOG_TYPE_DEBUG, " Frame#%zu number of face bounding boxes: %@  ", buf, 0x16u);
    if (v27)
    {

    }
  }

  v30 = objc_msgSend(v96, "mirrored");
  v31 = (float)(atan2f(-v94.f32[0], v94.f32[2]) * 180.0) / 3.14159265;
  if (v30)
    v32 = -v31;
  else
    v32 = v31;
  v33 = asinf(v94.f32[1]);
  __VGLogSharedInstance();
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (float)(v33 * -180.0) / 3.14159265;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218497;
    *(_QWORD *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2049;
    *(double *)&buf[14] = v32;
    *(_WORD *)&buf[22] = 2049;
    *(double *)&buf[24] = v35;
    _os_log_impl(&dword_249CAD000, v34, OS_LOG_TYPE_DEBUG, " Frame#%zu [yaw pitch] (degrees): [%{private}g %{private}g] ", buf, 0x20u);
  }

  if (objc_msgSend(*(id *)(a1 + 40), "useSimpleSelector"))
  {
    *(float *)v110 = v32;
    *(float *)&v110[1] = v35;
    v111 = 0;
    v112 = v94;
    v113 = a2;
    v114 = a3;
    v115 = a4;
    v116 = a5;
    objc_msgSend((id)a1, "processHeadPoseSimple:frameTimestampMS:", v110, v16);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    *(float *)v103 = v32;
    *(float *)&v103[1] = v35;
    v104 = 0;
    v105 = v94;
    v106 = a2;
    v107 = a3;
    v108 = a4;
    v109 = a5;
    objc_msgSend((id)a1, "processHeadPose:captureData:trackingData:validDataBounds:frameTimestampMS:", v103, v96, v89, a9, v16);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38 = v36;
  *(float *)&v37 = v32;
  objc_msgSend(v36, "setYawInDegrees:", v37);
  *(float *)&v39 = v35;
  v40 = vg::shared::VisualLogger::sharedLogger((vg::shared::VisualLogger *)objc_msgSend(v38, "setPitchInDegrees:", v39));
  v41 = (__CVBuffer *)objc_msgSend(v96, "rgbRectified");
  if (v96)
    objc_msgSend(v96, "timestamp");
  else
    memset(&v102, 0, sizeof(v102));
  v42 = CMTimeGetSeconds(&v102);
  vg::shared::VisualLogger::logPixelBuffer((vg::shared::VisualLogger *)v40, v41, v42, CFSTR("visage.frameSelection.candidateFrames"), 0);
  v43 = (void *)MEMORY[0x24BDD17C8];
  if (v38)
  {
    objc_msgSend(v38, "rejectionState");
    v44 = *(_DWORD *)buf;
  }
  else
  {
    v44 = 0;
    memset(buf, 0, sizeof(buf));
  }
  vg::frame_selection::frameRejectionReasonToString(v44, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(v43, "stringWithFormat:", CFSTR("%s"), p_p);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  if (v38)
  {
    objc_msgSend(v38, "rejectionState");
    if (*(_QWORD *)&buf[8])
    {
      objc_msgSend(v38, "rejectionState");
      v47 = (__CFString *)(id)__p.__r_.__value_.__l.__size_;

      goto LABEL_39;
    }
  }
  else
  {
    memset(buf, 0, sizeof(buf));
  }
  v47 = CFSTR("None");
LABEL_39:

  v118[0] = CFSTR("picked");
  v48 = objc_msgSend(v38, "isSuccessful");
  v49 = CFSTR("no");
  if (v48)
    v49 = CFSTR("yes");
  v119[0] = v49;
  v119[1] = v46;
  v118[1] = CFSTR("reason");
  v118[2] = CFSTR("description");
  v119[2] = v47;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v119, v118, 3);
  v50 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  if (v96)
    objc_msgSend(v96, "timestamp");
  else
    memset(&v99, 0, sizeof(v99));
  v51 = CMTimeGetSeconds(&v99);
  vg::shared::VisualLogger::logDictionary((vg::shared::VisualLogger *)v40, v50, v51, CFSTR("visage.frameSelection.rejectionStates"), 0);

  v53 = vg::shared::VisualLogger::sharedLogger(v52);
  if ((objc_msgSend(v38, "isSuccessful") & 1) != 0)
  {
    v54 = a1;
    v55 = objc_msgSend(v38, "poseIndex");
    v56 = *(_QWORD *)(a1 + 8);
    v57 = v56 + 112 * v55;
    v59 = *(_QWORD *)(v57 + 72);
    v58 = (double *)(v57 + 72);
    objc_msgSend(v38, "setTargetAngleId:", v59);
    v60 = v56 + 112 * v55;
    LODWORD(v59) = *(_DWORD *)(v60 + 68);
    v61 = (float *)(v60 + 68);
    LODWORD(v62) = v59;
    objc_msgSend(v38, "setAngleInDegrees:", v62);
    v63 = v56 + 112 * v55;
    LODWORD(v59) = *(unsigned __int8 *)(v63 + 80);
    v64 = (unsigned __int8 *)(v63 + 80);
    if ((_DWORD)v59
      && vg::shared::VisualLogger::isLoggerEnabled((vg::shared::VisualLogger *)v53, CFSTR("visage.frameSelection.selectedFramesFrontPose")))
    {
      v65 = (__CVBuffer *)objc_msgSend(v96, "rgbRectified");
      if (v96)
        objc_msgSend(v96, "timestamp");
      else
        memset(&v97, 0, sizeof(v97));
      v68 = CMTimeGetSeconds(&v97);
      vg::shared::VisualLogger::logPixelBuffer((vg::shared::VisualLogger *)v53, v65, v68, CFSTR("visage.frameSelection.selectedFramesFrontPose"), 0);
    }
    v69 = v56 + 112 * v55;
    v71 = *(_DWORD *)(v69 + 64);
    v70 = (_DWORD *)(v69 + 64);
    if (v71)
      v72 = CFSTR("pitch");
    else
      v72 = CFSTR("yaw");
    v95 = v72;
    __VGLogSharedInstance();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
    {
      v74 = *v61;
      v75 = *v58;
      *(_DWORD *)buf = 134218755;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v95;
      *(_WORD *)&buf[22] = 2049;
      *(double *)&buf[24] = v74;
      v121 = 2049;
      v122 = v75;
      _os_log_impl(&dword_249CAD000, v73, OS_LOG_TYPE_DEBUG, " Frame#%zu selected by %@ selector with angle:%{private}f target angle index:%{private}zu ", buf, 0x2Au);
    }

    v76 = (void *)objc_opt_new();
    v77 = (void *)objc_msgSend(v96, "copy");
    objc_msgSend(v76, "setCaptureData:", v77);

    objc_msgSend(v76, "setTrackingData:", v89);
    objc_msgSend(v76, "setFrontPose:", *v64);
    objc_msgSend(v38, "bodyPoseFrameState");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setBodyPoseFrameState:", v78);

    if (*v70)
      *(float *)&v79 = v35;
    else
      *(float *)&v79 = v32;
    objc_msgSend(v76, "setSelectedAngle:", v79);
    *(float *)&v80 = v35;
    objc_msgSend(v76, "setSelectedPitch:", v80);
    *(float *)&v81 = v32;
    objc_msgSend(v76, "setSelectedYaw:", v81);
    v82 = v56 + 112 * v55;
    v84 = *(void **)(v82 + 16);
    v83 = (void **)(v82 + 16);
    +[VGFrameSelector invalidPose](VGFrameSelector, "invalidPose");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v84, "isEqual:", v85);

    if (v86)
      --*(_QWORD *)(v54 + 64);
    v87 = *v83;
    *v83 = v76;

  }
  else if (vg::shared::VisualLogger::isLoggerEnabled((vg::shared::VisualLogger *)v53, CFSTR("visage.frameSelection.selectedFramesFrontPose")))
  {
    ZeroPixelBuffer = createZeroPixelBuffer(1uLL, 1uLL);
    if (ZeroPixelBuffer)
    {
      if (v96)
        objc_msgSend(v96, "timestamp");
      else
        memset(&v98, 0, sizeof(v98));
      v67 = CMTimeGetSeconds(&v98);
      vg::shared::VisualLogger::logPixelBuffer((vg::shared::VisualLogger *)v53, ZeroPixelBuffer, v67, CFSTR("visage.frameSelection.selectedFramesFrontPose"), 0);
    }
    CVPixelBufferRelease(ZeroPixelBuffer);
  }
  __82__VGFrameSelector_processCaptureData_trackingData_framePose_validDataFrameBounds___block_invoke();

  return v38;
}

void __82__VGFrameSelector_processCaptureData_trackingData_framePose_validDataFrameBounds___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  VGLogVGFrameSelector();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ProcessCaptureData", (const char *)&unk_249D51699, v1, 2u);
  }

}

- (id)resultsForMotionType:(optional<vg::frame_selection::MotionType>)a3
{
  void *v5;
  double v6;
  unint64_t requiredPosesCount;
  uint64_t v8;
  unint64_t i;
  TargetPoseData *begin;
  uint64_t v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", self->_requiredPosesCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  requiredPosesCount = self->_requiredPosesCount;
  if (requiredPosesCount)
  {
    v8 = 0;
    for (i = 0; i < requiredPosesCount; ++i)
    {
      begin = self->_targetPosesData.__begin_;
      if ((*(_QWORD *)&a3 & 0xFF00000000) == 0 || *(_DWORD *)((char *)begin + v8 + 64) == a3.var0.var1)
      {
        v11 = *(_QWORD *)((char *)begin + v8 + 16);
        LODWORD(v6) = *(_DWORD *)((char *)begin + v8 + 68);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);

        requiredPosesCount = self->_requiredPosesCount;
      }
      v8 += 112;
    }
  }
  return v5;
}

- (NSDictionary)results
{
  return (NSDictionary *)-[VGFrameSelector resultsForMotionType:](self, "resultsForMotionType:", 0);
}

- (NSDictionary)yawResults
{
  return (NSDictionary *)-[VGFrameSelector resultsForMotionType:](self, "resultsForMotionType:", 0x100000000);
}

- (NSDictionary)pitchResults
{
  return (NSDictionary *)-[VGFrameSelector resultsForMotionType:](self, "resultsForMotionType:", 0x100000001);
}

- (id)selectedValidPosesForMotion:(optional<vg::frame_selection::MotionType>)a3
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  TargetPoseData *begin;
  double v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", self->_requiredPosesCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_requiredPosesCount)
  {
    v6 = 0;
    v7 = 0;
    do
    {
      begin = self->_targetPosesData.__begin_;
      if ((*(_QWORD *)&a3 & 0xFF00000000) == 0 || *(_DWORD *)((char *)begin + v6 + 64) == a3.var0.var1)
      {
        if (objc_msgSend(*(id *)((char *)begin + v6 + 16), "valid"))
        {
          v10 = *(_QWORD *)((char *)begin + v6 + 16);
          LODWORD(v9) = *(_DWORD *)((char *)begin + v6 + 68);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, v11);

        }
      }
      ++v7;
      v6 += 112;
    }
    while (v7 < self->_requiredPosesCount);
  }
  return v5;
}

- (id)selectedYawValidPoses
{
  return -[VGFrameSelector selectedValidPosesForMotion:](self, "selectedValidPosesForMotion:", 0x100000000);
}

- (id)selectedPitchValidPoses
{
  return -[VGFrameSelector selectedValidPosesForMotion:](self, "selectedValidPosesForMotion:", 0x100000001);
}

- (BOOL)completed
{
  return self->_remainingPosesCount == 0;
}

- (BOOL)completedYaw
{
  VGFrameSelector *v2;
  void *v3;
  uint64_t v4;

  v2 = self;
  -[VGFrameSelector selectedYawValidPoses](self, "selectedYawValidPoses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  LOBYTE(v2) = v4 == -[VGFrameSelectorOptions yawFrameCount](v2->_options, "yawFrameCount");

  return (char)v2;
}

- (BOOL)completedPitch
{
  VGFrameSelector *v2;
  void *v3;
  uint64_t v4;

  v2 = self;
  -[VGFrameSelector selectedPitchValidPoses](self, "selectedPitchValidPoses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  LOBYTE(v2) = v4 == -[VGFrameSelectorOptions pitchFrameCount](v2->_options, "pitchFrameCount");

  return (char)v2;
}

- (unint64_t)requiredPosesCount
{
  return self->_requiredPosesCount;
}

- (unint64_t)remainingPosesCount
{
  return self->_remainingPosesCount;
}

- (void).cxx_destruct
{
  vector<TargetPoseData, std::allocator<TargetPoseData>> *p_targetPosesData;

  objc_storeStrong((id *)&self->_userBodyPoseGuidance, 0);
  objc_storeStrong((id *)&self->_options, 0);
  p_targetPosesData = &self->_targetPosesData;
  std::vector<TargetPoseData>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_targetPosesData);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
