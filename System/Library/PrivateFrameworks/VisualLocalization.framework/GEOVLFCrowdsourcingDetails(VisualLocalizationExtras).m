@implementation GEOVLFCrowdsourcingDetails(VisualLocalizationExtras)

+ (id)_vl_createWithVLCrowdsourcingDetails:()VisualLocalizationExtras
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  id v17;
  id v18;
  _DWORD *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  double v48;
  id v49;
  double v50;
  id v51;
  double v52;
  id v53;
  double v54;
  id v55;
  double v56;
  id v57;
  double v58;
  id v59;
  double v60;
  id v61;
  double v62;
  id v63;
  double v64;
  id v65;
  double v66;
  id v67;
  double v68;
  id v69;
  double v70;
  id v71;
  double v72;
  id v73;
  double v74;
  id v75;
  double v76;
  id v77;
  double v78;
  id v79;
  double v80;
  id v81;
  double v82;
  id v83;
  double v84;
  id v85;
  double v86;
  id v87;
  double v88;
  id v89;
  double v90;
  id v91;
  double v92;
  double v93;
  uint64_t v94;
  uint64_t v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  uint64_t v107;
  _DWORD *v108;
  int v109;
  int v110;
  int v111;
  id v112;
  uint64_t v113;
  double *v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  uint64_t v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  unint64_t v138;
  id v139;
  double v140;
  id v141;
  double v142;
  id v143;
  float v144;
  id v145;
  float v146;
  id v147;
  float v148;
  uint64_t v149;
  id v150;
  uint64_t v152;
  id v153;
  double v154;
  double v155;
  void *v156;
  id v157;
  uint64_t v158;
  double v159;

  v4 = a3;
  objc_msgSend(v4, "statistics");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "stats");

  if (v6
    && (!objc_msgSend(v4, "slamTracksCount") || objc_msgSend(objc_retainAutorelease(v4), "slamOrigin"))
    && (!objc_msgSend(v4, "slamTracksCount") || objc_msgSend(objc_retainAutorelease(v4), "slamTracks"))
    && (!objc_msgSend(v4, "slamTracksCount") || objc_msgSend(objc_retainAutorelease(v4), "slamTrackDescriptors"))
    && (!objc_msgSend(v4, "slamTracksCount") || objc_msgSend(objc_retainAutorelease(v4), "slamTrackObservations"))
    && (!objc_msgSend(v4, "slamTracksCount") || objc_msgSend(objc_retainAutorelease(v4), "slamTrackImageIndices"))
    && (!objc_msgSend(v4, "slamTracksCount") || objc_msgSend(objc_retainAutorelease(v4), "slamTracks2D"))
    && (!objc_msgSend(v4, "frameCount") || objc_msgSend(objc_retainAutorelease(v4), "perFrameVioStatusCodes"))
    && (!objc_msgSend(v4, "frameCount") || objc_msgSend(objc_retainAutorelease(v4), "perFrameVioPoses"))
    && (!objc_msgSend(v4, "frameCount") || objc_msgSend(objc_retainAutorelease(v4), "perFrameCalibrationMatrices"))
    && (!objc_msgSend(v4, "frameCount") || objc_msgSend(objc_retainAutorelease(v4), "perFrameDistortion"))
    && (v7 = objc_retainAutorelease(v4), objc_msgSend(v7, "resultPoseRotation"))
    && (v8 = objc_retainAutorelease(v7), objc_msgSend(v8, "resultPoseTranslation"))
    && (!objc_msgSend(v8, "inliersCount") || objc_msgSend(objc_retainAutorelease(v8), "points2D"))
    && (!objc_msgSend(v8, "inliersCount") || objc_msgSend(objc_retainAutorelease(v8), "points3D")))
  {
    v9 = objc_alloc_init(a1);
    if (v9)
    {
      v152 = v6;
      v153 = v4;
      v10 = objc_retainAutorelease(v8);
      objc_msgSend(v9, "addSlamOrigin:", *(double *)objc_msgSend(v10, "slamOrigin"));
      v11 = objc_retainAutorelease(v10);
      objc_msgSend(v9, "addSlamOrigin:", *(double *)(objc_msgSend(v11, "slamOrigin") + 8));
      v12 = objc_retainAutorelease(v11);
      objc_msgSend(v9, "addSlamOrigin:", *(double *)(objc_msgSend(v12, "slamOrigin") + 16));
      v13 = objc_retainAutorelease(v12);
      objc_msgSend(v9, "addSlamOrigin:", *(double *)(objc_msgSend(v13, "slamOrigin") + 24));
      v14 = objc_retainAutorelease(v13);
      objc_msgSend(v9, "addSlamOrigin:", *(double *)(objc_msgSend(v14, "slamOrigin") + 32));
      v15 = objc_retainAutorelease(v14);
      objc_msgSend(v9, "addSlamOrigin:", *(double *)(objc_msgSend(v15, "slamOrigin") + 40));
      v157 = v15;
      v156 = v9;
      if (objc_msgSend(v15, "slamTracksCount"))
      {
        v158 = 0;
        v16 = 0;
        do
        {
          v17 = objc_alloc_init(MEMORY[0x24BE3D118]);
          v18 = objc_retainAutorelease(v15);
          v19 = (_DWORD *)(objc_msgSend(v18, "slamTracks") + 12 * v16);
          v20 = objc_alloc_init(MEMORY[0x24BE3D110]);
          LODWORD(v21) = *v19;
          objc_msgSend(v20, "setX:", v21);
          LODWORD(v22) = v19[1];
          objc_msgSend(v20, "setY:", v22);
          LODWORD(v23) = v19[2];
          objc_msgSend(v20, "setZ:", v23);
          objc_msgSend(v17, "setPosition:", v20);

          v24 = objc_retainAutorelease(v18);
          v25 = objc_msgSend(v24, "slamTrackDescriptors");
          v26 = objc_msgSend(v24, "descriptorDimension");
          if (objc_msgSend(v24, "descriptorDimension"))
          {
            v27 = 0;
            v28 = v25 + v26 * v16;
            do
              objc_msgSend(v17, "addDescriptors:", *(unsigned __int8 *)(v28 + v27++));
            while (v27 < objc_msgSend(v24, "descriptorDimension"));
          }
          v29 = objc_retainAutorelease(v24);
          v30 = objc_msgSend(v29, "slamTrackObservations");
          v31 = *(__int16 *)(v30 + 2 * v16);
          if (*(_WORD *)(v30 + 2 * v16))
          {
            v32 = 2 * v158;
            v33 = *(__int16 *)(v30 + 2 * v16);
            do
            {
              v34 = objc_retainAutorelease(v29);
              objc_msgSend(v17, "addObservationImageIndices:", *(__int16 *)(objc_msgSend(v34, "slamTrackImageIndices") + v32));
              v35 = objc_alloc_init(MEMORY[0x24BE3D0F0]);
              v36 = objc_retainAutorelease(v34);
              LODWORD(v37) = *(_DWORD *)(objc_msgSend(v36, "slamTracks2D") + 4 * v32);
              objc_msgSend(v35, "setX:", v37);
              LODWORD(v38) = *(_DWORD *)(objc_msgSend(objc_retainAutorelease(v36), "slamTracks2D") + 4 * v32 + 4);
              objc_msgSend(v35, "setY:", v38);
              objc_msgSend(v17, "addImagePositions:", v35);

              v32 += 2;
              --v33;
            }
            while (v33);
          }
          v158 += v31;
          v9 = v156;
          objc_msgSend(v156, "addSlamTracks:", v17);

          ++v16;
        }
        while (v16 < objc_msgSend(v29, "slamTracksCount"));
      }
      if (objc_msgSend(v15, "frameCount"))
      {
        v39 = 0;
        v40 = 0;
        v41 = 0;
        v42 = 0;
        v43 = 88;
        v44 = 32;
        do
        {
          v45 = objc_alloc_init(MEMORY[0x24BE3D0E0]);
          v46 = objc_retainAutorelease(v157);
          objc_msgSend(v45, "setVioStatus:", *(unsigned int *)(objc_msgSend(v46, "perFrameVioStatusCodes") + v41));
          v47 = objc_retainAutorelease(v46);
          LODWORD(v48) = *(_DWORD *)(objc_msgSend(v47, "perFrameVioPoses") + v39);
          objc_msgSend(v45, "addVioPose:", v48);
          v49 = objc_retainAutorelease(v47);
          LODWORD(v50) = *(_DWORD *)(objc_msgSend(v49, "perFrameVioPoses") + v39 + 4);
          objc_msgSend(v45, "addVioPose:", v50);
          v51 = objc_retainAutorelease(v49);
          LODWORD(v52) = *(_DWORD *)(objc_msgSend(v51, "perFrameVioPoses") + v39 + 8);
          objc_msgSend(v45, "addVioPose:", v52);
          v53 = objc_retainAutorelease(v51);
          LODWORD(v54) = *(_DWORD *)(objc_msgSend(v53, "perFrameVioPoses") + v39 + 12);
          objc_msgSend(v45, "addVioPose:", v54);
          v55 = objc_retainAutorelease(v53);
          LODWORD(v56) = *(_DWORD *)(objc_msgSend(v55, "perFrameVioPoses") + v39 + 16);
          objc_msgSend(v45, "addVioPose:", v56);
          v57 = objc_retainAutorelease(v55);
          LODWORD(v58) = *(_DWORD *)(objc_msgSend(v57, "perFrameVioPoses") + v39 + 20);
          objc_msgSend(v45, "addVioPose:", v58);
          v59 = objc_retainAutorelease(v57);
          LODWORD(v60) = *(_DWORD *)(objc_msgSend(v59, "perFrameVioPoses") + v39 + 24);
          objc_msgSend(v45, "addVioPose:", v60);
          v61 = objc_retainAutorelease(v59);
          LODWORD(v62) = *(_DWORD *)(objc_msgSend(v61, "perFrameVioPoses") + v39 + 28);
          objc_msgSend(v45, "addVioPose:", v62);
          v63 = objc_retainAutorelease(v61);
          LODWORD(v64) = *(_DWORD *)(objc_msgSend(v63, "perFrameVioPoses") + v39 + 32);
          objc_msgSend(v45, "addVioPose:", v64);
          v65 = objc_retainAutorelease(v63);
          LODWORD(v66) = *(_DWORD *)(objc_msgSend(v65, "perFrameVioPoses") + v39 + 36);
          objc_msgSend(v45, "addVioPose:", v66);
          v67 = objc_retainAutorelease(v65);
          LODWORD(v68) = *(_DWORD *)(objc_msgSend(v67, "perFrameVioPoses") + v39 + 40);
          objc_msgSend(v45, "addVioPose:", v68);
          v69 = objc_retainAutorelease(v67);
          LODWORD(v70) = *(_DWORD *)(objc_msgSend(v69, "perFrameVioPoses") + v39 + 44);
          objc_msgSend(v45, "addVioPose:", v70);
          v71 = objc_retainAutorelease(v69);
          LODWORD(v72) = *(_DWORD *)(objc_msgSend(v71, "perFrameCalibrationMatrices") + v44 - 32);
          objc_msgSend(v45, "addCalibrationMatrix:", v72);
          v73 = objc_retainAutorelease(v71);
          LODWORD(v74) = *(_DWORD *)(objc_msgSend(v73, "perFrameCalibrationMatrices") + v44 - 28);
          objc_msgSend(v45, "addCalibrationMatrix:", v74);
          v75 = objc_retainAutorelease(v73);
          LODWORD(v76) = *(_DWORD *)(objc_msgSend(v75, "perFrameCalibrationMatrices") + v44 - 24);
          objc_msgSend(v45, "addCalibrationMatrix:", v76);
          v77 = objc_retainAutorelease(v75);
          LODWORD(v78) = *(_DWORD *)(objc_msgSend(v77, "perFrameCalibrationMatrices") + v44 - 20);
          objc_msgSend(v45, "addCalibrationMatrix:", v78);
          v79 = objc_retainAutorelease(v77);
          LODWORD(v80) = *(_DWORD *)(objc_msgSend(v79, "perFrameCalibrationMatrices") + v44 - 16);
          objc_msgSend(v45, "addCalibrationMatrix:", v80);
          v81 = objc_retainAutorelease(v79);
          LODWORD(v82) = *(_DWORD *)(objc_msgSend(v81, "perFrameCalibrationMatrices") + v44 - 12);
          objc_msgSend(v45, "addCalibrationMatrix:", v82);
          v83 = objc_retainAutorelease(v81);
          LODWORD(v84) = *(_DWORD *)(objc_msgSend(v83, "perFrameCalibrationMatrices") + v44 - 8);
          objc_msgSend(v45, "addCalibrationMatrix:", v84);
          v85 = objc_retainAutorelease(v83);
          LODWORD(v86) = *(_DWORD *)(objc_msgSend(v85, "perFrameCalibrationMatrices") + v44 - 4);
          objc_msgSend(v45, "addCalibrationMatrix:", v86);
          v87 = objc_retainAutorelease(v85);
          LODWORD(v88) = *(_DWORD *)(objc_msgSend(v87, "perFrameCalibrationMatrices") + v44);
          objc_msgSend(v45, "addCalibrationMatrix:", v88);
          v89 = objc_retainAutorelease(v87);
          LODWORD(v90) = *(_DWORD *)(objc_msgSend(v89, "perFrameDistortion") + v40);
          objc_msgSend(v45, "setRadialDistortion1:", v90);
          v91 = objc_retainAutorelease(v89);
          LODWORD(v92) = *(_DWORD *)(objc_msgSend(v91, "perFrameDistortion") + v40 + 4);
          objc_msgSend(v45, "setRadialDistortion2:", v92);
          v94 = *(_QWORD *)(v152 + 248);
          if (v94)
            objc_msgSend(v45, "setTimestamp:", *(double *)(v94 + 8 * v42));
          v95 = *(_QWORD *)(v152 + 240);
          if (v95)
          {
            LODWORD(v93) = *(_DWORD *)(v95 + v39);
            objc_msgSend(v45, "addSlamPose:", v93);
            LODWORD(v96) = *(_DWORD *)(*(_QWORD *)(v152 + 240) + v39 + 4);
            objc_msgSend(v45, "addSlamPose:", v96);
            LODWORD(v97) = *(_DWORD *)(*(_QWORD *)(v152 + 240) + v39 + 8);
            objc_msgSend(v45, "addSlamPose:", v97);
            LODWORD(v98) = *(_DWORD *)(*(_QWORD *)(v152 + 240) + v39 + 12);
            objc_msgSend(v45, "addSlamPose:", v98);
            LODWORD(v99) = *(_DWORD *)(*(_QWORD *)(v152 + 240) + v39 + 16);
            objc_msgSend(v45, "addSlamPose:", v99);
            LODWORD(v100) = *(_DWORD *)(*(_QWORD *)(v152 + 240) + v39 + 20);
            objc_msgSend(v45, "addSlamPose:", v100);
            LODWORD(v101) = *(_DWORD *)(*(_QWORD *)(v152 + 240) + v39 + 24);
            objc_msgSend(v45, "addSlamPose:", v101);
            LODWORD(v102) = *(_DWORD *)(*(_QWORD *)(v152 + 240) + v39 + 28);
            objc_msgSend(v45, "addSlamPose:", v102);
            LODWORD(v103) = *(_DWORD *)(*(_QWORD *)(v152 + 240) + v39 + 32);
            objc_msgSend(v45, "addSlamPose:", v103);
            LODWORD(v104) = *(_DWORD *)(*(_QWORD *)(v152 + 240) + v39 + 36);
            objc_msgSend(v45, "addSlamPose:", v104);
            LODWORD(v105) = *(_DWORD *)(*(_QWORD *)(v152 + 240) + v39 + 40);
            objc_msgSend(v45, "addSlamPose:", v105);
            LODWORD(v106) = *(_DWORD *)(*(_QWORD *)(v152 + 240) + v39 + 44);
            objc_msgSend(v45, "addSlamPose:", v106);
          }
          v107 = *(_QWORD *)(v152 + 104);
          if (v107)
          {
            v108 = (_DWORD *)(v107 + 4 * v41);
            v109 = v108[1];
            v110 = v108[2];
            v111 = v108[3];
            v112 = objc_alloc_init(MEMORY[0x24BE3D130]);
            objc_msgSend(v112, "setXCoordinate:", (double)v109);
            objc_msgSend(v112, "setYCoordinate:", (double)v110);
            objc_msgSend(v112, "setUncertainty:", (double)v111);
            objc_msgSend(v45, "setTileId:", v112);

            v9 = v156;
          }
          v113 = *(_QWORD *)(v152 + 120);
          if (v113)
          {
            v114 = (double *)(v113 + v43);
            v115 = *(v114 - 10);
            v116 = *(v114 - 9);
            v117 = *(v114 - 8);
            v118 = *(v114 - 7);
            v119 = *(v114 - 6);
            v120 = *(v114 - 5);
            v121 = *(v114 - 4);
            v122 = *(v114 - 3);
            v154 = *(v114 - 2);
            v155 = *(v114 - 1);
            v159 = *v114;
            objc_msgSend(v45, "addResultPoseRotation:", *(v114 - 11));
            objc_msgSend(v45, "addResultPoseRotation:", v115);
            objc_msgSend(v45, "addResultPoseRotation:", v116);
            objc_msgSend(v45, "addResultPoseRotation:", v117);
            objc_msgSend(v45, "addResultPoseRotation:", v118);
            objc_msgSend(v45, "addResultPoseRotation:", v119);
            objc_msgSend(v45, "addResultPoseRotation:", v120);
            objc_msgSend(v45, "addResultPoseRotation:", v121);
            objc_msgSend(v45, "addResultPoseRotation:", v122);
            objc_msgSend(v45, "setResultTranslationX:", v154);
            objc_msgSend(v45, "setResultTranslationY:", v155);
            objc_msgSend(v45, "setResultTranslationZ:", v159);
          }
          v123 = *(_QWORD *)(v152 + 128);
          if (v123)
            objc_msgSend(v45, "setResultStatus:", *(unsigned int *)(v123 + v41));
          objc_msgSend(v9, "addFrameDetails:", v45);

          ++v42;
          v41 += 4;
          v43 += 248;
          v40 += 8;
          v44 += 36;
          v39 += 48;
        }
        while (v42 < objc_msgSend(v91, "frameCount"));
      }
      v124 = objc_retainAutorelease(v157);
      objc_msgSend(v9, "addResultPoseRotation:", *(double *)objc_msgSend(v124, "resultPoseRotation"));
      v125 = objc_retainAutorelease(v124);
      objc_msgSend(v9, "addResultPoseRotation:", *(double *)(objc_msgSend(v125, "resultPoseRotation") + 8));
      v126 = objc_retainAutorelease(v125);
      objc_msgSend(v9, "addResultPoseRotation:", *(double *)(objc_msgSend(v126, "resultPoseRotation") + 16));
      v127 = objc_retainAutorelease(v126);
      objc_msgSend(v9, "addResultPoseRotation:", *(double *)(objc_msgSend(v127, "resultPoseRotation") + 24));
      v128 = objc_retainAutorelease(v127);
      objc_msgSend(v9, "addResultPoseRotation:", *(double *)(objc_msgSend(v128, "resultPoseRotation") + 32));
      v129 = objc_retainAutorelease(v128);
      objc_msgSend(v9, "addResultPoseRotation:", *(double *)(objc_msgSend(v129, "resultPoseRotation") + 40));
      v130 = objc_retainAutorelease(v129);
      objc_msgSend(v9, "addResultPoseRotation:", *(double *)(objc_msgSend(v130, "resultPoseRotation") + 48));
      v131 = objc_retainAutorelease(v130);
      objc_msgSend(v9, "addResultPoseRotation:", *(double *)(objc_msgSend(v131, "resultPoseRotation") + 56));
      v132 = objc_retainAutorelease(v131);
      objc_msgSend(v9, "addResultPoseRotation:", *(double *)(objc_msgSend(v132, "resultPoseRotation") + 64));
      v133 = objc_retainAutorelease(v132);
      objc_msgSend(v9, "setResultTranslationX:", *(double *)objc_msgSend(v133, "resultPoseTranslation"));
      v134 = objc_retainAutorelease(v133);
      objc_msgSend(v9, "setResultTranslationY:", *(double *)(objc_msgSend(v134, "resultPoseTranslation") + 8));
      v135 = objc_retainAutorelease(v134);
      objc_msgSend(v9, "setResultTranslationZ:", *(double *)(objc_msgSend(v135, "resultPoseTranslation") + 16));
      if (objc_msgSend(v135, "inliersCount"))
      {
        v136 = 0;
        v137 = 0;
        v138 = 0;
        do
        {
          v139 = objc_retainAutorelease(v135);
          LODWORD(v140) = *(_DWORD *)(objc_msgSend(v139, "points2D") + v136);
          objc_msgSend(v9, "addInlierPoints2D:", v140);
          v141 = objc_retainAutorelease(v139);
          LODWORD(v142) = *(_DWORD *)(objc_msgSend(v141, "points2D") + v136 + 4);
          objc_msgSend(v9, "addInlierPoints2D:", v142);
          v143 = objc_retainAutorelease(v141);
          v144 = *(double *)(objc_msgSend(v143, "points3D") + v137);
          objc_msgSend(v9, "addInlierPoints3D:", v144);
          v145 = objc_retainAutorelease(v143);
          v146 = *(double *)(objc_msgSend(v145, "points3D") + v137 + 8);
          objc_msgSend(v9, "addInlierPoints3D:", v146);
          v147 = objc_retainAutorelease(v145);
          v148 = *(double *)(objc_msgSend(v147, "points3D") + v137 + 16);
          objc_msgSend(v9, "addInlierPoints3D:", v148);
          v149 = *(_QWORD *)(v152 + 32);
          if (v149)
            objc_msgSend(v9, "addSlamPtsInlierIdx:", *(__int16 *)(v149 + 2 * v138));
          ++v138;
          v137 += 24;
          v136 += 8;
        }
        while (v138 < objc_msgSend(v147, "inliersCount"));
      }
      objc_msgSend(v9, "setStartFrameIdx:", *(_DWORD *)(v152 + 296) & ~(*(int *)(v152 + 296) >> 31));
      v150 = v9;
      v4 = v153;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
