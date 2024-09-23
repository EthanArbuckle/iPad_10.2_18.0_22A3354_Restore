@implementation CAMeshTransform(VideosUI)

+ (id)vuiMeshTransformWithEdges:()VideosUI mirrorPercentage:
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  void *v16;
  int v17;
  __int128 *v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  _OWORD v23[18];
  _OWORD v24[2];
  uint64_t v25;
  double v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  double v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  __int128 v54;
  double v55;
  uint64_t v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  uint64_t v61;
  double v62;
  uint64_t v63;
  double v64;
  double v65;
  double v66;
  double v67;
  uint64_t v68;
  double v69;
  double v70;
  double v71;
  double v72;
  __int128 v73;
  double v74;
  uint64_t v75;
  double v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  __int128 v80;
  uint64_t v81;
  double v82;
  uint64_t v83;
  double v84;
  __int128 v85;
  double v86;
  uint64_t v87;
  double v88;
  uint64_t v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  memset(v24, 0, sizeof(v24));
  v26 = a1;
  v27 = 0;
  v28 = -a1;
  v29 = 0;
  v30 = 0;
  v31 = 1.0 - a1;
  v32 = 0;
  v33 = a1 + 1.0;
  v34 = 0;
  v35 = 0;
  v36 = xmmword_1DA1C2500;
  v37 = 0x3FF0000000000000;
  v38 = 0;
  v39 = 0;
  v40 = 0;
  v41 = a1;
  v42 = 0;
  v43 = -a1;
  v44 = 0;
  v45 = a1;
  v46 = a1;
  v47 = -a1;
  v48 = -a1;
  v49 = 0;
  v50 = 1.0 - a1;
  v51 = a1;
  v52 = a1 + 1.0;
  v53 = -a1;
  v54 = xmmword_1DA1C23E0;
  v55 = a1;
  v56 = 0x3FF0000000000000;
  v57 = -a1;
  v59 = 0;
  v58 = 0;
  v60 = 1.0 - a1;
  v61 = 0;
  v62 = a1 + 1.0;
  v63 = 0;
  v64 = a1;
  v65 = 1.0 - a1;
  v66 = -a1;
  v67 = a1 + 1.0;
  v68 = 0;
  v69 = 1.0 - a1;
  v70 = 1.0 - a1;
  v71 = a1 + 1.0;
  v72 = a1 + 1.0;
  v73 = xmmword_1DA1C23E0;
  v74 = 1.0 - a1;
  v75 = 0x3FF0000000000000;
  v76 = a1 + 1.0;
  v78 = 0;
  v77 = 0;
  v79 = 0x3FF0000000000000;
  v80 = xmmword_1DA1C23E0;
  v81 = 0;
  v82 = a1;
  v83 = 0x3FF0000000000000;
  v84 = -a1;
  v85 = xmmword_1DA1C2500;
  v86 = 1.0 - a1;
  v87 = 0x3FF0000000000000;
  v88 = a1 + 1.0;
  v89 = 0x3FF0000000000000;
  __asm { FMOV            V0.2D, #1.0 }
  v90 = xmmword_1DA1C23E0;
  v91 = _Q0;
  v92 = xmmword_1DA1C2500;
  if (a4 == 15)
  {
    memcpy(v23, &unk_1DA1C2530, sizeof(v23));
    v9 = (void *)MEMORY[0x1E0CD27F0];
    v10 = *MEMORY[0x1E0CD2A90];
    v11 = 9;
  }
  else
  {
    if ((~(_BYTE)a4 & 5) != 0)
    {
      if ((~(_BYTE)a4 & 0xA) != 0)
      {
        v16 = 0;
        switch(a4)
        {
          case 1:
            LODWORD(v23[0]) = 0;
            memset(&v23[1], 0, 48);
            *(_QWORD *)((char *)v23 + 4) = 0xF00000003;
            HIDWORD(v23[0]) = 12;
            *(_QWORD *)((char *)&v23[2] + 4) = 0x700000003;
            v17 = 4;
            goto LABEL_11;
          case 2:
            LODWORD(v23[0]) = 0;
            memset(&v23[1], 0, 48);
            *(_QWORD *)((char *)v23 + 4) = 0xF00000003;
            v17 = 12;
            HIDWORD(v23[0]) = 12;
            *(_QWORD *)((char *)&v23[2] + 4) = 0xD00000001;
LABEL_11:
            HIDWORD(v23[2]) = v17;
            goto LABEL_15;
          case 4:
            v18 = &xmmword_1DA1C2750;
            goto LABEL_14;
          case 8:
            v18 = &xmmword_1DA1C2710;
LABEL_14:
            v19 = v18[1];
            v23[0] = *v18;
            v23[1] = v19;
            v20 = v18[3];
            v23[2] = v18[2];
            v23[3] = v20;
LABEL_15:
            v9 = (void *)MEMORY[0x1E0CD27F0];
            v10 = *MEMORY[0x1E0CD2A90];
            v11 = 2;
            goto LABEL_16;
          default:
            goto LABEL_17;
        }
      }
      v12 = &xmmword_1DA1C26B0;
    }
    else
    {
      v12 = &xmmword_1DA1C2650;
    }
    v13 = v12[3];
    v23[2] = v12[2];
    v23[3] = v13;
    v14 = v12[5];
    v23[4] = v12[4];
    v23[5] = v14;
    v15 = v12[1];
    v23[0] = *v12;
    v23[1] = v15;
    v9 = (void *)MEMORY[0x1E0CD27F0];
    v10 = *MEMORY[0x1E0CD2A90];
    v11 = 3;
  }
LABEL_16:
  objc_msgSend(v9, "meshTransformWithVertexCount:vertices:faceCount:faces:depthNormalization:", 16, v24, v11, v23, v10, v23[0], v23[1], v23[2], v23[3], v23[4], v23[5]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
  objc_msgSend(v16, "setSubdivisionSteps:", 0);
  objc_msgSend(v16, "setReplicatesEdges:", 1);
  v21 = (void *)objc_msgSend(v16, "copy");

  return v21;
}

@end
