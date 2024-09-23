@implementation SBFCAColorMatrixSettings

- (void)setDefaultValues
{
  __int128 v2;
  __int128 v3;
  _OWORD v4[5];

  v2 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 48);
  v4[2] = *(_OWORD *)(MEMORY[0x1E0CD2338] + 32);
  v4[3] = v2;
  v4[4] = *(_OWORD *)(MEMORY[0x1E0CD2338] + 64);
  v3 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 16);
  v4[0] = *MEMORY[0x1E0CD2338];
  v4[1] = v3;
  -[SBFCAColorMatrixSettings setColorMatrix:](self, "setColorMatrix:", v4);
}

+ (id)settingsControllerModule
{
  uint64_t v2;
  uint64_t v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  _QWORD v154[53];

  v154[51] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF.controlFirstThreeRowsTogether == YES"));
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF.controlFirstThreeRowsTogether == NO"));
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Control first 3 rows together"), CFSTR("controlFirstThreeRowsTogether"));
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v154[0] = v152;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("M11"), CFSTR("m11"));
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "precision:", 3);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "condition:", v3);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v154[1] = v149;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("M12"), CFSTR("m12"));
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "precision:", 3);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "condition:", v3);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v154[2] = v146;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("M13"), CFSTR("m13"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "precision:", 3);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "condition:", v3);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v154[3] = v143;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("M14"), CFSTR("m14"));
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "precision:", 3);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "condition:", v3);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v154[4] = v140;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("M15"), CFSTR("m15"));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "precision:", 3);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "condition:", v3);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v154[5] = v137;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("M21"), CFSTR("m21"));
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "precision:", 3);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "condition:", v3);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v154[6] = v134;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("M22"), CFSTR("m22"));
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "precision:", 3);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "condition:", v3);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v154[7] = v131;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("M23"), CFSTR("m23"));
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "precision:", 3);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "condition:", v3);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v154[8] = v128;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("M24"), CFSTR("m24"));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "precision:", 3);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "condition:", v3);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v154[9] = v125;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("M25"), CFSTR("m25"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "precision:", 3);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "condition:", v3);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v154[10] = v122;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("M31"), CFSTR("m31"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "precision:", 3);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "condition:", v3);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v154[11] = v119;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("M32"), CFSTR("m32"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "precision:", 3);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "condition:", v3);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v154[12] = v116;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("M33"), CFSTR("m33"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "precision:", 3);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "condition:", v3);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v154[13] = v113;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("M34"), CFSTR("m34"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "precision:", 3);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "condition:", v3);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v154[14] = v110;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("M35"), CFSTR("m35"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "precision:", 3);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "condition:", v3);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v154[15] = v107;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Mx1"), CFSTR("mx1"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "precision:", 3);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "condition:", v2);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v154[16] = v104;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Mx2"), CFSTR("mx2"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "precision:", 3);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "condition:", v2);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v154[17] = v101;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Mx3"), CFSTR("mx3"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "precision:", 3);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "condition:", v2);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v154[18] = v98;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Mx4"), CFSTR("mx4"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "precision:", 3);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "condition:", v2);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v154[19] = v95;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Mx5"), CFSTR("mx5"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "precision:", 3);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "condition:", v2);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v154[20] = v92;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("M41"), CFSTR("m41"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "precision:", 3);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v154[21] = v90;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("M42"), CFSTR("m42"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "precision:", 3);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v154[22] = v88;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("M43"), CFSTR("m43"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "precision:", 3);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v154[23] = v86;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("M44"), CFSTR("m44"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "precision:", 3);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v154[24] = v84;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("M45"), CFSTR("m45"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "precision:", 3);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v154[25] = v82;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("M11"), CFSTR("m11"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "minValue:maxValue:", -1.0, 1.0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "condition:", v3);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v154[26] = v78;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("M12"), CFSTR("m12"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "minValue:maxValue:", -1.0, 1.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "condition:", v3);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v154[27] = v75;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("M13"), CFSTR("m13"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "minValue:maxValue:", -1.0, 1.0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "condition:", v3);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v154[28] = v72;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("M14"), CFSTR("m14"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "minValue:maxValue:", -1.0, 1.0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "condition:", v3);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v154[29] = v68;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("M15"), CFSTR("m15"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "minValue:maxValue:", -1.0, 1.0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "condition:", v3);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v154[30] = v65;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("M21"), CFSTR("m21"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "minValue:maxValue:", -1.0, 1.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "condition:", v3);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v154[31] = v62;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("M22"), CFSTR("m22"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "minValue:maxValue:", -1.0, 1.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "condition:", v3);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v154[32] = v59;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("M23"), CFSTR("m23"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "minValue:maxValue:", -1.0, 1.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "condition:", v3);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v154[33] = v55;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("M24"), CFSTR("m24"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "minValue:maxValue:", -1.0, 1.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "condition:", v3);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v154[34] = v52;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("M25"), CFSTR("m25"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "minValue:maxValue:", -1.0, 1.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "condition:", v3);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v154[35] = v49;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("M31"), CFSTR("m31"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "minValue:maxValue:", -1.0, 1.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "condition:", v3);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v154[36] = v46;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("M32"), CFSTR("m32"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "minValue:maxValue:", -1.0, 1.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "condition:", v3);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v154[37] = v43;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("M33"), CFSTR("m33"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "minValue:maxValue:", -1.0, 1.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "condition:", v3);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v154[38] = v40;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("M34"), CFSTR("m34"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "minValue:maxValue:", -1.0, 1.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = (void *)v3;
  objc_msgSend(v38, "condition:", v3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v154[39] = v37;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("M35"), CFSTR("m35"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "minValue:maxValue:", -1.0, 1.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "condition:", v3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v154[40] = v34;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Mx1"), CFSTR("mx1"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "minValue:maxValue:", -1.0, 1.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "condition:", v2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v154[41] = v31;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Mx2"), CFSTR("mx2"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "minValue:maxValue:", -1.0, 1.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "condition:", v2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v154[42] = v28;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Mx3"), CFSTR("mx3"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "minValue:maxValue:", -1.0, 1.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "condition:", v2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v154[43] = v25;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Mx4"), CFSTR("mx4"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "minValue:maxValue:", -1.0, 1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = (void *)v2;
  objc_msgSend(v23, "condition:", v2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v154[44] = v22;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Mx5"), CFSTR("mx5"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "minValue:maxValue:", -1.0, 1.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "condition:", v2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v154[45] = v19;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("M41"), CFSTR("m41"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minValue:maxValue:", -1.0, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v154[46] = v5;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("M42"), CFSTR("m42"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minValue:maxValue:", -1.0, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v154[47] = v7;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("M43"), CFSTR("m43"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minValue:maxValue:", -1.0, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v154[48] = v9;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("M44"), CFSTR("m44"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minValue:maxValue:", -1.0, 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v154[49] = v11;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("M45"), CFSTR("m45"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "minValue:maxValue:", -1.0, 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v154[50] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v154, 51);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83070], "sectionWithRows:", v58);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v153 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v153, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "moduleWithTitle:contents:", CFSTR("Color Matrix (M<row><column>)"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (BOOL)ignoresKey:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("colorMatrix")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("mx1")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("mx2")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("mx3")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("mx4")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("mx5"));
  }

  return v4;
}

- (id)drillDownSummary
{
  void *v3;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SBFCAColorMatrixSettings m11](self, "m11");
  v43 = v4;
  -[SBFCAColorMatrixSettings m12](self, "m12");
  v42 = v5;
  -[SBFCAColorMatrixSettings m13](self, "m13");
  v41 = v6;
  -[SBFCAColorMatrixSettings m14](self, "m14");
  v40 = v7;
  -[SBFCAColorMatrixSettings m15](self, "m15");
  v39 = v8;
  -[SBFCAColorMatrixSettings m21](self, "m21");
  v38 = v9;
  -[SBFCAColorMatrixSettings m22](self, "m22");
  v37 = v10;
  -[SBFCAColorMatrixSettings m23](self, "m23");
  v36 = v11;
  -[SBFCAColorMatrixSettings m24](self, "m24");
  v35 = v12;
  -[SBFCAColorMatrixSettings m25](self, "m25");
  v34 = v13;
  -[SBFCAColorMatrixSettings m31](self, "m31");
  v33 = v14;
  -[SBFCAColorMatrixSettings m32](self, "m32");
  v16 = v15;
  -[SBFCAColorMatrixSettings m33](self, "m33");
  v18 = v17;
  -[SBFCAColorMatrixSettings m34](self, "m34");
  v20 = v19;
  -[SBFCAColorMatrixSettings m35](self, "m35");
  v22 = v21;
  -[SBFCAColorMatrixSettings m41](self, "m41");
  v24 = v23;
  -[SBFCAColorMatrixSettings m42](self, "m42");
  v26 = v25;
  -[SBFCAColorMatrixSettings m43](self, "m43");
  v28 = v27;
  -[SBFCAColorMatrixSettings m44](self, "m44");
  v30 = v29;
  -[SBFCAColorMatrixSettings m45](self, "m45");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("(%.3g, %.3g, %.3g, %.3g, %.3g)\n(%.3g, %.3g, %.3g, %.3g, %.3g)\n(%.3g, %.3g, %.3g, %.3g, %.3g)\n(%.3g, %.3g, %.3g, %.3g, %.3g)\n"), v43, v42, v41, v40, v39, v38, v37, v36, v35, v34, v33, v16, v18, v20, v22, v24,
               v26,
               v28,
               v30,
               v31);
}

- (void)setControlFirstThreeRowsTogether:(BOOL)a3
{
  if (a3)
  {
    -[SBFCAColorMatrixSettings m11](self, "m11");
    -[SBFCAColorMatrixSettings setMx1:](self, "setMx1:");
    -[SBFCAColorMatrixSettings m12](self, "m12");
    -[SBFCAColorMatrixSettings setMx2:](self, "setMx2:");
    -[SBFCAColorMatrixSettings m13](self, "m13");
    -[SBFCAColorMatrixSettings setMx3:](self, "setMx3:");
    -[SBFCAColorMatrixSettings m14](self, "m14");
    -[SBFCAColorMatrixSettings setMx4:](self, "setMx4:");
    -[SBFCAColorMatrixSettings m15](self, "m15");
    -[SBFCAColorMatrixSettings setMx5:](self, "setMx5:");
  }
  self->_controlFirstThreeRowsTogether = a3;
}

- (void)setMx1:(double)a3
{
  -[SBFCAColorMatrixSettings setM11:](self, "setM11:");
  -[SBFCAColorMatrixSettings setM21:](self, "setM21:", a3);
  -[SBFCAColorMatrixSettings setM31:](self, "setM31:", a3);
}

- (void)setMx2:(double)a3
{
  -[SBFCAColorMatrixSettings setM12:](self, "setM12:");
  -[SBFCAColorMatrixSettings setM22:](self, "setM22:", a3);
  -[SBFCAColorMatrixSettings setM32:](self, "setM32:", a3);
}

- (void)setMx3:(double)a3
{
  -[SBFCAColorMatrixSettings setM13:](self, "setM13:");
  -[SBFCAColorMatrixSettings setM23:](self, "setM23:", a3);
  -[SBFCAColorMatrixSettings setM33:](self, "setM33:", a3);
}

- (void)setMx4:(double)a3
{
  -[SBFCAColorMatrixSettings setM14:](self, "setM14:");
  -[SBFCAColorMatrixSettings setM24:](self, "setM24:", a3);
  -[SBFCAColorMatrixSettings setM34:](self, "setM34:", a3);
}

- (void)setMx5:(double)a3
{
  -[SBFCAColorMatrixSettings setM15:](self, "setM15:");
  -[SBFCAColorMatrixSettings setM25:](self, "setM25:", a3);
  -[SBFCAColorMatrixSettings setM35:](self, "setM35:", a3);
}

- (void)setColorMatrix:(CAColorMatrix *)a3
{
  -[SBFCAColorMatrixSettings setM11:](self, "setM11:", a3->var0);
  -[SBFCAColorMatrixSettings setM12:](self, "setM12:", a3->var1);
  -[SBFCAColorMatrixSettings setM13:](self, "setM13:", a3->var2);
  -[SBFCAColorMatrixSettings setM14:](self, "setM14:", a3->var3);
  -[SBFCAColorMatrixSettings setM15:](self, "setM15:", a3->var4);
  -[SBFCAColorMatrixSettings setM21:](self, "setM21:", a3->var5);
  -[SBFCAColorMatrixSettings setM22:](self, "setM22:", a3->var6);
  -[SBFCAColorMatrixSettings setM23:](self, "setM23:", a3->var7);
  -[SBFCAColorMatrixSettings setM24:](self, "setM24:", a3->var8);
  -[SBFCAColorMatrixSettings setM25:](self, "setM25:", a3->var9);
  -[SBFCAColorMatrixSettings setM31:](self, "setM31:", a3->var10);
  -[SBFCAColorMatrixSettings setM32:](self, "setM32:", a3->var11);
  -[SBFCAColorMatrixSettings setM33:](self, "setM33:", a3->var12);
  -[SBFCAColorMatrixSettings setM34:](self, "setM34:", a3->var13);
  -[SBFCAColorMatrixSettings setM35:](self, "setM35:", a3->var14);
  -[SBFCAColorMatrixSettings setM41:](self, "setM41:", a3->var15);
  -[SBFCAColorMatrixSettings setM42:](self, "setM42:", a3->var16);
  -[SBFCAColorMatrixSettings setM43:](self, "setM43:", a3->var17);
  -[SBFCAColorMatrixSettings setM44:](self, "setM44:", a3->var18);
  -[SBFCAColorMatrixSettings setM45:](self, "setM45:", a3->var19);
}

- (CAColorMatrix)colorMatrix
{
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
  CAColorMatrix *result;
  double v25;

  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  -[SBFCAColorMatrixSettings m11](self, "m11");
  *(float *)&v5 = v5;
  retstr->var0 = *(float *)&v5;
  -[SBFCAColorMatrixSettings m12](self, "m12");
  *(float *)&v6 = v6;
  retstr->var1 = *(float *)&v6;
  -[SBFCAColorMatrixSettings m13](self, "m13");
  *(float *)&v7 = v7;
  retstr->var2 = *(float *)&v7;
  -[SBFCAColorMatrixSettings m14](self, "m14");
  *(float *)&v8 = v8;
  retstr->var3 = *(float *)&v8;
  -[SBFCAColorMatrixSettings m15](self, "m15");
  *(float *)&v9 = v9;
  retstr->var4 = *(float *)&v9;
  -[SBFCAColorMatrixSettings m21](self, "m21");
  *(float *)&v10 = v10;
  retstr->var5 = *(float *)&v10;
  -[SBFCAColorMatrixSettings m22](self, "m22");
  *(float *)&v11 = v11;
  retstr->var6 = *(float *)&v11;
  -[SBFCAColorMatrixSettings m23](self, "m23");
  *(float *)&v12 = v12;
  retstr->var7 = *(float *)&v12;
  -[SBFCAColorMatrixSettings m24](self, "m24");
  *(float *)&v13 = v13;
  retstr->var8 = *(float *)&v13;
  -[SBFCAColorMatrixSettings m25](self, "m25");
  *(float *)&v14 = v14;
  retstr->var9 = *(float *)&v14;
  -[SBFCAColorMatrixSettings m31](self, "m31");
  *(float *)&v15 = v15;
  retstr->var10 = *(float *)&v15;
  -[SBFCAColorMatrixSettings m32](self, "m32");
  *(float *)&v16 = v16;
  retstr->var11 = *(float *)&v16;
  -[SBFCAColorMatrixSettings m33](self, "m33");
  *(float *)&v17 = v17;
  retstr->var12 = *(float *)&v17;
  -[SBFCAColorMatrixSettings m34](self, "m34");
  *(float *)&v18 = v18;
  retstr->var13 = *(float *)&v18;
  -[SBFCAColorMatrixSettings m35](self, "m35");
  *(float *)&v19 = v19;
  retstr->var14 = *(float *)&v19;
  -[SBFCAColorMatrixSettings m41](self, "m41");
  *(float *)&v20 = v20;
  retstr->var15 = *(float *)&v20;
  -[SBFCAColorMatrixSettings m42](self, "m42");
  *(float *)&v21 = v21;
  retstr->var16 = *(float *)&v21;
  -[SBFCAColorMatrixSettings m43](self, "m43");
  *(float *)&v22 = v22;
  retstr->var17 = *(float *)&v22;
  -[SBFCAColorMatrixSettings m44](self, "m44");
  *(float *)&v23 = v23;
  retstr->var18 = *(float *)&v23;
  result = (CAColorMatrix *)-[SBFCAColorMatrixSettings m45](self, "m45");
  *(float *)&v25 = v25;
  retstr->var19 = *(float *)&v25;
  return result;
}

- (double)m11
{
  return self->_m11;
}

- (void)setM11:(double)a3
{
  self->_m11 = a3;
}

- (double)m12
{
  return self->_m12;
}

- (void)setM12:(double)a3
{
  self->_m12 = a3;
}

- (double)m13
{
  return self->_m13;
}

- (void)setM13:(double)a3
{
  self->_m13 = a3;
}

- (double)m14
{
  return self->_m14;
}

- (void)setM14:(double)a3
{
  self->_m14 = a3;
}

- (double)m15
{
  return self->_m15;
}

- (void)setM15:(double)a3
{
  self->_m15 = a3;
}

- (double)m21
{
  return self->_m21;
}

- (void)setM21:(double)a3
{
  self->_m21 = a3;
}

- (double)m22
{
  return self->_m22;
}

- (void)setM22:(double)a3
{
  self->_m22 = a3;
}

- (double)m23
{
  return self->_m23;
}

- (void)setM23:(double)a3
{
  self->_m23 = a3;
}

- (double)m24
{
  return self->_m24;
}

- (void)setM24:(double)a3
{
  self->_m24 = a3;
}

- (double)m25
{
  return self->_m25;
}

- (void)setM25:(double)a3
{
  self->_m25 = a3;
}

- (double)m31
{
  return self->_m31;
}

- (void)setM31:(double)a3
{
  self->_m31 = a3;
}

- (double)m32
{
  return self->_m32;
}

- (void)setM32:(double)a3
{
  self->_m32 = a3;
}

- (double)m33
{
  return self->_m33;
}

- (void)setM33:(double)a3
{
  self->_m33 = a3;
}

- (double)m34
{
  return self->_m34;
}

- (void)setM34:(double)a3
{
  self->_m34 = a3;
}

- (double)m35
{
  return self->_m35;
}

- (void)setM35:(double)a3
{
  self->_m35 = a3;
}

- (double)m41
{
  return self->_m41;
}

- (void)setM41:(double)a3
{
  self->_m41 = a3;
}

- (double)m42
{
  return self->_m42;
}

- (void)setM42:(double)a3
{
  self->_m42 = a3;
}

- (double)m43
{
  return self->_m43;
}

- (void)setM43:(double)a3
{
  self->_m43 = a3;
}

- (double)m44
{
  return self->_m44;
}

- (void)setM44:(double)a3
{
  self->_m44 = a3;
}

- (double)m45
{
  return self->_m45;
}

- (void)setM45:(double)a3
{
  self->_m45 = a3;
}

- (BOOL)controlFirstThreeRowsTogether
{
  return self->_controlFirstThreeRowsTogether;
}

@end
