@implementation _VLStatistics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_VLStatistics)initWithStats:(id *)a3
{
  _VLStatistics *v4;
  _VLStatistics *v5;
  _VLStatistics *v6;
  _VLStatistics *result;
  objc_super v8;
  uint8_t buf[16];

  if (a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)_VLStatistics;
    v4 = -[_VLStatistics init](&v8, sel_init);
    v5 = v4;
    if (v4)
    {
      memcpy(&v4->_stats, a3, sizeof(v4->_stats));
      v6 = v5;
    }

    return v5;
  }
  else
  {
    result = (_VLStatistics *)os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if ((_DWORD)result)
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_210B26000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Assertion failed: stats != ((void *)0)", buf, 2u);
    }
    __break(1u);
  }
  return result;
}

- (_VLStatistics)initWithCoder:(id)a3
{
  id v4;
  const void *v5;
  id v6;
  const void *v7;
  double *v8;
  const void *v9;
  float *v10;
  const void *v11;
  int *v12;
  const void *v13;
  signed __int16 *v14;
  const void *v15;
  float *v16;
  const void *v17;
  float *v18;
  const void *v19;
  vl_tile_t *v20;
  id v21;
  const void *v22;
  float *v23;
  const void *v24;
  char *v25;
  const void *v26;
  signed __int16 *v27;
  uint64_t num_slam_pt3s;
  signed __int16 *slam_tracks_len;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void **v40;
  uint64_t *v41;
  void *v42;
  void *v43;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void **v49;
  uint64_t *v50;
  int64x2_t v51;
  int64x2_t v52;
  int16x4_t *v53;
  uint64_t v54;
  int64x2_t v55;
  int64x2_t v56;
  int64x2_t v57;
  int64x2_t v58;
  int64x2_t v59;
  int64x2_t v60;
  int16x8_t v61;
  int32x4_t v62;
  int32x4_t v63;
  int32x4_t v64;
  int32x4_t v65;
  uint64_t v66;
  signed __int16 *v67;
  uint64_t v68;
  const void *v69;
  float *v70;
  const void *v71;
  signed __int16 *v72;
  const void *v73;
  signed __int16 *v74;
  const void *v75;
  int *v76;
  const void *v77;
  float *v78;
  const void *v79;
  float *v80;
  const void *v81;
  float *v82;
  const void *v83;
  double *v84;
  const void *v85;
  float *v86;
  const void *v87;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v88;
  const void *v89;
  int *v90;
  void *v91;
  void *v92;
  objc_super v93;
  _OWORD __dst[32];
  uint64_t v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  void *v135;
  uint64_t v136;
  void *v137;
  uint64_t v138;
  _QWORD v139[2];

  v139[1] = *MEMORY[0x24BDAC8D0];
  v95 = 0;
  v4 = objc_retainAutorelease(a3);
  v5 = (const void *)objc_msgSend(v4, "decodeBytesForKey:returnedLength:", CFSTR("statistics"), &v95);
  if (v95 != 504)
  {
    v32 = (void *)MEMORY[0x24BDD1540];
    v33 = *MEMORY[0x24BDD0B88];
    v138 = *MEMORY[0x24BDBD370];
    v139[0] = CFSTR("statistics bytes were not the expected length");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v139, &v138, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", v33, 4864, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v35);

LABEL_26:
    self = 0;
    goto LABEL_27;
  }
  memcpy(__dst, v5, 0x1F8uLL);
  memset(__dst, 0, 40);
  __dst[4] = 0uLL;
  *(_OWORD *)((char *)&__dst[6] + 8) = 0u;
  *(_OWORD *)((char *)&__dst[7] + 8) = 0u;
  __dst[12] = 0uLL;
  *(_OWORD *)((char *)&__dst[16] + 8) = 0u;
  *(_OWORD *)((char *)&__dst[13] + 8) = 0u;
  *(_OWORD *)((char *)&__dst[14] + 8) = 0u;
  *(_OWORD *)((char *)&__dst[15] + 8) = 0u;
  *((_QWORD *)&__dst[17] + 1) = 0;
  memcpy(&self->_stats, __dst, sizeof(self->_stats));
  v93.receiver = self;
  v93.super_class = (Class)_VLStatistics;
  self = -[_VLStatistics init](&v93, sel_init);
  if (self)
  {
    *(_QWORD *)&__dst[0] = 0;
    v6 = objc_retainAutorelease(v4);
    v7 = (const void *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("points3D"), __dst);
    if (*(_QWORD *)&__dst[0] == 8
                               * ((3 * self->_stats.num_inliers) & ~((3 * self->_stats.num_inliers) >> 31)))
    {
      v8 = (double *)malloc_type_malloc(*(size_t *)&__dst[0], 0xAF6A11AuLL);
      self->_stats.points3d = v8;
      memcpy(v8, v7, *(size_t *)&__dst[0]);
      *(_QWORD *)&__dst[0] = 0;
      v6 = objc_retainAutorelease(v6);
      v9 = (const void *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("points2D"), __dst);
      if (*(_QWORD *)&__dst[0] == 4
                                 * ((2 * self->_stats.num_inliers) & ~((2 * self->_stats.num_inliers) >> 31)))
      {
        v10 = (float *)malloc_type_malloc(*(size_t *)&__dst[0], 0xE4E916F3uLL);
        self->_stats.points2d = v10;
        memcpy(v10, v9, *(size_t *)&__dst[0]);
        *(_QWORD *)&__dst[0] = 0;
        v6 = objc_retainAutorelease(v6);
        v11 = (const void *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("inlierIndices"), __dst);
        if (*(_QWORD *)&__dst[0] == 4 * (self->_stats.num_inliers & ~(self->_stats.num_inliers >> 31)))
        {
          v12 = (int *)malloc_type_malloc(*(size_t *)&__dst[0], 0xE00A62B0uLL);
          self->_stats.inlier_indices = v12;
          memcpy(v12, v11, *(size_t *)&__dst[0]);
          *(_QWORD *)&__dst[0] = 0;
          v6 = objc_retainAutorelease(v6);
          v13 = (const void *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("slam_pt3s_inlier_idx"), __dst);
          if (*(_QWORD *)&__dst[0] == 2 * (self->_stats.num_inliers & ~(self->_stats.num_inliers >> 31)))
          {
            v14 = (signed __int16 *)malloc_type_malloc(*(size_t *)&__dst[0], 0x514B0DD1uLL);
            self->_stats.slam_pt3s_inlier_idx = v14;
            memcpy(v14, v13, *(size_t *)&__dst[0]);
            *(_QWORD *)&__dst[0] = 0;
            v6 = objc_retainAutorelease(v6);
            v15 = (const void *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("solverConf"), __dst);
            if (*(_QWORD *)&__dst[0] == 4 * (self->_stats.num_confs & ~(self->_stats.num_confs >> 31)))
            {
              v16 = (float *)malloc_type_malloc(*(size_t *)&__dst[0], 0x863F626EuLL);
              self->_stats.solver_conf = v16;
              memcpy(v16, v15, *(size_t *)&__dst[0]);
              *(_QWORD *)&__dst[0] = 0;
              v6 = objc_retainAutorelease(v6);
              v17 = (const void *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("fusedConf"), __dst);
              if (*(_QWORD *)&__dst[0] == 4
                                         * (self->_stats.num_confs & ~(self->_stats.num_confs >> 31)))
              {
                v18 = (float *)malloc_type_malloc(*(size_t *)&__dst[0], 0x26269347uLL);
                self->_stats.fused_conf = v18;
                memcpy(v18, v17, *(size_t *)&__dst[0]);
                *(_QWORD *)&__dst[0] = 0;
                v6 = objc_retainAutorelease(v6);
                v19 = (const void *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("tiles"), __dst);
                if (*(_QWORD *)&__dst[0] == 16
                                           * (self->_stats.num_frames & ~(self->_stats.num_frames >> 31)))
                {
                  v20 = (vl_tile_t *)malloc_type_malloc(*(size_t *)&__dst[0], 0xDD73D504uLL);
                  self->_stats.tile = v20;
                  memcpy(v20, v19, *(size_t *)&__dst[0]);
                  if (self->_stats.num_slam_pt3s < 1)
                  {
LABEL_40:
                    if (self->_stats.num_frames < 1)
                      goto LABEL_27;
                    *(_QWORD *)&__dst[0] = 0;
                    v6 = objc_retainAutorelease(v6);
                    v73 = (const void *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("inlierNumber"), __dst);
                    if (*(_QWORD *)&__dst[0] == 2 * (self->_stats.num_frames & ~(self->_stats.num_frames >> 31)))
                    {
                      v74 = (signed __int16 *)malloc_type_malloc(*(size_t *)&__dst[0], 0x5A8B64E2uLL);
                      self->_stats.inlier_number = v74;
                      memcpy(v74, v73, *(size_t *)&__dst[0]);
                      *(_QWORD *)&__dst[0] = 0;
                      v6 = objc_retainAutorelease(v6);
                      v75 = (const void *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("VIOStatus"), __dst);
                      if (*(_QWORD *)&__dst[0] == 4
                                                 * (self->_stats.num_frames & ~(self->_stats.num_frames >> 31)))
                      {
                        v76 = (int *)malloc_type_malloc(*(size_t *)&__dst[0], 0xC1D8F923uLL);
                        self->_stats.vio_status = v76;
                        memcpy(v76, v75, *(size_t *)&__dst[0]);
                        *(_QWORD *)&__dst[0] = 0;
                        v6 = objc_retainAutorelease(v6);
                        v77 = (const void *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("VIOPoses"), __dst);
                        if (*(_QWORD *)&__dst[0] == 4
                                                   * ((12 * self->_stats.num_frames) & ~((12 * self->_stats.num_frames) >> 31)))
                        {
                          v78 = (float *)malloc_type_malloc(*(size_t *)&__dst[0], 0xA7652DD4uLL);
                          self->_stats.vio_poses = v78;
                          memcpy(v78, v77, *(size_t *)&__dst[0]);
                          *(_QWORD *)&__dst[0] = 0;
                          v6 = objc_retainAutorelease(v6);
                          v79 = (const void *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("CalibrationMatrices"), __dst);
                          if (*(_QWORD *)&__dst[0] == 4
                                                     * ((9 * self->_stats.num_frames) & ~((9 * self->_stats.num_frames) >> 31)))
                          {
                            v80 = (float *)malloc_type_malloc(*(size_t *)&__dst[0], 0x1A1216FDuLL);
                            self->_stats.K = v80;
                            memcpy(v80, v79, *(size_t *)&__dst[0]);
                            *(_QWORD *)&__dst[0] = 0;
                            v6 = objc_retainAutorelease(v6);
                            v81 = (const void *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("Distortion"), __dst);
                            if (*(_QWORD *)&__dst[0] == 4
                                                       * ((2 * self->_stats.num_frames) & ~((2 * self->_stats.num_frames) >> 31)))
                            {
                              v82 = (float *)malloc_type_malloc(*(size_t *)&__dst[0], 0x4912C0CEuLL);
                              self->_stats.distortion = v82;
                              memcpy(v82, v81, *(size_t *)&__dst[0]);
                              *(_QWORD *)&__dst[0] = 0;
                              v6 = objc_retainAutorelease(v6);
                              v83 = (const void *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("slam_timestamps"), __dst);
                              if (*(_QWORD *)&__dst[0] == 8
                                                         * (self->_stats.num_frames & ~(self->_stats.num_frames >> 31)))
                              {
                                v84 = (double *)malloc_type_malloc(*(size_t *)&__dst[0], 0x273ACD8FuLL);
                                self->_stats.slam_time_stamps = v84;
                                memcpy(v84, v83, *(size_t *)&__dst[0]);
                                *(_QWORD *)&__dst[0] = 0;
                                v6 = objc_retainAutorelease(v6);
                                v85 = (const void *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("slam_poses"), __dst);
                                if (*(_QWORD *)&__dst[0] == 4
                                                           * ((12 * self->_stats.num_frames) & ~((12 * self->_stats.num_frames) >> 31)))
                                {
                                  v86 = (float *)malloc_type_malloc(*(size_t *)&__dst[0], 0xAF6D2A91uLL);
                                  self->_stats.slam_poses = v86;
                                  memcpy(v86, v85, *(size_t *)&__dst[0]);
                                  *(_QWORD *)&__dst[0] = 0;
                                  v6 = objc_retainAutorelease(v6);
                                  v87 = (const void *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("result_poses"), __dst);
                                  if (*(_QWORD *)&__dst[0] == 248
                                                             * (self->_stats.num_frames & ~(self->_stats.num_frames >> 31)))
                                  {
                                    v88 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(*(size_t *)&__dst[0], 0x3BB57C68uLL);
                                    self->_stats.result_poses = v88;
                                    memcpy(v88, v87, *(size_t *)&__dst[0]);
                                    *(_QWORD *)&__dst[0] = 0;
                                    v6 = objc_retainAutorelease(v6);
                                    v89 = (const void *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("result_status"), __dst);
                                    if (*(_QWORD *)&__dst[0] == 4
                                                               * (self->_stats.num_frames & ~(self->_stats.num_frames >> 31)))
                                    {
                                      v90 = (int *)malloc_type_malloc(*(size_t *)&__dst[0], 0x5A8F4C87uLL);
                                      self->_stats.result_status = v90;
                                      memcpy(v90, v89, *(size_t *)&__dst[0]);
                                      goto LABEL_27;
                                    }
                                    v36 = (void *)MEMORY[0x24BDD1540];
                                    v37 = *MEMORY[0x24BDD0B88];
                                    v96 = *MEMORY[0x24BDBD370];
                                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ bytes were not the expected length"), CFSTR("result_status"));
                                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                                    v97 = v38;
                                    v39 = (void *)MEMORY[0x24BDBCE70];
                                    v40 = &v97;
                                    v41 = &v96;
                                  }
                                  else
                                  {
                                    v36 = (void *)MEMORY[0x24BDD1540];
                                    v37 = *MEMORY[0x24BDD0B88];
                                    v98 = *MEMORY[0x24BDBD370];
                                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ bytes were not the expected length"), CFSTR("result_poses"));
                                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                                    v99 = v38;
                                    v39 = (void *)MEMORY[0x24BDBCE70];
                                    v40 = &v99;
                                    v41 = &v98;
                                  }
                                }
                                else
                                {
                                  v36 = (void *)MEMORY[0x24BDD1540];
                                  v37 = *MEMORY[0x24BDD0B88];
                                  v100 = *MEMORY[0x24BDBD370];
                                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ bytes were not the expected length"), CFSTR("slam_poses"));
                                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                                  v101 = v38;
                                  v39 = (void *)MEMORY[0x24BDBCE70];
                                  v40 = &v101;
                                  v41 = &v100;
                                }
                              }
                              else
                              {
                                v36 = (void *)MEMORY[0x24BDD1540];
                                v37 = *MEMORY[0x24BDD0B88];
                                v102 = *MEMORY[0x24BDBD370];
                                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ bytes were not the expected length"), CFSTR("slam_timestamps"));
                                v38 = (void *)objc_claimAutoreleasedReturnValue();
                                v103 = v38;
                                v39 = (void *)MEMORY[0x24BDBCE70];
                                v40 = &v103;
                                v41 = &v102;
                              }
                            }
                            else
                            {
                              v36 = (void *)MEMORY[0x24BDD1540];
                              v37 = *MEMORY[0x24BDD0B88];
                              v104 = *MEMORY[0x24BDBD370];
                              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ bytes were not the expected length"), CFSTR("Distortion"));
                              v38 = (void *)objc_claimAutoreleasedReturnValue();
                              v105 = v38;
                              v39 = (void *)MEMORY[0x24BDBCE70];
                              v40 = &v105;
                              v41 = &v104;
                            }
                          }
                          else
                          {
                            v36 = (void *)MEMORY[0x24BDD1540];
                            v37 = *MEMORY[0x24BDD0B88];
                            v106 = *MEMORY[0x24BDBD370];
                            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ bytes were not the expected length"), CFSTR("CalibrationMatrices"));
                            v38 = (void *)objc_claimAutoreleasedReturnValue();
                            v107 = v38;
                            v39 = (void *)MEMORY[0x24BDBCE70];
                            v40 = &v107;
                            v41 = &v106;
                          }
                        }
                        else
                        {
                          v36 = (void *)MEMORY[0x24BDD1540];
                          v37 = *MEMORY[0x24BDD0B88];
                          v108 = *MEMORY[0x24BDBD370];
                          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ bytes were not the expected length"), CFSTR("VIOPoses"));
                          v38 = (void *)objc_claimAutoreleasedReturnValue();
                          v109 = v38;
                          v39 = (void *)MEMORY[0x24BDBCE70];
                          v40 = &v109;
                          v41 = &v108;
                        }
                      }
                      else
                      {
                        v36 = (void *)MEMORY[0x24BDD1540];
                        v37 = *MEMORY[0x24BDD0B88];
                        v110 = *MEMORY[0x24BDBD370];
                        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ bytes were not the expected length"), CFSTR("VIOStatus"));
                        v38 = (void *)objc_claimAutoreleasedReturnValue();
                        v111 = v38;
                        v39 = (void *)MEMORY[0x24BDBCE70];
                        v40 = &v111;
                        v41 = &v110;
                      }
                    }
                    else
                    {
                      v36 = (void *)MEMORY[0x24BDD1540];
                      v37 = *MEMORY[0x24BDD0B88];
                      v112 = *MEMORY[0x24BDBD370];
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ bytes were not the expected length"), CFSTR("inlierNumber"));
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      v113 = v38;
                      v39 = (void *)MEMORY[0x24BDBCE70];
                      v40 = &v113;
                      v41 = &v112;
                    }
                    goto LABEL_25;
                  }
                  *(_QWORD *)&__dst[0] = 0;
                  v21 = objc_retainAutorelease(v6);
                  v22 = (const void *)objc_msgSend(v21, "decodeBytesForKey:returnedLength:", CFSTR("SLAMTracks"), __dst);
                  if (*(_QWORD *)&__dst[0] != 4
                                             * ((3 * self->_stats.num_slam_pt3s) & ~((3
                                                                                                  * self->_stats.num_slam_pt3s) >> 31)))
                  {
                    v45 = (void *)MEMORY[0x24BDD1540];
                    v46 = *MEMORY[0x24BDD0B88];
                    v122 = *MEMORY[0x24BDBD370];
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ bytes were not the expected length"), CFSTR("SLAMTracks"));
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    v123 = v47;
                    v48 = (void *)MEMORY[0x24BDBCE70];
                    v49 = &v123;
                    v50 = &v122;
                    goto LABEL_56;
                  }
                  v23 = (float *)malloc_type_malloc(*(size_t *)&__dst[0], 0x1E27FBB2uLL);
                  self->_stats.slam_pt3s = v23;
                  memcpy(v23, v22, *(size_t *)&__dst[0]);
                  *(_QWORD *)&__dst[0] = 0;
                  v21 = objc_retainAutorelease(v21);
                  v24 = (const void *)objc_msgSend(v21, "decodeBytesForKey:returnedLength:", CFSTR("SLAMTrackDescriptors"), __dst);
                  if (*(_QWORD *)&__dst[0] != ((self->_stats.desc_dim * self->_stats.num_slam_pt3s) & ~((self->_stats.desc_dim * self->_stats.num_slam_pt3s) >> 31)))
                  {
                    v45 = (void *)MEMORY[0x24BDD1540];
                    v46 = *MEMORY[0x24BDD0B88];
                    v120 = *MEMORY[0x24BDBD370];
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ bytes were not the expected length"), CFSTR("SLAMTrackDescriptors"));
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    v121 = v47;
                    v48 = (void *)MEMORY[0x24BDBCE70];
                    v49 = &v121;
                    v50 = &v120;
                    goto LABEL_56;
                  }
                  v25 = (char *)malloc_type_malloc(*(size_t *)&__dst[0], 0xB3F8F20DuLL);
                  self->_stats.slam_pt3_desc = v25;
                  memcpy(v25, v24, *(size_t *)&__dst[0]);
                  *(_QWORD *)&__dst[0] = 0;
                  v21 = objc_retainAutorelease(v21);
                  v26 = (const void *)objc_msgSend(v21, "decodeBytesForKey:returnedLength:", CFSTR("SLAMTrackObservations"), __dst);
                  if (*(_QWORD *)&__dst[0] != 2 * (self->_stats.num_slam_pt3s & ~(self->_stats.num_slam_pt3s >> 31)))
                  {
                    v45 = (void *)MEMORY[0x24BDD1540];
                    v46 = *MEMORY[0x24BDD0B88];
                    v118 = *MEMORY[0x24BDBD370];
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ bytes were not the expected length"), CFSTR("SLAMTrackObservations"));
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    v119 = v47;
                    v48 = (void *)MEMORY[0x24BDBCE70];
                    v49 = &v119;
                    v50 = &v118;
                    goto LABEL_56;
                  }
                  v27 = (signed __int16 *)malloc_type_malloc(*(size_t *)&__dst[0], 0x1B2462E4uLL);
                  self->_stats.slam_tracks_len = v27;
                  memcpy(v27, v26, *(size_t *)&__dst[0]);
                  num_slam_pt3s = self->_stats.num_slam_pt3s;
                  if ((int)num_slam_pt3s < 1)
                  {
                    v30 = 0;
                    goto LABEL_37;
                  }
                  slam_tracks_len = self->_stats.slam_tracks_len;
                  if (num_slam_pt3s >= 0x10)
                  {
                    v51 = 0uLL;
                    v31 = num_slam_pt3s & 0xFFFFFFF0;
                    v52 = 0uLL;
                    v53 = (int16x4_t *)(slam_tracks_len + 8);
                    v54 = v31;
                    v55 = 0uLL;
                    v56 = 0uLL;
                    v57 = 0uLL;
                    v58 = 0uLL;
                    v59 = 0uLL;
                    v60 = 0uLL;
                    do
                    {
                      v61 = *(int16x8_t *)v53[-2].i8;
                      v62 = vmovl_s16(*(int16x4_t *)v61.i8);
                      v63 = vmovl_high_s16(v61);
                      v64 = vmovl_s16(*v53);
                      v65 = vmovl_high_s16(*(int16x8_t *)v53->i8);
                      v56 = vaddw_high_s32(v56, v63);
                      v55 = vaddw_s32(v55, *(int32x2_t *)v63.i8);
                      v52 = vaddw_high_s32(v52, v62);
                      v51 = vaddw_s32(v51, *(int32x2_t *)v62.i8);
                      v60 = vaddw_high_s32(v60, v65);
                      v59 = vaddw_s32(v59, *(int32x2_t *)v65.i8);
                      v58 = vaddw_high_s32(v58, v64);
                      v57 = vaddw_s32(v57, *(int32x2_t *)v64.i8);
                      v53 += 4;
                      v54 -= 16;
                    }
                    while (v54);
                    v30 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v57, v51), vaddq_s64(v59, v55)), vaddq_s64(vaddq_s64(v58, v52), vaddq_s64(v60, v56))));
                    if (v31 == num_slam_pt3s)
                    {
LABEL_37:
                      *(_QWORD *)&__dst[0] = 0;
                      v21 = objc_retainAutorelease(v21);
                      v69 = (const void *)objc_msgSend(v21, "decodeBytesForKey:returnedLength:", CFSTR("SLAMTrackPositions"), __dst);
                      if (*(_QWORD *)&__dst[0] == 8 * v30)
                      {
                        v70 = (float *)malloc_type_malloc(*(size_t *)&__dst[0], 0xE8D1F80AuLL);
                        self->_stats.slam_tracks = v70;
                        memcpy(v70, v69, *(size_t *)&__dst[0]);
                        *(_QWORD *)&__dst[0] = 0;
                        v21 = objc_retainAutorelease(v21);
                        v71 = (const void *)objc_msgSend(v21, "decodeBytesForKey:returnedLength:", CFSTR("SLAMTrackImageIndices"), __dst);
                        if (*(_QWORD *)&__dst[0] == 2 * v30)
                        {
                          v72 = (signed __int16 *)malloc_type_malloc(*(size_t *)&__dst[0], 0x3B301656uLL);
                          self->_stats.slam_tracks_img_idx = v72;
                          memcpy(v72, v71, *(size_t *)&__dst[0]);
                          goto LABEL_40;
                        }
                        v45 = (void *)MEMORY[0x24BDD1540];
                        v46 = *MEMORY[0x24BDD0B88];
                        v114 = *MEMORY[0x24BDBD370];
                        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ bytes were not the expected length"), CFSTR("SLAMTrackImageIndices"));
                        v47 = (void *)objc_claimAutoreleasedReturnValue();
                        v115 = v47;
                        v48 = (void *)MEMORY[0x24BDBCE70];
                        v49 = &v115;
                        v50 = &v114;
                      }
                      else
                      {
                        v45 = (void *)MEMORY[0x24BDD1540];
                        v46 = *MEMORY[0x24BDD0B88];
                        v116 = *MEMORY[0x24BDBD370];
                        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ bytes were not the expected length"), CFSTR("SLAMTrackPositions"));
                        v47 = (void *)objc_claimAutoreleasedReturnValue();
                        v117 = v47;
                        v48 = (void *)MEMORY[0x24BDBCE70];
                        v49 = &v117;
                        v50 = &v116;
                      }
LABEL_56:
                      objc_msgSend(v48, "dictionaryWithObjects:forKeys:count:", v49, v50, 1);
                      v91 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v45, "errorWithDomain:code:userInfo:", v46, 4864, v91);
                      v92 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v21, "failWithError:", v92);

                      goto LABEL_26;
                    }
                  }
                  else
                  {
                    v30 = 0;
                    v31 = 0;
                  }
                  v66 = num_slam_pt3s - v31;
                  v67 = &slam_tracks_len[v31];
                  do
                  {
                    v68 = *v67++;
                    v30 += v68;
                    --v66;
                  }
                  while (v66);
                  goto LABEL_37;
                }
                v36 = (void *)MEMORY[0x24BDD1540];
                v37 = *MEMORY[0x24BDD0B88];
                v124 = *MEMORY[0x24BDBD370];
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ bytes were not the expected length"), CFSTR("tiles"));
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v125 = v38;
                v39 = (void *)MEMORY[0x24BDBCE70];
                v40 = &v125;
                v41 = &v124;
              }
              else
              {
                v36 = (void *)MEMORY[0x24BDD1540];
                v37 = *MEMORY[0x24BDD0B88];
                v126 = *MEMORY[0x24BDBD370];
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ bytes were not the expected length"), CFSTR("fusedConf"));
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v127 = v38;
                v39 = (void *)MEMORY[0x24BDBCE70];
                v40 = &v127;
                v41 = &v126;
              }
            }
            else
            {
              v36 = (void *)MEMORY[0x24BDD1540];
              v37 = *MEMORY[0x24BDD0B88];
              v128 = *MEMORY[0x24BDBD370];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ bytes were not the expected length"), CFSTR("solverConf"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v129 = v38;
              v39 = (void *)MEMORY[0x24BDBCE70];
              v40 = &v129;
              v41 = &v128;
            }
          }
          else
          {
            v36 = (void *)MEMORY[0x24BDD1540];
            v37 = *MEMORY[0x24BDD0B88];
            v130 = *MEMORY[0x24BDBD370];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ bytes were not the expected length"), CFSTR("slam_pt3s_inlier_idx"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v131 = v38;
            v39 = (void *)MEMORY[0x24BDBCE70];
            v40 = &v131;
            v41 = &v130;
          }
        }
        else
        {
          v36 = (void *)MEMORY[0x24BDD1540];
          v37 = *MEMORY[0x24BDD0B88];
          v132 = *MEMORY[0x24BDBD370];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ bytes were not the expected length"), CFSTR("inlierIndices"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v133 = v38;
          v39 = (void *)MEMORY[0x24BDBCE70];
          v40 = &v133;
          v41 = &v132;
        }
      }
      else
      {
        v36 = (void *)MEMORY[0x24BDD1540];
        v37 = *MEMORY[0x24BDD0B88];
        v134 = *MEMORY[0x24BDBD370];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ bytes were not the expected length"), CFSTR("points2D"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v135 = v38;
        v39 = (void *)MEMORY[0x24BDBCE70];
        v40 = &v135;
        v41 = &v134;
      }
    }
    else
    {
      v36 = (void *)MEMORY[0x24BDD1540];
      v37 = *MEMORY[0x24BDD0B88];
      v136 = *MEMORY[0x24BDBD370];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ bytes were not the expected length"), CFSTR("points3D"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = v38;
      v39 = (void *)MEMORY[0x24BDBCE70];
      v40 = &v137;
      v41 = &v136;
    }
LABEL_25:
    objc_msgSend(v39, "dictionaryWithObjects:forKeys:count:", v40, v41, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "errorWithDomain:code:userInfo:", v37, 4864, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "failWithError:", v43);

    goto LABEL_26;
  }
LABEL_27:

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  int num_inliers;
  uint64_t num_confs;
  uint64_t num_frames;
  int num_slam_pt3s;
  int v10;
  uint64_t v11;
  signed __int16 *slam_tracks_len;
  uint64_t v13;
  uint64_t v14;
  int64x2_t v15;
  int64x2_t v16;
  int16x4_t *v17;
  uint64_t v18;
  int64x2_t v19;
  int64x2_t v20;
  int64x2_t v21;
  int64x2_t v22;
  int64x2_t v23;
  int64x2_t v24;
  int16x8_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  uint64_t v30;
  signed __int16 *v31;
  uint64_t v32;
  uint64_t v33;
  _OWORD v34[32];

  v4 = a3;
  v5 = v4;
  num_inliers = self->_stats.num_inliers;
  if (num_inliers >= 1)
  {
    objc_msgSend(v4, "encodeBytes:length:forKey:", self->_stats.points3d, 8 * ((3 * num_inliers) & ~((3 * num_inliers) >> 31)), CFSTR("points3D"));
    objc_msgSend(v5, "encodeBytes:length:forKey:", self->_stats.points2d, 4 * ((2 * self->_stats.num_inliers) & ~((2 * self->_stats.num_inliers) >> 31)), CFSTR("points2D"));
    objc_msgSend(v5, "encodeBytes:length:forKey:", self->_stats.inlier_indices, 4 * (self->_stats.num_inliers & ~(self->_stats.num_inliers >> 31)), CFSTR("inlierIndices"));
    objc_msgSend(v5, "encodeBytes:length:forKey:", self->_stats.slam_pt3s_inlier_idx, 2 * (self->_stats.num_inliers & ~(self->_stats.num_inliers >> 31)), CFSTR("slam_pt3s_inlier_idx"));
  }
  num_confs = self->_stats.num_confs;
  if ((int)num_confs >= 1)
  {
    objc_msgSend(v5, "encodeBytes:length:forKey:", self->_stats.solver_conf, 4 * num_confs, CFSTR("solverConf"));
    objc_msgSend(v5, "encodeBytes:length:forKey:", self->_stats.fused_conf, 4 * (self->_stats.num_confs & ~(self->_stats.num_confs >> 31)), CFSTR("fusedConf"));
  }
  num_frames = self->_stats.num_frames;
  if ((int)num_frames >= 1)
  {
    objc_msgSend(v5, "encodeBytes:length:forKey:", self->_stats.tile, 16 * num_frames, CFSTR("tiles"));
    objc_msgSend(v5, "encodeBytes:length:forKey:", self->_stats.inlier_number, 2 * (self->_stats.num_frames & ~(self->_stats.num_frames >> 31)), CFSTR("inlierNumber"));
    objc_msgSend(v5, "encodeBytes:length:forKey:", self->_stats.slam_time_stamps, 8 * (self->_stats.num_frames & ~(self->_stats.num_frames >> 31)), CFSTR("slam_timestamps"));
  }
  num_slam_pt3s = self->_stats.num_slam_pt3s;
  if (num_slam_pt3s >= 1)
  {
    objc_msgSend(v5, "encodeBytes:length:forKey:", self->_stats.slam_pt3s, 4 * ((3 * num_slam_pt3s) & ~((3 * num_slam_pt3s) >> 31)), CFSTR("SLAMTracks"));
    v10 = self->_stats.desc_dim * self->_stats.num_slam_pt3s;
    objc_msgSend(v5, "encodeBytes:length:forKey:", self->_stats.slam_pt3_desc, v10 & ~(v10 >> 31), CFSTR("SLAMTrackDescriptors"));
    objc_msgSend(v5, "encodeBytes:length:forKey:", self->_stats.slam_tracks_len, 2 * (self->_stats.num_slam_pt3s & ~(self->_stats.num_slam_pt3s >> 31)), CFSTR("SLAMTrackObservations"));
    v11 = self->_stats.num_slam_pt3s;
    if ((int)v11 < 1)
    {
      v13 = 0;
    }
    else
    {
      slam_tracks_len = self->_stats.slam_tracks_len;
      if (v11 >= 0x10)
      {
        v15 = 0uLL;
        v14 = v11 & 0xFFFFFFF0;
        v16 = 0uLL;
        v17 = (int16x4_t *)(slam_tracks_len + 8);
        v18 = v14;
        v19 = 0uLL;
        v20 = 0uLL;
        v21 = 0uLL;
        v22 = 0uLL;
        v23 = 0uLL;
        v24 = 0uLL;
        do
        {
          v25 = *(int16x8_t *)v17[-2].i8;
          v26 = vmovl_s16(*(int16x4_t *)v25.i8);
          v27 = vmovl_high_s16(v25);
          v28 = vmovl_s16(*v17);
          v29 = vmovl_high_s16(*(int16x8_t *)v17->i8);
          v20 = vaddw_high_s32(v20, v27);
          v19 = vaddw_s32(v19, *(int32x2_t *)v27.i8);
          v16 = vaddw_high_s32(v16, v26);
          v15 = vaddw_s32(v15, *(int32x2_t *)v26.i8);
          v24 = vaddw_high_s32(v24, v29);
          v23 = vaddw_s32(v23, *(int32x2_t *)v29.i8);
          v22 = vaddw_high_s32(v22, v28);
          v21 = vaddw_s32(v21, *(int32x2_t *)v28.i8);
          v17 += 4;
          v18 -= 16;
        }
        while (v18);
        v13 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v21, v15), vaddq_s64(v23, v19)), vaddq_s64(vaddq_s64(v22, v16), vaddq_s64(v24, v20))));
        if (v14 == v11)
          goto LABEL_17;
      }
      else
      {
        v13 = 0;
        v14 = 0;
      }
      v30 = v11 - v14;
      v31 = &slam_tracks_len[v14];
      do
      {
        v32 = *v31++;
        v13 += v32;
        --v30;
      }
      while (v30);
    }
LABEL_17:
    objc_msgSend(v5, "encodeBytes:length:forKey:", self->_stats.slam_tracks, 8 * v13, CFSTR("SLAMTrackPositions"));
    objc_msgSend(v5, "encodeBytes:length:forKey:", self->_stats.slam_tracks_img_idx, 2 * v13, CFSTR("SLAMTrackImageIndices"));
  }
  v33 = self->_stats.num_frames;
  if ((int)v33 >= 1)
  {
    objc_msgSend(v5, "encodeBytes:length:forKey:", self->_stats.vio_status, 4 * v33, CFSTR("VIOStatus"));
    objc_msgSend(v5, "encodeBytes:length:forKey:", self->_stats.vio_poses, 4 * ((12 * self->_stats.num_frames) & ~((12 * self->_stats.num_frames) >> 31)), CFSTR("VIOPoses"));
    objc_msgSend(v5, "encodeBytes:length:forKey:", self->_stats.K, 4 * ((9 * self->_stats.num_frames) & ~((9 * self->_stats.num_frames) >> 31)), CFSTR("CalibrationMatrices"));
    objc_msgSend(v5, "encodeBytes:length:forKey:", self->_stats.distortion, 4 * ((2 * self->_stats.num_frames) & ~((2 * self->_stats.num_frames) >> 31)), CFSTR("Distortion"));
    objc_msgSend(v5, "encodeBytes:length:forKey:", self->_stats.slam_poses, 4 * ((12 * self->_stats.num_frames) & ~((12 * self->_stats.num_frames) >> 31)), CFSTR("slam_poses"));
    objc_msgSend(v5, "encodeBytes:length:forKey:", self->_stats.result_poses, 248 * (self->_stats.num_frames & ~(self->_stats.num_frames >> 31)), CFSTR("result_poses"));
    objc_msgSend(v5, "encodeBytes:length:forKey:", self->_stats.result_status, 4 * (self->_stats.num_frames & ~(self->_stats.num_frames >> 31)), CFSTR("result_status"));
  }
  memcpy(v34, &self->_stats, 0x1F8uLL);
  memset(v34, 0, 40);
  v34[4] = 0uLL;
  *(_OWORD *)((char *)&v34[6] + 8) = 0u;
  *(_OWORD *)((char *)&v34[7] + 8) = 0u;
  v34[12] = 0uLL;
  *(_OWORD *)((char *)&v34[16] + 8) = 0u;
  *(_OWORD *)((char *)&v34[13] + 8) = 0u;
  *(_OWORD *)((char *)&v34[14] + 8) = 0u;
  *(_OWORD *)((char *)&v34[15] + 8) = 0u;
  *((_QWORD *)&v34[17] + 1) = 0;
  objc_msgSend(v5, "encodeBytes:length:forKey:", v34, 504, CFSTR("statistics"));

}

- (void)dealloc
{
  objc_super v3;

  vl_stats_free((void **)&self->_stats.points3d);
  v3.receiver = self;
  v3.super_class = (Class)_VLStatistics;
  -[_VLStatistics dealloc](&v3, sel_dealloc);
}

- ($EA16241FF5FAACBBBC823CFA4C5CA9E3)stats
{
  return ($EA16241FF5FAACBBBC823CFA4C5CA9E3 *)&self->_stats;
}

@end
