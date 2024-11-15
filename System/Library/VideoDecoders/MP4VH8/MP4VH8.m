void MP4VH8Register()
{
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v1;
  BOOL v2;
  BOOL v3;
  _BOOL4 v4;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v1 = Mutable;
    if (AppleD5500CheckPlatform() == -1)
    {
      syslog(3, "AppleD5500: %s() - ERROR: AppleD5500CheckPlatform returned %d\n");
    }
    else
    {
      CFDictionarySetValue(v1, (const void *)*MEMORY[0x24BDF9988], (const void *)*MEMORY[0x24BDBD270]);
      v2 = registerDecoder(0x6D703476u);
      v3 = registerDecoder(0x68323633u);
      v4 = registerDecoder(0x73323633u);
      if (v2 || v3 || v4)
        syslog(3, "AppleD5500: %s() - ERROR: AppleD5500 MPEG4 codecs registration FAILED\n");
    }
    CFRelease(v1);
  }
  else
  {
    syslog(3, "AppleD5500: %s() - ERROR: infoDict creation failed!\n", "MP4VH8Register");
  }
}

uint64_t AppleD5500CheckPlatform()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  uint64_t v2;
  io_registry_entry_t v4;
  io_object_t v5;
  const __CFBoolean *CFProperty;
  const __CFBoolean *v7;
  mach_port_t mainPort[2];

  *(_QWORD *)mainPort = 0;
  if (IOMasterPort(0, &mainPort[1]))
  {
    syslog(3, "AppleD5500: AppleD5500_CheckPlatform() - IOMasterPort failed \n");
    return 0xFFFFFFFFLL;
  }
  v0 = mainPort[1];
  v1 = IOServiceMatching("AppleD5500");
  if (IOServiceGetMatchingServices(v0, v1, mainPort))
  {
    syslog(3, "AppleD5500: AppleD5500_CheckPlatform() - IOServiceGetMatchingServices failed \n");
    return 0xFFFFFFFFLL;
  }
  v4 = IOIteratorNext(mainPort[0]);
  if (v4)
  {
    v5 = v4;
    CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v4, CFSTR("HEVCSupported"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (CFProperty)
    {
      v7 = CFProperty;
      v2 = CFBooleanGetValue(CFProperty) != 0;
      CFRelease(v7);
    }
    else
    {
      v2 = 0;
    }
    IOObjectRelease(v5);
  }
  else
  {
    v2 = 0xFFFFFFFFLL;
  }
  IOObjectRelease(mainPort[0]);
  return v2;
}

void ExtraChromaDeblock_neon(unsigned __int8 *a1, uint64_t a2, int a3, int a4, int a5)
{
  int v5;
  unsigned int v6;
  unsigned int v7;
  BOOL v8;
  int v10;
  unsigned int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v20;

  if (a5 >= 51)
    v5 = 51;
  else
    v5 = a5;
  if (v5 <= 15)
    v5 = 15;
  v6 = v5 - 15;
  v7 = ExtraChromaDeblock_neon(unsigned char *,long,int,int,int)::kTable_8_11_tc[v6];
  if (ExtraChromaDeblock_neon(unsigned char *,long,int,int,int)::kTable_8_11_tc[v6])
    v8 = a4 < 2;
  else
    v8 = 1;
  if (!v8)
  {
    v10 = 0;
    v11 = ExtraChromaDeblock_neon(unsigned char *,long,int,int,int)::kTable_8_11_beta[v6];
    v12 = a4 >> 1;
    v13 = 4 * a2;
    v18 = 8 * a2;
    v20 = a1 + 8;
    v14 = (uint64_t)a3 >> 1;
    do
    {
      if (a3 >= 2)
      {
        v15 = 4;
        v16 = (char *)v20;
        do
        {
          if (v15 < v14)
            InLoopChromaV_neon(v16, a2, v11, v7);
          if (v15 + 4 < v14)
            InLoopChromaV_neon(v16 + 8, a2, v11, v7);
          if (v10)
            InLoopChromaH_neon(v16 - 8, a2, v11, v7);
          if ((v10 | 4) < v12)
            InLoopChromaH_neon(&v16[v13 - 8], a2, v11, v7);
          v16 += 16;
          v17 = v15 + 4;
          v15 += 8;
        }
        while (v17 < v14);
      }
      v10 += 8;
      v20 += v18;
    }
    while (v10 < v12);
  }
}

int32x4_t InLoopChromaV_neon(char *a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  int8x16_t v4;
  int16x8_t v5;
  int16x8_t v6;
  int32x4_t *v7;
  int8x16_t v8;
  int8x16_t v9;
  int8x16_t v10;
  int8x16_t v11;
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int16x8_t v16;
  int16x8_t v17;
  int16x8_t v18;
  int16x8_t v19;
  int16x8_t v20;
  int16x8_t v21;
  int16x8_t v22;
  int16x8_t v23;
  int16x8_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int8x16_t v33;
  int16x8_t v34;
  int8x16_t v35;
  int16x8_t v36;
  int8x16_t v37;
  int8x16_t v38;
  int8x16_t v39;
  int8x16_t v40;
  uint8x8_t v41;
  uint8x8_t v42;
  int8x8_t v43;
  uint8x8_t v44;
  int16x8_t v45;
  int16x8_t v46;
  int16x8_t v47;
  int16x8_t v48;
  int16x8_t v49;
  int16x8_t v50;
  int16x8_t v51;
  int16x8_t v52;
  int8x16_t v53;
  int16x8_t v54;
  int16x8_t v55;
  int16x8_t v56;
  int16x8_t v57;
  int16x8_t v58;
  int16x8_t v59;
  int16x8_t v60;
  int16x8_t v61;
  int8x16_t v62;
  int8x16_t v63;
  int8x8_t v64;
  uint8x8_t v65;
  uint8x8_t v66;
  int16x8_t v67;
  int8x16_t v68;
  int16x8_t v69;
  int16x8_t v70;
  int8x8_t v71;
  int8x8_t v72;
  int8x8_t v73;
  int16x8_t v74;
  int8x8_t v75;
  int16x8_t v76;
  int16x8_t v77;
  int16x8_t v78;
  int16x8_t v79;
  int8x16_t v80;
  int16x8_t v81;
  int16x8_t v82;
  int16x8_t v83;
  int8x8_t v84;
  int16x8_t v85;
  int16x8_t v86;
  int16x8_t v87;
  int16x8_t v88;
  int8x16_t v89;
  int16x8_t v90;
  int16x8_t v91;
  int16x8_t v92;
  int16x8_t v93;
  int16x8_t v94;
  uint8x8_t v95;
  uint8x8_t v96;
  int8x8_t v97;
  uint8x8_t v98;
  int16x8_t v99;
  int16x8_t v100;
  int16x8_t v101;
  int16x8_t v102;
  int16x8_t v103;
  int16x8_t v104;
  int16x8_t v105;
  int16x8_t v106;
  int8x16_t v107;
  int16x8_t v108;
  int16x8_t v109;
  int16x8_t v110;
  int16x8_t v111;
  int16x8_t v112;
  int16x8_t v113;
  int8x16_t v114;
  int8x16_t v115;
  int8x8_t v116;
  uint8x8_t v117;
  int16x8_t v118;
  int16x8_t v119;
  int16x8_t v120;
  int16x8_t v121;
  int8x8_t v122;
  int8x8_t v123;
  int8x8_t v124;
  int8x8_t v125;
  int8x8_t v126;
  int16x8_t v127;
  int16x8_t v128;
  int16x8_t v129;
  int8x16_t v130;
  int16x8_t v131;
  int16x8_t v132;
  int16x8_t v133;
  int8x8_t v134;
  int8x8_t v135;
  int16x8_t v136;
  int16x8_t v137;
  int16x8_t v138;
  int16x8_t v139;
  int8x16_t v140;
  int16x8_t v141;
  int16x8_t v142;
  int16x8_t v143;
  int16x8_t v144;
  int16x8_t v145;
  int16x8_t v146;
  int16x8_t v147;
  int16x8_t v148;
  int16x8_t v149;
  int16x8_t v150;
  int16x8_t v151;
  int16x8_t v152;
  int16x8_t v153;
  int32x4_t v154;
  int32x4_t v155;
  int32x4_t v156;
  int32x4_t v157;
  int32x4_t v158;
  int32x4_t v159;
  int32x4_t v160;
  int32x4_t v161;
  int32x4_t result;
  int16x8_t v163;
  int16x8_t v164;
  int8x8_t v165;
  int8x16_t v166;
  int8x16_t v167;
  int16x8_t v168;
  int16x8_t v169;
  int16x8_t v170;
  int8x8_t v171;

  v4 = (int8x16_t)vdupq_n_s16(a4);
  v5 = vdupq_n_s16(a3);
  v6 = vshrq_n_s16(v5, 3uLL);
  v8 = *(int8x16_t *)(a1 - 8);
  v7 = (int32x4_t *)(a1 - 8);
  v9 = *(int8x16_t *)((char *)v7 + a2);
  v10 = *(int8x16_t *)((char *)v7 + 2 * a2);
  v11 = *(int8x16_t *)((char *)v7 + 3 * a2);
  v12 = *(int8x16_t *)((char *)v7 + 4 * a2);
  v13 = *(int8x16_t *)((char *)v7 + 5 * a2);
  v14 = *(int8x16_t *)((char *)v7 + 6 * a2);
  v15 = *(int8x16_t *)((char *)v7 + 7 * a2);
  v16 = vshrq_n_s16(vsraq_n_s16(v5, v5, 1uLL), 3uLL);
  v17 = (int16x8_t)vtrn1q_s8(v8, v9);
  v18 = (int16x8_t)vtrn2q_s8(v8, v9);
  v19 = (int16x8_t)vtrn1q_s8(v10, v11);
  v20 = (int16x8_t)vtrn2q_s8(v10, v11);
  v21 = (int16x8_t)vtrn1q_s8(v12, v13);
  v22 = (int16x8_t)vtrn2q_s8(v12, v13);
  v23 = (int16x8_t)vtrn1q_s8(v14, v15);
  v24 = (int16x8_t)vtrn2q_s8(v14, v15);
  v25 = (int32x4_t)vtrn1q_s16(v17, v19);
  v26 = (int32x4_t)vtrn2q_s16(v17, v19);
  v27 = (int32x4_t)vtrn1q_s16(v18, v20);
  v28 = (int32x4_t)vtrn2q_s16(v18, v20);
  v29 = (int32x4_t)vtrn1q_s16(v21, v23);
  v30 = (int32x4_t)vtrn2q_s16(v21, v23);
  v31 = (int32x4_t)vtrn1q_s16(v22, v24);
  v32 = (int32x4_t)vtrn2q_s16(v22, v24);
  v33 = (int8x16_t)vtrn1q_s32(v25, v29);
  v34 = (int16x8_t)vtrn2q_s32(v25, v29);
  v35 = (int8x16_t)vtrn1q_s32(v27, v31);
  v36 = (int16x8_t)vtrn2q_s32(v27, v31);
  v37 = (int8x16_t)vtrn1q_s32(v26, v30);
  v38 = (int8x16_t)vtrn2q_s32(v26, v30);
  v39 = (int8x16_t)vtrn1q_s32(v28, v32);
  v40 = (int8x16_t)vtrn2q_s32(v28, v32);
  v41 = (uint8x8_t)vextq_s8(v33, v33, 8uLL).u64[0];
  v42 = (uint8x8_t)vextq_s8(v37, v37, 8uLL).u64[0];
  v43 = (int8x8_t)vextq_s8((int8x16_t)v34, (int8x16_t)v34, 8uLL).u64[0];
  v44 = (uint8x8_t)vextq_s8(v38, v38, 8uLL).u64[0];
  v45 = (int16x8_t)vaddl_u8(*(uint8x8_t *)v37.i8, *(uint8x8_t *)v38.i8);
  v46 = (int16x8_t)vshll_n_u8(*(uint8x8_t *)v34.i8, 1uLL);
  v47 = vabdq_s16(v45, v46);
  v48 = (int16x8_t)vaddl_high_u8((uint8x16_t)v34, (uint8x16_t)v33);
  v49 = (int16x8_t)vshll_high_n_u8((uint8x16_t)v37, 1uLL);
  v50 = vabdq_s16(v48, v49);
  v51 = (int16x8_t)vqtbl1q_s8((int8x16_t)vabaq_s16(vrev64q_s16(v47), v45, v46), (int8x16_t)xmmword_2195269D0);
  v52 = (int16x8_t)vqtbl1q_s8((int8x16_t)vabaq_s16(vrev64q_s16(v50), v48, v49), (int8x16_t)xmmword_2195269D0);
  v53 = (int8x16_t)vcgtq_s16(v5, vaddq_s16(v52, v51));
  v54 = vrshrq_n_s16(v5, 3uLL);
  v169 = v54;
  v170 = v6;
  if (vaddlvq_u16((uint16x8_t)v53))
  {
    v55 = (int16x8_t)vmovl_u8(*(uint8x8_t *)v34.i8);
    v56 = (int16x8_t)vmovl_u8(*(uint8x8_t *)v38.i8);
    v57 = (int16x8_t)vmovl_u8(v42);
    v58 = (int16x8_t)vmovl_u8(v41);
    v59 = (int16x8_t)vandq_s8(v4, v53);
    v60 = (int16x8_t)vandq_s8((int8x16_t)vcgtq_s16(vrhaddq_s16(v59, vshlq_n_s16(v59, 2uLL)), (int16x8_t)vabdl_u8(*(uint8x8_t *)v38.i8, v41)), vandq_s8((int8x16_t)vcgtq_s16(v54, vaddq_s16(v50, v47)), (int8x16_t)vcgtq_s16(v6, (int16x8_t)vabal_u8(vabdl_u8(v44, v41), *(uint8x8_t *)v33.i8, *(uint8x8_t *)v38.i8))));
    v61 = (int16x8_t)vqtbl1q_s8(vandq_s8((int8x16_t)vrev64q_s16(v60), (int8x16_t)v60), (int8x16_t)xmmword_2195269D0);
    v62 = (int8x16_t)vcgtq_s16(v16, v51);
    v63 = (int8x16_t)vcgtq_s16(v16, v52);
    if (vaddlvq_u16((uint16x8_t)v61))
    {
      v64 = vmovn_s16(v59);
      v65 = (uint8x8_t)vadd_s8(v64, v64);
      v163 = v56;
      v164 = v58;
      v66 = v44;
      v67 = (int16x8_t)vaddl_u8(*(uint8x8_t *)v37.i8, *(uint8x8_t *)v34.i8);
      v167 = v63;
      v68 = v4;
      v69 = (int16x8_t)vaddl_u8(*(uint8x8_t *)v38.i8, v41);
      v70 = (int16x8_t)vaddl_high_u8((uint8x16_t)v37, (uint8x16_t)v34);
      v165 = (int8x8_t)vmax_u8(vmin_u8((uint8x8_t)vrshrn_n_s16((int16x8_t)vaddw_u8((uint16x8_t)vaddq_s16(v69, v55), vhadd_u8(*(uint8x8_t *)v37.i8, v42)), 2uLL), vqadd_u8(*(uint8x8_t *)v38.i8, v65)), vqsub_u8(*(uint8x8_t *)v38.i8, v65));
      v71 = (int8x8_t)vmax_u8(vmin_u8((uint8x8_t)vrshrn_n_s16((int16x8_t)vaddw_u8((uint16x8_t)vaddq_s16(v69, v57), vhadd_u8((uint8x8_t)v43, *(uint8x8_t *)v34.i8)), 2uLL), vqadd_u8(v41, v65)), vqsub_u8(v41, v65));
      v72 = (int8x8_t)vmax_u8(vmin_u8((uint8x8_t)vrshrn_n_s16(vaddq_s16(v67, v69), 2uLL), vqadd_u8(*(uint8x8_t *)v34.i8, v65)), vqsub_u8(*(uint8x8_t *)v34.i8, v65));
      v73 = (int8x8_t)vmax_u8(vmin_u8((uint8x8_t)vrshrn_n_s16(vaddq_s16(v70, v69), 2uLL), vqadd_u8(v42, v65)), vqsub_u8(v42, v65));
      v74 = vaddq_s16((int16x8_t)vaddl_u8(*(uint8x8_t *)v33.i8, *(uint8x8_t *)v37.i8), (int16x8_t)vhaddq_u16((uint16x8_t)v67, (uint16x8_t)v69));
      v44 = v66;
      v75 = (int8x8_t)vmax_u8(vmin_u8((uint8x8_t)vrshrn_n_s16(v74, 2uLL), vqadd_u8(*(uint8x8_t *)v37.i8, v65)), vqsub_u8(*(uint8x8_t *)v37.i8, v65));
      v76 = (int16x8_t)vhaddq_u16((uint16x8_t)v70, (uint16x8_t)v69);
      v4 = v68;
      *(uint8x8_t *)v76.i8 = vmax_u8(vmin_u8((uint8x8_t)vrshrn_n_s16(vaddq_s16((int16x8_t)vaddl_high_u8((uint8x16_t)v34, (uint8x16_t)v38), v76), 2uLL), vqadd_u8((uint8x8_t)v43, v65)), vqsub_u8((uint8x8_t)v43, v65));
      v77 = (int16x8_t)vbicq_s8((int8x16_t)v59, (int8x16_t)v61);
      v74.i64[0] = 0x9000900090009;
      v74.i64[1] = 0x9000900090009;
      v78 = vmulq_s16((int16x8_t)vsubl_u8(v41, *(uint8x8_t *)v38.i8), v74);
      v74.i64[0] = 0x2000200020002;
      v74.i64[1] = 0x2000200020002;
      v79 = vrshrq_n_s16(vmlaq_s16(v78, (int16x8_t)vsubl_u8(v42, *(uint8x8_t *)v34.i8), v74), 4uLL);
      v74.i64[0] = 0xA000A000A000ALL;
      v74.i64[1] = 0xA000A000A000ALL;
      v80 = (int8x16_t)vcgtq_s16(vmulq_s16(v77, v74), vabsq_s16(v79));
      v81 = vmaxq_s16(vminq_s16((int16x8_t)vandq_s8((int8x16_t)v79, v80), v77), vnegq_s16(v77));
      v82 = vshrq_n_s16(v77, 1uLL);
      v83 = vnegq_s16(v82);
      v34 = vaddq_s16((int16x8_t)vandq_s8((int8x16_t)vmaxq_s16(vminq_s16(vhaddq_s16((int16x8_t)vsubl_u8(vrhadd_u8(*(uint8x8_t *)v37.i8, *(uint8x8_t *)v38.i8), *(uint8x8_t *)v34.i8), v81), v82), v83), vandq_s8(v62, v80)), v55);
      *(int8x8_t *)v82.i8 = vqmovun_s16(vaddq_s16((int16x8_t)vandq_s8((int8x16_t)vmaxq_s16(vminq_s16(vhsubq_s16((int16x8_t)vsubl_u8(vrhadd_u8((uint8x8_t)v43, v41), v42), v81), v82), v83), vandq_s8(v167, v80)), v57));
      v84 = vqmovn_s16(v61);
      *(int8x8_t *)v37.i8 = vbsl_s8(v84, v75, *(int8x8_t *)v37.i8);
      *(int8x8_t *)v34.i8 = vbsl_s8(v84, v72, vqmovun_s16(v34));
      *(int8x8_t *)v38.i8 = vbsl_s8(v84, v165, vqmovun_s16(vaddq_s16(v81, v163)));
      v41 = (uint8x8_t)vbsl_s8(v84, v71, vqmovun_s16(vsubq_s16(v164, v81)));
      v42 = (uint8x8_t)vbsl_s8(v84, v73, *(int8x8_t *)v82.i8);
      v43 = vbsl_s8(v84, *(int8x8_t *)v76.i8, v43);
    }
    else
    {
      v85 = (int16x8_t)vbicq_s8((int8x16_t)v59, (int8x16_t)v61);
      v86.i64[0] = 0x2000200020002;
      v86.i64[1] = 0x2000200020002;
      v87 = vrshrq_n_s16(vmlaq_s16((int16x8_t)vmlsl_u8(vmull_u8(v41, (uint8x8_t)0x909090909090909), *(uint8x8_t *)v38.i8, (uint8x8_t)0x909090909090909), (int16x8_t)vsubl_u8(v42, *(uint8x8_t *)v34.i8), v86), 4uLL);
      v88.i64[0] = 0xA000A000A000ALL;
      v88.i64[1] = 0xA000A000A000ALL;
      v89 = (int8x16_t)vcgtq_s16(vmulq_s16(v85, v88), vabsq_s16(v87));
      v90 = vmaxq_s16(vminq_s16((int16x8_t)vandq_s8((int8x16_t)v87, v89), v85), vnegq_s16(v85));
      v91 = vaddq_s16(v90, v56);
      v92 = vshrq_n_s16(v85, 1uLL);
      v93 = vnegq_s16(v92);
      v34 = vaddq_s16((int16x8_t)vandq_s8((int8x16_t)vmaxq_s16(vminq_s16(vhaddq_s16((int16x8_t)vsubl_u8(vrhadd_u8(*(uint8x8_t *)v37.i8, *(uint8x8_t *)v38.i8), *(uint8x8_t *)v34.i8), v90), v92), v93), vandq_s8(v62, v89)), v55);
      v94 = vaddq_s16((int16x8_t)vandq_s8((int8x16_t)vmaxq_s16(vminq_s16(vhsubq_s16((int16x8_t)vsubl_u8(vrhadd_u8((uint8x8_t)v43, v41), v42), v90), v92), v93), vandq_s8(v63, v89)), v57);
      *(int8x8_t *)v34.i8 = vqmovun_s16(v34);
      *(int8x8_t *)v38.i8 = vqmovun_s16(v91);
      v41 = (uint8x8_t)vqmovun_s16(vsubq_s16(v58, v90));
      v42 = (uint8x8_t)vqmovun_s16(v94);
    }
  }
  v95 = (uint8x8_t)vextq_s8(v35, v35, 8uLL).u64[0];
  v96 = (uint8x8_t)vextq_s8(v39, v39, 8uLL).u64[0];
  v97 = (int8x8_t)vextq_s8((int8x16_t)v36, (int8x16_t)v36, 8uLL).u64[0];
  v98 = (uint8x8_t)vextq_s8(v40, v40, 8uLL).u64[0];
  v99 = (int16x8_t)vaddl_u8(*(uint8x8_t *)v39.i8, *(uint8x8_t *)v40.i8);
  v100 = (int16x8_t)vshll_n_u8(*(uint8x8_t *)v36.i8, 1uLL);
  v101 = vabdq_s16(v99, v100);
  v102 = (int16x8_t)vaddl_high_u8((uint8x16_t)v36, (uint8x16_t)v35);
  v103 = (int16x8_t)vshll_high_n_u8((uint8x16_t)v39, 1uLL);
  v104 = vabdq_s16(v102, v103);
  v105 = (int16x8_t)vqtbl1q_s8((int8x16_t)vabaq_s16(vrev64q_s16(v101), v99, v100), (int8x16_t)xmmword_2195269D0);
  v106 = (int16x8_t)vqtbl1q_s8((int8x16_t)vabaq_s16(vrev64q_s16(v104), v102, v103), (int8x16_t)xmmword_2195269D0);
  v107 = (int8x16_t)vcgtq_s16(v5, vaddq_s16(v106, v105));
  if (vaddlvq_u16((uint16x8_t)v107))
  {
    v108 = (int16x8_t)vmovl_u8(*(uint8x8_t *)v36.i8);
    v109 = (int16x8_t)vmovl_u8(*(uint8x8_t *)v40.i8);
    v110 = (int16x8_t)vmovl_u8(v96);
    v168 = (int16x8_t)vmovl_u8(v95);
    v111 = (int16x8_t)vandq_s8(v4, v107);
    v112 = (int16x8_t)vandq_s8((int8x16_t)vcgtq_s16(vrhaddq_s16(v111, vshlq_n_s16(v111, 2uLL)), (int16x8_t)vabdl_u8(*(uint8x8_t *)v40.i8, v95)), vandq_s8((int8x16_t)vcgtq_s16(v169, vaddq_s16(v104, v101)), (int8x16_t)vcgtq_s16(v170, (int16x8_t)vabal_u8(vabdl_u8(v98, v95), *(uint8x8_t *)v35.i8, *(uint8x8_t *)v40.i8))));
    v113 = (int16x8_t)vqtbl1q_s8(vandq_s8((int8x16_t)vrev64q_s16(v112), (int8x16_t)v112), (int8x16_t)xmmword_2195269D0);
    v114 = (int8x16_t)vcgtq_s16(v16, v105);
    v115 = (int8x16_t)vcgtq_s16(v16, v106);
    if (vaddlvq_u16((uint16x8_t)v113))
    {
      v116 = vmovn_s16(v111);
      v117 = (uint8x8_t)vadd_s8(v116, v116);
      v166 = v114;
      v118 = (int16x8_t)vaddl_u8(*(uint8x8_t *)v39.i8, *(uint8x8_t *)v36.i8);
      v119 = (int16x8_t)vaddl_u8(*(uint8x8_t *)v40.i8, v95);
      v120 = (int16x8_t)vaddl_high_u8((uint8x16_t)v39, (uint8x16_t)v36);
      v121 = v109;
      v171 = (int8x8_t)vmax_u8(vmin_u8((uint8x8_t)vrshrn_n_s16((int16x8_t)vaddw_u8((uint16x8_t)vaddq_s16(v119, v108), vhadd_u8(*(uint8x8_t *)v39.i8, v96)), 2uLL), vqadd_u8(*(uint8x8_t *)v40.i8, v117)), vqsub_u8(*(uint8x8_t *)v40.i8, v117));
      v122 = (int8x8_t)vmax_u8(vmin_u8((uint8x8_t)vrshrn_n_s16((int16x8_t)vaddw_u8((uint16x8_t)vaddq_s16(v119, v110), vhadd_u8((uint8x8_t)v97, *(uint8x8_t *)v36.i8)), 2uLL), vqadd_u8(v95, v117)), vqsub_u8(v95, v117));
      v123 = (int8x8_t)vmax_u8(vmin_u8((uint8x8_t)vrshrn_n_s16(vaddq_s16(v118, v119), 2uLL), vqadd_u8(*(uint8x8_t *)v36.i8, v117)), vqsub_u8(*(uint8x8_t *)v36.i8, v117));
      v124 = (int8x8_t)vmax_u8(vmin_u8((uint8x8_t)vrshrn_n_s16(vaddq_s16(v120, v119), 2uLL), vqadd_u8(v96, v117)), vqsub_u8(v96, v117));
      v125 = (int8x8_t)vmax_u8(vmin_u8((uint8x8_t)vrshrn_n_s16(vaddq_s16((int16x8_t)vaddl_u8(*(uint8x8_t *)v35.i8, *(uint8x8_t *)v39.i8), (int16x8_t)vhaddq_u16((uint16x8_t)v118, (uint16x8_t)v119)), 2uLL), vqadd_u8(*(uint8x8_t *)v39.i8, v117)), vqsub_u8(*(uint8x8_t *)v39.i8, v117));
      v126 = (int8x8_t)vmax_u8(vmin_u8((uint8x8_t)vrshrn_n_s16(vaddq_s16((int16x8_t)vaddl_high_u8((uint8x16_t)v36, (uint8x16_t)v40), (int16x8_t)vhaddq_u16((uint16x8_t)v120, (uint16x8_t)v119)), 2uLL), vqadd_u8((uint8x8_t)v97, v117)), vqsub_u8((uint8x8_t)v97, v117));
      v127 = (int16x8_t)vbicq_s8((int8x16_t)v111, (int8x16_t)v113);
      v120.i64[0] = 0x9000900090009;
      v120.i64[1] = 0x9000900090009;
      v128 = vmulq_s16((int16x8_t)vsubl_u8(v95, *(uint8x8_t *)v40.i8), v120);
      v120.i64[0] = 0x2000200020002;
      v120.i64[1] = 0x2000200020002;
      v129 = vrshrq_n_s16(vmlaq_s16(v128, (int16x8_t)vsubl_u8(v96, *(uint8x8_t *)v36.i8), v120), 4uLL);
      v120.i64[0] = 0xA000A000A000ALL;
      v120.i64[1] = 0xA000A000A000ALL;
      v130 = (int8x16_t)vcgtq_s16(vmulq_s16(v127, v120), vabsq_s16(v129));
      v131 = vmaxq_s16(vminq_s16((int16x8_t)vandq_s8((int8x16_t)v129, v130), v127), vnegq_s16(v127));
      v132 = vshrq_n_s16(v127, 1uLL);
      v133 = vnegq_s16(v132);
      v36 = vaddq_s16((int16x8_t)vandq_s8((int8x16_t)vmaxq_s16(vminq_s16(vhaddq_s16((int16x8_t)vsubl_u8(vrhadd_u8(*(uint8x8_t *)v39.i8, *(uint8x8_t *)v40.i8), *(uint8x8_t *)v36.i8), v131), v132), v133), vandq_s8(v166, v130)), v108);
      v134 = vqmovun_s16(vaddq_s16((int16x8_t)vandq_s8((int8x16_t)vmaxq_s16(vminq_s16(vhsubq_s16((int16x8_t)vsubl_u8(vrhadd_u8((uint8x8_t)v97, v95), v96), v131), v132), v133), vandq_s8(v115, v130)), v110));
      v135 = vqmovn_s16(v113);
      *(int8x8_t *)v39.i8 = vbsl_s8(v135, v125, *(int8x8_t *)v39.i8);
      *(int8x8_t *)v36.i8 = vbsl_s8(v135, v123, vqmovun_s16(v36));
      *(int8x8_t *)v40.i8 = vbsl_s8(v135, v171, vqmovun_s16(vaddq_s16(v131, v121)));
      v95 = (uint8x8_t)vbsl_s8(v135, v122, vqmovun_s16(vsubq_s16(v168, v131)));
      v96 = (uint8x8_t)vbsl_s8(v135, v124, v134);
      v97 = vbsl_s8(v135, v126, v97);
    }
    else
    {
      v136 = (int16x8_t)vbicq_s8((int8x16_t)v111, (int8x16_t)v113);
      v137.i64[0] = 0x2000200020002;
      v137.i64[1] = 0x2000200020002;
      v138 = vrshrq_n_s16(vmlaq_s16((int16x8_t)vmlsl_u8(vmull_u8(v95, (uint8x8_t)0x909090909090909), *(uint8x8_t *)v40.i8, (uint8x8_t)0x909090909090909), (int16x8_t)vsubl_u8(v96, *(uint8x8_t *)v36.i8), v137), 4uLL);
      v139.i64[0] = 0xA000A000A000ALL;
      v139.i64[1] = 0xA000A000A000ALL;
      v140 = (int8x16_t)vcgtq_s16(vmulq_s16(v136, v139), vabsq_s16(v138));
      v141 = vmaxq_s16(vminq_s16((int16x8_t)vandq_s8((int8x16_t)v138, v140), v136), vnegq_s16(v136));
      v142 = vaddq_s16(v141, v109);
      v143 = vshrq_n_s16(v136, 1uLL);
      v144 = vnegq_s16(v143);
      v36 = vaddq_s16((int16x8_t)vandq_s8((int8x16_t)vmaxq_s16(vminq_s16(vhaddq_s16((int16x8_t)vsubl_u8(vrhadd_u8(*(uint8x8_t *)v39.i8, *(uint8x8_t *)v40.i8), *(uint8x8_t *)v36.i8), v141), v143), v144), vandq_s8(v114, v140)), v108);
      v145 = vaddq_s16((int16x8_t)vandq_s8((int8x16_t)vmaxq_s16(vminq_s16(vhsubq_s16((int16x8_t)vsubl_u8(vrhadd_u8((uint8x8_t)v97, v95), v96), v141), v143), v144), vandq_s8(v115, v140)), v110);
      *(int8x8_t *)v36.i8 = vqmovun_s16(v36);
      *(int8x8_t *)v40.i8 = vqmovun_s16(v142);
      v95 = (uint8x8_t)vqmovun_s16(vsubq_s16(v168, v141));
      v96 = (uint8x8_t)vqmovun_s16(v145);
    }
  }
  v38.u64[1] = (unint64_t)v44;
  v34.u64[1] = (unint64_t)v43;
  v37.u64[1] = (unint64_t)v42;
  v33.u64[1] = (unint64_t)v41;
  v35.u64[1] = (unint64_t)v95;
  v39.u64[1] = (unint64_t)v96;
  v36.u64[1] = (unint64_t)v97;
  v40.u64[1] = (unint64_t)v98;
  v146 = (int16x8_t)vtrn1q_s8(v33, v35);
  v147 = (int16x8_t)vtrn2q_s8(v33, v35);
  v148 = (int16x8_t)vtrn1q_s8(v37, v39);
  v149 = (int16x8_t)vtrn2q_s8(v37, v39);
  v150 = (int16x8_t)vtrn1q_s8((int8x16_t)v34, (int8x16_t)v36);
  v151 = (int16x8_t)vtrn2q_s8((int8x16_t)v34, (int8x16_t)v36);
  v152 = (int16x8_t)vtrn1q_s8(v38, v40);
  v153 = (int16x8_t)vtrn2q_s8(v38, v40);
  v154 = (int32x4_t)vtrn1q_s16(v146, v148);
  v155 = (int32x4_t)vtrn2q_s16(v146, v148);
  v156 = (int32x4_t)vtrn1q_s16(v147, v149);
  v157 = (int32x4_t)vtrn2q_s16(v147, v149);
  v158 = (int32x4_t)vtrn1q_s16(v150, v152);
  v159 = (int32x4_t)vtrn2q_s16(v150, v152);
  v160 = (int32x4_t)vtrn1q_s16(v151, v153);
  v161 = (int32x4_t)vtrn2q_s16(v151, v153);
  *v7 = vtrn1q_s32(v154, v158);
  *(int32x4_t *)((char *)v7 + a2) = vtrn1q_s32(v156, v160);
  *(int32x4_t *)((char *)v7 + 2 * a2) = vtrn1q_s32(v155, v159);
  *(int32x4_t *)((char *)v7 + 3 * a2) = vtrn1q_s32(v157, v161);
  *(int32x4_t *)((char *)v7 + 4 * a2) = vtrn2q_s32(v154, v158);
  *(int32x4_t *)((char *)v7 + 5 * a2) = vtrn2q_s32(v156, v160);
  result = vtrn2q_s32(v157, v161);
  *(int32x4_t *)((char *)v7 + 6 * a2) = vtrn2q_s32(v155, v159);
  *(int32x4_t *)((char *)v7 + 7 * a2) = result;
  return result;
}

void InLoopChromaH_neon(char *a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  const char *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  int8x8_t v8;
  char *v9;
  const char *v11;
  char *v12;
  char *v13;
  int8x8_t v14;
  int16x8_t v15;
  int16x8_t v16;
  int16x8_t v17;
  int16x8_t v18;
  int16x8_t v19;
  int16x8_t v20;
  int16x8_t v21;
  int16x8_t v22;
  int16x8_t v23;
  int8x16_t v24;
  int8x16_t v25;
  int16x8_t v26;
  int16x8_t v27;
  int16x8_t v28;
  int16x8_t v29;
  int16x8_t v30;
  uint8x8_t v31;
  int16x8_t v32;
  int16x8_t v33;
  int8x16_t v34;
  int8x16_t v35;
  int8x8_t v36;
  uint8x8_t v37;
  int16x8_t v38;
  int16x8_t v39;
  int16x8_t v40;
  int16x8_t v41;
  int16x8_t v42;
  int16x8_t v43;
  int8x8_t v44;
  int16x8_t v45;
  int16x8_t v46;
  int16x8_t v47;
  int16x8_t v48;
  int8x16_t v49;
  int16x8_t v50;
  int16x8_t v51;
  int16x8_t v52;
  int16x8_t v53;
  int16x8_t v54;
  int16x8_t v55;
  int16x8_t v56;
  int16x8_t v57;
  int16x8_t v58;
  int16x8_t v59;
  int16x8_t v60;
  int16x8_t v61;
  int8x16_t v62;
  int16x8_t v63;
  int16x8_t v64;
  int16x8_t v65;
  int16x8_t v66;
  int16x8_t v67;
  int16x8_t v68;
  int16x8_t v69;
  int8x8_t v70;
  uint8x8_t v71;
  uint8x8_t v72;
  int8x8_t v73;
  int8x8_t v74;
  int16x8_t v75;
  int16x8_t v76;
  int16x8_t v77;
  int8x8_t v78;
  int16x8_t v79;
  int16x8_t v80;
  int16x8_t v81;
  int16x8_t v82;
  int16x8_t v83;
  int8x16_t v84;
  int16x8_t v85;
  int16x8_t v86;
  int16x8_t v87;
  int8x16_t v88;
  int8x16_t v89;
  int8x8_t v90;
  uint8x8_t v91;
  int16x8_t v92;
  int16x8_t v93;
  int16x8_t v94;
  int8x8_t v95;
  int8x8_t v96;
  int8x8_t v97;
  int8x8_t v98;
  int8x8_t v99;
  int16x8_t v100;
  int16x8_t v101;
  int16x8_t v102;
  int8x16_t v103;
  int16x8_t v104;
  int16x8_t v105;
  int16x8_t v106;
  int16x8_t v107;
  int16x8_t v108;
  int8x8_t v109;
  int8x8_t v110;
  int8x8_t v111;
  int8x8_t v112;
  int8x8_t v113;
  int16x8_t v114;
  int16x8_t v115;
  int16x8_t v116;
  int16x8_t v117;
  int8x16_t v118;
  int16x8_t v119;
  int16x8_t v120;
  int16x8_t v121;
  int16x8_t v122;
  int16x8_t v123;
  int8x8_t v124;
  uint8x8_t v125;
  int8x8_t v126;
  uint8x8_t v127;
  int8x8_t v128;
  int8x8_t v129;
  int8x8_t v130;
  int8x8_t v131;
  int16x8_t v132;
  int8x8_t v133;
  int8x8_t v134;
  int8x16_t v135;
  int16x8_t v136;
  int16x8_t v137;
  int8x16_t v138;
  int16x8_t v139;
  int16x8_t v140;
  int8x16_t v141;
  uint8x8_t v142;
  int8x8_t v143;
  uint8x8_t v144;
  int16x8_t v145;
  int8x8_t v146;
  int16x8_t v147;
  int8x8_t v148;
  int16x8_t v149;
  int16x8_t v150;
  uint8x8_t v151;
  int16x8_t v152;
  uint8x8_t v153;
  uint8x8_t v154;
  int8x8x2_t v155;
  int8x8x2_t v156;
  int8x8x2_t v157;
  int8x8x2_t v158;
  int8x8x2_t v159;
  int8x8x2_t v160;
  int8x8x2_t v161;
  int8x8x2_t v162;

  v4 = &a1[-4 * a2];
  v160 = vld2_s8(v4);
  v5 = 3 * a2;
  v6 = &a1[-3 * a2];
  v155 = vld2_s8(v6);
  v7 = &a1[-2 * a2];
  v161 = vld2_s8(v7);
  v8 = v155.val[0];
  v9 = &a1[-a2];
  v162 = vld2_s8(v9);
  v153 = (uint8x8_t)v161.val[1];
  v158 = vld2_s8(a1);
  v11 = &a1[v5];
  v151 = (uint8x8_t)v158.val[1];
  v12 = &a1[a2];
  v159 = vld2_s8(v12);
  v154 = (uint8x8_t)v159.val[1];
  v13 = &a1[2 * a2];
  v156 = vld2_s8(v13);
  v14 = v156.val[0];
  v15 = (int16x8_t)vaddl_u8((uint8x8_t)v162.val[0], (uint8x8_t)v155.val[0]);
  v16 = (int16x8_t)vshll_n_u8((uint8x8_t)v161.val[0], 1uLL);
  v17 = vabdq_s16(v15, v16);
  v18 = (int16x8_t)vaddl_u8((uint8x8_t)v156.val[0], (uint8x8_t)v158.val[0]);
  v19 = (int16x8_t)vshll_n_u8((uint8x8_t)v159.val[0], 1uLL);
  v20 = vabdq_s16(v18, v19);
  v21 = vdupq_n_s16(a3);
  v22 = (int16x8_t)vqtbl1q_s8((int8x16_t)vabaq_s16(vrev64q_s16(v17), v15, v16), (int8x16_t)xmmword_2195269D0);
  v23 = (int16x8_t)vqtbl1q_s8((int8x16_t)vabaq_s16(vrev64q_s16(v20), v18, v19), (int8x16_t)xmmword_2195269D0);
  v24 = (int8x16_t)vcgtq_s16(v21, vaddq_s16(v23, v22));
  v25 = (int8x16_t)vdupq_n_s16(a4);
  v26 = vshrq_n_s16(vsraq_n_s16(v21, v21, 1uLL), 3uLL);
  v27 = vshrq_n_s16(v21, 3uLL);
  v28 = vrshrq_n_s16(v21, 3uLL);
  v157 = vld2_s8(v11);
  v144 = (uint8x8_t)v160.val[1];
  v142 = (uint8x8_t)v157.val[1];
  v136 = v28;
  v135 = v25;
  if (vaddlvq_u16((uint16x8_t)v24))
  {
    v133 = v156.val[1];
    v134 = v155.val[1];
    v29 = (int16x8_t)vmovl_u8((uint8x8_t)v161.val[0]);
    v132 = (int16x8_t)vmovl_u8((uint8x8_t)v159.val[0]);
    v145 = (int16x8_t)vmovl_u8((uint8x8_t)v158.val[0]);
    v147 = (int16x8_t)vmovl_u8((uint8x8_t)v162.val[0]);
    v30 = (int16x8_t)vandq_s8(v25, v24);
    v139 = v26;
    v31 = (uint8x8_t)v160.val[0];
    v32 = (int16x8_t)vandq_s8((int8x16_t)vcgtq_s16(vrhaddq_s16(v30, vshlq_n_s16(v30, 2uLL)), (int16x8_t)vabdl_u8((uint8x8_t)v162.val[0], (uint8x8_t)v158.val[0])), vandq_s8((int8x16_t)vcgtq_s16(v28, vaddq_s16(v20, v17)), (int8x16_t)vcgtq_s16(v27, (int16x8_t)vabal_u8(vabdl_u8((uint8x8_t)v157.val[0], (uint8x8_t)v158.val[0]), (uint8x8_t)v160.val[0], (uint8x8_t)v162.val[0]))));
    v33 = (int16x8_t)vqtbl1q_s8(vandq_s8((int8x16_t)vrev64q_s16(v32), (int8x16_t)v32), (int8x16_t)xmmword_2195269D0);
    v34 = (int8x16_t)vcgtq_s16(v26, v22);
    v35 = (int8x16_t)vcgtq_s16(v26, v23);
    if (vaddlvq_u16((uint16x8_t)v33))
    {
      v36 = vmovn_s16(v30);
      v37 = (uint8x8_t)vadd_s8(v36, v36);
      v38 = (int16x8_t)vaddl_u8((uint8x8_t)v161.val[0], (uint8x8_t)v8);
      v39 = (int16x8_t)vaddl_u8((uint8x8_t)v158.val[0], (uint8x8_t)v162.val[0]);
      v40 = v29;
      v131 = (int8x8_t)vmax_u8(vmin_u8((uint8x8_t)vrshrn_n_s16((int16x8_t)vaddw_u8((uint16x8_t)vaddq_s16(v39, v29), vhadd_u8((uint8x8_t)v8, (uint8x8_t)v159.val[0])), 2uLL), vqadd_u8((uint8x8_t)v162.val[0], v37)), vqsub_u8((uint8x8_t)v162.val[0], v37));
      v130 = (int8x8_t)vmax_u8(vmin_u8((uint8x8_t)vrshrn_n_s16((int16x8_t)vaddw_u8((uint16x8_t)vaddq_s16(v39, v132), vhadd_u8((uint8x8_t)v156.val[0], (uint8x8_t)v161.val[0])), 2uLL), vqadd_u8((uint8x8_t)v158.val[0], v37)), vqsub_u8((uint8x8_t)v158.val[0], v37));
      v41.i64[0] = 0x9000900090009;
      v41.i64[1] = 0x9000900090009;
      v42 = vmulq_s16((int16x8_t)vsubl_u8((uint8x8_t)v158.val[0], (uint8x8_t)v162.val[0]), v41);
      v41.i64[0] = 0x2000200020002;
      v41.i64[1] = 0x2000200020002;
      v43 = (int16x8_t)vaddl_u8((uint8x8_t)v14, (uint8x8_t)v159.val[0]);
      v44 = (int8x8_t)vmax_u8(vmin_u8((uint8x8_t)vrshrn_n_s16(vaddq_s16(v43, v39), 2uLL), vqadd_u8((uint8x8_t)v159.val[0], v37)), vqsub_u8((uint8x8_t)v159.val[0], v37));
      v45 = (int16x8_t)vbicq_s8((int8x16_t)v30, (int8x16_t)v33);
      v46 = vrshrq_n_s16(vmlaq_s16(v42, (int16x8_t)vsubl_u8((uint8x8_t)v159.val[0], (uint8x8_t)v161.val[0]), v41), 4uLL);
      v47 = (int16x8_t)vsubl_u8(vrhadd_u8((uint8x8_t)v14, (uint8x8_t)v158.val[0]), (uint8x8_t)v159.val[0]);
      v48.i64[0] = 0xA000A000A000ALL;
      v48.i64[1] = 0xA000A000A000ALL;
      v49 = (int8x16_t)vcgtq_s16(vmulq_s16(v45, v48), vabsq_s16(v46));
      v50 = vmaxq_s16(vminq_s16((int16x8_t)vandq_s8((int8x16_t)v46, v49), v45), vnegq_s16(v45));
      v51 = vshrq_n_s16(v45, 1uLL);
      v52 = vnegq_s16(v51);
      v53 = vaddq_s16((int16x8_t)vandq_s8((int8x16_t)vmaxq_s16(vminq_s16(vhaddq_s16((int16x8_t)vsubl_u8(vrhadd_u8((uint8x8_t)v8, (uint8x8_t)v162.val[0]), (uint8x8_t)v161.val[0]), v50), v51), v52), vandq_s8(v34, v49)), v40);
      v54 = vaddq_s16(v50, v147);
      v55 = vsubq_s16(v145, v50);
      v56 = vaddq_s16((int16x8_t)vandq_s8((int8x16_t)vmaxq_s16(vminq_s16(vhsubq_s16(v47, v50), v51), v52), vandq_s8(v35, v49)), v132);
      *(int8x8_t *)v49.i8 = vqmovn_s16(v33);
      v148 = vbsl_s8(*(int8x8_t *)v49.i8, (int8x8_t)vmax_u8(vmin_u8((uint8x8_t)vrshrn_n_s16(vaddq_s16((int16x8_t)vaddl_u8((uint8x8_t)v8, v31), (int16x8_t)vhaddq_u16((uint16x8_t)v38, (uint16x8_t)v39)), 2uLL), vqadd_u8((uint8x8_t)v8, v37)), vqsub_u8((uint8x8_t)v8, v37)), v8);
      v146 = vbsl_s8(*(int8x8_t *)v49.i8, (int8x8_t)vmax_u8(vmin_u8((uint8x8_t)vrshrn_n_s16(vaddq_s16((int16x8_t)vaddl_u8((uint8x8_t)v157.val[0], (uint8x8_t)v14), (int16x8_t)vhaddq_u16((uint16x8_t)v43, (uint16x8_t)v39)), 2uLL), vqadd_u8((uint8x8_t)v14, v37)), vqsub_u8((uint8x8_t)v14, v37)), v14);
      *(int8x8_t *)v47.i8 = vqmovun_s16(v55);
      v161.val[0] = vbsl_s8(*(int8x8_t *)v49.i8, (int8x8_t)vmax_u8(vmin_u8((uint8x8_t)vrshrn_n_s16(vaddq_s16(v39, v38), 2uLL), vqadd_u8((uint8x8_t)v161.val[0], v37)), vqsub_u8((uint8x8_t)v161.val[0], v37)), vqmovun_s16(v53));
      v162.val[0] = vbsl_s8(*(int8x8_t *)v49.i8, v131, vqmovun_s16(v54));
      v158.val[0] = vbsl_s8(*(int8x8_t *)v49.i8, v130, *(int8x8_t *)v47.i8);
      v159.val[0] = vbsl_s8(*(int8x8_t *)v49.i8, v44, vqmovun_s16(v56));
      v26 = v139;
    }
    else
    {
      v57 = (int16x8_t)vbicq_s8((int8x16_t)v30, (int8x16_t)v33);
      v58 = v29;
      v59.i64[0] = 0x2000200020002;
      v59.i64[1] = 0x2000200020002;
      v60 = vrshrq_n_s16(vmlaq_s16((int16x8_t)vmlsl_u8(vmull_u8((uint8x8_t)v158.val[0], (uint8x8_t)0x909090909090909), (uint8x8_t)v162.val[0], (uint8x8_t)0x909090909090909), (int16x8_t)vsubl_u8((uint8x8_t)v159.val[0], (uint8x8_t)v161.val[0]), v59), 4uLL);
      v61.i64[0] = 0xA000A000A000ALL;
      v61.i64[1] = 0xA000A000A000ALL;
      v62 = (int8x16_t)vcgtq_s16(vmulq_s16(v57, v61), vabsq_s16(v60));
      v63 = vmaxq_s16(vminq_s16((int16x8_t)vandq_s8((int8x16_t)v60, v62), v57), vnegq_s16(v57));
      v64 = vaddq_s16(v63, v147);
      v65 = vsubq_s16(v145, v63);
      v66 = vshrq_n_s16(v57, 1uLL);
      v67 = vnegq_s16(v66);
      v148 = v8;
      v68 = vaddq_s16((int16x8_t)vandq_s8((int8x16_t)vmaxq_s16(vminq_s16(vhaddq_s16((int16x8_t)vsubl_u8(vrhadd_u8((uint8x8_t)v8, (uint8x8_t)v162.val[0]), (uint8x8_t)v161.val[0]), v63), v66), v67), vandq_s8(v34, v62)), v58);
      v146 = v14;
      v69 = (int16x8_t)vandq_s8((int8x16_t)vmaxq_s16(vminq_s16(vhsubq_s16((int16x8_t)vsubl_u8(vrhadd_u8((uint8x8_t)v14, (uint8x8_t)v158.val[0]), (uint8x8_t)v159.val[0]), v63), v66), v67), vandq_s8(v35, v62));
      v161.val[0] = vqmovun_s16(v68);
      v162.val[0] = vqmovun_s16(v64);
      v158.val[0] = vqmovun_s16(v65);
      v159.val[0] = vqmovun_s16(vaddq_s16(v69, v132));
    }
    v155.val[1] = v134;
    v156.val[1] = v133;
  }
  else
  {
    v146 = v156.val[0];
    v148 = v155.val[0];
  }
  v70 = (int8x8_t)v154;
  v71 = v153;
  v72 = v151;
  v73 = v162.val[1];
  v74 = v155.val[1];
  v75 = (int16x8_t)vaddl_u8((uint8x8_t)v162.val[1], (uint8x8_t)v155.val[1]);
  v76 = (int16x8_t)vshll_n_u8(v153, 1uLL);
  v77 = vabdq_s16(v75, v76);
  v78 = v156.val[1];
  v79 = (int16x8_t)vaddl_u8((uint8x8_t)v156.val[1], v151);
  v80 = (int16x8_t)vshll_n_u8(v154, 1uLL);
  v81 = vabdq_s16(v79, v80);
  v82 = (int16x8_t)vqtbl1q_s8((int8x16_t)vabaq_s16(vrev64q_s16(v77), v75, v76), (int8x16_t)xmmword_2195269D0);
  v83 = (int16x8_t)vqtbl1q_s8((int8x16_t)vabaq_s16(vrev64q_s16(v81), v79, v80), (int8x16_t)xmmword_2195269D0);
  v84 = (int8x16_t)vcgtq_s16(v21, vaddq_s16(v83, v82));
  if (vaddlvq_u16((uint16x8_t)v84))
  {
    v149 = (int16x8_t)vmovl_u8((uint8x8_t)v162.val[1]);
    v150 = (int16x8_t)vmovl_u8(v153);
    v152 = (int16x8_t)vmovl_u8(v154);
    v140 = (int16x8_t)vmovl_u8(v72);
    v85 = (int16x8_t)vandq_s8(v135, v84);
    v86 = (int16x8_t)vandq_s8((int8x16_t)vcgtq_s16(vrhaddq_s16(v85, vshlq_n_s16(v85, 2uLL)), (int16x8_t)vabdl_u8((uint8x8_t)v162.val[1], v72)), vandq_s8((int8x16_t)vcgtq_s16(v136, vaddq_s16(v81, v77)), (int8x16_t)vcgtq_s16(v27, (int16x8_t)vabal_u8(vabdl_u8(v142, v72), v144, (uint8x8_t)v162.val[1]))));
    v87 = (int16x8_t)vqtbl1q_s8(vandq_s8((int8x16_t)vrev64q_s16(v86), (int8x16_t)v86), (int8x16_t)xmmword_2195269D0);
    v88 = (int8x16_t)vcgtq_s16(v26, v82);
    v89 = (int8x16_t)vcgtq_s16(v26, v83);
    if (vaddlvq_u16((uint16x8_t)v87))
    {
      v90 = vmovn_s16(v85);
      v91 = (uint8x8_t)vadd_s8(v90, v90);
      v92 = (int16x8_t)vaddl_u8(v71, (uint8x8_t)v74);
      v93 = (int16x8_t)vaddl_u8(v72, (uint8x8_t)v162.val[1]);
      v94 = (int16x8_t)vaddl_u8((uint8x8_t)v78, v154);
      v137 = (int16x8_t)vaddl_u8(v142, (uint8x8_t)v78);
      v138 = v88;
      v141 = v89;
      v143 = (int8x8_t)vmax_u8(vmin_u8((uint8x8_t)vrshrn_n_s16((int16x8_t)vaddw_u8((uint16x8_t)vaddq_s16(v93, v150), vhadd_u8((uint8x8_t)v74, v154)), 2uLL), vqadd_u8((uint8x8_t)v162.val[1], v91)), vqsub_u8((uint8x8_t)v162.val[1], v91));
      v95 = (int8x8_t)vmax_u8(vmin_u8((uint8x8_t)vrshrn_n_s16((int16x8_t)vaddw_u8((uint16x8_t)vaddq_s16(v93, v152), vhadd_u8((uint8x8_t)v78, v71)), 2uLL), vqadd_u8(v72, v91)), vqsub_u8(v72, v91));
      v96 = (int8x8_t)vmax_u8(vmin_u8((uint8x8_t)vrshrn_n_s16(vaddq_s16(v93, v92), 2uLL), vqadd_u8(v71, v91)), vqsub_u8(v71, v91));
      v97 = (int8x8_t)vmax_u8(vmin_u8((uint8x8_t)vrshrn_n_s16(vaddq_s16(v94, v93), 2uLL), vqadd_u8(v154, v91)), vqsub_u8(v154, v91));
      v98 = (int8x8_t)vmax_u8(vmin_u8((uint8x8_t)vrshrn_n_s16(vaddq_s16((int16x8_t)vaddl_u8((uint8x8_t)v74, v144), (int16x8_t)vhaddq_u16((uint16x8_t)v92, (uint16x8_t)v93)), 2uLL), vqadd_u8((uint8x8_t)v74, v91)), vqsub_u8((uint8x8_t)v74, v91));
      v99 = (int8x8_t)vmax_u8(vmin_u8((uint8x8_t)vrshrn_n_s16(vaddq_s16(v137, (int16x8_t)vhaddq_u16((uint16x8_t)v94, (uint16x8_t)v93)), 2uLL), vqadd_u8((uint8x8_t)v78, v91)), vqsub_u8((uint8x8_t)v78, v91));
      v100 = (int16x8_t)vbicq_s8((int8x16_t)v85, (int8x16_t)v87);
      v94.i64[0] = 0x9000900090009;
      v94.i64[1] = 0x9000900090009;
      v101 = vmulq_s16((int16x8_t)vsubl_u8(v72, (uint8x8_t)v162.val[1]), v94);
      v94.i64[0] = 0x2000200020002;
      v94.i64[1] = 0x2000200020002;
      v102 = vrshrq_n_s16(vmlaq_s16(v101, (int16x8_t)vsubl_u8(v154, v71), v94), 4uLL);
      v94.i64[0] = 0xA000A000A000ALL;
      v94.i64[1] = 0xA000A000A000ALL;
      v103 = (int8x16_t)vcgtq_s16(vmulq_s16(v100, v94), vabsq_s16(v102));
      v104 = vmaxq_s16(vminq_s16((int16x8_t)vandq_s8((int8x16_t)v102, v103), v100), vnegq_s16(v100));
      v105 = vshrq_n_s16(v100, 1uLL);
      v106 = vnegq_s16(v105);
      v107 = vaddq_s16((int16x8_t)vandq_s8((int8x16_t)vmaxq_s16(vminq_s16(vhaddq_s16((int16x8_t)vsubl_u8(vrhadd_u8((uint8x8_t)v74, (uint8x8_t)v162.val[1]), v71), v104), v105), v106), vandq_s8(v138, v103)), v150);
      v108 = vaddq_s16((int16x8_t)vandq_s8((int8x16_t)vmaxq_s16(vminq_s16(vhsubq_s16((int16x8_t)vsubl_u8(vrhadd_u8((uint8x8_t)v78, v72), v154), v104), v105), v106), vandq_s8(v141, v103)), v152);
      v109 = vqmovn_s16(v87);
      v74 = vbsl_s8(v109, v98, v74);
      v71 = (uint8x8_t)vbsl_s8(v109, v96, vqmovun_s16(v107));
      v73 = vbsl_s8(v109, v143, vqmovun_s16(vaddq_s16(v104, v149)));
      v72 = (uint8x8_t)vbsl_s8(v109, v95, vqmovun_s16(vsubq_s16(v140, v104)));
      v70 = vbsl_s8(v109, v97, vqmovun_s16(v108));
      v110 = vbsl_s8(v109, v99, v78);
    }
    else
    {
      v114 = (int16x8_t)vbicq_s8((int8x16_t)v85, (int8x16_t)v87);
      v115.i64[0] = 0x2000200020002;
      v115.i64[1] = 0x2000200020002;
      v116 = vrshrq_n_s16(vmlaq_s16((int16x8_t)vmlsl_u8(vmull_u8(v72, (uint8x8_t)0x909090909090909), (uint8x8_t)v162.val[1], (uint8x8_t)0x909090909090909), (int16x8_t)vsubl_u8(v154, v71), v115), 4uLL);
      v117.i64[0] = 0xA000A000A000ALL;
      v117.i64[1] = 0xA000A000A000ALL;
      v118 = (int8x16_t)vcgtq_s16(vmulq_s16(v114, v117), vabsq_s16(v116));
      v119 = vmaxq_s16(vminq_s16((int16x8_t)vandq_s8((int8x16_t)v116, v118), v114), vnegq_s16(v114));
      v120 = vshrq_n_s16(v114, 1uLL);
      v121 = vnegq_s16(v120);
      v122 = vaddq_s16((int16x8_t)vandq_s8((int8x16_t)vmaxq_s16(vminq_s16(vhaddq_s16((int16x8_t)vsubl_u8(vrhadd_u8((uint8x8_t)v74, (uint8x8_t)v162.val[1]), v71), v119), v120), v121), vandq_s8(v88, v118)), v150);
      v123 = (int16x8_t)vandq_s8((int8x16_t)vmaxq_s16(vminq_s16(vhsubq_s16((int16x8_t)vsubl_u8(vrhadd_u8((uint8x8_t)v78, v72), v154), v119), v120), v121), vandq_s8(v89, v118));
      v71 = (uint8x8_t)vqmovun_s16(v122);
      v73 = vqmovun_s16(vaddq_s16(v119, v149));
      v110 = v78;
      v72 = (uint8x8_t)vqmovun_s16(vsubq_s16(v140, v119));
      v70 = vqmovun_s16(vaddq_s16(v123, v152));
    }
    v111 = v74;
    v112 = v148;
    v113 = v146;
  }
  else
  {
    v111 = v74;
    v112 = v148;
    v110 = v78;
    v113 = v146;
  }
  v124 = v111;
  vst2_s8(v6, *(int8x8x2_t *)v112.i8);
  v125 = v71;
  vst2_s8(v7, v161);
  v126 = v73;
  vst2_s8(v9, v162);
  v127 = v72;
  vst2_s8(a1, v158);
  v128 = v70;
  vst2_s8(v12, v159);
  v129 = v110;
  vst2_s8(v13, *(int8x8x2_t *)v113.i8);
}

BOOL registerDecoder(unsigned int a1)
{
  int v2;
  int v3;

  v2 = VTRegisterVideoDecoderWithInfo();
  v3 = v2;
  if (v2)
    syslog(3, "AppleD5500: %s() - ERROR: Registration for %c%c%c%c failed with status %d\n", "registerDecoder", HIBYTE(a1), BYTE2(a1), BYTE1(a1), a1, v2);
  return v3 != 0;
}

uint64_t AppleD5500WrapperMPEG4DecoderCreateInstance(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;

  VTVideoDecoderGetClassID();
  v4 = CMDerivedObjectCreate();
  syslog(3, "AppleD5500: FigDerivedObjectCreate failed");
  if ((_DWORD)v4)
    syslog(3, "AppleD5500: Error in D5500_MPEG4VideoDecoder_CreateInstance.");
  *a3 = 0;
  return v4;
}

uint64_t EnsurePropertyDictionaryCreation()
{
  return pthread_once(&sCreateSupportedPropertyDictionaryOnce, mpeg4_createSupportedPropertyDictionary);
}

void mpeg4_createSupportedPropertyDictionary()
{
  void *v0;
  void *v1;
  void *v2;
  const __CFAllocator *v3;
  uint64_t i;
  const void *v5;
  CFDictionaryRef v6;
  CFDictionaryRef v7;
  void *v8[2];
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *keys[2];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *values[5];

  values[4] = *(void **)MEMORY[0x24BDAC8D0];
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v0 = (void *)*MEMORY[0x24BDF9850];
  v1 = (void *)*MEMORY[0x24BDF9800];
  keys[0] = *(void **)MEMORY[0x24BDF9840];
  keys[1] = v1;
  v2 = (void *)*MEMORY[0x24BDF9810];
  v8[0] = v0;
  v8[1] = v2;
  values[0] = mpeg4_createFrameTypesArrayElement((const void *)*MEMORY[0x24BDF9470]);
  values[1] = mpeg4_createFrameTypesArrayElement((const void *)*MEMORY[0x24BDF9488]);
  values[2] = mpeg4_createFrameTypesArrayElement((const void *)*MEMORY[0x24BDF9478]);
  values[3] = mpeg4_createFrameTypesArrayElement((const void *)*MEMORY[0x24BDF9480]);
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  sMPEG4OnlyTheseFrames = (uint64_t)CFArrayCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)values, 4, MEMORY[0x24BDBD690]);
  if (!sMPEG4OnlyTheseFrames)
    syslog(3, "AppleD5500: AppleD5500_MPEG4VideoDecoder Error:: CFArrayCreate (sMPEG4OnlyTheseFrames) failed");
  for (i = 0; i != 4; ++i)
  {
    v5 = values[i];
    if (v5)
      CFRelease(v5);
  }
  if (sMPEG4OnlyTheseFrames)
  {
    v13 = *MEMORY[0x24BDF9828];
    v9 = sMPEG4OnlyTheseFrames;
    v6 = CFDictionaryCreate(v3, (const void **)keys, (const void **)v8, 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v7 = v6;
    if (v6)
    {
      keys[0] = *(void **)MEMORY[0x24BDF9420];
      v8[0] = v6;
      sMPEG4VideoDecoderSupportedPropertyDictionary = (uint64_t)CFDictionaryCreate(v3, (const void **)keys, (const void **)v8, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (!sMPEG4VideoDecoderSupportedPropertyDictionary)
        syslog(3, "AppleD5500: AppleD5500_MPEG4VideoDecoder Error:: CFDictionaryCreate (sH264VideoDecoderSupportedPropertyDictionary) failed");
    }
    else
    {
      syslog(3, "AppleD5500: AppleD5500_MPEG4VideoDecoder Error:: CFDictionaryCreate (onlyTheseFramesDict) failed");
    }
  }
  else
  {
    v7 = 0;
    syslog(3, "AppleD5500: AppleD5500_MPEG4VideoDecoder Error:: CFDictionaryCreate (sMPEG4OnlyTheseFrames) failed");
  }
  if (sMPEG4OnlyTheseFrames)
    CFRelease((CFTypeRef)sMPEG4OnlyTheseFrames);
  if (v7)
    CFRelease(v7);
}

uint64_t AppleD5500WrapperMPEG4DecoderInvalidate()
{
  uint64_t DerivedStorage;
  uint64_t v1;
  pthread_mutex_t *v2;
  int v3;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (DerivedStorage)
  {
    v1 = DerivedStorage;
    v2 = (pthread_mutex_t *)(DerivedStorage + 3184);
    pthread_mutex_lock((pthread_mutex_t *)(DerivedStorage + 3184));
    v3 = *(_DWORD *)(v1 + 3176);
    if ((v3 - 1) >= 2)
    {
      syslog(3, "AppleD5500: %s called but plugin state is %d", "AppleD5500WrapperMPEG4DecoderInvalidate", v3);
    }
    else
    {
      *(_DWORD *)(v1 + 3176) = 3;
      AppleD5500WrapperMPEG4DecoderCleanUp();
    }
    pthread_mutex_unlock(v2);
    return 0;
  }
  else
  {
    syslog(3, "AppleD5500: %s called with invalid storage", "AppleD5500WrapperMPEG4DecoderInvalidate");
    return 4294954393;
  }
}

void AppleD5500WrapperMPEG4DecoderFinalize()
{
  uint64_t DerivedStorage;
  uint64_t v1;
  pthread_mutex_t *v2;
  int v3;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (DerivedStorage)
  {
    v1 = DerivedStorage;
    v2 = (pthread_mutex_t *)(DerivedStorage + 3184);
    pthread_mutex_lock((pthread_mutex_t *)(DerivedStorage + 3184));
    v3 = *(_DWORD *)(v1 + 3176);
    if ((v3 - 1) >= 3)
    {
      syslog(3, "AppleD5500: %s called but plugin state is %d", "AppleD5500WrapperMPEG4DecoderFinalize", v3);
    }
    else if (v3 != 3)
    {
      AppleD5500WrapperMPEG4DecoderCleanUp();
    }
    pthread_mutex_unlock(v2);
    pthread_mutex_destroy(v2);
  }
  else
  {
    syslog(3, "AppleD5500: %s called with invalid storage", "AppleD5500WrapperMPEG4DecoderFinalize");
  }
}

__CFString *AppleD5500WrapperMPEG4DecoderCopyDebugDescription(uint64_t a1)
{
  __CFString *Mutable;

  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("<AppleD5500_MPEG4VideoDecoder %p>"), a1);
  return Mutable;
}

uint64_t AppleD5500WrapperMPEG4DecoderCopyProperty(uint64_t a1, const void *a2, uint64_t a3, _QWORD *a4)
{
  uint64_t DerivedStorage;
  uint64_t v7;
  const void *v8;
  uint64_t result;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDF9420]))
    return 4294954396;
  v7 = *(int *)(DerivedStorage + 24);
  if (v7 > 3)
    return 4294954396;
  v8 = (const void *)**((_QWORD **)&unk_24DA9CDB8 + v7);
  CFRetain(v8);
  result = 0;
  *a4 = v8;
  return result;
}

uint64_t AppleD5500WrapperMPEG4DecoderSetProperty(uint64_t a1, const void *a2, const void *a3)
{
  uint64_t DerivedStorage;
  int v6;
  uint64_t result;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDF9420]))
  {
    if (!a3 || CFEqual(a3, (CFTypeRef)*MEMORY[0x24BDF9470]))
    {
      v6 = 0;
LABEL_5:
      result = 0;
      *(_DWORD *)(DerivedStorage + 24) = v6;
      return result;
    }
    if (CFEqual(a3, (CFTypeRef)*MEMORY[0x24BDF9488]))
    {
      v6 = 1;
      goto LABEL_5;
    }
    if (CFEqual(a3, (CFTypeRef)*MEMORY[0x24BDF9478]))
    {
      v6 = 2;
      goto LABEL_5;
    }
    if (CFEqual(a3, (CFTypeRef)*MEMORY[0x24BDF9480]))
    {
      v6 = 3;
      goto LABEL_5;
    }
  }
  return 4294954396;
}

void AppleD5500WrapperMPEG4DecoderCleanUp()
{
  uint64_t DerivedStorage;
  uint64_t v1;
  uint64_t v2;
  const void *v3;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v1 = CMBaseObjectGetDerivedStorage();
  v2 = *(_QWORD *)(v1 + 3104);
  if (v2)
  {
    if (AppleD5500TerminateDecoder(v2))
      syslog(3, "AppleD5500: AppleD5500_MPEG4Decoder - ERROR terminate decoder");
    if (AppleD5500CloseConnection(*(_QWORD *)(v1 + 3104)))
    {
      syslog(3, "AppleD5500: AppleD5500_MPEG4Decoder - ERROR closing connection");
      *(_QWORD *)(v1 + 3104) = 0;
      syslog(3, "AppleD5500: AppleD5500WrapperMPEG4DecoderFinalize ERROR :: CloseD5500MPEG4DecoderInstance returned error");
    }
    else
    {
      *(_QWORD *)(v1 + 3104) = 0;
    }
  }
  v3 = *(const void **)(DerivedStorage + 16);
  if (v3)
    CFRelease(v3);
  *(_QWORD *)(DerivedStorage + 16) = 0;
  *(_QWORD *)DerivedStorage = 0;
  FigFormatDescriptionRelease();
  *(_QWORD *)(DerivedStorage + 8) = 0;
  free(*(void **)(DerivedStorage + 3168));
}

uint64_t AppleD5500WrapperMPEG4DecoderStartSession(uint64_t a1, uint64_t a2, const opaqueCMFormatDescription *a3)
{
  uint64_t DerivedStorage;
  uint64_t v6;
  uint64_t v7;
  const opaqueCMFormatDescription *v9;
  CMVideoDimensions Dimensions;
  const __CFString *v11;
  CFPropertyListRef v12;
  const void *v13;
  CFTypeID v14;
  const void *v15;
  const void *ValueAtIndex;
  CFTypeID v17;
  CFTypeID v18;
  const UInt8 *v19;
  int v20;
  BOOL v22;
  BOOL v24;
  BOOL v26;
  BOOL v28;
  BOOL v29;
  const __CFDictionary *Extension;
  const __CFDictionary *v31;
  CFTypeID TypeID;
  const __CFData *Value;
  const __CFData *v34;
  CFTypeID v35;
  CFTypeID v36;
  const UInt8 *BytePtr;
  int Length;
  int v39;
  void *v40;
  uint64_t v41;
  int v42;
  int v43;
  int v44;
  int v45;
  _BOOL4 v47;
  BOOL v48;
  int v49;
  int v50;
  uint64_t v51;
  int v52;
  int v53;
  uint64_t v54;
  int v55;
  int v56;
  int v57;
  int Parameter;
  int v59;
  int v60;
  int v61;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v63;
  CFMutableArrayRef v64;
  __CFArray *v65;
  CFNumberRef v66;
  CFNumberRef v67;
  CFMutableDictionaryRef v68;
  CFNumberRef v69;
  CFNumberRef v70;
  CFNumberRef v71;
  CFNumberRef v72;
  CFNumberRef v73;
  CFNumberRef v74;
  CFNumberRef v75;
  CFNumberRef v76;
  CFNumberRef v77;
  CFNumberRef v78;
  CFNumberRef v79;
  CFNumberRef v80;
  const void *v81;
  const void *v82;
  __CFDictionary *v83;
  int v84;
  const void *PixelBufferPool;
  int valuePtr;
  int v87;
  _BYTE v88[12];
  uint64_t v89;
  uint64_t v90;
  uint64_t (*v91)();
  uint64_t v92;

  valuePtr = 875704438;
  VTVideoDecoderGetCMBaseObject();
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!DerivedStorage)
  {
    syslog(3, "AppleD5500: %s no instance storage!");
    return 4294954387;
  }
  v6 = DerivedStorage;
  if (*(_DWORD *)(DerivedStorage + 3176))
  {
    syslog(3, "AppleD5500: %s ERROR: pluginState isn't kPluginCreated, is %d");
    return 4294954387;
  }
  pthread_mutex_init((pthread_mutex_t *)(DerivedStorage + 3184), 0);
  pthread_mutex_lock((pthread_mutex_t *)(v6 + 3184));
  *(_QWORD *)v6 = a2;
  FigFormatDescriptionRelease();
  v9 = (const opaqueCMFormatDescription *)FigFormatDescriptionRetain();
  *(_QWORD *)(v6 + 8) = v9;
  Dimensions = CMVideoFormatDescriptionGetDimensions(v9);
  *(CMVideoDimensions *)(v6 + 3120) = Dimensions;
  *(_DWORD *)(v6 + 3116) = 0;
  syslog(3, "AppleD5500: %s() codecType: MP4V, %d x %d, built %s %s", "AppleD5500WrapperMPEG4DecoderStartSession", Dimensions.width, Dimensions.height, "01:10:56", "Aug  8 2024");
  if (CMFormatDescriptionGetMediaSubType(a3) == 1932670515 || CMFormatDescriptionGetMediaSubType(a3) == 1748121139)
  {
    *(_BYTE *)(v6 + 3114) = 1;
    v11 = (const __CFString *)*MEMORY[0x24BDC0B80];
    goto LABEL_10;
  }
  *(_BYTE *)(v6 + 3114) = 0;
  v11 = (const __CFString *)*MEMORY[0x24BDC0B80];
  Extension = (const __CFDictionary *)CMFormatDescriptionGetExtension(a3, (CFStringRef)*MEMORY[0x24BDC0B80]);
  if (Extension)
  {
    v31 = Extension;
    TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v31))
    {
      Value = (const __CFData *)CFDictionaryGetValue(v31, CFSTR("esds"));
      if (Value)
      {
        v34 = Value;
        v35 = CFArrayGetTypeID();
        if (v35 != CFGetTypeID(v34) || (v34 = (const __CFData *)CFArrayGetValueAtIndex(v34, 1)) != 0)
        {
          v36 = CFDataGetTypeID();
          if (v36 == CFGetTypeID(v34))
          {
            BytePtr = CFDataGetBytePtr(v34);
            Length = CFDataGetLength(v34);
            if (CFDataGetLength(v34) != Length)
              syslog(3, "AppleD5500: %s %d 64->32 conversion problem!", "AppleD5500WrapperMPEG4DecoderStartSession", 849);
            v39 = CFDataGetLength(v34);
            v40 = malloc_type_malloc(v39, 0xC0237240uLL);
            *(_QWORD *)(v6 + 3168) = v40;
            *(_DWORD *)(v6 + 3164) = v39;
            if (v39 < 1)
            {
              LODWORD(v41) = 0;
            }
            else
            {
              v41 = 0;
              v42 = 0;
              while (1)
              {
                v43 = v42 | BytePtr[v41];
                if ((v43 & 0xFFFFFFF0) == 0x120)
                  break;
                v42 = v43 << 8;
                if (v39 == ++v41)
                {
                  LODWORD(v41) = v39;
                  break;
                }
              }
            }
            v51 = (v41 - 3);
            *(_DWORD *)(v6 + 3164) = v39 - v51;
            memcpy(v40, &BytePtr[v51], v39 - (int)v51);
            if (!*(_BYTE *)(v6 + 3114))
            {
              v50 = 0;
              v49 = 0;
              goto LABEL_95;
            }
LABEL_10:
            v12 = CMFormatDescriptionGetExtension(a3, v11);
            if (!v12
              || (v13 = v12, v14 = CFDictionaryGetTypeID(), v14 != CFGetTypeID(v13))
              || (v15 = CFDictionaryGetValue((CFDictionaryRef)v13, CFSTR("d263"))) == 0
              || (ValueAtIndex = v15, v17 = CFArrayGetTypeID(), v17 == CFGetTypeID(ValueAtIndex))
              && (ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)ValueAtIndex, 1)) == 0
              || (v18 = CFDataGetTypeID(), v18 != CFGetTypeID(ValueAtIndex)))
            {
              syslog(3, "vxdDec: MPEG4 can't find its config record (H.263)");
              goto LABEL_55;
            }
            v19 = CFDataGetBytePtr((CFDataRef)ValueAtIndex);
            v20 = CFDataGetLength((CFDataRef)ValueAtIndex);
            if (CFDataGetLength((CFDataRef)ValueAtIndex) != v20)
              syslog(3, "AppleD5500: %s %d 64->32 conversion problem!", "AppleD5500WrapperMPEG4DecoderStartSession", 903);
            if ((int)CFDataGetLength((CFDataRef)ValueAtIndex) < 7)
            {
              syslog(3, "vxdDec: Bad d263 config record length %d");
              goto LABEL_55;
            }
            if (v19[6] || v19[5] >= 0xBu)
            {
              syslog(3, "vxdDec: Invalid H.263 profile %d or level %d");
              goto LABEL_55;
            }
            v22 = Dimensions.width == 1408 && Dimensions.height == 1152;
            v24 = Dimensions.width == 704 && Dimensions.height == 576;
            v26 = Dimensions.width == 352 && Dimensions.height == 288;
            v28 = Dimensions.width == 176 && Dimensions.height == 144;
            v29 = Dimensions.height == 96 && Dimensions.width == 128;
            if (!v29 && !v28 && !v26 && !v24 && !v22)
            {
              syslog(3, "vxdDec: Invalid H.263 size %d %d");
LABEL_55:
              v7 = 4294954386;
LABEL_56:
              pthread_mutex_unlock((pthread_mutex_t *)(v6 + 3184));
              return v7;
            }
            v44 = 1152;
            v45 = 1408;
            if (Dimensions.width <= 0x2C0u && Dimensions.height <= 0x240u)
            {
              v44 = 576;
              v45 = 704;
              if (Dimensions.width <= 0x160u && Dimensions.height <= 0x120u)
              {
                v44 = 288;
                v45 = 352;
                if (Dimensions.width <= 0xB0u && Dimensions.height <= 0x90u)
                {
                  v47 = Dimensions.width > 0x80u || Dimensions.height > 0x60u;
                  v48 = !v47;
                  if (v47)
                    v45 = 176;
                  else
                    v45 = 128;
                  if (v48)
                    v44 = 96;
                  else
                    v44 = 144;
                }
              }
            }
            v49 = v44 - Dimensions.height;
            v50 = v45 - Dimensions.width;
LABEL_95:
            *(_DWORD *)(v6 + 3120) += v50;
            *(_DWORD *)(v6 + 3124) += v49;
            v92 = 0;
            v52 = AppleD5500OpenConnection(&v92);
            if (v52)
            {
              v53 = v52;
              syslog(3, "AppleD5500: AppleD5500_MPEG4Decoder - ERROR opening kernel connection");
              goto LABEL_105;
            }
            v54 = v92;
            *(_QWORD *)(v6 + 3104) = v92;
            *(_DWORD *)(v6 + 3176) = 1;
            v91 = DisplayCallBack;
            v55 = AppleD5500SetParameter(v54, 1, (int *)&v91);
            if (v55)
            {
              v53 = v55;
              syslog(3, "AppleD5500: AppleD5500_MPEG4Decoder - ERROR setting parameter kAppleD5500DisplayCallBack");
              goto LABEL_105;
            }
            v56 = AppleD5500SetParameter(v92, 2, (int *)v6);
            if (v56)
            {
              v53 = v56;
              syslog(3, "AppleD5500: AppleD5500_MPEG4Decoder - ERROR setting parameter kAppleD5500FIGUserRefCon");
              goto LABEL_105;
            }
            *(_QWORD *)&v88[4] = 0;
            v89 = 0;
            v90 = 0;
            v87 = 1;
            *(_QWORD *)v88 = *(_QWORD *)(v6 + 3120);
            v57 = AppleD5500InitializeDecoder(*(_QWORD *)(v6 + 3104), &v87);
            if (v57)
            {
              v53 = v57;
              syslog(3, "AppleD5500: AppleD5500_MPEG4VideoDecoder ERROR: AppleD5500InitializeDecoder : init decoder device ");
              goto LABEL_105;
            }
            Parameter = AppleD5500GetParameter(v92, 8, v6 + 3128);
            if (Parameter)
            {
              v53 = Parameter;
              syslog(3, "AppleD5500: AppleD5500_MPEG4Decoder - AppleD5500DeviceType returned ERROR");
LABEL_105:
              syslog(3, "AppleD5500: AppleD5500_MPEG4VideoDecoder ERROR: Error creating createAppleD5500HW_MPEG4DecoderInstance");
              if (v53 == -536870210)
                v7 = 4294954383;
              else
                v7 = 4294954385;
              goto LABEL_56;
            }
            v59 = *(_DWORD *)(v6 + 3120);
            v60 = *(_DWORD *)(v6 + 3124);
            v61 = *(unsigned __int8 *)(v6 + 3114);
            Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
            if (!Mutable)
              goto LABEL_130;
            v63 = Mutable;
            v64 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
            if (v64)
            {
              v65 = v64;
              v66 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
              if (v66)
              {
                v67 = v66;
                CFArrayAppendValue(v65, v66);
                CFRelease(v67);
                CFDictionaryAddValue(v63, (const void *)*MEMORY[0x24BDC56B8], v65);
                CFRelease(v65);
                v68 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                CFDictionaryAddValue(v63, (const void *)*MEMORY[0x24BDC5668], v68);
                CFRelease(v68);
                v65 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
                v87 = 1024;
                v69 = CFNumberCreate(0, kCFNumberSInt32Type, &v87);
                if (v69)
                {
                  v70 = v69;
                  CFArrayAppendValue(v65, v69);
                  CFRelease(v70);
                  v87 = 0;
                  v71 = CFNumberCreate(0, kCFNumberSInt32Type, &v87);
                  if (v71)
                  {
                    v72 = v71;
                    CFArrayAppendValue(v65, v71);
                    CFRelease(v72);
                    v87 = 256;
                    v73 = CFNumberCreate(0, kCFNumberSInt32Type, &v87);
                    if (v73)
                    {
                      v74 = v73;
                      CFArrayAppendValue(v65, v73);
                      CFRelease(v74);
                      v87 = 512;
                      v75 = CFNumberCreate(0, kCFNumberSInt32Type, &v87);
                      if (v75)
                      {
                        v76 = v75;
                        CFArrayAppendValue(v65, v75);
                        CFRelease(v76);
                        v87 = 768;
                        v77 = CFNumberCreate(0, kCFNumberSInt32Type, &v87);
                        if (v77)
                        {
                          v78 = v77;
                          CFArrayAppendValue(v65, v77);
                          CFRelease(v78);
                          v87 = 1280;
                          v79 = CFNumberCreate(0, kCFNumberSInt32Type, &v87);
                          if (v79)
                          {
                            v80 = v79;
                            CFArrayAppendValue(v65, v79);
                            CFRelease(v80);
                            CFDictionaryAddValue(v63, (const void *)*MEMORY[0x24BDC55F0], v65);
                            CFRelease(v65);
                            addNumberToDictionary(v63, (const void *)*MEMORY[0x24BDC55D0], 64);
                            v81 = (const void *)*MEMORY[0x24BDC5708];
                            if (v61)
                            {
                              addNumberToDictionary(v63, v81, v59 - v50);
                              addNumberToDictionary(v63, (const void *)*MEMORY[0x24BDC5650], v60 - v49);
                              addNumberToDictionary(v63, (const void *)*MEMORY[0x24BDC56C8], 4096);
                              if (v50)
                              {
                                v82 = (const void *)*MEMORY[0x24BDC5628];
                                v83 = v63;
                                v84 = v50;
LABEL_134:
                                addNumberToDictionary(v83, v82, v84);
                              }
                            }
                            else
                            {
                              addNumberToDictionary(v63, v81, v59);
                              addNumberToDictionary(v63, (const void *)*MEMORY[0x24BDC5650], v60);
                              addNumberToDictionary(v63, (const void *)*MEMORY[0x24BDC56C8], 4096);
                              v49 = -v60 & 0xF;
                              v84 = -v59 & 0xF;
                              if (v84)
                              {
                                v82 = (const void *)*MEMORY[0x24BDC5628];
                                v83 = v63;
                                goto LABEL_134;
                              }
                            }
                            if (v49)
                              addNumberToDictionary(v63, (const void *)*MEMORY[0x24BDC5610], v49);
                            VTDecoderSessionSetPixelBufferAttributes();
                            *(_BYTE *)(v6 + 3113) = 1;
                            *(_DWORD *)(v6 + 3116) = 1;
                            PixelBufferPool = (const void *)VTDecoderSessionGetPixelBufferPool();
                            *(_QWORD *)(v6 + 16) = PixelBufferPool;
                            if (PixelBufferPool)
                            {
                              CFRetain(PixelBufferPool);
                              if (!AppleD5500SetParameter(*(_QWORD *)(v6 + 3104), 3, *(int **)(v6 + 16)))
                              {
                                CFRelease(v63);
                                v7 = 0;
                                *(_DWORD *)(v6 + 3176) = 2;
                                goto LABEL_56;
                              }
                              syslog(3, "AppleD5500: AppleD5500_MPEG4VideoDecoder ERROR: AppleD5500SetPixelBufferPool : Could not set PixelBufferPool");
                            }
                            else
                            {
                              syslog(3, "AppleD5500: AppleD5500_MPEG4VideoDecoder ERROR: AppleD5500_MPEG4VideoDecoder : PixelBufferPool NULL");
                            }
                            CFRelease(v63);
                            goto LABEL_131;
                          }
                          syslog(3, "AppleD5500: Assertion \"number==((void *)0)\" failed in \"/Library/Caches/com.apple.xbs/Sources/AppleD5500/FigWrapper/AppleD5500_MPEG4VideoDecoder.c\" at line 597 goto bail\n\n");
                        }
                        else
                        {
                          syslog(3, "AppleD5500: Assertion \"number==((void *)0)\" failed in \"/Library/Caches/com.apple.xbs/Sources/AppleD5500/FigWrapper/AppleD5500_MPEG4VideoDecoder.c\" at line 589 goto bail\n\n");
                        }
                      }
                      else
                      {
                        syslog(3, "AppleD5500: Assertion \"number==((void *)0)\" failed in \"/Library/Caches/com.apple.xbs/Sources/AppleD5500/FigWrapper/AppleD5500_MPEG4VideoDecoder.c\" at line 581 goto bail\n\n");
                      }
                    }
                    else
                    {
                      syslog(3, "AppleD5500: Assertion \"number==((void *)0)\" failed in \"/Library/Caches/com.apple.xbs/Sources/AppleD5500/FigWrapper/AppleD5500_MPEG4VideoDecoder.c\" at line 573 goto bail\n\n");
                    }
                  }
                  else
                  {
                    syslog(3, "AppleD5500: Assertion \"number==((void *)0)\" failed in \"/Library/Caches/com.apple.xbs/Sources/AppleD5500/FigWrapper/AppleD5500_MPEG4VideoDecoder.c\" at line 565 goto bail\n\n");
                  }
                }
                else
                {
                  syslog(3, "AppleD5500: Assertion \"number==((void *)0)\" failed in \"/Library/Caches/com.apple.xbs/Sources/AppleD5500/FigWrapper/AppleD5500_MPEG4VideoDecoder.c\" at line 556 goto bail\n\n");
                }
                CFRelease(v63);
                if (!v65)
                {
LABEL_130:
                  syslog(3, "AppleD5500: AppleD5500_MPEG4VideoDecoder ERROR: createPixelBufferAttributesDictionary failed");
LABEL_131:
                  v7 = 4294954385;
                  goto LABEL_56;
                }
              }
              else
              {
                CFRelease(v63);
              }
            }
            else
            {
              v65 = v63;
            }
            CFRelease(v65);
            goto LABEL_130;
          }
        }
      }
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v6 + 3184));
  return FigSignalErrorAt3();
}

uint64_t AppleD5500WrapperMPEG4DecoderDecodeFrame(uint64_t a1, uint64_t a2, opaqueCMSampleBuffer *a3, char a4, int *a5)
{
  uint64_t DerivedStorage;
  int v10;
  OpaqueCMBlockBuffer *DataBuffer;
  size_t DataLength;
  size_t v13;
  uint64_t v14;
  uint64_t Parameter;
  unsigned __int8 *v16;
  int v17;
  char v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  unsigned __int8 *v22;
  uint64_t v23;
  int v24;
  char v25;
  uint64_t v26;
  int v27;
  unsigned __int8 *v28;
  int v29;
  int v30;
  void *destination;
  uint64_t v33;
  unsigned __int8 *v34;
  uint64_t v35;
  int v36;
  int v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  VTVideoDecoderGetCMBaseObject();
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  pthread_mutex_lock((pthread_mutex_t *)(DerivedStorage + 3184));
  v10 = *(_DWORD *)(DerivedStorage + 3176);
  if (v10 == 2)
  {
    DataBuffer = CMSampleBufferGetDataBuffer(a3);
    DataLength = CMBlockBufferGetDataLength(DataBuffer);
    v13 = DataLength;
    destination = 0;
    v33 = 0;
    if (*(_BYTE *)(DerivedStorage + 3114))
    {
      v14 = DataLength + 8;
      v33 = DataLength + 8;
      Parameter = AppleD5500GetParameter(*(_QWORD *)(DerivedStorage + 3104), 7, (uint64_t)&destination);
      if (!(_DWORD)Parameter)
      {
        v16 = (unsigned __int8 *)destination;
        CMBlockBufferCopyDataBytes(DataBuffer, 0, v13, destination);
        *(_QWORD *)&v16[v13] = 0xAF01000080000000;
        bzero(&v38, 0x838uLL);
        v34 = v16;
        v35 = v13 + 8;
        v17 = *(_DWORD *)(DerivedStorage + 3116);
        v36 = v17;
        v37 = 0;
        v42 = 0;
        v40 = 0;
        v41 = 0;
        if ((a4 & 1) != 0)
        {
          if (a5)
          {
            v18 = 0;
            v20 = *a5 | 1;
            *a5 = v20;
            v19 = *(unsigned __int8 *)(DerivedStorage + 3116);
            *(_QWORD *)(DerivedStorage + 8 * v19 + 32) = a2;
          }
          else
          {
            v20 = 0;
            v19 = v17;
            *(_QWORD *)(DerivedStorage + 8 * v17 + 32) = a2;
            v18 = 1;
          }
        }
        else
        {
          v18 = 1;
          v39 = 1;
          v19 = v17;
          *(_QWORD *)(DerivedStorage + 8 * v17 + 32) = a2;
          if (a5)
          {
            v18 = 0;
            v20 = *a5;
          }
          else
          {
            v20 = 0;
          }
        }
        *(_DWORD *)(DerivedStorage + 4 * v19 + 2080) = v20;
        if (AppleD5500DecodeFrame(*(_QWORD *)(DerivedStorage + 3104), (uint64_t)&v34))
        {
          VTDecoderSessionEmitDecodedFrame();
          AppleD5500ReleaseCurrentInputBuffer(*(_QWORD *)(DerivedStorage + 3104), v14, v16);
          if ((v18 & 1) == 0)
            *a5 = 2;
          syslog(3, "AppleD5500: AppleD5500_MPEG4VideoDecoder_DecodeFrame: error decoding frame %d");
          goto LABEL_38;
        }
        goto LABEL_39;
      }
    }
    else if (*(_DWORD *)(DerivedStorage + 3116) == 1)
    {
      v33 = DataLength + *(int *)(DerivedStorage + 3164) + 4;
      Parameter = AppleD5500GetParameter(*(_QWORD *)(DerivedStorage + 3104), 7, (uint64_t)&destination);
      if (!(_DWORD)Parameter)
      {
        v22 = (unsigned __int8 *)destination;
        memcpy(destination, *(const void **)(DerivedStorage + 3168), *(int *)(DerivedStorage + 3164));
        CMBlockBufferCopyDataBytes(DataBuffer, 0, v13, &v22[*(int *)(DerivedStorage + 3164)]);
        *(_DWORD *)&v22[*(int *)(DerivedStorage + 3164) + v13] = -1358888960;
        v23 = *(int *)(DerivedStorage + 3164) + v13 + 4;
        bzero(&v38, 0x838uLL);
        v34 = v22;
        v35 = v23;
        v24 = *(_DWORD *)(DerivedStorage + 3116);
        v36 = v24;
        v37 = 0;
        v42 = 0;
        v40 = 0;
        v41 = 0;
        if ((a4 & 1) != 0)
        {
          if (a5)
          {
            v25 = 0;
            v27 = *a5 | 1;
            *a5 = v27;
            v26 = *(unsigned __int8 *)(DerivedStorage + 3116);
            *(_QWORD *)(DerivedStorage + 8 * v26 + 32) = a2;
          }
          else
          {
            v27 = 0;
            v26 = v24;
            *(_QWORD *)(DerivedStorage + 8 * v24 + 32) = a2;
            v25 = 1;
          }
        }
        else
        {
          v25 = 1;
          v39 = 1;
          v26 = v24;
          *(_QWORD *)(DerivedStorage + 8 * v24 + 32) = a2;
          if (a5)
          {
            v25 = 0;
            v27 = *a5;
          }
          else
          {
            v27 = 0;
          }
        }
        *(_DWORD *)(DerivedStorage + 4 * v26 + 2080) = v27;
        if (AppleD5500DecodeFrame(*(_QWORD *)(DerivedStorage + 3104), (uint64_t)&v34))
        {
          VTDecoderSessionEmitDecodedFrame();
          AppleD5500ReleaseCurrentInputBuffer(*(_QWORD *)(DerivedStorage + 3104), v23, v22);
          if ((v25 & 1) == 0)
            *a5 = 2;
          syslog(3, "AppleD5500: AppleD5500_MPEG4VideoDecoder_DecodeFrame: error decoding frame 1 with patched VOL\n");
          goto LABEL_38;
        }
        goto LABEL_39;
      }
    }
    else
    {
      v33 = DataLength + 4;
      Parameter = AppleD5500GetParameter(*(_QWORD *)(DerivedStorage + 3104), 7, (uint64_t)&destination);
      if (!(_DWORD)Parameter)
      {
        v28 = (unsigned __int8 *)destination;
        CMBlockBufferCopyDataBytes(DataBuffer, 0, v13, destination);
        *(_DWORD *)&v28[v13] = -1358888960;
        bzero(&v38, 0x838uLL);
        v34 = v28;
        v35 = v13 + 4;
        v29 = *(_DWORD *)(DerivedStorage + 3116);
        v36 = v29;
        v37 = 0;
        v42 = 0;
        v40 = 0;
        v41 = 0;
        if ((a4 & 1) != 0)
        {
          v30 = *a5 | 1;
          *a5 = v30;
          LOBYTE(v29) = *(_BYTE *)(DerivedStorage + 3116);
        }
        else
        {
          v39 = 1;
          v30 = *a5;
        }
        *(_QWORD *)(DerivedStorage + 8 * v29 + 32) = a2;
        *(_DWORD *)(DerivedStorage + 4 * v29 + 2080) = v30;
        if (AppleD5500DecodeFrame(*(_QWORD *)(DerivedStorage + 3104), (uint64_t)&v34))
        {
          VTDecoderSessionEmitDecodedFrame();
          AppleD5500ReleaseCurrentInputBuffer(*(_QWORD *)(DerivedStorage + 3104), v13 + 4, v28);
          *a5 = 2;
          syslog(3, "AppleD5500: AppleD5500_MPEG4VideoDecoder_DecodeFrame: error decoding frame %d\n");
LABEL_38:
          v21 = 4294954385;
          goto LABEL_40;
        }
LABEL_39:
        v21 = 0;
        ++*(_DWORD *)(DerivedStorage + 3116);
        goto LABEL_40;
      }
    }
    v21 = Parameter;
    syslog(3, "AppleD5500: AppleD5500_H264VideoDecoder ERROR: kAppleD5500SetInputSurfaceID : Could not set IOSurfaceID");
  }
  else
  {
    syslog(3, "AppleD5500: %s called on plugin in state %d", "AppleD5500WrapperMPEG4DecoderDecodeFrame", v10);
    VTDecoderSessionEmitDecodedFrame();
    if (a5)
      *a5 = 2;
    v21 = 4294954387;
  }
LABEL_40:
  pthread_mutex_unlock((pthread_mutex_t *)(DerivedStorage + 3184));
  return v21;
}

uint64_t AppleD5500WrapperMPEG4DecoderCopySupportedPropertyDictionary(uint64_t a1, _QWORD *a2)
{
  CFTypeRef v3;
  uint64_t result;

  pthread_once(&sCreateSupportedPropertyDictionaryOnce, mpeg4_createSupportedPropertyDictionary);
  if (a2 && sMPEG4VideoDecoderSupportedPropertyDictionary)
  {
    v3 = CFRetain((CFTypeRef)sMPEG4VideoDecoderSupportedPropertyDictionary);
    result = 0;
    *a2 = v3;
  }
  else
  {
    syslog(3, "AppleD5500: AppleD5500_MPEG4VideoDecoder Error:: CFDictionaryCreate -MPEG4VideoDecoder_CopySupportedPropertyDictionary- failed");
    return 4294954392;
  }
  return result;
}

uint64_t DisplayCallBack()
{
  return VTDecoderSessionEmitDecodedFrame();
}

void addNumberToDictionary(__CFDictionary *a1, const void *a2, int a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  int valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  if (v5)
  {
    v6 = v5;
    CFDictionaryAddValue(a1, a2, v5);
    CFRelease(v6);
  }
}

CFDictionaryRef mpeg4_createFrameTypesArrayElement(const void *a1)
{
  void *v1;
  CFDictionaryRef v2;
  const void *v4;
  void *keys;

  v1 = (void *)*MEMORY[0x24BDF9420];
  v4 = a1;
  keys = v1;
  v2 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)&keys, &v4, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v2)
    syslog(3, "AppleD5500: AppleD5500_MPEG4VideoDecoder Error:: CFDictionaryCreate (frameType) failed");
  return v2;
}

void AppleD5500DisplayCallback(uint64_t a1, int a2, unsigned int a3, int a4)
{
  _BYTE *v8;
  uint64_t v9;
  __CVBuffer *v10;
  char v11;
  int v12;
  const __CFAllocator *v13;
  CFMutableDictionaryRef v14;
  __CFDictionary *v15;
  CFNumberRef v16;
  CFNumberRef v17;
  CFMutableArrayRef v18;
  __CFArray *v19;
  uint64_t v20;
  uint64_t v21;
  __CFDictionary *v22;
  CFNumberRef v23;
  CFNumberRef v24;
  const __CFString *v25;
  CFMutableDictionaryRef Mutable;
  CFNumberRef v27;
  unsigned __int8 *BaseAddressOfPlane;
  size_t BytesPerRowOfPlane;
  void (*v30)(_QWORD, _QWORD, __CVBuffer *, uint64_t);
  char v31;
  __CFDictionary *theDict;
  double v33;
  uint64_t v34;
  unsigned int valuePtr;
  _BYTE v36[8];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = (_BYTE *)(a1 + 5896);
  valuePtr = a2;
  v34 = 0;
  BufferPool::getBufferInfo(*(pthread_mutex_t **)(a1 + 2096), a3, &v34);
  if (!v34)
  {
    a4 = -1;
    syslog(3, "AppleD5500: AppleD5500DisplayCallback %d %d %d - errorStatus %d\n", a2, a3, -1, -1);
    v9 = 4294954387;
    goto LABEL_7;
  }
  if (!a4)
  {
    v10 = *(__CVBuffer **)(v34 + 16);
    v12 = *(_DWORD *)(a1 + 2140);
    if (v12 == 3)
    {
      if (*(_DWORD *)(a1 + 3224) && *(_DWORD *)(a1 + 5928))
      {
        if (CVPixelBufferLockBaseAddress(v10, 0))
        {
          syslog(3, "Could not lock CVPixelBuffer\n");
        }
        else
        {
          CVPixelBufferGetBaseAddressOfPlane(v10, 0);
          BaseAddressOfPlane = (unsigned __int8 *)CVPixelBufferGetBaseAddressOfPlane(v10, 1uLL);
          BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v10, 1uLL);
          CVPixelBufferGetBytesPerRowOfPlane(v10, 0);
          ExtraChromaDeblock_neon(BaseAddressOfPlane, BytesPerRowOfPlane, *(_DWORD *)(a1 + 5944), *(_DWORD *)(a1 + 5948), *(_DWORD *)(a1 + 2960));
          CVPixelBufferUnlockBaseAddress(v10, 0);
        }
      }
      goto LABEL_30;
    }
    if (v12 == 2)
    {
      if (!*(_DWORD *)(a1 + 3224))
      {
        v33 = *(double *)(a1 + 2952);
        if (v33 == 0.0)
          goto LABEL_30;
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        if (!Mutable)
          goto LABEL_30;
        v15 = Mutable;
        v27 = CFNumberCreate(0, kCFNumberDoubleType, &v33);
        CFDictionarySetValue(v15, (const void *)*MEMORY[0x24BE10BC8], v27);
        CFNumberGetValue(v27, kCFNumberDoubleType, v36);
        CFRelease(v27);
        v25 = (const __CFString *)*MEMORY[0x24BE10818];
        goto LABEL_28;
      }
      LODWORD(v33) = *(unsigned __int16 *)(a1 + 2168);
      v13 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v14 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (v14)
      {
        v15 = v14;
        v16 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
        CFDictionarySetValue(v15, CFSTR("FrameNumber"), v16);
        CFRelease(v16);
        v17 = CFNumberCreate(0, kCFNumberIntType, &v33);
        CFDictionarySetValue(v15, CFSTR("NumberOfSlices"), v17);
        CFRelease(v17);
        v18 = CFArrayCreateMutable(v13, *(unsigned __int16 *)(a1 + 2168), MEMORY[0x24BDBD690]);
        if (v18)
        {
          v19 = v18;
          theDict = v15;
          if (SLODWORD(v33) >= 1)
          {
            v20 = 0;
            v21 = 2432;
            do
            {
              v22 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
              v23 = CFNumberCreate(0, kCFNumberSInt8Type, (const void *)(a1 + v20 + 2170));
              CFDictionarySetValue(v22, CFSTR("SliceType"), v23);
              CFRelease(v23);
              v24 = CFNumberCreate(0, kCFNumberSInt16Type, (const void *)(a1 + v21));
              CFDictionarySetValue(v22, CFSTR("FirstMBInSlice"), v24);
              CFRelease(v24);
              CFArrayAppendValue(v19, v22);
              CFRelease(v22);
              ++v20;
              v21 += 2;
            }
            while (v20 < SLODWORD(v33));
          }
          v15 = theDict;
          CFDictionarySetValue(theDict, CFSTR("SliceDataArray"), v19);
          CFRelease(v19);
        }
        v25 = CFSTR("FramedataDictionary");
LABEL_28:
        CVBufferSetAttachment(v10, v25, v15, kCVAttachmentMode_ShouldPropagate);
        CFRelease(v15);
      }
    }
LABEL_30:
    v9 = 0;
    v11 = 0;
    goto LABEL_31;
  }
  if (a4 == 409)
    v9 = 4294949602;
  else
    v9 = 4294954387;
LABEL_7:
  syslog(3, "AppleD5500: AppleD5500DisplayCallback - Asking fig to drop frame # %d with err %d\n", a2, v9);
  if (*(_DWORD *)(a1 + 3372))
  {
    v10 = 0;
  }
  else
  {
    syslog(3, "AppleD5500: %s sending error %d to test app main", "AppleD5500DisplayCallback", a4);
    v10 = 0;
    *(_DWORD *)(a1 + 3372) = a4;
  }
  v11 = 1;
LABEL_31:
  v30 = *(void (**)(_QWORD, _QWORD, __CVBuffer *, uint64_t))(a1 + 24);
  if (v30)
    v30(*(_QWORD *)(a1 + 32), valuePtr, v10, v9);
  if (!v8[36])
  {
    BufferPool::releaseBuffer(*(pthread_mutex_t **)(a1 + 2096), a3);
    v31 = v11 ^ 1;
    if (!*v8)
      v31 = 1;
    if ((v31 & 1) == 0 && v34)
    {
      syslog(3, "%s releasing again! %d\n", "AppleD5500DisplayCallback", a3);
      BufferPool::releaseBuffer(*(pthread_mutex_t **)(a1 + 2096), a3);
    }
  }
  if (!*(_DWORD *)(a1 + 2136))
    (*(void (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 8) + 40))(*(_QWORD *)(a1 + 8), valuePtr);
}

uint64_t AppleD5500SetCrpytSession(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  size_t outputStructCnt;
  int outputStruct;
  uint64_t inputStruct;
  __int128 v7;

  outputStructCnt = 4;
  v7 = 0uLL;
  outputStruct = 0;
  inputStruct = *(_QWORD *)(a1 + 2128);
  *(_QWORD *)((char *)&v7 + 4) = *(_QWORD *)(a1 + 16);
  LOBYTE(v7) = *(_DWORD *)(a1 + 2120);
  v1 = IOConnectCallStructMethod(*(_DWORD *)a1, 5u, &inputStruct, 0x18uLL, &outputStruct, &outputStructCnt);
  v2 = v1;
  if ((_DWORD)v1)
    syslog(3, "AppleD5500:  AppleD5500SetCrpytSession failed: %d \n", v1);
  return v2;
}

uint64_t AppleD5500DecodeFrameResponse(char *a1, int a2, int a3, int a4, int a5)
{
  int v7;
  char *v9;
  uint64_t v10;
  _BYTE *j;
  char *v12;
  int v13;
  int v14;
  uint64_t v15;
  unsigned __int16 *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  BOOL v22;
  uint64_t result;
  uint64_t v24;
  int *i;
  int v26;
  char *v27;
  int *v28;
  pthread_cond_t *v29;
  char *v30;
  uint64_t v31[8];
  _DWORD __dst[260];
  uint64_t v33;

  v7 = a3;
  v33 = *MEMORY[0x24BDAC8D0];
  v9 = a1 + 5704;
  if (a3 - *((_DWORD *)a1 + 1425) <= 1)
  {
    v30 = a1 + 2168;
    v29 = (pthread_cond_t *)(a1 + 3544);
    v12 = a1 + 5760;
    v28 = (int *)(a1 + 5712);
LABEL_7:
    memcpy(__dst, (const void *)(*((_QWORD *)a1 + 390) + *((int *)a1 + 856) + 1040 * a5), sizeof(__dst));
    v13 = __dst[34];
    if (__dst[34])
    {
      syslog(3, "AppleD5500: AppleD5500DecodeFrameResponse() failed - error: %d \n", __dst[34]);
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "vxdDec - Frame# %d, DecodeFrame failed with error: %d \n", v7, v13);
    }
    v14 = __dst[35];
    *((_DWORD *)a1 + 842) = __dst[35];
    if (v14)
    {
      syslog(3, "AppleD5500: AppleD5500DecodeFrameResponse() failed - decryptError: %d \n", v14);
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "vxdDec - Frame# %d, DecodeFrame failed with decryptError: %d \n", v7, v14);
    }
    v15 = HIWORD(__dst[1]);
    if (HIWORD(__dst[1]))
    {
      v16 = (unsigned __int16 *)&__dst[2];
      do
      {
        v17 = *v16++;
        AppleD5500ReleaseCVPixelBuffer((uint64_t)a1, v17);
        --v15;
      }
      while (v15);
    }
    memcpy(v30, &__dst[42], 0x360uLL);
    RingBuffer::getRingBufferInfo(*((_QWORD *)a1 + 392), (uint64_t)v31);
    v18 = __dst[40];
    v19 = v31[0];
    v20 = __dst[39];
    if (v9[228])
      BufferPool::releaseBuffer(*((pthread_mutex_t **)a1 + 262), __dst[37]);
    else
      AppleD5500DisplayCallback((uint64_t)a1, v7, __dst[37], a4);
    RingBuffer::releaseRingBuffer(*((RingBuffer **)a1 + 392), v18 + 16, (unsigned __int8 *)(v19 + v20));
    if (a1[3592])
    {
      pthread_mutex_lock((pthread_mutex_t *)(a1 + 3040));
      *((_DWORD *)a1 + 858) = v7;
      pthread_cond_signal(v29);
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 3040));
    }
    else
    {
      *((_DWORD *)a1 + 858) = v7;
    }
    if (v9[1])
      *(_WORD *)v9 = 0;
    *((_DWORD *)a1 + 1425) = v7;
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 5768));
    v21 = 0;
    v22 = 1;
    do
    {
      if (v12[v21] && *(_DWORD *)&v12[4 * v21 - 48] - *((_DWORD *)a1 + 1425) == 1)
      {
        result = pthread_mutex_unlock((pthread_mutex_t *)(a1 + 5768));
        if (!v22)
          return result;
        pthread_mutex_lock((pthread_mutex_t *)(a1 + 5768));
        v24 = 0;
        for (i = v28; ; ++i)
        {
          if (v12[v24])
          {
            v26 = *((_DWORD *)a1 + 1425);
            if (*i - v26 == 1)
              break;
          }
          if (++v24 == 4)
            return pthread_mutex_unlock((pthread_mutex_t *)(a1 + 5768));
        }
        if ((_DWORD)v21 != (_DWORD)v24)
          printf("RetrieveNextCallback: ERROR expected position %d - located index %d - frameNum %d, errorCode %d, index %d, ctx->lastFrameEmitted %d, ctx->lastInputBufReleased %d\n", v21, v24, -1, -1, -1, *((_DWORD *)a1 + 858), v26);
        v7 = *i;
        a4 = i[4];
        a5 = i[8];
        v12[v24] = 0;
        *i = 0;
        i[4] = 0;
        i[8] = 0;
        --*((_DWORD *)a1 + 1427);
        pthread_mutex_unlock((pthread_mutex_t *)(a1 + 5768));
        v9[1] = 1;
        goto LABEL_7;
      }
      v22 = v21++ < 3;
    }
    while (v21 != 4);
    return pthread_mutex_unlock((pthread_mutex_t *)(a1 + 5768));
  }
  else
  {
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 5768));
    v10 = -16;
    for (j = v9 + 56; *j; ++j)
    {
      v10 += 4;
      if (!v10)
      {
        syslog(3, "AppleD5500: %s - callBack Cache is full\n", "StoreOutOfOrderCallbackInNextAvailableIndex");
        return pthread_mutex_unlock((pthread_mutex_t *)(a1 + 5768));
      }
    }
    *v9 = 1;
    *j = 1;
    v27 = &v9[v10 + 56];
    *((_DWORD *)v27 - 8) = v7;
    *((_DWORD *)v27 - 4) = a4;
    *(_DWORD *)v27 = a5;
    ++*((_DWORD *)a1 + 1427);
    return pthread_mutex_unlock((pthread_mutex_t *)(a1 + 5768));
  }
}

uint64_t AppleD5500SetI0RegistryProperty()
{
  return 0;
}

uint64_t AppleD5500OpenConnection(_QWORD *a1)
{
  _BYTE *v2;
  unsigned __int8 *v3;
  uint64_t v4;
  mach_port_t v5;
  const __CFDictionary *v6;
  uint64_t MatchingServices;
  io_service_t v8;
  uint64_t v9;
  io_object_t v11;
  kern_return_t v12;
  unsigned __int8 *v13;
  int CFPreferenceNumber;
  unsigned __int8 v15;
  uint64_t D5500FrameReceiver;
  _BYTE *v17;
  int v18;
  _BYTE *v19;
  uint64_t v20;
  int v21;
  _BYTE *v22;
  FILE **v23;
  const __CFData *v24;
  const __CFData *v25;
  const UInt8 *BytePtr;
  int v27;
  uint64_t v28;
  int v29;
  _BYTE *v30;
  int v31;
  _BYTE *v32;
  int v33;
  _BYTE *v34;
  int v35;
  _BYTE *v36;
  int v37;
  int v38;
  _QWORD *v39;
  uint64_t (*v40)(char *, int, int, int, int);
  char v41;
  unsigned __int8 v42;
  uint64_t v43;
  _BYTE *v44;
  mach_port_t mainPort[2];

  *(_QWORD *)mainPort = 0;
  *a1 = 0;
  v2 = malloc_type_calloc(1uLL, 0x1748uLL, 0x10B00401A4F4C65uLL);
  v44 = v2;
  if (!v2)
  {
    syslog(3, "AppleD5500: AppleD5500OpenConnection - context alloc  failed \n");
    return 4294967294;
  }
  v3 = v2;
  bzero(v2, 0x1748uLL);
  v4 = IOMasterPort(0, &mainPort[1]);
  if ((_DWORD)v4)
  {
    v9 = v4;
    syslog(3, "AppleD5500: AppleD5500OpenConnection - IOMasterPort failed \n");
LABEL_9:
    free(v3);
    return v9;
  }
  v5 = mainPort[1];
  v6 = IOServiceMatching("AppleD5500");
  MatchingServices = IOServiceGetMatchingServices(v5, v6, mainPort);
  if ((_DWORD)MatchingServices)
  {
    v9 = MatchingServices;
    syslog(3, "AppleD5500: AppleD5500OpenConnection - IOServiceGetMatchingServices failed \n");
    goto LABEL_9;
  }
  v8 = IOIteratorNext(mainPort[0]);
  if (!v8)
  {
    syslog(3, "AppleD5500: AppleD5500OpenConnection - IOIteratorNext failed \n");
    v9 = 3758097088;
    goto LABEL_19;
  }
  v11 = v8;
  v12 = IOServiceOpen(v8, *MEMORY[0x24BDAEC58], 1u, (io_connect_t *)v3);
  if (v12)
  {
    v9 = 3758097086;
    syslog(3, "AppleD5500: AppleD5500OpenConnection - IOServiceOpen failed %x", v12);
LABEL_18:
    IOObjectRelease(v11);
LABEL_19:
    IOObjectRelease(mainPort[0]);
    v3 = v44;
    if (!v44)
      return v9;
    goto LABEL_9;
  }
  v13 = v3 + 5668;
  v3[5668] = 0;
  CFPreferenceNumber = Decoder_getCFPreferenceNumber(CFSTR("VXD_EnableRealTimeThread"), CFSTR("com.apple.coremedia"), 0);
  v3[5668] = CFPreferenceNumber != 0;
  if (CFPreferenceNumber)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AppleD5500: defaults read com.apple.coremedia VXD_EnableRealTimeThread set %d\n", 1);
    syslog(3, "AppleD5500: defaults read com.apple.coremedia VXD_EnableRealTimeThread set %d\n", *v13);
    v15 = *v13;
  }
  else
  {
    v15 = 0;
  }
  v38 = *(_DWORD *)v3;
  v41 = 0;
  v39 = &v44;
  v40 = AppleD5500DecodeFrameResponse;
  v42 = v15;
  v43 = voucher_copy();
  D5500FrameReceiver = CreateD5500FrameReceiver((_QWORD *)v44 + 432, (uint64_t)&v38, (pthread_attr_t *)(v44 + 3464), (pthread_t *)v44 + 441);
  if ((_DWORD)D5500FrameReceiver)
  {
    v9 = D5500FrameReceiver;
    syslog(3, "AppleD5500: AppleD5500OpenConnection - CreateD5500FrameReceiver failed %x", D5500FrameReceiver);
    IOServiceClose(*(_DWORD *)v44);
    goto LABEL_18;
  }
  pthread_mutex_init((pthread_mutex_t *)(v44 + 3040), 0);
  pthread_cond_init((pthread_cond_t *)(v44 + 3544), 0);
  pthread_mutex_init((pthread_mutex_t *)(v44 + 5768), 0);
  v17 = v44;
  *((_QWORD *)v44 + 393) = 0;
  *((_DWORD *)v17 + 788) = 0;
  v18 = Decoder_getCFPreferenceNumber(CFSTR("H3_MSVDX_UseAsyncDecode"), CFSTR("com.apple.AppleD5500Framework"), 0);
  v19 = v44;
  *((_DWORD *)v44 + 787) = v18;
  if (v18)
  {
    *((_DWORD *)v19 + 786) = 32;
    v20 = 1;
    *((_DWORD *)v19 + 788) = 1;
  }
  else
  {
    v20 = *((unsigned int *)v19 + 788);
  }
  v21 = Decoder_getCFPreferenceNumber(CFSTR("H3_MSVDX_PowerMode"), CFSTR("com.apple.AppleD5500Framework"), v20);
  v22 = v44;
  *((_DWORD *)v44 + 788) = v21;
  if (*((_DWORD *)v22 + 787))
  {
    v23 = (FILE **)MEMORY[0x24BDAC8D8];
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AppleD5500: defaults read com.apple.AppleD5500Framework H3_MSVDX_UseAsyncDecode set %d\n", *((_DWORD *)v22 + 787));
    fprintf(*v23, "AppleD5500: defaults read com.apple.AppleD5500Framework H3_MSVDX_PowerMode set %d\n", *((_DWORD *)v44 + 788));
    v22 = v44;
  }
  *((_DWORD *)v22 + 789) = 0;
  v24 = (const __CFData *)IORegistryEntrySearchCFProperty(v11, "IOService", CFSTR("allow-oold"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 3u);
  if (v24)
  {
    v25 = v24;
    BytePtr = CFDataGetBytePtr(v24);
    if (BytePtr)
    {
      v27 = *BytePtr;
      CFRelease(v25);
      if (v27)
      {
        v28 = *((unsigned int *)v44 + 789);
        goto LABEL_32;
      }
    }
    else
    {
      CFRelease(v25);
    }
  }
  v28 = 2;
  *((_DWORD *)v44 + 789) = 2;
LABEL_32:
  v29 = Decoder_getCFPreferenceNumber(CFSTR("VXD_OOLD_Enable"), CFSTR("com.apple.AppleD5500Framework"), v28);
  v30 = v44;
  *((_DWORD *)v44 + 789) = v29;
  v31 = Decoder_getCFPreferenceNumber(CFSTR("VXD_Dithering_Enable"), CFSTR("com.apple.AppleD5500Framework"), *((unsigned int *)v30 + 805));
  v32 = v44;
  *((_DWORD *)v44 + 805) = v31;
  v33 = Decoder_getCFPreferenceNumber(CFSTR("VXD_DisableSkipToIdr"), CFSTR("com.apple.AppleD5500Framework"), *((unsigned int *)v32 + 806));
  v34 = v44;
  *((_DWORD *)v44 + 806) = v33;
  *((_DWORD *)v34 + 844) = 0;
  v34[5956] = 0;
  v35 = MGGetBoolAnswer();
  v36 = v44;
  if (v35)
  {
    v44[5956] = 1;
    v37 = Decoder_getCFPreferenceNumber(CFSTR("VXD_DebugMetaDataSEI"), CFSTR("com.apple.coremedia"), *((unsigned int *)v36 + 844));
    v36 = v44;
    *((_DWORD *)v44 + 844) = v37;
    if (v37)
    {
      syslog(3, "vxdDec - Setting CFDebugMetaDataSEI to %d\n", v37);
      v36 = v44;
    }
  }
  *a1 = v36;
  IOObjectRelease(v11);
  IOObjectRelease(mainPort[0]);
  return 0;
}

uint64_t Decoder_getCFPreferenceNumber(const __CFString *a1, const __CFString *a2, uint64_t a3)
{
  const __CFString *v4;
  const __CFString *v5;
  CFTypeID v6;
  uint64_t IntValue;
  CFTypeID v8;
  CFTypeID v9;
  unsigned int valuePtr;

  v4 = (const __CFString *)CFPreferencesCopyValue(a1, a2, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  if (v4)
  {
    v5 = v4;
    v6 = CFGetTypeID(v4);
    if (v6 == CFStringGetTypeID())
    {
      IntValue = CFStringGetIntValue(v5);
      if ((IntValue & 0x80000000) != 0)
      {
        IntValue = 1;
        if (CFStringCompare(v5, CFSTR("true"), 1uLL))
        {
          IntValue = 1;
          if (CFStringCompare(v5, CFSTR("yes"), 1uLL))
          {
            if (CFStringCompare(v5, CFSTR("false"), 1uLL) == kCFCompareEqualTo
              || (IntValue = a3, CFStringCompare(v5, CFSTR("no"), 1uLL) == kCFCompareEqualTo))
            {
              IntValue = 0;
            }
          }
        }
      }
      goto LABEL_17;
    }
    v8 = CFGetTypeID(v5);
    if (v8 == CFNumberGetTypeID())
    {
      valuePtr = 0;
      if (CFNumberGetValue((CFNumberRef)v5, kCFNumberIntType, &valuePtr))
      {
        IntValue = valuePtr;
LABEL_17:
        CFRelease(v5);
        return IntValue;
      }
      printf("H3H264VideoDecoder FIG: cannot convert number %p %p");
    }
    else
    {
      v9 = CFGetTypeID(v5);
      if (v9 == CFBooleanGetTypeID())
      {
        IntValue = CFEqual(v5, (CFTypeRef)*MEMORY[0x24BDBD270]);
        goto LABEL_17;
      }
      printf("H3H264VideoDecoder FIG: Cannot use type of %p %p");
    }
    IntValue = a3;
    goto LABEL_17;
  }
  return a3;
}

uint64_t AppleD5500CloseConnection(uint64_t a1)
{
  uint64_t v2;
  BufferPool *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 3456);
  if (v2)
  {
    DestroyD5500FrameReceiver(v2, (pthread_attr_t *)(a1 + 3464));
    *(_QWORD *)(a1 + 3456) = 0;
  }
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 3040));
  pthread_cond_destroy((pthread_cond_t *)(a1 + 3544));
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 5768));
  v3 = *(BufferPool **)(a1 + 2096);
  if (v3)
  {
    BufferPool::~BufferPool(v3);
    MEMORY[0x219A2D46C]();
  }
  v4 = IOServiceClose(*(_DWORD *)a1);
  v5 = v4;
  if ((_DWORD)v4)
    syslog(3, "AppleD5500:  IOServiceClose failed: %d \n", v4);
  free((void *)a1);
  return v5;
}

uint64_t AppleD5500InitializeDecoder(uint64_t a1, int *a2)
{
  int v3;
  int v4;
  int v5;
  const void *v6;
  int v7;
  int v8;
  __int128 v9;
  int v10;
  BOOL v11;
  int v12;
  int v13;
  size_t v14;
  int v15;
  const __CFDictionary *v16;
  const __CFDictionary *v17;
  __IOSurface *v18;
  __IOSurface *v19;
  char v20;
  void *BaseAddress;
  size_t AllocSize;
  uint64_t v23;
  unsigned __int8 *v24;
  RingBuffer *v25;
  __sFILE *v26;
  uint64_t DecodeDeviceInternal;
  uint64_t v29;
  int valuePtr;
  int v31;
  void *values;
  CFTypeRef cf;
  CFTypeRef v34;
  uint64_t v35;
  void *keys;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = *a2;
  v3 = a2[1];
  v5 = a2[2];
  v6 = (const void *)*((_QWORD *)a2 + 2);
  v7 = a2[6];
  *(_DWORD *)(a1 + 16) = v3;
  *(_DWORD *)(a1 + 20) = (v5 + 15) & 0xFFFFFFF0;
  *(_DWORD *)(a1 + 2144) = 0;
  *(_DWORD *)(a1 + 3344) = 0;
  *(_BYTE *)(a1 + 3404) = 0;
  *(_DWORD *)(a1 + 3540) = 0;
  *(_BYTE *)(a1 + 3592) = 0;
  v8 = a2[7];
  *(_OWORD *)(a1 + 5688) = 0u;
  *(_DWORD *)(a1 + 3596) = v8;
  *(_WORD *)(a1 + 5704) = 0;
  *(_OWORD *)(a1 + 5744) = 0u;
  *(_OWORD *)(a1 + 5728) = 0u;
  *(_OWORD *)(a1 + 5712) = 0u;
  *(_DWORD *)(a1 + 5760) = 0;
  *(_DWORD *)(a1 + 5708) = 0;
  *(_QWORD *)&v9 = -1;
  *((_QWORD *)&v9 + 1) = -1;
  *(_OWORD *)(a1 + 5864) = v9;
  *(_OWORD *)(a1 + 5880) = v9;
  *(_OWORD *)(a1 + 5832) = v9;
  *(_OWORD *)(a1 + 5848) = v9;
  *(_DWORD *)(a1 + 2140) = v4;
  v10 = v5 * v3;
  if ((v4 & 0xFFFFFFFE) == 2)
  {
    *(_DWORD *)(a1 + 3540) = 3;
    v11 = v10 < 2073600;
    v12 = 4 * v10;
    v13 = (2 * v10) & 0x7FFFFFFC;
    if (v11)
      v13 = v12;
  }
  else
  {
    *(_DWORD *)(a1 + 3540) = 1;
    v13 = 3 * v10;
  }
  if (v13 <= 0x100000)
    v14 = 0x100000;
  else
    v14 = v13;
  *(_DWORD *)(a1 + 3420) = v14;
  *(_DWORD *)(a1 + 3428) = 0x10000;
  *(_DWORD *)(a1 + 3424) = v14;
  v38 = 0;
  v39 = 0;
  cf = 0;
  v34 = 0;
  v35 = 0;
  valuePtr = (v14 + 69631) & 0xFFFFF000;
  v31 = 0;
  keys = (void *)*MEMORY[0x24BDD8E18];
  v37 = 0;
  values = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  if (values
    && ((v37 = *MEMORY[0x24BDD8EF8], v4 == 3)
      ? (v15 = 1752589105)
      : v4 == 2
      ? (v15 = 1635148593)
      : v4 != 1
      ? (v15 = 1748121140)
      : (v15 = 1836070006),
        (v31 = v15, (cf = CFNumberCreate(0, kCFNumberIntType, &v31)) != 0)
     && (v38 = *MEMORY[0x24BDD8E40], v31 = 1024, (v34 = CFNumberCreate(0, kCFNumberIntType, &v31)) != 0)))
  {
    v16 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)&keys, (const void **)&values, 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v17 = v16;
    if (v16)
    {
      v18 = IOSurfaceCreate(v16);
      v19 = v18;
      if (v18)
      {
        if (IOSurfaceLock(v18, 0, 0))
        {
          v20 = 0;
          syslog(3, "AppleD5500: AppleD5500_H264Decoder - ERROR IOSurfaceLock failed\n");
        }
        else
        {
          v20 = 1;
        }
      }
      else
      {
        v20 = 1;
        syslog(3, "AppleD5500: AppleD5500_H264Decoder - ERROR IOSurfaceCreate failed\n");
      }
    }
    else
    {
      v19 = 0;
      v20 = 1;
      syslog(3, "AppleD5500: AppleD5500_H264Decoder - ERROR CFDictionaryCreate failed\n");
    }
  }
  else
  {
    v19 = 0;
    v17 = 0;
    v20 = 1;
    syslog(3, "AppleD5500: AppleD5500_H264Decoder - ERROR CFNumberCreate failed\n");
  }
  if (values)
    CFRelease(values);
  if (cf)
    CFRelease(cf);
  if (v34)
    CFRelease(v34);
  if (v17)
    CFRelease(v17);
  if ((v20 & 1) == 0)
  {
    CFRelease(v19);
    *(_QWORD *)(a1 + 3112) = 0;
    goto LABEL_38;
  }
  *(_QWORD *)(a1 + 3112) = v19;
  if (!v19)
  {
LABEL_38:
    syslog(3, "AppleD5500: AppleD5500 ERROR: CreateCompressedBitBuffer Failed ");
    return 3758097085;
  }
  IOSurfaceSetValue(v19, (CFStringRef)*MEMORY[0x24BDD8EE0], CFSTR("Apple D5500 video decoder bitstream"));
  *(_DWORD *)(a1 + 3104) = IOSurfaceGetID(*(IOSurfaceRef *)(a1 + 3112));
  BaseAddress = IOSurfaceGetBaseAddress(*(IOSurfaceRef *)(a1 + 3112));
  *(_QWORD *)(a1 + 3120) = BaseAddress;
  if (!BaseAddress)
  {
    syslog(3, "AppleD5500: AppleD5500InitializeDecoder ctx->pCompressedBufferBaseAddr == NULL");
    return 4294954387;
  }
  AllocSize = IOSurfaceGetAllocSize(*(IOSurfaceRef *)(a1 + 3112));
  *(_QWORD *)(a1 + 3128) = AllocSize;
  if (AllocSize < v14)
  {
    syslog(3, "AppleD5500: AppleD5500InitializeDecoder ctx->compressedBufferSize < inputBufSize");
    return 4294954387;
  }
  if (AllocSize <= (*(_QWORD *)&v7 & 0xFFFFFFuLL))
  {
    syslog(3, "AppleD5500: AppleD5500InitializeDecoder spsLength %d\n", v7 & 0xFFFFFF);
    return 4294954387;
  }
  v24 = *(unsigned __int8 **)(a1 + 3120);
  if (v6)
    memcpy(*(void **)(a1 + 3120), v6, *(_QWORD *)&v7 & 0xFFFFFFLL);
  *(_DWORD *)(a1 + 3596) = v7 >> 24;
  v25 = (RingBuffer *)operator new();
  RingBuffer::RingBuffer(v25);
  RingBuffer::initRingBuffer((pthread_mutex_t *)v25, *(char **)(a1 + 3120), v14, *(_BYTE *)(a1 + 3540));
  *(_QWORD *)(a1 + 3136) = v25;
  *(_DWORD *)(a1 + 2136) = 1;
  if (*(_BYTE *)(a1 + 5956) && *(_DWORD *)(a1 + 3376))
  {
    *(_QWORD *)(a1 + 3384) = malloc_type_malloc(v14, 0xD59A0977uLL);
    *(_QWORD *)(a1 + 3392) = malloc_type_malloc(v14, 0xB546B851uLL);
  }
  *(_DWORD *)(a1 + 3400) = 0;
  v26 = *(__sFILE **)(a1 + 5920);
  if (v26)
    WriteNAL(v26, v24, v7 & 0xFFFFFF);
  if (!*(_DWORD *)(a1 + 2136))
    goto LABEL_60;
  if (*(_DWORD *)(a1 + 3228) && !*(_DWORD *)(a1 + 3408))
    PreCalculateScalerCoefficients(a1);
  DecodeDeviceInternal = AppleD5500CreateDecodeDeviceInternal(a1, v4, *(_DWORD *)(a1 + 16), *(_DWORD *)(a1 + 20), (uint64_t)v24, v7);
  v23 = DecodeDeviceInternal;
  if ((_DWORD)DecodeDeviceInternal)
  {
    syslog(3, "AppleD5500:  AppleD5500InitDecoder create device failed error: %d \n", DecodeDeviceInternal);
  }
  else
  {
LABEL_60:
    v29 = AppleD5500MapPixelBuffer((mach_port_t *)a1, 128, *(_DWORD *)(a1 + 3104));
    v23 = v29;
    if ((_DWORD)v29)
      syslog(3, "AppleD5500:  AppleD5500InitDecoder bitstream buffer map failed error: %d \n", v29);
  }
  return v23;
}

void sub_219518AD8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x219A2D46C](v1, 0x1010C40C8B79317);
  _Unwind_Resume(a1);
}

void WriteNAL(__sFILE *__stream, unsigned __int8 *a2, unsigned int a3)
{
  unsigned int v6;
  char v7;
  unsigned int *v8;
  _BYTE *v9;
  unsigned int v10;
  size_t v11;
  int *p_ptr;
  size_t v14;
  int __ptr;

  __ptr = 0x1000000;
  if (a3 >= 4)
  {
    v6 = 0;
    v7 = 1;
    while (1)
    {
      v8 = (unsigned int *)&a2[v6];
      v10 = *v8;
      v9 = v8 + 1;
      v11 = bswap32(v10);
      v6 += v11 + 4;
      if (v6 > a3 || v11 > a3)
        break;
      switch(*v9 & 0x1F)
      {
        case 1:
        case 5:
          if ((v7 & 1) != 0)
          {
            p_ptr = &__ptr;
            v14 = 4;
          }
          else
          {
            p_ptr = (int *)((char *)&__ptr + 1);
            v14 = 3;
          }
          fwrite(p_ptr, 1uLL, v14, __stream);
          fwrite(v9, 1uLL, v11, __stream);
          v7 = 0;
          break;
        case 6:
        case 9:
        case 0xC:
          break;
        case 7:
        case 8:
          fwrite(&__ptr, 1uLL, 4uLL, __stream);
          fwrite(v9, 1uLL, v11, __stream);
          break;
        default:
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Bad NAL type %d\n", *v9 & 0x1F);
          break;
      }
      if (v6 + 4 > a3)
        return;
    }
    syslog(3, "AppleD5500: WriteNAL VXD_H264_ERROR_BAD_NAL_LENGTH ");
  }
}

void PreCalculateScalerCoefficients(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  float v6;
  int *v7;
  float v8;
  float v9;
  uint64_t i;
  int *v11;
  uint64_t j;
  float v13;
  int *v14;
  uint64_t k;
  int *v16;
  uint64_t m;
  unsigned __int8 v19[16];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a1 + 3232);
  v3 = *(_DWORD *)(a1 + 3236);
  v4 = *(_DWORD *)(a1 + 16);
  v5 = *(_DWORD *)(a1 + 20);
  syslog(3, "AppleD5500: ui32DestWidth %d, ui32DestHeight %d; ui32DecodeWidth %d, ui32DecodeHeight %d \n",
    v2,
    v3,
    v4,
    v5);
  v6 = (float)v4 / (float)v2;
  v7 = (int *)(a1 + 3240);
  *(float *)(a1 + 3304) = v6;
  v8 = (float)v5 / (float)v3;
  *(float *)(a1 + 3312) = v8;
  *(_QWORD *)(a1 + 3332) = *(_QWORD *)(a1 + 3232);
  syslog(3, "AppleD5500: psContext->scalingParams.fHorzPitch %f, psContext->scalingParams.fVertPitch %f \n", v6, v8);
  *(float *)(a1 + 3320) = v6;
  *(float *)(a1 + 3328) = v8;
  syslog(3, "AppleD5500: psContext->scalingParams.fChromaHorzPitch %f, psContext->scalingParams.fChromaVertPitch %f \n", v6, v8);
  v9 = *(float *)(a1 + 3304);
  MSVDXUTILS_CalculateScalerCoefficients(v9, (unsigned __int8 (*)[16])v19);
  for (i = 49; i != 57; i += 2)
    *v7++ = (v19[i - 48] << 24) | (v19[i - 32] << 16) | (v19[i - 16] << 8) | v19[i];
  MSVDXUTILS_CalculateScalerCoefficients(*(float *)(a1 + 3320), (unsigned __int8 (*)[16])v19);
  v11 = (int *)(a1 + 3272);
  for (j = 49; j != 57; j += 2)
    *v11++ = (v19[j - 48] << 24) | (v19[j - 32] << 16) | (v19[j - 16] << 8) | v19[j];
  v13 = *(float *)(a1 + 3312);
  MSVDXUTILS_CalculateScalerCoefficients(v13, (unsigned __int8 (*)[16])v19);
  v14 = (int *)(a1 + 3256);
  for (k = 49; k != 57; k += 2)
    *v14++ = (v19[k - 48] << 24) | (v19[k - 32] << 16) | (v19[k - 16] << 8) | v19[k];
  MSVDXUTILS_CalculateScalerCoefficients(*(float *)(a1 + 3328), (unsigned __int8 (*)[16])v19);
  v16 = (int *)(a1 + 3288);
  for (m = 49; m != 57; m += 2)
    *v16++ = (v19[m - 48] << 24) | (v19[m - 32] << 16) | (v19[m - 16] << 8) | v19[m];
  if (v9 < 1.0 || v13 < 1.0)
    syslog(3, "AppleD5500:   %s : %d assert broken \n", "/Library/Caches/com.apple.xbs/Sources/AppleD5500/AppleD5500VideoDecode.cpp", 3064);
}

uint64_t AppleD5500DecodeFrame(uint64_t a1, uint64_t a2)
{
  _BYTE *v4;
  unint64_t v5;
  unsigned __int8 *v6;
  int v7;
  __CVBuffer *v8;
  signed int PixelFormatType;
  unsigned __int16 v10;
  __sFILE *v11;
  uint64_t PixelBufferFromBufferPool;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  unsigned int v19;
  unint64_t v20;
  int v21;
  __CVBuffer *v22;
  int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int *v26;
  _BYTE *v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  HEVC_RBSP *v37;
  unsigned int v38;
  unsigned __int8 *v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  unsigned __int8 *v46;
  int v47;
  unsigned int v48;
  CFIndex v49;
  uint64_t v50;
  const __CFAllocator *v51;
  const __CFData *v52;
  CFPropertyListRef v53;
  const void *v54;
  __CVBuffer *v56;
  int v57;
  unsigned int *v58;
  unsigned int v59;
  unsigned __int8 *cf;
  const __CFData *cfa;
  unsigned __int8 *v62;
  uint64_t v63;
  int v64;
  unsigned int v65;
  _DWORD v66[5];

  v4 = (_BYTE *)(a1 + 5896);
  v6 = *(unsigned __int8 **)a2;
  v5 = *(_QWORD *)(a2 + 8);
  if (HIDWORD(v5))
  {
    syslog(3, "AppleD5500: %s %d 64->32 conversion problem!", "AppleD5500DecodeFrame", 2088);
    LODWORD(v5) = *(_DWORD *)(a2 + 8);
  }
  v7 = *(_DWORD *)(a2 + 16);
  v64 = -1;
  v65 = -1;
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 3040));
  *(_QWORD *)(a1 + 3344) = *(_QWORD *)(a2 + 20);
  *(_BYTE *)(a1 + 3592) = *(_BYTE *)(a2 + 32);
  *(_DWORD *)(a1 + 2112) = v7;
  *(_DWORD *)(a1 + 3440) = v5;
  *v4 = *(_BYTE *)(a2 + 2120);
  v8 = *(__CVBuffer **)(a2 + 2128);
  *(_QWORD *)(a1 + 5912) = v8;
  if (v8)
  {
    PixelFormatType = CVPixelBufferGetPixelFormatType(v8);
    if (PixelFormatType <= 1278226487)
    {
      if (PixelFormatType > 875704949)
      {
        if (PixelFormatType == 875704950 || PixelFormatType == 875836518)
          goto LABEL_24;
        v14 = 875836534;
      }
      else
      {
        if (PixelFormatType == 875704422 || PixelFormatType == 875704438)
          goto LABEL_24;
        v14 = 875704934;
      }
      if (PixelFormatType != v14)
        goto LABEL_68;
    }
    else
    {
      if (PixelFormatType > 1882469427)
      {
        if (PixelFormatType > 1885745713)
        {
          if (PixelFormatType != 1885745714)
          {
            v10 = 13364;
            goto LABEL_30;
          }
        }
        else if (PixelFormatType != 1882469428)
        {
          v10 = 12848;
LABEL_30:
          v15 = v10 | 0x70660000;
LABEL_31:
          if (PixelFormatType == v15)
            goto LABEL_32;
LABEL_68:
          v16 = 2 * *(_DWORD *)(a2 + 2112);
LABEL_33:
          *(_DWORD *)(a1 + 5900) = v16;
          *(_DWORD *)(a1 + 5904) = *(_DWORD *)(a2 + 2116);
          v17 = AppleD5500PutPixelBufferInPool(a1, &v65);
          if ((_DWORD)v17)
          {
            v13 = v17;
            syslog(3, "AppleD5500: AppleD5500DecodeFrame could not put buffer in buffer pool");
            goto LABEL_109;
          }
          goto LABEL_35;
        }
LABEL_32:
        v16 = (2 * ((2863311531u * (unint64_t)*(unsigned int *)(a2 + 2112)) >> 32)) & 0xFFFFFFFC;
        goto LABEL_33;
      }
      if (PixelFormatType != 1278226488)
      {
        if (PixelFormatType != 1882468912)
        {
          v15 = 1882468914;
          goto LABEL_31;
        }
        goto LABEL_32;
      }
    }
LABEL_24:
    v16 = *(_DWORD *)(a2 + 2112);
    goto LABEL_33;
  }
  v11 = *(__sFILE **)(a1 + 5920);
  if (v11)
    WriteNAL(v11, v6, v5);
  PixelBufferFromBufferPool = AppleD5500GetPixelBufferFromBufferPool(a1, &v65);
  if ((_DWORD)PixelBufferFromBufferPool
    || *(_DWORD *)(a1 + 3352)
    && (PixelBufferFromBufferPool = AppleD5500GetSecondPixelBufferFromBufferPool(a1, (unsigned int *)&v64),
        (_DWORD)PixelBufferFromBufferPool))
  {
    v13 = PixelBufferFromBufferPool;
    syslog(3, "AppleD5500: AppleD5500DecodeFrame could not get buffer from buffer pool");
    goto LABEL_109;
  }
LABEL_35:
  *(_QWORD *)(a1 + 3448) = v6;
  v18 = v64;
  v19 = v65;
  *(_DWORD *)(a1 + 3412) = v65;
  *(_DWORD *)(a1 + 3416) = v18;
  *(_DWORD *)(a1 + 3368) = 0;
  *(_QWORD *)(a1 + 3600) = *(_QWORD *)(a2 + 36);
  *(_QWORD *)(a1 + 3608) = *(_QWORD *)(a2 + 44);
  if ((*(_DWORD *)(a1 + 2120) & 0xFFFFFFFE) == 4)
  {
    bzero((void *)(a1 + 3616), 0x800uLL);
    v20 = *(_QWORD *)(a2 + 2104);
    if (HIDWORD(v20))
    {
      syslog(3, "AppleD5500: %s %d 64->32 conversion problem!", "AppleD5500DecodeFrame", 2211);
      v20 = *(_QWORD *)(a2 + 2104);
      v19 = *(_DWORD *)(a1 + 3412);
    }
    *(_DWORD *)(a1 + 5664) = v20;
    memcpy((void *)(a1 + 3616), (const void *)(a2 + 52), 4 * v20);
    memcpy((void *)(a1 + 4640), (const void *)(a2 + 1076), 4 * *(unsigned int *)(a1 + 5664));
  }
  else
  {
    *(_DWORD *)(a1 + 5664) = 0;
  }
  v21 = *(_DWORD *)(a1 + 2112);
  *(_DWORD *)(a1 + 3436) = v21;
  *(_DWORD *)(a1 + 4 * (v21 & 0xF) + 5832) = v21;
  v63 = 0;
  BufferPool::getBufferInfo(*(pthread_mutex_t **)(a1 + 2096), v19, &v63);
  if (v63)
  {
    v22 = *(__CVBuffer **)(v63 + 16);
  }
  else
  {
    syslog(3, "AppleD5500: nAppleD5500DecodeFrame %d %d %d - errorStatus %d\n", *(_DWORD *)(a1 + 2112), *(_DWORD *)(a1 + 3412), -1, -1);
    v22 = 0;
  }
  if (!v4[60] || !*(_DWORD *)(a1 + 3376))
    goto LABEL_100;
  *(_DWORD *)(a1 + 3400) = 0;
  v23 = *(_DWORD *)(a1 + 2140);
  if (v23 == 3)
  {
    v56 = v22;
    v58 = (unsigned int *)(a1 + 3400);
    v62 = v6;
    v57 = v7;
    v36 = *(_DWORD *)(a1 + 3596);
    v37 = (HEVC_RBSP *)operator new();
    HEVC_RBSP::HEVC_RBSP(v37);
    if ((_DWORD)v5)
    {
      if (v36 <= 4 && ((1 << v36) & 0x16) != 0)
      {
        v38 = 0;
        v59 = v36;
        cf = &v6[v5];
        while (1)
        {
          if (v36 == 2)
          {
            v43 = *(unsigned __int16 *)v6;
            v39 = v6 + 2;
            v41 = __rev16(v43);
            v42 = v41 + 2;
          }
          else if (v36 == 4)
          {
            v40 = *(_DWORD *)v6;
            v39 = v6 + 4;
            v41 = bswap32(v40);
            v42 = v41 + 4;
          }
          else
          {
            v44 = *v6;
            v39 = v6 + 1;
            v41 = v44;
            v42 = v44 + 1;
          }
          v45 = v41;
          if (&v39[v41] > cf)
            break;
          HEVC_RBSP::setRBSP(v37, v39, v41);
          if (!HEVC_RBSP::parseNAL(v37, v66, 0))
            goto LABEL_87;
          if (v66[1] == 39)
          {
            v47 = v39[2];
            v46 = v39 + 2;
            if (v47 == 5)
            {
              v48 = RemoveEPB(v46, v45 - 2, *(unsigned __int8 **)(a1 + 3392));
              parseSEI(*(unsigned __int8 **)(a1 + 3392), v48, *(unsigned __int8 **)(a1 + 3384), v58);
            }
          }
          v38 += v42;
          v6 = &v62[v38];
          v36 = v59;
          if (v38 >= v5)
            goto LABEL_89;
        }
        syslog(3, "%s NALU too big! %d nal_ptr:%p, buf_end:%p", "FindFrameMetadataHEVC", v41, v39, cf);
      }
      else
      {
        syslog(3, "HEVC_Decoder::ParseHeader unsupported naluLengthSize %d", v36);
      }
LABEL_87:
      syslog(3, "%s return with error %d");
    }
LABEL_89:
    v49 = *v58;
    v7 = v57;
    v6 = v62;
    if ((_DWORD)v49)
    {
      if (v56)
      {
        v50 = *(_QWORD *)(a1 + 3384);
        if (*(_BYTE *)v50 == 109
          && *(_BYTE *)(v50 + 1) == 101
          && *(_BYTE *)(v50 + 2) == 116
          && *(_BYTE *)(v50 + 3) == 97)
        {
          v51 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          v52 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)(v50 + 4), v49, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
          if (v52)
          {
            cfa = v52;
            v53 = CFPropertyListCreateFromXMLData(v51, v52, 0, 0);
            if (v53)
            {
              v54 = v53;
              CVBufferSetAttachment(v56, CFSTR("MetadataDictionary"), v53, kCVAttachmentMode_ShouldPropagate);
              CFRelease(v54);
            }
            CFRelease(cfa);
          }
        }
      }
      *v58 = 0;
    }
    goto LABEL_100;
  }
  if (v23 == 2 && v5 <= 0x1800000)
  {
    v24 = *(_DWORD *)(a1 + 3596);
    if (v24 <= v5)
    {
      v56 = v22;
      v58 = (unsigned int *)(a1 + 3400);
      v62 = v6;
      v57 = v7;
      if (v24 <= 4 && ((1 << v24) & 0x16) != 0)
      {
        v25 = 0;
        while (1)
        {
          v26 = (unsigned int *)&v62[v25];
          if (v24 == 2)
          {
            v31 = *(unsigned __int16 *)v26;
            v27 = (char *)v26 + 2;
            v29 = __rev16(v31);
            v30 = v29 + 2;
          }
          else if (v24 == 4)
          {
            v28 = *v26;
            v27 = v26 + 1;
            v29 = bswap32(v28);
            v30 = v29 + 4;
          }
          else
          {
            v32 = *(unsigned __int8 *)v26;
            v27 = (char *)v26 + 1;
            v29 = v32;
            v30 = v32 + 1;
          }
          v25 += v30;
          if (v25 > v5 || v29 > v5)
            goto LABEL_89;
          v34 = *v27 & 0x1F;
          if (v34 > 0xC)
            break;
          if (((1 << v34) & 0x13A2) == 0)
          {
            if (v34 != 6)
              break;
            v35 = RemoveEPB(v27 + 1, v29 - 1, *(unsigned __int8 **)(a1 + 3392));
            parseSEI(*(unsigned __int8 **)(a1 + 3392), v35, *(unsigned __int8 **)(a1 + 3384), v58);
          }
LABEL_63:
          if (v25 + v24 > v5)
            goto LABEL_89;
        }
        syslog(3, "AppleD5500: Bad NAL type %d\n", *v27 & 0x1F);
        goto LABEL_63;
      }
      syslog(3, "AppleD5500: AVC_Decoder::ParseHeader unsupported naluLengthSize ");
      goto LABEL_89;
    }
  }
LABEL_100:
  if (*(_DWORD *)(a1 + 2136))
  {
    v13 = AppleD5500DecodeFrameInternal(a1, (unint64_t)v6, v5, v7, v65, v64);
    if ((_DWORD)v13)
      syslog(3, "AppleD5500: AppleD5500DecodeFrameInternal failed");
  }
  else
  {
    v13 = 0;
  }
  *(_DWORD *)(a2 + 28) = *(_DWORD *)(a1 + 3368);
  if (*(_BYTE *)(a1 + 3592) && *(_DWORD *)(a1 + 3432) != *(_DWORD *)(a1 + 2112))
  {
    do
      pthread_cond_wait((pthread_cond_t *)(a1 + 3544), (pthread_mutex_t *)(a1 + 3040));
    while (*(_DWORD *)(a1 + 3432) != *(_DWORD *)(a1 + 2112));
  }
  if (v4[36])
    AppleD5500DisplayCallback(a1, v7, v65, v13);
LABEL_109:
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 3040));
  return v13;
}

void sub_2195196B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x219A2D46C](v1, 0x1091C40A4775F28);
  _Unwind_Resume(a1);
}

uint64_t AppleD5500TerminateDecoder(uint64_t a1)
{
  pthread_mutex_t *v2;
  int v3;
  void *v4;
  void *v5;
  const void *v6;
  RingBuffer *v7;
  FILE *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v12;

  v12 = 0;
  v2 = *(pthread_mutex_t **)(a1 + 3136);
  if (v2)
    RingBuffer::getBuffersOutstanding(v2, &v12);
  v3 = 1000;
  while (v12)
  {
    RingBuffer::getBuffersOutstanding(*(pthread_mutex_t **)(a1 + 3136), &v12);
    usleep(0x2710u);
    if (!--v3)
    {
      syslog(3, "AppleD5500: %s(): pendingBuffers %d pendingCount %d\n", "AppleD5500TerminateDecoder", v12, 1000);
      syslog(3, "AppleD5500: %s(): Time out. Give up waiting. pendingBuffers %d pendingCount %d\n", "AppleD5500TerminateDecoder", v12, 1000);
      break;
    }
  }
  StopD5500FrameReceiver(*(__CFRunLoop ***)(a1 + 3456), (pthread_t *)(a1 + 3528));
  if (*(_BYTE *)(a1 + 5956))
  {
    v4 = *(void **)(a1 + 3392);
    if (v4)
      free(v4);
    v5 = *(void **)(a1 + 3384);
    if (v5)
      free(v5);
  }
  *(_DWORD *)(a1 + 3400) = 0;
  v6 = *(const void **)(a1 + 3112);
  if (v6)
  {
    if (IOSurfaceUnlock(*(IOSurfaceRef *)(a1 + 3112), 0, 0))
      syslog(3, "AppleD5500: AppleD5500_H264Decoder - ERROR IOSurfaceUnlock failed\n");
    CFRelease(v6);
  }
  else
  {
    syslog(3, "AppleD5500: AppleD5500_H264Decoder - ERROR pInputBufRef NULL\n");
  }
  v7 = *(RingBuffer **)(a1 + 3136);
  if (v7)
  {
    RingBuffer::~RingBuffer(v7);
    MEMORY[0x219A2D46C]();
  }
  v8 = *(FILE **)(a1 + 5920);
  if (v8)
    fclose(v8);
  *(_QWORD *)(a1 + 5920) = 0;
  if (!*(_DWORD *)(a1 + 2136))
    return 0;
  v9 = AppleD5500DestroyDecodeDeviceInternal(a1);
  v10 = v9;
  if ((_DWORD)v9)
    syslog(3, "AppleD5500: AppleD5500TerminateDecoder failed error: %d \n", v9);
  return v10;
}

uint64_t AppleD5500ReleaseRingBuffer(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  RingBuffer *v3;

  if (a1 && (v3 = *(RingBuffer **)(a1 + 3136)) != 0)
    return RingBuffer::releaseRingBuffer(v3, a2 + 16, a3);
  else
    return 0;
}

uint64_t AppleD5500ReleaseCurrentInputBuffer(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  pthread_mutex_t *v3;

  if (a1 && (v3 = *(pthread_mutex_t **)(a1 + 3136)) != 0)
    return RingBuffer::releaseNewestRingBuffer(v3, a2 + 16, a3);
  else
    return 0;
}

uint64_t AppleD5500SetParameter(uint64_t a1, int a2, int *a3)
{
  uint64_t result;
  int v5;
  unsigned int v6;
  unsigned int v7;

  if (!a1)
    return 312;
  result = 3758097095;
  switch(a2)
  {
    case 1:
      result = 0;
      *(_QWORD *)(a1 + 24) = *(_QWORD *)a3;
      break;
    case 2:
      result = 0;
      *(_QWORD *)(a1 + 32) = a3;
      break;
    case 3:
      result = 0;
      *(_QWORD *)(a1 + 2088) = a3;
      break;
    case 4:
      result = 0;
      *(_QWORD *)(a1 + 2160) = a3;
      break;
    case 5:
      result = 0;
      *(_DWORD *)(a1 + 2120) = *a3;
      *(_BYTE *)(a1 + 2116) = 1;
      break;
    case 6:
      *(_QWORD *)(a1 + 2128) = a3;
      AppleD5500SetCrpytSession(a1);
      result = 0;
      break;
    case 9:
      result = 0;
      *(_QWORD *)(a1 + 2152) = a3;
      break;
    case 11:
      result = 0;
      *(_DWORD *)(a1 + 3224) = *a3;
      break;
    case 12:
      result = 0;
      *(_DWORD *)(a1 + 3228) = 1;
      *(_DWORD *)(a1 + 3232) = *a3;
      *(_DWORD *)(a1 + 3236) = a3[1];
      break;
    case 13:
      result = 0;
      *(_DWORD *)(a1 + 3352) = *a3;
      break;
    case 14:
      result = 0;
      *(_DWORD *)(a1 + 3356) = *a3;
      break;
    case 15:
      v5 = *a3;
      v6 = *(_DWORD *)(a1 + 16);
      v7 = *(_DWORD *)(a1 + 20);
      if (*a3 > v6 || a3[1] > v7)
      {
        syslog(3, "AppleD5500: VRA illegal size %u %u %u %u", v5, v6, a3[1], v7);
        result = 308;
      }
      else
      {
        result = 0;
        *(_DWORD *)(a1 + 3360) = v5;
        *(_DWORD *)(a1 + 3364) = a3[1];
      }
      break;
    case 16:
      result = 0;
      *(_DWORD *)(a1 + 3156) = *a3;
      break;
    case 17:
      result = 0;
      *(_DWORD *)(a1 + 3228) = 1;
      *(_DWORD *)(a1 + 3232) = *a3;
      *(_DWORD *)(a1 + 3236) = a3[1];
      *(_DWORD *)(a1 + 3408) = a3[2];
      break;
    case 18:
      result = 0;
      *(_DWORD *)(a1 + 3160) = *a3;
      break;
    case 19:
      result = 0;
      *(_QWORD *)(a1 + 5920) = a3;
      break;
    case 20:
      result = 0;
      *(_DWORD *)(a1 + 5928) = *a3;
      break;
    case 21:
      result = 0;
      *(_BYTE *)(a1 + 5932) = *(_BYTE *)a3;
      break;
    case 22:
      result = 0;
      *(_DWORD *)(a1 + 5936) = *a3;
      break;
    case 23:
      result = 0;
      *(_DWORD *)(a1 + 5940) = *a3;
      break;
    case 24:
      result = 0;
      *(_BYTE *)(a1 + 5896) = 1;
      *(_DWORD *)(a1 + 5900) = *a3;
      *(_DWORD *)(a1 + 5904) = a3[1];
      break;
    case 26:
      result = 0;
      *(_DWORD *)(a1 + 5944) = *a3;
      *(_DWORD *)(a1 + 5948) = a3[1];
      break;
    case 27:
      result = 0;
      *(_DWORD *)(a1 + 5952) = *a3;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t AppleD5500GetParameter(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = 3758097095;
  switch(a2)
  {
    case 7:
      v3 = RingBuffer::requestRingBuffer(*(RingBuffer **)(a1 + 3136), *(_QWORD *)(a3 + 8) + 16, (unsigned __int8 **)a3);
      if ((_DWORD)v3)
        puts("Get compressed buffer error");
      return v3;
    case 8:
      v3 = 0;
      v4 = *(_DWORD *)(a1 + 3032);
      goto LABEL_10;
    case 9:
    case 11:
      return v3;
    case 10:
      v3 = 0;
      v5 = *(_OWORD *)(a1 + 3168);
      v6 = *(_OWORD *)(a1 + 3184);
      v7 = *(_OWORD *)(a1 + 3200);
      *(_DWORD *)(a3 + 48) = *(_DWORD *)(a1 + 3216);
      *(_OWORD *)(a3 + 16) = v6;
      *(_OWORD *)(a3 + 32) = v7;
      *(_OWORD *)a3 = v5;
      return v3;
    case 12:
      if (*(_DWORD *)(a1 + 3228) == 1)
        goto LABEL_8;
      v3 = 0;
      *(_QWORD *)a3 = 0;
      break;
    default:
      if (a2 == 24)
      {
LABEL_8:
        v3 = 0;
        *(_DWORD *)a3 = *(_DWORD *)(a1 + 3232);
        *(_DWORD *)(a3 + 4) = *(_DWORD *)(a1 + 3236);
      }
      else if (a2 == 25)
      {
        v3 = 0;
        v4 = *(_DWORD *)(a1 + 3372);
LABEL_10:
        *(_DWORD *)a3 = v4;
      }
      break;
  }
  return v3;
}

uint64_t RemoveEPB(unsigned __int8 *a1, unsigned int a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  unsigned int v4;
  unsigned __int8 *v5;
  int v6;
  int v7;
  uint64_t v8;

  v3 = a3;
  if (a2)
  {
    v4 = 0;
    v5 = a3;
    do
    {
      v6 = *(_DWORD *)a1;
      if ((*(_DWORD *)a1 & 0xFCFFFF) != 0)
      {
        ++a1;
        v3 = v5 + 1;
        v7 = 1;
      }
      else
      {
        LOBYTE(v6) = 0;
        *(_WORD *)(v5 + 1) = 768;
        v3 = v5 + 3;
        a1 += 2;
        v7 = 2;
      }
      v4 += v7;
      *v5 = v6;
      v5 = v3;
    }
    while (v4 < a2);
  }
  v8 = v3 - a3;
  if ((unint64_t)(v3 - a3) >> 32)
    syslog(3, "AppleD5500: %s %d 64->32 conversion problem!", "RemoveEPB", 1826);
  return v8;
}

unsigned __int8 *parseSEI(unsigned __int8 *result, unsigned int a2, unsigned __int8 *__dst, unsigned int *a4)
{
  int v5;
  int v6;
  int v7;
  unint64_t v8;
  unsigned int v9;
  int v10;
  int v11;
  uint64_t i;
  unsigned int v14;
  unsigned int v16;
  _QWORD v17[3];

  v5 = 0;
  v17[2] = *MEMORY[0x24BDAC8D0];
  *a4 = 0;
  v6 = *result;
  v7 = 0;
  if (a2 && v6 == 255)
  {
    v5 = 0;
    v8 = 1;
    do
    {
      v7 = v8;
      v5 += 255;
      v6 = result[v8];
      if (v8 >= a2)
        break;
      ++v8;
    }
    while (v6 == 255);
  }
  v9 = v7 + 1;
  v10 = -271;
  do
  {
    v11 = result[v9];
    v10 += 255;
  }
  while (v11 == 255 && v9++ < a2);
  if (v5 + v6 == 5)
  {
    for (i = 0; i != 16; ++i)
    {
      v14 = v9 + 1;
      *((_BYTE *)v17 + i) = result[v9++];
    }
    if (v17[0] == 0x5646C3E2DC8DF223 && v17[1] == 0xDE4FDE1CA55751BCLL)
    {
      v16 = v11 + v10;
      result = (unsigned __int8 *)memcpy(__dst, &result[v14], (v11 + v10));
      *a4 = v16;
    }
  }
  return result;
}

void MSVDXUTILS_CalculateScalerCoefficients(float a1, unsigned __int8 (*a2)[16])
{
  float v3;
  _BYTE *v4;
  float v5;
  float v6;
  uint64_t i;
  uint64_t j;
  uint64_t v9;
  float *v10;
  uint64_t v11;
  float *v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _BYTE *v20;
  unsigned __int8 (*v21)[16];
  uint64_t v22;
  float v23;
  unint64_t v24;
  int v25;
  int v26;
  BOOL v27;
  int v28;
  unsigned int v29;
  unsigned int v30;
  uint64_t v31;
  char v32;
  char v33;
  unsigned __int8 *v34;
  uint64_t v35;
  unsigned int v36;
  _BYTE v37[128];
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = 1.0 / a1;
  v4 = v37;
  bzero(v37, 0x240uLL);
  for (i = 0; i != 16; ++i)
  {
    for (j = 0; j != 256; j += 64)
      *(_DWORD *)&v4[j] = 0;
    v4 += 4;
  }
  v9 = 0;
  if (v3 > 1.0)
    v3 = 1.0;
  v10 = (float *)v37;
  do
  {
    v11 = 0;
    v12 = v10;
    do
    {
      *v12 = msvdxutils_CalculateScalerCoeffsSyncFunc((float)v9, (float)v11, v3, v5, v6);
      v12 += 16;
      ++v11;
    }
    while (v11 != 4);
    ++v9;
    ++v10;
  }
  while (v9 != 16);
  v13 = 0;
  v14 = 1;
  do
  {
    v15 = v14;
    v16 = v13 << 6;
    v17 = 16;
    do
    {
      v18 = (v17 >> 4) - v13 + 3;
      if ((_DWORD)v18 == 3 || (v17 >> 4) - v13 >= 0xFFFFFFFD)
        *(_DWORD *)&v37[64 * v18 + 4 * (v17 & 0xF)] = *(_DWORD *)&v37[v16];
      v16 += 4;
      --v17;
    }
    while (v17);
    v14 = 0;
    v13 = 1;
  }
  while ((v15 & 1) != 0);
  v19 = 0;
  v38 = 1065353215;
  v20 = v37;
  v21 = a2;
  do
  {
    v22 = 0;
    v23 = 0.0;
    do
    {
      v23 = v23 + *(float *)&v20[v22];
      v22 += 64;
    }
    while (v22 != 256);
    v24 = 0;
    v25 = 0;
    do
    {
      v26 = (int)(float)((float)(*(float *)&v20[4 * v24] * 64.0) / v23);
      v21[v24 / 0x10][0] = v26;
      v25 += v26;
      v24 += 16;
    }
    while (v24 != 64);
    if (v19 <= 8)
    {
      v28 = v25 - 64;
      v27 = v25 < 64;
      v29 = v25 - 63;
      if (!v27)
        v29 = v28;
      v30 = v29 >> 1;
      if (v19 != 8)
        LOBYTE(v30) = v28;
      (*a2)[v19] -= v30;
    }
    ++v19;
    v20 += 4;
    v21 = (unsigned __int8 (*)[16])((char *)v21 + 1);
  }
  while (v19 != 16);
  v31 = 0;
  v32 = 1;
  do
  {
    v33 = v32;
    v34 = &(*a2)[16 * v31];
    v35 = 16;
    do
    {
      v36 = (v35 >> 4) - v31 + 3;
      if (v36 == 3 || (v35 >> 4) - v31 >= 0xFFFFFFFD)
        (*a2)[16 * v36 + (v35 & 0xF)] = *v34;
      ++v34;
      --v35;
    }
    while (v35);
    v32 = 0;
    v31 = 1;
  }
  while ((v33 & 1) != 0);
}

float msvdxutils_CalculateScalerCoeffsSyncFunc(float a1, float a2, float a3, float a4, float a5)
{
  float v8;
  float v9;
  float v10;
  double v11;
  double v12;
  float v13;
  float v14;
  float v15;
  float v16;

  v8 = sqrtf(1.0- (float)((float)((float)((float)(a1 + (float)(a2 * 16.0)) + -32.0) * 0.03125)* (float)((float)((float)(a1 + (float)(a2 * 16.0)) + -32.0) * 0.03125)));
  v9 = v8 + v8;
  v10 = fabsf(v9);
  if (v10 >= 3.75)
  {
    v13 = 3.75 / v10;
    v12 = (v13
         * (v13
          * (v13
           * (v13 * (v13 * (v13 * (v13 * (v13 * 0.00392377 + -0.01647633) + 0.02635537) + -0.02057706) + 0.00916281)
            + -0.00157565)
           + 0.00225319)
          + 0.01328592)
         + 0.39894228)
        * (float)(expf(v10) / sqrtf(v10));
  }
  else
  {
    v11 = (float)((float)(v9 / 3.75) * (float)(v9 / 3.75));
    v12 = v11
        * (v11 * (v11 * (v11 * (v11 * (v11 * 0.0045813 + 0.0360768) + 0.2659732) + 1.2067492) + 3.0899424) + 3.5156229)
        + 1.0;
  }
  v14 = 1.0;
  if ((float)((float)(2.0 - a2) - (float)(a1 * 0.0625)) != 0.0)
  {
    v15 = (float)(2.0 - (float)((float)(a1 * 0.0625) + a2)) * (float)((float)(a3 * 0.9) * 3.1416);
    v14 = sinf(v15) / v15;
  }
  v16 = v12;
  return (float)(v16 * 0.43868) * v14;
}

uint64_t D5500FrameReceiver::MakeCurrentThreadTimeConstraintThread(D5500FrameReceiver *this)
{
  unint64_t v1;
  unint64_t v2;
  _opaque_pthread_t *v3;
  thread_act_t v4;
  mach_timebase_info info;
  integer_t policy_info[2];
  integer_t v8;
  int v9;

  mach_timebase_info(&info);
  LODWORD(v2) = info.numer;
  LODWORD(v1) = info.denom;
  *(int32x2_t *)policy_info = vmovn_s64((int64x2_t)vcvtq_u64_f64(vmulq_n_f64((float64x2_t)xmmword_219526B30, (double)v1 / (double)v2 * 1000000.0)));
  v8 = policy_info[0];
  v9 = 1;
  v3 = pthread_self();
  v4 = pthread_mach_thread_np(v3);
  return thread_policy_set(v4, 2u, policy_info, 4u);
}

uint64_t D5500FrameReceiver::D5500FrameReceiver(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  void *v4;

  *(_DWORD *)(a1 + 40) = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 32);
  v3 = *(_QWORD **)(a2 + 8);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 56) = *v3;
  *(_BYTE *)(a1 + 74) = *(_BYTE *)(a2 + 33);
  *(_QWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 73) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  v4 = (void *)voucher_adopt();
  os_release(v4);
  return a1;
}

uint64_t D5500FrameReceiver::Setup(CFTypeRef *this)
{
  CFRunLoopRef Current;
  D5500FrameReceiver *v3;
  uint64_t v4;
  FILE **v5;
  FILE *v6;
  const char *v7;
  FILE **v8;
  FILE *v9;

  Current = CFRunLoopGetCurrent();
  *this = Current;
  if (!Current)
  {
    v8 = (FILE **)MEMORY[0x24BDAC8D8];
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Assert - (%s) - f: %s l: %d\n", "m_CFRunLoopRef != NULL", "/Library/Caches/com.apple.xbs/Sources/AppleD5500/AppleD5500FrameReceiver.cpp", 124);
    v9 = *v8;
    v7 = "D5500FrameReceiver ERROR: CFRunLoopGetCurrent failed.\n";
    fwrite("D5500FrameReceiver ERROR: CFRunLoopGetCurrent failed.\n", 0x36uLL, 1uLL, v9);
    syslog(3, "Assert - (%s) - f: %s l: %d\n", "m_CFRunLoopRef != NULL", "/Library/Caches/com.apple.xbs/Sources/AppleD5500/AppleD5500FrameReceiver.cpp", 124);
    v4 = 3758097085;
LABEL_5:
    syslog(3, v7);
    if (*this)
      CFRelease(*this);
    return v4;
  }
  CFRetain(Current);
  v3 = (D5500FrameReceiver *)D5500FrameReceiver::AddIODispatcherToRunLoop((mach_port_t *)this);
  if ((_DWORD)v3)
  {
    v4 = 3758097084;
    v5 = (FILE **)MEMORY[0x24BDAC8D8];
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Assert - (%s) - f: %s l: %d\n", "err == kIOReturnSuccess", "/Library/Caches/com.apple.xbs/Sources/AppleD5500/AppleD5500FrameReceiver.cpp", 133);
    v6 = *v5;
    v7 = "D5500FrameReceiver ERROR: AddIODispatcherToRunLoop failed.\n";
    fwrite("D5500FrameReceiver ERROR: AddIODispatcherToRunLoop failed.\n", 0x3BuLL, 1uLL, v6);
    syslog(3, "Assert - (%s) - f: %s l: %d\n", "err == kIOReturnSuccess", "/Library/Caches/com.apple.xbs/Sources/AppleD5500/AppleD5500FrameReceiver.cpp", 133);
    goto LABEL_5;
  }
  if (*((_BYTE *)this + 72))
  {
    printf("D5500FrameReceiver: setpriority to BACKGROUND");
    setpriority(3, 0, 4096);
  }
  else if (*((_BYTE *)this + 74))
  {
    D5500FrameReceiver::MakeCurrentThreadTimeConstraintThread(v3);
  }
  return 0;
}

uint64_t D5500FrameReceiver::AddIODispatcherToRunLoop(mach_port_t *this)
{
  uint64_t v2;
  const __CFAllocator *v3;
  CFMachPortRef v4;
  BOOL v5;
  __CFRunLoopSource *RunLoopSource;
  const char *v7;
  _BYTE v9[4];
  _QWORD inputStruct[2];
  size_t outputStructCnt;
  Boolean shouldFreeInfo;
  CFMachPortContext context;
  uint64_t reference[2];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!IOCreateReceivePort(0x39u, this + 6))
  {
    shouldFreeInfo = 0;
    context.version = 1;
    context.info = this;
    memset(&context.retain, 0, 24);
    v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v4 = CFMachPortCreateWithPort((CFAllocatorRef)*MEMORY[0x24BDBD240], this[6], MEMORY[0x24BDD7FD8], &context, &shouldFreeInfo);
    *((_QWORD *)this + 4) = v4;
    if (v4)
      v5 = shouldFreeInfo == 1;
    else
      v5 = 1;
    if (v5)
    {
      v2 = 3758097085;
      printf("D5500FrameReceiver ERROR: CFMachPortCreateWithPort failed m_CFAsyncPort %p shouldFreeInfo %d\n", v4, shouldFreeInfo);
      *((_QWORD *)this + 4) = 0;
    }
    else
    {
      RunLoopSource = CFMachPortCreateRunLoopSource(v3, v4, 0);
      *((_QWORD *)this + 2) = RunLoopSource;
      if (RunLoopSource)
      {
        CFRunLoopAddSource(*(CFRunLoopRef *)this, RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
        inputStruct[1] = this;
        outputStructCnt = 4;
        inputStruct[0] = D5500FrameReceiver::FrameDone;
        *(_OWORD *)reference = 0u;
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v2 = IOConnectCallAsyncMethod(this[10], 7u, this[6], reference, 8u, 0, 0, inputStruct, 0x10uLL, 0, 0, v9, &outputStructCnt);
        if (!(_DWORD)v2)
          return v2;
        v7 = "D5500FrameReceiver ERROR: kAppleD5500SetCallback failed -> Dispatcher cannot be installed";
      }
      else
      {
        v2 = 3758097085;
        v7 = "D5500FrameReceiver ERROR: CFMachPortCreateRunLoopSource failed -> Dispatcher cannot be installed";
      }
      puts(v7);
    }
    D5500FrameReceiver::RemoveIODispatcherFromRunLoop((D5500FrameReceiver *)this);
    return v2;
  }
  puts("D5500FrameReceiver ERROR: IOCreateReceivePort failed -> Dispatcher cannot be installed");
  return 3758097084;
}

uint64_t D5500FrameReceiver::ChangeBackgroundPolicy(uint64_t this, int a2)
{
  if (*(unsigned __int8 *)(this + 72) != a2)
  {
    *(_BYTE *)(this + 72) = a2;
    *(_BYTE *)(this + 73) = 1;
  }
  return this;
}

uint64_t D5500FrameReceiver::RemoveIODispatcherFromRunLoop(D5500FrameReceiver *this)
{
  __CFRunLoopSource *v2;
  __CFMachPort *v3;

  v2 = (__CFRunLoopSource *)*((_QWORD *)this + 2);
  if (v2)
  {
    CFRunLoopRemoveSource(*(CFRunLoopRef *)this, v2, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
    CFRelease(*((CFTypeRef *)this + 2));
    *((_QWORD *)this + 2) = 0;
  }
  v3 = (__CFMachPort *)*((_QWORD *)this + 4);
  if (v3)
  {
    CFMachPortInvalidate(v3);
    CFRelease(*((CFTypeRef *)this + 4));
    *((_QWORD *)this + 4) = 0;
  }
  return mach_port_mod_refs(*MEMORY[0x24BDAEC58], *((_DWORD *)this + 6), 1u, -1);
}

void D5500FrameReceiver::FrameDone(D5500FrameReceiver *this, void *a2, unint64_t *a3, unint64_t *a4)
{
  FILE **v5;
  int v6;
  const char *v7;
  FILE *v8;
  const char *v9;
  const char *v10;
  size_t v11;
  FILE **v12;
  FILE **v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  D5500FrameReceiver *v17;
  uint64_t v18;
  char *v19;
  void (*v20)(uint64_t, _QWORD, unint64_t, unint64_t, unint64_t);

  if (!a3)
  {
    v12 = (FILE **)MEMORY[0x24BDAC8D8];
    v6 = 312;
    v7 = "args != NULL";
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Assert - (%s) - f: %s l: %d\n", "args != NULL", "/Library/Caches/com.apple.xbs/Sources/AppleD5500/AppleD5500FrameReceiver.cpp", 312);
    v8 = *v12;
    v9 = "D5500FrameReceiver ERROR: args == NULL.\n";
    v10 = "D5500FrameReceiver ERROR: args == NULL.\n";
    v11 = 40;
    goto LABEL_7;
  }
  if (!this)
  {
    v13 = (FILE **)MEMORY[0x24BDAC8D8];
    v6 = 313;
    v7 = "frContext != NULL";
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Assert - (%s) - f: %s l: %d\n", "frContext != NULL", "/Library/Caches/com.apple.xbs/Sources/AppleD5500/AppleD5500FrameReceiver.cpp", 313);
    v8 = *v13;
    v9 = "D5500FrameReceiver ERROR: context == NULL.\n";
    v10 = "D5500FrameReceiver ERROR: context == NULL.\n";
    v11 = 43;
    goto LABEL_7;
  }
  if ((_DWORD)a2)
  {
    v5 = (FILE **)MEMORY[0x24BDAC8D8];
    v6 = 314;
    v7 = "commandResult == kIOReturnSuccess";
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Assert - (%s) - f: %s l: %d\n", "commandResult == kIOReturnSuccess", "/Library/Caches/com.apple.xbs/Sources/AppleD5500/AppleD5500FrameReceiver.cpp", 314);
    v8 = *v5;
    v9 = "D5500FrameReceiver ERROR: commandResult != kIOReturnSuccess.\n";
    v10 = "D5500FrameReceiver ERROR: commandResult != kIOReturnSuccess.\n";
    v11 = 61;
LABEL_7:
    fwrite(v10, v11, 1uLL, v8);
    syslog(3, "Assert - (%s) - f: %s l: %d\n", v7, "/Library/Caches/com.apple.xbs/Sources/AppleD5500/AppleD5500FrameReceiver.cpp", v6);
    syslog(3, v9);
    return;
  }
  v14 = *a3;
  v15 = a3[1];
  v16 = a3[2];
  if (*((_BYTE *)this + 73))
  {
    if (*((_BYTE *)this + 72))
    {
      printf("D5500FrameReceiver: setpriority to BACKGROUND");
      setpriority(3, 0, 4096);
    }
    else
    {
      printf("D5500FrameReceiver: setpriority to FOREGROUND");
      v17 = (D5500FrameReceiver *)setpriority(3, 0, 0);
      if (*((_BYTE *)this + 74))
        D5500FrameReceiver::MakeCurrentThreadTimeConstraintThread(v17);
    }
    *((_BYTE *)this + 73) = 0;
  }
  v19 = (char *)this + 56;
  v18 = *((_QWORD *)this + 7);
  v20 = (void (*)(uint64_t, _QWORD, unint64_t, unint64_t, unint64_t))*((_QWORD *)v19 + 1);
  if (HIDWORD(v14))
    syslog(3, "AppleD5500: %s %d 64->32 conversion problem!", "FrameDone", 350);
  if (HIDWORD(v15))
    syslog(3, "AppleD5500: %s %d 64->32 conversion problem!", "FrameDone", 350);
  if (HIDWORD(v16))
    syslog(3, "AppleD5500: %s %d 64->32 conversion problem!", "FrameDone", 350);
  v20(v18, 0, v14, v15, v16);
}

uint64_t CreateD5500FrameReceiver(_QWORD *a1, uint64_t a2, pthread_attr_t *a3, pthread_t *a4)
{
  int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  sched_param v15;
  _BYTE v16[8];
  uint64_t v17;
  uint64_t v18;

  v16[0] = 0;
  v17 = 0;
  v18 = a2;
  pthread_attr_init(a3);
  pthread_attr_setdetachstate(a3, 1);
  if (!*(_BYTE *)(a2 + 33))
  {
    pthread_attr_getschedparam(a3, &v15);
    v15.sched_priority = 53;
    if (pthread_attr_setschedparam(a3, &v15))
    {
      v12 = 3758097084;
      v13 = "D5500FrameReceiver: unable to set sched_priority 53";
    }
    else
    {
      if (!pthread_attr_setschedpolicy(a3, 2))
        goto LABEL_2;
      v12 = 3758097084;
      v13 = "D5500FrameReceiver: unable to set schedPolicy";
    }
    puts(v13);
    return v12;
  }
LABEL_2:
  pthread_create(a4, a3, (void *(__cdecl *)(void *))D5500FrameReceiverEntry, v16);
  v8 = 0;
  v9 = 1;
  while (!v16[0])
  {
    usleep(0x3E8u);
    v10 = v8 + 1;
    if (1000 * (v9 / 0x3E8) - 1 == v8)
      syslog(3, "AppleD5500: %s(): threadReady state false with wait count %d secs \n", "CreateD5500FrameReceiver", v10 / 0x3E8);
    ++v9;
    ++v8;
    if (v10 == 4000)
    {
      syslog(3, "AppleD5500: %s(): threadReady state false with wait count limit reached %d secs \n", "CreateD5500FrameReceiver", 4);
      if (a3)
        pthread_attr_destroy(a3);
      break;
    }
  }
  v11 = v17;
  *a1 = v17;
  if (v11)
    return 0;
  else
    return 3758097084;
}

uint64_t D5500FrameReceiverEntry(_QWORD *a1)
{
  CFTypeRef *v2;

  a1[1] = 0;
  v2 = (CFTypeRef *)operator new();
  D5500FrameReceiver::D5500FrameReceiver((uint64_t)v2, a1[2]);
  if (!D5500FrameReceiver::Setup(v2))
  {
    a1[1] = v2;
    pthread_setname_np("D5500FrameReceiver");
    *(_BYTE *)a1 = 1;
    CFRunLoopRun();
    pthread_exit(0);
  }
  MEMORY[0x219A2D46C](v2, 0x10A0C400E9CAAAFLL);
  *(_BYTE *)a1 = 1;
  syslog(3, "AppleD5500: D5500FrameReceiver ERROR: receiver->Setup failed.");
  return 0;
}

void sub_21951AAFC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x219A2D46C](v1, 0x10A0C400E9CAAAFLL);
  _Unwind_Resume(a1);
}

uint64_t StopD5500FrameReceiver(__CFRunLoop **this, pthread_t *a2)
{
  __CFRunLoop *v3;
  _opaque_pthread_t *v5;
  uint64_t v6;
  FILE **v7;
  CFIndex v8;
  void *v10;

  if (this)
  {
    v3 = *this;
    if (*this)
    {
      D5500FrameReceiver::RemoveIODispatcherFromRunLoop((D5500FrameReceiver *)this);
      CFRunLoopStop(v3);
      v5 = pthread_self();
      if (pthread_equal(v5, *a2))
      {
        syslog(3, "AppleD5500: %s(): FrameReceiver->Emit thread called Invalidate|Finalize!", "StopD5500FrameReceiver");
      }
      else
      {
        v10 = 0;
        pthread_join(*a2, &v10);
      }
      v8 = CFGetRetainCount(v3);
      if (v8 != 1)
        syslog(3, "AppleD5500: %s retain count is %ld", "StopD5500FrameReceiver", v8);
      CFRelease(v3);
      v6 = 0;
      *this = 0;
    }
    else
    {
      v6 = 3758097084;
      syslog(3, "AppleD5500: D5500FrameReceiver ERROR: runLoopRef NULL\n");
    }
  }
  else
  {
    v6 = 3758097084;
    v7 = (FILE **)MEMORY[0x24BDAC8D8];
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Assert - (%s) - f: %s l: %d\n", "pFrameReceiver != NULL", "/Library/Caches/com.apple.xbs/Sources/AppleD5500/AppleD5500FrameReceiver.cpp", 455);
    fwrite("D5500FrameReceiver ERROR: StopD5500FrameReceiver called with pFrameReceiver NULL.\n", 0x52uLL, 1uLL, *v7);
    syslog(3, "Assert - (%s) - f: %s l: %d\n", "pFrameReceiver != NULL", "/Library/Caches/com.apple.xbs/Sources/AppleD5500/AppleD5500FrameReceiver.cpp", 455);
    syslog(3, "D5500FrameReceiver ERROR: StopD5500FrameReceiver called with pFrameReceiver NULL.\n");
  }
  return v6;
}

uint64_t DestroyD5500FrameReceiver(uint64_t a1, pthread_attr_t *a2)
{
  FILE **v4;

  if (a1)
  {
    MEMORY[0x219A2D46C](a1, 0x10A0C400E9CAAAFLL);
    if (a2)
      pthread_attr_destroy(a2);
    return 0;
  }
  else
  {
    v4 = (FILE **)MEMORY[0x24BDAC8D8];
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Assert - (%s) - f: %s l: %d\n", "pFrameReceiver != NULL", "/Library/Caches/com.apple.xbs/Sources/AppleD5500/AppleD5500FrameReceiver.cpp", 513);
    fwrite("D5500FrameReceiver ERROR: DestroyD5500FrameReceiver called with pFrameReceiver NULL.\n", 0x55uLL, 1uLL, *v4);
    syslog(3, "Assert - (%s) - f: %s l: %d\n", "pFrameReceiver != NULL", "/Library/Caches/com.apple.xbs/Sources/AppleD5500/AppleD5500FrameReceiver.cpp", 513);
    syslog(3, "D5500FrameReceiver ERROR: DestroyD5500FrameReceiver called with pFrameReceiver NULL.\n");
    return 3758097084;
  }
}

BOOL isIntra(int a1)
{
  return a1 == 20 || (a1 & 0xFFFFFFFC) == 16;
}

uint64_t getSubWidthHeightC(uint64_t result, unsigned int *a2, unsigned int *a3)
{
  unsigned int v3;

  if (result <= 3)
  {
    v3 = dword_219526D80[(int)result];
    *a2 = dword_219526D70[(int)result];
    *a3 = v3;
  }
  return result;
}

void HEVC_RBSP::HEVC_RBSP(HEVC_RBSP *this)
{
  *(_QWORD *)this = &off_24DA9CCD0;
  *((_QWORD *)this + 13) = 0;
  *((_DWORD *)this + 28) = 0;
  *((_DWORD *)this + 37) = 0;
  *((_DWORD *)this + 38) = 0;
  *((_QWORD *)this + 16) = 0;
  *((_QWORD *)this + 17) = 0;
  *((_QWORD *)this + 15) = 0;
  *((_WORD *)this + 72) = -1;
  HEVC_RBSP::initScanOrder((unsigned int **)this);
}

void HEVC_RBSP::initScanOrder(unsigned int **this)
{
  uint64_t v2;
  unsigned int **v3;
  uint64_t i;
  HEVC_RBSP *v5;

  v2 = 0;
  v3 = this;
  do
  {
    for (i = 1; i != 4; ++i)
    {
      v5 = (HEVC_RBSP *)malloc_type_calloc(4uLL, (4 << v2 << (v2 + 2)), 0x7604E688uLL);
      v3[i] = (unsigned int *)v5;
    }
    HEVC_RBSP::calcScanOrder(v5, 4 << v2, this[3 * v2 + 1], this[3 * v2 + 2], this[3 * v2 + 3]);
    ++v2;
    v3 += 3;
  }
  while (v2 != 4);
}

void HEVC_RBSP::~HEVC_RBSP(HEVC_RBSP *this)
{
  uint64_t v1;
  HEVC_RBSP *v2;
  uint64_t i;

  v1 = 0;
  *(_QWORD *)this = &off_24DA9CCD0;
  v2 = this;
  do
  {
    for (i = 8; i != 32; i += 8)
      free(*(void **)((char *)v2 + i));
    ++v1;
    v2 = (HEVC_RBSP *)((char *)v2 + 24);
  }
  while (v1 != 4);
}

{
  uint64_t v1;
  HEVC_RBSP *v2;
  uint64_t i;

  v1 = 0;
  *(_QWORD *)this = &off_24DA9CCD0;
  v2 = this;
  do
  {
    for (i = 8; i != 32; i += 8)
      free(*(void **)((char *)v2 + i));
    ++v1;
    v2 = (HEVC_RBSP *)((char *)v2 + 24);
  }
  while (v1 != 4);
}

{
  uint64_t v1;
  HEVC_RBSP *i;
  uint64_t j;

  v1 = 0;
  *(_QWORD *)this = &off_24DA9CCD0;
  for (i = this; ; i = (HEVC_RBSP *)((char *)i + 24))
  {
    for (j = 8; j != 32; j += 8)
      free(*(void **)((char *)i + j));
    if (++v1 == 4)
      JUMPOUT(0x219A2D46CLL);
  }
}

void HEVC_RBSP::releaseScanOrder(HEVC_RBSP *this)
{
  uint64_t i;
  uint64_t j;

  for (i = 0; i != 4; ++i)
  {
    for (j = 8; j != 32; j += 8)
      free(*(void **)((char *)this + j));
    this = (HEVC_RBSP *)((char *)this + 24);
  }
}

uint64_t CFSwapInt32BigToHost_local(unsigned int a1)
{
  return bswap32(a1);
}

uint64_t HEVC_RBSP::setRBSP(HEVC_RBSP *this, unsigned __int8 *a2, uint64_t a3)
{
  unsigned __int8 *v5;
  uint64_t result;
  unsigned int v7[2];

  *((_QWORD *)this + 16) = &a2[a3];
  *((_QWORD *)this + 17) = a2;
  *((_QWORD *)this + 19) = 0;
  *((_DWORD *)this + 37) = a3;
  *((_WORD *)this + 72) = -1;
  *(_QWORD *)v7 = 0;
  *((_QWORD *)this + 13) = HEVC_RBSP::get_next_uint32(this, a2, &v7[1], v7) << 32;
  v5 = &a2[v7[1]];
  result = HEVC_RBSP::get_next_uint32(this, v5, &v7[1], v7);
  *((_QWORD *)this + 13) |= result;
  *((_QWORD *)this + 15) = &v5[v7[1]];
  *((_DWORD *)this + 28) = 8 * v7[0];
  return result;
}

uint64_t HEVC_RBSP::get_next_uint32(HEVC_RBSP *this, unsigned __int8 *a2, unsigned int *a3, unsigned int *a4)
{
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v12;
  int v13;
  int v14;
  BOOL v15;
  BOOL v20;
  int v21;
  int v25;
  unsigned int v26;
  unsigned __int8 v27;
  unsigned int v28;
  int v29;

  v4 = *((_QWORD *)this + 16) - (_QWORD)a2;
  if (v4 <= 0)
  {
    *a4 = 0;
    *a3 = 0;
    *((_WORD *)this + 72) = -1;
    return 0xFFFFFFFFLL;
  }
  v5 = *a2;
  if (v4 == 1)
  {
    v6 = 0;
    v7 = 0;
    v8 = 255;
    v9 = 255;
    v10 = 255;
LABEL_9:
    v12 = 255;
LABEL_10:
    v13 = 255;
    goto LABEL_11;
  }
  v10 = a2[1];
  if ((unint64_t)v4 < 3)
  {
    v6 = 0;
    v7 = 0;
    v8 = 255;
    v9 = 255;
    goto LABEL_9;
  }
  v9 = a2[2];
  if (v4 == 3)
  {
    v6 = 0;
    v7 = 0;
    v8 = 255;
    goto LABEL_9;
  }
  v12 = a2[3];
  if ((unint64_t)v4 < 5)
  {
    v6 = 0;
    v7 = 0;
    v8 = 255;
    goto LABEL_10;
  }
  v8 = a2[4];
  if (v4 == 5)
  {
    v6 = 0;
    v13 = 255;
  }
  else
  {
    v13 = a2[5];
    v6 = 1;
  }
  v7 = 1;
LABEL_11:
  v14 = *((unsigned __int8 *)this + 145);
  if (*((_BYTE *)this + 144))
    v15 = 0;
  else
    v15 = v14 == 0;
  if (v15 && v5 == 3 && v10 == 0 && v9 == 0 && v12 == 3)
    goto LABEL_50;
  if (v14 | v5)
    v20 = 0;
  else
    v20 = v10 == 3;
  v21 = v20;
  if (v21 == 1 && v9 == 0 && v12 == 0 && v8 == 3)
  {
    v8 = 0;
LABEL_50:
    v10 = 0;
LABEL_51:
    v26 = v4 - 2;
    if (v6)
      v26 = 4;
    *a4 = v26;
    *a3 = v26 + 2;
    if ((unint64_t)(v4 - 1) >= 3)
    {
      if (v4 == 4)
      {
        v9 = 0;
        *((_BYTE *)this + 144) = a2[2];
        v27 = a2[3];
      }
      else
      {
        v9 = 0;
        if (v4 == 5)
        {
          *((_BYTE *)this + 144) = a2[3];
          v27 = a2[4];
        }
        else
        {
          *((_BYTE *)this + 144) = a2[4];
          v27 = a2[5];
        }
      }
    }
    else
    {
      v9 = 0;
      v27 = -1;
      *((_BYTE *)this + 144) = -1;
    }
    v12 = v8;
    v5 = v10;
    goto LABEL_88;
  }
  if (!*((_BYTE *)this + 145) && !*((_BYTE *)this + 144) && v5 == 3 && !v9 && !v12 && v8 == 3)
  {
    v8 = 0;
    goto LABEL_51;
  }
  if ((v14 | *((unsigned __int8 *)this + 144)) == 0 && v5 == 3)
    v25 = v10;
  else
    v25 = 0;
  if (((v14 | *((unsigned __int8 *)this + 144)) == 0 && v5 == 3) | v21 & 1)
  {
    v5 = v25;
  }
  else if (*a2 || v10 || v9 != 3)
  {
    if (v10 || v9 || v12 != 3)
    {
      v29 = 4;
      if (v4 < 4)
        v29 = *((_DWORD *)this + 32) - (_DWORD)a2;
      *a4 = v29;
      *a3 = v29;
      switch(v4)
      {
        case 3:
          *((_BYTE *)this + 144) = a2[1];
          v27 = a2[2];
          break;
        case 2:
          *((_BYTE *)this + 144) = *a2;
          v27 = a2[1];
          break;
        case 1:
          *((_BYTE *)this + 144) = -1;
          v27 = *a2;
          break;
        default:
          *((_BYTE *)this + 144) = a2[2];
          v27 = a2[3];
          break;
      }
      v13 = v12;
      v12 = v9;
      v9 = v10;
      goto LABEL_88;
    }
    v9 = 0;
    v12 = 0;
  }
  else
  {
    v5 = 0;
    v9 = 0;
  }
  v28 = v4 - 1;
  if (v7)
    v28 = 4;
  *a4 = v28;
  *a3 = v28 + 1;
  switch(v4)
  {
    case 1:
      v27 = -1;
      *((_BYTE *)this + 144) = -1;
      break;
    case 2:
      *((_BYTE *)this + 144) = *a2;
      v27 = a2[1];
      break;
    case 3:
      *((_BYTE *)this + 144) = a2[1];
      v27 = a2[2];
      break;
    case 4:
      *((_BYTE *)this + 144) = a2[2];
      v27 = a2[3];
      break;
    default:
      *((_BYTE *)this + 144) = a2[3];
      v27 = a2[4];
      break;
  }
  v13 = v8;
LABEL_88:
  *((_BYTE *)this + 145) = v27;
  return v13 | (((v9 << 8) | (v5 << 16) | v12) << 8);
}

uint64_t HEVC_RBSP::getNumberOfBitsParsed(HEVC_RBSP *this)
{
  return *((unsigned int *)this + 38);
}

uint64_t HEVC_RBSP::next_access_unit(HEVC_RBSP *this, int a2)
{
  int v4;
  int v5;

  HEVC_RBSP::flush_bits((uint64_t)this, *((_DWORD *)this + 28) & 7);
  if (!a2)
    return 1;
  v4 = *((_DWORD *)this + 27);
  if (v4 == 1)
  {
    v5 = 32;
LABEL_6:
    HEVC_RBSP::flush_bits((uint64_t)this, v5);
    return 1;
  }
  if ((v4 & 0xFFFFFF00) == 0x100)
  {
    v5 = 24;
    goto LABEL_6;
  }
  return 0;
}

uint64_t HEVC_RBSP::byte_align(HEVC_RBSP *this)
{
  return HEVC_RBSP::flush_bits((uint64_t)this, *((_DWORD *)this + 28) & 7);
}

uint64_t HEVC_RBSP::flush_bits(uint64_t this, int a2)
{
  uint64_t v2;
  signed int v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned int v9[2];

  v2 = this;
  *(_DWORD *)(this + 152) += a2;
  v3 = *(_DWORD *)(this + 112);
  v4 = a2 - v3;
  if (a2 <= v3)
  {
    *(_QWORD *)(this + 104) <<= a2;
  }
  else
  {
    v5 = *(_QWORD *)(this + 104);
    v6 = v5 >> -(char)v3;
    v7 = v5 << v3;
    if (v3 >= 0)
      v8 = v7;
    else
      v8 = v6;
    *(_QWORD *)v9 = 0;
    this = HEVC_RBSP::get_next_uint32((HEVC_RBSP *)this, *(unsigned __int8 **)(this + 120), &v9[1], v9);
    *(_QWORD *)(v2 + 120) += v9[1];
    v3 = 8 * v9[0];
    *(_QWORD *)(v2 + 104) = (v8 | this) << v4;
    a2 = v4;
  }
  *(_DWORD *)(v2 + 112) = v3 - a2;
  return this;
}

uint64_t HEVC_RBSP::byte_alignment(HEVC_RBSP *this)
{
  HEVC_RBSP::flush_bits((uint64_t)this, 1);
  return HEVC_RBSP::flush_bits((uint64_t)this, *((_DWORD *)this + 28) & 7);
}

BOOL HEVC_RBSP::more_rbsp_data(HEVC_RBSP *this)
{
  return 8 * *((_DWORD *)this + 37) - *((_DWORD *)this + 38) > 8;
}

uint64_t HEVC_RBSP::parseNAL(HEVC_RBSP *a1, _DWORD *a2, int a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = HEVC_RBSP::next_access_unit(a1, a3);
  if ((_DWORD)result)
  {
    v6 = *((_QWORD *)a1 + 13) >> 63;
    HEVC_RBSP::flush_bits((uint64_t)a1, 1);
    *a2 = v6;
    v7 = *((_QWORD *)a1 + 13) >> 58;
    HEVC_RBSP::flush_bits((uint64_t)a1, 6);
    a2[1] = v7;
    v8 = *((_QWORD *)a1 + 13) >> 58;
    HEVC_RBSP::flush_bits((uint64_t)a1, 6);
    a2[2] = v8;
    v9 = *((_QWORD *)a1 + 13) >> 61;
    HEVC_RBSP::flush_bits((uint64_t)a1, 3);
    a2[3] = v9;
    if ((_DWORD)v9)
    {
      a2[4] = v9 - 1;
      return 1;
    }
    else
    {
      syslog(3, "AppleD5500: bad TID!");
      return 0;
    }
  }
  return result;
}

uint64_t HEVC_RBSP::parseVPS(uint64_t a1, _DWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  int v14;
  unsigned int v15;
  int v16;
  int v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  int v21;
  unsigned int v22;
  int v23;
  int v24;
  unint64_t v25;
  unint64_t v26;
  int v27;
  int v28;
  unsigned int v29;
  int v30;
  int v31;
  uint64_t v32;
  _DWORD *v33;
  _DWORD *v34;
  _DWORD *v35;
  _DWORD *v36;
  _DWORD *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  int v41;
  int v42;
  unsigned int v43;
  int v44;
  unsigned int v45;
  _DWORD *v46;
  void *v47;
  unsigned int v48;
  unsigned int v49;
  uint64_t v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  int v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  int v62;
  int v63;
  unsigned int v64;
  int v65;
  int v66;
  unint64_t v67;
  unint64_t v68;
  int v69;
  int v70;
  unsigned int v71;
  int v72;
  unsigned int v73;
  _DWORD *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  int v81;
  int v82;
  unsigned int v83;
  int v84;
  int v85;
  uint64_t v86;

  HEVCReleaseVPS((uint64_t)a2);
  bzero(a2, 0x278uLL);
  v4 = *(_QWORD *)(a1 + 104) >> 60;
  HEVC_RBSP::flush_bits(a1, 4);
  *a2 = v4;
  v5 = *(_QWORD *)(a1 + 104) >> 62;
  HEVC_RBSP::flush_bits(a1, 2);
  a2[1] = v5;
  v6 = *(_QWORD *)(a1 + 104) >> 58;
  HEVC_RBSP::flush_bits(a1, 6);
  a2[2] = v6;
  v7 = *(_QWORD *)(a1 + 104) >> 61;
  HEVC_RBSP::flush_bits(a1, 3);
  a2[3] = v7;
  if ((_DWORD)v7 == 7)
    goto LABEL_86;
  v8 = *(_QWORD *)(a1 + 104) >> 63;
  HEVC_RBSP::flush_bits(a1, 1);
  *((_BYTE *)a2 + 16) = v8;
  LODWORD(v8) = *(unsigned __int16 *)(a1 + 110);
  HEVC_RBSP::flush_bits(a1, 16);
  a2[5] = v8;
  HEVC_RBSP::parseProfileTierLevel(a1, (uint64_t)(a2 + 6), a2[3]);
  v9 = *(_QWORD *)(a1 + 104);
  HEVC_RBSP::flush_bits(a1, 1);
  *((_BYTE *)a2 + 468) = v9 < 0;
  if (v9 < 0)
    v10 = 0;
  else
    v10 = a2[3];
  do
  {
    v11 = *(_QWORD *)(a1 + 104);
    if ((v11 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      v17 = 0;
    }
    else
    {
      v12 = HIDWORD(v11);
      v13 = -32;
      do
      {
        LODWORD(v12) = 2 * v12;
        v14 = v13 + 1;
        if ((v12 & 0x80000000) != 0)
          break;
        v15 = v13 + 32;
        ++v13;
      }
      while (v15 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v14 + 33);
      v16 = *(_DWORD *)(a1 + 108) >> -(char)v14;
      HEVC_RBSP::flush_bits(a1, v14 + 32);
      v17 = v16 + ~(-2 << (v14 + 31));
    }
    a2[v10 + 118] = v17;
    v18 = *(_QWORD *)(a1 + 104);
    if ((v18 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      v24 = 0;
    }
    else
    {
      v19 = HIDWORD(v18);
      v20 = -32;
      do
      {
        LODWORD(v19) = 2 * v19;
        v21 = v20 + 1;
        if ((v19 & 0x80000000) != 0)
          break;
        v22 = v20 + 32;
        ++v20;
      }
      while (v22 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v21 + 33);
      v23 = *(_DWORD *)(a1 + 108) >> -(char)v21;
      HEVC_RBSP::flush_bits(a1, v21 + 32);
      v24 = v23 + ~(-2 << (v21 + 31));
    }
    a2[v10 + 125] = v24;
    v25 = *(_QWORD *)(a1 + 104);
    if ((v25 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      v31 = 0;
    }
    else
    {
      v26 = HIDWORD(v25);
      v27 = -32;
      do
      {
        LODWORD(v26) = 2 * v26;
        v28 = v27 + 1;
        if ((v26 & 0x80000000) != 0)
          break;
        v29 = v27 + 32;
        ++v27;
      }
      while (v29 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v28 + 33);
      v30 = *(_DWORD *)(a1 + 108) >> -(char)v28;
      HEVC_RBSP::flush_bits(a1, v28 + 32);
      v31 = v30 + ~(-2 << (v28 + 31));
    }
    a2[v10++ + 132] = v31;
    v32 = a2[3];
  }
  while (v10 <= v32);
  if (!*((_BYTE *)a2 + 468) && (_DWORD)v32)
  {
    v33 = a2 + 118;
    v34 = &a2[v32 + 118];
    v35 = &a2[v32];
    v36 = v35 + 125;
    v37 = v35 + 132;
    do
    {
      *v33 = *v34;
      v33[7] = *v36;
      v33[14] = *v37;
      ++v33;
      --v32;
    }
    while (v32);
  }
  v38 = *(_QWORD *)(a1 + 104) >> 58;
  HEVC_RBSP::flush_bits(a1, 6);
  a2[139] = v38;
  v39 = *(_QWORD *)(a1 + 104);
  if ((v39 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits(a1, 1);
    v45 = 0;
    v46 = a2 + 140;
    a2[140] = 0;
  }
  else
  {
    v40 = HIDWORD(v39);
    v41 = -32;
    do
    {
      LODWORD(v40) = 2 * v40;
      v42 = v41 + 1;
      if ((v40 & 0x80000000) != 0)
        break;
      v43 = v41 + 32;
      ++v41;
    }
    while (v43 < 0x1E);
    HEVC_RBSP::flush_bits(a1, v42 + 33);
    v44 = *(_DWORD *)(a1 + 108) >> -(char)v42;
    HEVC_RBSP::flush_bits(a1, v42 + 32);
    v45 = v44 + ~(-2 << (v42 + 31));
    a2[140] = v45;
    if (v45 >= 0x400)
    {
      syslog(3, "AppleD5500: ERROR: vps->vps_num_layer_sets_minus1 >= %d \n");
LABEL_86:
      HEVCReleaseVPS((uint64_t)a2);
      v56 = 0;
      *a2 = -1;
      return v56;
    }
    v46 = a2 + 140;
  }
  v47 = malloc_type_calloc(8uLL, v45 + 1, 0x447D462DuLL);
  *((_QWORD *)a2 + 71) = v47;
  if (!v47)
  {
    syslog(3, "AppleD5500: ERROR: vps->layer_id_included_flag bad alloc \n");
    goto LABEL_86;
  }
  if (*v46)
  {
    v48 = a2[139];
    v49 = 1;
    while (1)
    {
      v50 = v49;
      *(_QWORD *)(*((_QWORD *)a2 + 71) + 8 * v49) = malloc_type_malloc(v48 + 1, 0x7FBA65CBuLL);
      if (!*(_QWORD *)(*((_QWORD *)a2 + 71) + 8 * v49))
        break;
      v51 = 0;
      do
      {
        v52 = *(_QWORD *)(a1 + 104) >> 63;
        HEVC_RBSP::flush_bits(a1, 1);
        *(_BYTE *)(*(_QWORD *)(*((_QWORD *)a2 + 71) + 8 * v50) + v51++) = v52;
        v48 = a2[139];
      }
      while (v51 <= v48);
      v49 = v50 + 1;
      if ((v50 + 1) > *v46)
        goto LABEL_43;
    }
    syslog(3, "AppleD5500: ERROR: vps->layer_id_included_flag[%d] bad alloc \n");
    goto LABEL_86;
  }
LABEL_43:
  v53 = *(_QWORD *)(a1 + 104);
  HEVC_RBSP::flush_bits(a1, 1);
  *((_BYTE *)a2 + 576) = v53 < 0;
  if (v53 < 0)
  {
    v57 = *(_DWORD *)(a1 + 108);
    HEVC_RBSP::flush_bits(a1, 32);
    a2[145] = v57;
    v58 = *(_DWORD *)(a1 + 108);
    HEVC_RBSP::flush_bits(a1, 32);
    a2[146] = v58;
    v59 = *(_QWORD *)(a1 + 104);
    HEVC_RBSP::flush_bits(a1, 1);
    *((_BYTE *)a2 + 588) = v59 < 0;
    if (v59 < 0)
    {
      v60 = *(_QWORD *)(a1 + 104);
      if ((v60 & 0x8000000000000000) != 0)
      {
        HEVC_RBSP::flush_bits(a1, 1);
        v66 = 0;
      }
      else
      {
        v61 = HIDWORD(v60);
        v62 = -32;
        do
        {
          LODWORD(v61) = 2 * v61;
          v63 = v62 + 1;
          if ((v61 & 0x80000000) != 0)
            break;
          v64 = v62 + 32;
          ++v62;
        }
        while (v64 < 0x1E);
        HEVC_RBSP::flush_bits(a1, v63 + 33);
        v65 = *(_DWORD *)(a1 + 108) >> -(char)v63;
        HEVC_RBSP::flush_bits(a1, v63 + 32);
        v66 = v65 + ~(-2 << (v63 + 31));
      }
      a2[148] = v66;
    }
    v67 = *(_QWORD *)(a1 + 104);
    if ((v67 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      v73 = 0;
      v74 = a2 + 149;
      a2[149] = 0;
    }
    else
    {
      v68 = HIDWORD(v67);
      v69 = -32;
      do
      {
        LODWORD(v68) = 2 * v68;
        v70 = v69 + 1;
        if ((v68 & 0x80000000) != 0)
          break;
        v71 = v69 + 32;
        ++v69;
      }
      while (v71 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v70 + 33);
      v72 = *(_DWORD *)(a1 + 108) >> -(char)v70;
      HEVC_RBSP::flush_bits(a1, v70 + 32);
      v73 = v72 + ~(-2 << (v70 + 31));
      a2[149] = v73;
      if (v73 >= 0x401)
      {
        syslog(3, "AppleD5500: ERROR: vps->vps_num_hrd_parameters > %d \n");
        goto LABEL_86;
      }
      v74 = a2 + 149;
    }
    v75 = malloc_type_malloc(2 * v73, 0x1000040BDFB0063uLL);
    *((_QWORD *)a2 + 75) = v75;
    if (!v75)
    {
      syslog(3, "AppleD5500: ERROR: vps->hrd_layer_set_idx bad alloc \n");
      goto LABEL_86;
    }
    v76 = malloc_type_malloc(a2[149], 0x100004077774924uLL);
    *((_QWORD *)a2 + 76) = v76;
    if (!v76)
    {
      syslog(3, "AppleD5500: ERROR: vps->cprms_present_flag bad alloc \n");
      goto LABEL_86;
    }
    v77 = malloc_type_calloc(0x98uLL, a2[149], 0x98D1961DuLL);
    *((_QWORD *)a2 + 77) = v77;
    if (!v77)
    {
      syslog(3, "AppleD5500: ERROR: vps->hrd_parameters bad alloc \n");
      goto LABEL_86;
    }
    if (*v74)
    {
      v78 = 0;
      do
      {
        v79 = *(_QWORD *)(a1 + 104);
        if ((v79 & 0x8000000000000000) != 0)
        {
          HEVC_RBSP::flush_bits(a1, 1);
          LOWORD(v85) = 0;
        }
        else
        {
          v80 = HIDWORD(v79);
          v81 = -32;
          do
          {
            LODWORD(v80) = 2 * v80;
            v82 = v81 + 1;
            if ((v80 & 0x80000000) != 0)
              break;
            v83 = v81 + 32;
            ++v81;
          }
          while (v83 < 0x1E);
          HEVC_RBSP::flush_bits(a1, v82 + 33);
          v84 = *(_DWORD *)(a1 + 108) >> -(char)v82;
          HEVC_RBSP::flush_bits(a1, v82 + 32);
          v85 = v84 + ~(-2 << (v82 + 31));
        }
        *(_WORD *)(*((_QWORD *)a2 + 75) + 2 * v78) = v85;
        if (v78)
        {
          v86 = *(_QWORD *)(a1 + 104) >> 63;
          HEVC_RBSP::flush_bits(a1, 1);
          *(_BYTE *)(*((_QWORD *)a2 + 76) + v78) = v86;
        }
        else
        {
          **((_BYTE **)a2 + 76) = 1;
        }
        if ((HEVC_RBSP::parseHRD((HEVC_RBSP *)a1, *((_QWORD *)a2 + 77) + 152 * v78, *(unsigned __int8 *)(*((_QWORD *)a2 + 76) + v78), a2[3]) & 1) == 0)goto LABEL_86;
      }
      while (++v78 < (unint64_t)*v74);
    }
  }
  v54 = *(_QWORD *)(a1 + 104);
  HEVC_RBSP::flush_bits(a1, 1);
  *((_BYTE *)a2 + 624) = v54 < 0;
  if (v54 < 0 && 8 * *(_DWORD *)(a1 + 148) - *(_DWORD *)(a1 + 152) >= 9)
  {
    do
    {
      v55 = *(_QWORD *)(a1 + 104) >> 63;
      HEVC_RBSP::flush_bits(a1, 1);
      *((_BYTE *)a2 + 625) = v55;
    }
    while (8 * *(_DWORD *)(a1 + 148) - *(_DWORD *)(a1 + 152) > 8);
  }
  v56 = 1;
  HEVC_RBSP::flush_bits(a1, 1);
  HEVC_RBSP::flush_bits(a1, *(_DWORD *)(a1 + 112) & 7);
  return v56;
}

void HEVCReleaseVPS(uint64_t a1)
{
  _QWORD *v2;
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;

  if (a1 && *(_DWORD *)a1 != -1)
  {
    if (*(_BYTE *)(a1 + 576))
    {
      v2 = *(_QWORD **)(a1 + 616);
      if (v2)
      {
        if (*(_DWORD *)(a1 + 596))
        {
          v3 = 0;
          do
          {
            v4 = 0;
            do
            {
              v5 = *(_QWORD *)(a1 + 616);
              v6 = *(_QWORD *)(v5 + 152 * v3 + 136);
              if (v6 && *(_BYTE *)(v5 + 152 * v3 + 1))
              {
                HEVCReleaseSubLayerHRD((void **)(v6 + 48 * v4), *(unsigned __int8 *)(v5 + 152 * v3 + 2));
                v5 = *(_QWORD *)(a1 + 616);
              }
              v7 = *(_QWORD *)(v5 + 152 * v3 + 128);
              if (v7 && *(_BYTE *)(v5 + 152 * v3))
                HEVCReleaseSubLayerHRD((void **)(v7 + 48 * v4), *(unsigned __int8 *)(v5 + 152 * v3 + 2));
              ++v4;
            }
            while (v4 <= *(_DWORD *)(a1 + 12));
            free(*(void **)(*(_QWORD *)(a1 + 616) + 152 * v3 + 128));
            v8 = *(_QWORD *)(a1 + 616) + 152 * v3;
            *(_QWORD *)(v8 + 128) = 0;
            free(*(void **)(v8 + 136));
            v2 = *(_QWORD **)(a1 + 616);
            v2[19 * v3++ + 17] = 0;
          }
          while (v3 < *(unsigned int *)(a1 + 596));
        }
        free(v2);
        *(_QWORD *)(a1 + 616) = 0;
      }
      free(*(void **)(a1 + 608));
      free(*(void **)(a1 + 600));
    }
    v9 = *(void **)(a1 + 568);
    if (v9)
    {
      if (*(_DWORD *)(a1 + 560))
      {
        v10 = 1;
        do
          free(*(void **)(*(_QWORD *)(a1 + 568) + 8 * v10++));
        while (v10 <= *(_DWORD *)(a1 + 560));
        v9 = *(void **)(a1 + 568);
      }
      free(v9);
      *(_QWORD *)(a1 + 568) = 0;
    }
  }
}

uint64_t HEVC_RBSP::parseProfileTierLevel(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
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
  _BYTE *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;

  v6 = *(_QWORD *)(a1 + 104) >> 62;
  HEVC_RBSP::flush_bits(a1, 2);
  *(_DWORD *)a2 = v6;
  v7 = *(_QWORD *)(a1 + 104) >> 63;
  HEVC_RBSP::flush_bits(a1, 1);
  *(_BYTE *)(a2 + 4) = v7;
  v8 = *(_QWORD *)(a1 + 104) >> 59;
  HEVC_RBSP::flush_bits(a1, 5);
  v9 = 0;
  *(_DWORD *)(a2 + 8) = v8;
  do
  {
    v10 = *(_QWORD *)(a1 + 104) >> 63;
    HEVC_RBSP::flush_bits(a1, 1);
    *(_BYTE *)(a2 + 12 + v9++) = v10;
  }
  while (v9 != 32);
  v11 = *(_QWORD *)(a1 + 104) >> 63;
  HEVC_RBSP::flush_bits(a1, 1);
  *(_BYTE *)(a2 + 44) = v11;
  v12 = *(_QWORD *)(a1 + 104) >> 63;
  HEVC_RBSP::flush_bits(a1, 1);
  *(_BYTE *)(a2 + 45) = v12;
  v13 = *(_QWORD *)(a1 + 104) >> 63;
  HEVC_RBSP::flush_bits(a1, 1);
  *(_BYTE *)(a2 + 46) = v13;
  v14 = *(_QWORD *)(a1 + 104) >> 63;
  HEVC_RBSP::flush_bits(a1, 1);
  *(_BYTE *)(a2 + 47) = v14;
  HEVC_RBSP::flush_bits(a1, 44);
  LODWORD(v14) = *(unsigned __int8 *)(a1 + 111);
  result = HEVC_RBSP::flush_bits(a1, 8);
  *(_DWORD *)(a2 + 52) = v14;
  if (a3)
  {
    v16 = a3;
    v17 = (_BYTE *)(a2 + 56);
    v18 = a3;
    do
    {
      v19 = *(_QWORD *)(a1 + 104) >> 63;
      HEVC_RBSP::flush_bits(a1, 1);
      *v17 = v19;
      v20 = *(_QWORD *)(a1 + 104) >> 63;
      result = HEVC_RBSP::flush_bits(a1, 1);
      v17[7] = v20;
      ++v17;
      --v18;
    }
    while (v18);
    if (a3 <= 7)
    {
      v21 = a3 - 8;
      do
        result = HEVC_RBSP::flush_bits(a1, 2);
      while (!__CFADD__(v21++, 1));
    }
    v23 = 0;
    v24 = a2 + 136;
    do
    {
      v25 = a2 + v23;
      if (*(_BYTE *)(a2 + v23 + 56))
      {
        v26 = *(_QWORD *)(a1 + 104) >> 62;
        HEVC_RBSP::flush_bits(a1, 2);
        v27 = a2 + 4 * v23;
        *(_DWORD *)(v27 + 72) = v26;
        v28 = *(_QWORD *)(a1 + 104) >> 63;
        HEVC_RBSP::flush_bits(a1, 1);
        *(_BYTE *)(v25 + 100) = v28;
        v29 = *(_QWORD *)(a1 + 104) >> 59;
        HEVC_RBSP::flush_bits(a1, 5);
        v30 = 0;
        *(_DWORD *)(v27 + 108) = v29;
        do
        {
          v31 = *(_QWORD *)(a1 + 104) >> 63;
          HEVC_RBSP::flush_bits(a1, 1);
          *(_BYTE *)(v24 + v30++) = v31;
        }
        while (v30 != 32);
        v32 = *(_QWORD *)(a1 + 104) >> 63;
        HEVC_RBSP::flush_bits(a1, 1);
        v33 = (_BYTE *)(a2 + v23);
        *(_BYTE *)(a2 + v23 + 360) = v32;
        v34 = *(_QWORD *)(a1 + 104) >> 63;
        HEVC_RBSP::flush_bits(a1, 1);
        v33[367] = v34;
        v35 = *(_QWORD *)(a1 + 104) >> 63;
        HEVC_RBSP::flush_bits(a1, 1);
        v33[374] = v35;
        v36 = *(_QWORD *)(a1 + 104) >> 63;
        HEVC_RBSP::flush_bits(a1, 1);
        v33[381] = v36;
        result = HEVC_RBSP::flush_bits(a1, 44);
      }
      if (*(_BYTE *)(v25 + 63))
      {
        v37 = *(unsigned __int8 *)(a1 + 111);
        result = HEVC_RBSP::flush_bits(a1, 8);
        *(_DWORD *)(a2 + 4 * v23 + 416) = v37;
      }
      ++v23;
      v24 += 32;
    }
    while (v23 != v16);
  }
  return result;
}

uint64_t HEVC_RBSP::ue_v(HEVC_RBSP *this)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  int v5;
  unsigned int v6;
  int v7;

  v2 = *((_QWORD *)this + 13);
  if ((v2 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    return 0;
  }
  else
  {
    v3 = HIDWORD(v2);
    v4 = -32;
    do
    {
      LODWORD(v3) = 2 * v3;
      v5 = v4 + 1;
      if ((v3 & 0x80000000) != 0)
        break;
      v6 = v4 + 32;
      ++v4;
    }
    while (v6 < 0x1E);
    HEVC_RBSP::flush_bits((uint64_t)this, v5 + 33);
    v7 = *((_DWORD *)this + 27) >> -(char)v5;
    HEVC_RBSP::flush_bits((uint64_t)this, v5 + 32);
    return (v7 + ~(-2 << (v5 + 31)));
  }
}

uint64_t HEVC_RBSP::parseHRD(HEVC_RBSP *this, uint64_t a2, int a3, unsigned int a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  int v30;
  int v31;
  unsigned int v32;
  int v33;
  int v34;
  unint64_t v35;
  unint64_t v36;
  int v37;
  int v38;
  unsigned int v39;
  int v40;
  unsigned int v41;
  uint64_t result;

  *(_QWORD *)(a2 + 144) = 0;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_QWORD *)(a2 + 32) = 0x1700000017;
  *(_DWORD *)(a2 + 40) = 23;
  if (!a3)
    goto LABEL_12;
  v7 = *((_QWORD *)this + 13) >> 63;
  HEVC_RBSP::flush_bits((uint64_t)this, 1);
  *(_BYTE *)a2 = v7;
  v8 = *((_QWORD *)this + 13);
  HEVC_RBSP::flush_bits((uint64_t)this, 1);
  *(_BYTE *)(a2 + 1) = v8 < 0;
  if (!*(_BYTE *)a2)
  {
    if ((v8 & 0x8000000000000000) == 0)
      goto LABEL_12;
    goto LABEL_6;
  }
  *(_BYTE *)(a2 + 149) = 1;
  if (v8 < 0)
LABEL_6:
    *(_BYTE *)(a2 + 150) = 1;
  *(_BYTE *)(a2 + 148) = 1;
  v9 = *((_QWORD *)this + 13);
  HEVC_RBSP::flush_bits((uint64_t)this, 1);
  *(_BYTE *)(a2 + 2) = v9 < 0;
  if (v9 < 0)
  {
    v10 = *((unsigned __int8 *)this + 111);
    HEVC_RBSP::flush_bits((uint64_t)this, 8);
    *(_DWORD *)(a2 + 4) = v10;
    v11 = *((_QWORD *)this + 13) >> 59;
    HEVC_RBSP::flush_bits((uint64_t)this, 5);
    *(_DWORD *)(a2 + 8) = v11;
    v12 = *((_QWORD *)this + 13) >> 63;
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    *(_BYTE *)(a2 + 12) = v12;
    v13 = *((_QWORD *)this + 13) >> 59;
    HEVC_RBSP::flush_bits((uint64_t)this, 5);
    *(_DWORD *)(a2 + 16) = v13;
  }
  v14 = *((_QWORD *)this + 13) >> 60;
  HEVC_RBSP::flush_bits((uint64_t)this, 4);
  *(_DWORD *)(a2 + 20) = v14;
  v15 = *((_QWORD *)this + 13) >> 60;
  HEVC_RBSP::flush_bits((uint64_t)this, 4);
  *(_DWORD *)(a2 + 24) = v15;
  if (*(_BYTE *)(a2 + 2))
  {
    v16 = *((_QWORD *)this + 13) >> 60;
    HEVC_RBSP::flush_bits((uint64_t)this, 4);
    *(_DWORD *)(a2 + 28) = v16;
  }
  v17 = *((_QWORD *)this + 13) >> 59;
  HEVC_RBSP::flush_bits((uint64_t)this, 5);
  *(_DWORD *)(a2 + 32) = v17;
  v18 = *((_QWORD *)this + 13) >> 59;
  HEVC_RBSP::flush_bits((uint64_t)this, 5);
  *(_DWORD *)(a2 + 36) = v18;
  v19 = *((_QWORD *)this + 13) >> 59;
  HEVC_RBSP::flush_bits((uint64_t)this, 5);
  *(_DWORD *)(a2 + 40) = v19;
LABEL_12:
  v20 = malloc_type_calloc(0x30uLL, a4 + 1, 0x95B8252FuLL);
  *(_QWORD *)(a2 + 128) = v20;
  if (v20)
  {
    v21 = malloc_type_calloc(0x30uLL, a4 + 1, 0xAB8C50A4uLL);
    *(_QWORD *)(a2 + 136) = v21;
    if (v21)
    {
      v22 = 0;
      *(_DWORD *)(a2 + 144) = a4 + 1;
      while (1)
      {
        v23 = *((_QWORD *)this + 13);
        HEVC_RBSP::flush_bits((uint64_t)this, 1);
        v24 = v22;
        *(_BYTE *)(a2 + v22 + 44) = v23 < 0;
        if (v23 < 0)
        {
          *(_BYTE *)(a2 + v22 + 51) = 1;
        }
        else
        {
          v25 = *((_QWORD *)this + 13);
          HEVC_RBSP::flush_bits((uint64_t)this, 1);
          *(_BYTE *)(a2 + v24 + 51) = v25 < 0;
          if ((v25 & 0x8000000000000000) == 0)
          {
            v26 = *((_QWORD *)this + 13) >> 63;
            HEVC_RBSP::flush_bits((uint64_t)this, 1);
            *(_BYTE *)(a2 + v24 + 88) = v26;
            if (!(_DWORD)v26)
              goto LABEL_27;
            goto LABEL_34;
          }
        }
        v28 = *((_QWORD *)this + 13);
        if ((v28 & 0x8000000000000000) != 0)
        {
          HEVC_RBSP::flush_bits((uint64_t)this, 1);
          v34 = 0;
        }
        else
        {
          v29 = HIDWORD(v28);
          v30 = -32;
          do
          {
            LODWORD(v29) = 2 * v29;
            v31 = v30 + 1;
            if ((v29 & 0x80000000) != 0)
              break;
            v32 = v30 + 32;
            ++v30;
          }
          while (v32 < 0x1E);
          HEVC_RBSP::flush_bits((uint64_t)this, v31 + 33);
          v33 = *((_DWORD *)this + 27) >> -(char)v31;
          HEVC_RBSP::flush_bits((uint64_t)this, v31 + 32);
          v34 = v33 + ~(-2 << (v31 + 31));
        }
        *(_DWORD *)(a2 + 4 * v24 + 60) = v34;
        if (!*(_BYTE *)(a2 + v24 + 88))
        {
LABEL_27:
          v35 = *((_QWORD *)this + 13);
          if ((v35 & 0x8000000000000000) != 0)
          {
            HEVC_RBSP::flush_bits((uint64_t)this, 1);
            *(_DWORD *)(a2 + 4 * v24 + 96) = 0;
          }
          else
          {
            v36 = HIDWORD(v35);
            v37 = -32;
            do
            {
              LODWORD(v36) = 2 * v36;
              v38 = v37 + 1;
              if ((v36 & 0x80000000) != 0)
                break;
              v39 = v37 + 32;
              ++v37;
            }
            while (v39 < 0x1E);
            HEVC_RBSP::flush_bits((uint64_t)this, v38 + 33);
            v40 = *((_DWORD *)this + 27) >> -(char)v38;
            HEVC_RBSP::flush_bits((uint64_t)this, v38 + 32);
            v41 = v40 + ~(-2 << (v38 + 31));
            *(_DWORD *)(a2 + 4 * v24 + 96) = v41;
            if (v41 >= 0x20)
            {
              syslog(3, "AppleD5500: hrd->cpb_cnt_minus1[i] > 31, is %d");
              return 0;
            }
          }
        }
LABEL_34:
        if (*(_BYTE *)a2)
        {
          result = HEVC_RBSP::parseSubLayerHRD((uint64_t)this, *(_QWORD *)(a2 + 128) + 48 * v24, v27, *(_DWORD *)(a2 + 4 * v24 + 96), *(unsigned __int8 *)(a2 + 2));
          if (!(_DWORD)result)
            return result;
        }
        if (*(_BYTE *)(a2 + 1))
        {
          result = HEVC_RBSP::parseSubLayerHRD((uint64_t)this, *(_QWORD *)(a2 + 136) + 48 * v24, v27, *(_DWORD *)(a2 + 4 * v24 + 96), *(unsigned __int8 *)(a2 + 2));
          if (!(_DWORD)result)
            return result;
        }
        v22 = v24 + 1;
        if ((int)v24 + 1 > a4)
          return 1;
      }
    }
    syslog(3, "AppleD5500: ERROR: hrd->vcl_sub_layer_hrd_parameters bad alloc \n");
  }
  else
  {
    syslog(3, "AppleD5500: ERROR: hrd->nal_sub_layer_hrd_parameters bad alloc \n");
  }
  return 0;
}

uint64_t HEVC_RBSP::parseSubLayerHRD(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  size_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  int v22;
  unsigned int v23;
  int v24;
  int v25;
  unint64_t v26;
  unint64_t v27;
  int v28;
  int v29;
  unsigned int v30;
  int v31;
  int v32;
  unint64_t v33;
  unint64_t v34;
  int v35;
  int v36;
  unsigned int v37;
  int v38;
  int v39;
  unint64_t v40;
  unint64_t v41;
  int v42;
  int v43;
  unsigned int v44;
  int v45;
  int v46;
  uint64_t v47;

  result = 0;
  v7 = a4 + 1;
  v8 = v7 << 31 >> 31;
  if (v8 != v7 || v8 < 0)
    return result;
  v12 = v8 & 0x1FFFFFFFFLL;
  v13 = malloc_type_calloc(4uLL, v8 & 0x1FFFFFFFFLL, 0xC571B087uLL);
  *(_QWORD *)a2 = v13;
  if (!v13)
  {
    syslog(3, "AppleD5500: ERROR: sub_hrd->bit_rate_value_minus1 bad alloc \n");
    return 0;
  }
  v14 = malloc_type_calloc(4uLL, v12, 0x4ABE2260uLL);
  *(_QWORD *)(a2 + 8) = v14;
  if (!v14)
  {
    syslog(3, "AppleD5500: ERROR: sub_hrd->cpb_size_value_minus1 bad alloc \n");
    return 0;
  }
  v15 = malloc_type_calloc(1uLL, v12, 0x1F1A2B8CuLL);
  *(_QWORD *)(a2 + 32) = v15;
  if (!v15)
  {
    syslog(3, "AppleD5500: ERROR: sub_hrd->cbr_flag bad alloc \n");
    return 0;
  }
  if (!a5)
    goto LABEL_9;
  v16 = malloc_type_calloc(4uLL, v12, 0x7EACD429uLL);
  *(_QWORD *)(a2 + 16) = v16;
  if (!v16)
  {
    syslog(3, "AppleD5500: ERROR: sub_hrd->cpb_size_du_value_minus1 bad alloc \n");
    return 0;
  }
  v17 = malloc_type_calloc(4uLL, v12, 0x7628267EuLL);
  *(_QWORD *)(a2 + 24) = v17;
  if (!v17)
  {
    syslog(3, "AppleD5500: ERROR: sub_hrd->bit_rate_du_value_minus1 bad alloc \n");
    return 0;
  }
LABEL_9:
  v18 = 0;
  do
  {
    v19 = *(_QWORD *)(a1 + 104);
    if ((v19 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      v25 = 0;
    }
    else
    {
      v20 = HIDWORD(v19);
      v21 = -32;
      do
      {
        LODWORD(v20) = 2 * v20;
        v22 = v21 + 1;
        if ((v20 & 0x80000000) != 0)
          break;
        v23 = v21 + 32;
        ++v21;
      }
      while (v23 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v22 + 33);
      v24 = *(_DWORD *)(a1 + 108) >> -(char)v22;
      HEVC_RBSP::flush_bits(a1, v22 + 32);
      v25 = v24 + ~(-2 << (v22 + 31));
    }
    *(_DWORD *)(*(_QWORD *)a2 + 4 * v18) = v25;
    v26 = *(_QWORD *)(a1 + 104);
    if ((v26 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      v32 = 0;
    }
    else
    {
      v27 = HIDWORD(v26);
      v28 = -32;
      do
      {
        LODWORD(v27) = 2 * v27;
        v29 = v28 + 1;
        if ((v27 & 0x80000000) != 0)
          break;
        v30 = v28 + 32;
        ++v28;
      }
      while (v30 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v29 + 33);
      v31 = *(_DWORD *)(a1 + 108) >> -(char)v29;
      HEVC_RBSP::flush_bits(a1, v29 + 32);
      v32 = v31 + ~(-2 << (v29 + 31));
    }
    *(_DWORD *)(*(_QWORD *)(a2 + 8) + 4 * v18) = v32;
    if (a5)
    {
      v33 = *(_QWORD *)(a1 + 104);
      if ((v33 & 0x8000000000000000) != 0)
      {
        HEVC_RBSP::flush_bits(a1, 1);
        v39 = 0;
      }
      else
      {
        v34 = HIDWORD(v33);
        v35 = -32;
        do
        {
          LODWORD(v34) = 2 * v34;
          v36 = v35 + 1;
          if ((v34 & 0x80000000) != 0)
            break;
          v37 = v35 + 32;
          ++v35;
        }
        while (v37 < 0x1E);
        HEVC_RBSP::flush_bits(a1, v36 + 33);
        v38 = *(_DWORD *)(a1 + 108) >> -(char)v36;
        HEVC_RBSP::flush_bits(a1, v36 + 32);
        v39 = v38 + ~(-2 << (v36 + 31));
      }
      *(_DWORD *)(*(_QWORD *)(a2 + 16) + 4 * v18) = v39;
      v40 = *(_QWORD *)(a1 + 104);
      if ((v40 & 0x8000000000000000) != 0)
      {
        HEVC_RBSP::flush_bits(a1, 1);
        v46 = 0;
      }
      else
      {
        v41 = HIDWORD(v40);
        v42 = -32;
        do
        {
          LODWORD(v41) = 2 * v41;
          v43 = v42 + 1;
          if ((v41 & 0x80000000) != 0)
            break;
          v44 = v42 + 32;
          ++v42;
        }
        while (v44 < 0x1E);
        HEVC_RBSP::flush_bits(a1, v43 + 33);
        v45 = *(_DWORD *)(a1 + 108) >> -(char)v43;
        HEVC_RBSP::flush_bits(a1, v43 + 32);
        v46 = v45 + ~(-2 << (v43 + 31));
      }
      *(_DWORD *)(*(_QWORD *)(a2 + 24) + 4 * v18) = v46;
    }
    v47 = *(_QWORD *)(a1 + 104) >> 63;
    HEVC_RBSP::flush_bits(a1, 1);
    *(_BYTE *)(*(_QWORD *)(a2 + 32) + v18++) = v47;
  }
  while (v18 <= a4);
  *(_DWORD *)(a2 + 40) = v7;
  return 1;
}

uint64_t HEVC_RBSP::parseSPS(uint64_t a1, _DWORD *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  int v10;
  unsigned int v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  int v17;
  unsigned int v18;
  int v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int v24;
  int v25;
  unsigned int v26;
  int v27;
  int v28;
  unint64_t v29;
  unint64_t v30;
  int v31;
  int v32;
  unsigned int v33;
  int v34;
  unsigned int v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  int v39;
  int v40;
  unsigned int v41;
  int v42;
  int v43;
  unint64_t v45;
  unint64_t v46;
  int v47;
  int v48;
  unsigned int v49;
  int v50;
  int v51;
  unint64_t v52;
  unint64_t v53;
  int v54;
  int v55;
  unsigned int v56;
  int v57;
  int v58;
  unint64_t v59;
  unint64_t v60;
  int v61;
  int v62;
  unsigned int v63;
  int v64;
  int v65;
  unint64_t v66;
  unint64_t v67;
  int v68;
  int v69;
  unsigned int v70;
  int v71;
  int v72;
  unint64_t v73;
  unint64_t v74;
  int v75;
  int v76;
  unsigned int v77;
  int v78;
  int v79;
  unint64_t v80;
  unint64_t v81;
  int v82;
  int v83;
  unsigned int v84;
  int v85;
  int v86;
  uint64_t v87;
  unsigned int v88;
  unint64_t v89;
  unint64_t v90;
  int v91;
  int v92;
  unsigned int v93;
  int v94;
  int v95;
  unint64_t v96;
  unint64_t v97;
  int v98;
  int v99;
  unsigned int v100;
  int v101;
  int v102;
  _DWORD *v103;
  unint64_t v104;
  _DWORD *v105;
  unint64_t v106;
  int v107;
  int v108;
  unsigned int v109;
  int v110;
  _DWORD *v111;
  int v112;
  uint64_t v113;
  _DWORD *v114;
  _DWORD *v115;
  _DWORD *v116;
  _DWORD *v117;
  _DWORD *v118;
  unint64_t v119;
  unint64_t v120;
  int v121;
  int v122;
  unsigned int v123;
  int v124;
  int v125;
  unint64_t v126;
  unint64_t v127;
  int v128;
  int v129;
  unsigned int v130;
  int v131;
  int v132;
  unint64_t v133;
  unint64_t v134;
  int v135;
  int v136;
  unsigned int v137;
  int v138;
  int v139;
  unint64_t v140;
  unint64_t v141;
  int v142;
  int v143;
  unsigned int v144;
  int v145;
  int v146;
  unint64_t v147;
  unint64_t v148;
  int v149;
  int v150;
  unsigned int v151;
  int v152;
  int v153;
  unint64_t v154;
  unint64_t v155;
  int v156;
  int v157;
  unsigned int v158;
  int v159;
  int v160;
  uint64_t v161;
  uint64_t v162;
  _DWORD *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  unint64_t v169;
  unint64_t v170;
  int v171;
  int v172;
  unsigned int v173;
  int v174;
  int v175;
  unint64_t v176;
  unint64_t v177;
  int v178;
  int v179;
  unsigned int v180;
  int v181;
  int v182;
  uint64_t v183;
  unint64_t v184;
  unint64_t v185;
  int v186;
  int v187;
  unsigned int v188;
  int v189;
  unsigned int v190;
  unsigned int v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  unsigned int v198;
  unsigned int v199;
  unsigned int v200;
  int v201;
  int v202;
  unsigned int v203;
  unsigned int v204;
  int v205;
  unsigned int v206;
  unsigned int v207;
  unsigned int v208;
  unsigned int v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  unint64_t v215;
  int v216;
  int v217;
  char v218;
  int v219;
  uint64_t v220;
  _OWORD __src[28];
  uint64_t v222;

  v222 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 104);
  HEVC_RBSP::flush_bits(a1, 4);
  v5 = *(_QWORD *)(a1 + 104) >> 61;
  HEVC_RBSP::flush_bits(a1, 3);
  v6 = *(_QWORD *)(a1 + 104);
  HEVC_RBSP::flush_bits(a1, 1);
  memset(__src, 0, 444);
  HEVC_RBSP::parseProfileTierLevel(a1, (uint64_t)__src, v5);
  v7 = *(_QWORD *)(a1 + 104);
  if ((v7 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits(a1, 1);
    v13 = 0;
  }
  else
  {
    v8 = HIDWORD(v7);
    v9 = -32;
    do
    {
      LODWORD(v8) = 2 * v8;
      v10 = v9 + 1;
      if ((v8 & 0x80000000) != 0)
        break;
      v11 = v9 + 32;
      ++v9;
    }
    while (v11 < 0x1E);
    HEVC_RBSP::flush_bits(a1, v10 + 33);
    v12 = *(_DWORD *)(a1 + 108) >> -(char)v10;
    HEVC_RBSP::flush_bits(a1, v10 + 32);
    v13 = (v12 + ~(-2 << (v10 + 31)));
    if (v13 >= 0x10)
    {
      syslog(3, "AppleD5500: %s out of range SPS id", "int32_t HEVC_RBSP::parseSPS(hevc_sequence_parameter_set_t *)");
      return 0xFFFFFFFFLL;
    }
  }
  HEVCReleaseSPS((uint64_t)a2);
  bzero(a2, 0x4898uLL);
  memcpy(a2 + 3, __src, 0x1BCuLL);
  if ((_DWORD)v5 == 7)
  {
    syslog(3, "AppleD5500: sps_max_sub_layers_minus1 > 6, is %d");
LABEL_39:
    HEVCReleaseSPS((uint64_t)a2);
    v13 = 0xFFFFFFFFLL;
    a2[114] = -1;
    return v13;
  }
  *a2 = v4 >> 60;
  a2[1] = v5;
  *((_BYTE *)a2 + 8) = v6 < 0;
  a2[114] = v13;
  v14 = *(_QWORD *)(a1 + 104);
  if ((v14 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits(a1, 1);
    a2[115] = 0;
  }
  else
  {
    v15 = HIDWORD(v14);
    v16 = -32;
    do
    {
      LODWORD(v15) = 2 * v15;
      v17 = v16 + 1;
      if ((v15 & 0x80000000) != 0)
        break;
      v18 = v16 + 32;
      ++v16;
    }
    while (v18 < 0x1E);
    HEVC_RBSP::flush_bits(a1, v17 + 33);
    v19 = *(_DWORD *)(a1 + 108) >> -(char)v17;
    HEVC_RBSP::flush_bits(a1, v17 + 32);
    v20 = v19 + ~(-2 << (v17 + 31));
    a2[115] = v20;
    if (v20 == 3)
    {
      v21 = *(_QWORD *)(a1 + 104) >> 63;
      HEVC_RBSP::flush_bits(a1, 1);
      *((_BYTE *)a2 + 464) = v21;
    }
  }
  v22 = *(_QWORD *)(a1 + 104);
  if ((v22 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits(a1, 1);
    v28 = 0;
  }
  else
  {
    v23 = HIDWORD(v22);
    v24 = -32;
    do
    {
      LODWORD(v23) = 2 * v23;
      v25 = v24 + 1;
      if ((v23 & 0x80000000) != 0)
        break;
      v26 = v24 + 32;
      ++v24;
    }
    while (v26 < 0x1E);
    HEVC_RBSP::flush_bits(a1, v25 + 33);
    v27 = *(_DWORD *)(a1 + 108) >> -(char)v25;
    HEVC_RBSP::flush_bits(a1, v25 + 32);
    v28 = v27 + ~(-2 << (v25 + 31));
  }
  a2[117] = v28;
  v29 = *(_QWORD *)(a1 + 104);
  if ((v29 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits(a1, 1);
    v35 = 0;
  }
  else
  {
    v30 = HIDWORD(v29);
    v31 = -32;
    do
    {
      LODWORD(v30) = 2 * v30;
      v32 = v31 + 1;
      if ((v30 & 0x80000000) != 0)
        break;
      v33 = v31 + 32;
      ++v31;
    }
    while (v33 < 0x1E);
    HEVC_RBSP::flush_bits(a1, v32 + 33);
    v34 = *(_DWORD *)(a1 + 108) >> -(char)v32;
    HEVC_RBSP::flush_bits(a1, v32 + 32);
    v35 = v34 + ~(-2 << (v32 + 31));
  }
  a2[118] = v35;
  if (a2[117] > 0x2000u || v35 > 0x2000)
  {
    syslog(3, "AppleD5500: Unsupported sps->pic_width_in_luma_samples:%d or sps->pic_height_in_luma_samples:%d\n");
    goto LABEL_39;
  }
  v36 = *(_QWORD *)(a1 + 104);
  HEVC_RBSP::flush_bits(a1, 1);
  *((_BYTE *)a2 + 476) = v36 < 0;
  if (v36 < 0)
  {
    v37 = *(_QWORD *)(a1 + 104);
    if ((v37 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      v43 = 0;
    }
    else
    {
      v38 = HIDWORD(v37);
      v39 = -32;
      do
      {
        LODWORD(v38) = 2 * v38;
        v40 = v39 + 1;
        if ((v38 & 0x80000000) != 0)
          break;
        v41 = v39 + 32;
        ++v39;
      }
      while (v41 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v40 + 33);
      v42 = *(_DWORD *)(a1 + 108) >> -(char)v40;
      HEVC_RBSP::flush_bits(a1, v40 + 32);
      v43 = v42 + ~(-2 << (v40 + 31));
    }
    a2[120] = v43;
    v45 = *(_QWORD *)(a1 + 104);
    if ((v45 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      v51 = 0;
    }
    else
    {
      v46 = HIDWORD(v45);
      v47 = -32;
      do
      {
        LODWORD(v46) = 2 * v46;
        v48 = v47 + 1;
        if ((v46 & 0x80000000) != 0)
          break;
        v49 = v47 + 32;
        ++v47;
      }
      while (v49 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v48 + 33);
      v50 = *(_DWORD *)(a1 + 108) >> -(char)v48;
      HEVC_RBSP::flush_bits(a1, v48 + 32);
      v51 = v50 + ~(-2 << (v48 + 31));
    }
    a2[121] = v51;
    v52 = *(_QWORD *)(a1 + 104);
    if ((v52 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      v58 = 0;
    }
    else
    {
      v53 = HIDWORD(v52);
      v54 = -32;
      do
      {
        LODWORD(v53) = 2 * v53;
        v55 = v54 + 1;
        if ((v53 & 0x80000000) != 0)
          break;
        v56 = v54 + 32;
        ++v54;
      }
      while (v56 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v55 + 33);
      v57 = *(_DWORD *)(a1 + 108) >> -(char)v55;
      HEVC_RBSP::flush_bits(a1, v55 + 32);
      v58 = v57 + ~(-2 << (v55 + 31));
    }
    a2[122] = v58;
    v59 = *(_QWORD *)(a1 + 104);
    if ((v59 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      v65 = 0;
    }
    else
    {
      v60 = HIDWORD(v59);
      v61 = -32;
      do
      {
        LODWORD(v60) = 2 * v60;
        v62 = v61 + 1;
        if ((v60 & 0x80000000) != 0)
          break;
        v63 = v61 + 32;
        ++v61;
      }
      while (v63 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v62 + 33);
      v64 = *(_DWORD *)(a1 + 108) >> -(char)v62;
      HEVC_RBSP::flush_bits(a1, v62 + 32);
      v65 = v64 + ~(-2 << (v62 + 31));
    }
    a2[123] = v65;
  }
  v66 = *(_QWORD *)(a1 + 104);
  if ((v66 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits(a1, 1);
    v72 = 0;
  }
  else
  {
    v67 = HIDWORD(v66);
    v68 = -32;
    do
    {
      LODWORD(v67) = 2 * v67;
      v69 = v68 + 1;
      if ((v67 & 0x80000000) != 0)
        break;
      v70 = v68 + 32;
      ++v68;
    }
    while (v70 < 0x1E);
    HEVC_RBSP::flush_bits(a1, v69 + 33);
    v71 = *(_DWORD *)(a1 + 108) >> -(char)v69;
    HEVC_RBSP::flush_bits(a1, v69 + 32);
    v72 = v71 + ~(-2 << (v69 + 31));
  }
  a2[124] = v72;
  v73 = *(_QWORD *)(a1 + 104);
  if ((v73 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits(a1, 1);
    v79 = 0;
  }
  else
  {
    v74 = HIDWORD(v73);
    v75 = -32;
    do
    {
      LODWORD(v74) = 2 * v74;
      v76 = v75 + 1;
      if ((v74 & 0x80000000) != 0)
        break;
      v77 = v75 + 32;
      ++v75;
    }
    while (v77 < 0x1E);
    HEVC_RBSP::flush_bits(a1, v76 + 33);
    v78 = *(_DWORD *)(a1 + 108) >> -(char)v76;
    HEVC_RBSP::flush_bits(a1, v76 + 32);
    v79 = v78 + ~(-2 << (v76 + 31));
  }
  a2[125] = v79;
  v80 = *(_QWORD *)(a1 + 104);
  if ((v80 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits(a1, 1);
    v86 = 0;
  }
  else
  {
    v81 = HIDWORD(v80);
    v82 = -32;
    do
    {
      LODWORD(v81) = 2 * v81;
      v83 = v82 + 1;
      if ((v81 & 0x80000000) != 0)
        break;
      v84 = v82 + 32;
      ++v82;
    }
    while (v84 < 0x1E);
    HEVC_RBSP::flush_bits(a1, v83 + 33);
    v85 = *(_DWORD *)(a1 + 108) >> -(char)v83;
    HEVC_RBSP::flush_bits(a1, v83 + 32);
    v86 = v85 + ~(-2 << (v83 + 31));
  }
  a2[126] = v86;
  v87 = *(_QWORD *)(a1 + 104);
  HEVC_RBSP::flush_bits(a1, 1);
  *((_BYTE *)a2 + 508) = v87 < 0;
  if (v87 < 0)
    v88 = 0;
  else
    v88 = a2[1];
  do
  {
    v89 = *(_QWORD *)(a1 + 104);
    if ((v89 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      v95 = 0;
    }
    else
    {
      v90 = HIDWORD(v89);
      v91 = -32;
      do
      {
        LODWORD(v90) = 2 * v90;
        v92 = v91 + 1;
        if ((v90 & 0x80000000) != 0)
          break;
        v93 = v91 + 32;
        ++v91;
      }
      while (v93 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v92 + 33);
      v94 = *(_DWORD *)(a1 + 108) >> -(char)v92;
      HEVC_RBSP::flush_bits(a1, v92 + 32);
      v95 = v94 + ~(-2 << (v92 + 31));
    }
    a2[v88 + 128] = v95;
    v96 = *(_QWORD *)(a1 + 104);
    if ((v96 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      v102 = 0;
    }
    else
    {
      v97 = HIDWORD(v96);
      v98 = -32;
      do
      {
        LODWORD(v97) = 2 * v97;
        v99 = v98 + 1;
        if ((v97 & 0x80000000) != 0)
          break;
        v100 = v98 + 32;
        ++v98;
      }
      while (v100 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v99 + 33);
      v101 = *(_DWORD *)(a1 + 108) >> -(char)v99;
      HEVC_RBSP::flush_bits(a1, v99 + 32);
      v102 = v101 + ~(-2 << (v99 + 31));
    }
    v103 = &a2[v88];
    v103[135] = v102;
    v104 = *(_QWORD *)(a1 + 104);
    if ((v104 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      v103[142] = 0;
    }
    else
    {
      v105 = v103 + 135;
      v106 = HIDWORD(v104);
      v107 = -32;
      do
      {
        LODWORD(v106) = 2 * v106;
        v108 = v107 + 1;
        if ((v106 & 0x80000000) != 0)
          break;
        v109 = v107 + 32;
        ++v107;
      }
      while (v109 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v108 + 33);
      v110 = *(_DWORD *)(a1 + 108) >> -(char)v108;
      HEVC_RBSP::flush_bits(a1, v108 + 32);
      v111 = &a2[v88];
      v112 = v110 + ~(-2 << (v108 + 31));
      v111[142] = v112;
      if (v112)
        v111[4638] = v112 + *v105 - 1;
    }
    ++v88;
    v113 = a2[1];
  }
  while (v88 <= v113);
  if (!*((_BYTE *)a2 + 508) && (_DWORD)v113)
  {
    v114 = a2 + 128;
    v115 = &a2[v113 + 128];
    v116 = &a2[v113];
    v117 = v116 + 135;
    v118 = v116 + 142;
    do
    {
      *v114 = *v115;
      v114[7] = *v117;
      v114[14] = *v118;
      ++v114;
      --v113;
    }
    while (v113);
  }
  v119 = *(_QWORD *)(a1 + 104);
  if ((v119 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits(a1, 1);
    v125 = 0;
  }
  else
  {
    v120 = HIDWORD(v119);
    v121 = -32;
    do
    {
      LODWORD(v120) = 2 * v120;
      v122 = v121 + 1;
      if ((v120 & 0x80000000) != 0)
        break;
      v123 = v121 + 32;
      ++v121;
    }
    while (v123 < 0x1E);
    HEVC_RBSP::flush_bits(a1, v122 + 33);
    v124 = *(_DWORD *)(a1 + 108) >> -(char)v122;
    HEVC_RBSP::flush_bits(a1, v122 + 32);
    v125 = v124 + ~(-2 << (v122 + 31));
  }
  a2[149] = v125;
  v126 = *(_QWORD *)(a1 + 104);
  if ((v126 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits(a1, 1);
    v132 = 0;
  }
  else
  {
    v127 = HIDWORD(v126);
    v128 = -32;
    do
    {
      LODWORD(v127) = 2 * v127;
      v129 = v128 + 1;
      if ((v127 & 0x80000000) != 0)
        break;
      v130 = v128 + 32;
      ++v128;
    }
    while (v130 < 0x1E);
    HEVC_RBSP::flush_bits(a1, v129 + 33);
    v131 = *(_DWORD *)(a1 + 108) >> -(char)v129;
    HEVC_RBSP::flush_bits(a1, v129 + 32);
    v132 = v131 + ~(-2 << (v129 + 31));
  }
  a2[150] = v132;
  v133 = *(_QWORD *)(a1 + 104);
  if ((v133 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits(a1, 1);
    v139 = 0;
  }
  else
  {
    v134 = HIDWORD(v133);
    v135 = -32;
    do
    {
      LODWORD(v134) = 2 * v134;
      v136 = v135 + 1;
      if ((v134 & 0x80000000) != 0)
        break;
      v137 = v135 + 32;
      ++v135;
    }
    while (v137 < 0x1E);
    HEVC_RBSP::flush_bits(a1, v136 + 33);
    v138 = *(_DWORD *)(a1 + 108) >> -(char)v136;
    HEVC_RBSP::flush_bits(a1, v136 + 32);
    v139 = v138 + ~(-2 << (v136 + 31));
  }
  a2[151] = v139;
  v140 = *(_QWORD *)(a1 + 104);
  if ((v140 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits(a1, 1);
    v146 = 0;
  }
  else
  {
    v141 = HIDWORD(v140);
    v142 = -32;
    do
    {
      LODWORD(v141) = 2 * v141;
      v143 = v142 + 1;
      if ((v141 & 0x80000000) != 0)
        break;
      v144 = v142 + 32;
      ++v142;
    }
    while (v144 < 0x1E);
    HEVC_RBSP::flush_bits(a1, v143 + 33);
    v145 = *(_DWORD *)(a1 + 108) >> -(char)v143;
    HEVC_RBSP::flush_bits(a1, v143 + 32);
    v146 = v145 + ~(-2 << (v143 + 31));
  }
  a2[152] = v146;
  v147 = *(_QWORD *)(a1 + 104);
  if ((v147 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits(a1, 1);
    v153 = 0;
  }
  else
  {
    v148 = HIDWORD(v147);
    v149 = -32;
    do
    {
      LODWORD(v148) = 2 * v148;
      v150 = v149 + 1;
      if ((v148 & 0x80000000) != 0)
        break;
      v151 = v149 + 32;
      ++v149;
    }
    while (v151 < 0x1E);
    HEVC_RBSP::flush_bits(a1, v150 + 33);
    v152 = *(_DWORD *)(a1 + 108) >> -(char)v150;
    HEVC_RBSP::flush_bits(a1, v150 + 32);
    v153 = v152 + ~(-2 << (v150 + 31));
  }
  a2[153] = v153;
  v154 = *(_QWORD *)(a1 + 104);
  if ((v154 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits(a1, 1);
    v160 = 0;
  }
  else
  {
    v155 = HIDWORD(v154);
    v156 = -32;
    do
    {
      LODWORD(v155) = 2 * v155;
      v157 = v156 + 1;
      if ((v155 & 0x80000000) != 0)
        break;
      v158 = v156 + 32;
      ++v156;
    }
    while (v158 < 0x1E);
    HEVC_RBSP::flush_bits(a1, v157 + 33);
    v159 = *(_DWORD *)(a1 + 108) >> -(char)v157;
    HEVC_RBSP::flush_bits(a1, v157 + 32);
    v160 = v159 + ~(-2 << (v157 + 31));
  }
  a2[154] = v160;
  v161 = *(_QWORD *)(a1 + 104);
  HEVC_RBSP::flush_bits(a1, 1);
  *((_BYTE *)a2 + 620) = v161 < 0;
  if (v161 < 0)
  {
    v162 = *(_QWORD *)(a1 + 104);
    HEVC_RBSP::flush_bits(a1, 1);
    *((_BYTE *)a2 + 621) = v162 < 0;
    v163 = a2 + 156;
    if (v162 < 0)
    {
      if ((HEVC_RBSP::parseScalingListData((HEVC_RBSP *)a1, v163) & 1) == 0)
        return 0xFFFFFFFFLL;
    }
    else
    {
      HEVC_RBSP::setDefaultScalingListData(a1, (uint64_t)v163);
    }
  }
  v164 = *(_QWORD *)(a1 + 104) >> 63;
  HEVC_RBSP::flush_bits(a1, 1);
  *((_BYTE *)a2 + 6816) = v164;
  v165 = *(_QWORD *)(a1 + 104) >> 63;
  HEVC_RBSP::flush_bits(a1, 1);
  *((_BYTE *)a2 + 6817) = v165;
  v166 = *(_QWORD *)(a1 + 104);
  HEVC_RBSP::flush_bits(a1, 1);
  *((_BYTE *)a2 + 6818) = v166 < 0;
  if (v166 < 0)
  {
    v167 = *(_QWORD *)(a1 + 104) >> 60;
    HEVC_RBSP::flush_bits(a1, 4);
    a2[1705] = v167;
    v168 = *(_QWORD *)(a1 + 104) >> 60;
    HEVC_RBSP::flush_bits(a1, 4);
    a2[1706] = v168;
    v169 = *(_QWORD *)(a1 + 104);
    if ((v169 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      v175 = 0;
    }
    else
    {
      v170 = HIDWORD(v169);
      v171 = -32;
      do
      {
        LODWORD(v170) = 2 * v170;
        v172 = v171 + 1;
        if ((v170 & 0x80000000) != 0)
          break;
        v173 = v171 + 32;
        ++v171;
      }
      while (v173 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v172 + 33);
      v174 = *(_DWORD *)(a1 + 108) >> -(char)v172;
      HEVC_RBSP::flush_bits(a1, v172 + 32);
      v175 = v174 + ~(-2 << (v172 + 31));
    }
    a2[1707] = v175;
    v176 = *(_QWORD *)(a1 + 104);
    if ((v176 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      v182 = 0;
    }
    else
    {
      v177 = HIDWORD(v176);
      v178 = -32;
      do
      {
        LODWORD(v177) = 2 * v177;
        v179 = v178 + 1;
        if ((v177 & 0x80000000) != 0)
          break;
        v180 = v178 + 32;
        ++v178;
      }
      while (v180 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v179 + 33);
      v181 = *(_DWORD *)(a1 + 108) >> -(char)v179;
      HEVC_RBSP::flush_bits(a1, v179 + 32);
      v182 = v181 + ~(-2 << (v179 + 31));
    }
    a2[1708] = v182;
    v183 = *(_QWORD *)(a1 + 104) >> 63;
    HEVC_RBSP::flush_bits(a1, 1);
    *((_BYTE *)a2 + 6836) = v183;
  }
  v184 = *(_QWORD *)(a1 + 104);
  if ((v184 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits(a1, 1);
    a2[1710] = 0;
  }
  else
  {
    v185 = HIDWORD(v184);
    v186 = -32;
    do
    {
      LODWORD(v185) = 2 * v185;
      v187 = v186 + 1;
      if ((v185 & 0x80000000) != 0)
        break;
      v188 = v186 + 32;
      ++v186;
    }
    while (v188 < 0x1E);
    HEVC_RBSP::flush_bits(a1, v187 + 33);
    v189 = *(_DWORD *)(a1 + 108) >> -(char)v187;
    HEVC_RBSP::flush_bits(a1, v187 + 32);
    v190 = v189 + ~(-2 << (v187 + 31));
    a2[1710] = v190;
    if (v190 > 0x40)
      goto LABEL_39;
    if (v190)
    {
      v191 = 0;
      while ((HEVC_RBSP::parseShortTermRefPicSet((HEVC_RBSP *)a1, (uint64_t)(a2 + 1711), v191, v190) & 1) != 0)
      {
        ++v191;
        v190 = a2[1710];
        if (v191 >= v190)
          goto LABEL_171;
      }
      goto LABEL_39;
    }
  }
LABEL_171:
  v192 = *(_QWORD *)(a1 + 104);
  HEVC_RBSP::flush_bits(a1, 1);
  *((_BYTE *)a2 + 18024) = v192 < 0;
  if (v192 < 0)
  {
    v200 = HEVC_RBSP::ue_v((HEVC_RBSP *)a1);
    a2[4507] = v200;
    if (v200 >= 0x21)
    {
      syslog(3, "AppleD5500: sps->num_long_term_ref_pics_sps > 32, is %d");
      goto LABEL_39;
    }
    if (v200)
    {
      v215 = 0;
      v216 = a2[126];
      v217 = v216 + 4;
      v218 = 28 - v216;
      do
      {
        v219 = *(_DWORD *)(a1 + 108) >> v218;
        HEVC_RBSP::flush_bits(a1, v217);
        a2[v215 + 4508] = v219;
        v220 = *(_QWORD *)(a1 + 104) >> 63;
        HEVC_RBSP::flush_bits(a1, 1);
        *((_BYTE *)a2 + v215++ + 18160) = v220;
      }
      while (v215 < a2[4507]);
    }
  }
  v193 = *(_QWORD *)(a1 + 104) >> 63;
  HEVC_RBSP::flush_bits(a1, 1);
  *((_BYTE *)a2 + 18192) = v193;
  v194 = *(_QWORD *)(a1 + 104) >> 63;
  HEVC_RBSP::flush_bits(a1, 1);
  *((_BYTE *)a2 + 18193) = v194;
  v195 = *(_QWORD *)(a1 + 104);
  HEVC_RBSP::flush_bits(a1, 1);
  *((_BYTE *)a2 + 18194) = v195 < 0;
  if (v195 < 0 && !HEVC_RBSP::parseVUI(a1, (uint64_t)(a2 + 4550), a2[1]))
    goto LABEL_39;
  v196 = *(_QWORD *)(a1 + 104);
  HEVC_RBSP::flush_bits(a1, 1);
  *((_BYTE *)a2 + 18472) = v196 < 0;
  if (v196 < 0)
  {
    v210 = *(_QWORD *)(a1 + 104) >> 63;
    HEVC_RBSP::flush_bits(a1, 1);
    *((_BYTE *)a2 + 18473) = v210;
    v211 = *(_QWORD *)(a1 + 104) >> 63;
    HEVC_RBSP::flush_bits(a1, 1);
    *((_BYTE *)a2 + 18474) = v211;
    v212 = *(_QWORD *)(a1 + 104) >> 58;
    HEVC_RBSP::flush_bits(a1, 6);
    *((_BYTE *)a2 + 18475) = v212;
    if (*((_BYTE *)a2 + 18473))
      HEVC_RBSP::parseSpsRangeExtension(a1, (_BYTE *)a2 + 18476);
    if (*((_BYTE *)a2 + 18474))
    {
      v213 = *(_QWORD *)(a1 + 104) >> 63;
      HEVC_RBSP::flush_bits(a1, 1);
      *((_BYTE *)a2 + 18485) = v213;
    }
    if (*((_BYTE *)a2 + 18475) && 8 * *(_DWORD *)(a1 + 148) - *(_DWORD *)(a1 + 152) >= 9)
    {
      do
      {
        v214 = *(_QWORD *)(a1 + 104) >> 63;
        HEVC_RBSP::flush_bits(a1, 1);
        *((_BYTE *)a2 + 18486) = v214;
      }
      while (8 * *(_DWORD *)(a1 + 148) - *(_DWORD *)(a1 + 152) > 8);
    }
  }
  HEVC_RBSP::byte_alignment((HEVC_RBSP *)a1);
  v197 = (int)a2[115];
  if (v197 >= 4)
  {
    v198 = a2[4622];
    v199 = a2[4623];
  }
  else
  {
    v198 = dword_219526D70[v197];
    v199 = dword_219526D80[v197];
    a2[4622] = v198;
    a2[4623] = v199;
  }
  v201 = a2[149] + 3;
  a2[4624] = v201;
  v202 = a2[150] + v201;
  a2[4625] = v202;
  a2[4626] = 1 << v201;
  a2[4627] = 1 << v202;
  v203 = a2[117];
  v204 = v203 >> v201;
  a2[4628] = v203 >> v201;
  v205 = (1 << v202) - 1;
  v206 = (v205 + v203) >> v202;
  a2[4629] = v206;
  v207 = a2[118];
  v208 = v207 >> v201;
  a2[4630] = v208;
  v209 = (v205 + v207) >> v202;
  a2[4631] = v209;
  a2[4632] = v208 * v204;
  a2[4633] = v209 * v206;
  a2[4634] = v207 * v203;
  a2[4635] = v203 / v198;
  a2[4636] = v207 / v199;
  a2[4637] = 1 << (a2[126] + 4);
  return v13;
}

void HEVCReleaseSPS(uint64_t a1)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;

  if (a1 && *(_DWORD *)(a1 + 456) != -1 && *(_BYTE *)(a1 + 18194) && *(_BYTE *)(a1 + 18272) && *(_BYTE *)(a1 + 18292))
  {
    v2 = 0;
    do
    {
      v3 = *(_QWORD *)(a1 + 18432);
      if (v3 && *(_BYTE *)(a1 + 18297))
        HEVCReleaseSubLayerHRD((void **)(v3 + 48 * v2), *(unsigned __int8 *)(a1 + 18298));
      v4 = *(_QWORD *)(a1 + 18424);
      if (v4)
      {
        if (*(_BYTE *)(a1 + 18296))
          HEVCReleaseSubLayerHRD((void **)(v4 + 48 * v2), *(unsigned __int8 *)(a1 + 18298));
      }
      ++v2;
    }
    while (v2 <= *(_DWORD *)(a1 + 4));
    free(*(void **)(a1 + 18424));
    *(_QWORD *)(a1 + 18424) = 0;
    free(*(void **)(a1 + 18432));
    *(_QWORD *)(a1 + 18432) = 0;
  }
}

uint64_t HEVC_RBSP::parseScalingListData(HEVC_RBSP *this, _DWORD *a2)
{
  unint64_t v4;
  BOOL v5;
  _DWORD *v6;
  unint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int v17;
  int v18;
  unsigned int v19;
  int v20;
  int v21;
  unsigned int v22;
  int *v23;
  uint64_t v24;
  _DWORD *v25;
  int v26;
  unint64_t v27;
  unint64_t v28;
  int v29;
  int v30;
  unsigned int v31;
  int v32;
  int v33;
  int *v34;
  int *v35;
  uint64_t v36;
  unsigned int *v37;
  int v38;
  int v39;
  unsigned int v40;
  unsigned int v41;
  uint64_t i;
  unint64_t v43;
  unint64_t v44;
  int v45;
  int v46;
  unsigned int v47;
  int v48;
  int v49;
  char v50;
  char v52;
  _DWORD *v53;
  unsigned int v54;
  uint64_t v55;
  int v56;
  _DWORD *v57;

  v4 = 0;
  v5 = 0;
  v6 = a2;
  while (2)
  {
    v52 = v5;
    v7 = 0;
    v8 = 16 << (2 * v4);
    if (v8 >= 0x40)
      v8 = 64;
    v9 = 32;
    if (!v4)
      v9 = 8;
    v10 = *(unsigned int **)((char *)this + v9);
    v53 = v6;
    v54 = v4 - 2;
    if (v8 <= 1)
      v11 = 1;
    else
      v11 = v8;
    v12 = 6;
    if (v4 == 3)
      v12 = 2;
    v55 = v12;
    v13 = 1;
    v57 = v6;
    do
    {
      v14 = *((_QWORD *)this + 13);
      HEVC_RBSP::flush_bits((uint64_t)this, 1);
      v56 = v13;
      if (v14 < 0)
      {
        if (v4 < 2)
        {
          LOBYTE(v41) = 8;
        }
        else
        {
          v27 = *((_QWORD *)this + 13);
          if ((v27 & 0x8000000000000000) != 0)
          {
            HEVC_RBSP::flush_bits((uint64_t)this, 1);
            v33 = 0;
          }
          else
          {
            v28 = HIDWORD(v27);
            v29 = -32;
            do
            {
              LODWORD(v28) = 2 * v28;
              v30 = v29 + 1;
              if ((v28 & 0x80000000) != 0)
                break;
              v31 = v29 + 32;
              ++v29;
            }
            while (v31 < 0x1E);
            HEVC_RBSP::flush_bits((uint64_t)this, v30 + 33);
            v32 = *((_DWORD *)this + 27) >> -(char)v30;
            HEVC_RBSP::flush_bits((uint64_t)this, v30 + 32);
            v33 = v32 + ~(-2 << (v30 + 31));
          }
          v41 = (((v33 | 0xFFFFFFFE) + 1) ^ ((v33 + 1) >> 1)) - (v33 & 1) + 9;
          a2[6 * v54 + 1536 + v7] = v41;
        }
        for (i = 0; i != v11; ++i)
        {
          v43 = *((_QWORD *)this + 13);
          if ((v43 & 0x8000000000000000) != 0)
          {
            HEVC_RBSP::flush_bits((uint64_t)this, 1);
            v49 = 0;
          }
          else
          {
            v44 = HIDWORD(v43);
            v45 = -32;
            do
            {
              LODWORD(v44) = 2 * v44;
              v46 = v45 + 1;
              if ((v44 & 0x80000000) != 0)
                break;
              v47 = v45 + 32;
              ++v45;
            }
            while (v47 < 0x1E);
            HEVC_RBSP::flush_bits((uint64_t)this, v46 + 33);
            v48 = *((_DWORD *)this + 27) >> -(char)v46;
            HEVC_RBSP::flush_bits((uint64_t)this, v46 + 32);
            v49 = v48 + ~(-2 << (v46 + 31));
          }
          v41 = (((v49 & 1) == 0) + v41 + (-((v49 & 1) == 0) ^ ((v49 + 1) >> 1)));
          a2[384 * v4 + 64 * v7 + v10[i]] = v41;
        }
        goto LABEL_56;
      }
      v15 = *((_QWORD *)this + 13);
      if ((v15 & 0x8000000000000000) != 0)
      {
        HEVC_RBSP::flush_bits((uint64_t)this, 1);
LABEL_31:
        if (v4)
        {
          if (v4 != 1)
            a2[6 * v54 + 1536 + v7] = 16;
          v34 = (int *)&defaultInterScalingList8x8;
          if (v7 >= 3)
            v35 = (int *)&defaultInterScalingList8x8;
          else
            v35 = (int *)&defaultIntraScalingList8x8;
          if (!v7)
            v34 = (int *)&defaultIntraScalingList8x8;
          if (v4 >= 3)
            v35 = v34;
          v36 = v11;
          v37 = v10;
          do
          {
            v39 = *v35++;
            v38 = v39;
            v40 = *v37++;
            a2[384 * v4 + 64 * v7 + v40] = v38;
            --v36;
          }
          while (v36);
        }
        else
        {
          memset_pattern16(&a2[64 * v7], &unk_219526D60, (4 * v11));
        }
        goto LABEL_56;
      }
      v16 = HIDWORD(v15);
      v17 = -32;
      do
      {
        LODWORD(v16) = 2 * v16;
        v18 = v17 + 1;
        if ((v16 & 0x80000000) != 0)
          break;
        v19 = v17 + 32;
        ++v17;
      }
      while (v19 < 0x1E);
      HEVC_RBSP::flush_bits((uint64_t)this, v18 + 33);
      v20 = *((_DWORD *)this + 27) >> -(char)v18;
      HEVC_RBSP::flush_bits((uint64_t)this, v18 + 32);
      v21 = -2 << (v18 + 31);
      v22 = v20 + ~v21;
      if (!v22)
        goto LABEL_31;
      if (v7 < v22)
      {
        v50 = v52;
        return v50 & 1;
      }
      if (v4 >= 2)
        a2[6 * v54 + 1536 + v7] = a2[6 * v54 + 1536 + v7 - v22];
      v23 = &v53[64 * (unint64_t)(v21 + v13 - v20)];
      v24 = v11;
      v25 = v57;
      do
      {
        v26 = *v23++;
        *v25++ = v26;
        --v24;
      }
      while (v24);
LABEL_56:
      ++v7;
      v13 = v56 + 1;
      v57 += 64;
    }
    while (v7 != v55);
    v5 = v4 > 2;
    v6 = v53 + 384;
    if (++v4 != 4)
      continue;
    break;
  }
  v50 = 1;
  return v50 & 1;
}

void HEVC_RBSP::setDefaultScalingListData(uint64_t a1, uint64_t a2)
{
  unint64_t i;
  unint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  int *v11;
  uint64_t v12;
  unsigned int *v13;
  int v14;
  int v15;
  unsigned int v16;

  for (i = 0; i != 4; ++i)
  {
    v4 = 0;
    v5 = 16 << (2 * i);
    if (v5 >= 0x40)
      v5 = 64;
    v6 = 32;
    if (!i)
      v6 = 8;
    v7 = *(unsigned int **)(a1 + v6);
    if (v5 <= 1)
      v8 = 1;
    else
      v8 = v5;
    if (i == 3)
      v9 = 2;
    else
      v9 = 6;
    do
    {
      if (i)
      {
        if (i != 1)
          *(_DWORD *)(a2 + 24 * (i - 2) + 4 * v4 + 6144) = 16;
        if (v4 >= 3)
          v10 = (int *)&defaultInterScalingList8x8;
        else
          v10 = (int *)&defaultIntraScalingList8x8;
        if (v4)
          v11 = (int *)&defaultInterScalingList8x8;
        else
          v11 = (int *)&defaultIntraScalingList8x8;
        if (i >= 3)
          v10 = v11;
        v12 = v8;
        v13 = v7;
        do
        {
          v15 = *v10++;
          v14 = v15;
          v16 = *v13++;
          *(_DWORD *)(a2 + 1536 * i + (v4 << 8) + 4 * v16) = v14;
          --v12;
        }
        while (v12);
      }
      else
      {
        memset_pattern16((void *)(a2 + (v4 << 8)), &unk_219526D60, (4 * v8));
      }
      ++v4;
    }
    while (v4 != v9);
  }
}

uint64_t HEVC_RBSP::parseShortTermRefPicSet(HEVC_RBSP *this, uint64_t a2, unsigned int a3, int a4)
{
  unsigned int *v7;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  int v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  int v21;
  unsigned int v22;
  int v23;
  unsigned int v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int *v27;
  unint64_t v28;
  unint64_t v29;
  int v30;
  int v31;
  unsigned int v32;
  int v33;
  unsigned int v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  int v38;
  int v39;
  unsigned int v40;
  int v41;
  int v42;
  uint64_t v43;
  int v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  int v48;
  int v49;
  unsigned int v50;
  int v51;
  int v52;
  uint64_t v53;
  int v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  int v58;
  int v59;
  unsigned int v60;
  int v61;
  unsigned int v62;
  unsigned int *v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  unsigned int *v67;
  unsigned int *v68;
  int v69;
  unsigned int v70;
  int *v71;
  unsigned int *v72;
  int v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t i;
  int v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  int v86;
  unsigned int v87;
  int v88;
  int *v89;
  _BYTE *v90;
  _BYTE *v91;
  int v92;
  int v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  unint64_t j;
  int v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  int v105;
  int v106;
  unsigned int v107;
  _BYTE v108[32];
  uint64_t v109;

  v109 = *MEMORY[0x24BDAC8D0];
  v7 = (unsigned int *)(a2 + 172 * a3);
  if (!a3 || (v10 = *((_QWORD *)this + 13), HEVC_RBSP::flush_bits((uint64_t)this, 1), (v10 & 0x8000000000000000) == 0))
  {
    v11 = *((_QWORD *)this + 13);
    if ((v11 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits((uint64_t)this, 1);
      v17 = 0;
    }
    else
    {
      v12 = HIDWORD(v11);
      v13 = -32;
      do
      {
        LODWORD(v12) = 2 * v12;
        v14 = v13 + 1;
        if ((v12 & 0x80000000) != 0)
          break;
        v15 = v13 + 32;
        ++v13;
      }
      while (v15 < 0x1E);
      HEVC_RBSP::flush_bits((uint64_t)this, v14 + 33);
      v16 = *((_DWORD *)this + 27) >> -(char)v14;
      HEVC_RBSP::flush_bits((uint64_t)this, v14 + 32);
      v17 = v16 + ~(-2 << (v14 + 31));
    }
    *v7 = v17;
    v18 = *((_QWORD *)this + 13);
    if ((v18 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits((uint64_t)this, 1);
      v24 = 0;
    }
    else
    {
      v19 = HIDWORD(v18);
      v20 = -32;
      do
      {
        LODWORD(v19) = 2 * v19;
        v21 = v20 + 1;
        if ((v19 & 0x80000000) != 0)
          break;
        v22 = v20 + 32;
        ++v20;
      }
      while (v22 < 0x1E);
      HEVC_RBSP::flush_bits((uint64_t)this, v21 + 33);
      v23 = *((_DWORD *)this + 27) >> -(char)v21;
      HEVC_RBSP::flush_bits((uint64_t)this, v21 + 32);
      v24 = v23 + ~(-2 << (v21 + 31));
    }
    v25 = a2 + 172 * a3;
    v26 = *v7;
    *(_DWORD *)(v25 + 4) = v24;
    *(_DWORD *)(v25 + 8) = v26 + v24;
    v27 = (unsigned int *)(v25 + 4);
    if (v26 >= 0x10)
    {
      syslog(3, "AppleD5500: rps->NumNegativePics >= HEVC_MAX_DPB, is %d");
      return 0;
    }
    if (v24 >= 0x10)
    {
      syslog(3, "AppleD5500: rps->NumPositivePics >= HEVC_MAX_DPB, is %d");
      return 0;
    }
    if (v26 + v24 <= 0xF)
    {
      if (v26)
      {
        v35 = 0;
        do
        {
          v36 = *((_QWORD *)this + 13);
          if ((v36 & 0x8000000000000000) != 0)
          {
            HEVC_RBSP::flush_bits((uint64_t)this, 1);
            v42 = 0;
          }
          else
          {
            v37 = HIDWORD(v36);
            v38 = -32;
            do
            {
              LODWORD(v37) = 2 * v37;
              v39 = v38 + 1;
              if ((v37 & 0x80000000) != 0)
                break;
              v40 = v38 + 32;
              ++v38;
            }
            while (v40 < 0x1E);
            HEVC_RBSP::flush_bits((uint64_t)this, v39 + 33);
            v41 = *((_DWORD *)this + 27) >> -(char)v39;
            HEVC_RBSP::flush_bits((uint64_t)this, v39 + 32);
            v42 = v41 + ~(-2 << (v39 + 31));
          }
          v43 = *((_QWORD *)this + 13) >> 63;
          HEVC_RBSP::flush_bits((uint64_t)this, 1);
          *(_BYTE *)(a2 + 172 * a3 + v35 + 12) = v43;
          if (v35)
            v44 = *(_DWORD *)(a2 + 172 * a3 + 4 * v35 + 40) + ~v42;
          else
            v44 = ~v42;
          *(_DWORD *)(a2 + 172 * a3 + 4 * v35++ + 44) = v44;
        }
        while (v35 < *v7);
        v24 = *v27;
      }
      if (v24)
      {
        v45 = 0;
        do
        {
          v46 = *((_QWORD *)this + 13);
          if ((v46 & 0x8000000000000000) != 0)
          {
            HEVC_RBSP::flush_bits((uint64_t)this, 1);
            v52 = 0;
          }
          else
          {
            v47 = HIDWORD(v46);
            v48 = -32;
            do
            {
              LODWORD(v47) = 2 * v47;
              v49 = v48 + 1;
              if ((v47 & 0x80000000) != 0)
                break;
              v50 = v48 + 32;
              ++v48;
            }
            while (v50 < 0x1E);
            HEVC_RBSP::flush_bits((uint64_t)this, v49 + 33);
            v51 = *((_DWORD *)this + 27) >> -(char)v49;
            HEVC_RBSP::flush_bits((uint64_t)this, v49 + 32);
            v52 = v51 + ~(-2 << (v49 + 31));
          }
          v53 = *((_QWORD *)this + 13) >> 63;
          HEVC_RBSP::flush_bits((uint64_t)this, 1);
          *(_BYTE *)(a2 + 172 * a3 + v45 + 28) = v53;
          if (v45)
            v54 = v52 + *(_DWORD *)(a2 + 172 * a3 + 4 * v45 + 104) + 1;
          else
            v54 = v52 + 1;
          *(_DWORD *)(a2 + 172 * a3 + 4 * v45++ + 108) = v54;
        }
        while (v45 < *v27);
      }
      return 1;
    }
LABEL_103:
    syslog(3, "AppleD5500: [pred] rps->NumDeltaPocs >= HEVC_MAX_DPB, is %d");
    return 0;
  }
  if (a3 != a4)
    goto LABEL_54;
  v28 = *((_QWORD *)this + 13);
  if ((v28 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
LABEL_54:
    v34 = 0;
    goto LABEL_55;
  }
  v29 = HIDWORD(v28);
  v30 = -32;
  do
  {
    LODWORD(v29) = 2 * v29;
    v31 = v30 + 1;
    if ((v29 & 0x80000000) != 0)
      break;
    v32 = v30 + 32;
    ++v30;
  }
  while (v32 < 0x1E);
  HEVC_RBSP::flush_bits((uint64_t)this, v31 + 33);
  v33 = *((_DWORD *)this + 27) >> -(char)v31;
  HEVC_RBSP::flush_bits((uint64_t)this, v31 + 32);
  v34 = v33 + ~(-2 << (v31 + 31));
  if (v34 > a3 - 1)
    return 0;
LABEL_55:
  v55 = *((_QWORD *)this + 13);
  HEVC_RBSP::flush_bits((uint64_t)this, 1);
  v56 = *((_QWORD *)this + 13);
  if ((v56 & 0x8000000000000000) != 0)
  {
    v106 = 1;
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
  }
  else
  {
    v57 = HIDWORD(v56);
    v58 = -32;
    do
    {
      LODWORD(v57) = 2 * v57;
      v59 = v58 + 1;
      if ((v57 & 0x80000000) != 0)
        break;
      v60 = v58 + 32;
      ++v58;
    }
    while (v60 < 0x1E);
    HEVC_RBSP::flush_bits((uint64_t)this, v59 + 33);
    v61 = *((_DWORD *)this + 27) >> -(char)v59;
    HEVC_RBSP::flush_bits((uint64_t)this, v59 + 32);
    v106 = (2 << (v59 + 31)) + v61;
  }
  v62 = 0;
  v105 = (v55 >> 62) & 2;
  v107 = ~v34 + a3;
  v63 = (unsigned int *)(a2 + 172 * v107 + 8);
  do
  {
    v64 = *((_QWORD *)this + 13);
    LOBYTE(v65) = 1;
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    v108[v62 + 16] = v64 < 0;
    if ((v64 & 0x8000000000000000) == 0)
    {
      v65 = *((_QWORD *)this + 13) >> 63;
      HEVC_RBSP::flush_bits((uint64_t)this, 1);
    }
    v108[v62++] = v65;
  }
  while (v62 <= *v63);
  v66 = v106 - v106 * v105;
  v67 = (unsigned int *)(a2 + 172 * v107);
  v68 = v67 + 1;
  v69 = v67[1] - 1;
  if (v69 < 0)
  {
    v70 = 0;
    v72 = v7;
    if ((v66 & 0x80000000) == 0)
      goto LABEL_77;
    goto LABEL_75;
  }
  v70 = 0;
  v71 = (int *)(172 * v107 + 4 * v69 + a2 + 108);
  v72 = v7;
  do
  {
    v73 = *v71--;
    v74 = v73 + v66;
    if (v73 + v66 < 0 && v108[v69 + *v67])
    {
      v75 = a2 + 172 * a3;
      *(_DWORD *)(v75 + 4 * v70 + 44) = v74;
      v76 = v75 + v70++;
      *(_BYTE *)(v76 + 12) = v108[v69 + 16 + *v67];
    }
  }
  while (v69-- > 0);
  if (v66 < 0)
  {
LABEL_75:
    if (v108[*v63])
    {
      v78 = a2 + 172 * a3;
      *(_DWORD *)(v78 + 4 * v70 + 44) = v66;
      v79 = v78 + v70++;
      *(_BYTE *)(v79 + 12) = v108[*v63 + 16];
    }
  }
LABEL_77:
  v80 = *v67;
  if ((_DWORD)v80)
  {
    for (i = 0; i < v80; ++i)
    {
      v82 = *(_DWORD *)(a2 + 172 * v107 + 44 + 4 * i) + v66;
      if (v82 < 0 && v108[i])
      {
        v83 = a2 + 172 * a3;
        v84 = v108[i + 16];
        *(_DWORD *)(v83 + 4 * v70 + 44) = v82;
        v85 = v83 + v70++;
        *(_BYTE *)(v85 + 12) = v84;
        v80 = *v67;
      }
    }
  }
  *v72 = v70;
  if (v70 > 0xF)
  {
    syslog(3, "AppleD5500: [pred] rps->NumNegativePics >= HEVC_MAX_DPB, is %d");
    return 0;
  }
  v86 = *v67;
  v87 = 0;
  v88 = *v67 - 1;
  if (v88 >= 0)
  {
    v89 = (int *)(172 * v107 + 4 * v88 + a2 + 44);
    v90 = &v108[v88];
    v91 = &v108[v88 + 16];
    do
    {
      v92 = *v89--;
      v93 = v92 + v66;
      if (v92 + v66 >= 1 && *v90)
      {
        v94 = a2 + 172 * a3;
        *(_DWORD *)(v94 + 4 * v87 + 108) = v93;
        v95 = v94 + v87++;
        *(_BYTE *)(v95 + 28) = *v91;
      }
      --v86;
      --v90;
      --v91;
    }
    while (v86 > 0);
  }
  if (v66 > 0 && v108[*v63])
  {
    v96 = a2 + 172 * a3;
    *(_DWORD *)(v96 + 4 * v87 + 108) = v66;
    v97 = v96 + v87++;
    *(_BYTE *)(v97 + 28) = v108[*v63 + 16];
  }
  v98 = *v68;
  if ((_DWORD)v98)
  {
    for (j = 0; j < v98; ++j)
    {
      v100 = *(_DWORD *)(a2 + 172 * v107 + 108 + 4 * j) + v66;
      if (v100 >= 1 && v108[j + *v67])
      {
        v101 = a2 + 172 * a3;
        *(_DWORD *)(v101 + 4 * v87 + 108) = v100;
        v102 = v101 + v87++;
        *(_BYTE *)(v102 + 28) = v108[j + 16 + *v67];
        v98 = *v68;
      }
    }
  }
  v103 = a2 + 172 * a3;
  *(_DWORD *)(v103 + 4) = v87;
  *(_DWORD *)(v103 + 8) = v87 + v70;
  if (v87 > 0xF)
  {
    syslog(3, "AppleD5500: [pred] rps->NumPositivePics >= HEVC_MAX_DPB, is %d");
    return 0;
  }
  if (v87 + v70 >= 0x10)
    goto LABEL_103;
  return 1;
}

uint64_t HEVC_RBSP::parseVUI(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int v22;
  int v23;
  unsigned int v24;
  int v25;
  int v26;
  unint64_t v27;
  unint64_t v28;
  int v29;
  int v30;
  unsigned int v31;
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  int v40;
  int v41;
  unsigned int v42;
  int v43;
  int v44;
  unint64_t v45;
  unint64_t v46;
  int v47;
  int v48;
  unsigned int v49;
  int v50;
  int v51;
  unint64_t v52;
  unint64_t v53;
  int v54;
  int v55;
  unsigned int v56;
  int v57;
  int v58;
  unint64_t v59;
  unint64_t v60;
  int v61;
  int v62;
  unsigned int v63;
  int v64;
  int v65;
  uint64_t v66;
  int v67;
  int v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  int v72;
  int v73;
  unsigned int v74;
  int v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  int v85;
  int v86;
  unsigned int v87;
  int v88;
  int v89;
  unint64_t v90;
  unint64_t v91;
  int v92;
  int v93;
  unsigned int v94;
  int v95;
  int v96;
  unint64_t v97;
  unint64_t v98;
  int v99;
  int v100;
  unsigned int v101;
  int v102;
  int v103;
  unint64_t v104;
  unint64_t v105;
  int v106;
  int v107;
  unsigned int v108;
  int v109;
  int v110;
  unint64_t v111;
  unint64_t v112;
  int v113;
  int v114;
  unsigned int v115;
  int v116;
  int v117;

  v6 = *(_QWORD *)(a1 + 104);
  HEVC_RBSP::flush_bits(a1, 1);
  *(_BYTE *)a2 = v6 < 0;
  if (v6 < 0)
  {
    v7 = *(unsigned __int8 *)(a1 + 111);
    HEVC_RBSP::flush_bits(a1, 8);
    *(_DWORD *)(a2 + 4) = v7;
    if (v7 == 255)
    {
      v8 = *(unsigned __int16 *)(a1 + 110);
      HEVC_RBSP::flush_bits(a1, 16);
      *(_DWORD *)(a2 + 8) = v8;
      v9 = *(unsigned __int16 *)(a1 + 110);
      HEVC_RBSP::flush_bits(a1, 16);
      *(_DWORD *)(a2 + 12) = v9;
    }
  }
  v10 = *(_QWORD *)(a1 + 104);
  HEVC_RBSP::flush_bits(a1, 1);
  *(_BYTE *)(a2 + 16) = v10 < 0;
  if (v10 < 0)
  {
    v11 = *(_QWORD *)(a1 + 104) >> 63;
    HEVC_RBSP::flush_bits(a1, 1);
    *(_BYTE *)(a2 + 17) = v11;
  }
  v12 = *(_QWORD *)(a1 + 104);
  HEVC_RBSP::flush_bits(a1, 1);
  *(_BYTE *)(a2 + 18) = v12 < 0;
  if (v12 < 0)
  {
    v13 = *(_QWORD *)(a1 + 104) >> 61;
    HEVC_RBSP::flush_bits(a1, 3);
    *(_DWORD *)(a2 + 20) = v13;
    v14 = *(_QWORD *)(a1 + 104) >> 63;
    HEVC_RBSP::flush_bits(a1, 1);
    *(_BYTE *)(a2 + 24) = v14;
    v15 = *(_QWORD *)(a1 + 104);
    HEVC_RBSP::flush_bits(a1, 1);
    *(_BYTE *)(a2 + 25) = v15 < 0;
    if (v15 < 0)
    {
      v16 = *(unsigned __int8 *)(a1 + 111);
      HEVC_RBSP::flush_bits(a1, 8);
      *(_DWORD *)(a2 + 28) = v16;
      v17 = *(unsigned __int8 *)(a1 + 111);
      HEVC_RBSP::flush_bits(a1, 8);
      *(_DWORD *)(a2 + 32) = v17;
      v18 = *(unsigned __int8 *)(a1 + 111);
      HEVC_RBSP::flush_bits(a1, 8);
      *(_DWORD *)(a2 + 36) = v18;
    }
  }
  v19 = *(_QWORD *)(a1 + 104);
  HEVC_RBSP::flush_bits(a1, 1);
  *(_BYTE *)(a2 + 40) = v19 < 0;
  if (v19 < 0)
  {
    v20 = *(_QWORD *)(a1 + 104);
    if ((v20 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      v26 = 0;
    }
    else
    {
      v21 = HIDWORD(v20);
      v22 = -32;
      do
      {
        LODWORD(v21) = 2 * v21;
        v23 = v22 + 1;
        if ((v21 & 0x80000000) != 0)
          break;
        v24 = v22 + 32;
        ++v22;
      }
      while (v24 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v23 + 33);
      v25 = *(_DWORD *)(a1 + 108) >> -(char)v23;
      HEVC_RBSP::flush_bits(a1, v23 + 32);
      v26 = v25 + ~(-2 << (v23 + 31));
    }
    *(_DWORD *)(a2 + 44) = v26;
    v27 = *(_QWORD *)(a1 + 104);
    if ((v27 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      v33 = 0;
    }
    else
    {
      v28 = HIDWORD(v27);
      v29 = -32;
      do
      {
        LODWORD(v28) = 2 * v28;
        v30 = v29 + 1;
        if ((v28 & 0x80000000) != 0)
          break;
        v31 = v29 + 32;
        ++v29;
      }
      while (v31 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v30 + 33);
      v32 = *(_DWORD *)(a1 + 108) >> -(char)v30;
      HEVC_RBSP::flush_bits(a1, v30 + 32);
      v33 = v32 + ~(-2 << (v30 + 31));
    }
    *(_DWORD *)(a2 + 48) = v33;
  }
  v34 = *(_QWORD *)(a1 + 104) >> 63;
  HEVC_RBSP::flush_bits(a1, 1);
  *(_BYTE *)(a2 + 52) = v34;
  v35 = *(_QWORD *)(a1 + 104) >> 63;
  HEVC_RBSP::flush_bits(a1, 1);
  *(_BYTE *)(a2 + 53) = v35;
  v36 = *(_QWORD *)(a1 + 104) >> 63;
  HEVC_RBSP::flush_bits(a1, 1);
  *(_BYTE *)(a2 + 54) = v36;
  v37 = *(_QWORD *)(a1 + 104);
  HEVC_RBSP::flush_bits(a1, 1);
  *(_BYTE *)(a2 + 55) = v37 < 0;
  if (v37 < 0)
  {
    v38 = *(_QWORD *)(a1 + 104);
    if ((v38 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      v44 = 0;
    }
    else
    {
      v39 = HIDWORD(v38);
      v40 = -32;
      do
      {
        LODWORD(v39) = 2 * v39;
        v41 = v40 + 1;
        if ((v39 & 0x80000000) != 0)
          break;
        v42 = v40 + 32;
        ++v40;
      }
      while (v42 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v41 + 33);
      v43 = *(_DWORD *)(a1 + 108) >> -(char)v41;
      HEVC_RBSP::flush_bits(a1, v41 + 32);
      v44 = v43 + ~(-2 << (v41 + 31));
    }
    *(_DWORD *)(a2 + 56) = v44;
    v45 = *(_QWORD *)(a1 + 104);
    if ((v45 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      v51 = 0;
    }
    else
    {
      v46 = HIDWORD(v45);
      v47 = -32;
      do
      {
        LODWORD(v46) = 2 * v46;
        v48 = v47 + 1;
        if ((v46 & 0x80000000) != 0)
          break;
        v49 = v47 + 32;
        ++v47;
      }
      while (v49 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v48 + 33);
      v50 = *(_DWORD *)(a1 + 108) >> -(char)v48;
      HEVC_RBSP::flush_bits(a1, v48 + 32);
      v51 = v50 + ~(-2 << (v48 + 31));
    }
    *(_DWORD *)(a2 + 60) = v51;
    v52 = *(_QWORD *)(a1 + 104);
    if ((v52 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      v58 = 0;
    }
    else
    {
      v53 = HIDWORD(v52);
      v54 = -32;
      do
      {
        LODWORD(v53) = 2 * v53;
        v55 = v54 + 1;
        if ((v53 & 0x80000000) != 0)
          break;
        v56 = v54 + 32;
        ++v54;
      }
      while (v56 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v55 + 33);
      v57 = *(_DWORD *)(a1 + 108) >> -(char)v55;
      HEVC_RBSP::flush_bits(a1, v55 + 32);
      v58 = v57 + ~(-2 << (v55 + 31));
    }
    *(_DWORD *)(a2 + 64) = v58;
    v59 = *(_QWORD *)(a1 + 104);
    if ((v59 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      v65 = 0;
    }
    else
    {
      v60 = HIDWORD(v59);
      v61 = -32;
      do
      {
        LODWORD(v60) = 2 * v60;
        v62 = v61 + 1;
        if ((v60 & 0x80000000) != 0)
          break;
        v63 = v61 + 32;
        ++v61;
      }
      while (v63 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v62 + 33);
      v64 = *(_DWORD *)(a1 + 108) >> -(char)v62;
      HEVC_RBSP::flush_bits(a1, v62 + 32);
      v65 = v64 + ~(-2 << (v62 + 31));
    }
    *(_DWORD *)(a2 + 68) = v65;
  }
  v66 = *(_QWORD *)(a1 + 104);
  HEVC_RBSP::flush_bits(a1, 1);
  *(_BYTE *)(a2 + 72) = v66 < 0;
  if ((v66 & 0x8000000000000000) == 0)
    goto LABEL_60;
  v67 = *(_DWORD *)(a1 + 108);
  HEVC_RBSP::flush_bits(a1, 32);
  *(_DWORD *)(a2 + 76) = v67;
  v68 = *(_DWORD *)(a1 + 108);
  HEVC_RBSP::flush_bits(a1, 32);
  *(_DWORD *)(a2 + 80) = v68;
  v69 = *(_QWORD *)(a1 + 104);
  HEVC_RBSP::flush_bits(a1, 1);
  *(_BYTE *)(a2 + 84) = v69 < 0;
  if (v69 < 0)
  {
    v70 = *(_QWORD *)(a1 + 104);
    if ((v70 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      v76 = 0;
    }
    else
    {
      v71 = HIDWORD(v70);
      v72 = -32;
      do
      {
        LODWORD(v71) = 2 * v71;
        v73 = v72 + 1;
        if ((v71 & 0x80000000) != 0)
          break;
        v74 = v72 + 32;
        ++v72;
      }
      while (v74 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v73 + 33);
      v75 = *(_DWORD *)(a1 + 108) >> -(char)v73;
      HEVC_RBSP::flush_bits(a1, v73 + 32);
      v76 = v75 + ~(-2 << (v73 + 31));
    }
    *(_DWORD *)(a2 + 88) = v76;
  }
  v77 = *(_QWORD *)(a1 + 104);
  HEVC_RBSP::flush_bits(a1, 1);
  *(_BYTE *)(a2 + 92) = v77 < 0;
  if (v77 < 0 && !HEVC_RBSP::parseHRD((HEVC_RBSP *)a1, a2 + 96, 1, a3))
    return 0;
LABEL_60:
  v78 = *(_QWORD *)(a1 + 104);
  v79 = 1;
  HEVC_RBSP::flush_bits(a1, 1);
  *(_BYTE *)(a2 + 248) = v78 < 0;
  if (v78 < 0)
  {
    v80 = *(_QWORD *)(a1 + 104) >> 63;
    HEVC_RBSP::flush_bits(a1, 1);
    *(_BYTE *)(a2 + 249) = v80;
    v81 = *(_QWORD *)(a1 + 104) >> 63;
    HEVC_RBSP::flush_bits(a1, 1);
    *(_BYTE *)(a2 + 250) = v81;
    v82 = *(_QWORD *)(a1 + 104) >> 63;
    HEVC_RBSP::flush_bits(a1, 1);
    *(_BYTE *)(a2 + 251) = v82;
    v83 = *(_QWORD *)(a1 + 104);
    if ((v83 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      v89 = 0;
    }
    else
    {
      v84 = HIDWORD(v83);
      v85 = -32;
      do
      {
        LODWORD(v84) = 2 * v84;
        v86 = v85 + 1;
        if ((v84 & 0x80000000) != 0)
          break;
        v87 = v85 + 32;
        ++v85;
      }
      while (v87 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v86 + 33);
      v88 = *(_DWORD *)(a1 + 108) >> -(char)v86;
      HEVC_RBSP::flush_bits(a1, v86 + 32);
      v89 = v88 + ~(-2 << (v86 + 31));
    }
    *(_DWORD *)(a2 + 252) = v89;
    v90 = *(_QWORD *)(a1 + 104);
    if ((v90 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      v96 = 0;
    }
    else
    {
      v91 = HIDWORD(v90);
      v92 = -32;
      do
      {
        LODWORD(v91) = 2 * v91;
        v93 = v92 + 1;
        if ((v91 & 0x80000000) != 0)
          break;
        v94 = v92 + 32;
        ++v92;
      }
      while (v94 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v93 + 33);
      v95 = *(_DWORD *)(a1 + 108) >> -(char)v93;
      HEVC_RBSP::flush_bits(a1, v93 + 32);
      v96 = v95 + ~(-2 << (v93 + 31));
    }
    *(_DWORD *)(a2 + 256) = v96;
    v97 = *(_QWORD *)(a1 + 104);
    if ((v97 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      v103 = 0;
    }
    else
    {
      v98 = HIDWORD(v97);
      v99 = -32;
      do
      {
        LODWORD(v98) = 2 * v98;
        v100 = v99 + 1;
        if ((v98 & 0x80000000) != 0)
          break;
        v101 = v99 + 32;
        ++v99;
      }
      while (v101 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v100 + 33);
      v102 = *(_DWORD *)(a1 + 108) >> -(char)v100;
      HEVC_RBSP::flush_bits(a1, v100 + 32);
      v103 = v102 + ~(-2 << (v100 + 31));
    }
    *(_DWORD *)(a2 + 260) = v103;
    v104 = *(_QWORD *)(a1 + 104);
    if ((v104 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      v110 = 0;
    }
    else
    {
      v105 = HIDWORD(v104);
      v106 = -32;
      do
      {
        LODWORD(v105) = 2 * v105;
        v107 = v106 + 1;
        if ((v105 & 0x80000000) != 0)
          break;
        v108 = v106 + 32;
        ++v106;
      }
      while (v108 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v107 + 33);
      v109 = *(_DWORD *)(a1 + 108) >> -(char)v107;
      HEVC_RBSP::flush_bits(a1, v107 + 32);
      v110 = v109 + ~(-2 << (v107 + 31));
    }
    *(_DWORD *)(a2 + 264) = v110;
    v111 = *(_QWORD *)(a1 + 104);
    if ((v111 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      v117 = 0;
    }
    else
    {
      v112 = HIDWORD(v111);
      v113 = -32;
      do
      {
        LODWORD(v112) = 2 * v112;
        v114 = v113 + 1;
        if ((v112 & 0x80000000) != 0)
          break;
        v115 = v113 + 32;
        ++v113;
      }
      while (v115 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v114 + 33);
      v116 = *(_DWORD *)(a1 + 108) >> -(char)v114;
      HEVC_RBSP::flush_bits(a1, v114 + 32);
      v117 = v116 + ~(-2 << (v114 + 31));
    }
    *(_DWORD *)(a2 + 268) = v117;
    return 1;
  }
  return v79;
}

uint64_t HEVC_RBSP::parseSpsRangeExtension(uint64_t a1, _BYTE *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 104) >> 63;
  HEVC_RBSP::flush_bits(a1, 1);
  *a2 = v4;
  v5 = *(_QWORD *)(a1 + 104) >> 63;
  HEVC_RBSP::flush_bits(a1, 1);
  a2[1] = v5;
  v6 = *(_QWORD *)(a1 + 104) >> 63;
  HEVC_RBSP::flush_bits(a1, 1);
  a2[2] = v6;
  v7 = *(_QWORD *)(a1 + 104) >> 63;
  HEVC_RBSP::flush_bits(a1, 1);
  a2[3] = v7;
  v8 = *(_QWORD *)(a1 + 104) >> 63;
  HEVC_RBSP::flush_bits(a1, 1);
  a2[4] = v8;
  v9 = *(_QWORD *)(a1 + 104) >> 63;
  HEVC_RBSP::flush_bits(a1, 1);
  a2[5] = v9;
  v10 = *(_QWORD *)(a1 + 104) >> 63;
  HEVC_RBSP::flush_bits(a1, 1);
  a2[6] = v10;
  v11 = *(_QWORD *)(a1 + 104) >> 63;
  HEVC_RBSP::flush_bits(a1, 1);
  a2[7] = v11;
  v12 = *(_QWORD *)(a1 + 104) >> 63;
  result = HEVC_RBSP::flush_bits(a1, 1);
  a2[8] = v12;
  return result;
}

uint64_t HEVC_RBSP::se_v(HEVC_RBSP *this)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  int v5;
  unsigned int v6;
  int v7;
  int v8;

  v2 = *((_QWORD *)this + 13);
  if ((v2 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    v8 = 0;
  }
  else
  {
    v3 = HIDWORD(v2);
    v4 = -32;
    do
    {
      LODWORD(v3) = 2 * v3;
      v5 = v4 + 1;
      if ((v3 & 0x80000000) != 0)
        break;
      v6 = v4 + 32;
      ++v4;
    }
    while (v6 < 0x1E);
    HEVC_RBSP::flush_bits((uint64_t)this, v5 + 33);
    v7 = *((_DWORD *)this + 27) >> -(char)v5;
    HEVC_RBSP::flush_bits((uint64_t)this, v5 + 32);
    v8 = v7 + ~(-2 << (v5 + 31));
  }
  return (-((v8 & 1) == 0) ^ ((v8 + 1) >> 1)) + ((v8 & 1) == 0);
}

uint64_t HEVC_RBSP::parsePPS(HEVC_RBSP *this, _DWORD *a2)
{
  unint64_t v4;
  unint64_t v5;
  int v6;
  int v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  int v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int v25;
  int v26;
  unsigned int v27;
  int v28;
  unsigned int v29;
  unint64_t v30;
  unint64_t v31;
  int v32;
  int v33;
  unsigned int v34;
  int v35;
  unsigned int v36;
  unint64_t v37;
  unint64_t v38;
  int v39;
  int v40;
  unsigned int v41;
  int v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  int v49;
  int v50;
  unsigned int v51;
  int v52;
  int v53;
  unint64_t v54;
  unint64_t v55;
  int v56;
  int v57;
  unsigned int v58;
  int v59;
  int v60;
  unint64_t v61;
  unint64_t v62;
  int v63;
  int v64;
  unsigned int v65;
  int v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  int v77;
  int v78;
  unsigned int v79;
  int v80;
  int v81;
  unint64_t v82;
  unint64_t v83;
  int v84;
  int v85;
  unsigned int v86;
  int v87;
  unsigned int v88;
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  int v93;
  int v94;
  unsigned int v95;
  int v96;
  int v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  int v101;
  int v102;
  unsigned int v103;
  int v104;
  int v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  _DWORD *v111;
  uint64_t v112;
  unint64_t v113;
  unint64_t v114;
  int v115;
  int v116;
  unsigned int v117;
  int v118;
  int v119;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;

  v4 = *((_QWORD *)this + 13);
  if ((v4 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    v10 = 0;
    goto LABEL_9;
  }
  v5 = HIDWORD(v4);
  v6 = -32;
  do
  {
    LODWORD(v5) = 2 * v5;
    v7 = v6 + 1;
    if ((v5 & 0x80000000) != 0)
      break;
    v8 = v6 + 32;
    ++v6;
  }
  while (v8 < 0x1E);
  HEVC_RBSP::flush_bits((uint64_t)this, v7 + 33);
  v9 = *((_DWORD *)this + 27) >> -(char)v7;
  HEVC_RBSP::flush_bits((uint64_t)this, v7 + 32);
  v10 = (v9 + ~(-2 << (v7 + 31)));
  if (v10 < 0x40)
  {
LABEL_9:
    HEVCReleasePPS((uint64_t)a2);
    bzero(a2, 0x25C8uLL);
    *a2 = v10;
    v11 = *((_QWORD *)this + 13);
    if ((v11 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits((uint64_t)this, 1);
      a2[1] = 0;
    }
    else
    {
      v12 = HIDWORD(v11);
      v13 = -32;
      do
      {
        LODWORD(v12) = 2 * v12;
        v14 = v13 + 1;
        if ((v12 & 0x80000000) != 0)
          break;
        v15 = v13 + 32;
        ++v13;
      }
      while (v15 < 0x1E);
      HEVC_RBSP::flush_bits((uint64_t)this, v14 + 33);
      v16 = *((_DWORD *)this + 27) >> -(char)v14;
      HEVC_RBSP::flush_bits((uint64_t)this, v14 + 32);
      v17 = v16 + ~(-2 << (v14 + 31));
      a2[1] = v17;
      if (v17 >= 0x10)
      {
        syslog(3, "AppleD5500: %s out of range SPS id %d");
LABEL_102:
        HEVCReleasePPS((uint64_t)a2);
        v10 = 0xFFFFFFFFLL;
        *a2 = -1;
        return v10;
      }
    }
    v18 = *((_QWORD *)this + 13) >> 63;
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    *((_BYTE *)a2 + 8) = v18;
    v19 = *((_QWORD *)this + 13) >> 63;
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    *((_BYTE *)a2 + 9) = v19;
    v20 = *((_QWORD *)this + 13) >> 61;
    HEVC_RBSP::flush_bits((uint64_t)this, 3);
    a2[3] = v20;
    v21 = *((_QWORD *)this + 13) >> 63;
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    *((_BYTE *)a2 + 16) = v21;
    v22 = *((_QWORD *)this + 13) >> 63;
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    *((_BYTE *)a2 + 17) = v22;
    v23 = *((_QWORD *)this + 13);
    if ((v23 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits((uint64_t)this, 1);
      a2[5] = 0;
    }
    else
    {
      v24 = HIDWORD(v23);
      v25 = -32;
      do
      {
        LODWORD(v24) = 2 * v24;
        v26 = v25 + 1;
        if ((v24 & 0x80000000) != 0)
          break;
        v27 = v25 + 32;
        ++v25;
      }
      while (v27 < 0x1E);
      HEVC_RBSP::flush_bits((uint64_t)this, v26 + 33);
      v28 = *((_DWORD *)this + 27) >> -(char)v26;
      HEVC_RBSP::flush_bits((uint64_t)this, v26 + 32);
      v29 = v28 + ~(-2 << (v26 + 31));
      a2[5] = v29;
      if (v29 >= 0xF)
      {
        syslog(3, "AppleD5500: pps->num_ref_idx_l0_default_active_minus1 > HEVC_MAX_REF_INDEX_FOR_RPL, is %d");
        goto LABEL_102;
      }
    }
    v30 = *((_QWORD *)this + 13);
    if ((v30 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits((uint64_t)this, 1);
      a2[6] = 0;
    }
    else
    {
      v31 = HIDWORD(v30);
      v32 = -32;
      do
      {
        LODWORD(v31) = 2 * v31;
        v33 = v32 + 1;
        if ((v31 & 0x80000000) != 0)
          break;
        v34 = v32 + 32;
        ++v32;
      }
      while (v34 < 0x1E);
      HEVC_RBSP::flush_bits((uint64_t)this, v33 + 33);
      v35 = *((_DWORD *)this + 27) >> -(char)v33;
      HEVC_RBSP::flush_bits((uint64_t)this, v33 + 32);
      v36 = v35 + ~(-2 << (v33 + 31));
      a2[6] = v36;
      if (v36 >= 0xF)
      {
        syslog(3, "AppleD5500: pps->num_ref_idx_l1_default_active_minus1 > HEVC_MAX_REF_INDEX_FOR_RPL, is %d");
        goto LABEL_102;
      }
    }
    v37 = *((_QWORD *)this + 13);
    if ((v37 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits((uint64_t)this, 1);
      v43 = 0;
    }
    else
    {
      v38 = HIDWORD(v37);
      v39 = -32;
      do
      {
        LODWORD(v38) = 2 * v38;
        v40 = v39 + 1;
        if ((v38 & 0x80000000) != 0)
          break;
        v41 = v39 + 32;
        ++v39;
      }
      while (v41 < 0x1E);
      HEVC_RBSP::flush_bits((uint64_t)this, v40 + 33);
      v42 = *((_DWORD *)this + 27) >> -(char)v40;
      HEVC_RBSP::flush_bits((uint64_t)this, v40 + 32);
      v43 = v42 + ~(-2 << (v40 + 31));
    }
    a2[7] = (-((v43 & 1) == 0) ^ ((v43 + 1) >> 1)) + ((v43 & 1) == 0);
    v44 = *((_QWORD *)this + 13) >> 63;
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    *((_BYTE *)a2 + 32) = v44;
    v45 = *((_QWORD *)this + 13) >> 63;
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    *((_BYTE *)a2 + 33) = v45;
    v46 = *((_QWORD *)this + 13);
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    *((_BYTE *)a2 + 34) = v46 < 0;
    if (v46 < 0)
    {
      v47 = *((_QWORD *)this + 13);
      if ((v47 & 0x8000000000000000) != 0)
      {
        HEVC_RBSP::flush_bits((uint64_t)this, 1);
        v53 = 0;
      }
      else
      {
        v48 = HIDWORD(v47);
        v49 = -32;
        do
        {
          LODWORD(v48) = 2 * v48;
          v50 = v49 + 1;
          if ((v48 & 0x80000000) != 0)
            break;
          v51 = v49 + 32;
          ++v49;
        }
        while (v51 < 0x1E);
        HEVC_RBSP::flush_bits((uint64_t)this, v50 + 33);
        v52 = *((_DWORD *)this + 27) >> -(char)v50;
        HEVC_RBSP::flush_bits((uint64_t)this, v50 + 32);
        v53 = v52 + ~(-2 << (v50 + 31));
      }
      a2[9] = v53;
    }
    v54 = *((_QWORD *)this + 13);
    if ((v54 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits((uint64_t)this, 1);
      v60 = 0;
    }
    else
    {
      v55 = HIDWORD(v54);
      v56 = -32;
      do
      {
        LODWORD(v55) = 2 * v55;
        v57 = v56 + 1;
        if ((v55 & 0x80000000) != 0)
          break;
        v58 = v56 + 32;
        ++v56;
      }
      while (v58 < 0x1E);
      HEVC_RBSP::flush_bits((uint64_t)this, v57 + 33);
      v59 = *((_DWORD *)this + 27) >> -(char)v57;
      HEVC_RBSP::flush_bits((uint64_t)this, v57 + 32);
      v60 = v59 + ~(-2 << (v57 + 31));
    }
    a2[10] = (-((v60 & 1) == 0) ^ ((v60 + 1) >> 1)) + ((v60 & 1) == 0);
    v61 = *((_QWORD *)this + 13);
    if ((v61 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits((uint64_t)this, 1);
      v67 = 0;
    }
    else
    {
      v62 = HIDWORD(v61);
      v63 = -32;
      do
      {
        LODWORD(v62) = 2 * v62;
        v64 = v63 + 1;
        if ((v62 & 0x80000000) != 0)
          break;
        v65 = v63 + 32;
        ++v63;
      }
      while (v65 < 0x1E);
      HEVC_RBSP::flush_bits((uint64_t)this, v64 + 33);
      v66 = *((_DWORD *)this + 27) >> -(char)v64;
      HEVC_RBSP::flush_bits((uint64_t)this, v64 + 32);
      v67 = v66 + ~(-2 << (v64 + 31));
    }
    LOBYTE(v68) = 1;
    a2[11] = (-((v67 & 1) == 0) ^ ((v67 + 1) >> 1)) + ((v67 & 1) == 0);
    v69 = *((_QWORD *)this + 13) >> 63;
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    *((_BYTE *)a2 + 48) = v69;
    v70 = *((_QWORD *)this + 13) >> 63;
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    *((_BYTE *)a2 + 49) = v70;
    v71 = *((_QWORD *)this + 13) >> 63;
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    *((_BYTE *)a2 + 50) = v71;
    v72 = *((_QWORD *)this + 13) >> 63;
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    *((_BYTE *)a2 + 51) = v72;
    v73 = *((_QWORD *)this + 13) >> 63;
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    *((_BYTE *)a2 + 52) = v73;
    v74 = *((_QWORD *)this + 13) >> 63;
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    *((_BYTE *)a2 + 53) = v74;
    if (*((_BYTE *)a2 + 52))
    {
      v75 = *((_QWORD *)this + 13);
      if ((v75 & 0x8000000000000000) != 0)
      {
        HEVC_RBSP::flush_bits((uint64_t)this, 1);
        v81 = 0;
      }
      else
      {
        v76 = HIDWORD(v75);
        v77 = -32;
        do
        {
          LODWORD(v76) = 2 * v76;
          v78 = v77 + 1;
          if ((v76 & 0x80000000) != 0)
            break;
          v79 = v77 + 32;
          ++v77;
        }
        while (v79 < 0x1E);
        HEVC_RBSP::flush_bits((uint64_t)this, v78 + 33);
        v80 = *((_DWORD *)this + 27) >> -(char)v78;
        HEVC_RBSP::flush_bits((uint64_t)this, v78 + 32);
        v81 = v80 + ~(-2 << (v78 + 31));
      }
      a2[14] = v81;
      v82 = *((_QWORD *)this + 13);
      if ((v82 & 0x8000000000000000) != 0)
      {
        HEVC_RBSP::flush_bits((uint64_t)this, 1);
        v88 = 0;
      }
      else
      {
        v83 = HIDWORD(v82);
        v84 = -32;
        do
        {
          LODWORD(v83) = 2 * v83;
          v85 = v84 + 1;
          if ((v83 & 0x80000000) != 0)
            break;
          v86 = v84 + 32;
          ++v84;
        }
        while (v86 < 0x1E);
        HEVC_RBSP::flush_bits((uint64_t)this, v85 + 33);
        v87 = *((_DWORD *)this + 27) >> -(char)v85;
        HEVC_RBSP::flush_bits((uint64_t)this, v85 + 32);
        v88 = v87 + ~(-2 << (v85 + 31));
      }
      a2[15] = v88;
      if (a2[14] > 0x14u || v88 >= 0x17)
      {
        syslog(3, "AppleD5500: value out of range: num_tile_columns_minus1 %d num_tile_rows_minus1 %d");
        goto LABEL_102;
      }
      v89 = *((_QWORD *)this + 13);
      HEVC_RBSP::flush_bits((uint64_t)this, 1);
      *((_BYTE *)a2 + 64) = v89 < 0;
      if ((v89 & 0x8000000000000000) == 0)
      {
        if (a2[14])
        {
          v90 = 0;
          do
          {
            v91 = *((_QWORD *)this + 13);
            if ((v91 & 0x8000000000000000) != 0)
            {
              HEVC_RBSP::flush_bits((uint64_t)this, 1);
              v97 = 0;
            }
            else
            {
              v92 = HIDWORD(v91);
              v93 = -32;
              do
              {
                LODWORD(v92) = 2 * v92;
                v94 = v93 + 1;
                if ((v92 & 0x80000000) != 0)
                  break;
                v95 = v93 + 32;
                ++v93;
              }
              while (v95 < 0x1E);
              HEVC_RBSP::flush_bits((uint64_t)this, v94 + 33);
              v96 = *((_DWORD *)this + 27) >> -(char)v94;
              HEVC_RBSP::flush_bits((uint64_t)this, v94 + 32);
              v97 = v96 + ~(-2 << (v94 + 31));
            }
            a2[v90++ + 17] = v97;
          }
          while (v90 < a2[14]);
        }
        if (a2[15])
        {
          v98 = 0;
          do
          {
            v99 = *((_QWORD *)this + 13);
            if ((v99 & 0x8000000000000000) != 0)
            {
              HEVC_RBSP::flush_bits((uint64_t)this, 1);
              v105 = 0;
            }
            else
            {
              v100 = HIDWORD(v99);
              v101 = -32;
              do
              {
                LODWORD(v100) = 2 * v100;
                v102 = v101 + 1;
                if ((v100 & 0x80000000) != 0)
                  break;
                v103 = v101 + 32;
                ++v101;
              }
              while (v103 < 0x1E);
              HEVC_RBSP::flush_bits((uint64_t)this, v102 + 33);
              v104 = *((_DWORD *)this + 27) >> -(char)v102;
              HEVC_RBSP::flush_bits((uint64_t)this, v102 + 32);
              v105 = v104 + ~(-2 << (v102 + 31));
            }
            a2[v98++ + 37] = v105;
          }
          while (v98 < a2[15]);
        }
      }
      v68 = *((_QWORD *)this + 13) >> 63;
      HEVC_RBSP::flush_bits((uint64_t)this, 1);
    }
    *((_BYTE *)a2 + 236) = v68;
    v106 = *((_QWORD *)this + 13) >> 63;
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    *((_BYTE *)a2 + 237) = v106;
    v107 = *((_QWORD *)this + 13);
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    *((_BYTE *)a2 + 238) = v107 < 0;
    *(_WORD *)((char *)a2 + 239) = 0;
    a2[61] = 0;
    a2[62] = 0;
    if (v107 < 0)
    {
      v108 = *((_QWORD *)this + 13) >> 63;
      HEVC_RBSP::flush_bits((uint64_t)this, 1);
      *((_BYTE *)a2 + 239) = v108;
      v109 = *((_QWORD *)this + 13);
      HEVC_RBSP::flush_bits((uint64_t)this, 1);
      *((_BYTE *)a2 + 240) = v109 < 0;
      if ((v109 & 0x8000000000000000) == 0)
      {
        a2[61] = HEVC_RBSP::se_v(this);
        a2[62] = HEVC_RBSP::se_v(this);
      }
    }
    v110 = *((_QWORD *)this + 13);
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    *((_BYTE *)a2 + 252) = v110 < 0;
    if (v110 < 0 && !HEVC_RBSP::parseScalingListData(this, a2 + 64))
      return 0xFFFFFFFFLL;
    v111 = a2 + 1612;
    v112 = *((_QWORD *)this + 13) >> 63;
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    *((_BYTE *)a2 + 6448) = v112;
    v113 = *((_QWORD *)this + 13);
    if ((v113 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits((uint64_t)this, 1);
      v119 = 0;
    }
    else
    {
      v114 = HIDWORD(v113);
      v115 = -32;
      do
      {
        LODWORD(v114) = 2 * v114;
        v116 = v115 + 1;
        if ((v114 & 0x80000000) != 0)
          break;
        v117 = v115 + 32;
        ++v115;
      }
      while (v117 < 0x1E);
      HEVC_RBSP::flush_bits((uint64_t)this, v116 + 33);
      v118 = *((_DWORD *)this + 27) >> -(char)v116;
      HEVC_RBSP::flush_bits((uint64_t)this, v116 + 32);
      v119 = v118 + ~(-2 << (v116 + 31));
    }
    a2[1613] = v119;
    v121 = *((_QWORD *)this + 13) >> 63;
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    *((_BYTE *)a2 + 6456) = v121;
    v122 = *((_QWORD *)this + 13);
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    *((_BYTE *)a2 + 6457) = v122 < 0;
    if (v122 < 0)
    {
      v123 = *((_QWORD *)this + 13) >> 63;
      HEVC_RBSP::flush_bits((uint64_t)this, 1);
      *((_BYTE *)a2 + 6458) = v123;
      v124 = *((_QWORD *)this + 13) >> 63;
      HEVC_RBSP::flush_bits((uint64_t)this, 1);
      *((_BYTE *)a2 + 6459) = v124;
      v125 = *((_QWORD *)this + 13) >> 58;
      HEVC_RBSP::flush_bits((uint64_t)this, 6);
      *((_BYTE *)a2 + 6460) = v125;
      if (*((_BYTE *)a2 + 6458)
        && !HEVC_RBSP::parsePpsRangeExtension(this, (uint64_t)a2, (uint64_t)(a2 + 1616))
        || *((_BYTE *)a2 + 6459)
        && !HEVC_RBSP::parsePpsMultiLayerExtension((uint64_t)this, (uint64_t)(a2 + 1634)))
      {
        goto LABEL_102;
      }
      if (*((_BYTE *)a2 + 6460) && 8 * *((_DWORD *)this + 37) - *((_DWORD *)this + 38) >= 9)
      {
        do
        {
          v126 = *((_QWORD *)this + 13) >> 63;
          HEVC_RBSP::flush_bits((uint64_t)this, 1);
          *((_BYTE *)v111 + 3216) = v126;
        }
        while (8 * *((_DWORD *)this + 37) - *((_DWORD *)this + 38) > 8);
      }
    }
    HEVC_RBSP::byte_alignment(this);
    return v10;
  }
  syslog(3, "AppleD5500: %s out of range PPS id %d", "int32_t HEVC_RBSP::parsePPS(hevc_picture_parameter_set_t *)", v10);
  return 0xFFFFFFFFLL;
}

void HEVCReleasePPS(uint64_t a1)
{
  if (a1 && *(_DWORD *)a1 != -1 && *(_BYTE *)(a1 + 6458))
  {
    if (*(_BYTE *)(a1 + 6459))
    {
      free(*(void **)(a1 + 6552));
      free(*(void **)(a1 + 6560));
      free(*(void **)(a1 + 7592));
      free(*(void **)(a1 + 8624));
    }
  }
}

uint64_t HEVC_RBSP::parsePpsRangeExtension(HEVC_RBSP *this, uint64_t a2, uint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  int v7;
  int v8;
  unsigned int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  int v17;
  unsigned int v18;
  int v19;
  int v20;
  unint64_t v21;
  unint64_t v22;
  int v23;
  int v24;
  unsigned int v25;
  int v26;
  unsigned int v27;
  unsigned int v29;
  unint64_t v30;
  unint64_t v31;
  int v32;
  int v33;
  unsigned int v34;
  int v35;
  int v36;
  unint64_t v37;
  unint64_t v38;
  int v39;
  int v40;
  unsigned int v41;
  int v42;
  int v43;
  unint64_t v44;
  unint64_t v45;
  int v46;
  int v47;
  unsigned int v48;
  int v49;
  int v50;
  unint64_t v51;
  unint64_t v52;
  int v53;
  int v54;
  unsigned int v55;
  int v56;
  int v57;

  if (*(_BYTE *)(a2 + 33))
  {
    v5 = *((_QWORD *)this + 13);
    if ((v5 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits((uint64_t)this, 1);
      v11 = 0;
    }
    else
    {
      v6 = HIDWORD(v5);
      v7 = -32;
      do
      {
        LODWORD(v6) = 2 * v6;
        v8 = v7 + 1;
        if ((v6 & 0x80000000) != 0)
          break;
        v9 = v7 + 32;
        ++v7;
      }
      while (v9 < 0x1E);
      HEVC_RBSP::flush_bits((uint64_t)this, v8 + 33);
      v10 = *((_DWORD *)this + 27) >> -(char)v8;
      HEVC_RBSP::flush_bits((uint64_t)this, v8 + 32);
      v11 = v10 + ~(-2 << (v8 + 31));
    }
    *(_DWORD *)a3 = v11;
  }
  v12 = *((_QWORD *)this + 13) >> 63;
  HEVC_RBSP::flush_bits((uint64_t)this, 1);
  *(_BYTE *)(a3 + 4) = v12;
  v13 = *((_QWORD *)this + 13);
  HEVC_RBSP::flush_bits((uint64_t)this, 1);
  *(_BYTE *)(a3 + 5) = v13 < 0;
  if (v13 < 0)
  {
    v14 = *((_QWORD *)this + 13);
    if ((v14 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits((uint64_t)this, 1);
      v20 = 0;
    }
    else
    {
      v15 = HIDWORD(v14);
      v16 = -32;
      do
      {
        LODWORD(v15) = 2 * v15;
        v17 = v16 + 1;
        if ((v15 & 0x80000000) != 0)
          break;
        v18 = v16 + 32;
        ++v16;
      }
      while (v18 < 0x1E);
      HEVC_RBSP::flush_bits((uint64_t)this, v17 + 33);
      v19 = *((_DWORD *)this + 27) >> -(char)v17;
      HEVC_RBSP::flush_bits((uint64_t)this, v17 + 32);
      v20 = v19 + ~(-2 << (v17 + 31));
    }
    *(_DWORD *)(a3 + 8) = v20;
    v21 = *((_QWORD *)this + 13);
    if ((v21 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits((uint64_t)this, 1);
      *(_DWORD *)(a3 + 12) = 0;
    }
    else
    {
      v22 = HIDWORD(v21);
      v23 = -32;
      do
      {
        LODWORD(v22) = 2 * v22;
        v24 = v23 + 1;
        if ((v22 & 0x80000000) != 0)
          break;
        v25 = v23 + 32;
        ++v23;
      }
      while (v25 < 0x1E);
      HEVC_RBSP::flush_bits((uint64_t)this, v24 + 33);
      v26 = *((_DWORD *)this + 27) >> -(char)v24;
      HEVC_RBSP::flush_bits((uint64_t)this, v24 + 32);
      v27 = v26 + ~(-2 << (v24 + 31));
      *(_DWORD *)(a3 + 12) = v27;
      if (v27 > 5)
      {
        syslog(3, "AppleD5500: chroma_qp_offset_list_len_minus1:%d is > 5!", v26 + ~(-2 << (v24 + 31)));
        return 0;
      }
    }
    v29 = 0;
    do
    {
      v30 = *((_QWORD *)this + 13);
      if ((v30 & 0x8000000000000000) != 0)
      {
        HEVC_RBSP::flush_bits((uint64_t)this, 1);
        v36 = 0;
      }
      else
      {
        v31 = HIDWORD(v30);
        v32 = -32;
        do
        {
          LODWORD(v31) = 2 * v31;
          v33 = v32 + 1;
          if ((v31 & 0x80000000) != 0)
            break;
          v34 = v32 + 32;
          ++v32;
        }
        while (v34 < 0x1E);
        HEVC_RBSP::flush_bits((uint64_t)this, v33 + 33);
        v35 = *((_DWORD *)this + 27) >> -(char)v33;
        HEVC_RBSP::flush_bits((uint64_t)this, v33 + 32);
        v36 = v35 + ~(-2 << (v33 + 31));
      }
      *(_DWORD *)(a3 + 4 * v29 + 16) = (-((v36 & 1) == 0) ^ ((v36 + 1) >> 1)) + ((v36 & 1) == 0);
      v37 = *((_QWORD *)this + 13);
      if ((v37 & 0x8000000000000000) != 0)
      {
        HEVC_RBSP::flush_bits((uint64_t)this, 1);
        v43 = 0;
      }
      else
      {
        v38 = HIDWORD(v37);
        v39 = -32;
        do
        {
          LODWORD(v38) = 2 * v38;
          v40 = v39 + 1;
          if ((v38 & 0x80000000) != 0)
            break;
          v41 = v39 + 32;
          ++v39;
        }
        while (v41 < 0x1E);
        HEVC_RBSP::flush_bits((uint64_t)this, v40 + 33);
        v42 = *((_DWORD *)this + 27) >> -(char)v40;
        HEVC_RBSP::flush_bits((uint64_t)this, v40 + 32);
        v43 = v42 + ~(-2 << (v40 + 31));
      }
      *(_DWORD *)(a3 + 4 * v29++ + 40) = (-((v43 & 1) == 0) ^ ((v43 + 1) >> 1)) + ((v43 & 1) == 0);
    }
    while (v29 <= *(_DWORD *)(a3 + 12));
  }
  v44 = *((_QWORD *)this + 13);
  if ((v44 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    v50 = 0;
  }
  else
  {
    v45 = HIDWORD(v44);
    v46 = -32;
    do
    {
      LODWORD(v45) = 2 * v45;
      v47 = v46 + 1;
      if ((v45 & 0x80000000) != 0)
        break;
      v48 = v46 + 32;
      ++v46;
    }
    while (v48 < 0x1E);
    HEVC_RBSP::flush_bits((uint64_t)this, v47 + 33);
    v49 = *((_DWORD *)this + 27) >> -(char)v47;
    HEVC_RBSP::flush_bits((uint64_t)this, v47 + 32);
    v50 = v49 + ~(-2 << (v47 + 31));
  }
  *(_DWORD *)(a3 + 64) = v50;
  v51 = *((_QWORD *)this + 13);
  if ((v51 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    v57 = 0;
  }
  else
  {
    v52 = HIDWORD(v51);
    v53 = -32;
    do
    {
      LODWORD(v52) = 2 * v52;
      v54 = v53 + 1;
      if ((v52 & 0x80000000) != 0)
        break;
      v55 = v53 + 32;
      ++v53;
    }
    while (v55 < 0x1E);
    HEVC_RBSP::flush_bits((uint64_t)this, v54 + 33);
    v56 = *((_DWORD *)this + 27) >> -(char)v54;
    HEVC_RBSP::flush_bits((uint64_t)this, v54 + 32);
    v57 = v56 + ~(-2 << (v54 + 31));
  }
  *(_DWORD *)(a3 + 68) = v57;
  return 1;
}

uint64_t HEVC_RBSP::parsePpsMultiLayerExtension(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  int v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  _DWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int v24;
  int v25;
  unsigned int v26;
  int v27;
  int v28;
  unint64_t v29;
  unint64_t v30;
  int v31;
  int v32;
  unsigned int v33;
  int v34;
  int v35;
  unint64_t v36;
  unint64_t v37;
  int v38;
  int v39;
  unsigned int v40;
  int v41;
  int v42;
  unint64_t v43;
  unint64_t v44;
  int v45;
  int v46;
  unsigned int v47;
  int v48;
  int v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  int v53;
  int v54;
  unsigned int v55;
  int v56;
  int v57;
  unint64_t v58;
  unint64_t v59;
  int v60;
  int v61;
  unsigned int v62;
  int v63;
  int v64;
  unint64_t v65;
  unint64_t v66;
  int v67;
  int v68;
  unsigned int v69;
  int v70;
  int v71;
  unint64_t v72;
  unint64_t v73;
  int v74;
  int v75;
  unsigned int v76;
  int v77;
  int v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  int v82;
  int v83;
  unsigned int v84;
  int v85;
  int v86;
  unint64_t v87;
  unint64_t v88;
  int v89;
  int v90;
  unsigned int v91;
  int v92;
  int v93;
  unint64_t v94;
  unint64_t v95;
  int v96;
  int v97;
  unsigned int v98;
  int v99;
  int v100;
  unint64_t v101;
  unint64_t v102;
  int v103;
  int v104;
  unsigned int v105;
  int v106;
  int v107;
  uint64_t v108;
  uint64_t v109;

  v4 = *(_QWORD *)(a1 + 104) >> 63;
  HEVC_RBSP::flush_bits(a1, 1);
  *(_BYTE *)a2 = v4;
  v5 = *(_QWORD *)(a1 + 104);
  HEVC_RBSP::flush_bits(a1, 1);
  *(_BYTE *)(a2 + 1) = v5 < 0;
  if (v5 < 0)
  {
    v6 = *(_QWORD *)(a1 + 104) >> 58;
    HEVC_RBSP::flush_bits(a1, 6);
    *(_DWORD *)(a2 + 4) = v6;
  }
  v7 = *(_QWORD *)(a1 + 104);
  if ((v7 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits(a1, 1);
    v13 = 0;
    *(_DWORD *)(a2 + 8) = 0;
    v14 = (_DWORD *)(a2 + 8);
  }
  else
  {
    v8 = HIDWORD(v7);
    v9 = -32;
    do
    {
      LODWORD(v8) = 2 * v8;
      v10 = v9 + 1;
      if ((v8 & 0x80000000) != 0)
        break;
      v11 = v9 + 32;
      ++v9;
    }
    while (v11 < 0x1E);
    HEVC_RBSP::flush_bits(a1, v10 + 33);
    v12 = *(_DWORD *)(a1 + 108) >> -(char)v10;
    HEVC_RBSP::flush_bits(a1, v10 + 32);
    v13 = v12 + ~(-2 << (v10 + 31));
    *(_DWORD *)(a2 + 8) = v13;
    v14 = (_DWORD *)(a2 + 8);
    if (v13 >= 0x40)
    {
      syslog(3, "AppleD5500: ERROR: num_ref_loc_offsets:%d is > 63!");
      return 0;
    }
  }
  v15 = malloc_type_calloc(4uLL, v13, 0xA0FA8978uLL);
  *(_QWORD *)(a2 + 16) = v15;
  if (!v15)
    goto LABEL_96;
  v16 = malloc_type_calloc(1uLL, *(unsigned int *)(a2 + 8), 0xA0CD15C5uLL);
  *(_QWORD *)(a2 + 24) = v16;
  if (!v16)
  {
    syslog(3, "AppleD5500: ERROR: extension->scaled_ref_layer_offset_present_flag bad alloc \n");
    return 0;
  }
  v17 = malloc_type_calloc(1uLL, *(unsigned int *)(a2 + 8), 0xFDCCB6E7uLL);
  *(_QWORD *)(a2 + 1056) = v17;
  if (!v17)
  {
    syslog(3, "AppleD5500: ERROR: extension->ref_region_offset_present_flag bad alloc \n");
    return 0;
  }
  v18 = malloc_type_calloc(1uLL, *(unsigned int *)(a2 + 8), 0x20A86A77uLL);
  *(_QWORD *)(a2 + 2088) = v18;
  if (!v18)
  {
LABEL_96:
    syslog(3, "AppleD5500: ERROR: extension->ref_loc_offset_layer_id bad alloc \n");
    return 0;
  }
  if (*v14)
  {
    v19 = 0;
    do
    {
      v20 = *(_QWORD *)(a1 + 104) >> 58;
      HEVC_RBSP::flush_bits(a1, 6);
      *(_DWORD *)(*(_QWORD *)(a2 + 16) + 4 * v19) = v20;
      v21 = *(_QWORD *)(a1 + 104) >> 63;
      HEVC_RBSP::flush_bits(a1, 1);
      *(_BYTE *)(*(_QWORD *)(a2 + 24) + v19) = v21;
      if (*(_BYTE *)(*(_QWORD *)(a2 + 24) + v19))
      {
        v22 = *(_QWORD *)(a1 + 104);
        if ((v22 & 0x8000000000000000) != 0)
        {
          HEVC_RBSP::flush_bits(a1, 1);
          v28 = 0;
        }
        else
        {
          v23 = HIDWORD(v22);
          v24 = -32;
          do
          {
            LODWORD(v23) = 2 * v23;
            v25 = v24 + 1;
            if ((v23 & 0x80000000) != 0)
              break;
            v26 = v24 + 32;
            ++v24;
          }
          while (v26 < 0x1E);
          HEVC_RBSP::flush_bits(a1, v25 + 33);
          v27 = *(_DWORD *)(a1 + 108) >> -(char)v25;
          HEVC_RBSP::flush_bits(a1, v25 + 32);
          v28 = v27 + ~(-2 << (v25 + 31));
        }
        *(_DWORD *)(a2 + 4 * *(unsigned int *)(*(_QWORD *)(a2 + 16) + 4 * v19) + 32) = (-((v28 & 1) == 0) ^ ((v28 + 1) >> 1))
                                                                                       + ((v28 & 1) == 0);
        v29 = *(_QWORD *)(a1 + 104);
        if ((v29 & 0x8000000000000000) != 0)
        {
          HEVC_RBSP::flush_bits(a1, 1);
          v35 = 0;
        }
        else
        {
          v30 = HIDWORD(v29);
          v31 = -32;
          do
          {
            LODWORD(v30) = 2 * v30;
            v32 = v31 + 1;
            if ((v30 & 0x80000000) != 0)
              break;
            v33 = v31 + 32;
            ++v31;
          }
          while (v33 < 0x1E);
          HEVC_RBSP::flush_bits(a1, v32 + 33);
          v34 = *(_DWORD *)(a1 + 108) >> -(char)v32;
          HEVC_RBSP::flush_bits(a1, v32 + 32);
          v35 = v34 + ~(-2 << (v32 + 31));
        }
        *(_DWORD *)(a2 + 4 * *(unsigned int *)(*(_QWORD *)(a2 + 16) + 4 * v19) + 288) = (-((v35 & 1) == 0) ^ ((v35 + 1) >> 1))
                                                                                        + ((v35 & 1) == 0);
        v36 = *(_QWORD *)(a1 + 104);
        if ((v36 & 0x8000000000000000) != 0)
        {
          HEVC_RBSP::flush_bits(a1, 1);
          v42 = 0;
        }
        else
        {
          v37 = HIDWORD(v36);
          v38 = -32;
          do
          {
            LODWORD(v37) = 2 * v37;
            v39 = v38 + 1;
            if ((v37 & 0x80000000) != 0)
              break;
            v40 = v38 + 32;
            ++v38;
          }
          while (v40 < 0x1E);
          HEVC_RBSP::flush_bits(a1, v39 + 33);
          v41 = *(_DWORD *)(a1 + 108) >> -(char)v39;
          HEVC_RBSP::flush_bits(a1, v39 + 32);
          v42 = v41 + ~(-2 << (v39 + 31));
        }
        *(_DWORD *)(a2 + 4 * *(unsigned int *)(*(_QWORD *)(a2 + 16) + 4 * v19) + 544) = (-((v42 & 1) == 0) ^ ((v42 + 1) >> 1))
                                                                                        + ((v42 & 1) == 0);
        v43 = *(_QWORD *)(a1 + 104);
        if ((v43 & 0x8000000000000000) != 0)
        {
          HEVC_RBSP::flush_bits(a1, 1);
          v49 = 0;
        }
        else
        {
          v44 = HIDWORD(v43);
          v45 = -32;
          do
          {
            LODWORD(v44) = 2 * v44;
            v46 = v45 + 1;
            if ((v44 & 0x80000000) != 0)
              break;
            v47 = v45 + 32;
            ++v45;
          }
          while (v47 < 0x1E);
          HEVC_RBSP::flush_bits(a1, v46 + 33);
          v48 = *(_DWORD *)(a1 + 108) >> -(char)v46;
          HEVC_RBSP::flush_bits(a1, v46 + 32);
          v49 = v48 + ~(-2 << (v46 + 31));
        }
        *(_DWORD *)(a2 + 4 * *(unsigned int *)(*(_QWORD *)(a2 + 16) + 4 * v19) + 800) = (-((v49 & 1) == 0) ^ ((v49 + 1) >> 1))
                                                                                        + ((v49 & 1) == 0);
      }
      v50 = *(_QWORD *)(a1 + 104) >> 63;
      HEVC_RBSP::flush_bits(a1, 1);
      *(_BYTE *)(*(_QWORD *)(a2 + 1056) + v19) = v50;
      if (*(_BYTE *)(*(_QWORD *)(a2 + 1056) + v19))
      {
        v51 = *(_QWORD *)(a1 + 104);
        if ((v51 & 0x8000000000000000) != 0)
        {
          HEVC_RBSP::flush_bits(a1, 1);
          v57 = 0;
        }
        else
        {
          v52 = HIDWORD(v51);
          v53 = -32;
          do
          {
            LODWORD(v52) = 2 * v52;
            v54 = v53 + 1;
            if ((v52 & 0x80000000) != 0)
              break;
            v55 = v53 + 32;
            ++v53;
          }
          while (v55 < 0x1E);
          HEVC_RBSP::flush_bits(a1, v54 + 33);
          v56 = *(_DWORD *)(a1 + 108) >> -(char)v54;
          HEVC_RBSP::flush_bits(a1, v54 + 32);
          v57 = v56 + ~(-2 << (v54 + 31));
        }
        *(_DWORD *)(a2 + 4 * *(unsigned int *)(*(_QWORD *)(a2 + 16) + 4 * v19) + 1064) = (-((v57 & 1) == 0) ^ ((v57 + 1) >> 1))
                                                                                         + ((v57 & 1) == 0);
        v58 = *(_QWORD *)(a1 + 104);
        if ((v58 & 0x8000000000000000) != 0)
        {
          HEVC_RBSP::flush_bits(a1, 1);
          v64 = 0;
        }
        else
        {
          v59 = HIDWORD(v58);
          v60 = -32;
          do
          {
            LODWORD(v59) = 2 * v59;
            v61 = v60 + 1;
            if ((v59 & 0x80000000) != 0)
              break;
            v62 = v60 + 32;
            ++v60;
          }
          while (v62 < 0x1E);
          HEVC_RBSP::flush_bits(a1, v61 + 33);
          v63 = *(_DWORD *)(a1 + 108) >> -(char)v61;
          HEVC_RBSP::flush_bits(a1, v61 + 32);
          v64 = v63 + ~(-2 << (v61 + 31));
        }
        *(_DWORD *)(a2 + 4 * *(unsigned int *)(*(_QWORD *)(a2 + 16) + 4 * v19) + 1320) = (-((v64 & 1) == 0) ^ ((v64 + 1) >> 1))
                                                                                         + ((v64 & 1) == 0);
        v65 = *(_QWORD *)(a1 + 104);
        if ((v65 & 0x8000000000000000) != 0)
        {
          HEVC_RBSP::flush_bits(a1, 1);
          v71 = 0;
        }
        else
        {
          v66 = HIDWORD(v65);
          v67 = -32;
          do
          {
            LODWORD(v66) = 2 * v66;
            v68 = v67 + 1;
            if ((v66 & 0x80000000) != 0)
              break;
            v69 = v67 + 32;
            ++v67;
          }
          while (v69 < 0x1E);
          HEVC_RBSP::flush_bits(a1, v68 + 33);
          v70 = *(_DWORD *)(a1 + 108) >> -(char)v68;
          HEVC_RBSP::flush_bits(a1, v68 + 32);
          v71 = v70 + ~(-2 << (v68 + 31));
        }
        *(_DWORD *)(a2 + 4 * *(unsigned int *)(*(_QWORD *)(a2 + 16) + 4 * v19) + 1576) = (-((v71 & 1) == 0) ^ ((v71 + 1) >> 1))
                                                                                         + ((v71 & 1) == 0);
        v72 = *(_QWORD *)(a1 + 104);
        if ((v72 & 0x8000000000000000) != 0)
        {
          HEVC_RBSP::flush_bits(a1, 1);
          v78 = 0;
        }
        else
        {
          v73 = HIDWORD(v72);
          v74 = -32;
          do
          {
            LODWORD(v73) = 2 * v73;
            v75 = v74 + 1;
            if ((v73 & 0x80000000) != 0)
              break;
            v76 = v74 + 32;
            ++v74;
          }
          while (v76 < 0x1E);
          HEVC_RBSP::flush_bits(a1, v75 + 33);
          v77 = *(_DWORD *)(a1 + 108) >> -(char)v75;
          HEVC_RBSP::flush_bits(a1, v75 + 32);
          v78 = v77 + ~(-2 << (v75 + 31));
        }
        *(_DWORD *)(a2 + 4 * *(unsigned int *)(*(_QWORD *)(a2 + 16) + 4 * v19) + 1832) = (-((v78 & 1) == 0) ^ ((v78 + 1) >> 1))
                                                                                         + ((v78 & 1) == 0);
      }
      v79 = *(_QWORD *)(a1 + 104) >> 63;
      HEVC_RBSP::flush_bits(a1, 1);
      *(_BYTE *)(*(_QWORD *)(a2 + 2088) + v19) = v79;
      if (*(_BYTE *)(*(_QWORD *)(a2 + 2088) + v19))
      {
        v80 = *(_QWORD *)(a1 + 104);
        if ((v80 & 0x8000000000000000) != 0)
        {
          HEVC_RBSP::flush_bits(a1, 1);
          v86 = 0;
        }
        else
        {
          v81 = HIDWORD(v80);
          v82 = -32;
          do
          {
            LODWORD(v81) = 2 * v81;
            v83 = v82 + 1;
            if ((v81 & 0x80000000) != 0)
              break;
            v84 = v82 + 32;
            ++v82;
          }
          while (v84 < 0x1E);
          HEVC_RBSP::flush_bits(a1, v83 + 33);
          v85 = *(_DWORD *)(a1 + 108) >> -(char)v83;
          HEVC_RBSP::flush_bits(a1, v83 + 32);
          v86 = v85 + ~(-2 << (v83 + 31));
        }
        *(_DWORD *)(a2 + 4 * *(unsigned int *)(*(_QWORD *)(a2 + 16) + 4 * v19) + 2096) = (-((v86 & 1) == 0) ^ ((v86 + 1) >> 1))
                                                                                         + ((v86 & 1) == 0);
        v87 = *(_QWORD *)(a1 + 104);
        if ((v87 & 0x8000000000000000) != 0)
        {
          HEVC_RBSP::flush_bits(a1, 1);
          v93 = 0;
        }
        else
        {
          v88 = HIDWORD(v87);
          v89 = -32;
          do
          {
            LODWORD(v88) = 2 * v88;
            v90 = v89 + 1;
            if ((v88 & 0x80000000) != 0)
              break;
            v91 = v89 + 32;
            ++v89;
          }
          while (v91 < 0x1E);
          HEVC_RBSP::flush_bits(a1, v90 + 33);
          v92 = *(_DWORD *)(a1 + 108) >> -(char)v90;
          HEVC_RBSP::flush_bits(a1, v90 + 32);
          v93 = v92 + ~(-2 << (v90 + 31));
        }
        *(_DWORD *)(a2 + 4 * *(unsigned int *)(*(_QWORD *)(a2 + 16) + 4 * v19) + 2352) = (-((v93 & 1) == 0) ^ ((v93 + 1) >> 1))
                                                                                         + ((v93 & 1) == 0);
        v94 = *(_QWORD *)(a1 + 104);
        if ((v94 & 0x8000000000000000) != 0)
        {
          HEVC_RBSP::flush_bits(a1, 1);
          v100 = 0;
        }
        else
        {
          v95 = HIDWORD(v94);
          v96 = -32;
          do
          {
            LODWORD(v95) = 2 * v95;
            v97 = v96 + 1;
            if ((v95 & 0x80000000) != 0)
              break;
            v98 = v96 + 32;
            ++v96;
          }
          while (v98 < 0x1E);
          HEVC_RBSP::flush_bits(a1, v97 + 33);
          v99 = *(_DWORD *)(a1 + 108) >> -(char)v97;
          HEVC_RBSP::flush_bits(a1, v97 + 32);
          v100 = v99 + ~(-2 << (v97 + 31));
        }
        *(_DWORD *)(a2 + 4 * *(unsigned int *)(*(_QWORD *)(a2 + 16) + 4 * v19) + 2608) = (-((v100 & 1) == 0) ^ ((v100 + 1) >> 1))
                                                                                         + ((v100 & 1) == 0);
        v101 = *(_QWORD *)(a1 + 104);
        if ((v101 & 0x8000000000000000) != 0)
        {
          HEVC_RBSP::flush_bits(a1, 1);
          v107 = 0;
        }
        else
        {
          v102 = HIDWORD(v101);
          v103 = -32;
          do
          {
            LODWORD(v102) = 2 * v102;
            v104 = v103 + 1;
            if ((v102 & 0x80000000) != 0)
              break;
            v105 = v103 + 32;
            ++v103;
          }
          while (v105 < 0x1E);
          HEVC_RBSP::flush_bits(a1, v104 + 33);
          v106 = *(_DWORD *)(a1 + 108) >> -(char)v104;
          HEVC_RBSP::flush_bits(a1, v104 + 32);
          v107 = v106 + ~(-2 << (v104 + 31));
        }
        *(_DWORD *)(a2 + 4 * *(unsigned int *)(*(_QWORD *)(a2 + 16) + 4 * v19) + 2864) = (-((v107 & 1) == 0) ^ ((v107 + 1) >> 1))
                                                                                         + ((v107 & 1) == 0);
      }
      ++v19;
    }
    while (v19 < *v14);
  }
  v108 = *(_QWORD *)(a1 + 104) >> 63;
  v109 = 1;
  HEVC_RBSP::flush_bits(a1, 1);
  *(_BYTE *)(a2 + 3120) = v108;
  return v109;
}

unint64_t HEVC_RBSP::isSliceSegmentFirstInPicture(HEVC_RBSP *this)
{
  unint64_t v1;

  v1 = *((_QWORD *)this + 13);
  HEVC_RBSP::flush_bits((uint64_t)this, 1);
  return v1 >> 63;
}

uint64_t HEVC_RBSP::parseSliceHeader(uint64_t a1, char *a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int v14;
  int v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  int v22;
  unsigned int v23;
  BOOL v24;
  int v25;
  unint64_t v26;
  unint64_t v27;
  int v28;
  int v29;
  unsigned int v30;
  int v31;
  int v32;
  unint64_t v33;
  unint64_t v34;
  int v35;
  int v36;
  unsigned int v37;
  int v38;
  int v39;
  uint64_t v40;
  uint64_t v42;
  unsigned int *v43;
  int v44;
  unsigned int v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  int v49;
  int v50;
  unsigned int v51;
  int v52;
  unsigned int v53;
  _DWORD *v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  unsigned int v61;
  int v62;
  unint64_t v63;
  unint64_t v64;
  int v65;
  int v66;
  unsigned int v67;
  int v68;
  int v69;
  unsigned int v70;
  unsigned int v71;
  int v72;
  unsigned int v73;
  int v74;
  unsigned int *v75;
  unsigned int v76;
  unsigned int v77;
  int v78;
  unsigned int v79;
  unsigned int v80;
  unint64_t v81;
  uint64_t v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  int v86;
  unint64_t v87;
  unint64_t v88;
  int v89;
  int v90;
  unsigned int v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  unsigned int *v95;
  unsigned int v96;
  _OWORD *v97;
  __int128 *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unsigned int v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unsigned int v118;
  unsigned int v119;
  uint64_t v120;
  _DWORD *v121;
  _DWORD *v122;
  uint64_t v123;
  unsigned int v124;
  unsigned int v125;
  char v126;
  int v127;
  int32x2_t *v128;

  bzero(a2, 0x59CuLL);
  v10 = *(_QWORD *)(a1 + 104) >> 63;
  HEVC_RBSP::flush_bits(a1, 1);
  *a2 = v10;
  if ((a3 & 0xFFFFFFF8) == 0x10)
  {
    v11 = *(_QWORD *)(a1 + 104) >> 63;
    HEVC_RBSP::flush_bits(a1, 1);
    a2[1] = v11;
  }
  v12 = *(_QWORD *)(a1 + 104);
  if ((v12 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits(a1, 1);
    v18 = 0;
    *((_DWORD *)a2 + 1) = 0;
  }
  else
  {
    v13 = HIDWORD(v12);
    v14 = -32;
    do
    {
      LODWORD(v13) = 2 * v13;
      v15 = v14 + 1;
      if ((v13 & 0x80000000) != 0)
        break;
      v16 = v14 + 32;
      ++v14;
    }
    while (v16 < 0x1E);
    HEVC_RBSP::flush_bits(a1, v15 + 33);
    v17 = *(_DWORD *)(a1 + 108) >> -(char)v15;
    HEVC_RBSP::flush_bits(a1, v15 + 32);
    v18 = v17 + ~(-2 << (v15 + 31));
    *((_DWORD *)a2 + 1) = v18;
    if (v18 >= 0x40)
    {
      syslog(3, "AppleD5500: slice->slice_pic_parameter_set_id > HEVC_MAX_PPS_SET, is %d");
      return 0;
    }
  }
  if (*(_DWORD *)(a5 + 9672 * v18) == -1)
  {
    syslog(3, "AppleD5500: PPS doesn't exist for slice header parsing");
    return 0;
  }
  v19 = v18;
  v20 = *(_DWORD *)(a5 + 9672 * v18 + 4);
  if (*(_DWORD *)(a4 + 18584 * v20 + 456) == -1)
  {
    syslog(3, "AppleD5500: SPS doesn't exist for slice header parsing");
    return 0;
  }
  if (!*a2)
  {
    if (*(_BYTE *)(a5 + 9672 * v18 + 8))
    {
      v21 = *(_QWORD *)(a1 + 104) >> 63;
      HEVC_RBSP::flush_bits(a1, 1);
      a2[8] = v21;
    }
    v22 = 0;
    v23 = *(_DWORD *)(a4 + 18584 * v20 + 18532) - 1;
    if (*(_DWORD *)(a4 + 18584 * v20 + 18532) != 1)
    {
      do
      {
        ++v22;
        v24 = v23 > 1;
        v23 >>= 1;
      }
      while (v24);
    }
    v25 = *(_DWORD *)(a1 + 108) >> -(char)v22;
    HEVC_RBSP::flush_bits(a1, v22);
    *((_DWORD *)a2 + 3) = v25;
  }
  if (a2[8])
    goto LABEL_19;
  v128 = (int32x2_t *)(a4 + 18584 * v20);
  a2[386] = 1;
  v42 = a5 + 9672 * v19;
  v44 = *(_DWORD *)(v42 + 12);
  v43 = (unsigned int *)(v42 + 12);
  if (v44)
  {
    v45 = 0;
    do
    {
      v46 = *(_QWORD *)(a1 + 104) >> 63;
      HEVC_RBSP::flush_bits(a1, 1);
      a2[16] = v46;
      ++v45;
    }
    while (v45 < *v43);
  }
  v47 = *(_QWORD *)(a1 + 104);
  if ((v47 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits(a1, 1);
    *((_DWORD *)a2 + 5) = 0;
    v54 = a2 + 20;
  }
  else
  {
    v48 = HIDWORD(v47);
    v49 = -32;
    do
    {
      LODWORD(v48) = 2 * v48;
      v50 = v49 + 1;
      if ((v48 & 0x80000000) != 0)
        break;
      v51 = v49 + 32;
      ++v49;
    }
    while (v51 < 0x1E);
    HEVC_RBSP::flush_bits(a1, v50 + 33);
    v52 = *(_DWORD *)(a1 + 108) >> -(char)v50;
    HEVC_RBSP::flush_bits(a1, v50 + 32);
    v53 = v52 + ~(-2 << (v50 + 31));
    *((_DWORD *)a2 + 5) = v53;
    v54 = a2 + 20;
    if (v53 > 2)
    {
      syslog(3, "AppleD5500: illegal slice type %d");
      return 0;
    }
  }
  if (*(_BYTE *)(a5 + 9672 * v19 + 9))
  {
    v55 = *(_QWORD *)(a1 + 104) >> 63;
    HEVC_RBSP::flush_bits(a1, 1);
  }
  else
  {
    LOBYTE(v55) = 1;
  }
  a2[24] = v55;
  if (*(_BYTE *)(a4 + 18584 * v20 + 464) == 1)
  {
    v56 = *(_QWORD *)(a1 + 104) >> 62;
    HEVC_RBSP::flush_bits(a1, 2);
    *((_DWORD *)a2 + 7) = v56;
  }
  if ((a3 - 21) <= 0xFFFFFFFD)
  {
    v57 = *(_DWORD *)(a4 + 18584 * v20 + 504);
    v126 = 28 - v57;
    v127 = v57 + 4;
    v58 = *(_DWORD *)(a1 + 108) >> (28 - v57);
    HEVC_RBSP::flush_bits(a1, v57 + 4);
    *((_DWORD *)a2 + 8) = v58;
    v59 = *(_QWORD *)(a1 + 104);
    HEVC_RBSP::flush_bits(a1, 1);
    a2[36] = v59 < 0;
    v60 = a4 + 18584 * v20;
    if (v59 < 0)
    {
      v71 = *(_DWORD *)(v60 + 6840);
      if (v71 >= 2)
      {
        v72 = 0;
        v73 = v71 - 1;
        do
        {
          --v72;
          v24 = v73 > 1;
          v73 >>= 1;
        }
        while (v24);
        v74 = *(_DWORD *)(a1 + 108) >> v72;
        HEVC_RBSP::flush_bits(a1, -v72);
        *((_DWORD *)a2 + 10) = v74;
      }
    }
    else if ((HEVC_RBSP::parseShortTermRefPicSet((HEVC_RBSP *)a1, v60 + 6844, *(_DWORD *)(v60 + 6840), *(_DWORD *)(v60 + 6840)) & 1) == 0)
    {
      return 0;
    }
    v122 = v54;
    if (*(_BYTE *)(a4 + 18584 * v20 + 18024))
    {
      v75 = (unsigned int *)(a4 + 18584 * v20 + 18028);
      if (*v75)
      {
        v76 = HEVC_RBSP::ue_v((HEVC_RBSP *)a1);
        *((_DWORD *)a2 + 54) = v76;
        if (v76 > *v75)
        {
          syslog(3, "AppleD5500: slice->num_long_term_sps out of range; is %d, limit %d, ");
          return 0;
        }
      }
      v77 = HEVC_RBSP::ue_v((HEVC_RBSP *)a1);
      *((_DWORD *)a2 + 55) = v77;
      if (v77 >= 0x11)
      {
        syslog(3, "AppleD5500: slice->num_long_term_pics out of range; is %d");
        return 0;
      }
      v78 = 0;
      v79 = *v75 - 1;
      if (*v75 != 1)
      {
        do
        {
          ++v78;
          v24 = v79 > 1;
          v79 >>= 1;
        }
        while (v24);
      }
      v80 = *((_DWORD *)a2 + 54) + v77;
      if (v80 > 0x10)
      {
        syslog(3, "AppleD5500: %s: WARNING, too many long term refs, %u\n");
        return 0;
      }
      v121 = (_DWORD *)(a4 + 18584 * v20 + 18028);
      if (v80)
      {
        v81 = 0;
        v124 = v20;
        v125 = v19;
        v123 = *((_DWORD *)a2 + 54) + v77;
        do
        {
          if (v81 >= *((unsigned int *)a2 + 54))
          {
            v83 = *(_DWORD *)(a1 + 108) >> v126;
            HEVC_RBSP::flush_bits(a1, v127);
            *(_DWORD *)&a2[4 * v81 + 1292] = v83;
            v82 = *(_QWORD *)(a1 + 104) >> 63;
            HEVC_RBSP::flush_bits(a1, 1);
          }
          else
          {
            if (*v121 < 2u)
            {
              LODWORD(v82) = 0;
            }
            else
            {
              LODWORD(v82) = *(_DWORD *)(a1 + 108) >> (32 - v78);
              HEVC_RBSP::flush_bits(a1, v78);
              if (v82 >= 0x20)
              {
                syslog(3, "AppleD5500: lt_idx_sps >= HEVC_MAX_SPS_LT_REF_PICS, is %d");
                return 0;
              }
            }
            v84 = a4 + 18584 * v20;
            *(_DWORD *)&a2[4 * v81 + 1292] = *(_DWORD *)(v84 + 4 * v82 + 18032);
            LOBYTE(v82) = *(_BYTE *)(v84 + v82 + 18160);
          }
          a2[v81 + 1356] = v82;
          v85 = *(_QWORD *)(a1 + 104);
          HEVC_RBSP::flush_bits(a1, 1);
          v86 = 0;
          a2[v81 + 224] = v85 < 0;
          if (v85 < 0)
          {
            v87 = *(_QWORD *)(a1 + 104);
            if ((v87 & 0x8000000000000000) != 0)
            {
              HEVC_RBSP::flush_bits(a1, 1);
              v86 = 0;
            }
            else
            {
              v88 = HIDWORD(v87);
              v89 = -32;
              do
              {
                LODWORD(v88) = 2 * v88;
                v90 = v89 + 1;
                if ((v88 & 0x80000000) != 0)
                  break;
                v91 = v89 + 32;
                ++v89;
              }
              while (v91 < 0x1E);
              HEVC_RBSP::flush_bits(a1, v90 + 33);
              v92 = *(_DWORD *)(a1 + 108) >> -(char)v90;
              HEVC_RBSP::flush_bits(a1, v90 + 32);
              v86 = v92 + ~(-2 << (v90 + 31));
            }
          }
          v19 = v125;
          if (v81)
          {
            v93 = v123;
            v20 = v124;
            if (v81 != *((_DWORD *)a2 + 54))
              v86 += *(_DWORD *)&a2[4 * (v81 - 1) + 1372];
          }
          else
          {
            v93 = v123;
            v20 = v124;
          }
          *(_DWORD *)&a2[4 * v81++ + 1372] = v86;
        }
        while (v81 != v93);
      }
    }
    v54 = v122;
    if (*(_BYTE *)(a4 + 18584 * v20 + 18192))
    {
      v94 = *(_QWORD *)(a1 + 104) >> 63;
      HEVC_RBSP::flush_bits(a1, 1);
      a2[240] = v94;
    }
  }
  if (a2[36] == 1)
    v95 = (unsigned int *)(a2 + 40);
  else
    v95 = (unsigned int *)(a4 + 18584 * v20 + 6840);
  v96 = *v95;
  *((_DWORD *)a2 + 321) = v96;
  if (v96 >= 0x41)
  {
    syslog(3, "AppleD5500: slice->CurrRpsIdx=%u >= HEVC_MAX_SPS_ST_REF_PICS is invalid!");
    return 0;
  }
  v97 = a2 + 44;
  if (a3 == 20 || (a3 & 0xFFFFFFFC) == 0x10)
  {
    *(_OWORD *)(a2 + 200) = 0u;
    *(_OWORD *)(a2 + 172) = 0u;
    *(_OWORD *)(a2 + 188) = 0u;
    *(_OWORD *)(a2 + 140) = 0u;
    *(_OWORD *)(a2 + 156) = 0u;
    *(_OWORD *)(a2 + 108) = 0u;
    *(_OWORD *)(a2 + 124) = 0u;
    *(_OWORD *)(a2 + 76) = 0u;
    *(_OWORD *)(a2 + 92) = 0u;
    *v97 = 0u;
    *(_OWORD *)(a2 + 60) = 0u;
  }
  else
  {
    v98 = (__int128 *)(a4 + 18584 * v20 + 172 * v96 + 6844);
    v99 = *v98;
    v100 = v98[2];
    *(_OWORD *)(a2 + 60) = v98[1];
    *(_OWORD *)(a2 + 76) = v100;
    *v97 = v99;
    v101 = v98[3];
    v102 = v98[4];
    v103 = v98[6];
    *(_OWORD *)(a2 + 124) = v98[5];
    *(_OWORD *)(a2 + 140) = v103;
    *(_OWORD *)(a2 + 92) = v101;
    *(_OWORD *)(a2 + 108) = v102;
    v104 = v98[7];
    v105 = v98[8];
    v106 = v98[9];
    *(_OWORD *)(a2 + 200) = *(__int128 *)((char *)v98 + 156);
    *(_OWORD *)(a2 + 172) = v105;
    *(_OWORD *)(a2 + 188) = v106;
    *(_OWORD *)(a2 + 156) = v104;
  }
  if (*(_BYTE *)(a4 + 18584 * v20 + 6817))
  {
    v107 = *(_QWORD *)(a1 + 104) >> 63;
    HEVC_RBSP::flush_bits(a1, 1);
    a2[241] = v107;
    if (*(_DWORD *)(a4 + 18584 * v20 + 460))
    {
      v108 = *(_QWORD *)(a1 + 104) >> 63;
      HEVC_RBSP::flush_bits(a1, 1);
      a2[242] = v108;
    }
  }
  if (*v54 > 1u)
  {
    a2[386] = 1;
    goto LABEL_140;
  }
  v109 = *(_QWORD *)(a1 + 104);
  HEVC_RBSP::flush_bits(a1, 1);
  a2[243] = v109 < 0;
  *(_QWORD *)(a2 + 244) = *(_QWORD *)(a5 + 9672 * v19 + 20);
  if (v109 < 0)
  {
    v118 = HEVC_RBSP::ue_v((HEVC_RBSP *)a1);
    *((_DWORD *)a2 + 61) = v118;
    if (v118 >= 0xF)
    {
      syslog(3, "AppleD5500: slice->num_ref_idx_l0_active_minus1 > HEVC_MAX_REF_INDEX_FOR_RPL, is %d");
      return 0;
    }
    if (!*v54)
    {
      v119 = HEVC_RBSP::ue_v((HEVC_RBSP *)a1);
      *((_DWORD *)a2 + 62) = v119;
      if (v119 >= 0xF)
      {
        syslog(3, "AppleD5500: slice->num_ref_idx_l1_active_minus1 > HEVC_MAX_REF_INDEX_FOR_RPL, is %d");
        return 0;
      }
    }
  }
  v110 = calcNumPocTotalCurr((unsigned int *)a2 + 11, (uint64_t)a2);
  *((_DWORD *)a2 + 322) = v110;
  if (*(_BYTE *)(a5 + 9672 * v19 + 6448) && v110 >= 2)
    HEVC_RBSP::parseRefPicListsModification(a1, (uint64_t)a2);
  if (!*v54)
  {
    v111 = *(_QWORD *)(a1 + 104) >> 63;
    HEVC_RBSP::flush_bits(a1, 1);
    a2[384] = v111;
  }
  if (*(_BYTE *)(a5 + 9672 * v19 + 17))
  {
    v112 = *(_QWORD *)(a1 + 104) >> 63;
    HEVC_RBSP::flush_bits(a1, 1);
    a2[385] = v112;
  }
  if (a2[240])
  {
    if (*v54)
    {
      a2[386] = 1;
      goto LABEL_131;
    }
    v120 = *(_QWORD *)(a1 + 104);
    HEVC_RBSP::flush_bits(a1, 1);
    a2[386] = v120 < 0;
    if (v120 < 0)
    {
LABEL_131:
      if (!*((_DWORD *)a2 + 61))
        goto LABEL_133;
      goto LABEL_132;
    }
    if (*((_DWORD *)a2 + 62))
LABEL_132:
      *((_DWORD *)a2 + 97) = HEVC_RBSP::ue_v((HEVC_RBSP *)a1);
  }
LABEL_133:
  if ((*(_BYTE *)(a5 + 9672 * v19 + 49) && *v54 == 1 || *(_BYTE *)(a5 + 9672 * v19 + 50) && !*v54)
    && !HEVC_RBSP::parsePredWeightTable((HEVC_RBSP *)a1, v128, (uint32x2_t *)a2, *(_DWORD *)(a4 + 18584 * v20 + 460)))
  {
    return 0;
  }
  *((_DWORD *)a2 + 310) = HEVC_RBSP::ue_v((HEVC_RBSP *)a1);
LABEL_140:
  *((_DWORD *)a2 + 311) = HEVC_RBSP::se_v((HEVC_RBSP *)a1);
  if (*(_BYTE *)(a5 + 9672 * v19 + 48))
  {
    *((_DWORD *)a2 + 312) = HEVC_RBSP::se_v((HEVC_RBSP *)a1);
    *((_DWORD *)a2 + 313) = HEVC_RBSP::se_v((HEVC_RBSP *)a1);
  }
  if (*(_BYTE *)(a5 + 9672 * v19 + 6469))
  {
    v113 = *(_QWORD *)(a1 + 104) >> 63;
    HEVC_RBSP::flush_bits(a1, 1);
    a2[1256] = v113;
  }
  if (*(_BYTE *)(a5 + 9672 * v19 + 239))
  {
    v114 = *(_QWORD *)(a1 + 104) >> 63;
    HEVC_RBSP::flush_bits(a1, 1);
    a2[1257] = v114;
  }
  else
  {
    LODWORD(v114) = a2[1257];
  }
  if ((_DWORD)v114)
  {
    v115 = *(_QWORD *)(a1 + 104);
    HEVC_RBSP::flush_bits(a1, 1);
    a2[1258] = v115 < 0;
    if ((v115 & 0x8000000000000000) == 0)
    {
      *((_DWORD *)a2 + 315) = HEVC_RBSP::se_v((HEVC_RBSP *)a1);
      *((_DWORD *)a2 + 316) = HEVC_RBSP::se_v((HEVC_RBSP *)a1);
    }
  }
  else
  {
    v116 = a5 + 9672 * v19;
    *(_QWORD *)(a2 + 1260) = *(_QWORD *)(v116 + 244);
    a2[1258] = *(_BYTE *)(v116 + 240);
  }
  LOBYTE(v117) = *(_BYTE *)(a5 + 9672 * v19 + 237);
  if ((_BYTE)v117 && (a2[241] || a2[242] || !a2[1258]))
  {
    v117 = *(_QWORD *)(a1 + 104) >> 63;
    HEVC_RBSP::flush_bits(a1, 1);
  }
  a2[1268] = v117;
LABEL_19:
  if (*(_BYTE *)(a5 + 9672 * v19 + 52) || *(_BYTE *)(a5 + 9672 * v19 + 53))
  {
    v26 = *(_QWORD *)(a1 + 104);
    if ((v26 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      *((_DWORD *)a2 + 318) = 0;
    }
    else
    {
      v27 = HIDWORD(v26);
      v28 = -32;
      do
      {
        LODWORD(v27) = 2 * v27;
        v29 = v28 + 1;
        if ((v27 & 0x80000000) != 0)
          break;
        v30 = v28 + 32;
        ++v28;
      }
      while (v30 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v29 + 33);
      v31 = *(_DWORD *)(a1 + 108) >> -(char)v29;
      HEVC_RBSP::flush_bits(a1, v29 + 32);
      v32 = v31 + ~(-2 << (v29 + 31));
      *((_DWORD *)a2 + 318) = v32;
      if (v32)
      {
        v33 = *(_QWORD *)(a1 + 104);
        if ((v33 & 0x8000000000000000) != 0)
        {
          HEVC_RBSP::flush_bits(a1, 1);
          v39 = 0;
        }
        else
        {
          v34 = HIDWORD(v33);
          v35 = -32;
          do
          {
            LODWORD(v34) = 2 * v34;
            v36 = v35 + 1;
            if ((v34 & 0x80000000) != 0)
              break;
            v37 = v35 + 32;
            ++v35;
          }
          while (v37 < 0x1E);
          HEVC_RBSP::flush_bits(a1, v36 + 33);
          v38 = *(_DWORD *)(a1 + 108) >> -(char)v36;
          HEVC_RBSP::flush_bits(a1, v36 + 32);
          v39 = v38 + ~(-2 << (v36 + 31));
        }
        *((_DWORD *)a2 + 319) = v39;
        if (*((_DWORD *)a2 + 318))
        {
          v61 = 0;
          v62 = v39 + 1;
          do
          {
            HEVC_RBSP::flush_bits(a1, v62);
            ++v61;
          }
          while (v61 < *((_DWORD *)a2 + 318));
        }
      }
    }
  }
  if (*(_BYTE *)(a5 + 9672 * v19 + 6456))
  {
    v63 = *(_QWORD *)(a1 + 104);
    if ((v63 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      *((_DWORD *)a2 + 320) = 0;
    }
    else
    {
      v64 = HIDWORD(v63);
      v65 = -32;
      do
      {
        LODWORD(v64) = 2 * v64;
        v66 = v65 + 1;
        if ((v64 & 0x80000000) != 0)
          break;
        v67 = v65 + 32;
        ++v65;
      }
      while (v67 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v66 + 33);
      v68 = *(_DWORD *)(a1 + 108) >> -(char)v66;
      HEVC_RBSP::flush_bits(a1, v66 + 32);
      v69 = v68 + ~(-2 << (v66 + 31));
      *((_DWORD *)a2 + 320) = v69;
      if (v69)
      {
        v70 = 0;
        do
        {
          HEVC_RBSP::flush_bits(a1, 8);
          ++v70;
        }
        while (v70 < *((_DWORD *)a2 + 320));
      }
    }
  }
  v40 = 1;
  HEVC_RBSP::flush_bits(a1, 1);
  HEVC_RBSP::flush_bits(a1, *(_DWORD *)(a1 + 112) & 7);
  return v40;
}

uint64_t calcNumPocTotalCurr(unsigned int *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  unsigned __int8 *v5;
  uint64_t v7;
  unsigned __int8 *v8;
  uint64_t v10;
  unsigned __int8 *v11;

  v3 = *a1;
  if ((_DWORD)v3)
  {
    LODWORD(result) = 0;
    v5 = (unsigned __int8 *)(a1 + 3);
    do
    {
      if (*v5++)
        result = (result + 1);
      else
        result = result;
      --v3;
    }
    while (v3);
  }
  else
  {
    result = 0;
  }
  v7 = a1[1];
  if ((_DWORD)v7)
  {
    v8 = (unsigned __int8 *)(a1 + 7);
    do
    {
      if (*v8++)
        result = (result + 1);
      else
        result = result;
      --v7;
    }
    while (v7);
  }
  v10 = (*(_DWORD *)(a2 + 220) + *(_DWORD *)(a2 + 216));
  if ((_DWORD)v10)
  {
    v11 = (unsigned __int8 *)(a2 + 1356);
    do
    {
      if (*v11++)
        result = (result + 1);
      else
        result = result;
      --v10;
    }
    while (v10);
  }
  return result;
}

uint64_t HEVC_RBSP::parseRefPicListsModification(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  int v6;
  unsigned int v7;
  BOOL v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  int v13;

  v4 = *(_QWORD *)(a1 + 104);
  result = HEVC_RBSP::flush_bits(a1, 1);
  *(_BYTE *)(a2 + 252) = v4 < 0;
  v6 = 0;
  v7 = *(_DWORD *)(a2 + 1288) - 1;
  if (*(_DWORD *)(a2 + 1288) != 1)
  {
    do
    {
      ++v6;
      v8 = v7 > 1;
      v7 >>= 1;
    }
    while (v8);
  }
  if (v4 < 0)
  {
    v9 = 0;
    do
    {
      v10 = *(_DWORD *)(a1 + 108) >> (32 - v6);
      result = HEVC_RBSP::flush_bits(a1, v6);
      *(_DWORD *)(a2 + 4 * v9++ + 256) = v10;
    }
    while (v9 <= *(_DWORD *)(a2 + 244));
  }
  if (!*(_DWORD *)(a2 + 20))
  {
    v11 = *(_QWORD *)(a1 + 104);
    result = HEVC_RBSP::flush_bits(a1, 1);
    *(_BYTE *)(a2 + 253) = v11 < 0;
    if (v11 < 0)
    {
      v12 = 0;
      do
      {
        v13 = *(_DWORD *)(a1 + 108) >> (32 - v6);
        result = HEVC_RBSP::flush_bits(a1, v6);
        *(_DWORD *)(a2 + 4 * v12++ + 320) = v13;
      }
      while (v12 <= *(_DWORD *)(a2 + 248));
    }
  }
  return result;
}

uint64_t HEVC_RBSP::parsePredWeightTable(HEVC_RBSP *this, int32x2_t *a2, uint32x2_t *a3, int a4)
{
  unint64_t v7;
  unint64_t v8;
  int v9;
  int v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  int v17;
  unsigned int v18;
  int v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  int v30;
  int v31;
  unsigned int v32;
  int v33;
  int v34;
  _DWORD *v35;
  unint64_t v36;
  unint64_t v37;
  int v38;
  int v39;
  unsigned int v40;
  int v41;
  int v42;
  signed int v43;
  signed int v44;
  BOOL v45;
  uint64_t v46;
  char v47;
  char v48;
  unint64_t v49;
  unint64_t v50;
  int v51;
  int v52;
  unsigned int v53;
  int v54;
  int v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  int v59;
  int v60;
  unsigned int v61;
  int v62;
  int v63;
  signed int v64;
  int v65;
  int v66;
  int v67;
  uint64_t result;
  unsigned int v70;
  uint64_t v71;
  unsigned int v72;
  uint64_t v73;
  unsigned int v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  int v78;
  int v79;
  unsigned int v80;
  int v81;
  int v82;
  _DWORD *v83;
  unint64_t v84;
  unint64_t v85;
  int v86;
  int v87;
  unsigned int v88;
  int v89;
  int v90;
  signed int v91;
  signed int v92;
  BOOL v93;
  uint64_t v94;
  char v95;
  char v96;
  unint64_t v97;
  unint64_t v98;
  int v99;
  int v100;
  unsigned int v101;
  int v102;
  int v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  int v107;
  int v108;
  unsigned int v109;
  int v110;
  int v111;
  signed int v112;
  int v113;
  int v114;
  int v115;
  int v117;

  a3[154] = (uint32x2_t)0x8000000080;
  if (a2[2310].i8[2])
    a3[154] = vshl_u32((uint32x2_t)0x100000001, (uint32x2_t)vadd_s32(a2[62], (int32x2_t)0x700000007));
  v7 = *((_QWORD *)this + 13);
  if ((v7 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    a3[49].i32[0] = 0;
  }
  else
  {
    v8 = HIDWORD(v7);
    v9 = -32;
    do
    {
      LODWORD(v8) = 2 * v8;
      v10 = v9 + 1;
      if ((v8 & 0x80000000) != 0)
        break;
      v11 = v9 + 32;
      ++v9;
    }
    while (v11 < 0x1E);
    HEVC_RBSP::flush_bits((uint64_t)this, v10 + 33);
    v12 = *((_DWORD *)this + 27) >> -(char)v10;
    HEVC_RBSP::flush_bits((uint64_t)this, v10 + 32);
    v13 = v12 + ~(-2 << (v10 + 31));
    a3[49].i32[0] = v13;
    if (v13 >= 8)
    {
      syslog(3, "AppleD5500: luma_log2_weight_denom out of range %d");
      return 0;
    }
  }
  if (!a4)
    goto LABEL_19;
  v14 = *((_QWORD *)this + 13);
  if ((v14 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    v20 = 0;
  }
  else
  {
    v15 = HIDWORD(v14);
    v16 = -32;
    do
    {
      LODWORD(v15) = 2 * v15;
      v17 = v16 + 1;
      if ((v15 & 0x80000000) != 0)
        break;
      v18 = v16 + 32;
      ++v16;
    }
    while (v18 < 0x1E);
    HEVC_RBSP::flush_bits((uint64_t)this, v17 + 33);
    v19 = *((_DWORD *)this + 27) >> -(char)v17;
    HEVC_RBSP::flush_bits((uint64_t)this, v17 + 32);
    v20 = v19 + ~(-2 << (v17 + 31));
  }
  v21 = (-((v20 & 1) == 0) ^ ((v20 + 1) >> 1)) + ((v20 & 1) == 0);
  a3[49].i32[1] = v21;
  if (v21 + a3[49].i32[0] >= 8)
  {
    syslog(3, "AppleD5500: delta_chroma_log2_weight_denom out of range %d %d");
  }
  else
  {
LABEL_19:
    v22 = 0;
    do
    {
      v23 = *((_QWORD *)this + 13) >> 63;
      HEVC_RBSP::flush_bits((uint64_t)this, 1);
      a3[50].i8[v22++] = v23;
    }
    while (v22 <= a3[30].i32[1]);
    v117 = a4;
    if (a4)
    {
      v24 = 0;
      do
      {
        v25 = *((_QWORD *)this + 13) >> 63;
        HEVC_RBSP::flush_bits((uint64_t)this, 1);
        a3[52].i8[v24++] = v25;
      }
      while (v24 <= a3[30].i32[1]);
    }
    v26 = 0;
    do
    {
      v27 = v26;
      if (a3[50].i8[v26])
      {
        v28 = *((_QWORD *)this + 13);
        if ((v28 & 0x8000000000000000) != 0)
        {
          HEVC_RBSP::flush_bits((uint64_t)this, 1);
          v34 = 0;
        }
        else
        {
          v29 = HIDWORD(v28);
          v30 = -32;
          do
          {
            LODWORD(v29) = 2 * v29;
            v31 = v30 + 1;
            if ((v29 & 0x80000000) != 0)
              break;
            v32 = v30 + 32;
            ++v30;
          }
          while (v32 < 0x1E);
          HEVC_RBSP::flush_bits((uint64_t)this, v31 + 33);
          v33 = *((_DWORD *)this + 27) >> -(char)v31;
          HEVC_RBSP::flush_bits((uint64_t)this, v31 + 32);
          v34 = v33 + ~(-2 << (v31 + 31));
        }
        v35 = (_DWORD *)a3 + v27;
        v35[108] = (-((v34 & 1) == 0) ^ ((v34 + 1) >> 1)) + ((v34 & 1) == 0);
        v36 = *((_QWORD *)this + 13);
        if ((v36 & 0x8000000000000000) != 0)
        {
          HEVC_RBSP::flush_bits((uint64_t)this, 1);
          v42 = 0;
        }
        else
        {
          v37 = HIDWORD(v36);
          v38 = -32;
          do
          {
            LODWORD(v37) = 2 * v37;
            v39 = v38 + 1;
            if ((v37 & 0x80000000) != 0)
              break;
            v40 = v38 + 32;
            ++v38;
          }
          while (v40 < 0x1E);
          HEVC_RBSP::flush_bits((uint64_t)this, v39 + 33);
          v41 = *((_DWORD *)this + 27) >> -(char)v39;
          HEVC_RBSP::flush_bits((uint64_t)this, v39 + 32);
          v42 = v41 + ~(-2 << (v39 + 31));
        }
        v43 = (-((v42 & 1) == 0) ^ ((v42 + 1) >> 1)) + ((v42 & 1) == 0);
        a3[62].i32[v27] = v43;
        if (v35[108] != (char)v35[108] || ((v44 = a3[154].i32[0], v43 >= -v44) ? (v45 = v43 < v44) : (v45 = 0), !v45))
        {
          syslog(3, "AppleD5500: luma weight or offset out of range %d %d %d");
          return 0;
        }
      }
      if (a3[52].i8[v27])
      {
        v46 = 0;
        v47 = 1;
        while (1)
        {
          v48 = v47;
          v49 = *((_QWORD *)this + 13);
          if ((v49 & 0x8000000000000000) != 0)
          {
            HEVC_RBSP::flush_bits((uint64_t)this, 1);
            v55 = 0;
          }
          else
          {
            v50 = HIDWORD(v49);
            v51 = -32;
            do
            {
              LODWORD(v50) = 2 * v50;
              v52 = v51 + 1;
              if ((v50 & 0x80000000) != 0)
                break;
              v53 = v51 + 32;
              ++v51;
            }
            while (v53 < 0x1E);
            HEVC_RBSP::flush_bits((uint64_t)this, v52 + 33);
            v54 = *((_DWORD *)this + 27) >> -(char)v52;
            HEVC_RBSP::flush_bits((uint64_t)this, v52 + 32);
            v55 = v54 + ~(-2 << (v52 + 31));
          }
          v56 = (uint64_t)&a3[v27] + 4 * v46;
          *(_DWORD *)(v56 + 560) = (-((v55 & 1) == 0) ^ ((v55 + 1) >> 1)) + ((v55 & 1) == 0);
          v57 = *((_QWORD *)this + 13);
          if ((v57 & 0x8000000000000000) != 0)
          {
            HEVC_RBSP::flush_bits((uint64_t)this, 1);
            v63 = 0;
          }
          else
          {
            v58 = HIDWORD(v57);
            v59 = -32;
            do
            {
              LODWORD(v58) = 2 * v58;
              v60 = v59 + 1;
              if ((v58 & 0x80000000) != 0)
                break;
              v61 = v59 + 32;
              ++v59;
            }
            while (v61 < 0x1E);
            HEVC_RBSP::flush_bits((uint64_t)this, v60 + 33);
            v62 = *((_DWORD *)this + 27) >> -(char)v60;
            HEVC_RBSP::flush_bits((uint64_t)this, v60 + 32);
            v63 = v62 + ~(-2 << (v60 + 31));
          }
          v64 = (-((v63 & 1) == 0) ^ ((v63 + 1) >> 1)) + ((v63 & 1) == 0);
          a3[v27 + 86].i32[v46] = v64;
          if (*(_DWORD *)(v56 + 560) != (char)*(_DWORD *)(v56 + 560))
            break;
          v65 = a3[154].i32[1];
          v66 = -4 * v65;
          v67 = 4 * v65;
          if (v64 < v66 || v64 >= v67)
            break;
          v47 = 0;
          v46 = 1;
          if ((v48 & 1) == 0)
            goto LABEL_65;
        }
        syslog(3, "AppleD5500: chroma weight or offset out of range %d %d %d %d");
        return 0;
      }
LABEL_65:
      v26 = v27 + 1;
    }
    while ((v27 + 1) <= a3[30].i32[1]);
    if (a3[2].i32[1])
      return 1;
    v70 = 0;
    do
    {
      v71 = *((_QWORD *)this + 13) >> 63;
      HEVC_RBSP::flush_bits((uint64_t)this, 1);
      a3[102].i8[v70++] = v71;
    }
    while (v70 <= a3[31].i32[0]);
    if (v117)
    {
      v72 = 0;
      do
      {
        v73 = *((_QWORD *)this + 13) >> 63;
        HEVC_RBSP::flush_bits((uint64_t)this, 1);
        a3[104].i8[v72++] = v73;
      }
      while (v72 <= a3[31].i32[0]);
    }
    v74 = 0;
    while (1)
    {
      v75 = v74;
      if (a3[102].i8[v74])
      {
        v76 = *((_QWORD *)this + 13);
        if ((v76 & 0x8000000000000000) != 0)
        {
          HEVC_RBSP::flush_bits((uint64_t)this, 1);
          v82 = 0;
        }
        else
        {
          v77 = HIDWORD(v76);
          v78 = -32;
          do
          {
            LODWORD(v77) = 2 * v77;
            v79 = v78 + 1;
            if ((v77 & 0x80000000) != 0)
              break;
            v80 = v78 + 32;
            ++v78;
          }
          while (v80 < 0x1E);
          HEVC_RBSP::flush_bits((uint64_t)this, v79 + 33);
          v81 = *((_DWORD *)this + 27) >> -(char)v79;
          HEVC_RBSP::flush_bits((uint64_t)this, v79 + 32);
          v82 = v81 + ~(-2 << (v79 + 31));
        }
        v83 = (_DWORD *)a3 + v75;
        v83[212] = (-((v82 & 1) == 0) ^ ((v82 + 1) >> 1)) + ((v82 & 1) == 0);
        v84 = *((_QWORD *)this + 13);
        if ((v84 & 0x8000000000000000) != 0)
        {
          HEVC_RBSP::flush_bits((uint64_t)this, 1);
          v90 = 0;
        }
        else
        {
          v85 = HIDWORD(v84);
          v86 = -32;
          do
          {
            LODWORD(v85) = 2 * v85;
            v87 = v86 + 1;
            if ((v85 & 0x80000000) != 0)
              break;
            v88 = v86 + 32;
            ++v86;
          }
          while (v88 < 0x1E);
          HEVC_RBSP::flush_bits((uint64_t)this, v87 + 33);
          v89 = *((_DWORD *)this + 27) >> -(char)v87;
          HEVC_RBSP::flush_bits((uint64_t)this, v87 + 32);
          v90 = v89 + ~(-2 << (v87 + 31));
        }
        v91 = (-((v90 & 1) == 0) ^ ((v90 + 1) >> 1)) + ((v90 & 1) == 0);
        a3[114].i32[v75] = v91;
        if (v83[212] != (char)v83[212] || ((v92 = a3[154].i32[0], v91 >= -v92) ? (v93 = v91 < v92) : (v93 = 0), !v93))
        {
          syslog(3, "AppleD5500: B luma weight or offset out of range %d %d %d");
          return 0;
        }
      }
      if (a3[104].i8[v75])
        break;
LABEL_117:
      v74 = v75 + 1;
      result = 1;
      if ((v75 + 1) > a3[31].i32[0])
        return result;
    }
    v94 = 0;
    v95 = 1;
    while (1)
    {
      v96 = v95;
      v97 = *((_QWORD *)this + 13);
      if ((v97 & 0x8000000000000000) != 0)
      {
        HEVC_RBSP::flush_bits((uint64_t)this, 1);
        v103 = 0;
      }
      else
      {
        v98 = HIDWORD(v97);
        v99 = -32;
        do
        {
          LODWORD(v98) = 2 * v98;
          v100 = v99 + 1;
          if ((v98 & 0x80000000) != 0)
            break;
          v101 = v99 + 32;
          ++v99;
        }
        while (v101 < 0x1E);
        HEVC_RBSP::flush_bits((uint64_t)this, v100 + 33);
        v102 = *((_DWORD *)this + 27) >> -(char)v100;
        HEVC_RBSP::flush_bits((uint64_t)this, v100 + 32);
        v103 = v102 + ~(-2 << (v100 + 31));
      }
      v104 = (uint64_t)&a3[v75] + 4 * v94;
      *(_DWORD *)(v104 + 976) = (-((v103 & 1) == 0) ^ ((v103 + 1) >> 1)) + ((v103 & 1) == 0);
      v105 = *((_QWORD *)this + 13);
      if ((v105 & 0x8000000000000000) != 0)
      {
        HEVC_RBSP::flush_bits((uint64_t)this, 1);
        v111 = 0;
      }
      else
      {
        v106 = HIDWORD(v105);
        v107 = -32;
        do
        {
          LODWORD(v106) = 2 * v106;
          v108 = v107 + 1;
          if ((v106 & 0x80000000) != 0)
            break;
          v109 = v107 + 32;
          ++v107;
        }
        while (v109 < 0x1E);
        HEVC_RBSP::flush_bits((uint64_t)this, v108 + 33);
        v110 = *((_DWORD *)this + 27) >> -(char)v108;
        HEVC_RBSP::flush_bits((uint64_t)this, v108 + 32);
        v111 = v110 + ~(-2 << (v108 + 31));
      }
      v112 = (-((v111 & 1) == 0) ^ ((v111 + 1) >> 1)) + ((v111 & 1) == 0);
      a3[v75 + 138].i32[v94] = v112;
      if (*(_DWORD *)(v104 + 976) != (char)*(_DWORD *)(v104 + 976))
        break;
      v113 = a3[154].i32[1];
      v114 = -4 * v113;
      v115 = 4 * v113;
      if (v112 < v114 || v112 >= v115)
        break;
      v95 = 0;
      v94 = 1;
      if ((v96 & 1) == 0)
        goto LABEL_117;
    }
    syslog(3, "AppleD5500: B chroma weight or offset out of range %d %d %d %d");
  }
  return 0;
}

uint64_t HEVC_RBSP::parseSEI(HEVC_RBSP *this, int a2, uint64_t a3, _DWORD *a4)
{
  uint64_t v8;

  while (1)
  {
    v8 = HEVC_RBSP::parseSeiMessage(this, a2, a3, a4);
    if (!(_DWORD)v8)
      break;
    if (8 * *((_DWORD *)this + 37) - *((_DWORD *)this + 38) <= 8)
    {
      HEVC_RBSP::flush_bits((uint64_t)this, 1);
      HEVC_RBSP::flush_bits((uint64_t)this, *((_DWORD *)this + 28) & 7);
      return v8;
    }
  }
  return v8;
}

uint64_t HEVC_RBSP::parseSeiMessage(HEVC_RBSP *this, int a2, uint64_t a3, _DWORD *a4)
{
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;

  v8 = *((unsigned __int8 *)this + 111);
  if (v8 == 255)
  {
    v9 = 0;
    do
    {
      HEVC_RBSP::flush_bits((uint64_t)this, 8);
      v9 += 255;
      v8 = *((unsigned __int8 *)this + 111);
    }
    while (v8 == 255);
  }
  else
  {
    v9 = 0;
  }
  HEVC_RBSP::flush_bits((uint64_t)this, 8);
  v10 = *((unsigned __int8 *)this + 111);
  if (v10 == 255)
  {
    v11 = 0;
    do
    {
      HEVC_RBSP::flush_bits((uint64_t)this, 8);
      v11 += 255;
      v10 = *((unsigned __int8 *)this + 111);
    }
    while (v10 == 255);
  }
  else
  {
    v11 = 0;
  }
  v12 = v8 + v9;
  HEVC_RBSP::flush_bits((uint64_t)this, 8);
  if (v10 + v11)
    return HEVC_RBSP::parseSeiPayload(this, a2, a3, a4, v12, v10 + v11);
  syslog(3, "AppleD5500: parseSeiPayload zero size! %d %d %d\n", a2, v12, 0);
  return 0;
}

uint64_t HEVC_RBSP::parseSeiPayload(HEVC_RBSP *this, int a2, uint64_t a3, _DWORD *a4, int a5, int a6)
{
  int v6;
  uint64_t active;
  uint64_t v9;

  v6 = a6;
  if (a2 == 39)
  {
    switch(a5)
    {
      case 0:
        HEVC_RBSP::parseSeiBufferingPeriod(this, a3, (uint64_t)a4);
        goto LABEL_23;
      case 1:
        active = HEVC_RBSP::parseSeiPicTiming(this, a3, (uint64_t)(a4 + 260));
        goto LABEL_26;
      case 2:
        HEVC_RBSP::parsePanScanRect(this, a4 + 274);
        goto LABEL_23;
      case 3:
        if (a6)
        {
          do
          {
            HEVC_RBSP::flush_bits((uint64_t)this, 8);
            --v6;
          }
          while (v6);
        }
        goto LABEL_23;
      case 4:
      case 5:
        goto LABEL_16;
      case 6:
        HEVC_RBSP::parseSeiRecoveryPoint(this, (uint64_t)(a4 + 291));
        goto LABEL_23;
      default:
        if (a5 == 128)
        {
          active = HEVC_RBSP::parseSeiStructureOfPicturesInfo(this, a4 + 294);
        }
        else
        {
          if (a5 != 129)
          {
LABEL_16:
            printf("Unsupported SEI TYPE %d\n", a5);
            goto LABEL_23;
          }
          active = HEVC_RBSP::parseSeiActiveParameterSets((uint64_t)this, (uint64_t)(a4 + 4443));
        }
LABEL_26:
        v9 = active;
        break;
    }
  }
  else
  {
    if (a5 == 132)
    {
      HEVC_RBSP::parseSeiDecodedPictureHash((uint64_t)this, a3, a4 + 4393);
    }
    else if (a5 == 3)
    {
      if (a6)
      {
        do
        {
          HEVC_RBSP::flush_bits((uint64_t)this, 8);
          --v6;
        }
        while (v6);
      }
    }
    else if (a6)
    {
      do
      {
        HEVC_RBSP::flush_bits((uint64_t)this, 8);
        --v6;
      }
      while (v6);
    }
LABEL_23:
    v9 = 1;
  }
  HEVC_RBSP::flush_bits((uint64_t)this, *((_DWORD *)this + 28) & 7);
  return v9;
}

uint64_t HEVC_RBSP::parseSeiBufferingPeriod(HEVC_RBSP *this, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  int v8;
  int v9;
  unsigned int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t result;
  int v20;
  int v21;
  unsigned int v22;
  unsigned int v23;
  char v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  int v31;
  unsigned int v32;
  char v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  int v38;
  uint64_t v39;
  int v40;
  uint64_t v41;

  v5 = a2 + 18298;
  v6 = *((_QWORD *)this + 13);
  if ((v6 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    v12 = 0;
  }
  else
  {
    v7 = HIDWORD(v6);
    v8 = -32;
    do
    {
      LODWORD(v7) = 2 * v7;
      v9 = v8 + 1;
      if ((v7 & 0x80000000) != 0)
        break;
      v10 = v8 + 32;
      ++v8;
    }
    while (v10 < 0x1E);
    HEVC_RBSP::flush_bits((uint64_t)this, v9 + 33);
    v11 = *((_DWORD *)this + 27) >> -(char)v9;
    HEVC_RBSP::flush_bits((uint64_t)this, v9 + 32);
    v12 = v11 + ~(-2 << (v9 + 31));
  }
  *(_DWORD *)(a3 + 4) = v12;
  if (*(_BYTE *)v5)
  {
    if (!*(_BYTE *)(a3 + 8))
      goto LABEL_10;
    goto LABEL_9;
  }
  v41 = *((_QWORD *)this + 13) >> 63;
  HEVC_RBSP::flush_bits((uint64_t)this, 1);
  *(_BYTE *)(a3 + 8) = v41;
  if ((_DWORD)v41)
  {
LABEL_9:
    v13 = *(_DWORD *)(v5 + 34);
    v14 = *((_DWORD *)this + 27) >> ~(_BYTE)v13;
    HEVC_RBSP::flush_bits((uint64_t)this, v13 + 1);
    *(_BYTE *)(a3 + 9) = v14;
    v15 = *(_DWORD *)(v5 + 38);
    v16 = *((_DWORD *)this + 27) >> ~(_BYTE)v15;
    HEVC_RBSP::flush_bits((uint64_t)this, v15 + 1);
    *(_BYTE *)(a3 + 10) = v16;
  }
LABEL_10:
  v17 = *((_QWORD *)this + 13) >> 63;
  HEVC_RBSP::flush_bits((uint64_t)this, 1);
  *(_BYTE *)(a3 + 11) = v17;
  v18 = *(_DWORD *)(v5 + 34);
  LODWORD(v17) = *((_DWORD *)this + 27) >> ~(_BYTE)v18;
  result = HEVC_RBSP::flush_bits((uint64_t)this, v18 + 1);
  *(_DWORD *)(a3 + 12) = v17;
  v20 = *(_DWORD *)(v5 + 30);
  v21 = v20 + 1;
  v22 = *(_DWORD *)(v5 + 94);
  if (*(_BYTE *)(v5 + 147))
  {
    v23 = 0;
    v24 = 31 - v20;
    do
    {
      v25 = *((_DWORD *)this + 27) >> v24;
      HEVC_RBSP::flush_bits((uint64_t)this, v20 + 1);
      v26 = v23;
      v27 = a3 + 8 * v23;
      *(_DWORD *)(v27 + 16) = v25;
      v28 = *((_DWORD *)this + 27) >> v24;
      result = HEVC_RBSP::flush_bits((uint64_t)this, v20 + 1);
      *(_DWORD *)(v27 + 272) = v28;
      if (*(_BYTE *)v5 || *(_BYTE *)(a3 + 8))
      {
        v29 = *((_DWORD *)this + 27) >> v24;
        HEVC_RBSP::flush_bits((uint64_t)this, v20 + 1);
        v30 = a3 + 8 * v26;
        *(_DWORD *)(v30 + 528) = v29;
        v31 = *((_DWORD *)this + 27) >> v24;
        result = HEVC_RBSP::flush_bits((uint64_t)this, v20 + 1);
        *(_DWORD *)(v30 + 784) = v31;
      }
      v23 = v26 + 1;
    }
    while ((int)v26 + 1 <= v22);
  }
  if (*(_BYTE *)(v5 + 148))
  {
    v32 = 0;
    v33 = 31 - v20;
    do
    {
      v34 = *((_DWORD *)this + 27) >> v33;
      HEVC_RBSP::flush_bits((uint64_t)this, v21);
      v35 = v32;
      v36 = a3 + 8 * v32;
      *(_DWORD *)(v36 + 20) = v34;
      v37 = *((_DWORD *)this + 27) >> v33;
      result = HEVC_RBSP::flush_bits((uint64_t)this, v21);
      *(_DWORD *)(v36 + 276) = v37;
      if (*(_BYTE *)v5 || *(_BYTE *)(a3 + 8))
      {
        v38 = *((_DWORD *)this + 27) >> v33;
        HEVC_RBSP::flush_bits((uint64_t)this, v21);
        v39 = a3 + 8 * v35;
        *(_DWORD *)(v39 + 532) = v38;
        v40 = *((_DWORD *)this + 27) >> v33;
        result = HEVC_RBSP::flush_bits((uint64_t)this, v21);
        *(_DWORD *)(v39 + 788) = v40;
      }
      v32 = v35 + 1;
    }
    while ((int)v35 + 1 <= v22);
  }
  *(_DWORD *)a3 = 1;
  return result;
}

uint64_t HEVC_RBSP::parseSeiPicTiming(HEVC_RBSP *this, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  unint64_t v16;
  _DWORD *v17;
  unint64_t v18;
  int v19;
  int v20;
  unsigned int v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t result;
  uint64_t v26;
  int v27;
  int v28;
  unsigned int v29;
  unint64_t v30;
  unint64_t v31;
  int v32;
  int v33;
  unsigned int v34;
  int v35;
  int v36;
  unsigned int v37;
  BOOL v38;
  int v39;
  int v40;

  v6 = a2 + 18254;
  if (*(_BYTE *)(a2 + 18254))
  {
    v7 = *((_QWORD *)this + 13) >> 60;
    HEVC_RBSP::flush_bits((uint64_t)this, 4);
    *(_DWORD *)(a3 + 4) = v7;
    v8 = *((_QWORD *)this + 13) >> 62;
    HEVC_RBSP::flush_bits((uint64_t)this, 2);
    *(_DWORD *)(a3 + 8) = v8;
    v9 = *((_QWORD *)this + 13) >> 63;
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    *(_BYTE *)(a3 + 12) = v9;
  }
  if (*(_BYTE *)(v6 + 190))
  {
    v10 = *(_DWORD *)(v6 + 78);
    v11 = *((_DWORD *)this + 27) >> ~(_BYTE)v10;
    HEVC_RBSP::flush_bits((uint64_t)this, v10 + 1);
    *(_DWORD *)(a3 + 16) = v11;
    v12 = *(_DWORD *)(v6 + 82);
    v13 = *((_DWORD *)this + 27) >> ~(_BYTE)v12;
    HEVC_RBSP::flush_bits((uint64_t)this, v12 + 1);
    *(_DWORD *)(a3 + 20) = v13;
    if (*(_BYTE *)(v6 + 44))
    {
      v14 = *(_DWORD *)(v6 + 58);
      v15 = *((_DWORD *)this + 27) >> ~(_BYTE)v14;
      HEVC_RBSP::flush_bits((uint64_t)this, v14 + 1);
      *(_DWORD *)(a3 + 24) = v15;
      if (*(_BYTE *)(v6 + 44))
      {
        if (*(_BYTE *)(v6 + 54))
        {
          v16 = *((_QWORD *)this + 13);
          if ((v16 & 0x8000000000000000) != 0)
          {
            HEVC_RBSP::flush_bits((uint64_t)this, 1);
            *(_DWORD *)(a3 + 28) = 0;
          }
          else
          {
            v17 = (_DWORD *)(a2 + 18532);
            v18 = HIDWORD(v16);
            v19 = -32;
            do
            {
              LODWORD(v18) = 2 * v18;
              v20 = v19 + 1;
              if ((v18 & 0x80000000) != 0)
                break;
              v21 = v19 + 32;
              ++v19;
            }
            while (v21 < 0x1E);
            HEVC_RBSP::flush_bits((uint64_t)this, v20 + 33);
            v22 = *((_DWORD *)this + 27) >> -(char)v20;
            HEVC_RBSP::flush_bits((uint64_t)this, v20 + 32);
            v23 = v22 + ~(-2 << (v20 + 31));
            *(_DWORD *)(a3 + 28) = v23;
            v24 = *v17 - 1;
            if (v23 > v24)
            {
              syslog(3, "AppleD5500: sei->num_decoding_units_minus1 > (sps->PicSizeInCtbsY - 1), is %d limit %d", v22 + ~(-2 << (v20 + 31)), v24);
              return 0;
            }
          }
          v26 = *((_QWORD *)this + 13);
          HEVC_RBSP::flush_bits((uint64_t)this, 1);
          *(_BYTE *)(a3 + 32) = v26 < 0;
          if (v26 < 0)
          {
            v27 = *(_DWORD *)(v6 + 50);
            v28 = *((_DWORD *)this + 27) >> -(char)v27;
            HEVC_RBSP::flush_bits((uint64_t)this, v27);
            *(_DWORD *)(a3 + 36) = v28;
          }
          *(_QWORD *)(a3 + 40) = malloc_type_calloc(4uLL, (*(_DWORD *)(a3 + 28) + 1), 0x8E0A87B4uLL);
          v29 = 0;
          *(_QWORD *)(a3 + 48) = malloc_type_calloc(4uLL, (*(_DWORD *)(a3 + 28) + 1), 0xFCD1B4FBuLL);
          do
          {
            v30 = *((_QWORD *)this + 13);
            if ((v30 & 0x8000000000000000) != 0)
            {
              HEVC_RBSP::flush_bits((uint64_t)this, 1);
              v36 = 0;
            }
            else
            {
              v31 = HIDWORD(v30);
              v32 = -32;
              do
              {
                LODWORD(v31) = 2 * v31;
                v33 = v32 + 1;
                if ((v31 & 0x80000000) != 0)
                  break;
                v34 = v32 + 32;
                ++v32;
              }
              while (v34 < 0x1E);
              HEVC_RBSP::flush_bits((uint64_t)this, v33 + 33);
              v35 = *((_DWORD *)this + 27) >> -(char)v33;
              HEVC_RBSP::flush_bits((uint64_t)this, v33 + 32);
              v36 = v35 + ~(-2 << (v33 + 31));
            }
            *(_DWORD *)(*(_QWORD *)(a3 + 40) + 4 * v29) = v36;
            v37 = *(_DWORD *)(a3 + 28);
            if (*(_BYTE *)(a3 + 32))
              v38 = 1;
            else
              v38 = v29 >= v37;
            if (!v38)
            {
              v39 = *(_DWORD *)(v6 + 50);
              v40 = *((_DWORD *)this + 27) >> ~(_BYTE)v39;
              HEVC_RBSP::flush_bits((uint64_t)this, v39 + 1);
              *(_DWORD *)(*(_QWORD *)(a3 + 48) + 4 * v29) = v40;
              v37 = *(_DWORD *)(a3 + 28);
            }
            ++v29;
          }
          while (v29 <= v37);
        }
      }
    }
  }
  result = 1;
  *(_DWORD *)a3 = 1;
  return result;
}

uint64_t HEVC_RBSP::parsePanScanRect(HEVC_RBSP *this, _DWORD *a2)
{
  unint64_t v4;
  unint64_t v5;
  int v6;
  int v7;
  unsigned int v8;
  int v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int v14;
  int v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  unint64_t v20;
  unint64_t v21;
  int v22;
  int v23;
  unsigned int v24;
  int v25;
  int v26;
  unint64_t v27;
  unint64_t v28;
  int v29;
  int v30;
  unsigned int v31;
  int v32;
  int v33;
  unint64_t v34;
  unint64_t v35;
  int v36;
  int v37;
  unsigned int v38;
  int v39;
  int v40;
  unint64_t v41;
  unint64_t v42;
  int v43;
  int v44;
  unsigned int v45;
  int v46;
  int v47;
  uint64_t v48;

  v4 = *((_QWORD *)this + 13);
  if ((v4 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    v10 = 0;
  }
  else
  {
    v5 = HIDWORD(v4);
    v6 = -32;
    do
    {
      LODWORD(v5) = 2 * v5;
      v7 = v6 + 1;
      if ((v5 & 0x80000000) != 0)
        break;
      v8 = v6 + 32;
      ++v6;
    }
    while (v8 < 0x1E);
    HEVC_RBSP::flush_bits((uint64_t)this, v7 + 33);
    v9 = *((_DWORD *)this + 27) >> -(char)v7;
    HEVC_RBSP::flush_bits((uint64_t)this, v7 + 32);
    v10 = v9 + ~(-2 << (v7 + 31));
  }
  a2[1] = v10;
  v11 = *((_QWORD *)this + 13) >> 63;
  HEVC_RBSP::flush_bits((uint64_t)this, 1);
  a2[2] = v11;
  v12 = *((_QWORD *)this + 13);
  if ((v12 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    a2[3] = 0;
  }
  else
  {
    v13 = HIDWORD(v12);
    v14 = -32;
    do
    {
      LODWORD(v13) = 2 * v13;
      v15 = v14 + 1;
      if ((v13 & 0x80000000) != 0)
        break;
      v16 = v14 + 32;
      ++v14;
    }
    while (v16 < 0x1E);
    HEVC_RBSP::flush_bits((uint64_t)this, v15 + 33);
    v17 = *((_DWORD *)this + 27) >> -(char)v15;
    HEVC_RBSP::flush_bits((uint64_t)this, v15 + 32);
    v18 = v17 + ~(-2 << (v15 + 31));
    a2[3] = v18;
    if (v18 >= 3)
      syslog(3, "AppleD5500: sei->pan_scan_cnt_minus1 > 2, is %d", v17 + ~(-2 << (v15 + 31)));
  }
  v19 = 0;
  do
  {
    v20 = *((_QWORD *)this + 13);
    if ((v20 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits((uint64_t)this, 1);
      v26 = 0;
    }
    else
    {
      v21 = HIDWORD(v20);
      v22 = -32;
      do
      {
        LODWORD(v21) = 2 * v21;
        v23 = v22 + 1;
        if ((v21 & 0x80000000) != 0)
          break;
        v24 = v22 + 32;
        ++v22;
      }
      while (v24 < 0x1E);
      HEVC_RBSP::flush_bits((uint64_t)this, v23 + 33);
      v25 = *((_DWORD *)this + 27) >> -(char)v23;
      HEVC_RBSP::flush_bits((uint64_t)this, v23 + 32);
      v26 = v25 + ~(-2 << (v23 + 31));
    }
    a2[v19 + 4] = (-((v26 & 1) == 0) ^ ((v26 + 1) >> 1)) + ((v26 & 1) == 0);
    v27 = *((_QWORD *)this + 13);
    if ((v27 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits((uint64_t)this, 1);
      v33 = 0;
    }
    else
    {
      v28 = HIDWORD(v27);
      v29 = -32;
      do
      {
        LODWORD(v28) = 2 * v28;
        v30 = v29 + 1;
        if ((v28 & 0x80000000) != 0)
          break;
        v31 = v29 + 32;
        ++v29;
      }
      while (v31 < 0x1E);
      HEVC_RBSP::flush_bits((uint64_t)this, v30 + 33);
      v32 = *((_DWORD *)this + 27) >> -(char)v30;
      HEVC_RBSP::flush_bits((uint64_t)this, v30 + 32);
      v33 = v32 + ~(-2 << (v30 + 31));
    }
    a2[v19 + 7] = (-((v33 & 1) == 0) ^ ((v33 + 1) >> 1)) + ((v33 & 1) == 0);
    v34 = *((_QWORD *)this + 13);
    if ((v34 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits((uint64_t)this, 1);
      v40 = 0;
    }
    else
    {
      v35 = HIDWORD(v34);
      v36 = -32;
      do
      {
        LODWORD(v35) = 2 * v35;
        v37 = v36 + 1;
        if ((v35 & 0x80000000) != 0)
          break;
        v38 = v36 + 32;
        ++v36;
      }
      while (v38 < 0x1E);
      HEVC_RBSP::flush_bits((uint64_t)this, v37 + 33);
      v39 = *((_DWORD *)this + 27) >> -(char)v37;
      HEVC_RBSP::flush_bits((uint64_t)this, v37 + 32);
      v40 = v39 + ~(-2 << (v37 + 31));
    }
    a2[v19 + 10] = (-((v40 & 1) == 0) ^ ((v40 + 1) >> 1)) + ((v40 & 1) == 0);
    v41 = *((_QWORD *)this + 13);
    if ((v41 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits((uint64_t)this, 1);
      v47 = 0;
    }
    else
    {
      v42 = HIDWORD(v41);
      v43 = -32;
      do
      {
        LODWORD(v42) = 2 * v42;
        v44 = v43 + 1;
        if ((v42 & 0x80000000) != 0)
          break;
        v45 = v43 + 32;
        ++v43;
      }
      while (v45 < 0x1E);
      HEVC_RBSP::flush_bits((uint64_t)this, v44 + 33);
      v46 = *((_DWORD *)this + 27) >> -(char)v44;
      HEVC_RBSP::flush_bits((uint64_t)this, v44 + 32);
      v47 = v46 + ~(-2 << (v44 + 31));
    }
    a2[v19++ + 13] = (-((v47 & 1) == 0) ^ ((v47 + 1) >> 1)) + ((v47 & 1) == 0);
  }
  while (v19 <= a2[3]);
  v48 = *((_QWORD *)this + 13) >> 63;
  HEVC_RBSP::flush_bits((uint64_t)this, 1);
  a2[16] = v48;
  *a2 = 1;
  return 1;
}

uint64_t HEVC_RBSP::parseSeiFillerPayload(uint64_t this, int a2)
{
  int v2;
  uint64_t v3;

  if (a2)
  {
    v2 = a2;
    v3 = this;
    do
    {
      this = HEVC_RBSP::flush_bits(v3, 8);
      --v2;
    }
    while (v2);
  }
  return this;
}

uint64_t HEVC_RBSP::parseSeiRecoveryPoint(HEVC_RBSP *this, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  int v6;
  int v7;
  unsigned int v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  v4 = *((_QWORD *)this + 13);
  if ((v4 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    v10 = 0;
  }
  else
  {
    v5 = HIDWORD(v4);
    v6 = -32;
    do
    {
      LODWORD(v5) = 2 * v5;
      v7 = v6 + 1;
      if ((v5 & 0x80000000) != 0)
        break;
      v8 = v6 + 32;
      ++v6;
    }
    while (v8 < 0x1E);
    HEVC_RBSP::flush_bits((uint64_t)this, v7 + 33);
    v9 = *((_DWORD *)this + 27) >> -(char)v7;
    HEVC_RBSP::flush_bits((uint64_t)this, v7 + 32);
    v10 = v9 + ~(-2 << (v7 + 31));
  }
  *(_DWORD *)(a2 + 4) = (-((v10 & 1) == 0) ^ ((v10 + 1) >> 1)) + ((v10 & 1) == 0);
  v11 = *((_QWORD *)this + 13) >> 63;
  HEVC_RBSP::flush_bits((uint64_t)this, 1);
  *(_BYTE *)(a2 + 8) = v11;
  v12 = *((_QWORD *)this + 13) >> 63;
  result = HEVC_RBSP::flush_bits((uint64_t)this, 1);
  *(_BYTE *)(a2 + 9) = v12;
  *(_DWORD *)a2 = 1;
  return result;
}

uint64_t HEVC_RBSP::parseSeiStructureOfPicturesInfo(HEVC_RBSP *this, _DWORD *a2)
{
  unint64_t v4;
  unint64_t v5;
  int v6;
  int v7;
  unsigned int v8;
  int v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  int v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  _DWORD *v18;
  uint64_t result;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  _DWORD *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  int v27;
  int v28;
  unsigned int v29;
  int v30;
  int v31;
  unint64_t v32;
  unint64_t v33;
  int v34;
  int v35;
  unsigned int v36;
  int v37;
  int v38;

  v4 = *((_QWORD *)this + 13);
  if ((v4 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    v10 = 0;
  }
  else
  {
    v5 = HIDWORD(v4);
    v6 = -32;
    do
    {
      LODWORD(v5) = 2 * v5;
      v7 = v6 + 1;
      if ((v5 & 0x80000000) != 0)
        break;
      v8 = v6 + 32;
      ++v6;
    }
    while (v8 < 0x1E);
    HEVC_RBSP::flush_bits((uint64_t)this, v7 + 33);
    v9 = *((_DWORD *)this + 27) >> -(char)v7;
    HEVC_RBSP::flush_bits((uint64_t)this, v7 + 32);
    v10 = v9 + ~(-2 << (v7 + 31));
  }
  a2[1] = v10;
  v11 = *((_QWORD *)this + 13);
  if ((v11 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits((uint64_t)this, 1);
    a2[2] = 0;
    v18 = a2 + 2;
  }
  else
  {
    v12 = HIDWORD(v11);
    v13 = -32;
    do
    {
      LODWORD(v12) = 2 * v12;
      v14 = v13 + 1;
      if ((v12 & 0x80000000) != 0)
        break;
      v15 = v13 + 32;
      ++v13;
    }
    while (v15 < 0x1E);
    HEVC_RBSP::flush_bits((uint64_t)this, v14 + 33);
    v16 = *((_DWORD *)this + 27) >> -(char)v14;
    HEVC_RBSP::flush_bits((uint64_t)this, v14 + 32);
    v17 = v16 + ~(-2 << (v14 + 31));
    a2[2] = v17;
    v18 = a2 + 2;
    if (v17 > 0x3FF)
    {
      syslog(3, "AppleD5500: sei->num_entries_in_sop_minus1 >= HEVC_MAX_NUM_PICS_IN_SOP, is %d", v17);
      return 0;
    }
  }
  v20 = 0;
  do
  {
    v21 = *((_QWORD *)this + 13) >> 58;
    HEVC_RBSP::flush_bits((uint64_t)this, 6);
    v22 = v20;
    v23 = &a2[v20];
    v23[3] = v21;
    v24 = *((_QWORD *)this + 13) >> 61;
    HEVC_RBSP::flush_bits((uint64_t)this, 3);
    v23[1027] = v24;
    if ((v23[3] - 19) >= 2)
    {
      v25 = *((_QWORD *)this + 13);
      if ((v25 & 0x8000000000000000) != 0)
      {
        HEVC_RBSP::flush_bits((uint64_t)this, 1);
        v31 = 0;
      }
      else
      {
        v26 = HIDWORD(v25);
        v27 = -32;
        do
        {
          LODWORD(v26) = 2 * v26;
          v28 = v27 + 1;
          if ((v26 & 0x80000000) != 0)
            break;
          v29 = v27 + 32;
          ++v27;
        }
        while (v29 < 0x1E);
        HEVC_RBSP::flush_bits((uint64_t)this, v28 + 33);
        v30 = *((_DWORD *)this + 27) >> -(char)v28;
        HEVC_RBSP::flush_bits((uint64_t)this, v28 + 32);
        v31 = v30 + ~(-2 << (v28 + 31));
      }
      a2[v22 + 2051] = v31;
    }
    if ((_DWORD)v22)
    {
      v32 = *((_QWORD *)this + 13);
      if ((v32 & 0x8000000000000000) != 0)
      {
        HEVC_RBSP::flush_bits((uint64_t)this, 1);
        v38 = 0;
      }
      else
      {
        v33 = HIDWORD(v32);
        v34 = -32;
        do
        {
          LODWORD(v33) = 2 * v33;
          v35 = v34 + 1;
          if ((v33 & 0x80000000) != 0)
            break;
          v36 = v34 + 32;
          ++v34;
        }
        while (v36 < 0x1E);
        HEVC_RBSP::flush_bits((uint64_t)this, v35 + 33);
        v37 = *((_DWORD *)this + 27) >> -(char)v35;
        HEVC_RBSP::flush_bits((uint64_t)this, v35 + 32);
        v38 = v37 + ~(-2 << (v35 + 31));
      }
      a2[v22 + 3075] = (-((v38 & 1) == 0) ^ ((v38 + 1) >> 1)) + ((v38 & 1) == 0);
    }
    v20 = v22 + 1;
  }
  while ((v22 + 1) <= *v18);
  result = 1;
  *a2 = 1;
  return result;
}

uint64_t HEVC_RBSP::parseSeiDecodedPictureHash(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  int v6;
  uint64_t result;
  unint64_t v8;
  _DWORD *i;
  uint64_t j;
  int v11;
  int v12;
  char v13;
  uint64_t v14;

  v6 = *(unsigned __int8 *)(a1 + 111);
  result = HEVC_RBSP::flush_bits(a1, 8);
  v8 = 0;
  a3[1] = v6;
  for (i = a3 + 2; ; i += 16)
  {
    switch(v6)
    {
      case 2:
        v13 = 32;
        v12 = 32;
        goto LABEL_10;
      case 1:
        v12 = 16;
        v13 = 48;
LABEL_10:
        v14 = *(_QWORD *)(a1 + 104) >> v13;
        result = HEVC_RBSP::flush_bits(a1, v12);
        a3[16 * v8 + 2] = v14;
        break;
      case 0:
        for (j = 0; j != 16; ++j)
        {
          v11 = *(unsigned __int8 *)(a1 + 111);
          result = HEVC_RBSP::flush_bits(a1, 8);
          i[j] = v11;
        }
        break;
    }
    if (!*(_DWORD *)(a2 + 460) || v8 >= 2)
      break;
    ++v8;
    v6 = a3[1];
  }
  *a3 = 1;
  return result;
}

uint64_t HEVC_RBSP::parseSeiActiveParameterSets(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  int v10;
  unsigned int v11;
  int v12;
  int v13;
  uint64_t result;
  unsigned int v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  int v19;
  unsigned int v20;
  int v21;
  int v22;

  v4 = *(_QWORD *)(a1 + 104) >> 60;
  HEVC_RBSP::flush_bits(a1, 4);
  *(_DWORD *)(a2 + 4) = v4;
  v5 = *(_QWORD *)(a1 + 104) >> 63;
  HEVC_RBSP::flush_bits(a1, 1);
  *(_BYTE *)(a2 + 8) = v5;
  v6 = *(_QWORD *)(a1 + 104) >> 63;
  HEVC_RBSP::flush_bits(a1, 1);
  *(_BYTE *)(a2 + 9) = v6;
  v7 = *(_QWORD *)(a1 + 104);
  if ((v7 & 0x8000000000000000) != 0)
  {
    HEVC_RBSP::flush_bits(a1, 1);
    *(_DWORD *)(a2 + 12) = 0;
  }
  else
  {
    v8 = HIDWORD(v7);
    v9 = -32;
    do
    {
      LODWORD(v8) = 2 * v8;
      v10 = v9 + 1;
      if ((v8 & 0x80000000) != 0)
        break;
      v11 = v9 + 32;
      ++v9;
    }
    while (v11 < 0x1E);
    HEVC_RBSP::flush_bits(a1, v10 + 33);
    v12 = *(_DWORD *)(a1 + 108) >> -(char)v10;
    HEVC_RBSP::flush_bits(a1, v10 + 32);
    v13 = v12 + ~(-2 << (v10 + 31));
    *(_DWORD *)(a2 + 12) = v13;
    if (v13 > 15)
    {
      syslog(3, "AppleD5500: sei->num_sps_ids_minus1 > HEVC_MAX_SPS_SET, is %d", v12 + ~(-2 << (v10 + 31)));
      return 0;
    }
  }
  v15 = 0;
  do
  {
    v16 = *(_QWORD *)(a1 + 104);
    if ((v16 & 0x8000000000000000) != 0)
    {
      HEVC_RBSP::flush_bits(a1, 1);
      v22 = 0;
    }
    else
    {
      v17 = HIDWORD(v16);
      v18 = -32;
      do
      {
        LODWORD(v17) = 2 * v17;
        v19 = v18 + 1;
        if ((v17 & 0x80000000) != 0)
          break;
        v20 = v18 + 32;
        ++v18;
      }
      while (v20 < 0x1E);
      HEVC_RBSP::flush_bits(a1, v19 + 33);
      v21 = *(_DWORD *)(a1 + 108) >> -(char)v19;
      HEVC_RBSP::flush_bits(a1, v19 + 32);
      v22 = v21 + ~(-2 << (v19 + 31));
    }
    *(_DWORD *)(a2 + 4 * v15++ + 16) = v22;
  }
  while (v15 <= *(_DWORD *)(a2 + 12));
  result = 1;
  *(_DWORD *)a2 = 1;
  return result;
}

void HEVC_RBSP::calcScanOrder(HEVC_RBSP *this, unsigned int a2, unsigned int *a3, unsigned int *a4, unsigned int *a5)
{
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  int v10;
  int v11;
  int i;
  int j;
  int v14;
  unsigned int k;
  int v16;
  unsigned int v17;

  v5 = 0;
  v6 = 0;
  do
  {
    if ((v6 & 0x80000000) != 0)
    {
      v8 = 0;
    }
    else
    {
      v7 = 0;
      v8 = v6 + 1;
      v9 = a2 * v6;
      do
      {
        if (v6 < a2 && v7 < a2)
          a3[v5++] = v9;
        --v6;
        ++v7;
        v9 += 1 - a2;
      }
      while (v6 != -1);
    }
    v6 = v8;
  }
  while (v5 < a2 * a2);
  if (a2)
  {
    v10 = 0;
    v11 = 0;
    for (i = 0; i != a2; ++i)
    {
      for (j = 0; j != a2; ++j)
        a4[v11 + j] = v10 + j;
      v11 += j;
      v10 += a2;
    }
    v14 = 0;
    for (k = 0; k != a2; ++k)
    {
      v16 = 0;
      v17 = k;
      do
      {
        a5[v14 + v16++] = v17;
        v17 += a2;
      }
      while (a2 != v16);
      v14 += v16;
    }
  }
}

void HevcReleaseSeiPicTiming(uint64_t a1)
{
  free(*(void **)(a1 + 40));
  free(*(void **)(a1 + 48));
}

void *HevcCopyDependentSliceHeader(__int16 *a1, const void *a2)
{
  __int16 v3;
  int v4;
  char v5;
  int v6;
  uint64_t v7;
  void *result;

  v3 = *a1;
  v4 = *((_DWORD *)a1 + 1);
  v5 = *((_BYTE *)a1 + 8);
  v6 = *((_DWORD *)a1 + 3);
  v7 = *((_QWORD *)a1 + 159);
  result = memcpy(a1, a2, 0x59CuLL);
  *a1 = v3;
  *((_DWORD *)a1 + 1) = v4;
  *((_BYTE *)a1 + 8) = v5;
  *((_DWORD *)a1 + 3) = v6;
  *((_QWORD *)a1 + 159) = v7;
  return result;
}

double HEVCReleaseSubLayerHRD(void **a1, int a2)
{
  double result;

  if (a1)
  {
    if (a2)
    {
      free(a1[2]);
      free(a1[3]);
    }
    free(*a1);
    free(a1[1]);
    free(a1[4]);
    result = 0.0;
    *((_OWORD *)a1 + 1) = 0u;
    *((_OWORD *)a1 + 2) = 0u;
    *(_OWORD *)a1 = 0u;
  }
  return result;
}

uint64_t AppleD5500DisplaySurface(uint64_t a1, unsigned int a2)
{
  uint64_t result;
  uint64_t v5;

  v5 = 0;
  BufferPool::getBufferInfo(*(pthread_mutex_t **)(a1 + 2096), a2, &v5);
  if (v5)
  {
    result = 0;
  }
  else
  {
    printf("AppleD5500DisplaySurface index %d, errorStatus 1\n", a2);
    result = 1;
  }
  ++*(_DWORD *)(a1 + 2108);
  return result;
}

uint64_t AppleD5500ReleaseCVPixelBuffer(uint64_t a1, unsigned int a2)
{
  return BufferPool::releaseBuffer(*(pthread_mutex_t **)(a1 + 2096), a2);
}

uint64_t AppleD5500CreateDecodeDeviceInternal(uint64_t a1, char a2, int a3, int a4, uint64_t a5, int a6)
{
  int v7;
  int v8;
  int v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  size_t outputStructCnt;
  _OWORD outputStruct[3];
  __int128 v20;
  uint64_t v21;
  _DWORD inputStruct[2];
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
  uint64_t v39;

  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0;
  v21 = 0;
  v20 = 0u;
  memset(outputStruct, 0, sizeof(outputStruct));
  outputStructCnt = 72;
  inputStruct[0] = a3;
  inputStruct[1] = a4;
  BYTE8(v23) = a2;
  v7 = *(_DWORD *)(a1 + 3104);
  BYTE9(v23) = *(_DWORD *)(a1 + 3152);
  v8 = *(_DWORD *)(a1 + 3156);
  v9 = *(_DWORD *)(a1 + 3224);
  DWORD2(v32) = v7;
  HIDWORD(v23) = v8;
  LODWORD(v24) = v9;
  if (*(_DWORD *)(a1 + 5936) == 2)
    HIDWORD(v24) = 1;
  LODWORD(v23) = a6;
  if (*(_DWORD *)(a1 + 3228))
  {
    v10 = *(_OWORD *)(a1 + 3272);
    v36 = *(_OWORD *)(a1 + 3288);
    v11 = *(_OWORD *)(a1 + 3320);
    v37 = *(_OWORD *)(a1 + 3304);
    v38 = v11;
    v12 = *(_OWORD *)(a1 + 3256);
    v33 = *(_OWORD *)(a1 + 3240);
    v34 = v12;
    v39 = *(_QWORD *)(a1 + 3336);
    v35 = v10;
    v13 = *(_DWORD *)(a1 + 3408);
    DWORD1(v24) = 1;
    DWORD2(v24) = v13;
  }
  DWORD1(v23) = *(_DWORD *)(a1 + 3596);
  v14 = IOConnectCallStructMethod(*(_DWORD *)a1, 0, inputStruct, 0x110uLL, outputStruct, &outputStructCnt);
  v15 = v14;
  if ((_DWORD)v14)
    syslog(3, "AppleD5500:  AppleD5500CreateDecoder failed error: %d \n", v14);
  *(_DWORD *)(a1 + 3032) = DWORD2(outputStruct[0]);
  *(int8x16_t *)(a1 + 5672) = vextq_s8(*(int8x16_t *)((char *)&outputStruct[1] + 12), *(int8x16_t *)((char *)&outputStruct[1] + 12), 8uLL);
  if ((*(_DWORD *)(a1 + 2140) & 0xFFFFFFFE) == 2)
  {
    *(_DWORD *)(a1 + 2144) = outputStruct[0];
    v16 = outputStruct[2];
    *(_OWORD *)(a1 + 3168) = outputStruct[1];
    *(_OWORD *)(a1 + 3184) = v16;
    *(_OWORD *)(a1 + 3200) = v20;
    *(_DWORD *)(a1 + 3216) = v21;
  }
  return v15;
}

uint64_t AppleD5500DestroyDecodeDeviceInternal(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  size_t outputStructCnt;
  _OWORD outputStruct[8];
  int v8;
  _BYTE inputStruct[8];

  outputStructCnt = 132;
  memset(outputStruct, 0, sizeof(outputStruct));
  v8 = 0;
  v2 = IOConnectCallStructMethod(*(_DWORD *)a1, 1u, inputStruct, 4uLL, outputStruct, &outputStructCnt);
  v3 = v2;
  if ((_DWORD)v2)
    syslog(3, "AppleD5500:  AppleD5500DestroyDecoder failed error: %d \n", v2);
  if (WORD1(outputStruct[0]))
  {
    v4 = 0;
    do
      BufferPool::releaseBuffer(*(pthread_mutex_t **)(a1 + 2096), *((unsigned __int16 *)outputStruct + v4++ + 2));
    while (v4 < WORD1(outputStruct[0]));
  }
  return v3;
}

uint64_t AppleD5500DecodeFrameInternal(uint64_t a1, unint64_t a2, int a3, int a4, int a5, int a6)
{
  int v12;
  int v13;
  int v14;
  int v15;
  char *v16;
  int v17;
  size_t v18;
  uint64_t v19;
  int v20;
  _QWORD v22[8];
  size_t outputStructCnt;
  _BYTE outputStruct[136];
  int v25;
  int v26;
  _DWORD inputStruct[4];
  _DWORD v28[3];
  char v29;
  char v30;
  uint64_t v31;
  char v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  char v39;
  uint64_t v40;
  char v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  bzero(v28, 0x844uLL);
  bzero(outputStruct, 0x410uLL);
  outputStructCnt = 1040;
  inputStruct[0] = a3;
  inputStruct[1] = a4;
  v32 = *(_BYTE *)(a1 + 2116);
  v29 = *(_DWORD *)(a1 + 3224);
  v12 = *(_DWORD *)(a1 + 3344);
  inputStruct[2] = a5;
  inputStruct[3] = a6;
  v30 = *(_DWORD *)(a1 + 3356);
  v31 = *(_QWORD *)(a1 + 3360);
  v13 = *(_DWORD *)(a1 + 3348);
  v14 = *(_DWORD *)(a1 + 5952);
  v33 = v12;
  v42 = v14;
  v15 = *(_DWORD *)(a1 + 3424);
  v28[2] = v13;
  v28[1] = v15;
  RingBuffer::getRingBufferInfo(*(_QWORD *)(a1 + 3136), (uint64_t)v22);
  if (v22[1] <= a2)
    syslog(3, "AppleD5500:   %s : %d assert broken \n", "/Library/Caches/com.apple.xbs/Sources/AppleD5500/AppleD5500VideoDecodeInternal.cpp", 507);
  v16 = (char *)(a1 + 5896);
  v17 = a2 - LODWORD(v22[0]);
  if ((a2 - v22[0]) >> 32)
  {
    syslog(3, "AppleD5500: %s %d 64->32 conversion problem!", "AppleD5500DecodeFrameInternal", 509);
    v17 = a2 - LODWORD(v22[0]);
  }
  v28[0] = v17;
  v34 = *(_QWORD *)(a1 + 3600);
  v35 = *(_QWORD *)(a1 + 3608);
  if ((*(_DWORD *)(a1 + 2120) & 0xFFFFFFFE) == 4)
  {
    v38 = *(_DWORD *)(a1 + 5664);
    v18 = 4 * v38;
    memcpy(&v36, (const void *)(a1 + 3616), v18);
    memcpy(&v37, (const void *)(a1 + 4640), v18);
  }
  else
  {
    v38 = 0;
  }
  if (*v16)
  {
    v39 = *v16;
    v40 = *(_QWORD *)(a1 + 5900);
  }
  v41 = *(_BYTE *)(a1 + 5932);
  v19 = IOConnectCallStructMethod(*(_DWORD *)a1, 2u, inputStruct, 0x858uLL, outputStruct, &outputStructCnt);
  if (v25)
    syslog(3, "AppleD5500: %s failed at frame %d with error: %d \n", "AppleD5500DecodeFrameInternal", a4, v25);
  v20 = v26;
  *(_DWORD *)(a1 + 3368) = v26;
  if (v20)
    syslog(3, "AppleD5500: %s failed at frame %d with decryptError: %d \n", "AppleD5500DecodeFrameInternal", a4, v20);
  return v19;
}

uint64_t AppleD5500MapPixelBuffer(mach_port_t *a1, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  size_t outputStructCnt;
  _BYTE outputStruct[8];
  _DWORD inputStruct[2];

  if (!a1[534])
    return 0;
  outputStructCnt = 4;
  inputStruct[0] = a2;
  inputStruct[1] = a3;
  v3 = IOConnectCallStructMethod(*a1, 3u, inputStruct, 8uLL, outputStruct, &outputStructCnt);
  v4 = v3;
  if ((_DWORD)v3)
    syslog(3, "AppleD5500:  AppleD5500MapPixelBuffer() failed error: %d \n", v3);
  return v4;
}

uint64_t AppleD5500UnmapPixelBuffer(mach_port_t *a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  size_t outputStructCnt;
  _BYTE outputStruct[8];
  int inputStruct;

  if (!a1[534])
    return 0;
  outputStructCnt = 4;
  inputStruct = a2;
  v2 = IOConnectCallStructMethod(*a1, 4u, &inputStruct, 4uLL, outputStruct, &outputStructCnt);
  v3 = v2;
  if ((_DWORD)v2)
    syslog(3, "AppleD5500:  AppleD5500UnmapPixelBuffer() failed error: %d \n", v2);
  return v3;
}

uint64_t AppleD5500GetPixelBufferFromBufferPool(uint64_t a1, unsigned int *a2)
{
  pthread_mutex_t *v4;
  BufferPool *v6;
  int v7;
  int v8;
  int v9;

  v4 = *(pthread_mutex_t **)(a1 + 2096);
  if (v4)
    return BufferPool::getBuffer(v4, a2, *(_DWORD *)(a1 + 2112));
  v6 = (BufferPool *)operator new();
  BufferPool::BufferPool(v6);
  *(_QWORD *)(a1 + 2096) = v6;
  v7 = *(_DWORD *)(a1 + 2140);
  if (v7 == 2)
  {
    v8 = *(_DWORD *)(a1 + 2144);
    if (v8 >= 17)
      v8 = 17;
    goto LABEL_8;
  }
  if (v7 == 3)
  {
    v8 = *(_DWORD *)(a1 + 2144);
LABEL_8:
    v9 = (v8 + 3) << (*(_DWORD *)(a1 + 3352) != 0);
    goto LABEL_12;
  }
  if (*(int *)(a1 + 16) >= 1280)
    v9 = 10;
  else
    v9 = 18;
LABEL_12:
  if (!BufferPool::initBufferPool(v6, (void *)a1, *(__CVPixelBufferPool **)(a1 + 2088), v9))
  {
    v4 = *(pthread_mutex_t **)(a1 + 2096);
    return BufferPool::getBuffer(v4, a2, *(_DWORD *)(a1 + 2112));
  }
  syslog(3, "AppleD5500: initBufferPool failed");
  return 0xFFFFFFFFLL;
}

void sub_219524C34(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x219A2D46C](v1, 0x10A0C400010A2E9);
  _Unwind_Resume(a1);
}

uint64_t AppleD5500GetSecondPixelBufferFromBufferPool(uint64_t a1, unsigned int *a2)
{
  pthread_mutex_t *v3;

  v3 = *(pthread_mutex_t **)(a1 + 2096);
  if (v3)
    return BufferPool::getSecondBuffer(v3, a2, *(_DWORD *)(a1 + 2112));
  else
    return 0xFFFFFFFFLL;
}

uint64_t AppleD5500PutPixelBufferInPool(uint64_t a1, unsigned int *a2)
{
  BufferPool *v4;
  BufferPool *v5;

  v4 = *(BufferPool **)(a1 + 2096);
  if (!v4)
  {
    v5 = (BufferPool *)operator new();
    BufferPool::BufferPool(v5);
    *(_QWORD *)(a1 + 2096) = v5;
    BufferPool::initBufferPool(v5, (void *)a1, 0, 2);
    v4 = *(BufferPool **)(a1 + 2096);
    *((_BYTE *)v4 + 192) = 1;
  }
  return BufferPool::putBuffer(v4, a2, *(_DWORD *)(a1 + 2112), *(__CVBuffer **)(a1 + 5912));
}

void sub_219524CFC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x219A2D46C](v1, 0x10A0C400010A2E9);
  _Unwind_Resume(a1);
}

void BufferPool::BufferPool(BufferPool *this)
{
  *((_BYTE *)this + 112) = 0;
  *((_QWORD *)this + 19) = 0;
  *((_QWORD *)this + 15) = 0;
  *((_QWORD *)this + 16) = 0;
  *((_DWORD *)this + 34) = 0;
  *((_QWORD *)this + 22) = 0;
  *((_QWORD *)this + 23) = 0;
  *((_QWORD *)this + 21) = 0;
  *((_BYTE *)this + 192) = 0;
}

uint64_t BufferPool::initBufferPool(BufferPool *this, void *a2, __CVPixelBufferPool *a3, int a4)
{
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _DWORD *v17;

  if (!a2 || *((_BYTE *)this + 112))
  {
    syslog(5, "%s :failed due to p_ctx=%p, p_cv_pool=%p, max_cache_size=%d, m_is_initialized=%d\n", "int BufferPool::initBufferPool(void *, CVPixelBufferPoolRef, int)", a2, a3, a4, *((unsigned __int8 *)this + 112));
    return 4294967294;
  }
  else
  {
    v8 = pthread_mutex_init((pthread_mutex_t *)this, 0);
    if ((_DWORD)v8)
    {
      v9 = v8;
      v10 = "ENOMEM";
      if ((_DWORD)v8 == 22)
        v10 = "EINVAL";
      if ((_DWORD)v8 == 35)
        v10 = "EAGAIN";
      syslog(5, "%s : cannot initialize mutex, return erro %d [ %s ]\n", "int BufferPool::initBufferPool(void *, CVPixelBufferPoolRef, int)", v8, v10);
    }
    else
    {
      v12 = pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0);
      if ((_DWORD)v12)
      {
        v9 = v12;
        v13 = "ENOMEM";
        if ((_DWORD)v12 == 22)
          v13 = "EINVAL";
        if ((_DWORD)v12 == 35)
          v13 = "EAGAIN";
        syslog(5, "%s : cannot initialize cond variale, return erro %d [ %s ]\n", "int BufferPool::initBufferPool(void *, CVPixelBufferPoolRef, int)", v12, v13);
      }
      else
      {
        mach_timebase_info((mach_timebase_info_t)this + 20);
        *((_QWORD *)this + 22) = mach_absolute_time();
        *((_DWORD *)this + 34) = a4;
        v14 = operator new[]();
        *((_QWORD *)this + 15) = v14;
        v15 = *((unsigned int *)this + 34);
        if ((_DWORD)v15)
        {
          v16 = *((_QWORD *)this + 22);
          v17 = (_DWORD *)(v14 + 56);
          do
          {
            *(v17 - 14) = 0;
            *((_OWORD *)v17 - 3) = 0uLL;
            *((_OWORD *)v17 - 2) = 0uLL;
            *(v17 - 4) = 0;
            *((_QWORD *)v17 - 1) = v16;
            *v17 = -1;
            v17 += 16;
            --v15;
          }
          while (v15);
        }
        v9 = 0;
        *((_QWORD *)this + 18) = a2;
        *((_QWORD *)this + 16) = a3;
        *((_BYTE *)this + 112) = 1;
      }
    }
  }
  return v9;
}

void BufferPool::pruneBuffers(BufferPool *this)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if (*((_BYTE *)this + 112))
  {
    *((_QWORD *)this + 23) = mach_absolute_time();
    v2 = *((unsigned int *)this + 34);
    if ((_DWORD)v2)
    {
      v3 = 0;
      v4 = 0;
      v5 = *((_QWORD *)this + 15);
      do
      {
        v6 = (*((_QWORD *)this + 23) - *(_QWORD *)(v5 + v3 + 48))
           * (*((_DWORD *)this + 40) / *((_DWORD *)this + 41));
        *((_QWORD *)this + 21) = v6 / 0xF4240;
        if (v6 >= 0x7744D640 && !*(_DWORD *)(v5 + v3 + 36) && *(_DWORD *)(v5 + v3) == 2)
        {
          if (*(_QWORD *)(v5 + v3 + 24))
          {
            AppleD5500UnmapPixelBuffer(*((mach_port_t **)this + 18), v4);
            CFRelease(*(CFTypeRef *)(*((_QWORD *)this + 15) + v3 + 24));
            v5 = *((_QWORD *)this + 15);
            v7 = v5 + v3;
            *(_DWORD *)v7 = 0;
            *(_QWORD *)(v7 + 48) = 0;
            *(_QWORD *)(v7 + 16) = 0;
            *(_QWORD *)(v7 + 24) = 0;
            *(_QWORD *)(v7 + 8) = 0;
            *(_DWORD *)(v7 + 32) = 0;
            v2 = *((unsigned int *)this + 34);
          }
        }
        ++v4;
        v3 += 64;
      }
      while (v4 < v2);
    }
  }
  else
  {
    syslog(3, "AppleD5500: %s called on uninitialized pool!\n", "pruneBuffers");
  }
}

uint64_t BufferPool::getBuffer(pthread_mutex_t *this, unsigned int *a2, int a3)
{
  CVReturn v6;
  __IOSurface *IOSurface;
  IOSurfaceID ID;
  void *BaseAddress;
  unsigned int BaseAddressOfPlane;
  unsigned int v12;
  int i;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unsigned int *v21;
  unsigned int v22;
  unsigned int *v23;
  unsigned int v24;
  unsigned int v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int *v33;
  CVPixelBufferRef pixelBufferOut;

  pixelBufferOut = 0;
  if (!this[2].__sig || !this[1].__opaque[40])
  {
    syslog(3, "attempted to use getBuffer in the tiling case!\n");
    return 4294967294;
  }
  pthread_mutex_lock(this);
  if ((a3 & 0x1F) == 0)
    BufferPool::pruneBuffers((BufferPool *)this);
  v6 = CVPixelBufferPoolCreatePixelBuffer(0, (CVPixelBufferPoolRef)this[2].__sig, &pixelBufferOut);
  if (v6)
  {
    syslog(3, "AppleD5500: AppleD5500_H264VideoDecoder CVPixelBufferPoolCreatePixelBuffer failed with err %d", v6);
    goto LABEL_7;
  }
  v33 = a2;
  IOSurface = CVPixelBufferGetIOSurface(pixelBufferOut);
  ID = IOSurfaceGetID(IOSurface);
  BaseAddress = IOSurfaceGetBaseAddress(IOSurface);
  BaseAddressOfPlane = IOSurfaceGetBaseAddressOfPlane(IOSurface, 0);
  v12 = IOSurfaceGetBaseAddressOfPlane(IOSurface, 1uLL);
  IOSurfaceGetBytesPerRowOfPlane(IOSurface, 0);
  IOSurfaceGetHeight(IOSurface);
  IOSurfaceGetWidth(IOSurface);
  if ((BaseAddressOfPlane & 0xFFF) != 0)
    syslog(3, "AppleD5500: WARNING :: destBaseAddr %x is not page aligned\n", BaseAddressOfPlane);
  if ((v12 & 0xFFF) != 0)
    syslog(3, "AppleD5500: WARNING :: uvplane baseAddr %x is not page aligned\n", v12);
  for (i = 0; i != 100; ++i)
  {
    v14 = *(unsigned int *)this[2].__opaque;
    v15 = *(_QWORD *)&this[1].__opaque[48];
    v16 = 0;
    if ((_DWORD)v14)
    {
      v17 = 0;
      LODWORD(v18) = 0xFFFF;
      do
      {
        if (*(__IOSurface **)(v15 + v17 + 24) == IOSurface)
        {
          if (*(void **)(v15 + v17 + 8) != BaseAddress)
          {
            syslog(3, "AppleD5500: WARNING :: ioSurfaceRef %d matched, destBaseAddr differ expected %x, received %x\n", (_DWORD)IOSurface, *(_QWORD *)(v15 + v17 + 8), (_DWORD)BaseAddress);
            AppleD5500UnmapPixelBuffer(*(mach_port_t **)&this[2].__opaque[8], v16);
            CFRelease(*(CFTypeRef *)(*(_QWORD *)&this[1].__opaque[48] + v17 + 24));
            if (AppleD5500MapPixelBuffer(*(mach_port_t **)&this[2].__opaque[8], v16, ID))
            {
              v19 = *(_QWORD *)&this[1].__opaque[48] + v17;
              goto LABEL_35;
            }
            CFRetain(IOSurface);
            v15 = *(_QWORD *)&this[1].__opaque[48];
            v27 = v15 + v17;
            *(_QWORD *)(v27 + 24) = IOSurface;
            *(_QWORD *)(v27 + 8) = BaseAddress;
            *(_QWORD *)(v27 + 16) = pixelBufferOut;
            *(_DWORD *)(v27 + 32) = ID;
            *v33 = v16;
            *(int32x2_t *)&this[2].__opaque[16] = vadd_s32(*(int32x2_t *)&this[2].__opaque[16], (int32x2_t)0x100000001);
          }
          v28 = v15 + v17;
          *(_DWORD *)(v28 + 32) = ID;
          v29 = v33;
          *(_QWORD *)(v28 + 16) = pixelBufferOut;
          *v33 = v16;
          goto LABEL_43;
        }
        if (*(_DWORD *)(v15 + v17))
          v18 = v18;
        else
          v18 = v16;
        v17 += 64;
        ++v16;
      }
      while (v14 << 6 != v17);
      if (v18 >= v14)
      {
        v20 = 0;
        v16 = 0;
        v15 = *(_QWORD *)&this[1].__opaque[48];
        v21 = (unsigned int *)(v15 + 40);
        v22 = -1;
        v23 = (unsigned int *)(v15 + 40);
        do
        {
          v25 = *v23;
          v23 += 16;
          v24 = v25;
          if (v25 < v22 && !*(v21 - 1))
          {
            v22 = v24;
            v16 = v20;
          }
          ++v20;
          v21 = v23;
        }
        while (v14 != v20);
        goto LABEL_32;
      }
      if (AppleD5500MapPixelBuffer(*(mach_port_t **)&this[2].__opaque[8], v18, ID))
      {
        v19 = *(_QWORD *)&this[1].__opaque[48] + (v18 << 6);
        goto LABEL_35;
      }
      CFRetain(IOSurface);
      v15 = *(_QWORD *)&this[1].__opaque[48];
      v31 = v15 + (v18 << 6);
      *(_DWORD *)(v31 + 32) = ID;
      *(_QWORD *)(v31 + 8) = BaseAddress;
      v29 = v33;
      *(_QWORD *)(v31 + 16) = pixelBufferOut;
      *(_QWORD *)(v31 + 24) = IOSurface;
      *v33 = v18;
      ++*(_DWORD *)&this[2].__opaque[16];
      goto LABEL_43;
    }
LABEL_32:
    if (!*(_DWORD *)(v15 + ((unint64_t)v16 << 6) + 36))
    {
      AppleD5500UnmapPixelBuffer(*(mach_port_t **)&this[2].__opaque[8], v16);
      CFRelease(*(CFTypeRef *)(*(_QWORD *)&this[1].__opaque[48] + ((unint64_t)v16 << 6) + 24));
      if (!AppleD5500MapPixelBuffer(*(mach_port_t **)&this[2].__opaque[8], v16, ID))
      {
        CFRetain(IOSurface);
        v15 = *(_QWORD *)&this[1].__opaque[48];
        v30 = v15 + ((unint64_t)v16 << 6);
        *(_DWORD *)(v30 + 32) = ID;
        *(_QWORD *)(v30 + 8) = BaseAddress;
        v29 = v33;
        *(_QWORD *)(v30 + 16) = pixelBufferOut;
        *(_QWORD *)(v30 + 24) = IOSurface;
        *v33 = v16;
        *(int32x2_t *)&this[2].__opaque[16] = vadd_s32(*(int32x2_t *)&this[2].__opaque[16], (int32x2_t)0x100000001);
LABEL_43:
        *(_DWORD *)(v15 + ((unint64_t)*v29 << 6) + 36) = 2;
        *(_DWORD *)(v15 + ((unint64_t)*v29 << 6)) = 1;
        *(_DWORD *)(v15 + ((unint64_t)*v29 << 6) + 40) = a3;
        v32 = mach_absolute_time();
        *(_QWORD *)&this[2].__opaque[40] = v32;
        *(_QWORD *)(*(_QWORD *)&this[1].__opaque[48] + ((unint64_t)*v29 << 6) + 48) = v32;
        pthread_mutex_unlock(this);
        return 0;
      }
      v19 = *(_QWORD *)&this[1].__opaque[48] + ((unint64_t)v16 << 6);
LABEL_35:
      *(_QWORD *)(v19 + 8) = 0;
      *(_QWORD *)(v19 + 16) = 0;
      v26 = v19 + 8;
      *(_DWORD *)(v26 + 24) = 0;
      *(_QWORD *)(v26 + 16) = 0;
    }
    pthread_cond_wait((pthread_cond_t *)&this[1], this);
  }
  if (pixelBufferOut)
    CVPixelBufferRelease(pixelBufferOut);
LABEL_7:
  pthread_mutex_unlock(this);
  return 4294967293;
}

uint64_t BufferPool::getSecondBuffer(pthread_mutex_t *this, unsigned int *a2, int a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  uint64_t v10;

  result = BufferPool::getBuffer(this, a2, a3);
  if (!(_DWORD)result)
  {
    v7 = *(unsigned int *)this[2].__opaque;
    if ((_DWORD)v7)
    {
      v8 = 0;
      v9 = (_DWORD *)(*(_QWORD *)&this[1].__opaque[48] + 56);
      do
      {
        if (*(v9 - 4) == a3)
        {
          v10 = *a2;
          if (v8 != v10)
            *v9 = v10;
        }
        v9 += 16;
        ++v8;
      }
      while (v7 != v8);
    }
  }
  return result;
}

uint64_t BufferPool::getBufferInfo(pthread_mutex_t *a1, unsigned int a2, _QWORD *a3)
{
  unsigned int v5;
  _DWORD *v7;
  uint64_t v8;

  if (a1[1].__opaque[40])
  {
    v5 = *(_DWORD *)a1[2].__opaque;
    if (v5 <= a2)
    {
      syslog(3, "AppleD5500: Bufferpool::getBufferInfo index %d cache_size %d\n", a2, v5);
      return 0xFFFFFFFFLL;
    }
    else
    {
      pthread_mutex_lock(a1);
      v7 = (_DWORD *)(*(_QWORD *)&a1[1].__opaque[48] + ((unint64_t)a2 << 6));
      if (*v7 == 1)
      {
        v8 = 0;
        *a3 = v7;
      }
      else
      {
        *a3 = 0;
        syslog(3, "AppleD5500: BufferPool::getBufferInfo error index %d\n", a2);
        v8 = 0xFFFFFFFFLL;
      }
      pthread_mutex_unlock(a1);
    }
  }
  else
  {
    syslog(3, "AppleD5500: %s called on uninitialized pool!\n", "getBufferInfo");
    return 4294967294;
  }
  return v8;
}

uint64_t BufferPool::putBuffer(BufferPool *this, unsigned int *a2, int a3, __CVBuffer *a4)
{
  __IOSurface *IOSurface;
  IOSurfaceID ID;
  void *BaseAddress;
  int i;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int *v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v24;
  unsigned int *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __CVBuffer *texture;

  if (!*((_BYTE *)this + 112))
  {
    syslog(3, "AppleD5500: %s called on uninitialized pool!\n", "putBuffer");
    return 4294967294;
  }
  pthread_mutex_lock((pthread_mutex_t *)this);
  texture = a4;
  IOSurface = CVPixelBufferGetIOSurface(a4);
  ID = IOSurfaceGetID(IOSurface);
  BaseAddress = IOSurfaceGetBaseAddress(IOSurface);
  for (i = 0; i != 100; ++i)
  {
    v10 = *((unsigned int *)this + 34);
    v11 = *((_QWORD *)this + 15);
    v12 = 0;
    if ((_DWORD)v10)
    {
      v13 = 0;
      v14 = -1;
      do
      {
        if (*(__IOSurface **)(v11 + v13 + 24) == IOSurface)
        {
          if (*(void **)(v11 + v13 + 8) == BaseAddress)
          {
            v24 = v11 + v13;
            *(_DWORD *)(v24 + 32) = ID;
            v25 = a2;
            *(_QWORD *)(v24 + 16) = texture;
            *a2 = v12;
          }
          else
          {
            syslog(3, "AppleD5500: WARNING :: ioSurfaceRef %d matched, destBaseAddr differ expected %x, received %x\n", (_DWORD)IOSurface, *(_QWORD *)(v11 + v13 + 8), (_DWORD)BaseAddress);
            AppleD5500UnmapPixelBuffer(*((mach_port_t **)this + 18), v12);
            CFRelease(*(CFTypeRef *)(*((_QWORD *)this + 15) + v13 + 24));
            if (AppleD5500MapPixelBuffer(*((mach_port_t **)this + 18), v12, ID))
            {
              v15 = *((_QWORD *)this + 15) + v13;
              goto LABEL_23;
            }
            CFRetain(IOSurface);
            v11 = *((_QWORD *)this + 15);
            v26 = v11 + v13;
            *(_QWORD *)(v26 + 24) = IOSurface;
            *(_QWORD *)(v26 + 8) = BaseAddress;
            *((int32x2_t *)this + 19) = vadd_s32(*(int32x2_t *)((char *)this + 152), (int32x2_t)0x100000001);
            v25 = a2;
          }
          goto LABEL_33;
        }
        if (!*(_DWORD *)(v11 + v13))
          v14 = v12;
        v13 += 64;
        ++v12;
      }
      while (v10 << 6 != v13);
      if (v14 >= v10)
      {
        v16 = 0;
        v12 = 0;
        v11 = *((_QWORD *)this + 15);
        v17 = (unsigned int *)(v11 + 40);
        v18 = -1;
        v19 = (unsigned int *)(v11 + 40);
        do
        {
          v21 = *v19;
          v19 += 16;
          v20 = v21;
          if (v21 < v18 && !*(v17 - 1))
          {
            v18 = v20;
            v12 = v16;
          }
          ++v16;
          v17 = v19;
        }
        while (v10 != v16);
        goto LABEL_20;
      }
      if (AppleD5500MapPixelBuffer(*((mach_port_t **)this + 18), v14, ID))
      {
        v15 = *((_QWORD *)this + 15) + ((uint64_t)v14 << 6);
        goto LABEL_23;
      }
      CFRetain(IOSurface);
      v11 = *((_QWORD *)this + 15);
      v28 = v11 + ((uint64_t)v14 << 6);
      *(_DWORD *)(v28 + 32) = ID;
      v25 = a2;
      *(_QWORD *)(v28 + 8) = BaseAddress;
      *(_QWORD *)(v28 + 16) = texture;
      *(_QWORD *)(v28 + 24) = IOSurface;
      *a2 = v14;
      ++*((_DWORD *)this + 38);
      goto LABEL_33;
    }
LABEL_20:
    if (!*(_DWORD *)(v11 + ((unint64_t)v12 << 6) + 36))
    {
      AppleD5500UnmapPixelBuffer(*((mach_port_t **)this + 18), v12);
      CFRelease(*(CFTypeRef *)(*((_QWORD *)this + 15) + ((unint64_t)v12 << 6) + 24));
      if (!AppleD5500MapPixelBuffer(*((mach_port_t **)this + 18), v12, ID))
      {
        CFRetain(IOSurface);
        v11 = *((_QWORD *)this + 15);
        v27 = v11 + ((unint64_t)v12 << 6);
        *(_DWORD *)(v27 + 32) = ID;
        v25 = a2;
        *(_QWORD *)(v27 + 8) = BaseAddress;
        *(_QWORD *)(v27 + 16) = texture;
        *(_QWORD *)(v27 + 24) = IOSurface;
        *a2 = v12;
        *((int32x2_t *)this + 19) = vadd_s32(*(int32x2_t *)((char *)this + 152), (int32x2_t)0x100000001);
LABEL_33:
        *(_DWORD *)(v11 + ((unint64_t)*v25 << 6) + 36) += 2;
        *(_DWORD *)(v11 + ((unint64_t)*v25 << 6)) = 1;
        *(_DWORD *)(v11 + ((unint64_t)*v25 << 6) + 40) = a3;
        v29 = mach_absolute_time();
        *((_QWORD *)this + 22) = v29;
        *(_QWORD *)(*((_QWORD *)this + 15) + ((unint64_t)*v25 << 6) + 48) = v29;
        pthread_mutex_unlock((pthread_mutex_t *)this);
        return 0;
      }
      v15 = *((_QWORD *)this + 15) + ((unint64_t)v12 << 6);
LABEL_23:
      *(_QWORD *)(v15 + 8) = 0;
      *(_QWORD *)(v15 + 16) = 0;
      v22 = v15 + 8;
      *(_DWORD *)(v22 + 24) = 0;
      *(_QWORD *)(v22 + 16) = 0;
    }
    pthread_cond_wait((pthread_cond_t *)((char *)this + 64), (pthread_mutex_t *)this);
  }
  if (texture)
    CVPixelBufferRelease(texture);
  pthread_mutex_unlock((pthread_mutex_t *)this);
  return 4294967293;
}

uint64_t BufferPool::releaseBuffer(pthread_mutex_t *this, unsigned int a2)
{
  uint64_t v4;
  uint64_t v5;
  int *v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (this[1].__opaque[40])
  {
    if (*(_DWORD *)this[2].__opaque > a2)
    {
      pthread_mutex_lock(this);
      v4 = *(_QWORD *)&this[1].__opaque[48];
      if (*(_DWORD *)(v4 + ((unint64_t)a2 << 6)) != 1)
      {
        v9 = 0xFFFFFFFFLL;
LABEL_13:
        pthread_cond_signal((pthread_cond_t *)&this[1]);
        pthread_mutex_unlock(this);
        return v9;
      }
      v5 = v4 + ((unint64_t)a2 << 6);
      v7 = *(_DWORD *)(v5 + 36);
      v6 = (int *)(v5 + 36);
      v8 = v7 - 1;
      if (v7 < 1)
      {
        syslog(3, "AppleD5500: BufferPool::releaseBuffer buffer ref_count already zero \n");
        v4 = *(_QWORD *)&this[1].__opaque[48];
        if (!*(_DWORD *)(v4 + ((unint64_t)a2 << 6) + 36))
        {
LABEL_11:
          if (!LOBYTE(this[3].__sig))
          {
            CVPixelBufferRelease(*(CVPixelBufferRef *)(v4 + ((unint64_t)a2 << 6) + 16));
            v11 = *(_QWORD *)&this[1].__opaque[48];
            v12 = v11 + ((unint64_t)a2 << 6);
            *(_DWORD *)v12 = 2;
            *(_QWORD *)(v12 + 16) = 0;
            v13 = *(unsigned int *)(v12 + 56);
            *(_DWORD *)(v12 + 56) = -1;
            if ((v13 & 0x80000000) == 0 && v13 < *(_DWORD *)this[2].__opaque)
            {
              CVPixelBufferRelease(*(CVPixelBufferRef *)(v11 + (v13 << 6) + 16));
              v9 = 0;
              v14 = *(_QWORD *)&this[1].__opaque[48] + (v13 << 6);
              *(_DWORD *)v14 = 2;
              *(_QWORD *)(v14 + 16) = 0;
              *(_DWORD *)(v14 + 36) = 0;
              *(_DWORD *)(v14 + 56) = -1;
              goto LABEL_13;
            }
          }
        }
      }
      else
      {
        *v6 = v8;
        if (!v8)
          goto LABEL_11;
      }
      v9 = 0;
      goto LABEL_13;
    }
    syslog(3, "AppleD5500: BufferPool::releaseBuffer error index %d \n", a2);
    return 0xFFFFFFFFLL;
  }
  else
  {
    syslog(3, "AppleD5500: %s called on uninitialized pool!\n", "releaseBuffer");
    return 4294967294;
  }
}

void BufferPool::~BufferPool(BufferPool *this)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t i;
  uint64_t v5;
  __CVBuffer *v6;
  uint64_t v7;

  pthread_mutex_lock((pthread_mutex_t *)this);
  v2 = *((unsigned int *)this + 34);
  if ((_DWORD)v2)
  {
    v3 = 0;
    for (i = 0; i < v2; ++i)
    {
      v5 = *((_QWORD *)this + 15);
      if (*(_QWORD *)(v5 + v3 + 24))
      {
        if (*(_DWORD *)(v5 + v3) == 1)
        {
          syslog(3, "AppleD5500: BufferPool::~BufferPool() buffer still in use %d\n", *((unsigned __int8 *)this + 192));
          v5 = *((_QWORD *)this + 15);
          v6 = *(__CVBuffer **)(v5 + v3 + 16);
          if (v6)
          {
            if (!*((_BYTE *)this + 192))
            {
              CVPixelBufferRelease(v6);
              v5 = *((_QWORD *)this + 15);
            }
          }
        }
        CFRelease(*(CFTypeRef *)(v5 + v3 + 24));
        v2 = *((unsigned int *)this + 34);
      }
      v3 += 64;
    }
  }
  v7 = *((_QWORD *)this + 15);
  if (v7)
  {
    MEMORY[0x219A2D460](v7, 0x10A0C80ED8CE792);
    *((_QWORD *)this + 15) = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)this);
  pthread_mutex_destroy((pthread_mutex_t *)this);
  pthread_cond_destroy((pthread_cond_t *)((char *)this + 64));
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void RingBuffer::RingBuffer(RingBuffer *this)
{
  pthread_mutex_init((pthread_mutex_t *)this, 0);
  pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0);
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  *(_QWORD *)((char *)this + 159) = 0;
}

uint64_t RingBuffer::initRingBuffer(pthread_mutex_t *this, uint64_t a2)
{
  uint64_t v4;

  pthread_mutex_lock(this);
  v4 = operator new[]();
  *(_QWORD *)&this[1].__opaque[40] = v4;
  *(_QWORD *)&this[1].__opaque[48] = v4 + a2;
  this[2].__sig = v4;
  *(_QWORD *)this[2].__opaque = v4;
  *(_QWORD *)&this[2].__opaque[16] = a2;
  *(_WORD *)&this[2].__opaque[28] = 1;
  this[2].__opaque[30] = 0;
  pthread_mutex_unlock(this);
  return 0;
}

uint64_t RingBuffer::initRingBuffer(pthread_mutex_t *this, char *a2, uint64_t a3)
{
  pthread_mutex_lock(this);
  *(_QWORD *)&this[1].__opaque[40] = a2;
  *(_QWORD *)&this[1].__opaque[48] = &a2[a3];
  this[2].__sig = (uint64_t)a2;
  *(_QWORD *)this[2].__opaque = a2;
  *(_QWORD *)&this[2].__opaque[16] = a3;
  *(_WORD *)&this[2].__opaque[28] = 0;
  this[2].__opaque[30] = 0;
  pthread_mutex_unlock(this);
  if (a2)
    return 0;
  else
    return 4294967293;
}

uint64_t RingBuffer::resetRingBuffer(pthread_mutex_t *this)
{
  uint64_t v2;

  pthread_mutex_lock(this);
  v2 = *(_QWORD *)&this[1].__opaque[40];
  this[2].__sig = v2;
  *(_QWORD *)this[2].__opaque = v2;
  pthread_mutex_unlock(this);
  if (v2)
    return 0;
  else
    return 4294967293;
}

uint64_t RingBuffer::initRingBuffer(pthread_mutex_t *this, char *a2, uint64_t a3, char a4)
{
  pthread_mutex_lock(this);
  *(_QWORD *)&this[1].__opaque[40] = a2;
  *(_QWORD *)&this[1].__opaque[48] = &a2[a3];
  this[2].__sig = (uint64_t)a2;
  *(_QWORD *)this[2].__opaque = a2;
  *(_QWORD *)&this[2].__opaque[16] = a3;
  *(_WORD *)&this[2].__opaque[28] = 0;
  this[2].__opaque[30] = a4;
  pthread_mutex_unlock(this);
  if (a2)
    return 0;
  else
    return 4294967293;
}

uint64_t RingBuffer::getRingBufferSize(pthread_mutex_t *this, unint64_t *a2)
{
  pthread_mutex_lock(this);
  *a2 = *(_QWORD *)&this[2].__opaque[16];
  pthread_mutex_unlock(this);
  return 0;
}

uint64_t RingBuffer::getRingBufferInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  __int128 v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  BOOL v11;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  pthread_mutex_lock((pthread_mutex_t *)a1);
  v4 = *(_QWORD *)(a1 + 112);
  v5 = *(_QWORD *)(a1 + 120);
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v5;
  v6 = *(_QWORD *)(a1 + 128);
  *(_QWORD *)(a2 + 16) = v6;
  v7 = *(_OWORD *)(a1 + 136);
  *(_OWORD *)(a2 + 24) = v7;
  v8 = *(_QWORD *)(a1 + 152);
  v9 = v5 - v7;
  v10 = ~(_QWORD)v7 + v5;
  v11 = v6 == v4;
  if (v6 == v4)
    v12 = 0;
  else
    v12 = v6 + ~v4;
  if (!v11)
    v10 = v9;
  if (v12 <= v10)
    v13 = v10;
  else
    v13 = v12;
  v14 = v10 + v12;
  v15 = ~(_QWORD)v7 + v6;
  if (v6 <= (unint64_t)v7)
    v15 = v13;
  else
    v14 = ~(_QWORD)v7 + v6;
  if (v6 == (_QWORD)v7)
  {
    v15 = v8 - 1;
    v14 = v8 - 1;
  }
  *(_QWORD *)(a2 + 40) = v8;
  *(_QWORD *)(a2 + 48) = v14;
  *(_QWORD *)(a2 + 56) = v15;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  return 0;
}

uint64_t RingBuffer::getRingBufferFullness(pthread_mutex_t *this, uint64_t *a2)
{
  unint64_t sig;
  unint64_t v5;
  uint64_t v6;

  pthread_mutex_lock(this);
  sig = this[2].__sig;
  v5 = *(_QWORD *)this[2].__opaque;
  if (sig == v5)
  {
    v6 = 0;
  }
  else
  {
    if (sig > v5)
    {
      v5 += *(_QWORD *)&this[2].__opaque[8];
      sig += *(_QWORD *)&this[1].__opaque[40];
    }
    v6 = v5 - sig;
  }
  *a2 = v6;
  pthread_mutex_unlock(this);
  return 0;
}

uint64_t RingBuffer::requestRingBuffer(RingBuffer *this, int64_t a2, unsigned __int8 **a3)
{
  unsigned int v6;
  int v7;
  unsigned int v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  int64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  timeval v21;
  timespec v22;

  pthread_mutex_lock((pthread_mutex_t *)this);
  *((_DWORD *)this + 40) = 0;
  if (*((unsigned __int8 *)this + 165) >= *((unsigned __int8 *)this + 166))
  {
    do
    {
      gettimeofday(&v21, 0);
      v22.tv_sec = v21.tv_sec + 2;
      v22.tv_nsec = 0;
      if (pthread_cond_timedwait((pthread_cond_t *)((char *)this + 64), (pthread_mutex_t *)this, &v22) == 60
        && !*((_DWORD *)this + 40))
      {
        syslog(5, "%s :sleep, %d %d\n", "RINGBUFFER", *((unsigned __int8 *)this + 165), *((unsigned __int8 *)this + 166));
        ++*((_DWORD *)this + 40);
      }
      v6 = *((unsigned __int8 *)this + 166);
    }
    while (*((unsigned __int8 *)this + 165) >= v6);
    v7 = *((_DWORD *)this + 40);
    if (v7)
      syslog(5, "%s :wakeup, slept %d, %d, %d\n", "RINGBUFFER", 2 * v7 + 2, *((unsigned __int8 *)this + 165), v6);
  }
  v8 = 0;
  *((_DWORD *)this + 40) = 0;
  while (1)
  {
    v10 = (unsigned __int8 *)*((_QWORD *)this + 16);
    v9 = (unsigned __int8 *)*((_QWORD *)this + 17);
    if (v10 == v9)
      break;
    if (v10 <= v9)
      goto LABEL_14;
    if ((uint64_t)&v10[~(unint64_t)v9] >= a2)
    {
      *a3 = v9;
      *((_QWORD *)this + 17) += a2;
      goto LABEL_31;
    }
LABEL_22:
    *a3 = 0;
    if (v8 >= 9)
    {
      v15 = 4294967168;
      goto LABEL_32;
    }
    pthread_cond_wait((pthread_cond_t *)((char *)this + 64), (pthread_mutex_t *)this);
    ++v8;
  }
  v10 = (unsigned __int8 *)*((_QWORD *)this + 14);
  *((_QWORD *)this + 16) = v10;
  *((_QWORD *)this + 17) = v10;
  v9 = v10;
LABEL_14:
  v11 = (unsigned __int8 *)*((_QWORD *)this + 14);
  if (v10 == v11)
  {
    v12 = 0;
    v13 = *((_QWORD *)this + 15) + ~(unint64_t)v9;
  }
  else
  {
    v12 = &v10[~(unint64_t)v11];
    v13 = *((_QWORD *)this + 15) - (_QWORD)v9;
  }
  if ((uint64_t)v12 < a2 && v13 < a2)
    goto LABEL_22;
  if (v13 >= a2)
  {
    *a3 = v9;
    v18 = *((_QWORD *)this + 17) + a2;
    *((_QWORD *)this + 17) = v18;
    if (v18 == *((_QWORD *)this + 15))
    {
      v19 = *((_QWORD *)this + 14);
      *((_QWORD *)this + 17) = v19;
      *((_QWORD *)this + 18) = v18;
      if (*((_QWORD *)this + 16) == v18)
        *((_QWORD *)this + 16) = v19;
    }
  }
  else
  {
    *((_QWORD *)this + 17) = v11;
    *((_QWORD *)this + 18) = v9;
    *a3 = v11;
    v16 = *((_QWORD *)this + 16);
    *((_QWORD *)this + 17) += a2;
    if (v16 == *((_QWORD *)this + 18))
    {
      v17 = *((_QWORD *)this + 15);
      *((_QWORD *)this + 16) = *((_QWORD *)this + 14);
      *((_QWORD *)this + 18) = v17;
    }
  }
LABEL_31:
  v15 = 0;
  ++*((_BYTE *)this + 165);
LABEL_32:
  pthread_mutex_unlock((pthread_mutex_t *)this);
  return v15;
}

uint64_t RingBuffer::releaseRingBuffer(RingBuffer *this, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v6;
  uint64_t v7;

  pthread_mutex_lock((pthread_mutex_t *)this);
  if (*((_QWORD *)this + 14) > (unint64_t)a3)
  {
    syslog(3, "AppleD5500: releaseRingBuffer (p_buffer < p_base) : m_num_buffers_outstanding %d\n");
LABEL_5:
    v6 = 4294966272;
    goto LABEL_14;
  }
  if ((unint64_t)&a3[a2] > *((_QWORD *)this + 15))
  {
    syslog(3, "AppleD5500: releaseRingBuffer (p_buffer + size > p_end) : m_num_buffers_outstanding %d\n");
    goto LABEL_5;
  }
  if (*((unsigned __int8 **)this + 16) != a3)
  {
    syslog(3, "AppleD5500: releaseRingBuffer: WARNING: (p_buffer != p_rd) : m_num_buffers_outstanding %d\n", *((unsigned __int8 *)this + 165));
    a3 = (unsigned __int8 *)*((_QWORD *)this + 16);
  }
  *((_QWORD *)this + 16) = &a3[a2];
  if (&a3[a2] == *((unsigned __int8 **)this + 18))
  {
    v7 = *((_QWORD *)this + 15);
    *((_QWORD *)this + 16) = *((_QWORD *)this + 14);
    *((_QWORD *)this + 18) = v7;
  }
  if (*((_BYTE *)this + 165))
    --*((_BYTE *)this + 165);
  else
    syslog(5, "%s :%s(): m_num_buffers_outstanding:%d == 0\n\n", "RINGBUFFER", "releaseRingBuffer", 0);
  pthread_cond_signal((pthread_cond_t *)((char *)this + 64));
  v6 = 0;
LABEL_14:
  pthread_mutex_unlock((pthread_mutex_t *)this);
  return v6;
}

uint64_t RingBuffer::releaseNewestRingBuffer(pthread_mutex_t *this, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v6;

  pthread_mutex_lock(this);
  if (*(_QWORD *)&this[1].__opaque[40] > (unint64_t)a3)
  {
    syslog(3, "AppleD5500: %s(): ERROR: (p_buffer < p_base) : m_num_buffers_outstanding %d\n");
LABEL_5:
    v6 = 4294966272;
    goto LABEL_6;
  }
  if ((unint64_t)&a3[a2] > *(_QWORD *)&this[1].__opaque[48])
  {
    syslog(3, "AppleD5500: %s(): ERROR: (p_buffer + size > p_end) : m_num_buffers_outstanding %d\n");
    goto LABEL_5;
  }
  *(_QWORD *)this[2].__opaque = a3;
  if (this[2].__opaque[29])
  {
    v6 = 0;
    --this[2].__opaque[29];
  }
  else
  {
    syslog(3, "AppleD5500: %s(): ERROR: m_num_buffers_outstanding:%d == 0\n", "releaseNewestRingBuffer", 0);
    v6 = 0;
  }
LABEL_6:
  pthread_mutex_unlock(this);
  return v6;
}

uint64_t RingBuffer::getBuffersOutstanding(pthread_mutex_t *this, unsigned __int8 *a2)
{
  pthread_mutex_lock(this);
  *a2 = this[2].__opaque[29];
  pthread_mutex_unlock(this);
  return 0;
}

void RingBuffer::~RingBuffer(RingBuffer *this)
{
  pthread_mutex_destroy((pthread_mutex_t *)this);
  pthread_cond_destroy((pthread_cond_t *)((char *)this + 64));
  if (*((_QWORD *)this + 14))
  {
    if (*((_BYTE *)this + 164))
      MEMORY[0x219A2D460]();
    *((_QWORD *)this + 14) = 0;
  }
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
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

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEE8](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBBFB0](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x24BDBBFB8](allocator, *(_QWORD *)&portNum, callout, context, shouldFreeInfo);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
  MEMORY[0x24BDBBFD0](port);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateFromXMLData(CFAllocatorRef allocator, CFDataRef xmlData, CFOptionFlags mutabilityOption, CFStringRef *errorString)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1D8](allocator, xmlData, mutabilityOption, errorString);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

void CFRunLoopRun(void)
{
  MEMORY[0x24BDBC358]();
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC388](rl);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x24BDBC4C0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x24BDBC650](str);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x24BDC0080]();
}

OSStatus CMBlockBufferCopyDataBytes(CMBlockBufferRef theSourceBuffer, size_t offsetToData, size_t dataLength, void *destination)
{
  return MEMORY[0x24BDC00B0](theSourceBuffer, offsetToData, dataLength, destination);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x24BDC00D0](theBuffer);
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x24BDC0180]();
}

CFPropertyListRef CMFormatDescriptionGetExtension(CMFormatDescriptionRef desc, CFStringRef extensionKey)
{
  return (CFPropertyListRef)MEMORY[0x24BDC01A8](desc, extensionKey);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x24BDC01C0](desc);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x24BDC02B8](sbuf);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x24BDC0668](videoDesc);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
  MEMORY[0x24BDC5180](buffer, key, value, *(_QWORD *)&attachmentMode);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x24BDC5288](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC5298](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x24BDC52C0](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D0](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x24BDC5308](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5320](allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x24BDC5398](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x24BDC53B0](pixelBuffer, unlockFlags);
}

uint64_t FigFormatDescriptionRelease()
{
  return MEMORY[0x24BDC08A0]();
}

uint64_t FigFormatDescriptionRetain()
{
  return MEMORY[0x24BDC08A8]();
}

uint64_t FigSignalErrorAt3()
{
  return MEMORY[0x24BDC09E8]();
}

kern_return_t IOConnectCallAsyncMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EE0](*(_QWORD *)&connection, *(_QWORD *)&selector, *(_QWORD *)&wake_port, reference, *(_QWORD *)&referenceCnt, input, *(_QWORD *)&inputCnt, inputStruct);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOCreateReceivePort(uint32_t msgType, mach_port_t *recvPort)
{
  return MEMORY[0x24BDD7F98](*(_QWORD *)&msgType, recvPort);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x24BDD8688](*(_QWORD *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD8928](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x24BDD8B50](properties);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8B78](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x24BDD8B80](buffer);
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return (void *)MEMORY[0x24BDD8BA8](buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x24BDD8BE0](buffer, planeIndex);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C48](buffer);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C68](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8CD0](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8D08](buffer, *(_QWORD *)&options, seed);
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
  MEMORY[0x24BDD8DB8](buffer, key, value);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8DD0](buffer, *(_QWORD *)&options, seed);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t VTDecoderSessionEmitDecodedFrame()
{
  return MEMORY[0x24BDF9028]();
}

uint64_t VTDecoderSessionGetPixelBufferPool()
{
  return MEMORY[0x24BDF9040]();
}

uint64_t VTDecoderSessionSetPixelBufferAttributes()
{
  return MEMORY[0x24BDF9048]();
}

uint64_t VTRegisterVideoDecoderWithInfo()
{
  return MEMORY[0x24BDF9188]();
}

uint64_t VTVideoDecoderGetCMBaseObject()
{
  return MEMORY[0x24BDF91D8]();
}

uint64_t VTVideoDecoderGetClassID()
{
  return MEMORY[0x24BDF91E0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_24DA9C9C8();
}

uint64_t operator delete()
{
  return off_24DA9C9D0();
}

uint64_t operator new[]()
{
  return off_24DA9C9D8();
}

uint64_t operator new()
{
  return off_24DA9C9E0();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

float expf(float a1)
{
  float result;

  MEMORY[0x24BDAE288](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
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

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x24BDAEBF8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

void os_release(void *object)
{
  MEMORY[0x24BDAF3F0](object);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF778](a1);
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  return MEMORY[0x24BDAF780](a1, a2);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF790](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x24BDAF7A0](a1, *(_QWORD *)&a2);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return MEMORY[0x24BDAF7B0](a1, a2);
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x24BDAF7B8](a1, *(_QWORD *)&a2);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7D0](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x24BDAF7D8](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7E0](a1);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x24BDAF7F0](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x24BDAF800](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return MEMORY[0x24BDAF828](a1, a2);
}

void pthread_exit(void *a1)
{
  MEMORY[0x24BDAF830](a1);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x24BDAF880](a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x24BDAF8A8](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x24BDAF978]();
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x24BDAF998](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

int setpriority(int a1, id_t a2, int a3)
{
  return MEMORY[0x24BDAFD48](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

float sinf(float a1)
{
  float result;

  MEMORY[0x24BDAFE20](a1);
  return result;
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x24BDB0220](*(_QWORD *)&thread, *(_QWORD *)&flavor, policy_info, *(_QWORD *)&policy_infoCnt);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

uint64_t voucher_adopt()
{
  return MEMORY[0x24BDB0400]();
}

