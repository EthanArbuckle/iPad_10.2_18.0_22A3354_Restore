@implementation IPDetector

_QWORD *__IPDetector_response_block_invoke(_QWORD *result, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7, int8x16_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unsigned __int8 *v17;
  int16x8_t *v18;
  unsigned __int8 *v19;
  int16x4_t v20;
  int8x16_t v21;
  int16x4_t v22;
  int8x16_t v23;
  int32x4_t v24;
  int16x8_t v25;
  int32x4_t v26;
  int32x4_t v27;
  unint64_t v28;
  unint64_t v29;
  unsigned __int8 *v30;
  unint64_t v31;
  unint64_t v32;
  uint8x16_t *v33;
  uint8x16_t *v34;
  uint8x16_t *v35;
  uint8x16_t *v36;
  unint64_t v37;
  unint64_t v38;
  unsigned __int8 *v39;
  BOOL v41;
  BOOL v43;
  BOOL v45;
  BOOL v47;
  BOOL v49;
  BOOL v51;
  BOOL v53;
  BOOL v55;
  BOOL v56;
  unsigned __int8 *v57;
  unsigned __int8 *v58;
  unsigned __int8 *v59;
  unsigned __int8 *v60;
  unsigned __int8 *v61;
  unsigned __int8 *v62;
  unsigned __int8 *v63;
  unsigned __int8 *v64;
  unsigned __int8 *v65;
  int16x8_t *v66;
  unint64_t v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  unint64_t v87;
  unint64_t v88;
  int8x16_t *v89;
  uint8x16_t *v90;
  uint8x16_t *v91;
  uint8x16_t *v92;
  uint8x16_t *v93;
  uint8x16_t *v94;
  uint8x16_t *v95;
  uint8x16_t *v96;
  uint8x16_t *v97;
  int16x8_t *v98;
  int8x16_t v99;
  int32x4_t v100;
  int32x4_t v101;
  int32x4_t v102;
  int32x4_t v103;
  uint32x4_t v104;
  uint32x4_t v105;
  uint32x4_t v106;
  uint32x4_t v107;
  uint8x16_t v108;
  uint8x16_t v109;
  uint8x16_t v110;
  uint16x8_t v111;
  uint16x8_t v112;
  int32x4_t v113;
  int32x4_t v114;
  int32x4_t v115;
  int32x4_t v116;
  uint8x16_t v117;
  uint8x16_t v118;
  uint8x16_t v119;
  uint16x8_t v120;
  uint16x8_t v121;
  int32x4_t v122;
  int32x4_t v123;
  int32x4_t v124;
  int32x4_t v125;
  int32x4_t v126;
  int32x4_t v127;
  int32x4_t v128;
  int32x4_t v129;
  uint8x16_t v130;
  uint8x16_t v131;
  uint8x16_t v132;
  int16x8_t v133;
  int16x8_t v134;
  uint8x16_t v135;
  uint8x16_t v136;
  uint8x16_t v137;
  int16x8_t v138;
  int16x8_t v139;
  int32x4_t v140;
  int32x4_t v141;
  int32x4_t v142;
  int32x4_t v143;
  unint64_t v144;
  __n128 *v145;
  int32x4_t v146;
  int32x4_t v147;
  uint32x4_t v148;
  uint32x4_t v149;
  uint16x8_t v150;
  int32x4_t v151;
  uint16x8_t v152;
  int32x4_t v153;
  int32x4_t v154;
  int32x4_t v155;
  int16x8_t v156;
  int32x4_t v157;
  int16x8_t v158;
  int32x4_t v159;
  int32x4_t v160;
  int32x4_t v161;
  uint64_t v162;

  if (a3)
  {
    v8 = 0;
    v9 = result[6] * a2;
    v10 = *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24) + 2 * v9;
    v11 = (unsigned __int8 *)(result[5] + v9);
    v12 = result[9];
    v162 = a3;
    while (1)
    {
      v14 = result[7];
      v15 = result[8];
      if (v12)
        break;
      v36 = (uint8x16_t *)(v11 - 3);
      v35 = (uint8x16_t *)(v11 + 3);
      v34 = (uint8x16_t *)&v11[-v14];
      v33 = (uint8x16_t *)&v11[v14];
      v32 = (unint64_t)&v11[v15 - 2];
      v31 = (unint64_t)&v11[v15 + 2];
      v28 = (unint64_t)&v11[-v15 + 2];
      v29 = (unint64_t)&v11[-v15 - 2];
      v18 = (int16x8_t *)v10;
      v17 = v11;
      v37 = result[10];
      if (v37)
        goto LABEL_10;
LABEL_3:
      v13 = result[6];
      v11 += v13;
      v10 += 2 * v13;
      if (++v8 == a3)
        return result;
    }
    v16 = 0;
    v17 = v11;
    v18 = (int16x8_t *)v10;
    do
    {
      v19 = v17;
      a8 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v17);
      v20 = (int16x4_t)vextq_s8(a8, a8, 8uLL).u64[0];
      *(int16x4_t *)a8.i8 = vadd_s16(*(int16x4_t *)a8.i8, *(int16x4_t *)a8.i8);
      v21 = (int8x16_t)vaddl_u8(*(uint8x8_t *)(v17 + 3), *(uint8x8_t *)(v17 - 3));
      v22 = vsub_s16(*(int16x4_t *)a8.i8, *(int16x4_t *)v21.i8);
      v23 = (int8x16_t)vaddl_u8(*(uint8x8_t *)&v17[v14], *(uint8x8_t *)&v17[-v14]);
      *(int16x4_t *)a8.i8 = vsub_s16(*(int16x4_t *)a8.i8, *(int16x4_t *)v23.i8);
      v24 = vmull_s16(v22, *(int16x4_t *)a8.i8);
      *(int16x4_t *)a8.i8 = vshr_n_s16(vadd_s16(*(int16x4_t *)a8.i8, v22), 4uLL);
      v25 = vsubq_s16((int16x8_t)vaddl_u8(*(uint8x8_t *)&v17[-v15 + 2], *(uint8x8_t *)&v17[v15 - 2]), (int16x8_t)vaddl_u8(*(uint8x8_t *)&v17[v15 + 2], *(uint8x8_t *)&v17[-v15 - 2]));
      v26 = vmlsl_s16(vmlsl_s16(v24, *(int16x4_t *)a8.i8, *(int16x4_t *)a8.i8), *(int16x4_t *)v25.i8, *(int16x4_t *)v25.i8);
      *(int16x4_t *)a8.i8 = vadd_s16(v20, v20);
      *(int16x4_t *)v21.i8 = vsub_s16(*(int16x4_t *)a8.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v21, v21, 8uLL));
      *(int16x4_t *)a8.i8 = vsub_s16(*(int16x4_t *)a8.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v23, v23, 8uLL));
      *(int16x4_t *)v23.i8 = vshrn_n_s32(v26, 9uLL);
      v27 = vmull_s16(*(int16x4_t *)v21.i8, *(int16x4_t *)a8.i8);
      *(int16x4_t *)a8.i8 = vshr_n_s16(vadd_s16(*(int16x4_t *)a8.i8, *(int16x4_t *)v21.i8), 4uLL);
      v17 += 8;
      *v18++ = vshrn_high_n_s32(*(int16x4_t *)v23.i8, vmlsl_high_s16(vmlsl_s16(v27, *(int16x4_t *)a8.i8, *(int16x4_t *)a8.i8), v25, v25), 9uLL);
      ++v16;
      v12 = result[9];
    }
    while (v16 < v12);
    v28 = (unint64_t)&v17[-v15 + 2];
    v29 = (unint64_t)&v17[-v15 - 2];
    v30 = &v17[v15];
    v31 = (unint64_t)(v30 + 2);
    v32 = (unint64_t)(v30 - 2);
    v33 = (uint8x16_t *)&v17[v14];
    v34 = (uint8x16_t *)&v17[-v14];
    v35 = (uint8x16_t *)(v19 + 11);
    v36 = (uint8x16_t *)(v19 + 5);
    v37 = result[10];
    if (!v37)
      goto LABEL_3;
LABEL_10:
    if (v37 >= 8)
    {
      v38 = 0;
      v39 = (unsigned __int8 *)v18 + 2 * v37;
      v41 = (unint64_t)v18 < v28 + v37 && v28 < (unint64_t)v39;
      v43 = (unint64_t)v18 < v31 + v37 && v31 < (unint64_t)v39;
      v45 = (unint64_t)v18 < v32 + v37 && v32 < (unint64_t)v39;
      v47 = v18 < (int16x8_t *)&v33->i8[v37] && v33 < (uint8x16_t *)v39;
      v49 = v18 < (int16x8_t *)&v34->i8[v37] && v34 < (uint8x16_t *)v39;
      v51 = v18 < (int16x8_t *)&v35->i8[v37] && v35 < (uint8x16_t *)v39;
      v53 = v18 < (int16x8_t *)&v36->i8[v37] && v36 < (uint8x16_t *)v39;
      v55 = v18 < (int16x8_t *)&v17[v37] && v17 < v39;
      v56 = v29 >= (unint64_t)v39 || (unint64_t)v18 >= v29 + v37;
      if (v56 && !v41 && !v43 && !v45 && !v47 && !v49 && !v51 && !v53 && !v55)
      {
        if (v37 >= 0x10)
        {
          v87 = v37 & 0xFFFFFFFFFFFFFFF0;
          v88 = v37 & 0xFFFFFFFFFFFFFFF0;
          v89 = (int8x16_t *)v17;
          v90 = v36;
          v91 = v35;
          v92 = v34;
          v93 = v33;
          v94 = (uint8x16_t *)v32;
          v95 = (uint8x16_t *)v31;
          v96 = (uint8x16_t *)v28;
          v97 = (uint8x16_t *)v29;
          v98 = v18;
          do
          {
            v99 = *v89++;
            v100 = (int32x4_t)vqtbl1q_s8(v99, (int8x16_t)xmmword_24B723450);
            v101 = (int32x4_t)vqtbl1q_s8(v99, (int8x16_t)xmmword_24B723460);
            v102 = (int32x4_t)vqtbl1q_s8(v99, (int8x16_t)xmmword_24B723470);
            v103 = (int32x4_t)vqtbl1q_s8(v99, (int8x16_t)xmmword_24B723480);
            v104 = (uint32x4_t)vaddq_s32(v103, v103);
            v105 = (uint32x4_t)vaddq_s32(v102, v102);
            v106 = (uint32x4_t)vaddq_s32(v101, v101);
            v107 = (uint32x4_t)vaddq_s32(v100, v100);
            v108 = *v90++;
            v109 = v108;
            v110 = *v91++;
            v111 = vaddl_u8(*(uint8x8_t *)v109.i8, *(uint8x8_t *)v110.i8);
            v112 = vaddl_high_u8(v109, v110);
            v113 = (int32x4_t)vsubw_high_u16(v107, v112);
            v114 = (int32x4_t)vsubw_u16(v106, *(uint16x4_t *)v112.i8);
            v115 = (int32x4_t)vsubw_high_u16(v105, v111);
            v116 = (int32x4_t)vsubw_u16(v104, *(uint16x4_t *)v111.i8);
            v117 = *v92++;
            v118 = v117;
            v119 = *v93++;
            v120 = vaddl_u8(*(uint8x8_t *)v118.i8, *(uint8x8_t *)v119.i8);
            v121 = vaddl_high_u8(v118, v119);
            v122 = (int32x4_t)vsubw_high_u16(v107, v121);
            v123 = (int32x4_t)vsubw_u16(v106, *(uint16x4_t *)v121.i8);
            v124 = (int32x4_t)vsubw_high_u16(v105, v120);
            v125 = (int32x4_t)vsubw_u16(v104, *(uint16x4_t *)v120.i8);
            v126 = vshrq_n_s32(vaddq_s32(v122, v113), 4uLL);
            v127 = vshrq_n_s32(vaddq_s32(v123, v114), 4uLL);
            v128 = vshrq_n_s32(vaddq_s32(v124, v115), 4uLL);
            v129 = vshrq_n_s32(vaddq_s32(v125, v116), 4uLL);
            v130 = *v94++;
            v131 = v130;
            v132 = *v95++;
            v133 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v131.i8, *(uint8x8_t *)v132.i8);
            v134 = (int16x8_t)vsubl_high_u8(v131, v132);
            v135 = *v96++;
            v136 = v135;
            v137 = *v97++;
            v138 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v136.i8, *(uint8x8_t *)v137.i8);
            v139 = (int16x8_t)vsubl_high_u8(v136, v137);
            v140 = vaddl_high_s16(v139, v134);
            v141 = vaddl_s16(*(int16x4_t *)v139.i8, *(int16x4_t *)v134.i8);
            v142 = vaddl_high_s16(v138, v133);
            v143 = vaddl_s16(*(int16x4_t *)v138.i8, *(int16x4_t *)v133.i8);
            a8 = (int8x16_t)vshrn_high_n_s32(vshrn_n_s32(vmlsq_s32(vmlaq_s32(vnegq_s32(vmulq_s32(v143, v143)), v125, v116), v129, v129), 9uLL), vmlsq_s32(vmlaq_s32(vnegq_s32(vmulq_s32(v142, v142)), v124, v115), v128, v128), 9uLL);
            *v98 = (int16x8_t)a8;
            v98[1] = vshrn_high_n_s32(vshrn_n_s32(vmlsq_s32(vmlaq_s32(vnegq_s32(vmulq_s32(v141, v141)), v123, v114), v127, v127), 9uLL), vmlsq_s32(vmlaq_s32(vnegq_s32(vmulq_s32(v140, v140)), v122, v113), v126, v126), 9uLL);
            v98 += 2;
            v87 -= 16;
          }
          while (v87);
          a3 = v162;
          if (v37 == v88)
            goto LABEL_3;
          v38 = v37 & 0xFFFFFFFFFFFFFFF0;
          if ((v37 & 8) == 0)
          {
            v65 = (unsigned __int8 *)(v29 + v88);
            v64 = (unsigned __int8 *)(v28 + v88);
            v63 = (unsigned __int8 *)(v31 + v88);
            v62 = (unsigned __int8 *)(v32 + v88);
            v61 = &v33->u8[v88];
            v60 = &v34->u8[v88];
            v59 = &v35->u8[v88];
            v58 = &v36->u8[v88];
            v57 = &v17[v88];
            v66 = (int16x8_t *)((char *)v18 + 2 * v88);
LABEL_76:
            v67 = v37 - v38;
            do
            {
              v68 = *v57++;
              v69 = 2 * v68;
              v71 = *v58++;
              v70 = v71;
              v72 = *v59++;
              v73 = v69 - (v70 + v72);
              v75 = *v60++;
              v74 = v75;
              v76 = *v61++;
              v77 = v69 - (v74 + v76);
              v78 = v77 * v73;
              v79 = (v77 + v73) >> 4;
              v81 = *v62++;
              v80 = v81;
              v82 = *v63++;
              v83 = v80 - v82;
              v85 = *v64++;
              v84 = v85;
              v86 = *v65++;
              v66->i16[0] = (v78 - (v83 - v86 + v84) * (v83 - v86 + v84) - v79 * v79) >> 9;
              v66 = (int16x8_t *)((char *)v66 + 2);
              --v67;
            }
            while (v67);
            goto LABEL_3;
          }
        }
        else
        {
          v38 = 0;
        }
        v57 = &v17[v37 & 0xFFFFFFFFFFFFFFF8];
        v58 = &v36->u8[v37 & 0xFFFFFFFFFFFFFFF8];
        v59 = &v35->u8[v37 & 0xFFFFFFFFFFFFFFF8];
        v60 = &v34->u8[v37 & 0xFFFFFFFFFFFFFFF8];
        v61 = &v33->u8[v37 & 0xFFFFFFFFFFFFFFF8];
        v62 = (unsigned __int8 *)(v32 + (v37 & 0xFFFFFFFFFFFFFFF8));
        v63 = (unsigned __int8 *)(v31 + (v37 & 0xFFFFFFFFFFFFFFF8));
        v64 = (unsigned __int8 *)(v28 + (v37 & 0xFFFFFFFFFFFFFFF8));
        v65 = (unsigned __int8 *)(v29 + (v37 & 0xFFFFFFFFFFFFFFF8));
        v144 = v37 & 0xFFFFFFFFFFFFFFF8;
        v66 = (int16x8_t *)((char *)v18 + 2 * (v37 & 0xFFFFFFFFFFFFFFF8));
        v145 = (__n128 *)((char *)v18 + 2 * v38);
        do
        {
          a8.i64[0] = *(_QWORD *)&v17[v38];
          v146 = (int32x4_t)vqtbl1q_s8(a8, (int8x16_t)xmmword_24B723470);
          v147 = (int32x4_t)vqtbl1q_s8(a8, (int8x16_t)xmmword_24B723480);
          v148 = (uint32x4_t)vaddq_s32(v147, v147);
          v149 = (uint32x4_t)vaddq_s32(v146, v146);
          v150 = vaddl_u8(*(uint8x8_t *)&v36->i8[v38], *(uint8x8_t *)&v35->i8[v38]);
          v151 = (int32x4_t)vsubw_high_u16(v149, v150);
          v152 = vaddl_u8(*(uint8x8_t *)&v34->i8[v38], *(uint8x8_t *)&v33->i8[v38]);
          v153 = (int32x4_t)vsubw_u16(v148, *(uint16x4_t *)v150.i8);
          v154 = (int32x4_t)vsubw_high_u16(v149, v152);
          v155 = (int32x4_t)vsubw_u16(v148, *(uint16x4_t *)v152.i8);
          v156 = (int16x8_t)vsubl_u8(*(uint8x8_t *)(v32 + v38), *(uint8x8_t *)(v31 + v38));
          v157 = vshrq_n_s32(vaddq_s32(v154, v151), 4uLL);
          v158 = (int16x8_t)vsubl_u8(*(uint8x8_t *)(v28 + v38), *(uint8x8_t *)(v29 + v38));
          v159 = vaddl_high_s16(v158, v156);
          v160 = vaddl_s16(*(int16x4_t *)v158.i8, *(int16x4_t *)v156.i8);
          v161 = vshrq_n_s32(vaddq_s32(v155, v153), 4uLL);
          a8 = (int8x16_t)vshrn_high_n_s32(vshrn_n_s32(vmlsq_s32(vmlaq_s32(vnegq_s32(vmulq_s32(v160, v160)), v155, v153), v161, v161), 9uLL), vmlsq_s32(vmlaq_s32(vnegq_s32(vmulq_s32(v159, v159)), v154, v151), v157, v157), 9uLL);
          *v145++ = (__n128)a8;
          v29 += 8;
          v28 += 8;
          v31 += 8;
          v32 += 8;
          v33 = (uint8x16_t *)((char *)v33 + 8);
          v34 = (uint8x16_t *)((char *)v34 + 8);
          v35 = (uint8x16_t *)((char *)v35 + 8);
          v36 = (uint8x16_t *)((char *)v36 + 8);
          v17 += 8;
          v144 -= 8;
        }
        while (v38 != v144);
        v38 = v37 & 0xFFFFFFFFFFFFFFF8;
        a3 = v162;
        if (v37 == (v37 & 0xFFFFFFFFFFFFFFF8))
          goto LABEL_3;
        goto LABEL_76;
      }
    }
    else
    {
      v38 = 0;
    }
    v57 = v17;
    v58 = (unsigned __int8 *)v36;
    v59 = (unsigned __int8 *)v35;
    v60 = (unsigned __int8 *)v34;
    v61 = (unsigned __int8 *)v33;
    v62 = (unsigned __int8 *)v32;
    v63 = (unsigned __int8 *)v31;
    v64 = (unsigned __int8 *)v28;
    v65 = (unsigned __int8 *)v29;
    v66 = v18;
    goto LABEL_76;
  }
  return result;
}

uint64_t __IPDetector_response_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
}

uint64_t __IPDetector_response_block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], a1[5], a1[6] - a1[5]);
}

@end
