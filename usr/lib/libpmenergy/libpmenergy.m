double pm_task_subtract_version(uint64_t a1, unint64_t *a2, uint64_t a3, _BYTE *a4, int a5)
{
  double result;

  *(_QWORD *)&result = sub_215C111BC(a1, a2, a3, 0xFFFFFFFF, a4, a5).n128_u64[0];
  return result;
}

__n128 sub_215C111BC(uint64_t a1, unint64_t *a2, uint64_t a3, unsigned int a4, _BYTE *a5, int a6)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  BOOL v24;
  unint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  unint64_t *v35;
  unint64_t v36;
  uint64_t *v37;
  uint64_t *v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t *v47;
  unint64_t v48;
  unint64_t *v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t *v54;
  unint64_t v55;
  unint64_t *v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t *v61;
  unint64_t v62;
  unint64_t *v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t *v70;
  unint64_t *v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t *v77;
  unint64_t *v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t *v84;
  unint64_t *v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t *v91;
  unint64_t *v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t *v98;
  unint64_t *v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  unint64_t v104;
  unint64_t *v105;
  unint64_t *v106;
  unint64_t v107;
  unint64_t v108;
  unint64_t v109;
  unint64_t v110;
  unint64_t v111;
  unint64_t *v112;
  unint64_t *v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  unint64_t v117;
  unint64_t v118;
  unint64_t *v119;
  unint64_t *v120;
  unint64_t v121;
  unint64_t v122;
  unint64_t v123;
  unint64_t v124;
  unint64_t v125;
  unint64_t v126;
  unint64_t v127;
  unint64_t *v128;
  unint64_t *v129;
  unint64_t v130;
  unint64_t v131;
  unint64_t v132;
  unint64_t v133;
  unint64_t v134;
  unint64_t *v135;
  unint64_t *v136;
  unint64_t v137;
  unint64_t v138;
  unint64_t *v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __n128 result;
  __int128 v144;
  __int128 v145;

  if (a5)
    *a5 = 0;
  v6 = *(_QWORD *)(a1 + 148);
  if ((a4 & 0x80000000) == 0)
  {
    *(_QWORD *)(a3 + 148) = v6 + *(unint64_t *)((char *)a2 + 148) * a4;
    *(_QWORD *)(a3 + 156) = *(_QWORD *)(a1 + 156) + *(unint64_t *)((char *)a2 + 156) * a4;
    *(_QWORD *)(a3 + 164) = *(_QWORD *)(a1 + 164) + *(unint64_t *)((char *)a2 + 164) * a4;
    *(_QWORD *)(a3 + 172) = *(_QWORD *)(a1 + 172) + *(unint64_t *)((char *)a2 + 172) * a4;
    *(_QWORD *)(a3 + 140) = *(_QWORD *)(a1 + 140) + *(unint64_t *)((char *)a2 + 140) * a4;
    *(_QWORD *)(a3 + 132) = *(_QWORD *)(a1 + 132) + *(unint64_t *)((char *)a2 + 132) * a4;
    v7 = *(_QWORD *)(a1 + 200) + a2[25] * a4;
    *(_QWORD *)(a3 + 192) = *(_QWORD *)(a1 + 192) + a2[24] * a4;
    *(_QWORD *)(a3 + 200) = v7;
    v8 = *(_QWORD *)(a1 + 216) + a2[27] * a4;
    *(_QWORD *)(a3 + 208) = *(_QWORD *)(a1 + 208) + a2[26] * a4;
    *(_QWORD *)(a3 + 216) = v8;
    v9 = *(_QWORD *)(a1 + 232) + a2[29] * a4;
    *(_QWORD *)(a3 + 224) = *(_QWORD *)(a1 + 224) + a2[28] * a4;
    *(_QWORD *)(a3 + 232) = v9;
    v10 = *(_QWORD *)(a1 + 304);
    v11 = a2[38];
    v12 = *(_QWORD *)(a1 + 312) + a2[39] * a4;
    v13 = *(_QWORD *)(a1 + 328) + a2[41] * a4;
    *(_QWORD *)(a3 + 320) = *(_QWORD *)(a1 + 320) + a2[40] * a4;
    *(_QWORD *)(a3 + 328) = v13;
    v14 = *(_QWORD *)(a1 + 264) + a2[33] * a4;
    *(_QWORD *)(a3 + 256) = *(_QWORD *)(a1 + 256) + a2[32] * a4;
    *(_QWORD *)(a3 + 264) = v14;
    v15 = *(_QWORD *)(a1 + 280) + a2[35] * a4;
    *(_QWORD *)(a3 + 272) = *(_QWORD *)(a1 + 272) + a2[34] * a4;
    *(_QWORD *)(a3 + 280) = v15;
    v16 = *(_QWORD *)(a1 + 296) + a2[37] * a4;
    *(_QWORD *)(a3 + 288) = *(_QWORD *)(a1 + 288) + a2[36] * a4;
    *(_QWORD *)(a3 + 296) = v16;
    *(_QWORD *)(a3 + 304) = v10 + v11 * a4;
    *(_QWORD *)(a3 + 312) = v12;
    v17 = *(_QWORD *)(a1 + 344) + a2[43] * a4;
    *(_QWORD *)(a3 + 336) = *(_QWORD *)(a1 + 336) + a2[42] * a4;
    *(_QWORD *)(a3 + 344) = v17;
    v18 = *(_QWORD *)(a1 + 360) + a2[45] * a4;
    *(_QWORD *)(a3 + 352) = *(_QWORD *)(a1 + 352) + a2[44] * a4;
    *(_QWORD *)(a3 + 360) = v18;
    v19 = *(_QWORD *)(a1 + 376) + a2[47] * a4;
    *(_QWORD *)(a3 + 368) = *(_QWORD *)(a1 + 368) + a2[46] * a4;
    *(_QWORD *)(a3 + 376) = v19;
    *(_QWORD *)(a3 + 384) = *(_QWORD *)(a1 + 384) + a2[48] * a4;
    if (a6 > 1)
    {
      v20 = *(_QWORD *)(a1 + 416) + a2[52] * a4;
      *(_QWORD *)(a3 + 408) = *(_QWORD *)(a1 + 408) + a2[51] * a4;
      *(_QWORD *)(a3 + 416) = v20;
      v21 = *(_QWORD *)(a1 + 432) + a2[54] * a4;
      *(_QWORD *)(a3 + 424) = *(_QWORD *)(a1 + 424) + a2[53] * a4;
      *(_QWORD *)(a3 + 432) = v21;
    }
    v22 = *(_QWORD *)(a1 + 392) + a2[49] * a4;
    goto LABEL_128;
  }
  v23 = *(unint64_t *)((char *)a2 + 148);
  v24 = v6 >= v23;
  v25 = v6 - v23;
  if (v24)
  {
    *(_QWORD *)(a3 + 148) = v25;
    v26 = (unint64_t *)(a1 + 156);
    v27 = *(_QWORD *)(a1 + 156);
    v28 = (unint64_t *)((char *)a2 + 156);
    v29 = *(unint64_t *)((char *)a2 + 156);
    if (v27 >= v29)
      goto LABEL_14;
    if (!a5)
      sub_215C134CC(a1 + 156, (uint64_t)a2 + 156, a3);
    goto LABEL_13;
  }
  if (!a5)
    sub_215C123C8(a1 + 148, (uint64_t)a2 + 148, a3);
  *a5 = 1;
  *(_QWORD *)(a3 + 148) = 0;
  v26 = (unint64_t *)(a1 + 156);
  v27 = *(_QWORD *)(a1 + 156);
  v28 = (unint64_t *)((char *)a2 + 156);
  v29 = *(unint64_t *)((char *)a2 + 156);
  *(_QWORD *)(a3 + 148) = *(_QWORD *)(a1 + 148) - *(unint64_t *)((char *)a2 + 148);
  if (v27 < v29)
  {
LABEL_13:
    *a5 = 1;
    *(_QWORD *)(a3 + 156) = 0;
    v27 = *v26;
    v29 = *v28;
  }
LABEL_14:
  *(_QWORD *)(a3 + 156) = v27 - v29;
  v30 = *(_QWORD *)(a1 + 164);
  v31 = *(unint64_t *)((char *)a2 + 164);
  v24 = v30 >= v31;
  v32 = v30 - v31;
  if (v24)
  {
    *(_QWORD *)(a3 + 164) = v32;
    v33 = (unint64_t *)(a1 + 172);
    v34 = *(_QWORD *)(a1 + 172);
    v35 = (unint64_t *)((char *)a2 + 172);
    v36 = *(unint64_t *)((char *)a2 + 172);
    if (v34 >= v36)
      goto LABEL_21;
    if (!a5)
      sub_215C13448(a1 + 172, (uint64_t)a2 + 172, a3);
    goto LABEL_20;
  }
  if (!a5)
    sub_215C1244C(a1 + 164, (uint64_t)a2 + 164, a3);
  *a5 = 1;
  *(_QWORD *)(a3 + 164) = 0;
  v33 = (unint64_t *)(a1 + 172);
  v34 = *(_QWORD *)(a1 + 172);
  v35 = (unint64_t *)((char *)a2 + 172);
  v36 = *(unint64_t *)((char *)a2 + 172);
  *(_QWORD *)(a3 + 164) = *(_QWORD *)(a1 + 164) - *(unint64_t *)((char *)a2 + 164);
  if (v34 < v36)
  {
LABEL_20:
    *a5 = 1;
    *(_QWORD *)(a3 + 172) = 0;
    v34 = *v33;
    v36 = *v35;
  }
LABEL_21:
  v37 = (uint64_t *)(a1 + 132);
  v38 = (uint64_t *)((char *)a2 + 132);
  *(_QWORD *)(a3 + 172) = v34 - v36;
  v39 = *(_QWORD *)(a1 + 140);
  v40 = *(unint64_t *)((char *)a2 + 140);
  v24 = v39 >= v40;
  v41 = v39 - v40;
  if (v24)
  {
    *(_QWORD *)(a3 + 140) = v41;
    v42 = *v37;
    v43 = *v38;
    if (*v37 >= (unint64_t)*v38)
      goto LABEL_28;
    if (!a5)
      sub_215C133C4(a1 + 132, (uint64_t)a2 + 132, a3);
    goto LABEL_27;
  }
  if (!a5)
    sub_215C124D0(a1 + 140, (uint64_t)a2 + 140, a3);
  *a5 = 1;
  *(_QWORD *)(a3 + 140) = 0;
  *(_QWORD *)(a3 + 140) = *(_QWORD *)(a1 + 140) - *(unint64_t *)((char *)a2 + 140);
  v42 = *v37;
  v43 = *v38;
  if (*v37 < (unint64_t)*v38)
  {
LABEL_27:
    *a5 = 1;
    *(_QWORD *)(a3 + 132) = 0;
    v42 = *v37;
    v43 = *v38;
  }
LABEL_28:
  *(_QWORD *)(a3 + 132) = v42 - v43;
  v44 = *(_QWORD *)(a1 + 192);
  v45 = a2[24];
  v24 = v44 >= v45;
  v46 = v44 - v45;
  if (v24)
  {
    *(_QWORD *)(a3 + 192) = v46;
    v47 = (unint64_t *)(a1 + 200);
    v48 = *(_QWORD *)(a1 + 200);
    v49 = a2 + 25;
    v50 = a2[25];
    if (v48 >= v50)
      goto LABEL_35;
    if (!a5)
      sub_215C13340(a1 + 200, (uint64_t)(a2 + 25), a3);
    goto LABEL_34;
  }
  if (!a5)
    sub_215C12554(a1 + 192, (uint64_t)(a2 + 24), a3);
  *a5 = 1;
  *(_QWORD *)(a3 + 192) = 0;
  v47 = (unint64_t *)(a1 + 200);
  v48 = *(_QWORD *)(a1 + 200);
  v49 = a2 + 25;
  v50 = a2[25];
  *(_QWORD *)(a3 + 192) = *(_QWORD *)(a1 + 192) - a2[24];
  if (v48 < v50)
  {
LABEL_34:
    *a5 = 1;
    *(_QWORD *)(a3 + 200) = 0;
    v48 = *v47;
    v50 = *v49;
  }
LABEL_35:
  *(_QWORD *)(a3 + 200) = v48 - v50;
  v51 = *(_QWORD *)(a1 + 208);
  v52 = a2[26];
  v24 = v51 >= v52;
  v53 = v51 - v52;
  if (v24)
  {
    *(_QWORD *)(a3 + 208) = v53;
    v54 = (unint64_t *)(a1 + 216);
    v55 = *(_QWORD *)(a1 + 216);
    v56 = a2 + 27;
    v57 = a2[27];
    if (v55 >= v57)
      goto LABEL_42;
    if (!a5)
      sub_215C132BC(a1 + 216, (uint64_t)(a2 + 27), a3);
    goto LABEL_41;
  }
  if (!a5)
    sub_215C125D8(a1 + 208, (uint64_t)(a2 + 26), a3);
  *a5 = 1;
  *(_QWORD *)(a3 + 208) = 0;
  v54 = (unint64_t *)(a1 + 216);
  v55 = *(_QWORD *)(a1 + 216);
  v56 = a2 + 27;
  v57 = a2[27];
  *(_QWORD *)(a3 + 208) = *(_QWORD *)(a1 + 208) - a2[26];
  if (v55 < v57)
  {
LABEL_41:
    *a5 = 1;
    *(_QWORD *)(a3 + 216) = 0;
    v55 = *v54;
    v57 = *v56;
  }
LABEL_42:
  *(_QWORD *)(a3 + 216) = v55 - v57;
  v58 = *(_QWORD *)(a1 + 224);
  v59 = a2[28];
  v24 = v58 >= v59;
  v60 = v58 - v59;
  if (v24)
  {
    *(_QWORD *)(a3 + 224) = v60;
    v61 = (unint64_t *)(a1 + 232);
    v62 = *(_QWORD *)(a1 + 232);
    v63 = a2 + 29;
    v64 = a2[29];
    if (v62 >= v64)
      goto LABEL_49;
    if (!a5)
      sub_215C13238(a1 + 232, (uint64_t)(a2 + 29), a3);
    goto LABEL_48;
  }
  if (!a5)
    sub_215C1265C(a1 + 224, (uint64_t)(a2 + 28), a3);
  *a5 = 1;
  *(_QWORD *)(a3 + 224) = 0;
  v61 = (unint64_t *)(a1 + 232);
  v62 = *(_QWORD *)(a1 + 232);
  v63 = a2 + 29;
  v64 = a2[29];
  *(_QWORD *)(a3 + 224) = *(_QWORD *)(a1 + 224) - a2[28];
  if (v62 < v64)
  {
LABEL_48:
    *a5 = 1;
    *(_QWORD *)(a3 + 232) = 0;
    v62 = *v61;
    v64 = *v63;
  }
LABEL_49:
  *(_QWORD *)(a3 + 232) = v62 - v64;
  v65 = *(_QWORD *)(a1 + 312);
  v66 = a2[39];
  v24 = v65 >= v66;
  v67 = v65 - v66;
  if (v24)
  {
    *(_QWORD *)(a3 + 312) = v67;
    v68 = *(_QWORD *)(a1 + 320);
    v69 = a2[40];
    if (v68 >= v69)
      goto LABEL_56;
    v70 = (unint64_t *)(a1 + 320);
    v71 = a2 + 40;
    if (!a5)
      sub_215C131B4(a1 + 320, (uint64_t)(a2 + 40), a3);
    goto LABEL_55;
  }
  if (!a5)
    sub_215C126E0(a1 + 312, (uint64_t)(a2 + 39), a3);
  *a5 = 1;
  *(_QWORD *)(a3 + 312) = 0;
  v68 = *(_QWORD *)(a1 + 320);
  v69 = a2[40];
  *(_QWORD *)(a3 + 312) = *(_QWORD *)(a1 + 312) - a2[39];
  if (v68 < v69)
  {
    v70 = (unint64_t *)(a1 + 320);
    v71 = a2 + 40;
LABEL_55:
    *a5 = 1;
    *(_QWORD *)(a3 + 320) = 0;
    v68 = *v70;
    v69 = *v71;
  }
LABEL_56:
  *(_QWORD *)(a3 + 320) = v68 - v69;
  v72 = *(_QWORD *)(a1 + 328);
  v73 = a2[41];
  v24 = v72 >= v73;
  v74 = v72 - v73;
  if (v24)
  {
    *(_QWORD *)(a3 + 328) = v74;
    v75 = *(_QWORD *)(a1 + 256);
    v76 = a2[32];
    if (v75 >= v76)
      goto LABEL_63;
    v77 = (unint64_t *)(a1 + 256);
    v78 = a2 + 32;
    if (!a5)
      sub_215C13130(a1 + 256, (uint64_t)(a2 + 32), a3);
    goto LABEL_62;
  }
  if (!a5)
    sub_215C12764(a1 + 328, (uint64_t)(a2 + 41), a3);
  *a5 = 1;
  *(_QWORD *)(a3 + 328) = 0;
  *(_QWORD *)(a3 + 328) = *(_QWORD *)(a1 + 328) - a2[41];
  v75 = *(_QWORD *)(a1 + 256);
  v76 = a2[32];
  if (v75 < v76)
  {
    v77 = (unint64_t *)(a1 + 256);
    v78 = a2 + 32;
LABEL_62:
    *a5 = 1;
    *(_QWORD *)(a3 + 256) = 0;
    v75 = *v77;
    v76 = *v78;
  }
LABEL_63:
  *(_QWORD *)(a3 + 256) = v75 - v76;
  v79 = *(_QWORD *)(a1 + 264);
  v80 = a2[33];
  v24 = v79 >= v80;
  v81 = v79 - v80;
  if (v24)
  {
    *(_QWORD *)(a3 + 264) = v81;
    v82 = *(_QWORD *)(a1 + 272);
    v83 = a2[34];
    if (v82 >= v83)
      goto LABEL_70;
    v84 = (unint64_t *)(a1 + 272);
    v85 = a2 + 34;
    if (!a5)
      sub_215C130AC(a1 + 272, (uint64_t)(a2 + 34), a3);
    goto LABEL_69;
  }
  if (!a5)
    sub_215C127E8(a1 + 264, (uint64_t)(a2 + 33), a3);
  *a5 = 1;
  *(_QWORD *)(a3 + 264) = 0;
  v82 = *(_QWORD *)(a1 + 272);
  v83 = a2[34];
  *(_QWORD *)(a3 + 264) = *(_QWORD *)(a1 + 264) - a2[33];
  if (v82 < v83)
  {
    v84 = (unint64_t *)(a1 + 272);
    v85 = a2 + 34;
LABEL_69:
    *a5 = 1;
    *(_QWORD *)(a3 + 272) = 0;
    v82 = *v84;
    v83 = *v85;
  }
LABEL_70:
  *(_QWORD *)(a3 + 272) = v82 - v83;
  v86 = *(_QWORD *)(a1 + 280);
  v87 = a2[35];
  v24 = v86 >= v87;
  v88 = v86 - v87;
  if (v24)
  {
    *(_QWORD *)(a3 + 280) = v88;
    v89 = *(_QWORD *)(a1 + 288);
    v90 = a2[36];
    if (v89 >= v90)
      goto LABEL_77;
    v91 = (unint64_t *)(a1 + 288);
    v92 = a2 + 36;
    if (!a5)
      sub_215C13028(a1 + 288, (uint64_t)(a2 + 36), a3);
    goto LABEL_76;
  }
  if (!a5)
    sub_215C1286C(a1 + 280, (uint64_t)(a2 + 35), a3);
  *a5 = 1;
  *(_QWORD *)(a3 + 280) = 0;
  v89 = *(_QWORD *)(a1 + 288);
  v90 = a2[36];
  *(_QWORD *)(a3 + 280) = *(_QWORD *)(a1 + 280) - a2[35];
  if (v89 < v90)
  {
    v91 = (unint64_t *)(a1 + 288);
    v92 = a2 + 36;
LABEL_76:
    *a5 = 1;
    *(_QWORD *)(a3 + 288) = 0;
    v89 = *v91;
    v90 = *v92;
  }
LABEL_77:
  *(_QWORD *)(a3 + 288) = v89 - v90;
  v93 = *(_QWORD *)(a1 + 296);
  v94 = a2[37];
  v24 = v93 >= v94;
  v95 = v93 - v94;
  if (v24)
  {
    *(_QWORD *)(a3 + 296) = v95;
    v96 = *(_QWORD *)(a1 + 304);
    v97 = a2[38];
    if (v96 >= v97)
      goto LABEL_84;
    v98 = (unint64_t *)(a1 + 304);
    v99 = a2 + 38;
    if (!a5)
      sub_215C12FA4(a1 + 304, (uint64_t)(a2 + 38), a3);
    goto LABEL_83;
  }
  if (!a5)
    sub_215C128F0(a1 + 296, (uint64_t)(a2 + 37), a3);
  *a5 = 1;
  *(_QWORD *)(a3 + 296) = 0;
  v96 = *(_QWORD *)(a1 + 304);
  v97 = a2[38];
  *(_QWORD *)(a3 + 296) = *(_QWORD *)(a1 + 296) - a2[37];
  if (v96 < v97)
  {
    v98 = (unint64_t *)(a1 + 304);
    v99 = a2 + 38;
LABEL_83:
    *a5 = 1;
    *(_QWORD *)(a3 + 304) = 0;
    v96 = *v98;
    v97 = *v99;
  }
LABEL_84:
  *(_QWORD *)(a3 + 304) = v96 - v97;
  v100 = *(_QWORD *)(a1 + 336);
  v101 = a2[42];
  v24 = v100 >= v101;
  v102 = v100 - v101;
  if (v24)
  {
    *(_QWORD *)(a3 + 336) = v102;
    v103 = *(_QWORD *)(a1 + 344);
    v104 = a2[43];
    if (v103 >= v104)
      goto LABEL_91;
    v105 = (unint64_t *)(a1 + 344);
    v106 = a2 + 43;
    if (!a5)
      sub_215C12F20(a1 + 344, (uint64_t)(a2 + 43), a3);
    goto LABEL_90;
  }
  if (!a5)
    sub_215C12974(a1 + 336, (uint64_t)(a2 + 42), a3);
  *a5 = 1;
  *(_QWORD *)(a3 + 336) = 0;
  v103 = *(_QWORD *)(a1 + 344);
  v104 = a2[43];
  *(_QWORD *)(a3 + 336) = *(_QWORD *)(a1 + 336) - a2[42];
  if (v103 < v104)
  {
    v105 = (unint64_t *)(a1 + 344);
    v106 = a2 + 43;
LABEL_90:
    *a5 = 1;
    *(_QWORD *)(a3 + 344) = 0;
    v103 = *v105;
    v104 = *v106;
  }
LABEL_91:
  *(_QWORD *)(a3 + 344) = v103 - v104;
  v107 = *(_QWORD *)(a1 + 352);
  v108 = a2[44];
  v24 = v107 >= v108;
  v109 = v107 - v108;
  if (v24)
  {
    *(_QWORD *)(a3 + 352) = v109;
    v110 = *(_QWORD *)(a1 + 360);
    v111 = a2[45];
    if (v110 >= v111)
      goto LABEL_98;
    v112 = (unint64_t *)(a1 + 360);
    v113 = a2 + 45;
    if (!a5)
      sub_215C12E9C(a1 + 360, (uint64_t)(a2 + 45), a3);
    goto LABEL_97;
  }
  if (!a5)
    sub_215C129F8(a1 + 352, (uint64_t)(a2 + 44), a3);
  *a5 = 1;
  *(_QWORD *)(a3 + 352) = 0;
  v110 = *(_QWORD *)(a1 + 360);
  v111 = a2[45];
  *(_QWORD *)(a3 + 352) = *(_QWORD *)(a1 + 352) - a2[44];
  if (v110 < v111)
  {
    v112 = (unint64_t *)(a1 + 360);
    v113 = a2 + 45;
LABEL_97:
    *a5 = 1;
    *(_QWORD *)(a3 + 360) = 0;
    v110 = *v112;
    v111 = *v113;
  }
LABEL_98:
  *(_QWORD *)(a3 + 360) = v110 - v111;
  v114 = *(_QWORD *)(a1 + 368);
  v115 = a2[46];
  v24 = v114 >= v115;
  v116 = v114 - v115;
  if (v24)
  {
    *(_QWORD *)(a3 + 368) = v116;
    v117 = *(_QWORD *)(a1 + 376);
    v118 = a2[47];
    if (v117 >= v118)
      goto LABEL_105;
    v119 = (unint64_t *)(a1 + 376);
    v120 = a2 + 47;
    if (!a5)
      sub_215C12E18(a1 + 376, (uint64_t)(a2 + 47), a3);
    goto LABEL_104;
  }
  if (!a5)
    sub_215C12A7C(a1 + 368, (uint64_t)(a2 + 46), a3);
  *a5 = 1;
  *(_QWORD *)(a3 + 368) = 0;
  v117 = *(_QWORD *)(a1 + 376);
  v118 = a2[47];
  *(_QWORD *)(a3 + 368) = *(_QWORD *)(a1 + 368) - a2[46];
  if (v117 < v118)
  {
    v119 = (unint64_t *)(a1 + 376);
    v120 = a2 + 47;
LABEL_104:
    *a5 = 1;
    *(_QWORD *)(a3 + 376) = 0;
    v117 = *v119;
    v118 = *v120;
  }
LABEL_105:
  *(_QWORD *)(a3 + 376) = v117 - v118;
  v121 = *(_QWORD *)(a1 + 384);
  v122 = a2[48];
  if (v121 < v122)
  {
    if (!a5)
      sub_215C12B00(a1 + 384, (uint64_t)(a2 + 48), a3);
    *a5 = 1;
    *(_QWORD *)(a3 + 384) = 0;
    v121 = *(_QWORD *)(a1 + 384);
    v122 = a2[48];
  }
  *(_QWORD *)(a3 + 384) = v121 - v122;
  if (a6 < 2)
    goto LABEL_124;
  v123 = *(_QWORD *)(a1 + 408);
  v124 = a2[51];
  v24 = v123 >= v124;
  v125 = v123 - v124;
  if (v24)
  {
    *(_QWORD *)(a3 + 408) = v125;
    v126 = *(_QWORD *)(a1 + 416);
    v127 = a2[52];
    if (v126 >= v127)
      goto LABEL_116;
    v128 = (unint64_t *)(a1 + 416);
    v129 = a2 + 52;
    if (!a5)
      sub_215C12D94(a1 + 416, (uint64_t)(a2 + 52), a3);
    goto LABEL_115;
  }
  if (!a5)
    sub_215C12B84(a1 + 408, (uint64_t)(a2 + 51), a3);
  *a5 = 1;
  *(_QWORD *)(a3 + 408) = 0;
  v126 = *(_QWORD *)(a1 + 416);
  v127 = a2[52];
  *(_QWORD *)(a3 + 408) = *(_QWORD *)(a1 + 408) - a2[51];
  if (v126 < v127)
  {
    v128 = (unint64_t *)(a1 + 416);
    v129 = a2 + 52;
LABEL_115:
    *a5 = 1;
    *(_QWORD *)(a3 + 416) = 0;
    v126 = *v128;
    v127 = *v129;
  }
LABEL_116:
  *(_QWORD *)(a3 + 416) = v126 - v127;
  v130 = *(_QWORD *)(a1 + 424);
  v131 = a2[53];
  v24 = v130 >= v131;
  v132 = v130 - v131;
  if (!v24)
  {
    if (!a5)
      sub_215C12C08(a1 + 424, (uint64_t)(a2 + 53), a3);
    *a5 = 1;
    *(_QWORD *)(a3 + 424) = 0;
    v133 = *(_QWORD *)(a1 + 432);
    v134 = a2[54];
    *(_QWORD *)(a3 + 424) = *(_QWORD *)(a1 + 424) - a2[53];
    if (v133 >= v134)
      goto LABEL_123;
    v135 = (unint64_t *)(a1 + 432);
    v136 = a2 + 54;
    goto LABEL_122;
  }
  *(_QWORD *)(a3 + 424) = v132;
  v133 = *(_QWORD *)(a1 + 432);
  v134 = a2[54];
  if (v133 < v134)
  {
    v135 = (unint64_t *)(a1 + 432);
    v136 = a2 + 54;
    if (!a5)
      sub_215C12D10(a1 + 432, (uint64_t)(a2 + 54), a3);
LABEL_122:
    *a5 = 1;
    *(_QWORD *)(a3 + 432) = 0;
    v133 = *v135;
    v134 = *v136;
  }
LABEL_123:
  *(_QWORD *)(a3 + 432) = v133 - v134;
LABEL_124:
  v137 = *(_QWORD *)(a1 + 392);
  v138 = a2[49];
  if (v137 < v138)
  {
    v139 = a2 + 49;
    if (!a5)
      sub_215C12C8C(a1 + 392, (uint64_t)v139, a3);
    *a5 = 1;
    *(_QWORD *)(a3 + 392) = 0;
    v137 = *(_QWORD *)(a1 + 392);
    v138 = *v139;
  }
  v22 = v137 - v138;
LABEL_128:
  *(_QWORD *)(a3 + 392) = v22;
  if (a3 != a1)
  {
    *(_DWORD *)a3 = *(_DWORD *)a1;
    v140 = *(_OWORD *)(a1 + 4);
    v141 = *(_OWORD *)(a1 + 20);
    v142 = *(_OWORD *)(a1 + 36);
    *(_OWORD *)(a3 + 52) = *(_OWORD *)(a1 + 52);
    *(_OWORD *)(a3 + 36) = v142;
    *(_OWORD *)(a3 + 20) = v141;
    *(_OWORD *)(a3 + 4) = v140;
    result = *(__n128 *)(a1 + 68);
    v144 = *(_OWORD *)(a1 + 84);
    v145 = *(_OWORD *)(a1 + 100);
    *(_OWORD *)(a3 + 116) = *(_OWORD *)(a1 + 116);
    *(_OWORD *)(a3 + 100) = v145;
    *(_OWORD *)(a3 + 84) = v144;
    *(__n128 *)(a3 + 68) = result;
  }
  return result;
}

double pm_task_subtract(uint64_t a1, unint64_t *a2, uint64_t a3, _BYTE *a4)
{
  double result;

  *(_QWORD *)&result = sub_215C111BC(a1, a2, a3, 0xFFFFFFFF, a4, 1).n128_u64[0];
  return result;
}

double pm_task_add_version(uint64_t a1, unint64_t *a2, uint64_t a3, int a4)
{
  double result;

  *(_QWORD *)&result = sub_215C111BC(a1, a2, a3, 1u, 0, a4).n128_u64[0];
  return result;
}

double pm_task_add(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  double result;

  *(_QWORD *)&result = sub_215C111BC(a1, a2, a3, 1u, 0, 1).n128_u64[0];
  return result;
}

double pm_mach_time_to_ns(unint64_t a1)
{
  if (qword_254DFD490 != -1)
    dispatch_once(&qword_254DFD490, &unk_24D460100);
  return *(double *)&qword_254DFD498 * (double)a1;
}

double sub_215C11EA4()
{
  unint64_t v0;
  unint64_t v1;
  double result;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  result = (double)v0 / (double)v1;
  qword_254DFD498 = *(_QWORD *)&result;
  return result;
}

void pm_energy_impact_internal(uint64_t a1)
{
  if (!*(_QWORD *)(a1 + 368))
  {
    if (qword_254DFD520 != -1)
      dispatch_once(&qword_254DFD520, &unk_24D460160);
    if (qword_254DFD490 != -1)
      dispatch_once(&qword_254DFD490, &unk_24D460100);
  }
}

void pm_energy_impact(uint64_t a1)
{
  if (qword_254DFD520 != -1)
    dispatch_once(&qword_254DFD520, &unk_24D460160);
  pm_energy_impact_internal(a1);
}

double sub_215C1207C()
{
  io_registry_entry_t v0;
  io_object_t v1;
  const __CFData *CFProperty;
  const __CFData *v3;
  CFTypeID v4;
  int v5;
  size_t v6;
  void *v7;
  double result;
  void *v9;
  void *v10;
  xpc_object_t value;
  void *v12;
  char __str[255];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  dword_254DFD518 = getpagesize();
  if ((byte_254DFD5A8 & 1) == 0)
  {
    v0 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B18], "IODeviceTree:/");
    if (v0)
    {
      v1 = v0;
      CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v0, CFSTR("board-id"), 0, 0);
      if (CFProperty)
      {
        v3 = CFProperty;
        v4 = CFGetTypeID(CFProperty);
        if (v4 == CFDataGetTypeID() && (unint64_t)CFDataGetLength(v3) <= 0x80)
        {
          CFDataGetBytePtr(v3);
          __memcpy_chk();
        }
        CFRelease(v3);
      }
      IOObjectRelease(v1);
    }
    byte_254DFD5A8 = 1;
  }
  snprintf(__str, 0xFFuLL, "%s/%s.plist", "/usr/share/pmenergy", byte_254DFD528);
  v5 = open(__str, 0);
  if (v5 < 0)
  {
    snprintf(__str, 0xFFuLL, "%s/%s.plist", "/usr/share/pmenergy", "default");
    v5 = open(__str, 0);
    if (v5 < 0)
      goto LABEL_27;
  }
  v6 = lseek(v5, 0, 2);
  lseek(v5, 0, 0);
  v7 = malloc_type_malloc(v6, 0xF574C9F3uLL);
  if (!v7 || read(v5, v7, v6) != v6)
  {
    LOBYTE(v12) = 0;
    v10 = 0;
    goto LABEL_20;
  }
  v9 = (void *)xpc_create_from_plist();
  v10 = v9;
  if (!v9)
    goto LABEL_17;
  value = xpc_dictionary_get_value(v9, "energy_constants");
  v12 = value;
  if (!value)
  {
LABEL_20:
    if (!v5)
      goto LABEL_22;
    goto LABEL_21;
  }
  if (MEMORY[0x2199EE320](value) != MEMORY[0x24BDACFA0])
  {
LABEL_17:
    LOBYTE(v12) = 0;
    if (!v5)
      goto LABEL_22;
LABEL_21:
    close(v5);
    goto LABEL_22;
  }
  xpc_dictionary_apply(v12, &unk_24D4601A0);
  LOBYTE(v12) = 1;
  if (v5)
    goto LABEL_21;
LABEL_22:
  if (v7)
    free(v7);
  if (v10)
    xpc_release(v10);
  if ((v12 & 1) == 0)
  {
LABEL_27:
    qword_254DFD510 = 0;
    xmmword_254DFD4E0 = xmmword_215C13708;
    *(_OWORD *)&qword_254DFD4F0 = unk_215C13718;
    xmmword_254DFD500 = xmmword_215C13728;
    xmmword_254DFD4A0 = xmmword_215C136C8;
    *(_OWORD *)algn_254DFD4B0 = unk_215C136D8;
    result = dbl_215C136F8[0];
    xmmword_254DFD4C0 = xmmword_215C136E8;
    unk_254DFD4D0 = *(_OWORD *)dbl_215C136F8;
  }
  return result;
}

uint64_t sub_215C12320(uint64_t a1, const char *a2, void *a3)
{
  uint64_t v5;

  if (MEMORY[0x2199EE320](a3) == MEMORY[0x24BDACFA8])
  {
    v5 = 0;
    while (strcmp(a2, off_24D4601C0[v5]))
    {
      if (++v5 == 15)
        return 1;
    }
    *(double *)((char *)&xmmword_254DFD4A0 + v5 * 8) = xpc_double_get_value(a3);
  }
  return 1;
}

size_t sub_215C123A4(const void *a1, uint64_t a2, uint64_t a3, FILE *a4)
{
  return fwrite(a1, 0x13uLL, 1uLL, a4);
}

uint64_t sub_215C123B0()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

void sub_215C123C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->task_interrupt_wakeups", v4, "last->task_interrupt_wakeups", v5, v6);
  __assert_rtn("power_info_arithmetic", "pmenergy.c", 112, "false");
}

void sub_215C1244C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->task_timer_wakeups_bin_1", v4, "last->task_timer_wakeups_bin_1", v5, v6);
  __assert_rtn("power_info_arithmetic", "pmenergy.c", 114, "false");
}

void sub_215C124D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->total_system", v4, "last->total_system", v5, v6);
  __assert_rtn("power_info_arithmetic", "pmenergy.c", 116, "false");
}

void sub_215C12554(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->recv_packets", v4, "last->recv_packets", v5, v6);
  __assert_rtn("network_stats_arithmetic", "pmenergy.c", 122, "false");
}

void sub_215C125D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->recv_bytes", v4, "last->recv_bytes", v5, v6);
  __assert_rtn("network_stats_arithmetic", "pmenergy.c", 124, "false");
}

void sub_215C1265C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->total_wait_state_time", v4, "last->total_wait_state_time", v5, v6);
  __assert_rtn("wait_info_arithmetic", "pmenergy.c", 130, "false");
}

void sub_215C126E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->diskio_bytesread", v4, "last->diskio_bytesread", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 143, "false");
}

void sub_215C12764(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->pageins", v4, "last->pageins", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 145, "false");
}

void sub_215C127E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->qos_maintenance", v4, "last->qos_maintenance", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 148, "false");
}

void sub_215C1286C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->qos_utility", v4, "last->qos_utility", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 150, "false");
}

void sub_215C128F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->qos_user_initiated", v4, "last->qos_user_initiated", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 152, "false");
}

void sub_215C12974(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->gpu_ns", v4, "last->gpu_ns", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 155, "false");
}

void sub_215C129F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->windowserver_work", v4, "last->windowserver_work", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 157, "false");
}

void sub_215C12A7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->task_energy", v4, "last->task_energy", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 160, "false");
}

void sub_215C12B00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->task_pset_switches", v4, "last->task_pset_switches", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 162, "false");
}

void sub_215C12B84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->instructions", v4, "last->instructions", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 164, "false");
}

void sub_215C12C08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->pinstructions", v4, "last->pinstructions", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 166, "false");
}

void sub_215C12C8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->interval", v4, "last->interval", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 171, "false");
}

void sub_215C12D10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->pcycles", v4, "last->pcycles", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 167, "false");
}

void sub_215C12D94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->cycles", v4, "last->cycles", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 165, "false");
}

void sub_215C12E18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->task_ptime", v4, "last->task_ptime", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 161, "false");
}

void sub_215C12E9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->windowserver_total_work", v4, "last->windowserver_total_work", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 158, "false");
}

void sub_215C12F20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->windowserver_gpu_ns", v4, "last->windowserver_gpu_ns", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 156, "false");
}

void sub_215C12FA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->qos_user_interactive", v4, "last->qos_user_interactive", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 153, "false");
}

void sub_215C13028(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->qos_legacy", v4, "last->qos_legacy", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 151, "false");
}

void sub_215C130AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->qos_background", v4, "last->qos_background", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 149, "false");
}

void sub_215C13130(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->qos_default", v4, "last->qos_default", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 147, "false");
}

void sub_215C131B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->diskio_byteswritten", v4, "last->diskio_byteswritten", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 144, "false");
}

void sub_215C13238(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->total_wait_sfi_state_time", v4, "last->total_wait_sfi_state_time", v5, v6);
  __assert_rtn("wait_info_arithmetic", "pmenergy.c", 131, "false");
}

void sub_215C132BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->sent_bytes", v4, "last->sent_bytes", v5, v6);
  __assert_rtn("network_stats_arithmetic", "pmenergy.c", 125, "false");
}

void sub_215C13340(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->sent_packets", v4, "last->sent_packets", v5, v6);
  __assert_rtn("network_stats_arithmetic", "pmenergy.c", 123, "false");
}

void sub_215C133C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->total_user", v4, "last->total_user", v5, v6);
  __assert_rtn("power_info_arithmetic", "pmenergy.c", 117, "false");
}

void sub_215C13448(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->task_timer_wakeups_bin_2", v4, "last->task_timer_wakeups_bin_2", v5, v6);
  __assert_rtn("power_info_arithmetic", "pmenergy.c", 115, "false");
}

void sub_215C134CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  sub_215C123A4("Underflow occured!\n", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  v3 = (FILE *)sub_215C123B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->task_platform_idle_wakeups", v4, "last->task_platform_idle_wakeups", v5, v6);
  __assert_rtn("power_info_arithmetic", "pmenergy.c", 113, "false");
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x24BDD88C0](*(_QWORD *)&mainPort, path);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

int getpagesize(void)
{
  return MEMORY[0x24BDAE6B8]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x24BDAEB20](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x24BDB0850]();
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x24BDB08B0](xdict, applier);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  double result;

  MEMORY[0x24BDB09F0](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

