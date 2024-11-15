@implementation NSCharacterSet(TTRAdditions)

+ (id)hashtagTokenAllowedCharacters
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3780], "alphanumericCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "emojis");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "formUnionWithCharacterSet:", v1);

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("-_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "formUnionWithCharacterSet:", v2);

  objc_msgSend(MEMORY[0x1E0CB3500], "makeFormatCharacters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "formUnionWithCharacterSet:", v3);

  objc_msgSend(MEMORY[0x1E0CB3500], "symbolCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "formUnionWithCharacterSet:", v4);

  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "formUnionWithCharacterSet:", v5);

  objc_msgSend(MEMORY[0x1E0CB3500], "subtractOtherPunctuationCharactersFrom:", v0);
  return v0;
}

+ (id)makeFormatCharacters
{
  id v0;
  uint64_t i;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = xmmword_1B4B73660;
  v4 = xmmword_1B4B73670;
  v5 = xmmword_1B4B73680;
  v6 = xmmword_1B4B73690;
  v7 = xmmword_1B4B736A0;
  v8 = xmmword_1B4B736B0;
  v9 = xmmword_1B4B736C0;
  v10 = xmmword_1B4B736D0;
  v11 = xmmword_1B4B736E0;
  v12 = xmmword_1B4B736F0;
  v13 = xmmword_1B4B73700;
  v14 = xmmword_1B4B73710;
  v15 = xmmword_1B4B73720;
  v16 = xmmword_1B4B73730;
  v17 = xmmword_1B4B73740;
  v18 = xmmword_1B4B73750;
  v19 = xmmword_1B4B73760;
  v20 = xmmword_1B4B73770;
  v21 = xmmword_1B4B73780;
  v22 = xmmword_1B4B73790;
  v0 = objc_alloc_init(MEMORY[0x1E0CB3780]);
  for (i = 0; i != 320; i += 16)
    objc_msgSend(v0, "addCharactersInRange:", *(_QWORD *)((char *)&v3 + i), *(_QWORD *)((char *)&v3 + i + 8), v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17,
      v18,
      v19,
      v20,
      v21,
      v22);
  return v0;
}

+ (uint64_t)subtractOtherPunctuationCharactersFrom:()TTRAdditions
{
  uint64_t v4;
  uint64_t result;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  uint64_t v189;

  v4 = 0;
  v189 = *MEMORY[0x1E0C80C00];
  v6 = xmmword_1B4B737A0;
  v7 = xmmword_1B4B737B0;
  v8 = xmmword_1B4B737C0;
  v9 = xmmword_1B4B737D0;
  v10 = xmmword_1B4B737E0;
  v11 = xmmword_1B4B737F0;
  v12 = xmmword_1B4B73800;
  v13 = xmmword_1B4B73810;
  v14 = xmmword_1B4B73820;
  v15 = xmmword_1B4B73830;
  v16 = xmmword_1B4B73840;
  v17 = xmmword_1B4B73850;
  v18 = xmmword_1B4B73860;
  v19 = xmmword_1B4B73870;
  v20 = xmmword_1B4B73880;
  v21 = xmmword_1B4B73890;
  v22 = xmmword_1B4B738A0;
  v23 = xmmword_1B4B738B0;
  v24 = xmmword_1B4B738C0;
  v25 = xmmword_1B4B738D0;
  v26 = xmmword_1B4B738E0;
  v27 = xmmword_1B4B738F0;
  v28 = xmmword_1B4B73900;
  v29 = xmmword_1B4B73910;
  v30 = xmmword_1B4B73920;
  v31 = xmmword_1B4B73930;
  v32 = xmmword_1B4B73940;
  v33 = xmmword_1B4B73950;
  v34 = xmmword_1B4B73960;
  v35 = xmmword_1B4B73970;
  v36 = xmmword_1B4B73980;
  v37 = xmmword_1B4B73990;
  v38 = xmmword_1B4B739A0;
  v39 = xmmword_1B4B739B0;
  v40 = xmmword_1B4B739C0;
  v41 = xmmword_1B4B739D0;
  v42 = xmmword_1B4B739E0;
  v43 = xmmword_1B4B739F0;
  v44 = xmmword_1B4B73A00;
  v45 = xmmword_1B4B73A10;
  v46 = xmmword_1B4B73A20;
  v47 = xmmword_1B4B73A30;
  v48 = xmmword_1B4B73A40;
  v49 = xmmword_1B4B73A50;
  v50 = xmmword_1B4B73A60;
  v51 = xmmword_1B4B73A70;
  v52 = xmmword_1B4B73A80;
  v53 = xmmword_1B4B73A90;
  v54 = xmmword_1B4B73AA0;
  v55 = xmmword_1B4B73AB0;
  v56 = xmmword_1B4B73AC0;
  v57 = xmmword_1B4B73AD0;
  v58 = xmmword_1B4B73AE0;
  v59 = xmmword_1B4B73AF0;
  v60 = xmmword_1B4B73B00;
  v61 = xmmword_1B4B73B10;
  v62 = xmmword_1B4B73B20;
  v63 = xmmword_1B4B73B30;
  v64 = xmmword_1B4B73B40;
  v65 = xmmword_1B4B73B50;
  v66 = xmmword_1B4B73B60;
  v67 = xmmword_1B4B73B70;
  v68 = xmmword_1B4B73B80;
  v69 = xmmword_1B4B73B90;
  v70 = xmmword_1B4B73BA0;
  v71 = xmmword_1B4B73BB0;
  v72 = xmmword_1B4B73BC0;
  v73 = xmmword_1B4B73BD0;
  v74 = xmmword_1B4B73BE0;
  v75 = xmmword_1B4B73BF0;
  v76 = xmmword_1B4B73C00;
  v77 = xmmword_1B4B73C10;
  v78 = xmmword_1B4B73C20;
  v79 = xmmword_1B4B73C30;
  v80 = xmmword_1B4B73C40;
  v81 = xmmword_1B4B73C50;
  v82 = xmmword_1B4B73C60;
  v83 = xmmword_1B4B73C70;
  v84 = xmmword_1B4B73C80;
  v85 = xmmword_1B4B73C90;
  v86 = xmmword_1B4B73CA0;
  v87 = xmmword_1B4B73CB0;
  v88 = xmmword_1B4B73CC0;
  v89 = xmmword_1B4B73CD0;
  v90 = xmmword_1B4B73CE0;
  v91 = xmmword_1B4B73CF0;
  v92 = xmmword_1B4B73D00;
  v93 = xmmword_1B4B73D10;
  v94 = xmmword_1B4B73D20;
  v95 = xmmword_1B4B73D30;
  v96 = xmmword_1B4B73D40;
  v97 = xmmword_1B4B73D50;
  v98 = xmmword_1B4B73D60;
  v99 = xmmword_1B4B73D70;
  v100 = xmmword_1B4B73D80;
  v101 = xmmword_1B4B73D90;
  v102 = xmmword_1B4B73DA0;
  v103 = xmmword_1B4B73DB0;
  v104 = xmmword_1B4B73DC0;
  v105 = xmmword_1B4B73DD0;
  v106 = xmmword_1B4B73DE0;
  v107 = xmmword_1B4B73DF0;
  v108 = xmmword_1B4B73E00;
  v109 = xmmword_1B4B73E10;
  v110 = xmmword_1B4B73E20;
  v111 = xmmword_1B4B73E30;
  v112 = xmmword_1B4B73E40;
  v113 = xmmword_1B4B73E50;
  v114 = xmmword_1B4B73E60;
  v115 = xmmword_1B4B73E70;
  v116 = xmmword_1B4B73E80;
  v117 = xmmword_1B4B73E90;
  v118 = xmmword_1B4B73EA0;
  v119 = xmmword_1B4B73EB0;
  v120 = xmmword_1B4B73EC0;
  v121 = xmmword_1B4B73ED0;
  v122 = xmmword_1B4B73EE0;
  v123 = xmmword_1B4B73EF0;
  v124 = xmmword_1B4B73F00;
  v125 = xmmword_1B4B73F10;
  v126 = xmmword_1B4B73F20;
  v127 = xmmword_1B4B73F30;
  v128 = xmmword_1B4B73F40;
  v129 = xmmword_1B4B73F50;
  v130 = xmmword_1B4B73F60;
  v131 = xmmword_1B4B73F70;
  v132 = xmmword_1B4B73F80;
  v133 = xmmword_1B4B73F90;
  v134 = xmmword_1B4B73FA0;
  v135 = xmmword_1B4B73FB0;
  v136 = xmmword_1B4B73FC0;
  v137 = xmmword_1B4B73FD0;
  v138 = xmmword_1B4B73FE0;
  v139 = xmmword_1B4B73FF0;
  v140 = xmmword_1B4B74000;
  v141 = xmmword_1B4B74010;
  v142 = xmmword_1B4B74020;
  v143 = xmmword_1B4B74030;
  v144 = xmmword_1B4B74040;
  v145 = xmmword_1B4B74050;
  v146 = xmmword_1B4B74060;
  v147 = xmmword_1B4B74070;
  v148 = xmmword_1B4B74080;
  v149 = xmmword_1B4B74090;
  v150 = xmmword_1B4B740A0;
  v151 = xmmword_1B4B740B0;
  v152 = xmmword_1B4B740C0;
  v153 = xmmword_1B4B740D0;
  v154 = xmmword_1B4B740E0;
  v155 = xmmword_1B4B740F0;
  v156 = xmmword_1B4B74100;
  v157 = xmmword_1B4B74110;
  v158 = xmmword_1B4B74120;
  v159 = xmmword_1B4B74130;
  v160 = xmmword_1B4B74140;
  v161 = xmmword_1B4B74150;
  v162 = xmmword_1B4B74160;
  v163 = xmmword_1B4B74170;
  v164 = xmmword_1B4B74180;
  v165 = xmmword_1B4B74190;
  v166 = xmmword_1B4B741A0;
  v167 = xmmword_1B4B741B0;
  v168 = xmmword_1B4B741C0;
  v169 = xmmword_1B4B741D0;
  v170 = xmmword_1B4B741E0;
  v171 = xmmword_1B4B741F0;
  v172 = xmmword_1B4B74200;
  v173 = xmmword_1B4B74210;
  v174 = xmmword_1B4B74220;
  v175 = xmmword_1B4B74230;
  v176 = xmmword_1B4B74240;
  v177 = xmmword_1B4B74250;
  v178 = xmmword_1B4B74260;
  v179 = xmmword_1B4B74270;
  v180 = xmmword_1B4B74280;
  v181 = xmmword_1B4B74290;
  v182 = xmmword_1B4B742A0;
  v183 = xmmword_1B4B742B0;
  v184 = xmmword_1B4B742C0;
  v185 = xmmword_1B4B742D0;
  v186 = xmmword_1B4B742E0;
  v187 = xmmword_1B4B742F0;
  v188 = xmmword_1B4B74300;
  do
  {
    result = objc_msgSend(a3, "removeCharactersInRange:", *(_QWORD *)((char *)&v6 + v4), *(_QWORD *)((char *)&v6 + v4 + 8), v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
               v21,
               v22,
               v23,
               v24,
               v25,
               v26,
               v27,
               v28,
               v29,
               v30,
               v31,
               v32,
               v33,
               v34,
               (_QWORD)v35);
    v4 += 16;
  }
  while (v4 != 2928);
  return result;
}

@end
