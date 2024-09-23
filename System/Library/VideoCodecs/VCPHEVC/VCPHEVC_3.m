uint64_t sub_1C9815880(int a1, int a2, uint64_t a3, uint64_t a4)
{
  int16x8_t v4;
  int16x8_t v5;
  int16x8_t v6;
  int16x8_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  unsigned int v16;
  int16x8_t v17;
  int16x8_t v18;
  int16x8_t v19;
  int16x8_t v20;
  int32x4_t v21;
  int v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  uint64_t v27;
  uint64_t v28;
  int16x8_t v29;
  int16x8_t v30;
  int16x8_t v31;
  int16x8_t v32;
  int32x4_t v33;
  int32x4_t v34;
  int32x4_t v35;
  int32x4_t v36;
  int32x4_t v37;
  int32x4_t v38;
  int32x4_t v39;
  int32x4_t v40;
  uint64_t v41;
  unsigned int v42;
  int16x8_t v43;
  int16x8_t v44;
  int16x8_t v45;
  int16x8_t v46;
  BOOL v47;

  if (a1 == 4)
  {
    v22 = a2 + 4;
    v23 = 0uLL;
    v24 = 0uLL;
    v25 = 0uLL;
    v26 = 0uLL;
    do
    {
      v23 = vmlal_s16(v23, *(int16x4_t *)a3, *(int16x4_t *)a3);
      v24 = vmlal_s16(v24, *(int16x4_t *)(a3 + 2 * a4), *(int16x4_t *)(a3 + 2 * a4));
      v25 = vmlal_s16(v25, *(int16x4_t *)(a3 + 4 * a4), *(int16x4_t *)(a3 + 4 * a4));
      v26 = vmlal_s16(v26, *(int16x4_t *)(a3 + 6 * a4), *(int16x4_t *)(a3 + 6 * a4));
      a3 += 8 * a4;
      v22 -= 4;
    }
    while (v22 > 4);
    v21 = vaddq_s32(vaddq_s32(v24, v23), vaddq_s32(v25, v26));
  }
  else if (a1 == 8)
  {
    v4 = *(int16x8_t *)a3;
    v5 = *(int16x8_t *)(a3 + 2 * a4);
    v6 = *(int16x8_t *)(a3 + 4 * a4);
    v7 = *(int16x8_t *)(a3 + 6 * a4);
    v8 = vmull_s16(*(int16x4_t *)v4.i8, *(int16x4_t *)v4.i8);
    v9 = vmull_s16(*(int16x4_t *)v5.i8, *(int16x4_t *)v5.i8);
    v10 = vmull_s16(*(int16x4_t *)v6.i8, *(int16x4_t *)v6.i8);
    v11 = vmull_s16(*(int16x4_t *)v7.i8, *(int16x4_t *)v7.i8);
    v12 = vmull_high_s16(v4, v4);
    v13 = vmull_high_s16(v5, v5);
    v14 = vmull_high_s16(v6, v6);
    v15 = vmull_high_s16(v7, v7);
    if (a2 >= 5)
    {
      v16 = a2 + 4;
      do
      {
        v17 = *(int16x8_t *)(a3 + 10 * a4);
        v18 = *(int16x8_t *)(a3 + 12 * a4);
        v19 = *(int16x8_t *)(a3 + 14 * a4);
        a3 += 8 * a4;
        v20 = *(int16x8_t *)a3;
        v8 = vmlal_s16(v8, *(int16x4_t *)v20.i8, *(int16x4_t *)v20.i8);
        v9 = vmlal_s16(v9, *(int16x4_t *)v17.i8, *(int16x4_t *)v17.i8);
        v10 = vmlal_s16(v10, *(int16x4_t *)v18.i8, *(int16x4_t *)v18.i8);
        v11 = vmlal_s16(v11, *(int16x4_t *)v19.i8, *(int16x4_t *)v19.i8);
        v12 = vmlal_high_s16(v12, v20, v20);
        v13 = vmlal_high_s16(v13, v17, v17);
        v14 = vmlal_high_s16(v14, v18, v18);
        v15 = vmlal_high_s16(v15, v19, v19);
        v16 -= 4;
      }
      while (v16 > 8);
    }
    v21 = vaddq_s32(vaddq_s32(vaddq_s32(vaddq_s32(v9, v11), vaddq_s32(v8, v10)), vaddq_s32(vaddq_s32(v12, v13), v14)), v15);
  }
  else
  {
    v27 = a3 + 4 * a4 + 16;
    v28 = a3 + 6 * a4 + 16;
    v21 = 0uLL;
    do
    {
      v29 = *(int16x8_t *)(a3 + 16);
      v30 = *(int16x8_t *)(a3 + 2 * a4);
      v31 = *(int16x8_t *)a3;
      v32 = *(int16x8_t *)(a3 + 16 + 2 * a4);
      v33 = vmull_s16(*(int16x4_t *)v31.i8, *(int16x4_t *)v31.i8);
      v34 = vmull_s16(*(int16x4_t *)v29.i8, *(int16x4_t *)v29.i8);
      v35 = vmull_s16(*(int16x4_t *)v30.i8, *(int16x4_t *)v30.i8);
      v36 = vmull_s16(*(int16x4_t *)v32.i8, *(int16x4_t *)v32.i8);
      v37 = vmull_high_s16(v31, v31);
      v38 = vmull_high_s16(v29, v29);
      v39 = vmull_high_s16(v30, v30);
      v40 = vmull_high_s16(v32, v32);
      if (a2 >= 3)
      {
        v41 = 0;
        v42 = a2 + 2;
        do
        {
          v43 = *(int16x8_t *)(v27 + v41 - 16);
          v44 = *(int16x8_t *)(v27 + v41);
          v45 = *(int16x8_t *)(v28 + v41 - 16);
          v46 = *(int16x8_t *)(v28 + v41);
          v33 = vmlal_s16(v33, *(int16x4_t *)v43.i8, *(int16x4_t *)v43.i8);
          v34 = vmlal_s16(v34, *(int16x4_t *)v44.i8, *(int16x4_t *)v44.i8);
          v35 = vmlal_s16(v35, *(int16x4_t *)v45.i8, *(int16x4_t *)v45.i8);
          v36 = vmlal_s16(v36, *(int16x4_t *)v46.i8, *(int16x4_t *)v46.i8);
          v37 = vmlal_high_s16(v37, v43, v43);
          v38 = vmlal_high_s16(v38, v44, v44);
          v39 = vmlal_high_s16(v39, v45, v45);
          v40 = vmlal_high_s16(v40, v46, v46);
          v42 -= 2;
          v41 += 4 * a4;
        }
        while (v42 > 4);
      }
      v21 = vaddq_s32(vaddq_s32(vaddq_s32(v33, v35), vaddq_s32(vaddq_s32(v21, v34), v36)), vaddq_s32(vaddq_s32(vaddq_s32(v37, v38), v39), v40));
      a3 += 32;
      v27 += 32;
      v28 += 32;
      v47 = __OFSUB__(a1, 16);
      a1 -= 16;
    }
    while (!((a1 < 0) ^ v47 | (a1 == 0)));
  }
  return vaddvq_s32(v21);
}

uint64_t sub_1C9815AA8(uint64_t a1, int a2, int16x4_t *a3, uint64_t a4, int16x4_t *a5, uint64_t a6)
{
  int v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int16x4_t v11;
  int16x4_t v12;
  int16x4_t v13;
  int16x4_t v14;

  v6 = a2 + 4;
  v7 = 0uLL;
  v8 = 0uLL;
  v9 = 0uLL;
  v10 = 0uLL;
  do
  {
    v11 = vsub_s16(*a3, *a5);
    v12 = vsub_s16(*(int16x4_t *)((char *)a3 + 4 * a4), *(int16x4_t *)((char *)a5 + 4 * a6));
    v13 = vsub_s16(*(int16x4_t *)((char *)a3 + 2 * a4), *(int16x4_t *)((char *)a5 + 2 * a6));
    v14 = vsub_s16(*(int16x4_t *)((char *)a3 + 6 * a4), *(int16x4_t *)((char *)a5 + 6 * a6));
    v7 = vmlal_s16(v7, v11, v11);
    v8 = vmlal_s16(v8, v13, v13);
    v9 = vmlal_s16(v9, v12, v12);
    v10 = vmlal_s16(v10, v14, v14);
    a5 += a6;
    a3 += a4;
    v6 -= 4;
  }
  while (v6 > 4);
  return vaddvq_s32(vaddq_s32(vaddq_s32(v8, v7), vaddq_s32(v9, v10)));
}

uint64_t sub_1C9815B50(uint64_t a1, int a2, int16x8_t *a3, uint64_t a4, int16x8_t *a5, uint64_t a6)
{
  int16x8_t v6;
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  unsigned int v18;
  int16x8_t v19;
  int16x8_t v20;
  int16x8_t v21;
  int16x8_t v22;
  int16x8_t v23;
  int16x8_t v24;
  int16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  int16x8_t v28;

  v6 = vsubq_s16(*a3, *a5);
  v7 = vsubq_s16(*(int16x8_t *)((char *)a3 + 2 * a4), *(int16x8_t *)((char *)a5 + 2 * a6));
  v8 = vsubq_s16(*(int16x8_t *)((char *)a3 + 4 * a4), *(int16x8_t *)((char *)a5 + 4 * a6));
  v9 = vsubq_s16(*(int16x8_t *)((char *)a3 + 6 * a4), *(int16x8_t *)((char *)a5 + 6 * a6));
  v10 = vmull_s16(*(int16x4_t *)v6.i8, *(int16x4_t *)v6.i8);
  v11 = vmull_s16(*(int16x4_t *)v7.i8, *(int16x4_t *)v7.i8);
  v12 = vmull_s16(*(int16x4_t *)v8.i8, *(int16x4_t *)v8.i8);
  v13 = vmull_s16(*(int16x4_t *)v9.i8, *(int16x4_t *)v9.i8);
  v14 = vmull_high_s16(v6, v6);
  v15 = vmull_high_s16(v7, v7);
  v16 = vmull_high_s16(v8, v8);
  v17 = vmull_high_s16(v9, v9);
  if (a2 >= 5)
  {
    v18 = a2 + 4;
    do
    {
      v19 = *(int16x8_t *)((char *)a3 + 10 * a4);
      v20 = *(int16x8_t *)((char *)a3 + 12 * a4);
      v21 = *(int16x8_t *)((char *)a3 + 14 * a4);
      v22 = *(int16x8_t *)((char *)a5 + 10 * a6);
      a3 = (int16x8_t *)((char *)a3 + 8 * a4);
      v23 = *(int16x8_t *)((char *)a5 + 12 * a6);
      v24 = *(int16x8_t *)((char *)a5 + 14 * a6);
      a5 = (int16x8_t *)((char *)a5 + 8 * a6);
      v25 = vsubq_s16(*a3, *a5);
      v26 = vsubq_s16(v19, v22);
      v27 = vsubq_s16(v20, v23);
      v28 = vsubq_s16(v21, v24);
      v10 = vmlal_s16(v10, *(int16x4_t *)v25.i8, *(int16x4_t *)v25.i8);
      v11 = vmlal_s16(v11, *(int16x4_t *)v26.i8, *(int16x4_t *)v26.i8);
      v12 = vmlal_s16(v12, *(int16x4_t *)v27.i8, *(int16x4_t *)v27.i8);
      v13 = vmlal_s16(v13, *(int16x4_t *)v28.i8, *(int16x4_t *)v28.i8);
      v14 = vmlal_high_s16(v14, v25, v25);
      v15 = vmlal_high_s16(v15, v26, v26);
      v16 = vmlal_high_s16(v16, v27, v27);
      v17 = vmlal_high_s16(v17, v28, v28);
      v18 -= 4;
    }
    while (v18 > 8);
  }
  return vaddvq_s32(vaddq_s32(vaddq_s32(vaddq_s32(vaddq_s32(vaddq_s32(v11, v14), v15), v16), v17), vaddq_s32(vaddq_s32(v10, v12), v13)));
}

uint64_t sub_1C9815C8C(int a1, int a2, int16x8_t *a3, uint64_t a4, int16x8_t *a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int8 *v10;
  __int8 *v11;
  int32x4_t v12;
  uint64_t v13;
  uint64_t v14;
  int16x8_t v15;
  int16x8_t v16;
  int16x8_t v17;
  int16x8_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  int16x8_t v30;
  int16x8_t v31;
  int16x8_t v32;
  int16x8_t v33;
  BOOL v34;

  v6 = 4 * a6;
  v7 = (uint64_t)a5[1].i64 + 4 * a6;
  v8 = (uint64_t)a3[1].i64 + 6 * a4;
  v9 = 4 * a4;
  v10 = &a5->i8[6 * a6];
  v11 = &a3->i8[4 * a4];
  v12 = 0uLL;
  v13 = 2 * a4;
  v14 = 2 * a6;
  do
  {
    v15 = vsubq_s16(*a3, *a5);
    v16 = vsubq_s16(a3[1], a5[1]);
    v17 = vsubq_s16(*(int16x8_t *)((char *)a3 + v13), *(int16x8_t *)((char *)a5 + v14));
    v18 = vsubq_s16(*(int16x8_t *)((char *)a3 + v13 + 16), *(int16x8_t *)((char *)a5 + v14 + 16));
    v19 = vmull_s16(*(int16x4_t *)v15.i8, *(int16x4_t *)v15.i8);
    v20 = vmull_s16(*(int16x4_t *)v16.i8, *(int16x4_t *)v16.i8);
    v21 = vmull_s16(*(int16x4_t *)v17.i8, *(int16x4_t *)v17.i8);
    v22 = vmull_s16(*(int16x4_t *)v18.i8, *(int16x4_t *)v18.i8);
    v23 = vmull_high_s16(v15, v15);
    v24 = vmull_high_s16(v16, v16);
    v25 = vmull_high_s16(v17, v17);
    v26 = vmull_high_s16(v18, v18);
    if (a2 >= 3)
    {
      v27 = 0;
      v28 = 0;
      v29 = a2 + 2;
      do
      {
        v30 = vsubq_s16(*(int16x8_t *)&v11[v27], *(int16x8_t *)(v7 + v28 - 16));
        v31 = vsubq_s16(*(int16x8_t *)&v11[v27 + 16], *(int16x8_t *)(v7 + v28));
        v32 = vsubq_s16(*(int16x8_t *)(v8 + v27 - 16), *(int16x8_t *)&v10[v28]);
        v33 = vsubq_s16(*(int16x8_t *)(v8 + v27), *(int16x8_t *)&v10[v28 + 16]);
        v19 = vmlal_s16(v19, *(int16x4_t *)v30.i8, *(int16x4_t *)v30.i8);
        v20 = vmlal_s16(v20, *(int16x4_t *)v31.i8, *(int16x4_t *)v31.i8);
        v21 = vmlal_s16(v21, *(int16x4_t *)v32.i8, *(int16x4_t *)v32.i8);
        v22 = vmlal_s16(v22, *(int16x4_t *)v33.i8, *(int16x4_t *)v33.i8);
        v23 = vmlal_high_s16(v23, v30, v30);
        v24 = vmlal_high_s16(v24, v31, v31);
        v25 = vmlal_high_s16(v25, v32, v32);
        v26 = vmlal_high_s16(v26, v33, v33);
        v29 -= 2;
        v28 += v6;
        v27 += v9;
      }
      while (v29 > 4);
    }
    a3 += 2;
    a5 += 2;
    v7 += 32;
    v12 = vaddq_s32(vaddq_s32(vaddq_s32(v19, v21), vaddq_s32(vaddq_s32(v12, v20), v22)), vaddq_s32(vaddq_s32(vaddq_s32(v23, v24), v25), v26));
    v8 += 32;
    v10 += 32;
    v11 += 32;
    v34 = __OFSUB__(a1, 16);
    a1 -= 16;
  }
  while (!((a1 < 0) ^ v34 | (a1 == 0)));
  return vaddvq_s32(v12);
}

uint8x8_t *sub_1C9815DDC(uint8x8_t *result, uint64_t a2, uint8x8_t *a3, uint64_t a4, int a5, int16x8_t *a6, unsigned int a7, uint32x4_t *a8)
{
  int v8;
  uint8x16_t v9;
  uint8x16_t *v10;
  uint8x16_t v11;
  uint8x8_t *v12;
  uint8x16_t v13;
  uint8x16_t *v14;
  uint8x16_t v15;
  uint8x8_t *v16;
  int16x8_t v17;
  int16x8_t v18;
  int16x8_t v19;
  int16x8_t v20;
  int16x8_t v21;
  int16x8_t v22;
  int16x8_t v23;
  int16x8_t v24;
  int16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  int16x8_t v28;
  int16x8_t v29;
  int16x8_t v30;
  int16x8_t v31;
  int16x8_t v32;
  int16x8_t v33;
  int16x8_t v34;
  int16x8_t v35;
  int16x8_t v36;
  int16x8_t v37;
  int16x8_t v38;
  int16x8_t v39;
  int16x8_t v40;
  int16x8_t v41;
  int16x8_t v42;
  int16x8_t v43;
  int16x8_t v44;
  int16x8_t v45;
  int16x8_t v46;
  int16x8_t v47;
  int16x8_t v48;
  int32x4_t v49;
  int32x4_t v50;
  int32x4_t v51;
  int32x4_t v52;
  int32x4_t v53;
  int32x4_t v54;
  int32x4_t v55;
  int32x4_t v56;
  int16x8_t v57;
  int16x8_t v58;
  int16x8_t v59;
  int16x8_t v60;
  int16x8_t v61;
  int16x8_t v62;
  int16x8_t v63;
  int16x8_t v64;
  int16x8_t v65;
  int16x8_t v66;
  int16x8_t v67;
  int16x8_t v68;
  int16x8_t v69;
  int16x8_t v70;
  int16x8_t v71;
  int16x8_t v72;

  v8 = a5 + 4;
  do
  {
    v9 = *(uint8x16_t *)&result->i8[a2];
    v10 = (uint8x16_t *)((char *)result + a2 + a2);
    v11 = *v10;
    v12 = (uint8x8_t *)&v10->i8[a2];
    v13 = *(uint8x16_t *)&a3->i8[a4];
    v14 = (uint8x16_t *)((char *)a3 + a4 + a4);
    v15 = *v14;
    v16 = (uint8x8_t *)&v14->i8[a4];
    v17 = (int16x8_t)vsubl_u8(*result, *a3);
    v18 = (int16x8_t)vsubl_high_u8(*(uint8x16_t *)result->i8, *(uint8x16_t *)a3->i8);
    v19 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v9.i8, *(uint8x8_t *)v13.i8);
    v20 = (int16x8_t)vsubl_high_u8(v9, v13);
    v21 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v11.i8, *(uint8x8_t *)v15.i8);
    v22 = (int16x8_t)vsubl_high_u8(v11, v15);
    v23 = (int16x8_t)vsubl_u8(*v12, *v16);
    v24 = (int16x8_t)vsubl_high_u8(*(uint8x16_t *)v12->i8, *(uint8x16_t *)v16->i8);
    v25 = vaddq_s16(v19, v17);
    v26 = vaddq_s16(v20, v18);
    v27 = vsubq_s16(v17, v19);
    v28 = vsubq_s16(v18, v20);
    v29 = vaddq_s16(v23, v21);
    v30 = vaddq_s16(v24, v22);
    v31 = vsubq_s16(v21, v23);
    v32 = vsubq_s16(v22, v24);
    v33 = vtrn1q_s16(v25, v27);
    v34 = vtrn2q_s16(v25, v27);
    v35 = vtrn1q_s16(v26, v28);
    v36 = vtrn2q_s16(v26, v28);
    v37 = vtrn1q_s16(v29, v31);
    v38 = vtrn2q_s16(v29, v31);
    v39 = vtrn1q_s16(v30, v32);
    v40 = vtrn2q_s16(v30, v32);
    v41 = vaddq_s16(v34, v33);
    v42 = vaddq_s16(v36, v35);
    v43 = vsubq_s16(v33, v34);
    v44 = vsubq_s16(v35, v36);
    v45 = vaddq_s16(v38, v37);
    v46 = vaddq_s16(v40, v39);
    v47 = vsubq_s16(v37, v38);
    v48 = vsubq_s16(v39, v40);
    v49 = (int32x4_t)vaddq_s16(v45, v41);
    v50 = (int32x4_t)vaddq_s16(v46, v42);
    v51 = (int32x4_t)vsubq_s16(v41, v45);
    v52 = (int32x4_t)vsubq_s16(v42, v46);
    v53 = (int32x4_t)vaddq_s16(v47, v43);
    v54 = (int32x4_t)vaddq_s16(v48, v44);
    v55 = (int32x4_t)vsubq_s16(v43, v47);
    v56 = (int32x4_t)vsubq_s16(v44, v48);
    v57 = (int16x8_t)vtrn1q_s32(v49, v51);
    v58 = (int16x8_t)vtrn2q_s32(v49, v51);
    v59 = (int16x8_t)vtrn1q_s32(v50, v52);
    v60 = (int16x8_t)vtrn2q_s32(v50, v52);
    v61 = (int16x8_t)vtrn1q_s32(v53, v55);
    v62 = (int16x8_t)vtrn2q_s32(v53, v55);
    v63 = (int16x8_t)vtrn1q_s32(v54, v56);
    v64 = (int16x8_t)vtrn2q_s32(v54, v56);
    v65 = vaddq_s16(v58, v57);
    v66 = vaddq_s16(v60, v59);
    v67 = vsubq_s16(v57, v58);
    v68 = vsubq_s16(v59, v60);
    v69 = vaddq_s16(v62, v61);
    v70 = vaddq_s16(v64, v63);
    v71 = vsubq_s16(v61, v62);
    v72 = vsubq_s16(v63, v64);
    *a8 = vshrq_n_u32(vpaddlq_u16((uint16x8_t)vpaddq_s16(vaddq_s16(vaddq_s16(vabsq_s16(v69), vabsq_s16(v65)), vaddq_s16(vabsq_s16(v67), vabsq_s16(v71))), vaddq_s16(vaddq_s16(vabsq_s16(v70), vabsq_s16(v66)), vaddq_s16(vabsq_s16(v68), vabsq_s16(v72))))), 1uLL);
    *a6 = v65;
    a6[1] = v66;
    a6[2] = v69;
    a6[3] = v70;
    a6[4] = v67;
    a6[5] = v68;
    v8 -= 4;
    a8 = (uint32x4_t *)((char *)a8 + 4 * a7);
    a6[6] = v71;
    a6[7] = v72;
    result = (uint8x8_t *)((char *)v12 + a2);
    a3 = (uint8x8_t *)((char *)v16 + a4);
    a6 += 8;
  }
  while (v8 > 4);
  return result;
}

uint8x8_t *sub_1C9815F74(uint8x8_t *result, uint64_t a2, uint8x8_t *a3, uint64_t a4, int a5, int16x8_t *a6)
{
  int v6;
  uint8x16_t v7;
  uint8x16_t *v8;
  uint8x16_t v9;
  uint8x8_t *v10;
  uint8x16_t v11;
  uint8x16_t *v12;
  uint8x16_t v13;
  uint8x8_t *v14;
  int16x8_t v15;
  int16x8_t v16;
  int16x8_t v17;
  int16x8_t v18;
  int16x8_t v19;
  int16x8_t v20;
  int16x8_t v21;
  int16x8_t v22;
  int16x8_t v23;
  int16x8_t v24;
  int16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  int16x8_t v28;
  int16x8_t v29;
  int16x8_t v30;
  int16x8_t v31;
  int16x8_t v32;
  int16x8_t v33;
  int16x8_t v34;
  int16x8_t v35;
  int16x8_t v36;
  int16x8_t v37;
  int16x8_t v38;
  int16x8_t v39;
  int16x8_t v40;
  int16x8_t v41;
  int16x8_t v42;
  int16x8_t v43;
  int16x8_t v44;
  int16x8_t v45;
  int16x8_t v46;
  int32x4_t v47;
  int32x4_t v48;
  int32x4_t v49;
  int32x4_t v50;
  int32x4_t v51;
  int32x4_t v52;
  int32x4_t v53;
  int32x4_t v54;
  int16x8_t v55;
  int16x8_t v56;
  int16x8_t v57;
  int16x8_t v58;
  int16x8_t v59;
  int16x8_t v60;
  int16x8_t v61;
  int16x8_t v62;

  v6 = a5 + 4;
  do
  {
    v7 = *(uint8x16_t *)&result->i8[a2];
    v8 = (uint8x16_t *)((char *)result + a2 + a2);
    v9 = *v8;
    v10 = (uint8x8_t *)&v8->i8[a2];
    v11 = *(uint8x16_t *)&a3->i8[a4];
    v12 = (uint8x16_t *)((char *)a3 + a4 + a4);
    v13 = *v12;
    v14 = (uint8x8_t *)&v12->i8[a4];
    v15 = (int16x8_t)vsubl_u8(*result, *a3);
    v16 = (int16x8_t)vsubl_high_u8(*(uint8x16_t *)result->i8, *(uint8x16_t *)a3->i8);
    v17 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v7.i8, *(uint8x8_t *)v11.i8);
    v18 = (int16x8_t)vsubl_high_u8(v7, v11);
    v19 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v9.i8, *(uint8x8_t *)v13.i8);
    v20 = (int16x8_t)vsubl_high_u8(v9, v13);
    v21 = (int16x8_t)vsubl_u8(*v10, *v14);
    v22 = (int16x8_t)vsubl_high_u8(*(uint8x16_t *)v10->i8, *(uint8x16_t *)v14->i8);
    v23 = vaddq_s16(v17, v15);
    v24 = vaddq_s16(v18, v16);
    v25 = vsubq_s16(v15, v17);
    v26 = vsubq_s16(v16, v18);
    v27 = vaddq_s16(v21, v19);
    v28 = vaddq_s16(v22, v20);
    v29 = vsubq_s16(v19, v21);
    v30 = vsubq_s16(v20, v22);
    v31 = vtrn1q_s16(v23, v25);
    v32 = vtrn2q_s16(v23, v25);
    v33 = vtrn1q_s16(v24, v26);
    v34 = vtrn2q_s16(v24, v26);
    v35 = vtrn1q_s16(v27, v29);
    v36 = vtrn2q_s16(v27, v29);
    v37 = vtrn1q_s16(v28, v30);
    v38 = vtrn2q_s16(v28, v30);
    v39 = vaddq_s16(v32, v31);
    v40 = vaddq_s16(v34, v33);
    v41 = vsubq_s16(v31, v32);
    v42 = vsubq_s16(v33, v34);
    v43 = vaddq_s16(v36, v35);
    v44 = vaddq_s16(v38, v37);
    v45 = vsubq_s16(v35, v36);
    v46 = vsubq_s16(v37, v38);
    v47 = (int32x4_t)vaddq_s16(v43, v39);
    v48 = (int32x4_t)vaddq_s16(v44, v40);
    v49 = (int32x4_t)vsubq_s16(v39, v43);
    v50 = (int32x4_t)vsubq_s16(v40, v44);
    v51 = (int32x4_t)vaddq_s16(v45, v41);
    v52 = (int32x4_t)vaddq_s16(v46, v42);
    v53 = (int32x4_t)vsubq_s16(v41, v45);
    v54 = (int32x4_t)vsubq_s16(v42, v46);
    v55 = (int16x8_t)vtrn1q_s32(v47, v49);
    v56 = (int16x8_t)vtrn2q_s32(v47, v49);
    v57 = (int16x8_t)vtrn1q_s32(v48, v50);
    v58 = (int16x8_t)vtrn2q_s32(v48, v50);
    v59 = (int16x8_t)vtrn1q_s32(v51, v53);
    v60 = (int16x8_t)vtrn2q_s32(v51, v53);
    v61 = (int16x8_t)vtrn1q_s32(v52, v54);
    *a6 = vaddq_s16(v56, v55);
    a6[1] = vaddq_s16(v58, v57);
    v62 = (int16x8_t)vtrn2q_s32(v52, v54);
    a6[2] = vaddq_s16(v60, v59);
    a6[3] = vaddq_s16(v62, v61);
    a6[4] = vsubq_s16(v55, v56);
    a6[5] = vsubq_s16(v57, v58);
    v6 -= 4;
    a6[6] = vsubq_s16(v59, v60);
    a6[7] = vsubq_s16(v61, v62);
    result = (uint8x8_t *)((char *)v10 + a2);
    a3 = (uint8x8_t *)((char *)v14 + a4);
    a6 += 8;
  }
  while (v6 > 4);
  return result;
}

uint64_t sub_1C98160BC(uint64_t a1, int a2, __int32 *a3, uint64_t a4, __int32 *a5, uint64_t a6)
{
  int v6;
  int16x8_t v7;
  __int32 *v8;
  uint8x8_t v9;
  __int32 *v10;
  __int32 *v11;
  uint8x8_t v12;
  __int32 *v13;
  uint8x8_t v14;
  __int32 *v15;
  __int32 *v16;
  uint8x8_t v17;
  int16x8_t v18;
  int16x8_t v19;
  int16x8_t v20;
  int16x8_t v21;
  int16x8_t v22;
  int16x8_t v23;
  int16x8_t v24;
  int64x2_t v25;
  int16x8_t v26;
  int32x4_t v27;
  int32x4_t v28;

  v6 = a2 + 4;
  v7 = 0uLL;
  do
  {
    v8 = (__int32 *)((char *)a3 + a4);
    v9.i32[0] = *a3;
    v10 = (__int32 *)((char *)a3 + a4 + a4);
    v9.i32[1] = *v10;
    v11 = (__int32 *)((char *)v10 + a4);
    v12.i32[0] = *v8;
    v12.i32[1] = *v11;
    a3 = (__int32 *)((char *)v11 + a4);
    v13 = (__int32 *)((char *)a5 + a6);
    v14.i32[0] = *a5;
    v15 = (__int32 *)((char *)a5 + a6 + a6);
    v14.i32[1] = *v15;
    v16 = (__int32 *)((char *)v15 + a6);
    v17.i32[0] = *v13;
    v17.i32[1] = *v16;
    a5 = (__int32 *)((char *)v16 + a6);
    v18 = (int16x8_t)vsubl_u8(v9, v14);
    v19 = (int16x8_t)vsubl_u8(v12, v17);
    v20 = vaddq_s16(v19, v18);
    v21 = vsubq_s16(v18, v19);
    v22 = vtrn1q_s16(v20, v21);
    v23 = vtrn2q_s16(v20, v21);
    v24 = vaddq_s16(v23, v22);
    v25 = (int64x2_t)vsubq_s16(v22, v23);
    v26 = (int16x8_t)vzip2q_s64((int64x2_t)v24, v25);
    v24.i64[1] = v25.i64[0];
    v27 = (int32x4_t)vaddq_s16(v26, v24);
    v28 = (int32x4_t)vsubq_s16(v24, v26);
    v7 = vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v27, v28)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v27, v28))), v7);
    v6 -= 4;
  }
  while (v6 > 4);
  return vaddlvq_u16((uint16x8_t)v7);
}

uint64_t sub_1C9816154(uint64_t a1, int a2, uint8x8_t *a3, uint64_t a4, uint8x8_t *a5, uint64_t a6)
{
  int v6;
  int16x8_t v7;
  uint8x8_t *v8;
  uint8x8_t v9;
  uint8x8_t *v10;
  uint8x8_t *v11;
  uint8x8_t v12;
  uint8x8_t *v13;
  int16x8_t v14;
  int16x8_t v15;
  int16x8_t v16;
  int16x8_t v17;
  int16x8_t v18;
  int16x8_t v19;
  int16x8_t v20;
  int16x8_t v21;
  int16x8_t v22;
  int16x8_t v23;
  int16x8_t v24;
  int16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  int16x8_t v28;
  int16x8_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int32x4_t v33;

  v6 = a2 + 4;
  v7 = 0uLL;
  do
  {
    v8 = (uint8x8_t *)((char *)a3 + a4 + a4);
    v9 = *v8;
    v10 = (uint8x8_t *)((char *)v8 + a4);
    v11 = (uint8x8_t *)((char *)a5 + a6 + a6);
    v12 = *v11;
    v13 = (uint8x8_t *)((char *)v11 + a6);
    v14 = (int16x8_t)vsubl_u8(*a3, *a5);
    v15 = (int16x8_t)vsubl_u8(*(uint8x8_t *)((char *)a3 + a4), *(uint8x8_t *)((char *)a5 + a6));
    v16 = (int16x8_t)vsubl_u8(v9, v12);
    v17 = (int16x8_t)vsubl_u8(*v10, *v13);
    v18 = vaddq_s16(v15, v14);
    v19 = vsubq_s16(v14, v15);
    v20 = vaddq_s16(v17, v16);
    v21 = vsubq_s16(v16, v17);
    v22 = vtrn1q_s16(v18, v19);
    v23 = vtrn2q_s16(v18, v19);
    v24 = vtrn1q_s16(v20, v21);
    v25 = vtrn2q_s16(v20, v21);
    v26 = vaddq_s16(v23, v22);
    v27 = vsubq_s16(v22, v23);
    v28 = vaddq_s16(v25, v24);
    v29 = vsubq_s16(v24, v25);
    v30 = (int32x4_t)vaddq_s16(v28, v26);
    v31 = (int32x4_t)vsubq_s16(v26, v28);
    v32 = (int32x4_t)vaddq_s16(v29, v27);
    v33 = (int32x4_t)vsubq_s16(v27, v29);
    v7 = vaddq_s16(vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v30, v31)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v30, v31))), v7), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v32, v33)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v32, v33))));
    v6 -= 4;
    a3 = (uint8x8_t *)((char *)v10 + a4);
    a5 = (uint8x8_t *)((char *)v13 + a6);
  }
  while (v6 > 4);
  return vaddlvq_u16((uint16x8_t)v7);
}

uint64_t sub_1C9816234(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int32x4_t v11;
  int32x4_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint8x16_t v17;
  uint8x16_t v18;
  uint8x16_t v19;
  uint8x16_t v20;
  uint8x16_t v21;
  uint8x16_t v22;
  uint8x16_t v23;
  uint8x16_t v24;
  int16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  int16x8_t v28;
  int16x8_t v29;
  int16x8_t v30;
  int16x8_t v31;
  int16x8_t v32;
  int16x8_t v33;
  int16x8_t v34;
  int16x8_t v35;
  int16x8_t v36;
  int16x8_t v37;
  int16x8_t v38;
  int16x8_t v39;
  int16x8_t v40;
  int16x8_t v41;
  int16x8_t v42;
  int16x8_t v43;
  int16x8_t v44;
  int16x8_t v45;
  int16x8_t v46;
  int16x8_t v47;
  int16x8_t v48;
  int16x8_t v49;
  int16x8_t v50;
  int16x8_t v51;
  int16x8_t v52;
  int16x8_t v53;
  int16x8_t v54;
  int16x8_t v55;
  int16x8_t v56;
  int32x4_t v57;
  int32x4_t v58;
  int32x4_t v59;
  int32x4_t v60;
  int32x4_t v61;
  int32x4_t v62;
  int32x4_t v63;
  int32x4_t v64;
  uint16x8_t v65;

  v6 = 4 * a4;
  v7 = 4 * a6;
  v8 = a5 + 3 * a6;
  v9 = a5 + a6;
  v10 = a3 + 3 * a4;
  v11 = 0uLL;
  v12 = 0uLL;
  v13 = a3 + a4;
  v14 = a5 + 2 * a6;
  v15 = a3 + 2 * a4;
  do
  {
    if (a1 >= 1)
    {
      for (i = 0; i < a1; i += 16)
      {
        v17 = *(uint8x16_t *)(a3 + i);
        v18 = *(uint8x16_t *)(v13 + i);
        v19 = *(uint8x16_t *)(v15 + i);
        v20 = *(uint8x16_t *)(v10 + i);
        v21 = *(uint8x16_t *)(a5 + i);
        v22 = *(uint8x16_t *)(v9 + i);
        v23 = *(uint8x16_t *)(v14 + i);
        v24 = *(uint8x16_t *)(v8 + i);
        v25 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v17.i8, *(uint8x8_t *)v21.i8);
        v26 = (int16x8_t)vsubl_high_u8(v17, v21);
        v27 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v18.i8, *(uint8x8_t *)v22.i8);
        v28 = (int16x8_t)vsubl_high_u8(v18, v22);
        v29 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v19.i8, *(uint8x8_t *)v23.i8);
        v30 = (int16x8_t)vsubl_high_u8(v19, v23);
        v31 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v20.i8, *(uint8x8_t *)v24.i8);
        v32 = (int16x8_t)vsubl_high_u8(v20, v24);
        v33 = vaddq_s16(v27, v25);
        v34 = vaddq_s16(v28, v26);
        v35 = vsubq_s16(v25, v27);
        v36 = vsubq_s16(v26, v28);
        v37 = vaddq_s16(v31, v29);
        v38 = vaddq_s16(v32, v30);
        v39 = vsubq_s16(v29, v31);
        v40 = vsubq_s16(v30, v32);
        v41 = vtrn1q_s16(v33, v35);
        v42 = vtrn2q_s16(v33, v35);
        v43 = vtrn1q_s16(v34, v36);
        v44 = vtrn2q_s16(v34, v36);
        v45 = vtrn1q_s16(v37, v39);
        v46 = vtrn2q_s16(v37, v39);
        v47 = vtrn1q_s16(v38, v40);
        v48 = vtrn2q_s16(v38, v40);
        v49 = vaddq_s16(v42, v41);
        v50 = vaddq_s16(v44, v43);
        v51 = vsubq_s16(v41, v42);
        v52 = vsubq_s16(v43, v44);
        v53 = vaddq_s16(v46, v45);
        v54 = vaddq_s16(v48, v47);
        v55 = vsubq_s16(v45, v46);
        v56 = vsubq_s16(v47, v48);
        v57 = (int32x4_t)vaddq_s16(v53, v49);
        v58 = (int32x4_t)vaddq_s16(v54, v50);
        v59 = (int32x4_t)vsubq_s16(v49, v53);
        v60 = (int32x4_t)vsubq_s16(v50, v54);
        v61 = (int32x4_t)vaddq_s16(v55, v51);
        v62 = (int32x4_t)vaddq_s16(v56, v52);
        v63 = (int32x4_t)vsubq_s16(v51, v55);
        v64 = (int32x4_t)vsubq_s16(v52, v56);
        v65 = (uint16x8_t)vaddq_s16(vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v58, v60)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v58, v60))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v57, v59)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v57, v59)))), vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v61, v63)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v61, v63))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v62, v64)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v62, v64)))));
        v12 = (int32x4_t)vaddw_u16((uint32x4_t)v12, *(uint16x4_t *)v65.i8);
        v11 = (int32x4_t)vaddw_high_u16((uint32x4_t)v11, v65);
      }
    }
    a3 += v6;
    a5 += v7;
    v8 += v7;
    v14 += v7;
    v9 += v7;
    v10 += v6;
    v15 += v6;
    v13 += v6;
    a2 -= 4;
  }
  while (a2);
  return vaddvq_s32(vaddq_s32(v12, v11));
}

uint64_t sub_1C98163DC(uint64_t a1, int a2, uint16x4_t *a3, uint64_t a4, uint16x4_t *a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  int32x4_t v8;
  int32x4_t v9;
  uint16x4_t *v10;
  uint16x4_t *v11;
  uint16x4_t *v12;
  uint16x4_t *v13;

  v6 = 2 * a4;
  v7 = 2 * a6;
  v8 = 0uLL;
  v9 = 0uLL;
  do
  {
    v10 = (uint16x4_t *)((char *)a3 + v6 + v6);
    v11 = (uint16x4_t *)((char *)a5 + v7 + v7);
    v9 = (int32x4_t)vabal_u16(vabal_u16((uint32x4_t)v9, *a3, *a5), *v10, *v11);
    v12 = (uint16x4_t *)((char *)v10 + v6);
    v13 = (uint16x4_t *)((char *)v11 + v7);
    v8 = (int32x4_t)vabal_u16(vabal_u16((uint32x4_t)v8, *(uint16x4_t *)((char *)a3 + 2 * a4), *(uint16x4_t *)((char *)a5 + 2 * a6)), *v12, *v13);
    a3 = (uint16x4_t *)((char *)v12 + v6);
    a5 = (uint16x4_t *)((char *)v13 + v7);
    a2 -= 4;
  }
  while (a2);
  return vaddvq_s32(vaddq_s32(v8, v9));
}

uint64_t sub_1C9816454(uint64_t a1, int a2, uint16x8_t *a3, uint64_t a4, uint16x8_t *a5, uint64_t a6)
{
  int16x8_t v6;
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  unsigned int v10;
  uint16x8_t v11;
  uint16x8_t v12;
  uint16x8_t v13;
  uint16x8_t v14;
  uint16x8_t v15;
  uint16x8_t v16;

  v6 = (int16x8_t)vabdq_u16(*a3, *a5);
  v7 = (int16x8_t)vabdq_u16(*(uint16x8_t *)((char *)a3 + 2 * a4), *(uint16x8_t *)((char *)a5 + 2 * a6));
  v8 = (int16x8_t)vabdq_u16(*(uint16x8_t *)((char *)a3 + 4 * a4), *(uint16x8_t *)((char *)a5 + 4 * a6));
  v9 = (int16x8_t)vabdq_u16(*(uint16x8_t *)((char *)a3 + 6 * a4), *(uint16x8_t *)((char *)a5 + 6 * a6));
  if (a2 >= 5)
  {
    v10 = a2 + 4;
    do
    {
      v11 = *(uint16x8_t *)((char *)a3 + 10 * a4);
      v12 = *(uint16x8_t *)((char *)a3 + 12 * a4);
      v13 = *(uint16x8_t *)((char *)a3 + 14 * a4);
      v14 = *(uint16x8_t *)((char *)a5 + 10 * a6);
      v15 = *(uint16x8_t *)((char *)a5 + 12 * a6);
      v16 = *(uint16x8_t *)((char *)a5 + 14 * a6);
      a3 = (uint16x8_t *)((char *)a3 + 8 * a4);
      a5 = (uint16x8_t *)((char *)a5 + 8 * a6);
      v6 = (int16x8_t)vabaq_u16((uint16x8_t)v6, *a3, *a5);
      v7 = (int16x8_t)vabaq_u16((uint16x8_t)v7, v11, v14);
      v8 = (int16x8_t)vabaq_u16((uint16x8_t)v8, v12, v15);
      v9 = (int16x8_t)vabaq_u16((uint16x8_t)v9, v13, v16);
      v10 -= 4;
    }
    while (v10 > 8);
  }
  return vaddlvq_u16((uint16x8_t)vaddq_s16(v7, vaddq_s16(vaddq_s16(v6, v8), v9)));
}

uint64_t sub_1C9816540(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint16x8_t *v11;
  uint64_t v12;
  int32x4_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int32x4_t v18;
  uint16x8_t *v19;
  uint16x8_t *v20;
  uint16x8_t *v21;
  int16x8_t v22;
  int16x8_t v23;
  int16x8_t v24;
  int16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  int16x8_t v28;
  int16x8_t v29;
  uint16x8_t *v30;
  uint16x8_t *v31;
  unsigned int v32;
  uint16x8_t *v33;
  uint16x8_t v34;
  uint16x8_t v35;
  uint16x8_t *v36;
  uint16x8_t v37;
  uint16x8_t v38;
  uint16x8_t *v39;
  uint16x8_t v40;
  uint16x8_t v41;
  uint16x8_t *v42;
  uint16x8_t v43;

  v6 = 0;
  v7 = 2 * a4;
  v8 = 2 * a6;
  v9 = a1;
  v10 = 8 * a6;
  v11 = (uint16x8_t *)(a5 + 8 * a6);
  v12 = 8 * a4;
  v13 = 0uLL;
  v14 = 4 * a4;
  v15 = 6 * a4;
  v16 = 4 * a6;
  v17 = 6 * a6;
  v18 = 0uLL;
  v19 = (uint16x8_t *)(a3 + 8 * a4);
  do
  {
    v20 = (uint16x8_t *)(a3 + 2 * v6);
    v21 = (uint16x8_t *)(a5 + 2 * v6);
    v22 = (int16x8_t)vabdq_u16(*v20, *v21);
    v23 = (int16x8_t)vabdq_u16(v20[1], v21[1]);
    v24 = (int16x8_t)vabdq_u16(*(uint16x8_t *)((char *)v20 + v7), *(uint16x8_t *)((char *)v21 + v8));
    v25 = (int16x8_t)vabdq_u16(*(uint16x8_t *)((char *)v20 + v7 + 16), *(uint16x8_t *)((char *)v21 + v8 + 16));
    v26 = (int16x8_t)vabdq_u16(*(uint16x8_t *)((char *)v20 + v14), *(uint16x8_t *)((char *)v21 + v16));
    v27 = (int16x8_t)vabdq_u16(*(uint16x8_t *)((char *)v20 + v14 + 16), *(uint16x8_t *)((char *)v21 + v16 + 16));
    v28 = (int16x8_t)vabdq_u16(*(uint16x8_t *)((char *)v20 + v15), *(uint16x8_t *)((char *)v21 + v17));
    v29 = (int16x8_t)vabdq_u16(*(uint16x8_t *)((char *)v20 + v15 + 16), *(uint16x8_t *)((char *)v21 + v17 + 16));
    if (a2 >= 5)
    {
      v30 = v19;
      v31 = v11;
      v32 = a2 + 4;
      do
      {
        v33 = (uint16x8_t *)((char *)v30 + v7 + v7);
        v34 = *v33;
        v35 = v33[1];
        v36 = (uint16x8_t *)((char *)v33 + v7);
        v37 = *v36;
        v38 = v36[1];
        v39 = (uint16x8_t *)((char *)v31 + v8 + v8);
        v40 = *v39;
        v41 = v39[1];
        v42 = (uint16x8_t *)((char *)v39 + v8);
        v22 = (int16x8_t)vabaq_u16((uint16x8_t)v22, *v30, *v31);
        v23 = (int16x8_t)vabaq_u16((uint16x8_t)v23, v30[1], v31[1]);
        v24 = (int16x8_t)vabaq_u16((uint16x8_t)v24, *(uint16x8_t *)((char *)v30 + v7), *(uint16x8_t *)((char *)v31 + v8));
        v25 = (int16x8_t)vabaq_u16((uint16x8_t)v25, *(uint16x8_t *)((char *)&v30[1] + v7), *(uint16x8_t *)((char *)&v31[1] + v8));
        v26 = (int16x8_t)vabaq_u16((uint16x8_t)v26, v34, v40);
        v27 = (int16x8_t)vabaq_u16((uint16x8_t)v27, v35, v41);
        v28 = (int16x8_t)vabaq_u16((uint16x8_t)v28, v37, *v42);
        v29 = (int16x8_t)vabaq_u16((uint16x8_t)v29, v38, v42[1]);
        v32 -= 4;
        v31 = (uint16x8_t *)((char *)v31 + v10);
        v30 = (uint16x8_t *)((char *)v30 + v12);
      }
      while (v32 > 8);
    }
    v6 += 16;
    v43 = (uint16x8_t)vaddq_s16(vaddq_s16(vaddq_s16(vaddq_s16(v23, v25), v27), v29), vaddq_s16(vaddq_s16(vaddq_s16(v22, v24), v26), v28));
    v13 = (int32x4_t)vaddw_u16((uint32x4_t)v13, *(uint16x4_t *)v43.i8);
    v18 = (int32x4_t)vaddw_high_u16((uint32x4_t)v18, v43);
    v11 += 2;
    v19 += 2;
  }
  while (v6 < v9);
  return vaddvq_s32(vaddq_s32(v13, v18));
}

uint64_t sub_1C98166C4(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1C9816540(2 * a1, a2, a3, a4, a5, a6);
}

uint64_t sub_1C98166CC(int a1, int a2, int16x8_t *a3, uint64_t a4, int16x8_t *a5, uint64_t a6)
{
  return sub_1C9815C8C(2 * a1, a2, a3, a4, a5, a6);
}

uint64_t sub_1C98166D4(uint16x8_t *a1, uint64_t a2, uint16x8_t *a3, uint64_t a4, _DWORD *a5)
{
  uint64_t result;

  result = sub_1C9816454((uint64_t)a1, 8, a1, a2, a3, a4);
  *a5 = result;
  return result;
}

uint64_t sub_1C981670C(uint16x8_t *a1, uint64_t a2, uint16x8_t *a3, uint64_t a4, uint64_t a5)
{
  uint16x8_t *v5;
  uint16x8_t v6;
  uint16x8_t v7;
  uint16x8_t v8;
  uint16x8_t v9;
  uint16x8_t *v10;
  uint16x8_t v11;
  uint16x8_t *v12;
  uint16x8_t v13;
  uint64_t v14;
  int16x8_t v15;
  int16x8_t v16;
  int16x8_t v17;
  int16x8_t v18;
  int16x8_t v19;
  int16x8_t v20;
  int16x8_t v21;
  int16x8_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint16x8_t *v33;
  uint16x8_t *v34;
  uint16x8_t v35;
  uint16x8_t *v36;
  uint16x8_t *v37;
  uint16x8_t v38;
  uint16x8_t v39;
  uint16x8_t v40;
  uint16x8_t *v41;
  uint16x8_t *v42;
  uint16x8_t v43;
  uint64_t result;

  v5 = &a1[a2];
  v6 = *(uint16x8_t *)((char *)v5 + 2 * a2);
  v7 = *v5;
  v8 = v5[1];
  v9 = *(uint16x8_t *)((char *)v5 + 2 * a2 + 16);
  v10 = &a3[a4];
  v11 = *(uint16x8_t *)((char *)v10 + 2 * a4);
  v12 = v10;
  v13 = *v10;
  v14 = 4 * a4;
  v15 = (int16x8_t)vabdq_u16(*a1, *a3);
  v16 = (int16x8_t)vabdq_u16(*(uint16x8_t *)((char *)a1 + 2 * a2), *(uint16x8_t *)((char *)a3 + 2 * a4));
  v17 = (int16x8_t)vabdq_u16(a1[1], a3[1]);
  v18 = (int16x8_t)vabdq_u16(*(uint16x8_t *)((char *)a1 + 2 * a2 + 16), *(uint16x8_t *)((char *)a3 + 2 * a4 + 16));
  v19 = (int16x8_t)vabdq_u16(v7, v13);
  v20 = (int16x8_t)vabdq_u16(v6, v11);
  v21 = (int16x8_t)vabdq_u16(v8, v12[1]);
  v22 = (int16x8_t)vabdq_u16(v9, *(uint16x8_t *)((char *)v12 + 2 * a4 + 16));
  v23 = 4 * a4 + 16;
  v24 = 6 * a4;
  v25 = 22 * a4 + 16;
  v26 = 20 * a4;
  v27 = 4 * a2;
  v28 = 4 * a2 + 16;
  v29 = 22 * a2 + 16;
  v30 = 6 * a2;
  v31 = 3;
  v32 = 20 * a2;
  do
  {
    v33 = (uint16x8_t *)((char *)a3 + v26);
    v34 = (uint16x8_t *)((char *)a1 + v32);
    v35 = *(uint16x8_t *)((char *)a1 + v28);
    v36 = (uint16x8_t *)((char *)a1 + v30);
    v37 = (uint16x8_t *)((char *)a1 + v29);
    a1 = (uint16x8_t *)((char *)a1 + v27);
    v38 = *v36;
    v39 = v36[1];
    v40 = *(uint16x8_t *)((char *)a3 + v23);
    v41 = (uint16x8_t *)((char *)a3 + v24);
    v42 = (uint16x8_t *)((char *)a3 + v25);
    a3 = (uint16x8_t *)((char *)a3 + v14);
    v15 = (int16x8_t)vabaq_u16((uint16x8_t)v15, *a1, *a3);
    v16 = (int16x8_t)vabaq_u16((uint16x8_t)v16, v38, *v41);
    v17 = (int16x8_t)vabaq_u16((uint16x8_t)v17, v35, v40);
    v18 = (int16x8_t)vabaq_u16((uint16x8_t)v18, v39, v41[1]);
    v19 = (int16x8_t)vabaq_u16((uint16x8_t)v19, *v34, *v33);
    v20 = (int16x8_t)vabaq_u16((uint16x8_t)v20, v37[-1], v42[-1]);
    v21 = (int16x8_t)vabaq_u16((uint16x8_t)v21, v34[1], v33[1]);
    v22 = (int16x8_t)vabaq_u16((uint16x8_t)v22, *v37, *v42);
    --v31;
  }
  while (v31);
  v43 = (uint16x8_t)vpaddq_s16(vpaddq_s16(vaddq_s16(v15, v16), vaddq_s16(v18, v17)), vpaddq_s16(vaddq_s16(v20, v19), vaddq_s16(v22, v21)));
  *(uint32x4_t *)(a5 + 4) = vpaddlq_u16(v43);
  v43.i32[0] = vaddlvq_u16(v43);
  result = v43.u32[0];
  *(_DWORD *)a5 = v43.i32[0];
  return result;
}

uint64_t sub_1C9816880(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  int v19;

  v9 = 0;
  LODWORD(v10) = 0;
  v11 = (uint64_t)(a5 + 1);
  v12 = 1;
  do
  {
    v13 = 0;
    v14 = v12;
    v15 = a1 + 2 * v9 * a2;
    v16 = a3 + 2 * v9 * a4;
    v17 = 1;
    do
    {
      v18 = v17;
      v19 = sub_1C981670C((uint16x8_t *)(v15 + 2 * v13), a2, (uint16x8_t *)(v16 + 2 * v13), a4, v11);
      v17 = 0;
      v10 = (v19 + v10);
      v11 += 20;
      v13 = 16;
    }
    while ((v18 & 1) != 0);
    v12 = 0;
    v9 = 16;
  }
  while ((v14 & 1) != 0);
  *a5 = v10;
  return v10;
}

uint64_t sub_1C9816948(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  uint64_t v7;
  _DWORD *v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  uint64_t v26;
  char v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  _DWORD *v32;
  int v33;

  v26 = result;
  v7 = 0;
  LODWORD(result) = 0;
  v8 = a5 + 1;
  v9 = 1;
  do
  {
    v10 = 0;
    v28 = v9;
    v30 = v26 + 2 * v7 * a2;
    v29 = a3 + 2 * v7 * a4;
    v11 = 1;
    do
    {
      v33 = result;
      v12 = 0;
      v13 = 0;
      v31 = v11;
      v32 = v8;
      v14 = (uint64_t)(v8 + 1);
      v15 = 1;
      v16 = v30 + 2 * v10;
      v17 = v29 + 2 * v10;
      do
      {
        v18 = 0;
        v19 = v15;
        v20 = v16 + 2 * v12 * a2;
        v21 = v17 + 2 * v12 * a4;
        v22 = 1;
        do
        {
          v23 = v22;
          v24 = sub_1C981670C((uint16x8_t *)(v20 + 2 * v18), a2, (uint16x8_t *)(v21 + 2 * v18), a4, v14);
          v22 = 0;
          v13 += v24;
          v14 += 20;
          v18 = 16;
        }
        while ((v23 & 1) != 0);
        v15 = 0;
        v12 = 16;
      }
      while ((v19 & 1) != 0);
      v11 = 0;
      *v32 = v13;
      v8 = v32 + 21;
      result = (v13 + v33);
      v10 = 32;
    }
    while ((v31 & 1) != 0);
    v9 = 0;
    v7 = 32;
  }
  while ((v28 & 1) != 0);
  *a5 = result;
  return result;
}

uint64_t sub_1C9816A90(unsigned int a1)
{
  return off_1E8291C78[__clz(__rbit32(a1)) - 2]();
}

uint64_t sub_1C9816AAC(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int16x8_t *v12;
  int16x8_t v13;
  int16x8_t *v14;
  int16x8_t v15;
  int16x8_t *v16;
  int16x8_t v17;
  int16x8_t *v18;
  int16x8_t v19;
  int16x8_t *v20;
  int16x8_t v21;
  int16x8_t *v22;
  int16x8_t v23;
  int16x8_t v24;
  int16x8_t v25;
  int16x8_t *v26;
  int16x8_t v27;
  int16x8_t *v28;
  int16x8_t v29;
  int16x8_t v30;
  int16x8_t *v31;
  int16x8_t v32;
  int16x8_t *v33;
  int16x8_t v34;
  int16x8_t *v35;
  int16x8_t v36;
  int16x8_t v37;
  int16x8_t v38;
  int16x8_t v39;
  int16x8_t v40;
  int16x8_t v41;
  int16x8_t v42;
  int16x8_t v43;
  int16x8_t v44;
  int16x8_t v45;
  int16x8_t v46;
  int16x8_t v47;
  int16x8_t v48;
  int16x8_t v49;
  int16x8_t v50;
  int16x8_t v51;
  int16x8_t v52;
  int32x4_t v53;
  int32x4_t v54;
  int32x4_t v55;
  int32x4_t v56;
  int16x8_t v57;
  int16x8_t v58;
  int16x8_t v59;
  int16x8_t v60;
  int16x8_t v61;
  int16x8_t v62;
  int16x8_t v63;
  int16x8_t v64;
  int16x8_t v65;
  int16x8_t v66;
  int16x8_t v67;
  int16x8_t v68;
  int16x8_t v69;
  int16x8_t v70;
  int16x8_t v71;
  int16x8_t v72;
  int16x8_t v73;
  int16x8_t v74;
  int16x8_t v75;
  int16x8_t v76;
  int32x4_t v77;
  int32x4_t v78;
  int32x4_t v79;
  int32x4_t v80;
  int16x8_t v81;
  int16x8_t v82;
  int16x8_t v83;
  int16x8_t v84;
  int16x8_t v85;
  int16x8_t v86;
  int16x8_t v87;
  int16x8_t v88;
  int16x8_t v89;
  int64x2_t v90;
  int16x8_t v91;
  int64x2_t v92;
  int16x8_t v93;
  int64x2_t v94;
  int16x8_t v95;
  int64x2_t v96;
  int16x8_t v97;
  int16x8_t v98;
  int16x8_t v99;
  int16x8_t v100;
  BOOL v101;

  result = 0;
  v8 = 2 * a4;
  v9 = 2 * a6;
  do
  {
    if (a1 >= 1)
    {
      v10 = 0;
      v11 = 0;
      do
      {
        v12 = (int16x8_t *)(a3 + v10 + v8);
        v13 = *v12;
        v14 = (int16x8_t *)((char *)v12 + v8);
        v15 = *v14;
        v16 = (int16x8_t *)((char *)v14 + v8);
        v17 = *v16;
        v18 = (int16x8_t *)(a5 + v10 + v9);
        v19 = *v18;
        v20 = (int16x8_t *)((char *)v18 + v9);
        v21 = *v20;
        v22 = (int16x8_t *)((char *)v20 + v9);
        v23 = *v22;
        v24 = vsubq_s16(*(int16x8_t *)(a3 + v10), *(int16x8_t *)(a5 + v10));
        v25 = vsubq_s16(v13, v19);
        v26 = (int16x8_t *)((char *)v16 + v8);
        v27 = *v26;
        v28 = (int16x8_t *)((char *)v26 + v8);
        v29 = vsubq_s16(v15, v21);
        v30 = *v28;
        v31 = (int16x8_t *)((char *)v28 + v8);
        v32 = *(int16x8_t *)((char *)v31 + 2 * a4);
        v33 = (int16x8_t *)((char *)v22 + v9);
        v34 = *v31;
        v35 = (int16x8_t *)((char *)v33 + v9 + v9);
        v36 = vsubq_s16(v17, v23);
        v37 = vsubq_s16(v27, *v33);
        v38 = vsubq_s16(v30, *(int16x8_t *)((char *)v33 + 2 * a6));
        v39 = vsubq_s16(v34, *v35);
        v40 = vsubq_s16(v32, *(int16x8_t *)((char *)v35 + 2 * a6));
        v41 = vaddq_s16(v25, v24);
        v42 = vsubq_s16(v24, v25);
        v43 = vaddq_s16(v36, v29);
        v44 = vsubq_s16(v29, v36);
        v45 = vtrn1q_s16(v41, v42);
        v46 = vtrn2q_s16(v41, v42);
        v47 = vtrn1q_s16(v43, v44);
        v48 = vtrn2q_s16(v43, v44);
        v49 = vaddq_s16(v46, v45);
        v50 = vsubq_s16(v45, v46);
        v51 = vaddq_s16(v48, v47);
        v52 = vsubq_s16(v47, v48);
        v53 = (int32x4_t)vaddq_s16(v51, v49);
        v54 = (int32x4_t)vsubq_s16(v49, v51);
        v55 = (int32x4_t)vaddq_s16(v52, v50);
        v56 = (int32x4_t)vsubq_s16(v50, v52);
        v57 = (int16x8_t)vtrn1q_s32(v53, v54);
        v58 = (int16x8_t)vtrn2q_s32(v53, v54);
        v59 = (int16x8_t)vtrn1q_s32(v55, v56);
        v60 = (int16x8_t)vtrn2q_s32(v55, v56);
        v61 = vaddq_s16(v58, v57);
        v62 = vaddq_s16(v38, v37);
        v63 = vsubq_s16(v37, v38);
        v64 = vsubq_s16(v57, v58);
        v65 = vaddq_s16(v40, v39);
        v66 = vsubq_s16(v39, v40);
        v67 = vtrn1q_s16(v62, v63);
        v68 = vtrn2q_s16(v62, v63);
        v69 = vtrn1q_s16(v65, v66);
        v70 = vaddq_s16(v60, v59);
        v71 = vtrn2q_s16(v65, v66);
        v72 = vaddq_s16(v68, v67);
        v73 = vsubq_s16(v67, v68);
        v74 = vaddq_s16(v71, v69);
        v75 = vsubq_s16(v69, v71);
        v76 = vsubq_s16(v59, v60);
        v77 = (int32x4_t)vaddq_s16(v74, v72);
        v78 = (int32x4_t)vsubq_s16(v72, v74);
        v79 = (int32x4_t)vaddq_s16(v75, v73);
        v80 = (int32x4_t)vsubq_s16(v73, v75);
        v81 = (int16x8_t)vtrn1q_s32(v77, v78);
        v82 = (int16x8_t)vtrn2q_s32(v77, v78);
        v83 = (int16x8_t)vtrn1q_s32(v79, v80);
        v84 = (int16x8_t)vtrn2q_s32(v79, v80);
        v85 = vaddq_s16(v82, v81);
        v86 = vsubq_s16(v81, v82);
        v87 = vaddq_s16(v84, v83);
        v88 = vsubq_s16(v83, v84);
        v89 = vaddq_s16(v85, v61);
        v90 = (int64x2_t)vsubq_s16(v61, v85);
        v91 = vaddq_s16(v87, v70);
        v92 = (int64x2_t)vsubq_s16(v70, v87);
        v93 = vaddq_s16(v86, v64);
        v94 = (int64x2_t)vsubq_s16(v64, v86);
        v95 = vaddq_s16(v88, v76);
        v96 = (int64x2_t)vsubq_s16(v76, v88);
        v97 = (int16x8_t)vzip2q_s64((int64x2_t)v89, v90);
        v98 = (int16x8_t)vzip2q_s64((int64x2_t)v91, v92);
        v99 = (int16x8_t)vzip2q_s64((int64x2_t)v93, v94);
        v100 = (int16x8_t)vzip2q_s64((int64x2_t)v95, v96);
        v89.i64[1] = v90.i64[0];
        v91.i64[1] = v92.i64[0];
        v93.i64[1] = v94.i64[0];
        v95.i64[1] = v96.i64[0];
        result = result
               + ((vaddlvq_u16((uint16x8_t)vaddq_s16(vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v91), (uint16x8_t)vabsq_s16(v98)), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v89), (uint16x8_t)vabsq_s16(v97))), vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v93), (uint16x8_t)vabsq_s16(v99)), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v95), (uint16x8_t)vabsq_s16(v100)))))+ 1) >> 1);
        v11 += 8;
        v10 += 16;
      }
      while (v11 < a1);
    }
    a5 += 16 * a6;
    a3 += 16 * a4;
    v101 = __OFSUB__(a2, 8);
    a2 -= 8;
  }
  while (!((a2 < 0) ^ v101 | (a2 == 0)));
  return result;
}

uint64_t sub_1C9816CE0(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
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
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  int16x8_t v26;
  int16x8_t v27;
  int16x8_t v28;
  int16x8_t v29;
  int16x8_t v30;
  int16x8_t v31;
  int16x8_t v32;
  int16x8_t v33;
  int16x8_t v34;
  int16x8_t v35;
  int16x8_t v36;
  int16x8_t v37;
  int16x8_t v38;
  int16x8_t v39;
  int16x8_t v40;
  int16x8_t v41;
  int16x8_t v42;
  int16x8_t v43;
  int16x8_t v44;
  int16x8_t v45;
  int16x8_t v46;
  int16x8_t v47;
  int16x8_t v48;
  int16x8_t v49;
  int16x8_t v50;
  int16x8_t *v51;
  int16x8_t v52;
  int16x8_t v53;
  int16x8_t v54;
  int16x8_t v55;
  int16x8_t v56;
  int16x8_t v57;
  int16x8_t v58;
  int32x4_t v59;
  int32x4_t v60;
  int32x4_t v61;
  int32x4_t v62;
  int32x4_t v63;
  int32x4_t v64;
  int32x4_t v65;
  int32x4_t v66;
  int16x8_t v67;
  int16x8_t v68;
  int16x8_t v69;
  int16x8_t v70;
  int16x8_t v71;
  int16x8_t v72;
  int16x8_t v73;
  int16x8_t v74;
  int32x4_t v75;
  uint64_t i;
  int16x8_t v77;
  int16x8_t v78;
  int16x8_t v79;
  int16x8_t v80;
  int16x8_t v81;
  int16x8_t v82;
  int16x8_t v83;
  int16x8_t v84;
  int16x8_t v85;
  int16x8_t v86;
  int16x8_t v87;
  int16x8_t v88;
  int16x8_t v89;
  int16x8_t v90;
  int16x8_t v91;
  int16x8_t v92;
  int32x4_t v93;
  int32x4_t v94;
  int32x4_t v95;
  int32x4_t v96;
  int32x4_t v97;
  int32x4_t v98;
  int32x4_t v99;
  int32x4_t v100;
  int32x4_t v101;
  int32x4_t v102;
  int32x4_t v103;
  int32x4_t v104;
  int32x4_t v105;
  int32x4_t v106;
  int32x4_t v107;
  int32x4_t v108;
  int32x4_t v109;
  int32x4_t v110;
  int32x4_t v111;
  int32x4_t v112;
  int32x4_t v113;
  int32x4_t v114;
  int32x4_t v115;
  int32x4_t v116;
  BOOL v117;
  uint64_t v118;
  uint64_t v119;
  _BYTE v120[512];
  uint64_t v121;

  v7 = 0;
  v8 = 0;
  result = 0;
  v121 = *MEMORY[0x1E0C80C00];
  v10 = a3 + 16;
  v119 = 32 * a4;
  v11 = 8 * a4;
  v12 = a5 + 6 * a6;
  v118 = 32 * a6;
  v13 = 8 * a6;
  v14 = a5 + 4 * a6;
  v15 = a5 + 2 * a6;
  v16 = v10 + 6 * a4;
  v17 = v10 + 4 * a4;
  v18 = v10 + 2 * a4;
  do
  {
    if (a1 >= 1)
    {
      v19 = 0;
      v20 = v7;
      v21 = v8;
      do
      {
        v22 = 0;
        v23 = 20;
        v24 = v20;
        v25 = v21;
        do
        {
          v26 = vsubq_s16(*(int16x8_t *)(v10 + v25 - 16), *(int16x8_t *)(a5 + v24));
          v27 = vsubq_s16(*(int16x8_t *)(v10 + v25), *(int16x8_t *)(a5 + v24 + 16));
          v28 = vsubq_s16(*(int16x8_t *)(v18 + v25 - 16), *(int16x8_t *)(v15 + v24));
          v29 = vsubq_s16(*(int16x8_t *)(v18 + v25), *(int16x8_t *)(v15 + v24 + 16));
          v30 = vsubq_s16(*(int16x8_t *)(v17 + v25 - 16), *(int16x8_t *)(v14 + v24));
          v31 = vsubq_s16(*(int16x8_t *)(v17 + v25), *(int16x8_t *)(v14 + v24 + 16));
          v32 = vsubq_s16(*(int16x8_t *)(v16 + v25 - 16), *(int16x8_t *)(v12 + v24));
          v33 = vsubq_s16(*(int16x8_t *)(v16 + v25), *(int16x8_t *)(v12 + v24 + 16));
          v34 = vaddq_s16(v28, v26);
          v35 = vaddq_s16(v29, v27);
          v36 = vsubq_s16(v26, v28);
          v37 = vsubq_s16(v27, v29);
          v38 = vaddq_s16(v32, v30);
          v39 = vaddq_s16(v33, v31);
          v40 = vsubq_s16(v30, v32);
          v41 = vsubq_s16(v31, v33);
          v42 = vtrn1q_s16(v34, v36);
          v43 = vtrn2q_s16(v34, v36);
          v44 = vtrn1q_s16(v35, v37);
          v45 = vtrn2q_s16(v35, v37);
          v46 = vtrn1q_s16(v38, v40);
          v47 = vtrn2q_s16(v38, v40);
          v48 = vtrn1q_s16(v39, v41);
          v49 = vtrn2q_s16(v39, v41);
          v50 = vaddq_s16(v43, v42);
          v51 = (int16x8_t *)&v120[v22];
          v52 = vaddq_s16(v45, v44);
          v53 = vsubq_s16(v42, v43);
          v54 = vsubq_s16(v44, v45);
          v55 = vaddq_s16(v47, v46);
          v56 = vaddq_s16(v49, v48);
          v57 = vsubq_s16(v46, v47);
          v58 = vsubq_s16(v48, v49);
          v59 = (int32x4_t)vaddq_s16(v55, v50);
          v60 = (int32x4_t)vaddq_s16(v56, v52);
          v61 = (int32x4_t)vsubq_s16(v50, v55);
          v62 = (int32x4_t)vsubq_s16(v52, v56);
          v63 = (int32x4_t)vaddq_s16(v57, v53);
          v64 = (int32x4_t)vaddq_s16(v58, v54);
          v65 = (int32x4_t)vsubq_s16(v53, v57);
          v66 = (int32x4_t)vsubq_s16(v54, v58);
          v67 = (int16x8_t)vtrn1q_s32(v59, v61);
          v68 = (int16x8_t)vtrn2q_s32(v59, v61);
          v69 = (int16x8_t)vtrn1q_s32(v60, v62);
          v70 = (int16x8_t)vtrn2q_s32(v60, v62);
          v71 = (int16x8_t)vtrn1q_s32(v63, v65);
          v72 = (int16x8_t)vtrn2q_s32(v63, v65);
          v73 = (int16x8_t)vtrn1q_s32(v64, v66);
          *v51 = vaddq_s16(v68, v67);
          v51[1] = vaddq_s16(v70, v69);
          v74 = (int16x8_t)vtrn2q_s32(v64, v66);
          v51[2] = vaddq_s16(v72, v71);
          v51[3] = vaddq_s16(v74, v73);
          v51[4] = vsubq_s16(v67, v68);
          v51[5] = vsubq_s16(v69, v70);
          v51[6] = vsubq_s16(v71, v72);
          v51[7] = vsubq_s16(v73, v74);
          v22 += 128;
          v23 -= 4;
          v25 += v11;
          v24 += v13;
        }
        while (v23 > 4);
        v75 = 0uLL;
        for (i = 144; i != 272; i += 32)
        {
          v77 = *(int16x8_t *)&v120[i - 144];
          v78 = *(int16x8_t *)&v120[i - 128];
          v79 = *(int16x8_t *)&v120[i - 16];
          v80 = *(int16x8_t *)&v120[i];
          v81 = *(int16x8_t *)&v120[i + 112];
          v82 = *(int16x8_t *)&v120[i + 128];
          v83 = vaddq_s16(v79, v77);
          v84 = vaddq_s16(v80, v78);
          v85 = vsubq_s16(v77, v79);
          v86 = vsubq_s16(v78, v80);
          v87 = *(int16x8_t *)&v120[i + 240];
          v88 = *(int16x8_t *)&v120[i + 256];
          v89 = vaddq_s16(v87, v81);
          v90 = vaddq_s16(v88, v82);
          v91 = vsubq_s16(v81, v87);
          v92 = vsubq_s16(v82, v88);
          v93 = vmovl_s16(*(int16x4_t *)v83.i8);
          v94 = vaddw_high_s16(v93, v83);
          v95 = vmovl_s16(*(int16x4_t *)v85.i8);
          v96 = vaddw_high_s16(v95, v85);
          v97 = vmovl_s16(*(int16x4_t *)v84.i8);
          v98 = vaddw_high_s16(v97, v84);
          v99 = vmovl_s16(*(int16x4_t *)v86.i8);
          v100 = vaddw_high_s16(v99, v86);
          v101 = vsubw_high_s16(v93, v83);
          v102 = vsubw_high_s16(v95, v85);
          v103 = vsubw_high_s16(v97, v84);
          v104 = vsubw_high_s16(v99, v86);
          v105 = vmovl_s16(*(int16x4_t *)v89.i8);
          v106 = vaddw_high_s16(v105, v89);
          v107 = vmovl_s16(*(int16x4_t *)v91.i8);
          v108 = vaddw_high_s16(v107, v91);
          v109 = vmovl_s16(*(int16x4_t *)v90.i8);
          v110 = vaddw_high_s16(v109, v90);
          v111 = vmovl_s16(*(int16x4_t *)v92.i8);
          v112 = vaddw_high_s16(v111, v92);
          v113 = vsubw_high_s16(v105, v89);
          v114 = vsubw_high_s16(v107, v91);
          v115 = vsubw_high_s16(v109, v90);
          v116 = vsubw_high_s16(v111, v92);
          v75 = vaddq_s32(vaddq_s32(vaddq_s32(vaddq_s32(v75, (int32x4_t)vmaxq_u16((uint16x8_t)vabsq_s32(vaddq_s32(v106, v94)), (uint16x8_t)vabsq_s32(vaddq_s32(v110, v98)))), vaddq_s32((int32x4_t)vmaxq_u16((uint16x8_t)vabsq_s32(vaddq_s32(v108, v96)), (uint16x8_t)vabsq_s32(vaddq_s32(v112, v100))), (int32x4_t)vmaxq_u16((uint16x8_t)vabdq_s32(v94, v106), (uint16x8_t)vabdq_s32(v98, v110)))), vaddq_s32(vaddq_s32((int32x4_t)vmaxq_u16((uint16x8_t)vabdq_s32(v96, v108), (uint16x8_t)vabdq_s32(v100, v112)), (int32x4_t)vmaxq_u16((uint16x8_t)vabsq_s32(vaddq_s32(v113, v101)), (uint16x8_t)vabsq_s32(vaddq_s32(v115, v103)))), (int32x4_t)vmaxq_u16(
                                   (uint16x8_t)vabsq_s32(vaddq_s32(v114, v102)),
                                   (uint16x8_t)vabsq_s32(vaddq_s32(v116, v104))))),
                  vaddq_s32((int32x4_t)vmaxq_u16((uint16x8_t)vabdq_s32(v101, v113), (uint16x8_t)vabdq_s32(v103, v115)), (int32x4_t)vmaxq_u16((uint16x8_t)vabdq_s32(v102, v114), (uint16x8_t)vabdq_s32(v104, v116))));
        }
        result = result + ((vaddvq_s32(v75) + 2) >> 2);
        v19 += 16;
        v21 += 32;
        v20 += 32;
      }
      while (v19 < a1);
    }
    v8 += v119;
    v7 += v118;
    v117 = __OFSUB__(a2, 16);
    a2 -= 16;
  }
  while (!((a2 < 0) ^ v117 | (a2 == 0)));
  return result;
}

uint64_t sub_1C981709C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t result;
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
  unsigned int v16;
  int32x4_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int32x4_t *v22;
  int16x8_t *v23;
  int16x8_t v24;
  int16x8_t *v25;
  int16x8_t v26;
  int16x8_t *v27;
  int16x8_t *v28;
  int16x8_t v29;
  int16x8_t v30;
  int16x8_t *v31;
  int16x8_t v32;
  int16x8_t v33;
  int16x8_t *v34;
  int16x8_t v35;
  int16x8_t v36;
  int16x8_t v37;
  int16x8_t v38;
  int16x8_t v39;
  int16x8_t v40;
  int16x8_t v41;
  int16x8_t v42;
  int16x8_t v43;
  int16x8_t v44;
  int16x8_t v45;
  int16x8_t v46;
  int16x8_t v47;
  int32x4_t v48;
  int32x4_t v49;
  int32x4_t v50;
  int32x4_t v51;
  int16x8_t v52;
  int16x8_t v53;
  int16x8_t v54;
  int16x8_t v55;
  int16x8_t v56;
  int16x8_t v57;
  int16x8_t v58;
  int16x8_t v59;
  int16x8_t *v60;
  int16x8_t v61;
  int16x8_t *v62;
  int16x8_t v63;
  int16x8_t *v64;
  int16x8_t v65;
  int16x8_t v66;
  int16x8_t *v67;
  int16x8_t v68;
  int16x8_t *v69;
  int16x8_t v70;
  int16x8_t v71;
  int16x8_t v72;
  int16x8_t v73;
  int16x8_t v74;
  int16x8_t v75;
  int16x8_t v76;
  int16x8_t v77;
  int16x8_t v78;
  int16x8_t v79;
  int16x8_t v80;
  int16x8_t v81;
  int16x8_t v82;
  int16x8_t v83;
  int16x8_t v84;
  int16x8_t v85;
  int32x4_t v86;
  int32x4_t v87;
  int32x4_t v88;
  int32x4_t v89;
  int16x8_t v90;
  int16x8_t v91;
  int16x8_t v92;
  int16x8_t v93;
  int16x8_t v94;
  int16x8_t v95;
  int16x8_t v96;
  int16x8_t v97;
  int16x8_t v98;
  int16x8_t v99;
  int16x8_t v100;
  int16x8_t v101;
  int16x8_t v102;
  int16x8_t v103;
  int16x8_t v104;
  int32x4_t v105;
  int16x8_t v106;
  int16x8_t v107;
  int32x4_t v108;
  int16x8_t v109;
  int16x8_t v110;
  int16x8_t v111;
  int32x4_t v112;
  int32x4_t v113;
  BOOL v114;
  char v115;
  _BYTE *v116;
  uint64_t v117;
  char v118;
  int32x4_t *v119;
  int32x4_t v120;
  int32x4_t v121;
  int32x4_t v122;
  int32x4_t v123;
  int32x4_t v124;
  int32x4_t v125;
  int32x4_t v126;
  int32x4_t v127;
  int32x4_t v128;
  int32x4_t v129;
  int32x4_t v130;
  int32x4_t v131;
  int32x4_t v132;
  int32x4_t v133;
  int32x4_t v134;
  int32x4_t v135;
  char v136;
  int32x4_t v137;
  uint64_t *v138;
  uint64_t v139;
  char v140;
  int32x4_t v141;
  int32x4_t v142;
  BOOL v143;
  _BYTE v144[32];
  uint64_t v145;
  _QWORD v146[258];

  v3 = MEMORY[0x1E0C80A78]();
  result = 0;
  v6 = 2 * v5;
  v8 = 2 * v7;
  v146[257] = *MEMORY[0x1E0C80C00];
  v9 = v5 << 6;
  v10 = 16 * v5;
  v11 = v7 << 6;
  v12 = 16 * v7;
  do
  {
    if (v3 >= 1)
    {
      v13 = 0;
      v14 = v2;
      v15 = v1;
      do
      {
        v16 = 0;
        v17 = (int32x4_t *)v144;
        v18 = v14;
        v19 = v15;
        do
        {
          v20 = 0;
          v21 = -8;
          v22 = v17;
          do
          {
            v23 = (int16x8_t *)(v19 + v20 + v6);
            v24 = *v23;
            v25 = (int16x8_t *)((char *)v23 + v6);
            v26 = *v25;
            v27 = (int16x8_t *)((char *)v25 + v6);
            v28 = (int16x8_t *)(v18 + v20 + v8);
            v29 = *v28;
            v30 = vsubq_s16(*(int16x8_t *)(v19 + v20), *(int16x8_t *)(v18 + v20));
            v31 = (int16x8_t *)((char *)v28 + v8);
            v32 = vsubq_s16(v24, v29);
            v33 = vsubq_s16(v26, *v31);
            v34 = (int16x8_t *)((char *)v31 + v8);
            v35 = vsubq_s16(*v27, *v34);
            v36 = vaddq_s16(v32, v30);
            v37 = vsubq_s16(v30, v32);
            v38 = vaddq_s16(v35, v33);
            v39 = vsubq_s16(v33, v35);
            v40 = vtrn1q_s16(v36, v37);
            v41 = vtrn2q_s16(v36, v37);
            v42 = vtrn1q_s16(v38, v39);
            v43 = vtrn2q_s16(v38, v39);
            v44 = vaddq_s16(v41, v40);
            v45 = vsubq_s16(v40, v41);
            v46 = vaddq_s16(v43, v42);
            v47 = vsubq_s16(v42, v43);
            v48 = (int32x4_t)vaddq_s16(v46, v44);
            v49 = (int32x4_t)vsubq_s16(v44, v46);
            v50 = (int32x4_t)vaddq_s16(v47, v45);
            v51 = (int32x4_t)vsubq_s16(v45, v47);
            v52 = (int16x8_t)vtrn1q_s32(v48, v49);
            v53 = (int16x8_t)vtrn2q_s32(v48, v49);
            v54 = (int16x8_t)vtrn1q_s32(v50, v51);
            v55 = (int16x8_t)vtrn2q_s32(v50, v51);
            v56 = vaddq_s16(v53, v52);
            v57 = vsubq_s16(v52, v53);
            v58 = vaddq_s16(v55, v54);
            v59 = vsubq_s16(v54, v55);
            v60 = (int16x8_t *)((char *)v27 + v6);
            v61 = *v60;
            v62 = (int16x8_t *)((char *)v60 + v6);
            v63 = *v62;
            v64 = (int16x8_t *)((char *)v62 + v6);
            v65 = *v64;
            v66 = *(int16x8_t *)((char *)v64 + v6);
            v67 = (int16x8_t *)((char *)v34 + v8 + v8);
            v68 = *v67;
            v69 = (int16x8_t *)((char *)v67 + v8);
            v70 = vsubq_s16(v61, *(int16x8_t *)((char *)v34 + v8));
            v71 = vsubq_s16(v63, v68);
            v72 = vsubq_s16(v65, *v69);
            v73 = vsubq_s16(v66, *(int16x8_t *)((char *)v69 + v8));
            v74 = vaddq_s16(v71, v70);
            v75 = vsubq_s16(v70, v71);
            v76 = vaddq_s16(v73, v72);
            v77 = vsubq_s16(v72, v73);
            v78 = vtrn1q_s16(v74, v75);
            v79 = vtrn2q_s16(v74, v75);
            v80 = vtrn1q_s16(v76, v77);
            v81 = vtrn2q_s16(v76, v77);
            v82 = vaddq_s16(v79, v78);
            v83 = vsubq_s16(v78, v79);
            v84 = vaddq_s16(v81, v80);
            v85 = vsubq_s16(v80, v81);
            v86 = (int32x4_t)vaddq_s16(v84, v82);
            v87 = (int32x4_t)vsubq_s16(v82, v84);
            v88 = (int32x4_t)vaddq_s16(v85, v83);
            v89 = (int32x4_t)vsubq_s16(v83, v85);
            v90 = (int16x8_t)vtrn1q_s32(v86, v87);
            v91 = (int16x8_t)vtrn2q_s32(v86, v87);
            v92 = (int16x8_t)vtrn1q_s32(v88, v89);
            v93 = (int16x8_t)vtrn2q_s32(v88, v89);
            v94 = vaddq_s16(v91, v90);
            v95 = vsubq_s16(v90, v91);
            v96 = vaddq_s16(v93, v92);
            v97 = vsubq_s16(v92, v93);
            v98 = vaddq_s16(v94, v56);
            v99 = vsubq_s16(v56, v94);
            v100 = vaddq_s16(v96, v58);
            v101 = vsubq_s16(v58, v96);
            v102 = vaddq_s16(v95, v57);
            v103 = vsubq_s16(v57, v95);
            v104 = (int16x8_t)vzip1q_s64((int64x2_t)v98, (int64x2_t)v99);
            v105 = vmovl_s16(*(int16x4_t *)v98.i8);
            *v22 = vaddw_high_s16(v105, v98);
            v22[1] = vaddl_high_s16(v99, v104);
            v106 = vaddq_s16(v97, v59);
            v107 = (int16x8_t)vzip1q_s64((int64x2_t)v100, (int64x2_t)v101);
            v22[32] = vsubw_high_s16(v105, v98);
            v22[33] = vsubl_high_s16(v104, v99);
            v108 = vmovl_s16(*(int16x4_t *)v100.i8);
            v22[8] = vaddw_high_s16(v108, v100);
            v22[9] = vaddl_high_s16(v101, v107);
            v109 = vsubq_s16(v59, v97);
            v110 = (int16x8_t)vzip1q_s64((int64x2_t)v102, (int64x2_t)v103);
            v111 = (int16x8_t)vzip1q_s64((int64x2_t)v106, (int64x2_t)v109);
            v22[40] = vsubw_high_s16(v108, v100);
            v22[41] = vsubl_high_s16(v107, v101);
            v112 = vmovl_s16(*(int16x4_t *)v102.i8);
            v22[16] = vaddw_high_s16(v112, v102);
            v22[17] = vaddl_high_s16(v103, v110);
            v22[48] = vsubw_high_s16(v112, v102);
            v22[49] = vsubl_high_s16(v110, v103);
            v113 = vmovl_s16(*(int16x4_t *)v106.i8);
            v22[24] = vaddw_high_s16(v113, v106);
            v22[25] = vaddl_high_s16(v109, v111);
            v22[56] = vsubw_high_s16(v113, v106);
            v22[57] = vsubl_high_s16(v111, v109);
            v21 += 8;
            v20 += 16;
            v22 += 2;
          }
          while (v21 < 0x18);
          v17 += 64;
          v19 += v10;
          v18 += v12;
          v114 = v16 >= 0x18;
          v16 += 8;
        }
        while (!v114);
        v115 = 1;
        v116 = v144;
        do
        {
          v117 = 0;
          v118 = v115;
          do
          {
            v119 = (int32x4_t *)&v116[v117];
            v120 = *(int32x4_t *)&v116[v117];
            v121 = *(int32x4_t *)&v116[v117 + 16];
            v122 = *(int32x4_t *)&v116[v117 + 32];
            v123 = *(int32x4_t *)&v116[v117 + 48];
            v124 = *(int32x4_t *)&v116[v117 + 1024];
            v125 = *(int32x4_t *)&v116[v117 + 1040];
            v126 = *(int32x4_t *)&v116[v117 + 1056];
            v127 = vaddq_s32(v124, v120);
            v128 = *(int32x4_t *)&v116[v117 + 1072];
            v129 = vaddq_s32(v125, v121);
            v130 = vsubq_s32(v120, v124);
            v131 = vsubq_s32(v121, v125);
            v132 = vaddq_s32(v126, v122);
            v133 = vaddq_s32(v128, v123);
            v134 = vsubq_s32(v122, v126);
            v135 = vsubq_s32(v123, v128);
            *v119 = vaddq_s32(v132, v127);
            v119[1] = vaddq_s32(v133, v129);
            v119[2] = vaddq_s32(v134, v130);
            v119[3] = vaddq_s32(v135, v131);
            v119[64] = vsubq_s32(v127, v132);
            v119[65] = vsubq_s32(v129, v133);
            v119[66] = vsubq_s32(v130, v134);
            v119[67] = vsubq_s32(v131, v135);
            v117 += 64;
          }
          while ((_DWORD)v117 != 1024);
          v115 = 0;
          v116 = v146;
        }
        while ((v118 & 1) != 0);
        v136 = 1;
        v137 = 0uLL;
        v138 = (uint64_t *)v144;
        do
        {
          v139 = 0;
          v140 = v136;
          do
          {
            v141 = *(int32x4_t *)&v138[v139 + 2];
            v142 = *(int32x4_t *)&v138[v139 + 10];
            v137 = vaddq_s32(vaddq_s32(vaddq_s32((int32x4_t)vmaxq_u32((uint32x4_t)vabsq_s32(vaddq_s32(*(int32x4_t *)&v138[v139 + 256], *(int32x4_t *)&v138[v139])), (uint32x4_t)vabsq_s32(vaddq_s32(*(int32x4_t *)&v138[v139 + 264], *(int32x4_t *)&v138[v139 + 8]))), v137), vaddq_s32((int32x4_t)vmaxq_u32((uint32x4_t)vabsq_s32(vaddq_s32(*(int32x4_t *)&v138[v139 + 258], v141)), (uint32x4_t)vabsq_s32(vaddq_s32(*(int32x4_t *)&v138[v139 + 266], v142))), (int32x4_t)vmaxq_u32((uint32x4_t)vabsq_s32(vsubq_s32(
                                                      *(int32x4_t *)&v138[v139],
                                                      *(int32x4_t *)&v138[v139 + 256])),
                                      (uint32x4_t)vabsq_s32(vsubq_s32(*(int32x4_t *)&v138[v139 + 8], *(int32x4_t *)&v138[v139 + 264]))))), (int32x4_t)vmaxq_u32((uint32x4_t)vabsq_s32(vsubq_s32(v141, *(int32x4_t *)&v138[v139 + 258])), (uint32x4_t)vabsq_s32(vsubq_s32(v142, *(int32x4_t *)&v138[v139 + 266]))));
            v139 += 16;
          }
          while ((_DWORD)(v139 * 8) != 2048);
          v136 = 0;
          v138 = &v145;
        }
        while ((v140 & 1) != 0);
        result = result + ((vaddvq_s32(v137) + 4) >> 3);
        v13 += 32;
        v15 += 64;
        v14 += 64;
      }
      while (v13 < v3);
    }
    v1 += v9;
    v2 += v11;
    v143 = __OFSUB__(v0, 32);
    v0 -= 32;
  }
  while (!((v0 < 0) ^ v143 | (v0 == 0)));
  return result;
}

float sub_1C9817520(int a1, int a2, int16x8_t *a3, uint64_t a4, int16x8_t *a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int16x8_t v9;
  int16x8_t *v10;
  int16x8_t v11;
  int16x8_t *v12;
  int16x8_t *v13;
  int16x8_t v14;
  int16x8_t *v15;
  int16x8_t v16;
  int16x8_t v17;
  int16x8_t v18;
  int16x8_t v19;
  int16x8_t v20;
  int16x8_t v21;
  int16x8_t v22;
  int16x8_t v23;
  int16x8_t v24;
  int16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int16x8_t v32;
  int16x8_t v33;
  int16x8_t v34;
  int16x8_t v35;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int8 *v42;
  uint64_t v43;
  __int8 *v44;
  __int8 *v45;
  int32x4_t v46;
  int32x4_t v47;
  unint64_t v48;
  unint64_t i;
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
  int16x8_t v62;
  int16x8_t v63;
  int16x8_t v64;
  int16x8_t v65;
  int32x4_t v66;
  int32x4_t v67;
  int32x4_t v68;
  int32x4_t v69;
  int16x8_t v70;
  int16x8_t v71;
  int16x8_t v72;
  int16x8_t v73;
  int16x8_t v74;
  int16x8_t v75;
  int16x8_t v76;
  int16x8_t v77;
  int16x8_t v78;
  int16x8_t v79;
  int16x8_t v80;
  int16x8_t v81;
  int16x8_t v82;
  int16x8_t v83;
  int16x8_t v84;
  int16x8_t v85;
  int16x8_t v86;
  int16x8_t v87;
  int32x4_t v88;
  int32x4_t v89;
  int32x4_t v90;
  int32x4_t v91;
  int16x8_t v92;
  int16x8_t v93;
  int16x8_t v94;
  int16x8_t v95;
  uint16x8_t v96;

  if (a1 >= 8)
  {
    v37 = a1;
    v38 = 8 * a4;
    v39 = (uint64_t)a3[1].i64 + 2 * a4;
    v40 = (uint64_t)a3[1].i64 + 4 * a4;
    v41 = (uint64_t)a3[1].i64 + 6 * a4;
    v42 = &a5->i8[6 * a6];
    v43 = 8 * a6;
    v44 = &a5->i8[4 * a6];
    v45 = &a5->i8[2 * a6];
    v46 = 0uLL;
    v47 = 0uLL;
    do
    {
      v48 = 0;
      for (i = 0; i < v37; i += 8)
      {
        v50 = vsubq_s16(a3[v48 / 0x10], a5[v48 / 0x10]);
        v51 = vsubq_s16(a3[v48 / 0x10 + 1], a5[v48 / 0x10 + 1]);
        v52 = vsubq_s16(*(int16x8_t *)(v39 + v48 - 16), *(int16x8_t *)&v45[v48]);
        v53 = vsubq_s16(*(int16x8_t *)(v39 + v48), *(int16x8_t *)&v45[v48 + 16]);
        v54 = vsubq_s16(*(int16x8_t *)(v40 + v48 - 16), *(int16x8_t *)&v44[v48]);
        v55 = vsubq_s16(*(int16x8_t *)(v40 + v48), *(int16x8_t *)&v44[v48 + 16]);
        v56 = vsubq_s16(*(int16x8_t *)(v41 + v48 - 16), *(int16x8_t *)&v42[v48]);
        v57 = vsubq_s16(*(int16x8_t *)(v41 + v48), *(int16x8_t *)&v42[v48 + 16]);
        v58 = vaddq_s16(v52, v50);
        v59 = vsubq_s16(v50, v52);
        v60 = vaddq_s16(v56, v54);
        v61 = vsubq_s16(v54, v56);
        v62 = vzip1q_s16(v58, v59);
        v63 = vzip2q_s16(v58, v59);
        v64 = vzip1q_s16(v60, v61);
        v65 = vzip2q_s16(v60, v61);
        v66 = (int32x4_t)vaddq_s16(v64, v62);
        v67 = (int32x4_t)vsubq_s16(v62, v64);
        v68 = (int32x4_t)vaddq_s16(v65, v63);
        v69 = (int32x4_t)vsubq_s16(v63, v65);
        v70 = (int16x8_t)vzip1q_s32(v66, v67);
        v71 = (int16x8_t)vzip2q_s32(v66, v67);
        v72 = (int16x8_t)vzip1q_s32(v68, v69);
        v73 = (int16x8_t)vzip2q_s32(v68, v69);
        v74 = vaddq_s16(v72, v70);
        v75 = vsubq_s16(v70, v72);
        v76 = vaddq_s16(v73, v71);
        v77 = vsubq_s16(v71, v73);
        v78 = (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v74), (uint16x8_t)vabsq_s16(v76));
        v79 = (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v75), (uint16x8_t)vabsq_s16(v77));
        v80 = vaddq_s16(v53, v51);
        v81 = vsubq_s16(v51, v53);
        v82 = vaddq_s16(v57, v55);
        v83 = vsubq_s16(v55, v57);
        v84 = vzip1q_s16(v80, v81);
        v85 = vzip2q_s16(v80, v81);
        v86 = vzip1q_s16(v82, v83);
        v87 = vzip2q_s16(v82, v83);
        v88 = (int32x4_t)vaddq_s16(v86, v84);
        v89 = (int32x4_t)vsubq_s16(v84, v86);
        v90 = (int32x4_t)vaddq_s16(v87, v85);
        v91 = (int32x4_t)vsubq_s16(v85, v87);
        v92 = (int16x8_t)vzip1q_s32(v88, v89);
        v93 = (int16x8_t)vzip2q_s32(v88, v89);
        v94 = (int16x8_t)vzip1q_s32(v90, v91);
        v95 = (int16x8_t)vzip2q_s32(v90, v91);
        v96 = (uint16x8_t)vaddq_s16(vaddq_s16(v79, v78), vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(vaddq_s16(v94, v92)), (uint16x8_t)vabsq_s16(vaddq_s16(v95, v93))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(vsubq_s16(v92, v94)), (uint16x8_t)vabsq_s16(vsubq_s16(v93, v95)))));
        v47 = (int32x4_t)vaddw_u16((uint32x4_t)v47, *(uint16x4_t *)v96.i8);
        v46 = (int32x4_t)vaddw_high_u16((uint32x4_t)v46, v96);
        v48 += 32;
      }
      a3 = (int16x8_t *)((char *)a3 + v38);
      v39 += v38;
      v40 += v38;
      v41 += v38;
      v42 += v43;
      v44 += v43;
      v45 += v43;
      a5 = (int16x8_t *)((char *)a5 + v43);
      a2 -= 4;
    }
    while (a2);
    return COERCE_FLOAT(vaddvq_s32(vaddq_s32(v47, v46)));
  }
  else
  {
    v6 = 2 * a4;
    v7 = 2 * a6;
    v8 = a2 + 4;
    v9 = 0uLL;
    do
    {
      v10 = (int16x8_t *)((char *)a3 + v6 + v6);
      v11 = *v10;
      v12 = (int16x8_t *)((char *)v10 + v6);
      v13 = (int16x8_t *)((char *)a5 + v7 + v7);
      v14 = *v13;
      v15 = (int16x8_t *)((char *)v13 + v7);
      v16 = vsubq_s16(*a3, *a5);
      v17 = vsubq_s16(*(int16x8_t *)((char *)a3 + 2 * a4), *(int16x8_t *)((char *)a5 + 2 * a6));
      v18 = vsubq_s16(v11, v14);
      v19 = vsubq_s16(*v12, *v15);
      v20 = vaddq_s16(v17, v16);
      v21 = vsubq_s16(v16, v17);
      v22 = vaddq_s16(v19, v18);
      v23 = vsubq_s16(v18, v19);
      v24 = vzip1q_s16(v20, v21);
      v25 = vzip2q_s16(v20, v21);
      v26 = vzip1q_s16(v22, v23);
      v27 = vzip2q_s16(v22, v23);
      v28 = (int32x4_t)vaddq_s16(v26, v24);
      v29 = (int32x4_t)vsubq_s16(v24, v26);
      v30 = (int32x4_t)vaddq_s16(v27, v25);
      v31 = (int32x4_t)vsubq_s16(v25, v27);
      v32 = (int16x8_t)vzip1q_s32(v28, v29);
      v33 = (int16x8_t)vzip2q_s32(v28, v29);
      v34 = (int16x8_t)vzip1q_s32(v30, v31);
      v35 = (int16x8_t)vzip2q_s32(v30, v31);
      v9 = vaddq_s16(vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(vaddq_s16(v34, v32)), (uint16x8_t)vabsq_s16(vaddq_s16(v35, v33))), v9), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(vsubq_s16(v32, v34)), (uint16x8_t)vabsq_s16(vsubq_s16(v33, v35))));
      v8 -= 4;
      a3 = (int16x8_t *)((char *)v12 + v6);
      a5 = (int16x8_t *)((char *)v15 + v7);
    }
    while (v8 > 4);
    return COERCE_FLOAT(vaddlvq_u16((uint16x8_t)v9));
  }
}

float sub_1C98177E4(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
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
  int32x2_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  int16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  int16x8_t v28;
  int16x8_t v29;
  int16x8_t v30;
  int16x8_t v31;
  int16x8_t v32;
  int16x8_t v33;
  int16x8_t v34;
  int16x8_t v35;
  int16x8_t v36;
  int16x8_t v37;
  int16x8_t v38;
  int16x8_t v39;
  int16x8_t v40;
  int16x8_t v41;
  int16x8_t v42;
  int16x8_t v43;
  int16x8_t v44;
  int16x8_t v45;
  int16x8_t v46;
  int16x8_t v47;
  int16x8_t v48;
  int32x4_t v49;
  int32x4_t v50;
  int32x4_t v51;
  int32x4_t v52;
  int16x8_t v53;
  int16x8_t v54;
  int16x8_t v55;
  int16x8_t v56;
  int16x8_t v57;
  int16x8_t v58;
  int16x8_t v59;
  int16x8_t v60;
  int16x8_t v61;
  int16x8_t v62;
  int16x8_t v63;
  int16x8_t v64;
  int16x8_t v65;
  int16x8_t v66;
  int16x8_t v67;
  int16x8_t v68;
  int16x8_t v69;
  int16x8_t v70;
  int32x4_t v71;
  int32x4_t v72;
  int32x4_t v73;
  int32x4_t v74;
  int16x8_t v75;
  int16x8_t v76;
  int16x8_t v77;
  int16x8_t v78;
  int16x8_t v79;
  int16x8_t v80;
  int16x8_t v81;
  int16x8_t v82;
  int16x8_t v83;
  int16x8_t v84;
  int16x8_t v85;
  int16x8_t v86;
  int16x8_t v87;
  int16x8_t v88;
  int16x8_t v89;
  int16x8_t v90;
  int16x8_t v91;
  int16x8_t v92;
  int16x8_t v93;
  int16x8_t v94;
  int16x8_t v95;
  int16x8_t v96;
  int32x4_t v97;
  int32x4_t v98;
  int16x8_t v99;
  int32x4_t v100;
  int32x4_t v101;
  int16x8_t v102;
  int16x8_t v103;
  int16x8_t v104;
  int16x8_t v105;
  int16x8_t v106;
  int16x8_t v107;
  int16x8_t v108;
  int16x8_t v109;
  int16x8_t v110;
  int16x8_t v111;
  int16x8_t v112;
  int16x8_t v113;
  int16x8_t v114;
  int16x8_t v115;
  int16x8_t v116;
  int16x8_t v117;
  int16x8_t v118;
  int16x8_t v119;
  int16x8_t v120;
  int16x8_t v121;
  int16x8_t v122;
  int16x8_t v123;
  int16x8_t v124;
  int16x8_t v125;
  int32x4_t v126;
  int32x4_t v127;
  int32x4_t v128;
  int16x8_t v129;
  int32x4_t v130;
  int16x8_t v131;
  int16x8_t v132;
  int16x8_t v133;
  int16x8_t v134;
  int16x8_t v135;
  int16x8_t v136;
  int16x8_t v137;
  int16x8_t v138;
  int16x8_t v139;
  int16x8_t v140;
  int16x8_t v141;
  int16x8_t v142;
  int16x8_t v143;
  int16x8_t v144;
  int32x4_t v145;
  BOOL v146;
  float result;

  v6 = 16 * a4;
  v7 = a3 + 2 * a4 + 16;
  v8 = a3 + 4 * a4 + 16;
  v9 = a3 + 6 * a4 + 16;
  v10 = a5 + 14 * a6;
  v11 = 16 * a6;
  v12 = a5 + 12 * a6;
  v13 = a5 + 10 * a6;
  v14 = a3 + 8 * a4 + 16;
  v15 = 0;
  v16 = a3 + 10 * a4 + 16;
  v17 = a3 + 12 * a4 + 16;
  v18 = a3 + 14 * a4 + 16;
  v19 = a5 + 8 * a6;
  v20 = a5 + 6 * a6;
  v21 = a5 + 4 * a6;
  v22 = a5 + 2 * a6;
  do
  {
    if (a1 >= 1)
    {
      v23 = 0;
      for (i = 0; i < a1; i += 8)
      {
        v25 = vsubq_s16(*(int16x8_t *)(a3 + v23), *(int16x8_t *)(a5 + v23));
        v26 = vsubq_s16(*(int16x8_t *)(a3 + v23 + 16), *(int16x8_t *)(a5 + v23 + 16));
        v27 = vsubq_s16(*(int16x8_t *)(v7 + v23 - 16), *(int16x8_t *)(v22 + v23));
        v28 = vsubq_s16(*(int16x8_t *)(v7 + v23), *(int16x8_t *)(v22 + v23 + 16));
        v29 = vsubq_s16(*(int16x8_t *)(v8 + v23 - 16), *(int16x8_t *)(v21 + v23));
        v30 = vsubq_s16(*(int16x8_t *)(v8 + v23), *(int16x8_t *)(v21 + v23 + 16));
        v31 = vsubq_s16(*(int16x8_t *)(v9 + v23 - 16), *(int16x8_t *)(v20 + v23));
        v32 = vsubq_s16(*(int16x8_t *)(v9 + v23), *(int16x8_t *)(v20 + v23 + 16));
        v33 = vsubq_s16(*(int16x8_t *)(v14 + v23 - 16), *(int16x8_t *)(v19 + v23));
        v34 = vsubq_s16(*(int16x8_t *)(v14 + v23), *(int16x8_t *)(v19 + v23 + 16));
        v35 = vsubq_s16(*(int16x8_t *)(v16 + v23 - 16), *(int16x8_t *)(v13 + v23));
        v36 = vsubq_s16(*(int16x8_t *)(v16 + v23), *(int16x8_t *)(v13 + v23 + 16));
        v37 = vsubq_s16(*(int16x8_t *)(v17 + v23 - 16), *(int16x8_t *)(v12 + v23));
        v38 = vsubq_s16(*(int16x8_t *)(v17 + v23), *(int16x8_t *)(v12 + v23 + 16));
        v39 = vsubq_s16(*(int16x8_t *)(v18 + v23 - 16), *(int16x8_t *)(v10 + v23));
        v40 = vsubq_s16(*(int16x8_t *)(v18 + v23), *(int16x8_t *)(v10 + v23 + 16));
        v41 = vaddq_s16(v27, v25);
        v42 = vsubq_s16(v25, v27);
        v43 = vaddq_s16(v31, v29);
        v44 = vsubq_s16(v29, v31);
        v45 = vzip1q_s16(v41, v42);
        v46 = vzip2q_s16(v41, v42);
        v47 = vzip1q_s16(v43, v44);
        v48 = vzip2q_s16(v43, v44);
        v49 = (int32x4_t)vaddq_s16(v47, v45);
        v50 = (int32x4_t)vsubq_s16(v45, v47);
        v51 = (int32x4_t)vaddq_s16(v48, v46);
        v52 = (int32x4_t)vsubq_s16(v46, v48);
        v53 = (int16x8_t)vzip1q_s32(v49, v50);
        v54 = (int16x8_t)vzip2q_s32(v49, v50);
        v55 = (int16x8_t)vzip1q_s32(v51, v52);
        v56 = (int16x8_t)vzip2q_s32(v51, v52);
        v57 = vaddq_s16(v54, v53);
        v58 = vsubq_s16(v53, v54);
        v59 = vaddq_s16(v56, v55);
        v60 = vsubq_s16(v55, v56);
        v61 = vaddq_s16(v28, v26);
        v62 = vsubq_s16(v26, v28);
        v63 = vaddq_s16(v57, v59);
        v64 = vaddq_s16(v32, v30);
        v65 = vsubq_s16(v30, v32);
        v66 = vzip1q_s16(v61, v62);
        v67 = vzip2q_s16(v61, v62);
        v68 = vzip1q_s16(v64, v65);
        v69 = vsubq_s16(v57, v59);
        v70 = vzip2q_s16(v64, v65);
        v71 = (int32x4_t)vaddq_s16(v68, v66);
        v72 = (int32x4_t)vsubq_s16(v66, v68);
        v73 = (int32x4_t)vaddq_s16(v70, v67);
        v74 = (int32x4_t)vsubq_s16(v67, v70);
        v75 = vaddq_s16(v60, v58);
        v76 = (int16x8_t)vzip1q_s32(v71, v72);
        v77 = (int16x8_t)vzip2q_s32(v71, v72);
        v78 = (int16x8_t)vzip1q_s32(v73, v74);
        v79 = (int16x8_t)vzip2q_s32(v73, v74);
        v80 = vaddq_s16(v77, v76);
        v81 = vsubq_s16(v58, v60);
        v82 = vsubq_s16(v76, v77);
        v83 = vaddq_s16(v79, v78);
        v84 = vsubq_s16(v78, v79);
        v85 = vaddq_s16(v80, v83);
        v86 = vsubq_s16(v80, v83);
        v87 = vaddq_s16(v84, v82);
        v88 = vaddq_s16(v35, v33);
        v89 = vsubq_s16(v33, v35);
        v90 = vaddq_s16(v39, v37);
        v91 = vsubq_s16(v37, v39);
        v92 = vzip1q_s16(v88, v89);
        v93 = vsubq_s16(v82, v84);
        v94 = vzip2q_s16(v88, v89);
        v95 = vzip1q_s16(v90, v91);
        v96 = vzip2q_s16(v90, v91);
        v97 = (int32x4_t)vaddq_s16(v95, v92);
        v98 = (int32x4_t)vsubq_s16(v92, v95);
        v99 = vaddq_s16(v85, v63);
        v100 = (int32x4_t)vaddq_s16(v96, v94);
        v101 = (int32x4_t)vsubq_s16(v94, v96);
        v102 = (int16x8_t)vzip1q_s32(v97, v98);
        v103 = (int16x8_t)vzip2q_s32(v97, v98);
        v104 = (int16x8_t)vzip1q_s32(v100, v101);
        v105 = vsubq_s16(v63, v85);
        v106 = (int16x8_t)vzip2q_s32(v100, v101);
        v107 = vaddq_s16(v103, v102);
        v108 = vsubq_s16(v102, v103);
        v109 = vaddq_s16(v106, v104);
        v110 = vsubq_s16(v104, v106);
        v111 = vaddq_s16(v87, v75);
        v112 = vaddq_s16(v107, v109);
        v113 = vsubq_s16(v107, v109);
        v114 = vaddq_s16(v110, v108);
        v115 = vsubq_s16(v108, v110);
        v116 = vaddq_s16(v36, v34);
        v117 = vsubq_s16(v75, v87);
        v118 = vsubq_s16(v34, v36);
        v119 = vaddq_s16(v40, v38);
        v120 = vsubq_s16(v38, v40);
        v121 = vzip1q_s16(v116, v118);
        v122 = vzip2q_s16(v116, v118);
        v123 = vaddq_s16(v86, v69);
        v124 = vzip1q_s16(v119, v120);
        v125 = vzip2q_s16(v119, v120);
        v126 = (int32x4_t)vaddq_s16(v124, v121);
        v127 = (int32x4_t)vsubq_s16(v121, v124);
        v128 = (int32x4_t)vaddq_s16(v125, v122);
        v129 = vsubq_s16(v69, v86);
        v130 = (int32x4_t)vsubq_s16(v122, v125);
        v131 = (int16x8_t)vzip1q_s32(v126, v127);
        v132 = (int16x8_t)vzip2q_s32(v126, v127);
        v133 = (int16x8_t)vzip1q_s32(v128, v130);
        v134 = (int16x8_t)vzip2q_s32(v128, v130);
        v135 = vaddq_s16(v93, v81);
        v136 = vaddq_s16(v132, v131);
        v137 = vsubq_s16(v131, v132);
        v138 = vaddq_s16(v134, v133);
        v139 = vsubq_s16(v133, v134);
        v140 = vaddq_s16(v136, v138);
        v141 = vsubq_s16(v81, v93);
        v142 = vsubq_s16(v136, v138);
        v143 = vaddq_s16(v139, v137);
        v144 = vsubq_s16(v137, v139);
        v145 = (int32x4_t)vpaddlq_u16((uint16x8_t)vaddq_s16(vaddq_s16(vaddq_s16(vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v105), (uint16x8_t)vabsq_s16(vsubq_s16(v112, v140))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v99), (uint16x8_t)vabsq_s16(vaddq_s16(v140, v112)))), vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v111), (uint16x8_t)vabsq_s16(vaddq_s16(v143, v114))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v117), (uint16x8_t)vabsq_s16(vsubq_s16(v114, v143))))), vaddq_s16(vaddq_s16((int16x8_t)vmaxq_u16(
                                                                       (uint16x8_t)vabsq_s16(v123),
                                                                       (uint16x8_t)vabsq_s16(vaddq_s16(v142, v113))),
                                                          (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v129), (uint16x8_t)vabsq_s16(vsubq_s16(v113, v142)))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v135), (uint16x8_t)vabsq_s16(vaddq_s16(v144, v115))))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v141), (uint16x8_t)vabsq_s16(vsubq_s16(v115, v144)))));
        v23 += 32;
        v15 = (int32x2_t)vrsra_n_u32((uint32x2_t)v15, (uint32x2_t)*(_OWORD *)&vpaddq_s32(v145, v145), 1uLL);
      }
    }
    a3 += v6;
    v7 += v6;
    v8 += v6;
    v9 += v6;
    v10 += v11;
    v12 += v11;
    v13 += v11;
    v19 += v11;
    v14 += v6;
    v16 += v6;
    v17 += v6;
    v18 += v6;
    v20 += v11;
    v21 += v11;
    v22 += v11;
    a5 += v11;
    v146 = __OFSUB__(a2, 8);
    a2 -= 8;
  }
  while (!((a2 < 0) ^ v146 | (a2 == 0)));
  LODWORD(result) = vpadd_s32(v15, v15).u32[0];
  return result;
}

float sub_1C9817C0C(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int32x2_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  unsigned int v13;
  uint64_t v14;
  int16x8_t *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  int16x8_t *v19;
  int16x8_t v20;
  int16x8_t v21;
  int16x8_t v22;
  int16x8_t v23;
  int16x8_t v24;
  int16x8_t v25;
  int16x8_t *v26;
  int16x8_t v27;
  int16x8_t v28;
  int16x8_t v29;
  int16x8_t v30;
  int16x8_t v31;
  int16x8_t v32;
  int16x8_t v33;
  int16x8_t v34;
  int16x8_t v35;
  int16x8_t v36;
  int16x8_t v37;
  int16x8_t v38;
  int16x8_t v39;
  int16x8_t v40;
  int16x8_t v41;
  int16x8_t v42;
  int16x8_t v43;
  int16x8_t v44;
  int16x8_t v45;
  int16x8_t v46;
  int16x8_t v47;
  int32x4_t v48;
  int32x4_t v49;
  int32x4_t v50;
  int32x4_t v51;
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
  int16x8_t v62;
  int16x8_t v63;
  int16x8_t v64;
  int16x8_t v65;
  int16x8_t v66;
  int16x8_t v67;
  int16x8_t v68;
  int16x8_t v69;
  int16x8_t v70;
  int16x8_t v71;
  int32x4_t v72;
  int32x4_t v73;
  int32x4_t v74;
  int32x4_t v75;
  int16x8_t v76;
  int16x8_t v77;
  int16x8_t v78;
  int16x8_t v79;
  int16x8_t v80;
  int16x8_t v81;
  int16x8_t v82;
  int16x8_t v83;
  int16x8_t v84;
  int16x8_t v85;
  int16x8_t v86;
  int16x8_t v87;
  BOOL v88;
  uint64_t v89;
  int32x4_t v90;
  int16x8_t v91;
  int16x8_t v92;
  int16x8_t v93;
  int16x8_t v94;
  int16x8_t v95;
  int16x8_t v96;
  int16x8_t v97;
  int32x4_t v98;
  int32x4_t v99;
  int16x8_t v100;
  int32x4_t v101;
  int32x4_t v102;
  int32x4_t v103;
  int32x4_t v104;
  int32x4_t v105;
  int32x4_t v106;
  int32x4_t v107;
  int32x4_t v108;
  int32x4_t v109;
  int32x4_t v110;
  int32x4_t v111;
  int32x4_t v112;
  int32x4_t v113;
  int32x4_t v114;
  BOOL v115;
  float result;
  _BYTE v117[1032];
  uint64_t v118;

  v6 = 16 * a6;
  v7 = 2 * a6;
  v118 = *MEMORY[0x1E0C80C00];
  v8 = 4 * a6;
  v9 = 0;
  v10 = 4 * a6;
  v11 = 6 * a6;
  do
  {
    if (a1 >= 1)
    {
      for (i = 0; i < a1; i += 16)
      {
        v13 = 0;
        v14 = a3 + 4 * i;
        v15 = (int16x8_t *)v117;
        v16 = a5 + 4 * i;
        do
        {
          v17 = 0;
          v18 = 1;
          do
          {
            v19 = (int16x8_t *)(v14 + 2 * v17);
            v20 = *v19;
            v21 = *(int16x8_t *)((char *)v19 + 2 * a4);
            v22 = *(int16x8_t *)((char *)v19 + 4 * a4);
            v23 = *(int16x8_t *)((char *)v19 + 6 * a4);
            v24 = v19[1];
            ++v19;
            v25 = v24;
            v26 = (int16x8_t *)(v16 + 2 * v17);
            v27 = *v26;
            v28 = *(int16x8_t *)((char *)v26 + v7);
            v29 = *(int16x8_t *)((char *)v26 + v10);
            v30 = *(int16x8_t *)((char *)v26 + v11);
            v31 = v26[1];
            ++v26;
            v32 = vsubq_s16(v20, v27);
            v33 = vsubq_s16(v25, v31);
            v34 = vsubq_s16(v21, v28);
            v35 = vsubq_s16(*(int16x8_t *)((char *)v19 + 2 * a4), *(int16x8_t *)((char *)v26 + v7));
            v36 = vsubq_s16(v22, v29);
            v37 = vsubq_s16(*(int16x8_t *)((char *)v19 + 4 * a4), *(int16x8_t *)((char *)v26 + v10));
            v38 = vsubq_s16(v23, v30);
            v39 = vsubq_s16(*(int16x8_t *)((char *)v19 + 6 * a4), *(int16x8_t *)((char *)v26 + v11));
            v40 = vaddq_s16(v34, v32);
            v41 = vsubq_s16(v32, v34);
            v42 = vaddq_s16(v38, v36);
            v43 = vsubq_s16(v36, v38);
            v44 = vzip1q_s16(v40, v41);
            v45 = vzip2q_s16(v40, v41);
            v46 = vzip1q_s16(v42, v43);
            v47 = vzip2q_s16(v42, v43);
            v48 = (int32x4_t)vaddq_s16(v46, v44);
            v49 = (int32x4_t)vsubq_s16(v44, v46);
            v50 = (int32x4_t)vaddq_s16(v47, v45);
            LOBYTE(v19) = v18;
            v51 = (int32x4_t)vsubq_s16(v45, v47);
            v52 = (int16x8_t)vzip1q_s32(v48, v49);
            v53 = (int16x8_t)vzip2q_s32(v48, v49);
            v54 = (int16x8_t)vzip1q_s32(v50, v51);
            v55 = (int16x8_t)vzip2q_s32(v50, v51);
            v56 = vaddq_s16(v53, v52);
            v57 = vsubq_s16(v52, v53);
            v58 = vaddq_s16(v55, v54);
            v59 = vsubq_s16(v54, v55);
            v60 = vaddq_s16(v56, v58);
            v61 = vsubq_s16(v56, v58);
            v62 = vaddq_s16(v59, v57);
            v63 = vsubq_s16(v57, v59);
            v64 = vaddq_s16(v35, v33);
            v65 = vsubq_s16(v33, v35);
            v66 = vaddq_s16(v39, v37);
            v67 = vsubq_s16(v37, v39);
            v68 = vzip1q_s16(v64, v65);
            v69 = vzip2q_s16(v64, v65);
            v70 = vzip1q_s16(v66, v67);
            v71 = vzip2q_s16(v66, v67);
            v72 = (int32x4_t)vaddq_s16(v70, v68);
            v73 = (int32x4_t)vsubq_s16(v68, v70);
            v74 = (int32x4_t)vaddq_s16(v71, v69);
            v75 = (int32x4_t)vsubq_s16(v69, v71);
            v76 = (int16x8_t)vzip1q_s32(v72, v73);
            v77 = (int16x8_t)vzip2q_s32(v72, v73);
            v78 = (int16x8_t)vzip1q_s32(v74, v75);
            v79 = (int16x8_t)vzip2q_s32(v74, v75);
            v80 = vaddq_s16(v77, v76);
            v81 = vsubq_s16(v76, v77);
            v82 = vaddq_s16(v79, v78);
            v83 = vsubq_s16(v78, v79);
            v84 = vaddq_s16(v80, v82);
            v85 = vsubq_s16(v80, v82);
            v86 = vaddq_s16(v83, v81);
            *v15 = vaddq_s16(v84, v60);
            v15[1] = vaddq_s16(v86, v62);
            v87 = vsubq_s16(v81, v83);
            v15[2] = vaddq_s16(v85, v61);
            v15[3] = vaddq_s16(v87, v63);
            v15[4] = vsubq_s16(v60, v84);
            v15[5] = vsubq_s16(v62, v86);
            v15[6] = vsubq_s16(v61, v85);
            v15[7] = vsubq_s16(v63, v87);
            v15 += 8;
            v17 = 16;
            v18 = 0;
          }
          while ((v19 & 1) != 0);
          v14 += 8 * a4;
          v16 += 2 * v8;
          v88 = v13 >= 0xC;
          v13 += 4;
        }
        while (!v88);
        v89 = 0;
        v90 = 0uLL;
        do
        {
          v91 = *(int16x8_t *)&v117[v89];
          v92 = *(int16x8_t *)&v117[v89 + 128];
          v93 = *(int16x8_t *)&v117[v89 + 256];
          v94 = *(int16x8_t *)&v117[v89 + 384];
          v95 = *(int16x8_t *)&v117[v89 + 512];
          v96 = *(int16x8_t *)&v117[v89 + 640];
          v97 = *(int16x8_t *)&v117[v89 + 768];
          v98 = vaddl_s16(*(int16x4_t *)v93.i8, *(int16x4_t *)v91.i8);
          v99 = vaddl_high_s16(v93, v91);
          v100 = *(int16x8_t *)&v117[v89 + 896];
          v101 = vaddl_s16(*(int16x4_t *)v94.i8, *(int16x4_t *)v92.i8);
          v102 = vaddl_high_s16(v94, v92);
          v103 = vsubl_s16(*(int16x4_t *)v91.i8, *(int16x4_t *)v93.i8);
          v104 = vsubl_high_s16(v91, v93);
          v105 = vsubl_s16(*(int16x4_t *)v92.i8, *(int16x4_t *)v94.i8);
          v106 = vsubl_high_s16(v92, v94);
          v107 = vaddl_s16(*(int16x4_t *)v97.i8, *(int16x4_t *)v95.i8);
          v108 = vaddl_high_s16(v97, v95);
          v109 = vaddl_s16(*(int16x4_t *)v100.i8, *(int16x4_t *)v96.i8);
          v110 = vaddl_high_s16(v100, v96);
          v111 = vsubl_s16(*(int16x4_t *)v95.i8, *(int16x4_t *)v97.i8);
          v112 = vsubl_high_s16(v95, v97);
          v113 = vsubl_s16(*(int16x4_t *)v96.i8, *(int16x4_t *)v100.i8);
          v114 = vsubl_high_s16(v96, v100);
          v90 = vaddq_s32(vaddq_s32(vaddq_s32(vaddq_s32((int32x4_t)vmaxq_u32((uint32x4_t)vabsq_s32(vaddq_s32(v107, v98)), (uint32x4_t)vabsq_s32(vaddq_s32(v109, v101))), v90), vaddq_s32((int32x4_t)vmaxq_u32((uint32x4_t)vabsq_s32(vaddq_s32(v111, v103)), (uint32x4_t)vabsq_s32(vaddq_s32(v113, v105))), (int32x4_t)vmaxq_u32((uint32x4_t)vabdq_s32(v98, v107), (uint32x4_t)vabdq_s32(v101, v109)))), vaddq_s32(vaddq_s32((int32x4_t)vmaxq_u32((uint32x4_t)vabdq_s32(v103, v111), (uint32x4_t)vabdq_s32(v105, v113)), (int32x4_t)vmaxq_u32((uint32x4_t)vabsq_s32(vaddq_s32(v108, v99)), (uint32x4_t)vabsq_s32(vaddq_s32(v110, v102)))), (int32x4_t)vmaxq_u32(
                                   (uint32x4_t)vabsq_s32(vaddq_s32(v112, v104)),
                                   (uint32x4_t)vabsq_s32(vaddq_s32(v114, v106))))),
                  vaddq_s32((int32x4_t)vmaxq_u32((uint32x4_t)vabdq_s32(v99, v108), (uint32x4_t)vabdq_s32(v102, v110)), (int32x4_t)vmaxq_u32((uint32x4_t)vabdq_s32(v104, v112), (uint32x4_t)vabdq_s32(v106, v114))));
          v89 += 16;
        }
        while (v89 != 128);
        v9 = (int32x2_t)vrsra_n_u32((uint32x2_t)v9, (uint32x2_t)*(_OWORD *)&vpaddq_s32(v90, v90), 2uLL);
      }
    }
    a3 += 32 * a4;
    a5 += 2 * v6;
    v115 = __OFSUB__(a2, 16);
    a2 -= 16;
  }
  while (!((a2 < 0) ^ v115 | (a2 == 0)));
  LODWORD(result) = vpadd_s32(v9, v9).u32[0];
  return result;
}

uint64x2_t sub_1C9817FA0(int16x8_t *a1, uint64_t a2, int16x8_t *a3, uint64_t a4, int a5, int a6, uint64x2_t *a7)
{
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  int16x8_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  unsigned int v19;
  int16x8_t v20;
  int16x8_t v21;
  int16x8_t v22;
  int16x8_t v23;
  int16x8_t v24;
  int16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  int16x8_t v28;
  int16x8_t v29;
  int32x4_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int8 *v35;
  __int8 *v36;
  uint64_t v37;
  uint64_t v38;
  int16x8_t v39;
  int16x8_t v40;
  int16x8_t v41;
  int16x8_t v42;
  int32x4_t v43;
  int32x4_t v44;
  int32x4_t v45;
  int32x4_t v46;
  int32x4_t v47;
  int32x4_t v48;
  int32x4_t v49;
  int32x4_t v50;
  uint64_t v51;
  uint64_t v52;
  unsigned int v53;
  int16x8_t v54;
  int16x8_t v55;
  int16x8_t v56;
  int16x8_t v57;
  BOOL v58;
  uint64x2_t result;

  if (a5 == 4)
  {
    v7 = vsubq_s16(*a1, *a3);
    v8 = vsubq_s16(*(int16x8_t *)((char *)a1 + 2 * a2), *(int16x8_t *)((char *)a3 + 2 * a4));
    v9 = vsubq_s16(*(int16x8_t *)((char *)a1 + 4 * a2), *(int16x8_t *)((char *)a3 + 4 * a4));
    v10 = vsubq_s16(*(int16x8_t *)((char *)a1 + 6 * a2), *(int16x8_t *)((char *)a3 + 6 * a4));
    v11 = vmull_s16(*(int16x4_t *)v7.i8, *(int16x4_t *)v7.i8);
    v12 = vmull_s16(*(int16x4_t *)v8.i8, *(int16x4_t *)v8.i8);
    v13 = vmull_s16(*(int16x4_t *)v9.i8, *(int16x4_t *)v9.i8);
    v14 = vmull_s16(*(int16x4_t *)v10.i8, *(int16x4_t *)v10.i8);
    v15 = vmull_high_s16(v7, v7);
    v16 = vmull_high_s16(v8, v8);
    v17 = vmull_high_s16(v9, v9);
    v18 = vmull_high_s16(v10, v10);
    if (a6 >= 5)
    {
      v19 = a6 + 4;
      do
      {
        v20 = *(int16x8_t *)((char *)a1 + 10 * a2);
        v21 = *(int16x8_t *)((char *)a1 + 12 * a2);
        v22 = *(int16x8_t *)((char *)a1 + 14 * a2);
        v23 = *(int16x8_t *)((char *)a3 + 10 * a4);
        a1 = (int16x8_t *)((char *)a1 + 8 * a2);
        v24 = *(int16x8_t *)((char *)a3 + 12 * a4);
        v25 = *(int16x8_t *)((char *)a3 + 14 * a4);
        a3 = (int16x8_t *)((char *)a3 + 8 * a4);
        v26 = vsubq_s16(*a1, *a3);
        v27 = vsubq_s16(v20, v23);
        v28 = vsubq_s16(v21, v24);
        v29 = vsubq_s16(v22, v25);
        v11 = vmlal_s16(v11, *(int16x4_t *)v26.i8, *(int16x4_t *)v26.i8);
        v12 = vmlal_s16(v12, *(int16x4_t *)v27.i8, *(int16x4_t *)v27.i8);
        v13 = vmlal_s16(v13, *(int16x4_t *)v28.i8, *(int16x4_t *)v28.i8);
        v14 = vmlal_s16(v14, *(int16x4_t *)v29.i8, *(int16x4_t *)v29.i8);
        v15 = vmlal_high_s16(v15, v26, v26);
        v16 = vmlal_high_s16(v16, v27, v27);
        v17 = vmlal_high_s16(v17, v28, v28);
        v18 = vmlal_high_s16(v18, v29, v29);
        v19 -= 4;
      }
      while (v19 > 8);
    }
    v30 = vaddq_s32(vaddq_s32(vaddq_s32(vaddq_s32(v12, v14), vaddq_s32(v11, v13)), vaddq_s32(vaddq_s32(v15, v16), v17)), v18);
  }
  else
  {
    v31 = 4 * a4;
    v32 = (uint64_t)a3[1].i64 + 4 * a4;
    v33 = (uint64_t)a1[1].i64 + 6 * a2;
    v34 = 4 * a2;
    v35 = &a3->i8[6 * a4];
    v36 = &a1->i8[4 * a2];
    v30 = 0uLL;
    v37 = 2 * a2;
    v38 = 2 * a4;
    do
    {
      v39 = vsubq_s16(*a1, *a3);
      v40 = vsubq_s16(a1[1], a3[1]);
      v41 = vsubq_s16(*(int16x8_t *)((char *)a1 + v37), *(int16x8_t *)((char *)a3 + v38));
      v42 = vsubq_s16(*(int16x8_t *)((char *)a1 + v37 + 16), *(int16x8_t *)((char *)a3 + v38 + 16));
      v43 = vmull_s16(*(int16x4_t *)v39.i8, *(int16x4_t *)v39.i8);
      v44 = vmull_s16(*(int16x4_t *)v40.i8, *(int16x4_t *)v40.i8);
      v45 = vmull_s16(*(int16x4_t *)v41.i8, *(int16x4_t *)v41.i8);
      v46 = vmull_s16(*(int16x4_t *)v42.i8, *(int16x4_t *)v42.i8);
      v47 = vmull_high_s16(v39, v39);
      v48 = vmull_high_s16(v40, v40);
      v49 = vmull_high_s16(v41, v41);
      v50 = vmull_high_s16(v42, v42);
      if (a6 >= 3)
      {
        v51 = 0;
        v52 = 0;
        v53 = a6 + 2;
        do
        {
          v54 = vsubq_s16(*(int16x8_t *)&v36[v51], *(int16x8_t *)(v32 + v52 - 16));
          v55 = vsubq_s16(*(int16x8_t *)&v36[v51 + 16], *(int16x8_t *)(v32 + v52));
          v56 = vsubq_s16(*(int16x8_t *)(v33 + v51 - 16), *(int16x8_t *)&v35[v52]);
          v57 = vsubq_s16(*(int16x8_t *)(v33 + v51), *(int16x8_t *)&v35[v52 + 16]);
          v43 = vmlal_s16(v43, *(int16x4_t *)v54.i8, *(int16x4_t *)v54.i8);
          v44 = vmlal_s16(v44, *(int16x4_t *)v55.i8, *(int16x4_t *)v55.i8);
          v45 = vmlal_s16(v45, *(int16x4_t *)v56.i8, *(int16x4_t *)v56.i8);
          v46 = vmlal_s16(v46, *(int16x4_t *)v57.i8, *(int16x4_t *)v57.i8);
          v47 = vmlal_high_s16(v47, v54, v54);
          v48 = vmlal_high_s16(v48, v55, v55);
          v49 = vmlal_high_s16(v49, v56, v56);
          v50 = vmlal_high_s16(v50, v57, v57);
          v53 -= 2;
          v52 += v31;
          v51 += v34;
        }
        while (v53 > 4);
      }
      a1 += 2;
      a3 += 2;
      v32 += 32;
      v30 = vaddq_s32(vaddq_s32(vaddq_s32(v43, v45), vaddq_s32(vaddq_s32(v30, v44), v46)), vaddq_s32(vaddq_s32(vaddq_s32(v47, v48), v49), v50));
      v33 += 32;
      v35 += 32;
      v36 += 32;
      v58 = __OFSUB__(a5, 8);
      a5 -= 8;
    }
    while (!((a5 < 0) ^ v58 | (a5 == 0)));
  }
  result = vpaddlq_u32((uint32x4_t)vqtbl1q_s8((int8x16_t)v30, (int8x16_t)xmmword_1C9863010));
  *a7 = result;
  return result;
}

uint64_t sub_1C9818244(uint64_t a1, int a2, int16x4_t *a3, uint64_t a4, int16x4_t *a5, uint64_t a6)
{
  int v6;
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  int16x8_t v10;
  int16x8_t v11;
  int16x8_t v12;
  int16x8_t v13;
  int16x8_t v14;
  int64x2_t v15;
  int16x8_t v16;
  int32x4_t v17;
  int32x4_t v18;

  v6 = a2 + 4;
  v7 = 0uLL;
  do
  {
    *(int16x4_t *)v8.i8 = vsub_s16(*a3, *a5);
    *(int16x4_t *)v9.i8 = vsub_s16(*(int16x4_t *)((char *)a3 + 2 * a4), *(int16x4_t *)((char *)a5 + 2 * a6));
    v8.u64[1] = (unint64_t)vsub_s16(*(int16x4_t *)((char *)a3 + 4 * a4), *(int16x4_t *)((char *)a5 + 4 * a6));
    v9.u64[1] = (unint64_t)vsub_s16(*(int16x4_t *)((char *)a3 + 6 * a4), *(int16x4_t *)((char *)a5 + 6 * a6));
    v10 = vaddq_s16(v9, v8);
    v11 = vsubq_s16(v8, v9);
    v12 = vtrn1q_s16(v10, v11);
    v13 = vtrn2q_s16(v10, v11);
    v14 = vaddq_s16(v13, v12);
    v15 = (int64x2_t)vsubq_s16(v12, v13);
    v16 = (int16x8_t)vzip2q_s64((int64x2_t)v14, v15);
    v14.i64[1] = v15.i64[0];
    v17 = (int32x4_t)vaddq_s16(v16, v14);
    v18 = (int32x4_t)vsubq_s16(v14, v16);
    v7 = vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v17, v18)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v17, v18))), v7);
    a3 += a4;
    a5 += a6;
    v6 -= 4;
  }
  while (v6 > 4);
  return vaddlvq_u16((uint16x8_t)v7);
}

uint64_t sub_1C981830C(uint64_t a1, int a2, int16x8_t *a3, uint64_t a4, int16x8_t *a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int16x8_t v9;
  int16x8_t *v10;
  int16x8_t v11;
  int16x8_t *v12;
  int16x8_t *v13;
  int16x8_t v14;
  int16x8_t *v15;
  int16x8_t v16;
  int16x8_t v17;
  int16x8_t v18;
  int16x8_t v19;
  int16x8_t v20;
  int16x8_t v21;
  int16x8_t v22;
  int16x8_t v23;
  int16x8_t v24;
  int16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  int16x8_t v28;
  int16x8_t v29;
  int16x8_t v30;
  int16x8_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int32x4_t v34;
  int32x4_t v35;

  v6 = 2 * a4;
  v7 = 2 * a6;
  v8 = a2 + 4;
  v9 = 0uLL;
  do
  {
    v10 = (int16x8_t *)((char *)a3 + v6 + v6);
    v11 = *v10;
    v12 = (int16x8_t *)((char *)v10 + v6);
    v13 = (int16x8_t *)((char *)a5 + v7 + v7);
    v14 = *v13;
    v15 = (int16x8_t *)((char *)v13 + v7);
    v16 = vsubq_s16(*a3, *a5);
    v17 = vsubq_s16(*(int16x8_t *)((char *)a3 + 2 * a4), *(int16x8_t *)((char *)a5 + 2 * a6));
    v18 = vsubq_s16(v11, v14);
    v19 = vsubq_s16(*v12, *v15);
    v20 = vaddq_s16(v17, v16);
    v21 = vsubq_s16(v16, v17);
    v22 = vaddq_s16(v19, v18);
    v23 = vsubq_s16(v18, v19);
    v24 = vtrn1q_s16(v20, v21);
    v25 = vtrn2q_s16(v20, v21);
    v26 = vtrn1q_s16(v22, v23);
    v27 = vtrn2q_s16(v22, v23);
    v28 = vaddq_s16(v25, v24);
    v29 = vsubq_s16(v24, v25);
    v30 = vaddq_s16(v27, v26);
    v31 = vsubq_s16(v26, v27);
    v32 = (int32x4_t)vaddq_s16(v30, v28);
    v33 = (int32x4_t)vsubq_s16(v28, v30);
    v34 = (int32x4_t)vaddq_s16(v31, v29);
    v35 = (int32x4_t)vsubq_s16(v29, v31);
    v9 = vaddq_s16(vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v32, v33)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v32, v33))), v9), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v34, v35)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v34, v35))));
    v8 -= 4;
    a3 = (int16x8_t *)((char *)v12 + v6);
    a5 = (int16x8_t *)((char *)v15 + v7);
  }
  while (v8 > 4);
  return vaddlvq_u16((uint16x8_t)v9);
}

uint64_t sub_1C98183F4(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int32x4_t v14;
  int32x4_t v15;
  uint64_t v16;
  uint64_t i;
  int16x8_t v18;
  int16x8_t v19;
  int16x8_t v20;
  int16x8_t v21;
  int16x8_t v22;
  int16x8_t v23;
  int16x8_t v24;
  int16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  int16x8_t v28;
  int16x8_t v29;
  int16x8_t v30;
  int16x8_t v31;
  int16x8_t v32;
  int16x8_t v33;
  int16x8_t v34;
  int16x8_t v35;
  int16x8_t v36;
  int16x8_t v37;
  int16x8_t v38;
  int16x8_t v39;
  int16x8_t v40;
  int16x8_t v41;
  int16x8_t v42;
  int16x8_t v43;
  int16x8_t v44;
  int16x8_t v45;
  int16x8_t v46;
  int16x8_t v47;
  int16x8_t v48;
  int16x8_t v49;
  int32x4_t v50;
  int32x4_t v51;
  int32x4_t v52;
  int32x4_t v53;
  int32x4_t v54;
  int32x4_t v55;
  int32x4_t v56;
  int32x4_t v57;
  uint16x8_t v58;

  v6 = 8 * a4;
  v7 = a3 + 2 * a4 + 16;
  v8 = a3 + 4 * a4 + 16;
  v9 = a3 + 6 * a4 + 16;
  v10 = 8 * a6;
  v11 = a5 + 6 * a6;
  v12 = a5 + 4 * a6;
  v13 = a5 + 2 * a6;
  v14 = 0uLL;
  v15 = 0uLL;
  do
  {
    if (a1 >= 1)
    {
      v16 = 0;
      for (i = 0; i < a1; i += 16)
      {
        v18 = vsubq_s16(*(int16x8_t *)(a3 + v16), *(int16x8_t *)(a5 + v16));
        v19 = vsubq_s16(*(int16x8_t *)(a3 + v16 + 16), *(int16x8_t *)(a5 + v16 + 16));
        v20 = vsubq_s16(*(int16x8_t *)(v7 + v16 - 16), *(int16x8_t *)(v13 + v16));
        v21 = vsubq_s16(*(int16x8_t *)(v7 + v16), *(int16x8_t *)(v13 + v16 + 16));
        v22 = vsubq_s16(*(int16x8_t *)(v8 + v16 - 16), *(int16x8_t *)(v12 + v16));
        v23 = vsubq_s16(*(int16x8_t *)(v8 + v16), *(int16x8_t *)(v12 + v16 + 16));
        v24 = vsubq_s16(*(int16x8_t *)(v9 + v16 - 16), *(int16x8_t *)(v11 + v16));
        v25 = vsubq_s16(*(int16x8_t *)(v9 + v16), *(int16x8_t *)(v11 + v16 + 16));
        v26 = vaddq_s16(v20, v18);
        v27 = vaddq_s16(v21, v19);
        v28 = vsubq_s16(v18, v20);
        v29 = vsubq_s16(v19, v21);
        v30 = vaddq_s16(v24, v22);
        v31 = vaddq_s16(v25, v23);
        v32 = vsubq_s16(v22, v24);
        v33 = vsubq_s16(v23, v25);
        v34 = vtrn1q_s16(v26, v28);
        v35 = vtrn2q_s16(v26, v28);
        v36 = vtrn1q_s16(v27, v29);
        v37 = vtrn2q_s16(v27, v29);
        v38 = vtrn1q_s16(v30, v32);
        v39 = vtrn2q_s16(v30, v32);
        v40 = vtrn1q_s16(v31, v33);
        v41 = vtrn2q_s16(v31, v33);
        v42 = vaddq_s16(v35, v34);
        v43 = vaddq_s16(v37, v36);
        v44 = vsubq_s16(v34, v35);
        v45 = vsubq_s16(v36, v37);
        v46 = vaddq_s16(v39, v38);
        v47 = vaddq_s16(v41, v40);
        v48 = vsubq_s16(v38, v39);
        v49 = vsubq_s16(v40, v41);
        v50 = (int32x4_t)vaddq_s16(v46, v42);
        v51 = (int32x4_t)vaddq_s16(v47, v43);
        v52 = (int32x4_t)vsubq_s16(v42, v46);
        v53 = (int32x4_t)vsubq_s16(v43, v47);
        v54 = (int32x4_t)vaddq_s16(v48, v44);
        v55 = (int32x4_t)vaddq_s16(v49, v45);
        v56 = (int32x4_t)vsubq_s16(v44, v48);
        v57 = (int32x4_t)vsubq_s16(v45, v49);
        v58 = (uint16x8_t)vaddq_s16(vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v51, v53)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v51, v53))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v50, v52)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v50, v52)))), vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v54, v56)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v54, v56))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v55, v57)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v55, v57)))));
        v15 = (int32x4_t)vaddw_u16((uint32x4_t)v15, *(uint16x4_t *)v58.i8);
        v14 = (int32x4_t)vaddw_high_u16((uint32x4_t)v14, v58);
        v16 += 32;
      }
    }
    a3 += v6;
    v7 += v6;
    v8 += v6;
    v9 += v6;
    v11 += v10;
    v12 += v10;
    v13 += v10;
    a5 += v10;
    a2 -= 4;
  }
  while (a2);
  return vaddvq_s32(vaddq_s32(v15, v14));
}

uint64_t sub_1C98185D4(_DWORD *a1, uint64_t a2, unint64_t a3, _QWORD *a4, uint64_t *a5)
{
  unint64_t v5;
  int v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  int v13;

  if (a3 < 2)
    return 4294954387;
  if (a3 == 2)
  {
    v6 = 0;
    v5 = 0;
  }
  else
  {
    v5 = 0;
    v6 = 0;
    while (*(unsigned __int8 *)(a2 + v5) == 255)
    {
      v6 += 255;
      if (a3 - 2 == ++v5)
      {
        v6 = 255 * a3 - 510;
        v5 = a3 - 2;
        break;
      }
    }
  }
  *a1 = v6 + *(unsigned __int8 *)(a2 + v5);
  *a5 = 0;
  v7 = v5 + 1;
  if (v5 + 1 < a3 - 1 && *(unsigned __int8 *)(a2 + v7) == 255)
  {
    v12 = 255;
    while (1)
    {
      v8 = v12;
      *a5 = v12;
      if (a3 - 3 == v5)
        break;
      v13 = *(unsigned __int8 *)(a2 + 2 + v5);
      v12 += 255;
      ++v5;
      if (v13 != 255)
      {
        v7 = v5 + 1;
        goto LABEL_11;
      }
    }
    v5 = a3 - 2;
    v7 = a3 - 1;
  }
  else
  {
    v8 = 0;
  }
LABEL_11:
  v9 = v5 + 2;
  v10 = v8 + *(unsigned __int8 *)(a2 + v7);
  *a5 = v10;
  if (v10 + v9 > a3)
    return 4294954387;
  result = 0;
  *a4 = a2 + v9;
  return result;
}

uint64_t sub_1C98186CC(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t result;
  uint64_t i;

  if (*a4 < (unint64_t)(a2 + 16))
    return 4294954394;
  *(_WORD *)a3 = 336;
  *(_BYTE *)(a3 + 2) = 5;
  *(_OWORD *)(a3 + 4) = xmmword_1C9861040;
  if (a2)
  {
    for (i = 0; i != a2; ++i)
      *(_BYTE *)(a3 + 20 + i) = byte_1C9861050[i & 7] ^ *(_BYTE *)(a1 + i);
  }
  result = 0;
  *(_BYTE *)(a2 + a3 + 20) = 0x80;
  *(_BYTE *)(a3 + 3) = a2 + 16;
  *a4 = a2 + 21;
  return result;
}

uint64_t sub_1C981875C(uint64_t result, FILE *__stream)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  unint64_t v6;
  uint64_t v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  uint64_t v10;

  v3 = result;
  v4 = byte_1C9861058[*(int *)(result + 4)];
  v5 = dword_1ED1ACCC0;
  if (dword_1ED1ACCC0 >= 6)
  {
    result = fwrite("=========== SEI Hash ===========\n", 0x21uLL, 1uLL, __stream);
    v5 = dword_1ED1ACCC0;
    if (dword_1ED1ACCC0 >= 6)
    {
      result = fprintf(__stream, "  hash_type : %d\n", *(_DWORD *)(v3 + 4));
      v5 = dword_1ED1ACCC0;
      if (dword_1ED1ACCC0 >= 6)
      {
        result = fwrite("  hash      : ", 0xEuLL, 1uLL, __stream);
        v5 = dword_1ED1ACCC0;
      }
    }
  }
  v6 = 0;
  if (v4 <= 1)
    v7 = 1;
  else
    v7 = v4;
  v8 = (unsigned __int8 *)(v3 + 8);
  do
  {
    v9 = v8;
    v10 = v7;
    do
    {
      if (v5 >= 6)
      {
        result = fprintf(__stream, "%02x", *v9);
        v5 = dword_1ED1ACCC0;
      }
      ++v9;
      --v10;
    }
    while (v10);
    if (v6 <= 1 && v5 > 5)
    {
      result = fputc(44, __stream);
      v5 = dword_1ED1ACCC0;
    }
    ++v6;
    v8 += v4;
  }
  while (v6 != 3);
  if (v5 > 5)
    return fputc(10, __stream);
  return result;
}

void sub_1C98188D4(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unint64_t v12;
  int v13;
  _DWORD *v14;
  unint64_t v15;
  unsigned int v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  int v27;
  int v28;
  uint64_t v29;
  unint64_t v30;
  unsigned int v31;
  _DWORD *v32;
  uint64_t v33;
  char v34;
  char v35;
  _DWORD *v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  _DWORD *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  _DWORD *v44;
  uint64_t v45;
  char *v46;
  void *__p[3];
  uint64_t v48;
  _DWORD *v49;
  _DWORD *v50;
  unint64_t v51;
  char v52;

  memset(__p, 0, sizeof(__p));
  v49 = 0;
  v50 = 0;
  v51 = 0;
  if (*a3 >= 0x36uLL)
  {
    *(_WORD *)a2 = 334;
    *(_BYTE *)(a2 + 2) = 0;
    if (!sub_1C971B944((uint64_t)__p, (unsigned int *)(a2 + 4), *a3 - 4))
    {
      v8 = *(__int16 *)(a1 + 4) + 1;
      v9 = __clz(v8);
      v10 = (v8 - (0x80000000 >> v9)) | (0x80000000 >> v9);
      v11 = 63 - 2 * v9;
      LODWORD(v51) = (v10 << (-BYTE4(v51) - v11)) | v51;
      *v49 = bswap32(v51);
      v12 = SHIDWORD(v51) + v11;
      v13 = (_DWORD)v51 << (v12 & 0xF8);
      v14 = (_DWORD *)((char *)v49 + (v12 >> 3));
      v49 = v14;
      LOBYTE(v15) = v12 & 7;
      LODWORD(v51) = v13;
      HIDWORD(v51) = v12 & 7;
      if (v14 >= v50)
      {
        v52 = 1;
        v49 = v50;
        v14 = v50;
      }
      v16 = *(__int16 *)(a1 + 4);
      if (v16 <= 0xF)
        v17 = (uint64_t *)(a4 + 16 * v16 + 256);
      else
        v17 = (uint64_t *)(a4 + 1552);
      v18 = *v17;
      if (*(_BYTE *)(v18 + 398) && *(_BYTE *)(v18 + 2028))
      {
        if (!*(_BYTE *)(v18 + 2034))
        {
          LODWORD(v51) = (*(unsigned __int8 *)(a1 + 6) << (v15 ^ 0x1F)) | v13;
          *v14 = bswap32(v51);
          v19 = SHIDWORD(v51) + 1;
          v13 = (_DWORD)v51 << (v19 & 0xF8);
          v14 = (_DWORD *)((char *)v49 + (v19 >> 3));
          v49 = v14;
          LOBYTE(v15) = v19 & 7;
          HIDWORD(v51) = v19 & 7;
          if (v14 >= v50)
          {
            v52 = 1;
            v49 = v50;
            v14 = v50;
          }
        }
        if (*(_BYTE *)(a1 + 6))
        {
          v20 = *(unsigned __int8 *)(v18 + 2043) + 1;
          LODWORD(v51) = (*(_DWORD *)(a1 + 12) << (-(char)v15 - v20)) | v13;
          *v14 = bswap32(v51);
          v21 = SHIDWORD(v51) + v20;
          v22 = (_DWORD)v51 << (v21 & 0xF8);
          v15 = (unint64_t)v49 + (v21 >> 3);
          v49 = (_DWORD *)v15;
          v23 = v21 & 7;
          HIDWORD(v51) = v23;
          if (v15 >= (unint64_t)v50)
          {
            v52 = 1;
            v49 = v50;
            v15 = (unint64_t)v50;
          }
          v24 = *(unsigned __int8 *)(v18 + 2038) + 1;
          LODWORD(v51) = (*(_DWORD *)(a1 + 16) << (-(char)v24 - v23)) | v22;
          *(_DWORD *)v15 = bswap32(v51);
          v25 = SHIDWORD(v51) + v24;
          v13 = (_DWORD)v51 << (v25 & 0xF8);
          v14 = (_DWORD *)((char *)v49 + (v25 >> 3));
          v49 = v14;
          LOBYTE(v15) = v25 & 7;
          HIDWORD(v51) = v25 & 7;
          if (v14 >= v50)
          {
            v52 = 1;
            v49 = v50;
            v14 = v50;
          }
        }
        LODWORD(v51) = (*(unsigned __int8 *)(a1 + 7) << (v15 ^ 0x1F)) | v13;
        *v14 = bswap32(v51);
        v26 = SHIDWORD(v51) + 1;
        v27 = (_DWORD)v51 << (v26 & 0xF8);
        v15 = (unint64_t)v49 + (v26 >> 3);
        v49 = (_DWORD *)v15;
        v28 = v26 & 7;
        HIDWORD(v51) = v28;
        if (v15 >= (unint64_t)v50)
        {
          v52 = 1;
          v49 = v50;
          v15 = (unint64_t)v50;
        }
        v29 = *(unsigned __int8 *)(v18 + 2043) + 1;
        LODWORD(v51) = (*(_DWORD *)(a1 + 8) << (-(char)v28 - v29)) | v27;
        *(_DWORD *)v15 = bswap32(v51);
        v30 = SHIDWORD(v51) + v29;
        v31 = (_DWORD)v51 << (v30 & 0xF8);
        v32 = (_DWORD *)((char *)v49 + (v30 >> 3));
        v49 = v32;
        LOBYTE(v15) = v30 & 7;
        LODWORD(v51) = v31;
        HIDWORD(v51) = v30 & 7;
        if (v32 >= v50)
        {
          v52 = 1;
          v49 = v50;
          v32 = v50;
        }
        v33 = 0;
        v34 = 1;
        while (1)
        {
          v35 = v34;
          if ((v34 & 1) == 0)
            break;
          if (*(_BYTE *)(v18 + 2032))
            goto LABEL_27;
LABEL_39:
          v34 = 0;
          v33 = 1;
          if ((v35 & 1) == 0)
            goto LABEL_40;
        }
        if (!*(_BYTE *)(v18 + 2033))
          goto LABEL_40;
LABEL_27:
        v36 = (_DWORD *)(a1 + 4 * v33);
        v37 = -1;
        do
        {
          v38 = *(unsigned __int8 *)(v18 + 2042) + 1;
          LODWORD(v51) = (v36[5] << (-(char)v15 - v38)) | v31;
          *v32 = bswap32(v51);
          v39 = SHIDWORD(v51) + v38;
          v40 = (_DWORD *)((char *)v49 + (v39 >> 3));
          v49 = v40;
          HIDWORD(v51) = v39 & 7;
          if (v40 >= v50)
          {
            v52 = 1;
            v49 = v50;
            v40 = v50;
          }
          v41 = *(unsigned __int8 *)(v18 + 2042) + 1;
          LODWORD(v51) = (v36[69] << (-(char)v41 - (v39 & 7))) | ((_DWORD)v51 << (v39 & 0xF8));
          *v40 = bswap32(v51);
          v15 = SHIDWORD(v51) + v41;
          v31 = (_DWORD)v51 << (v15 & 0xF8);
          v32 = (_DWORD *)((char *)v49 + (v15 >> 3));
          v49 = v32;
          LODWORD(v15) = v15 & 7;
          v51 = __PAIR64__(v15, v31);
          if (v32 >= v50)
          {
            v52 = 1;
            v49 = v50;
            v32 = v50;
          }
          if (*(_BYTE *)(v18 + 2034) || *(_BYTE *)(a1 + 6))
          {
            v42 = *(unsigned __int8 *)(v18 + 2042) + 1;
            LODWORD(v51) = (v36[133] << (-(char)v42 - v15)) | v31;
            *v32 = bswap32(v51);
            v43 = SHIDWORD(v51) + v42;
            v44 = (_DWORD *)((char *)v49 + (v43 >> 3));
            v49 = v44;
            HIDWORD(v51) = v43 & 7;
            if (v44 >= v50)
            {
              v52 = 1;
              v49 = v50;
              v44 = v50;
            }
            v45 = *(unsigned __int8 *)(v18 + 2042) + 1;
            LODWORD(v51) = (v36[197] << (-(char)v45 - (v43 & 7))) | ((_DWORD)v51 << (v43 & 0xF8));
            *v44 = bswap32(v51);
            v15 = SHIDWORD(v51) + v45;
            v31 = (_DWORD)v51 << (v15 & 0xF8);
            v32 = (_DWORD *)((char *)v49 + (v15 >> 3));
            v49 = v32;
            LODWORD(v15) = v15 & 7;
            v51 = __PAIR64__(v15, v31);
            if (v32 >= v50)
            {
              v52 = 1;
              v49 = v50;
              v32 = v50;
            }
          }
          v36 += 2;
          ++v37;
        }
        while (v37 < *(unsigned __int16 *)(*(_QWORD *)(v18 + 2048) + 6));
        goto LABEL_39;
      }
LABEL_40:
      if ((v15 & 7) != 0)
        sub_1C9750F5C((uint64_t)__p);
      sub_1C9750F5C((uint64_t)__p);
      v46 = (char *)v49 - v48;
      *(_BYTE *)(a2 + 3) = (_BYTE)v49 - v48 - 1;
      *a3 = v46 + 4;
    }
    if (__p[0])
      operator delete(__p[0]);
  }
}

void sub_1C9818E40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_1C9818E58(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  unsigned int v7;
  unint64_t v8;
  _DWORD *v9;
  unsigned int v10;
  _DWORD *v11;
  int v12;
  unsigned int v13;
  char *v14;
  void *__p[3];
  uint64_t v16;
  _DWORD *v17;
  unint64_t v18;
  uint64_t v19;
  char v20;

  memset(__p, 0, sizeof(__p));
  v17 = 0;
  v18 = 0;
  v19 = 0;
  if (*a3 >= 9uLL)
  {
    *(_WORD *)a2 = 334;
    *(_BYTE *)(a2 + 2) = -112;
    if (!sub_1C971B944((uint64_t)__p, (unsigned int *)(a2 + 4), *a3 - 4))
    {
      v6 = SHIDWORD(v19);
      v7 = (*(unsigned __int16 *)(a1 + 4) << (16 - BYTE4(v19))) | v19;
      v9 = v17;
      v8 = v18;
      *v17 = bswap32(v7);
      v10 = v7 << ((v6 + 16) & 0xF8);
      v11 = (_DWORD *)((char *)v9 + ((unint64_t)(v6 + 16) >> 3));
      v12 = v6 & 7;
      if ((unint64_t)v11 >= v8)
      {
        v20 = 1;
        v11 = (_DWORD *)v8;
      }
      v13 = (*(unsigned __int16 *)(a1 + 6) << (16 - v12)) | v10;
      *v11 = bswap32(v13);
      v17 = (_DWORD *)((char *)v11 + 2);
      LODWORD(v19) = v13 << 16;
      HIDWORD(v19) = v12;
      if ((unint64_t)v11 + 2 >= v8)
      {
        v20 = 1;
        v17 = (_DWORD *)v8;
      }
      sub_1C9750F5C((uint64_t)__p);
      v14 = (char *)v17 - v16;
      *(_BYTE *)(a2 + 3) = (_BYTE)v17 - v16 - 1;
      *a3 = v14 + 4;
    }
    if (__p[0])
      operator delete(__p[0]);
  }
}

void sub_1C9818F94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_1C9818FAC(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  unsigned int v7;
  char v8;
  _DWORD *v9;
  unint64_t v10;
  _DWORD *v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  _DWORD *v16;
  char v17;
  unint64_t v18;
  int v19;
  _DWORD *v20;
  char v21;
  unsigned int v22;
  unint64_t v23;
  int v24;
  _DWORD *v25;
  char v26;
  unint64_t v27;
  int v28;
  _DWORD *v29;
  char v30;
  unsigned int v31;
  unint64_t v32;
  int v33;
  _DWORD *v34;
  char v35;
  unint64_t v36;
  char *v37;
  void *__p[3];
  uint64_t v39;
  _DWORD *v40;
  _DWORD *v41;
  unint64_t v42;
  char v43;

  memset(__p, 0, sizeof(__p));
  v40 = 0;
  v41 = 0;
  v42 = 0;
  if (*a3 >= 0x1DuLL)
  {
    *(_WORD *)a2 = 334;
    *(_BYTE *)(a2 + 2) = -119;
    if (!sub_1C971B944((uint64_t)__p, (unsigned int *)(a2 + 4), *a3 - 4))
    {
      v6 = 0;
      v7 = v42;
      v8 = BYTE4(v42);
      v9 = v40;
      do
      {
        LODWORD(v42) = (*(unsigned __int16 *)(a1 + v6 + 4) << (16 - v8)) | v7;
        *v9 = bswap32(v42);
        v10 = SHIDWORD(v42) + 16;
        v11 = (_DWORD *)((char *)v40 + (v10 >> 3));
        v40 = v11;
        v12 = BYTE4(v42) & 7;
        HIDWORD(v42) = BYTE4(v42) & 7;
        if (v11 >= v41)
        {
          v43 = 1;
          v40 = v41;
          v11 = v41;
        }
        LODWORD(v42) = (*(unsigned __int16 *)(a1 + v6 + 10) << (16 - v12)) | ((_DWORD)v42 << (v10 & 0xF8));
        *v11 = bswap32(v42);
        v13 = SHIDWORD(v42) + 16;
        v7 = (_DWORD)v42 << (v13 & 0xF8);
        v9 = (_DWORD *)((char *)v40 + (v13 >> 3));
        v40 = v9;
        v8 = BYTE4(v42) & 7;
        v42 = __PAIR64__(HIDWORD(v42), v7) & 0x7FFFFFFFFLL;
        if (v9 >= v41)
        {
          v43 = 1;
          v40 = v41;
          v9 = v41;
        }
        v6 += 2;
      }
      while (v6 != 6);
      LODWORD(v42) = (*(unsigned __int16 *)(a1 + 16) << (16 - v8)) | v7;
      *v9 = bswap32(v42);
      v14 = SHIDWORD(v42) + 16;
      v15 = (_DWORD)v42 << (v14 & 0xF8);
      v16 = (_DWORD *)((char *)v40 + (v14 >> 3));
      v40 = v16;
      v17 = BYTE4(v42) & 7;
      HIDWORD(v42) = BYTE4(v42) & 7;
      if (v16 >= v41)
      {
        v43 = 1;
        v40 = v41;
        v16 = v41;
      }
      LODWORD(v42) = (*(unsigned __int16 *)(a1 + 18) << (16 - v17)) | v15;
      *v16 = bswap32(v42);
      v18 = SHIDWORD(v42) + 16;
      v19 = (_DWORD)v42 << (v18 & 0xF8);
      v20 = (_DWORD *)((char *)v40 + (v18 >> 3));
      v40 = v20;
      v21 = BYTE4(v42) & 7;
      HIDWORD(v42) = BYTE4(v42) & 7;
      if (v20 >= v41)
      {
        v43 = 1;
        v40 = v41;
        v20 = v41;
      }
      v22 = *(_DWORD *)(a1 + 20);
      LODWORD(v42) = (HIWORD(v22) << (16 - v21)) | v19;
      *v20 = bswap32(v42);
      v23 = SHIDWORD(v42) + 16;
      v24 = (_DWORD)v42 << (v23 & 0xF8);
      v25 = (_DWORD *)((char *)v40 + (v23 >> 3));
      v40 = v25;
      v26 = BYTE4(v42) & 7;
      HIDWORD(v42) = BYTE4(v42) & 7;
      if (v25 >= v41)
      {
        v43 = 1;
        v40 = v41;
        v25 = v41;
      }
      LODWORD(v42) = ((unsigned __int16)v22 << (16 - v26)) | v24;
      *v25 = bswap32(v42);
      v27 = SHIDWORD(v42) + 16;
      v28 = (_DWORD)v42 << (v27 & 0xF8);
      v29 = (_DWORD *)((char *)v40 + (v27 >> 3));
      v40 = v29;
      v30 = BYTE4(v42) & 7;
      HIDWORD(v42) = BYTE4(v42) & 7;
      if (v29 >= v41)
      {
        v43 = 1;
        v40 = v41;
        v29 = v41;
      }
      v31 = *(_DWORD *)(a1 + 24);
      LODWORD(v42) = (HIWORD(v31) << (16 - v30)) | v28;
      *v29 = bswap32(v42);
      v32 = SHIDWORD(v42) + 16;
      v33 = (_DWORD)v42 << (v32 & 0xF8);
      v34 = (_DWORD *)((char *)v40 + (v32 >> 3));
      v40 = v34;
      v35 = BYTE4(v42) & 7;
      HIDWORD(v42) = BYTE4(v42) & 7;
      if (v34 >= v41)
      {
        v43 = 1;
        v40 = v41;
        v34 = v41;
      }
      LODWORD(v42) = ((unsigned __int16)v31 << (16 - v35)) | v33;
      *v34 = bswap32(v42);
      v36 = SHIDWORD(v42) + 16;
      v40 = (_DWORD *)((char *)v40 + (v36 >> 3));
      v42 = __PAIR64__(HIDWORD(v42), (_DWORD)v42 << (v36 & 0xF8)) & 0x7FFFFFFFFLL;
      if (v40 >= v41)
      {
        v43 = 1;
        v40 = v41;
      }
      sub_1C9750F5C((uint64_t)__p);
      v37 = (char *)v40 - v39;
      *(_BYTE *)(a2 + 3) = (_BYTE)v40 - v39 - 1;
      *a3 = v37 + 4;
    }
    if (__p[0])
      operator delete(__p[0]);
  }
}

void sub_1C981936C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint16x8_t sub_1C9819384(__int32 *a1, uint64_t a2, __int32 *a3, uint64_t a4, uint16x8_t *a5)
{
  uint8x8_t v5;
  uint8x8_t v6;
  uint8x8_t v7;
  uint8x8_t v8;
  uint16x8_t result;

  v5.i32[0] = *a1;
  v5.i32[1] = *(__int32 *)((char *)a1 + a2);
  v6.i32[0] = *(__int32 *)((char *)a1 + 2 * a2);
  v6.i32[1] = *(__int32 *)((char *)a1 + 3 * a2);
  v7.i32[0] = *a3;
  v7.i32[1] = *(__int32 *)((char *)a3 + a4);
  v8.i32[0] = *(__int32 *)((char *)a3 + 2 * a4);
  v8.i32[1] = *(__int32 *)((char *)a3 + 3 * a4);
  result = vsubl_u8(v5, v7);
  *a5 = result;
  a5[1] = vsubl_u8(v6, v8);
  return result;
}

uint8x8_t *sub_1C98193D4(uint8x8_t *result, uint64_t a2, uint8x8_t *a3, uint64_t a4, uint16x8_t *a5)
{
  char v5;
  char v6;
  uint8x8_t *v7;
  uint8x8_t v8;
  uint8x8_t *v9;
  uint8x8_t *v10;
  uint8x8_t v11;
  uint8x8_t *v12;
  uint16x8_t v13;
  uint16x8_t v14;

  v5 = 1;
  do
  {
    v6 = v5;
    v7 = (uint8x8_t *)((char *)result + a2 + a2);
    v8 = *v7;
    v9 = (uint8x8_t *)((char *)v7 + a2);
    v10 = (uint8x8_t *)((char *)a3 + a4 + a4);
    v11 = *v10;
    v12 = (uint8x8_t *)((char *)v10 + a4);
    v13 = vsubl_u8(*(uint8x8_t *)((char *)result + a2), *(uint8x8_t *)((char *)a3 + a4));
    v14 = vsubl_u8(*v9, *v12);
    *a5 = vsubl_u8(*result, *a3);
    a5[1] = v13;
    a5[2] = vsubl_u8(v8, v11);
    a5[3] = v14;
    result = (uint8x8_t *)((char *)v9 + a2);
    a3 = (uint8x8_t *)((char *)v12 + a4);
    a5 += 4;
    v5 = 0;
  }
  while ((v6 & 1) != 0);
  return result;
}

uint8x16_t *sub_1C9819444(uint8x16_t *result, uint64_t a2, uint8x16_t *a3, uint64_t a4, uint16x8_t *a5)
{
  unsigned int v5;
  uint8x16_t v6;
  uint8x16_t v7;
  uint16x8_t v8;

  v5 = -2;
  do
  {
    v6 = *(uint8x16_t *)((char *)result + a2);
    v7 = *(uint8x16_t *)((char *)a3 + a4);
    v8 = vsubl_high_u8(*result, *a3);
    *a5 = vsubl_u8(*(uint8x8_t *)result->i8, *(uint8x8_t *)a3->i8);
    a5[1] = v8;
    a5[2] = vsubl_u8(*(uint8x8_t *)v6.i8, *(uint8x8_t *)v7.i8);
    a5[3] = vsubl_high_u8(v6, v7);
    result = (uint8x16_t *)((char *)result + 2 * a2);
    a3 = (uint8x16_t *)((char *)a3 + 2 * a4);
    v5 += 2;
    a5 += 4;
  }
  while (v5 < 0xE);
  return result;
}

uint16x8_t sub_1C9819494(uint8x8_t *a1, uint64_t a2, uint8x8_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint8x8_t *v6;
  uint8x8_t *v7;
  uint16x8_t *v8;
  uint8x16_t v9;
  uint8x16_t v10;
  uint16x8_t v11;
  uint16x8_t result;
  uint16x8_t v13;
  uint16x8_t v14;

  v5 = 0;
  v6 = a1 + 2;
  v7 = a3 + 2;
  do
  {
    v8 = (uint16x8_t *)(a5 + v5);
    v9 = *(uint8x16_t *)v6[-2].i8;
    v10 = *(uint8x16_t *)v7[-2].i8;
    v11 = vsubl_u8(*(uint8x8_t *)v9.i8, *(uint8x8_t *)v10.i8);
    result = vsubl_high_u8(v9, v10);
    v13 = vsubl_u8(*v6, *v7);
    v14 = vsubl_high_u8(*(uint8x16_t *)v6->i8, *(uint8x16_t *)v7->i8);
    *v8 = v11;
    v8[1] = result;
    v8[2] = v13;
    v8[3] = v14;
    v5 += 64;
    v6 = (uint8x8_t *)((char *)v6 + a2);
    v7 = (uint8x8_t *)((char *)v7 + a4);
  }
  while ((_DWORD)v5 != 2048);
  return result;
}

int16x4_t sub_1C98194DC(__int32 *a1, uint64_t a2, __int32 *a3, uint64_t a4, uint64_t a5)
{
  uint8x8_t v6;
  uint8x8_t v7;
  uint8x8_t v8;
  uint8x8_t v9;
  int16x4_t v11[6];

  v11[5] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v6.i32[0] = *a1;
  v6.i32[1] = *(__int32 *)((char *)a1 + a2);
  v7.i32[0] = *(__int32 *)((char *)a1 + 2 * a2);
  v7.i32[1] = *(__int32 *)((char *)a1 + 3 * a2);
  v8.i32[0] = *a3;
  v8.i32[1] = *(__int32 *)((char *)a3 + a4);
  v9.i32[0] = *(__int32 *)((char *)a3 + 2 * a4);
  v9.i32[1] = *(__int32 *)((char *)a3 + 3 * a4);
  *(uint16x8_t *)a5 = vsubl_u8(v6, v8);
  *(uint16x8_t *)(a5 + 16) = vsubl_u8(v7, v9);
  sub_1C981AFE4(v11, (int16x4_t *)a5, 1);
  return sub_1C981B088((int16x4_t *)a5, v11);
}

int16x4_t sub_1C9819594(__int32 *a1, uint64_t a2, __int32 *a3, uint64_t a4, uint64_t a5)
{
  uint8x8_t v5;
  uint8x8_t v6;
  uint8x8_t v7;
  uint8x8_t v8;
  uint16x8_t v9;
  uint16x8_t v10;
  int32x2_t v11;
  int32x2_t v12;
  int16x4_t v13;
  int16x4_t v14;
  int16x4_t v15;
  int16x4_t v16;
  int16x4_t v18[6];

  v18[5] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v5.i32[0] = *a1;
  v5.i32[1] = *(__int32 *)((char *)a1 + a2);
  v6.i32[0] = *(__int32 *)((char *)a1 + 2 * a2);
  v6.i32[1] = *(__int32 *)((char *)a1 + 3 * a2);
  v7.i32[0] = *a3;
  v7.i32[1] = *(__int32 *)((char *)a3 + a4);
  v8.i32[0] = *(__int32 *)((char *)a3 + 2 * a4);
  v8.i32[1] = *(__int32 *)((char *)a3 + 3 * a4);
  v9 = vsubl_u8(v5, v7);
  v10 = vsubl_u8(v6, v8);
  *(uint16x8_t *)a5 = v9;
  *(uint16x8_t *)(a5 + 16) = v10;
  v11 = (int32x2_t)vtrn1_s16(*(int16x4_t *)v9.i8, (int16x4_t)v9.u64[1]);
  *(int16x4_t *)v9.i8 = vtrn2_s16(*(int16x4_t *)v9.i8, (int16x4_t)v9.u64[1]);
  v12 = (int32x2_t)vtrn1_s16(*(int16x4_t *)v10.i8, (int16x4_t)v10.u64[1]);
  *(int16x4_t *)v10.i8 = vtrn2_s16(*(int16x4_t *)v10.i8, (int16x4_t)v10.u64[1]);
  v13 = (int16x4_t)vzip1_s32(*(int32x2_t *)v9.i8, *(int32x2_t *)v10.i8);
  v14 = (int16x4_t)vzip2_s32(v11, v12);
  *(int32x2_t *)v9.i8 = vzip2_s32(*(int32x2_t *)v9.i8, *(int32x2_t *)v10.i8);
  *(int32x2_t *)v10.i8 = vzip1_s32(v11, v12);
  v15 = vadd_s16(*(int16x4_t *)v9.i8, *(int16x4_t *)v10.i8);
  *(int16x4_t *)v9.i8 = vsub_s16(*(int16x4_t *)v10.i8, *(int16x4_t *)v9.i8);
  *(int16x4_t *)v10.i8 = vadd_s16(v14, v13);
  v16 = vsub_s16(v13, v14);
  v18[0] = vqmovn_s32(vrshrq_n_s32(vshlq_n_s32(vaddl_s16(*(int16x4_t *)v10.i8, v15), 6uLL), 1uLL));
  v18[1] = vqmovn_s32(vrshrq_n_s32(vmlal_s16(vmull_s16(v16, (int16x4_t)0x24002400240024), *(int16x4_t *)v9.i8, (int16x4_t)0x53005300530053), 1uLL));
  v18[2] = vqmovn_s32(vrshrq_n_s32(vshlq_n_s32(vsubl_s16(v15, *(int16x4_t *)v10.i8), 6uLL), 1uLL));
  v18[3] = vqmovn_s32(vrshrq_n_s32(vmlsl_s16(vmull_s16(*(int16x4_t *)v9.i8, (int16x4_t)0x24002400240024), v16, (int16x4_t)0x53005300530053), 1uLL));
  return sub_1C981AF54((int16x4_t *)a5, v18);
}

void sub_1C98196C0(uint8x8_t *a1, uint64_t a2, uint8x8_t *a3, uint64_t a4, int16x4_t *a5)
{
  char v6;
  uint16x8_t *v7;
  char v8;
  uint8x8_t *v9;
  uint8x8_t v10;
  uint8x8_t *v11;
  uint8x8_t *v12;
  uint8x8_t v13;
  uint8x8_t *v14;
  uint16x8_t v15;
  uint16x8_t v16;
  int16x4_t v17[18];

  v17[17] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v6 = 1;
  v7 = (uint16x8_t *)a5;
  do
  {
    v8 = v6;
    v9 = (uint8x8_t *)((char *)a1 + a2 + a2);
    v10 = *v9;
    v11 = (uint8x8_t *)((char *)v9 + a2);
    v12 = (uint8x8_t *)((char *)a3 + a4 + a4);
    v13 = *v12;
    v14 = (uint8x8_t *)((char *)v12 + a4);
    v15 = vsubl_u8(*(uint8x8_t *)((char *)a1 + a2), *(uint8x8_t *)((char *)a3 + a4));
    v16 = vsubl_u8(*v11, *v14);
    *v7 = vsubl_u8(*a1, *a3);
    v7[1] = v15;
    v7[2] = vsubl_u8(v10, v13);
    v7[3] = v16;
    a1 = (uint8x8_t *)((char *)v11 + a2);
    a3 = (uint8x8_t *)((char *)v14 + a4);
    v7 += 4;
    v6 = 0;
  }
  while ((v8 & 1) != 0);
  sub_1C981ADF0(v17, a5, 2);
  sub_1C981AE94(a5, v17);
}

void sub_1C981979C(uint8x16_t *a1, uint64_t a2, uint8x16_t *a3, uint64_t a4, int16x4_t *a5)
{
  unsigned int v6;
  uint16x8_t *v7;
  uint8x16_t v8;
  uint8x16_t v9;
  uint16x8_t v10;
  int16x4_t v11[66];

  v11[65] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v6 = -2;
  v7 = (uint16x8_t *)a5;
  do
  {
    v8 = *(uint8x16_t *)((char *)a1 + a2);
    v9 = *(uint8x16_t *)((char *)a3 + a4);
    v10 = vsubl_high_u8(*a1, *a3);
    *v7 = vsubl_u8(*(uint8x8_t *)a1->i8, *(uint8x8_t *)a3->i8);
    v7[1] = v10;
    v7[2] = vsubl_u8(*(uint8x8_t *)v8.i8, *(uint8x8_t *)v9.i8);
    v7[3] = vsubl_high_u8(v8, v9);
    a1 = (uint8x16_t *)((char *)a1 + 2 * a2);
    a3 = (uint8x16_t *)((char *)a3 + 2 * a4);
    v6 += 2;
    v7 += 4;
  }
  while (v6 < 0xE);
  sub_1C981AB1C(v11, a5, 3);
  sub_1C981AC68(a5, v11);
}

void sub_1C9819858(uint8x8_t *a1, uint64_t a2, uint8x8_t *a3, uint64_t a4, int16x4_t *a5)
{
  uint64_t v6;
  uint8x8_t *v7;
  uint8x8_t *v8;
  uint16x8_t *v9;
  uint8x16_t v10;
  uint8x16_t v11;
  uint16x8_t v12;
  uint16x8_t v13;
  uint16x8_t v14;
  uint16x8_t v15;
  int16x4_t v16[258];

  v6 = 0;
  v16[257] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v7 = a1 + 2;
  v8 = a3 + 2;
  do
  {
    v9 = (uint16x8_t *)&a5[v6];
    v10 = *(uint8x16_t *)v7[-2].i8;
    v11 = *(uint8x16_t *)v8[-2].i8;
    v12 = vsubl_u8(*(uint8x8_t *)v10.i8, *(uint8x8_t *)v11.i8);
    v13 = vsubl_high_u8(v10, v11);
    v14 = vsubl_u8(*v7, *v8);
    v15 = vsubl_high_u8(*(uint8x16_t *)v7->i8, *(uint8x16_t *)v8->i8);
    *v9 = v12;
    v9[1] = v13;
    v9[2] = v14;
    v9[3] = v15;
    v6 += 8;
    v7 = (uint8x8_t *)((char *)v7 + a2);
    v8 = (uint8x8_t *)((char *)v8 + a4);
  }
  while ((_DWORD)(v6 * 8) != 2048);
  sub_1C9819DB0(v16, a5, 4);
  sub_1C9819FE4(a5, v16);
}

void sub_1C9819908(__int32 *a1, uint64_t a2, int32x4_t *a3, int a4, int a5)
{
  char v5;
  uint16x8_t v9;
  uint8x8_t v10;
  __int32 *v11;
  uint8x8_t v12;
  int8x8_t v13;
  int8x8_t v14;
  uint8x8_t v15;
  uint8x8_t v16;
  __int32 *v17;
  int8x8_t v18;
  int8x8_t v19;

  v5 = a4;
  if (a5 != 1)
  {
    sub_1C9708C30(a3, a5);
    v15.i32[0] = *a1;
    v15.i32[1] = *(__int32 *)((char *)a1 + a2);
    v16.i32[0] = *(__int32 *)((char *)a1 + 2 * a2);
    v17 = (__int32 *)((char *)a1 + 3 * a2);
    v16.i32[1] = *v17;
    v18 = vqmovun_s16(vqaddq_s16(*(int16x8_t *)a3, (int16x8_t)vmovl_u8(v15)));
    v19 = vqmovun_s16(vqaddq_s16((int16x8_t)a3[1], (int16x8_t)vmovl_u8(v16)));
    *a1 = v18.i32[0];
    *(__int32 *)((char *)a1 + a2) = v18.i32[1];
    *(__int32 *)((char *)a1 + 2 * a2) = v19.i32[0];
    *v17 = v19.i32[1];
    if ((v5 & 1) != 0)
      return;
    v9 = 0uLL;
    goto LABEL_6;
  }
  v9 = (uint16x8_t)vdupq_n_s16((a3->i16[0] + 65) >> 7);
  a3->i16[0] = 0;
  v10.i32[0] = *a1;
  v10.i32[1] = *(__int32 *)((char *)a1 + a2);
  v11 = (__int32 *)((char *)a1 + 3 * a2);
  v12.i32[0] = *(__int32 *)((char *)a1 + 2 * a2);
  v12.i32[1] = *v11;
  v13 = vqmovun_s16((int16x8_t)vaddw_u8(v9, v10));
  v14 = vqmovun_s16((int16x8_t)vaddw_u8(v9, v12));
  *a1 = v13.i32[0];
  *(__int32 *)((char *)a1 + a2) = v13.i32[1];
  *(__int32 *)((char *)a1 + 2 * a2) = v14.i32[0];
  *v11 = v14.i32[1];
  if (a4)
  {
LABEL_6:
    *a3 = (int32x4_t)v9;
    a3[1] = (int32x4_t)v9;
  }
}

int16x8_t sub_1C9819A00(int16x8_t *a1)
{
  int16x8_t result;
  int16x8_t v2;

  result = vshlq_n_s16(*a1, 5uLL);
  v2 = vshlq_n_s16(a1[1], 5uLL);
  *a1 = result;
  a1[1] = v2;
  return result;
}

int16x8_t sub_1C9819A14(int16x8_t *a1)
{
  int16x8_t result;
  int16x8_t v2;

  result = vrshrq_n_s16(*a1, 5uLL);
  v2 = vrshrq_n_s16(a1[1], 5uLL);
  *a1 = result;
  a1[1] = v2;
  return result;
}

int16x8_t *sub_1C9819A28(int16x8_t *result)
{
  unsigned int v1;
  int16x8_t v2;

  v1 = -16;
  do
  {
    v2 = vrshrq_n_s16(result[1], 4uLL);
    *result = vrshrq_n_s16(*result, 4uLL);
    result[1] = v2;
    result += 2;
    v1 += 16;
  }
  while (v1 < 0x30);
  return result;
}

int8x8_t sub_1C9819A4C(__int32 *a1, uint64_t a2, int16x8_t *a3, char a4)
{
  uint8x8_t v4;
  uint8x8_t v5;
  __int32 *v6;
  int16x8_t v7;
  int8x8_t v8;
  int8x8_t result;

  v4.i32[0] = *a1;
  v4.i32[1] = *(__int32 *)((char *)a1 + a2);
  v5.i32[0] = *(__int32 *)((char *)a1 + 2 * a2);
  v6 = (__int32 *)((char *)a1 + 3 * a2);
  v5.i32[1] = *v6;
  v7 = a3[1];
  v8 = vqmovun_s16(vqaddq_s16(*a3, (int16x8_t)vmovl_u8(v4)));
  *a1 = v8.i32[0];
  *(__int32 *)((char *)a1 + a2) = v8.i32[1];
  result = vqmovun_s16(vqaddq_s16(v7, (int16x8_t)vmovl_u8(v5)));
  *(__int32 *)((char *)a1 + 2 * a2) = result.i32[0];
  *v6 = result.i32[1];
  if ((a4 & 1) == 0)
  {
    result = 0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_1C9819AA8(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t (*v4)(void);

  if (a4)
    v4 = (uint64_t (*)(void))sub_1C9819CA4;
  else
    v4 = (uint64_t (*)(void))sub_1C9819D24;
  return v4();
}

uint64_t sub_1C9819AC4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t (*v4)(void);

  if (a4)
    v4 = (uint64_t (*)(void))sub_1C9819BC8;
  else
    v4 = (uint64_t (*)(void))sub_1C9819C30;
  return v4();
}

uint64_t sub_1C9819AE0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t (*v4)(void);

  if (a4)
    v4 = (uint64_t (*)(void))sub_1C9819AFC;
  else
    v4 = (uint64_t (*)(void))sub_1C9819B5C;
  return v4();
}

int8x16_t sub_1C9819AFC(uint8x8_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint8x8_t *v4;
  int8x16_t result;
  int8x16_t v6;

  v3 = 0;
  v4 = a1 + 2;
  do
  {
    result = vqmovun_high_s16(vqmovun_s16(vqaddq_s16((int16x8_t)vmovl_u8(v4[-2]), *(int16x8_t *)(a3 + v3))), vqaddq_s16((int16x8_t)vmovl_high_u8(*(uint8x16_t *)v4[-2].i8), *(int16x8_t *)(a3 + v3 + 16)));
    v6 = vqmovun_high_s16(vqmovun_s16(vqaddq_s16((int16x8_t)vmovl_u8(*v4), *(int16x8_t *)(a3 + v3 + 32))), vqaddq_s16((int16x8_t)vmovl_high_u8(*(uint8x16_t *)v4->i8), *(int16x8_t *)(a3 + v3 + 48)));
    *(int8x16_t *)v4[-2].i8 = result;
    *(int8x16_t *)v4->i8 = v6;
    v3 += 64;
    v4 = (uint8x8_t *)((char *)v4 + a2);
  }
  while ((_DWORD)v3 != 2048);
  return result;
}

uint8x8_t *sub_1C9819B5C(uint8x8_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint8x8_t *v4;
  _OWORD *v5;
  int16x8_t v6;
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  int8x16_t v10;
  int8x16_t v11;

  v3 = 0;
  v4 = result + 2;
  do
  {
    v5 = (_OWORD *)(a3 + v3);
    v6 = *(int16x8_t *)(a3 + v3);
    v7 = *(int16x8_t *)(a3 + v3 + 16);
    v8 = *(int16x8_t *)(a3 + v3 + 32);
    v9 = *(int16x8_t *)(a3 + v3 + 48);
    *v5 = 0uLL;
    v5[1] = 0uLL;
    v5[2] = 0uLL;
    v5[3] = 0uLL;
    v10 = vqmovun_high_s16(vqmovun_s16(vqaddq_s16((int16x8_t)vmovl_u8(v4[-2]), v6)), vqaddq_s16((int16x8_t)vmovl_high_u8(*(uint8x16_t *)v4[-2].i8), v7));
    v11 = vqmovun_high_s16(vqmovun_s16(vqaddq_s16((int16x8_t)vmovl_u8(*v4), v8)), vqaddq_s16((int16x8_t)vmovl_high_u8(*(uint8x16_t *)v4->i8), v9));
    *(int8x16_t *)v4[-2].i8 = v10;
    *(int8x16_t *)v4->i8 = v11;
    v3 += 64;
    v4 = (uint8x8_t *)((char *)v4 + a2);
  }
  while ((_DWORD)v3 != 2048);
  return result;
}

uint8x8_t *sub_1C9819BC8(uint8x8_t *result, uint64_t a2, int16x8_t *a3)
{
  unsigned int v3;
  int8x16_t v4;

  v3 = -2;
  do
  {
    v4 = vqmovun_high_s16(vqmovun_s16(vqaddq_s16((int16x8_t)vmovl_u8(*(uint8x8_t *)((char *)result + a2)), a3[2])), vqaddq_s16((int16x8_t)vmovl_high_u8(*(uint8x16_t *)&result->i8[a2]), a3[3]));
    *(int8x16_t *)result->i8 = vqmovun_high_s16(vqmovun_s16(vqaddq_s16((int16x8_t)vmovl_u8(*result), *a3)), vqaddq_s16((int16x8_t)vmovl_high_u8(*(uint8x16_t *)result->i8), a3[1]));
    *(int8x16_t *)&result->i8[a2] = v4;
    result = (uint8x8_t *)((char *)result + 2 * a2);
    v3 += 2;
    a3 += 4;
  }
  while (v3 < 0xE);
  return result;
}

uint8x8_t *sub_1C9819C30(uint8x8_t *result, uint64_t a2, int16x8_t *a3)
{
  unsigned int v3;
  int16x8_t v4;
  int16x8_t v5;
  int16x8_t v6;
  int16x8_t v7;
  int8x16_t v8;
  int8x16_t v9;

  v3 = -2;
  do
  {
    v4 = *a3;
    v5 = a3[1];
    v6 = a3[2];
    v7 = a3[3];
    *a3 = 0uLL;
    a3[1] = 0uLL;
    a3[2] = 0uLL;
    a3[3] = 0uLL;
    v8 = vqmovun_high_s16(vqmovun_s16(vqaddq_s16((int16x8_t)vmovl_u8(*result), v4)), vqaddq_s16((int16x8_t)vmovl_high_u8(*(uint8x16_t *)result->i8), v5));
    v9 = vqmovun_high_s16(vqmovun_s16(vqaddq_s16((int16x8_t)vmovl_u8(*(uint8x8_t *)((char *)result + a2)), v6)), vqaddq_s16((int16x8_t)vmovl_high_u8(*(uint8x16_t *)&result->i8[a2]), v7));
    *(int8x16_t *)result->i8 = v8;
    *(int8x16_t *)&result->i8[a2] = v9;
    result = (uint8x8_t *)((char *)result + 2 * a2);
    v3 += 2;
    a3 += 4;
  }
  while (v3 < 0xE);
  return result;
}

uint8x8_t *sub_1C9819CA4(uint8x8_t *result, uint64_t a2, int16x8_t *a3)
{
  char v3;
  char v4;
  int16x8_t v5;
  int16x8_t v6;
  int16x8_t v7;

  v3 = 1;
  do
  {
    v4 = v3;
    v5 = vqaddq_s16((int16x8_t)vmovl_u8(*(uint8x8_t *)((char *)result + a2)), a3[1]);
    v6 = vqaddq_s16((int16x8_t)vmovl_u8(*(uint8x8_t *)((char *)result + 2 * a2)), a3[2]);
    v7 = vqaddq_s16((int16x8_t)vmovl_u8(*(uint8x8_t *)((char *)result + 3 * a2)), a3[3]);
    *result = (uint8x8_t)vqmovun_s16(vqaddq_s16((int16x8_t)vmovl_u8(*result), *a3));
    *(int8x8_t *)((char *)result + a2) = vqmovun_s16(v5);
    *(int8x8_t *)((char *)result + 2 * a2) = vqmovun_s16(v6);
    *(int8x8_t *)((char *)result + 3 * a2) = vqmovun_s16(v7);
    result = (uint8x8_t *)((char *)result + 4 * a2);
    a3 += 4;
    v3 = 0;
  }
  while ((v4 & 1) != 0);
  return result;
}

uint8x8_t *sub_1C9819D24(uint8x8_t *result, uint64_t a2, int16x8_t *a3)
{
  char v3;
  char v4;
  int16x8_t v5;
  int16x8_t v6;
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  int16x8_t v10;
  int16x8_t v11;

  v3 = 1;
  do
  {
    v4 = v3;
    v5 = *a3;
    v6 = a3[1];
    v7 = a3[2];
    v8 = a3[3];
    *a3 = 0uLL;
    a3[1] = 0uLL;
    a3[2] = 0uLL;
    a3[3] = 0uLL;
    v9 = vqaddq_s16((int16x8_t)vmovl_u8(*(uint8x8_t *)((char *)result + a2)), v6);
    v10 = vqaddq_s16((int16x8_t)vmovl_u8(*(uint8x8_t *)((char *)result + 2 * a2)), v7);
    v11 = vqaddq_s16((int16x8_t)vmovl_u8(*(uint8x8_t *)((char *)result + 3 * a2)), v8);
    *result = (uint8x8_t)vqmovun_s16(vqaddq_s16((int16x8_t)vmovl_u8(*result), v5));
    *(int8x8_t *)((char *)result + a2) = vqmovun_s16(v9);
    *(int8x8_t *)((char *)result + 2 * a2) = vqmovun_s16(v10);
    *(int8x8_t *)((char *)result + 3 * a2) = vqmovun_s16(v11);
    result = (uint8x8_t *)((char *)result + 4 * a2);
    a3 += 4;
    v3 = 0;
  }
  while ((v4 & 1) != 0);
  return result;
}

void sub_1C9819DB0(int16x4_t *a1, int16x4_t *a2, int a3)
{
  unsigned int v6;
  int16x4_t v7;
  int16x4_t v8;
  int16x4_t v9;
  int16x4_t v10;
  int16x4_t v11;
  int16x4_t v12;
  int16x4_t v13;
  int16x4_t v14;
  int16x4_t v15;
  int16x4_t v16;
  int16x4_t v17;
  int16x4_t v18;
  int16x4_t v19;
  int16x4_t v20;
  int16x4_t v21;
  int16x4_t v22;
  int16x4_t v23;
  int16x4_t v24;
  int16x4_t v25;
  int16x4_t v26;
  int16x4_t v27;
  int32x2_t v28;
  int32x2_t v29;
  int32x2_t v30;
  int16x4_t v31;
  int16x4_t v32;
  int32x2_t v33;
  int32x2_t v34;
  int32x2_t v35;
  int16x4_t v36;
  int16x4_t v37;
  int32x2_t v38;
  int32x2_t v39;
  int32x2_t v40;
  int16x4_t v41;
  int16x4_t v42;
  int32x2_t v43;
  int32x2_t v44;
  int32x2_t v45;
  int16x4_t v46;
  int16x4_t v47;
  int32x2_t v48;
  int32x2_t v49;
  int32x2_t v50;
  int32x2_t v51;
  int32x2_t v52;
  int32x2_t v53;
  int32x2_t v54;
  int32x2_t v55;
  int32x2_t v56;
  int32x2_t v57;
  int32x2_t v58;
  int32x2_t v59;
  int32x2_t v60;
  int32x2_t v61;
  int32x2_t v62;
  int32x2_t v63;
  int32x2_t v64;
  int32x2_t v65;
  int32x2_t v66;
  int32x2_t v67;
  int32x2_t v68;
  int32x2_t v69;
  int32x2_t v70;
  int32x2_t v71;
  int32x2_t v72;
  int32x2_t v73;
  int32x2_t v74;
  int32x2_t v75;
  int32x2_t v76;
  int32x2_t v77;
  int32x2_t v78;
  int32x2_t v79;
  int32x2_t v80;
  int32x2_t v81;
  int32x2_t v82;
  int32x2_t v83;
  int32x2_t v84;
  int32x2_t v85;
  int16x4_t v86;
  int16x4_t v87;
  int32x2_t v88;
  int32x2_t v89;
  int32x2_t v90;
  int32x2_t v91;
  int32x2_t v92;
  int32x2_t v93;
  int32x2_t v94;
  int32x2_t v95;
  int32x2_t v96;
  int32x2_t v97;
  int16x4_t v98[33];

  v98[32] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v6 = -4;
  do
  {
    v7 = a2[1];
    v8 = a2[8];
    v9 = a2[9];
    v10 = a2[16];
    v11 = a2[17];
    v12 = a2[24];
    v13 = a2[25];
    v14 = a2[2];
    v15 = a2[3];
    v16 = a2[10];
    v17 = a2[11];
    v18 = a2[18];
    v19 = a2[19];
    v20 = a2[26];
    v21 = a2[27];
    v22 = a2[4];
    v23 = a2[5];
    v24 = a2[12];
    v25 = a2[13];
    v26 = a2[20];
    v27 = a2[21];
    v28 = (int32x2_t)vtrn1_s16(*a2, v8);
    v29 = (int32x2_t)vtrn2_s16(*a2, v8);
    v30 = (int32x2_t)vtrn1_s16(v10, v12);
    v32 = a2[28];
    v31 = a2[29];
    v33 = (int32x2_t)vtrn2_s16(v10, v12);
    v34 = vzip1_s32(v28, v30);
    v35 = vzip2_s32(v28, v30);
    v37 = a2[6];
    v36 = a2[7];
    v38 = vzip1_s32(v29, v33);
    v39 = vzip2_s32(v29, v33);
    v40 = (int32x2_t)vtrn1_s16(v7, v9);
    v41 = a2[14];
    v42 = a2[15];
    v43 = (int32x2_t)vtrn2_s16(v7, v9);
    v44 = (int32x2_t)vtrn1_s16(v11, v13);
    v45 = (int32x2_t)vtrn2_s16(v11, v13);
    v46 = a2[22];
    v47 = a2[23];
    v48 = vzip1_s32(v40, v44);
    v49 = vzip2_s32(v40, v44);
    v98[0] = (int16x4_t)v34;
    v50 = vzip1_s32(v43, v45);
    v51 = vzip2_s32(v43, v45);
    v52 = (int32x2_t)vtrn1_s16(v14, v16);
    v53 = (int32x2_t)vtrn2_s16(v14, v16);
    v54 = (int32x2_t)vtrn1_s16(v18, v20);
    v55 = (int32x2_t)vtrn2_s16(v18, v20);
    v56 = vzip1_s32(v52, v54);
    v57 = vzip2_s32(v52, v54);
    v58 = vzip1_s32(v53, v55);
    v59 = vzip2_s32(v53, v55);
    v60 = (int32x2_t)vtrn1_s16(v15, v17);
    v61 = (int32x2_t)vtrn2_s16(v15, v17);
    v62 = (int32x2_t)vtrn1_s16(v19, v21);
    v63 = (int32x2_t)vtrn2_s16(v19, v21);
    v64 = vzip1_s32(v60, v62);
    v65 = vzip2_s32(v60, v62);
    v66 = vzip1_s32(v61, v63);
    v67 = vzip2_s32(v61, v63);
    v68 = (int32x2_t)vtrn1_s16(v22, v24);
    v69 = (int32x2_t)vtrn2_s16(v22, v24);
    v70 = (int32x2_t)vtrn1_s16(v26, v32);
    v71 = (int32x2_t)vtrn2_s16(v26, v32);
    v72 = vzip1_s32(v68, v70);
    v73 = vzip2_s32(v68, v70);
    v74 = vzip1_s32(v69, v71);
    v75 = vzip2_s32(v69, v71);
    v76 = (int32x2_t)vtrn1_s16(v23, v25);
    v77 = (int32x2_t)vtrn2_s16(v23, v25);
    v78 = (int32x2_t)vtrn1_s16(v27, v31);
    v79 = (int32x2_t)vtrn2_s16(v27, v31);
    v80 = vzip1_s32(v76, v78);
    v81 = vzip2_s32(v76, v78);
    v82 = vzip1_s32(v77, v79);
    v83 = vzip2_s32(v77, v79);
    v84 = (int32x2_t)vtrn1_s16(v37, v41);
    v85 = (int32x2_t)vtrn2_s16(v37, v41);
    v86 = a2[30];
    v87 = a2[31];
    v98[1] = (int16x4_t)v39;
    v98[2] = (int16x4_t)v38;
    v88 = (int32x2_t)vtrn1_s16(v46, v86);
    v89 = (int32x2_t)vtrn2_s16(v46, v86);
    v90 = vzip1_s32(v84, v88);
    v91 = vzip2_s32(v84, v88);
    v98[3] = (int16x4_t)v35;
    v98[4] = (int16x4_t)v51;
    v92 = vzip1_s32(v85, v89);
    v93 = vzip2_s32(v85, v89);
    v98[5] = (int16x4_t)v48;
    v98[6] = (int16x4_t)v49;
    v94 = (int32x2_t)vtrn1_s16(v36, v42);
    v95 = (int32x2_t)vtrn2_s16(v36, v42);
    v96 = (int32x2_t)vtrn1_s16(v47, v87);
    v97 = (int32x2_t)vtrn2_s16(v47, v87);
    v98[7] = (int16x4_t)v50;
    v98[8] = (int16x4_t)v67;
    v98[9] = (int16x4_t)v64;
    v98[10] = (int16x4_t)v65;
    v98[11] = (int16x4_t)v66;
    v98[12] = (int16x4_t)v56;
    v98[13] = (int16x4_t)v59;
    v98[14] = (int16x4_t)v58;
    v98[15] = (int16x4_t)v57;
    v98[16] = (int16x4_t)vzip2_s32(v95, v97);
    v98[17] = (int16x4_t)vzip1_s32(v94, v96);
    v98[18] = (int16x4_t)vzip2_s32(v94, v96);
    v98[19] = (int16x4_t)vzip1_s32(v95, v97);
    v98[20] = (int16x4_t)v90;
    v98[21] = (int16x4_t)v93;
    v98[22] = (int16x4_t)v92;
    v98[23] = (int16x4_t)v91;
    v98[24] = (int16x4_t)v72;
    v98[25] = (int16x4_t)v75;
    v98[26] = (int16x4_t)v74;
    v98[27] = (int16x4_t)v73;
    v98[28] = (int16x4_t)v83;
    v98[29] = (int16x4_t)v80;
    v98[30] = (int16x4_t)v81;
    v98[31] = (int16x4_t)v82;
    sub_1C981A770(a1++, a3, v98);
    v6 += 4;
    a2 += 32;
  }
  while (v6 < 0x1C);
}

void sub_1C9819FE4(int16x4_t *a1, int16x4_t *a2)
{
  unsigned int v4;
  int16x4_t v5;
  int16x4_t v6;
  int16x4_t v7;
  int32x2_t v8;
  int32x2_t v9;
  int16x4_t v10;
  int16x4_t v11;
  int16x4_t v12;
  int16x4_t v13;
  int32x2_t v14;
  int32x2_t v15;
  int32x2_t v16;
  int32x2_t v17;
  int32x2_t v18;
  int32x2_t v19;
  int16x4_t v20;
  int16x4_t v21;
  int16x4_t v22;
  int16x4_t v23;
  int32x2_t v24;
  int32x2_t v25;
  int16x4_t v26;
  int16x4_t v27;
  int16x4_t v28;
  int16x4_t v29;
  int32x2_t v30;
  int32x2_t v31;
  int32x2_t v32;
  int32x2_t v33;
  int32x2_t v34;
  int32x2_t v35;
  int16x4_t v36;
  int16x4_t v37;
  int16x4_t v38;
  int16x4_t v39;
  int32x2_t v40;
  int32x2_t v41;
  int16x4_t v42;
  int16x4_t v43;
  int16x4_t v44;
  int16x4_t v45;
  int32x2_t v46;
  int32x2_t v47;
  int32x2_t v48;
  int32x2_t v49;
  int32x2_t v50;
  int16x4_t v51;
  int16x4_t v52;
  int16x4_t v53;
  int16x4_t v54;
  int32x2_t v55;
  int32x2_t v56;
  int16x4_t v57;
  int16x4_t v58;
  int16x4_t v59;
  int16x4_t v60;
  int32x2_t v61;
  int32x2_t v62;
  int32x2_t v63;
  int32x2_t v64;
  int32x2_t v65;
  int32x2_t v66;
  int32x2_t v67;
  int32x4_t v68[32];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = -4;
  do
  {
    v5 = a2[1];
    v6 = a2[8];
    v7 = a2[9];
    v8 = (int32x2_t)vtrn1_s16(*a2, v6);
    v9 = (int32x2_t)vtrn2_s16(*a2, v6);
    v10 = a2[16];
    v11 = a2[17];
    v12 = a2[24];
    v13 = a2[25];
    v14 = (int32x2_t)vtrn1_s16(v10, v12);
    v15 = (int32x2_t)vtrn2_s16(v10, v12);
    v16 = (int32x2_t)vtrn1_s16(v5, v7);
    v17 = (int32x2_t)vtrn2_s16(v5, v7);
    v18 = (int32x2_t)vtrn1_s16(v11, v13);
    v19 = (int32x2_t)vtrn2_s16(v11, v13);
    v20 = a2[2];
    v21 = a2[3];
    v22 = a2[10];
    v23 = a2[11];
    v24 = (int32x2_t)vtrn1_s16(v20, v22);
    v25 = (int32x2_t)vtrn2_s16(v20, v22);
    v26 = a2[18];
    v27 = a2[19];
    v28 = a2[26];
    v29 = a2[27];
    v30 = (int32x2_t)vtrn1_s16(v26, v28);
    v31 = (int32x2_t)vtrn2_s16(v26, v28);
    v32 = (int32x2_t)vtrn1_s16(v21, v23);
    v33 = (int32x2_t)vtrn2_s16(v21, v23);
    v34 = (int32x2_t)vtrn1_s16(v27, v29);
    v35 = (int32x2_t)vtrn2_s16(v27, v29);
    v36 = a2[4];
    v37 = a2[5];
    v38 = a2[12];
    v39 = a2[13];
    v40 = (int32x2_t)vtrn1_s16(v36, v38);
    v41 = (int32x2_t)vtrn2_s16(v36, v38);
    v42 = a2[20];
    v43 = a2[21];
    v44 = a2[28];
    v45 = a2[29];
    v46 = (int32x2_t)vtrn1_s16(v42, v44);
    v47 = (int32x2_t)vtrn2_s16(v42, v44);
    v67 = (int32x2_t)vtrn1_s16(v37, v39);
    v48 = (int32x2_t)vtrn2_s16(v37, v39);
    v49 = (int32x2_t)vtrn1_s16(v43, v45);
    v50 = (int32x2_t)vtrn2_s16(v43, v45);
    v51 = a2[6];
    v52 = a2[7];
    v53 = a2[14];
    v54 = a2[15];
    v55 = (int32x2_t)vtrn1_s16(v51, v53);
    v56 = (int32x2_t)vtrn2_s16(v51, v53);
    v57 = a2[22];
    v58 = a2[23];
    v60 = a2[30];
    v59 = a2[31];
    v61 = (int32x2_t)vtrn1_s16(v57, v60);
    v62 = (int32x2_t)vtrn2_s16(v57, v60);
    v63 = (int32x2_t)vtrn1_s16(v52, v54);
    v64 = (int32x2_t)vtrn2_s16(v52, v54);
    v65 = (int32x2_t)vtrn1_s16(v58, v59);
    v66 = (int32x2_t)vtrn2_s16(v58, v59);
    v68[0] = vmovl_s16((int16x4_t)vzip1_s32(v8, v14));
    v68[1] = vmovl_s16((int16x4_t)vzip2_s32(v9, v15));
    v68[2] = vmovl_s16((int16x4_t)vzip1_s32(v9, v15));
    v68[3] = vmovl_s16((int16x4_t)vzip2_s32(v8, v14));
    v68[4] = vmovl_s16((int16x4_t)vzip2_s32(v17, v19));
    v68[5] = vmovl_s16((int16x4_t)vzip1_s32(v16, v18));
    v68[6] = vmovl_s16((int16x4_t)vzip2_s32(v16, v18));
    v68[7] = vmovl_s16((int16x4_t)vzip1_s32(v17, v19));
    v68[8] = vmovl_s16((int16x4_t)vzip2_s32(v33, v35));
    v68[9] = vmovl_s16((int16x4_t)vzip1_s32(v32, v34));
    v68[10] = vmovl_s16((int16x4_t)vzip2_s32(v32, v34));
    v68[11] = vmovl_s16((int16x4_t)vzip1_s32(v33, v35));
    v68[12] = vmovl_s16((int16x4_t)vzip1_s32(v24, v30));
    v68[13] = vmovl_s16((int16x4_t)vzip2_s32(v25, v31));
    v68[14] = vmovl_s16((int16x4_t)vzip1_s32(v25, v31));
    v68[15] = vmovl_s16((int16x4_t)vzip2_s32(v24, v30));
    v68[16] = vmovl_s16((int16x4_t)vzip2_s32(v64, v66));
    v68[17] = vmovl_s16((int16x4_t)vzip1_s32(v63, v65));
    v68[18] = vmovl_s16((int16x4_t)vzip2_s32(v63, v65));
    v68[19] = vmovl_s16((int16x4_t)vzip1_s32(v64, v66));
    v68[20] = vmovl_s16((int16x4_t)vzip1_s32(v55, v61));
    v68[21] = vmovl_s16((int16x4_t)vzip2_s32(v56, v62));
    v68[22] = vmovl_s16((int16x4_t)vzip1_s32(v56, v62));
    v68[23] = vmovl_s16((int16x4_t)vzip2_s32(v55, v61));
    v68[24] = vmovl_s16((int16x4_t)vzip1_s32(v40, v46));
    v68[25] = vmovl_s16((int16x4_t)vzip2_s32(v41, v47));
    v68[26] = vmovl_s16((int16x4_t)vzip1_s32(v41, v47));
    v68[27] = vmovl_s16((int16x4_t)vzip2_s32(v40, v46));
    v68[28] = vmovl_s16((int16x4_t)vzip2_s32(v48, v50));
    v68[29] = vmovl_s16((int16x4_t)vzip1_s32(v67, v49));
    v68[30] = vmovl_s16((int16x4_t)vzip2_s32(v67, v49));
    v68[31] = vmovl_s16((int16x4_t)vzip1_s32(v48, v50));
    sub_1C981A28C(a1++, v68);
    v4 += 4;
    a2 += 32;
  }
  while (v4 < 0x1C);
}

int16x4_t sub_1C981A28C(int16x4_t *a1, int32x4_t *a2)
{
  int32x4_t v2;
  int32x4_t v3;
  int32x4_t v4;
  int32x4_t v5;
  int32x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int32x4_t v34;
  int32x4_t v35;
  int32x4_t v36;
  int32x4_t v37;
  int32x4_t v38;
  int32x4_t v39;
  int32x4_t v40;
  int32x4_t v41;
  int32x4_t v42;
  int32x4_t v43;
  int32x4_t v44;
  int32x4_t v45;
  int32x4_t v46;
  int32x4_t v47;
  int32x4_t v48;
  int32x4_t v49;
  int32x4_t v50;
  int32x4_t v51;
  int32x4_t v52;
  int32x4_t v53;
  int32x4_t v54;
  int32x4_t v55;
  int32x4_t v56;
  int32x4_t v57;
  int32x4_t v58;
  int32x4_t v59;
  int32x4_t v60;
  int32x4_t v61;
  int32x4_t v62;
  int32x4_t v63;
  int32x4_t v64;
  int16x4_t *v65;
  uint64_t v66;
  int16x8_t v67;

  v2 = a2[16];
  v3 = a2[17];
  v4 = a2[18];
  v5 = a2[19];
  v6 = a2[20];
  v7 = a2[21];
  v8 = a2[22];
  v9 = a2[23];
  v10 = a2[24];
  v11 = a2[25];
  v12 = a2[26];
  v13 = a2[27];
  v14 = a2[28];
  v15 = a2[29];
  v16 = a2[30];
  v17 = a2[31];
  v18 = a2[1];
  v19 = vaddq_s32(*a2, v2);
  v20 = vsubq_s32(*a2, v2);
  v21 = vaddq_s32(v18, v3);
  v22 = vsubq_s32(v18, v3);
  *a2 = v19;
  a2[1] = v21;
  v23 = a2[2];
  v24 = a2[3];
  v25 = vaddq_s32(v23, v4);
  v26 = vsubq_s32(v23, v4);
  v27 = vaddq_s32(v24, v5);
  v28 = vsubq_s32(v24, v5);
  a2[2] = v25;
  a2[3] = v27;
  v29 = a2[4];
  v30 = a2[5];
  v31 = vaddq_s32(v29, v6);
  v32 = vsubq_s32(v29, v6);
  v33 = vaddq_s32(v30, v7);
  v34 = vsubq_s32(v30, v7);
  a2[4] = v31;
  a2[5] = v33;
  v35 = a2[6];
  v36 = a2[7];
  v37 = vaddq_s32(v35, v8);
  v38 = vsubq_s32(v35, v8);
  v39 = vaddq_s32(v36, v9);
  v40 = vsubq_s32(v36, v9);
  a2[6] = v37;
  a2[7] = v39;
  v41 = a2[8];
  v42 = a2[9];
  v43 = vaddq_s32(v41, v10);
  v44 = vsubq_s32(v41, v10);
  v45 = vaddq_s32(v42, v11);
  v46 = vsubq_s32(v42, v11);
  a2[8] = v43;
  a2[9] = v45;
  v47 = a2[10];
  v48 = a2[11];
  v49 = vaddq_s32(v47, v12);
  v50 = vsubq_s32(v47, v12);
  v51 = vaddq_s32(v48, v13);
  v52 = vsubq_s32(v48, v13);
  a2[10] = v49;
  a2[11] = v51;
  v53 = a2[12];
  v54 = a2[13];
  v55 = vaddq_s32(v53, v14);
  v56 = vsubq_s32(v53, v14);
  v57 = vaddq_s32(v54, v15);
  v58 = vsubq_s32(v54, v15);
  a2[12] = v55;
  a2[13] = v57;
  v59 = a2[14];
  v60 = a2[15];
  v61 = vaddq_s32(v59, v16);
  v62 = vsubq_s32(v59, v16);
  v63 = vaddq_s32(v60, v17);
  v64 = vsubq_s32(v60, v17);
  v65 = (int16x4_t *)&unk_1C98610F0;
  v66 = 8;
  a2[14] = v61;
  a2[15] = v63;
  do
  {
    v67 = *(int16x8_t *)v65[-2].i8;
    a1[v66] = vqmovn_s32(vrshrq_n_s32(vmlaq_s32(vmlaq_s32(vmlaq_s32(vmlaq_s32(vmlaq_s32(vmlaq_s32(vmlaq_s32(vmlaq_s32(vmlaq_s32(vmlaq_s32(vmlaq_s32(vmlaq_s32(vmlaq_s32(vmlaq_s32(vmlaq_s32(vmulq_s32(vmovl_s16(vdup_lane_s16(*(int16x4_t *)v67.i8, 1)), v22), vmovl_s16(vdup_lane_s16(*(int16x4_t *)v67.i8, 0)), v20),
                                              vmovl_s16(vdup_lane_s16(*(int16x4_t *)v67.i8, 2)),
                                              v26),
                                            vmovl_s16(vdup_lane_s16(*(int16x4_t *)v67.i8, 3)),
                                            v28),
                                          vmovl_s16(vdup_laneq_s16(v67, 4)),
                                          v32),
                                        vmovl_s16(vdup_laneq_s16(v67, 5)),
                                        v34),
                                      vmovl_s16(vdup_laneq_s16(v67, 6)),
                                      v38),
                                    vmovl_s16(vdup_laneq_s16(v67, 7)),
                                    v40),
                                  vmovl_s16(vdup_lane_s16(*v65, 1)),
                                  v46),
                                vmovl_s16(vdup_lane_s16(*v65, 0)),
                                v44),
                              vmovl_s16(vdup_lane_s16(*v65, 2)),
                              v50),
                            vmovl_s16(vdup_lane_s16(*v65, 3)),
                            v52),
                          vmovl_s16(vdup_laneq_s16(*(int16x8_t *)v65->i8, 4)),
                          v56),
                        vmovl_s16(vdup_laneq_s16(*(int16x8_t *)v65->i8, 5)),
                        v58),
                      vmovl_s16(vdup_laneq_s16(*(int16x8_t *)v65->i8, 6)),
                      v62),
                    vmovl_s16(vdup_laneq_s16(*(int16x8_t *)v65->i8, 7)),
                    v64),
                  0xBuLL));
    v66 += 16;
    v65 += 4;
  }
  while (v66 != 264);
  return sub_1C981A488(a1, 64, 11, a2);
}

int16x4_t sub_1C981A488(int16x4_t *a1, uint64_t a2, int a3, int32x4_t *a4)
{
  unint64_t v4;
  int32x4_t v5;
  int32x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int32x4_t v30;
  int16x4_t *v31;
  __int16 *v32;
  int16x8_t v33;
  BOOL v34;
  int32x4_t v36;
  int32x4_t v37;

  v4 = 0;
  v5 = a4[2];
  v6 = a4[3];
  v7 = a4[4];
  v8 = a4[5];
  v9 = a4[8];
  v10 = a4[9];
  v11 = a4[10];
  v12 = a4[11];
  v13 = a4[12];
  v14 = a4[13];
  v36 = a4[1];
  v37 = *a4;
  v15 = vsubq_s32(*a4, v9);
  v16 = vsubq_s32(v36, v10);
  v17 = vsubq_s32(v5, v11);
  v18 = vsubq_s32(v6, v12);
  v19 = vsubq_s32(v7, v13);
  v20 = vsubq_s32(v8, v14);
  v21 = a4[6];
  v22 = a4[7];
  v23 = a4[14];
  v24 = a4[15];
  v25 = vsubq_s32(v21, v23);
  v26 = vsubq_s32(v22, v24);
  v27 = 6 * a2;
  v28 = 8 * a2;
  v29 = 2 * a2;
  v30 = vdupq_n_s32(-a3);
  v31 = a1;
  do
  {
    v32 = &aZfwp9[8 * v4];
    v33 = *((int16x8_t *)v32 + 1);
    *(int16x4_t *)((char *)v31 + v29) = vqmovn_s32(vrshlq_s32(vmlaq_s32(vmlaq_s32(vmlaq_s32(vmlaq_s32(vmlaq_s32(vmlaq_s32(vmlaq_s32(vmulq_s32(vmovl_s16(vdup_lane_s16(*(int16x4_t *)v32, 1)), v16), vmovl_s16(vdup_lane_s16(*(int16x4_t *)v32, 0)), v15), vmovl_s16(vdup_lane_s16(*(int16x4_t *)v32, 2)), v17), vmovl_s16(vdup_lane_s16(*(int16x4_t *)v32, 3)), v18), vmovl_s16(vdup_laneq_s16(*(int16x8_t *)v32, 4)), v19), vmovl_s16(vdup_laneq_s16(*(int16x8_t *)v32, 5)), v20),
                                                vmovl_s16(vdup_laneq_s16(*(int16x8_t *)v32, 6)),
                                                v25),
                                              vmovl_s16(vdup_laneq_s16(*(int16x8_t *)v32, 7)),
                                              v26),
                                            v30));
    *(int16x4_t *)((char *)v31 + v27) = vqmovn_s32(vrshlq_s32(vmlaq_s32(vmlaq_s32(vmlaq_s32(vmlaq_s32(vmlaq_s32(vmlaq_s32(vmlaq_s32(vmulq_s32(vmovl_s16(vdup_lane_s16(*(int16x4_t *)v33.i8, 1)), v16), vmovl_s16(vdup_lane_s16(*(int16x4_t *)v33.i8, 0)), v15), vmovl_s16(vdup_lane_s16(*(int16x4_t *)v33.i8, 2)), v17), vmovl_s16(vdup_lane_s16(*(int16x4_t *)v33.i8, 3)), v18), vmovl_s16(vdup_laneq_s16(v33, 4)), v19),
                                                  vmovl_s16(vdup_laneq_s16(v33, 5)),
                                                  v20),
                                                vmovl_s16(vdup_laneq_s16(v33, 6)),
                                                v25),
                                              vmovl_s16(vdup_laneq_s16(v33, 7)),
                                              v26),
                                            v30));
    v31 = (int16x4_t *)((char *)v31 + v28);
    v34 = v4 >= 6;
    v4 += 2;
  }
  while (!v34);
  return sub_1C981A63C(a1, v29, a3, vaddq_s32(v9, v37), vaddq_s32(v10, v36), vaddq_s32(v11, v5), vaddq_s32(v12, v6), vaddq_s32(v13, v7), vaddq_s32(v14, v8), vaddq_s32(v23, v21), vaddq_s32(v24, v22));
}

int16x4_t sub_1C981A63C(int16x4_t *a1, uint64_t a2, int a3, int32x4_t a4, int32x4_t a5, int32x4_t a6, int32x4_t a7, int32x4_t a8, int32x4_t a9, int32x4_t a10, int32x4_t a11)
{
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int16x4_t *v30;
  uint64_t v31;
  uint64_t v32;
  int32x4_t v33;
  int32x4_t v34;
  int32x4_t v35;
  int32x4_t v36;
  int32x4_t v37;
  int32x4_t v38;
  int32x4_t v39;
  int32x4_t v40;
  int32x4_t v41;
  int16x4_t result;

  v11 = vaddq_s32(a8, a4);
  v12 = vsubq_s32(a4, a8);
  v13 = vaddq_s32(a9, a5);
  v14 = vsubq_s32(a5, a9);
  v15 = vaddq_s32(a10, a6);
  v16 = vsubq_s32(a6, a10);
  v17 = vaddq_s32(a11, a7);
  v18 = vsubq_s32(a7, a11);
  v19.i64[0] = 0x5900000059;
  v19.i64[1] = 0x5900000059;
  v20.i64[0] = 0x1200000012;
  v20.i64[1] = 0x1200000012;
  v21.i64[0] = 0x4B0000004BLL;
  v21.i64[1] = 0x4B0000004BLL;
  v22.i64[0] = 0x3200000032;
  v22.i64[1] = 0x3200000032;
  v23 = vmlaq_s32(vmlaq_s32(vmlaq_s32(vmulq_s32(v12, v19), v14, v20), v16, v21), v18, v22);
  v24.i64[0] = 0x3100000031;
  v24.i64[1] = 0x3100000031;
  v25.i64[0] = 0x1100000011;
  v25.i64[1] = 0x1100000011;
  v26 = vmlaq_s32(vmlaq_s32(vmulq_s32(v12, v21), v14, v24), v16, v25);
  v25.i64[0] = 0x5800000058;
  v25.i64[1] = 0x5800000058;
  v27 = vmlaq_s32(vmlaq_s32(vmlaq_s32(vmulq_s32(v12, v22), v14, v21), v16, v25), v18, v20);
  v28 = vmlaq_s32(vmlaq_s32(vmlaq_s32(vmulq_s32(v12, v20), v14, v25), v16, v24), v18, v21);
  v29 = vdupq_n_s32(-a3);
  v30 = (int16x4_t *)((char *)a1 + 2 * a2);
  *v30 = vqmovn_s32(vrshlq_s32(v23, v29));
  v31 = 4 * a2;
  *(int16x4_t *)((char *)v30 + v31) = vqmovn_s32(vrshlq_s32(vmlaq_s32(v26, v18, v25), v29));
  v30[a2] = vqmovn_s32(vrshlq_s32(v27, v29));
  v32 = 12 * a2;
  *(int16x4_t *)((char *)v30 + v32) = vqmovn_s32(vrshlq_s32(v28, v29));
  v33 = vaddq_s32(v13, v11);
  v34 = vsubq_s32(v11, v13);
  v35 = vaddq_s32(v17, v15);
  v36 = vsubq_s32(v15, v17);
  v15.i64[0] = 0x5300000053;
  v15.i64[1] = 0x5300000053;
  v37 = vmulq_s32(v34, v15);
  v17.i64[0] = 0x2400000024;
  v17.i64[1] = 0x2400000024;
  v38 = vmulq_s32(v34, v17);
  v39 = vmlaq_s32(v37, v36, v17);
  v17.i64[0] = 0x5200000052;
  v17.i64[1] = 0x5200000052;
  v40 = vmlaq_s32(v38, v36, v17);
  v41 = vaddq_s32(v35, v33);
  result = vqmovn_s32(vrshlq_s32(vshlq_n_s32(vsubq_s32(v33, v35), 6uLL), v29));
  *a1 = vqmovn_s32(vrshlq_s32(vshlq_n_s32(v41, 6uLL), v29));
  *(int16x4_t *)((char *)a1 + v31) = vqmovn_s32(vrshlq_s32(v39, v29));
  a1[a2] = result;
  *(int16x4_t *)((char *)a1 + v32) = vqmovn_s32(vrshlq_s32(v40, v29));
  return result;
}

int16x4_t sub_1C981A770(int16x4_t *a1, int a2, int16x4_t *a3)
{
  int16x4_t v3;
  int16x4_t v4;
  int16x4_t v5;
  int16x4_t v6;
  int16x4_t v7;
  int16x4_t v8;
  int16x4_t v9;
  int16x4_t v10;
  int16x4_t v11;
  int16x4_t v12;
  int16x4_t v13;
  int16x4_t v14;
  int16x4_t v15;
  int16x4_t v16;
  int16x4_t v17;
  int16x4_t v18;
  int16x4_t v19;
  int16x4_t v20;
  int16x4_t v21;
  int16x4_t v22;
  int16x4_t v23;
  int16x4_t v24;
  int16x4_t v25;
  int16x4_t v26;
  int16x4_t v27;
  int16x4_t v28;
  int16x4_t v29;
  int16x4_t v30;
  int16x4_t v31;
  int16x4_t v32;
  int16x4_t v33;
  int16x4_t v34;
  int16x4_t v35;
  int16x4_t v36;
  int16x4_t v37;
  int16x4_t v38;
  int16x4_t v39;
  int16x4_t v40;
  int16x4_t v41;
  int16x4_t v42;
  int16x4_t v43;
  int16x4_t v44;
  int16x4_t v45;
  int16x4_t v46;
  int16x4_t v47;
  int16x4_t v48;
  int16x4_t v49;
  int16x4_t v50;
  int16x4_t v51;
  int16x4_t v52;
  int16x4_t v53;
  int16x4_t v54;
  int16x4_t v55;
  int16x4_t v56;
  int16x4_t v57;
  int16x4_t v58;
  int16x4_t v59;
  int16x4_t v60;
  int16x4_t v61;
  int16x4_t v62;
  int16x4_t v63;
  int16x4_t v64;
  int32x4_t v65;
  int16x4_t v66;
  int16x4_t *v67;
  uint64_t v68;
  int16x8_t v69;

  v3 = a3[16];
  v4 = a3[17];
  v5 = a3[18];
  v6 = a3[19];
  v7 = a3[20];
  v8 = a3[21];
  v9 = a3[22];
  v10 = a3[23];
  v11 = a3[24];
  v12 = a3[25];
  v13 = a3[26];
  v14 = a3[27];
  v15 = a3[28];
  v16 = a3[29];
  v18 = a3[30];
  v17 = a3[31];
  v19 = a3[1];
  v20 = vadd_s16(*a3, v3);
  v21 = vsub_s16(*a3, v3);
  v22 = vadd_s16(v19, v4);
  v23 = vsub_s16(v19, v4);
  *a3 = v20;
  a3[1] = v22;
  v24 = a3[2];
  v25 = a3[3];
  v26 = vadd_s16(v24, v5);
  v27 = vsub_s16(v24, v5);
  v28 = vadd_s16(v25, v6);
  v29 = vsub_s16(v25, v6);
  a3[2] = v26;
  a3[3] = v28;
  v30 = a3[4];
  v31 = a3[5];
  v32 = vadd_s16(v30, v7);
  v33 = vsub_s16(v30, v7);
  v34 = vadd_s16(v31, v8);
  v35 = vsub_s16(v31, v8);
  a3[4] = v32;
  a3[5] = v34;
  v36 = a3[6];
  v37 = a3[7];
  v38 = vadd_s16(v36, v9);
  v39 = vsub_s16(v36, v9);
  v40 = vadd_s16(v37, v10);
  v41 = vsub_s16(v37, v10);
  a3[6] = v38;
  a3[7] = v40;
  v42 = a3[8];
  v43 = a3[9];
  v44 = vadd_s16(v42, v11);
  v45 = vsub_s16(v42, v11);
  v46 = vadd_s16(v43, v12);
  v47 = vsub_s16(v43, v12);
  a3[8] = v44;
  a3[9] = v46;
  v48 = a3[10];
  v49 = a3[11];
  v50 = vadd_s16(v48, v13);
  v51 = vsub_s16(v48, v13);
  v52 = vadd_s16(v49, v14);
  v53 = vsub_s16(v49, v14);
  a3[10] = v50;
  a3[11] = v52;
  v54 = a3[12];
  v55 = a3[13];
  v56 = vadd_s16(v54, v15);
  v57 = vsub_s16(v54, v15);
  v58 = vadd_s16(v55, v16);
  v59 = vsub_s16(v55, v16);
  a3[12] = v56;
  a3[13] = v58;
  v60 = a3[14];
  v61 = a3[15];
  v62 = vadd_s16(v60, v18);
  v63 = vsub_s16(v60, v18);
  v64 = vadd_s16(v61, v17);
  v65 = vdupq_n_s32(-a2);
  v66 = vsub_s16(v61, v17);
  v67 = (int16x4_t *)&unk_1C98610F0;
  v68 = 8;
  a3[14] = v62;
  a3[15] = v64;
  do
  {
    v69 = *(int16x8_t *)v67[-2].i8;
    a1[v68] = vqmovn_s32(vrshlq_s32(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmull_lane_s16(v23, *(int16x4_t *)v69.i8, 1), v21, *(int16x4_t *)v69.i8,
                                                0),
                                              v27,
                                              *(int16x4_t *)v69.i8,
                                              2),
                                            v29,
                                            *(int16x4_t *)v69.i8,
                                            3),
                                          v33,
                                          v69,
                                          4),
                                        v35,
                                        v69,
                                        5),
                                      v39,
                                      v69,
                                      6),
                                    v41,
                                    v69,
                                    7),
                                  v45,
                                  *v67,
                                  0),
                                v47,
                                *v67,
                                1),
                              v51,
                              *v67,
                              2),
                            v53,
                            *v67,
                            3),
                          v57,
                          *(int16x8_t *)v67->i8,
                          4),
                        v59,
                        *(int16x8_t *)v67->i8,
                        5),
                      v63,
                      *(int16x8_t *)v67->i8,
                      6),
                    v66,
                    *(int16x8_t *)v67->i8,
                    7),
                  v65));
    v68 += 16;
    v67 += 4;
  }
  while (v68 != 264);
  return sub_1C981A8DC(a1, 64, a2, a3);
}

int16x4_t sub_1C981A8DC(int16x4_t *a1, uint64_t a2, int a3, int16x4_t *a4)
{
  unint64_t v4;
  int16x4_t v5;
  int16x4_t v6;
  int16x4_t v7;
  int16x4_t v8;
  int16x4_t v9;
  int16x4_t v10;
  int16x4_t v11;
  int16x4_t v12;
  int16x4_t v13;
  int16x4_t v14;
  int16x4_t v15;
  int16x4_t v16;
  int16x4_t v17;
  int16x4_t v18;
  int16x4_t v19;
  int16x4_t v20;
  int16x4_t v21;
  int16x4_t v22;
  int16x4_t v23;
  int16x4_t v24;
  int16x4_t v25;
  int16x4_t v26;
  int16x4_t v27;
  int16x4_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int32x4_t v32;
  int16x4_t *v33;
  __int16 *v34;
  int16x8_t v35;
  BOOL v36;

  v4 = 0;
  v5 = *a4;
  v6 = a4[1];
  v7 = a4[2];
  v8 = a4[3];
  v9 = a4[4];
  v10 = a4[5];
  v11 = a4[8];
  v12 = a4[9];
  v13 = a4[10];
  v14 = a4[11];
  v15 = a4[12];
  v16 = a4[13];
  v17 = vsub_s16(*a4, v11);
  v18 = vsub_s16(v6, v12);
  v19 = vsub_s16(v7, v13);
  v20 = vsub_s16(v8, v14);
  v21 = vsub_s16(v9, v15);
  v22 = vsub_s16(v10, v16);
  v23 = a4[6];
  v24 = a4[7];
  v25 = a4[14];
  v26 = a4[15];
  v27 = vsub_s16(v23, v25);
  v28 = vsub_s16(v24, v26);
  v29 = 6 * a2;
  v30 = 8 * a2;
  v31 = 2 * a2;
  v32 = vdupq_n_s32(-a3);
  v33 = a1;
  do
  {
    v34 = &aZfwp9[8 * v4];
    v35 = *((int16x8_t *)v34 + 1);
    *(int16x4_t *)((char *)v33 + v31) = vqmovn_s32(vrshlq_s32(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmull_lane_s16(v18, *(int16x4_t *)v34, 1), v17, *(int16x4_t *)v34, 0), v19, *(int16x4_t *)v34, 2), v20, *(int16x4_t *)v34, 3), v21,
                                                    *(int16x8_t *)v34,
                                                    4),
                                                  v22,
                                                  *(int16x8_t *)v34,
                                                  5),
                                                v27,
                                                *(int16x8_t *)v34,
                                                6),
                                              v28,
                                              *(int16x8_t *)v34,
                                              7),
                                            v32));
    *(int16x4_t *)((char *)v33 + v29) = vqmovn_s32(vrshlq_s32(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmull_lane_s16(v18, *(int16x4_t *)v35.i8, 1), v17, *(int16x4_t *)v35.i8, 0), v19, *(int16x4_t *)v35.i8, 2), v20, *(int16x4_t *)v35.i8, 3), v21,
                                                    v35,
                                                    4),
                                                  v22,
                                                  v35,
                                                  5),
                                                v27,
                                                v35,
                                                6),
                                              v28,
                                              v35,
                                              7),
                                            v32));
    v33 = (int16x4_t *)((char *)v33 + v30);
    v36 = v4 >= 6;
    v4 += 2;
  }
  while (!v36);
  return sub_1C981A9EC(a1, v31, a3, vadd_s16(v11, v5), vadd_s16(v12, v6), vadd_s16(v13, v7), vadd_s16(v14, v8), vadd_s16(v15, v9), vadd_s16(v16, v10), vadd_s16(v25, v23), vadd_s16(v26, v24));
}

int16x4_t sub_1C981A9EC(int16x4_t *a1, uint64_t a2, int a3, int16x4_t a4, int16x4_t a5, int16x4_t a6, int16x4_t a7, int16x4_t a8, int16x4_t a9, int16x4_t a10, int16x4_t a11)
{
  int16x4_t v11;
  int16x4_t v12;
  int16x4_t v13;
  int16x4_t v14;
  int16x4_t v15;
  int16x4_t v16;
  int16x4_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int16x4_t *v23;
  uint64_t v24;
  uint64_t v25;
  int16x4_t v26;
  int16x4_t v27;
  int16x4_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int16x4_t v32;
  int16x4_t result;

  v11 = vadd_s16(a8, a4);
  v12 = vsub_s16(a4, a8);
  v13 = vadd_s16(a9, a5);
  v14 = vsub_s16(a5, a9);
  v15 = vadd_s16(a10, a6);
  v16 = vsub_s16(a6, a10);
  v17 = vsub_s16(a7, a11);
  v18 = vmlal_s16(vmlal_s16(vmlal_s16(vmull_s16(v14, (int16x4_t)0x12001200120012), v12, (int16x4_t)0x59005900590059), v16, (int16x4_t)0x4B004B004B004BLL), v17, (int16x4_t)0x32003200320032);
  v19 = vmlal_s16(vmlal_s16(vmull_s16(v14, (int16x4_t)0x31003100310031), v12, (int16x4_t)0x4B004B004B004BLL), v16, (int16x4_t)0x11001100110011);
  v20 = vmlal_s16(vmull_s16(v14, (int16x4_t)0x4B004B004B004BLL), v12, (int16x4_t)0x32003200320032);
  v21 = vmlal_s16(vmlal_s16(vmlal_s16(vmull_s16(v14, (int16x4_t)0x58005800580058), v12, (int16x4_t)0x12001200120012), v16, (int16x4_t)0x31003100310031), v17, (int16x4_t)0x4B004B004B004BLL);
  v22 = vdupq_n_s32(-a3);
  v23 = (int16x4_t *)((char *)a1 + 2 * a2);
  *v23 = vqmovn_s32(vrshlq_s32(v18, v22));
  v24 = 4 * a2;
  *(int16x4_t *)((char *)v23 + v24) = vqmovn_s32(vrshlq_s32(vmlal_s16(v19, v17, (int16x4_t)0x58005800580058), v22));
  v23[a2] = vqmovn_s32(vrshlq_s32(vmlal_s16(vmlal_s16(v20, v16, (int16x4_t)0x58005800580058), v17, (int16x4_t)0x12001200120012), v22));
  v25 = 12 * a2;
  *(int16x4_t *)((char *)v23 + v25) = vqmovn_s32(vrshlq_s32(v21, v22));
  *(int16x4_t *)v21.i8 = vadd_s16(a11, a7);
  v26 = vadd_s16(v13, v11);
  v27 = vsub_s16(v11, v13);
  v28 = vadd_s16(*(int16x4_t *)v21.i8, v15);
  *(int16x4_t *)v21.i8 = vsub_s16(v15, *(int16x4_t *)v21.i8);
  v29 = vmlal_s16(vmull_s16(*(int16x4_t *)v21.i8, (int16x4_t)0x24002400240024), v27, (int16x4_t)0x53005300530053);
  v30 = vmlsl_s16(vmull_s16(v27, (int16x4_t)0x24002400240024), *(int16x4_t *)v21.i8, (int16x4_t)0x53005300530053);
  v31 = vaddl_s16(v28, v26);
  v32 = vqmovn_s32(vrshlq_s32(vshlq_n_s32(vsubl_s16(v26, v28), 6uLL), v22));
  *a1 = vqmovn_s32(vrshlq_s32(vshlq_n_s32(v31, 6uLL), v22));
  *(int16x4_t *)((char *)a1 + v24) = vqmovn_s32(vrshlq_s32(v29, v22));
  result = vqmovn_s32(vrshlq_s32(v30, v22));
  a1[a2] = v32;
  *(int16x4_t *)((char *)a1 + v25) = result;
  return result;
}

void sub_1C981AB1C(int16x4_t *a1, int16x4_t *a2, int a3)
{
  unsigned int v6;
  int16x4_t v7;
  int16x4_t v8;
  int16x4_t v9;
  int16x4_t v10;
  int16x4_t v11;
  int16x4_t v12;
  int16x4_t v13;
  int16x4_t v14;
  int16x4_t v15;
  int32x2_t v16;
  int16x4_t v17;
  int16x4_t v18;
  int32x2_t v19;
  int32x2_t v20;
  int32x2_t v21;
  int16x4_t v22;
  int16x4_t v23;
  int32x2_t v24;
  int32x2_t v25;
  int32x2_t v26;
  int16x4_t v27;
  int16x4_t v28;
  int32x2_t v29;
  int32x2_t v30;
  int32x2_t v31;
  int32x2_t v32;
  int32x2_t v33;
  int32x2_t v34;
  int32x2_t v35;
  int32x2_t v36;
  int32x2_t v37;
  int32x2_t v38;
  int32x2_t v39;
  int32x2_t v40;
  int32x2_t v41;
  int32x2_t v42;
  int32x2_t v43;
  int32x2_t v44;
  int32x2_t v45;
  int32x2_t v46;
  int32x2_t v47;
  int32x2_t v48;
  int32x2_t v49;
  int16x4_t v50[17];

  v50[16] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v6 = -4;
  do
  {
    v7 = a2[1];
    v8 = a2[4];
    v9 = a2[5];
    v10 = a2[8];
    v11 = a2[9];
    v12 = a2[12];
    v13 = a2[13];
    v14 = a2[2];
    v15 = a2[3];
    v16 = (int32x2_t)vtrn1_s16(*a2, v8);
    v17 = a2[6];
    v18 = a2[7];
    v19 = (int32x2_t)vtrn2_s16(*a2, v8);
    v20 = (int32x2_t)vtrn1_s16(v10, v12);
    v21 = (int32x2_t)vtrn2_s16(v10, v12);
    v22 = a2[10];
    v23 = a2[11];
    v24 = vzip1_s32(v16, v20);
    v25 = vzip2_s32(v16, v20);
    v26 = vzip1_s32(v19, v21);
    v27 = a2[14];
    v28 = a2[15];
    v29 = vzip2_s32(v19, v21);
    v30 = (int32x2_t)vtrn1_s16(v7, v9);
    v31 = (int32x2_t)vtrn2_s16(v7, v9);
    v32 = (int32x2_t)vtrn1_s16(v11, v13);
    v33 = (int32x2_t)vtrn2_s16(v11, v13);
    v34 = vzip1_s32(v30, v32);
    v35 = vzip2_s32(v30, v32);
    v36 = vzip1_s32(v31, v33);
    v37 = vzip2_s32(v31, v33);
    v38 = (int32x2_t)vtrn1_s16(v14, v17);
    v39 = (int32x2_t)vtrn2_s16(v14, v17);
    v40 = (int32x2_t)vtrn1_s16(v22, v27);
    v41 = (int32x2_t)vtrn2_s16(v22, v27);
    v42 = vzip1_s32(v38, v40);
    v43 = vzip2_s32(v38, v40);
    v44 = vzip1_s32(v39, v41);
    v45 = vzip2_s32(v39, v41);
    v46 = (int32x2_t)vtrn1_s16(v15, v18);
    v47 = (int32x2_t)vtrn2_s16(v15, v18);
    v48 = (int32x2_t)vtrn1_s16(v23, v28);
    v50[0] = (int16x4_t)v24;
    v50[1] = (int16x4_t)v29;
    v49 = (int32x2_t)vtrn2_s16(v23, v28);
    v50[2] = (int16x4_t)v26;
    v50[3] = (int16x4_t)v25;
    v50[4] = (int16x4_t)v37;
    v50[5] = (int16x4_t)v34;
    v50[6] = (int16x4_t)v35;
    v50[7] = (int16x4_t)v36;
    v50[8] = (int16x4_t)vzip2_s32(v47, v49);
    v50[9] = (int16x4_t)vzip1_s32(v46, v48);
    v50[10] = (int16x4_t)vzip2_s32(v46, v48);
    v50[11] = (int16x4_t)vzip1_s32(v47, v49);
    v50[12] = (int16x4_t)v42;
    v50[13] = (int16x4_t)v45;
    v50[14] = (int16x4_t)v44;
    v50[15] = (int16x4_t)v43;
    sub_1C981A8DC(a1++, 16, a3, v50);
    v6 += 4;
    a2 += 16;
  }
  while (v6 < 0xC);
}

void sub_1C981AC68(int16x4_t *a1, int16x4_t *a2)
{
  unsigned int v4;
  int16x4_t v5;
  int16x4_t v6;
  int16x4_t v7;
  int32x2_t v8;
  int32x2_t v9;
  int16x4_t v10;
  int16x4_t v11;
  int16x4_t v12;
  int16x4_t v13;
  int32x2_t v14;
  int32x2_t v15;
  int32x2_t v16;
  int32x2_t v17;
  int32x2_t v18;
  int32x2_t v19;
  int16x4_t v20;
  int16x4_t v21;
  int16x4_t v22;
  int16x4_t v23;
  int32x2_t v24;
  int32x2_t v25;
  int16x4_t v26;
  int16x4_t v27;
  int16x4_t v28;
  int16x4_t v29;
  int32x2_t v30;
  int32x2_t v31;
  int32x2_t v32;
  int32x2_t v33;
  int32x2_t v34;
  int32x2_t v35;
  int32x4_t v36[16];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = -4;
  do
  {
    v5 = a2[1];
    v6 = a2[4];
    v7 = a2[5];
    v8 = (int32x2_t)vtrn1_s16(*a2, v6);
    v9 = (int32x2_t)vtrn2_s16(*a2, v6);
    v10 = a2[8];
    v11 = a2[9];
    v12 = a2[12];
    v13 = a2[13];
    v14 = (int32x2_t)vtrn1_s16(v10, v12);
    v15 = (int32x2_t)vtrn2_s16(v10, v12);
    v16 = (int32x2_t)vtrn1_s16(v5, v7);
    v17 = (int32x2_t)vtrn2_s16(v5, v7);
    v18 = (int32x2_t)vtrn1_s16(v11, v13);
    v19 = (int32x2_t)vtrn2_s16(v11, v13);
    v20 = a2[2];
    v21 = a2[3];
    v22 = a2[6];
    v23 = a2[7];
    v24 = (int32x2_t)vtrn1_s16(v20, v22);
    v25 = (int32x2_t)vtrn2_s16(v20, v22);
    v26 = a2[10];
    v27 = a2[11];
    v28 = a2[14];
    v29 = a2[15];
    v30 = (int32x2_t)vtrn1_s16(v26, v28);
    v31 = (int32x2_t)vtrn2_s16(v26, v28);
    v32 = (int32x2_t)vtrn1_s16(v21, v23);
    v33 = (int32x2_t)vtrn2_s16(v21, v23);
    v34 = (int32x2_t)vtrn1_s16(v27, v29);
    v35 = (int32x2_t)vtrn2_s16(v27, v29);
    v36[0] = vmovl_s16((int16x4_t)vzip1_s32(v8, v14));
    v36[1] = vmovl_s16((int16x4_t)vzip2_s32(v9, v15));
    v36[2] = vmovl_s16((int16x4_t)vzip1_s32(v9, v15));
    v36[3] = vmovl_s16((int16x4_t)vzip2_s32(v8, v14));
    v36[4] = vmovl_s16((int16x4_t)vzip2_s32(v17, v19));
    v36[5] = vmovl_s16((int16x4_t)vzip1_s32(v16, v18));
    v36[6] = vmovl_s16((int16x4_t)vzip2_s32(v16, v18));
    v36[7] = vmovl_s16((int16x4_t)vzip1_s32(v17, v19));
    v36[8] = vmovl_s16((int16x4_t)vzip2_s32(v33, v35));
    v36[9] = vmovl_s16((int16x4_t)vzip1_s32(v32, v34));
    v36[10] = vmovl_s16((int16x4_t)vzip2_s32(v32, v34));
    v36[11] = vmovl_s16((int16x4_t)vzip1_s32(v33, v35));
    v36[12] = vmovl_s16((int16x4_t)vzip1_s32(v24, v30));
    v36[13] = vmovl_s16((int16x4_t)vzip2_s32(v25, v31));
    v36[14] = vmovl_s16((int16x4_t)vzip1_s32(v25, v31));
    v36[15] = vmovl_s16((int16x4_t)vzip2_s32(v24, v30));
    sub_1C981A488(a1++, 16, 10, v36);
    v4 += 4;
    a2 += 16;
  }
  while (v4 < 0xC);
}

void sub_1C981ADF0(int16x4_t *a1, int16x4_t *a2, int a3)
{
  char v6;
  int16x4_t v7;
  int16x4_t v8;
  int16x4_t v9;
  int16x4_t v10;
  int16x4_t v11;
  int32x2_t v12;
  int32x2_t v13;
  int16x4_t v14;
  int16x4_t v15;
  int32x2_t v16;
  int32x2_t v17;
  int32x2_t v18;
  int32x2_t v19;
  int32x2_t v20;
  int32x2_t v21;
  char v22;

  v6 = 1;
  do
  {
    v7 = a2[1];
    v8 = a2[2];
    v9 = a2[3];
    v10 = a2[4];
    v11 = a2[5];
    v12 = (int32x2_t)vtrn1_s16(*a2, v8);
    v13 = (int32x2_t)vtrn2_s16(*a2, v8);
    v14 = a2[6];
    v15 = a2[7];
    v16 = (int32x2_t)vtrn1_s16(v10, v14);
    v17 = (int32x2_t)vtrn2_s16(v10, v14);
    v18 = (int32x2_t)vtrn1_s16(v7, v9);
    v19 = (int32x2_t)vtrn2_s16(v7, v9);
    v20 = (int32x2_t)vtrn1_s16(v11, v15);
    v21 = (int32x2_t)vtrn2_s16(v11, v15);
    v22 = v6;
    sub_1C981A9EC(a1, 8, a3, (int16x4_t)vzip1_s32(v12, v16), (int16x4_t)vzip2_s32(v13, v17), (int16x4_t)vzip1_s32(v13, v17), (int16x4_t)vzip2_s32(v12, v16), (int16x4_t)vzip2_s32(v19, v21), (int16x4_t)vzip1_s32(v18, v20), (int16x4_t)vzip2_s32(v18, v20), (int16x4_t)vzip1_s32(v19, v21));
    v6 = 0;
    ++a1;
    a2 += 8;
  }
  while ((v22 & 1) != 0);
}

void sub_1C981AE94(int16x4_t *a1, int16x4_t *a2)
{
  char v4;
  int16x4_t v5;
  int16x4_t v6;
  int16x4_t v7;
  int16x4_t v8;
  int16x4_t v9;
  int32x2_t v10;
  int32x2_t v11;
  int16x4_t v12;
  int16x4_t v13;
  int32x2_t v14;
  int32x2_t v15;
  int32x2_t v16;
  int32x2_t v17;
  int32x2_t v18;
  int32x2_t v19;
  char v20;

  v4 = 1;
  do
  {
    v5 = a2[1];
    v6 = a2[2];
    v7 = a2[3];
    v8 = a2[4];
    v9 = a2[5];
    v10 = (int32x2_t)vtrn1_s16(*a2, v6);
    v11 = (int32x2_t)vtrn2_s16(*a2, v6);
    v12 = a2[6];
    v13 = a2[7];
    v14 = (int32x2_t)vtrn1_s16(v8, v12);
    v15 = (int32x2_t)vtrn2_s16(v8, v12);
    v16 = (int32x2_t)vtrn1_s16(v5, v7);
    v17 = (int32x2_t)vtrn2_s16(v5, v7);
    v18 = (int32x2_t)vtrn1_s16(v9, v13);
    v19 = (int32x2_t)vtrn2_s16(v9, v13);
    v20 = v4;
    sub_1C981A63C(a1, 8, 9, vmovl_s16((int16x4_t)vzip1_s32(v10, v14)), vmovl_s16((int16x4_t)vzip2_s32(v11, v15)), vmovl_s16((int16x4_t)vzip1_s32(v11, v15)), vmovl_s16((int16x4_t)vzip2_s32(v10, v14)), vmovl_s16((int16x4_t)vzip2_s32(v17, v19)), vmovl_s16((int16x4_t)vzip1_s32(v16, v18)), vmovl_s16((int16x4_t)vzip2_s32(v16, v18)), vmovl_s16((int16x4_t)vzip1_s32(v17, v19)));
    v4 = 0;
    ++a1;
    a2 += 8;
  }
  while ((v20 & 1) != 0);
}

int16x4_t sub_1C981AF54(int16x4_t *a1, int16x4_t *a2)
{
  int16x4_t v2;
  int16x4_t v3;
  int16x4_t v4;
  int32x2_t v5;
  int32x2_t v6;
  int32x2_t v7;
  int32x2_t v8;
  int16x4_t v9;
  int16x4_t v10;
  int16x4_t v11;
  int16x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int16x4_t result;

  v2 = a2[1];
  v3 = a2[2];
  v4 = a2[3];
  v5 = (int32x2_t)vtrn1_s16(*a2, v2);
  v6 = (int32x2_t)vtrn2_s16(*a2, v2);
  v7 = (int32x2_t)vtrn1_s16(v3, v4);
  v8 = (int32x2_t)vtrn2_s16(v3, v4);
  v9 = (int16x4_t)vzip1_s32(v6, v8);
  v10 = (int16x4_t)vzip2_s32(v5, v7);
  v11 = (int16x4_t)vzip2_s32(v6, v8);
  v12 = (int16x4_t)vzip1_s32(v5, v7);
  v13 = vaddl_s16(v11, v12);
  v14 = vsubl_s16(v12, v11);
  v15 = vaddl_s16(v10, v9);
  v16 = vsubl_s16(v9, v10);
  v17.i64[0] = 0x5300000053;
  v17.i64[1] = 0x5300000053;
  v18.i64[0] = 0x2400000024;
  v18.i64[1] = 0x2400000024;
  v19 = vmulq_s32(v14, v18);
  v20 = vmlaq_s32(vmulq_s32(v16, v18), v14, v17);
  v14.i64[0] = 0x5200000052;
  v14.i64[1] = 0x5200000052;
  *a1 = vqmovn_s32(vrshrq_n_s32(vshlq_n_s32(vaddq_s32(v15, v13), 6uLL), 8uLL));
  a1[1] = vqmovn_s32(vrshrq_n_s32(v20, 8uLL));
  result = vqmovn_s32(vrshrq_n_s32(vmlaq_s32(v19, v16, v14), 8uLL));
  a1[2] = vqmovn_s32(vrshrq_n_s32(vshlq_n_s32(vsubq_s32(v13, v15), 6uLL), 8uLL));
  a1[3] = result;
  return result;
}

int16x4_t sub_1C981AFE4(int16x4_t *a1, int16x4_t *a2, int a3)
{
  int16x4_t v3;
  int16x4_t v4;
  int16x4_t v5;
  int32x2_t v6;
  int32x2_t v7;
  int32x2_t v8;
  int32x2_t v9;
  int16x4_t v10;
  int16x4_t v11;
  int16x4_t v12;
  int16x4_t v13;
  int16x4_t v14;
  int16x4_t v15;
  int16x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int16x4_t result;

  v3 = a2[1];
  v4 = a2[2];
  v5 = a2[3];
  v6 = (int32x2_t)vtrn1_s16(*a2, v3);
  v7 = (int32x2_t)vtrn2_s16(*a2, v3);
  v8 = (int32x2_t)vtrn1_s16(v4, v5);
  v9 = (int32x2_t)vtrn2_s16(v4, v5);
  v10 = (int16x4_t)vzip1_s32(v6, v8);
  v11 = (int16x4_t)vzip2_s32(v7, v9);
  v12 = vadd_s16(v10, v11);
  v13 = (int16x4_t)vzip1_s32(v7, v9);
  v14 = vadd_s16(v13, v11);
  v15 = vsub_s16(v10, v13);
  v16 = (int16x4_t)vzip2_s32(v6, v8);
  v17 = vmlal_s16(vmlal_s16(vmull_s16(v12, (int16x4_t)0x1D001D001D001DLL), v16, (int16x4_t)0x4A004A004A004ALL), v14, (int16x4_t)0x37003700370037);
  v18 = vmlal_s16(vmlsl_s16(vmull_s16(v12, (int16x4_t)0x37003700370037), v16, (int16x4_t)0x4A004A004A004ALL), v15, (int16x4_t)0x1D001D001D001DLL);
  v19 = vmlsl_s16(vmlal_s16(vmull_s16(v15, (int16x4_t)0x37003700370037), v16, (int16x4_t)0x4A004A004A004ALL), v14, (int16x4_t)0x1D001D001D001DLL);
  v20 = vdupq_n_s32(-a3);
  *a1 = vqmovn_s32(vrshlq_s32(v17, v20));
  a1[1] = vqmovn_s32(vrshlq_s32(vmull_s16(vsub_s16(vadd_s16(v10, v13), v11), (int16x4_t)0x4A004A004A004ALL), v20));
  result = vqmovn_s32(vrshlq_s32(v19, v20));
  a1[2] = vqmovn_s32(vrshlq_s32(v18, v20));
  a1[3] = result;
  return result;
}

int16x4_t sub_1C981B088(int16x4_t *a1, int16x4_t *a2)
{
  int16x4_t v2;
  int16x4_t v3;
  int16x4_t v4;
  int32x2_t v5;
  int32x2_t v6;
  int32x2_t v7;
  int32x2_t v8;
  int16x4_t v9;
  int16x4_t v10;
  int16x4_t v11;
  int16x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int16x4_t result;

  v2 = a2[1];
  v3 = a2[2];
  v4 = a2[3];
  v5 = (int32x2_t)vtrn1_s16(*a2, v2);
  v6 = (int32x2_t)vtrn2_s16(*a2, v2);
  v7 = (int32x2_t)vtrn1_s16(v3, v4);
  v8 = (int32x2_t)vtrn2_s16(v3, v4);
  v9 = (int16x4_t)vzip1_s32(v5, v7);
  v10 = (int16x4_t)vzip1_s32(v6, v8);
  v11 = (int16x4_t)vzip2_s32(v5, v7);
  v12 = (int16x4_t)vzip2_s32(v6, v8);
  v13 = vaddl_s16(v9, v12);
  v14 = vaddl_s16(v10, v12);
  v15 = vsubl_s16(v9, v10);
  v16.i64[0] = 0x4A0000004ALL;
  v16.i64[1] = 0x4A0000004ALL;
  v17.i64[0] = 0x1D0000001DLL;
  v17.i64[1] = 0x1D0000001DLL;
  v18.i64[0] = 0x3700000037;
  v18.i64[1] = 0x3700000037;
  v19 = vmlaq_s32(vmlal_s16(vmulq_s32(v14, v18), v11, (int16x4_t)0x4A004A004A004ALL), v13, v17);
  v20 = vmlaq_s32(vmlsl_s16(vmulq_s32(v15, v17), v11, (int16x4_t)0x4A004A004A004ALL), v13, v18);
  v21 = vmulq_s32(v15, v18);
  v15.i64[0] = 0x1C0000001CLL;
  v15.i64[1] = 0x1C0000001CLL;
  *a1 = vqmovn_s32(vrshrq_n_s32(v19, 8uLL));
  a1[1] = vqmovn_s32(vrshrq_n_s32(vmulq_s32(vsubw_s16(vaddl_s16(v9, v10), v12), v16), 8uLL));
  result = vqmovn_s32(vrshrq_n_s32(vmlaq_s32(vmlal_s16(v21, v11, (int16x4_t)0x4A004A004A004ALL), v14, v15), 8uLL));
  a1[2] = vqmovn_s32(vrshrq_n_s32(v20, 8uLL));
  a1[3] = result;
  return result;
}

int16x4_t sub_1C981B12C(int16x4_t *a1, uint64_t a2, int16x4_t *a3, uint64_t a4, int16x4_t *a5)
{
  int16x4_t v5;
  int16x4_t v6;
  int16x4_t v7;
  int16x4_t v8;
  int16x4_t result;

  v5 = vsub_s16(*(int16x4_t *)((char *)a1 + 2 * a2), *(int16x4_t *)((char *)a3 + 2 * a4));
  v6 = *(int16x4_t *)((char *)a1 + 6 * a2);
  v7 = *(int16x4_t *)((char *)a3 + 6 * a4);
  v8 = vsub_s16(*(int16x4_t *)((char *)a1 + 4 * a2), *(int16x4_t *)((char *)a3 + 4 * a4));
  *a5 = vsub_s16(*a1, *a3);
  a5[1] = v5;
  result = vsub_s16(v6, v7);
  a5[2] = v8;
  a5[3] = result;
  return result;
}

int16x8_t *sub_1C981B184(int16x8_t *result, uint64_t a2, int16x8_t *a3, uint64_t a4, int16x8_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  int16x8_t v9;
  int16x8_t *v10;
  int16x8_t *v11;
  int16x8_t v12;
  int16x8_t *v13;
  int16x8_t *v14;
  int16x8_t v15;

  v5 = 2 * a2;
  v6 = 2 * a4;
  v7 = 1;
  do
  {
    v8 = v7;
    v9 = vsubq_s16(*(int16x8_t *)((char *)result + 2 * a2), *(int16x8_t *)((char *)a3 + 2 * a4));
    v10 = (int16x8_t *)((char *)result + v5 + v5);
    v11 = (int16x8_t *)((char *)a3 + v6 + v6);
    v12 = vsubq_s16(*v10, *v11);
    v13 = (int16x8_t *)((char *)v10 + v5);
    v14 = (int16x8_t *)((char *)v11 + v6);
    v15 = vsubq_s16(*v13, *v14);
    *a5 = vsubq_s16(*result, *a3);
    a5[1] = v9;
    a5[2] = v12;
    a5[3] = v15;
    result = (int16x8_t *)((char *)v13 + v5);
    a3 = (int16x8_t *)((char *)v14 + v6);
    a5 += 4;
    v7 = 0;
  }
  while ((v8 & 1) != 0);
  return result;
}

int16x8_t *sub_1C981B1FC(int16x8_t *result, uint64_t a2, int16x8_t *a3, uint64_t a4, int16x8_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  int16x8_t v8;
  int16x8_t v9;
  int16x8_t v10;

  v5 = 2 * a2;
  v6 = 2 * a4;
  v7 = -2;
  do
  {
    v8 = vsubq_s16(result[1], a3[1]);
    v9 = vsubq_s16(*(int16x8_t *)((char *)result + 2 * a2), *(int16x8_t *)((char *)a3 + 2 * a4));
    v10 = vsubq_s16(*(int16x8_t *)((char *)&result[1] + v5), *(int16x8_t *)((char *)&a3[1] + v6));
    *a5 = vsubq_s16(*result, *a3);
    a5[1] = v8;
    v7 += 2;
    a5[2] = v9;
    a5[3] = v10;
    result = (int16x8_t *)((char *)result + v5 + v5);
    a3 = (int16x8_t *)((char *)a3 + v6 + v6);
    a5 += 4;
  }
  while (v7 < 0xE);
  return result;
}

int16x8_t sub_1C981B254(int16x8_t *a1, uint64_t a2, int16x8_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  int16x8_t *v6;
  int16x8_t *v7;
  int16x8_t result;
  int16x8_t v9;
  int16x8_t v10;
  int16x8_t *v11;
  int16x8_t v12;

  v5 = 0;
  v6 = a3 + 2;
  v7 = a1 + 2;
  do
  {
    result = vsubq_s16(v7[-2], v6[-2]);
    v9 = vsubq_s16(v7[-1], v6[-1]);
    v10 = vsubq_s16(*v7, *v6);
    v11 = (int16x8_t *)(a5 + v5);
    v12 = vsubq_s16(v7[1], v6[1]);
    *v11 = result;
    v11[1] = v9;
    v11[2] = v10;
    v11[3] = v12;
    v5 += 64;
    v6 = (int16x8_t *)((char *)v6 + 2 * a4);
    v7 = (int16x8_t *)((char *)v7 + 2 * a2);
  }
  while ((_DWORD)v5 != 2048);
  return result;
}

int16x4_t sub_1C981B2AC(int16x4_t *a1, uint64_t a2, int16x4_t *a3, uint64_t a4, int16x4_t *a5)
{
  int16x4_t v6;
  int16x4_t v7;
  int16x4_t v8;
  int16x4_t v9;
  int16x4_t v11[6];

  v11[5] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v6 = vsub_s16(*(int16x4_t *)((char *)a1 + 2 * a2), *(int16x4_t *)((char *)a3 + 2 * a4));
  v7 = *(int16x4_t *)((char *)a1 + 6 * a2);
  v8 = *(int16x4_t *)((char *)a3 + 6 * a4);
  v9 = vsub_s16(*(int16x4_t *)((char *)a1 + 4 * a2), *(int16x4_t *)((char *)a3 + 4 * a4));
  *a5 = vsub_s16(*a1, *a3);
  a5[1] = v6;
  a5[2] = v9;
  a5[3] = vsub_s16(v7, v8);
  sub_1C981AFE4(v11, a5, 1);
  return sub_1C981B088(a5, v11);
}

int16x4_t sub_1C981B36C(int16x4_t *a1, uint64_t a2, int16x4_t *a3, uint64_t a4, int16x4_t *a5)
{
  int16x4_t v5;
  int16x4_t v6;
  int16x4_t v7;
  int16x4_t v8;
  int32x2_t v9;
  int32x2_t v10;
  int32x2_t v11;
  int32x2_t v12;
  int16x4_t v13;
  int16x4_t v14;
  int16x4_t v15;
  int16x4_t v16;
  int16x4_t v17;
  int16x4_t v18;
  int16x4_t v19;
  int16x4_t v20;
  int16x4_t v22[6];

  v22[5] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v5 = vsub_s16(*a1, *a3);
  v6 = vsub_s16(*(int16x4_t *)((char *)a1 + 2 * a2), *(int16x4_t *)((char *)a3 + 2 * a4));
  v7 = vsub_s16(*(int16x4_t *)((char *)a1 + 4 * a2), *(int16x4_t *)((char *)a3 + 4 * a4));
  v8 = vsub_s16(*(int16x4_t *)((char *)a1 + 6 * a2), *(int16x4_t *)((char *)a3 + 6 * a4));
  *a5 = v5;
  a5[1] = v6;
  a5[2] = v7;
  a5[3] = v8;
  v9 = (int32x2_t)vtrn1_s16(v5, v6);
  v10 = (int32x2_t)vtrn2_s16(v5, v6);
  v11 = (int32x2_t)vtrn1_s16(v7, v8);
  v12 = (int32x2_t)vtrn2_s16(v7, v8);
  v13 = (int16x4_t)vzip1_s32(v10, v12);
  v14 = (int16x4_t)vzip2_s32(v9, v11);
  v15 = (int16x4_t)vzip2_s32(v10, v12);
  v16 = (int16x4_t)vzip1_s32(v9, v11);
  v17 = vadd_s16(v15, v16);
  v18 = vsub_s16(v16, v15);
  v19 = vadd_s16(v14, v13);
  v20 = vsub_s16(v13, v14);
  v22[0] = vqmovn_s32(vrshrq_n_s32(vshlq_n_s32(vaddl_s16(v19, v17), 6uLL), 1uLL));
  v22[1] = vqmovn_s32(vrshrq_n_s32(vmlal_s16(vmull_s16(v20, (int16x4_t)0x24002400240024), v18, (int16x4_t)0x53005300530053), 1uLL));
  v22[2] = vqmovn_s32(vrshrq_n_s32(vshlq_n_s32(vsubl_s16(v17, v19), 6uLL), 1uLL));
  v22[3] = vqmovn_s32(vrshrq_n_s32(vmlsl_s16(vmull_s16(v18, (int16x4_t)0x24002400240024), v20, (int16x4_t)0x53005300530053), 1uLL));
  return sub_1C981AF54(a5, v22);
}

void sub_1C981B490(int16x8_t *a1, uint64_t a2, int16x8_t *a3, uint64_t a4, int16x8_t *a5)
{
  int16x4_t v6[18];

  v6[17] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  sub_1C981B184(a1, a2, a3, a4, a5);
  sub_1C981ADF0(v6, (int16x4_t *)a5, 2);
  sub_1C981AE94((int16x4_t *)a5, v6);
}

void sub_1C981B500(int16x8_t *a1, uint64_t a2, int16x8_t *a3, uint64_t a4, int16x4_t *a5)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  int16x8_t *v9;
  int16x8_t v10;
  int16x8_t v11;
  int16x8_t v12;
  int16x4_t v13[66];

  v13[65] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v6 = 2 * a2;
  v7 = 2 * a4;
  v8 = -2;
  v9 = (int16x8_t *)a5;
  do
  {
    v10 = vsubq_s16(a1[1], a3[1]);
    v11 = vsubq_s16(*(int16x8_t *)((char *)a1 + 2 * a2), *(int16x8_t *)((char *)a3 + 2 * a4));
    v12 = vsubq_s16(*(int16x8_t *)((char *)&a1[1] + v6), *(int16x8_t *)((char *)&a3[1] + v7));
    *v9 = vsubq_s16(*a1, *a3);
    v9[1] = v10;
    v8 += 2;
    v9[2] = v11;
    v9[3] = v12;
    a1 = (int16x8_t *)((char *)a1 + v6 + v6);
    a3 = (int16x8_t *)((char *)a3 + v7 + v7);
    v9 += 4;
  }
  while (v8 < 0xE);
  sub_1C981AB1C(v13, a5, 3);
  sub_1C981AC68(a5, v13);
}

void sub_1C981B5C4(int16x8_t *a1, uint64_t a2, int16x8_t *a3, uint64_t a4, int16x4_t *a5)
{
  uint64_t v6;
  int16x8_t *v7;
  int16x8_t *v8;
  int16x8_t v9;
  int16x8_t v10;
  int16x8_t *v11;
  int16x8_t v12;
  int16x4_t v13[258];

  v6 = 0;
  v13[257] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v7 = a3 + 2;
  v8 = a1 + 2;
  do
  {
    v9 = vsubq_s16(v8[-1], v7[-1]);
    v10 = vsubq_s16(*v8, *v7);
    v11 = (int16x8_t *)&a5[v6];
    v12 = vsubq_s16(v8[1], v7[1]);
    *v11 = vsubq_s16(v8[-2], v7[-2]);
    v11[1] = v9;
    v11[2] = v10;
    v11[3] = v12;
    v6 += 8;
    v7 = (int16x8_t *)((char *)v7 + 2 * a4);
    v8 = (int16x8_t *)((char *)v8 + 2 * a2);
  }
  while ((_DWORD)(v6 * 8) != 2048);
  sub_1C9819DB0(v13, a5, 4);
  sub_1C9819FE4(a5, v13);
}

double sub_1C981B684(uint64_t *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t *v8;
  uint16x8_t v9;
  uint64_t *v10;
  uint16x8_t v11;
  uint16x8_t v12;
  uint16x8_t v13;
  uint16x8_t v14;

  sub_1C97081A8((int16x4_t *)a3);
  v8 = (uint64_t *)((char *)a1 + 2 * a2);
  v9.i64[0] = *a1;
  v9.i64[1] = *v8;
  v10 = (uint64_t *)((char *)a1 + 6 * a2);
  v11.i64[0] = *(uint64_t *)((char *)a1 + 4 * a2);
  v11.i64[1] = *v10;
  v12.i64[0] = 0xFF00FF00FF00FFLL;
  v12.i64[1] = 0xFF00FF00FF00FFLL;
  v13 = vminq_u16(vsqaddq_u16(v9, *(int16x8_t *)a3), v12);
  v14 = vminq_u16(vsqaddq_u16(v11, *(int16x8_t *)(a3 + 16)), v12);
  *a1 = v13.i64[0];
  *v8 = v13.i64[1];
  *(uint64_t *)((char *)a1 + 4 * a2) = v14.i64[0];
  *v10 = v14.i64[1];
  if ((a4 & 1) == 0)
  {
    v13.i64[0] = 0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return *(double *)v13.i64;
}

void sub_1C981B710(uint64_t *a1, uint64_t a2, int32x4_t *a3, int a4, int a5)
{
  char v5;
  int16x8_t v9;
  uint64_t *v10;
  uint16x8_t v11;
  uint64_t *v12;
  uint16x8_t v13;
  uint16x8_t v14;
  uint16x8_t v15;
  uint16x8_t v16;
  uint64_t *v17;
  uint16x8_t v18;
  uint64_t *v19;
  uint16x8_t v20;
  uint16x8_t v21;
  uint16x8_t v22;
  uint16x8_t v23;

  v5 = a4;
  if (a5 != 1)
  {
    sub_1C9708C30(a3, a5);
    v17 = (uint64_t *)((char *)a1 + 2 * a2);
    v18.i64[0] = *a1;
    v18.i64[1] = *v17;
    v19 = (uint64_t *)((char *)a1 + 6 * a2);
    v20.i64[0] = *(uint64_t *)((char *)a1 + 4 * a2);
    v20.i64[1] = *v19;
    v21.i64[0] = 0xFF00FF00FF00FFLL;
    v21.i64[1] = 0xFF00FF00FF00FFLL;
    v22 = vminq_u16(vsqaddq_u16(v18, *(int16x8_t *)a3), v21);
    v23 = vminq_u16(vsqaddq_u16(v20, (int16x8_t)a3[1]), v21);
    *a1 = v22.i64[0];
    *v17 = v22.i64[1];
    *(uint64_t *)((char *)a1 + 4 * a2) = v23.i64[0];
    *v19 = v23.i64[1];
    if ((v5 & 1) != 0)
      return;
    v9 = 0uLL;
    goto LABEL_6;
  }
  v9 = vdupq_n_s16((a3->i16[0] + 65) >> 7);
  a3->i16[0] = 0;
  v10 = (uint64_t *)((char *)a1 + 2 * a2);
  v11.i64[0] = *a1;
  v11.i64[1] = *v10;
  v12 = (uint64_t *)((char *)a1 + 6 * a2);
  v13.i64[0] = *(uint64_t *)((char *)a1 + 4 * a2);
  v13.i64[1] = *v12;
  v14.i64[0] = 0xFF00FF00FF00FFLL;
  v14.i64[1] = 0xFF00FF00FF00FFLL;
  v15 = vminq_u16(vsqaddq_u16(v11, v9), v14);
  v16 = vminq_u16(vsqaddq_u16(v13, v9), v14);
  *a1 = v15.i64[0];
  *v10 = v15.i64[1];
  *(uint64_t *)((char *)a1 + 4 * a2) = v16.i64[0];
  *v12 = v16.i64[1];
  if (a4)
  {
LABEL_6:
    *a3 = (int32x4_t)v9;
    a3[1] = (int32x4_t)v9;
  }
}

uint16x8_t *sub_1C981B808(uint16x8_t *result, uint64_t a2, int16x4_t *a3, int a4, int a5)
{
  int16x8_t *v6;
  uint16x8_t *v8;
  int16x8_t v9;
  uint16x8_t v10;
  uint16x8_t v11;
  uint16x8_t v12;
  uint16x8_t v13;
  uint16x8_t v14;
  uint16x8_t v15;
  uint16x8_t v16;
  uint16x8_t v17;
  unsigned int v18;
  char v19;
  uint16x8_t v20;
  char v21;
  uint16x8_t v22;
  uint16x8_t v23;
  uint16x8_t v24;
  uint16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  int16x8_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int16x8_t v33;
  int16x8_t v34;
  int16x8_t v35;
  int16x8_t v36;
  unsigned int v37;
  int8x16_t v38;

  v6 = (int16x8_t *)a3;
  v8 = result;
  if (a5 == 1)
  {
    v9 = vdupq_n_s16((a3->i16[0] + 65) >> 7);
    a3->i16[0] = 0;
    v10 = *(uint16x8_t *)((char *)result + 14 * a2);
    v11.i64[0] = 0xFF00FF00FF00FFLL;
    v11.i64[1] = 0xFF00FF00FF00FFLL;
    v12 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 2 * a2), v9), v11);
    v13 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 4 * a2), v9), v11);
    v14 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 6 * a2), v9), v11);
    v15 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 8 * a2), v9), v11);
    v16 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 10 * a2), v9), v11);
    v17 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 12 * a2), v9), v11);
    *result = vminq_u16(vsqaddq_u16(*result, v9), v11);
    *(uint16x8_t *)((char *)result + 2 * a2) = v12;
    *(uint16x8_t *)((char *)result + 4 * a2) = v13;
    *(uint16x8_t *)((char *)result + 6 * a2) = v14;
    *(uint16x8_t *)((char *)result + 8 * a2) = v15;
    *(uint16x8_t *)((char *)result + 10 * a2) = v16;
    *(uint16x8_t *)((char *)result + 12 * a2) = v17;
    *(uint16x8_t *)((char *)result + 14 * a2) = vminq_u16(vsqaddq_u16(v10, v9), v11);
    if (a4)
    {
      v18 = -16;
      do
      {
        *v6 = v9;
        v6[1] = v9;
        v6 += 2;
        v18 += 16;
      }
      while (v18 < 0x30);
    }
  }
  else
  {
    result = (uint16x8_t *)sub_1C970A6D8(a3, a5);
    v19 = 1;
    v20.i64[0] = 0xFF00FF00FF00FFLL;
    v20.i64[1] = 0xFF00FF00FF00FFLL;
    do
    {
      v21 = v19;
      v22 = *v8;
      v23 = *(uint16x8_t *)((char *)v8 + 2 * a2);
      v24 = *(uint16x8_t *)((char *)v8 + 4 * a2);
      v25 = *(uint16x8_t *)((char *)v8 + 6 * a2);
      v26 = v6[1];
      v27 = v6[2];
      v28 = v6[3];
      v29 = (int32x4_t)vtrn1q_s16(*v6, v26);
      v30 = (int32x4_t)vtrn2q_s16(*v6, v26);
      v31 = (int32x4_t)vtrn1q_s16(v27, v28);
      v32 = (int32x4_t)vtrn2q_s16(v27, v28);
      v33 = (int16x8_t)vtrn1q_s32(v29, v31);
      v34 = (int16x8_t)vtrn2q_s32(v29, v31);
      v35 = (int16x8_t)vtrn1q_s32(v30, v32);
      v36 = (int16x8_t)vtrn2q_s32(v30, v32);
      if (a4)
        v37 = -1;
      else
        v37 = 0;
      v38 = (int8x16_t)vdupq_n_s16(v37);
      *(int8x16_t *)v6 = vandq_s8((int8x16_t)v33, v38);
      v6[1] = (int16x8_t)vandq_s8((int8x16_t)v35, v38);
      v6[2] = (int16x8_t)vandq_s8((int8x16_t)v34, v38);
      v6[3] = (int16x8_t)vandq_s8((int8x16_t)v36, v38);
      *v8 = vminq_u16(vsqaddq_u16(v22, v33), v20);
      *(uint16x8_t *)((char *)v8 + 2 * a2) = vminq_u16(vsqaddq_u16(v23, v35), v20);
      *(uint16x8_t *)((char *)v8 + 4 * a2) = vminq_u16(vsqaddq_u16(v24, v34), v20);
      *(uint16x8_t *)((char *)v8 + 6 * a2) = vminq_u16(vsqaddq_u16(v25, v36), v20);
      v8 = (uint16x8_t *)((char *)v8 + 8 * a2);
      v6 += 4;
      v19 = 0;
    }
    while ((v21 & 1) != 0);
  }
  return result;
}

int16x4_t *sub_1C981B9E8(int16x4_t *result, uint64_t a2, int16x4_t *a3, int a4, int a5)
{
  _OWORD *v6;
  uint16x8_t *v8;
  int16x8_t v9;
  uint64_t v10;
  unsigned int v11;
  uint16x8_t v12;
  uint16x8_t *v13;
  uint16x8_t v14;
  uint16x8_t v15;
  uint16x8_t v16;
  unsigned int v17;
  uint64_t v18;
  char v19;
  uint16x8_t v20;
  char v21;
  uint16x8_t *v22;
  unsigned int v23;
  int16x8_t *v24;
  uint16x8_t v25;
  uint16x8_t v26;
  uint16x8_t v27;
  uint16x8_t v28;
  int16x8_t v29;
  int16x8_t v30;
  int16x8_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int32x4_t v34;
  int32x4_t v35;
  int16x8_t v36;
  int16x8_t v37;
  int16x8_t v38;
  int16x8_t v39;
  unsigned int v40;
  int8x16_t v41;

  v6 = a3;
  v8 = (uint16x8_t *)result;
  if (a5 == 1)
  {
    v9 = vdupq_n_s16((a3->i16[0] + 65) >> 7);
    a3->i16[0] = 0;
    v10 = 2 * a2;
    v11 = -2;
    v12.i64[0] = 0xFF00FF00FF00FFLL;
    v12.i64[1] = 0xFF00FF00FF00FFLL;
    do
    {
      v13 = (uint16x8_t *)((char *)v8 + v10);
      v14 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v8 + 2 * a2), v9), v12);
      v15 = vminq_u16(vsqaddq_u16(v8[1], v9), v12);
      v16 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v8[1] + v10), v9), v12);
      *v8 = vminq_u16(vsqaddq_u16(*v8, v9), v12);
      *v13 = v14;
      v8[1] = v15;
      v13[1] = v16;
      v8 = (uint16x8_t *)((char *)v8 + 4 * a2);
      v11 += 2;
    }
    while (v11 < 0xE);
    if (a4)
    {
      v17 = -16;
      do
      {
        *v6 = v9;
        v6[1] = v9;
        v6 += 2;
        v17 += 16;
      }
      while (v17 < 0xF0);
    }
  }
  else
  {
    result = sub_1C970B38C(a3, a5);
    v18 = 0;
    v19 = 1;
    v20.i64[0] = 0xFF00FF00FF00FFLL;
    v20.i64[1] = 0xFF00FF00FF00FFLL;
    do
    {
      v21 = v19;
      v22 = &v8[v18];
      v23 = -4;
      v24 = (int16x8_t *)&v6[v18];
      do
      {
        v25 = *(uint16x8_t *)((char *)v22 + 2 * a2);
        v26 = *v22;
        v27 = *(uint16x8_t *)((char *)v22 + 4 * a2);
        v28 = *(uint16x8_t *)((char *)v22 + 6 * a2);
        v29 = v24[2];
        v30 = v24[4];
        v31 = v24[6];
        v32 = (int32x4_t)vtrn1q_s16(*v24, v29);
        v33 = (int32x4_t)vtrn2q_s16(*v24, v29);
        v34 = (int32x4_t)vtrn1q_s16(v30, v31);
        v35 = (int32x4_t)vtrn2q_s16(v30, v31);
        v36 = (int16x8_t)vtrn1q_s32(v32, v34);
        v37 = (int16x8_t)vtrn2q_s32(v32, v34);
        v38 = (int16x8_t)vtrn1q_s32(v33, v35);
        v39 = (int16x8_t)vtrn2q_s32(v33, v35);
        if (a4)
          v40 = -1;
        else
          v40 = 0;
        v41 = (int8x16_t)vdupq_n_s16(v40);
        *(int8x16_t *)v24 = vandq_s8((int8x16_t)v36, v41);
        v24[2] = (int16x8_t)vandq_s8((int8x16_t)v38, v41);
        v24[4] = (int16x8_t)vandq_s8((int8x16_t)v37, v41);
        v24[6] = (int16x8_t)vandq_s8((int8x16_t)v39, v41);
        *v22 = vminq_u16(vsqaddq_u16(v26, v36), v20);
        *(uint16x8_t *)((char *)v22 + 2 * a2) = vminq_u16(vsqaddq_u16(v25, v38), v20);
        *(uint16x8_t *)((char *)v22 + 4 * a2) = vminq_u16(vsqaddq_u16(v27, v37), v20);
        *(uint16x8_t *)((char *)v22 + 6 * a2) = vminq_u16(vsqaddq_u16(v28, v39), v20);
        v22 = (uint16x8_t *)((char *)v22 + 8 * a2);
        v23 += 4;
        v24 += 8;
      }
      while (v23 < 0xC);
      v19 = 0;
      v18 = 1;
    }
    while ((v21 & 1) != 0);
  }
  return result;
}

uint16x8_t *sub_1C981BBA4(uint16x8_t *result, uint64_t a2, int16x4_t *a3, int a4, int a5)
{
  _OWORD *v6;
  uint16x8_t *v8;
  int16x8_t v9;
  uint16x8_t *v10;
  int v11;
  uint16x8_t v12;
  uint16x8_t v13;
  uint16x8_t v14;
  uint16x8_t v15;
  unsigned int v16;
  unint64_t v17;
  uint16x8_t v18;
  int16x8_t *v19;
  unsigned int v20;
  uint16x8_t *v21;
  uint16x8_t v22;
  uint16x8_t v23;
  uint16x8_t v24;
  uint16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  int16x8_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int16x8_t v33;
  int16x8_t v34;
  int16x8_t v35;
  int16x8_t v36;
  unsigned int v37;
  int8x16_t v38;

  v6 = a3;
  v8 = result;
  if (a5 == 1)
  {
    v9 = vdupq_n_s16((a3->i16[0] + 65) >> 7);
    a3->i16[0] = 0;
    v10 = result + 2;
    v11 = 32;
    v12.i64[0] = 0xFF00FF00FF00FFLL;
    v12.i64[1] = 0xFF00FF00FF00FFLL;
    do
    {
      v13 = vminq_u16(vsqaddq_u16(v10[-1], v9), v12);
      v14 = vminq_u16(vsqaddq_u16(*v10, v9), v12);
      v15 = vminq_u16(vsqaddq_u16(v10[1], v9), v12);
      v10[-2] = vminq_u16(vsqaddq_u16(v10[-2], v9), v12);
      v10[-1] = v13;
      *v10 = v14;
      v10[1] = v15;
      v10 = (uint16x8_t *)((char *)v10 + 2 * a2);
      --v11;
    }
    while (v11);
    if (a4)
    {
      v16 = -16;
      do
      {
        *v6 = v9;
        v6[1] = v9;
        v6 += 2;
        v16 += 16;
      }
      while (v16 < 0x3F0);
    }
  }
  else
  {
    result = (uint16x8_t *)sub_1C97023B8(a3, a5);
    v17 = 0;
    v18.i64[0] = 0xFF00FF00FF00FFLL;
    v18.i64[1] = 0xFF00FF00FF00FFLL;
    do
    {
      v19 = (int16x8_t *)&v6[v17];
      v20 = -4;
      v21 = v8;
      do
      {
        v22 = *(uint16x8_t *)((char *)v21 + 2 * a2);
        v23 = *v21;
        v24 = *(uint16x8_t *)((char *)v21 + 4 * a2);
        v25 = *(uint16x8_t *)((char *)v21 + 6 * a2);
        v26 = v19[4];
        v27 = v19[8];
        v28 = v19[12];
        v29 = (int32x4_t)vtrn1q_s16(*v19, v26);
        v30 = (int32x4_t)vtrn2q_s16(*v19, v26);
        v31 = (int32x4_t)vtrn1q_s16(v27, v28);
        v32 = (int32x4_t)vtrn2q_s16(v27, v28);
        v33 = (int16x8_t)vtrn1q_s32(v29, v31);
        v34 = (int16x8_t)vtrn2q_s32(v29, v31);
        v35 = (int16x8_t)vtrn1q_s32(v30, v32);
        v36 = (int16x8_t)vtrn2q_s32(v30, v32);
        if (a4)
          v37 = -1;
        else
          v37 = 0;
        v38 = (int8x16_t)vdupq_n_s16(v37);
        *(int8x16_t *)v19 = vandq_s8((int8x16_t)v33, v38);
        v19[4] = (int16x8_t)vandq_s8((int8x16_t)v35, v38);
        v19[8] = (int16x8_t)vandq_s8((int8x16_t)v34, v38);
        v19[12] = (int16x8_t)vandq_s8((int8x16_t)v36, v38);
        *v21 = vminq_u16(vsqaddq_u16(v23, v33), v18);
        *(uint16x8_t *)((char *)v21 + 2 * a2) = vminq_u16(vsqaddq_u16(v22, v35), v18);
        *(uint16x8_t *)((char *)v21 + 4 * a2) = vminq_u16(vsqaddq_u16(v24, v34), v18);
        *(uint16x8_t *)((char *)v21 + 6 * a2) = vminq_u16(vsqaddq_u16(v25, v36), v18);
        v21 = (uint16x8_t *)((char *)v21 + 8 * a2);
        v20 += 4;
        v19 += 16;
      }
      while (v20 < 0x1C);
      ++v8;
    }
    while (v17++ < 3);
  }
  return result;
}

double sub_1C981BD50(uint64_t *a1, uint64_t a2, int16x8_t *a3, char a4)
{
  uint64_t *v4;
  uint16x8_t v5;
  uint64_t *v6;
  uint16x8_t v7;
  int16x8_t v8;
  uint16x8_t v9;
  uint16x8_t v10;
  uint16x8_t v11;

  v4 = (uint64_t *)((char *)a1 + 2 * a2);
  v5.i64[0] = *a1;
  v5.i64[1] = *v4;
  v6 = (uint64_t *)((char *)a1 + 6 * a2);
  v7.i64[0] = *(uint64_t *)((char *)a1 + 4 * a2);
  v7.i64[1] = *v6;
  v8 = a3[1];
  v9.i64[0] = 0xFF00FF00FF00FFLL;
  v9.i64[1] = 0xFF00FF00FF00FFLL;
  v10 = vminq_u16(vsqaddq_u16(v5, *a3), v9);
  *a1 = v10.i64[0];
  *v4 = v10.i64[1];
  v11 = vminq_u16(vsqaddq_u16(v7, v8), v9);
  *(uint64_t *)((char *)a1 + 4 * a2) = v11.i64[0];
  *v6 = v11.i64[1];
  if ((a4 & 1) == 0)
  {
    v11.i64[0] = 0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return *(double *)v11.i64;
}

uint64_t sub_1C981BDA8(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t (*v4)(void);

  if (a4)
    v4 = (uint64_t (*)(void))sub_1C981BF9C;
  else
    v4 = (uint64_t (*)(void))sub_1C981C018;
  return v4();
}

uint64_t sub_1C981BDC4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t (*v4)(void);

  if (a4)
    v4 = (uint64_t (*)(void))sub_1C981BEC8;
  else
    v4 = (uint64_t (*)(void))sub_1C981BF2C;
  return v4();
}

uint64_t sub_1C981BDE0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t (*v4)(void);

  if (a4)
    v4 = (uint64_t (*)(void))sub_1C981BDFC;
  else
    v4 = (uint64_t (*)(void))sub_1C981BE5C;
  return v4();
}

uint16x8_t *sub_1C981BDFC(uint16x8_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint16x8_t *v4;
  uint16x8_t v5;
  uint16x8_t v6;
  uint16x8_t v7;
  uint16x8_t v8;

  v3 = 0;
  v4 = result + 2;
  v5.i64[0] = 0xFF00FF00FF00FFLL;
  v5.i64[1] = 0xFF00FF00FF00FFLL;
  do
  {
    v6 = vminq_u16(vsqaddq_u16(v4[-1], *(int16x8_t *)(a3 + v3 + 16)), v5);
    v7 = vminq_u16(vsqaddq_u16(*v4, *(int16x8_t *)(a3 + v3 + 32)), v5);
    v8 = vminq_u16(vsqaddq_u16(v4[1], *(int16x8_t *)(a3 + v3 + 48)), v5);
    v4[-2] = vminq_u16(vsqaddq_u16(v4[-2], *(int16x8_t *)(a3 + v3)), v5);
    v4[-1] = v6;
    *v4 = v7;
    v4[1] = v8;
    v3 += 64;
    v4 = (uint16x8_t *)((char *)v4 + 2 * a2);
  }
  while ((_DWORD)v3 != 2048);
  return result;
}

uint16x8_t *sub_1C981BE5C(uint16x8_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint16x8_t *v4;
  uint16x8_t v5;
  _OWORD *v6;
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  int16x8_t v10;
  uint16x8_t v11;
  uint16x8_t v12;
  uint16x8_t v13;

  v3 = 0;
  v4 = result + 2;
  v5.i64[0] = 0xFF00FF00FF00FFLL;
  v5.i64[1] = 0xFF00FF00FF00FFLL;
  do
  {
    v6 = (_OWORD *)(a3 + v3);
    v7 = *(int16x8_t *)(a3 + v3);
    v8 = *(int16x8_t *)(a3 + v3 + 16);
    v9 = *(int16x8_t *)(a3 + v3 + 32);
    v10 = *(int16x8_t *)(a3 + v3 + 48);
    *v6 = 0uLL;
    v6[1] = 0uLL;
    v6[2] = 0uLL;
    v6[3] = 0uLL;
    v11 = vminq_u16(vsqaddq_u16(v4[-1], v8), v5);
    v12 = vminq_u16(vsqaddq_u16(*v4, v9), v5);
    v13 = vminq_u16(vsqaddq_u16(v4[1], v10), v5);
    v4[-2] = vminq_u16(vsqaddq_u16(v4[-2], v7), v5);
    v4[-1] = v11;
    *v4 = v12;
    v4[1] = v13;
    v3 += 64;
    v4 = (uint16x8_t *)((char *)v4 + 2 * a2);
  }
  while ((_DWORD)v3 != 2048);
  return result;
}

uint16x8_t *sub_1C981BEC8(uint16x8_t *result, uint64_t a2, int16x8_t *a3)
{
  uint64_t v3;
  unsigned int v4;
  uint16x8_t v5;
  uint16x8_t *v6;
  uint16x8_t v7;
  uint16x8_t v8;
  uint16x8_t v9;

  v3 = 2 * a2;
  v4 = -2;
  v5.i64[0] = 0xFF00FF00FF00FFLL;
  v5.i64[1] = 0xFF00FF00FF00FFLL;
  do
  {
    v6 = (uint16x8_t *)((char *)result + v3);
    v7 = vminq_u16(vsqaddq_u16(result[1], a3[1]), v5);
    v8 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 2 * a2), a3[2]), v5);
    v9 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&result[1] + v3), a3[3]), v5);
    *result = vminq_u16(vsqaddq_u16(*result, *a3), v5);
    result[1] = v7;
    *v6 = v8;
    v6[1] = v9;
    v4 += 2;
    result = (uint16x8_t *)((char *)result + 4 * a2);
    a3 += 4;
  }
  while (v4 < 0xE);
  return result;
}

uint16x8_t *sub_1C981BF2C(uint16x8_t *result, uint64_t a2, int16x8_t *a3)
{
  uint64_t v3;
  unsigned int v4;
  uint16x8_t v5;
  int16x8_t v6;
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  uint16x8_t *v10;
  uint16x8_t v11;
  uint16x8_t v12;
  uint16x8_t v13;

  v3 = 2 * a2;
  v4 = -2;
  v5.i64[0] = 0xFF00FF00FF00FFLL;
  v5.i64[1] = 0xFF00FF00FF00FFLL;
  do
  {
    v6 = *a3;
    v7 = a3[1];
    v8 = a3[2];
    v9 = a3[3];
    *a3 = 0uLL;
    a3[1] = 0uLL;
    a3[2] = 0uLL;
    a3[3] = 0uLL;
    v10 = (uint16x8_t *)((char *)result + v3);
    v11 = vminq_u16(vsqaddq_u16(result[1], v7), v5);
    v12 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 2 * a2), v8), v5);
    v13 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&result[1] + v3), v9), v5);
    *result = vminq_u16(vsqaddq_u16(*result, v6), v5);
    result[1] = v11;
    *v10 = v12;
    v10[1] = v13;
    v4 += 2;
    result = (uint16x8_t *)((char *)result + 4 * a2);
    a3 += 4;
  }
  while (v4 < 0xE);
  return result;
}

uint16x8_t *sub_1C981BF9C(uint16x8_t *result, uint64_t a2, int16x8_t *a3)
{
  char v3;
  uint16x8_t v4;
  char v5;
  uint16x8_t v6;
  uint16x8_t v7;
  uint16x8_t v8;

  v3 = 1;
  v4.i64[0] = 0xFF00FF00FF00FFLL;
  v4.i64[1] = 0xFF00FF00FF00FFLL;
  do
  {
    v5 = v3;
    v6 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 2 * a2), a3[1]), v4);
    v7 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 4 * a2), a3[2]), v4);
    v8 = vsqaddq_u16(*(uint16x8_t *)((char *)result + 6 * a2), a3[3]);
    *result = vminq_u16(vsqaddq_u16(*result, *a3), v4);
    *(uint16x8_t *)((char *)result + 2 * a2) = v6;
    *(uint16x8_t *)((char *)result + 4 * a2) = v7;
    *(uint16x8_t *)((char *)result + 6 * a2) = vminq_u16(v8, v4);
    result = (uint16x8_t *)((char *)result + 8 * a2);
    a3 += 4;
    v3 = 0;
  }
  while ((v5 & 1) != 0);
  return result;
}

uint16x8_t *sub_1C981C018(uint16x8_t *result, uint64_t a2, int16x8_t *a3)
{
  char v3;
  uint16x8_t v4;
  char v5;
  int16x8_t v6;
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  uint16x8_t v10;
  uint16x8_t v11;
  uint16x8_t v12;

  v3 = 1;
  v4.i64[0] = 0xFF00FF00FF00FFLL;
  v4.i64[1] = 0xFF00FF00FF00FFLL;
  do
  {
    v5 = v3;
    v6 = *a3;
    v7 = a3[1];
    v8 = a3[2];
    v9 = a3[3];
    *a3 = 0uLL;
    a3[1] = 0uLL;
    a3[2] = 0uLL;
    a3[3] = 0uLL;
    v10 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 2 * a2), v7), v4);
    v11 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 4 * a2), v8), v4);
    v12 = vsqaddq_u16(*(uint16x8_t *)((char *)result + 6 * a2), v9);
    *result = vminq_u16(vsqaddq_u16(*result, v6), v4);
    *(uint16x8_t *)((char *)result + 2 * a2) = v10;
    *(uint16x8_t *)((char *)result + 4 * a2) = v11;
    *(uint16x8_t *)((char *)result + 6 * a2) = vminq_u16(v12, v4);
    result = (uint16x8_t *)((char *)result + 8 * a2);
    a3 += 4;
    v3 = 0;
  }
  while ((v5 & 1) != 0);
  return result;
}

int16x4_t sub_1C981C0A0(int16x4_t *a1, uint64_t a2, int16x4_t *a3, uint64_t a4, int16x4_t *a5)
{
  int16x4_t v5;
  int16x4_t v6;
  int16x4_t v7;
  int16x4_t v8;
  int16x4_t result;

  v5 = vsub_s16(*(int16x4_t *)((char *)a1 + 2 * a2), *(int16x4_t *)((char *)a3 + 2 * a4));
  v6 = *(int16x4_t *)((char *)a1 + 6 * a2);
  v7 = *(int16x4_t *)((char *)a3 + 6 * a4);
  v8 = vsub_s16(*(int16x4_t *)((char *)a1 + 4 * a2), *(int16x4_t *)((char *)a3 + 4 * a4));
  *a5 = vsub_s16(*a1, *a3);
  a5[1] = v5;
  result = vsub_s16(v6, v7);
  a5[2] = v8;
  a5[3] = result;
  return result;
}

int16x8_t *sub_1C981C0F8(int16x8_t *result, uint64_t a2, int16x8_t *a3, uint64_t a4, int16x8_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  int16x8_t v9;
  int16x8_t *v10;
  int16x8_t *v11;
  int16x8_t v12;
  int16x8_t *v13;
  int16x8_t *v14;
  int16x8_t v15;

  v5 = 2 * a2;
  v6 = 2 * a4;
  v7 = 1;
  do
  {
    v8 = v7;
    v9 = vsubq_s16(*(int16x8_t *)((char *)result + 2 * a2), *(int16x8_t *)((char *)a3 + 2 * a4));
    v10 = (int16x8_t *)((char *)result + v5 + v5);
    v11 = (int16x8_t *)((char *)a3 + v6 + v6);
    v12 = vsubq_s16(*v10, *v11);
    v13 = (int16x8_t *)((char *)v10 + v5);
    v14 = (int16x8_t *)((char *)v11 + v6);
    v15 = vsubq_s16(*v13, *v14);
    *a5 = vsubq_s16(*result, *a3);
    a5[1] = v9;
    a5[2] = v12;
    a5[3] = v15;
    result = (int16x8_t *)((char *)v13 + v5);
    a3 = (int16x8_t *)((char *)v14 + v6);
    a5 += 4;
    v7 = 0;
  }
  while ((v8 & 1) != 0);
  return result;
}

int16x8_t *sub_1C981C170(int16x8_t *result, uint64_t a2, int16x8_t *a3, uint64_t a4, int16x8_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  int16x8_t v8;
  int16x8_t v9;
  int16x8_t v10;

  v5 = 2 * a2;
  v6 = 2 * a4;
  v7 = -2;
  do
  {
    v8 = vsubq_s16(result[1], a3[1]);
    v9 = vsubq_s16(*(int16x8_t *)((char *)result + 2 * a2), *(int16x8_t *)((char *)a3 + 2 * a4));
    v10 = vsubq_s16(*(int16x8_t *)((char *)&result[1] + v5), *(int16x8_t *)((char *)&a3[1] + v6));
    *a5 = vsubq_s16(*result, *a3);
    a5[1] = v8;
    v7 += 2;
    a5[2] = v9;
    a5[3] = v10;
    result = (int16x8_t *)((char *)result + v5 + v5);
    a3 = (int16x8_t *)((char *)a3 + v6 + v6);
    a5 += 4;
  }
  while (v7 < 0xE);
  return result;
}

int16x8_t sub_1C981C1C8(int16x8_t *a1, uint64_t a2, int16x8_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  int16x8_t *v6;
  int16x8_t *v7;
  int16x8_t result;
  int16x8_t v9;
  int16x8_t v10;
  int16x8_t *v11;
  int16x8_t v12;

  v5 = 0;
  v6 = a3 + 2;
  v7 = a1 + 2;
  do
  {
    result = vsubq_s16(v7[-2], v6[-2]);
    v9 = vsubq_s16(v7[-1], v6[-1]);
    v10 = vsubq_s16(*v7, *v6);
    v11 = (int16x8_t *)(a5 + v5);
    v12 = vsubq_s16(v7[1], v6[1]);
    *v11 = result;
    v11[1] = v9;
    v11[2] = v10;
    v11[3] = v12;
    v5 += 64;
    v6 = (int16x8_t *)((char *)v6 + 2 * a4);
    v7 = (int16x8_t *)((char *)v7 + 2 * a2);
  }
  while ((_DWORD)v5 != 2048);
  return result;
}

int16x4_t sub_1C981C220(int16x4_t *a1, uint64_t a2, int16x4_t *a3, uint64_t a4, int16x4_t *a5)
{
  int16x4_t v6;
  int16x4_t v7;
  int16x4_t v8;
  int16x4_t v9;
  int16x4_t v11[6];

  v11[5] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v6 = vsub_s16(*(int16x4_t *)((char *)a1 + 2 * a2), *(int16x4_t *)((char *)a3 + 2 * a4));
  v7 = *(int16x4_t *)((char *)a1 + 6 * a2);
  v8 = *(int16x4_t *)((char *)a3 + 6 * a4);
  v9 = vsub_s16(*(int16x4_t *)((char *)a1 + 4 * a2), *(int16x4_t *)((char *)a3 + 4 * a4));
  *a5 = vsub_s16(*a1, *a3);
  a5[1] = v6;
  a5[2] = v9;
  a5[3] = vsub_s16(v7, v8);
  sub_1C981AFE4(v11, a5, 2);
  return sub_1C981B088(a5, v11);
}

int16x4_t sub_1C981C2E0(int16x4_t *a1, uint64_t a2, int16x4_t *a3, uint64_t a4, int16x4_t *a5)
{
  int16x4_t v5;
  int16x4_t v6;
  int16x4_t v7;
  int16x4_t v8;
  int32x2_t v9;
  int32x2_t v10;
  int32x2_t v11;
  int32x2_t v12;
  int16x4_t v13;
  int16x4_t v14;
  int16x4_t v15;
  int16x4_t v16;
  int16x4_t v17;
  int16x4_t v18;
  int16x4_t v19;
  int16x4_t v20;
  int16x4_t v22[6];

  v22[5] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v5 = vsub_s16(*a1, *a3);
  v6 = vsub_s16(*(int16x4_t *)((char *)a1 + 2 * a2), *(int16x4_t *)((char *)a3 + 2 * a4));
  v7 = vsub_s16(*(int16x4_t *)((char *)a1 + 4 * a2), *(int16x4_t *)((char *)a3 + 4 * a4));
  v8 = vsub_s16(*(int16x4_t *)((char *)a1 + 6 * a2), *(int16x4_t *)((char *)a3 + 6 * a4));
  *a5 = v5;
  a5[1] = v6;
  a5[2] = v7;
  a5[3] = v8;
  v9 = (int32x2_t)vtrn1_s16(v5, v6);
  v10 = (int32x2_t)vtrn2_s16(v5, v6);
  v11 = (int32x2_t)vtrn1_s16(v7, v8);
  v12 = (int32x2_t)vtrn2_s16(v7, v8);
  v13 = (int16x4_t)vzip1_s32(v10, v12);
  v14 = (int16x4_t)vzip2_s32(v9, v11);
  v15 = (int16x4_t)vzip2_s32(v10, v12);
  v16 = (int16x4_t)vzip1_s32(v9, v11);
  v17 = vadd_s16(v15, v16);
  v18 = vsub_s16(v16, v15);
  v19 = vadd_s16(v14, v13);
  v20 = vsub_s16(v13, v14);
  v22[0] = vqmovn_s32(vrshrq_n_s32(vshlq_n_s32(vaddl_s16(v19, v17), 6uLL), 2uLL));
  v22[1] = vqmovn_s32(vrshrq_n_s32(vmlal_s16(vmull_s16(v20, (int16x4_t)0x24002400240024), v18, (int16x4_t)0x53005300530053), 2uLL));
  v22[2] = vqmovn_s32(vrshrq_n_s32(vshlq_n_s32(vsubl_s16(v17, v19), 6uLL), 2uLL));
  v22[3] = vqmovn_s32(vrshrq_n_s32(vmlsl_s16(vmull_s16(v18, (int16x4_t)0x24002400240024), v20, (int16x4_t)0x53005300530053), 2uLL));
  return sub_1C981AF54(a5, v22);
}

void sub_1C981C404(int16x8_t *a1, uint64_t a2, int16x8_t *a3, uint64_t a4, int16x8_t *a5)
{
  int16x4_t v6[18];

  v6[17] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  sub_1C981C0F8(a1, a2, a3, a4, a5);
  sub_1C981ADF0(v6, (int16x4_t *)a5, 3);
  sub_1C981AE94((int16x4_t *)a5, v6);
}

void sub_1C981C474(int16x8_t *a1, uint64_t a2, int16x8_t *a3, uint64_t a4, int16x4_t *a5)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  int16x8_t *v9;
  int16x8_t v10;
  int16x8_t v11;
  int16x8_t v12;
  int16x4_t v13[66];

  v13[65] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v6 = 2 * a2;
  v7 = 2 * a4;
  v8 = -2;
  v9 = (int16x8_t *)a5;
  do
  {
    v10 = vsubq_s16(a1[1], a3[1]);
    v11 = vsubq_s16(*(int16x8_t *)((char *)a1 + 2 * a2), *(int16x8_t *)((char *)a3 + 2 * a4));
    v12 = vsubq_s16(*(int16x8_t *)((char *)&a1[1] + v6), *(int16x8_t *)((char *)&a3[1] + v7));
    *v9 = vsubq_s16(*a1, *a3);
    v9[1] = v10;
    v8 += 2;
    v9[2] = v11;
    v9[3] = v12;
    a1 = (int16x8_t *)((char *)a1 + v6 + v6);
    a3 = (int16x8_t *)((char *)a3 + v7 + v7);
    v9 += 4;
  }
  while (v8 < 0xE);
  sub_1C981AB1C(v13, a5, 4);
  sub_1C981AC68(a5, v13);
}

void sub_1C981C538(int16x8_t *a1, uint64_t a2, int16x8_t *a3, uint64_t a4, int16x4_t *a5)
{
  uint64_t v6;
  int16x8_t *v7;
  int16x8_t *v8;
  int16x8_t v9;
  int16x8_t v10;
  int16x8_t *v11;
  int16x8_t v12;
  int16x4_t v13[258];

  v6 = 0;
  v13[257] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v7 = a3 + 2;
  v8 = a1 + 2;
  do
  {
    v9 = vsubq_s16(v8[-1], v7[-1]);
    v10 = vsubq_s16(*v8, *v7);
    v11 = (int16x8_t *)&a5[v6];
    v12 = vsubq_s16(v8[1], v7[1]);
    *v11 = vsubq_s16(v8[-2], v7[-2]);
    v11[1] = v9;
    v11[2] = v10;
    v11[3] = v12;
    v6 += 8;
    v7 = (int16x8_t *)((char *)v7 + 2 * a4);
    v8 = (int16x8_t *)((char *)v8 + 2 * a2);
  }
  while ((_DWORD)(v6 * 8) != 2048);
  sub_1C9819DB0(v13, a5, 5);
  sub_1C9819FE4(a5, v13);
}

double sub_1C981C5F8(uint64_t *a1, uint64_t a2, int16x4_t *a3, char a4)
{
  int16x4_t v4;
  int16x4_t v5;
  int16x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int16x4_t v18;
  int16x4_t v19;
  int32x2_t v20;
  int32x2_t v21;
  int16x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int16x4_t v30;
  uint64_t *v31;
  uint64_t *v32;
  int16x8_t v33;
  uint16x8_t v34;
  uint16x8_t v35;

  v4 = a3[1];
  v5 = a3[2];
  v6 = a3[3];
  v7 = vaddl_s16(v5, *a3);
  v8 = vaddl_s16(v6, v5);
  v9 = vsubl_s16(*a3, v6);
  v10.i64[0] = 0x1D0000001DLL;
  v10.i64[1] = 0x1D0000001DLL;
  v11.i64[0] = 0x3700000037;
  v11.i64[1] = 0x3700000037;
  v12 = vmlaq_s32(vmlal_s16(vmulq_s32(v7, v10), v4, (int16x4_t)0x4A004A004A004ALL), v8, v11);
  v13 = vmlaq_s32(vmlsl_s16(vmulq_s32(v7, v11), v4, (int16x4_t)0x4A004A004A004ALL), v9, v10);
  v14.i64[0] = 0x1C0000001CLL;
  v14.i64[1] = 0x1C0000001CLL;
  v15 = vmlaq_s32(vmlal_s16(vmulq_s32(v9, v11), v4, (int16x4_t)0x4A004A004A004ALL), v8, v14);
  v16.i64[0] = 0x4A0000004ALL;
  v16.i64[1] = 0x4A0000004ALL;
  v17 = vmulq_s32(vaddw_s16(vsubl_s16(*a3, v5), v6), v16);
  v18 = vqrshrn_n_s32(v12, 7uLL);
  v19 = vqrshrn_n_s32(v15, 7uLL);
  *(int16x4_t *)v17.i8 = vqrshrn_n_s32(v17, 7uLL);
  *(int16x4_t *)v13.i8 = vqrshrn_n_s32(v13, 7uLL);
  *(int16x4_t *)v8.i8 = vtrn1_s16(v18, v19);
  v20 = (int32x2_t)vtrn2_s16(v18, v19);
  v21 = (int32x2_t)vtrn1_s16(*(int16x4_t *)v17.i8, *(int16x4_t *)v13.i8);
  *(int16x4_t *)v17.i8 = vtrn2_s16(*(int16x4_t *)v17.i8, *(int16x4_t *)v13.i8);
  *(int32x2_t *)v13.i8 = vzip1_s32(*(int32x2_t *)v8.i8, v21);
  v22 = (int16x4_t)vzip2_s32(*(int32x2_t *)v8.i8, v21);
  v23 = vaddl_s16(*(int16x4_t *)v13.i8, v22);
  *(int32x2_t *)v15.i8 = vzip2_s32(v20, *(int32x2_t *)v17.i8);
  v24 = vaddl_s16(v22, *(int16x4_t *)v15.i8);
  v25 = vsubl_s16(*(int16x4_t *)v13.i8, *(int16x4_t *)v15.i8);
  *(int32x2_t *)v17.i8 = vzip1_s32(v20, *(int32x2_t *)v17.i8);
  v26 = vmlaq_s32(vmlal_s16(vmulq_s32(v24, v11), *(int16x4_t *)v17.i8, (int16x4_t)0x4A004A004A004ALL), v23, v10);
  v27 = vmlaq_s32(vmlsl_s16(vmulq_s32(v25, v10), *(int16x4_t *)v17.i8, (int16x4_t)0x4A004A004A004ALL), v23, v11);
  v28 = vmlaq_s32(vmlal_s16(vmulq_s32(v25, v11), *(int16x4_t *)v17.i8, (int16x4_t)0x4A004A004A004ALL), v24, v14);
  v29 = vmulq_s32(vaddw_s16(vsubl_s16(*(int16x4_t *)v13.i8, v22), *(int16x4_t *)v15.i8), v16);
  *(int16x4_t *)v16.i8 = vqrshrn_n_s32(v26, 0xBuLL);
  *(int16x4_t *)v26.i8 = vqrshrn_n_s32(v28, 0xBuLL);
  v30 = vqrshrn_n_s32(v29, 0xBuLL);
  *(int16x4_t *)v13.i8 = vqrshrn_n_s32(v27, 0xBuLL);
  vst4_s16((__int16 *)a3, *(int16x4x4_t *)((char *)&v13 - 24));
  v31 = (uint64_t *)((char *)a1 + 2 * a2);
  v29.i64[0] = *a1;
  v29.i64[1] = *v31;
  v32 = (uint64_t *)((char *)a1 + 6 * a2);
  v16.i64[0] = *(uint64_t *)((char *)a1 + 4 * a2);
  v16.i64[1] = *v32;
  v33 = *(int16x8_t *)a3[2].i8;
  v26.i64[0] = 0xFE00FE00FE00FE00;
  v26.i64[1] = 0xFE00FE00FE00FE00;
  v34 = vminq_u16(vsqaddq_u16((uint16x8_t)v29, *(int16x8_t *)a3->i8), (uint16x8_t)v26);
  *a1 = v34.i64[0];
  *v31 = v34.i64[1];
  v35 = vminq_u16(vsqaddq_u16((uint16x8_t)v16, v33), (uint16x8_t)v26);
  *(uint64_t *)((char *)a1 + 4 * a2) = v35.i64[0];
  *v32 = v35.i64[1];
  if ((a4 & 1) == 0)
  {
    v35.i64[0] = 0;
    *(_OWORD *)a3->i8 = 0u;
    *(_OWORD *)a3[2].i8 = 0u;
  }
  return *(double *)v35.i64;
}

void sub_1C981C728(uint64_t *a1, uint64_t a2, int32x4_t *a3, int a4, int a5)
{
  char v5;
  int16x8_t v9;
  uint64_t *v10;
  uint16x8_t v11;
  uint64_t *v12;
  uint16x8_t v13;
  uint16x8_t v14;
  uint16x8_t v15;
  uint16x8_t v16;
  uint64_t *v17;
  uint16x8_t v18;
  uint64_t *v19;
  uint16x8_t v20;
  uint16x8_t v21;
  uint16x8_t v22;
  uint16x8_t v23;

  v5 = a4;
  if (a5 != 1)
  {
    sub_1C981DD10(a3, a5);
    v17 = (uint64_t *)((char *)a1 + 2 * a2);
    v18.i64[0] = *a1;
    v18.i64[1] = *v17;
    v19 = (uint64_t *)((char *)a1 + 6 * a2);
    v20.i64[0] = *(uint64_t *)((char *)a1 + 4 * a2);
    v20.i64[1] = *v19;
    v21.i64[0] = 0xFE00FE00FE00FE00;
    v21.i64[1] = 0xFE00FE00FE00FE00;
    v22 = vminq_u16(vsqaddq_u16(v18, *(int16x8_t *)a3), v21);
    v23 = vminq_u16(vsqaddq_u16(v20, (int16x8_t)a3[1]), v21);
    *a1 = v22.i64[0];
    *v17 = v22.i64[1];
    *(uint64_t *)((char *)a1 + 4 * a2) = v23.i64[0];
    *v19 = v23.i64[1];
    if ((v5 & 1) != 0)
      return;
    v9 = 0uLL;
    goto LABEL_6;
  }
  v9 = vdupq_n_s16((a3->i16[0] + 33) >> 6);
  a3->i16[0] = 0;
  v10 = (uint64_t *)((char *)a1 + 2 * a2);
  v11.i64[0] = *a1;
  v11.i64[1] = *v10;
  v12 = (uint64_t *)((char *)a1 + 6 * a2);
  v13.i64[0] = *(uint64_t *)((char *)a1 + 4 * a2);
  v13.i64[1] = *v12;
  v14.i64[0] = 0xFE00FE00FE00FE00;
  v14.i64[1] = 0xFE00FE00FE00FE00;
  v15 = vminq_u16(vsqaddq_u16(v11, v9), v14);
  v16 = vminq_u16(vsqaddq_u16(v13, v9), v14);
  *a1 = v15.i64[0];
  *v10 = v15.i64[1];
  *(uint64_t *)((char *)a1 + 4 * a2) = v16.i64[0];
  *v12 = v16.i64[1];
  if (a4)
  {
LABEL_6:
    *a3 = (int32x4_t)v9;
    a3[1] = (int32x4_t)v9;
  }
}

uint16x8_t *sub_1C981C820(uint16x8_t *result, uint64_t a2, int16x4_t *a3, int a4, int a5)
{
  int16x8_t *v6;
  uint16x8_t *v8;
  int16x8_t v9;
  uint16x8_t v10;
  uint16x8_t v11;
  uint16x8_t v12;
  uint16x8_t v13;
  uint16x8_t v14;
  uint16x8_t v15;
  uint16x8_t v16;
  uint16x8_t v17;
  unsigned int v18;
  char v19;
  uint16x8_t v20;
  char v21;
  uint16x8_t v22;
  uint16x8_t v23;
  uint16x8_t v24;
  uint16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  int16x8_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int16x8_t v33;
  int16x8_t v34;
  int16x8_t v35;
  int16x8_t v36;
  unsigned int v37;
  int8x16_t v38;

  v6 = (int16x8_t *)a3;
  v8 = result;
  if (a5 == 1)
  {
    v9 = vdupq_n_s16((a3->i16[0] + 33) >> 6);
    a3->i16[0] = 0;
    v10 = *(uint16x8_t *)((char *)result + 14 * a2);
    v11.i64[0] = 0xFE00FE00FE00FE00;
    v11.i64[1] = 0xFE00FE00FE00FE00;
    v12 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 2 * a2), v9), v11);
    v13 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 4 * a2), v9), v11);
    v14 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 6 * a2), v9), v11);
    v15 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 8 * a2), v9), v11);
    v16 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 10 * a2), v9), v11);
    v17 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 12 * a2), v9), v11);
    *result = vminq_u16(vsqaddq_u16(*result, v9), v11);
    *(uint16x8_t *)((char *)result + 2 * a2) = v12;
    *(uint16x8_t *)((char *)result + 4 * a2) = v13;
    *(uint16x8_t *)((char *)result + 6 * a2) = v14;
    *(uint16x8_t *)((char *)result + 8 * a2) = v15;
    *(uint16x8_t *)((char *)result + 10 * a2) = v16;
    *(uint16x8_t *)((char *)result + 12 * a2) = v17;
    *(uint16x8_t *)((char *)result + 14 * a2) = vminq_u16(vsqaddq_u16(v10, v9), v11);
    if (a4)
    {
      v18 = -16;
      do
      {
        *v6 = v9;
        v6[1] = v9;
        v6 += 2;
        v18 += 16;
      }
      while (v18 < 0x30);
    }
  }
  else
  {
    result = (uint16x8_t *)sub_1C981DC08(a3, a5);
    v19 = 1;
    v20.i64[0] = 0xFE00FE00FE00FE00;
    v20.i64[1] = 0xFE00FE00FE00FE00;
    do
    {
      v21 = v19;
      v22 = *v8;
      v23 = *(uint16x8_t *)((char *)v8 + 2 * a2);
      v24 = *(uint16x8_t *)((char *)v8 + 4 * a2);
      v25 = *(uint16x8_t *)((char *)v8 + 6 * a2);
      v26 = v6[1];
      v27 = v6[2];
      v28 = v6[3];
      v29 = (int32x4_t)vtrn1q_s16(*v6, v26);
      v30 = (int32x4_t)vtrn2q_s16(*v6, v26);
      v31 = (int32x4_t)vtrn1q_s16(v27, v28);
      v32 = (int32x4_t)vtrn2q_s16(v27, v28);
      v33 = (int16x8_t)vtrn1q_s32(v29, v31);
      v34 = (int16x8_t)vtrn2q_s32(v29, v31);
      v35 = (int16x8_t)vtrn1q_s32(v30, v32);
      v36 = (int16x8_t)vtrn2q_s32(v30, v32);
      if (a4)
        v37 = -1;
      else
        v37 = 0;
      v38 = (int8x16_t)vdupq_n_s16(v37);
      *(int8x16_t *)v6 = vandq_s8((int8x16_t)v33, v38);
      v6[1] = (int16x8_t)vandq_s8((int8x16_t)v35, v38);
      v6[2] = (int16x8_t)vandq_s8((int8x16_t)v34, v38);
      v6[3] = (int16x8_t)vandq_s8((int8x16_t)v36, v38);
      *v8 = vminq_u16(vsqaddq_u16(v22, v33), v20);
      *(uint16x8_t *)((char *)v8 + 2 * a2) = vminq_u16(vsqaddq_u16(v23, v35), v20);
      *(uint16x8_t *)((char *)v8 + 4 * a2) = vminq_u16(vsqaddq_u16(v24, v34), v20);
      *(uint16x8_t *)((char *)v8 + 6 * a2) = vminq_u16(vsqaddq_u16(v25, v36), v20);
      v8 = (uint16x8_t *)((char *)v8 + 8 * a2);
      v6 += 4;
      v19 = 0;
    }
    while ((v21 & 1) != 0);
  }
  return result;
}

int16x4_t *sub_1C981CA00(int16x4_t *result, uint64_t a2, int16x4_t *a3, int a4, int a5)
{
  _OWORD *v6;
  uint16x8_t *v8;
  int16x8_t v9;
  uint64_t v10;
  unsigned int v11;
  uint16x8_t v12;
  uint16x8_t *v13;
  uint16x8_t v14;
  uint16x8_t v15;
  uint16x8_t v16;
  unsigned int v17;
  uint64_t v18;
  char v19;
  uint16x8_t v20;
  char v21;
  uint16x8_t *v22;
  unsigned int v23;
  int16x8_t *v24;
  uint16x8_t v25;
  uint16x8_t v26;
  uint16x8_t v27;
  uint16x8_t v28;
  int16x8_t v29;
  int16x8_t v30;
  int16x8_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int32x4_t v34;
  int32x4_t v35;
  int16x8_t v36;
  int16x8_t v37;
  int16x8_t v38;
  int16x8_t v39;
  unsigned int v40;
  int8x16_t v41;

  v6 = a3;
  v8 = (uint16x8_t *)result;
  if (a5 == 1)
  {
    v9 = vdupq_n_s16((a3->i16[0] + 33) >> 6);
    a3->i16[0] = 0;
    v10 = 2 * a2;
    v11 = -2;
    v12.i64[0] = 0xFE00FE00FE00FE00;
    v12.i64[1] = 0xFE00FE00FE00FE00;
    do
    {
      v13 = (uint16x8_t *)((char *)v8 + v10);
      v14 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v8 + 2 * a2), v9), v12);
      v15 = vminq_u16(vsqaddq_u16(v8[1], v9), v12);
      v16 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v8[1] + v10), v9), v12);
      *v8 = vminq_u16(vsqaddq_u16(*v8, v9), v12);
      *v13 = v14;
      v8[1] = v15;
      v13[1] = v16;
      v8 = (uint16x8_t *)((char *)v8 + 4 * a2);
      v11 += 2;
    }
    while (v11 < 0xE);
    if (a4)
    {
      v17 = -16;
      do
      {
        *v6 = v9;
        v6[1] = v9;
        v6 += 2;
        v17 += 16;
      }
      while (v17 < 0xF0);
    }
  }
  else
  {
    result = sub_1C981DA2C(a3, a5);
    v18 = 0;
    v19 = 1;
    v20.i64[0] = 0xFE00FE00FE00FE00;
    v20.i64[1] = 0xFE00FE00FE00FE00;
    do
    {
      v21 = v19;
      v22 = &v8[v18];
      v23 = -4;
      v24 = (int16x8_t *)&v6[v18];
      do
      {
        v25 = *(uint16x8_t *)((char *)v22 + 2 * a2);
        v26 = *v22;
        v27 = *(uint16x8_t *)((char *)v22 + 4 * a2);
        v28 = *(uint16x8_t *)((char *)v22 + 6 * a2);
        v29 = v24[2];
        v30 = v24[4];
        v31 = v24[6];
        v32 = (int32x4_t)vtrn1q_s16(*v24, v29);
        v33 = (int32x4_t)vtrn2q_s16(*v24, v29);
        v34 = (int32x4_t)vtrn1q_s16(v30, v31);
        v35 = (int32x4_t)vtrn2q_s16(v30, v31);
        v36 = (int16x8_t)vtrn1q_s32(v32, v34);
        v37 = (int16x8_t)vtrn2q_s32(v32, v34);
        v38 = (int16x8_t)vtrn1q_s32(v33, v35);
        v39 = (int16x8_t)vtrn2q_s32(v33, v35);
        if (a4)
          v40 = -1;
        else
          v40 = 0;
        v41 = (int8x16_t)vdupq_n_s16(v40);
        *(int8x16_t *)v24 = vandq_s8((int8x16_t)v36, v41);
        v24[2] = (int16x8_t)vandq_s8((int8x16_t)v38, v41);
        v24[4] = (int16x8_t)vandq_s8((int8x16_t)v37, v41);
        v24[6] = (int16x8_t)vandq_s8((int8x16_t)v39, v41);
        *v22 = vminq_u16(vsqaddq_u16(v26, v36), v20);
        *(uint16x8_t *)((char *)v22 + 2 * a2) = vminq_u16(vsqaddq_u16(v25, v38), v20);
        *(uint16x8_t *)((char *)v22 + 4 * a2) = vminq_u16(vsqaddq_u16(v27, v37), v20);
        *(uint16x8_t *)((char *)v22 + 6 * a2) = vminq_u16(vsqaddq_u16(v28, v39), v20);
        v22 = (uint16x8_t *)((char *)v22 + 8 * a2);
        v23 += 4;
        v24 += 8;
      }
      while (v23 < 0xC);
      v19 = 0;
      v18 = 1;
    }
    while ((v21 & 1) != 0);
  }
  return result;
}

uint16x8_t *sub_1C981CBBC(uint16x8_t *result, uint64_t a2, int16x4_t *a3, int a4, int a5)
{
  _OWORD *v6;
  uint16x8_t *v8;
  int16x8_t v9;
  uint16x8_t *v10;
  int v11;
  uint16x8_t v12;
  uint16x8_t v13;
  uint16x8_t v14;
  uint16x8_t v15;
  unsigned int v16;
  unint64_t v17;
  uint16x8_t v18;
  int16x8_t *v19;
  unsigned int v20;
  uint16x8_t *v21;
  uint16x8_t v22;
  uint16x8_t v23;
  uint16x8_t v24;
  uint16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  int16x8_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int16x8_t v33;
  int16x8_t v34;
  int16x8_t v35;
  int16x8_t v36;
  unsigned int v37;
  int8x16_t v38;

  v6 = a3;
  v8 = result;
  if (a5 == 1)
  {
    v9 = vdupq_n_s16((a3->i16[0] + 33) >> 6);
    a3->i16[0] = 0;
    v10 = result + 2;
    v11 = 32;
    v12.i64[0] = 0xFE00FE00FE00FE00;
    v12.i64[1] = 0xFE00FE00FE00FE00;
    do
    {
      v13 = vminq_u16(vsqaddq_u16(v10[-1], v9), v12);
      v14 = vminq_u16(vsqaddq_u16(*v10, v9), v12);
      v15 = vminq_u16(vsqaddq_u16(v10[1], v9), v12);
      v10[-2] = vminq_u16(vsqaddq_u16(v10[-2], v9), v12);
      v10[-1] = v13;
      *v10 = v14;
      v10[1] = v15;
      v10 = (uint16x8_t *)((char *)v10 + 2 * a2);
      --v11;
    }
    while (v11);
    if (a4)
    {
      v16 = -16;
      do
      {
        *v6 = v9;
        v6[1] = v9;
        v6 += 2;
        v16 += 16;
      }
      while (v16 < 0x3F0);
    }
  }
  else
  {
    result = (uint16x8_t *)sub_1C981D104(a3, a5);
    v17 = 0;
    v18.i64[0] = 0xFE00FE00FE00FE00;
    v18.i64[1] = 0xFE00FE00FE00FE00;
    do
    {
      v19 = (int16x8_t *)&v6[v17];
      v20 = -4;
      v21 = v8;
      do
      {
        v22 = *(uint16x8_t *)((char *)v21 + 2 * a2);
        v23 = *v21;
        v24 = *(uint16x8_t *)((char *)v21 + 4 * a2);
        v25 = *(uint16x8_t *)((char *)v21 + 6 * a2);
        v26 = v19[4];
        v27 = v19[8];
        v28 = v19[12];
        v29 = (int32x4_t)vtrn1q_s16(*v19, v26);
        v30 = (int32x4_t)vtrn2q_s16(*v19, v26);
        v31 = (int32x4_t)vtrn1q_s16(v27, v28);
        v32 = (int32x4_t)vtrn2q_s16(v27, v28);
        v33 = (int16x8_t)vtrn1q_s32(v29, v31);
        v34 = (int16x8_t)vtrn2q_s32(v29, v31);
        v35 = (int16x8_t)vtrn1q_s32(v30, v32);
        v36 = (int16x8_t)vtrn2q_s32(v30, v32);
        if (a4)
          v37 = -1;
        else
          v37 = 0;
        v38 = (int8x16_t)vdupq_n_s16(v37);
        *(int8x16_t *)v19 = vandq_s8((int8x16_t)v33, v38);
        v19[4] = (int16x8_t)vandq_s8((int8x16_t)v35, v38);
        v19[8] = (int16x8_t)vandq_s8((int8x16_t)v34, v38);
        v19[12] = (int16x8_t)vandq_s8((int8x16_t)v36, v38);
        *v21 = vminq_u16(vsqaddq_u16(v23, v33), v18);
        *(uint16x8_t *)((char *)v21 + 2 * a2) = vminq_u16(vsqaddq_u16(v22, v35), v18);
        *(uint16x8_t *)((char *)v21 + 4 * a2) = vminq_u16(vsqaddq_u16(v24, v34), v18);
        *(uint16x8_t *)((char *)v21 + 6 * a2) = vminq_u16(vsqaddq_u16(v25, v36), v18);
        v21 = (uint16x8_t *)((char *)v21 + 8 * a2);
        v20 += 4;
        v19 += 16;
      }
      while (v20 < 0x1C);
      ++v8;
    }
    while (v17++ < 3);
  }
  return result;
}

int16x8_t sub_1C981CD68(int16x8_t *a1)
{
  int16x8_t result;
  int16x8_t v2;

  result = vshlq_n_s16(*a1, 4uLL);
  v2 = vshlq_n_s16(a1[1], 4uLL);
  *a1 = result;
  a1[1] = v2;
  return result;
}

int16x8_t sub_1C981CD7C(int16x8_t *a1)
{
  int16x8_t result;
  int16x8_t v2;

  result = vrshrq_n_s16(*a1, 4uLL);
  v2 = vrshrq_n_s16(a1[1], 4uLL);
  *a1 = result;
  a1[1] = v2;
  return result;
}

int16x8_t *sub_1C981CD90(int16x8_t *result)
{
  unsigned int v1;
  int16x8_t v2;

  v1 = -16;
  do
  {
    v2 = vrshrq_n_s16(result[1], 3uLL);
    *result = vrshrq_n_s16(*result, 3uLL);
    result[1] = v2;
    result += 2;
    v1 += 16;
  }
  while (v1 < 0x30);
  return result;
}

double sub_1C981CDB4(uint64_t *a1, uint64_t a2, int16x8_t *a3, char a4)
{
  uint64_t *v4;
  uint16x8_t v5;
  uint64_t *v6;
  uint16x8_t v7;
  int16x8_t v8;
  uint16x8_t v9;
  uint16x8_t v10;
  uint16x8_t v11;

  v4 = (uint64_t *)((char *)a1 + 2 * a2);
  v5.i64[0] = *a1;
  v5.i64[1] = *v4;
  v6 = (uint64_t *)((char *)a1 + 6 * a2);
  v7.i64[0] = *(uint64_t *)((char *)a1 + 4 * a2);
  v7.i64[1] = *v6;
  v8 = a3[1];
  v9.i64[0] = 0xFE00FE00FE00FE00;
  v9.i64[1] = 0xFE00FE00FE00FE00;
  v10 = vminq_u16(vsqaddq_u16(v5, *a3), v9);
  *a1 = v10.i64[0];
  *v4 = v10.i64[1];
  v11 = vminq_u16(vsqaddq_u16(v7, v8), v9);
  *(uint64_t *)((char *)a1 + 4 * a2) = v11.i64[0];
  *v6 = v11.i64[1];
  if ((a4 & 1) == 0)
  {
    v11.i64[0] = 0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return *(double *)v11.i64;
}

uint64_t sub_1C981CE0C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t (*v4)(void);

  if (a4)
    v4 = (uint64_t (*)(void))sub_1C981D000;
  else
    v4 = (uint64_t (*)(void))sub_1C981D07C;
  return v4();
}

uint64_t sub_1C981CE28(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t (*v4)(void);

  if (a4)
    v4 = (uint64_t (*)(void))sub_1C981CF2C;
  else
    v4 = (uint64_t (*)(void))sub_1C981CF90;
  return v4();
}

uint64_t sub_1C981CE44(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t (*v4)(void);

  if (a4)
    v4 = (uint64_t (*)(void))sub_1C981CE60;
  else
    v4 = (uint64_t (*)(void))sub_1C981CEC0;
  return v4();
}

uint16x8_t *sub_1C981CE60(uint16x8_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint16x8_t *v4;
  uint16x8_t v5;
  uint16x8_t v6;
  uint16x8_t v7;
  uint16x8_t v8;

  v3 = 0;
  v4 = result + 2;
  v5.i64[0] = 0xFE00FE00FE00FE00;
  v5.i64[1] = 0xFE00FE00FE00FE00;
  do
  {
    v6 = vminq_u16(vsqaddq_u16(v4[-1], *(int16x8_t *)(a3 + v3 + 16)), v5);
    v7 = vminq_u16(vsqaddq_u16(*v4, *(int16x8_t *)(a3 + v3 + 32)), v5);
    v8 = vminq_u16(vsqaddq_u16(v4[1], *(int16x8_t *)(a3 + v3 + 48)), v5);
    v4[-2] = vminq_u16(vsqaddq_u16(v4[-2], *(int16x8_t *)(a3 + v3)), v5);
    v4[-1] = v6;
    *v4 = v7;
    v4[1] = v8;
    v3 += 64;
    v4 = (uint16x8_t *)((char *)v4 + 2 * a2);
  }
  while ((_DWORD)v3 != 2048);
  return result;
}

uint16x8_t *sub_1C981CEC0(uint16x8_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint16x8_t *v4;
  uint16x8_t v5;
  _OWORD *v6;
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  int16x8_t v10;
  uint16x8_t v11;
  uint16x8_t v12;
  uint16x8_t v13;

  v3 = 0;
  v4 = result + 2;
  v5.i64[0] = 0xFE00FE00FE00FE00;
  v5.i64[1] = 0xFE00FE00FE00FE00;
  do
  {
    v6 = (_OWORD *)(a3 + v3);
    v7 = *(int16x8_t *)(a3 + v3);
    v8 = *(int16x8_t *)(a3 + v3 + 16);
    v9 = *(int16x8_t *)(a3 + v3 + 32);
    v10 = *(int16x8_t *)(a3 + v3 + 48);
    *v6 = 0uLL;
    v6[1] = 0uLL;
    v6[2] = 0uLL;
    v6[3] = 0uLL;
    v11 = vminq_u16(vsqaddq_u16(v4[-1], v8), v5);
    v12 = vminq_u16(vsqaddq_u16(*v4, v9), v5);
    v13 = vminq_u16(vsqaddq_u16(v4[1], v10), v5);
    v4[-2] = vminq_u16(vsqaddq_u16(v4[-2], v7), v5);
    v4[-1] = v11;
    *v4 = v12;
    v4[1] = v13;
    v3 += 64;
    v4 = (uint16x8_t *)((char *)v4 + 2 * a2);
  }
  while ((_DWORD)v3 != 2048);
  return result;
}

uint16x8_t *sub_1C981CF2C(uint16x8_t *result, uint64_t a2, int16x8_t *a3)
{
  uint64_t v3;
  unsigned int v4;
  uint16x8_t v5;
  uint16x8_t *v6;
  uint16x8_t v7;
  uint16x8_t v8;
  uint16x8_t v9;

  v3 = 2 * a2;
  v4 = -2;
  v5.i64[0] = 0xFE00FE00FE00FE00;
  v5.i64[1] = 0xFE00FE00FE00FE00;
  do
  {
    v6 = (uint16x8_t *)((char *)result + v3);
    v7 = vminq_u16(vsqaddq_u16(result[1], a3[1]), v5);
    v8 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 2 * a2), a3[2]), v5);
    v9 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&result[1] + v3), a3[3]), v5);
    *result = vminq_u16(vsqaddq_u16(*result, *a3), v5);
    result[1] = v7;
    *v6 = v8;
    v6[1] = v9;
    v4 += 2;
    result = (uint16x8_t *)((char *)result + 4 * a2);
    a3 += 4;
  }
  while (v4 < 0xE);
  return result;
}

uint16x8_t *sub_1C981CF90(uint16x8_t *result, uint64_t a2, int16x8_t *a3)
{
  uint64_t v3;
  unsigned int v4;
  uint16x8_t v5;
  int16x8_t v6;
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  uint16x8_t *v10;
  uint16x8_t v11;
  uint16x8_t v12;
  uint16x8_t v13;

  v3 = 2 * a2;
  v4 = -2;
  v5.i64[0] = 0xFE00FE00FE00FE00;
  v5.i64[1] = 0xFE00FE00FE00FE00;
  do
  {
    v6 = *a3;
    v7 = a3[1];
    v8 = a3[2];
    v9 = a3[3];
    *a3 = 0uLL;
    a3[1] = 0uLL;
    a3[2] = 0uLL;
    a3[3] = 0uLL;
    v10 = (uint16x8_t *)((char *)result + v3);
    v11 = vminq_u16(vsqaddq_u16(result[1], v7), v5);
    v12 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 2 * a2), v8), v5);
    v13 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&result[1] + v3), v9), v5);
    *result = vminq_u16(vsqaddq_u16(*result, v6), v5);
    result[1] = v11;
    *v10 = v12;
    v10[1] = v13;
    v4 += 2;
    result = (uint16x8_t *)((char *)result + 4 * a2);
    a3 += 4;
  }
  while (v4 < 0xE);
  return result;
}

uint16x8_t *sub_1C981D000(uint16x8_t *result, uint64_t a2, int16x8_t *a3)
{
  char v3;
  uint16x8_t v4;
  char v5;
  uint16x8_t v6;
  uint16x8_t v7;
  uint16x8_t v8;

  v3 = 1;
  v4.i64[0] = 0xFE00FE00FE00FE00;
  v4.i64[1] = 0xFE00FE00FE00FE00;
  do
  {
    v5 = v3;
    v6 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 2 * a2), a3[1]), v4);
    v7 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 4 * a2), a3[2]), v4);
    v8 = vsqaddq_u16(*(uint16x8_t *)((char *)result + 6 * a2), a3[3]);
    *result = vminq_u16(vsqaddq_u16(*result, *a3), v4);
    *(uint16x8_t *)((char *)result + 2 * a2) = v6;
    *(uint16x8_t *)((char *)result + 4 * a2) = v7;
    *(uint16x8_t *)((char *)result + 6 * a2) = vminq_u16(v8, v4);
    result = (uint16x8_t *)((char *)result + 8 * a2);
    a3 += 4;
    v3 = 0;
  }
  while ((v5 & 1) != 0);
  return result;
}

uint16x8_t *sub_1C981D07C(uint16x8_t *result, uint64_t a2, int16x8_t *a3)
{
  char v3;
  uint16x8_t v4;
  char v5;
  int16x8_t v6;
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  uint16x8_t v10;
  uint16x8_t v11;
  uint16x8_t v12;

  v3 = 1;
  v4.i64[0] = 0xFE00FE00FE00FE00;
  v4.i64[1] = 0xFE00FE00FE00FE00;
  do
  {
    v5 = v3;
    v6 = *a3;
    v7 = a3[1];
    v8 = a3[2];
    v9 = a3[3];
    *a3 = 0uLL;
    a3[1] = 0uLL;
    a3[2] = 0uLL;
    a3[3] = 0uLL;
    v10 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 2 * a2), v7), v4);
    v11 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 4 * a2), v8), v4);
    v12 = vsqaddq_u16(*(uint16x8_t *)((char *)result + 6 * a2), v9);
    *result = vminq_u16(vsqaddq_u16(*result, v6), v4);
    *(uint16x8_t *)((char *)result + 2 * a2) = v10;
    *(uint16x8_t *)((char *)result + 4 * a2) = v11;
    *(uint16x8_t *)((char *)result + 6 * a2) = vminq_u16(v12, v4);
    result = (uint16x8_t *)((char *)result + 8 * a2);
    a3 += 4;
    v3 = 0;
  }
  while ((v5 & 1) != 0);
  return result;
}

void *sub_1C981D104(int16x4_t *a1, int a2)
{
  int16x4_t *v2;
  unint64_t v4;
  int16x4_t *v5;
  unint64_t v6;
  int16x4_t *v7;
  unint64_t v8;
  void *result;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v2 = a1;
  if (a2 <= 16)
  {
    sub_1C970AB50(a1, 0x20u, (uint64_t)&unk_1C9861500);
LABEL_12:
    v8 = -4;
    do
    {
      result = sub_1C981D2FC(v2, 0x20u, (uint64_t)&unk_1C9861510);
      v8 += 4;
      v2 += 32;
    }
    while (v8 < 0x1C);
    return result;
  }
  if (a2 > 0x30)
  {
    if (a2 >= 0xA1)
    {
      v6 = -4;
      v7 = a1;
      do
      {
        sub_1C970FD18(v7);
        v6 += 4;
        ++v7;
      }
      while (v6 < 0x1C);
    }
    else
    {
      v4 = -4;
      v5 = a1;
      do
      {
        sub_1C970B648(v5, 0x20u, (uint64_t)&unk_1C9861540, (int16x4_t *)aZwpf, (int16x4_t *)aZzxurnic6);
        v4 += 4;
        ++v5;
      }
      while (v4 < 0xC);
    }
  }
  else
  {
    sub_1C970AC1C(a1, 0x20u, (uint64_t)&unk_1C9861520, (int16x4_t *)aZzxu);
    sub_1C970AC1C(v2 + 1, 0x20u, (uint64_t)&unk_1C9861520, (int16x4_t *)aZzxu);
  }
  if (a2 <= 32)
    goto LABEL_12;
  if (a2 > 0x50)
  {
    if (a2 >= 0xE1)
    {
      v12 = -4;
      do
      {
        result = sub_1C981D778(v2);
        v12 += 4;
        v2 += 32;
      }
      while (v12 < 0x1C);
    }
    else
    {
      v11 = -4;
      do
      {
        result = sub_1C981D570((int16x8_t *)v2, 0x20u, (uint64_t)&unk_1C9861550, (int16x4_t *)aZwpf, (int16x4_t *)aZzxurnic6);
        v11 += 4;
        v2 += 32;
      }
      while (v11 < 0x1C);
    }
  }
  else
  {
    v10 = -4;
    do
    {
      result = sub_1C981D3DC((int16x8_t *)v2, 0x20u, (uint64_t)&unk_1C9861530, (int16x4_t *)aZzxu);
      v10 += 4;
      v2 += 32;
    }
    while (v10 < 0x1C);
  }
  return result;
}

int16x4_t *sub_1C981D2FC(int16x4_t *result, unsigned int a2, uint64_t a3)
{
  unsigned int v3;
  int16x8_t *v4;
  int16x4_t v5;
  int16x4_t v6;
  int16x4_t v7;
  int32x2_t v8;
  int32x2_t v9;
  int32x4_t v10;
  uint64_t v11;
  int32x2_t v12;
  int32x2_t v13;
  int16x4_t v14;
  int16x4_t v15;
  int16x4_t v16;
  unsigned __int8 *v17;
  int16x8_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int v23;

  v3 = a2 - 1;
  v4 = (int16x8_t *)((char *)&unk_1C9861310 + 4 * a2);
  v5 = *(int16x4_t *)((char *)result + 2 * a2);
  v6 = *(int16x4_t *)((char *)result + 4 * a2);
  v7 = *(int16x4_t *)((char *)result + 6 * a2);
  v8 = (int32x2_t)vtrn1_s16(*result, v5);
  v9 = (int32x2_t)vtrn1_s16(v6, v7);
  v10 = vshll_n_s16((int16x4_t)vzip1_s32(v8, v9), 6uLL);
  v11 = a2 >> 2;
  v12 = (int32x2_t)vtrn2_s16(*result, v5);
  v13 = (int32x2_t)vtrn2_s16(v6, v7);
  v14 = (int16x4_t)vzip2_s32(v8, v9);
  v15 = (int16x4_t)vzip1_s32(v12, v13);
  v16 = (int16x4_t)vzip2_s32(v12, v13);
  v17 = (unsigned __int8 *)(a3 + 1);
  do
  {
    v18 = *v4++;
    v19 = vmlal_laneq_s16(v10, v14, v18, 4);
    v20 = vmlsl_laneq_s16(v10, v14, v18, 4);
    v21 = vmlal_lane_s16(vmull_lane_s16(v16, *(int16x4_t *)v18.i8, 1), v15, *(int16x4_t *)v18.i8, 0);
    v22 = vmlal_lane_s16(vmull_lane_s16(v16, *(int16x4_t *)v18.i8, 3), v15, *(int16x4_t *)v18.i8, 2);
    v23 = *(v17 - 1);
    v18.i32[0] = *v17;
    v17 += 2;
    result[v23] = vqrshrn_n_s32(vaddq_s32(v21, v19), 0xBuLL);
    result[v18.u32[0]] = vqrshrn_n_s32(vaddq_s32(v22, v20), 0xBuLL);
    *(int16x4_t *)((char *)result + 2 * (int)(4 * (v3 - v23))) = vqrshrn_n_s32(vsubq_s32(v19, v21), 0xBuLL);
    *(int16x4_t *)((char *)result + 2 * (int)(4 * (v3 - v18.i32[0]))) = vqrshrn_n_s32(vsubq_s32(v20, v22), 0xBuLL);
    --v11;
  }
  while (v11);
  return result;
}

int16x8_t *sub_1C981D3DC(int16x8_t *result, unsigned int a2, uint64_t a3, int16x4_t *a4)
{
  unsigned int v4;
  int16x8_t *v5;
  int16x8_t v6;
  int16x8_t v7;
  int16x8_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  int16x8_t v16;
  int32x4_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  int16x8_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int16x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int v31;
  int v32;
  int v33;
  int32x4_t v34;
  int32x4_t v35;
  int32x4_t v36;

  v4 = a2 - 1;
  v5 = (int16x8_t *)((char *)&unk_1C9861310 + 2 * a2);
  v6 = *(int16x8_t *)((char *)result + 4 * a2);
  v7 = *(int16x8_t *)((char *)result + 2 * a2);
  v8 = *(int16x8_t *)((char *)result + 6 * a2);
  v9 = (int32x4_t)vtrn1q_s16(*result, v7);
  v10 = (int32x4_t)vtrn2q_s16(*result, v7);
  v11 = (int32x4_t)vtrn1q_s16(v6, v8);
  v12 = (int32x4_t)vtrn2q_s16(v6, v8);
  v13 = (int16x8_t)vtrn1q_s32(v9, v11);
  v14 = (int16x8_t)vtrn2q_s32(v9, v11);
  v15 = (int16x8_t)vtrn1q_s32(v10, v12);
  v16 = (int16x8_t)vtrn2q_s32(v10, v12);
  v17 = vshll_n_s16(*(int16x4_t *)v13.i8, 6uLL);
  v18 = a2 >> 3;
  v19 = (unsigned __int8 *)(a3 + 3);
  do
  {
    v20 = *v5++;
    v21 = vmlal_high_laneq_s16(v17, v13, v20, 4);
    v22 = vmlsl_high_laneq_s16(v17, v13, v20, 4);
    v23 = vmlal_high_lane_s16(vmull_lane_s16(*(int16x4_t *)v14.i8, *(int16x4_t *)v20.i8, 0), v14, *(int16x4_t *)v20.i8, 1);
    v24 = vmlal_high_lane_s16(vmull_lane_s16(*(int16x4_t *)v14.i8, *(int16x4_t *)v20.i8, 2), v14, *(int16x4_t *)v20.i8, 3);
    v25 = vmlal_high_lane_s16(vmlal_high_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v16.i8, *a4, 1), *(int16x4_t *)v15.i8, *a4, 0), v15, *a4, 2), v16, *a4, 3);
    v26 = vmlal_high_lane_s16(vmlal_high_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v16.i8, a4[1], 1), *(int16x4_t *)v15.i8, a4[1], 0), v15, a4[1], 2), v16, a4[1], 3);
    v27 = a4[3];
    v28 = vmlal_high_lane_s16(vmlal_high_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v16.i8, a4[2], 1), *(int16x4_t *)v15.i8, a4[2], 0), v15, a4[2], 2), v16, a4[2], 3);
    v29 = vaddq_s32(v23, v21);
    v30 = vsubq_s32(v21, v23);
    v31 = *(v19 - 3);
    v32 = *(v19 - 2);
    v33 = *(v19 - 1);
    v20.i32[0] = *v19;
    v19 += 4;
    *(int16x4_t *)&result->i8[8 * v31] = vqrshrn_n_s32(vaddq_s32(v25, v29), 0xBuLL);
    v34 = vaddq_s32(v24, v22);
    v35 = vsubq_s32(v22, v24);
    *(int16x4_t *)&result->i8[8 * v32] = vqrshrn_n_s32(vaddq_s32(v26, v30), 0xBuLL);
    v36 = vmlal_high_lane_s16(vmlal_high_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v16.i8, v27, 1), *(int16x4_t *)v15.i8, v27, 0), v15, v27, 2), v16, v27, 3);
    *(int16x4_t *)&result->i8[8 * v33] = vqrshrn_n_s32(vaddq_s32(v28, v34), 0xBuLL);
    *(int16x4_t *)&result->i8[8 * v20.u32[0]] = vqrshrn_n_s32(vaddq_s32(v36, v35), 0xBuLL);
    *(int16x4_t *)&result->i8[8 * (v4 - v31)] = vqrshrn_n_s32(vsubq_s32(v29, v25), 0xBuLL);
    *(int16x4_t *)&result->i8[8 * (v4 - v32)] = vqrshrn_n_s32(vsubq_s32(v30, v26), 0xBuLL);
    *(int16x4_t *)&result->i8[8 * (v4 - v33)] = vqrshrn_n_s32(vsubq_s32(v34, v28), 0xBuLL);
    *(int16x4_t *)&result->i8[8 * (v4 - v20.i32[0])] = vqrshrn_n_s32(vsubq_s32(v35, v36), 0xBuLL);
    a4 += 4;
    --v18;
  }
  while (v18);
  return result;
}

int16x8_t *sub_1C981D570(int16x8_t *result, unsigned int a2, uint64_t a3, int16x4_t *a4, int16x4_t *a5)
{
  int16x8_t *v5;
  int16x8_t *v6;
  int16x8_t *v7;
  int16x8_t v8;
  int16x8_t v9;
  int16x8_t v10;
  int16x8_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int16x8_t v16;
  int16x8_t v17;
  int16x8_t v18;
  int16x8_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int16x8_t v24;
  int16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  uint64_t v28;
  int16x8_t *v29;
  int32x4_t v30;
  uint64_t v31;
  int32x4_t *v32;
  int16x8_t v33;
  int32x4_t v34;
  int32x4_t v35;
  int32x4_t v36;
  int32x4_t v37;
  int32x4_t v38;
  int32x4_t v39;
  int16x4_t v40;
  int32x4_t v41;
  int32x4_t v42;
  int32x4_t v43;
  int32x4_t v44;
  int32x4_t v45;
  int32x4_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int32x4_t v50;
  int32x4_t v51;
  int v52;
  _OWORD v53[16];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = (int16x8_t *)((char *)result + 2 * a2);
  v6 = (int16x8_t *)((char *)result + 4 * a2);
  v7 = (int16x8_t *)((char *)result + 6 * a2);
  v8 = result[1];
  v9 = v5[1];
  v10 = v6[1];
  v11 = v7[1];
  v12 = (int32x4_t)vtrn1q_s16(*result, *v5);
  v13 = (int32x4_t)vtrn2q_s16(*result, *v5);
  v14 = (int32x4_t)vtrn1q_s16(*v6, *v7);
  v15 = (int32x4_t)vtrn2q_s16(*v6, *v7);
  v16 = (int16x8_t)vtrn1q_s32(v12, v14);
  v17 = (int16x8_t)vtrn2q_s32(v12, v14);
  v18 = (int16x8_t)vtrn1q_s32(v13, v15);
  v19 = (int16x8_t)vtrn2q_s32(v13, v15);
  v20 = (int32x4_t)vtrn1q_s16(v8, v9);
  v21 = (int32x4_t)vtrn2q_s16(v8, v9);
  v22 = (int32x4_t)vtrn1q_s16(v10, v11);
  v23 = (int32x4_t)vtrn2q_s16(v10, v11);
  v24 = (int16x8_t)vtrn1q_s32(v20, v22);
  v25 = (int16x8_t)vtrn2q_s32(v20, v22);
  v26 = (int16x8_t)vtrn1q_s32(v21, v23);
  v27 = (int16x8_t)vtrn2q_s32(v21, v23);
  v28 = a2 >> 1;
  v29 = (int16x8_t *)((char *)&unk_1C9861310 + 2 * v28);
  v30 = vshll_n_s16(*(int16x4_t *)v16.i8, 6uLL);
  v31 = a2 >> 4;
  v32 = (int32x4_t *)v53;
  do
  {
    v33 = *v29++;
    v34 = vmlal_laneq_s16(v30, *(int16x4_t *)v24.i8, v33, 4);
    v35 = vmlsl_laneq_s16(v30, *(int16x4_t *)v24.i8, v33, 4);
    v36 = vmlal_high_lane_s16(vmull_high_lane_s16(v24, *(int16x4_t *)v33.i8, 1), v16, *(int16x4_t *)v33.i8, 0);
    v37 = vmlal_high_lane_s16(vmull_high_lane_s16(v24, *(int16x4_t *)v33.i8, 3), v16, *(int16x4_t *)v33.i8, 2);
    v38 = vmlal_high_lane_s16(vmlal_lane_s16(vmlal_high_lane_s16(vmull_lane_s16(*(int16x4_t *)v17.i8, *a4, 0), v17, *a4, 1), *(int16x4_t *)v25.i8, *a4, 2), v25, *a4, 3);
    v39 = vmlal_high_lane_s16(vmlal_lane_s16(vmlal_high_lane_s16(vmull_lane_s16(*(int16x4_t *)v17.i8, a4[1], 0), v17, a4[1], 1), *(int16x4_t *)v25.i8, a4[1], 2), v25, a4[1], 3);
    v40 = a4[3];
    v41 = vmlal_high_lane_s16(vmlal_lane_s16(vmlal_high_lane_s16(vmull_lane_s16(*(int16x4_t *)v17.i8, a4[2], 0), v17, a4[2], 1), *(int16x4_t *)v25.i8, a4[2], 2), v25, a4[2], 3);
    v42 = vaddq_s32(v36, v34);
    v43 = vsubq_s32(v34, v36);
    v44 = vaddq_s32(v37, v35);
    v45 = vsubq_s32(v35, v37);
    *v32 = vaddq_s32(v38, v42);
    v32[1] = vaddq_s32(v39, v43);
    v46 = vmlal_high_lane_s16(vmlal_lane_s16(vmlal_high_lane_s16(vmull_lane_s16(*(int16x4_t *)v17.i8, v40, 0), v17, v40, 1), *(int16x4_t *)v25.i8, v40, 2), v25, v40, 3);
    v32[2] = vaddq_s32(v41, v44);
    v32[3] = vaddq_s32(v46, v45);
    v32[4] = vsubq_s32(v42, v38);
    v32[5] = vsubq_s32(v43, v39);
    v32[6] = vsubq_s32(v44, v41);
    v32[7] = vsubq_s32(v45, v46);
    a4 += 4;
    v32 += 8;
    --v31;
  }
  while (v31);
  v47 = 0;
  if (v28 <= 1)
    v48 = 1;
  else
    v48 = v28;
  v49 = 2 * v28;
  do
  {
    v50 = (int32x4_t)v53[v47];
    v51 = vmlal_high_laneq_s16(vmlal_high_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_high_lane_s16(vmlal_high_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v19.i8, *a5, 1), *(int16x4_t *)v18.i8, *a5, 0), v18, *a5, 2), v19, *a5, 3), *(int16x4_t *)v26.i8, *(int16x8_t *)a5->i8, 4), *(int16x4_t *)v27.i8, *(int16x8_t *)a5->i8, 5), v26,
              *(int16x8_t *)a5->i8,
              6),
            v27,
            *(int16x8_t *)a5->i8,
            7);
    v52 = 4 * (~*(unsigned __int8 *)(a3 + v47) + a2);
    *(int16x4_t *)&result->i8[8 * *(unsigned __int8 *)(a3 + v47)] = vqrshrn_n_s32(vaddq_s32(v51, v50), 0xBuLL);
    *(int16x4_t *)&result->i8[2 * v52] = vqrshrn_n_s32(vsubq_s32(v50, v51), 0xBuLL);
    ++v47;
    a5 = (int16x4_t *)((char *)a5 + v49);
  }
  while (v48 != v47);
  return result;
}

int16x4_t *sub_1C981D778(int16x4_t *result)
{
  int16x8_t *v1;
  unint64_t v2;
  int16x8_t v3;
  int16x8_t v4;
  int16x8_t v5;
  int32x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  unint64_t v10;
  int16x4_t v11;
  int16x4_t v12;
  int16x4_t v13;
  int16x4_t v14;
  int16x4_t v15;
  int16x4_t v16;
  int16x4_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int16x4_t v31;
  int16x4_t v32;
  int16x4_t v33;
  int16x4_t v34;
  int16x4_t v35;
  int16x4_t v36;
  int16x4_t v37;
  int16x4_t v38;
  int32x4_t *v39;
  int32x4_t v40;
  int16x8_t v41;
  int32x4_t v42;
  uint64_t v43;
  int16x4_t v44;
  int16x4_t v45;
  int16x4_t v46;
  int16x4_t v47;
  int16x4_t v48;
  int16x4_t v49;
  int16x4_t v50;
  int16x4_t v51;
  int16x4_t v52;
  int16x4_t v53;
  int16x4_t v54;
  int16x4_t v55;
  const __int16 *v56;
  int16x4_t v57;
  int16x4_t v58;
  int16x4_t v59;
  int16x4_t v60;
  int16x8_t v61;
  int16x8_t v62;
  int32x4_t v63;
  int32x4_t v64;
  int v65;
  _OWORD v66[16];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v1 = (int16x8_t *)&result[16];
  v2 = -8;
  do
  {
    v3 = v1[-8];
    v4 = v1[-4];
    v5 = v1[4];
    v6 = (int32x4_t)vtrn1q_s16(v3, v4);
    v7 = (int32x4_t)vtrn2q_s16(v3, v4);
    v8 = (int32x4_t)vtrn1q_s16(*v1, v5);
    v9 = (int32x4_t)vtrn2q_s16(*v1, v5);
    v1[-8] = (int16x8_t)vtrn1q_s32(v6, v8);
    v1[-4] = (int16x8_t)vtrn1q_s32(v7, v9);
    *(int32x4_t *)v1 = vtrn2q_s32(v6, v8);
    v1[4] = (int16x8_t)vtrn2q_s32(v7, v9);
    v2 += 8;
    ++v1;
  }
  while (v2 < 0x18);
  v10 = 0;
  v11 = result[1];
  v12 = result[2];
  v13 = result[3];
  v15 = result[4];
  v14 = result[5];
  v16 = result[6];
  v17 = result[7];
  v18 = vshll_n_s16(*result, 6uLL);
  v19 = vmlal_s16(v18, v15, (int16x4_t)0x40004000400040);
  v20 = vmlsl_s16(v18, v15, (int16x4_t)0x40004000400040);
  v21 = vmlal_s16(vmull_s16(v16, (int16x4_t)0x24002400240024), v12, (int16x4_t)0x53005300530053);
  v22 = vmlal_s16(vmull_s16(v16, (int16x4_t)0x52005200520052), v12, (int16x4_t)0x24002400240024);
  v23 = vaddq_s32(v21, v19);
  v24 = vsubq_s32(v19, v21);
  v25 = vaddq_s32(v22, v20);
  v26 = vsubq_s32(v20, v22);
  v27 = vmlal_s16(vmlal_s16(vmlal_s16(vmull_s16(v13, (int16x4_t)0x4B004B004B004BLL), v11, (int16x4_t)0x59005900590059), v14, (int16x4_t)0x32003200320032), v17, (int16x4_t)0x12001200120012);
  v28 = vmlal_s16(vmlal_s16(vmlal_s16(vmull_s16(v13, (int16x4_t)0x31003100310031), v11, (int16x4_t)0x12001200120012), v14, (int16x4_t)0x4B004B004B004BLL), v17, (int16x4_t)0x58005800580058);
  v29 = vmlal_s16(vmlal_s16(vmlal_s16(vmull_s16(v13, (int16x4_t)0x11001100110011), v11, (int16x4_t)0x4B004B004B004BLL), v14, (int16x4_t)0x58005800580058), v17, (int16x4_t)0x31003100310031);
  v66[0] = vaddq_s32(v27, v23);
  v66[1] = vaddq_s32(v28, v24);
  v30 = vmlal_s16(vmlal_s16(vmlal_s16(vmull_s16(v13, (int16x4_t)0x58005800580058), v11, (int16x4_t)0x32003200320032), v14, (int16x4_t)0x12001200120012), v17, (int16x4_t)0x4B004B004B004BLL);
  v66[2] = vaddq_s32(v29, v25);
  v66[3] = vaddq_s32(v30, v26);
  v66[4] = vsubq_s32(v23, v27);
  v66[5] = vsubq_s32(v24, v28);
  v66[6] = vsubq_s32(v25, v29);
  v66[7] = vsubq_s32(v26, v30);
  v31 = result[16];
  v32 = result[17];
  v33 = result[18];
  v34 = result[19];
  v35 = result[20];
  v36 = result[21];
  v37 = result[22];
  v38 = result[23];
  do
  {
    v39 = (int32x4_t *)&v66[v10 / 8];
    v40 = (int32x4_t)v66[v10 / 8];
    v41 = *(int16x8_t *)&aZwpf9[v10];
    v42 = vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmull_lane_s16(v32, *(int16x4_t *)v41.i8, 1), v31, *(int16x4_t *)v41.i8, 0), v33, *(int16x4_t *)v41.i8, 2), v34, *(int16x4_t *)v41.i8, 3), v35, v41, 4), v36, v41, 5), v37,
              v41,
              6),
            v38,
            v41,
            7);
    *v39 = vaddq_s32(v42, v40);
    v39[8] = vsubq_s32(v40, v42);
    v10 += 8;
  }
  while (v10 != 64);
  v43 = 0;
  v44 = result[8];
  v45 = result[9];
  v46 = result[24];
  v47 = result[25];
  v48 = result[10];
  v49 = result[11];
  v50 = result[26];
  v51 = result[27];
  v52 = result[12];
  v53 = result[13];
  v54 = result[28];
  v55 = result[29];
  v56 = aZzxurnic6;
  v57 = result[14];
  v58 = result[15];
  v59 = result[30];
  v60 = result[31];
  do
  {
    v61 = *(int16x8_t *)v56;
    v62 = *((int16x8_t *)v56 + 1);
    v56 += 16;
    v63 = (int32x4_t)v66[byte_1C98617E0[v43]];
    v64 = vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmull_lane_s16(v46, *(int16x4_t *)v61.i8, 1), v44, *(int16x4_t *)v61.i8, 0), v45,
                                      *(int16x4_t *)v61.i8,
                                      2),
                                    v47,
                                    *(int16x4_t *)v61.i8,
                                    3),
                                  v48,
                                  v61,
                                  4),
                                v50,
                                v61,
                                5),
                              v49,
                              v61,
                              6),
                            v51,
                            v61,
                            7),
                          v52,
                          *(int16x4_t *)v62.i8,
                          0),
                        v54,
                        *(int16x4_t *)v62.i8,
                        1),
                      v53,
                      *(int16x4_t *)v62.i8,
                      2),
                    v55,
                    *(int16x4_t *)v62.i8,
                    3),
                  v57,
                  v62,
                  4),
                v59,
                v62,
                5),
              v58,
              v62,
              6),
            v60,
            v62,
            7);
    v65 = 124 - 4 * *((unsigned __int8 *)&unk_1C9861500 + v43 + 80);
    result[*((unsigned __int8 *)&unk_1C9861500 + v43 + 80)] = vqrshrn_n_s32(vaddq_s32(v64, v63), 0xBuLL);
    *(int16x4_t *)((char *)result + 2 * v65) = vqrshrn_n_s32(vsubq_s32(v63, v64), 0xBuLL);
    ++v43;
  }
  while (v43 != 16);
  return result;
}

int16x4_t *sub_1C981DA2C(int16x4_t *result, int a2)
{
  int16x4_t *v2;
  int16x8_t v3;
  unsigned int v4;
  unint64_t v6;
  int16x4_t *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v2 = result;
  if (a2 == 1)
  {
    v3 = vdupq_n_s16((result->i16[0] + 33) >> 6);
    v4 = -32;
    do
    {
      *(int16x8_t *)v2->i8 = v3;
      *(int16x8_t *)v2[2].i8 = v3;
      *(int16x8_t *)v2[4].i8 = v3;
      *(int16x8_t *)v2[6].i8 = v3;
      v4 += 32;
      v2 += 8;
    }
    while (v4 < 0xE0);
    return result;
  }
  if (a2 <= 16)
  {
    sub_1C970AB50(result, 0x10u, (uint64_t)&unk_1C9861410);
LABEL_12:
    v8 = -4;
    do
    {
      result = sub_1C981D2FC(v2, 0x10u, (uint64_t)&unk_1C98614F0);
      v8 += 4;
      v2 += 16;
    }
    while (v8 < 0xC);
    return result;
  }
  if (a2 >= 0x31)
  {
    v6 = -4;
    v7 = result;
    do
    {
      sub_1C970B648(v7, 0x10u, (uint64_t)&unk_1C9861460, (int16x4_t *)aYk2, (int16x4_t *)aZwpf9);
      v6 += 4;
      ++v7;
    }
    while (v6 < 0xC);
  }
  else
  {
    sub_1C970AC1C(result, 0x10u, (uint64_t)&unk_1C9861410, (int16x4_t *)aZwpf);
    sub_1C970AC1C(v2 + 1, 0x10u, (uint64_t)&unk_1C9861410, (int16x4_t *)aZwpf);
  }
  if (a2 <= 32)
    goto LABEL_12;
  if (a2 >= 0x51)
  {
    v10 = -4;
    do
    {
      result = (int16x4_t *)sub_1C981D570((int16x8_t *)v2, 0x10u, (uint64_t)&unk_1C98614F8, (int16x4_t *)aYk2, (int16x4_t *)aZwpf9);
      v10 += 4;
      v2 += 16;
    }
    while (v10 < 0xC);
  }
  else
  {
    v9 = -4;
    do
    {
      result = (int16x4_t *)sub_1C981D3DC((int16x8_t *)v2, 0x10u, (uint64_t)&unk_1C98614F0, (int16x4_t *)aZwpf);
      v9 += 4;
      v2 += 16;
    }
    while (v9 < 0xC);
  }
  return result;
}

int16x4_t *sub_1C981DC08(int16x4_t *result, int a2)
{
  int16x4_t *v2;
  int16x8_t v3;
  char v4;
  char v5;

  v2 = result;
  if (a2 == 1)
  {
    v3 = vdupq_n_s16((result->i16[0] + 33) >> 6);
    v4 = 1;
    do
    {
      v5 = v4;
      *(int16x8_t *)v2->i8 = v3;
      *(int16x8_t *)v2[2].i8 = v3;
      *(int16x8_t *)v2[4].i8 = v3;
      *(int16x8_t *)v2[6].i8 = v3;
      v2 += 8;
      v4 = 0;
    }
    while ((v5 & 1) != 0);
  }
  else if (a2 > 16)
  {
    sub_1C970AC1C(result, 8u, (uint64_t)&unk_1C98612E0, (int16x4_t *)aYk2);
    sub_1C970AC1C(v2 + 1, 8u, (uint64_t)&unk_1C98612E0, (int16x4_t *)aYk2);
    sub_1C981D3DC((int16x8_t *)v2, 8u, (uint64_t)&unk_1C98612E0, (int16x4_t *)aYk2);
    return (int16x4_t *)sub_1C981D3DC((int16x8_t *)&v2[8], 8u, (uint64_t)&unk_1C98612E0, (int16x4_t *)aYk2);
  }
  else
  {
    sub_1C970AB50(result, 8u, (uint64_t)&unk_1C98612E0);
    sub_1C981D2FC(v2, 8u, (uint64_t)&unk_1C98612E0);
    return sub_1C981D2FC(v2 + 8, 8u, (uint64_t)&unk_1C98612E0);
  }
  return result;
}

int32x4_t sub_1C981DD10(int32x4_t *a1, int a2)
{
  int32x4_t result;
  int16x4_t v3;
  int16x4_t v4;
  int16x4_t v5;
  int32x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int16x4_t v11;
  int16x4_t v12;
  int32x2_t v13;
  int32x2_t v14;
  int16x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int16x4_t v25;
  int16x4_t v26;

  if (a2 == 1)
  {
    result = (int32x4_t)vdupq_n_s16((a1->i16[0] + 33) >> 6);
    *a1 = result;
    a1[1] = result;
  }
  else
  {
    v3 = (int16x4_t)a1->u64[1];
    v4 = *(int16x4_t *)a1[1].i8;
    v5 = (int16x4_t)a1[1].u64[1];
    v6 = vsubl_s16(*(int16x4_t *)a1->i8, v4);
    v7 = vshlq_n_s32(vaddl_s16(v4, *(int16x4_t *)a1->i8), 6uLL);
    v8 = vshlq_n_s32(v6, 6uLL);
    v9 = vmlal_s16(vmull_s16(v5, (int16x4_t)0x24002400240024), v3, (int16x4_t)0x53005300530053);
    v10 = vmlsl_s16(vmull_s16(v3, (int16x4_t)0x24002400240024), v5, (int16x4_t)0x53005300530053);
    v11 = vqrshrn_n_s32(vaddq_s32(v9, v7), 7uLL);
    *(int16x4_t *)v7.i8 = vqrshrn_n_s32(vsubq_s32(v7, v9), 7uLL);
    v12 = vqrshrn_n_s32(vaddq_s32(v10, v8), 7uLL);
    *(int16x4_t *)v8.i8 = vqrshrn_n_s32(vsubq_s32(v8, v10), 7uLL);
    *(int16x4_t *)v10.i8 = vtrn1_s16(v11, v12);
    v13 = (int32x2_t)vtrn2_s16(v11, v12);
    v14 = (int32x2_t)vtrn1_s16(*(int16x4_t *)v8.i8, *(int16x4_t *)v7.i8);
    *(int16x4_t *)v8.i8 = vtrn2_s16(*(int16x4_t *)v8.i8, *(int16x4_t *)v7.i8);
    *(int32x2_t *)v7.i8 = vzip1_s32(*(int32x2_t *)v10.i8, v14);
    v15 = (int16x4_t)vzip2_s32(*(int32x2_t *)v10.i8, v14);
    v16 = vaddl_s16(*(int16x4_t *)v7.i8, v15);
    v17 = vsubl_s16(*(int16x4_t *)v7.i8, v15);
    v18 = vshlq_n_s32(v16, 6uLL);
    v19 = vshlq_n_s32(v17, 6uLL);
    *(int32x2_t *)v16.i8 = vzip1_s32(v13, *(int32x2_t *)v8.i8);
    *(int32x2_t *)v8.i8 = vzip2_s32(v13, *(int32x2_t *)v8.i8);
    v20 = vmlal_s16(vmull_s16(*(int16x4_t *)v8.i8, (int16x4_t)0x24002400240024), *(int16x4_t *)v16.i8, (int16x4_t)0x53005300530053);
    v21 = vmlsl_s16(vmull_s16(*(int16x4_t *)v16.i8, (int16x4_t)0x24002400240024), *(int16x4_t *)v8.i8, (int16x4_t)0x53005300530053);
    result = vaddq_s32(v18, v20);
    v22 = vsubq_s32(v18, v20);
    v23 = vaddq_s32(v19, v21);
    v24 = vsubq_s32(v19, v21);
    v25 = vqrshrn_n_s32(result, 0xBuLL);
    *(int16x4_t *)v21.i8 = vqrshrn_n_s32(v22, 0xBuLL);
    v26 = vqrshrn_n_s32(v23, 0xBuLL);
    *(int16x4_t *)v16.i8 = vqrshrn_n_s32(v24, 0xBuLL);
    vst4_s16(a1->i16, *(int16x4x4_t *)(&v16 - 1));
  }
  return result;
}

int16x4_t sub_1C981DDE8(int16x4_t *a1, uint64_t a2, int16x4_t *a3, uint64_t a4, int16x4_t *a5)
{
  int16x4_t v5;
  int16x4_t v6;
  int16x4_t v7;
  int16x4_t v8;
  int16x4_t result;

  v5 = vsub_s16(*(int16x4_t *)((char *)a1 + 2 * a2), *(int16x4_t *)((char *)a3 + 2 * a4));
  v6 = *(int16x4_t *)((char *)a1 + 6 * a2);
  v7 = *(int16x4_t *)((char *)a3 + 6 * a4);
  v8 = vsub_s16(*(int16x4_t *)((char *)a1 + 4 * a2), *(int16x4_t *)((char *)a3 + 4 * a4));
  *a5 = vsub_s16(*a1, *a3);
  a5[1] = v5;
  result = vsub_s16(v6, v7);
  a5[2] = v8;
  a5[3] = result;
  return result;
}

int16x8_t *sub_1C981DE40(int16x8_t *result, uint64_t a2, int16x8_t *a3, uint64_t a4, int16x8_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  int16x8_t v9;
  int16x8_t *v10;
  int16x8_t *v11;
  int16x8_t v12;
  int16x8_t *v13;
  int16x8_t *v14;
  int16x8_t v15;

  v5 = 2 * a2;
  v6 = 2 * a4;
  v7 = 1;
  do
  {
    v8 = v7;
    v9 = vsubq_s16(*(int16x8_t *)((char *)result + 2 * a2), *(int16x8_t *)((char *)a3 + 2 * a4));
    v10 = (int16x8_t *)((char *)result + v5 + v5);
    v11 = (int16x8_t *)((char *)a3 + v6 + v6);
    v12 = vsubq_s16(*v10, *v11);
    v13 = (int16x8_t *)((char *)v10 + v5);
    v14 = (int16x8_t *)((char *)v11 + v6);
    v15 = vsubq_s16(*v13, *v14);
    *a5 = vsubq_s16(*result, *a3);
    a5[1] = v9;
    a5[2] = v12;
    a5[3] = v15;
    result = (int16x8_t *)((char *)v13 + v5);
    a3 = (int16x8_t *)((char *)v14 + v6);
    a5 += 4;
    v7 = 0;
  }
  while ((v8 & 1) != 0);
  return result;
}

int16x8_t *sub_1C981DEB8(int16x8_t *result, uint64_t a2, int16x8_t *a3, uint64_t a4, int16x8_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  int16x8_t v8;
  int16x8_t v9;
  int16x8_t v10;

  v5 = 2 * a2;
  v6 = 2 * a4;
  v7 = -2;
  do
  {
    v8 = vsubq_s16(result[1], a3[1]);
    v9 = vsubq_s16(*(int16x8_t *)((char *)result + 2 * a2), *(int16x8_t *)((char *)a3 + 2 * a4));
    v10 = vsubq_s16(*(int16x8_t *)((char *)&result[1] + v5), *(int16x8_t *)((char *)&a3[1] + v6));
    *a5 = vsubq_s16(*result, *a3);
    a5[1] = v8;
    v7 += 2;
    a5[2] = v9;
    a5[3] = v10;
    result = (int16x8_t *)((char *)result + v5 + v5);
    a3 = (int16x8_t *)((char *)a3 + v6 + v6);
    a5 += 4;
  }
  while (v7 < 0xE);
  return result;
}

int16x8_t sub_1C981DF10(int16x8_t *a1, uint64_t a2, int16x8_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  int16x8_t *v6;
  int16x8_t *v7;
  int16x8_t result;
  int16x8_t v9;
  int16x8_t v10;
  int16x8_t *v11;
  int16x8_t v12;

  v5 = 0;
  v6 = a3 + 2;
  v7 = a1 + 2;
  do
  {
    result = vsubq_s16(v7[-2], v6[-2]);
    v9 = vsubq_s16(v7[-1], v6[-1]);
    v10 = vsubq_s16(*v7, *v6);
    v11 = (int16x8_t *)(a5 + v5);
    v12 = vsubq_s16(v7[1], v6[1]);
    *v11 = result;
    v11[1] = v9;
    v11[2] = v10;
    v11[3] = v12;
    v5 += 64;
    v6 = (int16x8_t *)((char *)v6 + 2 * a4);
    v7 = (int16x8_t *)((char *)v7 + 2 * a2);
  }
  while ((_DWORD)v5 != 2048);
  return result;
}

int16x4_t sub_1C981DF68(int16x4_t *a1, uint64_t a2, int16x4_t *a3, uint64_t a4, int16x4_t *a5)
{
  int16x4_t v6;
  int16x4_t v7;
  int16x4_t v8;
  int16x4_t v9;
  int16x4_t v11[6];

  v11[5] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v6 = vsub_s16(*(int16x4_t *)((char *)a1 + 2 * a2), *(int16x4_t *)((char *)a3 + 2 * a4));
  v7 = *(int16x4_t *)((char *)a1 + 6 * a2);
  v8 = *(int16x4_t *)((char *)a3 + 6 * a4);
  v9 = vsub_s16(*(int16x4_t *)((char *)a1 + 4 * a2), *(int16x4_t *)((char *)a3 + 4 * a4));
  *a5 = vsub_s16(*a1, *a3);
  a5[1] = v6;
  a5[2] = v9;
  a5[3] = vsub_s16(v7, v8);
  sub_1C981AFE4(v11, a5, 3);
  return sub_1C981B088(a5, v11);
}

int16x4_t sub_1C981E028(int16x4_t *a1, uint64_t a2, int16x4_t *a3, uint64_t a4, int16x4_t *a5)
{
  int16x4_t v5;
  int16x4_t v6;
  int16x4_t v7;
  int16x4_t v8;
  int32x2_t v9;
  int32x2_t v10;
  int32x2_t v11;
  int32x2_t v12;
  int16x4_t v13;
  int16x4_t v14;
  int16x4_t v15;
  int16x4_t v16;
  int16x4_t v17;
  int16x4_t v18;
  int16x4_t v19;
  int16x4_t v20;
  int16x4_t v22[6];

  v22[5] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v5 = vsub_s16(*a1, *a3);
  v6 = vsub_s16(*(int16x4_t *)((char *)a1 + 2 * a2), *(int16x4_t *)((char *)a3 + 2 * a4));
  v7 = vsub_s16(*(int16x4_t *)((char *)a1 + 4 * a2), *(int16x4_t *)((char *)a3 + 4 * a4));
  v8 = vsub_s16(*(int16x4_t *)((char *)a1 + 6 * a2), *(int16x4_t *)((char *)a3 + 6 * a4));
  *a5 = v5;
  a5[1] = v6;
  a5[2] = v7;
  a5[3] = v8;
  v9 = (int32x2_t)vtrn1_s16(v5, v6);
  v10 = (int32x2_t)vtrn2_s16(v5, v6);
  v11 = (int32x2_t)vtrn1_s16(v7, v8);
  v12 = (int32x2_t)vtrn2_s16(v7, v8);
  v13 = (int16x4_t)vzip1_s32(v10, v12);
  v14 = (int16x4_t)vzip2_s32(v9, v11);
  v15 = (int16x4_t)vzip2_s32(v10, v12);
  v16 = (int16x4_t)vzip1_s32(v9, v11);
  v17 = vadd_s16(v15, v16);
  v18 = vsub_s16(v16, v15);
  v19 = vadd_s16(v14, v13);
  v20 = vsub_s16(v13, v14);
  v22[0] = vqmovn_s32(vrshrq_n_s32(vshlq_n_s32(vaddl_s16(v19, v17), 6uLL), 3uLL));
  v22[1] = vqmovn_s32(vrshrq_n_s32(vmlal_s16(vmull_s16(v20, (int16x4_t)0x24002400240024), v18, (int16x4_t)0x53005300530053), 3uLL));
  v22[2] = vqmovn_s32(vrshrq_n_s32(vshlq_n_s32(vsubl_s16(v17, v19), 6uLL), 3uLL));
  v22[3] = vqmovn_s32(vrshrq_n_s32(vmlsl_s16(vmull_s16(v18, (int16x4_t)0x24002400240024), v20, (int16x4_t)0x53005300530053), 3uLL));
  return sub_1C981AF54(a5, v22);
}

void sub_1C981E14C(int16x8_t *a1, uint64_t a2, int16x8_t *a3, uint64_t a4, int16x8_t *a5)
{
  int16x4_t v6[18];

  v6[17] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  sub_1C981DE40(a1, a2, a3, a4, a5);
  sub_1C981ADF0(v6, (int16x4_t *)a5, 4);
  sub_1C981AE94((int16x4_t *)a5, v6);
}

void sub_1C981E1BC(int16x8_t *a1, uint64_t a2, int16x8_t *a3, uint64_t a4, int16x4_t *a5)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  int16x8_t *v9;
  int16x8_t v10;
  int16x8_t v11;
  int16x8_t v12;
  int16x4_t v13[66];

  v13[65] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v6 = 2 * a2;
  v7 = 2 * a4;
  v8 = -2;
  v9 = (int16x8_t *)a5;
  do
  {
    v10 = vsubq_s16(a1[1], a3[1]);
    v11 = vsubq_s16(*(int16x8_t *)((char *)a1 + 2 * a2), *(int16x8_t *)((char *)a3 + 2 * a4));
    v12 = vsubq_s16(*(int16x8_t *)((char *)&a1[1] + v6), *(int16x8_t *)((char *)&a3[1] + v7));
    *v9 = vsubq_s16(*a1, *a3);
    v9[1] = v10;
    v8 += 2;
    v9[2] = v11;
    v9[3] = v12;
    a1 = (int16x8_t *)((char *)a1 + v6 + v6);
    a3 = (int16x8_t *)((char *)a3 + v7 + v7);
    v9 += 4;
  }
  while (v8 < 0xE);
  sub_1C981AB1C(v13, a5, 5);
  sub_1C981AC68(a5, v13);
}

void sub_1C981E280(int16x8_t *a1, uint64_t a2, int16x8_t *a3, uint64_t a4, int16x4_t *a5)
{
  uint64_t v6;
  int16x8_t *v7;
  int16x8_t *v8;
  int16x8_t v9;
  int16x8_t v10;
  int16x8_t *v11;
  int16x8_t v12;
  int16x4_t v13[258];

  v6 = 0;
  v13[257] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v7 = a3 + 2;
  v8 = a1 + 2;
  do
  {
    v9 = vsubq_s16(v8[-1], v7[-1]);
    v10 = vsubq_s16(*v8, *v7);
    v11 = (int16x8_t *)&a5[v6];
    v12 = vsubq_s16(v8[1], v7[1]);
    *v11 = vsubq_s16(v8[-2], v7[-2]);
    v11[1] = v9;
    v11[2] = v10;
    v11[3] = v12;
    v6 += 8;
    v7 = (int16x8_t *)((char *)v7 + 2 * a4);
    v8 = (int16x8_t *)((char *)v8 + 2 * a2);
  }
  while ((_DWORD)(v6 * 8) != 2048);
  sub_1C9819DB0(v13, a5, 6);
  sub_1C9819FE4(a5, v13);
}

double sub_1C981E340(uint64_t *a1, uint64_t a2, int16x4_t *a3, char a4)
{
  int16x4_t v4;
  int16x4_t v5;
  int16x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int16x4_t v18;
  int16x4_t v19;
  int32x2_t v20;
  int32x2_t v21;
  int16x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int16x4_t v30;
  uint64_t *v31;
  uint64_t *v32;
  int16x8_t v33;
  uint16x8_t v34;
  uint16x8_t v35;

  v4 = a3[1];
  v5 = a3[2];
  v6 = a3[3];
  v7 = vaddl_s16(v5, *a3);
  v8 = vaddl_s16(v6, v5);
  v9 = vsubl_s16(*a3, v6);
  v10.i64[0] = 0x1D0000001DLL;
  v10.i64[1] = 0x1D0000001DLL;
  v11.i64[0] = 0x3700000037;
  v11.i64[1] = 0x3700000037;
  v12 = vmlaq_s32(vmlal_s16(vmulq_s32(v7, v10), v4, (int16x4_t)0x4A004A004A004ALL), v8, v11);
  v13 = vmlaq_s32(vmlsl_s16(vmulq_s32(v7, v11), v4, (int16x4_t)0x4A004A004A004ALL), v9, v10);
  v14.i64[0] = 0x1C0000001CLL;
  v14.i64[1] = 0x1C0000001CLL;
  v15 = vmlaq_s32(vmlal_s16(vmulq_s32(v9, v11), v4, (int16x4_t)0x4A004A004A004ALL), v8, v14);
  v16.i64[0] = 0x4A0000004ALL;
  v16.i64[1] = 0x4A0000004ALL;
  v17 = vmulq_s32(vaddw_s16(vsubl_s16(*a3, v5), v6), v16);
  v18 = vqrshrn_n_s32(v12, 7uLL);
  v19 = vqrshrn_n_s32(v15, 7uLL);
  *(int16x4_t *)v17.i8 = vqrshrn_n_s32(v17, 7uLL);
  *(int16x4_t *)v13.i8 = vqrshrn_n_s32(v13, 7uLL);
  *(int16x4_t *)v8.i8 = vtrn1_s16(v18, v19);
  v20 = (int32x2_t)vtrn2_s16(v18, v19);
  v21 = (int32x2_t)vtrn1_s16(*(int16x4_t *)v17.i8, *(int16x4_t *)v13.i8);
  *(int16x4_t *)v17.i8 = vtrn2_s16(*(int16x4_t *)v17.i8, *(int16x4_t *)v13.i8);
  *(int32x2_t *)v13.i8 = vzip1_s32(*(int32x2_t *)v8.i8, v21);
  v22 = (int16x4_t)vzip2_s32(*(int32x2_t *)v8.i8, v21);
  v23 = vaddl_s16(*(int16x4_t *)v13.i8, v22);
  *(int32x2_t *)v15.i8 = vzip2_s32(v20, *(int32x2_t *)v17.i8);
  v24 = vaddl_s16(v22, *(int16x4_t *)v15.i8);
  v25 = vsubl_s16(*(int16x4_t *)v13.i8, *(int16x4_t *)v15.i8);
  *(int32x2_t *)v17.i8 = vzip1_s32(v20, *(int32x2_t *)v17.i8);
  v26 = vmlaq_s32(vmlal_s16(vmulq_s32(v24, v11), *(int16x4_t *)v17.i8, (int16x4_t)0x4A004A004A004ALL), v23, v10);
  v27 = vmlaq_s32(vmlsl_s16(vmulq_s32(v25, v10), *(int16x4_t *)v17.i8, (int16x4_t)0x4A004A004A004ALL), v23, v11);
  v28 = vmlaq_s32(vmlal_s16(vmulq_s32(v25, v11), *(int16x4_t *)v17.i8, (int16x4_t)0x4A004A004A004ALL), v24, v14);
  v29 = vmulq_s32(vaddw_s16(vsubl_s16(*(int16x4_t *)v13.i8, v22), *(int16x4_t *)v15.i8), v16);
  *(int16x4_t *)v16.i8 = vqrshrn_n_s32(v26, 0xAuLL);
  *(int16x4_t *)v26.i8 = vqrshrn_n_s32(v28, 0xAuLL);
  v30 = vqrshrn_n_s32(v29, 0xAuLL);
  *(int16x4_t *)v13.i8 = vqrshrn_n_s32(v27, 0xAuLL);
  vst4_s16((__int16 *)a3, *(int16x4x4_t *)((char *)&v13 - 24));
  v31 = (uint64_t *)((char *)a1 + 2 * a2);
  v29.i64[0] = *a1;
  v29.i64[1] = *v31;
  v32 = (uint64_t *)((char *)a1 + 6 * a2);
  v16.i64[0] = *(uint64_t *)((char *)a1 + 4 * a2);
  v16.i64[1] = *v32;
  v33 = *(int16x8_t *)a3[2].i8;
  v26.i64[0] = 0xFC00FC00FC00FC00;
  v26.i64[1] = 0xFC00FC00FC00FC00;
  v34 = vminq_u16(vsqaddq_u16((uint16x8_t)v29, *(int16x8_t *)a3->i8), (uint16x8_t)v26);
  *a1 = v34.i64[0];
  *v31 = v34.i64[1];
  v35 = vminq_u16(vsqaddq_u16((uint16x8_t)v16, v33), (uint16x8_t)v26);
  *(uint64_t *)((char *)a1 + 4 * a2) = v35.i64[0];
  *v32 = v35.i64[1];
  if ((a4 & 1) == 0)
  {
    v35.i64[0] = 0;
    *(_OWORD *)a3->i8 = 0u;
    *(_OWORD *)a3[2].i8 = 0u;
  }
  return *(double *)v35.i64;
}

void sub_1C981E470(uint64_t *a1, uint64_t a2, int32x4_t *a3, int a4, int a5)
{
  char v5;
  int16x8_t v9;
  uint64_t *v10;
  uint16x8_t v11;
  uint64_t *v12;
  uint16x8_t v13;
  uint16x8_t v14;
  uint16x8_t v15;
  uint16x8_t v16;
  uint64_t *v17;
  uint16x8_t v18;
  uint64_t *v19;
  uint16x8_t v20;
  uint16x8_t v21;
  uint16x8_t v22;
  uint16x8_t v23;

  v5 = a4;
  if (a5 != 1)
  {
    sub_1C981FA58(a3, a5);
    v17 = (uint64_t *)((char *)a1 + 2 * a2);
    v18.i64[0] = *a1;
    v18.i64[1] = *v17;
    v19 = (uint64_t *)((char *)a1 + 6 * a2);
    v20.i64[0] = *(uint64_t *)((char *)a1 + 4 * a2);
    v20.i64[1] = *v19;
    v21.i64[0] = 0xFC00FC00FC00FC00;
    v21.i64[1] = 0xFC00FC00FC00FC00;
    v22 = vminq_u16(vsqaddq_u16(v18, *(int16x8_t *)a3), v21);
    v23 = vminq_u16(vsqaddq_u16(v20, (int16x8_t)a3[1]), v21);
    *a1 = v22.i64[0];
    *v17 = v22.i64[1];
    *(uint64_t *)((char *)a1 + 4 * a2) = v23.i64[0];
    *v19 = v23.i64[1];
    if ((v5 & 1) != 0)
      return;
    v9 = 0uLL;
    goto LABEL_6;
  }
  v9 = vdupq_n_s16((a3->i16[0] + 17) >> 5);
  a3->i16[0] = 0;
  v10 = (uint64_t *)((char *)a1 + 2 * a2);
  v11.i64[0] = *a1;
  v11.i64[1] = *v10;
  v12 = (uint64_t *)((char *)a1 + 6 * a2);
  v13.i64[0] = *(uint64_t *)((char *)a1 + 4 * a2);
  v13.i64[1] = *v12;
  v14.i64[0] = 0xFC00FC00FC00FC00;
  v14.i64[1] = 0xFC00FC00FC00FC00;
  v15 = vminq_u16(vsqaddq_u16(v11, v9), v14);
  v16 = vminq_u16(vsqaddq_u16(v13, v9), v14);
  *a1 = v15.i64[0];
  *v10 = v15.i64[1];
  *(uint64_t *)((char *)a1 + 4 * a2) = v16.i64[0];
  *v12 = v16.i64[1];
  if (a4)
  {
LABEL_6:
    *a3 = (int32x4_t)v9;
    a3[1] = (int32x4_t)v9;
  }
}

uint16x8_t *sub_1C981E568(uint16x8_t *result, uint64_t a2, int16x4_t *a3, int a4, int a5)
{
  int16x8_t *v6;
  uint16x8_t *v8;
  int16x8_t v9;
  uint16x8_t v10;
  uint16x8_t v11;
  uint16x8_t v12;
  uint16x8_t v13;
  uint16x8_t v14;
  uint16x8_t v15;
  uint16x8_t v16;
  uint16x8_t v17;
  unsigned int v18;
  char v19;
  uint16x8_t v20;
  char v21;
  uint16x8_t v22;
  uint16x8_t v23;
  uint16x8_t v24;
  uint16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  int16x8_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int16x8_t v33;
  int16x8_t v34;
  int16x8_t v35;
  int16x8_t v36;
  unsigned int v37;
  int8x16_t v38;

  v6 = (int16x8_t *)a3;
  v8 = result;
  if (a5 == 1)
  {
    v9 = vdupq_n_s16((a3->i16[0] + 17) >> 5);
    a3->i16[0] = 0;
    v10 = *(uint16x8_t *)((char *)result + 14 * a2);
    v11.i64[0] = 0xFC00FC00FC00FC00;
    v11.i64[1] = 0xFC00FC00FC00FC00;
    v12 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 2 * a2), v9), v11);
    v13 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 4 * a2), v9), v11);
    v14 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 6 * a2), v9), v11);
    v15 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 8 * a2), v9), v11);
    v16 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 10 * a2), v9), v11);
    v17 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 12 * a2), v9), v11);
    *result = vminq_u16(vsqaddq_u16(*result, v9), v11);
    *(uint16x8_t *)((char *)result + 2 * a2) = v12;
    *(uint16x8_t *)((char *)result + 4 * a2) = v13;
    *(uint16x8_t *)((char *)result + 6 * a2) = v14;
    *(uint16x8_t *)((char *)result + 8 * a2) = v15;
    *(uint16x8_t *)((char *)result + 10 * a2) = v16;
    *(uint16x8_t *)((char *)result + 12 * a2) = v17;
    *(uint16x8_t *)((char *)result + 14 * a2) = vminq_u16(vsqaddq_u16(v10, v9), v11);
    if (a4)
    {
      v18 = -16;
      do
      {
        *v6 = v9;
        v6[1] = v9;
        v6 += 2;
        v18 += 16;
      }
      while (v18 < 0x30);
    }
  }
  else
  {
    result = (uint16x8_t *)sub_1C981F950(a3, a5);
    v19 = 1;
    v20.i64[0] = 0xFC00FC00FC00FC00;
    v20.i64[1] = 0xFC00FC00FC00FC00;
    do
    {
      v21 = v19;
      v22 = *v8;
      v23 = *(uint16x8_t *)((char *)v8 + 2 * a2);
      v24 = *(uint16x8_t *)((char *)v8 + 4 * a2);
      v25 = *(uint16x8_t *)((char *)v8 + 6 * a2);
      v26 = v6[1];
      v27 = v6[2];
      v28 = v6[3];
      v29 = (int32x4_t)vtrn1q_s16(*v6, v26);
      v30 = (int32x4_t)vtrn2q_s16(*v6, v26);
      v31 = (int32x4_t)vtrn1q_s16(v27, v28);
      v32 = (int32x4_t)vtrn2q_s16(v27, v28);
      v33 = (int16x8_t)vtrn1q_s32(v29, v31);
      v34 = (int16x8_t)vtrn2q_s32(v29, v31);
      v35 = (int16x8_t)vtrn1q_s32(v30, v32);
      v36 = (int16x8_t)vtrn2q_s32(v30, v32);
      if (a4)
        v37 = -1;
      else
        v37 = 0;
      v38 = (int8x16_t)vdupq_n_s16(v37);
      *(int8x16_t *)v6 = vandq_s8((int8x16_t)v33, v38);
      v6[1] = (int16x8_t)vandq_s8((int8x16_t)v35, v38);
      v6[2] = (int16x8_t)vandq_s8((int8x16_t)v34, v38);
      v6[3] = (int16x8_t)vandq_s8((int8x16_t)v36, v38);
      *v8 = vminq_u16(vsqaddq_u16(v22, v33), v20);
      *(uint16x8_t *)((char *)v8 + 2 * a2) = vminq_u16(vsqaddq_u16(v23, v35), v20);
      *(uint16x8_t *)((char *)v8 + 4 * a2) = vminq_u16(vsqaddq_u16(v24, v34), v20);
      *(uint16x8_t *)((char *)v8 + 6 * a2) = vminq_u16(vsqaddq_u16(v25, v36), v20);
      v8 = (uint16x8_t *)((char *)v8 + 8 * a2);
      v6 += 4;
      v19 = 0;
    }
    while ((v21 & 1) != 0);
  }
  return result;
}

int16x4_t *sub_1C981E748(int16x4_t *result, uint64_t a2, int16x4_t *a3, int a4, int a5)
{
  _OWORD *v6;
  uint16x8_t *v8;
  int16x8_t v9;
  uint64_t v10;
  unsigned int v11;
  uint16x8_t v12;
  uint16x8_t *v13;
  uint16x8_t v14;
  uint16x8_t v15;
  uint16x8_t v16;
  unsigned int v17;
  uint64_t v18;
  char v19;
  uint16x8_t v20;
  char v21;
  uint16x8_t *v22;
  unsigned int v23;
  int16x8_t *v24;
  uint16x8_t v25;
  uint16x8_t v26;
  uint16x8_t v27;
  uint16x8_t v28;
  int16x8_t v29;
  int16x8_t v30;
  int16x8_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int32x4_t v34;
  int32x4_t v35;
  int16x8_t v36;
  int16x8_t v37;
  int16x8_t v38;
  int16x8_t v39;
  unsigned int v40;
  int8x16_t v41;

  v6 = a3;
  v8 = (uint16x8_t *)result;
  if (a5 == 1)
  {
    v9 = vdupq_n_s16((a3->i16[0] + 17) >> 5);
    a3->i16[0] = 0;
    v10 = 2 * a2;
    v11 = -2;
    v12.i64[0] = 0xFC00FC00FC00FC00;
    v12.i64[1] = 0xFC00FC00FC00FC00;
    do
    {
      v13 = (uint16x8_t *)((char *)v8 + v10);
      v14 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v8 + 2 * a2), v9), v12);
      v15 = vminq_u16(vsqaddq_u16(v8[1], v9), v12);
      v16 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v8[1] + v10), v9), v12);
      *v8 = vminq_u16(vsqaddq_u16(*v8, v9), v12);
      *v13 = v14;
      v8[1] = v15;
      v13[1] = v16;
      v8 = (uint16x8_t *)((char *)v8 + 4 * a2);
      v11 += 2;
    }
    while (v11 < 0xE);
    if (a4)
    {
      v17 = -16;
      do
      {
        *v6 = v9;
        v6[1] = v9;
        v6 += 2;
        v17 += 16;
      }
      while (v17 < 0xF0);
    }
  }
  else
  {
    result = sub_1C981F774(a3, a5);
    v18 = 0;
    v19 = 1;
    v20.i64[0] = 0xFC00FC00FC00FC00;
    v20.i64[1] = 0xFC00FC00FC00FC00;
    do
    {
      v21 = v19;
      v22 = &v8[v18];
      v23 = -4;
      v24 = (int16x8_t *)&v6[v18];
      do
      {
        v25 = *(uint16x8_t *)((char *)v22 + 2 * a2);
        v26 = *v22;
        v27 = *(uint16x8_t *)((char *)v22 + 4 * a2);
        v28 = *(uint16x8_t *)((char *)v22 + 6 * a2);
        v29 = v24[2];
        v30 = v24[4];
        v31 = v24[6];
        v32 = (int32x4_t)vtrn1q_s16(*v24, v29);
        v33 = (int32x4_t)vtrn2q_s16(*v24, v29);
        v34 = (int32x4_t)vtrn1q_s16(v30, v31);
        v35 = (int32x4_t)vtrn2q_s16(v30, v31);
        v36 = (int16x8_t)vtrn1q_s32(v32, v34);
        v37 = (int16x8_t)vtrn2q_s32(v32, v34);
        v38 = (int16x8_t)vtrn1q_s32(v33, v35);
        v39 = (int16x8_t)vtrn2q_s32(v33, v35);
        if (a4)
          v40 = -1;
        else
          v40 = 0;
        v41 = (int8x16_t)vdupq_n_s16(v40);
        *(int8x16_t *)v24 = vandq_s8((int8x16_t)v36, v41);
        v24[2] = (int16x8_t)vandq_s8((int8x16_t)v38, v41);
        v24[4] = (int16x8_t)vandq_s8((int8x16_t)v37, v41);
        v24[6] = (int16x8_t)vandq_s8((int8x16_t)v39, v41);
        *v22 = vminq_u16(vsqaddq_u16(v26, v36), v20);
        *(uint16x8_t *)((char *)v22 + 2 * a2) = vminq_u16(vsqaddq_u16(v25, v38), v20);
        *(uint16x8_t *)((char *)v22 + 4 * a2) = vminq_u16(vsqaddq_u16(v27, v37), v20);
        *(uint16x8_t *)((char *)v22 + 6 * a2) = vminq_u16(vsqaddq_u16(v28, v39), v20);
        v22 = (uint16x8_t *)((char *)v22 + 8 * a2);
        v23 += 4;
        v24 += 8;
      }
      while (v23 < 0xC);
      v19 = 0;
      v18 = 1;
    }
    while ((v21 & 1) != 0);
  }
  return result;
}

uint16x8_t *sub_1C981E904(uint16x8_t *result, uint64_t a2, int16x4_t *a3, int a4, int a5)
{
  _OWORD *v6;
  uint16x8_t *v8;
  int16x8_t v9;
  uint16x8_t *v10;
  int v11;
  uint16x8_t v12;
  uint16x8_t v13;
  uint16x8_t v14;
  uint16x8_t v15;
  unsigned int v16;
  unint64_t v17;
  uint16x8_t v18;
  int16x8_t *v19;
  unsigned int v20;
  uint16x8_t *v21;
  uint16x8_t v22;
  uint16x8_t v23;
  uint16x8_t v24;
  uint16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  int16x8_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int16x8_t v33;
  int16x8_t v34;
  int16x8_t v35;
  int16x8_t v36;
  unsigned int v37;
  int8x16_t v38;

  v6 = a3;
  v8 = result;
  if (a5 == 1)
  {
    v9 = vdupq_n_s16((a3->i16[0] + 17) >> 5);
    a3->i16[0] = 0;
    v10 = result + 2;
    v11 = 32;
    v12.i64[0] = 0xFC00FC00FC00FC00;
    v12.i64[1] = 0xFC00FC00FC00FC00;
    do
    {
      v13 = vminq_u16(vsqaddq_u16(v10[-1], v9), v12);
      v14 = vminq_u16(vsqaddq_u16(*v10, v9), v12);
      v15 = vminq_u16(vsqaddq_u16(v10[1], v9), v12);
      v10[-2] = vminq_u16(vsqaddq_u16(v10[-2], v9), v12);
      v10[-1] = v13;
      *v10 = v14;
      v10[1] = v15;
      v10 = (uint16x8_t *)((char *)v10 + 2 * a2);
      --v11;
    }
    while (v11);
    if (a4)
    {
      v16 = -16;
      do
      {
        *v6 = v9;
        v6[1] = v9;
        v6 += 2;
        v16 += 16;
      }
      while (v16 < 0x3F0);
    }
  }
  else
  {
    result = (uint16x8_t *)sub_1C981EE4C(a3, a5);
    v17 = 0;
    v18.i64[0] = 0xFC00FC00FC00FC00;
    v18.i64[1] = 0xFC00FC00FC00FC00;
    do
    {
      v19 = (int16x8_t *)&v6[v17];
      v20 = -4;
      v21 = v8;
      do
      {
        v22 = *(uint16x8_t *)((char *)v21 + 2 * a2);
        v23 = *v21;
        v24 = *(uint16x8_t *)((char *)v21 + 4 * a2);
        v25 = *(uint16x8_t *)((char *)v21 + 6 * a2);
        v26 = v19[4];
        v27 = v19[8];
        v28 = v19[12];
        v29 = (int32x4_t)vtrn1q_s16(*v19, v26);
        v30 = (int32x4_t)vtrn2q_s16(*v19, v26);
        v31 = (int32x4_t)vtrn1q_s16(v27, v28);
        v32 = (int32x4_t)vtrn2q_s16(v27, v28);
        v33 = (int16x8_t)vtrn1q_s32(v29, v31);
        v34 = (int16x8_t)vtrn2q_s32(v29, v31);
        v35 = (int16x8_t)vtrn1q_s32(v30, v32);
        v36 = (int16x8_t)vtrn2q_s32(v30, v32);
        if (a4)
          v37 = -1;
        else
          v37 = 0;
        v38 = (int8x16_t)vdupq_n_s16(v37);
        *(int8x16_t *)v19 = vandq_s8((int8x16_t)v33, v38);
        v19[4] = (int16x8_t)vandq_s8((int8x16_t)v35, v38);
        v19[8] = (int16x8_t)vandq_s8((int8x16_t)v34, v38);
        v19[12] = (int16x8_t)vandq_s8((int8x16_t)v36, v38);
        *v21 = vminq_u16(vsqaddq_u16(v23, v33), v18);
        *(uint16x8_t *)((char *)v21 + 2 * a2) = vminq_u16(vsqaddq_u16(v22, v35), v18);
        *(uint16x8_t *)((char *)v21 + 4 * a2) = vminq_u16(vsqaddq_u16(v24, v34), v18);
        *(uint16x8_t *)((char *)v21 + 6 * a2) = vminq_u16(vsqaddq_u16(v25, v36), v18);
        v21 = (uint16x8_t *)((char *)v21 + 8 * a2);
        v20 += 4;
        v19 += 16;
      }
      while (v20 < 0x1C);
      ++v8;
    }
    while (v17++ < 3);
  }
  return result;
}

int16x8_t sub_1C981EAB0(int16x8_t *a1)
{
  int16x8_t result;
  int16x8_t v2;

  result = vshlq_n_s16(*a1, 3uLL);
  v2 = vshlq_n_s16(a1[1], 3uLL);
  *a1 = result;
  a1[1] = v2;
  return result;
}

int16x8_t sub_1C981EAC4(int16x8_t *a1)
{
  int16x8_t result;
  int16x8_t v2;

  result = vrshrq_n_s16(*a1, 3uLL);
  v2 = vrshrq_n_s16(a1[1], 3uLL);
  *a1 = result;
  a1[1] = v2;
  return result;
}

int16x8_t *sub_1C981EAD8(int16x8_t *result)
{
  unsigned int v1;
  int16x8_t v2;

  v1 = -16;
  do
  {
    v2 = vrshrq_n_s16(result[1], 2uLL);
    *result = vrshrq_n_s16(*result, 2uLL);
    result[1] = v2;
    result += 2;
    v1 += 16;
  }
  while (v1 < 0x30);
  return result;
}

double sub_1C981EAFC(uint64_t *a1, uint64_t a2, int16x8_t *a3, char a4)
{
  uint64_t *v4;
  uint16x8_t v5;
  uint64_t *v6;
  uint16x8_t v7;
  int16x8_t v8;
  uint16x8_t v9;
  uint16x8_t v10;
  uint16x8_t v11;

  v4 = (uint64_t *)((char *)a1 + 2 * a2);
  v5.i64[0] = *a1;
  v5.i64[1] = *v4;
  v6 = (uint64_t *)((char *)a1 + 6 * a2);
  v7.i64[0] = *(uint64_t *)((char *)a1 + 4 * a2);
  v7.i64[1] = *v6;
  v8 = a3[1];
  v9.i64[0] = 0xFC00FC00FC00FC00;
  v9.i64[1] = 0xFC00FC00FC00FC00;
  v10 = vminq_u16(vsqaddq_u16(v5, *a3), v9);
  *a1 = v10.i64[0];
  *v4 = v10.i64[1];
  v11 = vminq_u16(vsqaddq_u16(v7, v8), v9);
  *(uint64_t *)((char *)a1 + 4 * a2) = v11.i64[0];
  *v6 = v11.i64[1];
  if ((a4 & 1) == 0)
  {
    v11.i64[0] = 0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return *(double *)v11.i64;
}

uint64_t sub_1C981EB54(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t (*v4)(void);

  if (a4)
    v4 = (uint64_t (*)(void))sub_1C981ED48;
  else
    v4 = (uint64_t (*)(void))sub_1C981EDC4;
  return v4();
}

uint64_t sub_1C981EB70(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t (*v4)(void);

  if (a4)
    v4 = (uint64_t (*)(void))sub_1C981EC74;
  else
    v4 = (uint64_t (*)(void))sub_1C981ECD8;
  return v4();
}

uint64_t sub_1C981EB8C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t (*v4)(void);

  if (a4)
    v4 = (uint64_t (*)(void))sub_1C981EBA8;
  else
    v4 = (uint64_t (*)(void))sub_1C981EC08;
  return v4();
}

uint16x8_t *sub_1C981EBA8(uint16x8_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint16x8_t *v4;
  uint16x8_t v5;
  uint16x8_t v6;
  uint16x8_t v7;
  uint16x8_t v8;

  v3 = 0;
  v4 = result + 2;
  v5.i64[0] = 0xFC00FC00FC00FC00;
  v5.i64[1] = 0xFC00FC00FC00FC00;
  do
  {
    v6 = vminq_u16(vsqaddq_u16(v4[-1], *(int16x8_t *)(a3 + v3 + 16)), v5);
    v7 = vminq_u16(vsqaddq_u16(*v4, *(int16x8_t *)(a3 + v3 + 32)), v5);
    v8 = vminq_u16(vsqaddq_u16(v4[1], *(int16x8_t *)(a3 + v3 + 48)), v5);
    v4[-2] = vminq_u16(vsqaddq_u16(v4[-2], *(int16x8_t *)(a3 + v3)), v5);
    v4[-1] = v6;
    *v4 = v7;
    v4[1] = v8;
    v3 += 64;
    v4 = (uint16x8_t *)((char *)v4 + 2 * a2);
  }
  while ((_DWORD)v3 != 2048);
  return result;
}

uint16x8_t *sub_1C981EC08(uint16x8_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint16x8_t *v4;
  uint16x8_t v5;
  _OWORD *v6;
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  int16x8_t v10;
  uint16x8_t v11;
  uint16x8_t v12;
  uint16x8_t v13;

  v3 = 0;
  v4 = result + 2;
  v5.i64[0] = 0xFC00FC00FC00FC00;
  v5.i64[1] = 0xFC00FC00FC00FC00;
  do
  {
    v6 = (_OWORD *)(a3 + v3);
    v7 = *(int16x8_t *)(a3 + v3);
    v8 = *(int16x8_t *)(a3 + v3 + 16);
    v9 = *(int16x8_t *)(a3 + v3 + 32);
    v10 = *(int16x8_t *)(a3 + v3 + 48);
    *v6 = 0uLL;
    v6[1] = 0uLL;
    v6[2] = 0uLL;
    v6[3] = 0uLL;
    v11 = vminq_u16(vsqaddq_u16(v4[-1], v8), v5);
    v12 = vminq_u16(vsqaddq_u16(*v4, v9), v5);
    v13 = vminq_u16(vsqaddq_u16(v4[1], v10), v5);
    v4[-2] = vminq_u16(vsqaddq_u16(v4[-2], v7), v5);
    v4[-1] = v11;
    *v4 = v12;
    v4[1] = v13;
    v3 += 64;
    v4 = (uint16x8_t *)((char *)v4 + 2 * a2);
  }
  while ((_DWORD)v3 != 2048);
  return result;
}

uint16x8_t *sub_1C981EC74(uint16x8_t *result, uint64_t a2, int16x8_t *a3)
{
  uint64_t v3;
  unsigned int v4;
  uint16x8_t v5;
  uint16x8_t *v6;
  uint16x8_t v7;
  uint16x8_t v8;
  uint16x8_t v9;

  v3 = 2 * a2;
  v4 = -2;
  v5.i64[0] = 0xFC00FC00FC00FC00;
  v5.i64[1] = 0xFC00FC00FC00FC00;
  do
  {
    v6 = (uint16x8_t *)((char *)result + v3);
    v7 = vminq_u16(vsqaddq_u16(result[1], a3[1]), v5);
    v8 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 2 * a2), a3[2]), v5);
    v9 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&result[1] + v3), a3[3]), v5);
    *result = vminq_u16(vsqaddq_u16(*result, *a3), v5);
    result[1] = v7;
    *v6 = v8;
    v6[1] = v9;
    v4 += 2;
    result = (uint16x8_t *)((char *)result + 4 * a2);
    a3 += 4;
  }
  while (v4 < 0xE);
  return result;
}

uint16x8_t *sub_1C981ECD8(uint16x8_t *result, uint64_t a2, int16x8_t *a3)
{
  uint64_t v3;
  unsigned int v4;
  uint16x8_t v5;
  int16x8_t v6;
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  uint16x8_t *v10;
  uint16x8_t v11;
  uint16x8_t v12;
  uint16x8_t v13;

  v3 = 2 * a2;
  v4 = -2;
  v5.i64[0] = 0xFC00FC00FC00FC00;
  v5.i64[1] = 0xFC00FC00FC00FC00;
  do
  {
    v6 = *a3;
    v7 = a3[1];
    v8 = a3[2];
    v9 = a3[3];
    *a3 = 0uLL;
    a3[1] = 0uLL;
    a3[2] = 0uLL;
    a3[3] = 0uLL;
    v10 = (uint16x8_t *)((char *)result + v3);
    v11 = vminq_u16(vsqaddq_u16(result[1], v7), v5);
    v12 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 2 * a2), v8), v5);
    v13 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&result[1] + v3), v9), v5);
    *result = vminq_u16(vsqaddq_u16(*result, v6), v5);
    result[1] = v11;
    *v10 = v12;
    v10[1] = v13;
    v4 += 2;
    result = (uint16x8_t *)((char *)result + 4 * a2);
    a3 += 4;
  }
  while (v4 < 0xE);
  return result;
}

uint16x8_t *sub_1C981ED48(uint16x8_t *result, uint64_t a2, int16x8_t *a3)
{
  char v3;
  uint16x8_t v4;
  char v5;
  uint16x8_t v6;
  uint16x8_t v7;
  uint16x8_t v8;

  v3 = 1;
  v4.i64[0] = 0xFC00FC00FC00FC00;
  v4.i64[1] = 0xFC00FC00FC00FC00;
  do
  {
    v5 = v3;
    v6 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 2 * a2), a3[1]), v4);
    v7 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 4 * a2), a3[2]), v4);
    v8 = vsqaddq_u16(*(uint16x8_t *)((char *)result + 6 * a2), a3[3]);
    *result = vminq_u16(vsqaddq_u16(*result, *a3), v4);
    *(uint16x8_t *)((char *)result + 2 * a2) = v6;
    *(uint16x8_t *)((char *)result + 4 * a2) = v7;
    *(uint16x8_t *)((char *)result + 6 * a2) = vminq_u16(v8, v4);
    result = (uint16x8_t *)((char *)result + 8 * a2);
    a3 += 4;
    v3 = 0;
  }
  while ((v5 & 1) != 0);
  return result;
}

uint16x8_t *sub_1C981EDC4(uint16x8_t *result, uint64_t a2, int16x8_t *a3)
{
  char v3;
  uint16x8_t v4;
  char v5;
  int16x8_t v6;
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  uint16x8_t v10;
  uint16x8_t v11;
  uint16x8_t v12;

  v3 = 1;
  v4.i64[0] = 0xFC00FC00FC00FC00;
  v4.i64[1] = 0xFC00FC00FC00FC00;
  do
  {
    v5 = v3;
    v6 = *a3;
    v7 = a3[1];
    v8 = a3[2];
    v9 = a3[3];
    *a3 = 0uLL;
    a3[1] = 0uLL;
    a3[2] = 0uLL;
    a3[3] = 0uLL;
    v10 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 2 * a2), v7), v4);
    v11 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 4 * a2), v8), v4);
    v12 = vsqaddq_u16(*(uint16x8_t *)((char *)result + 6 * a2), v9);
    *result = vminq_u16(vsqaddq_u16(*result, v6), v4);
    *(uint16x8_t *)((char *)result + 2 * a2) = v10;
    *(uint16x8_t *)((char *)result + 4 * a2) = v11;
    *(uint16x8_t *)((char *)result + 6 * a2) = vminq_u16(v12, v4);
    result = (uint16x8_t *)((char *)result + 8 * a2);
    a3 += 4;
    v3 = 0;
  }
  while ((v5 & 1) != 0);
  return result;
}

void *sub_1C981EE4C(int16x4_t *a1, int a2)
{
  int16x4_t *v2;
  unint64_t v4;
  int16x4_t *v5;
  unint64_t v6;
  int16x4_t *v7;
  unint64_t v8;
  void *result;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v2 = a1;
  if (a2 <= 16)
  {
    sub_1C970AB50(a1, 0x20u, (uint64_t)&unk_1C9861500);
LABEL_12:
    v8 = -4;
    do
    {
      result = sub_1C981F044(v2, 0x20u, (uint64_t)&unk_1C9861510);
      v8 += 4;
      v2 += 32;
    }
    while (v8 < 0x1C);
    return result;
  }
  if (a2 > 0x30)
  {
    if (a2 >= 0xA1)
    {
      v6 = -4;
      v7 = a1;
      do
      {
        sub_1C970FD18(v7);
        v6 += 4;
        ++v7;
      }
      while (v6 < 0x1C);
    }
    else
    {
      v4 = -4;
      v5 = a1;
      do
      {
        sub_1C970B648(v5, 0x20u, (uint64_t)&unk_1C9861540, (int16x4_t *)aZwpf, (int16x4_t *)aZzxurnic6);
        v4 += 4;
        ++v5;
      }
      while (v4 < 0xC);
    }
  }
  else
  {
    sub_1C970AC1C(a1, 0x20u, (uint64_t)&unk_1C9861520, (int16x4_t *)aZzxu);
    sub_1C970AC1C(v2 + 1, 0x20u, (uint64_t)&unk_1C9861520, (int16x4_t *)aZzxu);
  }
  if (a2 <= 32)
    goto LABEL_12;
  if (a2 > 0x50)
  {
    if (a2 >= 0xE1)
    {
      v12 = -4;
      do
      {
        result = sub_1C981F4C0(v2);
        v12 += 4;
        v2 += 32;
      }
      while (v12 < 0x1C);
    }
    else
    {
      v11 = -4;
      do
      {
        result = sub_1C981F2B8((int16x8_t *)v2, 0x20u, (uint64_t)&unk_1C9861550, (int16x4_t *)aZwpf, (int16x4_t *)aZzxurnic6);
        v11 += 4;
        v2 += 32;
      }
      while (v11 < 0x1C);
    }
  }
  else
  {
    v10 = -4;
    do
    {
      result = sub_1C981F124((int16x8_t *)v2, 0x20u, (uint64_t)&unk_1C9861530, (int16x4_t *)aZzxu);
      v10 += 4;
      v2 += 32;
    }
    while (v10 < 0x1C);
  }
  return result;
}

int16x4_t *sub_1C981F044(int16x4_t *result, unsigned int a2, uint64_t a3)
{
  unsigned int v3;
  int16x8_t *v4;
  int16x4_t v5;
  int16x4_t v6;
  int16x4_t v7;
  int32x2_t v8;
  int32x2_t v9;
  int32x4_t v10;
  uint64_t v11;
  int32x2_t v12;
  int32x2_t v13;
  int16x4_t v14;
  int16x4_t v15;
  int16x4_t v16;
  unsigned __int8 *v17;
  int16x8_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int v23;

  v3 = a2 - 1;
  v4 = (int16x8_t *)((char *)&unk_1C9861310 + 4 * a2);
  v5 = *(int16x4_t *)((char *)result + 2 * a2);
  v6 = *(int16x4_t *)((char *)result + 4 * a2);
  v7 = *(int16x4_t *)((char *)result + 6 * a2);
  v8 = (int32x2_t)vtrn1_s16(*result, v5);
  v9 = (int32x2_t)vtrn1_s16(v6, v7);
  v10 = vshll_n_s16((int16x4_t)vzip1_s32(v8, v9), 6uLL);
  v11 = a2 >> 2;
  v12 = (int32x2_t)vtrn2_s16(*result, v5);
  v13 = (int32x2_t)vtrn2_s16(v6, v7);
  v14 = (int16x4_t)vzip2_s32(v8, v9);
  v15 = (int16x4_t)vzip1_s32(v12, v13);
  v16 = (int16x4_t)vzip2_s32(v12, v13);
  v17 = (unsigned __int8 *)(a3 + 1);
  do
  {
    v18 = *v4++;
    v19 = vmlal_laneq_s16(v10, v14, v18, 4);
    v20 = vmlsl_laneq_s16(v10, v14, v18, 4);
    v21 = vmlal_lane_s16(vmull_lane_s16(v16, *(int16x4_t *)v18.i8, 1), v15, *(int16x4_t *)v18.i8, 0);
    v22 = vmlal_lane_s16(vmull_lane_s16(v16, *(int16x4_t *)v18.i8, 3), v15, *(int16x4_t *)v18.i8, 2);
    v23 = *(v17 - 1);
    v18.i32[0] = *v17;
    v17 += 2;
    result[v23] = vqrshrn_n_s32(vaddq_s32(v21, v19), 0xAuLL);
    result[v18.u32[0]] = vqrshrn_n_s32(vaddq_s32(v22, v20), 0xAuLL);
    *(int16x4_t *)((char *)result + 2 * (int)(4 * (v3 - v23))) = vqrshrn_n_s32(vsubq_s32(v19, v21), 0xAuLL);
    *(int16x4_t *)((char *)result + 2 * (int)(4 * (v3 - v18.i32[0]))) = vqrshrn_n_s32(vsubq_s32(v20, v22), 0xAuLL);
    --v11;
  }
  while (v11);
  return result;
}

int16x8_t *sub_1C981F124(int16x8_t *result, unsigned int a2, uint64_t a3, int16x4_t *a4)
{
  unsigned int v4;
  int16x8_t *v5;
  int16x8_t v6;
  int16x8_t v7;
  int16x8_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  int16x8_t v16;
  int32x4_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  int16x8_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int16x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int v31;
  int v32;
  int v33;
  int32x4_t v34;
  int32x4_t v35;
  int32x4_t v36;

  v4 = a2 - 1;
  v5 = (int16x8_t *)((char *)&unk_1C9861310 + 2 * a2);
  v6 = *(int16x8_t *)((char *)result + 4 * a2);
  v7 = *(int16x8_t *)((char *)result + 2 * a2);
  v8 = *(int16x8_t *)((char *)result + 6 * a2);
  v9 = (int32x4_t)vtrn1q_s16(*result, v7);
  v10 = (int32x4_t)vtrn2q_s16(*result, v7);
  v11 = (int32x4_t)vtrn1q_s16(v6, v8);
  v12 = (int32x4_t)vtrn2q_s16(v6, v8);
  v13 = (int16x8_t)vtrn1q_s32(v9, v11);
  v14 = (int16x8_t)vtrn2q_s32(v9, v11);
  v15 = (int16x8_t)vtrn1q_s32(v10, v12);
  v16 = (int16x8_t)vtrn2q_s32(v10, v12);
  v17 = vshll_n_s16(*(int16x4_t *)v13.i8, 6uLL);
  v18 = a2 >> 3;
  v19 = (unsigned __int8 *)(a3 + 3);
  do
  {
    v20 = *v5++;
    v21 = vmlal_high_laneq_s16(v17, v13, v20, 4);
    v22 = vmlsl_high_laneq_s16(v17, v13, v20, 4);
    v23 = vmlal_high_lane_s16(vmull_lane_s16(*(int16x4_t *)v14.i8, *(int16x4_t *)v20.i8, 0), v14, *(int16x4_t *)v20.i8, 1);
    v24 = vmlal_high_lane_s16(vmull_lane_s16(*(int16x4_t *)v14.i8, *(int16x4_t *)v20.i8, 2), v14, *(int16x4_t *)v20.i8, 3);
    v25 = vmlal_high_lane_s16(vmlal_high_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v16.i8, *a4, 1), *(int16x4_t *)v15.i8, *a4, 0), v15, *a4, 2), v16, *a4, 3);
    v26 = vmlal_high_lane_s16(vmlal_high_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v16.i8, a4[1], 1), *(int16x4_t *)v15.i8, a4[1], 0), v15, a4[1], 2), v16, a4[1], 3);
    v27 = a4[3];
    v28 = vmlal_high_lane_s16(vmlal_high_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v16.i8, a4[2], 1), *(int16x4_t *)v15.i8, a4[2], 0), v15, a4[2], 2), v16, a4[2], 3);
    v29 = vaddq_s32(v23, v21);
    v30 = vsubq_s32(v21, v23);
    v31 = *(v19 - 3);
    v32 = *(v19 - 2);
    v33 = *(v19 - 1);
    v20.i32[0] = *v19;
    v19 += 4;
    *(int16x4_t *)&result->i8[8 * v31] = vqrshrn_n_s32(vaddq_s32(v25, v29), 0xAuLL);
    v34 = vaddq_s32(v24, v22);
    v35 = vsubq_s32(v22, v24);
    *(int16x4_t *)&result->i8[8 * v32] = vqrshrn_n_s32(vaddq_s32(v26, v30), 0xAuLL);
    v36 = vmlal_high_lane_s16(vmlal_high_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v16.i8, v27, 1), *(int16x4_t *)v15.i8, v27, 0), v15, v27, 2), v16, v27, 3);
    *(int16x4_t *)&result->i8[8 * v33] = vqrshrn_n_s32(vaddq_s32(v28, v34), 0xAuLL);
    *(int16x4_t *)&result->i8[8 * v20.u32[0]] = vqrshrn_n_s32(vaddq_s32(v36, v35), 0xAuLL);
    *(int16x4_t *)&result->i8[8 * (v4 - v31)] = vqrshrn_n_s32(vsubq_s32(v29, v25), 0xAuLL);
    *(int16x4_t *)&result->i8[8 * (v4 - v32)] = vqrshrn_n_s32(vsubq_s32(v30, v26), 0xAuLL);
    *(int16x4_t *)&result->i8[8 * (v4 - v33)] = vqrshrn_n_s32(vsubq_s32(v34, v28), 0xAuLL);
    *(int16x4_t *)&result->i8[8 * (v4 - v20.i32[0])] = vqrshrn_n_s32(vsubq_s32(v35, v36), 0xAuLL);
    a4 += 4;
    --v18;
  }
  while (v18);
  return result;
}

int16x8_t *sub_1C981F2B8(int16x8_t *result, unsigned int a2, uint64_t a3, int16x4_t *a4, int16x4_t *a5)
{
  int16x8_t *v5;
  int16x8_t *v6;
  int16x8_t *v7;
  int16x8_t v8;
  int16x8_t v9;
  int16x8_t v10;
  int16x8_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int16x8_t v16;
  int16x8_t v17;
  int16x8_t v18;
  int16x8_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int16x8_t v24;
  int16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  uint64_t v28;
  int16x8_t *v29;
  int32x4_t v30;
  uint64_t v31;
  int32x4_t *v32;
  int16x8_t v33;
  int32x4_t v34;
  int32x4_t v35;
  int32x4_t v36;
  int32x4_t v37;
  int32x4_t v38;
  int32x4_t v39;
  int16x4_t v40;
  int32x4_t v41;
  int32x4_t v42;
  int32x4_t v43;
  int32x4_t v44;
  int32x4_t v45;
  int32x4_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int32x4_t v50;
  int32x4_t v51;
  int v52;
  _OWORD v53[16];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = (int16x8_t *)((char *)result + 2 * a2);
  v6 = (int16x8_t *)((char *)result + 4 * a2);
  v7 = (int16x8_t *)((char *)result + 6 * a2);
  v8 = result[1];
  v9 = v5[1];
  v10 = v6[1];
  v11 = v7[1];
  v12 = (int32x4_t)vtrn1q_s16(*result, *v5);
  v13 = (int32x4_t)vtrn2q_s16(*result, *v5);
  v14 = (int32x4_t)vtrn1q_s16(*v6, *v7);
  v15 = (int32x4_t)vtrn2q_s16(*v6, *v7);
  v16 = (int16x8_t)vtrn1q_s32(v12, v14);
  v17 = (int16x8_t)vtrn2q_s32(v12, v14);
  v18 = (int16x8_t)vtrn1q_s32(v13, v15);
  v19 = (int16x8_t)vtrn2q_s32(v13, v15);
  v20 = (int32x4_t)vtrn1q_s16(v8, v9);
  v21 = (int32x4_t)vtrn2q_s16(v8, v9);
  v22 = (int32x4_t)vtrn1q_s16(v10, v11);
  v23 = (int32x4_t)vtrn2q_s16(v10, v11);
  v24 = (int16x8_t)vtrn1q_s32(v20, v22);
  v25 = (int16x8_t)vtrn2q_s32(v20, v22);
  v26 = (int16x8_t)vtrn1q_s32(v21, v23);
  v27 = (int16x8_t)vtrn2q_s32(v21, v23);
  v28 = a2 >> 1;
  v29 = (int16x8_t *)((char *)&unk_1C9861310 + 2 * v28);
  v30 = vshll_n_s16(*(int16x4_t *)v16.i8, 6uLL);
  v31 = a2 >> 4;
  v32 = (int32x4_t *)v53;
  do
  {
    v33 = *v29++;
    v34 = vmlal_laneq_s16(v30, *(int16x4_t *)v24.i8, v33, 4);
    v35 = vmlsl_laneq_s16(v30, *(int16x4_t *)v24.i8, v33, 4);
    v36 = vmlal_high_lane_s16(vmull_high_lane_s16(v24, *(int16x4_t *)v33.i8, 1), v16, *(int16x4_t *)v33.i8, 0);
    v37 = vmlal_high_lane_s16(vmull_high_lane_s16(v24, *(int16x4_t *)v33.i8, 3), v16, *(int16x4_t *)v33.i8, 2);
    v38 = vmlal_high_lane_s16(vmlal_lane_s16(vmlal_high_lane_s16(vmull_lane_s16(*(int16x4_t *)v17.i8, *a4, 0), v17, *a4, 1), *(int16x4_t *)v25.i8, *a4, 2), v25, *a4, 3);
    v39 = vmlal_high_lane_s16(vmlal_lane_s16(vmlal_high_lane_s16(vmull_lane_s16(*(int16x4_t *)v17.i8, a4[1], 0), v17, a4[1], 1), *(int16x4_t *)v25.i8, a4[1], 2), v25, a4[1], 3);
    v40 = a4[3];
    v41 = vmlal_high_lane_s16(vmlal_lane_s16(vmlal_high_lane_s16(vmull_lane_s16(*(int16x4_t *)v17.i8, a4[2], 0), v17, a4[2], 1), *(int16x4_t *)v25.i8, a4[2], 2), v25, a4[2], 3);
    v42 = vaddq_s32(v36, v34);
    v43 = vsubq_s32(v34, v36);
    v44 = vaddq_s32(v37, v35);
    v45 = vsubq_s32(v35, v37);
    *v32 = vaddq_s32(v38, v42);
    v32[1] = vaddq_s32(v39, v43);
    v46 = vmlal_high_lane_s16(vmlal_lane_s16(vmlal_high_lane_s16(vmull_lane_s16(*(int16x4_t *)v17.i8, v40, 0), v17, v40, 1), *(int16x4_t *)v25.i8, v40, 2), v25, v40, 3);
    v32[2] = vaddq_s32(v41, v44);
    v32[3] = vaddq_s32(v46, v45);
    v32[4] = vsubq_s32(v42, v38);
    v32[5] = vsubq_s32(v43, v39);
    v32[6] = vsubq_s32(v44, v41);
    v32[7] = vsubq_s32(v45, v46);
    a4 += 4;
    v32 += 8;
    --v31;
  }
  while (v31);
  v47 = 0;
  if (v28 <= 1)
    v48 = 1;
  else
    v48 = v28;
  v49 = 2 * v28;
  do
  {
    v50 = (int32x4_t)v53[v47];
    v51 = vmlal_high_laneq_s16(vmlal_high_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_high_lane_s16(vmlal_high_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v19.i8, *a5, 1), *(int16x4_t *)v18.i8, *a5, 0), v18, *a5, 2), v19, *a5, 3), *(int16x4_t *)v26.i8, *(int16x8_t *)a5->i8, 4), *(int16x4_t *)v27.i8, *(int16x8_t *)a5->i8, 5), v26,
              *(int16x8_t *)a5->i8,
              6),
            v27,
            *(int16x8_t *)a5->i8,
            7);
    v52 = 4 * (~*(unsigned __int8 *)(a3 + v47) + a2);
    *(int16x4_t *)&result->i8[8 * *(unsigned __int8 *)(a3 + v47)] = vqrshrn_n_s32(vaddq_s32(v51, v50), 0xAuLL);
    *(int16x4_t *)&result->i8[2 * v52] = vqrshrn_n_s32(vsubq_s32(v50, v51), 0xAuLL);
    ++v47;
    a5 = (int16x4_t *)((char *)a5 + v49);
  }
  while (v48 != v47);
  return result;
}

int16x4_t *sub_1C981F4C0(int16x4_t *result)
{
  int16x8_t *v1;
  unint64_t v2;
  int16x8_t v3;
  int16x8_t v4;
  int16x8_t v5;
  int32x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  unint64_t v10;
  int16x4_t v11;
  int16x4_t v12;
  int16x4_t v13;
  int16x4_t v14;
  int16x4_t v15;
  int16x4_t v16;
  int16x4_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int16x4_t v31;
  int16x4_t v32;
  int16x4_t v33;
  int16x4_t v34;
  int16x4_t v35;
  int16x4_t v36;
  int16x4_t v37;
  int16x4_t v38;
  int32x4_t *v39;
  int32x4_t v40;
  int16x8_t v41;
  int32x4_t v42;
  uint64_t v43;
  int16x4_t v44;
  int16x4_t v45;
  int16x4_t v46;
  int16x4_t v47;
  int16x4_t v48;
  int16x4_t v49;
  int16x4_t v50;
  int16x4_t v51;
  int16x4_t v52;
  int16x4_t v53;
  int16x4_t v54;
  int16x4_t v55;
  const __int16 *v56;
  int16x4_t v57;
  int16x4_t v58;
  int16x4_t v59;
  int16x4_t v60;
  int16x8_t v61;
  int16x8_t v62;
  int32x4_t v63;
  int32x4_t v64;
  int v65;
  _OWORD v66[16];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v1 = (int16x8_t *)&result[16];
  v2 = -8;
  do
  {
    v3 = v1[-8];
    v4 = v1[-4];
    v5 = v1[4];
    v6 = (int32x4_t)vtrn1q_s16(v3, v4);
    v7 = (int32x4_t)vtrn2q_s16(v3, v4);
    v8 = (int32x4_t)vtrn1q_s16(*v1, v5);
    v9 = (int32x4_t)vtrn2q_s16(*v1, v5);
    v1[-8] = (int16x8_t)vtrn1q_s32(v6, v8);
    v1[-4] = (int16x8_t)vtrn1q_s32(v7, v9);
    *(int32x4_t *)v1 = vtrn2q_s32(v6, v8);
    v1[4] = (int16x8_t)vtrn2q_s32(v7, v9);
    v2 += 8;
    ++v1;
  }
  while (v2 < 0x18);
  v10 = 0;
  v11 = result[1];
  v12 = result[2];
  v13 = result[3];
  v15 = result[4];
  v14 = result[5];
  v16 = result[6];
  v17 = result[7];
  v18 = vshll_n_s16(*result, 6uLL);
  v19 = vmlal_s16(v18, v15, (int16x4_t)0x40004000400040);
  v20 = vmlsl_s16(v18, v15, (int16x4_t)0x40004000400040);
  v21 = vmlal_s16(vmull_s16(v16, (int16x4_t)0x24002400240024), v12, (int16x4_t)0x53005300530053);
  v22 = vmlal_s16(vmull_s16(v16, (int16x4_t)0x52005200520052), v12, (int16x4_t)0x24002400240024);
  v23 = vaddq_s32(v21, v19);
  v24 = vsubq_s32(v19, v21);
  v25 = vaddq_s32(v22, v20);
  v26 = vsubq_s32(v20, v22);
  v27 = vmlal_s16(vmlal_s16(vmlal_s16(vmull_s16(v13, (int16x4_t)0x4B004B004B004BLL), v11, (int16x4_t)0x59005900590059), v14, (int16x4_t)0x32003200320032), v17, (int16x4_t)0x12001200120012);
  v28 = vmlal_s16(vmlal_s16(vmlal_s16(vmull_s16(v13, (int16x4_t)0x31003100310031), v11, (int16x4_t)0x12001200120012), v14, (int16x4_t)0x4B004B004B004BLL), v17, (int16x4_t)0x58005800580058);
  v29 = vmlal_s16(vmlal_s16(vmlal_s16(vmull_s16(v13, (int16x4_t)0x11001100110011), v11, (int16x4_t)0x4B004B004B004BLL), v14, (int16x4_t)0x58005800580058), v17, (int16x4_t)0x31003100310031);
  v66[0] = vaddq_s32(v27, v23);
  v66[1] = vaddq_s32(v28, v24);
  v30 = vmlal_s16(vmlal_s16(vmlal_s16(vmull_s16(v13, (int16x4_t)0x58005800580058), v11, (int16x4_t)0x32003200320032), v14, (int16x4_t)0x12001200120012), v17, (int16x4_t)0x4B004B004B004BLL);
  v66[2] = vaddq_s32(v29, v25);
  v66[3] = vaddq_s32(v30, v26);
  v66[4] = vsubq_s32(v23, v27);
  v66[5] = vsubq_s32(v24, v28);
  v66[6] = vsubq_s32(v25, v29);
  v66[7] = vsubq_s32(v26, v30);
  v31 = result[16];
  v32 = result[17];
  v33 = result[18];
  v34 = result[19];
  v35 = result[20];
  v36 = result[21];
  v37 = result[22];
  v38 = result[23];
  do
  {
    v39 = (int32x4_t *)&v66[v10 / 8];
    v40 = (int32x4_t)v66[v10 / 8];
    v41 = *(int16x8_t *)&aZwpf9[v10];
    v42 = vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmull_lane_s16(v32, *(int16x4_t *)v41.i8, 1), v31, *(int16x4_t *)v41.i8, 0), v33, *(int16x4_t *)v41.i8, 2), v34, *(int16x4_t *)v41.i8, 3), v35, v41, 4), v36, v41, 5), v37,
              v41,
              6),
            v38,
            v41,
            7);
    *v39 = vaddq_s32(v42, v40);
    v39[8] = vsubq_s32(v40, v42);
    v10 += 8;
  }
  while (v10 != 64);
  v43 = 0;
  v44 = result[8];
  v45 = result[9];
  v46 = result[24];
  v47 = result[25];
  v48 = result[10];
  v49 = result[11];
  v50 = result[26];
  v51 = result[27];
  v52 = result[12];
  v53 = result[13];
  v54 = result[28];
  v55 = result[29];
  v56 = aZzxurnic6;
  v57 = result[14];
  v58 = result[15];
  v59 = result[30];
  v60 = result[31];
  do
  {
    v61 = *(int16x8_t *)v56;
    v62 = *((int16x8_t *)v56 + 1);
    v56 += 16;
    v63 = (int32x4_t)v66[byte_1C98617E0[v43]];
    v64 = vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmull_lane_s16(v46, *(int16x4_t *)v61.i8, 1), v44, *(int16x4_t *)v61.i8, 0), v45,
                                      *(int16x4_t *)v61.i8,
                                      2),
                                    v47,
                                    *(int16x4_t *)v61.i8,
                                    3),
                                  v48,
                                  v61,
                                  4),
                                v50,
                                v61,
                                5),
                              v49,
                              v61,
                              6),
                            v51,
                            v61,
                            7),
                          v52,
                          *(int16x4_t *)v62.i8,
                          0),
                        v54,
                        *(int16x4_t *)v62.i8,
                        1),
                      v53,
                      *(int16x4_t *)v62.i8,
                      2),
                    v55,
                    *(int16x4_t *)v62.i8,
                    3),
                  v57,
                  v62,
                  4),
                v59,
                v62,
                5),
              v58,
              v62,
              6),
            v60,
            v62,
            7);
    v65 = 124 - 4 * *((unsigned __int8 *)&unk_1C9861500 + v43 + 80);
    result[*((unsigned __int8 *)&unk_1C9861500 + v43 + 80)] = vqrshrn_n_s32(vaddq_s32(v64, v63), 0xAuLL);
    *(int16x4_t *)((char *)result + 2 * v65) = vqrshrn_n_s32(vsubq_s32(v63, v64), 0xAuLL);
    ++v43;
  }
  while (v43 != 16);
  return result;
}

int16x4_t *sub_1C981F774(int16x4_t *result, int a2)
{
  int16x4_t *v2;
  int16x8_t v3;
  unsigned int v4;
  unint64_t v6;
  int16x4_t *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v2 = result;
  if (a2 == 1)
  {
    v3 = vdupq_n_s16((result->i16[0] + 17) >> 5);
    v4 = -32;
    do
    {
      *(int16x8_t *)v2->i8 = v3;
      *(int16x8_t *)v2[2].i8 = v3;
      *(int16x8_t *)v2[4].i8 = v3;
      *(int16x8_t *)v2[6].i8 = v3;
      v4 += 32;
      v2 += 8;
    }
    while (v4 < 0xE0);
    return result;
  }
  if (a2 <= 16)
  {
    sub_1C970AB50(result, 0x10u, (uint64_t)&unk_1C9861410);
LABEL_12:
    v8 = -4;
    do
    {
      result = sub_1C981F044(v2, 0x10u, (uint64_t)&unk_1C98614F0);
      v8 += 4;
      v2 += 16;
    }
    while (v8 < 0xC);
    return result;
  }
  if (a2 >= 0x31)
  {
    v6 = -4;
    v7 = result;
    do
    {
      sub_1C970B648(v7, 0x10u, (uint64_t)&unk_1C9861460, (int16x4_t *)aYk2, (int16x4_t *)aZwpf9);
      v6 += 4;
      ++v7;
    }
    while (v6 < 0xC);
  }
  else
  {
    sub_1C970AC1C(result, 0x10u, (uint64_t)&unk_1C9861410, (int16x4_t *)aZwpf);
    sub_1C970AC1C(v2 + 1, 0x10u, (uint64_t)&unk_1C9861410, (int16x4_t *)aZwpf);
  }
  if (a2 <= 32)
    goto LABEL_12;
  if (a2 >= 0x51)
  {
    v10 = -4;
    do
    {
      result = (int16x4_t *)sub_1C981F2B8((int16x8_t *)v2, 0x10u, (uint64_t)&unk_1C98614F8, (int16x4_t *)aYk2, (int16x4_t *)aZwpf9);
      v10 += 4;
      v2 += 16;
    }
    while (v10 < 0xC);
  }
  else
  {
    v9 = -4;
    do
    {
      result = (int16x4_t *)sub_1C981F124((int16x8_t *)v2, 0x10u, (uint64_t)&unk_1C98614F0, (int16x4_t *)aZwpf);
      v9 += 4;
      v2 += 16;
    }
    while (v9 < 0xC);
  }
  return result;
}

int16x4_t *sub_1C981F950(int16x4_t *result, int a2)
{
  int16x4_t *v2;
  int16x8_t v3;
  char v4;
  char v5;

  v2 = result;
  if (a2 == 1)
  {
    v3 = vdupq_n_s16((result->i16[0] + 17) >> 5);
    v4 = 1;
    do
    {
      v5 = v4;
      *(int16x8_t *)v2->i8 = v3;
      *(int16x8_t *)v2[2].i8 = v3;
      *(int16x8_t *)v2[4].i8 = v3;
      *(int16x8_t *)v2[6].i8 = v3;
      v2 += 8;
      v4 = 0;
    }
    while ((v5 & 1) != 0);
  }
  else if (a2 > 16)
  {
    sub_1C970AC1C(result, 8u, (uint64_t)&unk_1C98612E0, (int16x4_t *)aYk2);
    sub_1C970AC1C(v2 + 1, 8u, (uint64_t)&unk_1C98612E0, (int16x4_t *)aYk2);
    sub_1C981F124((int16x8_t *)v2, 8u, (uint64_t)&unk_1C98612E0, (int16x4_t *)aYk2);
    return (int16x4_t *)sub_1C981F124((int16x8_t *)&v2[8], 8u, (uint64_t)&unk_1C98612E0, (int16x4_t *)aYk2);
  }
  else
  {
    sub_1C970AB50(result, 8u, (uint64_t)&unk_1C98612E0);
    sub_1C981F044(v2, 8u, (uint64_t)&unk_1C98612E0);
    return sub_1C981F044(v2 + 8, 8u, (uint64_t)&unk_1C98612E0);
  }
  return result;
}

int32x4_t sub_1C981FA58(int32x4_t *a1, int a2)
{
  int32x4_t result;
  int16x4_t v3;
  int16x4_t v4;
  int16x4_t v5;
  int32x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int16x4_t v11;
  int16x4_t v12;
  int32x2_t v13;
  int32x2_t v14;
  int16x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int16x4_t v25;
  int16x4_t v26;

  if (a2 == 1)
  {
    result = (int32x4_t)vdupq_n_s16((a1->i16[0] + 17) >> 5);
    *a1 = result;
    a1[1] = result;
  }
  else
  {
    v3 = (int16x4_t)a1->u64[1];
    v4 = *(int16x4_t *)a1[1].i8;
    v5 = (int16x4_t)a1[1].u64[1];
    v6 = vsubl_s16(*(int16x4_t *)a1->i8, v4);
    v7 = vshlq_n_s32(vaddl_s16(v4, *(int16x4_t *)a1->i8), 6uLL);
    v8 = vshlq_n_s32(v6, 6uLL);
    v9 = vmlal_s16(vmull_s16(v5, (int16x4_t)0x24002400240024), v3, (int16x4_t)0x53005300530053);
    v10 = vmlsl_s16(vmull_s16(v3, (int16x4_t)0x24002400240024), v5, (int16x4_t)0x53005300530053);
    v11 = vqrshrn_n_s32(vaddq_s32(v9, v7), 7uLL);
    *(int16x4_t *)v7.i8 = vqrshrn_n_s32(vsubq_s32(v7, v9), 7uLL);
    v12 = vqrshrn_n_s32(vaddq_s32(v10, v8), 7uLL);
    *(int16x4_t *)v8.i8 = vqrshrn_n_s32(vsubq_s32(v8, v10), 7uLL);
    *(int16x4_t *)v10.i8 = vtrn1_s16(v11, v12);
    v13 = (int32x2_t)vtrn2_s16(v11, v12);
    v14 = (int32x2_t)vtrn1_s16(*(int16x4_t *)v8.i8, *(int16x4_t *)v7.i8);
    *(int16x4_t *)v8.i8 = vtrn2_s16(*(int16x4_t *)v8.i8, *(int16x4_t *)v7.i8);
    *(int32x2_t *)v7.i8 = vzip1_s32(*(int32x2_t *)v10.i8, v14);
    v15 = (int16x4_t)vzip2_s32(*(int32x2_t *)v10.i8, v14);
    v16 = vaddl_s16(*(int16x4_t *)v7.i8, v15);
    v17 = vsubl_s16(*(int16x4_t *)v7.i8, v15);
    v18 = vshlq_n_s32(v16, 6uLL);
    v19 = vshlq_n_s32(v17, 6uLL);
    *(int32x2_t *)v16.i8 = vzip1_s32(v13, *(int32x2_t *)v8.i8);
    *(int32x2_t *)v8.i8 = vzip2_s32(v13, *(int32x2_t *)v8.i8);
    v20 = vmlal_s16(vmull_s16(*(int16x4_t *)v8.i8, (int16x4_t)0x24002400240024), *(int16x4_t *)v16.i8, (int16x4_t)0x53005300530053);
    v21 = vmlsl_s16(vmull_s16(*(int16x4_t *)v16.i8, (int16x4_t)0x24002400240024), *(int16x4_t *)v8.i8, (int16x4_t)0x53005300530053);
    result = vaddq_s32(v18, v20);
    v22 = vsubq_s32(v18, v20);
    v23 = vaddq_s32(v19, v21);
    v24 = vsubq_s32(v19, v21);
    v25 = vqrshrn_n_s32(result, 0xAuLL);
    *(int16x4_t *)v21.i8 = vqrshrn_n_s32(v22, 0xAuLL);
    v26 = vqrshrn_n_s32(v23, 0xAuLL);
    *(int16x4_t *)v16.i8 = vqrshrn_n_s32(v24, 0xAuLL);
    vst4_s16(a1->i16, *(int16x4x4_t *)(&v16 - 1));
  }
  return result;
}

int16x4_t sub_1C981FB30(int16x4_t *a1, uint64_t a2, int16x4_t *a3, uint64_t a4, int16x4_t *a5)
{
  int16x4_t v5;
  int16x4_t v6;
  int16x4_t v7;
  int16x4_t v8;
  int16x4_t result;

  v5 = vsub_s16(*(int16x4_t *)((char *)a1 + 2 * a2), *(int16x4_t *)((char *)a3 + 2 * a4));
  v6 = *(int16x4_t *)((char *)a1 + 6 * a2);
  v7 = *(int16x4_t *)((char *)a3 + 6 * a4);
  v8 = vsub_s16(*(int16x4_t *)((char *)a1 + 4 * a2), *(int16x4_t *)((char *)a3 + 4 * a4));
  *a5 = vsub_s16(*a1, *a3);
  a5[1] = v5;
  result = vsub_s16(v6, v7);
  a5[2] = v8;
  a5[3] = result;
  return result;
}

int16x8_t *sub_1C981FB88(int16x8_t *result, uint64_t a2, int16x8_t *a3, uint64_t a4, int16x8_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  int16x8_t v9;
  int16x8_t *v10;
  int16x8_t *v11;
  int16x8_t v12;
  int16x8_t *v13;
  int16x8_t *v14;
  int16x8_t v15;

  v5 = 2 * a2;
  v6 = 2 * a4;
  v7 = 1;
  do
  {
    v8 = v7;
    v9 = vsubq_s16(*(int16x8_t *)((char *)result + 2 * a2), *(int16x8_t *)((char *)a3 + 2 * a4));
    v10 = (int16x8_t *)((char *)result + v5 + v5);
    v11 = (int16x8_t *)((char *)a3 + v6 + v6);
    v12 = vsubq_s16(*v10, *v11);
    v13 = (int16x8_t *)((char *)v10 + v5);
    v14 = (int16x8_t *)((char *)v11 + v6);
    v15 = vsubq_s16(*v13, *v14);
    *a5 = vsubq_s16(*result, *a3);
    a5[1] = v9;
    a5[2] = v12;
    a5[3] = v15;
    result = (int16x8_t *)((char *)v13 + v5);
    a3 = (int16x8_t *)((char *)v14 + v6);
    a5 += 4;
    v7 = 0;
  }
  while ((v8 & 1) != 0);
  return result;
}

int16x8_t *sub_1C981FC00(int16x8_t *result, uint64_t a2, int16x8_t *a3, uint64_t a4, int16x8_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  int16x8_t v8;
  int16x8_t v9;
  int16x8_t v10;

  v5 = 2 * a2;
  v6 = 2 * a4;
  v7 = -2;
  do
  {
    v8 = vsubq_s16(result[1], a3[1]);
    v9 = vsubq_s16(*(int16x8_t *)((char *)result + 2 * a2), *(int16x8_t *)((char *)a3 + 2 * a4));
    v10 = vsubq_s16(*(int16x8_t *)((char *)&result[1] + v5), *(int16x8_t *)((char *)&a3[1] + v6));
    *a5 = vsubq_s16(*result, *a3);
    a5[1] = v8;
    v7 += 2;
    a5[2] = v9;
    a5[3] = v10;
    result = (int16x8_t *)((char *)result + v5 + v5);
    a3 = (int16x8_t *)((char *)a3 + v6 + v6);
    a5 += 4;
  }
  while (v7 < 0xE);
  return result;
}

int16x8_t sub_1C981FC58(int16x8_t *a1, uint64_t a2, int16x8_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  int16x8_t *v6;
  int16x8_t *v7;
  int16x8_t result;
  int16x8_t v9;
  int16x8_t v10;
  int16x8_t *v11;
  int16x8_t v12;

  v5 = 0;
  v6 = a3 + 2;
  v7 = a1 + 2;
  do
  {
    result = vsubq_s16(v7[-2], v6[-2]);
    v9 = vsubq_s16(v7[-1], v6[-1]);
    v10 = vsubq_s16(*v7, *v6);
    v11 = (int16x8_t *)(a5 + v5);
    v12 = vsubq_s16(v7[1], v6[1]);
    *v11 = result;
    v11[1] = v9;
    v11[2] = v10;
    v11[3] = v12;
    v5 += 64;
    v6 = (int16x8_t *)((char *)v6 + 2 * a4);
    v7 = (int16x8_t *)((char *)v7 + 2 * a2);
  }
  while ((_DWORD)v5 != 2048);
  return result;
}

int16x4_t sub_1C981FCB0(int16x4_t *a1, uint64_t a2, int16x4_t *a3, uint64_t a4, int16x4_t *a5)
{
  int16x4_t v6;
  int16x4_t v7;
  int16x4_t v8;
  int16x4_t v9;
  int16x4_t v11[6];

  v11[5] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v6 = vsub_s16(*(int16x4_t *)((char *)a1 + 2 * a2), *(int16x4_t *)((char *)a3 + 2 * a4));
  v7 = *(int16x4_t *)((char *)a1 + 6 * a2);
  v8 = *(int16x4_t *)((char *)a3 + 6 * a4);
  v9 = vsub_s16(*(int16x4_t *)((char *)a1 + 4 * a2), *(int16x4_t *)((char *)a3 + 4 * a4));
  *a5 = vsub_s16(*a1, *a3);
  a5[1] = v6;
  a5[2] = v9;
  a5[3] = vsub_s16(v7, v8);
  sub_1C981AFE4(v11, a5, 4);
  return sub_1C981B088(a5, v11);
}

int16x4_t sub_1C981FD70(int16x4_t *a1, uint64_t a2, int16x4_t *a3, uint64_t a4, int16x4_t *a5)
{
  int16x4_t v5;
  int16x4_t v6;
  int16x4_t v7;
  int16x4_t v8;
  int32x2_t v9;
  int32x2_t v10;
  int32x2_t v11;
  int32x2_t v12;
  int16x4_t v13;
  int16x4_t v14;
  int16x4_t v15;
  int16x4_t v16;
  int16x4_t v17;
  int16x4_t v18;
  int16x4_t v19;
  int16x4_t v20;
  int16x4_t v22[6];

  v22[5] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v5 = vsub_s16(*a1, *a3);
  v6 = vsub_s16(*(int16x4_t *)((char *)a1 + 2 * a2), *(int16x4_t *)((char *)a3 + 2 * a4));
  v7 = vsub_s16(*(int16x4_t *)((char *)a1 + 4 * a2), *(int16x4_t *)((char *)a3 + 4 * a4));
  v8 = vsub_s16(*(int16x4_t *)((char *)a1 + 6 * a2), *(int16x4_t *)((char *)a3 + 6 * a4));
  *a5 = v5;
  a5[1] = v6;
  a5[2] = v7;
  a5[3] = v8;
  v9 = (int32x2_t)vtrn1_s16(v5, v6);
  v10 = (int32x2_t)vtrn2_s16(v5, v6);
  v11 = (int32x2_t)vtrn1_s16(v7, v8);
  v12 = (int32x2_t)vtrn2_s16(v7, v8);
  v13 = (int16x4_t)vzip1_s32(v10, v12);
  v14 = (int16x4_t)vzip2_s32(v9, v11);
  v15 = (int16x4_t)vzip2_s32(v10, v12);
  v16 = (int16x4_t)vzip1_s32(v9, v11);
  v17 = vadd_s16(v15, v16);
  v18 = vsub_s16(v16, v15);
  v19 = vadd_s16(v14, v13);
  v20 = vsub_s16(v13, v14);
  v22[0] = vqmovn_s32(vrshrq_n_s32(vshlq_n_s32(vaddl_s16(v19, v17), 6uLL), 4uLL));
  v22[1] = vqmovn_s32(vrshrq_n_s32(vmlal_s16(vmull_s16(v20, (int16x4_t)0x24002400240024), v18, (int16x4_t)0x53005300530053), 4uLL));
  v22[2] = vqmovn_s32(vrshrq_n_s32(vshlq_n_s32(vsubl_s16(v17, v19), 6uLL), 4uLL));
  v22[3] = vqmovn_s32(vrshrq_n_s32(vmlsl_s16(vmull_s16(v18, (int16x4_t)0x24002400240024), v20, (int16x4_t)0x53005300530053), 4uLL));
  return sub_1C981AF54(a5, v22);
}

void sub_1C981FE94(int16x8_t *a1, uint64_t a2, int16x8_t *a3, uint64_t a4, int16x8_t *a5)
{
  int16x4_t v6[18];

  v6[17] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  sub_1C981FB88(a1, a2, a3, a4, a5);
  sub_1C981ADF0(v6, (int16x4_t *)a5, 5);
  sub_1C981AE94((int16x4_t *)a5, v6);
}

void sub_1C981FF04(int16x8_t *a1, uint64_t a2, int16x8_t *a3, uint64_t a4, int16x4_t *a5)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  int16x8_t *v9;
  int16x8_t v10;
  int16x8_t v11;
  int16x8_t v12;
  int16x4_t v13[66];

  v13[65] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v6 = 2 * a2;
  v7 = 2 * a4;
  v8 = -2;
  v9 = (int16x8_t *)a5;
  do
  {
    v10 = vsubq_s16(a1[1], a3[1]);
    v11 = vsubq_s16(*(int16x8_t *)((char *)a1 + 2 * a2), *(int16x8_t *)((char *)a3 + 2 * a4));
    v12 = vsubq_s16(*(int16x8_t *)((char *)&a1[1] + v6), *(int16x8_t *)((char *)&a3[1] + v7));
    *v9 = vsubq_s16(*a1, *a3);
    v9[1] = v10;
    v8 += 2;
    v9[2] = v11;
    v9[3] = v12;
    a1 = (int16x8_t *)((char *)a1 + v6 + v6);
    a3 = (int16x8_t *)((char *)a3 + v7 + v7);
    v9 += 4;
  }
  while (v8 < 0xE);
  sub_1C981AB1C(v13, a5, 6);
  sub_1C981AC68(a5, v13);
}

void sub_1C981FFC8(int16x8_t *a1, uint64_t a2, int16x8_t *a3, uint64_t a4, int16x4_t *a5)
{
  uint64_t v6;
  int16x8_t *v7;
  int16x8_t *v8;
  int16x8_t v9;
  int16x8_t v10;
  int16x8_t *v11;
  int16x8_t v12;
  int16x4_t v13[258];

  v6 = 0;
  v13[257] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v7 = a3 + 2;
  v8 = a1 + 2;
  do
  {
    v9 = vsubq_s16(v8[-1], v7[-1]);
    v10 = vsubq_s16(*v8, *v7);
    v11 = (int16x8_t *)&a5[v6];
    v12 = vsubq_s16(v8[1], v7[1]);
    *v11 = vsubq_s16(v8[-2], v7[-2]);
    v11[1] = v9;
    v11[2] = v10;
    v11[3] = v12;
    v6 += 8;
    v7 = (int16x8_t *)((char *)v7 + 2 * a4);
    v8 = (int16x8_t *)((char *)v8 + 2 * a2);
  }
  while ((_DWORD)(v6 * 8) != 2048);
  sub_1C9819DB0(v13, a5, 7);
  sub_1C9819FE4(a5, v13);
}

double sub_1C9820088(uint64_t *a1, uint64_t a2, int16x4_t *a3, char a4)
{
  int16x4_t v4;
  int16x4_t v5;
  int16x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int16x4_t v18;
  int16x4_t v19;
  int32x2_t v20;
  int32x2_t v21;
  int16x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int16x4_t v30;
  uint64_t *v31;
  uint64_t *v32;
  int16x8_t v33;
  uint16x8_t v34;
  uint16x8_t v35;

  v4 = a3[1];
  v5 = a3[2];
  v6 = a3[3];
  v7 = vaddl_s16(v5, *a3);
  v8 = vaddl_s16(v6, v5);
  v9 = vsubl_s16(*a3, v6);
  v10.i64[0] = 0x1D0000001DLL;
  v10.i64[1] = 0x1D0000001DLL;
  v11.i64[0] = 0x3700000037;
  v11.i64[1] = 0x3700000037;
  v12 = vmlaq_s32(vmlal_s16(vmulq_s32(v7, v10), v4, (int16x4_t)0x4A004A004A004ALL), v8, v11);
  v13 = vmlaq_s32(vmlsl_s16(vmulq_s32(v7, v11), v4, (int16x4_t)0x4A004A004A004ALL), v9, v10);
  v14.i64[0] = 0x1C0000001CLL;
  v14.i64[1] = 0x1C0000001CLL;
  v15 = vmlaq_s32(vmlal_s16(vmulq_s32(v9, v11), v4, (int16x4_t)0x4A004A004A004ALL), v8, v14);
  v16.i64[0] = 0x4A0000004ALL;
  v16.i64[1] = 0x4A0000004ALL;
  v17 = vmulq_s32(vaddw_s16(vsubl_s16(*a3, v5), v6), v16);
  v18 = vqrshrn_n_s32(v12, 7uLL);
  v19 = vqrshrn_n_s32(v15, 7uLL);
  *(int16x4_t *)v17.i8 = vqrshrn_n_s32(v17, 7uLL);
  *(int16x4_t *)v13.i8 = vqrshrn_n_s32(v13, 7uLL);
  *(int16x4_t *)v8.i8 = vtrn1_s16(v18, v19);
  v20 = (int32x2_t)vtrn2_s16(v18, v19);
  v21 = (int32x2_t)vtrn1_s16(*(int16x4_t *)v17.i8, *(int16x4_t *)v13.i8);
  *(int16x4_t *)v17.i8 = vtrn2_s16(*(int16x4_t *)v17.i8, *(int16x4_t *)v13.i8);
  *(int32x2_t *)v13.i8 = vzip1_s32(*(int32x2_t *)v8.i8, v21);
  v22 = (int16x4_t)vzip2_s32(*(int32x2_t *)v8.i8, v21);
  v23 = vaddl_s16(*(int16x4_t *)v13.i8, v22);
  *(int32x2_t *)v15.i8 = vzip2_s32(v20, *(int32x2_t *)v17.i8);
  v24 = vaddl_s16(v22, *(int16x4_t *)v15.i8);
  v25 = vsubl_s16(*(int16x4_t *)v13.i8, *(int16x4_t *)v15.i8);
  *(int32x2_t *)v17.i8 = vzip1_s32(v20, *(int32x2_t *)v17.i8);
  v26 = vmlaq_s32(vmlal_s16(vmulq_s32(v24, v11), *(int16x4_t *)v17.i8, (int16x4_t)0x4A004A004A004ALL), v23, v10);
  v27 = vmlaq_s32(vmlsl_s16(vmulq_s32(v25, v10), *(int16x4_t *)v17.i8, (int16x4_t)0x4A004A004A004ALL), v23, v11);
  v28 = vmlaq_s32(vmlal_s16(vmulq_s32(v25, v11), *(int16x4_t *)v17.i8, (int16x4_t)0x4A004A004A004ALL), v24, v14);
  v29 = vmulq_s32(vaddw_s16(vsubl_s16(*(int16x4_t *)v13.i8, v22), *(int16x4_t *)v15.i8), v16);
  *(int16x4_t *)v16.i8 = vqrshrn_n_s32(v26, 9uLL);
  *(int16x4_t *)v26.i8 = vqrshrn_n_s32(v28, 9uLL);
  v30 = vqrshrn_n_s32(v29, 9uLL);
  *(int16x4_t *)v13.i8 = vqrshrn_n_s32(v27, 9uLL);
  vst4_s16((__int16 *)a3, *(int16x4x4_t *)((char *)&v13 - 24));
  v31 = (uint64_t *)((char *)a1 + 2 * a2);
  v29.i64[0] = *a1;
  v29.i64[1] = *v31;
  v32 = (uint64_t *)((char *)a1 + 6 * a2);
  v16.i64[0] = *(uint64_t *)((char *)a1 + 4 * a2);
  v16.i64[1] = *v32;
  v33 = *(int16x8_t *)a3[2].i8;
  v26.i64[0] = 0xF800F800F800F800;
  v26.i64[1] = 0xF800F800F800F800;
  v34 = vminq_u16(vsqaddq_u16((uint16x8_t)v29, *(int16x8_t *)a3->i8), (uint16x8_t)v26);
  *a1 = v34.i64[0];
  *v31 = v34.i64[1];
  v35 = vminq_u16(vsqaddq_u16((uint16x8_t)v16, v33), (uint16x8_t)v26);
  *(uint64_t *)((char *)a1 + 4 * a2) = v35.i64[0];
  *v32 = v35.i64[1];
  if ((a4 & 1) == 0)
  {
    v35.i64[0] = 0;
    *(_OWORD *)a3->i8 = 0u;
    *(_OWORD *)a3[2].i8 = 0u;
  }
  return *(double *)v35.i64;
}

void sub_1C98201B8(uint64_t *a1, uint64_t a2, int32x4_t *a3, int a4, int a5)
{
  char v5;
  int16x8_t v9;
  uint64_t *v10;
  uint16x8_t v11;
  uint64_t *v12;
  uint16x8_t v13;
  uint16x8_t v14;
  uint16x8_t v15;
  uint16x8_t v16;
  uint64_t *v17;
  uint16x8_t v18;
  uint64_t *v19;
  uint16x8_t v20;
  uint16x8_t v21;
  uint16x8_t v22;
  uint16x8_t v23;

  v5 = a4;
  if (a5 != 1)
  {
    sub_1C98217A0(a3, a5);
    v17 = (uint64_t *)((char *)a1 + 2 * a2);
    v18.i64[0] = *a1;
    v18.i64[1] = *v17;
    v19 = (uint64_t *)((char *)a1 + 6 * a2);
    v20.i64[0] = *(uint64_t *)((char *)a1 + 4 * a2);
    v20.i64[1] = *v19;
    v21.i64[0] = 0xF800F800F800F800;
    v21.i64[1] = 0xF800F800F800F800;
    v22 = vminq_u16(vsqaddq_u16(v18, *(int16x8_t *)a3), v21);
    v23 = vminq_u16(vsqaddq_u16(v20, (int16x8_t)a3[1]), v21);
    *a1 = v22.i64[0];
    *v17 = v22.i64[1];
    *(uint64_t *)((char *)a1 + 4 * a2) = v23.i64[0];
    *v19 = v23.i64[1];
    if ((v5 & 1) != 0)
      return;
    v9 = 0uLL;
    goto LABEL_6;
  }
  v9 = vdupq_n_s16((a3->i16[0] + 9) >> 4);
  a3->i16[0] = 0;
  v10 = (uint64_t *)((char *)a1 + 2 * a2);
  v11.i64[0] = *a1;
  v11.i64[1] = *v10;
  v12 = (uint64_t *)((char *)a1 + 6 * a2);
  v13.i64[0] = *(uint64_t *)((char *)a1 + 4 * a2);
  v13.i64[1] = *v12;
  v14.i64[0] = 0xF800F800F800F800;
  v14.i64[1] = 0xF800F800F800F800;
  v15 = vminq_u16(vsqaddq_u16(v11, v9), v14);
  v16 = vminq_u16(vsqaddq_u16(v13, v9), v14);
  *a1 = v15.i64[0];
  *v10 = v15.i64[1];
  *(uint64_t *)((char *)a1 + 4 * a2) = v16.i64[0];
  *v12 = v16.i64[1];
  if (a4)
  {
LABEL_6:
    *a3 = (int32x4_t)v9;
    a3[1] = (int32x4_t)v9;
  }
}

uint16x8_t *sub_1C98202B0(uint16x8_t *result, uint64_t a2, int16x4_t *a3, int a4, int a5)
{
  int16x8_t *v6;
  uint16x8_t *v8;
  int16x8_t v9;
  uint16x8_t v10;
  uint16x8_t v11;
  uint16x8_t v12;
  uint16x8_t v13;
  uint16x8_t v14;
  uint16x8_t v15;
  uint16x8_t v16;
  uint16x8_t v17;
  unsigned int v18;
  char v19;
  uint16x8_t v20;
  char v21;
  uint16x8_t v22;
  uint16x8_t v23;
  uint16x8_t v24;
  uint16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  int16x8_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int16x8_t v33;
  int16x8_t v34;
  int16x8_t v35;
  int16x8_t v36;
  unsigned int v37;
  int8x16_t v38;

  v6 = (int16x8_t *)a3;
  v8 = result;
  if (a5 == 1)
  {
    v9 = vdupq_n_s16((a3->i16[0] + 9) >> 4);
    a3->i16[0] = 0;
    v10 = *(uint16x8_t *)((char *)result + 14 * a2);
    v11.i64[0] = 0xF800F800F800F800;
    v11.i64[1] = 0xF800F800F800F800;
    v12 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 2 * a2), v9), v11);
    v13 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 4 * a2), v9), v11);
    v14 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 6 * a2), v9), v11);
    v15 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 8 * a2), v9), v11);
    v16 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 10 * a2), v9), v11);
    v17 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 12 * a2), v9), v11);
    *result = vminq_u16(vsqaddq_u16(*result, v9), v11);
    *(uint16x8_t *)((char *)result + 2 * a2) = v12;
    *(uint16x8_t *)((char *)result + 4 * a2) = v13;
    *(uint16x8_t *)((char *)result + 6 * a2) = v14;
    *(uint16x8_t *)((char *)result + 8 * a2) = v15;
    *(uint16x8_t *)((char *)result + 10 * a2) = v16;
    *(uint16x8_t *)((char *)result + 12 * a2) = v17;
    *(uint16x8_t *)((char *)result + 14 * a2) = vminq_u16(vsqaddq_u16(v10, v9), v11);
    if (a4)
    {
      v18 = -16;
      do
      {
        *v6 = v9;
        v6[1] = v9;
        v6 += 2;
        v18 += 16;
      }
      while (v18 < 0x30);
    }
  }
  else
  {
    result = (uint16x8_t *)sub_1C9821698(a3, a5);
    v19 = 1;
    v20.i64[0] = 0xF800F800F800F800;
    v20.i64[1] = 0xF800F800F800F800;
    do
    {
      v21 = v19;
      v22 = *v8;
      v23 = *(uint16x8_t *)((char *)v8 + 2 * a2);
      v24 = *(uint16x8_t *)((char *)v8 + 4 * a2);
      v25 = *(uint16x8_t *)((char *)v8 + 6 * a2);
      v26 = v6[1];
      v27 = v6[2];
      v28 = v6[3];
      v29 = (int32x4_t)vtrn1q_s16(*v6, v26);
      v30 = (int32x4_t)vtrn2q_s16(*v6, v26);
      v31 = (int32x4_t)vtrn1q_s16(v27, v28);
      v32 = (int32x4_t)vtrn2q_s16(v27, v28);
      v33 = (int16x8_t)vtrn1q_s32(v29, v31);
      v34 = (int16x8_t)vtrn2q_s32(v29, v31);
      v35 = (int16x8_t)vtrn1q_s32(v30, v32);
      v36 = (int16x8_t)vtrn2q_s32(v30, v32);
      if (a4)
        v37 = -1;
      else
        v37 = 0;
      v38 = (int8x16_t)vdupq_n_s16(v37);
      *(int8x16_t *)v6 = vandq_s8((int8x16_t)v33, v38);
      v6[1] = (int16x8_t)vandq_s8((int8x16_t)v35, v38);
      v6[2] = (int16x8_t)vandq_s8((int8x16_t)v34, v38);
      v6[3] = (int16x8_t)vandq_s8((int8x16_t)v36, v38);
      *v8 = vminq_u16(vsqaddq_u16(v22, v33), v20);
      *(uint16x8_t *)((char *)v8 + 2 * a2) = vminq_u16(vsqaddq_u16(v23, v35), v20);
      *(uint16x8_t *)((char *)v8 + 4 * a2) = vminq_u16(vsqaddq_u16(v24, v34), v20);
      *(uint16x8_t *)((char *)v8 + 6 * a2) = vminq_u16(vsqaddq_u16(v25, v36), v20);
      v8 = (uint16x8_t *)((char *)v8 + 8 * a2);
      v6 += 4;
      v19 = 0;
    }
    while ((v21 & 1) != 0);
  }
  return result;
}

int16x4_t *sub_1C9820490(int16x4_t *result, uint64_t a2, int16x4_t *a3, int a4, int a5)
{
  _OWORD *v6;
  uint16x8_t *v8;
  int16x8_t v9;
  uint64_t v10;
  unsigned int v11;
  uint16x8_t v12;
  uint16x8_t *v13;
  uint16x8_t v14;
  uint16x8_t v15;
  uint16x8_t v16;
  unsigned int v17;
  uint64_t v18;
  char v19;
  uint16x8_t v20;
  char v21;
  uint16x8_t *v22;
  unsigned int v23;
  int16x8_t *v24;
  uint16x8_t v25;
  uint16x8_t v26;
  uint16x8_t v27;
  uint16x8_t v28;
  int16x8_t v29;
  int16x8_t v30;
  int16x8_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int32x4_t v34;
  int32x4_t v35;
  int16x8_t v36;
  int16x8_t v37;
  int16x8_t v38;
  int16x8_t v39;
  unsigned int v40;
  int8x16_t v41;

  v6 = a3;
  v8 = (uint16x8_t *)result;
  if (a5 == 1)
  {
    v9 = vdupq_n_s16((a3->i16[0] + 9) >> 4);
    a3->i16[0] = 0;
    v10 = 2 * a2;
    v11 = -2;
    v12.i64[0] = 0xF800F800F800F800;
    v12.i64[1] = 0xF800F800F800F800;
    do
    {
      v13 = (uint16x8_t *)((char *)v8 + v10);
      v14 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v8 + 2 * a2), v9), v12);
      v15 = vminq_u16(vsqaddq_u16(v8[1], v9), v12);
      v16 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v8[1] + v10), v9), v12);
      *v8 = vminq_u16(vsqaddq_u16(*v8, v9), v12);
      *v13 = v14;
      v8[1] = v15;
      v13[1] = v16;
      v8 = (uint16x8_t *)((char *)v8 + 4 * a2);
      v11 += 2;
    }
    while (v11 < 0xE);
    if (a4)
    {
      v17 = -16;
      do
      {
        *v6 = v9;
        v6[1] = v9;
        v6 += 2;
        v17 += 16;
      }
      while (v17 < 0xF0);
    }
  }
  else
  {
    result = sub_1C98214BC(a3, a5);
    v18 = 0;
    v19 = 1;
    v20.i64[0] = 0xF800F800F800F800;
    v20.i64[1] = 0xF800F800F800F800;
    do
    {
      v21 = v19;
      v22 = &v8[v18];
      v23 = -4;
      v24 = (int16x8_t *)&v6[v18];
      do
      {
        v25 = *(uint16x8_t *)((char *)v22 + 2 * a2);
        v26 = *v22;
        v27 = *(uint16x8_t *)((char *)v22 + 4 * a2);
        v28 = *(uint16x8_t *)((char *)v22 + 6 * a2);
        v29 = v24[2];
        v30 = v24[4];
        v31 = v24[6];
        v32 = (int32x4_t)vtrn1q_s16(*v24, v29);
        v33 = (int32x4_t)vtrn2q_s16(*v24, v29);
        v34 = (int32x4_t)vtrn1q_s16(v30, v31);
        v35 = (int32x4_t)vtrn2q_s16(v30, v31);
        v36 = (int16x8_t)vtrn1q_s32(v32, v34);
        v37 = (int16x8_t)vtrn2q_s32(v32, v34);
        v38 = (int16x8_t)vtrn1q_s32(v33, v35);
        v39 = (int16x8_t)vtrn2q_s32(v33, v35);
        if (a4)
          v40 = -1;
        else
          v40 = 0;
        v41 = (int8x16_t)vdupq_n_s16(v40);
        *(int8x16_t *)v24 = vandq_s8((int8x16_t)v36, v41);
        v24[2] = (int16x8_t)vandq_s8((int8x16_t)v38, v41);
        v24[4] = (int16x8_t)vandq_s8((int8x16_t)v37, v41);
        v24[6] = (int16x8_t)vandq_s8((int8x16_t)v39, v41);
        *v22 = vminq_u16(vsqaddq_u16(v26, v36), v20);
        *(uint16x8_t *)((char *)v22 + 2 * a2) = vminq_u16(vsqaddq_u16(v25, v38), v20);
        *(uint16x8_t *)((char *)v22 + 4 * a2) = vminq_u16(vsqaddq_u16(v27, v37), v20);
        *(uint16x8_t *)((char *)v22 + 6 * a2) = vminq_u16(vsqaddq_u16(v28, v39), v20);
        v22 = (uint16x8_t *)((char *)v22 + 8 * a2);
        v23 += 4;
        v24 += 8;
      }
      while (v23 < 0xC);
      v19 = 0;
      v18 = 1;
    }
    while ((v21 & 1) != 0);
  }
  return result;
}

uint16x8_t *sub_1C982064C(uint16x8_t *result, uint64_t a2, int16x4_t *a3, int a4, int a5)
{
  _OWORD *v6;
  uint16x8_t *v8;
  int16x8_t v9;
  uint16x8_t *v10;
  int v11;
  uint16x8_t v12;
  uint16x8_t v13;
  uint16x8_t v14;
  uint16x8_t v15;
  unsigned int v16;
  unint64_t v17;
  uint16x8_t v18;
  int16x8_t *v19;
  unsigned int v20;
  uint16x8_t *v21;
  uint16x8_t v22;
  uint16x8_t v23;
  uint16x8_t v24;
  uint16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  int16x8_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int16x8_t v33;
  int16x8_t v34;
  int16x8_t v35;
  int16x8_t v36;
  unsigned int v37;
  int8x16_t v38;

  v6 = a3;
  v8 = result;
  if (a5 == 1)
  {
    v9 = vdupq_n_s16((a3->i16[0] + 9) >> 4);
    a3->i16[0] = 0;
    v10 = result + 2;
    v11 = 32;
    v12.i64[0] = 0xF800F800F800F800;
    v12.i64[1] = 0xF800F800F800F800;
    do
    {
      v13 = vminq_u16(vsqaddq_u16(v10[-1], v9), v12);
      v14 = vminq_u16(vsqaddq_u16(*v10, v9), v12);
      v15 = vminq_u16(vsqaddq_u16(v10[1], v9), v12);
      v10[-2] = vminq_u16(vsqaddq_u16(v10[-2], v9), v12);
      v10[-1] = v13;
      *v10 = v14;
      v10[1] = v15;
      v10 = (uint16x8_t *)((char *)v10 + 2 * a2);
      --v11;
    }
    while (v11);
    if (a4)
    {
      v16 = -16;
      do
      {
        *v6 = v9;
        v6[1] = v9;
        v6 += 2;
        v16 += 16;
      }
      while (v16 < 0x3F0);
    }
  }
  else
  {
    result = (uint16x8_t *)sub_1C9820B94(a3, a5);
    v17 = 0;
    v18.i64[0] = 0xF800F800F800F800;
    v18.i64[1] = 0xF800F800F800F800;
    do
    {
      v19 = (int16x8_t *)&v6[v17];
      v20 = -4;
      v21 = v8;
      do
      {
        v22 = *(uint16x8_t *)((char *)v21 + 2 * a2);
        v23 = *v21;
        v24 = *(uint16x8_t *)((char *)v21 + 4 * a2);
        v25 = *(uint16x8_t *)((char *)v21 + 6 * a2);
        v26 = v19[4];
        v27 = v19[8];
        v28 = v19[12];
        v29 = (int32x4_t)vtrn1q_s16(*v19, v26);
        v30 = (int32x4_t)vtrn2q_s16(*v19, v26);
        v31 = (int32x4_t)vtrn1q_s16(v27, v28);
        v32 = (int32x4_t)vtrn2q_s16(v27, v28);
        v33 = (int16x8_t)vtrn1q_s32(v29, v31);
        v34 = (int16x8_t)vtrn2q_s32(v29, v31);
        v35 = (int16x8_t)vtrn1q_s32(v30, v32);
        v36 = (int16x8_t)vtrn2q_s32(v30, v32);
        if (a4)
          v37 = -1;
        else
          v37 = 0;
        v38 = (int8x16_t)vdupq_n_s16(v37);
        *(int8x16_t *)v19 = vandq_s8((int8x16_t)v33, v38);
        v19[4] = (int16x8_t)vandq_s8((int8x16_t)v35, v38);
        v19[8] = (int16x8_t)vandq_s8((int8x16_t)v34, v38);
        v19[12] = (int16x8_t)vandq_s8((int8x16_t)v36, v38);
        *v21 = vminq_u16(vsqaddq_u16(v23, v33), v18);
        *(uint16x8_t *)((char *)v21 + 2 * a2) = vminq_u16(vsqaddq_u16(v22, v35), v18);
        *(uint16x8_t *)((char *)v21 + 4 * a2) = vminq_u16(vsqaddq_u16(v24, v34), v18);
        *(uint16x8_t *)((char *)v21 + 6 * a2) = vminq_u16(vsqaddq_u16(v25, v36), v18);
        v21 = (uint16x8_t *)((char *)v21 + 8 * a2);
        v20 += 4;
        v19 += 16;
      }
      while (v20 < 0x1C);
      ++v8;
    }
    while (v17++ < 3);
  }
  return result;
}

int16x8_t sub_1C98207F8(int16x8_t *a1)
{
  int16x8_t result;
  int16x8_t v2;

  result = vshlq_n_s16(*a1, 2uLL);
  v2 = vshlq_n_s16(a1[1], 2uLL);
  *a1 = result;
  a1[1] = v2;
  return result;
}

int16x8_t sub_1C982080C(int16x8_t *a1)
{
  int16x8_t result;
  int16x8_t v2;

  result = vrshrq_n_s16(*a1, 2uLL);
  v2 = vrshrq_n_s16(a1[1], 2uLL);
  *a1 = result;
  a1[1] = v2;
  return result;
}

int16x8_t *sub_1C9820820(int16x8_t *result)
{
  unsigned int v1;
  int16x8_t v2;

  v1 = -16;
  do
  {
    v2 = vrshrq_n_s16(result[1], 1uLL);
    *result = vrshrq_n_s16(*result, 1uLL);
    result[1] = v2;
    result += 2;
    v1 += 16;
  }
  while (v1 < 0x30);
  return result;
}

double sub_1C9820844(uint64_t *a1, uint64_t a2, int16x8_t *a3, char a4)
{
  uint64_t *v4;
  uint16x8_t v5;
  uint64_t *v6;
  uint16x8_t v7;
  int16x8_t v8;
  uint16x8_t v9;
  uint16x8_t v10;
  uint16x8_t v11;

  v4 = (uint64_t *)((char *)a1 + 2 * a2);
  v5.i64[0] = *a1;
  v5.i64[1] = *v4;
  v6 = (uint64_t *)((char *)a1 + 6 * a2);
  v7.i64[0] = *(uint64_t *)((char *)a1 + 4 * a2);
  v7.i64[1] = *v6;
  v8 = a3[1];
  v9.i64[0] = 0xF800F800F800F800;
  v9.i64[1] = 0xF800F800F800F800;
  v10 = vminq_u16(vsqaddq_u16(v5, *a3), v9);
  *a1 = v10.i64[0];
  *v4 = v10.i64[1];
  v11 = vminq_u16(vsqaddq_u16(v7, v8), v9);
  *(uint64_t *)((char *)a1 + 4 * a2) = v11.i64[0];
  *v6 = v11.i64[1];
  if ((a4 & 1) == 0)
  {
    v11.i64[0] = 0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return *(double *)v11.i64;
}

uint64_t sub_1C982089C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t (*v4)(void);

  if (a4)
    v4 = (uint64_t (*)(void))sub_1C9820A90;
  else
    v4 = (uint64_t (*)(void))sub_1C9820B0C;
  return v4();
}

uint64_t sub_1C98208B8(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t (*v4)(void);

  if (a4)
    v4 = (uint64_t (*)(void))sub_1C98209BC;
  else
    v4 = (uint64_t (*)(void))sub_1C9820A20;
  return v4();
}

uint64_t sub_1C98208D4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t (*v4)(void);

  if (a4)
    v4 = (uint64_t (*)(void))sub_1C98208F0;
  else
    v4 = (uint64_t (*)(void))sub_1C9820950;
  return v4();
}

uint16x8_t *sub_1C98208F0(uint16x8_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint16x8_t *v4;
  uint16x8_t v5;
  uint16x8_t v6;
  uint16x8_t v7;
  uint16x8_t v8;

  v3 = 0;
  v4 = result + 2;
  v5.i64[0] = 0xF800F800F800F800;
  v5.i64[1] = 0xF800F800F800F800;
  do
  {
    v6 = vminq_u16(vsqaddq_u16(v4[-1], *(int16x8_t *)(a3 + v3 + 16)), v5);
    v7 = vminq_u16(vsqaddq_u16(*v4, *(int16x8_t *)(a3 + v3 + 32)), v5);
    v8 = vminq_u16(vsqaddq_u16(v4[1], *(int16x8_t *)(a3 + v3 + 48)), v5);
    v4[-2] = vminq_u16(vsqaddq_u16(v4[-2], *(int16x8_t *)(a3 + v3)), v5);
    v4[-1] = v6;
    *v4 = v7;
    v4[1] = v8;
    v3 += 64;
    v4 = (uint16x8_t *)((char *)v4 + 2 * a2);
  }
  while ((_DWORD)v3 != 2048);
  return result;
}

uint16x8_t *sub_1C9820950(uint16x8_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint16x8_t *v4;
  uint16x8_t v5;
  _OWORD *v6;
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  int16x8_t v10;
  uint16x8_t v11;
  uint16x8_t v12;
  uint16x8_t v13;

  v3 = 0;
  v4 = result + 2;
  v5.i64[0] = 0xF800F800F800F800;
  v5.i64[1] = 0xF800F800F800F800;
  do
  {
    v6 = (_OWORD *)(a3 + v3);
    v7 = *(int16x8_t *)(a3 + v3);
    v8 = *(int16x8_t *)(a3 + v3 + 16);
    v9 = *(int16x8_t *)(a3 + v3 + 32);
    v10 = *(int16x8_t *)(a3 + v3 + 48);
    *v6 = 0uLL;
    v6[1] = 0uLL;
    v6[2] = 0uLL;
    v6[3] = 0uLL;
    v11 = vminq_u16(vsqaddq_u16(v4[-1], v8), v5);
    v12 = vminq_u16(vsqaddq_u16(*v4, v9), v5);
    v13 = vminq_u16(vsqaddq_u16(v4[1], v10), v5);
    v4[-2] = vminq_u16(vsqaddq_u16(v4[-2], v7), v5);
    v4[-1] = v11;
    *v4 = v12;
    v4[1] = v13;
    v3 += 64;
    v4 = (uint16x8_t *)((char *)v4 + 2 * a2);
  }
  while ((_DWORD)v3 != 2048);
  return result;
}

uint16x8_t *sub_1C98209BC(uint16x8_t *result, uint64_t a2, int16x8_t *a3)
{
  uint64_t v3;
  unsigned int v4;
  uint16x8_t v5;
  uint16x8_t *v6;
  uint16x8_t v7;
  uint16x8_t v8;
  uint16x8_t v9;

  v3 = 2 * a2;
  v4 = -2;
  v5.i64[0] = 0xF800F800F800F800;
  v5.i64[1] = 0xF800F800F800F800;
  do
  {
    v6 = (uint16x8_t *)((char *)result + v3);
    v7 = vminq_u16(vsqaddq_u16(result[1], a3[1]), v5);
    v8 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 2 * a2), a3[2]), v5);
    v9 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&result[1] + v3), a3[3]), v5);
    *result = vminq_u16(vsqaddq_u16(*result, *a3), v5);
    result[1] = v7;
    *v6 = v8;
    v6[1] = v9;
    v4 += 2;
    result = (uint16x8_t *)((char *)result + 4 * a2);
    a3 += 4;
  }
  while (v4 < 0xE);
  return result;
}

uint16x8_t *sub_1C9820A20(uint16x8_t *result, uint64_t a2, int16x8_t *a3)
{
  uint64_t v3;
  unsigned int v4;
  uint16x8_t v5;
  int16x8_t v6;
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  uint16x8_t *v10;
  uint16x8_t v11;
  uint16x8_t v12;
  uint16x8_t v13;

  v3 = 2 * a2;
  v4 = -2;
  v5.i64[0] = 0xF800F800F800F800;
  v5.i64[1] = 0xF800F800F800F800;
  do
  {
    v6 = *a3;
    v7 = a3[1];
    v8 = a3[2];
    v9 = a3[3];
    *a3 = 0uLL;
    a3[1] = 0uLL;
    a3[2] = 0uLL;
    a3[3] = 0uLL;
    v10 = (uint16x8_t *)((char *)result + v3);
    v11 = vminq_u16(vsqaddq_u16(result[1], v7), v5);
    v12 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 2 * a2), v8), v5);
    v13 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&result[1] + v3), v9), v5);
    *result = vminq_u16(vsqaddq_u16(*result, v6), v5);
    result[1] = v11;
    *v10 = v12;
    v10[1] = v13;
    v4 += 2;
    result = (uint16x8_t *)((char *)result + 4 * a2);
    a3 += 4;
  }
  while (v4 < 0xE);
  return result;
}

uint16x8_t *sub_1C9820A90(uint16x8_t *result, uint64_t a2, int16x8_t *a3)
{
  char v3;
  uint16x8_t v4;
  char v5;
  uint16x8_t v6;
  uint16x8_t v7;
  uint16x8_t v8;

  v3 = 1;
  v4.i64[0] = 0xF800F800F800F800;
  v4.i64[1] = 0xF800F800F800F800;
  do
  {
    v5 = v3;
    v6 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 2 * a2), a3[1]), v4);
    v7 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 4 * a2), a3[2]), v4);
    v8 = vsqaddq_u16(*(uint16x8_t *)((char *)result + 6 * a2), a3[3]);
    *result = vminq_u16(vsqaddq_u16(*result, *a3), v4);
    *(uint16x8_t *)((char *)result + 2 * a2) = v6;
    *(uint16x8_t *)((char *)result + 4 * a2) = v7;
    *(uint16x8_t *)((char *)result + 6 * a2) = vminq_u16(v8, v4);
    result = (uint16x8_t *)((char *)result + 8 * a2);
    a3 += 4;
    v3 = 0;
  }
  while ((v5 & 1) != 0);
  return result;
}

uint16x8_t *sub_1C9820B0C(uint16x8_t *result, uint64_t a2, int16x8_t *a3)
{
  char v3;
  uint16x8_t v4;
  char v5;
  int16x8_t v6;
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  uint16x8_t v10;
  uint16x8_t v11;
  uint16x8_t v12;

  v3 = 1;
  v4.i64[0] = 0xF800F800F800F800;
  v4.i64[1] = 0xF800F800F800F800;
  do
  {
    v5 = v3;
    v6 = *a3;
    v7 = a3[1];
    v8 = a3[2];
    v9 = a3[3];
    *a3 = 0uLL;
    a3[1] = 0uLL;
    a3[2] = 0uLL;
    a3[3] = 0uLL;
    v10 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 2 * a2), v7), v4);
    v11 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 4 * a2), v8), v4);
    v12 = vsqaddq_u16(*(uint16x8_t *)((char *)result + 6 * a2), v9);
    *result = vminq_u16(vsqaddq_u16(*result, v6), v4);
    *(uint16x8_t *)((char *)result + 2 * a2) = v10;
    *(uint16x8_t *)((char *)result + 4 * a2) = v11;
    *(uint16x8_t *)((char *)result + 6 * a2) = vminq_u16(v12, v4);
    result = (uint16x8_t *)((char *)result + 8 * a2);
    a3 += 4;
    v3 = 0;
  }
  while ((v5 & 1) != 0);
  return result;
}

void *sub_1C9820B94(int16x4_t *a1, int a2)
{
  int16x4_t *v2;
  unint64_t v4;
  int16x4_t *v5;
  unint64_t v6;
  int16x4_t *v7;
  unint64_t v8;
  void *result;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v2 = a1;
  if (a2 <= 16)
  {
    sub_1C970AB50(a1, 0x20u, (uint64_t)&unk_1C9861500);
LABEL_12:
    v8 = -4;
    do
    {
      result = sub_1C9820D8C(v2, 0x20u, (uint64_t)&unk_1C9861510);
      v8 += 4;
      v2 += 32;
    }
    while (v8 < 0x1C);
    return result;
  }
  if (a2 > 0x30)
  {
    if (a2 >= 0xA1)
    {
      v6 = -4;
      v7 = a1;
      do
      {
        sub_1C970FD18(v7);
        v6 += 4;
        ++v7;
      }
      while (v6 < 0x1C);
    }
    else
    {
      v4 = -4;
      v5 = a1;
      do
      {
        sub_1C970B648(v5, 0x20u, (uint64_t)&unk_1C9861540, (int16x4_t *)aZwpf, (int16x4_t *)aZzxurnic6);
        v4 += 4;
        ++v5;
      }
      while (v4 < 0xC);
    }
  }
  else
  {
    sub_1C970AC1C(a1, 0x20u, (uint64_t)&unk_1C9861520, (int16x4_t *)aZzxu);
    sub_1C970AC1C(v2 + 1, 0x20u, (uint64_t)&unk_1C9861520, (int16x4_t *)aZzxu);
  }
  if (a2 <= 32)
    goto LABEL_12;
  if (a2 > 0x50)
  {
    if (a2 >= 0xE1)
    {
      v12 = -4;
      do
      {
        result = sub_1C9821208(v2);
        v12 += 4;
        v2 += 32;
      }
      while (v12 < 0x1C);
    }
    else
    {
      v11 = -4;
      do
      {
        result = sub_1C9821000((int16x8_t *)v2, 0x20u, (uint64_t)&unk_1C9861550, (int16x4_t *)aZwpf, (int16x4_t *)aZzxurnic6);
        v11 += 4;
        v2 += 32;
      }
      while (v11 < 0x1C);
    }
  }
  else
  {
    v10 = -4;
    do
    {
      result = sub_1C9820E6C((int16x8_t *)v2, 0x20u, (uint64_t)&unk_1C9861530, (int16x4_t *)aZzxu);
      v10 += 4;
      v2 += 32;
    }
    while (v10 < 0x1C);
  }
  return result;
}

int16x4_t *sub_1C9820D8C(int16x4_t *result, unsigned int a2, uint64_t a3)
{
  unsigned int v3;
  int16x8_t *v4;
  int16x4_t v5;
  int16x4_t v6;
  int16x4_t v7;
  int32x2_t v8;
  int32x2_t v9;
  int32x4_t v10;
  uint64_t v11;
  int32x2_t v12;
  int32x2_t v13;
  int16x4_t v14;
  int16x4_t v15;
  int16x4_t v16;
  unsigned __int8 *v17;
  int16x8_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int v23;

  v3 = a2 - 1;
  v4 = (int16x8_t *)((char *)&unk_1C9861310 + 4 * a2);
  v5 = *(int16x4_t *)((char *)result + 2 * a2);
  v6 = *(int16x4_t *)((char *)result + 4 * a2);
  v7 = *(int16x4_t *)((char *)result + 6 * a2);
  v8 = (int32x2_t)vtrn1_s16(*result, v5);
  v9 = (int32x2_t)vtrn1_s16(v6, v7);
  v10 = vshll_n_s16((int16x4_t)vzip1_s32(v8, v9), 6uLL);
  v11 = a2 >> 2;
  v12 = (int32x2_t)vtrn2_s16(*result, v5);
  v13 = (int32x2_t)vtrn2_s16(v6, v7);
  v14 = (int16x4_t)vzip2_s32(v8, v9);
  v15 = (int16x4_t)vzip1_s32(v12, v13);
  v16 = (int16x4_t)vzip2_s32(v12, v13);
  v17 = (unsigned __int8 *)(a3 + 1);
  do
  {
    v18 = *v4++;
    v19 = vmlal_laneq_s16(v10, v14, v18, 4);
    v20 = vmlsl_laneq_s16(v10, v14, v18, 4);
    v21 = vmlal_lane_s16(vmull_lane_s16(v16, *(int16x4_t *)v18.i8, 1), v15, *(int16x4_t *)v18.i8, 0);
    v22 = vmlal_lane_s16(vmull_lane_s16(v16, *(int16x4_t *)v18.i8, 3), v15, *(int16x4_t *)v18.i8, 2);
    v23 = *(v17 - 1);
    v18.i32[0] = *v17;
    v17 += 2;
    result[v23] = vqrshrn_n_s32(vaddq_s32(v21, v19), 9uLL);
    result[v18.u32[0]] = vqrshrn_n_s32(vaddq_s32(v22, v20), 9uLL);
    *(int16x4_t *)((char *)result + 2 * (int)(4 * (v3 - v23))) = vqrshrn_n_s32(vsubq_s32(v19, v21), 9uLL);
    *(int16x4_t *)((char *)result + 2 * (int)(4 * (v3 - v18.i32[0]))) = vqrshrn_n_s32(vsubq_s32(v20, v22), 9uLL);
    --v11;
  }
  while (v11);
  return result;
}

int16x8_t *sub_1C9820E6C(int16x8_t *result, unsigned int a2, uint64_t a3, int16x4_t *a4)
{
  unsigned int v4;
  int16x8_t *v5;
  int16x8_t v6;
  int16x8_t v7;
  int16x8_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  int16x8_t v16;
  int32x4_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  int16x8_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int16x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int v31;
  int v32;
  int v33;
  int32x4_t v34;
  int32x4_t v35;
  int32x4_t v36;

  v4 = a2 - 1;
  v5 = (int16x8_t *)((char *)&unk_1C9861310 + 2 * a2);
  v6 = *(int16x8_t *)((char *)result + 4 * a2);
  v7 = *(int16x8_t *)((char *)result + 2 * a2);
  v8 = *(int16x8_t *)((char *)result + 6 * a2);
  v9 = (int32x4_t)vtrn1q_s16(*result, v7);
  v10 = (int32x4_t)vtrn2q_s16(*result, v7);
  v11 = (int32x4_t)vtrn1q_s16(v6, v8);
  v12 = (int32x4_t)vtrn2q_s16(v6, v8);
  v13 = (int16x8_t)vtrn1q_s32(v9, v11);
  v14 = (int16x8_t)vtrn2q_s32(v9, v11);
  v15 = (int16x8_t)vtrn1q_s32(v10, v12);
  v16 = (int16x8_t)vtrn2q_s32(v10, v12);
  v17 = vshll_n_s16(*(int16x4_t *)v13.i8, 6uLL);
  v18 = a2 >> 3;
  v19 = (unsigned __int8 *)(a3 + 3);
  do
  {
    v20 = *v5++;
    v21 = vmlal_high_laneq_s16(v17, v13, v20, 4);
    v22 = vmlsl_high_laneq_s16(v17, v13, v20, 4);
    v23 = vmlal_high_lane_s16(vmull_lane_s16(*(int16x4_t *)v14.i8, *(int16x4_t *)v20.i8, 0), v14, *(int16x4_t *)v20.i8, 1);
    v24 = vmlal_high_lane_s16(vmull_lane_s16(*(int16x4_t *)v14.i8, *(int16x4_t *)v20.i8, 2), v14, *(int16x4_t *)v20.i8, 3);
    v25 = vmlal_high_lane_s16(vmlal_high_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v16.i8, *a4, 1), *(int16x4_t *)v15.i8, *a4, 0), v15, *a4, 2), v16, *a4, 3);
    v26 = vmlal_high_lane_s16(vmlal_high_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v16.i8, a4[1], 1), *(int16x4_t *)v15.i8, a4[1], 0), v15, a4[1], 2), v16, a4[1], 3);
    v27 = a4[3];
    v28 = vmlal_high_lane_s16(vmlal_high_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v16.i8, a4[2], 1), *(int16x4_t *)v15.i8, a4[2], 0), v15, a4[2], 2), v16, a4[2], 3);
    v29 = vaddq_s32(v23, v21);
    v30 = vsubq_s32(v21, v23);
    v31 = *(v19 - 3);
    v32 = *(v19 - 2);
    v33 = *(v19 - 1);
    v20.i32[0] = *v19;
    v19 += 4;
    *(int16x4_t *)&result->i8[8 * v31] = vqrshrn_n_s32(vaddq_s32(v25, v29), 9uLL);
    v34 = vaddq_s32(v24, v22);
    v35 = vsubq_s32(v22, v24);
    *(int16x4_t *)&result->i8[8 * v32] = vqrshrn_n_s32(vaddq_s32(v26, v30), 9uLL);
    v36 = vmlal_high_lane_s16(vmlal_high_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v16.i8, v27, 1), *(int16x4_t *)v15.i8, v27, 0), v15, v27, 2), v16, v27, 3);
    *(int16x4_t *)&result->i8[8 * v33] = vqrshrn_n_s32(vaddq_s32(v28, v34), 9uLL);
    *(int16x4_t *)&result->i8[8 * v20.u32[0]] = vqrshrn_n_s32(vaddq_s32(v36, v35), 9uLL);
    *(int16x4_t *)&result->i8[8 * (v4 - v31)] = vqrshrn_n_s32(vsubq_s32(v29, v25), 9uLL);
    *(int16x4_t *)&result->i8[8 * (v4 - v32)] = vqrshrn_n_s32(vsubq_s32(v30, v26), 9uLL);
    *(int16x4_t *)&result->i8[8 * (v4 - v33)] = vqrshrn_n_s32(vsubq_s32(v34, v28), 9uLL);
    *(int16x4_t *)&result->i8[8 * (v4 - v20.i32[0])] = vqrshrn_n_s32(vsubq_s32(v35, v36), 9uLL);
    a4 += 4;
    --v18;
  }
  while (v18);
  return result;
}

int16x8_t *sub_1C9821000(int16x8_t *result, unsigned int a2, uint64_t a3, int16x4_t *a4, int16x4_t *a5)
{
  int16x8_t *v5;
  int16x8_t *v6;
  int16x8_t *v7;
  int16x8_t v8;
  int16x8_t v9;
  int16x8_t v10;
  int16x8_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int16x8_t v16;
  int16x8_t v17;
  int16x8_t v18;
  int16x8_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int16x8_t v24;
  int16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  uint64_t v28;
  int16x8_t *v29;
  int32x4_t v30;
  uint64_t v31;
  int32x4_t *v32;
  int16x8_t v33;
  int32x4_t v34;
  int32x4_t v35;
  int32x4_t v36;
  int32x4_t v37;
  int32x4_t v38;
  int32x4_t v39;
  int16x4_t v40;
  int32x4_t v41;
  int32x4_t v42;
  int32x4_t v43;
  int32x4_t v44;
  int32x4_t v45;
  int32x4_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int32x4_t v50;
  int32x4_t v51;
  int v52;
  _OWORD v53[16];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = (int16x8_t *)((char *)result + 2 * a2);
  v6 = (int16x8_t *)((char *)result + 4 * a2);
  v7 = (int16x8_t *)((char *)result + 6 * a2);
  v8 = result[1];
  v9 = v5[1];
  v10 = v6[1];
  v11 = v7[1];
  v12 = (int32x4_t)vtrn1q_s16(*result, *v5);
  v13 = (int32x4_t)vtrn2q_s16(*result, *v5);
  v14 = (int32x4_t)vtrn1q_s16(*v6, *v7);
  v15 = (int32x4_t)vtrn2q_s16(*v6, *v7);
  v16 = (int16x8_t)vtrn1q_s32(v12, v14);
  v17 = (int16x8_t)vtrn2q_s32(v12, v14);
  v18 = (int16x8_t)vtrn1q_s32(v13, v15);
  v19 = (int16x8_t)vtrn2q_s32(v13, v15);
  v20 = (int32x4_t)vtrn1q_s16(v8, v9);
  v21 = (int32x4_t)vtrn2q_s16(v8, v9);
  v22 = (int32x4_t)vtrn1q_s16(v10, v11);
  v23 = (int32x4_t)vtrn2q_s16(v10, v11);
  v24 = (int16x8_t)vtrn1q_s32(v20, v22);
  v25 = (int16x8_t)vtrn2q_s32(v20, v22);
  v26 = (int16x8_t)vtrn1q_s32(v21, v23);
  v27 = (int16x8_t)vtrn2q_s32(v21, v23);
  v28 = a2 >> 1;
  v29 = (int16x8_t *)((char *)&unk_1C9861310 + 2 * v28);
  v30 = vshll_n_s16(*(int16x4_t *)v16.i8, 6uLL);
  v31 = a2 >> 4;
  v32 = (int32x4_t *)v53;
  do
  {
    v33 = *v29++;
    v34 = vmlal_laneq_s16(v30, *(int16x4_t *)v24.i8, v33, 4);
    v35 = vmlsl_laneq_s16(v30, *(int16x4_t *)v24.i8, v33, 4);
    v36 = vmlal_high_lane_s16(vmull_high_lane_s16(v24, *(int16x4_t *)v33.i8, 1), v16, *(int16x4_t *)v33.i8, 0);
    v37 = vmlal_high_lane_s16(vmull_high_lane_s16(v24, *(int16x4_t *)v33.i8, 3), v16, *(int16x4_t *)v33.i8, 2);
    v38 = vmlal_high_lane_s16(vmlal_lane_s16(vmlal_high_lane_s16(vmull_lane_s16(*(int16x4_t *)v17.i8, *a4, 0), v17, *a4, 1), *(int16x4_t *)v25.i8, *a4, 2), v25, *a4, 3);
    v39 = vmlal_high_lane_s16(vmlal_lane_s16(vmlal_high_lane_s16(vmull_lane_s16(*(int16x4_t *)v17.i8, a4[1], 0), v17, a4[1], 1), *(int16x4_t *)v25.i8, a4[1], 2), v25, a4[1], 3);
    v40 = a4[3];
    v41 = vmlal_high_lane_s16(vmlal_lane_s16(vmlal_high_lane_s16(vmull_lane_s16(*(int16x4_t *)v17.i8, a4[2], 0), v17, a4[2], 1), *(int16x4_t *)v25.i8, a4[2], 2), v25, a4[2], 3);
    v42 = vaddq_s32(v36, v34);
    v43 = vsubq_s32(v34, v36);
    v44 = vaddq_s32(v37, v35);
    v45 = vsubq_s32(v35, v37);
    *v32 = vaddq_s32(v38, v42);
    v32[1] = vaddq_s32(v39, v43);
    v46 = vmlal_high_lane_s16(vmlal_lane_s16(vmlal_high_lane_s16(vmull_lane_s16(*(int16x4_t *)v17.i8, v40, 0), v17, v40, 1), *(int16x4_t *)v25.i8, v40, 2), v25, v40, 3);
    v32[2] = vaddq_s32(v41, v44);
    v32[3] = vaddq_s32(v46, v45);
    v32[4] = vsubq_s32(v42, v38);
    v32[5] = vsubq_s32(v43, v39);
    v32[6] = vsubq_s32(v44, v41);
    v32[7] = vsubq_s32(v45, v46);
    a4 += 4;
    v32 += 8;
    --v31;
  }
  while (v31);
  v47 = 0;
  if (v28 <= 1)
    v48 = 1;
  else
    v48 = v28;
  v49 = 2 * v28;
  do
  {
    v50 = (int32x4_t)v53[v47];
    v51 = vmlal_high_laneq_s16(vmlal_high_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_high_lane_s16(vmlal_high_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v19.i8, *a5, 1), *(int16x4_t *)v18.i8, *a5, 0), v18, *a5, 2), v19, *a5, 3), *(int16x4_t *)v26.i8, *(int16x8_t *)a5->i8, 4), *(int16x4_t *)v27.i8, *(int16x8_t *)a5->i8, 5), v26,
              *(int16x8_t *)a5->i8,
              6),
            v27,
            *(int16x8_t *)a5->i8,
            7);
    v52 = 4 * (~*(unsigned __int8 *)(a3 + v47) + a2);
    *(int16x4_t *)&result->i8[8 * *(unsigned __int8 *)(a3 + v47)] = vqrshrn_n_s32(vaddq_s32(v51, v50), 9uLL);
    *(int16x4_t *)&result->i8[2 * v52] = vqrshrn_n_s32(vsubq_s32(v50, v51), 9uLL);
    ++v47;
    a5 = (int16x4_t *)((char *)a5 + v49);
  }
  while (v48 != v47);
  return result;
}

int16x4_t *sub_1C9821208(int16x4_t *result)
{
  int16x8_t *v1;
  unint64_t v2;
  int16x8_t v3;
  int16x8_t v4;
  int16x8_t v5;
  int32x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  unint64_t v10;
  int16x4_t v11;
  int16x4_t v12;
  int16x4_t v13;
  int16x4_t v14;
  int16x4_t v15;
  int16x4_t v16;
  int16x4_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int16x4_t v31;
  int16x4_t v32;
  int16x4_t v33;
  int16x4_t v34;
  int16x4_t v35;
  int16x4_t v36;
  int16x4_t v37;
  int16x4_t v38;
  int32x4_t *v39;
  int32x4_t v40;
  int16x8_t v41;
  int32x4_t v42;
  uint64_t v43;
  int16x4_t v44;
  int16x4_t v45;
  int16x4_t v46;
  int16x4_t v47;
  int16x4_t v48;
  int16x4_t v49;
  int16x4_t v50;
  int16x4_t v51;
  int16x4_t v52;
  int16x4_t v53;
  int16x4_t v54;
  int16x4_t v55;
  const __int16 *v56;
  int16x4_t v57;
  int16x4_t v58;
  int16x4_t v59;
  int16x4_t v60;
  int16x8_t v61;
  int16x8_t v62;
  int32x4_t v63;
  int32x4_t v64;
  int v65;
  _OWORD v66[16];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v1 = (int16x8_t *)&result[16];
  v2 = -8;
  do
  {
    v3 = v1[-8];
    v4 = v1[-4];
    v5 = v1[4];
    v6 = (int32x4_t)vtrn1q_s16(v3, v4);
    v7 = (int32x4_t)vtrn2q_s16(v3, v4);
    v8 = (int32x4_t)vtrn1q_s16(*v1, v5);
    v9 = (int32x4_t)vtrn2q_s16(*v1, v5);
    v1[-8] = (int16x8_t)vtrn1q_s32(v6, v8);
    v1[-4] = (int16x8_t)vtrn1q_s32(v7, v9);
    *(int32x4_t *)v1 = vtrn2q_s32(v6, v8);
    v1[4] = (int16x8_t)vtrn2q_s32(v7, v9);
    v2 += 8;
    ++v1;
  }
  while (v2 < 0x18);
  v10 = 0;
  v11 = result[1];
  v12 = result[2];
  v13 = result[3];
  v15 = result[4];
  v14 = result[5];
  v16 = result[6];
  v17 = result[7];
  v18 = vshll_n_s16(*result, 6uLL);
  v19 = vmlal_s16(v18, v15, (int16x4_t)0x40004000400040);
  v20 = vmlsl_s16(v18, v15, (int16x4_t)0x40004000400040);
  v21 = vmlal_s16(vmull_s16(v16, (int16x4_t)0x24002400240024), v12, (int16x4_t)0x53005300530053);
  v22 = vmlal_s16(vmull_s16(v16, (int16x4_t)0x52005200520052), v12, (int16x4_t)0x24002400240024);
  v23 = vaddq_s32(v21, v19);
  v24 = vsubq_s32(v19, v21);
  v25 = vaddq_s32(v22, v20);
  v26 = vsubq_s32(v20, v22);
  v27 = vmlal_s16(vmlal_s16(vmlal_s16(vmull_s16(v13, (int16x4_t)0x4B004B004B004BLL), v11, (int16x4_t)0x59005900590059), v14, (int16x4_t)0x32003200320032), v17, (int16x4_t)0x12001200120012);
  v28 = vmlal_s16(vmlal_s16(vmlal_s16(vmull_s16(v13, (int16x4_t)0x31003100310031), v11, (int16x4_t)0x12001200120012), v14, (int16x4_t)0x4B004B004B004BLL), v17, (int16x4_t)0x58005800580058);
  v29 = vmlal_s16(vmlal_s16(vmlal_s16(vmull_s16(v13, (int16x4_t)0x11001100110011), v11, (int16x4_t)0x4B004B004B004BLL), v14, (int16x4_t)0x58005800580058), v17, (int16x4_t)0x31003100310031);
  v66[0] = vaddq_s32(v27, v23);
  v66[1] = vaddq_s32(v28, v24);
  v30 = vmlal_s16(vmlal_s16(vmlal_s16(vmull_s16(v13, (int16x4_t)0x58005800580058), v11, (int16x4_t)0x32003200320032), v14, (int16x4_t)0x12001200120012), v17, (int16x4_t)0x4B004B004B004BLL);
  v66[2] = vaddq_s32(v29, v25);
  v66[3] = vaddq_s32(v30, v26);
  v66[4] = vsubq_s32(v23, v27);
  v66[5] = vsubq_s32(v24, v28);
  v66[6] = vsubq_s32(v25, v29);
  v66[7] = vsubq_s32(v26, v30);
  v31 = result[16];
  v32 = result[17];
  v33 = result[18];
  v34 = result[19];
  v35 = result[20];
  v36 = result[21];
  v37 = result[22];
  v38 = result[23];
  do
  {
    v39 = (int32x4_t *)&v66[v10 / 8];
    v40 = (int32x4_t)v66[v10 / 8];
    v41 = *(int16x8_t *)&aZwpf9[v10];
    v42 = vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmull_lane_s16(v32, *(int16x4_t *)v41.i8, 1), v31, *(int16x4_t *)v41.i8, 0), v33, *(int16x4_t *)v41.i8, 2), v34, *(int16x4_t *)v41.i8, 3), v35, v41, 4), v36, v41, 5), v37,
              v41,
              6),
            v38,
            v41,
            7);
    *v39 = vaddq_s32(v42, v40);
    v39[8] = vsubq_s32(v40, v42);
    v10 += 8;
  }
  while (v10 != 64);
  v43 = 0;
  v44 = result[8];
  v45 = result[9];
  v46 = result[24];
  v47 = result[25];
  v48 = result[10];
  v49 = result[11];
  v50 = result[26];
  v51 = result[27];
  v52 = result[12];
  v53 = result[13];
  v54 = result[28];
  v55 = result[29];
  v56 = aZzxurnic6;
  v57 = result[14];
  v58 = result[15];
  v59 = result[30];
  v60 = result[31];
  do
  {
    v61 = *(int16x8_t *)v56;
    v62 = *((int16x8_t *)v56 + 1);
    v56 += 16;
    v63 = (int32x4_t)v66[byte_1C98617E0[v43]];
    v64 = vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmull_lane_s16(v46, *(int16x4_t *)v61.i8, 1), v44, *(int16x4_t *)v61.i8, 0), v45,
                                      *(int16x4_t *)v61.i8,
                                      2),
                                    v47,
                                    *(int16x4_t *)v61.i8,
                                    3),
                                  v48,
                                  v61,
                                  4),
                                v50,
                                v61,
                                5),
                              v49,
                              v61,
                              6),
                            v51,
                            v61,
                            7),
                          v52,
                          *(int16x4_t *)v62.i8,
                          0),
                        v54,
                        *(int16x4_t *)v62.i8,
                        1),
                      v53,
                      *(int16x4_t *)v62.i8,
                      2),
                    v55,
                    *(int16x4_t *)v62.i8,
                    3),
                  v57,
                  v62,
                  4),
                v59,
                v62,
                5),
              v58,
              v62,
              6),
            v60,
            v62,
            7);
    v65 = 124 - 4 * *((unsigned __int8 *)&unk_1C9861500 + v43 + 80);
    result[*((unsigned __int8 *)&unk_1C9861500 + v43 + 80)] = vqrshrn_n_s32(vaddq_s32(v64, v63), 9uLL);
    *(int16x4_t *)((char *)result + 2 * v65) = vqrshrn_n_s32(vsubq_s32(v63, v64), 9uLL);
    ++v43;
  }
  while (v43 != 16);
  return result;
}

int16x4_t *sub_1C98214BC(int16x4_t *result, int a2)
{
  int16x4_t *v2;
  int16x8_t v3;
  unsigned int v4;
  unint64_t v6;
  int16x4_t *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v2 = result;
  if (a2 == 1)
  {
    v3 = vdupq_n_s16((result->i16[0] + 9) >> 4);
    v4 = -32;
    do
    {
      *(int16x8_t *)v2->i8 = v3;
      *(int16x8_t *)v2[2].i8 = v3;
      *(int16x8_t *)v2[4].i8 = v3;
      *(int16x8_t *)v2[6].i8 = v3;
      v4 += 32;
      v2 += 8;
    }
    while (v4 < 0xE0);
    return result;
  }
  if (a2 <= 16)
  {
    sub_1C970AB50(result, 0x10u, (uint64_t)&unk_1C9861410);
LABEL_12:
    v8 = -4;
    do
    {
      result = sub_1C9820D8C(v2, 0x10u, (uint64_t)&unk_1C98614F0);
      v8 += 4;
      v2 += 16;
    }
    while (v8 < 0xC);
    return result;
  }
  if (a2 >= 0x31)
  {
    v6 = -4;
    v7 = result;
    do
    {
      sub_1C970B648(v7, 0x10u, (uint64_t)&unk_1C9861460, (int16x4_t *)aYk2, (int16x4_t *)aZwpf9);
      v6 += 4;
      ++v7;
    }
    while (v6 < 0xC);
  }
  else
  {
    sub_1C970AC1C(result, 0x10u, (uint64_t)&unk_1C9861410, (int16x4_t *)aZwpf);
    sub_1C970AC1C(v2 + 1, 0x10u, (uint64_t)&unk_1C9861410, (int16x4_t *)aZwpf);
  }
  if (a2 <= 32)
    goto LABEL_12;
  if (a2 >= 0x51)
  {
    v10 = -4;
    do
    {
      result = (int16x4_t *)sub_1C9821000((int16x8_t *)v2, 0x10u, (uint64_t)&unk_1C98614F8, (int16x4_t *)aYk2, (int16x4_t *)aZwpf9);
      v10 += 4;
      v2 += 16;
    }
    while (v10 < 0xC);
  }
  else
  {
    v9 = -4;
    do
    {
      result = (int16x4_t *)sub_1C9820E6C((int16x8_t *)v2, 0x10u, (uint64_t)&unk_1C98614F0, (int16x4_t *)aZwpf);
      v9 += 4;
      v2 += 16;
    }
    while (v9 < 0xC);
  }
  return result;
}

int16x4_t *sub_1C9821698(int16x4_t *result, int a2)
{
  int16x4_t *v2;
  int16x8_t v3;
  char v4;
  char v5;

  v2 = result;
  if (a2 == 1)
  {
    v3 = vdupq_n_s16((result->i16[0] + 9) >> 4);
    v4 = 1;
    do
    {
      v5 = v4;
      *(int16x8_t *)v2->i8 = v3;
      *(int16x8_t *)v2[2].i8 = v3;
      *(int16x8_t *)v2[4].i8 = v3;
      *(int16x8_t *)v2[6].i8 = v3;
      v2 += 8;
      v4 = 0;
    }
    while ((v5 & 1) != 0);
  }
  else if (a2 > 16)
  {
    sub_1C970AC1C(result, 8u, (uint64_t)&unk_1C98612E0, (int16x4_t *)aYk2);
    sub_1C970AC1C(v2 + 1, 8u, (uint64_t)&unk_1C98612E0, (int16x4_t *)aYk2);
    sub_1C9820E6C((int16x8_t *)v2, 8u, (uint64_t)&unk_1C98612E0, (int16x4_t *)aYk2);
    return (int16x4_t *)sub_1C9820E6C((int16x8_t *)&v2[8], 8u, (uint64_t)&unk_1C98612E0, (int16x4_t *)aYk2);
  }
  else
  {
    sub_1C970AB50(result, 8u, (uint64_t)&unk_1C98612E0);
    sub_1C9820D8C(v2, 8u, (uint64_t)&unk_1C98612E0);
    return sub_1C9820D8C(v2 + 8, 8u, (uint64_t)&unk_1C98612E0);
  }
  return result;
}

int32x4_t sub_1C98217A0(int32x4_t *a1, int a2)
{
  int32x4_t result;
  int16x4_t v3;
  int16x4_t v4;
  int16x4_t v5;
  int32x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int16x4_t v11;
  int16x4_t v12;
  int32x2_t v13;
  int32x2_t v14;
  int16x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int16x4_t v25;
  int16x4_t v26;

  if (a2 == 1)
  {
    result = (int32x4_t)vdupq_n_s16((a1->i16[0] + 9) >> 4);
    *a1 = result;
    a1[1] = result;
  }
  else
  {
    v3 = (int16x4_t)a1->u64[1];
    v4 = *(int16x4_t *)a1[1].i8;
    v5 = (int16x4_t)a1[1].u64[1];
    v6 = vsubl_s16(*(int16x4_t *)a1->i8, v4);
    v7 = vshlq_n_s32(vaddl_s16(v4, *(int16x4_t *)a1->i8), 6uLL);
    v8 = vshlq_n_s32(v6, 6uLL);
    v9 = vmlal_s16(vmull_s16(v5, (int16x4_t)0x24002400240024), v3, (int16x4_t)0x53005300530053);
    v10 = vmlsl_s16(vmull_s16(v3, (int16x4_t)0x24002400240024), v5, (int16x4_t)0x53005300530053);
    v11 = vqrshrn_n_s32(vaddq_s32(v9, v7), 7uLL);
    *(int16x4_t *)v7.i8 = vqrshrn_n_s32(vsubq_s32(v7, v9), 7uLL);
    v12 = vqrshrn_n_s32(vaddq_s32(v10, v8), 7uLL);
    *(int16x4_t *)v8.i8 = vqrshrn_n_s32(vsubq_s32(v8, v10), 7uLL);
    *(int16x4_t *)v10.i8 = vtrn1_s16(v11, v12);
    v13 = (int32x2_t)vtrn2_s16(v11, v12);
    v14 = (int32x2_t)vtrn1_s16(*(int16x4_t *)v8.i8, *(int16x4_t *)v7.i8);
    *(int16x4_t *)v8.i8 = vtrn2_s16(*(int16x4_t *)v8.i8, *(int16x4_t *)v7.i8);
    *(int32x2_t *)v7.i8 = vzip1_s32(*(int32x2_t *)v10.i8, v14);
    v15 = (int16x4_t)vzip2_s32(*(int32x2_t *)v10.i8, v14);
    v16 = vaddl_s16(*(int16x4_t *)v7.i8, v15);
    v17 = vsubl_s16(*(int16x4_t *)v7.i8, v15);
    v18 = vshlq_n_s32(v16, 6uLL);
    v19 = vshlq_n_s32(v17, 6uLL);
    *(int32x2_t *)v16.i8 = vzip1_s32(v13, *(int32x2_t *)v8.i8);
    *(int32x2_t *)v8.i8 = vzip2_s32(v13, *(int32x2_t *)v8.i8);
    v20 = vmlal_s16(vmull_s16(*(int16x4_t *)v8.i8, (int16x4_t)0x24002400240024), *(int16x4_t *)v16.i8, (int16x4_t)0x53005300530053);
    v21 = vmlsl_s16(vmull_s16(*(int16x4_t *)v16.i8, (int16x4_t)0x24002400240024), *(int16x4_t *)v8.i8, (int16x4_t)0x53005300530053);
    result = vaddq_s32(v18, v20);
    v22 = vsubq_s32(v18, v20);
    v23 = vaddq_s32(v19, v21);
    v24 = vsubq_s32(v19, v21);
    v25 = vqrshrn_n_s32(result, 9uLL);
    *(int16x4_t *)v21.i8 = vqrshrn_n_s32(v22, 9uLL);
    v26 = vqrshrn_n_s32(v23, 9uLL);
    *(int16x4_t *)v16.i8 = vqrshrn_n_s32(v24, 9uLL);
    vst4_s16(a1->i16, *(int16x4x4_t *)(&v16 - 1));
  }
  return result;
}

int16x4_t sub_1C9821878(int16x4_t *a1, uint64_t a2, int16x4_t *a3, uint64_t a4, int16x4_t *a5)
{
  int16x4_t v5;
  int16x4_t v6;
  int16x4_t v7;
  int16x4_t v8;
  int16x4_t result;

  v5 = vsub_s16(*(int16x4_t *)((char *)a1 + 2 * a2), *(int16x4_t *)((char *)a3 + 2 * a4));
  v6 = *(int16x4_t *)((char *)a1 + 6 * a2);
  v7 = *(int16x4_t *)((char *)a3 + 6 * a4);
  v8 = vsub_s16(*(int16x4_t *)((char *)a1 + 4 * a2), *(int16x4_t *)((char *)a3 + 4 * a4));
  *a5 = vsub_s16(*a1, *a3);
  a5[1] = v5;
  result = vsub_s16(v6, v7);
  a5[2] = v8;
  a5[3] = result;
  return result;
}

int16x8_t *sub_1C98218D0(int16x8_t *result, uint64_t a2, int16x8_t *a3, uint64_t a4, int16x8_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  int16x8_t v9;
  int16x8_t *v10;
  int16x8_t *v11;
  int16x8_t v12;
  int16x8_t *v13;
  int16x8_t *v14;
  int16x8_t v15;

  v5 = 2 * a2;
  v6 = 2 * a4;
  v7 = 1;
  do
  {
    v8 = v7;
    v9 = vsubq_s16(*(int16x8_t *)((char *)result + 2 * a2), *(int16x8_t *)((char *)a3 + 2 * a4));
    v10 = (int16x8_t *)((char *)result + v5 + v5);
    v11 = (int16x8_t *)((char *)a3 + v6 + v6);
    v12 = vsubq_s16(*v10, *v11);
    v13 = (int16x8_t *)((char *)v10 + v5);
    v14 = (int16x8_t *)((char *)v11 + v6);
    v15 = vsubq_s16(*v13, *v14);
    *a5 = vsubq_s16(*result, *a3);
    a5[1] = v9;
    a5[2] = v12;
    a5[3] = v15;
    result = (int16x8_t *)((char *)v13 + v5);
    a3 = (int16x8_t *)((char *)v14 + v6);
    a5 += 4;
    v7 = 0;
  }
  while ((v8 & 1) != 0);
  return result;
}

int16x8_t *sub_1C9821948(int16x8_t *result, uint64_t a2, int16x8_t *a3, uint64_t a4, int16x8_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  int16x8_t v8;
  int16x8_t v9;
  int16x8_t v10;

  v5 = 2 * a2;
  v6 = 2 * a4;
  v7 = -2;
  do
  {
    v8 = vsubq_s16(result[1], a3[1]);
    v9 = vsubq_s16(*(int16x8_t *)((char *)result + 2 * a2), *(int16x8_t *)((char *)a3 + 2 * a4));
    v10 = vsubq_s16(*(int16x8_t *)((char *)&result[1] + v5), *(int16x8_t *)((char *)&a3[1] + v6));
    *a5 = vsubq_s16(*result, *a3);
    a5[1] = v8;
    v7 += 2;
    a5[2] = v9;
    a5[3] = v10;
    result = (int16x8_t *)((char *)result + v5 + v5);
    a3 = (int16x8_t *)((char *)a3 + v6 + v6);
    a5 += 4;
  }
  while (v7 < 0xE);
  return result;
}

int16x8_t sub_1C98219A0(int16x8_t *a1, uint64_t a2, int16x8_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  int16x8_t *v6;
  int16x8_t *v7;
  int16x8_t result;
  int16x8_t v9;
  int16x8_t v10;
  int16x8_t *v11;
  int16x8_t v12;

  v5 = 0;
  v6 = a3 + 2;
  v7 = a1 + 2;
  do
  {
    result = vsubq_s16(v7[-2], v6[-2]);
    v9 = vsubq_s16(v7[-1], v6[-1]);
    v10 = vsubq_s16(*v7, *v6);
    v11 = (int16x8_t *)(a5 + v5);
    v12 = vsubq_s16(v7[1], v6[1]);
    *v11 = result;
    v11[1] = v9;
    v11[2] = v10;
    v11[3] = v12;
    v5 += 64;
    v6 = (int16x8_t *)((char *)v6 + 2 * a4);
    v7 = (int16x8_t *)((char *)v7 + 2 * a2);
  }
  while ((_DWORD)v5 != 2048);
  return result;
}

int16x4_t sub_1C98219F8(int16x4_t *a1, uint64_t a2, int16x4_t *a3, uint64_t a4, int16x4_t *a5)
{
  int16x4_t v6;
  int16x4_t v7;
  int16x4_t v8;
  int16x4_t v9;
  int16x4_t v11[6];

  v11[5] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v6 = vsub_s16(*(int16x4_t *)((char *)a1 + 2 * a2), *(int16x4_t *)((char *)a3 + 2 * a4));
  v7 = *(int16x4_t *)((char *)a1 + 6 * a2);
  v8 = *(int16x4_t *)((char *)a3 + 6 * a4);
  v9 = vsub_s16(*(int16x4_t *)((char *)a1 + 4 * a2), *(int16x4_t *)((char *)a3 + 4 * a4));
  *a5 = vsub_s16(*a1, *a3);
  a5[1] = v6;
  a5[2] = v9;
  a5[3] = vsub_s16(v7, v8);
  sub_1C981AFE4(v11, a5, 5);
  return sub_1C981B088(a5, v11);
}

int16x4_t sub_1C9821AB8(int16x4_t *a1, uint64_t a2, int16x4_t *a3, uint64_t a4, int16x4_t *a5)
{
  int16x4_t v5;
  int16x4_t v6;
  int16x4_t v7;
  int16x4_t v8;
  int32x2_t v9;
  int32x2_t v10;
  int32x2_t v11;
  int32x2_t v12;
  int16x4_t v13;
  int16x4_t v14;
  int16x4_t v15;
  int16x4_t v16;
  int16x4_t v17;
  int16x4_t v18;
  int16x4_t v19;
  int16x4_t v20;
  int16x4_t v22[6];

  v22[5] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v5 = vsub_s16(*a1, *a3);
  v6 = vsub_s16(*(int16x4_t *)((char *)a1 + 2 * a2), *(int16x4_t *)((char *)a3 + 2 * a4));
  v7 = vsub_s16(*(int16x4_t *)((char *)a1 + 4 * a2), *(int16x4_t *)((char *)a3 + 4 * a4));
  v8 = vsub_s16(*(int16x4_t *)((char *)a1 + 6 * a2), *(int16x4_t *)((char *)a3 + 6 * a4));
  *a5 = v5;
  a5[1] = v6;
  a5[2] = v7;
  a5[3] = v8;
  v9 = (int32x2_t)vtrn1_s16(v5, v6);
  v10 = (int32x2_t)vtrn2_s16(v5, v6);
  v11 = (int32x2_t)vtrn1_s16(v7, v8);
  v12 = (int32x2_t)vtrn2_s16(v7, v8);
  v13 = (int16x4_t)vzip1_s32(v10, v12);
  v14 = (int16x4_t)vzip2_s32(v9, v11);
  v15 = (int16x4_t)vzip2_s32(v10, v12);
  v16 = (int16x4_t)vzip1_s32(v9, v11);
  v17 = vadd_s16(v15, v16);
  v18 = vsub_s16(v16, v15);
  v19 = vadd_s16(v14, v13);
  v20 = vsub_s16(v13, v14);
  v22[0] = vqmovn_s32(vrshrq_n_s32(vshlq_n_s32(vaddl_s16(v19, v17), 6uLL), 5uLL));
  v22[1] = vqmovn_s32(vrshrq_n_s32(vmlal_s16(vmull_s16(v20, (int16x4_t)0x24002400240024), v18, (int16x4_t)0x53005300530053), 5uLL));
  v22[2] = vqmovn_s32(vrshrq_n_s32(vshlq_n_s32(vsubl_s16(v17, v19), 6uLL), 5uLL));
  v22[3] = vqmovn_s32(vrshrq_n_s32(vmlsl_s16(vmull_s16(v18, (int16x4_t)0x24002400240024), v20, (int16x4_t)0x53005300530053), 5uLL));
  return sub_1C981AF54(a5, v22);
}

void sub_1C9821BDC(int16x8_t *a1, uint64_t a2, int16x8_t *a3, uint64_t a4, int16x8_t *a5)
{
  int16x4_t v6[18];

  v6[17] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  sub_1C98218D0(a1, a2, a3, a4, a5);
  sub_1C981ADF0(v6, (int16x4_t *)a5, 6);
  sub_1C981AE94((int16x4_t *)a5, v6);
}

void sub_1C9821C4C(int16x8_t *a1, uint64_t a2, int16x8_t *a3, uint64_t a4, int16x4_t *a5)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  int16x8_t *v9;
  int16x8_t v10;
  int16x8_t v11;
  int16x8_t v12;
  int16x4_t v13[66];

  v13[65] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v6 = 2 * a2;
  v7 = 2 * a4;
  v8 = -2;
  v9 = (int16x8_t *)a5;
  do
  {
    v10 = vsubq_s16(a1[1], a3[1]);
    v11 = vsubq_s16(*(int16x8_t *)((char *)a1 + 2 * a2), *(int16x8_t *)((char *)a3 + 2 * a4));
    v12 = vsubq_s16(*(int16x8_t *)((char *)&a1[1] + v6), *(int16x8_t *)((char *)&a3[1] + v7));
    *v9 = vsubq_s16(*a1, *a3);
    v9[1] = v10;
    v8 += 2;
    v9[2] = v11;
    v9[3] = v12;
    a1 = (int16x8_t *)((char *)a1 + v6 + v6);
    a3 = (int16x8_t *)((char *)a3 + v7 + v7);
    v9 += 4;
  }
  while (v8 < 0xE);
  sub_1C981AB1C(v13, a5, 7);
  sub_1C981AC68(a5, v13);
}

void sub_1C9821D10(int16x8_t *a1, uint64_t a2, int16x8_t *a3, uint64_t a4, int16x4_t *a5)
{
  uint64_t v6;
  int16x8_t *v7;
  int16x8_t *v8;
  int16x8_t v9;
  int16x8_t v10;
  int16x8_t *v11;
  int16x8_t v12;
  int16x4_t v13[258];

  v6 = 0;
  v13[257] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v7 = a3 + 2;
  v8 = a1 + 2;
  do
  {
    v9 = vsubq_s16(v8[-1], v7[-1]);
    v10 = vsubq_s16(*v8, *v7);
    v11 = (int16x8_t *)&a5[v6];
    v12 = vsubq_s16(v8[1], v7[1]);
    *v11 = vsubq_s16(v8[-2], v7[-2]);
    v11[1] = v9;
    v11[2] = v10;
    v11[3] = v12;
    v6 += 8;
    v7 = (int16x8_t *)((char *)v7 + 2 * a4);
    v8 = (int16x8_t *)((char *)v8 + 2 * a2);
  }
  while ((_DWORD)(v6 * 8) != 2048);
  sub_1C9819DB0(v13, a5, 8);
  sub_1C9819FE4(a5, v13);
}

double sub_1C9821DD0(uint64_t *a1, uint64_t a2, int16x4_t *a3, char a4)
{
  int16x4_t v4;
  int16x4_t v5;
  int16x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int16x4_t v18;
  int16x4_t v19;
  int32x2_t v20;
  int32x2_t v21;
  int16x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int16x4_t v30;
  uint64_t *v31;
  uint64_t *v32;
  int16x8_t v33;
  uint16x8_t v34;
  uint16x8_t v35;

  v4 = a3[1];
  v5 = a3[2];
  v6 = a3[3];
  v7 = vaddl_s16(v5, *a3);
  v8 = vaddl_s16(v6, v5);
  v9 = vsubl_s16(*a3, v6);
  v10.i64[0] = 0x1D0000001DLL;
  v10.i64[1] = 0x1D0000001DLL;
  v11.i64[0] = 0x3700000037;
  v11.i64[1] = 0x3700000037;
  v12 = vmlaq_s32(vmlal_s16(vmulq_s32(v7, v10), v4, (int16x4_t)0x4A004A004A004ALL), v8, v11);
  v13 = vmlaq_s32(vmlsl_s16(vmulq_s32(v7, v11), v4, (int16x4_t)0x4A004A004A004ALL), v9, v10);
  v14.i64[0] = 0x1C0000001CLL;
  v14.i64[1] = 0x1C0000001CLL;
  v15 = vmlaq_s32(vmlal_s16(vmulq_s32(v9, v11), v4, (int16x4_t)0x4A004A004A004ALL), v8, v14);
  v16.i64[0] = 0x4A0000004ALL;
  v16.i64[1] = 0x4A0000004ALL;
  v17 = vmulq_s32(vaddw_s16(vsubl_s16(*a3, v5), v6), v16);
  v18 = vqrshrn_n_s32(v12, 7uLL);
  v19 = vqrshrn_n_s32(v15, 7uLL);
  *(int16x4_t *)v17.i8 = vqrshrn_n_s32(v17, 7uLL);
  *(int16x4_t *)v13.i8 = vqrshrn_n_s32(v13, 7uLL);
  *(int16x4_t *)v8.i8 = vtrn1_s16(v18, v19);
  v20 = (int32x2_t)vtrn2_s16(v18, v19);
  v21 = (int32x2_t)vtrn1_s16(*(int16x4_t *)v17.i8, *(int16x4_t *)v13.i8);
  *(int16x4_t *)v17.i8 = vtrn2_s16(*(int16x4_t *)v17.i8, *(int16x4_t *)v13.i8);
  *(int32x2_t *)v13.i8 = vzip1_s32(*(int32x2_t *)v8.i8, v21);
  v22 = (int16x4_t)vzip2_s32(*(int32x2_t *)v8.i8, v21);
  v23 = vaddl_s16(*(int16x4_t *)v13.i8, v22);
  *(int32x2_t *)v15.i8 = vzip2_s32(v20, *(int32x2_t *)v17.i8);
  v24 = vaddl_s16(v22, *(int16x4_t *)v15.i8);
  v25 = vsubl_s16(*(int16x4_t *)v13.i8, *(int16x4_t *)v15.i8);
  *(int32x2_t *)v17.i8 = vzip1_s32(v20, *(int32x2_t *)v17.i8);
  v26 = vmlaq_s32(vmlal_s16(vmulq_s32(v24, v11), *(int16x4_t *)v17.i8, (int16x4_t)0x4A004A004A004ALL), v23, v10);
  v27 = vmlaq_s32(vmlsl_s16(vmulq_s32(v25, v10), *(int16x4_t *)v17.i8, (int16x4_t)0x4A004A004A004ALL), v23, v11);
  v28 = vmlaq_s32(vmlal_s16(vmulq_s32(v25, v11), *(int16x4_t *)v17.i8, (int16x4_t)0x4A004A004A004ALL), v24, v14);
  v29 = vmulq_s32(vaddw_s16(vsubl_s16(*(int16x4_t *)v13.i8, v22), *(int16x4_t *)v15.i8), v16);
  *(int16x4_t *)v16.i8 = vqrshrn_n_s32(v26, 8uLL);
  *(int16x4_t *)v26.i8 = vqrshrn_n_s32(v28, 8uLL);
  v30 = vqrshrn_n_s32(v29, 8uLL);
  *(int16x4_t *)v13.i8 = vqrshrn_n_s32(v27, 8uLL);
  vst4_s16((__int16 *)a3, *(int16x4x4_t *)((char *)&v13 - 24));
  v31 = (uint64_t *)((char *)a1 + 2 * a2);
  v29.i64[0] = *a1;
  v29.i64[1] = *v31;
  v32 = (uint64_t *)((char *)a1 + 6 * a2);
  v16.i64[0] = *(uint64_t *)((char *)a1 + 4 * a2);
  v16.i64[1] = *v32;
  v33 = *(int16x8_t *)a3[2].i8;
  v26.i64[0] = 0xF000F000F000F000;
  v26.i64[1] = 0xF000F000F000F000;
  v34 = vminq_u16(vsqaddq_u16((uint16x8_t)v29, *(int16x8_t *)a3->i8), (uint16x8_t)v26);
  *a1 = v34.i64[0];
  *v31 = v34.i64[1];
  v35 = vminq_u16(vsqaddq_u16((uint16x8_t)v16, v33), (uint16x8_t)v26);
  *(uint64_t *)((char *)a1 + 4 * a2) = v35.i64[0];
  *v32 = v35.i64[1];
  if ((a4 & 1) == 0)
  {
    v35.i64[0] = 0;
    *(_OWORD *)a3->i8 = 0u;
    *(_OWORD *)a3[2].i8 = 0u;
  }
  return *(double *)v35.i64;
}

void sub_1C9821F00(uint64_t *a1, uint64_t a2, int32x4_t *a3, int a4, int a5)
{
  char v5;
  int16x8_t v9;
  uint64_t *v10;
  uint16x8_t v11;
  uint64_t *v12;
  uint16x8_t v13;
  uint16x8_t v14;
  uint16x8_t v15;
  uint16x8_t v16;
  uint64_t *v17;
  uint16x8_t v18;
  uint64_t *v19;
  uint16x8_t v20;
  uint16x8_t v21;
  uint16x8_t v22;
  uint16x8_t v23;

  v5 = a4;
  if (a5 != 1)
  {
    sub_1C98234DC(a3, a5);
    v17 = (uint64_t *)((char *)a1 + 2 * a2);
    v18.i64[0] = *a1;
    v18.i64[1] = *v17;
    v19 = (uint64_t *)((char *)a1 + 6 * a2);
    v20.i64[0] = *(uint64_t *)((char *)a1 + 4 * a2);
    v20.i64[1] = *v19;
    v21.i64[0] = 0xF000F000F000F000;
    v21.i64[1] = 0xF000F000F000F000;
    v22 = vminq_u16(vsqaddq_u16(v18, *(int16x8_t *)a3), v21);
    v23 = vminq_u16(vsqaddq_u16(v20, (int16x8_t)a3[1]), v21);
    *a1 = v22.i64[0];
    *v17 = v22.i64[1];
    *(uint64_t *)((char *)a1 + 4 * a2) = v23.i64[0];
    *v19 = v23.i64[1];
    if ((v5 & 1) != 0)
      return;
    v9 = 0uLL;
    goto LABEL_6;
  }
  v9 = vdupq_n_s16((a3->i16[0] + 5) >> 3);
  a3->i16[0] = 0;
  v10 = (uint64_t *)((char *)a1 + 2 * a2);
  v11.i64[0] = *a1;
  v11.i64[1] = *v10;
  v12 = (uint64_t *)((char *)a1 + 6 * a2);
  v13.i64[0] = *(uint64_t *)((char *)a1 + 4 * a2);
  v13.i64[1] = *v12;
  v14.i64[0] = 0xF000F000F000F000;
  v14.i64[1] = 0xF000F000F000F000;
  v15 = vminq_u16(vsqaddq_u16(v11, v9), v14);
  v16 = vminq_u16(vsqaddq_u16(v13, v9), v14);
  *a1 = v15.i64[0];
  *v10 = v15.i64[1];
  *(uint64_t *)((char *)a1 + 4 * a2) = v16.i64[0];
  *v12 = v16.i64[1];
  if (a4)
  {
LABEL_6:
    *a3 = (int32x4_t)v9;
    a3[1] = (int32x4_t)v9;
  }
}

uint16x8_t *sub_1C9821FF8(uint16x8_t *result, uint64_t a2, int16x4_t *a3, int a4, int a5)
{
  int16x8_t *v6;
  uint16x8_t *v8;
  int16x8_t v9;
  uint16x8_t v10;
  uint16x8_t v11;
  uint16x8_t v12;
  uint16x8_t v13;
  uint16x8_t v14;
  uint16x8_t v15;
  uint16x8_t v16;
  uint16x8_t v17;
  unsigned int v18;
  char v19;
  uint16x8_t v20;
  char v21;
  uint16x8_t v22;
  uint16x8_t v23;
  uint16x8_t v24;
  uint16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  int16x8_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int16x8_t v33;
  int16x8_t v34;
  int16x8_t v35;
  int16x8_t v36;
  unsigned int v37;
  int8x16_t v38;

  v6 = (int16x8_t *)a3;
  v8 = result;
  if (a5 == 1)
  {
    v9 = vdupq_n_s16((a3->i16[0] + 5) >> 3);
    a3->i16[0] = 0;
    v10 = *(uint16x8_t *)((char *)result + 14 * a2);
    v11.i64[0] = 0xF000F000F000F000;
    v11.i64[1] = 0xF000F000F000F000;
    v12 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 2 * a2), v9), v11);
    v13 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 4 * a2), v9), v11);
    v14 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 6 * a2), v9), v11);
    v15 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 8 * a2), v9), v11);
    v16 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 10 * a2), v9), v11);
    v17 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 12 * a2), v9), v11);
    *result = vminq_u16(vsqaddq_u16(*result, v9), v11);
    *(uint16x8_t *)((char *)result + 2 * a2) = v12;
    *(uint16x8_t *)((char *)result + 4 * a2) = v13;
    *(uint16x8_t *)((char *)result + 6 * a2) = v14;
    *(uint16x8_t *)((char *)result + 8 * a2) = v15;
    *(uint16x8_t *)((char *)result + 10 * a2) = v16;
    *(uint16x8_t *)((char *)result + 12 * a2) = v17;
    *(uint16x8_t *)((char *)result + 14 * a2) = vminq_u16(vsqaddq_u16(v10, v9), v11);
    if (a4)
    {
      v18 = -16;
      do
      {
        *v6 = v9;
        v6[1] = v9;
        v6 += 2;
        v18 += 16;
      }
      while (v18 < 0x30);
    }
  }
  else
  {
    result = (uint16x8_t *)sub_1C98233D4(a3, a5);
    v19 = 1;
    v20.i64[0] = 0xF000F000F000F000;
    v20.i64[1] = 0xF000F000F000F000;
    do
    {
      v21 = v19;
      v22 = *v8;
      v23 = *(uint16x8_t *)((char *)v8 + 2 * a2);
      v24 = *(uint16x8_t *)((char *)v8 + 4 * a2);
      v25 = *(uint16x8_t *)((char *)v8 + 6 * a2);
      v26 = v6[1];
      v27 = v6[2];
      v28 = v6[3];
      v29 = (int32x4_t)vtrn1q_s16(*v6, v26);
      v30 = (int32x4_t)vtrn2q_s16(*v6, v26);
      v31 = (int32x4_t)vtrn1q_s16(v27, v28);
      v32 = (int32x4_t)vtrn2q_s16(v27, v28);
      v33 = (int16x8_t)vtrn1q_s32(v29, v31);
      v34 = (int16x8_t)vtrn2q_s32(v29, v31);
      v35 = (int16x8_t)vtrn1q_s32(v30, v32);
      v36 = (int16x8_t)vtrn2q_s32(v30, v32);
      if (a4)
        v37 = -1;
      else
        v37 = 0;
      v38 = (int8x16_t)vdupq_n_s16(v37);
      *(int8x16_t *)v6 = vandq_s8((int8x16_t)v33, v38);
      v6[1] = (int16x8_t)vandq_s8((int8x16_t)v35, v38);
      v6[2] = (int16x8_t)vandq_s8((int8x16_t)v34, v38);
      v6[3] = (int16x8_t)vandq_s8((int8x16_t)v36, v38);
      *v8 = vminq_u16(vsqaddq_u16(v22, v33), v20);
      *(uint16x8_t *)((char *)v8 + 2 * a2) = vminq_u16(vsqaddq_u16(v23, v35), v20);
      *(uint16x8_t *)((char *)v8 + 4 * a2) = vminq_u16(vsqaddq_u16(v24, v34), v20);
      *(uint16x8_t *)((char *)v8 + 6 * a2) = vminq_u16(vsqaddq_u16(v25, v36), v20);
      v8 = (uint16x8_t *)((char *)v8 + 8 * a2);
      v6 += 4;
      v19 = 0;
    }
    while ((v21 & 1) != 0);
  }
  return result;
}

int16x4_t *sub_1C98221D8(int16x4_t *result, uint64_t a2, int16x4_t *a3, int a4, int a5)
{
  _OWORD *v6;
  uint16x8_t *v8;
  int16x8_t v9;
  uint64_t v10;
  unsigned int v11;
  uint16x8_t v12;
  uint16x8_t *v13;
  uint16x8_t v14;
  uint16x8_t v15;
  uint16x8_t v16;
  unsigned int v17;
  uint64_t v18;
  char v19;
  uint16x8_t v20;
  char v21;
  uint16x8_t *v22;
  unsigned int v23;
  int16x8_t *v24;
  uint16x8_t v25;
  uint16x8_t v26;
  uint16x8_t v27;
  uint16x8_t v28;
  int16x8_t v29;
  int16x8_t v30;
  int16x8_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int32x4_t v34;
  int32x4_t v35;
  int16x8_t v36;
  int16x8_t v37;
  int16x8_t v38;
  int16x8_t v39;
  unsigned int v40;
  int8x16_t v41;

  v6 = a3;
  v8 = (uint16x8_t *)result;
  if (a5 == 1)
  {
    v9 = vdupq_n_s16((a3->i16[0] + 5) >> 3);
    a3->i16[0] = 0;
    v10 = 2 * a2;
    v11 = -2;
    v12.i64[0] = 0xF000F000F000F000;
    v12.i64[1] = 0xF000F000F000F000;
    do
    {
      v13 = (uint16x8_t *)((char *)v8 + v10);
      v14 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v8 + 2 * a2), v9), v12);
      v15 = vminq_u16(vsqaddq_u16(v8[1], v9), v12);
      v16 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v8[1] + v10), v9), v12);
      *v8 = vminq_u16(vsqaddq_u16(*v8, v9), v12);
      *v13 = v14;
      v8[1] = v15;
      v13[1] = v16;
      v8 = (uint16x8_t *)((char *)v8 + 4 * a2);
      v11 += 2;
    }
    while (v11 < 0xE);
    if (a4)
    {
      v17 = -16;
      do
      {
        *v6 = v9;
        v6[1] = v9;
        v6 += 2;
        v17 += 16;
      }
      while (v17 < 0xF0);
    }
  }
  else
  {
    result = sub_1C98231F8(a3, a5);
    v18 = 0;
    v19 = 1;
    v20.i64[0] = 0xF000F000F000F000;
    v20.i64[1] = 0xF000F000F000F000;
    do
    {
      v21 = v19;
      v22 = &v8[v18];
      v23 = -4;
      v24 = (int16x8_t *)&v6[v18];
      do
      {
        v25 = *(uint16x8_t *)((char *)v22 + 2 * a2);
        v26 = *v22;
        v27 = *(uint16x8_t *)((char *)v22 + 4 * a2);
        v28 = *(uint16x8_t *)((char *)v22 + 6 * a2);
        v29 = v24[2];
        v30 = v24[4];
        v31 = v24[6];
        v32 = (int32x4_t)vtrn1q_s16(*v24, v29);
        v33 = (int32x4_t)vtrn2q_s16(*v24, v29);
        v34 = (int32x4_t)vtrn1q_s16(v30, v31);
        v35 = (int32x4_t)vtrn2q_s16(v30, v31);
        v36 = (int16x8_t)vtrn1q_s32(v32, v34);
        v37 = (int16x8_t)vtrn2q_s32(v32, v34);
        v38 = (int16x8_t)vtrn1q_s32(v33, v35);
        v39 = (int16x8_t)vtrn2q_s32(v33, v35);
        if (a4)
          v40 = -1;
        else
          v40 = 0;
        v41 = (int8x16_t)vdupq_n_s16(v40);
        *(int8x16_t *)v24 = vandq_s8((int8x16_t)v36, v41);
        v24[2] = (int16x8_t)vandq_s8((int8x16_t)v38, v41);
        v24[4] = (int16x8_t)vandq_s8((int8x16_t)v37, v41);
        v24[6] = (int16x8_t)vandq_s8((int8x16_t)v39, v41);
        *v22 = vminq_u16(vsqaddq_u16(v26, v36), v20);
        *(uint16x8_t *)((char *)v22 + 2 * a2) = vminq_u16(vsqaddq_u16(v25, v38), v20);
        *(uint16x8_t *)((char *)v22 + 4 * a2) = vminq_u16(vsqaddq_u16(v27, v37), v20);
        *(uint16x8_t *)((char *)v22 + 6 * a2) = vminq_u16(vsqaddq_u16(v28, v39), v20);
        v22 = (uint16x8_t *)((char *)v22 + 8 * a2);
        v23 += 4;
        v24 += 8;
      }
      while (v23 < 0xC);
      v19 = 0;
      v18 = 1;
    }
    while ((v21 & 1) != 0);
  }
  return result;
}

uint16x8_t *sub_1C9822394(uint16x8_t *result, uint64_t a2, int16x4_t *a3, int a4, int a5)
{
  _OWORD *v6;
  uint16x8_t *v8;
  int16x8_t v9;
  uint16x8_t *v10;
  int v11;
  uint16x8_t v12;
  uint16x8_t v13;
  uint16x8_t v14;
  uint16x8_t v15;
  unsigned int v16;
  unint64_t v17;
  uint16x8_t v18;
  int16x8_t *v19;
  unsigned int v20;
  uint16x8_t *v21;
  uint16x8_t v22;
  uint16x8_t v23;
  uint16x8_t v24;
  uint16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  int16x8_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int16x8_t v33;
  int16x8_t v34;
  int16x8_t v35;
  int16x8_t v36;
  unsigned int v37;
  int8x16_t v38;

  v6 = a3;
  v8 = result;
  if (a5 == 1)
  {
    v9 = vdupq_n_s16((a3->i16[0] + 5) >> 3);
    a3->i16[0] = 0;
    v10 = result + 2;
    v11 = 32;
    v12.i64[0] = 0xF000F000F000F000;
    v12.i64[1] = 0xF000F000F000F000;
    do
    {
      v13 = vminq_u16(vsqaddq_u16(v10[-1], v9), v12);
      v14 = vminq_u16(vsqaddq_u16(*v10, v9), v12);
      v15 = vminq_u16(vsqaddq_u16(v10[1], v9), v12);
      v10[-2] = vminq_u16(vsqaddq_u16(v10[-2], v9), v12);
      v10[-1] = v13;
      *v10 = v14;
      v10[1] = v15;
      v10 = (uint16x8_t *)((char *)v10 + 2 * a2);
      --v11;
    }
    while (v11);
    if (a4)
    {
      v16 = -16;
      do
      {
        *v6 = v9;
        v6[1] = v9;
        v6 += 2;
        v16 += 16;
      }
      while (v16 < 0x3F0);
    }
  }
  else
  {
    result = (uint16x8_t *)sub_1C98228D0(a3, a5);
    v17 = 0;
    v18.i64[0] = 0xF000F000F000F000;
    v18.i64[1] = 0xF000F000F000F000;
    do
    {
      v19 = (int16x8_t *)&v6[v17];
      v20 = -4;
      v21 = v8;
      do
      {
        v22 = *(uint16x8_t *)((char *)v21 + 2 * a2);
        v23 = *v21;
        v24 = *(uint16x8_t *)((char *)v21 + 4 * a2);
        v25 = *(uint16x8_t *)((char *)v21 + 6 * a2);
        v26 = v19[4];
        v27 = v19[8];
        v28 = v19[12];
        v29 = (int32x4_t)vtrn1q_s16(*v19, v26);
        v30 = (int32x4_t)vtrn2q_s16(*v19, v26);
        v31 = (int32x4_t)vtrn1q_s16(v27, v28);
        v32 = (int32x4_t)vtrn2q_s16(v27, v28);
        v33 = (int16x8_t)vtrn1q_s32(v29, v31);
        v34 = (int16x8_t)vtrn2q_s32(v29, v31);
        v35 = (int16x8_t)vtrn1q_s32(v30, v32);
        v36 = (int16x8_t)vtrn2q_s32(v30, v32);
        if (a4)
          v37 = -1;
        else
          v37 = 0;
        v38 = (int8x16_t)vdupq_n_s16(v37);
        *(int8x16_t *)v19 = vandq_s8((int8x16_t)v33, v38);
        v19[4] = (int16x8_t)vandq_s8((int8x16_t)v35, v38);
        v19[8] = (int16x8_t)vandq_s8((int8x16_t)v34, v38);
        v19[12] = (int16x8_t)vandq_s8((int8x16_t)v36, v38);
        *v21 = vminq_u16(vsqaddq_u16(v23, v33), v18);
        *(uint16x8_t *)((char *)v21 + 2 * a2) = vminq_u16(vsqaddq_u16(v22, v35), v18);
        *(uint16x8_t *)((char *)v21 + 4 * a2) = vminq_u16(vsqaddq_u16(v24, v34), v18);
        *(uint16x8_t *)((char *)v21 + 6 * a2) = vminq_u16(vsqaddq_u16(v25, v36), v18);
        v21 = (uint16x8_t *)((char *)v21 + 8 * a2);
        v20 += 4;
        v19 += 16;
      }
      while (v20 < 0x1C);
      ++v8;
    }
    while (v17++ < 3);
  }
  return result;
}

int16x8_t sub_1C9822540(int16x8_t *a1)
{
  int16x8_t result;
  int16x8_t v2;

  result = vaddq_s16(*a1, *a1);
  v2 = vaddq_s16(a1[1], a1[1]);
  *a1 = result;
  a1[1] = v2;
  return result;
}

int16x8_t sub_1C9822554(int16x8_t *a1)
{
  int16x8_t result;
  int16x8_t v2;

  result = vrshrq_n_s16(*a1, 1uLL);
  v2 = vrshrq_n_s16(a1[1], 1uLL);
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_1C9822568(uint64_t result)
{
  unsigned int v1;

  v1 = -16;
  do
  {
    v1 += 16;
    result += 32;
  }
  while (v1 < 0x30);
  return result;
}

double sub_1C9822580(uint64_t *a1, uint64_t a2, int16x8_t *a3, char a4)
{
  uint64_t *v4;
  uint16x8_t v5;
  uint64_t *v6;
  uint16x8_t v7;
  int16x8_t v8;
  uint16x8_t v9;
  uint16x8_t v10;
  uint16x8_t v11;

  v4 = (uint64_t *)((char *)a1 + 2 * a2);
  v5.i64[0] = *a1;
  v5.i64[1] = *v4;
  v6 = (uint64_t *)((char *)a1 + 6 * a2);
  v7.i64[0] = *(uint64_t *)((char *)a1 + 4 * a2);
  v7.i64[1] = *v6;
  v8 = a3[1];
  v9.i64[0] = 0xF000F000F000F000;
  v9.i64[1] = 0xF000F000F000F000;
  v10 = vminq_u16(vsqaddq_u16(v5, *a3), v9);
  *a1 = v10.i64[0];
  *v4 = v10.i64[1];
  v11 = vminq_u16(vsqaddq_u16(v7, v8), v9);
  *(uint64_t *)((char *)a1 + 4 * a2) = v11.i64[0];
  *v6 = v11.i64[1];
  if ((a4 & 1) == 0)
  {
    v11.i64[0] = 0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return *(double *)v11.i64;
}

uint64_t sub_1C98225D8(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t (*v4)(void);

  if (a4)
    v4 = (uint64_t (*)(void))sub_1C98227CC;
  else
    v4 = (uint64_t (*)(void))sub_1C9822848;
  return v4();
}

uint64_t sub_1C98225F4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t (*v4)(void);

  if (a4)
    v4 = (uint64_t (*)(void))sub_1C98226F8;
  else
    v4 = (uint64_t (*)(void))sub_1C982275C;
  return v4();
}

uint64_t sub_1C9822610(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t (*v4)(void);

  if (a4)
    v4 = (uint64_t (*)(void))sub_1C982262C;
  else
    v4 = (uint64_t (*)(void))sub_1C982268C;
  return v4();
}

uint16x8_t *sub_1C982262C(uint16x8_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint16x8_t *v4;
  uint16x8_t v5;
  uint16x8_t v6;
  uint16x8_t v7;
  uint16x8_t v8;

  v3 = 0;
  v4 = result + 2;
  v5.i64[0] = 0xF000F000F000F000;
  v5.i64[1] = 0xF000F000F000F000;
  do
  {
    v6 = vminq_u16(vsqaddq_u16(v4[-1], *(int16x8_t *)(a3 + v3 + 16)), v5);
    v7 = vminq_u16(vsqaddq_u16(*v4, *(int16x8_t *)(a3 + v3 + 32)), v5);
    v8 = vminq_u16(vsqaddq_u16(v4[1], *(int16x8_t *)(a3 + v3 + 48)), v5);
    v4[-2] = vminq_u16(vsqaddq_u16(v4[-2], *(int16x8_t *)(a3 + v3)), v5);
    v4[-1] = v6;
    *v4 = v7;
    v4[1] = v8;
    v3 += 64;
    v4 = (uint16x8_t *)((char *)v4 + 2 * a2);
  }
  while ((_DWORD)v3 != 2048);
  return result;
}

uint16x8_t *sub_1C982268C(uint16x8_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint16x8_t *v4;
  uint16x8_t v5;
  _OWORD *v6;
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  int16x8_t v10;
  uint16x8_t v11;
  uint16x8_t v12;
  uint16x8_t v13;

  v3 = 0;
  v4 = result + 2;
  v5.i64[0] = 0xF000F000F000F000;
  v5.i64[1] = 0xF000F000F000F000;
  do
  {
    v6 = (_OWORD *)(a3 + v3);
    v7 = *(int16x8_t *)(a3 + v3);
    v8 = *(int16x8_t *)(a3 + v3 + 16);
    v9 = *(int16x8_t *)(a3 + v3 + 32);
    v10 = *(int16x8_t *)(a3 + v3 + 48);
    *v6 = 0uLL;
    v6[1] = 0uLL;
    v6[2] = 0uLL;
    v6[3] = 0uLL;
    v11 = vminq_u16(vsqaddq_u16(v4[-1], v8), v5);
    v12 = vminq_u16(vsqaddq_u16(*v4, v9), v5);
    v13 = vminq_u16(vsqaddq_u16(v4[1], v10), v5);
    v4[-2] = vminq_u16(vsqaddq_u16(v4[-2], v7), v5);
    v4[-1] = v11;
    *v4 = v12;
    v4[1] = v13;
    v3 += 64;
    v4 = (uint16x8_t *)((char *)v4 + 2 * a2);
  }
  while ((_DWORD)v3 != 2048);
  return result;
}

uint16x8_t *sub_1C98226F8(uint16x8_t *result, uint64_t a2, int16x8_t *a3)
{
  uint64_t v3;
  unsigned int v4;
  uint16x8_t v5;
  uint16x8_t *v6;
  uint16x8_t v7;
  uint16x8_t v8;
  uint16x8_t v9;

  v3 = 2 * a2;
  v4 = -2;
  v5.i64[0] = 0xF000F000F000F000;
  v5.i64[1] = 0xF000F000F000F000;
  do
  {
    v6 = (uint16x8_t *)((char *)result + v3);
    v7 = vminq_u16(vsqaddq_u16(result[1], a3[1]), v5);
    v8 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 2 * a2), a3[2]), v5);
    v9 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&result[1] + v3), a3[3]), v5);
    *result = vminq_u16(vsqaddq_u16(*result, *a3), v5);
    result[1] = v7;
    *v6 = v8;
    v6[1] = v9;
    v4 += 2;
    result = (uint16x8_t *)((char *)result + 4 * a2);
    a3 += 4;
  }
  while (v4 < 0xE);
  return result;
}

uint16x8_t *sub_1C982275C(uint16x8_t *result, uint64_t a2, int16x8_t *a3)
{
  uint64_t v3;
  unsigned int v4;
  uint16x8_t v5;
  int16x8_t v6;
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  uint16x8_t *v10;
  uint16x8_t v11;
  uint16x8_t v12;
  uint16x8_t v13;

  v3 = 2 * a2;
  v4 = -2;
  v5.i64[0] = 0xF000F000F000F000;
  v5.i64[1] = 0xF000F000F000F000;
  do
  {
    v6 = *a3;
    v7 = a3[1];
    v8 = a3[2];
    v9 = a3[3];
    *a3 = 0uLL;
    a3[1] = 0uLL;
    a3[2] = 0uLL;
    a3[3] = 0uLL;
    v10 = (uint16x8_t *)((char *)result + v3);
    v11 = vminq_u16(vsqaddq_u16(result[1], v7), v5);
    v12 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 2 * a2), v8), v5);
    v13 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&result[1] + v3), v9), v5);
    *result = vminq_u16(vsqaddq_u16(*result, v6), v5);
    result[1] = v11;
    *v10 = v12;
    v10[1] = v13;
    v4 += 2;
    result = (uint16x8_t *)((char *)result + 4 * a2);
    a3 += 4;
  }
  while (v4 < 0xE);
  return result;
}

uint16x8_t *sub_1C98227CC(uint16x8_t *result, uint64_t a2, int16x8_t *a3)
{
  char v3;
  uint16x8_t v4;
  char v5;
  uint16x8_t v6;
  uint16x8_t v7;
  uint16x8_t v8;

  v3 = 1;
  v4.i64[0] = 0xF000F000F000F000;
  v4.i64[1] = 0xF000F000F000F000;
  do
  {
    v5 = v3;
    v6 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 2 * a2), a3[1]), v4);
    v7 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 4 * a2), a3[2]), v4);
    v8 = vsqaddq_u16(*(uint16x8_t *)((char *)result + 6 * a2), a3[3]);
    *result = vminq_u16(vsqaddq_u16(*result, *a3), v4);
    *(uint16x8_t *)((char *)result + 2 * a2) = v6;
    *(uint16x8_t *)((char *)result + 4 * a2) = v7;
    *(uint16x8_t *)((char *)result + 6 * a2) = vminq_u16(v8, v4);
    result = (uint16x8_t *)((char *)result + 8 * a2);
    a3 += 4;
    v3 = 0;
  }
  while ((v5 & 1) != 0);
  return result;
}

uint16x8_t *sub_1C9822848(uint16x8_t *result, uint64_t a2, int16x8_t *a3)
{
  char v3;
  uint16x8_t v4;
  char v5;
  int16x8_t v6;
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  uint16x8_t v10;
  uint16x8_t v11;
  uint16x8_t v12;

  v3 = 1;
  v4.i64[0] = 0xF000F000F000F000;
  v4.i64[1] = 0xF000F000F000F000;
  do
  {
    v5 = v3;
    v6 = *a3;
    v7 = a3[1];
    v8 = a3[2];
    v9 = a3[3];
    *a3 = 0uLL;
    a3[1] = 0uLL;
    a3[2] = 0uLL;
    a3[3] = 0uLL;
    v10 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 2 * a2), v7), v4);
    v11 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)result + 4 * a2), v8), v4);
    v12 = vsqaddq_u16(*(uint16x8_t *)((char *)result + 6 * a2), v9);
    *result = vminq_u16(vsqaddq_u16(*result, v6), v4);
    *(uint16x8_t *)((char *)result + 2 * a2) = v10;
    *(uint16x8_t *)((char *)result + 4 * a2) = v11;
    *(uint16x8_t *)((char *)result + 6 * a2) = vminq_u16(v12, v4);
    result = (uint16x8_t *)((char *)result + 8 * a2);
    a3 += 4;
    v3 = 0;
  }
  while ((v5 & 1) != 0);
  return result;
}

void *sub_1C98228D0(int16x4_t *a1, int a2)
{
  int16x4_t *v2;
  unint64_t v4;
  int16x4_t *v5;
  unint64_t v6;
  int16x4_t *v7;
  unint64_t v8;
  void *result;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v2 = a1;
  if (a2 <= 16)
  {
    sub_1C970AB50(a1, 0x20u, (uint64_t)&unk_1C9861500);
LABEL_12:
    v8 = -4;
    do
    {
      result = sub_1C9822AC8(v2, 0x20u, (uint64_t)&unk_1C9861510);
      v8 += 4;
      v2 += 32;
    }
    while (v8 < 0x1C);
    return result;
  }
  if (a2 > 0x30)
  {
    if (a2 >= 0xA1)
    {
      v6 = -4;
      v7 = a1;
      do
      {
        sub_1C970FD18(v7);
        v6 += 4;
        ++v7;
      }
      while (v6 < 0x1C);
    }
    else
    {
      v4 = -4;
      v5 = a1;
      do
      {
        sub_1C970B648(v5, 0x20u, (uint64_t)&unk_1C9861540, (int16x4_t *)aZwpf, (int16x4_t *)aZzxurnic6);
        v4 += 4;
        ++v5;
      }
      while (v4 < 0xC);
    }
  }
  else
  {
    sub_1C970AC1C(a1, 0x20u, (uint64_t)&unk_1C9861520, (int16x4_t *)aZzxu);
    sub_1C970AC1C(v2 + 1, 0x20u, (uint64_t)&unk_1C9861520, (int16x4_t *)aZzxu);
  }
  if (a2 <= 32)
    goto LABEL_12;
  if (a2 > 0x50)
  {
    if (a2 >= 0xE1)
    {
      v12 = -4;
      do
      {
        result = sub_1C9822F44(v2);
        v12 += 4;
        v2 += 32;
      }
      while (v12 < 0x1C);
    }
    else
    {
      v11 = -4;
      do
      {
        result = sub_1C9822D3C((int16x8_t *)v2, 0x20u, (uint64_t)&unk_1C9861550, (int16x4_t *)aZwpf, (int16x4_t *)aZzxurnic6);
        v11 += 4;
        v2 += 32;
      }
      while (v11 < 0x1C);
    }
  }
  else
  {
    v10 = -4;
    do
    {
      result = sub_1C9822BA8((int16x8_t *)v2, 0x20u, (uint64_t)&unk_1C9861530, (int16x4_t *)aZzxu);
      v10 += 4;
      v2 += 32;
    }
    while (v10 < 0x1C);
  }
  return result;
}

int16x4_t *sub_1C9822AC8(int16x4_t *result, unsigned int a2, uint64_t a3)
{
  unsigned int v3;
  int16x8_t *v4;
  int16x4_t v5;
  int16x4_t v6;
  int16x4_t v7;
  int32x2_t v8;
  int32x2_t v9;
  int32x4_t v10;
  uint64_t v11;
  int32x2_t v12;
  int32x2_t v13;
  int16x4_t v14;
  int16x4_t v15;
  int16x4_t v16;
  unsigned __int8 *v17;
  int16x8_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int v23;

  v3 = a2 - 1;
  v4 = (int16x8_t *)((char *)&unk_1C9861310 + 4 * a2);
  v5 = *(int16x4_t *)((char *)result + 2 * a2);
  v6 = *(int16x4_t *)((char *)result + 4 * a2);
  v7 = *(int16x4_t *)((char *)result + 6 * a2);
  v8 = (int32x2_t)vtrn1_s16(*result, v5);
  v9 = (int32x2_t)vtrn1_s16(v6, v7);
  v10 = vshll_n_s16((int16x4_t)vzip1_s32(v8, v9), 6uLL);
  v11 = a2 >> 2;
  v12 = (int32x2_t)vtrn2_s16(*result, v5);
  v13 = (int32x2_t)vtrn2_s16(v6, v7);
  v14 = (int16x4_t)vzip2_s32(v8, v9);
  v15 = (int16x4_t)vzip1_s32(v12, v13);
  v16 = (int16x4_t)vzip2_s32(v12, v13);
  v17 = (unsigned __int8 *)(a3 + 1);
  do
  {
    v18 = *v4++;
    v19 = vmlal_laneq_s16(v10, v14, v18, 4);
    v20 = vmlsl_laneq_s16(v10, v14, v18, 4);
    v21 = vmlal_lane_s16(vmull_lane_s16(v16, *(int16x4_t *)v18.i8, 1), v15, *(int16x4_t *)v18.i8, 0);
    v22 = vmlal_lane_s16(vmull_lane_s16(v16, *(int16x4_t *)v18.i8, 3), v15, *(int16x4_t *)v18.i8, 2);
    v23 = *(v17 - 1);
    v18.i32[0] = *v17;
    v17 += 2;
    result[v23] = vqrshrn_n_s32(vaddq_s32(v21, v19), 8uLL);
    result[v18.u32[0]] = vqrshrn_n_s32(vaddq_s32(v22, v20), 8uLL);
    *(int16x4_t *)((char *)result + 2 * (int)(4 * (v3 - v23))) = vqrshrn_n_s32(vsubq_s32(v19, v21), 8uLL);
    *(int16x4_t *)((char *)result + 2 * (int)(4 * (v3 - v18.i32[0]))) = vqrshrn_n_s32(vsubq_s32(v20, v22), 8uLL);
    --v11;
  }
  while (v11);
  return result;
}

int16x8_t *sub_1C9822BA8(int16x8_t *result, unsigned int a2, uint64_t a3, int16x4_t *a4)
{
  unsigned int v4;
  int16x8_t *v5;
  int16x8_t v6;
  int16x8_t v7;
  int16x8_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  int16x8_t v16;
  int32x4_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  int16x8_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int16x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int v31;
  int v32;
  int v33;
  int32x4_t v34;
  int32x4_t v35;
  int32x4_t v36;

  v4 = a2 - 1;
  v5 = (int16x8_t *)((char *)&unk_1C9861310 + 2 * a2);
  v6 = *(int16x8_t *)((char *)result + 4 * a2);
  v7 = *(int16x8_t *)((char *)result + 2 * a2);
  v8 = *(int16x8_t *)((char *)result + 6 * a2);
  v9 = (int32x4_t)vtrn1q_s16(*result, v7);
  v10 = (int32x4_t)vtrn2q_s16(*result, v7);
  v11 = (int32x4_t)vtrn1q_s16(v6, v8);
  v12 = (int32x4_t)vtrn2q_s16(v6, v8);
  v13 = (int16x8_t)vtrn1q_s32(v9, v11);
  v14 = (int16x8_t)vtrn2q_s32(v9, v11);
  v15 = (int16x8_t)vtrn1q_s32(v10, v12);
  v16 = (int16x8_t)vtrn2q_s32(v10, v12);
  v17 = vshll_n_s16(*(int16x4_t *)v13.i8, 6uLL);
  v18 = a2 >> 3;
  v19 = (unsigned __int8 *)(a3 + 3);
  do
  {
    v20 = *v5++;
    v21 = vmlal_high_laneq_s16(v17, v13, v20, 4);
    v22 = vmlsl_high_laneq_s16(v17, v13, v20, 4);
    v23 = vmlal_high_lane_s16(vmull_lane_s16(*(int16x4_t *)v14.i8, *(int16x4_t *)v20.i8, 0), v14, *(int16x4_t *)v20.i8, 1);
    v24 = vmlal_high_lane_s16(vmull_lane_s16(*(int16x4_t *)v14.i8, *(int16x4_t *)v20.i8, 2), v14, *(int16x4_t *)v20.i8, 3);
    v25 = vmlal_high_lane_s16(vmlal_high_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v16.i8, *a4, 1), *(int16x4_t *)v15.i8, *a4, 0), v15, *a4, 2), v16, *a4, 3);
    v26 = vmlal_high_lane_s16(vmlal_high_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v16.i8, a4[1], 1), *(int16x4_t *)v15.i8, a4[1], 0), v15, a4[1], 2), v16, a4[1], 3);
    v27 = a4[3];
    v28 = vmlal_high_lane_s16(vmlal_high_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v16.i8, a4[2], 1), *(int16x4_t *)v15.i8, a4[2], 0), v15, a4[2], 2), v16, a4[2], 3);
    v29 = vaddq_s32(v23, v21);
    v30 = vsubq_s32(v21, v23);
    v31 = *(v19 - 3);
    v32 = *(v19 - 2);
    v33 = *(v19 - 1);
    v20.i32[0] = *v19;
    v19 += 4;
    *(int16x4_t *)&result->i8[8 * v31] = vqrshrn_n_s32(vaddq_s32(v25, v29), 8uLL);
    v34 = vaddq_s32(v24, v22);
    v35 = vsubq_s32(v22, v24);
    *(int16x4_t *)&result->i8[8 * v32] = vqrshrn_n_s32(vaddq_s32(v26, v30), 8uLL);
    v36 = vmlal_high_lane_s16(vmlal_high_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v16.i8, v27, 1), *(int16x4_t *)v15.i8, v27, 0), v15, v27, 2), v16, v27, 3);
    *(int16x4_t *)&result->i8[8 * v33] = vqrshrn_n_s32(vaddq_s32(v28, v34), 8uLL);
    *(int16x4_t *)&result->i8[8 * v20.u32[0]] = vqrshrn_n_s32(vaddq_s32(v36, v35), 8uLL);
    *(int16x4_t *)&result->i8[8 * (v4 - v31)] = vqrshrn_n_s32(vsubq_s32(v29, v25), 8uLL);
    *(int16x4_t *)&result->i8[8 * (v4 - v32)] = vqrshrn_n_s32(vsubq_s32(v30, v26), 8uLL);
    *(int16x4_t *)&result->i8[8 * (v4 - v33)] = vqrshrn_n_s32(vsubq_s32(v34, v28), 8uLL);
    *(int16x4_t *)&result->i8[8 * (v4 - v20.i32[0])] = vqrshrn_n_s32(vsubq_s32(v35, v36), 8uLL);
    a4 += 4;
    --v18;
  }
  while (v18);
  return result;
}

int16x8_t *sub_1C9822D3C(int16x8_t *result, unsigned int a2, uint64_t a3, int16x4_t *a4, int16x4_t *a5)
{
  int16x8_t *v5;
  int16x8_t *v6;
  int16x8_t *v7;
  int16x8_t v8;
  int16x8_t v9;
  int16x8_t v10;
  int16x8_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int16x8_t v16;
  int16x8_t v17;
  int16x8_t v18;
  int16x8_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int16x8_t v24;
  int16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  uint64_t v28;
  int16x8_t *v29;
  int32x4_t v30;
  uint64_t v31;
  int32x4_t *v32;
  int16x8_t v33;
  int32x4_t v34;
  int32x4_t v35;
  int32x4_t v36;
  int32x4_t v37;
  int32x4_t v38;
  int32x4_t v39;
  int16x4_t v40;
  int32x4_t v41;
  int32x4_t v42;
  int32x4_t v43;
  int32x4_t v44;
  int32x4_t v45;
  int32x4_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int32x4_t v50;
  int32x4_t v51;
  int v52;
  _OWORD v53[16];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = (int16x8_t *)((char *)result + 2 * a2);
  v6 = (int16x8_t *)((char *)result + 4 * a2);
  v7 = (int16x8_t *)((char *)result + 6 * a2);
  v8 = result[1];
  v9 = v5[1];
  v10 = v6[1];
  v11 = v7[1];
  v12 = (int32x4_t)vtrn1q_s16(*result, *v5);
  v13 = (int32x4_t)vtrn2q_s16(*result, *v5);
  v14 = (int32x4_t)vtrn1q_s16(*v6, *v7);
  v15 = (int32x4_t)vtrn2q_s16(*v6, *v7);
  v16 = (int16x8_t)vtrn1q_s32(v12, v14);
  v17 = (int16x8_t)vtrn2q_s32(v12, v14);
  v18 = (int16x8_t)vtrn1q_s32(v13, v15);
  v19 = (int16x8_t)vtrn2q_s32(v13, v15);
  v20 = (int32x4_t)vtrn1q_s16(v8, v9);
  v21 = (int32x4_t)vtrn2q_s16(v8, v9);
  v22 = (int32x4_t)vtrn1q_s16(v10, v11);
  v23 = (int32x4_t)vtrn2q_s16(v10, v11);
  v24 = (int16x8_t)vtrn1q_s32(v20, v22);
  v25 = (int16x8_t)vtrn2q_s32(v20, v22);
  v26 = (int16x8_t)vtrn1q_s32(v21, v23);
  v27 = (int16x8_t)vtrn2q_s32(v21, v23);
  v28 = a2 >> 1;
  v29 = (int16x8_t *)((char *)&unk_1C9861310 + 2 * v28);
  v30 = vshll_n_s16(*(int16x4_t *)v16.i8, 6uLL);
  v31 = a2 >> 4;
  v32 = (int32x4_t *)v53;
  do
  {
    v33 = *v29++;
    v34 = vmlal_laneq_s16(v30, *(int16x4_t *)v24.i8, v33, 4);
    v35 = vmlsl_laneq_s16(v30, *(int16x4_t *)v24.i8, v33, 4);
    v36 = vmlal_high_lane_s16(vmull_high_lane_s16(v24, *(int16x4_t *)v33.i8, 1), v16, *(int16x4_t *)v33.i8, 0);
    v37 = vmlal_high_lane_s16(vmull_high_lane_s16(v24, *(int16x4_t *)v33.i8, 3), v16, *(int16x4_t *)v33.i8, 2);
    v38 = vmlal_high_lane_s16(vmlal_lane_s16(vmlal_high_lane_s16(vmull_lane_s16(*(int16x4_t *)v17.i8, *a4, 0), v17, *a4, 1), *(int16x4_t *)v25.i8, *a4, 2), v25, *a4, 3);
    v39 = vmlal_high_lane_s16(vmlal_lane_s16(vmlal_high_lane_s16(vmull_lane_s16(*(int16x4_t *)v17.i8, a4[1], 0), v17, a4[1], 1), *(int16x4_t *)v25.i8, a4[1], 2), v25, a4[1], 3);
    v40 = a4[3];
    v41 = vmlal_high_lane_s16(vmlal_lane_s16(vmlal_high_lane_s16(vmull_lane_s16(*(int16x4_t *)v17.i8, a4[2], 0), v17, a4[2], 1), *(int16x4_t *)v25.i8, a4[2], 2), v25, a4[2], 3);
    v42 = vaddq_s32(v36, v34);
    v43 = vsubq_s32(v34, v36);
    v44 = vaddq_s32(v37, v35);
    v45 = vsubq_s32(v35, v37);
    *v32 = vaddq_s32(v38, v42);
    v32[1] = vaddq_s32(v39, v43);
    v46 = vmlal_high_lane_s16(vmlal_lane_s16(vmlal_high_lane_s16(vmull_lane_s16(*(int16x4_t *)v17.i8, v40, 0), v17, v40, 1), *(int16x4_t *)v25.i8, v40, 2), v25, v40, 3);
    v32[2] = vaddq_s32(v41, v44);
    v32[3] = vaddq_s32(v46, v45);
    v32[4] = vsubq_s32(v42, v38);
    v32[5] = vsubq_s32(v43, v39);
    v32[6] = vsubq_s32(v44, v41);
    v32[7] = vsubq_s32(v45, v46);
    a4 += 4;
    v32 += 8;
    --v31;
  }
  while (v31);
  v47 = 0;
  if (v28 <= 1)
    v48 = 1;
  else
    v48 = v28;
  v49 = 2 * v28;
  do
  {
    v50 = (int32x4_t)v53[v47];
    v51 = vmlal_high_laneq_s16(vmlal_high_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_high_lane_s16(vmlal_high_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v19.i8, *a5, 1), *(int16x4_t *)v18.i8, *a5, 0), v18, *a5, 2), v19, *a5, 3), *(int16x4_t *)v26.i8, *(int16x8_t *)a5->i8, 4), *(int16x4_t *)v27.i8, *(int16x8_t *)a5->i8, 5), v26,
              *(int16x8_t *)a5->i8,
              6),
            v27,
            *(int16x8_t *)a5->i8,
            7);
    v52 = 4 * (~*(unsigned __int8 *)(a3 + v47) + a2);
    *(int16x4_t *)&result->i8[8 * *(unsigned __int8 *)(a3 + v47)] = vqrshrn_n_s32(vaddq_s32(v51, v50), 8uLL);
    *(int16x4_t *)&result->i8[2 * v52] = vqrshrn_n_s32(vsubq_s32(v50, v51), 8uLL);
    ++v47;
    a5 = (int16x4_t *)((char *)a5 + v49);
  }
  while (v48 != v47);
  return result;
}

int16x4_t *sub_1C9822F44(int16x4_t *result)
{
  int16x8_t *v1;
  unint64_t v2;
  int16x8_t v3;
  int16x8_t v4;
  int16x8_t v5;
  int32x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  unint64_t v10;
  int16x4_t v11;
  int16x4_t v12;
  int16x4_t v13;
  int16x4_t v14;
  int16x4_t v15;
  int16x4_t v16;
  int16x4_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int16x4_t v31;
  int16x4_t v32;
  int16x4_t v33;
  int16x4_t v34;
  int16x4_t v35;
  int16x4_t v36;
  int16x4_t v37;
  int16x4_t v38;
  int32x4_t *v39;
  int32x4_t v40;
  int16x8_t v41;
  int32x4_t v42;
  uint64_t v43;
  int16x4_t v44;
  int16x4_t v45;
  int16x4_t v46;
  int16x4_t v47;
  int16x4_t v48;
  int16x4_t v49;
  int16x4_t v50;
  int16x4_t v51;
  int16x4_t v52;
  int16x4_t v53;
  int16x4_t v54;
  int16x4_t v55;
  const __int16 *v56;
  int16x4_t v57;
  int16x4_t v58;
  int16x4_t v59;
  int16x4_t v60;
  int16x8_t v61;
  int16x8_t v62;
  int32x4_t v63;
  int32x4_t v64;
  int v65;
  _OWORD v66[16];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v1 = (int16x8_t *)&result[16];
  v2 = -8;
  do
  {
    v3 = v1[-8];
    v4 = v1[-4];
    v5 = v1[4];
    v6 = (int32x4_t)vtrn1q_s16(v3, v4);
    v7 = (int32x4_t)vtrn2q_s16(v3, v4);
    v8 = (int32x4_t)vtrn1q_s16(*v1, v5);
    v9 = (int32x4_t)vtrn2q_s16(*v1, v5);
    v1[-8] = (int16x8_t)vtrn1q_s32(v6, v8);
    v1[-4] = (int16x8_t)vtrn1q_s32(v7, v9);
    *(int32x4_t *)v1 = vtrn2q_s32(v6, v8);
    v1[4] = (int16x8_t)vtrn2q_s32(v7, v9);
    v2 += 8;
    ++v1;
  }
  while (v2 < 0x18);
  v10 = 0;
  v11 = result[1];
  v12 = result[2];
  v13 = result[3];
  v15 = result[4];
  v14 = result[5];
  v16 = result[6];
  v17 = result[7];
  v18 = vshll_n_s16(*result, 6uLL);
  v19 = vmlal_s16(v18, v15, (int16x4_t)0x40004000400040);
  v20 = vmlsl_s16(v18, v15, (int16x4_t)0x40004000400040);
  v21 = vmlal_s16(vmull_s16(v16, (int16x4_t)0x24002400240024), v12, (int16x4_t)0x53005300530053);
  v22 = vmlal_s16(vmull_s16(v16, (int16x4_t)0x52005200520052), v12, (int16x4_t)0x24002400240024);
  v23 = vaddq_s32(v21, v19);
  v24 = vsubq_s32(v19, v21);
  v25 = vaddq_s32(v22, v20);
  v26 = vsubq_s32(v20, v22);
  v27 = vmlal_s16(vmlal_s16(vmlal_s16(vmull_s16(v13, (int16x4_t)0x4B004B004B004BLL), v11, (int16x4_t)0x59005900590059), v14, (int16x4_t)0x32003200320032), v17, (int16x4_t)0x12001200120012);
  v28 = vmlal_s16(vmlal_s16(vmlal_s16(vmull_s16(v13, (int16x4_t)0x31003100310031), v11, (int16x4_t)0x12001200120012), v14, (int16x4_t)0x4B004B004B004BLL), v17, (int16x4_t)0x58005800580058);
  v29 = vmlal_s16(vmlal_s16(vmlal_s16(vmull_s16(v13, (int16x4_t)0x11001100110011), v11, (int16x4_t)0x4B004B004B004BLL), v14, (int16x4_t)0x58005800580058), v17, (int16x4_t)0x31003100310031);
  v66[0] = vaddq_s32(v27, v23);
  v66[1] = vaddq_s32(v28, v24);
  v30 = vmlal_s16(vmlal_s16(vmlal_s16(vmull_s16(v13, (int16x4_t)0x58005800580058), v11, (int16x4_t)0x32003200320032), v14, (int16x4_t)0x12001200120012), v17, (int16x4_t)0x4B004B004B004BLL);
  v66[2] = vaddq_s32(v29, v25);
  v66[3] = vaddq_s32(v30, v26);
  v66[4] = vsubq_s32(v23, v27);
  v66[5] = vsubq_s32(v24, v28);
  v66[6] = vsubq_s32(v25, v29);
  v66[7] = vsubq_s32(v26, v30);
  v31 = result[16];
  v32 = result[17];
  v33 = result[18];
  v34 = result[19];
  v35 = result[20];
  v36 = result[21];
  v37 = result[22];
  v38 = result[23];
  do
  {
    v39 = (int32x4_t *)&v66[v10 / 8];
    v40 = (int32x4_t)v66[v10 / 8];
    v41 = *(int16x8_t *)&aZwpf9[v10];
    v42 = vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmull_lane_s16(v32, *(int16x4_t *)v41.i8, 1), v31, *(int16x4_t *)v41.i8, 0), v33, *(int16x4_t *)v41.i8, 2), v34, *(int16x4_t *)v41.i8, 3), v35, v41, 4), v36, v41, 5), v37,
              v41,
              6),
            v38,
            v41,
            7);
    *v39 = vaddq_s32(v42, v40);
    v39[8] = vsubq_s32(v40, v42);
    v10 += 8;
  }
  while (v10 != 64);
  v43 = 0;
  v44 = result[8];
  v45 = result[9];
  v46 = result[24];
  v47 = result[25];
  v48 = result[10];
  v49 = result[11];
  v50 = result[26];
  v51 = result[27];
  v52 = result[12];
  v53 = result[13];
  v54 = result[28];
  v55 = result[29];
  v56 = aZzxurnic6;
  v57 = result[14];
  v58 = result[15];
  v59 = result[30];
  v60 = result[31];
  do
  {
    v61 = *(int16x8_t *)v56;
    v62 = *((int16x8_t *)v56 + 1);
    v56 += 16;
    v63 = (int32x4_t)v66[byte_1C98617E0[v43]];
    v64 = vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmull_lane_s16(v46, *(int16x4_t *)v61.i8, 1), v44, *(int16x4_t *)v61.i8, 0), v45,
                                      *(int16x4_t *)v61.i8,
                                      2),
                                    v47,
                                    *(int16x4_t *)v61.i8,
                                    3),
                                  v48,
                                  v61,
                                  4),
                                v50,
                                v61,
                                5),
                              v49,
                              v61,
                              6),
                            v51,
                            v61,
                            7),
                          v52,
                          *(int16x4_t *)v62.i8,
                          0),
                        v54,
                        *(int16x4_t *)v62.i8,
                        1),
                      v53,
                      *(int16x4_t *)v62.i8,
                      2),
                    v55,
                    *(int16x4_t *)v62.i8,
                    3),
                  v57,
                  v62,
                  4),
                v59,
                v62,
                5),
              v58,
              v62,
              6),
            v60,
            v62,
            7);
    v65 = 124 - 4 * *((unsigned __int8 *)&unk_1C9861500 + v43 + 80);
    result[*((unsigned __int8 *)&unk_1C9861500 + v43 + 80)] = vqrshrn_n_s32(vaddq_s32(v64, v63), 8uLL);
    *(int16x4_t *)((char *)result + 2 * v65) = vqrshrn_n_s32(vsubq_s32(v63, v64), 8uLL);
    ++v43;
  }
  while (v43 != 16);
  return result;
}

int16x4_t *sub_1C98231F8(int16x4_t *result, int a2)
{
  int16x4_t *v2;
  int16x8_t v3;
  unsigned int v4;
  unint64_t v6;
  int16x4_t *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v2 = result;
  if (a2 == 1)
  {
    v3 = vdupq_n_s16((result->i16[0] + 5) >> 3);
    v4 = -32;
    do
    {
      *(int16x8_t *)v2->i8 = v3;
      *(int16x8_t *)v2[2].i8 = v3;
      *(int16x8_t *)v2[4].i8 = v3;
      *(int16x8_t *)v2[6].i8 = v3;
      v4 += 32;
      v2 += 8;
    }
    while (v4 < 0xE0);
    return result;
  }
  if (a2 <= 16)
  {
    sub_1C970AB50(result, 0x10u, (uint64_t)&unk_1C9861410);
LABEL_12:
    v8 = -4;
    do
    {
      result = sub_1C9822AC8(v2, 0x10u, (uint64_t)&unk_1C98614F0);
      v8 += 4;
      v2 += 16;
    }
    while (v8 < 0xC);
    return result;
  }
  if (a2 >= 0x31)
  {
    v6 = -4;
    v7 = result;
    do
    {
      sub_1C970B648(v7, 0x10u, (uint64_t)&unk_1C9861460, (int16x4_t *)aYk2, (int16x4_t *)aZwpf9);
      v6 += 4;
      ++v7;
    }
    while (v6 < 0xC);
  }
  else
  {
    sub_1C970AC1C(result, 0x10u, (uint64_t)&unk_1C9861410, (int16x4_t *)aZwpf);
    sub_1C970AC1C(v2 + 1, 0x10u, (uint64_t)&unk_1C9861410, (int16x4_t *)aZwpf);
  }
  if (a2 <= 32)
    goto LABEL_12;
  if (a2 >= 0x51)
  {
    v10 = -4;
    do
    {
      result = (int16x4_t *)sub_1C9822D3C((int16x8_t *)v2, 0x10u, (uint64_t)&unk_1C98614F8, (int16x4_t *)aYk2, (int16x4_t *)aZwpf9);
      v10 += 4;
      v2 += 16;
    }
    while (v10 < 0xC);
  }
  else
  {
    v9 = -4;
    do
    {
      result = (int16x4_t *)sub_1C9822BA8((int16x8_t *)v2, 0x10u, (uint64_t)&unk_1C98614F0, (int16x4_t *)aZwpf);
      v9 += 4;
      v2 += 16;
    }
    while (v9 < 0xC);
  }
  return result;
}

int16x4_t *sub_1C98233D4(int16x4_t *result, int a2)
{
  int16x4_t *v2;
  int16x8_t v3;
  char v4;
  char v5;

  v2 = result;
  if (a2 == 1)
  {
    v3 = vdupq_n_s16((result->i16[0] + 5) >> 3);
    v4 = 1;
    do
    {
      v5 = v4;
      *(int16x8_t *)v2->i8 = v3;
      *(int16x8_t *)v2[2].i8 = v3;
      *(int16x8_t *)v2[4].i8 = v3;
      *(int16x8_t *)v2[6].i8 = v3;
      v2 += 8;
      v4 = 0;
    }
    while ((v5 & 1) != 0);
  }
  else if (a2 > 16)
  {
    sub_1C970AC1C(result, 8u, (uint64_t)&unk_1C98612E0, (int16x4_t *)aYk2);
    sub_1C970AC1C(v2 + 1, 8u, (uint64_t)&unk_1C98612E0, (int16x4_t *)aYk2);
    sub_1C9822BA8((int16x8_t *)v2, 8u, (uint64_t)&unk_1C98612E0, (int16x4_t *)aYk2);
    return (int16x4_t *)sub_1C9822BA8((int16x8_t *)&v2[8], 8u, (uint64_t)&unk_1C98612E0, (int16x4_t *)aYk2);
  }
  else
  {
    sub_1C970AB50(result, 8u, (uint64_t)&unk_1C98612E0);
    sub_1C9822AC8(v2, 8u, (uint64_t)&unk_1C98612E0);
    return sub_1C9822AC8(v2 + 8, 8u, (uint64_t)&unk_1C98612E0);
  }
  return result;
}

int32x4_t sub_1C98234DC(int32x4_t *a1, int a2)
{
  int32x4_t result;
  int16x4_t v3;
  int16x4_t v4;
  int16x4_t v5;
  int32x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int16x4_t v11;
  int16x4_t v12;
  int32x2_t v13;
  int32x2_t v14;
  int16x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int16x4_t v25;
  int16x4_t v26;

  if (a2 == 1)
  {
    result = (int32x4_t)vdupq_n_s16((a1->i16[0] + 5) >> 3);
    *a1 = result;
    a1[1] = result;
  }
  else
  {
    v3 = (int16x4_t)a1->u64[1];
    v4 = *(int16x4_t *)a1[1].i8;
    v5 = (int16x4_t)a1[1].u64[1];
    v6 = vsubl_s16(*(int16x4_t *)a1->i8, v4);
    v7 = vshlq_n_s32(vaddl_s16(v4, *(int16x4_t *)a1->i8), 6uLL);
    v8 = vshlq_n_s32(v6, 6uLL);
    v9 = vmlal_s16(vmull_s16(v5, (int16x4_t)0x24002400240024), v3, (int16x4_t)0x53005300530053);
    v10 = vmlsl_s16(vmull_s16(v3, (int16x4_t)0x24002400240024), v5, (int16x4_t)0x53005300530053);
    v11 = vqrshrn_n_s32(vaddq_s32(v9, v7), 7uLL);
    *(int16x4_t *)v7.i8 = vqrshrn_n_s32(vsubq_s32(v7, v9), 7uLL);
    v12 = vqrshrn_n_s32(vaddq_s32(v10, v8), 7uLL);
    *(int16x4_t *)v8.i8 = vqrshrn_n_s32(vsubq_s32(v8, v10), 7uLL);
    *(int16x4_t *)v10.i8 = vtrn1_s16(v11, v12);
    v13 = (int32x2_t)vtrn2_s16(v11, v12);
    v14 = (int32x2_t)vtrn1_s16(*(int16x4_t *)v8.i8, *(int16x4_t *)v7.i8);
    *(int16x4_t *)v8.i8 = vtrn2_s16(*(int16x4_t *)v8.i8, *(int16x4_t *)v7.i8);
    *(int32x2_t *)v7.i8 = vzip1_s32(*(int32x2_t *)v10.i8, v14);
    v15 = (int16x4_t)vzip2_s32(*(int32x2_t *)v10.i8, v14);
    v16 = vaddl_s16(*(int16x4_t *)v7.i8, v15);
    v17 = vsubl_s16(*(int16x4_t *)v7.i8, v15);
    v18 = vshlq_n_s32(v16, 6uLL);
    v19 = vshlq_n_s32(v17, 6uLL);
    *(int32x2_t *)v16.i8 = vzip1_s32(v13, *(int32x2_t *)v8.i8);
    *(int32x2_t *)v8.i8 = vzip2_s32(v13, *(int32x2_t *)v8.i8);
    v20 = vmlal_s16(vmull_s16(*(int16x4_t *)v8.i8, (int16x4_t)0x24002400240024), *(int16x4_t *)v16.i8, (int16x4_t)0x53005300530053);
    v21 = vmlsl_s16(vmull_s16(*(int16x4_t *)v16.i8, (int16x4_t)0x24002400240024), *(int16x4_t *)v8.i8, (int16x4_t)0x53005300530053);
    result = vaddq_s32(v18, v20);
    v22 = vsubq_s32(v18, v20);
    v23 = vaddq_s32(v19, v21);
    v24 = vsubq_s32(v19, v21);
    v25 = vqrshrn_n_s32(result, 8uLL);
    *(int16x4_t *)v21.i8 = vqrshrn_n_s32(v22, 8uLL);
    v26 = vqrshrn_n_s32(v23, 8uLL);
    *(int16x4_t *)v16.i8 = vqrshrn_n_s32(v24, 8uLL);
    vst4_s16(a1->i16, *(int16x4x4_t *)(&v16 - 1));
  }
  return result;
}

uint16x8_t sub_1C98235B4(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint16x8_t *a5, uint16x8_t *a6)
{
  int8x16_t v6;
  int8x16_t v7;
  int8x16_t v8;
  int8x16_t v9;
  uint8x16_t v10;
  uint8x16_t v11;
  uint8x16_t v12;
  uint8x16_t v13;
  uint16x8_t result;

  v6.i64[0] = *(uint64_t *)((char *)a1 + 2 * a2);
  v7.i64[0] = *a1;
  v8.i64[0] = *(uint64_t *)((char *)a3 + 2 * a4);
  v9.i64[0] = *a3;
  v7.i64[1] = *(uint64_t *)((char *)a1 + a2);
  v6.i64[1] = *(uint64_t *)((char *)a1 + 3 * a2);
  v9.i64[1] = *(uint64_t *)((char *)a3 + a4);
  v8.i64[1] = *(uint64_t *)((char *)a3 + 3 * a4);
  v10 = (uint8x16_t)vuzp1q_s8(v7, v6);
  v11 = (uint8x16_t)vuzp2q_s8(v7, v6);
  v12 = (uint8x16_t)vuzp1q_s8(v9, v8);
  v13 = (uint8x16_t)vuzp2q_s8(v9, v8);
  *a5 = vsubl_u8(*(uint8x8_t *)v10.i8, *(uint8x8_t *)v12.i8);
  a5[1] = vsubl_high_u8(v10, v12);
  result = vsubl_high_u8(v11, v13);
  *a6 = vsubl_u8(*(uint8x8_t *)v11.i8, *(uint8x8_t *)v13.i8);
  a6[1] = result;
  return result;
}

uint16x8_t sub_1C9823620(const char *a1, uint64_t a2, const char *a3, uint64_t a4, uint16x8_t *a5, uint16x8_t *a6)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  const char *v9;
  const char *v10;
  uint16x8_t v11;
  uint16x8_t result;
  int8x8x2_t v13;
  int8x8x2_t v14;
  int8x8x2_t v15;
  int8x8x2_t v16;

  v8 = -2;
  do
  {
    v9 = &a1[a2];
    v13 = vld2_s8(a1);
    v6 = 2 * a2;
    a1 += v6;
    v14 = vld2_s8(v9);
    v10 = &a3[a4];
    v15 = vld2_s8(a3);
    v7 = 2 * a4;
    a3 += v7;
    v16 = vld2_s8(v10);
    v11 = vsubl_u8((uint8x8_t)v13.val[0], (uint8x8_t)v15.val[0]);
    result = vsubl_u8((uint8x8_t)v13.val[1], (uint8x8_t)v15.val[1]);
    *a5 = v11;
    a5[1] = vsubl_u8((uint8x8_t)v14.val[0], (uint8x8_t)v16.val[0]);
    a5 += 2;
    *a6 = result;
    a6[1] = vsubl_u8((uint8x8_t)v14.val[1], (uint8x8_t)v16.val[1]);
    a6 += 2;
    v8 += 2;
  }
  while (v8 < 6);
  return result;
}

uint16x8_t sub_1C982366C(const char *a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint16x8_t *v7;
  uint16x8_t *v8;
  uint16x8_t v9;
  uint16x8_t v10;
  uint16x8_t result;
  int8x16x2_t v12;
  int8x16x2_t v13;

  v6 = 0;
  do
  {
    v12 = vld2q_s8(a1);
    a1 += a2;
    v13 = vld2q_s8(a3);
    a3 += a4;
    v7 = (uint16x8_t *)(a5 + v6);
    v8 = (uint16x8_t *)(a6 + v6);
    v9 = vsubl_u8(*(uint8x8_t *)v12.val[0].i8, *(uint8x8_t *)v13.val[0].i8);
    v10 = vsubl_high_u8((uint8x16_t)v12.val[0], (uint8x16_t)v13.val[0]);
    result = vsubl_high_u8((uint8x16_t)v12.val[1], (uint8x16_t)v13.val[1]);
    *v7 = v9;
    v7[1] = v10;
    *v8 = vsubl_u8(*(uint8x8_t *)v12.val[1].i8, *(uint8x8_t *)v13.val[1].i8);
    v8[1] = result;
    v6 += 32;
  }
  while ((_DWORD)v6 != 512);
  return result;
}

int16x4_t sub_1C98236A8(int16x4_t *a1)
{
  int16x4_t v1;
  int16x4_t v2;
  int16x4_t v3;
  int32x2_t v4;
  int32x2_t v5;
  int32x2_t v6;
  int32x2_t v7;
  int16x4_t v8;
  int16x4_t v9;
  int16x4_t v10;
  int16x4_t v11;
  int16x4_t v12;
  int16x4_t v13;
  int16x4_t v14;
  int16x4_t v15;
  int16x4_t v17[6];

  v17[5] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v1 = a1[1];
  v2 = a1[2];
  v3 = a1[3];
  v4 = (int32x2_t)vtrn1_s16(*a1, v1);
  v5 = (int32x2_t)vtrn2_s16(*a1, v1);
  v6 = (int32x2_t)vtrn1_s16(v2, v3);
  v7 = (int32x2_t)vtrn2_s16(v2, v3);
  v8 = (int16x4_t)vzip1_s32(v5, v7);
  v9 = (int16x4_t)vzip2_s32(v4, v6);
  v10 = (int16x4_t)vzip2_s32(v5, v7);
  v11 = (int16x4_t)vzip1_s32(v4, v6);
  v12 = vadd_s16(v10, v11);
  v13 = vsub_s16(v11, v10);
  v14 = vadd_s16(v9, v8);
  v15 = vsub_s16(v8, v9);
  v17[0] = vqmovn_s32(vrshrq_n_s32(vshlq_n_s32(vaddl_s16(v14, v12), 6uLL), 1uLL));
  v17[1] = vqmovn_s32(vrshrq_n_s32(vmlal_s16(vmull_s16(v15, (int16x4_t)0x24002400240024), v13, (int16x4_t)0x53005300530053), 1uLL));
  v17[2] = vqmovn_s32(vrshrq_n_s32(vshlq_n_s32(vsubl_s16(v12, v14), 6uLL), 1uLL));
  v17[3] = vqmovn_s32(vrshrq_n_s32(vmlsl_s16(vmull_s16(v13, (int16x4_t)0x24002400240024), v15, (int16x4_t)0x53005300530053), 1uLL));
  return sub_1C981AF54(a1, v17);
}

void sub_1C982377C(int16x4_t *a1)
{
  int16x4_t v2[18];

  v2[17] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  sub_1C981ADF0(v2, a1, 2);
  sub_1C981AE94(a1, v2);
}

void sub_1C98237E8(int16x4_t *a1)
{
  int16x4_t v2[66];

  v2[65] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  sub_1C981AB1C(v2, a1, 3);
  sub_1C981AC68(a1, v2);
}

int16x8_t sub_1C9823854(uint8x16_t *a1, uint64_t a2, int16x4_t *a3, const __int16 *a4, int16x4_t *a5, int *a6)
{
  int16x4_t *v7;
  int16x4_t *v8;
  uint8x16_t *v10;
  int v11;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t result;
  int v16;
  int16x4_t *v17;
  int32x4_t v18;
  uint64_t v19;
  char v20;
  int16x8_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int16x8_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int16x8_t v34;
  int32x4_t v35;
  int16x8_t v36;
  int16x8_t v37;
  char v38;
  uint8x8_t *v39;
  int8x16_t v40;
  int8x16_t v41;
  unsigned int v42;
  int16x4_t *v43;
  unint64_t v44;
  int16x8_t *v45;
  int16x8_t v46;
  int16x8_t v47;
  int16x8_t v48;
  int32x4_t v49;
  int32x4_t v50;
  int32x4_t v51;
  int32x4_t v52;
  BOOL v53;
  int v54;
  unsigned int v55;
  int16x4_t *v56;
  unint64_t v57;
  int16x8_t *v58;
  int16x8_t v59;
  int16x8_t v60;
  int16x8_t v61;
  int32x4_t v62;
  int32x4_t v63;
  int32x4_t v64;
  int32x4_t v65;
  unsigned int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int32x4_t v71;
  unint64_t v72;
  uint64_t v73;
  int16x8_t *v74;
  int16x8_t v75;
  int16x8_t v76;
  int16x8_t v77;
  int16x8_t v78;
  int16x4_t *v79;
  int16x8_t v80;
  int16x8_t v81;
  int16x8_t v82;
  int32x4_t v83;
  int32x4_t v84;
  int32x4_t v85;
  int32x4_t v86;
  int16x8_t v87;
  int16x8_t v88;
  int16x8_t v89;
  int16x8_t v90;
  int16x8_t v91;
  int32x4_t v92;
  int32x4_t v93;
  int32x4_t v94;
  int32x4_t v95;
  int16x8_t v96;
  int16x8_t v97;
  int16x8_t v98;
  int16x8_t v99;
  int16x4_t v100;
  int16x8_t v101;
  int16x8_t v102;
  int32x4_t v103;
  int32x4_t v104;
  int32x4_t v105;
  int32x4_t v106;
  int32x4_t v107;
  int32x4_t v108;
  int32x4_t v109;
  int16x8_t v110;
  int16x8_t v111;
  int32x4_t v112;
  int32x4_t v113;
  int32x4_t v114;
  int32x4_t v115;
  int32x4_t v116;
  int32x4_t v117;
  int32x4_t v118;
  int16x8_t v119;
  int16x8_t v120;
  int16x8_t v121;
  int16x8_t v122;
  int16x8_t v123;
  int16x8_t v124;
  int16x8_t v125;
  int16x8_t v126;
  int8x16_t v127;
  int8x16_t v128;
  int8x16_t v129;
  int8x16_t v130;
  int16x8_t v131;
  uint8x16_t v132;
  uint8x16_t v133;
  uint8x16_t *v134;
  int v135;
  uint8x16_t v136;
  uint8x16_t v137;

  v7 = (int16x4_t *)a4;
  v8 = a3;
  v10 = a1;
  v11 = *a6;
  if ((*a6 & 0xFFFEFFFE) != 0)
  {
    if ((__int16)v11 < 1)
    {
      if ((v11 & 0x8000) != 0)
      {
        v42 = 0;
        v43 = a3 + 16;
        do
        {
          v44 = -8;
          v45 = (int16x8_t *)v43;
          do
          {
            v46 = v45[-8];
            v47 = v45[-4];
            v48 = v45[4];
            v49 = (int32x4_t)vtrn1q_s16(v46, v47);
            v50 = (int32x4_t)vtrn2q_s16(v46, v47);
            v51 = (int32x4_t)vtrn1q_s16(*v45, v48);
            v52 = (int32x4_t)vtrn2q_s16(*v45, v48);
            v45[-8] = (int16x8_t)vtrn1q_s32(v49, v51);
            v45[-4] = (int16x8_t)vtrn1q_s32(v50, v52);
            *(int32x4_t *)v45 = vtrn2q_s32(v49, v51);
            v45[4] = (int16x8_t)vtrn2q_s32(v50, v52);
            v44 += 8;
            ++v45;
          }
          while (v44 < 0x18);
          v43 += 32;
          v53 = v42 >= 0x1C;
          v42 += 4;
        }
        while (!v53);
      }
    }
    else
    {
      sub_1C97023B8(a3, (unsigned __int16)*a6);
    }
    v54 = *((unsigned __int16 *)a6 + 1);
    if (*((__int16 *)a6 + 1) < 1)
    {
      if ((v54 & 0x8000) != 0)
      {
        v55 = 0;
        v56 = v7 + 16;
        do
        {
          v57 = -8;
          v58 = (int16x8_t *)v56;
          do
          {
            v59 = v58[-8];
            v60 = v58[-4];
            v61 = v58[4];
            v62 = (int32x4_t)vtrn1q_s16(v59, v60);
            v63 = (int32x4_t)vtrn2q_s16(v59, v60);
            v64 = (int32x4_t)vtrn1q_s16(*v58, v61);
            v65 = (int32x4_t)vtrn2q_s16(*v58, v61);
            v58[-8] = (int16x8_t)vtrn1q_s32(v62, v64);
            v58[-4] = (int16x8_t)vtrn1q_s32(v63, v65);
            *(int32x4_t *)v58 = vtrn2q_s32(v62, v64);
            v58[4] = (int16x8_t)vtrn2q_s32(v63, v65);
            v57 += 8;
            ++v58;
          }
          while (v57 < 0x18);
          v56 += 32;
          v53 = v55 >= 0x1C;
          v55 += 4;
        }
        while (!v53);
      }
    }
    else
    {
      sub_1C97023B8(v7, v54);
    }
    v66 = 0;
    v67 = 4 * a2;
    v68 = (uint64_t)v10->i64 + 3 * a2;
    v69 = (uint64_t)v10->i64 + 2 * a2;
    v70 = (uint64_t)v10->i64 + a2;
    result = 0uLL;
    v71.i64[0] = 0x800000008;
    v71.i64[1] = 0x800000008;
    do
    {
      v72 = -8;
      v73 = -2048;
      do
      {
        v74 = (int16x8_t *)&v8[(unint64_t)v73 / 8];
        v75 = *(int16x8_t *)v8[(unint64_t)v73 / 8 + 256].i8;
        v76 = *(int16x8_t *)v8[(unint64_t)v73 / 8 + 264].i8;
        v77 = *(int16x8_t *)v8[(unint64_t)v73 / 8 + 272].i8;
        v78 = *(int16x8_t *)v8[(unint64_t)v73 / 8 + 280].i8;
        v79 = &v7[(unint64_t)v73 / 8];
        v80 = *(int16x8_t *)v7[(unint64_t)v73 / 8 + 256].i8;
        v81 = *(int16x8_t *)v7[(unint64_t)v73 / 8 + 264].i8;
        v82 = *(int16x8_t *)v7[(unint64_t)v73 / 8 + 272].i8;
        v83 = (int32x4_t)vtrn1q_s16(v75, v76);
        v84 = (int32x4_t)vtrn2q_s16(v75, v76);
        v85 = (int32x4_t)vtrn1q_s16(v77, v78);
        v86 = (int32x4_t)vtrn2q_s16(v77, v78);
        v87 = *(int16x8_t *)v7[(unint64_t)v73 / 8 + 280].i8;
        v74[128] = 0uLL;
        v74[132] = 0uLL;
        v74[136] = 0uLL;
        v74[140] = 0uLL;
        *(_OWORD *)v79[256].i8 = 0uLL;
        *(_OWORD *)v79[264].i8 = 0uLL;
        *(_OWORD *)v79[272].i8 = 0uLL;
        *(_OWORD *)v79[280].i8 = 0uLL;
        v88 = (int16x8_t)vtrn1q_s32(v83, v85);
        v89 = (int16x8_t)vtrn2q_s32(v83, v85);
        v90 = (int16x8_t)vtrn1q_s32(v84, v86);
        v91 = (int16x8_t)vtrn2q_s32(v84, v86);
        v92 = (int32x4_t)vtrn1q_s16(v80, v81);
        v93 = (int32x4_t)vtrn2q_s16(v80, v81);
        v94 = (int32x4_t)vtrn1q_s16(v82, v87);
        v95 = (int32x4_t)vtrn2q_s16(v82, v87);
        v96 = (int16x8_t)vtrn1q_s32(v92, v94);
        v97 = (int16x8_t)vtrn2q_s32(v92, v94);
        v98 = (int16x8_t)vtrn1q_s32(v93, v95);
        v99 = (int16x8_t)vtrn2q_s32(v93, v95);
        if (a5)
        {
          v100 = *a5;
          v101 = *v74;
          v102 = v74[4];
          *v74 = 0uLL;
          v74[4] = 0uLL;
          v103 = vdupq_laneq_s32(vsubw_s16(v71, v100), 2);
          v104 = vshlq_s32(vmovl_s16(*(int16x4_t *)v101.i8), v103);
          v105 = vshlq_s32(vmovl_high_s16(v101), v103);
          v106 = vshlq_s32(vmovl_s16(*(int16x4_t *)v102.i8), v103);
          v107 = vshlq_s32(vmovl_high_s16(v102), v103);
          v108 = vmovl_s16(vdup_lane_s16(v100, 0));
          v109 = vmovl_s16(vdup_lane_s16(v100, 1));
          v88 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v104, v108), 3uLL), vmulq_s32(v105, v108), 3uLL), v88);
          v96 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v104, v109), 3uLL), vmulq_s32(v105, v109), 3uLL), v96);
          v90 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v106, v108), 3uLL), vmulq_s32(v107, v108), 3uLL), v90);
          v98 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v106, v109), 3uLL), vmulq_s32(v107, v109), 3uLL), v98);
          *(int16x4_t *)v109.i8 = *a5;
          v110 = v74[8];
          v111 = v74[12];
          v74[8] = 0uLL;
          v74[12] = 0uLL;
          v112 = vdupq_laneq_s32(vsubw_s16(v71, *(int16x4_t *)v109.i8), 2);
          v113 = vshlq_s32(vmovl_s16(*(int16x4_t *)v110.i8), v112);
          v114 = vshlq_s32(vmovl_high_s16(v110), v112);
          v115 = vshlq_s32(vmovl_s16(*(int16x4_t *)v111.i8), v112);
          v116 = vshlq_s32(vmovl_high_s16(v111), v112);
          v117 = vmovl_s16(vdup_lane_s16(*(int16x4_t *)v109.i8, 0));
          v118 = vmovl_s16(vdup_lane_s16(*(int16x4_t *)v109.i8, 1));
          v89 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v113, v117), 3uLL), vmulq_s32(v114, v117), 3uLL), v89);
          v97 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v113, v118), 3uLL), vmulq_s32(v114, v118), 3uLL), v97);
          v91 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v115, v117), 3uLL), vmulq_s32(v116, v117), 3uLL), v91);
          v99 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v115, v118), 3uLL), vmulq_s32(v116, v118), 3uLL), v99);
        }
        v119 = vzip1q_s16(v88, v96);
        v120 = vzip2q_s16(v88, v96);
        v121 = vzip1q_s16(v90, v98);
        v122 = vzip2q_s16(v90, v98);
        v123 = vzip1q_s16(v89, v97);
        v124 = vzip2q_s16(v89, v97);
        v125 = vzip1q_s16(v91, v99);
        v126 = vzip2q_s16(v91, v99);
        v127 = vqmovun_high_s16(vqmovun_s16(vqaddq_s16(v119, (int16x8_t)vmovl_u8(*(uint8x8_t *)v10[(unint64_t)v73 / 0x10 + 128].i8))), vqaddq_s16(v120, (int16x8_t)vmovl_high_u8(v10[(unint64_t)v73 / 0x10 + 128])));
        v128 = vqmovun_high_s16(vqmovun_s16(vqaddq_s16(v121, (int16x8_t)vmovl_u8(*(uint8x8_t *)(v70 + v73 + 2048)))), vqaddq_s16(v122, (int16x8_t)vmovl_high_u8(*(uint8x16_t *)(v70 + v73 + 2048))));
        v129 = vqmovun_high_s16(vqmovun_s16(vqaddq_s16(v123, (int16x8_t)vmovl_u8(*(uint8x8_t *)(v69 + v73 + 2048)))), vqaddq_s16(v124, (int16x8_t)vmovl_high_u8(*(uint8x16_t *)(v69 + v73 + 2048))));
        v130 = vqmovun_high_s16(vqmovun_s16(vqaddq_s16(v125, (int16x8_t)vmovl_u8(*(uint8x8_t *)(v68 + v73 + 2048)))), vqaddq_s16(v126, (int16x8_t)vmovl_high_u8(*(uint8x16_t *)(v68 + v73 + 2048))));
        v10[(unint64_t)v73 / 0x10 + 128] = (uint8x16_t)v127;
        *(int8x16_t *)(v70 + v73 + 2048) = v128;
        *(int8x16_t *)(v69 + v73 + 2048) = v129;
        *(int8x16_t *)(v68 + v73 + 2048) = v130;
        v72 += 8;
        v73 += 16;
      }
      while (v72 < 0x18);
      v10 = (uint8x16_t *)((char *)v10 + v67);
      v8 += 32;
      v7 += 32;
      v68 += v67;
      v69 += v67;
      v70 += v67;
      v53 = v66 >= 0x1C;
      v66 += 4;
    }
    while (!v53);
  }
  else
  {
    v13 = vld1q_dup_s16((const __int16 *)a3);
    v14 = vld1q_dup_s16(a4);
    result = vrshrq_n_s16(vrshrq_n_s16(vzip1q_s16(v13, v14), 1uLL), 6uLL);
    a3->i16[0] = 0;
    *a4 = 0;
    if (a5)
    {
      v16 = 0;
      v17 = a3 - 256;
      v18.i64[0] = 0x800000008;
      v18.i64[1] = 0x800000008;
      do
      {
        v19 = 0;
        v20 = 1;
        do
        {
          v21 = *(int16x8_t *)v17[2].i8;
          v22 = vdupq_laneq_s32(vsubw_s16(v18, *a5), 2);
          v23 = vshlq_s32(vmovl_s16(*v17), v22);
          v24 = vshlq_s32(vmovl_high_s16(*(int16x8_t *)v17->i8), v22);
          v25 = vshlq_s32(vmovl_s16(*(int16x4_t *)v21.i8), v22);
          v26 = vshlq_s32(vmovl_high_s16(v21), v22);
          v27 = vmovl_s16(vdup_lane_s16(*a5, 0));
          v28 = vmulq_s32(v25, v27);
          v29 = vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v23, v27), 3uLL), vmulq_s32(v24, v27), 3uLL);
          v30 = vmovl_s16(vdup_lane_s16(*a5, 1));
          v31 = vmulq_s32(v23, v30);
          v32 = vmulq_s32(v24, v30);
          v33 = vmulq_s32(v25, v30);
          v34 = vshrn_high_n_s32(vshrn_n_s32(v28, 3uLL), vmulq_s32(v26, v27), 3uLL);
          v35 = vmulq_s32(v26, v30);
          v36 = vshrn_high_n_s32(vshrn_n_s32(v31, 3uLL), v32, 3uLL);
          v37 = vshrn_high_n_s32(vshrn_n_s32(v33, 3uLL), v35, 3uLL);
          v38 = v20;
          *(_OWORD *)v17->i8 = 0uLL;
          *(_OWORD *)v17[2].i8 = 0uLL;
          v17 += 4;
          v39 = (uint8x8_t *)&v10[v19];
          v40 = vqmovun_high_s16(vqmovun_s16(vqaddq_s16((int16x8_t)vmovl_u8(*v39), vaddq_s16(vzip1q_s16(v29, v36), result))), vqaddq_s16((int16x8_t)vmovl_high_u8(*(uint8x16_t *)v39->i8), vaddq_s16(vzip2q_s16(v29, v36), result)));
          v41 = vqmovun_high_s16(vqmovun_s16(vqaddq_s16((int16x8_t)vmovl_u8(v39[2]), vaddq_s16(vzip1q_s16(v34, v37), result))), vqaddq_s16((int16x8_t)vmovl_high_u8(*(uint8x16_t *)v39[2].i8), vaddq_s16(vzip2q_s16(v34, v37), result)));
          *(int8x16_t *)v39->i8 = v40;
          *(int8x16_t *)v39[2].i8 = v41;
          v19 = 2;
          v20 = 0;
        }
        while ((v38 & 1) != 0);
        ++v16;
        v10 = (uint8x16_t *)((char *)v10 + a2);
      }
      while (v16 != 32);
    }
    else
    {
      v131 = vnegq_s16(result);
      v132 = (uint8x16_t)vqmovun_high_s16(vqmovun_s16(result), result);
      v133 = (uint8x16_t)vqmovun_high_s16(vqmovun_s16(v131), v131);
      v134 = a1 + 2;
      v135 = 32;
      do
      {
        v136 = vqsubq_u8(vqaddq_u8(v134[-1], v132), v133);
        v134[-2] = vqsubq_u8(vqaddq_u8(v134[-2], v132), v133);
        v134[-1] = v136;
        result = (int16x8_t)vqsubq_u8(vqaddq_u8(*v134, v132), v133);
        v137 = vqsubq_u8(vqaddq_u8(v134[1], v132), v133);
        *v134 = (uint8x16_t)result;
        v134[1] = v137;
        v134 = (uint8x16_t *)((char *)v134 + a2);
        --v135;
      }
      while (v135);
    }
  }
  return result;
}

uint8x8_t *sub_1C9823E34(uint8x8_t *result, uint64_t a2, uint64_t a3, int16x8_t *a4, int16x4_t *a5)
{
  uint64_t v5;
  unsigned int v6;
  int32x4_t v7;
  int16x8_t v8;
  int16x8_t v9;
  int16x8_t v10;
  int16x8_t v11;
  int16x8_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int32x4_t v19;
  uint8x16_t v20;

  v5 = a3 - 128;
  v6 = -2;
  v7.i64[0] = 0x800000008;
  v7.i64[1] = 0x800000008;
  do
  {
    v9 = *(int16x8_t *)(v5 + 128);
    v8 = *(int16x8_t *)(v5 + 144);
    v11 = *a4;
    v10 = a4[1];
    if (a5)
    {
      v12 = *(int16x8_t *)(v5 + 16);
      v13 = vdupq_laneq_s32(vsubw_s16(v7, *a5), 2);
      v14 = vshlq_s32(vmovl_s16(*(int16x4_t *)v5), v13);
      v15 = vshlq_s32(vmovl_high_s16(*(int16x8_t *)v5), v13);
      v16 = vshlq_s32(vmovl_s16(*(int16x4_t *)v12.i8), v13);
      v17 = vshlq_s32(vmovl_high_s16(v12), v13);
      v18 = vmovl_s16(vdup_lane_s16(*a5, 0));
      v19 = vmovl_s16(vdup_lane_s16(*a5, 1));
      v9 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v14, v18), 3uLL), vmulq_s32(v15, v18), 3uLL), v9);
      v8 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v16, v18), 3uLL), vmulq_s32(v17, v18), 3uLL), v8);
      v11 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v14, v19), 3uLL), vmulq_s32(v15, v19), 3uLL), v11);
      v10 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v16, v19), 3uLL), vmulq_s32(v17, v19), 3uLL), v10);
      *(_OWORD *)v5 = 0uLL;
      *(_OWORD *)(v5 + 16) = 0uLL;
    }
    *(_OWORD *)(v5 + 128) = 0uLL;
    *(_OWORD *)(v5 + 144) = 0uLL;
    *a4 = 0uLL;
    a4[1] = 0uLL;
    a4 += 2;
    v20 = *(uint8x16_t *)&result->i8[a2];
    *(int8x16_t *)result->i8 = vqmovun_high_s16(vqmovun_s16(vqaddq_s16((int16x8_t)vmovl_u8(*result), vzip1q_s16(v9, v11))), vqaddq_s16((int16x8_t)vmovl_high_u8(*(uint8x16_t *)result->i8), vzip2q_s16(v9, v11)));
    *(int8x16_t *)&result->i8[a2] = vqmovun_high_s16(vqmovun_s16(vqaddq_s16((int16x8_t)vmovl_u8(*(uint8x8_t *)v20.i8), vzip1q_s16(v8, v10))), vqaddq_s16((int16x8_t)vmovl_high_u8(v20), vzip2q_s16(v8, v10)));
    result = (uint8x8_t *)((char *)result + 2 * a2);
    v6 += 2;
    v5 += 32;
  }
  while (v6 < 6);
  return result;
}

uint8x8_t *sub_1C9823F5C(uint8x8_t *result, uint64_t a2, uint64_t a3, uint64_t a4, int16x4_t *a5)
{
  uint64_t v5;
  uint8x8_t *v6;
  int32x4_t v7;
  int16x8_t *v8;
  _OWORD *v9;
  int16x8_t v10;
  int16x8_t v11;
  int16x8_t v12;
  int16x8_t v13;
  int16x8_t *v14;
  int16x8_t v15;
  int16x8_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int16x8_t v24;
  int16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  uint8x16_t v28;
  int16x8_t v29;
  int16x8_t v30;
  int16x8_t v31;
  int8x16_t v32;
  int8x16_t v33;

  v5 = 0;
  v6 = result + 2;
  v7.i64[0] = 0x800000008;
  v7.i64[1] = 0x800000008;
  do
  {
    v8 = (int16x8_t *)(a3 + v5);
    v9 = (_OWORD *)(a4 + v5);
    v11 = *(int16x8_t *)(a3 + v5);
    v10 = *(int16x8_t *)(a3 + v5 + 16);
    v13 = *(int16x8_t *)(a4 + v5);
    v12 = *(int16x8_t *)(a4 + v5 + 16);
    if (a5)
    {
      v14 = v8 - 32;
      v15 = v8[-32];
      v16 = v8[-31];
      v17 = vdupq_laneq_s32(vsubw_s16(v7, *a5), 2);
      v18 = vshlq_s32(vmovl_s16(*(int16x4_t *)v15.i8), v17);
      v19 = vshlq_s32(vmovl_high_s16(v15), v17);
      v20 = vshlq_s32(vmovl_s16(*(int16x4_t *)v16.i8), v17);
      v21 = vshlq_s32(vmovl_high_s16(v16), v17);
      v22 = vmovl_s16(vdup_lane_s16(*a5, 0));
      v23 = vmovl_s16(vdup_lane_s16(*a5, 1));
      v11 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v18, v22), 3uLL), vmulq_s32(v19, v22), 3uLL), v11);
      v10 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v20, v22), 3uLL), vmulq_s32(v21, v22), 3uLL), v10);
      v13 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v18, v23), 3uLL), vmulq_s32(v19, v23), 3uLL), v13);
      v12 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v20, v23), 3uLL), vmulq_s32(v21, v23), 3uLL), v12);
      *v14 = 0uLL;
      v14[1] = 0uLL;
    }
    *v8 = 0uLL;
    v8[1] = 0uLL;
    v24 = vzip1q_s16(v11, v13);
    v25 = vzip2q_s16(v11, v13);
    v26 = vzip1q_s16(v10, v12);
    v27 = vzip2q_s16(v10, v12);
    *v9 = 0uLL;
    v9[1] = 0uLL;
    v28 = *(uint8x16_t *)v6[-2].i8;
    v29 = (int16x8_t)vmovl_u8(*(uint8x8_t *)v28.i8);
    v30 = vqaddq_s16((int16x8_t)vmovl_high_u8(v28), v25);
    v31 = vqaddq_s16((int16x8_t)vmovl_u8(*v6), v26);
    v32 = vqmovun_high_s16(vqmovun_s16(vqaddq_s16(v29, v24)), v30);
    v33 = vqmovun_high_s16(vqmovun_s16(v31), vqaddq_s16((int16x8_t)vmovl_high_u8(*(uint8x16_t *)v6->i8), v27));
    *(int8x16_t *)v6[-2].i8 = v32;
    *(int8x16_t *)v6->i8 = v33;
    v5 += 32;
    v6 = (uint8x8_t *)((char *)v6 + a2);
  }
  while ((_DWORD)v5 != 512);
  return result;
}

double sub_1C9824084(uint16x8_t *a1, uint64_t a2, int32x4_t *a3, int32x4_t *a4, int16x4_t *a5, __int16 *a6)
{
  double result;

  if (*a6 >= 1)
    sub_1C9708C30(a3, (unsigned __int16)*a6);
  if (a6[1] >= 1)
    sub_1C9708C30(a4, (unsigned __int16)a6[1]);
  *(_QWORD *)&result = sub_1C98251BC(a1, a2, (int16x8_t *)a3, (int16x8_t *)a4, a5).u64[0];
  return result;
}

uint16x8_t *sub_1C9824108(uint16x8_t *result, uint64_t a2, int16x4_t *a3, const __int16 *a4, int16x4_t *a5, int *a6)
{
  __int16 *v7;
  uint16x8_t *v10;
  int v11;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  int16x4_t *v16;
  uint64_t v17;
  unsigned int v18;
  int32x4_t v19;
  uint16x8_t v20;
  int16x8_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int16x8_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int16x8_t v34;
  int32x4_t v35;
  int16x8_t v36;
  int16x8_t v37;
  int16x8_t v38;
  uint16x8_t *v39;
  uint16x8_t v40;
  uint16x8_t v41;
  uint16x8_t v42;
  char v43;
  int16x8_t *v44;
  char v45;
  int16x8_t v46;
  int16x8_t v47;
  int16x8_t v48;
  int32x4_t v49;
  int32x4_t v50;
  int32x4_t v51;
  int32x4_t v52;
  int v53;
  char v54;
  int16x8_t *v55;
  char v56;
  int16x8_t v57;
  int16x8_t v58;
  int16x8_t v59;
  int32x4_t v60;
  int32x4_t v61;
  int32x4_t v62;
  int32x4_t v63;
  uint64_t v64;
  uint64_t v65;
  uint16x8_t *v66;
  int16x4_t *v67;
  uint64_t v68;
  char v69;
  uint16x8_t v70;
  int32x4_t v71;
  char v72;
  int16x8_t v73;
  int16x8_t v74;
  int16x8_t v75;
  int16x8_t v76;
  int16x8_t v77;
  int16x8_t v78;
  int32x4_t v79;
  int32x4_t v80;
  int32x4_t v81;
  int32x4_t v82;
  int16x8_t v83;
  int16x8_t v84;
  int16x8_t v85;
  int16x8_t v86;
  int16x8_t v87;
  int16x8_t v88;
  int32x4_t v89;
  int32x4_t v90;
  int32x4_t v91;
  int32x4_t v92;
  int16x8_t v93;
  int16x8_t v94;
  int16x8_t v95;
  int16x8_t v96;
  int16x8_t v97;
  int32x4_t v98;
  int32x4_t v99;
  int32x4_t v100;
  int32x4_t v101;
  int32x4_t v102;
  int32x4_t v103;
  int32x4_t v104;
  int16x8_t v105;
  int16x8_t v106;
  int32x4_t v107;
  int32x4_t v108;
  int32x4_t v109;
  int32x4_t v110;
  int32x4_t v111;
  int32x4_t v112;
  int32x4_t v113;
  int16x8_t v114;
  int16x8_t v115;
  int16x8_t v116;
  int16x8_t v117;
  uint16x8_t *v118;
  uint16x8_t *v119;
  uint16x8_t v120;
  uint16x8_t v121;
  uint16x8_t v122;
  uint16x8_t v123;
  uint16x8_t v124;
  uint16x8_t v125;
  uint16x8_t v126;
  uint16x8_t v127;
  uint64_t v128;
  unsigned int v129;
  uint16x8_t v130;
  uint16x8_t *v131;
  uint16x8_t v132;
  uint16x8_t v133;
  uint16x8_t v134;

  v7 = (__int16 *)a4;
  v10 = result;
  v11 = *a6;
  if ((*a6 & 0xFFFEFFFE) != 0)
  {
    if ((__int16)v11 < 1)
    {
      if ((v11 & 0x8000) != 0)
      {
        v43 = 1;
        v44 = (int16x8_t *)a3;
        do
        {
          v45 = v43;
          v46 = v44[1];
          v47 = v44[2];
          v48 = v44[3];
          v49 = (int32x4_t)vtrn1q_s16(*v44, v46);
          v50 = (int32x4_t)vtrn2q_s16(*v44, v46);
          v51 = (int32x4_t)vtrn1q_s16(v47, v48);
          v52 = (int32x4_t)vtrn2q_s16(v47, v48);
          *(int32x4_t *)v44 = vtrn1q_s32(v49, v51);
          v44[1] = (int16x8_t)vtrn1q_s32(v50, v52);
          v44[2] = (int16x8_t)vtrn2q_s32(v49, v51);
          v44[3] = (int16x8_t)vtrn2q_s32(v50, v52);
          v44 += 4;
          v43 = 0;
        }
        while ((v45 & 1) != 0);
      }
    }
    else
    {
      sub_1C970A6D8(a3, (unsigned __int16)*a6);
    }
    v53 = *((unsigned __int16 *)a6 + 1);
    if (*((__int16 *)a6 + 1) < 1)
    {
      if ((v53 & 0x8000) != 0)
      {
        v54 = 1;
        v55 = (int16x8_t *)v7;
        do
        {
          v56 = v54;
          v57 = v55[1];
          v58 = v55[2];
          v59 = v55[3];
          v60 = (int32x4_t)vtrn1q_s16(*v55, v57);
          v61 = (int32x4_t)vtrn2q_s16(*v55, v57);
          v62 = (int32x4_t)vtrn1q_s16(v58, v59);
          v63 = (int32x4_t)vtrn2q_s16(v58, v59);
          *(int32x4_t *)v55 = vtrn1q_s32(v60, v62);
          v55[1] = (int16x8_t)vtrn1q_s32(v61, v63);
          v55[2] = (int16x8_t)vtrn2q_s32(v60, v62);
          v55[3] = (int16x8_t)vtrn2q_s32(v61, v63);
          v55 += 4;
          v54 = 0;
        }
        while ((v56 & 1) != 0);
      }
    }
    else
    {
      sub_1C970A6D8((int16x4_t *)v7, v53);
    }
    v64 = 2 * a2;
    v65 = 4 * a2;
    v66 = v10 + 1;
    v67 = a3 - 16;
    v68 = 6 * a2;
    v69 = 1;
    v70.i64[0] = 0xFF00FF00FF00FFLL;
    v70.i64[1] = 0xFF00FF00FF00FFLL;
    v71.i64[0] = 0x800000008;
    v71.i64[1] = 0x800000008;
    do
    {
      v72 = v69;
      v73 = *(int16x8_t *)v67[16].i8;
      v74 = *(int16x8_t *)v67[18].i8;
      v75 = *(int16x8_t *)v67[20].i8;
      v76 = *(int16x8_t *)v67[22].i8;
      v77 = *(int16x8_t *)v7;
      v78 = *((int16x8_t *)v7 + 1);
      v79 = (int32x4_t)vtrn1q_s16(v73, v74);
      v80 = (int32x4_t)vtrn2q_s16(v73, v74);
      v81 = (int32x4_t)vtrn1q_s16(v75, v76);
      v82 = (int32x4_t)vtrn2q_s16(v75, v76);
      v83 = *((int16x8_t *)v7 + 2);
      v84 = *((int16x8_t *)v7 + 3);
      *(_OWORD *)v67[16].i8 = 0uLL;
      *(_OWORD *)v67[18].i8 = 0uLL;
      *(_OWORD *)v67[20].i8 = 0uLL;
      *(_OWORD *)v67[22].i8 = 0uLL;
      v85 = (int16x8_t)vtrn1q_s32(v79, v81);
      v86 = (int16x8_t)vtrn2q_s32(v79, v81);
      v87 = (int16x8_t)vtrn1q_s32(v80, v82);
      v88 = (int16x8_t)vtrn2q_s32(v80, v82);
      v89 = (int32x4_t)vtrn1q_s16(v77, v78);
      v90 = (int32x4_t)vtrn2q_s16(v77, v78);
      v91 = (int32x4_t)vtrn1q_s16(v83, v84);
      v92 = (int32x4_t)vtrn2q_s16(v83, v84);
      v93 = (int16x8_t)vtrn1q_s32(v89, v91);
      v94 = (int16x8_t)vtrn2q_s32(v89, v91);
      v95 = (int16x8_t)vtrn1q_s32(v90, v92);
      v96 = (int16x8_t)vtrn2q_s32(v90, v92);
      *((_OWORD *)v7 + 2) = 0uLL;
      *((_OWORD *)v7 + 3) = 0uLL;
      *(_OWORD *)v7 = 0uLL;
      *((_OWORD *)v7 + 1) = 0uLL;
      if (a5)
      {
        v97 = *(int16x8_t *)v67[2].i8;
        v98 = vdupq_laneq_s32(vsubw_s16(v71, *a5), 2);
        v99 = vshlq_s32(vmovl_s16(*v67), v98);
        v100 = vshlq_s32(vmovl_high_s16(*(int16x8_t *)v67->i8), v98);
        v101 = vshlq_s32(vmovl_s16(*(int16x4_t *)v97.i8), v98);
        v102 = vshlq_s32(vmovl_high_s16(v97), v98);
        v103 = vmovl_s16(vdup_lane_s16(*a5, 0));
        v104 = vmovl_s16(vdup_lane_s16(*a5, 1));
        *(_OWORD *)v67->i8 = 0uLL;
        *(_OWORD *)v67[2].i8 = 0uLL;
        v85 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v99, v103), 3uLL), vmulq_s32(v100, v103), 3uLL), v85);
        v93 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v99, v104), 3uLL), vmulq_s32(v100, v104), 3uLL), v93);
        v87 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v101, v103), 3uLL), vmulq_s32(v102, v103), 3uLL), v87);
        v95 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v101, v104), 3uLL), vmulq_s32(v102, v104), 3uLL), v95);
        v105 = *(int16x8_t *)v67[4].i8;
        v106 = *(int16x8_t *)v67[6].i8;
        v107 = vdupq_laneq_s32(vsubw_s16(v71, *a5), 2);
        v108 = vshlq_s32(vmovl_s16(*(int16x4_t *)v105.i8), v107);
        v109 = vshlq_s32(vmovl_high_s16(v105), v107);
        v110 = vshlq_s32(vmovl_s16(*(int16x4_t *)v106.i8), v107);
        v111 = vshlq_s32(vmovl_high_s16(v106), v107);
        v112 = vmovl_s16(vdup_lane_s16(*a5, 0));
        v113 = vmovl_s16(vdup_lane_s16(*a5, 1));
        *(_OWORD *)v67[4].i8 = 0uLL;
        *(_OWORD *)v67[6].i8 = 0uLL;
        v86 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v112), 3uLL), vmulq_s32(v109, v112), 3uLL), v86);
        v94 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v113), 3uLL), vmulq_s32(v109, v113), 3uLL), v94);
        v88 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v110, v112), 3uLL), vmulq_s32(v111, v112), 3uLL), v88);
        v96 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v110, v113), 3uLL), vmulq_s32(v111, v113), 3uLL), v96);
      }
      v69 = 0;
      v114 = vzip1q_s16(v85, v93);
      v115 = vzip2q_s16(v85, v93);
      v116 = vzip1q_s16(v87, v95);
      v117 = vzip2q_s16(v87, v95);
      v118 = (uint16x8_t *)((char *)v66 + v64);
      v119 = (uint16x8_t *)((char *)v66 + v65);
      result = (uint16x8_t *)((char *)v66 + v68);
      v120 = vsqaddq_u16(v66[-1], v114);
      v121 = *(uint16x8_t *)((char *)v66 + 4 * a2);
      v122 = vsqaddq_u16(*(uint16x8_t *)((char *)&v66[-1] + v64), v116);
      v123 = *(uint16x8_t *)((char *)v66 + 6 * a2);
      v124 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v66[-1] + v65), vzip1q_s16(v86, v94)), v70);
      v125 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v66[-1] + v68), vzip1q_s16(v88, v96)), v70);
      v126 = vminq_u16(vsqaddq_u16(*v66, v115), v70);
      v127 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v66 + 2 * a2), v117), v70);
      v66[-1] = vminq_u16(v120, v70);
      v118[-1] = vminq_u16(v122, v70);
      v119[-1] = v124;
      result[-1] = v125;
      *v66 = v126;
      *v118 = v127;
      *v119 = vminq_u16(vsqaddq_u16(v121, vzip2q_s16(v86, v94)), v70);
      *result = vminq_u16(vsqaddq_u16(v123, vzip2q_s16(v88, v96)), v70);
      v66 = (uint16x8_t *)((char *)v66 + 8 * a2);
      v67 += 8;
      v7 += 32;
    }
    while ((v72 & 1) != 0);
  }
  else
  {
    v13 = vld1q_dup_s16((const __int16 *)a3);
    v14 = vld1q_dup_s16(a4);
    v15 = vrshrq_n_s16(vrshrq_n_s16(vzip1q_s16(v13, v14), 1uLL), 6uLL);
    a3->i16[0] = 0;
    *a4 = 0;
    if (a5)
    {
      v16 = a3 - 16;
      v17 = 2 * a2;
      v18 = -2;
      v19.i64[0] = 0x800000008;
      v19.i64[1] = 0x800000008;
      v20.i64[0] = 0xFF00FF00FF00FFLL;
      v20.i64[1] = 0xFF00FF00FF00FFLL;
      do
      {
        v21 = *(int16x8_t *)v16[2].i8;
        v22 = vdupq_laneq_s32(vsubw_s16(v19, *a5), 2);
        v23 = vshlq_s32(vmovl_s16(*v16), v22);
        v24 = vshlq_s32(vmovl_high_s16(*(int16x8_t *)v16->i8), v22);
        v25 = vshlq_s32(vmovl_s16(*(int16x4_t *)v21.i8), v22);
        v26 = vshlq_s32(vmovl_high_s16(v21), v22);
        v27 = vmovl_s16(vdup_lane_s16(*a5, 0));
        v28 = vmulq_s32(v25, v27);
        v29 = vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v23, v27), 3uLL), vmulq_s32(v24, v27), 3uLL);
        v30 = vmovl_s16(vdup_lane_s16(*a5, 1));
        v31 = vmulq_s32(v23, v30);
        v32 = vmulq_s32(v24, v30);
        v33 = vmulq_s32(v25, v30);
        v34 = vshrn_high_n_s32(vshrn_n_s32(v28, 3uLL), vmulq_s32(v26, v27), 3uLL);
        v35 = vmulq_s32(v26, v30);
        v36 = vshrn_high_n_s32(vshrn_n_s32(v31, 3uLL), v32, 3uLL);
        v37 = vshrn_high_n_s32(vshrn_n_s32(v33, 3uLL), v35, 3uLL);
        *(_OWORD *)v16->i8 = 0uLL;
        *(_OWORD *)v16[2].i8 = 0uLL;
        v16 += 4;
        v38 = vaddq_s16(vzip1q_s16(v29, v36), v15);
        v39 = (uint16x8_t *)((char *)v10 + v17);
        v40 = vminq_u16(vsqaddq_u16(v10[1], vaddq_s16(vzip2q_s16(v29, v36), v15)), v20);
        v41 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v10 + 2 * a2), vaddq_s16(vzip1q_s16(v34, v37), v15)), v20);
        v42 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v10[1] + v17), vaddq_s16(vzip2q_s16(v34, v37), v15)), v20);
        *v10 = vminq_u16(vsqaddq_u16(*v10, v38), v20);
        v10[1] = v40;
        *v39 = v41;
        v39[1] = v42;
        v18 += 2;
        v10 = (uint16x8_t *)((char *)v10 + 4 * a2);
      }
      while (v18 < 6);
    }
    else
    {
      v128 = 2 * a2;
      v129 = -2;
      v130.i64[0] = 0xFF00FF00FF00FFLL;
      v130.i64[1] = 0xFF00FF00FF00FFLL;
      do
      {
        v131 = (uint16x8_t *)((char *)v10 + v128);
        v132 = vminq_u16(vsqaddq_u16(v10[1], v15), v130);
        v133 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v10 + 2 * a2), v15), v130);
        v134 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v10[1] + v128), v15), v130);
        *v10 = vminq_u16(vsqaddq_u16(*v10, v15), v130);
        v10[1] = v132;
        *v131 = v133;
        v131[1] = v134;
        v129 += 2;
        v10 = (uint16x8_t *)((char *)v10 + 4 * a2);
      }
      while (v129 < 6);
    }
  }
  return result;
}

int16x4_t *sub_1C9824610(int16x4_t *result, uint64_t a2, int16x4_t *a3, const __int16 *a4, int16x4_t *a5, int *a6)
{
  int16x4_t *v7;
  int16x4_t *v8;
  int16x4_t *v10;
  int v11;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  uint16x8_t *v16;
  uint64_t v17;
  uint64_t v18;
  int32x4_t v19;
  uint16x8_t v20;
  int16x4_t *v21;
  int16x8_t v22;
  int16x8_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int16x8_t v30;
  int16x8_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int32x4_t v34;
  int32x4_t v35;
  int32x4_t v36;
  int16x8_t v37;
  int16x8_t v38;
  int16x8_t v39;
  uint16x8_t v40;
  uint16x8_t v41;
  uint16x8_t v42;
  unsigned int v43;
  int16x4_t *v44;
  uint64_t v45;
  char v46;
  char v47;
  int16x8_t *v48;
  int16x8_t v49;
  int16x8_t v50;
  int16x8_t v51;
  int32x4_t v52;
  int32x4_t v53;
  int32x4_t v54;
  int32x4_t v55;
  BOOL v56;
  int v57;
  unsigned int v58;
  int16x4_t *v59;
  uint64_t v60;
  char v61;
  char v62;
  int16x8_t *v63;
  int16x8_t v64;
  int16x8_t v65;
  int16x8_t v66;
  int32x4_t v67;
  int32x4_t v68;
  int32x4_t v69;
  int32x4_t v70;
  unsigned int v71;
  uint16x8_t v72;
  int32x4_t v73;
  uint64_t v74;
  char v75;
  char v76;
  int16x8_t *v77;
  int16x8_t v78;
  int16x8_t v79;
  int16x8_t v80;
  int16x8_t *v81;
  int16x8_t v82;
  int16x8_t v83;
  int16x8_t v84;
  int32x4_t v85;
  int32x4_t v86;
  int32x4_t v87;
  int32x4_t v88;
  int16x8_t v89;
  int16x8_t v90;
  int16x8_t v91;
  int16x8_t v92;
  int16x8_t v93;
  int32x4_t v94;
  int32x4_t v95;
  int32x4_t v96;
  int32x4_t v97;
  int16x8_t v98;
  int16x8_t v99;
  int16x8_t v100;
  int16x8_t v101;
  int16x4_t v102;
  int16x8_t v103;
  int16x8_t v104;
  int32x4_t v105;
  int32x4_t v106;
  int32x4_t v107;
  int32x4_t v108;
  int32x4_t v109;
  int32x4_t v110;
  int32x4_t v111;
  int16x8_t *v112;
  int16x8_t v113;
  int16x8_t *v114;
  int16x8_t v115;
  int32x4_t v116;
  int32x4_t v117;
  int32x4_t v118;
  int32x4_t v119;
  int32x4_t v120;
  int32x4_t v121;
  int32x4_t v122;
  int16x8_t v123;
  int16x8_t v124;
  uint16x8_t *v125;
  uint16x8_t *v126;
  uint16x8_t *v127;
  uint16x8_t *v128;
  uint16x8_t v129;
  uint16x8_t v130;
  uint16x8_t v131;
  uint16x8_t v132;
  uint16x8_t v133;
  uint16x8_t v134;
  uint16x8_t v135;
  uint16x8_t v136;
  int v137;
  uint16x8_t v138;
  uint16x8_t v139;
  uint16x8_t v140;
  uint16x8_t v141;

  v7 = (int16x4_t *)a4;
  v8 = a3;
  v10 = result;
  v11 = *a6;
  if ((*a6 & 0xFFFEFFFE) != 0)
  {
    if ((__int16)v11 < 1)
    {
      if ((v11 & 0x8000) != 0)
      {
        v43 = 0;
        v44 = a3;
        do
        {
          v45 = 0;
          v46 = 1;
          do
          {
            v47 = v46;
            v48 = (int16x8_t *)&v44[v45];
            v49 = v48[2];
            v50 = v48[4];
            v51 = v48[6];
            v52 = (int32x4_t)vtrn1q_s16(*v48, v49);
            v53 = (int32x4_t)vtrn2q_s16(*v48, v49);
            v54 = (int32x4_t)vtrn1q_s16(v50, v51);
            v55 = (int32x4_t)vtrn2q_s16(v50, v51);
            *(int32x4_t *)v48 = vtrn1q_s32(v52, v54);
            v48[2] = (int16x8_t)vtrn1q_s32(v53, v55);
            v48[4] = (int16x8_t)vtrn2q_s32(v52, v54);
            v48[6] = (int16x8_t)vtrn2q_s32(v53, v55);
            v45 = 2;
            v46 = 0;
          }
          while ((v47 & 1) != 0);
          v44 += 16;
          v56 = v43 >= 0xC;
          v43 += 4;
        }
        while (!v56);
      }
    }
    else
    {
      result = sub_1C970B38C(a3, (unsigned __int16)*a6);
    }
    v57 = *((unsigned __int16 *)a6 + 1);
    if (*((__int16 *)a6 + 1) < 1)
    {
      if ((v57 & 0x8000) != 0)
      {
        v58 = 0;
        v59 = v7;
        do
        {
          v60 = 0;
          v61 = 1;
          do
          {
            v62 = v61;
            v63 = (int16x8_t *)&v59[v60];
            v64 = v63[2];
            v65 = v63[4];
            v66 = v63[6];
            v67 = (int32x4_t)vtrn1q_s16(*v63, v64);
            v68 = (int32x4_t)vtrn2q_s16(*v63, v64);
            v69 = (int32x4_t)vtrn1q_s16(v65, v66);
            v70 = (int32x4_t)vtrn2q_s16(v65, v66);
            *(int32x4_t *)v63 = vtrn1q_s32(v67, v69);
            v63[2] = (int16x8_t)vtrn1q_s32(v68, v70);
            v63[4] = (int16x8_t)vtrn2q_s32(v67, v69);
            v63[6] = (int16x8_t)vtrn2q_s32(v68, v70);
            v60 = 2;
            v61 = 0;
          }
          while ((v62 & 1) != 0);
          v59 += 16;
          v56 = v58 >= 0xC;
          v58 += 4;
        }
        while (!v56);
      }
    }
    else
    {
      result = sub_1C970B38C(v7, v57);
    }
    v71 = 0;
    v72.i64[0] = 0xFF00FF00FF00FFLL;
    v72.i64[1] = 0xFF00FF00FF00FFLL;
    v73.i64[0] = 0x800000008;
    v73.i64[1] = 0x800000008;
    do
    {
      v74 = 0;
      v75 = 1;
      do
      {
        v76 = v75;
        v77 = (int16x8_t *)&v8[(unint64_t)v74 / 2];
        v78 = v77[2];
        v79 = v77[4];
        v80 = v77[6];
        v81 = (int16x8_t *)&v7[(unint64_t)v74 / 2];
        v82 = *v81;
        v83 = v81[2];
        v84 = v81[4];
        v85 = (int32x4_t)vtrn1q_s16(*v77, v78);
        v86 = (int32x4_t)vtrn2q_s16(*v77, v78);
        v87 = (int32x4_t)vtrn1q_s16(v79, v80);
        v88 = (int32x4_t)vtrn2q_s16(v79, v80);
        v89 = v81[6];
        *v77 = 0uLL;
        v77[2] = 0uLL;
        v77[4] = 0uLL;
        v77[6] = 0uLL;
        *v81 = 0uLL;
        v81[2] = 0uLL;
        v81[4] = 0uLL;
        v81[6] = 0uLL;
        v90 = (int16x8_t)vtrn1q_s32(v85, v87);
        v91 = (int16x8_t)vtrn2q_s32(v85, v87);
        v92 = (int16x8_t)vtrn1q_s32(v86, v88);
        v93 = (int16x8_t)vtrn2q_s32(v86, v88);
        v94 = (int32x4_t)vtrn1q_s16(v82, v83);
        v95 = (int32x4_t)vtrn2q_s16(v82, v83);
        v96 = (int32x4_t)vtrn1q_s16(v84, v89);
        v97 = (int32x4_t)vtrn2q_s16(v84, v89);
        v98 = (int16x8_t)vtrn1q_s32(v94, v96);
        v99 = (int16x8_t)vtrn2q_s32(v94, v96);
        v100 = (int16x8_t)vtrn1q_s32(v95, v97);
        v101 = (int16x8_t)vtrn2q_s32(v95, v97);
        if (a5)
        {
          v102 = *a5;
          v103 = v77[-32];
          v104 = v77[-30];
          v77[-32] = 0uLL;
          v77[-30] = 0uLL;
          v105 = vdupq_laneq_s32(vsubw_s16(v73, v102), 2);
          v106 = vshlq_s32(vmovl_s16(*(int16x4_t *)v103.i8), v105);
          v107 = vshlq_s32(vmovl_high_s16(v103), v105);
          v108 = vshlq_s32(vmovl_s16(*(int16x4_t *)v104.i8), v105);
          v109 = vshlq_s32(vmovl_high_s16(v104), v105);
          v110 = vmovl_s16(vdup_lane_s16(v102, 0));
          v111 = vmovl_s16(vdup_lane_s16(v102, 1));
          v90 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v106, v110), 3uLL), vmulq_s32(v107, v110), 3uLL), v90);
          v98 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v106, v111), 3uLL), vmulq_s32(v107, v111), 3uLL), v98);
          v92 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v110), 3uLL), vmulq_s32(v109, v110), 3uLL), v92);
          v100 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v111), 3uLL), vmulq_s32(v109, v111), 3uLL), v100);
          v112 = v77 - 28;
          *(int16x4_t *)v111.i8 = *a5;
          v113 = v77[-28];
          v114 = v77 - 26;
          v115 = *v114;
          *v112 = 0uLL;
          *v114 = 0uLL;
          v116 = vdupq_laneq_s32(vsubw_s16(v73, *(int16x4_t *)v111.i8), 2);
          v117 = vshlq_s32(vmovl_s16(*(int16x4_t *)v113.i8), v116);
          v118 = vshlq_s32(vmovl_high_s16(v113), v116);
          v119 = vshlq_s32(vmovl_s16(*(int16x4_t *)v115.i8), v116);
          v120 = vshlq_s32(vmovl_high_s16(v115), v116);
          v121 = vmovl_s16(vdup_lane_s16(*(int16x4_t *)v111.i8, 0));
          v122 = vmovl_s16(vdup_lane_s16(*(int16x4_t *)v111.i8, 1));
          v91 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v117, v121), 3uLL), vmulq_s32(v118, v121), 3uLL), v91);
          v99 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v117, v122), 3uLL), vmulq_s32(v118, v122), 3uLL), v99);
          v93 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v119, v121), 3uLL), vmulq_s32(v120, v121), 3uLL), v93);
          v101 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v119, v122), 3uLL), vmulq_s32(v120, v122), 3uLL), v101);
        }
        v75 = 0;
        v123 = vzip1q_s16(v90, v98);
        v124 = vzip2q_s16(v90, v98);
        v125 = (uint16x8_t *)&v10[v74];
        v126 = (uint16x8_t *)((char *)v125 + 2 * a2);
        v127 = (uint16x8_t *)((char *)v125 + 4 * a2);
        v128 = (uint16x8_t *)((char *)v125 + 6 * a2);
        v129 = v126[1];
        v130 = vsqaddq_u16(*v125, v123);
        v131 = v127[1];
        v132 = v128[1];
        v133 = vminq_u16(vsqaddq_u16(*v126, vzip1q_s16(v92, v100)), v72);
        v134 = vminq_u16(vsqaddq_u16(*v127, vzip1q_s16(v91, v99)), v72);
        v135 = vminq_u16(vsqaddq_u16(*v128, vzip1q_s16(v93, v101)), v72);
        v136 = vminq_u16(vsqaddq_u16(v125[1], v124), v72);
        *v125 = vminq_u16(v130, v72);
        *v126 = v133;
        *v127 = v134;
        *v128 = v135;
        v125[1] = v136;
        v126[1] = vminq_u16(vsqaddq_u16(v129, vzip2q_s16(v92, v100)), v72);
        v127[1] = vminq_u16(vsqaddq_u16(v131, vzip2q_s16(v91, v99)), v72);
        v128[1] = vminq_u16(vsqaddq_u16(v132, vzip2q_s16(v93, v101)), v72);
        v74 = 4;
      }
      while ((v76 & 1) != 0);
      v10 += a2;
      v8 += 16;
      v7 += 16;
      v56 = v71 >= 0xC;
      v71 += 4;
    }
    while (!v56);
  }
  else
  {
    v13 = vld1q_dup_s16((const __int16 *)a3);
    v14 = vld1q_dup_s16(a4);
    v15 = vrshrq_n_s16(vrshrq_n_s16(vzip1q_s16(v13, v14), 1uLL), 6uLL);
    a3->i16[0] = 0;
    *a4 = 0;
    v16 = (uint16x8_t *)&result[4];
    v17 = 2 * a2;
    if (a5)
    {
      v18 = 0x1FFFFFFFFFFFFFC0;
      v19.i64[0] = 0x800000008;
      v19.i64[1] = 0x800000008;
      v20.i64[0] = 0xFF00FF00FF00FFLL;
      v20.i64[1] = 0xFF00FF00FF00FFLL;
      do
      {
        v21 = &a3[v18];
        v22 = *(int16x8_t *)a3[v18].i8;
        v23 = *(int16x8_t *)a3[v18 + 2].i8;
        v24 = vdupq_laneq_s32(vsubw_s16(v19, *a5), 2);
        v25 = vshlq_s32(vmovl_s16(*(int16x4_t *)v22.i8), v24);
        v26 = vshlq_s32(vmovl_high_s16(v22), v24);
        v27 = vshlq_s32(vmovl_s16(*(int16x4_t *)v23.i8), v24);
        v28 = vshlq_s32(vmovl_high_s16(v23), v24);
        v29 = vmovl_s16(vdup_lane_s16(*a5, 0));
        v30 = vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v25, v29), 3uLL), vmulq_s32(v26, v29), 3uLL);
        v31 = vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v27, v29), 3uLL), vmulq_s32(v28, v29), 3uLL);
        v32 = vmovl_s16(vdup_lane_s16(*a5, 1));
        v33 = vmulq_s32(v25, v32);
        v34 = vmulq_s32(v26, v32);
        v35 = vmulq_s32(v27, v32);
        v36 = vmulq_s32(v28, v32);
        v37 = vshrn_high_n_s32(vshrn_n_s32(v33, 3uLL), v34, 3uLL);
        v38 = vshrn_high_n_s32(vshrn_n_s32(v35, 3uLL), v36, 3uLL);
        *(_OWORD *)v21->i8 = 0uLL;
        *(_OWORD *)v21[2].i8 = 0uLL;
        v39 = vaddq_s16(vzip1q_s16(v30, v37), v15);
        v40 = vminq_u16(vsqaddq_u16(v16[-1], vaddq_s16(vzip2q_s16(v30, v37), v15)), v20);
        v41 = vminq_u16(vsqaddq_u16(*v16, vaddq_s16(vzip1q_s16(v31, v38), v15)), v20);
        v42 = vsqaddq_u16(v16[1], vaddq_s16(vzip2q_s16(v31, v38), v15));
        v16[-2] = vminq_u16(vsqaddq_u16(v16[-2], v39), v20);
        v16[-1] = v40;
        *v16 = v41;
        v16[1] = vminq_u16(v42, v20);
        v16 = (uint16x8_t *)((char *)v16 + v17);
        v18 += 4;
      }
      while ((_DWORD)(v18 * 8));
    }
    else
    {
      v137 = 16;
      v138.i64[0] = 0xFF00FF00FF00FFLL;
      v138.i64[1] = 0xFF00FF00FF00FFLL;
      do
      {
        v139 = vminq_u16(vsqaddq_u16(v16[-1], v15), v138);
        v140 = vminq_u16(vsqaddq_u16(*v16, v15), v138);
        v141 = vminq_u16(vsqaddq_u16(v16[1], v15), v138);
        v16[-2] = vminq_u16(vsqaddq_u16(v16[-2], v15), v138);
        v16[-1] = v139;
        *v16 = v140;
        v16[1] = v141;
        v16 = (uint16x8_t *)((char *)v16 + v17);
        --v137;
      }
      while (v137);
    }
  }
  return result;
}

uint16x8_t *sub_1C9824BB8(uint16x8_t *result, uint64_t a2, int16x4_t *a3, const __int16 *a4, int16x4_t *a5, int *a6)
{
  int16x4_t *v7;
  int16x4_t *v8;
  uint16x8_t *v10;
  int v11;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  int v16;
  int16x4_t *v17;
  int32x4_t v18;
  uint16x8_t v19;
  uint64_t v20;
  char v21;
  int16x8_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int16x8_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int32x4_t v34;
  int16x8_t v35;
  int32x4_t v36;
  int16x8_t v37;
  int16x8_t v38;
  char v39;
  int16x8_t v40;
  uint16x8_t *v41;
  uint16x8_t v42;
  uint16x8_t v43;
  uint16x8_t v44;
  unsigned int v45;
  int16x4_t *v46;
  unint64_t v47;
  int16x8_t *v48;
  int16x8_t v49;
  int16x8_t v50;
  int16x8_t v51;
  int32x4_t v52;
  int32x4_t v53;
  int32x4_t v54;
  int32x4_t v55;
  BOOL v56;
  int v57;
  unsigned int v58;
  int16x4_t *v59;
  unint64_t v60;
  int16x8_t *v61;
  int16x8_t v62;
  int16x8_t v63;
  int16x8_t v64;
  int32x4_t v65;
  int32x4_t v66;
  int32x4_t v67;
  int32x4_t v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint16x8_t v73;
  int32x4_t v74;
  uint64_t v75;
  unint64_t v76;
  uint16x8_t *v77;
  int16x8_t *v78;
  int16x8_t v79;
  int16x8_t v80;
  int16x8_t v81;
  int16x8_t v82;
  int16x4_t *v83;
  int16x8_t v84;
  int16x8_t v85;
  int16x8_t v86;
  int32x4_t v87;
  int32x4_t v88;
  int32x4_t v89;
  int32x4_t v90;
  int16x8_t v91;
  int16x8_t v92;
  int16x8_t v93;
  int16x8_t v94;
  int16x8_t v95;
  int32x4_t v96;
  int32x4_t v97;
  int32x4_t v98;
  int32x4_t v99;
  int16x8_t v100;
  int16x8_t v101;
  int16x8_t v102;
  int16x8_t v103;
  int16x4_t v104;
  int16x8_t v105;
  int16x8_t v106;
  int32x4_t v107;
  int32x4_t v108;
  int32x4_t v109;
  int32x4_t v110;
  int32x4_t v111;
  int32x4_t v112;
  int32x4_t v113;
  int16x8_t *v114;
  int16x8_t v115;
  int16x8_t *v116;
  int16x8_t v117;
  int32x4_t v118;
  int32x4_t v119;
  int32x4_t v120;
  int32x4_t v121;
  int32x4_t v122;
  int32x4_t v123;
  int32x4_t v124;
  int16x8_t v125;
  int16x8_t v126;
  int16x8_t v127;
  int16x8_t v128;
  int16x8_t v129;
  int16x8_t v130;
  int16x8_t v131;
  int16x8_t v132;
  uint16x8_t *v133;
  uint16x8_t *v134;
  uint16x8_t v135;
  uint16x8_t v136;
  uint16x8_t v137;
  uint16x8_t v138;
  uint16x8_t v139;
  uint16x8_t v140;
  uint16x8_t v141;
  uint16x8_t *v142;
  int v143;
  uint16x8_t v144;
  uint16x8_t v145;
  uint16x8_t v146;
  uint16x8_t v147;
  uint16x8_t v148;
  uint16x8_t v149;
  uint16x8_t v150;

  v7 = (int16x4_t *)a4;
  v8 = a3;
  v10 = result;
  v11 = *a6;
  if ((*a6 & 0xFFFEFFFE) != 0)
  {
    if ((__int16)v11 < 1)
    {
      if ((v11 & 0x8000) != 0)
      {
        v45 = 0;
        v46 = a3 + 16;
        do
        {
          v47 = -8;
          v48 = (int16x8_t *)v46;
          do
          {
            v49 = v48[-8];
            v50 = v48[-4];
            v51 = v48[4];
            v52 = (int32x4_t)vtrn1q_s16(v49, v50);
            v53 = (int32x4_t)vtrn2q_s16(v49, v50);
            v54 = (int32x4_t)vtrn1q_s16(*v48, v51);
            v55 = (int32x4_t)vtrn2q_s16(*v48, v51);
            v48[-8] = (int16x8_t)vtrn1q_s32(v52, v54);
            v48[-4] = (int16x8_t)vtrn1q_s32(v53, v55);
            *(int32x4_t *)v48 = vtrn2q_s32(v52, v54);
            v48[4] = (int16x8_t)vtrn2q_s32(v53, v55);
            v47 += 8;
            ++v48;
          }
          while (v47 < 0x18);
          v46 += 32;
          v56 = v45 >= 0x1C;
          v45 += 4;
        }
        while (!v56);
      }
    }
    else
    {
      sub_1C97023B8(a3, (unsigned __int16)*a6);
    }
    v57 = *((unsigned __int16 *)a6 + 1);
    if (*((__int16 *)a6 + 1) < 1)
    {
      if ((v57 & 0x8000) != 0)
      {
        v58 = 0;
        v59 = v7 + 16;
        do
        {
          v60 = -8;
          v61 = (int16x8_t *)v59;
          do
          {
            v62 = v61[-8];
            v63 = v61[-4];
            v64 = v61[4];
            v65 = (int32x4_t)vtrn1q_s16(v62, v63);
            v66 = (int32x4_t)vtrn2q_s16(v62, v63);
            v67 = (int32x4_t)vtrn1q_s16(*v61, v64);
            v68 = (int32x4_t)vtrn2q_s16(*v61, v64);
            v61[-8] = (int16x8_t)vtrn1q_s32(v65, v67);
            v61[-4] = (int16x8_t)vtrn1q_s32(v66, v68);
            *(int32x4_t *)v61 = vtrn2q_s32(v65, v67);
            v61[4] = (int16x8_t)vtrn2q_s32(v66, v68);
            v60 += 8;
            ++v61;
          }
          while (v60 < 0x18);
          v59 += 32;
          v56 = v58 >= 0x1C;
          v58 += 4;
        }
        while (!v56);
      }
    }
    else
    {
      sub_1C97023B8(v7, v57);
    }
    v69 = 0;
    v70 = 2 * a2;
    v71 = 6 * a2 + 16;
    v72 = 4 * a2 + 16;
    v73.i64[0] = 0xFF00FF00FF00FFLL;
    v73.i64[1] = 0xFF00FF00FF00FFLL;
    v74.i64[0] = 0x800000008;
    v74.i64[1] = 0x800000008;
    do
    {
      v75 = 0;
      v76 = -8;
      v77 = v10;
      do
      {
        v78 = (int16x8_t *)&v8[v75];
        v79 = *(int16x8_t *)v8[v75].i8;
        v80 = *(int16x8_t *)v8[v75 + 8].i8;
        v81 = *(int16x8_t *)v8[v75 + 16].i8;
        v82 = *(int16x8_t *)v8[v75 + 24].i8;
        v83 = &v7[v75];
        v84 = *(int16x8_t *)v7[v75].i8;
        v85 = *(int16x8_t *)v7[v75 + 8].i8;
        v86 = *(int16x8_t *)v7[v75 + 16].i8;
        v87 = (int32x4_t)vtrn1q_s16(v79, v80);
        v88 = (int32x4_t)vtrn2q_s16(v79, v80);
        v89 = (int32x4_t)vtrn1q_s16(v81, v82);
        v90 = (int32x4_t)vtrn2q_s16(v81, v82);
        v91 = *(int16x8_t *)v7[v75 + 24].i8;
        *v78 = 0uLL;
        v78[4] = 0uLL;
        v78[8] = 0uLL;
        v78[12] = 0uLL;
        *(_OWORD *)v83->i8 = 0uLL;
        *(_OWORD *)v83[8].i8 = 0uLL;
        *(_OWORD *)v83[16].i8 = 0uLL;
        *(_OWORD *)v83[24].i8 = 0uLL;
        v92 = (int16x8_t)vtrn1q_s32(v87, v89);
        v93 = (int16x8_t)vtrn2q_s32(v87, v89);
        v94 = (int16x8_t)vtrn1q_s32(v88, v90);
        v95 = (int16x8_t)vtrn2q_s32(v88, v90);
        v96 = (int32x4_t)vtrn1q_s16(v84, v85);
        v97 = (int32x4_t)vtrn2q_s16(v84, v85);
        v98 = (int32x4_t)vtrn1q_s16(v86, v91);
        v99 = (int32x4_t)vtrn2q_s16(v86, v91);
        v100 = (int16x8_t)vtrn1q_s32(v96, v98);
        v101 = (int16x8_t)vtrn2q_s32(v96, v98);
        v102 = (int16x8_t)vtrn1q_s32(v97, v99);
        v103 = (int16x8_t)vtrn2q_s32(v97, v99);
        if (a5)
        {
          v104 = *a5;
          v105 = v78[-128];
          v106 = v78[-124];
          v78[-128] = 0uLL;
          v78[-124] = 0uLL;
          v107 = vdupq_laneq_s32(vsubw_s16(v74, v104), 2);
          v108 = vshlq_s32(vmovl_s16(*(int16x4_t *)v105.i8), v107);
          v109 = vshlq_s32(vmovl_high_s16(v105), v107);
          v110 = vshlq_s32(vmovl_s16(*(int16x4_t *)v106.i8), v107);
          v111 = vshlq_s32(vmovl_high_s16(v106), v107);
          v112 = vmovl_s16(vdup_lane_s16(v104, 0));
          v113 = vmovl_s16(vdup_lane_s16(v104, 1));
          v92 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v112), 3uLL), vmulq_s32(v109, v112), 3uLL), v92);
          v100 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v113), 3uLL), vmulq_s32(v109, v113), 3uLL), v100);
          v94 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v110, v112), 3uLL), vmulq_s32(v111, v112), 3uLL), v94);
          v102 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v110, v113), 3uLL), vmulq_s32(v111, v113), 3uLL), v102);
          v114 = v78 - 120;
          *(int16x4_t *)v113.i8 = *a5;
          v115 = v78[-120];
          v116 = v78 - 116;
          v117 = *v116;
          *v114 = 0uLL;
          *v116 = 0uLL;
          v118 = vdupq_laneq_s32(vsubw_s16(v74, *(int16x4_t *)v113.i8), 2);
          v119 = vshlq_s32(vmovl_s16(*(int16x4_t *)v115.i8), v118);
          v120 = vshlq_s32(vmovl_high_s16(v115), v118);
          v121 = vshlq_s32(vmovl_s16(*(int16x4_t *)v117.i8), v118);
          v122 = vshlq_s32(vmovl_high_s16(v117), v118);
          v123 = vmovl_s16(vdup_lane_s16(*(int16x4_t *)v113.i8, 0));
          v124 = vmovl_s16(vdup_lane_s16(*(int16x4_t *)v113.i8, 1));
          v93 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v119, v123), 3uLL), vmulq_s32(v120, v123), 3uLL), v93);
          v101 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v119, v124), 3uLL), vmulq_s32(v120, v124), 3uLL), v101);
          v95 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v121, v123), 3uLL), vmulq_s32(v122, v123), 3uLL), v95);
          v103 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v121, v124), 3uLL), vmulq_s32(v122, v124), 3uLL), v103);
        }
        v125 = vzip1q_s16(v92, v100);
        v126 = vzip2q_s16(v92, v100);
        v127 = vzip1q_s16(v94, v102);
        v128 = vzip2q_s16(v94, v102);
        v129 = vzip1q_s16(v93, v101);
        v130 = vzip2q_s16(v93, v101);
        v131 = vzip1q_s16(v95, v103);
        v132 = vzip2q_s16(v95, v103);
        v133 = (uint16x8_t *)((char *)v77 + v70);
        v134 = (uint16x8_t *)((char *)v77 + v72);
        result = (uint16x8_t *)((char *)v77 + v71);
        v135 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v77 + 2 * a2), v127), v73);
        v136 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v77 + 4 * a2), v129), v73);
        v137 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v77 + 6 * a2), v131), v73);
        v138 = vminq_u16(vsqaddq_u16(v77[1], v126), v73);
        v139 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v77[1] + v70), v128), v73);
        v140 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v77 + v72), v130), v73);
        v141 = vsqaddq_u16(*(uint16x8_t *)((char *)v77 + v71), v132);
        *v77 = vminq_u16(vsqaddq_u16(*v77, v125), v73);
        *v133 = v135;
        v134[-1] = v136;
        result[-1] = v137;
        v77[1] = v138;
        v133[1] = v139;
        *v134 = v140;
        *result = vminq_u16(v141, v73);
        v76 += 8;
        v75 += 2;
        v77 += 2;
      }
      while (v76 < 0x18);
      v8 += 32;
      v7 += 32;
      v10 = (uint16x8_t *)((char *)v10 + 8 * a2);
      v56 = v69 >= 0x1C;
      v69 += 4;
    }
    while (!v56);
  }
  else
  {
    v13 = vld1q_dup_s16((const __int16 *)a3);
    v14 = vld1q_dup_s16(a4);
    v15 = vrshrq_n_s16(vrshrq_n_s16(vzip1q_s16(v13, v14), 1uLL), 6uLL);
    a3->i16[0] = 0;
    *a4 = 0;
    if (a5)
    {
      v16 = 0;
      v17 = a3 - 256;
      v18.i64[0] = 0x800000008;
      v18.i64[1] = 0x800000008;
      v19.i64[0] = 0xFF00FF00FF00FFLL;
      v19.i64[1] = 0xFF00FF00FF00FFLL;
      do
      {
        v20 = 0;
        v21 = 1;
        do
        {
          v22 = *(int16x8_t *)v17[2].i8;
          v23 = vdupq_laneq_s32(vsubw_s16(v18, *a5), 2);
          v24 = vshlq_s32(vmovl_s16(*v17), v23);
          v25 = vshlq_s32(vmovl_high_s16(*(int16x8_t *)v17->i8), v23);
          v26 = vshlq_s32(vmovl_s16(*(int16x4_t *)v22.i8), v23);
          v27 = vshlq_s32(vmovl_high_s16(v22), v23);
          v28 = vmovl_s16(vdup_lane_s16(*a5, 0));
          v29 = vmulq_s32(v26, v28);
          v30 = vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v24, v28), 3uLL), vmulq_s32(v25, v28), 3uLL);
          v31 = vmovl_s16(vdup_lane_s16(*a5, 1));
          v32 = vmulq_s32(v24, v31);
          v33 = vmulq_s32(v25, v31);
          v34 = vmulq_s32(v26, v31);
          v35 = vshrn_high_n_s32(vshrn_n_s32(v29, 3uLL), vmulq_s32(v27, v28), 3uLL);
          v36 = vmulq_s32(v27, v31);
          v37 = vshrn_high_n_s32(vshrn_n_s32(v32, 3uLL), v33, 3uLL);
          v38 = vshrn_high_n_s32(vshrn_n_s32(v34, 3uLL), v36, 3uLL);
          v39 = v21;
          *(_OWORD *)v17->i8 = 0uLL;
          *(_OWORD *)v17[2].i8 = 0uLL;
          v17 += 4;
          v40 = vzip1q_s16(v30, v37);
          v41 = &v10[v20];
          v42 = vminq_u16(vsqaddq_u16(v41[1], vaddq_s16(vzip2q_s16(v30, v37), v15)), v19);
          v43 = vminq_u16(vsqaddq_u16(v41[2], vaddq_s16(vzip1q_s16(v35, v38), v15)), v19);
          v44 = vsqaddq_u16(v41[3], vaddq_s16(vzip2q_s16(v35, v38), v15));
          *v41 = vminq_u16(vsqaddq_u16(*v41, vaddq_s16(v40, v15)), v19);
          v41[1] = v42;
          v41[2] = v43;
          v41[3] = vminq_u16(v44, v19);
          v20 = 4;
          v21 = 0;
        }
        while ((v39 & 1) != 0);
        ++v16;
        v10 = (uint16x8_t *)((char *)v10 + 2 * a2);
      }
      while (v16 != 32);
    }
    else
    {
      v142 = result + 4;
      v143 = 32;
      v144.i64[0] = 0xFF00FF00FF00FFLL;
      v144.i64[1] = 0xFF00FF00FF00FFLL;
      do
      {
        v145 = vminq_u16(vsqaddq_u16(v142[-3], v15), v144);
        v146 = vminq_u16(vsqaddq_u16(v142[-2], v15), v144);
        v147 = vminq_u16(vsqaddq_u16(v142[-1], v15), v144);
        v142[-4] = vminq_u16(vsqaddq_u16(v142[-4], v15), v144);
        v142[-3] = v145;
        v142[-2] = v146;
        v142[-1] = v147;
        v148 = vminq_u16(vsqaddq_u16(v142[1], v15), v144);
        v149 = vminq_u16(vsqaddq_u16(v142[2], v15), v144);
        v150 = vminq_u16(vsqaddq_u16(v142[3], v15), v144);
        *v142 = vminq_u16(vsqaddq_u16(*v142, v15), v144);
        v142[1] = v148;
        v142[2] = v149;
        v142[3] = v150;
        v142 = (uint16x8_t *)((char *)v142 + 2 * a2);
        --v143;
      }
      while (v143);
    }
  }
  return result;
}

uint16x8_t sub_1C98251BC(uint16x8_t *a1, uint64_t a2, int16x8_t *a3, int16x8_t *a4, int16x4_t *a5)
{
  int16x8_t v5;
  int16x8_t v6;
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  int16x8_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int16x8_t v19;
  int16x8_t v20;
  int16x8_t v21;
  int16x8_t v22;
  uint16x8_t v23;
  uint16x8_t v24;
  uint16x8_t v25;
  uint16x8_t v26;
  uint16x8_t result;

  v6 = *a3;
  v5 = a3[1];
  v8 = *a4;
  v7 = a4[1];
  if (a5)
  {
    v9 = a3[-2];
    v10 = a3[-1];
    v11.i64[0] = 0x800000008;
    v11.i64[1] = 0x800000008;
    v12 = vdupq_laneq_s32(vsubw_s16(v11, *a5), 2);
    v13 = vshlq_s32(vmovl_s16(*(int16x4_t *)v9.i8), v12);
    v14 = vshlq_s32(vmovl_high_s16(v9), v12);
    v15 = vshlq_s32(vmovl_s16(*(int16x4_t *)v10.i8), v12);
    v16 = vshlq_s32(vmovl_high_s16(v10), v12);
    v17 = vmovl_s16(vdup_lane_s16(*a5, 0));
    v18 = vmovl_s16(vdup_lane_s16(*a5, 1));
    v6 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v13, v17), 3uLL), vmulq_s32(v14, v17), 3uLL), v6);
    v5 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v15, v17), 3uLL), vmulq_s32(v16, v17), 3uLL), v5);
    v8 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v13, v18), 3uLL), vmulq_s32(v14, v18), 3uLL), v8);
    v7 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v15, v18), 3uLL), vmulq_s32(v16, v18), 3uLL), v7);
    a3[-2] = 0u;
    a3[-1] = 0u;
  }
  *a3 = 0u;
  a3[1] = 0u;
  v19 = vzip1q_s16(v6, v8);
  v20 = vzip2q_s16(v6, v8);
  v21 = vzip1q_s16(v5, v7);
  v22 = vzip2q_s16(v5, v7);
  *a4 = 0u;
  a4[1] = 0u;
  v23 = *(uint16x8_t *)((char *)a1 + 6 * a2);
  v24 = vsqaddq_u16(*a1, v19);
  v19.i64[0] = 0xFF00FF00FF00FFLL;
  v19.i64[1] = 0xFF00FF00FF00FFLL;
  v25 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)a1 + 2 * a2), v20), (uint16x8_t)v19);
  v26 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)a1 + 4 * a2), v21), (uint16x8_t)v19);
  *a1 = vminq_u16(v24, (uint16x8_t)v19);
  *(uint16x8_t *)((char *)a1 + 2 * a2) = v25;
  result = vminq_u16(vsqaddq_u16(v23, v22), (uint16x8_t)v19);
  *(uint16x8_t *)((char *)a1 + 4 * a2) = v26;
  *(uint16x8_t *)((char *)a1 + 6 * a2) = result;
  return result;
}

uint16x8_t *sub_1C98252D8(uint16x8_t *result, uint64_t a2, uint64_t a3, int16x8_t *a4, int16x4_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint16x8_t *v7;
  uint16x8_t v8;
  int32x4_t v9;
  unsigned int v10;
  int16x8_t v11;
  int16x8_t v12;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int16x8_t v23;
  uint16x8_t *v24;
  uint16x8_t v25;
  uint16x8_t v26;
  uint16x8_t v27;

  v5 = 2 * a2;
  v6 = a3 - 128;
  v7 = result + 1;
  v8.i64[0] = 0xFF00FF00FF00FFLL;
  v8.i64[1] = 0xFF00FF00FF00FFLL;
  v9.i64[0] = 0x800000008;
  v9.i64[1] = 0x800000008;
  v10 = -2;
  do
  {
    v12 = *(int16x8_t *)(v6 + 128);
    v11 = *(int16x8_t *)(v6 + 144);
    v14 = *a4;
    v13 = a4[1];
    if (a5)
    {
      v15 = *(int16x8_t *)(v6 + 16);
      v16 = vdupq_laneq_s32(vsubw_s16(v9, *a5), 2);
      v17 = vshlq_s32(vmovl_s16(*(int16x4_t *)v6), v16);
      v18 = vshlq_s32(vmovl_high_s16(*(int16x8_t *)v6), v16);
      v19 = vshlq_s32(vmovl_s16(*(int16x4_t *)v15.i8), v16);
      v20 = vshlq_s32(vmovl_high_s16(v15), v16);
      v21 = vmovl_s16(vdup_lane_s16(*a5, 0));
      v22 = vmovl_s16(vdup_lane_s16(*a5, 1));
      v12 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v17, v21), 3uLL), vmulq_s32(v18, v21), 3uLL), v12);
      v11 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v19, v21), 3uLL), vmulq_s32(v20, v21), 3uLL), v11);
      v14 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v17, v22), 3uLL), vmulq_s32(v18, v22), 3uLL), v14);
      v13 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v19, v22), 3uLL), vmulq_s32(v20, v22), 3uLL), v13);
      *(_OWORD *)v6 = 0uLL;
      *(_OWORD *)(v6 + 16) = 0uLL;
    }
    *(_OWORD *)(v6 + 128) = 0uLL;
    *(_OWORD *)(v6 + 144) = 0uLL;
    v23 = vzip1q_s16(v12, v14);
    *a4 = 0uLL;
    a4[1] = 0uLL;
    a4 += 2;
    v24 = (uint16x8_t *)((char *)v7 + v5);
    v25 = vminq_u16(vsqaddq_u16(*v7, vzip2q_s16(v12, v14)), v8);
    v26 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v7[-1] + v5), vzip1q_s16(v11, v13)), v8);
    v27 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v7 + 2 * a2), vzip2q_s16(v11, v13)), v8);
    v7[-1] = vminq_u16(vsqaddq_u16(v7[-1], v23), v8);
    *v7 = v25;
    v10 += 2;
    v24[-1] = v26;
    *v24 = v27;
    v6 += 32;
    v7 = (uint16x8_t *)((char *)v7 + 4 * a2);
  }
  while (v10 < 6);
  return result;
}

uint16x8_t *sub_1C9825400(uint16x8_t *result, uint64_t a2, uint64_t a3, uint64_t a4, int16x4_t *a5)
{
  uint64_t v5;
  uint16x8_t *v6;
  uint16x8_t v7;
  int32x4_t v8;
  _OWORD *v9;
  int16x8_t *v10;
  int16x8_t v11;
  int16x8_t v12;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t *v15;
  int16x8_t v16;
  int16x8_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int16x8_t v25;
  uint16x8_t v26;
  uint16x8_t v27;
  uint16x8_t v28;

  v5 = 0;
  v6 = result + 2;
  v7.i64[0] = 0xFF00FF00FF00FFLL;
  v7.i64[1] = 0xFF00FF00FF00FFLL;
  v8.i64[0] = 0x800000008;
  v8.i64[1] = 0x800000008;
  do
  {
    v9 = (_OWORD *)(a4 + v5);
    v10 = (int16x8_t *)(a3 + v5);
    v12 = *(int16x8_t *)(a3 + v5);
    v11 = *(int16x8_t *)(a3 + v5 + 16);
    v14 = *(int16x8_t *)(a4 + v5);
    v13 = *(int16x8_t *)(a4 + v5 + 16);
    if (a5)
    {
      v15 = v10 - 32;
      v16 = v10[-32];
      v17 = v10[-31];
      v18 = vdupq_laneq_s32(vsubw_s16(v8, *a5), 2);
      v19 = vshlq_s32(vmovl_s16(*(int16x4_t *)v16.i8), v18);
      v20 = vshlq_s32(vmovl_high_s16(v16), v18);
      v21 = vshlq_s32(vmovl_s16(*(int16x4_t *)v17.i8), v18);
      v22 = vshlq_s32(vmovl_high_s16(v17), v18);
      v23 = vmovl_s16(vdup_lane_s16(*a5, 0));
      v24 = vmovl_s16(vdup_lane_s16(*a5, 1));
      v12 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v19, v23), 3uLL), vmulq_s32(v20, v23), 3uLL), v12);
      v11 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v21, v23), 3uLL), vmulq_s32(v22, v23), 3uLL), v11);
      v14 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v19, v24), 3uLL), vmulq_s32(v20, v24), 3uLL), v14);
      v13 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v21, v24), 3uLL), vmulq_s32(v22, v24), 3uLL), v13);
      *v15 = 0uLL;
      v15[1] = 0uLL;
    }
    *v10 = 0uLL;
    v10[1] = 0uLL;
    v25 = vzip1q_s16(v12, v14);
    *v9 = 0uLL;
    v9[1] = 0uLL;
    v26 = vminq_u16(vsqaddq_u16(v6[-1], vzip2q_s16(v12, v14)), v7);
    v27 = vminq_u16(vsqaddq_u16(*v6, vzip1q_s16(v11, v13)), v7);
    v28 = vminq_u16(vsqaddq_u16(v6[1], vzip2q_s16(v11, v13)), v7);
    v6[-2] = vminq_u16(vsqaddq_u16(v6[-2], v25), v7);
    v6[-1] = v26;
    *v6 = v27;
    v6[1] = v28;
    v5 += 32;
    v6 = (uint16x8_t *)((char *)v6 + 2 * a2);
  }
  while ((_DWORD)v5 != 512);
  return result;
}

int16x4_t sub_1C9825528(int16x4_t *a1)
{
  int16x4_t v1;
  int16x4_t v2;
  int16x4_t v3;
  int32x2_t v4;
  int32x2_t v5;
  int32x2_t v6;
  int32x2_t v7;
  int16x4_t v8;
  int16x4_t v9;
  int16x4_t v10;
  int16x4_t v11;
  int16x4_t v12;
  int16x4_t v13;
  int16x4_t v14;
  int16x4_t v15;
  int16x4_t v17[6];

  v17[5] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v1 = a1[1];
  v2 = a1[2];
  v3 = a1[3];
  v4 = (int32x2_t)vtrn1_s16(*a1, v1);
  v5 = (int32x2_t)vtrn2_s16(*a1, v1);
  v6 = (int32x2_t)vtrn1_s16(v2, v3);
  v7 = (int32x2_t)vtrn2_s16(v2, v3);
  v8 = (int16x4_t)vzip1_s32(v5, v7);
  v9 = (int16x4_t)vzip2_s32(v4, v6);
  v10 = (int16x4_t)vzip2_s32(v5, v7);
  v11 = (int16x4_t)vzip1_s32(v4, v6);
  v12 = vadd_s16(v10, v11);
  v13 = vsub_s16(v11, v10);
  v14 = vadd_s16(v9, v8);
  v15 = vsub_s16(v8, v9);
  v17[0] = vqmovn_s32(vrshrq_n_s32(vshlq_n_s32(vaddl_s16(v14, v12), 6uLL), 2uLL));
  v17[1] = vqmovn_s32(vrshrq_n_s32(vmlal_s16(vmull_s16(v15, (int16x4_t)0x24002400240024), v13, (int16x4_t)0x53005300530053), 2uLL));
  v17[2] = vqmovn_s32(vrshrq_n_s32(vshlq_n_s32(vsubl_s16(v12, v14), 6uLL), 2uLL));
  v17[3] = vqmovn_s32(vrshrq_n_s32(vmlsl_s16(vmull_s16(v13, (int16x4_t)0x24002400240024), v15, (int16x4_t)0x53005300530053), 2uLL));
  return sub_1C981AF54(a1, v17);
}

void sub_1C98255FC(int16x4_t *a1)
{
  int16x4_t v2[18];

  v2[17] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  sub_1C981ADF0(v2, a1, 3);
  sub_1C981AE94(a1, v2);
}

void sub_1C9825668(int16x4_t *a1)
{
  int16x4_t v2[66];

  v2[65] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  sub_1C981AB1C(v2, a1, 4);
  sub_1C981AC68(a1, v2);
}

double sub_1C98256D4(uint16x8_t *a1, uint64_t a2, int32x4_t *a3, int32x4_t *a4, int16x4_t *a5, __int16 *a6)
{
  double result;

  if (*a6 >= 1)
    sub_1C981DD10(a3, (unsigned __int16)*a6);
  if (a6[1] >= 1)
    sub_1C981DD10(a4, (unsigned __int16)a6[1]);
  *(_QWORD *)&result = sub_1C982680C(a1, a2, (int16x8_t *)a3, (int16x8_t *)a4, a5).u64[0];
  return result;
}

uint16x8_t *sub_1C9825758(uint16x8_t *result, uint64_t a2, int16x4_t *a3, const __int16 *a4, int16x4_t *a5, int *a6)
{
  __int16 *v7;
  uint16x8_t *v10;
  int v11;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  int16x4_t *v16;
  uint64_t v17;
  unsigned int v18;
  int32x4_t v19;
  uint16x8_t v20;
  int16x8_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int16x8_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int16x8_t v34;
  int32x4_t v35;
  int16x8_t v36;
  int16x8_t v37;
  int16x8_t v38;
  uint16x8_t *v39;
  uint16x8_t v40;
  uint16x8_t v41;
  uint16x8_t v42;
  char v43;
  int16x8_t *v44;
  char v45;
  int16x8_t v46;
  int16x8_t v47;
  int16x8_t v48;
  int32x4_t v49;
  int32x4_t v50;
  int32x4_t v51;
  int32x4_t v52;
  int v53;
  char v54;
  int16x8_t *v55;
  char v56;
  int16x8_t v57;
  int16x8_t v58;
  int16x8_t v59;
  int32x4_t v60;
  int32x4_t v61;
  int32x4_t v62;
  int32x4_t v63;
  uint64_t v64;
  uint64_t v65;
  uint16x8_t *v66;
  int16x4_t *v67;
  uint64_t v68;
  char v69;
  uint16x8_t v70;
  int32x4_t v71;
  char v72;
  int16x8_t v73;
  int16x8_t v74;
  int16x8_t v75;
  int16x8_t v76;
  int16x8_t v77;
  int16x8_t v78;
  int32x4_t v79;
  int32x4_t v80;
  int32x4_t v81;
  int32x4_t v82;
  int16x8_t v83;
  int16x8_t v84;
  int16x8_t v85;
  int16x8_t v86;
  int16x8_t v87;
  int16x8_t v88;
  int32x4_t v89;
  int32x4_t v90;
  int32x4_t v91;
  int32x4_t v92;
  int16x8_t v93;
  int16x8_t v94;
  int16x8_t v95;
  int16x8_t v96;
  int16x8_t v97;
  int32x4_t v98;
  int32x4_t v99;
  int32x4_t v100;
  int32x4_t v101;
  int32x4_t v102;
  int32x4_t v103;
  int32x4_t v104;
  int16x8_t v105;
  int16x8_t v106;
  int32x4_t v107;
  int32x4_t v108;
  int32x4_t v109;
  int32x4_t v110;
  int32x4_t v111;
  int32x4_t v112;
  int32x4_t v113;
  int16x8_t v114;
  int16x8_t v115;
  int16x8_t v116;
  int16x8_t v117;
  uint16x8_t *v118;
  uint16x8_t *v119;
  uint16x8_t v120;
  uint16x8_t v121;
  uint16x8_t v122;
  uint16x8_t v123;
  uint16x8_t v124;
  uint16x8_t v125;
  uint16x8_t v126;
  uint16x8_t v127;
  uint64_t v128;
  unsigned int v129;
  uint16x8_t v130;
  uint16x8_t *v131;
  uint16x8_t v132;
  uint16x8_t v133;
  uint16x8_t v134;

  v7 = (__int16 *)a4;
  v10 = result;
  v11 = *a6;
  if ((*a6 & 0xFFFEFFFE) != 0)
  {
    if ((__int16)v11 < 1)
    {
      if ((v11 & 0x8000) != 0)
      {
        v43 = 1;
        v44 = (int16x8_t *)a3;
        do
        {
          v45 = v43;
          v46 = v44[1];
          v47 = v44[2];
          v48 = v44[3];
          v49 = (int32x4_t)vtrn1q_s16(*v44, v46);
          v50 = (int32x4_t)vtrn2q_s16(*v44, v46);
          v51 = (int32x4_t)vtrn1q_s16(v47, v48);
          v52 = (int32x4_t)vtrn2q_s16(v47, v48);
          *(int32x4_t *)v44 = vtrn1q_s32(v49, v51);
          v44[1] = (int16x8_t)vtrn1q_s32(v50, v52);
          v44[2] = (int16x8_t)vtrn2q_s32(v49, v51);
          v44[3] = (int16x8_t)vtrn2q_s32(v50, v52);
          v44 += 4;
          v43 = 0;
        }
        while ((v45 & 1) != 0);
      }
    }
    else
    {
      sub_1C981DC08(a3, (unsigned __int16)*a6);
    }
    v53 = *((unsigned __int16 *)a6 + 1);
    if (*((__int16 *)a6 + 1) < 1)
    {
      if ((v53 & 0x8000) != 0)
      {
        v54 = 1;
        v55 = (int16x8_t *)v7;
        do
        {
          v56 = v54;
          v57 = v55[1];
          v58 = v55[2];
          v59 = v55[3];
          v60 = (int32x4_t)vtrn1q_s16(*v55, v57);
          v61 = (int32x4_t)vtrn2q_s16(*v55, v57);
          v62 = (int32x4_t)vtrn1q_s16(v58, v59);
          v63 = (int32x4_t)vtrn2q_s16(v58, v59);
          *(int32x4_t *)v55 = vtrn1q_s32(v60, v62);
          v55[1] = (int16x8_t)vtrn1q_s32(v61, v63);
          v55[2] = (int16x8_t)vtrn2q_s32(v60, v62);
          v55[3] = (int16x8_t)vtrn2q_s32(v61, v63);
          v55 += 4;
          v54 = 0;
        }
        while ((v56 & 1) != 0);
      }
    }
    else
    {
      sub_1C981DC08((int16x4_t *)v7, v53);
    }
    v64 = 2 * a2;
    v65 = 4 * a2;
    v66 = v10 + 1;
    v67 = a3 - 16;
    v68 = 6 * a2;
    v69 = 1;
    v70.i64[0] = 0xFE00FE00FE00FE00;
    v70.i64[1] = 0xFE00FE00FE00FE00;
    v71.i64[0] = 0x900000009;
    v71.i64[1] = 0x900000009;
    do
    {
      v72 = v69;
      v73 = *(int16x8_t *)v67[16].i8;
      v74 = *(int16x8_t *)v67[18].i8;
      v75 = *(int16x8_t *)v67[20].i8;
      v76 = *(int16x8_t *)v67[22].i8;
      v77 = *(int16x8_t *)v7;
      v78 = *((int16x8_t *)v7 + 1);
      v79 = (int32x4_t)vtrn1q_s16(v73, v74);
      v80 = (int32x4_t)vtrn2q_s16(v73, v74);
      v81 = (int32x4_t)vtrn1q_s16(v75, v76);
      v82 = (int32x4_t)vtrn2q_s16(v75, v76);
      v83 = *((int16x8_t *)v7 + 2);
      v84 = *((int16x8_t *)v7 + 3);
      *(_OWORD *)v67[16].i8 = 0uLL;
      *(_OWORD *)v67[18].i8 = 0uLL;
      *(_OWORD *)v67[20].i8 = 0uLL;
      *(_OWORD *)v67[22].i8 = 0uLL;
      v85 = (int16x8_t)vtrn1q_s32(v79, v81);
      v86 = (int16x8_t)vtrn2q_s32(v79, v81);
      v87 = (int16x8_t)vtrn1q_s32(v80, v82);
      v88 = (int16x8_t)vtrn2q_s32(v80, v82);
      v89 = (int32x4_t)vtrn1q_s16(v77, v78);
      v90 = (int32x4_t)vtrn2q_s16(v77, v78);
      v91 = (int32x4_t)vtrn1q_s16(v83, v84);
      v92 = (int32x4_t)vtrn2q_s16(v83, v84);
      v93 = (int16x8_t)vtrn1q_s32(v89, v91);
      v94 = (int16x8_t)vtrn2q_s32(v89, v91);
      v95 = (int16x8_t)vtrn1q_s32(v90, v92);
      v96 = (int16x8_t)vtrn2q_s32(v90, v92);
      *((_OWORD *)v7 + 2) = 0uLL;
      *((_OWORD *)v7 + 3) = 0uLL;
      *(_OWORD *)v7 = 0uLL;
      *((_OWORD *)v7 + 1) = 0uLL;
      if (a5)
      {
        v97 = *(int16x8_t *)v67[2].i8;
        v98 = vdupq_laneq_s32(vsubw_s16(v71, *a5), 2);
        v99 = vshlq_s32(vmovl_s16(*v67), v98);
        v100 = vshlq_s32(vmovl_high_s16(*(int16x8_t *)v67->i8), v98);
        v101 = vshlq_s32(vmovl_s16(*(int16x4_t *)v97.i8), v98);
        v102 = vshlq_s32(vmovl_high_s16(v97), v98);
        v103 = vmovl_s16(vdup_lane_s16(*a5, 0));
        v104 = vmovl_s16(vdup_lane_s16(*a5, 1));
        *(_OWORD *)v67->i8 = 0uLL;
        *(_OWORD *)v67[2].i8 = 0uLL;
        v85 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v99, v103), 3uLL), vmulq_s32(v100, v103), 3uLL), v85);
        v93 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v99, v104), 3uLL), vmulq_s32(v100, v104), 3uLL), v93);
        v87 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v101, v103), 3uLL), vmulq_s32(v102, v103), 3uLL), v87);
        v95 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v101, v104), 3uLL), vmulq_s32(v102, v104), 3uLL), v95);
        v105 = *(int16x8_t *)v67[4].i8;
        v106 = *(int16x8_t *)v67[6].i8;
        v107 = vdupq_laneq_s32(vsubw_s16(v71, *a5), 2);
        v108 = vshlq_s32(vmovl_s16(*(int16x4_t *)v105.i8), v107);
        v109 = vshlq_s32(vmovl_high_s16(v105), v107);
        v110 = vshlq_s32(vmovl_s16(*(int16x4_t *)v106.i8), v107);
        v111 = vshlq_s32(vmovl_high_s16(v106), v107);
        v112 = vmovl_s16(vdup_lane_s16(*a5, 0));
        v113 = vmovl_s16(vdup_lane_s16(*a5, 1));
        *(_OWORD *)v67[4].i8 = 0uLL;
        *(_OWORD *)v67[6].i8 = 0uLL;
        v86 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v112), 3uLL), vmulq_s32(v109, v112), 3uLL), v86);
        v94 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v113), 3uLL), vmulq_s32(v109, v113), 3uLL), v94);
        v88 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v110, v112), 3uLL), vmulq_s32(v111, v112), 3uLL), v88);
        v96 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v110, v113), 3uLL), vmulq_s32(v111, v113), 3uLL), v96);
      }
      v69 = 0;
      v114 = vzip1q_s16(v85, v93);
      v115 = vzip2q_s16(v85, v93);
      v116 = vzip1q_s16(v87, v95);
      v117 = vzip2q_s16(v87, v95);
      v118 = (uint16x8_t *)((char *)v66 + v64);
      v119 = (uint16x8_t *)((char *)v66 + v65);
      result = (uint16x8_t *)((char *)v66 + v68);
      v120 = vsqaddq_u16(v66[-1], v114);
      v121 = *(uint16x8_t *)((char *)v66 + 4 * a2);
      v122 = vsqaddq_u16(*(uint16x8_t *)((char *)&v66[-1] + v64), v116);
      v123 = *(uint16x8_t *)((char *)v66 + 6 * a2);
      v124 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v66[-1] + v65), vzip1q_s16(v86, v94)), v70);
      v125 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v66[-1] + v68), vzip1q_s16(v88, v96)), v70);
      v126 = vminq_u16(vsqaddq_u16(*v66, v115), v70);
      v127 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v66 + 2 * a2), v117), v70);
      v66[-1] = vminq_u16(v120, v70);
      v118[-1] = vminq_u16(v122, v70);
      v119[-1] = v124;
      result[-1] = v125;
      *v66 = v126;
      *v118 = v127;
      *v119 = vminq_u16(vsqaddq_u16(v121, vzip2q_s16(v86, v94)), v70);
      *result = vminq_u16(vsqaddq_u16(v123, vzip2q_s16(v88, v96)), v70);
      v66 = (uint16x8_t *)((char *)v66 + 8 * a2);
      v67 += 8;
      v7 += 32;
    }
    while ((v72 & 1) != 0);
  }
  else
  {
    v13 = vld1q_dup_s16((const __int16 *)a3);
    v14 = vld1q_dup_s16(a4);
    v15 = vrshrq_n_s16(vrshrq_n_s16(vzip1q_s16(v13, v14), 1uLL), 5uLL);
    a3->i16[0] = 0;
    *a4 = 0;
    if (a5)
    {
      v16 = a3 - 16;
      v17 = 2 * a2;
      v18 = -2;
      v19.i64[0] = 0x900000009;
      v19.i64[1] = 0x900000009;
      v20.i64[0] = 0xFE00FE00FE00FE00;
      v20.i64[1] = 0xFE00FE00FE00FE00;
      do
      {
        v21 = *(int16x8_t *)v16[2].i8;
        v22 = vdupq_laneq_s32(vsubw_s16(v19, *a5), 2);
        v23 = vshlq_s32(vmovl_s16(*v16), v22);
        v24 = vshlq_s32(vmovl_high_s16(*(int16x8_t *)v16->i8), v22);
        v25 = vshlq_s32(vmovl_s16(*(int16x4_t *)v21.i8), v22);
        v26 = vshlq_s32(vmovl_high_s16(v21), v22);
        v27 = vmovl_s16(vdup_lane_s16(*a5, 0));
        v28 = vmulq_s32(v25, v27);
        v29 = vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v23, v27), 3uLL), vmulq_s32(v24, v27), 3uLL);
        v30 = vmovl_s16(vdup_lane_s16(*a5, 1));
        v31 = vmulq_s32(v23, v30);
        v32 = vmulq_s32(v24, v30);
        v33 = vmulq_s32(v25, v30);
        v34 = vshrn_high_n_s32(vshrn_n_s32(v28, 3uLL), vmulq_s32(v26, v27), 3uLL);
        v35 = vmulq_s32(v26, v30);
        v36 = vshrn_high_n_s32(vshrn_n_s32(v31, 3uLL), v32, 3uLL);
        v37 = vshrn_high_n_s32(vshrn_n_s32(v33, 3uLL), v35, 3uLL);
        *(_OWORD *)v16->i8 = 0uLL;
        *(_OWORD *)v16[2].i8 = 0uLL;
        v16 += 4;
        v38 = vaddq_s16(vzip1q_s16(v29, v36), v15);
        v39 = (uint16x8_t *)((char *)v10 + v17);
        v40 = vminq_u16(vsqaddq_u16(v10[1], vaddq_s16(vzip2q_s16(v29, v36), v15)), v20);
        v41 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v10 + 2 * a2), vaddq_s16(vzip1q_s16(v34, v37), v15)), v20);
        v42 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v10[1] + v17), vaddq_s16(vzip2q_s16(v34, v37), v15)), v20);
        *v10 = vminq_u16(vsqaddq_u16(*v10, v38), v20);
        v10[1] = v40;
        *v39 = v41;
        v39[1] = v42;
        v18 += 2;
        v10 = (uint16x8_t *)((char *)v10 + 4 * a2);
      }
      while (v18 < 6);
    }
    else
    {
      v128 = 2 * a2;
      v129 = -2;
      v130.i64[0] = 0xFE00FE00FE00FE00;
      v130.i64[1] = 0xFE00FE00FE00FE00;
      do
      {
        v131 = (uint16x8_t *)((char *)v10 + v128);
        v132 = vminq_u16(vsqaddq_u16(v10[1], v15), v130);
        v133 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v10 + 2 * a2), v15), v130);
        v134 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v10[1] + v128), v15), v130);
        *v10 = vminq_u16(vsqaddq_u16(*v10, v15), v130);
        v10[1] = v132;
        *v131 = v133;
        v131[1] = v134;
        v129 += 2;
        v10 = (uint16x8_t *)((char *)v10 + 4 * a2);
      }
      while (v129 < 6);
    }
  }
  return result;
}

int16x4_t *sub_1C9825C60(int16x4_t *result, uint64_t a2, int16x4_t *a3, const __int16 *a4, int16x4_t *a5, int *a6)
{
  int16x4_t *v7;
  int16x4_t *v8;
  int16x4_t *v10;
  int v11;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  uint16x8_t *v16;
  uint64_t v17;
  uint64_t v18;
  int32x4_t v19;
  uint16x8_t v20;
  int16x4_t *v21;
  int16x8_t v22;
  int16x8_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int16x8_t v30;
  int16x8_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int32x4_t v34;
  int32x4_t v35;
  int32x4_t v36;
  int16x8_t v37;
  int16x8_t v38;
  int16x8_t v39;
  uint16x8_t v40;
  uint16x8_t v41;
  uint16x8_t v42;
  unsigned int v43;
  int16x4_t *v44;
  uint64_t v45;
  char v46;
  char v47;
  int16x8_t *v48;
  int16x8_t v49;
  int16x8_t v50;
  int16x8_t v51;
  int32x4_t v52;
  int32x4_t v53;
  int32x4_t v54;
  int32x4_t v55;
  BOOL v56;
  int v57;
  unsigned int v58;
  int16x4_t *v59;
  uint64_t v60;
  char v61;
  char v62;
  int16x8_t *v63;
  int16x8_t v64;
  int16x8_t v65;
  int16x8_t v66;
  int32x4_t v67;
  int32x4_t v68;
  int32x4_t v69;
  int32x4_t v70;
  unsigned int v71;
  uint16x8_t v72;
  int32x4_t v73;
  uint64_t v74;
  char v75;
  char v76;
  int16x8_t *v77;
  int16x8_t v78;
  int16x8_t v79;
  int16x8_t v80;
  int16x8_t *v81;
  int16x8_t v82;
  int16x8_t v83;
  int16x8_t v84;
  int32x4_t v85;
  int32x4_t v86;
  int32x4_t v87;
  int32x4_t v88;
  int16x8_t v89;
  int16x8_t v90;
  int16x8_t v91;
  int16x8_t v92;
  int16x8_t v93;
  int32x4_t v94;
  int32x4_t v95;
  int32x4_t v96;
  int32x4_t v97;
  int16x8_t v98;
  int16x8_t v99;
  int16x8_t v100;
  int16x8_t v101;
  int16x4_t v102;
  int16x8_t v103;
  int16x8_t v104;
  int32x4_t v105;
  int32x4_t v106;
  int32x4_t v107;
  int32x4_t v108;
  int32x4_t v109;
  int32x4_t v110;
  int32x4_t v111;
  int16x8_t *v112;
  int16x8_t v113;
  int16x8_t *v114;
  int16x8_t v115;
  int32x4_t v116;
  int32x4_t v117;
  int32x4_t v118;
  int32x4_t v119;
  int32x4_t v120;
  int32x4_t v121;
  int32x4_t v122;
  int16x8_t v123;
  int16x8_t v124;
  uint16x8_t *v125;
  uint16x8_t *v126;
  uint16x8_t *v127;
  uint16x8_t *v128;
  uint16x8_t v129;
  uint16x8_t v130;
  uint16x8_t v131;
  uint16x8_t v132;
  uint16x8_t v133;
  uint16x8_t v134;
  uint16x8_t v135;
  uint16x8_t v136;
  int v137;
  uint16x8_t v138;
  uint16x8_t v139;
  uint16x8_t v140;
  uint16x8_t v141;

  v7 = (int16x4_t *)a4;
  v8 = a3;
  v10 = result;
  v11 = *a6;
  if ((*a6 & 0xFFFEFFFE) != 0)
  {
    if ((__int16)v11 < 1)
    {
      if ((v11 & 0x8000) != 0)
      {
        v43 = 0;
        v44 = a3;
        do
        {
          v45 = 0;
          v46 = 1;
          do
          {
            v47 = v46;
            v48 = (int16x8_t *)&v44[v45];
            v49 = v48[2];
            v50 = v48[4];
            v51 = v48[6];
            v52 = (int32x4_t)vtrn1q_s16(*v48, v49);
            v53 = (int32x4_t)vtrn2q_s16(*v48, v49);
            v54 = (int32x4_t)vtrn1q_s16(v50, v51);
            v55 = (int32x4_t)vtrn2q_s16(v50, v51);
            *(int32x4_t *)v48 = vtrn1q_s32(v52, v54);
            v48[2] = (int16x8_t)vtrn1q_s32(v53, v55);
            v48[4] = (int16x8_t)vtrn2q_s32(v52, v54);
            v48[6] = (int16x8_t)vtrn2q_s32(v53, v55);
            v45 = 2;
            v46 = 0;
          }
          while ((v47 & 1) != 0);
          v44 += 16;
          v56 = v43 >= 0xC;
          v43 += 4;
        }
        while (!v56);
      }
    }
    else
    {
      result = sub_1C981DA2C(a3, (unsigned __int16)*a6);
    }
    v57 = *((unsigned __int16 *)a6 + 1);
    if (*((__int16 *)a6 + 1) < 1)
    {
      if ((v57 & 0x8000) != 0)
      {
        v58 = 0;
        v59 = v7;
        do
        {
          v60 = 0;
          v61 = 1;
          do
          {
            v62 = v61;
            v63 = (int16x8_t *)&v59[v60];
            v64 = v63[2];
            v65 = v63[4];
            v66 = v63[6];
            v67 = (int32x4_t)vtrn1q_s16(*v63, v64);
            v68 = (int32x4_t)vtrn2q_s16(*v63, v64);
            v69 = (int32x4_t)vtrn1q_s16(v65, v66);
            v70 = (int32x4_t)vtrn2q_s16(v65, v66);
            *(int32x4_t *)v63 = vtrn1q_s32(v67, v69);
            v63[2] = (int16x8_t)vtrn1q_s32(v68, v70);
            v63[4] = (int16x8_t)vtrn2q_s32(v67, v69);
            v63[6] = (int16x8_t)vtrn2q_s32(v68, v70);
            v60 = 2;
            v61 = 0;
          }
          while ((v62 & 1) != 0);
          v59 += 16;
          v56 = v58 >= 0xC;
          v58 += 4;
        }
        while (!v56);
      }
    }
    else
    {
      result = sub_1C981DA2C(v7, v57);
    }
    v71 = 0;
    v72.i64[0] = 0xFE00FE00FE00FE00;
    v72.i64[1] = 0xFE00FE00FE00FE00;
    v73.i64[0] = 0x900000009;
    v73.i64[1] = 0x900000009;
    do
    {
      v74 = 0;
      v75 = 1;
      do
      {
        v76 = v75;
        v77 = (int16x8_t *)&v8[(unint64_t)v74 / 2];
        v78 = v77[2];
        v79 = v77[4];
        v80 = v77[6];
        v81 = (int16x8_t *)&v7[(unint64_t)v74 / 2];
        v82 = *v81;
        v83 = v81[2];
        v84 = v81[4];
        v85 = (int32x4_t)vtrn1q_s16(*v77, v78);
        v86 = (int32x4_t)vtrn2q_s16(*v77, v78);
        v87 = (int32x4_t)vtrn1q_s16(v79, v80);
        v88 = (int32x4_t)vtrn2q_s16(v79, v80);
        v89 = v81[6];
        *v77 = 0uLL;
        v77[2] = 0uLL;
        v77[4] = 0uLL;
        v77[6] = 0uLL;
        *v81 = 0uLL;
        v81[2] = 0uLL;
        v81[4] = 0uLL;
        v81[6] = 0uLL;
        v90 = (int16x8_t)vtrn1q_s32(v85, v87);
        v91 = (int16x8_t)vtrn2q_s32(v85, v87);
        v92 = (int16x8_t)vtrn1q_s32(v86, v88);
        v93 = (int16x8_t)vtrn2q_s32(v86, v88);
        v94 = (int32x4_t)vtrn1q_s16(v82, v83);
        v95 = (int32x4_t)vtrn2q_s16(v82, v83);
        v96 = (int32x4_t)vtrn1q_s16(v84, v89);
        v97 = (int32x4_t)vtrn2q_s16(v84, v89);
        v98 = (int16x8_t)vtrn1q_s32(v94, v96);
        v99 = (int16x8_t)vtrn2q_s32(v94, v96);
        v100 = (int16x8_t)vtrn1q_s32(v95, v97);
        v101 = (int16x8_t)vtrn2q_s32(v95, v97);
        if (a5)
        {
          v102 = *a5;
          v103 = v77[-32];
          v104 = v77[-30];
          v77[-32] = 0uLL;
          v77[-30] = 0uLL;
          v105 = vdupq_laneq_s32(vsubw_s16(v73, v102), 2);
          v106 = vshlq_s32(vmovl_s16(*(int16x4_t *)v103.i8), v105);
          v107 = vshlq_s32(vmovl_high_s16(v103), v105);
          v108 = vshlq_s32(vmovl_s16(*(int16x4_t *)v104.i8), v105);
          v109 = vshlq_s32(vmovl_high_s16(v104), v105);
          v110 = vmovl_s16(vdup_lane_s16(v102, 0));
          v111 = vmovl_s16(vdup_lane_s16(v102, 1));
          v90 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v106, v110), 3uLL), vmulq_s32(v107, v110), 3uLL), v90);
          v98 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v106, v111), 3uLL), vmulq_s32(v107, v111), 3uLL), v98);
          v92 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v110), 3uLL), vmulq_s32(v109, v110), 3uLL), v92);
          v100 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v111), 3uLL), vmulq_s32(v109, v111), 3uLL), v100);
          v112 = v77 - 28;
          *(int16x4_t *)v111.i8 = *a5;
          v113 = v77[-28];
          v114 = v77 - 26;
          v115 = *v114;
          *v112 = 0uLL;
          *v114 = 0uLL;
          v116 = vdupq_laneq_s32(vsubw_s16(v73, *(int16x4_t *)v111.i8), 2);
          v117 = vshlq_s32(vmovl_s16(*(int16x4_t *)v113.i8), v116);
          v118 = vshlq_s32(vmovl_high_s16(v113), v116);
          v119 = vshlq_s32(vmovl_s16(*(int16x4_t *)v115.i8), v116);
          v120 = vshlq_s32(vmovl_high_s16(v115), v116);
          v121 = vmovl_s16(vdup_lane_s16(*(int16x4_t *)v111.i8, 0));
          v122 = vmovl_s16(vdup_lane_s16(*(int16x4_t *)v111.i8, 1));
          v91 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v117, v121), 3uLL), vmulq_s32(v118, v121), 3uLL), v91);
          v99 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v117, v122), 3uLL), vmulq_s32(v118, v122), 3uLL), v99);
          v93 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v119, v121), 3uLL), vmulq_s32(v120, v121), 3uLL), v93);
          v101 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v119, v122), 3uLL), vmulq_s32(v120, v122), 3uLL), v101);
        }
        v75 = 0;
        v123 = vzip1q_s16(v90, v98);
        v124 = vzip2q_s16(v90, v98);
        v125 = (uint16x8_t *)&v10[v74];
        v126 = (uint16x8_t *)((char *)v125 + 2 * a2);
        v127 = (uint16x8_t *)((char *)v125 + 4 * a2);
        v128 = (uint16x8_t *)((char *)v125 + 6 * a2);
        v129 = v126[1];
        v130 = vsqaddq_u16(*v125, v123);
        v131 = v127[1];
        v132 = v128[1];
        v133 = vminq_u16(vsqaddq_u16(*v126, vzip1q_s16(v92, v100)), v72);
        v134 = vminq_u16(vsqaddq_u16(*v127, vzip1q_s16(v91, v99)), v72);
        v135 = vminq_u16(vsqaddq_u16(*v128, vzip1q_s16(v93, v101)), v72);
        v136 = vminq_u16(vsqaddq_u16(v125[1], v124), v72);
        *v125 = vminq_u16(v130, v72);
        *v126 = v133;
        *v127 = v134;
        *v128 = v135;
        v125[1] = v136;
        v126[1] = vminq_u16(vsqaddq_u16(v129, vzip2q_s16(v92, v100)), v72);
        v127[1] = vminq_u16(vsqaddq_u16(v131, vzip2q_s16(v91, v99)), v72);
        v128[1] = vminq_u16(vsqaddq_u16(v132, vzip2q_s16(v93, v101)), v72);
        v74 = 4;
      }
      while ((v76 & 1) != 0);
      v10 += a2;
      v8 += 16;
      v7 += 16;
      v56 = v71 >= 0xC;
      v71 += 4;
    }
    while (!v56);
  }
  else
  {
    v13 = vld1q_dup_s16((const __int16 *)a3);
    v14 = vld1q_dup_s16(a4);
    v15 = vrshrq_n_s16(vrshrq_n_s16(vzip1q_s16(v13, v14), 1uLL), 5uLL);
    a3->i16[0] = 0;
    *a4 = 0;
    v16 = (uint16x8_t *)&result[4];
    v17 = 2 * a2;
    if (a5)
    {
      v18 = 0x1FFFFFFFFFFFFFC0;
      v19.i64[0] = 0x900000009;
      v19.i64[1] = 0x900000009;
      v20.i64[0] = 0xFE00FE00FE00FE00;
      v20.i64[1] = 0xFE00FE00FE00FE00;
      do
      {
        v21 = &a3[v18];
        v22 = *(int16x8_t *)a3[v18].i8;
        v23 = *(int16x8_t *)a3[v18 + 2].i8;
        v24 = vdupq_laneq_s32(vsubw_s16(v19, *a5), 2);
        v25 = vshlq_s32(vmovl_s16(*(int16x4_t *)v22.i8), v24);
        v26 = vshlq_s32(vmovl_high_s16(v22), v24);
        v27 = vshlq_s32(vmovl_s16(*(int16x4_t *)v23.i8), v24);
        v28 = vshlq_s32(vmovl_high_s16(v23), v24);
        v29 = vmovl_s16(vdup_lane_s16(*a5, 0));
        v30 = vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v25, v29), 3uLL), vmulq_s32(v26, v29), 3uLL);
        v31 = vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v27, v29), 3uLL), vmulq_s32(v28, v29), 3uLL);
        v32 = vmovl_s16(vdup_lane_s16(*a5, 1));
        v33 = vmulq_s32(v25, v32);
        v34 = vmulq_s32(v26, v32);
        v35 = vmulq_s32(v27, v32);
        v36 = vmulq_s32(v28, v32);
        v37 = vshrn_high_n_s32(vshrn_n_s32(v33, 3uLL), v34, 3uLL);
        v38 = vshrn_high_n_s32(vshrn_n_s32(v35, 3uLL), v36, 3uLL);
        *(_OWORD *)v21->i8 = 0uLL;
        *(_OWORD *)v21[2].i8 = 0uLL;
        v39 = vaddq_s16(vzip1q_s16(v30, v37), v15);
        v40 = vminq_u16(vsqaddq_u16(v16[-1], vaddq_s16(vzip2q_s16(v30, v37), v15)), v20);
        v41 = vminq_u16(vsqaddq_u16(*v16, vaddq_s16(vzip1q_s16(v31, v38), v15)), v20);
        v42 = vsqaddq_u16(v16[1], vaddq_s16(vzip2q_s16(v31, v38), v15));
        v16[-2] = vminq_u16(vsqaddq_u16(v16[-2], v39), v20);
        v16[-1] = v40;
        *v16 = v41;
        v16[1] = vminq_u16(v42, v20);
        v16 = (uint16x8_t *)((char *)v16 + v17);
        v18 += 4;
      }
      while ((_DWORD)(v18 * 8));
    }
    else
    {
      v137 = 16;
      v138.i64[0] = 0xFE00FE00FE00FE00;
      v138.i64[1] = 0xFE00FE00FE00FE00;
      do
      {
        v139 = vminq_u16(vsqaddq_u16(v16[-1], v15), v138);
        v140 = vminq_u16(vsqaddq_u16(*v16, v15), v138);
        v141 = vminq_u16(vsqaddq_u16(v16[1], v15), v138);
        v16[-2] = vminq_u16(vsqaddq_u16(v16[-2], v15), v138);
        v16[-1] = v139;
        *v16 = v140;
        v16[1] = v141;
        v16 = (uint16x8_t *)((char *)v16 + v17);
        --v137;
      }
      while (v137);
    }
  }
  return result;
}

uint16x8_t *sub_1C9826208(uint16x8_t *result, uint64_t a2, int16x4_t *a3, const __int16 *a4, int16x4_t *a5, int *a6)
{
  int16x4_t *v7;
  int16x4_t *v8;
  uint16x8_t *v10;
  int v11;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  int v16;
  int16x4_t *v17;
  int32x4_t v18;
  uint16x8_t v19;
  uint64_t v20;
  char v21;
  int16x8_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int16x8_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int32x4_t v34;
  int16x8_t v35;
  int32x4_t v36;
  int16x8_t v37;
  int16x8_t v38;
  char v39;
  int16x8_t v40;
  uint16x8_t *v41;
  uint16x8_t v42;
  uint16x8_t v43;
  uint16x8_t v44;
  unsigned int v45;
  int16x4_t *v46;
  unint64_t v47;
  int16x8_t *v48;
  int16x8_t v49;
  int16x8_t v50;
  int16x8_t v51;
  int32x4_t v52;
  int32x4_t v53;
  int32x4_t v54;
  int32x4_t v55;
  BOOL v56;
  int v57;
  unsigned int v58;
  int16x4_t *v59;
  unint64_t v60;
  int16x8_t *v61;
  int16x8_t v62;
  int16x8_t v63;
  int16x8_t v64;
  int32x4_t v65;
  int32x4_t v66;
  int32x4_t v67;
  int32x4_t v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint16x8_t v73;
  int32x4_t v74;
  uint64_t v75;
  unint64_t v76;
  uint16x8_t *v77;
  int16x8_t *v78;
  int16x8_t v79;
  int16x8_t v80;
  int16x8_t v81;
  int16x8_t v82;
  int16x4_t *v83;
  int16x8_t v84;
  int16x8_t v85;
  int16x8_t v86;
  int32x4_t v87;
  int32x4_t v88;
  int32x4_t v89;
  int32x4_t v90;
  int16x8_t v91;
  int16x8_t v92;
  int16x8_t v93;
  int16x8_t v94;
  int16x8_t v95;
  int32x4_t v96;
  int32x4_t v97;
  int32x4_t v98;
  int32x4_t v99;
  int16x8_t v100;
  int16x8_t v101;
  int16x8_t v102;
  int16x8_t v103;
  int16x4_t v104;
  int16x8_t v105;
  int16x8_t v106;
  int32x4_t v107;
  int32x4_t v108;
  int32x4_t v109;
  int32x4_t v110;
  int32x4_t v111;
  int32x4_t v112;
  int32x4_t v113;
  int16x8_t *v114;
  int16x8_t v115;
  int16x8_t *v116;
  int16x8_t v117;
  int32x4_t v118;
  int32x4_t v119;
  int32x4_t v120;
  int32x4_t v121;
  int32x4_t v122;
  int32x4_t v123;
  int32x4_t v124;
  int16x8_t v125;
  int16x8_t v126;
  int16x8_t v127;
  int16x8_t v128;
  int16x8_t v129;
  int16x8_t v130;
  int16x8_t v131;
  int16x8_t v132;
  uint16x8_t *v133;
  uint16x8_t *v134;
  uint16x8_t v135;
  uint16x8_t v136;
  uint16x8_t v137;
  uint16x8_t v138;
  uint16x8_t v139;
  uint16x8_t v140;
  uint16x8_t v141;
  uint16x8_t *v142;
  int v143;
  uint16x8_t v144;
  uint16x8_t v145;
  uint16x8_t v146;
  uint16x8_t v147;
  uint16x8_t v148;
  uint16x8_t v149;
  uint16x8_t v150;

  v7 = (int16x4_t *)a4;
  v8 = a3;
  v10 = result;
  v11 = *a6;
  if ((*a6 & 0xFFFEFFFE) != 0)
  {
    if ((__int16)v11 < 1)
    {
      if ((v11 & 0x8000) != 0)
      {
        v45 = 0;
        v46 = a3 + 16;
        do
        {
          v47 = -8;
          v48 = (int16x8_t *)v46;
          do
          {
            v49 = v48[-8];
            v50 = v48[-4];
            v51 = v48[4];
            v52 = (int32x4_t)vtrn1q_s16(v49, v50);
            v53 = (int32x4_t)vtrn2q_s16(v49, v50);
            v54 = (int32x4_t)vtrn1q_s16(*v48, v51);
            v55 = (int32x4_t)vtrn2q_s16(*v48, v51);
            v48[-8] = (int16x8_t)vtrn1q_s32(v52, v54);
            v48[-4] = (int16x8_t)vtrn1q_s32(v53, v55);
            *(int32x4_t *)v48 = vtrn2q_s32(v52, v54);
            v48[4] = (int16x8_t)vtrn2q_s32(v53, v55);
            v47 += 8;
            ++v48;
          }
          while (v47 < 0x18);
          v46 += 32;
          v56 = v45 >= 0x1C;
          v45 += 4;
        }
        while (!v56);
      }
    }
    else
    {
      sub_1C981D104(a3, (unsigned __int16)*a6);
    }
    v57 = *((unsigned __int16 *)a6 + 1);
    if (*((__int16 *)a6 + 1) < 1)
    {
      if ((v57 & 0x8000) != 0)
      {
        v58 = 0;
        v59 = v7 + 16;
        do
        {
          v60 = -8;
          v61 = (int16x8_t *)v59;
          do
          {
            v62 = v61[-8];
            v63 = v61[-4];
            v64 = v61[4];
            v65 = (int32x4_t)vtrn1q_s16(v62, v63);
            v66 = (int32x4_t)vtrn2q_s16(v62, v63);
            v67 = (int32x4_t)vtrn1q_s16(*v61, v64);
            v68 = (int32x4_t)vtrn2q_s16(*v61, v64);
            v61[-8] = (int16x8_t)vtrn1q_s32(v65, v67);
            v61[-4] = (int16x8_t)vtrn1q_s32(v66, v68);
            *(int32x4_t *)v61 = vtrn2q_s32(v65, v67);
            v61[4] = (int16x8_t)vtrn2q_s32(v66, v68);
            v60 += 8;
            ++v61;
          }
          while (v60 < 0x18);
          v59 += 32;
          v56 = v58 >= 0x1C;
          v58 += 4;
        }
        while (!v56);
      }
    }
    else
    {
      sub_1C981D104(v7, v57);
    }
    v69 = 0;
    v70 = 2 * a2;
    v71 = 6 * a2 + 16;
    v72 = 4 * a2 + 16;
    v73.i64[0] = 0xFE00FE00FE00FE00;
    v73.i64[1] = 0xFE00FE00FE00FE00;
    v74.i64[0] = 0x900000009;
    v74.i64[1] = 0x900000009;
    do
    {
      v75 = 0;
      v76 = -8;
      v77 = v10;
      do
      {
        v78 = (int16x8_t *)&v8[v75];
        v79 = *(int16x8_t *)v8[v75].i8;
        v80 = *(int16x8_t *)v8[v75 + 8].i8;
        v81 = *(int16x8_t *)v8[v75 + 16].i8;
        v82 = *(int16x8_t *)v8[v75 + 24].i8;
        v83 = &v7[v75];
        v84 = *(int16x8_t *)v7[v75].i8;
        v85 = *(int16x8_t *)v7[v75 + 8].i8;
        v86 = *(int16x8_t *)v7[v75 + 16].i8;
        v87 = (int32x4_t)vtrn1q_s16(v79, v80);
        v88 = (int32x4_t)vtrn2q_s16(v79, v80);
        v89 = (int32x4_t)vtrn1q_s16(v81, v82);
        v90 = (int32x4_t)vtrn2q_s16(v81, v82);
        v91 = *(int16x8_t *)v7[v75 + 24].i8;
        *v78 = 0uLL;
        v78[4] = 0uLL;
        v78[8] = 0uLL;
        v78[12] = 0uLL;
        *(_OWORD *)v83->i8 = 0uLL;
        *(_OWORD *)v83[8].i8 = 0uLL;
        *(_OWORD *)v83[16].i8 = 0uLL;
        *(_OWORD *)v83[24].i8 = 0uLL;
        v92 = (int16x8_t)vtrn1q_s32(v87, v89);
        v93 = (int16x8_t)vtrn2q_s32(v87, v89);
        v94 = (int16x8_t)vtrn1q_s32(v88, v90);
        v95 = (int16x8_t)vtrn2q_s32(v88, v90);
        v96 = (int32x4_t)vtrn1q_s16(v84, v85);
        v97 = (int32x4_t)vtrn2q_s16(v84, v85);
        v98 = (int32x4_t)vtrn1q_s16(v86, v91);
        v99 = (int32x4_t)vtrn2q_s16(v86, v91);
        v100 = (int16x8_t)vtrn1q_s32(v96, v98);
        v101 = (int16x8_t)vtrn2q_s32(v96, v98);
        v102 = (int16x8_t)vtrn1q_s32(v97, v99);
        v103 = (int16x8_t)vtrn2q_s32(v97, v99);
        if (a5)
        {
          v104 = *a5;
          v105 = v78[-128];
          v106 = v78[-124];
          v78[-128] = 0uLL;
          v78[-124] = 0uLL;
          v107 = vdupq_laneq_s32(vsubw_s16(v74, v104), 2);
          v108 = vshlq_s32(vmovl_s16(*(int16x4_t *)v105.i8), v107);
          v109 = vshlq_s32(vmovl_high_s16(v105), v107);
          v110 = vshlq_s32(vmovl_s16(*(int16x4_t *)v106.i8), v107);
          v111 = vshlq_s32(vmovl_high_s16(v106), v107);
          v112 = vmovl_s16(vdup_lane_s16(v104, 0));
          v113 = vmovl_s16(vdup_lane_s16(v104, 1));
          v92 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v112), 3uLL), vmulq_s32(v109, v112), 3uLL), v92);
          v100 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v113), 3uLL), vmulq_s32(v109, v113), 3uLL), v100);
          v94 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v110, v112), 3uLL), vmulq_s32(v111, v112), 3uLL), v94);
          v102 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v110, v113), 3uLL), vmulq_s32(v111, v113), 3uLL), v102);
          v114 = v78 - 120;
          *(int16x4_t *)v113.i8 = *a5;
          v115 = v78[-120];
          v116 = v78 - 116;
          v117 = *v116;
          *v114 = 0uLL;
          *v116 = 0uLL;
          v118 = vdupq_laneq_s32(vsubw_s16(v74, *(int16x4_t *)v113.i8), 2);
          v119 = vshlq_s32(vmovl_s16(*(int16x4_t *)v115.i8), v118);
          v120 = vshlq_s32(vmovl_high_s16(v115), v118);
          v121 = vshlq_s32(vmovl_s16(*(int16x4_t *)v117.i8), v118);
          v122 = vshlq_s32(vmovl_high_s16(v117), v118);
          v123 = vmovl_s16(vdup_lane_s16(*(int16x4_t *)v113.i8, 0));
          v124 = vmovl_s16(vdup_lane_s16(*(int16x4_t *)v113.i8, 1));
          v93 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v119, v123), 3uLL), vmulq_s32(v120, v123), 3uLL), v93);
          v101 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v119, v124), 3uLL), vmulq_s32(v120, v124), 3uLL), v101);
          v95 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v121, v123), 3uLL), vmulq_s32(v122, v123), 3uLL), v95);
          v103 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v121, v124), 3uLL), vmulq_s32(v122, v124), 3uLL), v103);
        }
        v125 = vzip1q_s16(v92, v100);
        v126 = vzip2q_s16(v92, v100);
        v127 = vzip1q_s16(v94, v102);
        v128 = vzip2q_s16(v94, v102);
        v129 = vzip1q_s16(v93, v101);
        v130 = vzip2q_s16(v93, v101);
        v131 = vzip1q_s16(v95, v103);
        v132 = vzip2q_s16(v95, v103);
        v133 = (uint16x8_t *)((char *)v77 + v70);
        v134 = (uint16x8_t *)((char *)v77 + v72);
        result = (uint16x8_t *)((char *)v77 + v71);
        v135 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v77 + 2 * a2), v127), v73);
        v136 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v77 + 4 * a2), v129), v73);
        v137 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v77 + 6 * a2), v131), v73);
        v138 = vminq_u16(vsqaddq_u16(v77[1], v126), v73);
        v139 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v77[1] + v70), v128), v73);
        v140 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v77 + v72), v130), v73);
        v141 = vsqaddq_u16(*(uint16x8_t *)((char *)v77 + v71), v132);
        *v77 = vminq_u16(vsqaddq_u16(*v77, v125), v73);
        *v133 = v135;
        v134[-1] = v136;
        result[-1] = v137;
        v77[1] = v138;
        v133[1] = v139;
        *v134 = v140;
        *result = vminq_u16(v141, v73);
        v76 += 8;
        v75 += 2;
        v77 += 2;
      }
      while (v76 < 0x18);
      v8 += 32;
      v7 += 32;
      v10 = (uint16x8_t *)((char *)v10 + 8 * a2);
      v56 = v69 >= 0x1C;
      v69 += 4;
    }
    while (!v56);
  }
  else
  {
    v13 = vld1q_dup_s16((const __int16 *)a3);
    v14 = vld1q_dup_s16(a4);
    v15 = vrshrq_n_s16(vrshrq_n_s16(vzip1q_s16(v13, v14), 1uLL), 5uLL);
    a3->i16[0] = 0;
    *a4 = 0;
    if (a5)
    {
      v16 = 0;
      v17 = a3 - 256;
      v18.i64[0] = 0x900000009;
      v18.i64[1] = 0x900000009;
      v19.i64[0] = 0xFE00FE00FE00FE00;
      v19.i64[1] = 0xFE00FE00FE00FE00;
      do
      {
        v20 = 0;
        v21 = 1;
        do
        {
          v22 = *(int16x8_t *)v17[2].i8;
          v23 = vdupq_laneq_s32(vsubw_s16(v18, *a5), 2);
          v24 = vshlq_s32(vmovl_s16(*v17), v23);
          v25 = vshlq_s32(vmovl_high_s16(*(int16x8_t *)v17->i8), v23);
          v26 = vshlq_s32(vmovl_s16(*(int16x4_t *)v22.i8), v23);
          v27 = vshlq_s32(vmovl_high_s16(v22), v23);
          v28 = vmovl_s16(vdup_lane_s16(*a5, 0));
          v29 = vmulq_s32(v26, v28);
          v30 = vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v24, v28), 3uLL), vmulq_s32(v25, v28), 3uLL);
          v31 = vmovl_s16(vdup_lane_s16(*a5, 1));
          v32 = vmulq_s32(v24, v31);
          v33 = vmulq_s32(v25, v31);
          v34 = vmulq_s32(v26, v31);
          v35 = vshrn_high_n_s32(vshrn_n_s32(v29, 3uLL), vmulq_s32(v27, v28), 3uLL);
          v36 = vmulq_s32(v27, v31);
          v37 = vshrn_high_n_s32(vshrn_n_s32(v32, 3uLL), v33, 3uLL);
          v38 = vshrn_high_n_s32(vshrn_n_s32(v34, 3uLL), v36, 3uLL);
          v39 = v21;
          *(_OWORD *)v17->i8 = 0uLL;
          *(_OWORD *)v17[2].i8 = 0uLL;
          v17 += 4;
          v40 = vzip1q_s16(v30, v37);
          v41 = &v10[v20];
          v42 = vminq_u16(vsqaddq_u16(v41[1], vaddq_s16(vzip2q_s16(v30, v37), v15)), v19);
          v43 = vminq_u16(vsqaddq_u16(v41[2], vaddq_s16(vzip1q_s16(v35, v38), v15)), v19);
          v44 = vsqaddq_u16(v41[3], vaddq_s16(vzip2q_s16(v35, v38), v15));
          *v41 = vminq_u16(vsqaddq_u16(*v41, vaddq_s16(v40, v15)), v19);
          v41[1] = v42;
          v41[2] = v43;
          v41[3] = vminq_u16(v44, v19);
          v20 = 4;
          v21 = 0;
        }
        while ((v39 & 1) != 0);
        ++v16;
        v10 = (uint16x8_t *)((char *)v10 + 2 * a2);
      }
      while (v16 != 32);
    }
    else
    {
      v142 = result + 4;
      v143 = 32;
      v144.i64[0] = 0xFE00FE00FE00FE00;
      v144.i64[1] = 0xFE00FE00FE00FE00;
      do
      {
        v145 = vminq_u16(vsqaddq_u16(v142[-3], v15), v144);
        v146 = vminq_u16(vsqaddq_u16(v142[-2], v15), v144);
        v147 = vminq_u16(vsqaddq_u16(v142[-1], v15), v144);
        v142[-4] = vminq_u16(vsqaddq_u16(v142[-4], v15), v144);
        v142[-3] = v145;
        v142[-2] = v146;
        v142[-1] = v147;
        v148 = vminq_u16(vsqaddq_u16(v142[1], v15), v144);
        v149 = vminq_u16(vsqaddq_u16(v142[2], v15), v144);
        v150 = vminq_u16(vsqaddq_u16(v142[3], v15), v144);
        *v142 = vminq_u16(vsqaddq_u16(*v142, v15), v144);
        v142[1] = v148;
        v142[2] = v149;
        v142[3] = v150;
        v142 = (uint16x8_t *)((char *)v142 + 2 * a2);
        --v143;
      }
      while (v143);
    }
  }
  return result;
}

uint16x8_t sub_1C982680C(uint16x8_t *a1, uint64_t a2, int16x8_t *a3, int16x8_t *a4, int16x4_t *a5)
{
  int16x8_t v5;
  int16x8_t v6;
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  int16x8_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int16x8_t v19;
  int16x8_t v20;
  int16x8_t v21;
  int16x8_t v22;
  uint16x8_t v23;
  uint16x8_t v24;
  uint16x8_t v25;
  uint16x8_t v26;
  uint16x8_t result;

  v6 = *a3;
  v5 = a3[1];
  v8 = *a4;
  v7 = a4[1];
  if (a5)
  {
    v9 = a3[-2];
    v10 = a3[-1];
    v11.i64[0] = 0x900000009;
    v11.i64[1] = 0x900000009;
    v12 = vdupq_laneq_s32(vsubw_s16(v11, *a5), 2);
    v13 = vshlq_s32(vmovl_s16(*(int16x4_t *)v9.i8), v12);
    v14 = vshlq_s32(vmovl_high_s16(v9), v12);
    v15 = vshlq_s32(vmovl_s16(*(int16x4_t *)v10.i8), v12);
    v16 = vshlq_s32(vmovl_high_s16(v10), v12);
    v17 = vmovl_s16(vdup_lane_s16(*a5, 0));
    v18 = vmovl_s16(vdup_lane_s16(*a5, 1));
    v6 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v13, v17), 3uLL), vmulq_s32(v14, v17), 3uLL), v6);
    v5 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v15, v17), 3uLL), vmulq_s32(v16, v17), 3uLL), v5);
    v8 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v13, v18), 3uLL), vmulq_s32(v14, v18), 3uLL), v8);
    v7 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v15, v18), 3uLL), vmulq_s32(v16, v18), 3uLL), v7);
    a3[-2] = 0u;
    a3[-1] = 0u;
  }
  *a3 = 0u;
  a3[1] = 0u;
  v19 = vzip1q_s16(v6, v8);
  v20 = vzip2q_s16(v6, v8);
  v21 = vzip1q_s16(v5, v7);
  v22 = vzip2q_s16(v5, v7);
  *a4 = 0u;
  a4[1] = 0u;
  v23 = *(uint16x8_t *)((char *)a1 + 6 * a2);
  v24 = vsqaddq_u16(*a1, v19);
  v19.i64[0] = 0xFE00FE00FE00FE00;
  v19.i64[1] = 0xFE00FE00FE00FE00;
  v25 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)a1 + 2 * a2), v20), (uint16x8_t)v19);
  v26 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)a1 + 4 * a2), v21), (uint16x8_t)v19);
  *a1 = vminq_u16(v24, (uint16x8_t)v19);
  *(uint16x8_t *)((char *)a1 + 2 * a2) = v25;
  result = vminq_u16(vsqaddq_u16(v23, v22), (uint16x8_t)v19);
  *(uint16x8_t *)((char *)a1 + 4 * a2) = v26;
  *(uint16x8_t *)((char *)a1 + 6 * a2) = result;
  return result;
}

uint16x8_t *sub_1C9826928(uint16x8_t *result, uint64_t a2, uint64_t a3, int16x8_t *a4, int16x4_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint16x8_t *v7;
  uint16x8_t v8;
  int32x4_t v9;
  unsigned int v10;
  int16x8_t v11;
  int16x8_t v12;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int16x8_t v23;
  uint16x8_t *v24;
  uint16x8_t v25;
  uint16x8_t v26;
  uint16x8_t v27;

  v5 = 2 * a2;
  v6 = a3 - 128;
  v7 = result + 1;
  v8.i64[0] = 0xFE00FE00FE00FE00;
  v8.i64[1] = 0xFE00FE00FE00FE00;
  v9.i64[0] = 0x900000009;
  v9.i64[1] = 0x900000009;
  v10 = -2;
  do
  {
    v12 = *(int16x8_t *)(v6 + 128);
    v11 = *(int16x8_t *)(v6 + 144);
    v14 = *a4;
    v13 = a4[1];
    if (a5)
    {
      v15 = *(int16x8_t *)(v6 + 16);
      v16 = vdupq_laneq_s32(vsubw_s16(v9, *a5), 2);
      v17 = vshlq_s32(vmovl_s16(*(int16x4_t *)v6), v16);
      v18 = vshlq_s32(vmovl_high_s16(*(int16x8_t *)v6), v16);
      v19 = vshlq_s32(vmovl_s16(*(int16x4_t *)v15.i8), v16);
      v20 = vshlq_s32(vmovl_high_s16(v15), v16);
      v21 = vmovl_s16(vdup_lane_s16(*a5, 0));
      v22 = vmovl_s16(vdup_lane_s16(*a5, 1));
      v12 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v17, v21), 3uLL), vmulq_s32(v18, v21), 3uLL), v12);
      v11 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v19, v21), 3uLL), vmulq_s32(v20, v21), 3uLL), v11);
      v14 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v17, v22), 3uLL), vmulq_s32(v18, v22), 3uLL), v14);
      v13 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v19, v22), 3uLL), vmulq_s32(v20, v22), 3uLL), v13);
      *(_OWORD *)v6 = 0uLL;
      *(_OWORD *)(v6 + 16) = 0uLL;
    }
    *(_OWORD *)(v6 + 128) = 0uLL;
    *(_OWORD *)(v6 + 144) = 0uLL;
    v23 = vzip1q_s16(v12, v14);
    *a4 = 0uLL;
    a4[1] = 0uLL;
    a4 += 2;
    v24 = (uint16x8_t *)((char *)v7 + v5);
    v25 = vminq_u16(vsqaddq_u16(*v7, vzip2q_s16(v12, v14)), v8);
    v26 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v7[-1] + v5), vzip1q_s16(v11, v13)), v8);
    v27 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v7 + 2 * a2), vzip2q_s16(v11, v13)), v8);
    v7[-1] = vminq_u16(vsqaddq_u16(v7[-1], v23), v8);
    *v7 = v25;
    v10 += 2;
    v24[-1] = v26;
    *v24 = v27;
    v6 += 32;
    v7 = (uint16x8_t *)((char *)v7 + 4 * a2);
  }
  while (v10 < 6);
  return result;
}

uint16x8_t *sub_1C9826A50(uint16x8_t *result, uint64_t a2, uint64_t a3, uint64_t a4, int16x4_t *a5)
{
  uint64_t v5;
  uint16x8_t *v6;
  uint16x8_t v7;
  int32x4_t v8;
  _OWORD *v9;
  int16x8_t *v10;
  int16x8_t v11;
  int16x8_t v12;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t *v15;
  int16x8_t v16;
  int16x8_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int16x8_t v25;
  uint16x8_t v26;
  uint16x8_t v27;
  uint16x8_t v28;

  v5 = 0;
  v6 = result + 2;
  v7.i64[0] = 0xFE00FE00FE00FE00;
  v7.i64[1] = 0xFE00FE00FE00FE00;
  v8.i64[0] = 0x900000009;
  v8.i64[1] = 0x900000009;
  do
  {
    v9 = (_OWORD *)(a4 + v5);
    v10 = (int16x8_t *)(a3 + v5);
    v12 = *(int16x8_t *)(a3 + v5);
    v11 = *(int16x8_t *)(a3 + v5 + 16);
    v14 = *(int16x8_t *)(a4 + v5);
    v13 = *(int16x8_t *)(a4 + v5 + 16);
    if (a5)
    {
      v15 = v10 - 32;
      v16 = v10[-32];
      v17 = v10[-31];
      v18 = vdupq_laneq_s32(vsubw_s16(v8, *a5), 2);
      v19 = vshlq_s32(vmovl_s16(*(int16x4_t *)v16.i8), v18);
      v20 = vshlq_s32(vmovl_high_s16(v16), v18);
      v21 = vshlq_s32(vmovl_s16(*(int16x4_t *)v17.i8), v18);
      v22 = vshlq_s32(vmovl_high_s16(v17), v18);
      v23 = vmovl_s16(vdup_lane_s16(*a5, 0));
      v24 = vmovl_s16(vdup_lane_s16(*a5, 1));
      v12 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v19, v23), 3uLL), vmulq_s32(v20, v23), 3uLL), v12);
      v11 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v21, v23), 3uLL), vmulq_s32(v22, v23), 3uLL), v11);
      v14 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v19, v24), 3uLL), vmulq_s32(v20, v24), 3uLL), v14);
      v13 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v21, v24), 3uLL), vmulq_s32(v22, v24), 3uLL), v13);
      *v15 = 0uLL;
      v15[1] = 0uLL;
    }
    *v10 = 0uLL;
    v10[1] = 0uLL;
    v25 = vzip1q_s16(v12, v14);
    *v9 = 0uLL;
    v9[1] = 0uLL;
    v26 = vminq_u16(vsqaddq_u16(v6[-1], vzip2q_s16(v12, v14)), v7);
    v27 = vminq_u16(vsqaddq_u16(*v6, vzip1q_s16(v11, v13)), v7);
    v28 = vminq_u16(vsqaddq_u16(v6[1], vzip2q_s16(v11, v13)), v7);
    v6[-2] = vminq_u16(vsqaddq_u16(v6[-2], v25), v7);
    v6[-1] = v26;
    *v6 = v27;
    v6[1] = v28;
    v5 += 32;
    v6 = (uint16x8_t *)((char *)v6 + 2 * a2);
  }
  while ((_DWORD)v5 != 512);
  return result;
}

int16x4_t sub_1C9826B78(int16x4_t *a1)
{
  int16x4_t v1;
  int16x4_t v2;
  int16x4_t v3;
  int32x2_t v4;
  int32x2_t v5;
  int32x2_t v6;
  int32x2_t v7;
  int16x4_t v8;
  int16x4_t v9;
  int16x4_t v10;
  int16x4_t v11;
  int16x4_t v12;
  int16x4_t v13;
  int16x4_t v14;
  int16x4_t v15;
  int16x4_t v17[6];

  v17[5] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v1 = a1[1];
  v2 = a1[2];
  v3 = a1[3];
  v4 = (int32x2_t)vtrn1_s16(*a1, v1);
  v5 = (int32x2_t)vtrn2_s16(*a1, v1);
  v6 = (int32x2_t)vtrn1_s16(v2, v3);
  v7 = (int32x2_t)vtrn2_s16(v2, v3);
  v8 = (int16x4_t)vzip1_s32(v5, v7);
  v9 = (int16x4_t)vzip2_s32(v4, v6);
  v10 = (int16x4_t)vzip2_s32(v5, v7);
  v11 = (int16x4_t)vzip1_s32(v4, v6);
  v12 = vadd_s16(v10, v11);
  v13 = vsub_s16(v11, v10);
  v14 = vadd_s16(v9, v8);
  v15 = vsub_s16(v8, v9);
  v17[0] = vqmovn_s32(vrshrq_n_s32(vshlq_n_s32(vaddl_s16(v14, v12), 6uLL), 3uLL));
  v17[1] = vqmovn_s32(vrshrq_n_s32(vmlal_s16(vmull_s16(v15, (int16x4_t)0x24002400240024), v13, (int16x4_t)0x53005300530053), 3uLL));
  v17[2] = vqmovn_s32(vrshrq_n_s32(vshlq_n_s32(vsubl_s16(v12, v14), 6uLL), 3uLL));
  v17[3] = vqmovn_s32(vrshrq_n_s32(vmlsl_s16(vmull_s16(v13, (int16x4_t)0x24002400240024), v15, (int16x4_t)0x53005300530053), 3uLL));
  return sub_1C981AF54(a1, v17);
}

void sub_1C9826C4C(int16x4_t *a1)
{
  int16x4_t v2[18];

  v2[17] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  sub_1C981ADF0(v2, a1, 4);
  sub_1C981AE94(a1, v2);
}

void sub_1C9826CB8(int16x4_t *a1)
{
  int16x4_t v2[66];

  v2[65] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  sub_1C981AB1C(v2, a1, 5);
  sub_1C981AC68(a1, v2);
}

double sub_1C9826D24(uint16x8_t *a1, uint64_t a2, int32x4_t *a3, int32x4_t *a4, int16x4_t *a5, __int16 *a6)
{
  double result;

  if (*a6 >= 1)
    sub_1C981FA58(a3, (unsigned __int16)*a6);
  if (a6[1] >= 1)
    sub_1C981FA58(a4, (unsigned __int16)a6[1]);
  *(_QWORD *)&result = sub_1C9827E5C(a1, a2, (int16x8_t *)a3, (int16x8_t *)a4, a5).u64[0];
  return result;
}

uint16x8_t *sub_1C9826DA8(uint16x8_t *result, uint64_t a2, int16x4_t *a3, const __int16 *a4, int16x4_t *a5, int *a6)
{
  __int16 *v7;
  uint16x8_t *v10;
  int v11;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  int16x4_t *v16;
  uint64_t v17;
  unsigned int v18;
  int32x4_t v19;
  uint16x8_t v20;
  int16x8_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int16x8_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int16x8_t v34;
  int32x4_t v35;
  int16x8_t v36;
  int16x8_t v37;
  int16x8_t v38;
  uint16x8_t *v39;
  uint16x8_t v40;
  uint16x8_t v41;
  uint16x8_t v42;
  char v43;
  int16x8_t *v44;
  char v45;
  int16x8_t v46;
  int16x8_t v47;
  int16x8_t v48;
  int32x4_t v49;
  int32x4_t v50;
  int32x4_t v51;
  int32x4_t v52;
  int v53;
  char v54;
  int16x8_t *v55;
  char v56;
  int16x8_t v57;
  int16x8_t v58;
  int16x8_t v59;
  int32x4_t v60;
  int32x4_t v61;
  int32x4_t v62;
  int32x4_t v63;
  uint64_t v64;
  uint64_t v65;
  uint16x8_t *v66;
  int16x4_t *v67;
  uint64_t v68;
  char v69;
  uint16x8_t v70;
  int32x4_t v71;
  char v72;
  int16x8_t v73;
  int16x8_t v74;
  int16x8_t v75;
  int16x8_t v76;
  int16x8_t v77;
  int16x8_t v78;
  int32x4_t v79;
  int32x4_t v80;
  int32x4_t v81;
  int32x4_t v82;
  int16x8_t v83;
  int16x8_t v84;
  int16x8_t v85;
  int16x8_t v86;
  int16x8_t v87;
  int16x8_t v88;
  int32x4_t v89;
  int32x4_t v90;
  int32x4_t v91;
  int32x4_t v92;
  int16x8_t v93;
  int16x8_t v94;
  int16x8_t v95;
  int16x8_t v96;
  int16x8_t v97;
  int32x4_t v98;
  int32x4_t v99;
  int32x4_t v100;
  int32x4_t v101;
  int32x4_t v102;
  int32x4_t v103;
  int32x4_t v104;
  int16x8_t v105;
  int16x8_t v106;
  int32x4_t v107;
  int32x4_t v108;
  int32x4_t v109;
  int32x4_t v110;
  int32x4_t v111;
  int32x4_t v112;
  int32x4_t v113;
  int16x8_t v114;
  int16x8_t v115;
  int16x8_t v116;
  int16x8_t v117;
  uint16x8_t *v118;
  uint16x8_t *v119;
  uint16x8_t v120;
  uint16x8_t v121;
  uint16x8_t v122;
  uint16x8_t v123;
  uint16x8_t v124;
  uint16x8_t v125;
  uint16x8_t v126;
  uint16x8_t v127;
  uint64_t v128;
  unsigned int v129;
  uint16x8_t v130;
  uint16x8_t *v131;
  uint16x8_t v132;
  uint16x8_t v133;
  uint16x8_t v134;

  v7 = (__int16 *)a4;
  v10 = result;
  v11 = *a6;
  if ((*a6 & 0xFFFEFFFE) != 0)
  {
    if ((__int16)v11 < 1)
    {
      if ((v11 & 0x8000) != 0)
      {
        v43 = 1;
        v44 = (int16x8_t *)a3;
        do
        {
          v45 = v43;
          v46 = v44[1];
          v47 = v44[2];
          v48 = v44[3];
          v49 = (int32x4_t)vtrn1q_s16(*v44, v46);
          v50 = (int32x4_t)vtrn2q_s16(*v44, v46);
          v51 = (int32x4_t)vtrn1q_s16(v47, v48);
          v52 = (int32x4_t)vtrn2q_s16(v47, v48);
          *(int32x4_t *)v44 = vtrn1q_s32(v49, v51);
          v44[1] = (int16x8_t)vtrn1q_s32(v50, v52);
          v44[2] = (int16x8_t)vtrn2q_s32(v49, v51);
          v44[3] = (int16x8_t)vtrn2q_s32(v50, v52);
          v44 += 4;
          v43 = 0;
        }
        while ((v45 & 1) != 0);
      }
    }
    else
    {
      sub_1C981F950(a3, (unsigned __int16)*a6);
    }
    v53 = *((unsigned __int16 *)a6 + 1);
    if (*((__int16 *)a6 + 1) < 1)
    {
      if ((v53 & 0x8000) != 0)
      {
        v54 = 1;
        v55 = (int16x8_t *)v7;
        do
        {
          v56 = v54;
          v57 = v55[1];
          v58 = v55[2];
          v59 = v55[3];
          v60 = (int32x4_t)vtrn1q_s16(*v55, v57);
          v61 = (int32x4_t)vtrn2q_s16(*v55, v57);
          v62 = (int32x4_t)vtrn1q_s16(v58, v59);
          v63 = (int32x4_t)vtrn2q_s16(v58, v59);
          *(int32x4_t *)v55 = vtrn1q_s32(v60, v62);
          v55[1] = (int16x8_t)vtrn1q_s32(v61, v63);
          v55[2] = (int16x8_t)vtrn2q_s32(v60, v62);
          v55[3] = (int16x8_t)vtrn2q_s32(v61, v63);
          v55 += 4;
          v54 = 0;
        }
        while ((v56 & 1) != 0);
      }
    }
    else
    {
      sub_1C981F950((int16x4_t *)v7, v53);
    }
    v64 = 2 * a2;
    v65 = 4 * a2;
    v66 = v10 + 1;
    v67 = a3 - 16;
    v68 = 6 * a2;
    v69 = 1;
    v70.i64[0] = 0xFC00FC00FC00FC00;
    v70.i64[1] = 0xFC00FC00FC00FC00;
    v71.i64[0] = 0xA0000000ALL;
    v71.i64[1] = 0xA0000000ALL;
    do
    {
      v72 = v69;
      v73 = *(int16x8_t *)v67[16].i8;
      v74 = *(int16x8_t *)v67[18].i8;
      v75 = *(int16x8_t *)v67[20].i8;
      v76 = *(int16x8_t *)v67[22].i8;
      v77 = *(int16x8_t *)v7;
      v78 = *((int16x8_t *)v7 + 1);
      v79 = (int32x4_t)vtrn1q_s16(v73, v74);
      v80 = (int32x4_t)vtrn2q_s16(v73, v74);
      v81 = (int32x4_t)vtrn1q_s16(v75, v76);
      v82 = (int32x4_t)vtrn2q_s16(v75, v76);
      v83 = *((int16x8_t *)v7 + 2);
      v84 = *((int16x8_t *)v7 + 3);
      *(_OWORD *)v67[16].i8 = 0uLL;
      *(_OWORD *)v67[18].i8 = 0uLL;
      *(_OWORD *)v67[20].i8 = 0uLL;
      *(_OWORD *)v67[22].i8 = 0uLL;
      v85 = (int16x8_t)vtrn1q_s32(v79, v81);
      v86 = (int16x8_t)vtrn2q_s32(v79, v81);
      v87 = (int16x8_t)vtrn1q_s32(v80, v82);
      v88 = (int16x8_t)vtrn2q_s32(v80, v82);
      v89 = (int32x4_t)vtrn1q_s16(v77, v78);
      v90 = (int32x4_t)vtrn2q_s16(v77, v78);
      v91 = (int32x4_t)vtrn1q_s16(v83, v84);
      v92 = (int32x4_t)vtrn2q_s16(v83, v84);
      v93 = (int16x8_t)vtrn1q_s32(v89, v91);
      v94 = (int16x8_t)vtrn2q_s32(v89, v91);
      v95 = (int16x8_t)vtrn1q_s32(v90, v92);
      v96 = (int16x8_t)vtrn2q_s32(v90, v92);
      *((_OWORD *)v7 + 2) = 0uLL;
      *((_OWORD *)v7 + 3) = 0uLL;
      *(_OWORD *)v7 = 0uLL;
      *((_OWORD *)v7 + 1) = 0uLL;
      if (a5)
      {
        v97 = *(int16x8_t *)v67[2].i8;
        v98 = vdupq_laneq_s32(vsubw_s16(v71, *a5), 2);
        v99 = vshlq_s32(vmovl_s16(*v67), v98);
        v100 = vshlq_s32(vmovl_high_s16(*(int16x8_t *)v67->i8), v98);
        v101 = vshlq_s32(vmovl_s16(*(int16x4_t *)v97.i8), v98);
        v102 = vshlq_s32(vmovl_high_s16(v97), v98);
        v103 = vmovl_s16(vdup_lane_s16(*a5, 0));
        v104 = vmovl_s16(vdup_lane_s16(*a5, 1));
        *(_OWORD *)v67->i8 = 0uLL;
        *(_OWORD *)v67[2].i8 = 0uLL;
        v85 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v99, v103), 3uLL), vmulq_s32(v100, v103), 3uLL), v85);
        v93 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v99, v104), 3uLL), vmulq_s32(v100, v104), 3uLL), v93);
        v87 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v101, v103), 3uLL), vmulq_s32(v102, v103), 3uLL), v87);
        v95 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v101, v104), 3uLL), vmulq_s32(v102, v104), 3uLL), v95);
        v105 = *(int16x8_t *)v67[4].i8;
        v106 = *(int16x8_t *)v67[6].i8;
        v107 = vdupq_laneq_s32(vsubw_s16(v71, *a5), 2);
        v108 = vshlq_s32(vmovl_s16(*(int16x4_t *)v105.i8), v107);
        v109 = vshlq_s32(vmovl_high_s16(v105), v107);
        v110 = vshlq_s32(vmovl_s16(*(int16x4_t *)v106.i8), v107);
        v111 = vshlq_s32(vmovl_high_s16(v106), v107);
        v112 = vmovl_s16(vdup_lane_s16(*a5, 0));
        v113 = vmovl_s16(vdup_lane_s16(*a5, 1));
        *(_OWORD *)v67[4].i8 = 0uLL;
        *(_OWORD *)v67[6].i8 = 0uLL;
        v86 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v112), 3uLL), vmulq_s32(v109, v112), 3uLL), v86);
        v94 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v113), 3uLL), vmulq_s32(v109, v113), 3uLL), v94);
        v88 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v110, v112), 3uLL), vmulq_s32(v111, v112), 3uLL), v88);
        v96 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v110, v113), 3uLL), vmulq_s32(v111, v113), 3uLL), v96);
      }
      v69 = 0;
      v114 = vzip1q_s16(v85, v93);
      v115 = vzip2q_s16(v85, v93);
      v116 = vzip1q_s16(v87, v95);
      v117 = vzip2q_s16(v87, v95);
      v118 = (uint16x8_t *)((char *)v66 + v64);
      v119 = (uint16x8_t *)((char *)v66 + v65);
      result = (uint16x8_t *)((char *)v66 + v68);
      v120 = vsqaddq_u16(v66[-1], v114);
      v121 = *(uint16x8_t *)((char *)v66 + 4 * a2);
      v122 = vsqaddq_u16(*(uint16x8_t *)((char *)&v66[-1] + v64), v116);
      v123 = *(uint16x8_t *)((char *)v66 + 6 * a2);
      v124 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v66[-1] + v65), vzip1q_s16(v86, v94)), v70);
      v125 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v66[-1] + v68), vzip1q_s16(v88, v96)), v70);
      v126 = vminq_u16(vsqaddq_u16(*v66, v115), v70);
      v127 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v66 + 2 * a2), v117), v70);
      v66[-1] = vminq_u16(v120, v70);
      v118[-1] = vminq_u16(v122, v70);
      v119[-1] = v124;
      result[-1] = v125;
      *v66 = v126;
      *v118 = v127;
      *v119 = vminq_u16(vsqaddq_u16(v121, vzip2q_s16(v86, v94)), v70);
      *result = vminq_u16(vsqaddq_u16(v123, vzip2q_s16(v88, v96)), v70);
      v66 = (uint16x8_t *)((char *)v66 + 8 * a2);
      v67 += 8;
      v7 += 32;
    }
    while ((v72 & 1) != 0);
  }
  else
  {
    v13 = vld1q_dup_s16((const __int16 *)a3);
    v14 = vld1q_dup_s16(a4);
    v15 = vrshrq_n_s16(vrshrq_n_s16(vzip1q_s16(v13, v14), 1uLL), 4uLL);
    a3->i16[0] = 0;
    *a4 = 0;
    if (a5)
    {
      v16 = a3 - 16;
      v17 = 2 * a2;
      v18 = -2;
      v19.i64[0] = 0xA0000000ALL;
      v19.i64[1] = 0xA0000000ALL;
      v20.i64[0] = 0xFC00FC00FC00FC00;
      v20.i64[1] = 0xFC00FC00FC00FC00;
      do
      {
        v21 = *(int16x8_t *)v16[2].i8;
        v22 = vdupq_laneq_s32(vsubw_s16(v19, *a5), 2);
        v23 = vshlq_s32(vmovl_s16(*v16), v22);
        v24 = vshlq_s32(vmovl_high_s16(*(int16x8_t *)v16->i8), v22);
        v25 = vshlq_s32(vmovl_s16(*(int16x4_t *)v21.i8), v22);
        v26 = vshlq_s32(vmovl_high_s16(v21), v22);
        v27 = vmovl_s16(vdup_lane_s16(*a5, 0));
        v28 = vmulq_s32(v25, v27);
        v29 = vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v23, v27), 3uLL), vmulq_s32(v24, v27), 3uLL);
        v30 = vmovl_s16(vdup_lane_s16(*a5, 1));
        v31 = vmulq_s32(v23, v30);
        v32 = vmulq_s32(v24, v30);
        v33 = vmulq_s32(v25, v30);
        v34 = vshrn_high_n_s32(vshrn_n_s32(v28, 3uLL), vmulq_s32(v26, v27), 3uLL);
        v35 = vmulq_s32(v26, v30);
        v36 = vshrn_high_n_s32(vshrn_n_s32(v31, 3uLL), v32, 3uLL);
        v37 = vshrn_high_n_s32(vshrn_n_s32(v33, 3uLL), v35, 3uLL);
        *(_OWORD *)v16->i8 = 0uLL;
        *(_OWORD *)v16[2].i8 = 0uLL;
        v16 += 4;
        v38 = vaddq_s16(vzip1q_s16(v29, v36), v15);
        v39 = (uint16x8_t *)((char *)v10 + v17);
        v40 = vminq_u16(vsqaddq_u16(v10[1], vaddq_s16(vzip2q_s16(v29, v36), v15)), v20);
        v41 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v10 + 2 * a2), vaddq_s16(vzip1q_s16(v34, v37), v15)), v20);
        v42 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v10[1] + v17), vaddq_s16(vzip2q_s16(v34, v37), v15)), v20);
        *v10 = vminq_u16(vsqaddq_u16(*v10, v38), v20);
        v10[1] = v40;
        *v39 = v41;
        v39[1] = v42;
        v18 += 2;
        v10 = (uint16x8_t *)((char *)v10 + 4 * a2);
      }
      while (v18 < 6);
    }
    else
    {
      v128 = 2 * a2;
      v129 = -2;
      v130.i64[0] = 0xFC00FC00FC00FC00;
      v130.i64[1] = 0xFC00FC00FC00FC00;
      do
      {
        v131 = (uint16x8_t *)((char *)v10 + v128);
        v132 = vminq_u16(vsqaddq_u16(v10[1], v15), v130);
        v133 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v10 + 2 * a2), v15), v130);
        v134 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v10[1] + v128), v15), v130);
        *v10 = vminq_u16(vsqaddq_u16(*v10, v15), v130);
        v10[1] = v132;
        *v131 = v133;
        v131[1] = v134;
        v129 += 2;
        v10 = (uint16x8_t *)((char *)v10 + 4 * a2);
      }
      while (v129 < 6);
    }
  }
  return result;
}

int16x4_t *sub_1C98272B0(int16x4_t *result, uint64_t a2, int16x4_t *a3, const __int16 *a4, int16x4_t *a5, int *a6)
{
  int16x4_t *v7;
  int16x4_t *v8;
  int16x4_t *v10;
  int v11;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  uint16x8_t *v16;
  uint64_t v17;
  uint64_t v18;
  int32x4_t v19;
  uint16x8_t v20;
  int16x4_t *v21;
  int16x8_t v22;
  int16x8_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int16x8_t v30;
  int16x8_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int32x4_t v34;
  int32x4_t v35;
  int32x4_t v36;
  int16x8_t v37;
  int16x8_t v38;
  int16x8_t v39;
  uint16x8_t v40;
  uint16x8_t v41;
  uint16x8_t v42;
  unsigned int v43;
  int16x4_t *v44;
  uint64_t v45;
  char v46;
  char v47;
  int16x8_t *v48;
  int16x8_t v49;
  int16x8_t v50;
  int16x8_t v51;
  int32x4_t v52;
  int32x4_t v53;
  int32x4_t v54;
  int32x4_t v55;
  BOOL v56;
  int v57;
  unsigned int v58;
  int16x4_t *v59;
  uint64_t v60;
  char v61;
  char v62;
  int16x8_t *v63;
  int16x8_t v64;
  int16x8_t v65;
  int16x8_t v66;
  int32x4_t v67;
  int32x4_t v68;
  int32x4_t v69;
  int32x4_t v70;
  unsigned int v71;
  uint16x8_t v72;
  int32x4_t v73;
  uint64_t v74;
  char v75;
  char v76;
  int16x8_t *v77;
  int16x8_t v78;
  int16x8_t v79;
  int16x8_t v80;
  int16x8_t *v81;
  int16x8_t v82;
  int16x8_t v83;
  int16x8_t v84;
  int32x4_t v85;
  int32x4_t v86;
  int32x4_t v87;
  int32x4_t v88;
  int16x8_t v89;
  int16x8_t v90;
  int16x8_t v91;
  int16x8_t v92;
  int16x8_t v93;
  int32x4_t v94;
  int32x4_t v95;
  int32x4_t v96;
  int32x4_t v97;
  int16x8_t v98;
  int16x8_t v99;
  int16x8_t v100;
  int16x8_t v101;
  int16x4_t v102;
  int16x8_t v103;
  int16x8_t v104;
  int32x4_t v105;
  int32x4_t v106;
  int32x4_t v107;
  int32x4_t v108;
  int32x4_t v109;
  int32x4_t v110;
  int32x4_t v111;
  int16x8_t *v112;
  int16x8_t v113;
  int16x8_t *v114;
  int16x8_t v115;
  int32x4_t v116;
  int32x4_t v117;
  int32x4_t v118;
  int32x4_t v119;
  int32x4_t v120;
  int32x4_t v121;
  int32x4_t v122;
  int16x8_t v123;
  int16x8_t v124;
  uint16x8_t *v125;
  uint16x8_t *v126;
  uint16x8_t *v127;
  uint16x8_t *v128;
  uint16x8_t v129;
  uint16x8_t v130;
  uint16x8_t v131;
  uint16x8_t v132;
  uint16x8_t v133;
  uint16x8_t v134;
  uint16x8_t v135;
  uint16x8_t v136;
  int v137;
  uint16x8_t v138;
  uint16x8_t v139;
  uint16x8_t v140;
  uint16x8_t v141;

  v7 = (int16x4_t *)a4;
  v8 = a3;
  v10 = result;
  v11 = *a6;
  if ((*a6 & 0xFFFEFFFE) != 0)
  {
    if ((__int16)v11 < 1)
    {
      if ((v11 & 0x8000) != 0)
      {
        v43 = 0;
        v44 = a3;
        do
        {
          v45 = 0;
          v46 = 1;
          do
          {
            v47 = v46;
            v48 = (int16x8_t *)&v44[v45];
            v49 = v48[2];
            v50 = v48[4];
            v51 = v48[6];
            v52 = (int32x4_t)vtrn1q_s16(*v48, v49);
            v53 = (int32x4_t)vtrn2q_s16(*v48, v49);
            v54 = (int32x4_t)vtrn1q_s16(v50, v51);
            v55 = (int32x4_t)vtrn2q_s16(v50, v51);
            *(int32x4_t *)v48 = vtrn1q_s32(v52, v54);
            v48[2] = (int16x8_t)vtrn1q_s32(v53, v55);
            v48[4] = (int16x8_t)vtrn2q_s32(v52, v54);
            v48[6] = (int16x8_t)vtrn2q_s32(v53, v55);
            v45 = 2;
            v46 = 0;
          }
          while ((v47 & 1) != 0);
          v44 += 16;
          v56 = v43 >= 0xC;
          v43 += 4;
        }
        while (!v56);
      }
    }
    else
    {
      result = sub_1C981F774(a3, (unsigned __int16)*a6);
    }
    v57 = *((unsigned __int16 *)a6 + 1);
    if (*((__int16 *)a6 + 1) < 1)
    {
      if ((v57 & 0x8000) != 0)
      {
        v58 = 0;
        v59 = v7;
        do
        {
          v60 = 0;
          v61 = 1;
          do
          {
            v62 = v61;
            v63 = (int16x8_t *)&v59[v60];
            v64 = v63[2];
            v65 = v63[4];
            v66 = v63[6];
            v67 = (int32x4_t)vtrn1q_s16(*v63, v64);
            v68 = (int32x4_t)vtrn2q_s16(*v63, v64);
            v69 = (int32x4_t)vtrn1q_s16(v65, v66);
            v70 = (int32x4_t)vtrn2q_s16(v65, v66);
            *(int32x4_t *)v63 = vtrn1q_s32(v67, v69);
            v63[2] = (int16x8_t)vtrn1q_s32(v68, v70);
            v63[4] = (int16x8_t)vtrn2q_s32(v67, v69);
            v63[6] = (int16x8_t)vtrn2q_s32(v68, v70);
            v60 = 2;
            v61 = 0;
          }
          while ((v62 & 1) != 0);
          v59 += 16;
          v56 = v58 >= 0xC;
          v58 += 4;
        }
        while (!v56);
      }
    }
    else
    {
      result = sub_1C981F774(v7, v57);
    }
    v71 = 0;
    v72.i64[0] = 0xFC00FC00FC00FC00;
    v72.i64[1] = 0xFC00FC00FC00FC00;
    v73.i64[0] = 0xA0000000ALL;
    v73.i64[1] = 0xA0000000ALL;
    do
    {
      v74 = 0;
      v75 = 1;
      do
      {
        v76 = v75;
        v77 = (int16x8_t *)&v8[(unint64_t)v74 / 2];
        v78 = v77[2];
        v79 = v77[4];
        v80 = v77[6];
        v81 = (int16x8_t *)&v7[(unint64_t)v74 / 2];
        v82 = *v81;
        v83 = v81[2];
        v84 = v81[4];
        v85 = (int32x4_t)vtrn1q_s16(*v77, v78);
        v86 = (int32x4_t)vtrn2q_s16(*v77, v78);
        v87 = (int32x4_t)vtrn1q_s16(v79, v80);
        v88 = (int32x4_t)vtrn2q_s16(v79, v80);
        v89 = v81[6];
        *v77 = 0uLL;
        v77[2] = 0uLL;
        v77[4] = 0uLL;
        v77[6] = 0uLL;
        *v81 = 0uLL;
        v81[2] = 0uLL;
        v81[4] = 0uLL;
        v81[6] = 0uLL;
        v90 = (int16x8_t)vtrn1q_s32(v85, v87);
        v91 = (int16x8_t)vtrn2q_s32(v85, v87);
        v92 = (int16x8_t)vtrn1q_s32(v86, v88);
        v93 = (int16x8_t)vtrn2q_s32(v86, v88);
        v94 = (int32x4_t)vtrn1q_s16(v82, v83);
        v95 = (int32x4_t)vtrn2q_s16(v82, v83);
        v96 = (int32x4_t)vtrn1q_s16(v84, v89);
        v97 = (int32x4_t)vtrn2q_s16(v84, v89);
        v98 = (int16x8_t)vtrn1q_s32(v94, v96);
        v99 = (int16x8_t)vtrn2q_s32(v94, v96);
        v100 = (int16x8_t)vtrn1q_s32(v95, v97);
        v101 = (int16x8_t)vtrn2q_s32(v95, v97);
        if (a5)
        {
          v102 = *a5;
          v103 = v77[-32];
          v104 = v77[-30];
          v77[-32] = 0uLL;
          v77[-30] = 0uLL;
          v105 = vdupq_laneq_s32(vsubw_s16(v73, v102), 2);
          v106 = vshlq_s32(vmovl_s16(*(int16x4_t *)v103.i8), v105);
          v107 = vshlq_s32(vmovl_high_s16(v103), v105);
          v108 = vshlq_s32(vmovl_s16(*(int16x4_t *)v104.i8), v105);
          v109 = vshlq_s32(vmovl_high_s16(v104), v105);
          v110 = vmovl_s16(vdup_lane_s16(v102, 0));
          v111 = vmovl_s16(vdup_lane_s16(v102, 1));
          v90 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v106, v110), 3uLL), vmulq_s32(v107, v110), 3uLL), v90);
          v98 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v106, v111), 3uLL), vmulq_s32(v107, v111), 3uLL), v98);
          v92 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v110), 3uLL), vmulq_s32(v109, v110), 3uLL), v92);
          v100 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v111), 3uLL), vmulq_s32(v109, v111), 3uLL), v100);
          v112 = v77 - 28;
          *(int16x4_t *)v111.i8 = *a5;
          v113 = v77[-28];
          v114 = v77 - 26;
          v115 = *v114;
          *v112 = 0uLL;
          *v114 = 0uLL;
          v116 = vdupq_laneq_s32(vsubw_s16(v73, *(int16x4_t *)v111.i8), 2);
          v117 = vshlq_s32(vmovl_s16(*(int16x4_t *)v113.i8), v116);
          v118 = vshlq_s32(vmovl_high_s16(v113), v116);
          v119 = vshlq_s32(vmovl_s16(*(int16x4_t *)v115.i8), v116);
          v120 = vshlq_s32(vmovl_high_s16(v115), v116);
          v121 = vmovl_s16(vdup_lane_s16(*(int16x4_t *)v111.i8, 0));
          v122 = vmovl_s16(vdup_lane_s16(*(int16x4_t *)v111.i8, 1));
          v91 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v117, v121), 3uLL), vmulq_s32(v118, v121), 3uLL), v91);
          v99 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v117, v122), 3uLL), vmulq_s32(v118, v122), 3uLL), v99);
          v93 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v119, v121), 3uLL), vmulq_s32(v120, v121), 3uLL), v93);
          v101 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v119, v122), 3uLL), vmulq_s32(v120, v122), 3uLL), v101);
        }
        v75 = 0;
        v123 = vzip1q_s16(v90, v98);
        v124 = vzip2q_s16(v90, v98);
        v125 = (uint16x8_t *)&v10[v74];
        v126 = (uint16x8_t *)((char *)v125 + 2 * a2);
        v127 = (uint16x8_t *)((char *)v125 + 4 * a2);
        v128 = (uint16x8_t *)((char *)v125 + 6 * a2);
        v129 = v126[1];
        v130 = vsqaddq_u16(*v125, v123);
        v131 = v127[1];
        v132 = v128[1];
        v133 = vminq_u16(vsqaddq_u16(*v126, vzip1q_s16(v92, v100)), v72);
        v134 = vminq_u16(vsqaddq_u16(*v127, vzip1q_s16(v91, v99)), v72);
        v135 = vminq_u16(vsqaddq_u16(*v128, vzip1q_s16(v93, v101)), v72);
        v136 = vminq_u16(vsqaddq_u16(v125[1], v124), v72);
        *v125 = vminq_u16(v130, v72);
        *v126 = v133;
        *v127 = v134;
        *v128 = v135;
        v125[1] = v136;
        v126[1] = vminq_u16(vsqaddq_u16(v129, vzip2q_s16(v92, v100)), v72);
        v127[1] = vminq_u16(vsqaddq_u16(v131, vzip2q_s16(v91, v99)), v72);
        v128[1] = vminq_u16(vsqaddq_u16(v132, vzip2q_s16(v93, v101)), v72);
        v74 = 4;
      }
      while ((v76 & 1) != 0);
      v10 += a2;
      v8 += 16;
      v7 += 16;
      v56 = v71 >= 0xC;
      v71 += 4;
    }
    while (!v56);
  }
  else
  {
    v13 = vld1q_dup_s16((const __int16 *)a3);
    v14 = vld1q_dup_s16(a4);
    v15 = vrshrq_n_s16(vrshrq_n_s16(vzip1q_s16(v13, v14), 1uLL), 4uLL);
    a3->i16[0] = 0;
    *a4 = 0;
    v16 = (uint16x8_t *)&result[4];
    v17 = 2 * a2;
    if (a5)
    {
      v18 = 0x1FFFFFFFFFFFFFC0;
      v19.i64[0] = 0xA0000000ALL;
      v19.i64[1] = 0xA0000000ALL;
      v20.i64[0] = 0xFC00FC00FC00FC00;
      v20.i64[1] = 0xFC00FC00FC00FC00;
      do
      {
        v21 = &a3[v18];
        v22 = *(int16x8_t *)a3[v18].i8;
        v23 = *(int16x8_t *)a3[v18 + 2].i8;
        v24 = vdupq_laneq_s32(vsubw_s16(v19, *a5), 2);
        v25 = vshlq_s32(vmovl_s16(*(int16x4_t *)v22.i8), v24);
        v26 = vshlq_s32(vmovl_high_s16(v22), v24);
        v27 = vshlq_s32(vmovl_s16(*(int16x4_t *)v23.i8), v24);
        v28 = vshlq_s32(vmovl_high_s16(v23), v24);
        v29 = vmovl_s16(vdup_lane_s16(*a5, 0));
        v30 = vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v25, v29), 3uLL), vmulq_s32(v26, v29), 3uLL);
        v31 = vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v27, v29), 3uLL), vmulq_s32(v28, v29), 3uLL);
        v32 = vmovl_s16(vdup_lane_s16(*a5, 1));
        v33 = vmulq_s32(v25, v32);
        v34 = vmulq_s32(v26, v32);
        v35 = vmulq_s32(v27, v32);
        v36 = vmulq_s32(v28, v32);
        v37 = vshrn_high_n_s32(vshrn_n_s32(v33, 3uLL), v34, 3uLL);
        v38 = vshrn_high_n_s32(vshrn_n_s32(v35, 3uLL), v36, 3uLL);
        *(_OWORD *)v21->i8 = 0uLL;
        *(_OWORD *)v21[2].i8 = 0uLL;
        v39 = vaddq_s16(vzip1q_s16(v30, v37), v15);
        v40 = vminq_u16(vsqaddq_u16(v16[-1], vaddq_s16(vzip2q_s16(v30, v37), v15)), v20);
        v41 = vminq_u16(vsqaddq_u16(*v16, vaddq_s16(vzip1q_s16(v31, v38), v15)), v20);
        v42 = vsqaddq_u16(v16[1], vaddq_s16(vzip2q_s16(v31, v38), v15));
        v16[-2] = vminq_u16(vsqaddq_u16(v16[-2], v39), v20);
        v16[-1] = v40;
        *v16 = v41;
        v16[1] = vminq_u16(v42, v20);
        v16 = (uint16x8_t *)((char *)v16 + v17);
        v18 += 4;
      }
      while ((_DWORD)(v18 * 8));
    }
    else
    {
      v137 = 16;
      v138.i64[0] = 0xFC00FC00FC00FC00;
      v138.i64[1] = 0xFC00FC00FC00FC00;
      do
      {
        v139 = vminq_u16(vsqaddq_u16(v16[-1], v15), v138);
        v140 = vminq_u16(vsqaddq_u16(*v16, v15), v138);
        v141 = vminq_u16(vsqaddq_u16(v16[1], v15), v138);
        v16[-2] = vminq_u16(vsqaddq_u16(v16[-2], v15), v138);
        v16[-1] = v139;
        *v16 = v140;
        v16[1] = v141;
        v16 = (uint16x8_t *)((char *)v16 + v17);
        --v137;
      }
      while (v137);
    }
  }
  return result;
}

uint16x8_t *sub_1C9827858(uint16x8_t *result, uint64_t a2, int16x4_t *a3, const __int16 *a4, int16x4_t *a5, int *a6)
{
  int16x4_t *v7;
  int16x4_t *v8;
  uint16x8_t *v10;
  int v11;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  int v16;
  int16x4_t *v17;
  int32x4_t v18;
  uint16x8_t v19;
  uint64_t v20;
  char v21;
  int16x8_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int16x8_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int32x4_t v34;
  int16x8_t v35;
  int32x4_t v36;
  int16x8_t v37;
  int16x8_t v38;
  char v39;
  int16x8_t v40;
  uint16x8_t *v41;
  uint16x8_t v42;
  uint16x8_t v43;
  uint16x8_t v44;
  unsigned int v45;
  int16x4_t *v46;
  unint64_t v47;
  int16x8_t *v48;
  int16x8_t v49;
  int16x8_t v50;
  int16x8_t v51;
  int32x4_t v52;
  int32x4_t v53;
  int32x4_t v54;
  int32x4_t v55;
  BOOL v56;
  int v57;
  unsigned int v58;
  int16x4_t *v59;
  unint64_t v60;
  int16x8_t *v61;
  int16x8_t v62;
  int16x8_t v63;
  int16x8_t v64;
  int32x4_t v65;
  int32x4_t v66;
  int32x4_t v67;
  int32x4_t v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint16x8_t v73;
  int32x4_t v74;
  uint64_t v75;
  unint64_t v76;
  uint16x8_t *v77;
  int16x8_t *v78;
  int16x8_t v79;
  int16x8_t v80;
  int16x8_t v81;
  int16x8_t v82;
  int16x4_t *v83;
  int16x8_t v84;
  int16x8_t v85;
  int16x8_t v86;
  int32x4_t v87;
  int32x4_t v88;
  int32x4_t v89;
  int32x4_t v90;
  int16x8_t v91;
  int16x8_t v92;
  int16x8_t v93;
  int16x8_t v94;
  int16x8_t v95;
  int32x4_t v96;
  int32x4_t v97;
  int32x4_t v98;
  int32x4_t v99;
  int16x8_t v100;
  int16x8_t v101;
  int16x8_t v102;
  int16x8_t v103;
  int16x4_t v104;
  int16x8_t v105;
  int16x8_t v106;
  int32x4_t v107;
  int32x4_t v108;
  int32x4_t v109;
  int32x4_t v110;
  int32x4_t v111;
  int32x4_t v112;
  int32x4_t v113;
  int16x8_t *v114;
  int16x8_t v115;
  int16x8_t *v116;
  int16x8_t v117;
  int32x4_t v118;
  int32x4_t v119;
  int32x4_t v120;
  int32x4_t v121;
  int32x4_t v122;
  int32x4_t v123;
  int32x4_t v124;
  int16x8_t v125;
  int16x8_t v126;
  int16x8_t v127;
  int16x8_t v128;
  int16x8_t v129;
  int16x8_t v130;
  int16x8_t v131;
  int16x8_t v132;
  uint16x8_t *v133;
  uint16x8_t *v134;
  uint16x8_t v135;
  uint16x8_t v136;
  uint16x8_t v137;
  uint16x8_t v138;
  uint16x8_t v139;
  uint16x8_t v140;
  uint16x8_t v141;
  uint16x8_t *v142;
  int v143;
  uint16x8_t v144;
  uint16x8_t v145;
  uint16x8_t v146;
  uint16x8_t v147;
  uint16x8_t v148;
  uint16x8_t v149;
  uint16x8_t v150;

  v7 = (int16x4_t *)a4;
  v8 = a3;
  v10 = result;
  v11 = *a6;
  if ((*a6 & 0xFFFEFFFE) != 0)
  {
    if ((__int16)v11 < 1)
    {
      if ((v11 & 0x8000) != 0)
      {
        v45 = 0;
        v46 = a3 + 16;
        do
        {
          v47 = -8;
          v48 = (int16x8_t *)v46;
          do
          {
            v49 = v48[-8];
            v50 = v48[-4];
            v51 = v48[4];
            v52 = (int32x4_t)vtrn1q_s16(v49, v50);
            v53 = (int32x4_t)vtrn2q_s16(v49, v50);
            v54 = (int32x4_t)vtrn1q_s16(*v48, v51);
            v55 = (int32x4_t)vtrn2q_s16(*v48, v51);
            v48[-8] = (int16x8_t)vtrn1q_s32(v52, v54);
            v48[-4] = (int16x8_t)vtrn1q_s32(v53, v55);
            *(int32x4_t *)v48 = vtrn2q_s32(v52, v54);
            v48[4] = (int16x8_t)vtrn2q_s32(v53, v55);
            v47 += 8;
            ++v48;
          }
          while (v47 < 0x18);
          v46 += 32;
          v56 = v45 >= 0x1C;
          v45 += 4;
        }
        while (!v56);
      }
    }
    else
    {
      sub_1C981EE4C(a3, (unsigned __int16)*a6);
    }
    v57 = *((unsigned __int16 *)a6 + 1);
    if (*((__int16 *)a6 + 1) < 1)
    {
      if ((v57 & 0x8000) != 0)
      {
        v58 = 0;
        v59 = v7 + 16;
        do
        {
          v60 = -8;
          v61 = (int16x8_t *)v59;
          do
          {
            v62 = v61[-8];
            v63 = v61[-4];
            v64 = v61[4];
            v65 = (int32x4_t)vtrn1q_s16(v62, v63);
            v66 = (int32x4_t)vtrn2q_s16(v62, v63);
            v67 = (int32x4_t)vtrn1q_s16(*v61, v64);
            v68 = (int32x4_t)vtrn2q_s16(*v61, v64);
            v61[-8] = (int16x8_t)vtrn1q_s32(v65, v67);
            v61[-4] = (int16x8_t)vtrn1q_s32(v66, v68);
            *(int32x4_t *)v61 = vtrn2q_s32(v65, v67);
            v61[4] = (int16x8_t)vtrn2q_s32(v66, v68);
            v60 += 8;
            ++v61;
          }
          while (v60 < 0x18);
          v59 += 32;
          v56 = v58 >= 0x1C;
          v58 += 4;
        }
        while (!v56);
      }
    }
    else
    {
      sub_1C981EE4C(v7, v57);
    }
    v69 = 0;
    v70 = 2 * a2;
    v71 = 6 * a2 + 16;
    v72 = 4 * a2 + 16;
    v73.i64[0] = 0xFC00FC00FC00FC00;
    v73.i64[1] = 0xFC00FC00FC00FC00;
    v74.i64[0] = 0xA0000000ALL;
    v74.i64[1] = 0xA0000000ALL;
    do
    {
      v75 = 0;
      v76 = -8;
      v77 = v10;
      do
      {
        v78 = (int16x8_t *)&v8[v75];
        v79 = *(int16x8_t *)v8[v75].i8;
        v80 = *(int16x8_t *)v8[v75 + 8].i8;
        v81 = *(int16x8_t *)v8[v75 + 16].i8;
        v82 = *(int16x8_t *)v8[v75 + 24].i8;
        v83 = &v7[v75];
        v84 = *(int16x8_t *)v7[v75].i8;
        v85 = *(int16x8_t *)v7[v75 + 8].i8;
        v86 = *(int16x8_t *)v7[v75 + 16].i8;
        v87 = (int32x4_t)vtrn1q_s16(v79, v80);
        v88 = (int32x4_t)vtrn2q_s16(v79, v80);
        v89 = (int32x4_t)vtrn1q_s16(v81, v82);
        v90 = (int32x4_t)vtrn2q_s16(v81, v82);
        v91 = *(int16x8_t *)v7[v75 + 24].i8;
        *v78 = 0uLL;
        v78[4] = 0uLL;
        v78[8] = 0uLL;
        v78[12] = 0uLL;
        *(_OWORD *)v83->i8 = 0uLL;
        *(_OWORD *)v83[8].i8 = 0uLL;
        *(_OWORD *)v83[16].i8 = 0uLL;
        *(_OWORD *)v83[24].i8 = 0uLL;
        v92 = (int16x8_t)vtrn1q_s32(v87, v89);
        v93 = (int16x8_t)vtrn2q_s32(v87, v89);
        v94 = (int16x8_t)vtrn1q_s32(v88, v90);
        v95 = (int16x8_t)vtrn2q_s32(v88, v90);
        v96 = (int32x4_t)vtrn1q_s16(v84, v85);
        v97 = (int32x4_t)vtrn2q_s16(v84, v85);
        v98 = (int32x4_t)vtrn1q_s16(v86, v91);
        v99 = (int32x4_t)vtrn2q_s16(v86, v91);
        v100 = (int16x8_t)vtrn1q_s32(v96, v98);
        v101 = (int16x8_t)vtrn2q_s32(v96, v98);
        v102 = (int16x8_t)vtrn1q_s32(v97, v99);
        v103 = (int16x8_t)vtrn2q_s32(v97, v99);
        if (a5)
        {
          v104 = *a5;
          v105 = v78[-128];
          v106 = v78[-124];
          v78[-128] = 0uLL;
          v78[-124] = 0uLL;
          v107 = vdupq_laneq_s32(vsubw_s16(v74, v104), 2);
          v108 = vshlq_s32(vmovl_s16(*(int16x4_t *)v105.i8), v107);
          v109 = vshlq_s32(vmovl_high_s16(v105), v107);
          v110 = vshlq_s32(vmovl_s16(*(int16x4_t *)v106.i8), v107);
          v111 = vshlq_s32(vmovl_high_s16(v106), v107);
          v112 = vmovl_s16(vdup_lane_s16(v104, 0));
          v113 = vmovl_s16(vdup_lane_s16(v104, 1));
          v92 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v112), 3uLL), vmulq_s32(v109, v112), 3uLL), v92);
          v100 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v113), 3uLL), vmulq_s32(v109, v113), 3uLL), v100);
          v94 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v110, v112), 3uLL), vmulq_s32(v111, v112), 3uLL), v94);
          v102 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v110, v113), 3uLL), vmulq_s32(v111, v113), 3uLL), v102);
          v114 = v78 - 120;
          *(int16x4_t *)v113.i8 = *a5;
          v115 = v78[-120];
          v116 = v78 - 116;
          v117 = *v116;
          *v114 = 0uLL;
          *v116 = 0uLL;
          v118 = vdupq_laneq_s32(vsubw_s16(v74, *(int16x4_t *)v113.i8), 2);
          v119 = vshlq_s32(vmovl_s16(*(int16x4_t *)v115.i8), v118);
          v120 = vshlq_s32(vmovl_high_s16(v115), v118);
          v121 = vshlq_s32(vmovl_s16(*(int16x4_t *)v117.i8), v118);
          v122 = vshlq_s32(vmovl_high_s16(v117), v118);
          v123 = vmovl_s16(vdup_lane_s16(*(int16x4_t *)v113.i8, 0));
          v124 = vmovl_s16(vdup_lane_s16(*(int16x4_t *)v113.i8, 1));
          v93 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v119, v123), 3uLL), vmulq_s32(v120, v123), 3uLL), v93);
          v101 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v119, v124), 3uLL), vmulq_s32(v120, v124), 3uLL), v101);
          v95 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v121, v123), 3uLL), vmulq_s32(v122, v123), 3uLL), v95);
          v103 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v121, v124), 3uLL), vmulq_s32(v122, v124), 3uLL), v103);
        }
        v125 = vzip1q_s16(v92, v100);
        v126 = vzip2q_s16(v92, v100);
        v127 = vzip1q_s16(v94, v102);
        v128 = vzip2q_s16(v94, v102);
        v129 = vzip1q_s16(v93, v101);
        v130 = vzip2q_s16(v93, v101);
        v131 = vzip1q_s16(v95, v103);
        v132 = vzip2q_s16(v95, v103);
        v133 = (uint16x8_t *)((char *)v77 + v70);
        v134 = (uint16x8_t *)((char *)v77 + v72);
        result = (uint16x8_t *)((char *)v77 + v71);
        v135 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v77 + 2 * a2), v127), v73);
        v136 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v77 + 4 * a2), v129), v73);
        v137 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v77 + 6 * a2), v131), v73);
        v138 = vminq_u16(vsqaddq_u16(v77[1], v126), v73);
        v139 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v77[1] + v70), v128), v73);
        v140 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v77 + v72), v130), v73);
        v141 = vsqaddq_u16(*(uint16x8_t *)((char *)v77 + v71), v132);
        *v77 = vminq_u16(vsqaddq_u16(*v77, v125), v73);
        *v133 = v135;
        v134[-1] = v136;
        result[-1] = v137;
        v77[1] = v138;
        v133[1] = v139;
        *v134 = v140;
        *result = vminq_u16(v141, v73);
        v76 += 8;
        v75 += 2;
        v77 += 2;
      }
      while (v76 < 0x18);
      v8 += 32;
      v7 += 32;
      v10 = (uint16x8_t *)((char *)v10 + 8 * a2);
      v56 = v69 >= 0x1C;
      v69 += 4;
    }
    while (!v56);
  }
  else
  {
    v13 = vld1q_dup_s16((const __int16 *)a3);
    v14 = vld1q_dup_s16(a4);
    v15 = vrshrq_n_s16(vrshrq_n_s16(vzip1q_s16(v13, v14), 1uLL), 4uLL);
    a3->i16[0] = 0;
    *a4 = 0;
    if (a5)
    {
      v16 = 0;
      v17 = a3 - 256;
      v18.i64[0] = 0xA0000000ALL;
      v18.i64[1] = 0xA0000000ALL;
      v19.i64[0] = 0xFC00FC00FC00FC00;
      v19.i64[1] = 0xFC00FC00FC00FC00;
      do
      {
        v20 = 0;
        v21 = 1;
        do
        {
          v22 = *(int16x8_t *)v17[2].i8;
          v23 = vdupq_laneq_s32(vsubw_s16(v18, *a5), 2);
          v24 = vshlq_s32(vmovl_s16(*v17), v23);
          v25 = vshlq_s32(vmovl_high_s16(*(int16x8_t *)v17->i8), v23);
          v26 = vshlq_s32(vmovl_s16(*(int16x4_t *)v22.i8), v23);
          v27 = vshlq_s32(vmovl_high_s16(v22), v23);
          v28 = vmovl_s16(vdup_lane_s16(*a5, 0));
          v29 = vmulq_s32(v26, v28);
          v30 = vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v24, v28), 3uLL), vmulq_s32(v25, v28), 3uLL);
          v31 = vmovl_s16(vdup_lane_s16(*a5, 1));
          v32 = vmulq_s32(v24, v31);
          v33 = vmulq_s32(v25, v31);
          v34 = vmulq_s32(v26, v31);
          v35 = vshrn_high_n_s32(vshrn_n_s32(v29, 3uLL), vmulq_s32(v27, v28), 3uLL);
          v36 = vmulq_s32(v27, v31);
          v37 = vshrn_high_n_s32(vshrn_n_s32(v32, 3uLL), v33, 3uLL);
          v38 = vshrn_high_n_s32(vshrn_n_s32(v34, 3uLL), v36, 3uLL);
          v39 = v21;
          *(_OWORD *)v17->i8 = 0uLL;
          *(_OWORD *)v17[2].i8 = 0uLL;
          v17 += 4;
          v40 = vzip1q_s16(v30, v37);
          v41 = &v10[v20];
          v42 = vminq_u16(vsqaddq_u16(v41[1], vaddq_s16(vzip2q_s16(v30, v37), v15)), v19);
          v43 = vminq_u16(vsqaddq_u16(v41[2], vaddq_s16(vzip1q_s16(v35, v38), v15)), v19);
          v44 = vsqaddq_u16(v41[3], vaddq_s16(vzip2q_s16(v35, v38), v15));
          *v41 = vminq_u16(vsqaddq_u16(*v41, vaddq_s16(v40, v15)), v19);
          v41[1] = v42;
          v41[2] = v43;
          v41[3] = vminq_u16(v44, v19);
          v20 = 4;
          v21 = 0;
        }
        while ((v39 & 1) != 0);
        ++v16;
        v10 = (uint16x8_t *)((char *)v10 + 2 * a2);
      }
      while (v16 != 32);
    }
    else
    {
      v142 = result + 4;
      v143 = 32;
      v144.i64[0] = 0xFC00FC00FC00FC00;
      v144.i64[1] = 0xFC00FC00FC00FC00;
      do
      {
        v145 = vminq_u16(vsqaddq_u16(v142[-3], v15), v144);
        v146 = vminq_u16(vsqaddq_u16(v142[-2], v15), v144);
        v147 = vminq_u16(vsqaddq_u16(v142[-1], v15), v144);
        v142[-4] = vminq_u16(vsqaddq_u16(v142[-4], v15), v144);
        v142[-3] = v145;
        v142[-2] = v146;
        v142[-1] = v147;
        v148 = vminq_u16(vsqaddq_u16(v142[1], v15), v144);
        v149 = vminq_u16(vsqaddq_u16(v142[2], v15), v144);
        v150 = vminq_u16(vsqaddq_u16(v142[3], v15), v144);
        *v142 = vminq_u16(vsqaddq_u16(*v142, v15), v144);
        v142[1] = v148;
        v142[2] = v149;
        v142[3] = v150;
        v142 = (uint16x8_t *)((char *)v142 + 2 * a2);
        --v143;
      }
      while (v143);
    }
  }
  return result;
}

uint16x8_t sub_1C9827E5C(uint16x8_t *a1, uint64_t a2, int16x8_t *a3, int16x8_t *a4, int16x4_t *a5)
{
  int16x8_t v5;
  int16x8_t v6;
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  int16x8_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int16x8_t v19;
  int16x8_t v20;
  int16x8_t v21;
  int16x8_t v22;
  uint16x8_t v23;
  uint16x8_t v24;
  uint16x8_t v25;
  uint16x8_t v26;
  uint16x8_t result;

  v6 = *a3;
  v5 = a3[1];
  v8 = *a4;
  v7 = a4[1];
  if (a5)
  {
    v9 = a3[-2];
    v10 = a3[-1];
    v11.i64[0] = 0xA0000000ALL;
    v11.i64[1] = 0xA0000000ALL;
    v12 = vdupq_laneq_s32(vsubw_s16(v11, *a5), 2);
    v13 = vshlq_s32(vmovl_s16(*(int16x4_t *)v9.i8), v12);
    v14 = vshlq_s32(vmovl_high_s16(v9), v12);
    v15 = vshlq_s32(vmovl_s16(*(int16x4_t *)v10.i8), v12);
    v16 = vshlq_s32(vmovl_high_s16(v10), v12);
    v17 = vmovl_s16(vdup_lane_s16(*a5, 0));
    v18 = vmovl_s16(vdup_lane_s16(*a5, 1));
    v6 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v13, v17), 3uLL), vmulq_s32(v14, v17), 3uLL), v6);
    v5 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v15, v17), 3uLL), vmulq_s32(v16, v17), 3uLL), v5);
    v8 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v13, v18), 3uLL), vmulq_s32(v14, v18), 3uLL), v8);
    v7 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v15, v18), 3uLL), vmulq_s32(v16, v18), 3uLL), v7);
    a3[-2] = 0u;
    a3[-1] = 0u;
  }
  *a3 = 0u;
  a3[1] = 0u;
  v19 = vzip1q_s16(v6, v8);
  v20 = vzip2q_s16(v6, v8);
  v21 = vzip1q_s16(v5, v7);
  v22 = vzip2q_s16(v5, v7);
  *a4 = 0u;
  a4[1] = 0u;
  v23 = *(uint16x8_t *)((char *)a1 + 6 * a2);
  v24 = vsqaddq_u16(*a1, v19);
  v19.i64[0] = 0xFC00FC00FC00FC00;
  v19.i64[1] = 0xFC00FC00FC00FC00;
  v25 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)a1 + 2 * a2), v20), (uint16x8_t)v19);
  v26 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)a1 + 4 * a2), v21), (uint16x8_t)v19);
  *a1 = vminq_u16(v24, (uint16x8_t)v19);
  *(uint16x8_t *)((char *)a1 + 2 * a2) = v25;
  result = vminq_u16(vsqaddq_u16(v23, v22), (uint16x8_t)v19);
  *(uint16x8_t *)((char *)a1 + 4 * a2) = v26;
  *(uint16x8_t *)((char *)a1 + 6 * a2) = result;
  return result;
}

uint16x8_t *sub_1C9827F78(uint16x8_t *result, uint64_t a2, uint64_t a3, int16x8_t *a4, int16x4_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint16x8_t *v7;
  uint16x8_t v8;
  int32x4_t v9;
  unsigned int v10;
  int16x8_t v11;
  int16x8_t v12;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int16x8_t v23;
  uint16x8_t *v24;
  uint16x8_t v25;
  uint16x8_t v26;
  uint16x8_t v27;

  v5 = 2 * a2;
  v6 = a3 - 128;
  v7 = result + 1;
  v8.i64[0] = 0xFC00FC00FC00FC00;
  v8.i64[1] = 0xFC00FC00FC00FC00;
  v9.i64[0] = 0xA0000000ALL;
  v9.i64[1] = 0xA0000000ALL;
  v10 = -2;
  do
  {
    v12 = *(int16x8_t *)(v6 + 128);
    v11 = *(int16x8_t *)(v6 + 144);
    v14 = *a4;
    v13 = a4[1];
    if (a5)
    {
      v15 = *(int16x8_t *)(v6 + 16);
      v16 = vdupq_laneq_s32(vsubw_s16(v9, *a5), 2);
      v17 = vshlq_s32(vmovl_s16(*(int16x4_t *)v6), v16);
      v18 = vshlq_s32(vmovl_high_s16(*(int16x8_t *)v6), v16);
      v19 = vshlq_s32(vmovl_s16(*(int16x4_t *)v15.i8), v16);
      v20 = vshlq_s32(vmovl_high_s16(v15), v16);
      v21 = vmovl_s16(vdup_lane_s16(*a5, 0));
      v22 = vmovl_s16(vdup_lane_s16(*a5, 1));
      v12 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v17, v21), 3uLL), vmulq_s32(v18, v21), 3uLL), v12);
      v11 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v19, v21), 3uLL), vmulq_s32(v20, v21), 3uLL), v11);
      v14 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v17, v22), 3uLL), vmulq_s32(v18, v22), 3uLL), v14);
      v13 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v19, v22), 3uLL), vmulq_s32(v20, v22), 3uLL), v13);
      *(_OWORD *)v6 = 0uLL;
      *(_OWORD *)(v6 + 16) = 0uLL;
    }
    *(_OWORD *)(v6 + 128) = 0uLL;
    *(_OWORD *)(v6 + 144) = 0uLL;
    v23 = vzip1q_s16(v12, v14);
    *a4 = 0uLL;
    a4[1] = 0uLL;
    a4 += 2;
    v24 = (uint16x8_t *)((char *)v7 + v5);
    v25 = vminq_u16(vsqaddq_u16(*v7, vzip2q_s16(v12, v14)), v8);
    v26 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v7[-1] + v5), vzip1q_s16(v11, v13)), v8);
    v27 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v7 + 2 * a2), vzip2q_s16(v11, v13)), v8);
    v7[-1] = vminq_u16(vsqaddq_u16(v7[-1], v23), v8);
    *v7 = v25;
    v10 += 2;
    v24[-1] = v26;
    *v24 = v27;
    v6 += 32;
    v7 = (uint16x8_t *)((char *)v7 + 4 * a2);
  }
  while (v10 < 6);
  return result;
}

uint16x8_t *sub_1C98280A0(uint16x8_t *result, uint64_t a2, uint64_t a3, uint64_t a4, int16x4_t *a5)
{
  uint64_t v5;
  uint16x8_t *v6;
  uint16x8_t v7;
  int32x4_t v8;
  _OWORD *v9;
  int16x8_t *v10;
  int16x8_t v11;
  int16x8_t v12;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t *v15;
  int16x8_t v16;
  int16x8_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int16x8_t v25;
  uint16x8_t v26;
  uint16x8_t v27;
  uint16x8_t v28;

  v5 = 0;
  v6 = result + 2;
  v7.i64[0] = 0xFC00FC00FC00FC00;
  v7.i64[1] = 0xFC00FC00FC00FC00;
  v8.i64[0] = 0xA0000000ALL;
  v8.i64[1] = 0xA0000000ALL;
  do
  {
    v9 = (_OWORD *)(a4 + v5);
    v10 = (int16x8_t *)(a3 + v5);
    v12 = *(int16x8_t *)(a3 + v5);
    v11 = *(int16x8_t *)(a3 + v5 + 16);
    v14 = *(int16x8_t *)(a4 + v5);
    v13 = *(int16x8_t *)(a4 + v5 + 16);
    if (a5)
    {
      v15 = v10 - 32;
      v16 = v10[-32];
      v17 = v10[-31];
      v18 = vdupq_laneq_s32(vsubw_s16(v8, *a5), 2);
      v19 = vshlq_s32(vmovl_s16(*(int16x4_t *)v16.i8), v18);
      v20 = vshlq_s32(vmovl_high_s16(v16), v18);
      v21 = vshlq_s32(vmovl_s16(*(int16x4_t *)v17.i8), v18);
      v22 = vshlq_s32(vmovl_high_s16(v17), v18);
      v23 = vmovl_s16(vdup_lane_s16(*a5, 0));
      v24 = vmovl_s16(vdup_lane_s16(*a5, 1));
      v12 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v19, v23), 3uLL), vmulq_s32(v20, v23), 3uLL), v12);
      v11 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v21, v23), 3uLL), vmulq_s32(v22, v23), 3uLL), v11);
      v14 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v19, v24), 3uLL), vmulq_s32(v20, v24), 3uLL), v14);
      v13 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v21, v24), 3uLL), vmulq_s32(v22, v24), 3uLL), v13);
      *v15 = 0uLL;
      v15[1] = 0uLL;
    }
    *v10 = 0uLL;
    v10[1] = 0uLL;
    v25 = vzip1q_s16(v12, v14);
    *v9 = 0uLL;
    v9[1] = 0uLL;
    v26 = vminq_u16(vsqaddq_u16(v6[-1], vzip2q_s16(v12, v14)), v7);
    v27 = vminq_u16(vsqaddq_u16(*v6, vzip1q_s16(v11, v13)), v7);
    v28 = vminq_u16(vsqaddq_u16(v6[1], vzip2q_s16(v11, v13)), v7);
    v6[-2] = vminq_u16(vsqaddq_u16(v6[-2], v25), v7);
    v6[-1] = v26;
    *v6 = v27;
    v6[1] = v28;
    v5 += 32;
    v6 = (uint16x8_t *)((char *)v6 + 2 * a2);
  }
  while ((_DWORD)v5 != 512);
  return result;
}

int16x4_t sub_1C98281C8(int16x4_t *a1)
{
  int16x4_t v1;
  int16x4_t v2;
  int16x4_t v3;
  int32x2_t v4;
  int32x2_t v5;
  int32x2_t v6;
  int32x2_t v7;
  int16x4_t v8;
  int16x4_t v9;
  int16x4_t v10;
  int16x4_t v11;
  int16x4_t v12;
  int16x4_t v13;
  int16x4_t v14;
  int16x4_t v15;
  int16x4_t v17[6];

  v17[5] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v1 = a1[1];
  v2 = a1[2];
  v3 = a1[3];
  v4 = (int32x2_t)vtrn1_s16(*a1, v1);
  v5 = (int32x2_t)vtrn2_s16(*a1, v1);
  v6 = (int32x2_t)vtrn1_s16(v2, v3);
  v7 = (int32x2_t)vtrn2_s16(v2, v3);
  v8 = (int16x4_t)vzip1_s32(v5, v7);
  v9 = (int16x4_t)vzip2_s32(v4, v6);
  v10 = (int16x4_t)vzip2_s32(v5, v7);
  v11 = (int16x4_t)vzip1_s32(v4, v6);
  v12 = vadd_s16(v10, v11);
  v13 = vsub_s16(v11, v10);
  v14 = vadd_s16(v9, v8);
  v15 = vsub_s16(v8, v9);
  v17[0] = vqmovn_s32(vrshrq_n_s32(vshlq_n_s32(vaddl_s16(v14, v12), 6uLL), 4uLL));
  v17[1] = vqmovn_s32(vrshrq_n_s32(vmlal_s16(vmull_s16(v15, (int16x4_t)0x24002400240024), v13, (int16x4_t)0x53005300530053), 4uLL));
  v17[2] = vqmovn_s32(vrshrq_n_s32(vshlq_n_s32(vsubl_s16(v12, v14), 6uLL), 4uLL));
  v17[3] = vqmovn_s32(vrshrq_n_s32(vmlsl_s16(vmull_s16(v13, (int16x4_t)0x24002400240024), v15, (int16x4_t)0x53005300530053), 4uLL));
  return sub_1C981AF54(a1, v17);
}

void sub_1C982829C(int16x4_t *a1)
{
  int16x4_t v2[18];

  v2[17] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  sub_1C981ADF0(v2, a1, 5);
  sub_1C981AE94(a1, v2);
}

void sub_1C9828308(int16x4_t *a1)
{
  int16x4_t v2[66];

  v2[65] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  sub_1C981AB1C(v2, a1, 6);
  sub_1C981AC68(a1, v2);
}

double sub_1C9828374(uint16x8_t *a1, uint64_t a2, int32x4_t *a3, int32x4_t *a4, int16x4_t *a5, __int16 *a6)
{
  double result;

  if (*a6 >= 1)
    sub_1C98217A0(a3, (unsigned __int16)*a6);
  if (a6[1] >= 1)
    sub_1C98217A0(a4, (unsigned __int16)a6[1]);
  *(_QWORD *)&result = sub_1C98294AC(a1, a2, (int16x8_t *)a3, (int16x8_t *)a4, a5).u64[0];
  return result;
}

uint16x8_t *sub_1C98283F8(uint16x8_t *result, uint64_t a2, int16x4_t *a3, const __int16 *a4, int16x4_t *a5, int *a6)
{
  __int16 *v7;
  uint16x8_t *v10;
  int v11;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  int16x4_t *v16;
  uint64_t v17;
  unsigned int v18;
  int32x4_t v19;
  uint16x8_t v20;
  int16x8_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int16x8_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int16x8_t v34;
  int32x4_t v35;
  int16x8_t v36;
  int16x8_t v37;
  int16x8_t v38;
  uint16x8_t *v39;
  uint16x8_t v40;
  uint16x8_t v41;
  uint16x8_t v42;
  char v43;
  int16x8_t *v44;
  char v45;
  int16x8_t v46;
  int16x8_t v47;
  int16x8_t v48;
  int32x4_t v49;
  int32x4_t v50;
  int32x4_t v51;
  int32x4_t v52;
  int v53;
  char v54;
  int16x8_t *v55;
  char v56;
  int16x8_t v57;
  int16x8_t v58;
  int16x8_t v59;
  int32x4_t v60;
  int32x4_t v61;
  int32x4_t v62;
  int32x4_t v63;
  uint64_t v64;
  uint64_t v65;
  uint16x8_t *v66;
  int16x4_t *v67;
  uint64_t v68;
  char v69;
  uint16x8_t v70;
  int32x4_t v71;
  char v72;
  int16x8_t v73;
  int16x8_t v74;
  int16x8_t v75;
  int16x8_t v76;
  int16x8_t v77;
  int16x8_t v78;
  int32x4_t v79;
  int32x4_t v80;
  int32x4_t v81;
  int32x4_t v82;
  int16x8_t v83;
  int16x8_t v84;
  int16x8_t v85;
  int16x8_t v86;
  int16x8_t v87;
  int16x8_t v88;
  int32x4_t v89;
  int32x4_t v90;
  int32x4_t v91;
  int32x4_t v92;
  int16x8_t v93;
  int16x8_t v94;
  int16x8_t v95;
  int16x8_t v96;
  int16x8_t v97;
  int32x4_t v98;
  int32x4_t v99;
  int32x4_t v100;
  int32x4_t v101;
  int32x4_t v102;
  int32x4_t v103;
  int32x4_t v104;
  int16x8_t v105;
  int16x8_t v106;
  int32x4_t v107;
  int32x4_t v108;
  int32x4_t v109;
  int32x4_t v110;
  int32x4_t v111;
  int32x4_t v112;
  int32x4_t v113;
  int16x8_t v114;
  int16x8_t v115;
  int16x8_t v116;
  int16x8_t v117;
  uint16x8_t *v118;
  uint16x8_t *v119;
  uint16x8_t v120;
  uint16x8_t v121;
  uint16x8_t v122;
  uint16x8_t v123;
  uint16x8_t v124;
  uint16x8_t v125;
  uint16x8_t v126;
  uint16x8_t v127;
  uint64_t v128;
  unsigned int v129;
  uint16x8_t v130;
  uint16x8_t *v131;
  uint16x8_t v132;
  uint16x8_t v133;
  uint16x8_t v134;

  v7 = (__int16 *)a4;
  v10 = result;
  v11 = *a6;
  if ((*a6 & 0xFFFEFFFE) != 0)
  {
    if ((__int16)v11 < 1)
    {
      if ((v11 & 0x8000) != 0)
      {
        v43 = 1;
        v44 = (int16x8_t *)a3;
        do
        {
          v45 = v43;
          v46 = v44[1];
          v47 = v44[2];
          v48 = v44[3];
          v49 = (int32x4_t)vtrn1q_s16(*v44, v46);
          v50 = (int32x4_t)vtrn2q_s16(*v44, v46);
          v51 = (int32x4_t)vtrn1q_s16(v47, v48);
          v52 = (int32x4_t)vtrn2q_s16(v47, v48);
          *(int32x4_t *)v44 = vtrn1q_s32(v49, v51);
          v44[1] = (int16x8_t)vtrn1q_s32(v50, v52);
          v44[2] = (int16x8_t)vtrn2q_s32(v49, v51);
          v44[3] = (int16x8_t)vtrn2q_s32(v50, v52);
          v44 += 4;
          v43 = 0;
        }
        while ((v45 & 1) != 0);
      }
    }
    else
    {
      sub_1C9821698(a3, (unsigned __int16)*a6);
    }
    v53 = *((unsigned __int16 *)a6 + 1);
    if (*((__int16 *)a6 + 1) < 1)
    {
      if ((v53 & 0x8000) != 0)
      {
        v54 = 1;
        v55 = (int16x8_t *)v7;
        do
        {
          v56 = v54;
          v57 = v55[1];
          v58 = v55[2];
          v59 = v55[3];
          v60 = (int32x4_t)vtrn1q_s16(*v55, v57);
          v61 = (int32x4_t)vtrn2q_s16(*v55, v57);
          v62 = (int32x4_t)vtrn1q_s16(v58, v59);
          v63 = (int32x4_t)vtrn2q_s16(v58, v59);
          *(int32x4_t *)v55 = vtrn1q_s32(v60, v62);
          v55[1] = (int16x8_t)vtrn1q_s32(v61, v63);
          v55[2] = (int16x8_t)vtrn2q_s32(v60, v62);
          v55[3] = (int16x8_t)vtrn2q_s32(v61, v63);
          v55 += 4;
          v54 = 0;
        }
        while ((v56 & 1) != 0);
      }
    }
    else
    {
      sub_1C9821698((int16x4_t *)v7, v53);
    }
    v64 = 2 * a2;
    v65 = 4 * a2;
    v66 = v10 + 1;
    v67 = a3 - 16;
    v68 = 6 * a2;
    v69 = 1;
    v70.i64[0] = 0xF800F800F800F800;
    v70.i64[1] = 0xF800F800F800F800;
    v71.i64[0] = 0xB0000000BLL;
    v71.i64[1] = 0xB0000000BLL;
    do
    {
      v72 = v69;
      v73 = *(int16x8_t *)v67[16].i8;
      v74 = *(int16x8_t *)v67[18].i8;
      v75 = *(int16x8_t *)v67[20].i8;
      v76 = *(int16x8_t *)v67[22].i8;
      v77 = *(int16x8_t *)v7;
      v78 = *((int16x8_t *)v7 + 1);
      v79 = (int32x4_t)vtrn1q_s16(v73, v74);
      v80 = (int32x4_t)vtrn2q_s16(v73, v74);
      v81 = (int32x4_t)vtrn1q_s16(v75, v76);
      v82 = (int32x4_t)vtrn2q_s16(v75, v76);
      v83 = *((int16x8_t *)v7 + 2);
      v84 = *((int16x8_t *)v7 + 3);
      *(_OWORD *)v67[16].i8 = 0uLL;
      *(_OWORD *)v67[18].i8 = 0uLL;
      *(_OWORD *)v67[20].i8 = 0uLL;
      *(_OWORD *)v67[22].i8 = 0uLL;
      v85 = (int16x8_t)vtrn1q_s32(v79, v81);
      v86 = (int16x8_t)vtrn2q_s32(v79, v81);
      v87 = (int16x8_t)vtrn1q_s32(v80, v82);
      v88 = (int16x8_t)vtrn2q_s32(v80, v82);
      v89 = (int32x4_t)vtrn1q_s16(v77, v78);
      v90 = (int32x4_t)vtrn2q_s16(v77, v78);
      v91 = (int32x4_t)vtrn1q_s16(v83, v84);
      v92 = (int32x4_t)vtrn2q_s16(v83, v84);
      v93 = (int16x8_t)vtrn1q_s32(v89, v91);
      v94 = (int16x8_t)vtrn2q_s32(v89, v91);
      v95 = (int16x8_t)vtrn1q_s32(v90, v92);
      v96 = (int16x8_t)vtrn2q_s32(v90, v92);
      *((_OWORD *)v7 + 2) = 0uLL;
      *((_OWORD *)v7 + 3) = 0uLL;
      *(_OWORD *)v7 = 0uLL;
      *((_OWORD *)v7 + 1) = 0uLL;
      if (a5)
      {
        v97 = *(int16x8_t *)v67[2].i8;
        v98 = vdupq_laneq_s32(vsubw_s16(v71, *a5), 2);
        v99 = vshlq_s32(vmovl_s16(*v67), v98);
        v100 = vshlq_s32(vmovl_high_s16(*(int16x8_t *)v67->i8), v98);
        v101 = vshlq_s32(vmovl_s16(*(int16x4_t *)v97.i8), v98);
        v102 = vshlq_s32(vmovl_high_s16(v97), v98);
        v103 = vmovl_s16(vdup_lane_s16(*a5, 0));
        v104 = vmovl_s16(vdup_lane_s16(*a5, 1));
        *(_OWORD *)v67->i8 = 0uLL;
        *(_OWORD *)v67[2].i8 = 0uLL;
        v85 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v99, v103), 3uLL), vmulq_s32(v100, v103), 3uLL), v85);
        v93 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v99, v104), 3uLL), vmulq_s32(v100, v104), 3uLL), v93);
        v87 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v101, v103), 3uLL), vmulq_s32(v102, v103), 3uLL), v87);
        v95 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v101, v104), 3uLL), vmulq_s32(v102, v104), 3uLL), v95);
        v105 = *(int16x8_t *)v67[4].i8;
        v106 = *(int16x8_t *)v67[6].i8;
        v107 = vdupq_laneq_s32(vsubw_s16(v71, *a5), 2);
        v108 = vshlq_s32(vmovl_s16(*(int16x4_t *)v105.i8), v107);
        v109 = vshlq_s32(vmovl_high_s16(v105), v107);
        v110 = vshlq_s32(vmovl_s16(*(int16x4_t *)v106.i8), v107);
        v111 = vshlq_s32(vmovl_high_s16(v106), v107);
        v112 = vmovl_s16(vdup_lane_s16(*a5, 0));
        v113 = vmovl_s16(vdup_lane_s16(*a5, 1));
        *(_OWORD *)v67[4].i8 = 0uLL;
        *(_OWORD *)v67[6].i8 = 0uLL;
        v86 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v112), 3uLL), vmulq_s32(v109, v112), 3uLL), v86);
        v94 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v113), 3uLL), vmulq_s32(v109, v113), 3uLL), v94);
        v88 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v110, v112), 3uLL), vmulq_s32(v111, v112), 3uLL), v88);
        v96 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v110, v113), 3uLL), vmulq_s32(v111, v113), 3uLL), v96);
      }
      v69 = 0;
      v114 = vzip1q_s16(v85, v93);
      v115 = vzip2q_s16(v85, v93);
      v116 = vzip1q_s16(v87, v95);
      v117 = vzip2q_s16(v87, v95);
      v118 = (uint16x8_t *)((char *)v66 + v64);
      v119 = (uint16x8_t *)((char *)v66 + v65);
      result = (uint16x8_t *)((char *)v66 + v68);
      v120 = vsqaddq_u16(v66[-1], v114);
      v121 = *(uint16x8_t *)((char *)v66 + 4 * a2);
      v122 = vsqaddq_u16(*(uint16x8_t *)((char *)&v66[-1] + v64), v116);
      v123 = *(uint16x8_t *)((char *)v66 + 6 * a2);
      v124 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v66[-1] + v65), vzip1q_s16(v86, v94)), v70);
      v125 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v66[-1] + v68), vzip1q_s16(v88, v96)), v70);
      v126 = vminq_u16(vsqaddq_u16(*v66, v115), v70);
      v127 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v66 + 2 * a2), v117), v70);
      v66[-1] = vminq_u16(v120, v70);
      v118[-1] = vminq_u16(v122, v70);
      v119[-1] = v124;
      result[-1] = v125;
      *v66 = v126;
      *v118 = v127;
      *v119 = vminq_u16(vsqaddq_u16(v121, vzip2q_s16(v86, v94)), v70);
      *result = vminq_u16(vsqaddq_u16(v123, vzip2q_s16(v88, v96)), v70);
      v66 = (uint16x8_t *)((char *)v66 + 8 * a2);
      v67 += 8;
      v7 += 32;
    }
    while ((v72 & 1) != 0);
  }
  else
  {
    v13 = vld1q_dup_s16((const __int16 *)a3);
    v14 = vld1q_dup_s16(a4);
    v15 = vrshrq_n_s16(vrshrq_n_s16(vzip1q_s16(v13, v14), 1uLL), 3uLL);
    a3->i16[0] = 0;
    *a4 = 0;
    if (a5)
    {
      v16 = a3 - 16;
      v17 = 2 * a2;
      v18 = -2;
      v19.i64[0] = 0xB0000000BLL;
      v19.i64[1] = 0xB0000000BLL;
      v20.i64[0] = 0xF800F800F800F800;
      v20.i64[1] = 0xF800F800F800F800;
      do
      {
        v21 = *(int16x8_t *)v16[2].i8;
        v22 = vdupq_laneq_s32(vsubw_s16(v19, *a5), 2);
        v23 = vshlq_s32(vmovl_s16(*v16), v22);
        v24 = vshlq_s32(vmovl_high_s16(*(int16x8_t *)v16->i8), v22);
        v25 = vshlq_s32(vmovl_s16(*(int16x4_t *)v21.i8), v22);
        v26 = vshlq_s32(vmovl_high_s16(v21), v22);
        v27 = vmovl_s16(vdup_lane_s16(*a5, 0));
        v28 = vmulq_s32(v25, v27);
        v29 = vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v23, v27), 3uLL), vmulq_s32(v24, v27), 3uLL);
        v30 = vmovl_s16(vdup_lane_s16(*a5, 1));
        v31 = vmulq_s32(v23, v30);
        v32 = vmulq_s32(v24, v30);
        v33 = vmulq_s32(v25, v30);
        v34 = vshrn_high_n_s32(vshrn_n_s32(v28, 3uLL), vmulq_s32(v26, v27), 3uLL);
        v35 = vmulq_s32(v26, v30);
        v36 = vshrn_high_n_s32(vshrn_n_s32(v31, 3uLL), v32, 3uLL);
        v37 = vshrn_high_n_s32(vshrn_n_s32(v33, 3uLL), v35, 3uLL);
        *(_OWORD *)v16->i8 = 0uLL;
        *(_OWORD *)v16[2].i8 = 0uLL;
        v16 += 4;
        v38 = vaddq_s16(vzip1q_s16(v29, v36), v15);
        v39 = (uint16x8_t *)((char *)v10 + v17);
        v40 = vminq_u16(vsqaddq_u16(v10[1], vaddq_s16(vzip2q_s16(v29, v36), v15)), v20);
        v41 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v10 + 2 * a2), vaddq_s16(vzip1q_s16(v34, v37), v15)), v20);
        v42 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v10[1] + v17), vaddq_s16(vzip2q_s16(v34, v37), v15)), v20);
        *v10 = vminq_u16(vsqaddq_u16(*v10, v38), v20);
        v10[1] = v40;
        *v39 = v41;
        v39[1] = v42;
        v18 += 2;
        v10 = (uint16x8_t *)((char *)v10 + 4 * a2);
      }
      while (v18 < 6);
    }
    else
    {
      v128 = 2 * a2;
      v129 = -2;
      v130.i64[0] = 0xF800F800F800F800;
      v130.i64[1] = 0xF800F800F800F800;
      do
      {
        v131 = (uint16x8_t *)((char *)v10 + v128);
        v132 = vminq_u16(vsqaddq_u16(v10[1], v15), v130);
        v133 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v10 + 2 * a2), v15), v130);
        v134 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v10[1] + v128), v15), v130);
        *v10 = vminq_u16(vsqaddq_u16(*v10, v15), v130);
        v10[1] = v132;
        *v131 = v133;
        v131[1] = v134;
        v129 += 2;
        v10 = (uint16x8_t *)((char *)v10 + 4 * a2);
      }
      while (v129 < 6);
    }
  }
  return result;
}

int16x4_t *sub_1C9828900(int16x4_t *result, uint64_t a2, int16x4_t *a3, const __int16 *a4, int16x4_t *a5, int *a6)
{
  int16x4_t *v7;
  int16x4_t *v8;
  int16x4_t *v10;
  int v11;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  uint16x8_t *v16;
  uint64_t v17;
  uint64_t v18;
  int32x4_t v19;
  uint16x8_t v20;
  int16x4_t *v21;
  int16x8_t v22;
  int16x8_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int16x8_t v30;
  int16x8_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int32x4_t v34;
  int32x4_t v35;
  int32x4_t v36;
  int16x8_t v37;
  int16x8_t v38;
  int16x8_t v39;
  uint16x8_t v40;
  uint16x8_t v41;
  uint16x8_t v42;
  unsigned int v43;
  int16x4_t *v44;
  uint64_t v45;
  char v46;
  char v47;
  int16x8_t *v48;
  int16x8_t v49;
  int16x8_t v50;
  int16x8_t v51;
  int32x4_t v52;
  int32x4_t v53;
  int32x4_t v54;
  int32x4_t v55;
  BOOL v56;
  int v57;
  unsigned int v58;
  int16x4_t *v59;
  uint64_t v60;
  char v61;
  char v62;
  int16x8_t *v63;
  int16x8_t v64;
  int16x8_t v65;
  int16x8_t v66;
  int32x4_t v67;
  int32x4_t v68;
  int32x4_t v69;
  int32x4_t v70;
  unsigned int v71;
  uint16x8_t v72;
  int32x4_t v73;
  uint64_t v74;
  char v75;
  char v76;
  int16x8_t *v77;
  int16x8_t v78;
  int16x8_t v79;
  int16x8_t v80;
  int16x8_t *v81;
  int16x8_t v82;
  int16x8_t v83;
  int16x8_t v84;
  int32x4_t v85;
  int32x4_t v86;
  int32x4_t v87;
  int32x4_t v88;
  int16x8_t v89;
  int16x8_t v90;
  int16x8_t v91;
  int16x8_t v92;
  int16x8_t v93;
  int32x4_t v94;
  int32x4_t v95;
  int32x4_t v96;
  int32x4_t v97;
  int16x8_t v98;
  int16x8_t v99;
  int16x8_t v100;
  int16x8_t v101;
  int16x4_t v102;
  int16x8_t v103;
  int16x8_t v104;
  int32x4_t v105;
  int32x4_t v106;
  int32x4_t v107;
  int32x4_t v108;
  int32x4_t v109;
  int32x4_t v110;
  int32x4_t v111;
  int16x8_t *v112;
  int16x8_t v113;
  int16x8_t *v114;
  int16x8_t v115;
  int32x4_t v116;
  int32x4_t v117;
  int32x4_t v118;
  int32x4_t v119;
  int32x4_t v120;
  int32x4_t v121;
  int32x4_t v122;
  int16x8_t v123;
  int16x8_t v124;
  uint16x8_t *v125;
  uint16x8_t *v126;
  uint16x8_t *v127;
  uint16x8_t *v128;
  uint16x8_t v129;
  uint16x8_t v130;
  uint16x8_t v131;
  uint16x8_t v132;
  uint16x8_t v133;
  uint16x8_t v134;
  uint16x8_t v135;
  uint16x8_t v136;
  int v137;
  uint16x8_t v138;
  uint16x8_t v139;
  uint16x8_t v140;
  uint16x8_t v141;

  v7 = (int16x4_t *)a4;
  v8 = a3;
  v10 = result;
  v11 = *a6;
  if ((*a6 & 0xFFFEFFFE) != 0)
  {
    if ((__int16)v11 < 1)
    {
      if ((v11 & 0x8000) != 0)
      {
        v43 = 0;
        v44 = a3;
        do
        {
          v45 = 0;
          v46 = 1;
          do
          {
            v47 = v46;
            v48 = (int16x8_t *)&v44[v45];
            v49 = v48[2];
            v50 = v48[4];
            v51 = v48[6];
            v52 = (int32x4_t)vtrn1q_s16(*v48, v49);
            v53 = (int32x4_t)vtrn2q_s16(*v48, v49);
            v54 = (int32x4_t)vtrn1q_s16(v50, v51);
            v55 = (int32x4_t)vtrn2q_s16(v50, v51);
            *(int32x4_t *)v48 = vtrn1q_s32(v52, v54);
            v48[2] = (int16x8_t)vtrn1q_s32(v53, v55);
            v48[4] = (int16x8_t)vtrn2q_s32(v52, v54);
            v48[6] = (int16x8_t)vtrn2q_s32(v53, v55);
            v45 = 2;
            v46 = 0;
          }
          while ((v47 & 1) != 0);
          v44 += 16;
          v56 = v43 >= 0xC;
          v43 += 4;
        }
        while (!v56);
      }
    }
    else
    {
      result = sub_1C98214BC(a3, (unsigned __int16)*a6);
    }
    v57 = *((unsigned __int16 *)a6 + 1);
    if (*((__int16 *)a6 + 1) < 1)
    {
      if ((v57 & 0x8000) != 0)
      {
        v58 = 0;
        v59 = v7;
        do
        {
          v60 = 0;
          v61 = 1;
          do
          {
            v62 = v61;
            v63 = (int16x8_t *)&v59[v60];
            v64 = v63[2];
            v65 = v63[4];
            v66 = v63[6];
            v67 = (int32x4_t)vtrn1q_s16(*v63, v64);
            v68 = (int32x4_t)vtrn2q_s16(*v63, v64);
            v69 = (int32x4_t)vtrn1q_s16(v65, v66);
            v70 = (int32x4_t)vtrn2q_s16(v65, v66);
            *(int32x4_t *)v63 = vtrn1q_s32(v67, v69);
            v63[2] = (int16x8_t)vtrn1q_s32(v68, v70);
            v63[4] = (int16x8_t)vtrn2q_s32(v67, v69);
            v63[6] = (int16x8_t)vtrn2q_s32(v68, v70);
            v60 = 2;
            v61 = 0;
          }
          while ((v62 & 1) != 0);
          v59 += 16;
          v56 = v58 >= 0xC;
          v58 += 4;
        }
        while (!v56);
      }
    }
    else
    {
      result = sub_1C98214BC(v7, v57);
    }
    v71 = 0;
    v72.i64[0] = 0xF800F800F800F800;
    v72.i64[1] = 0xF800F800F800F800;
    v73.i64[0] = 0xB0000000BLL;
    v73.i64[1] = 0xB0000000BLL;
    do
    {
      v74 = 0;
      v75 = 1;
      do
      {
        v76 = v75;
        v77 = (int16x8_t *)&v8[(unint64_t)v74 / 2];
        v78 = v77[2];
        v79 = v77[4];
        v80 = v77[6];
        v81 = (int16x8_t *)&v7[(unint64_t)v74 / 2];
        v82 = *v81;
        v83 = v81[2];
        v84 = v81[4];
        v85 = (int32x4_t)vtrn1q_s16(*v77, v78);
        v86 = (int32x4_t)vtrn2q_s16(*v77, v78);
        v87 = (int32x4_t)vtrn1q_s16(v79, v80);
        v88 = (int32x4_t)vtrn2q_s16(v79, v80);
        v89 = v81[6];
        *v77 = 0uLL;
        v77[2] = 0uLL;
        v77[4] = 0uLL;
        v77[6] = 0uLL;
        *v81 = 0uLL;
        v81[2] = 0uLL;
        v81[4] = 0uLL;
        v81[6] = 0uLL;
        v90 = (int16x8_t)vtrn1q_s32(v85, v87);
        v91 = (int16x8_t)vtrn2q_s32(v85, v87);
        v92 = (int16x8_t)vtrn1q_s32(v86, v88);
        v93 = (int16x8_t)vtrn2q_s32(v86, v88);
        v94 = (int32x4_t)vtrn1q_s16(v82, v83);
        v95 = (int32x4_t)vtrn2q_s16(v82, v83);
        v96 = (int32x4_t)vtrn1q_s16(v84, v89);
        v97 = (int32x4_t)vtrn2q_s16(v84, v89);
        v98 = (int16x8_t)vtrn1q_s32(v94, v96);
        v99 = (int16x8_t)vtrn2q_s32(v94, v96);
        v100 = (int16x8_t)vtrn1q_s32(v95, v97);
        v101 = (int16x8_t)vtrn2q_s32(v95, v97);
        if (a5)
        {
          v102 = *a5;
          v103 = v77[-32];
          v104 = v77[-30];
          v77[-32] = 0uLL;
          v77[-30] = 0uLL;
          v105 = vdupq_laneq_s32(vsubw_s16(v73, v102), 2);
          v106 = vshlq_s32(vmovl_s16(*(int16x4_t *)v103.i8), v105);
          v107 = vshlq_s32(vmovl_high_s16(v103), v105);
          v108 = vshlq_s32(vmovl_s16(*(int16x4_t *)v104.i8), v105);
          v109 = vshlq_s32(vmovl_high_s16(v104), v105);
          v110 = vmovl_s16(vdup_lane_s16(v102, 0));
          v111 = vmovl_s16(vdup_lane_s16(v102, 1));
          v90 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v106, v110), 3uLL), vmulq_s32(v107, v110), 3uLL), v90);
          v98 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v106, v111), 3uLL), vmulq_s32(v107, v111), 3uLL), v98);
          v92 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v110), 3uLL), vmulq_s32(v109, v110), 3uLL), v92);
          v100 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v111), 3uLL), vmulq_s32(v109, v111), 3uLL), v100);
          v112 = v77 - 28;
          *(int16x4_t *)v111.i8 = *a5;
          v113 = v77[-28];
          v114 = v77 - 26;
          v115 = *v114;
          *v112 = 0uLL;
          *v114 = 0uLL;
          v116 = vdupq_laneq_s32(vsubw_s16(v73, *(int16x4_t *)v111.i8), 2);
          v117 = vshlq_s32(vmovl_s16(*(int16x4_t *)v113.i8), v116);
          v118 = vshlq_s32(vmovl_high_s16(v113), v116);
          v119 = vshlq_s32(vmovl_s16(*(int16x4_t *)v115.i8), v116);
          v120 = vshlq_s32(vmovl_high_s16(v115), v116);
          v121 = vmovl_s16(vdup_lane_s16(*(int16x4_t *)v111.i8, 0));
          v122 = vmovl_s16(vdup_lane_s16(*(int16x4_t *)v111.i8, 1));
          v91 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v117, v121), 3uLL), vmulq_s32(v118, v121), 3uLL), v91);
          v99 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v117, v122), 3uLL), vmulq_s32(v118, v122), 3uLL), v99);
          v93 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v119, v121), 3uLL), vmulq_s32(v120, v121), 3uLL), v93);
          v101 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v119, v122), 3uLL), vmulq_s32(v120, v122), 3uLL), v101);
        }
        v75 = 0;
        v123 = vzip1q_s16(v90, v98);
        v124 = vzip2q_s16(v90, v98);
        v125 = (uint16x8_t *)&v10[v74];
        v126 = (uint16x8_t *)((char *)v125 + 2 * a2);
        v127 = (uint16x8_t *)((char *)v125 + 4 * a2);
        v128 = (uint16x8_t *)((char *)v125 + 6 * a2);
        v129 = v126[1];
        v130 = vsqaddq_u16(*v125, v123);
        v131 = v127[1];
        v132 = v128[1];
        v133 = vminq_u16(vsqaddq_u16(*v126, vzip1q_s16(v92, v100)), v72);
        v134 = vminq_u16(vsqaddq_u16(*v127, vzip1q_s16(v91, v99)), v72);
        v135 = vminq_u16(vsqaddq_u16(*v128, vzip1q_s16(v93, v101)), v72);
        v136 = vminq_u16(vsqaddq_u16(v125[1], v124), v72);
        *v125 = vminq_u16(v130, v72);
        *v126 = v133;
        *v127 = v134;
        *v128 = v135;
        v125[1] = v136;
        v126[1] = vminq_u16(vsqaddq_u16(v129, vzip2q_s16(v92, v100)), v72);
        v127[1] = vminq_u16(vsqaddq_u16(v131, vzip2q_s16(v91, v99)), v72);
        v128[1] = vminq_u16(vsqaddq_u16(v132, vzip2q_s16(v93, v101)), v72);
        v74 = 4;
      }
      while ((v76 & 1) != 0);
      v10 += a2;
      v8 += 16;
      v7 += 16;
      v56 = v71 >= 0xC;
      v71 += 4;
    }
    while (!v56);
  }
  else
  {
    v13 = vld1q_dup_s16((const __int16 *)a3);
    v14 = vld1q_dup_s16(a4);
    v15 = vrshrq_n_s16(vrshrq_n_s16(vzip1q_s16(v13, v14), 1uLL), 3uLL);
    a3->i16[0] = 0;
    *a4 = 0;
    v16 = (uint16x8_t *)&result[4];
    v17 = 2 * a2;
    if (a5)
    {
      v18 = 0x1FFFFFFFFFFFFFC0;
      v19.i64[0] = 0xB0000000BLL;
      v19.i64[1] = 0xB0000000BLL;
      v20.i64[0] = 0xF800F800F800F800;
      v20.i64[1] = 0xF800F800F800F800;
      do
      {
        v21 = &a3[v18];
        v22 = *(int16x8_t *)a3[v18].i8;
        v23 = *(int16x8_t *)a3[v18 + 2].i8;
        v24 = vdupq_laneq_s32(vsubw_s16(v19, *a5), 2);
        v25 = vshlq_s32(vmovl_s16(*(int16x4_t *)v22.i8), v24);
        v26 = vshlq_s32(vmovl_high_s16(v22), v24);
        v27 = vshlq_s32(vmovl_s16(*(int16x4_t *)v23.i8), v24);
        v28 = vshlq_s32(vmovl_high_s16(v23), v24);
        v29 = vmovl_s16(vdup_lane_s16(*a5, 0));
        v30 = vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v25, v29), 3uLL), vmulq_s32(v26, v29), 3uLL);
        v31 = vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v27, v29), 3uLL), vmulq_s32(v28, v29), 3uLL);
        v32 = vmovl_s16(vdup_lane_s16(*a5, 1));
        v33 = vmulq_s32(v25, v32);
        v34 = vmulq_s32(v26, v32);
        v35 = vmulq_s32(v27, v32);
        v36 = vmulq_s32(v28, v32);
        v37 = vshrn_high_n_s32(vshrn_n_s32(v33, 3uLL), v34, 3uLL);
        v38 = vshrn_high_n_s32(vshrn_n_s32(v35, 3uLL), v36, 3uLL);
        *(_OWORD *)v21->i8 = 0uLL;
        *(_OWORD *)v21[2].i8 = 0uLL;
        v39 = vaddq_s16(vzip1q_s16(v30, v37), v15);
        v40 = vminq_u16(vsqaddq_u16(v16[-1], vaddq_s16(vzip2q_s16(v30, v37), v15)), v20);
        v41 = vminq_u16(vsqaddq_u16(*v16, vaddq_s16(vzip1q_s16(v31, v38), v15)), v20);
        v42 = vsqaddq_u16(v16[1], vaddq_s16(vzip2q_s16(v31, v38), v15));
        v16[-2] = vminq_u16(vsqaddq_u16(v16[-2], v39), v20);
        v16[-1] = v40;
        *v16 = v41;
        v16[1] = vminq_u16(v42, v20);
        v16 = (uint16x8_t *)((char *)v16 + v17);
        v18 += 4;
      }
      while ((_DWORD)(v18 * 8));
    }
    else
    {
      v137 = 16;
      v138.i64[0] = 0xF800F800F800F800;
      v138.i64[1] = 0xF800F800F800F800;
      do
      {
        v139 = vminq_u16(vsqaddq_u16(v16[-1], v15), v138);
        v140 = vminq_u16(vsqaddq_u16(*v16, v15), v138);
        v141 = vminq_u16(vsqaddq_u16(v16[1], v15), v138);
        v16[-2] = vminq_u16(vsqaddq_u16(v16[-2], v15), v138);
        v16[-1] = v139;
        *v16 = v140;
        v16[1] = v141;
        v16 = (uint16x8_t *)((char *)v16 + v17);
        --v137;
      }
      while (v137);
    }
  }
  return result;
}

uint16x8_t *sub_1C9828EA8(uint16x8_t *result, uint64_t a2, int16x4_t *a3, const __int16 *a4, int16x4_t *a5, int *a6)
{
  int16x4_t *v7;
  int16x4_t *v8;
  uint16x8_t *v10;
  int v11;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  int v16;
  int16x4_t *v17;
  int32x4_t v18;
  uint16x8_t v19;
  uint64_t v20;
  char v21;
  int16x8_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int16x8_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int32x4_t v34;
  int16x8_t v35;
  int32x4_t v36;
  int16x8_t v37;
  int16x8_t v38;
  char v39;
  int16x8_t v40;
  uint16x8_t *v41;
  uint16x8_t v42;
  uint16x8_t v43;
  uint16x8_t v44;
  unsigned int v45;
  int16x4_t *v46;
  unint64_t v47;
  int16x8_t *v48;
  int16x8_t v49;
  int16x8_t v50;
  int16x8_t v51;
  int32x4_t v52;
  int32x4_t v53;
  int32x4_t v54;
  int32x4_t v55;
  BOOL v56;
  int v57;
  unsigned int v58;
  int16x4_t *v59;
  unint64_t v60;
  int16x8_t *v61;
  int16x8_t v62;
  int16x8_t v63;
  int16x8_t v64;
  int32x4_t v65;
  int32x4_t v66;
  int32x4_t v67;
  int32x4_t v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint16x8_t v73;
  int32x4_t v74;
  uint64_t v75;
  unint64_t v76;
  uint16x8_t *v77;
  int16x8_t *v78;
  int16x8_t v79;
  int16x8_t v80;
  int16x8_t v81;
  int16x8_t v82;
  int16x4_t *v83;
  int16x8_t v84;
  int16x8_t v85;
  int16x8_t v86;
  int32x4_t v87;
  int32x4_t v88;
  int32x4_t v89;
  int32x4_t v90;
  int16x8_t v91;
  int16x8_t v92;
  int16x8_t v93;
  int16x8_t v94;
  int16x8_t v95;
  int32x4_t v96;
  int32x4_t v97;
  int32x4_t v98;
  int32x4_t v99;
  int16x8_t v100;
  int16x8_t v101;
  int16x8_t v102;
  int16x8_t v103;
  int16x4_t v104;
  int16x8_t v105;
  int16x8_t v106;
  int32x4_t v107;
  int32x4_t v108;
  int32x4_t v109;
  int32x4_t v110;
  int32x4_t v111;
  int32x4_t v112;
  int32x4_t v113;
  int16x8_t *v114;
  int16x8_t v115;
  int16x8_t *v116;
  int16x8_t v117;
  int32x4_t v118;
  int32x4_t v119;
  int32x4_t v120;
  int32x4_t v121;
  int32x4_t v122;
  int32x4_t v123;
  int32x4_t v124;
  int16x8_t v125;
  int16x8_t v126;
  int16x8_t v127;
  int16x8_t v128;
  int16x8_t v129;
  int16x8_t v130;
  int16x8_t v131;
  int16x8_t v132;
  uint16x8_t *v133;
  uint16x8_t *v134;
  uint16x8_t v135;
  uint16x8_t v136;
  uint16x8_t v137;
  uint16x8_t v138;
  uint16x8_t v139;
  uint16x8_t v140;
  uint16x8_t v141;
  uint16x8_t *v142;
  int v143;
  uint16x8_t v144;
  uint16x8_t v145;
  uint16x8_t v146;
  uint16x8_t v147;
  uint16x8_t v148;
  uint16x8_t v149;
  uint16x8_t v150;

  v7 = (int16x4_t *)a4;
  v8 = a3;
  v10 = result;
  v11 = *a6;
  if ((*a6 & 0xFFFEFFFE) != 0)
  {
    if ((__int16)v11 < 1)
    {
      if ((v11 & 0x8000) != 0)
      {
        v45 = 0;
        v46 = a3 + 16;
        do
        {
          v47 = -8;
          v48 = (int16x8_t *)v46;
          do
          {
            v49 = v48[-8];
            v50 = v48[-4];
            v51 = v48[4];
            v52 = (int32x4_t)vtrn1q_s16(v49, v50);
            v53 = (int32x4_t)vtrn2q_s16(v49, v50);
            v54 = (int32x4_t)vtrn1q_s16(*v48, v51);
            v55 = (int32x4_t)vtrn2q_s16(*v48, v51);
            v48[-8] = (int16x8_t)vtrn1q_s32(v52, v54);
            v48[-4] = (int16x8_t)vtrn1q_s32(v53, v55);
            *(int32x4_t *)v48 = vtrn2q_s32(v52, v54);
            v48[4] = (int16x8_t)vtrn2q_s32(v53, v55);
            v47 += 8;
            ++v48;
          }
          while (v47 < 0x18);
          v46 += 32;
          v56 = v45 >= 0x1C;
          v45 += 4;
        }
        while (!v56);
      }
    }
    else
    {
      sub_1C9820B94(a3, (unsigned __int16)*a6);
    }
    v57 = *((unsigned __int16 *)a6 + 1);
    if (*((__int16 *)a6 + 1) < 1)
    {
      if ((v57 & 0x8000) != 0)
      {
        v58 = 0;
        v59 = v7 + 16;
        do
        {
          v60 = -8;
          v61 = (int16x8_t *)v59;
          do
          {
            v62 = v61[-8];
            v63 = v61[-4];
            v64 = v61[4];
            v65 = (int32x4_t)vtrn1q_s16(v62, v63);
            v66 = (int32x4_t)vtrn2q_s16(v62, v63);
            v67 = (int32x4_t)vtrn1q_s16(*v61, v64);
            v68 = (int32x4_t)vtrn2q_s16(*v61, v64);
            v61[-8] = (int16x8_t)vtrn1q_s32(v65, v67);
            v61[-4] = (int16x8_t)vtrn1q_s32(v66, v68);
            *(int32x4_t *)v61 = vtrn2q_s32(v65, v67);
            v61[4] = (int16x8_t)vtrn2q_s32(v66, v68);
            v60 += 8;
            ++v61;
          }
          while (v60 < 0x18);
          v59 += 32;
          v56 = v58 >= 0x1C;
          v58 += 4;
        }
        while (!v56);
      }
    }
    else
    {
      sub_1C9820B94(v7, v57);
    }
    v69 = 0;
    v70 = 2 * a2;
    v71 = 6 * a2 + 16;
    v72 = 4 * a2 + 16;
    v73.i64[0] = 0xF800F800F800F800;
    v73.i64[1] = 0xF800F800F800F800;
    v74.i64[0] = 0xB0000000BLL;
    v74.i64[1] = 0xB0000000BLL;
    do
    {
      v75 = 0;
      v76 = -8;
      v77 = v10;
      do
      {
        v78 = (int16x8_t *)&v8[v75];
        v79 = *(int16x8_t *)v8[v75].i8;
        v80 = *(int16x8_t *)v8[v75 + 8].i8;
        v81 = *(int16x8_t *)v8[v75 + 16].i8;
        v82 = *(int16x8_t *)v8[v75 + 24].i8;
        v83 = &v7[v75];
        v84 = *(int16x8_t *)v7[v75].i8;
        v85 = *(int16x8_t *)v7[v75 + 8].i8;
        v86 = *(int16x8_t *)v7[v75 + 16].i8;
        v87 = (int32x4_t)vtrn1q_s16(v79, v80);
        v88 = (int32x4_t)vtrn2q_s16(v79, v80);
        v89 = (int32x4_t)vtrn1q_s16(v81, v82);
        v90 = (int32x4_t)vtrn2q_s16(v81, v82);
        v91 = *(int16x8_t *)v7[v75 + 24].i8;
        *v78 = 0uLL;
        v78[4] = 0uLL;
        v78[8] = 0uLL;
        v78[12] = 0uLL;
        *(_OWORD *)v83->i8 = 0uLL;
        *(_OWORD *)v83[8].i8 = 0uLL;
        *(_OWORD *)v83[16].i8 = 0uLL;
        *(_OWORD *)v83[24].i8 = 0uLL;
        v92 = (int16x8_t)vtrn1q_s32(v87, v89);
        v93 = (int16x8_t)vtrn2q_s32(v87, v89);
        v94 = (int16x8_t)vtrn1q_s32(v88, v90);
        v95 = (int16x8_t)vtrn2q_s32(v88, v90);
        v96 = (int32x4_t)vtrn1q_s16(v84, v85);
        v97 = (int32x4_t)vtrn2q_s16(v84, v85);
        v98 = (int32x4_t)vtrn1q_s16(v86, v91);
        v99 = (int32x4_t)vtrn2q_s16(v86, v91);
        v100 = (int16x8_t)vtrn1q_s32(v96, v98);
        v101 = (int16x8_t)vtrn2q_s32(v96, v98);
        v102 = (int16x8_t)vtrn1q_s32(v97, v99);
        v103 = (int16x8_t)vtrn2q_s32(v97, v99);
        if (a5)
        {
          v104 = *a5;
          v105 = v78[-128];
          v106 = v78[-124];
          v78[-128] = 0uLL;
          v78[-124] = 0uLL;
          v107 = vdupq_laneq_s32(vsubw_s16(v74, v104), 2);
          v108 = vshlq_s32(vmovl_s16(*(int16x4_t *)v105.i8), v107);
          v109 = vshlq_s32(vmovl_high_s16(v105), v107);
          v110 = vshlq_s32(vmovl_s16(*(int16x4_t *)v106.i8), v107);
          v111 = vshlq_s32(vmovl_high_s16(v106), v107);
          v112 = vmovl_s16(vdup_lane_s16(v104, 0));
          v113 = vmovl_s16(vdup_lane_s16(v104, 1));
          v92 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v112), 3uLL), vmulq_s32(v109, v112), 3uLL), v92);
          v100 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v113), 3uLL), vmulq_s32(v109, v113), 3uLL), v100);
          v94 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v110, v112), 3uLL), vmulq_s32(v111, v112), 3uLL), v94);
          v102 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v110, v113), 3uLL), vmulq_s32(v111, v113), 3uLL), v102);
          v114 = v78 - 120;
          *(int16x4_t *)v113.i8 = *a5;
          v115 = v78[-120];
          v116 = v78 - 116;
          v117 = *v116;
          *v114 = 0uLL;
          *v116 = 0uLL;
          v118 = vdupq_laneq_s32(vsubw_s16(v74, *(int16x4_t *)v113.i8), 2);
          v119 = vshlq_s32(vmovl_s16(*(int16x4_t *)v115.i8), v118);
          v120 = vshlq_s32(vmovl_high_s16(v115), v118);
          v121 = vshlq_s32(vmovl_s16(*(int16x4_t *)v117.i8), v118);
          v122 = vshlq_s32(vmovl_high_s16(v117), v118);
          v123 = vmovl_s16(vdup_lane_s16(*(int16x4_t *)v113.i8, 0));
          v124 = vmovl_s16(vdup_lane_s16(*(int16x4_t *)v113.i8, 1));
          v93 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v119, v123), 3uLL), vmulq_s32(v120, v123), 3uLL), v93);
          v101 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v119, v124), 3uLL), vmulq_s32(v120, v124), 3uLL), v101);
          v95 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v121, v123), 3uLL), vmulq_s32(v122, v123), 3uLL), v95);
          v103 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v121, v124), 3uLL), vmulq_s32(v122, v124), 3uLL), v103);
        }
        v125 = vzip1q_s16(v92, v100);
        v126 = vzip2q_s16(v92, v100);
        v127 = vzip1q_s16(v94, v102);
        v128 = vzip2q_s16(v94, v102);
        v129 = vzip1q_s16(v93, v101);
        v130 = vzip2q_s16(v93, v101);
        v131 = vzip1q_s16(v95, v103);
        v132 = vzip2q_s16(v95, v103);
        v133 = (uint16x8_t *)((char *)v77 + v70);
        v134 = (uint16x8_t *)((char *)v77 + v72);
        result = (uint16x8_t *)((char *)v77 + v71);
        v135 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v77 + 2 * a2), v127), v73);
        v136 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v77 + 4 * a2), v129), v73);
        v137 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v77 + 6 * a2), v131), v73);
        v138 = vminq_u16(vsqaddq_u16(v77[1], v126), v73);
        v139 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v77[1] + v70), v128), v73);
        v140 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v77 + v72), v130), v73);
        v141 = vsqaddq_u16(*(uint16x8_t *)((char *)v77 + v71), v132);
        *v77 = vminq_u16(vsqaddq_u16(*v77, v125), v73);
        *v133 = v135;
        v134[-1] = v136;
        result[-1] = v137;
        v77[1] = v138;
        v133[1] = v139;
        *v134 = v140;
        *result = vminq_u16(v141, v73);
        v76 += 8;
        v75 += 2;
        v77 += 2;
      }
      while (v76 < 0x18);
      v8 += 32;
      v7 += 32;
      v10 = (uint16x8_t *)((char *)v10 + 8 * a2);
      v56 = v69 >= 0x1C;
      v69 += 4;
    }
    while (!v56);
  }
  else
  {
    v13 = vld1q_dup_s16((const __int16 *)a3);
    v14 = vld1q_dup_s16(a4);
    v15 = vrshrq_n_s16(vrshrq_n_s16(vzip1q_s16(v13, v14), 1uLL), 3uLL);
    a3->i16[0] = 0;
    *a4 = 0;
    if (a5)
    {
      v16 = 0;
      v17 = a3 - 256;
      v18.i64[0] = 0xB0000000BLL;
      v18.i64[1] = 0xB0000000BLL;
      v19.i64[0] = 0xF800F800F800F800;
      v19.i64[1] = 0xF800F800F800F800;
      do
      {
        v20 = 0;
        v21 = 1;
        do
        {
          v22 = *(int16x8_t *)v17[2].i8;
          v23 = vdupq_laneq_s32(vsubw_s16(v18, *a5), 2);
          v24 = vshlq_s32(vmovl_s16(*v17), v23);
          v25 = vshlq_s32(vmovl_high_s16(*(int16x8_t *)v17->i8), v23);
          v26 = vshlq_s32(vmovl_s16(*(int16x4_t *)v22.i8), v23);
          v27 = vshlq_s32(vmovl_high_s16(v22), v23);
          v28 = vmovl_s16(vdup_lane_s16(*a5, 0));
          v29 = vmulq_s32(v26, v28);
          v30 = vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v24, v28), 3uLL), vmulq_s32(v25, v28), 3uLL);
          v31 = vmovl_s16(vdup_lane_s16(*a5, 1));
          v32 = vmulq_s32(v24, v31);
          v33 = vmulq_s32(v25, v31);
          v34 = vmulq_s32(v26, v31);
          v35 = vshrn_high_n_s32(vshrn_n_s32(v29, 3uLL), vmulq_s32(v27, v28), 3uLL);
          v36 = vmulq_s32(v27, v31);
          v37 = vshrn_high_n_s32(vshrn_n_s32(v32, 3uLL), v33, 3uLL);
          v38 = vshrn_high_n_s32(vshrn_n_s32(v34, 3uLL), v36, 3uLL);
          v39 = v21;
          *(_OWORD *)v17->i8 = 0uLL;
          *(_OWORD *)v17[2].i8 = 0uLL;
          v17 += 4;
          v40 = vzip1q_s16(v30, v37);
          v41 = &v10[v20];
          v42 = vminq_u16(vsqaddq_u16(v41[1], vaddq_s16(vzip2q_s16(v30, v37), v15)), v19);
          v43 = vminq_u16(vsqaddq_u16(v41[2], vaddq_s16(vzip1q_s16(v35, v38), v15)), v19);
          v44 = vsqaddq_u16(v41[3], vaddq_s16(vzip2q_s16(v35, v38), v15));
          *v41 = vminq_u16(vsqaddq_u16(*v41, vaddq_s16(v40, v15)), v19);
          v41[1] = v42;
          v41[2] = v43;
          v41[3] = vminq_u16(v44, v19);
          v20 = 4;
          v21 = 0;
        }
        while ((v39 & 1) != 0);
        ++v16;
        v10 = (uint16x8_t *)((char *)v10 + 2 * a2);
      }
      while (v16 != 32);
    }
    else
    {
      v142 = result + 4;
      v143 = 32;
      v144.i64[0] = 0xF800F800F800F800;
      v144.i64[1] = 0xF800F800F800F800;
      do
      {
        v145 = vminq_u16(vsqaddq_u16(v142[-3], v15), v144);
        v146 = vminq_u16(vsqaddq_u16(v142[-2], v15), v144);
        v147 = vminq_u16(vsqaddq_u16(v142[-1], v15), v144);
        v142[-4] = vminq_u16(vsqaddq_u16(v142[-4], v15), v144);
        v142[-3] = v145;
        v142[-2] = v146;
        v142[-1] = v147;
        v148 = vminq_u16(vsqaddq_u16(v142[1], v15), v144);
        v149 = vminq_u16(vsqaddq_u16(v142[2], v15), v144);
        v150 = vminq_u16(vsqaddq_u16(v142[3], v15), v144);
        *v142 = vminq_u16(vsqaddq_u16(*v142, v15), v144);
        v142[1] = v148;
        v142[2] = v149;
        v142[3] = v150;
        v142 = (uint16x8_t *)((char *)v142 + 2 * a2);
        --v143;
      }
      while (v143);
    }
  }
  return result;
}

uint16x8_t sub_1C98294AC(uint16x8_t *a1, uint64_t a2, int16x8_t *a3, int16x8_t *a4, int16x4_t *a5)
{
  int16x8_t v5;
  int16x8_t v6;
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  int16x8_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int16x8_t v19;
  int16x8_t v20;
  int16x8_t v21;
  int16x8_t v22;
  uint16x8_t v23;
  uint16x8_t v24;
  uint16x8_t v25;
  uint16x8_t v26;
  uint16x8_t result;

  v6 = *a3;
  v5 = a3[1];
  v8 = *a4;
  v7 = a4[1];
  if (a5)
  {
    v9 = a3[-2];
    v10 = a3[-1];
    v11.i64[0] = 0xB0000000BLL;
    v11.i64[1] = 0xB0000000BLL;
    v12 = vdupq_laneq_s32(vsubw_s16(v11, *a5), 2);
    v13 = vshlq_s32(vmovl_s16(*(int16x4_t *)v9.i8), v12);
    v14 = vshlq_s32(vmovl_high_s16(v9), v12);
    v15 = vshlq_s32(vmovl_s16(*(int16x4_t *)v10.i8), v12);
    v16 = vshlq_s32(vmovl_high_s16(v10), v12);
    v17 = vmovl_s16(vdup_lane_s16(*a5, 0));
    v18 = vmovl_s16(vdup_lane_s16(*a5, 1));
    v6 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v13, v17), 3uLL), vmulq_s32(v14, v17), 3uLL), v6);
    v5 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v15, v17), 3uLL), vmulq_s32(v16, v17), 3uLL), v5);
    v8 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v13, v18), 3uLL), vmulq_s32(v14, v18), 3uLL), v8);
    v7 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v15, v18), 3uLL), vmulq_s32(v16, v18), 3uLL), v7);
    a3[-2] = 0u;
    a3[-1] = 0u;
  }
  *a3 = 0u;
  a3[1] = 0u;
  v19 = vzip1q_s16(v6, v8);
  v20 = vzip2q_s16(v6, v8);
  v21 = vzip1q_s16(v5, v7);
  v22 = vzip2q_s16(v5, v7);
  *a4 = 0u;
  a4[1] = 0u;
  v23 = *(uint16x8_t *)((char *)a1 + 6 * a2);
  v24 = vsqaddq_u16(*a1, v19);
  v19.i64[0] = 0xF800F800F800F800;
  v19.i64[1] = 0xF800F800F800F800;
  v25 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)a1 + 2 * a2), v20), (uint16x8_t)v19);
  v26 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)a1 + 4 * a2), v21), (uint16x8_t)v19);
  *a1 = vminq_u16(v24, (uint16x8_t)v19);
  *(uint16x8_t *)((char *)a1 + 2 * a2) = v25;
  result = vminq_u16(vsqaddq_u16(v23, v22), (uint16x8_t)v19);
  *(uint16x8_t *)((char *)a1 + 4 * a2) = v26;
  *(uint16x8_t *)((char *)a1 + 6 * a2) = result;
  return result;
}

uint16x8_t *sub_1C98295C8(uint16x8_t *result, uint64_t a2, uint64_t a3, int16x8_t *a4, int16x4_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint16x8_t *v7;
  uint16x8_t v8;
  int32x4_t v9;
  unsigned int v10;
  int16x8_t v11;
  int16x8_t v12;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int16x8_t v23;
  uint16x8_t *v24;
  uint16x8_t v25;
  uint16x8_t v26;
  uint16x8_t v27;

  v5 = 2 * a2;
  v6 = a3 - 128;
  v7 = result + 1;
  v8.i64[0] = 0xF800F800F800F800;
  v8.i64[1] = 0xF800F800F800F800;
  v9.i64[0] = 0xB0000000BLL;
  v9.i64[1] = 0xB0000000BLL;
  v10 = -2;
  do
  {
    v12 = *(int16x8_t *)(v6 + 128);
    v11 = *(int16x8_t *)(v6 + 144);
    v14 = *a4;
    v13 = a4[1];
    if (a5)
    {
      v15 = *(int16x8_t *)(v6 + 16);
      v16 = vdupq_laneq_s32(vsubw_s16(v9, *a5), 2);
      v17 = vshlq_s32(vmovl_s16(*(int16x4_t *)v6), v16);
      v18 = vshlq_s32(vmovl_high_s16(*(int16x8_t *)v6), v16);
      v19 = vshlq_s32(vmovl_s16(*(int16x4_t *)v15.i8), v16);
      v20 = vshlq_s32(vmovl_high_s16(v15), v16);
      v21 = vmovl_s16(vdup_lane_s16(*a5, 0));
      v22 = vmovl_s16(vdup_lane_s16(*a5, 1));
      v12 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v17, v21), 3uLL), vmulq_s32(v18, v21), 3uLL), v12);
      v11 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v19, v21), 3uLL), vmulq_s32(v20, v21), 3uLL), v11);
      v14 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v17, v22), 3uLL), vmulq_s32(v18, v22), 3uLL), v14);
      v13 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v19, v22), 3uLL), vmulq_s32(v20, v22), 3uLL), v13);
      *(_OWORD *)v6 = 0uLL;
      *(_OWORD *)(v6 + 16) = 0uLL;
    }
    *(_OWORD *)(v6 + 128) = 0uLL;
    *(_OWORD *)(v6 + 144) = 0uLL;
    v23 = vzip1q_s16(v12, v14);
    *a4 = 0uLL;
    a4[1] = 0uLL;
    a4 += 2;
    v24 = (uint16x8_t *)((char *)v7 + v5);
    v25 = vminq_u16(vsqaddq_u16(*v7, vzip2q_s16(v12, v14)), v8);
    v26 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v7[-1] + v5), vzip1q_s16(v11, v13)), v8);
    v27 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v7 + 2 * a2), vzip2q_s16(v11, v13)), v8);
    v7[-1] = vminq_u16(vsqaddq_u16(v7[-1], v23), v8);
    *v7 = v25;
    v10 += 2;
    v24[-1] = v26;
    *v24 = v27;
    v6 += 32;
    v7 = (uint16x8_t *)((char *)v7 + 4 * a2);
  }
  while (v10 < 6);
  return result;
}

uint16x8_t *sub_1C98296F0(uint16x8_t *result, uint64_t a2, uint64_t a3, uint64_t a4, int16x4_t *a5)
{
  uint64_t v5;
  uint16x8_t *v6;
  uint16x8_t v7;
  int32x4_t v8;
  _OWORD *v9;
  int16x8_t *v10;
  int16x8_t v11;
  int16x8_t v12;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t *v15;
  int16x8_t v16;
  int16x8_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int16x8_t v25;
  uint16x8_t v26;
  uint16x8_t v27;
  uint16x8_t v28;

  v5 = 0;
  v6 = result + 2;
  v7.i64[0] = 0xF800F800F800F800;
  v7.i64[1] = 0xF800F800F800F800;
  v8.i64[0] = 0xB0000000BLL;
  v8.i64[1] = 0xB0000000BLL;
  do
  {
    v9 = (_OWORD *)(a4 + v5);
    v10 = (int16x8_t *)(a3 + v5);
    v12 = *(int16x8_t *)(a3 + v5);
    v11 = *(int16x8_t *)(a3 + v5 + 16);
    v14 = *(int16x8_t *)(a4 + v5);
    v13 = *(int16x8_t *)(a4 + v5 + 16);
    if (a5)
    {
      v15 = v10 - 32;
      v16 = v10[-32];
      v17 = v10[-31];
      v18 = vdupq_laneq_s32(vsubw_s16(v8, *a5), 2);
      v19 = vshlq_s32(vmovl_s16(*(int16x4_t *)v16.i8), v18);
      v20 = vshlq_s32(vmovl_high_s16(v16), v18);
      v21 = vshlq_s32(vmovl_s16(*(int16x4_t *)v17.i8), v18);
      v22 = vshlq_s32(vmovl_high_s16(v17), v18);
      v23 = vmovl_s16(vdup_lane_s16(*a5, 0));
      v24 = vmovl_s16(vdup_lane_s16(*a5, 1));
      v12 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v19, v23), 3uLL), vmulq_s32(v20, v23), 3uLL), v12);
      v11 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v21, v23), 3uLL), vmulq_s32(v22, v23), 3uLL), v11);
      v14 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v19, v24), 3uLL), vmulq_s32(v20, v24), 3uLL), v14);
      v13 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v21, v24), 3uLL), vmulq_s32(v22, v24), 3uLL), v13);
      *v15 = 0uLL;
      v15[1] = 0uLL;
    }
    *v10 = 0uLL;
    v10[1] = 0uLL;
    v25 = vzip1q_s16(v12, v14);
    *v9 = 0uLL;
    v9[1] = 0uLL;
    v26 = vminq_u16(vsqaddq_u16(v6[-1], vzip2q_s16(v12, v14)), v7);
    v27 = vminq_u16(vsqaddq_u16(*v6, vzip1q_s16(v11, v13)), v7);
    v28 = vminq_u16(vsqaddq_u16(v6[1], vzip2q_s16(v11, v13)), v7);
    v6[-2] = vminq_u16(vsqaddq_u16(v6[-2], v25), v7);
    v6[-1] = v26;
    *v6 = v27;
    v6[1] = v28;
    v5 += 32;
    v6 = (uint16x8_t *)((char *)v6 + 2 * a2);
  }
  while ((_DWORD)v5 != 512);
  return result;
}

int16x4_t sub_1C9829818(int16x4_t *a1)
{
  int16x4_t v1;
  int16x4_t v2;
  int16x4_t v3;
  int32x2_t v4;
  int32x2_t v5;
  int32x2_t v6;
  int32x2_t v7;
  int16x4_t v8;
  int16x4_t v9;
  int16x4_t v10;
  int16x4_t v11;
  int16x4_t v12;
  int16x4_t v13;
  int16x4_t v14;
  int16x4_t v15;
  int16x4_t v17[6];

  v17[5] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v1 = a1[1];
  v2 = a1[2];
  v3 = a1[3];
  v4 = (int32x2_t)vtrn1_s16(*a1, v1);
  v5 = (int32x2_t)vtrn2_s16(*a1, v1);
  v6 = (int32x2_t)vtrn1_s16(v2, v3);
  v7 = (int32x2_t)vtrn2_s16(v2, v3);
  v8 = (int16x4_t)vzip1_s32(v5, v7);
  v9 = (int16x4_t)vzip2_s32(v4, v6);
  v10 = (int16x4_t)vzip2_s32(v5, v7);
  v11 = (int16x4_t)vzip1_s32(v4, v6);
  v12 = vadd_s16(v10, v11);
  v13 = vsub_s16(v11, v10);
  v14 = vadd_s16(v9, v8);
  v15 = vsub_s16(v8, v9);
  v17[0] = vqmovn_s32(vrshrq_n_s32(vshlq_n_s32(vaddl_s16(v14, v12), 6uLL), 5uLL));
  v17[1] = vqmovn_s32(vrshrq_n_s32(vmlal_s16(vmull_s16(v15, (int16x4_t)0x24002400240024), v13, (int16x4_t)0x53005300530053), 5uLL));
  v17[2] = vqmovn_s32(vrshrq_n_s32(vshlq_n_s32(vsubl_s16(v12, v14), 6uLL), 5uLL));
  v17[3] = vqmovn_s32(vrshrq_n_s32(vmlsl_s16(vmull_s16(v13, (int16x4_t)0x24002400240024), v15, (int16x4_t)0x53005300530053), 5uLL));
  return sub_1C981AF54(a1, v17);
}

void sub_1C98298EC(int16x4_t *a1)
{
  int16x4_t v2[18];

  v2[17] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  sub_1C981ADF0(v2, a1, 6);
  sub_1C981AE94(a1, v2);
}

void sub_1C9829958(int16x4_t *a1)
{
  int16x4_t v2[66];

  v2[65] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  sub_1C981AB1C(v2, a1, 7);
  sub_1C981AC68(a1, v2);
}

double sub_1C98299C4(uint16x8_t *a1, uint64_t a2, int32x4_t *a3, int32x4_t *a4, int16x4_t *a5, __int16 *a6)
{
  double result;

  if (*a6 >= 1)
    sub_1C98234DC(a3, (unsigned __int16)*a6);
  if (a6[1] >= 1)
    sub_1C98234DC(a4, (unsigned __int16)a6[1]);
  *(_QWORD *)&result = sub_1C982AAFC(a1, a2, (int16x8_t *)a3, (int16x8_t *)a4, a5).u64[0];
  return result;
}

uint16x8_t *sub_1C9829A48(uint16x8_t *result, uint64_t a2, int16x4_t *a3, const __int16 *a4, int16x4_t *a5, int *a6)
{
  __int16 *v7;
  uint16x8_t *v10;
  int v11;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  int16x4_t *v16;
  uint64_t v17;
  unsigned int v18;
  int32x4_t v19;
  uint16x8_t v20;
  int16x8_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int16x8_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int16x8_t v34;
  int32x4_t v35;
  int16x8_t v36;
  int16x8_t v37;
  int16x8_t v38;
  uint16x8_t *v39;
  uint16x8_t v40;
  uint16x8_t v41;
  uint16x8_t v42;
  char v43;
  int16x8_t *v44;
  char v45;
  int16x8_t v46;
  int16x8_t v47;
  int16x8_t v48;
  int32x4_t v49;
  int32x4_t v50;
  int32x4_t v51;
  int32x4_t v52;
  int v53;
  char v54;
  int16x8_t *v55;
  char v56;
  int16x8_t v57;
  int16x8_t v58;
  int16x8_t v59;
  int32x4_t v60;
  int32x4_t v61;
  int32x4_t v62;
  int32x4_t v63;
  uint64_t v64;
  uint64_t v65;
  uint16x8_t *v66;
  int16x4_t *v67;
  uint64_t v68;
  char v69;
  uint16x8_t v70;
  int32x4_t v71;
  char v72;
  int16x8_t v73;
  int16x8_t v74;
  int16x8_t v75;
  int16x8_t v76;
  int16x8_t v77;
  int16x8_t v78;
  int32x4_t v79;
  int32x4_t v80;
  int32x4_t v81;
  int32x4_t v82;
  int16x8_t v83;
  int16x8_t v84;
  int16x8_t v85;
  int16x8_t v86;
  int16x8_t v87;
  int16x8_t v88;
  int32x4_t v89;
  int32x4_t v90;
  int32x4_t v91;
  int32x4_t v92;
  int16x8_t v93;
  int16x8_t v94;
  int16x8_t v95;
  int16x8_t v96;
  int16x8_t v97;
  int32x4_t v98;
  int32x4_t v99;
  int32x4_t v100;
  int32x4_t v101;
  int32x4_t v102;
  int32x4_t v103;
  int32x4_t v104;
  int16x8_t v105;
  int16x8_t v106;
  int32x4_t v107;
  int32x4_t v108;
  int32x4_t v109;
  int32x4_t v110;
  int32x4_t v111;
  int32x4_t v112;
  int32x4_t v113;
  int16x8_t v114;
  int16x8_t v115;
  int16x8_t v116;
  int16x8_t v117;
  uint16x8_t *v118;
  uint16x8_t *v119;
  uint16x8_t v120;
  uint16x8_t v121;
  uint16x8_t v122;
  uint16x8_t v123;
  uint16x8_t v124;
  uint16x8_t v125;
  uint16x8_t v126;
  uint16x8_t v127;
  uint64_t v128;
  unsigned int v129;
  uint16x8_t v130;
  uint16x8_t *v131;
  uint16x8_t v132;
  uint16x8_t v133;
  uint16x8_t v134;

  v7 = (__int16 *)a4;
  v10 = result;
  v11 = *a6;
  if ((*a6 & 0xFFFEFFFE) != 0)
  {
    if ((__int16)v11 < 1)
    {
      if ((v11 & 0x8000) != 0)
      {
        v43 = 1;
        v44 = (int16x8_t *)a3;
        do
        {
          v45 = v43;
          v46 = v44[1];
          v47 = v44[2];
          v48 = v44[3];
          v49 = (int32x4_t)vtrn1q_s16(*v44, v46);
          v50 = (int32x4_t)vtrn2q_s16(*v44, v46);
          v51 = (int32x4_t)vtrn1q_s16(v47, v48);
          v52 = (int32x4_t)vtrn2q_s16(v47, v48);
          *(int32x4_t *)v44 = vtrn1q_s32(v49, v51);
          v44[1] = (int16x8_t)vtrn1q_s32(v50, v52);
          v44[2] = (int16x8_t)vtrn2q_s32(v49, v51);
          v44[3] = (int16x8_t)vtrn2q_s32(v50, v52);
          v44 += 4;
          v43 = 0;
        }
        while ((v45 & 1) != 0);
      }
    }
    else
    {
      sub_1C98233D4(a3, (unsigned __int16)*a6);
    }
    v53 = *((unsigned __int16 *)a6 + 1);
    if (*((__int16 *)a6 + 1) < 1)
    {
      if ((v53 & 0x8000) != 0)
      {
        v54 = 1;
        v55 = (int16x8_t *)v7;
        do
        {
          v56 = v54;
          v57 = v55[1];
          v58 = v55[2];
          v59 = v55[3];
          v60 = (int32x4_t)vtrn1q_s16(*v55, v57);
          v61 = (int32x4_t)vtrn2q_s16(*v55, v57);
          v62 = (int32x4_t)vtrn1q_s16(v58, v59);
          v63 = (int32x4_t)vtrn2q_s16(v58, v59);
          *(int32x4_t *)v55 = vtrn1q_s32(v60, v62);
          v55[1] = (int16x8_t)vtrn1q_s32(v61, v63);
          v55[2] = (int16x8_t)vtrn2q_s32(v60, v62);
          v55[3] = (int16x8_t)vtrn2q_s32(v61, v63);
          v55 += 4;
          v54 = 0;
        }
        while ((v56 & 1) != 0);
      }
    }
    else
    {
      sub_1C98233D4((int16x4_t *)v7, v53);
    }
    v64 = 2 * a2;
    v65 = 4 * a2;
    v66 = v10 + 1;
    v67 = a3 - 16;
    v68 = 6 * a2;
    v69 = 1;
    v70.i64[0] = 0xF000F000F000F000;
    v70.i64[1] = 0xF000F000F000F000;
    v71.i64[0] = 0xC0000000CLL;
    v71.i64[1] = 0xC0000000CLL;
    do
    {
      v72 = v69;
      v73 = *(int16x8_t *)v67[16].i8;
      v74 = *(int16x8_t *)v67[18].i8;
      v75 = *(int16x8_t *)v67[20].i8;
      v76 = *(int16x8_t *)v67[22].i8;
      v77 = *(int16x8_t *)v7;
      v78 = *((int16x8_t *)v7 + 1);
      v79 = (int32x4_t)vtrn1q_s16(v73, v74);
      v80 = (int32x4_t)vtrn2q_s16(v73, v74);
      v81 = (int32x4_t)vtrn1q_s16(v75, v76);
      v82 = (int32x4_t)vtrn2q_s16(v75, v76);
      v83 = *((int16x8_t *)v7 + 2);
      v84 = *((int16x8_t *)v7 + 3);
      *(_OWORD *)v67[16].i8 = 0uLL;
      *(_OWORD *)v67[18].i8 = 0uLL;
      *(_OWORD *)v67[20].i8 = 0uLL;
      *(_OWORD *)v67[22].i8 = 0uLL;
      v85 = (int16x8_t)vtrn1q_s32(v79, v81);
      v86 = (int16x8_t)vtrn2q_s32(v79, v81);
      v87 = (int16x8_t)vtrn1q_s32(v80, v82);
      v88 = (int16x8_t)vtrn2q_s32(v80, v82);
      v89 = (int32x4_t)vtrn1q_s16(v77, v78);
      v90 = (int32x4_t)vtrn2q_s16(v77, v78);
      v91 = (int32x4_t)vtrn1q_s16(v83, v84);
      v92 = (int32x4_t)vtrn2q_s16(v83, v84);
      v93 = (int16x8_t)vtrn1q_s32(v89, v91);
      v94 = (int16x8_t)vtrn2q_s32(v89, v91);
      v95 = (int16x8_t)vtrn1q_s32(v90, v92);
      v96 = (int16x8_t)vtrn2q_s32(v90, v92);
      *((_OWORD *)v7 + 2) = 0uLL;
      *((_OWORD *)v7 + 3) = 0uLL;
      *(_OWORD *)v7 = 0uLL;
      *((_OWORD *)v7 + 1) = 0uLL;
      if (a5)
      {
        v97 = *(int16x8_t *)v67[2].i8;
        v98 = vdupq_laneq_s32(vsubw_s16(v71, *a5), 2);
        v99 = vshlq_s32(vmovl_s16(*v67), v98);
        v100 = vshlq_s32(vmovl_high_s16(*(int16x8_t *)v67->i8), v98);
        v101 = vshlq_s32(vmovl_s16(*(int16x4_t *)v97.i8), v98);
        v102 = vshlq_s32(vmovl_high_s16(v97), v98);
        v103 = vmovl_s16(vdup_lane_s16(*a5, 0));
        v104 = vmovl_s16(vdup_lane_s16(*a5, 1));
        *(_OWORD *)v67->i8 = 0uLL;
        *(_OWORD *)v67[2].i8 = 0uLL;
        v85 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v99, v103), 3uLL), vmulq_s32(v100, v103), 3uLL), v85);
        v93 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v99, v104), 3uLL), vmulq_s32(v100, v104), 3uLL), v93);
        v87 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v101, v103), 3uLL), vmulq_s32(v102, v103), 3uLL), v87);
        v95 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v101, v104), 3uLL), vmulq_s32(v102, v104), 3uLL), v95);
        v105 = *(int16x8_t *)v67[4].i8;
        v106 = *(int16x8_t *)v67[6].i8;
        v107 = vdupq_laneq_s32(vsubw_s16(v71, *a5), 2);
        v108 = vshlq_s32(vmovl_s16(*(int16x4_t *)v105.i8), v107);
        v109 = vshlq_s32(vmovl_high_s16(v105), v107);
        v110 = vshlq_s32(vmovl_s16(*(int16x4_t *)v106.i8), v107);
        v111 = vshlq_s32(vmovl_high_s16(v106), v107);
        v112 = vmovl_s16(vdup_lane_s16(*a5, 0));
        v113 = vmovl_s16(vdup_lane_s16(*a5, 1));
        *(_OWORD *)v67[4].i8 = 0uLL;
        *(_OWORD *)v67[6].i8 = 0uLL;
        v86 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v112), 3uLL), vmulq_s32(v109, v112), 3uLL), v86);
        v94 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v113), 3uLL), vmulq_s32(v109, v113), 3uLL), v94);
        v88 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v110, v112), 3uLL), vmulq_s32(v111, v112), 3uLL), v88);
        v96 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v110, v113), 3uLL), vmulq_s32(v111, v113), 3uLL), v96);
      }
      v69 = 0;
      v114 = vzip1q_s16(v85, v93);
      v115 = vzip2q_s16(v85, v93);
      v116 = vzip1q_s16(v87, v95);
      v117 = vzip2q_s16(v87, v95);
      v118 = (uint16x8_t *)((char *)v66 + v64);
      v119 = (uint16x8_t *)((char *)v66 + v65);
      result = (uint16x8_t *)((char *)v66 + v68);
      v120 = vsqaddq_u16(v66[-1], v114);
      v121 = *(uint16x8_t *)((char *)v66 + 4 * a2);
      v122 = vsqaddq_u16(*(uint16x8_t *)((char *)&v66[-1] + v64), v116);
      v123 = *(uint16x8_t *)((char *)v66 + 6 * a2);
      v124 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v66[-1] + v65), vzip1q_s16(v86, v94)), v70);
      v125 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v66[-1] + v68), vzip1q_s16(v88, v96)), v70);
      v126 = vminq_u16(vsqaddq_u16(*v66, v115), v70);
      v127 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v66 + 2 * a2), v117), v70);
      v66[-1] = vminq_u16(v120, v70);
      v118[-1] = vminq_u16(v122, v70);
      v119[-1] = v124;
      result[-1] = v125;
      *v66 = v126;
      *v118 = v127;
      *v119 = vminq_u16(vsqaddq_u16(v121, vzip2q_s16(v86, v94)), v70);
      *result = vminq_u16(vsqaddq_u16(v123, vzip2q_s16(v88, v96)), v70);
      v66 = (uint16x8_t *)((char *)v66 + 8 * a2);
      v67 += 8;
      v7 += 32;
    }
    while ((v72 & 1) != 0);
  }
  else
  {
    v13 = vld1q_dup_s16((const __int16 *)a3);
    v14 = vld1q_dup_s16(a4);
    v15 = vrshrq_n_s16(vrshrq_n_s16(vzip1q_s16(v13, v14), 1uLL), 2uLL);
    a3->i16[0] = 0;
    *a4 = 0;
    if (a5)
    {
      v16 = a3 - 16;
      v17 = 2 * a2;
      v18 = -2;
      v19.i64[0] = 0xC0000000CLL;
      v19.i64[1] = 0xC0000000CLL;
      v20.i64[0] = 0xF000F000F000F000;
      v20.i64[1] = 0xF000F000F000F000;
      do
      {
        v21 = *(int16x8_t *)v16[2].i8;
        v22 = vdupq_laneq_s32(vsubw_s16(v19, *a5), 2);
        v23 = vshlq_s32(vmovl_s16(*v16), v22);
        v24 = vshlq_s32(vmovl_high_s16(*(int16x8_t *)v16->i8), v22);
        v25 = vshlq_s32(vmovl_s16(*(int16x4_t *)v21.i8), v22);
        v26 = vshlq_s32(vmovl_high_s16(v21), v22);
        v27 = vmovl_s16(vdup_lane_s16(*a5, 0));
        v28 = vmulq_s32(v25, v27);
        v29 = vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v23, v27), 3uLL), vmulq_s32(v24, v27), 3uLL);
        v30 = vmovl_s16(vdup_lane_s16(*a5, 1));
        v31 = vmulq_s32(v23, v30);
        v32 = vmulq_s32(v24, v30);
        v33 = vmulq_s32(v25, v30);
        v34 = vshrn_high_n_s32(vshrn_n_s32(v28, 3uLL), vmulq_s32(v26, v27), 3uLL);
        v35 = vmulq_s32(v26, v30);
        v36 = vshrn_high_n_s32(vshrn_n_s32(v31, 3uLL), v32, 3uLL);
        v37 = vshrn_high_n_s32(vshrn_n_s32(v33, 3uLL), v35, 3uLL);
        *(_OWORD *)v16->i8 = 0uLL;
        *(_OWORD *)v16[2].i8 = 0uLL;
        v16 += 4;
        v38 = vaddq_s16(vzip1q_s16(v29, v36), v15);
        v39 = (uint16x8_t *)((char *)v10 + v17);
        v40 = vminq_u16(vsqaddq_u16(v10[1], vaddq_s16(vzip2q_s16(v29, v36), v15)), v20);
        v41 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v10 + 2 * a2), vaddq_s16(vzip1q_s16(v34, v37), v15)), v20);
        v42 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v10[1] + v17), vaddq_s16(vzip2q_s16(v34, v37), v15)), v20);
        *v10 = vminq_u16(vsqaddq_u16(*v10, v38), v20);
        v10[1] = v40;
        *v39 = v41;
        v39[1] = v42;
        v18 += 2;
        v10 = (uint16x8_t *)((char *)v10 + 4 * a2);
      }
      while (v18 < 6);
    }
    else
    {
      v128 = 2 * a2;
      v129 = -2;
      v130.i64[0] = 0xF000F000F000F000;
      v130.i64[1] = 0xF000F000F000F000;
      do
      {
        v131 = (uint16x8_t *)((char *)v10 + v128);
        v132 = vminq_u16(vsqaddq_u16(v10[1], v15), v130);
        v133 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v10 + 2 * a2), v15), v130);
        v134 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v10[1] + v128), v15), v130);
        *v10 = vminq_u16(vsqaddq_u16(*v10, v15), v130);
        v10[1] = v132;
        *v131 = v133;
        v131[1] = v134;
        v129 += 2;
        v10 = (uint16x8_t *)((char *)v10 + 4 * a2);
      }
      while (v129 < 6);
    }
  }
  return result;
}

int16x4_t *sub_1C9829F50(int16x4_t *result, uint64_t a2, int16x4_t *a3, const __int16 *a4, int16x4_t *a5, int *a6)
{
  int16x4_t *v7;
  int16x4_t *v8;
  int16x4_t *v10;
  int v11;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  uint16x8_t *v16;
  uint64_t v17;
  uint64_t v18;
  int32x4_t v19;
  uint16x8_t v20;
  int16x4_t *v21;
  int16x8_t v22;
  int16x8_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int16x8_t v30;
  int16x8_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int32x4_t v34;
  int32x4_t v35;
  int32x4_t v36;
  int16x8_t v37;
  int16x8_t v38;
  int16x8_t v39;
  uint16x8_t v40;
  uint16x8_t v41;
  uint16x8_t v42;
  unsigned int v43;
  int16x4_t *v44;
  uint64_t v45;
  char v46;
  char v47;
  int16x8_t *v48;
  int16x8_t v49;
  int16x8_t v50;
  int16x8_t v51;
  int32x4_t v52;
  int32x4_t v53;
  int32x4_t v54;
  int32x4_t v55;
  BOOL v56;
  int v57;
  unsigned int v58;
  int16x4_t *v59;
  uint64_t v60;
  char v61;
  char v62;
  int16x8_t *v63;
  int16x8_t v64;
  int16x8_t v65;
  int16x8_t v66;
  int32x4_t v67;
  int32x4_t v68;
  int32x4_t v69;
  int32x4_t v70;
  unsigned int v71;
  uint16x8_t v72;
  int32x4_t v73;
  uint64_t v74;
  char v75;
  char v76;
  int16x8_t *v77;
  int16x8_t v78;
  int16x8_t v79;
  int16x8_t v80;
  int16x8_t *v81;
  int16x8_t v82;
  int16x8_t v83;
  int16x8_t v84;
  int32x4_t v85;
  int32x4_t v86;
  int32x4_t v87;
  int32x4_t v88;
  int16x8_t v89;
  int16x8_t v90;
  int16x8_t v91;
  int16x8_t v92;
  int16x8_t v93;
  int32x4_t v94;
  int32x4_t v95;
  int32x4_t v96;
  int32x4_t v97;
  int16x8_t v98;
  int16x8_t v99;
  int16x8_t v100;
  int16x8_t v101;
  int16x4_t v102;
  int16x8_t v103;
  int16x8_t v104;
  int32x4_t v105;
  int32x4_t v106;
  int32x4_t v107;
  int32x4_t v108;
  int32x4_t v109;
  int32x4_t v110;
  int32x4_t v111;
  int16x8_t *v112;
  int16x8_t v113;
  int16x8_t *v114;
  int16x8_t v115;
  int32x4_t v116;
  int32x4_t v117;
  int32x4_t v118;
  int32x4_t v119;
  int32x4_t v120;
  int32x4_t v121;
  int32x4_t v122;
  int16x8_t v123;
  int16x8_t v124;
  uint16x8_t *v125;
  uint16x8_t *v126;
  uint16x8_t *v127;
  uint16x8_t *v128;
  uint16x8_t v129;
  uint16x8_t v130;
  uint16x8_t v131;
  uint16x8_t v132;
  uint16x8_t v133;
  uint16x8_t v134;
  uint16x8_t v135;
  uint16x8_t v136;
  int v137;
  uint16x8_t v138;
  uint16x8_t v139;
  uint16x8_t v140;
  uint16x8_t v141;

  v7 = (int16x4_t *)a4;
  v8 = a3;
  v10 = result;
  v11 = *a6;
  if ((*a6 & 0xFFFEFFFE) != 0)
  {
    if ((__int16)v11 < 1)
    {
      if ((v11 & 0x8000) != 0)
      {
        v43 = 0;
        v44 = a3;
        do
        {
          v45 = 0;
          v46 = 1;
          do
          {
            v47 = v46;
            v48 = (int16x8_t *)&v44[v45];
            v49 = v48[2];
            v50 = v48[4];
            v51 = v48[6];
            v52 = (int32x4_t)vtrn1q_s16(*v48, v49);
            v53 = (int32x4_t)vtrn2q_s16(*v48, v49);
            v54 = (int32x4_t)vtrn1q_s16(v50, v51);
            v55 = (int32x4_t)vtrn2q_s16(v50, v51);
            *(int32x4_t *)v48 = vtrn1q_s32(v52, v54);
            v48[2] = (int16x8_t)vtrn1q_s32(v53, v55);
            v48[4] = (int16x8_t)vtrn2q_s32(v52, v54);
            v48[6] = (int16x8_t)vtrn2q_s32(v53, v55);
            v45 = 2;
            v46 = 0;
          }
          while ((v47 & 1) != 0);
          v44 += 16;
          v56 = v43 >= 0xC;
          v43 += 4;
        }
        while (!v56);
      }
    }
    else
    {
      result = sub_1C98231F8(a3, (unsigned __int16)*a6);
    }
    v57 = *((unsigned __int16 *)a6 + 1);
    if (*((__int16 *)a6 + 1) < 1)
    {
      if ((v57 & 0x8000) != 0)
      {
        v58 = 0;
        v59 = v7;
        do
        {
          v60 = 0;
          v61 = 1;
          do
          {
            v62 = v61;
            v63 = (int16x8_t *)&v59[v60];
            v64 = v63[2];
            v65 = v63[4];
            v66 = v63[6];
            v67 = (int32x4_t)vtrn1q_s16(*v63, v64);
            v68 = (int32x4_t)vtrn2q_s16(*v63, v64);
            v69 = (int32x4_t)vtrn1q_s16(v65, v66);
            v70 = (int32x4_t)vtrn2q_s16(v65, v66);
            *(int32x4_t *)v63 = vtrn1q_s32(v67, v69);
            v63[2] = (int16x8_t)vtrn1q_s32(v68, v70);
            v63[4] = (int16x8_t)vtrn2q_s32(v67, v69);
            v63[6] = (int16x8_t)vtrn2q_s32(v68, v70);
            v60 = 2;
            v61 = 0;
          }
          while ((v62 & 1) != 0);
          v59 += 16;
          v56 = v58 >= 0xC;
          v58 += 4;
        }
        while (!v56);
      }
    }
    else
    {
      result = sub_1C98231F8(v7, v57);
    }
    v71 = 0;
    v72.i64[0] = 0xF000F000F000F000;
    v72.i64[1] = 0xF000F000F000F000;
    v73.i64[0] = 0xC0000000CLL;
    v73.i64[1] = 0xC0000000CLL;
    do
    {
      v74 = 0;
      v75 = 1;
      do
      {
        v76 = v75;
        v77 = (int16x8_t *)&v8[(unint64_t)v74 / 2];
        v78 = v77[2];
        v79 = v77[4];
        v80 = v77[6];
        v81 = (int16x8_t *)&v7[(unint64_t)v74 / 2];
        v82 = *v81;
        v83 = v81[2];
        v84 = v81[4];
        v85 = (int32x4_t)vtrn1q_s16(*v77, v78);
        v86 = (int32x4_t)vtrn2q_s16(*v77, v78);
        v87 = (int32x4_t)vtrn1q_s16(v79, v80);
        v88 = (int32x4_t)vtrn2q_s16(v79, v80);
        v89 = v81[6];
        *v77 = 0uLL;
        v77[2] = 0uLL;
        v77[4] = 0uLL;
        v77[6] = 0uLL;
        *v81 = 0uLL;
        v81[2] = 0uLL;
        v81[4] = 0uLL;
        v81[6] = 0uLL;
        v90 = (int16x8_t)vtrn1q_s32(v85, v87);
        v91 = (int16x8_t)vtrn2q_s32(v85, v87);
        v92 = (int16x8_t)vtrn1q_s32(v86, v88);
        v93 = (int16x8_t)vtrn2q_s32(v86, v88);
        v94 = (int32x4_t)vtrn1q_s16(v82, v83);
        v95 = (int32x4_t)vtrn2q_s16(v82, v83);
        v96 = (int32x4_t)vtrn1q_s16(v84, v89);
        v97 = (int32x4_t)vtrn2q_s16(v84, v89);
        v98 = (int16x8_t)vtrn1q_s32(v94, v96);
        v99 = (int16x8_t)vtrn2q_s32(v94, v96);
        v100 = (int16x8_t)vtrn1q_s32(v95, v97);
        v101 = (int16x8_t)vtrn2q_s32(v95, v97);
        if (a5)
        {
          v102 = *a5;
          v103 = v77[-32];
          v104 = v77[-30];
          v77[-32] = 0uLL;
          v77[-30] = 0uLL;
          v105 = vdupq_laneq_s32(vsubw_s16(v73, v102), 2);
          v106 = vshlq_s32(vmovl_s16(*(int16x4_t *)v103.i8), v105);
          v107 = vshlq_s32(vmovl_high_s16(v103), v105);
          v108 = vshlq_s32(vmovl_s16(*(int16x4_t *)v104.i8), v105);
          v109 = vshlq_s32(vmovl_high_s16(v104), v105);
          v110 = vmovl_s16(vdup_lane_s16(v102, 0));
          v111 = vmovl_s16(vdup_lane_s16(v102, 1));
          v90 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v106, v110), 3uLL), vmulq_s32(v107, v110), 3uLL), v90);
          v98 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v106, v111), 3uLL), vmulq_s32(v107, v111), 3uLL), v98);
          v92 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v110), 3uLL), vmulq_s32(v109, v110), 3uLL), v92);
          v100 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v111), 3uLL), vmulq_s32(v109, v111), 3uLL), v100);
          v112 = v77 - 28;
          *(int16x4_t *)v111.i8 = *a5;
          v113 = v77[-28];
          v114 = v77 - 26;
          v115 = *v114;
          *v112 = 0uLL;
          *v114 = 0uLL;
          v116 = vdupq_laneq_s32(vsubw_s16(v73, *(int16x4_t *)v111.i8), 2);
          v117 = vshlq_s32(vmovl_s16(*(int16x4_t *)v113.i8), v116);
          v118 = vshlq_s32(vmovl_high_s16(v113), v116);
          v119 = vshlq_s32(vmovl_s16(*(int16x4_t *)v115.i8), v116);
          v120 = vshlq_s32(vmovl_high_s16(v115), v116);
          v121 = vmovl_s16(vdup_lane_s16(*(int16x4_t *)v111.i8, 0));
          v122 = vmovl_s16(vdup_lane_s16(*(int16x4_t *)v111.i8, 1));
          v91 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v117, v121), 3uLL), vmulq_s32(v118, v121), 3uLL), v91);
          v99 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v117, v122), 3uLL), vmulq_s32(v118, v122), 3uLL), v99);
          v93 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v119, v121), 3uLL), vmulq_s32(v120, v121), 3uLL), v93);
          v101 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v119, v122), 3uLL), vmulq_s32(v120, v122), 3uLL), v101);
        }
        v75 = 0;
        v123 = vzip1q_s16(v90, v98);
        v124 = vzip2q_s16(v90, v98);
        v125 = (uint16x8_t *)&v10[v74];
        v126 = (uint16x8_t *)((char *)v125 + 2 * a2);
        v127 = (uint16x8_t *)((char *)v125 + 4 * a2);
        v128 = (uint16x8_t *)((char *)v125 + 6 * a2);
        v129 = v126[1];
        v130 = vsqaddq_u16(*v125, v123);
        v131 = v127[1];
        v132 = v128[1];
        v133 = vminq_u16(vsqaddq_u16(*v126, vzip1q_s16(v92, v100)), v72);
        v134 = vminq_u16(vsqaddq_u16(*v127, vzip1q_s16(v91, v99)), v72);
        v135 = vminq_u16(vsqaddq_u16(*v128, vzip1q_s16(v93, v101)), v72);
        v136 = vminq_u16(vsqaddq_u16(v125[1], v124), v72);
        *v125 = vminq_u16(v130, v72);
        *v126 = v133;
        *v127 = v134;
        *v128 = v135;
        v125[1] = v136;
        v126[1] = vminq_u16(vsqaddq_u16(v129, vzip2q_s16(v92, v100)), v72);
        v127[1] = vminq_u16(vsqaddq_u16(v131, vzip2q_s16(v91, v99)), v72);
        v128[1] = vminq_u16(vsqaddq_u16(v132, vzip2q_s16(v93, v101)), v72);
        v74 = 4;
      }
      while ((v76 & 1) != 0);
      v10 += a2;
      v8 += 16;
      v7 += 16;
      v56 = v71 >= 0xC;
      v71 += 4;
    }
    while (!v56);
  }
  else
  {
    v13 = vld1q_dup_s16((const __int16 *)a3);
    v14 = vld1q_dup_s16(a4);
    v15 = vrshrq_n_s16(vrshrq_n_s16(vzip1q_s16(v13, v14), 1uLL), 2uLL);
    a3->i16[0] = 0;
    *a4 = 0;
    v16 = (uint16x8_t *)&result[4];
    v17 = 2 * a2;
    if (a5)
    {
      v18 = 0x1FFFFFFFFFFFFFC0;
      v19.i64[0] = 0xC0000000CLL;
      v19.i64[1] = 0xC0000000CLL;
      v20.i64[0] = 0xF000F000F000F000;
      v20.i64[1] = 0xF000F000F000F000;
      do
      {
        v21 = &a3[v18];
        v22 = *(int16x8_t *)a3[v18].i8;
        v23 = *(int16x8_t *)a3[v18 + 2].i8;
        v24 = vdupq_laneq_s32(vsubw_s16(v19, *a5), 2);
        v25 = vshlq_s32(vmovl_s16(*(int16x4_t *)v22.i8), v24);
        v26 = vshlq_s32(vmovl_high_s16(v22), v24);
        v27 = vshlq_s32(vmovl_s16(*(int16x4_t *)v23.i8), v24);
        v28 = vshlq_s32(vmovl_high_s16(v23), v24);
        v29 = vmovl_s16(vdup_lane_s16(*a5, 0));
        v30 = vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v25, v29), 3uLL), vmulq_s32(v26, v29), 3uLL);
        v31 = vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v27, v29), 3uLL), vmulq_s32(v28, v29), 3uLL);
        v32 = vmovl_s16(vdup_lane_s16(*a5, 1));
        v33 = vmulq_s32(v25, v32);
        v34 = vmulq_s32(v26, v32);
        v35 = vmulq_s32(v27, v32);
        v36 = vmulq_s32(v28, v32);
        v37 = vshrn_high_n_s32(vshrn_n_s32(v33, 3uLL), v34, 3uLL);
        v38 = vshrn_high_n_s32(vshrn_n_s32(v35, 3uLL), v36, 3uLL);
        *(_OWORD *)v21->i8 = 0uLL;
        *(_OWORD *)v21[2].i8 = 0uLL;
        v39 = vaddq_s16(vzip1q_s16(v30, v37), v15);
        v40 = vminq_u16(vsqaddq_u16(v16[-1], vaddq_s16(vzip2q_s16(v30, v37), v15)), v20);
        v41 = vminq_u16(vsqaddq_u16(*v16, vaddq_s16(vzip1q_s16(v31, v38), v15)), v20);
        v42 = vsqaddq_u16(v16[1], vaddq_s16(vzip2q_s16(v31, v38), v15));
        v16[-2] = vminq_u16(vsqaddq_u16(v16[-2], v39), v20);
        v16[-1] = v40;
        *v16 = v41;
        v16[1] = vminq_u16(v42, v20);
        v16 = (uint16x8_t *)((char *)v16 + v17);
        v18 += 4;
      }
      while ((_DWORD)(v18 * 8));
    }
    else
    {
      v137 = 16;
      v138.i64[0] = 0xF000F000F000F000;
      v138.i64[1] = 0xF000F000F000F000;
      do
      {
        v139 = vminq_u16(vsqaddq_u16(v16[-1], v15), v138);
        v140 = vminq_u16(vsqaddq_u16(*v16, v15), v138);
        v141 = vminq_u16(vsqaddq_u16(v16[1], v15), v138);
        v16[-2] = vminq_u16(vsqaddq_u16(v16[-2], v15), v138);
        v16[-1] = v139;
        *v16 = v140;
        v16[1] = v141;
        v16 = (uint16x8_t *)((char *)v16 + v17);
        --v137;
      }
      while (v137);
    }
  }
  return result;
}

uint16x8_t *sub_1C982A4F8(uint16x8_t *result, uint64_t a2, int16x4_t *a3, const __int16 *a4, int16x4_t *a5, int *a6)
{
  int16x4_t *v7;
  int16x4_t *v8;
  uint16x8_t *v10;
  int v11;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  int v16;
  int16x4_t *v17;
  int32x4_t v18;
  uint16x8_t v19;
  uint64_t v20;
  char v21;
  int16x8_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int16x8_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int32x4_t v34;
  int16x8_t v35;
  int32x4_t v36;
  int16x8_t v37;
  int16x8_t v38;
  char v39;
  int16x8_t v40;
  uint16x8_t *v41;
  uint16x8_t v42;
  uint16x8_t v43;
  uint16x8_t v44;
  unsigned int v45;
  int16x4_t *v46;
  unint64_t v47;
  int16x8_t *v48;
  int16x8_t v49;
  int16x8_t v50;
  int16x8_t v51;
  int32x4_t v52;
  int32x4_t v53;
  int32x4_t v54;
  int32x4_t v55;
  BOOL v56;
  int v57;
  unsigned int v58;
  int16x4_t *v59;
  unint64_t v60;
  int16x8_t *v61;
  int16x8_t v62;
  int16x8_t v63;
  int16x8_t v64;
  int32x4_t v65;
  int32x4_t v66;
  int32x4_t v67;
  int32x4_t v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint16x8_t v73;
  int32x4_t v74;
  uint64_t v75;
  unint64_t v76;
  uint16x8_t *v77;
  int16x8_t *v78;
  int16x8_t v79;
  int16x8_t v80;
  int16x8_t v81;
  int16x8_t v82;
  int16x4_t *v83;
  int16x8_t v84;
  int16x8_t v85;
  int16x8_t v86;
  int32x4_t v87;
  int32x4_t v88;
  int32x4_t v89;
  int32x4_t v90;
  int16x8_t v91;
  int16x8_t v92;
  int16x8_t v93;
  int16x8_t v94;
  int16x8_t v95;
  int32x4_t v96;
  int32x4_t v97;
  int32x4_t v98;
  int32x4_t v99;
  int16x8_t v100;
  int16x8_t v101;
  int16x8_t v102;
  int16x8_t v103;
  int16x4_t v104;
  int16x8_t v105;
  int16x8_t v106;
  int32x4_t v107;
  int32x4_t v108;
  int32x4_t v109;
  int32x4_t v110;
  int32x4_t v111;
  int32x4_t v112;
  int32x4_t v113;
  int16x8_t *v114;
  int16x8_t v115;
  int16x8_t *v116;
  int16x8_t v117;
  int32x4_t v118;
  int32x4_t v119;
  int32x4_t v120;
  int32x4_t v121;
  int32x4_t v122;
  int32x4_t v123;
  int32x4_t v124;
  int16x8_t v125;
  int16x8_t v126;
  int16x8_t v127;
  int16x8_t v128;
  int16x8_t v129;
  int16x8_t v130;
  int16x8_t v131;
  int16x8_t v132;
  uint16x8_t *v133;
  uint16x8_t *v134;
  uint16x8_t v135;
  uint16x8_t v136;
  uint16x8_t v137;
  uint16x8_t v138;
  uint16x8_t v139;
  uint16x8_t v140;
  uint16x8_t v141;
  uint16x8_t *v142;
  int v143;
  uint16x8_t v144;
  uint16x8_t v145;
  uint16x8_t v146;
  uint16x8_t v147;
  uint16x8_t v148;
  uint16x8_t v149;
  uint16x8_t v150;

  v7 = (int16x4_t *)a4;
  v8 = a3;
  v10 = result;
  v11 = *a6;
  if ((*a6 & 0xFFFEFFFE) != 0)
  {
    if ((__int16)v11 < 1)
    {
      if ((v11 & 0x8000) != 0)
      {
        v45 = 0;
        v46 = a3 + 16;
        do
        {
          v47 = -8;
          v48 = (int16x8_t *)v46;
          do
          {
            v49 = v48[-8];
            v50 = v48[-4];
            v51 = v48[4];
            v52 = (int32x4_t)vtrn1q_s16(v49, v50);
            v53 = (int32x4_t)vtrn2q_s16(v49, v50);
            v54 = (int32x4_t)vtrn1q_s16(*v48, v51);
            v55 = (int32x4_t)vtrn2q_s16(*v48, v51);
            v48[-8] = (int16x8_t)vtrn1q_s32(v52, v54);
            v48[-4] = (int16x8_t)vtrn1q_s32(v53, v55);
            *(int32x4_t *)v48 = vtrn2q_s32(v52, v54);
            v48[4] = (int16x8_t)vtrn2q_s32(v53, v55);
            v47 += 8;
            ++v48;
          }
          while (v47 < 0x18);
          v46 += 32;
          v56 = v45 >= 0x1C;
          v45 += 4;
        }
        while (!v56);
      }
    }
    else
    {
      sub_1C98228D0(a3, (unsigned __int16)*a6);
    }
    v57 = *((unsigned __int16 *)a6 + 1);
    if (*((__int16 *)a6 + 1) < 1)
    {
      if ((v57 & 0x8000) != 0)
      {
        v58 = 0;
        v59 = v7 + 16;
        do
        {
          v60 = -8;
          v61 = (int16x8_t *)v59;
          do
          {
            v62 = v61[-8];
            v63 = v61[-4];
            v64 = v61[4];
            v65 = (int32x4_t)vtrn1q_s16(v62, v63);
            v66 = (int32x4_t)vtrn2q_s16(v62, v63);
            v67 = (int32x4_t)vtrn1q_s16(*v61, v64);
            v68 = (int32x4_t)vtrn2q_s16(*v61, v64);
            v61[-8] = (int16x8_t)vtrn1q_s32(v65, v67);
            v61[-4] = (int16x8_t)vtrn1q_s32(v66, v68);
            *(int32x4_t *)v61 = vtrn2q_s32(v65, v67);
            v61[4] = (int16x8_t)vtrn2q_s32(v66, v68);
            v60 += 8;
            ++v61;
          }
          while (v60 < 0x18);
          v59 += 32;
          v56 = v58 >= 0x1C;
          v58 += 4;
        }
        while (!v56);
      }
    }
    else
    {
      sub_1C98228D0(v7, v57);
    }
    v69 = 0;
    v70 = 2 * a2;
    v71 = 6 * a2 + 16;
    v72 = 4 * a2 + 16;
    v73.i64[0] = 0xF000F000F000F000;
    v73.i64[1] = 0xF000F000F000F000;
    v74.i64[0] = 0xC0000000CLL;
    v74.i64[1] = 0xC0000000CLL;
    do
    {
      v75 = 0;
      v76 = -8;
      v77 = v10;
      do
      {
        v78 = (int16x8_t *)&v8[v75];
        v79 = *(int16x8_t *)v8[v75].i8;
        v80 = *(int16x8_t *)v8[v75 + 8].i8;
        v81 = *(int16x8_t *)v8[v75 + 16].i8;
        v82 = *(int16x8_t *)v8[v75 + 24].i8;
        v83 = &v7[v75];
        v84 = *(int16x8_t *)v7[v75].i8;
        v85 = *(int16x8_t *)v7[v75 + 8].i8;
        v86 = *(int16x8_t *)v7[v75 + 16].i8;
        v87 = (int32x4_t)vtrn1q_s16(v79, v80);
        v88 = (int32x4_t)vtrn2q_s16(v79, v80);
        v89 = (int32x4_t)vtrn1q_s16(v81, v82);
        v90 = (int32x4_t)vtrn2q_s16(v81, v82);
        v91 = *(int16x8_t *)v7[v75 + 24].i8;
        *v78 = 0uLL;
        v78[4] = 0uLL;
        v78[8] = 0uLL;
        v78[12] = 0uLL;
        *(_OWORD *)v83->i8 = 0uLL;
        *(_OWORD *)v83[8].i8 = 0uLL;
        *(_OWORD *)v83[16].i8 = 0uLL;
        *(_OWORD *)v83[24].i8 = 0uLL;
        v92 = (int16x8_t)vtrn1q_s32(v87, v89);
        v93 = (int16x8_t)vtrn2q_s32(v87, v89);
        v94 = (int16x8_t)vtrn1q_s32(v88, v90);
        v95 = (int16x8_t)vtrn2q_s32(v88, v90);
        v96 = (int32x4_t)vtrn1q_s16(v84, v85);
        v97 = (int32x4_t)vtrn2q_s16(v84, v85);
        v98 = (int32x4_t)vtrn1q_s16(v86, v91);
        v99 = (int32x4_t)vtrn2q_s16(v86, v91);
        v100 = (int16x8_t)vtrn1q_s32(v96, v98);
        v101 = (int16x8_t)vtrn2q_s32(v96, v98);
        v102 = (int16x8_t)vtrn1q_s32(v97, v99);
        v103 = (int16x8_t)vtrn2q_s32(v97, v99);
        if (a5)
        {
          v104 = *a5;
          v105 = v78[-128];
          v106 = v78[-124];
          v78[-128] = 0uLL;
          v78[-124] = 0uLL;
          v107 = vdupq_laneq_s32(vsubw_s16(v74, v104), 2);
          v108 = vshlq_s32(vmovl_s16(*(int16x4_t *)v105.i8), v107);
          v109 = vshlq_s32(vmovl_high_s16(v105), v107);
          v110 = vshlq_s32(vmovl_s16(*(int16x4_t *)v106.i8), v107);
          v111 = vshlq_s32(vmovl_high_s16(v106), v107);
          v112 = vmovl_s16(vdup_lane_s16(v104, 0));
          v113 = vmovl_s16(vdup_lane_s16(v104, 1));
          v92 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v112), 3uLL), vmulq_s32(v109, v112), 3uLL), v92);
          v100 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v108, v113), 3uLL), vmulq_s32(v109, v113), 3uLL), v100);
          v94 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v110, v112), 3uLL), vmulq_s32(v111, v112), 3uLL), v94);
          v102 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v110, v113), 3uLL), vmulq_s32(v111, v113), 3uLL), v102);
          v114 = v78 - 120;
          *(int16x4_t *)v113.i8 = *a5;
          v115 = v78[-120];
          v116 = v78 - 116;
          v117 = *v116;
          *v114 = 0uLL;
          *v116 = 0uLL;
          v118 = vdupq_laneq_s32(vsubw_s16(v74, *(int16x4_t *)v113.i8), 2);
          v119 = vshlq_s32(vmovl_s16(*(int16x4_t *)v115.i8), v118);
          v120 = vshlq_s32(vmovl_high_s16(v115), v118);
          v121 = vshlq_s32(vmovl_s16(*(int16x4_t *)v117.i8), v118);
          v122 = vshlq_s32(vmovl_high_s16(v117), v118);
          v123 = vmovl_s16(vdup_lane_s16(*(int16x4_t *)v113.i8, 0));
          v124 = vmovl_s16(vdup_lane_s16(*(int16x4_t *)v113.i8, 1));
          v93 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v119, v123), 3uLL), vmulq_s32(v120, v123), 3uLL), v93);
          v101 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v119, v124), 3uLL), vmulq_s32(v120, v124), 3uLL), v101);
          v95 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v121, v123), 3uLL), vmulq_s32(v122, v123), 3uLL), v95);
          v103 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v121, v124), 3uLL), vmulq_s32(v122, v124), 3uLL), v103);
        }
        v125 = vzip1q_s16(v92, v100);
        v126 = vzip2q_s16(v92, v100);
        v127 = vzip1q_s16(v94, v102);
        v128 = vzip2q_s16(v94, v102);
        v129 = vzip1q_s16(v93, v101);
        v130 = vzip2q_s16(v93, v101);
        v131 = vzip1q_s16(v95, v103);
        v132 = vzip2q_s16(v95, v103);
        v133 = (uint16x8_t *)((char *)v77 + v70);
        v134 = (uint16x8_t *)((char *)v77 + v72);
        result = (uint16x8_t *)((char *)v77 + v71);
        v135 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v77 + 2 * a2), v127), v73);
        v136 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v77 + 4 * a2), v129), v73);
        v137 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v77 + 6 * a2), v131), v73);
        v138 = vminq_u16(vsqaddq_u16(v77[1], v126), v73);
        v139 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v77[1] + v70), v128), v73);
        v140 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v77 + v72), v130), v73);
        v141 = vsqaddq_u16(*(uint16x8_t *)((char *)v77 + v71), v132);
        *v77 = vminq_u16(vsqaddq_u16(*v77, v125), v73);
        *v133 = v135;
        v134[-1] = v136;
        result[-1] = v137;
        v77[1] = v138;
        v133[1] = v139;
        *v134 = v140;
        *result = vminq_u16(v141, v73);
        v76 += 8;
        v75 += 2;
        v77 += 2;
      }
      while (v76 < 0x18);
      v8 += 32;
      v7 += 32;
      v10 = (uint16x8_t *)((char *)v10 + 8 * a2);
      v56 = v69 >= 0x1C;
      v69 += 4;
    }
    while (!v56);
  }
  else
  {
    v13 = vld1q_dup_s16((const __int16 *)a3);
    v14 = vld1q_dup_s16(a4);
    v15 = vrshrq_n_s16(vrshrq_n_s16(vzip1q_s16(v13, v14), 1uLL), 2uLL);
    a3->i16[0] = 0;
    *a4 = 0;
    if (a5)
    {
      v16 = 0;
      v17 = a3 - 256;
      v18.i64[0] = 0xC0000000CLL;
      v18.i64[1] = 0xC0000000CLL;
      v19.i64[0] = 0xF000F000F000F000;
      v19.i64[1] = 0xF000F000F000F000;
      do
      {
        v20 = 0;
        v21 = 1;
        do
        {
          v22 = *(int16x8_t *)v17[2].i8;
          v23 = vdupq_laneq_s32(vsubw_s16(v18, *a5), 2);
          v24 = vshlq_s32(vmovl_s16(*v17), v23);
          v25 = vshlq_s32(vmovl_high_s16(*(int16x8_t *)v17->i8), v23);
          v26 = vshlq_s32(vmovl_s16(*(int16x4_t *)v22.i8), v23);
          v27 = vshlq_s32(vmovl_high_s16(v22), v23);
          v28 = vmovl_s16(vdup_lane_s16(*a5, 0));
          v29 = vmulq_s32(v26, v28);
          v30 = vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v24, v28), 3uLL), vmulq_s32(v25, v28), 3uLL);
          v31 = vmovl_s16(vdup_lane_s16(*a5, 1));
          v32 = vmulq_s32(v24, v31);
          v33 = vmulq_s32(v25, v31);
          v34 = vmulq_s32(v26, v31);
          v35 = vshrn_high_n_s32(vshrn_n_s32(v29, 3uLL), vmulq_s32(v27, v28), 3uLL);
          v36 = vmulq_s32(v27, v31);
          v37 = vshrn_high_n_s32(vshrn_n_s32(v32, 3uLL), v33, 3uLL);
          v38 = vshrn_high_n_s32(vshrn_n_s32(v34, 3uLL), v36, 3uLL);
          v39 = v21;
          *(_OWORD *)v17->i8 = 0uLL;
          *(_OWORD *)v17[2].i8 = 0uLL;
          v17 += 4;
          v40 = vzip1q_s16(v30, v37);
          v41 = &v10[v20];
          v42 = vminq_u16(vsqaddq_u16(v41[1], vaddq_s16(vzip2q_s16(v30, v37), v15)), v19);
          v43 = vminq_u16(vsqaddq_u16(v41[2], vaddq_s16(vzip1q_s16(v35, v38), v15)), v19);
          v44 = vsqaddq_u16(v41[3], vaddq_s16(vzip2q_s16(v35, v38), v15));
          *v41 = vminq_u16(vsqaddq_u16(*v41, vaddq_s16(v40, v15)), v19);
          v41[1] = v42;
          v41[2] = v43;
          v41[3] = vminq_u16(v44, v19);
          v20 = 4;
          v21 = 0;
        }
        while ((v39 & 1) != 0);
        ++v16;
        v10 = (uint16x8_t *)((char *)v10 + 2 * a2);
      }
      while (v16 != 32);
    }
    else
    {
      v142 = result + 4;
      v143 = 32;
      v144.i64[0] = 0xF000F000F000F000;
      v144.i64[1] = 0xF000F000F000F000;
      do
      {
        v145 = vminq_u16(vsqaddq_u16(v142[-3], v15), v144);
        v146 = vminq_u16(vsqaddq_u16(v142[-2], v15), v144);
        v147 = vminq_u16(vsqaddq_u16(v142[-1], v15), v144);
        v142[-4] = vminq_u16(vsqaddq_u16(v142[-4], v15), v144);
        v142[-3] = v145;
        v142[-2] = v146;
        v142[-1] = v147;
        v148 = vminq_u16(vsqaddq_u16(v142[1], v15), v144);
        v149 = vminq_u16(vsqaddq_u16(v142[2], v15), v144);
        v150 = vminq_u16(vsqaddq_u16(v142[3], v15), v144);
        *v142 = vminq_u16(vsqaddq_u16(*v142, v15), v144);
        v142[1] = v148;
        v142[2] = v149;
        v142[3] = v150;
        v142 = (uint16x8_t *)((char *)v142 + 2 * a2);
        --v143;
      }
      while (v143);
    }
  }
  return result;
}

uint16x8_t sub_1C982AAFC(uint16x8_t *a1, uint64_t a2, int16x8_t *a3, int16x8_t *a4, int16x4_t *a5)
{
  int16x8_t v5;
  int16x8_t v6;
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  int16x8_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int16x8_t v19;
  int16x8_t v20;
  int16x8_t v21;
  int16x8_t v22;
  uint16x8_t v23;
  uint16x8_t v24;
  uint16x8_t v25;
  uint16x8_t v26;
  uint16x8_t result;

  v6 = *a3;
  v5 = a3[1];
  v8 = *a4;
  v7 = a4[1];
  if (a5)
  {
    v9 = a3[-2];
    v10 = a3[-1];
    v11.i64[0] = 0xC0000000CLL;
    v11.i64[1] = 0xC0000000CLL;
    v12 = vdupq_laneq_s32(vsubw_s16(v11, *a5), 2);
    v13 = vshlq_s32(vmovl_s16(*(int16x4_t *)v9.i8), v12);
    v14 = vshlq_s32(vmovl_high_s16(v9), v12);
    v15 = vshlq_s32(vmovl_s16(*(int16x4_t *)v10.i8), v12);
    v16 = vshlq_s32(vmovl_high_s16(v10), v12);
    v17 = vmovl_s16(vdup_lane_s16(*a5, 0));
    v18 = vmovl_s16(vdup_lane_s16(*a5, 1));
    v6 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v13, v17), 3uLL), vmulq_s32(v14, v17), 3uLL), v6);
    v5 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v15, v17), 3uLL), vmulq_s32(v16, v17), 3uLL), v5);
    v8 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v13, v18), 3uLL), vmulq_s32(v14, v18), 3uLL), v8);
    v7 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v15, v18), 3uLL), vmulq_s32(v16, v18), 3uLL), v7);
    a3[-2] = 0u;
    a3[-1] = 0u;
  }
  *a3 = 0u;
  a3[1] = 0u;
  v19 = vzip1q_s16(v6, v8);
  v20 = vzip2q_s16(v6, v8);
  v21 = vzip1q_s16(v5, v7);
  v22 = vzip2q_s16(v5, v7);
  *a4 = 0u;
  a4[1] = 0u;
  v23 = *(uint16x8_t *)((char *)a1 + 6 * a2);
  v24 = vsqaddq_u16(*a1, v19);
  v19.i64[0] = 0xF000F000F000F000;
  v19.i64[1] = 0xF000F000F000F000;
  v25 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)a1 + 2 * a2), v20), (uint16x8_t)v19);
  v26 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)a1 + 4 * a2), v21), (uint16x8_t)v19);
  *a1 = vminq_u16(v24, (uint16x8_t)v19);
  *(uint16x8_t *)((char *)a1 + 2 * a2) = v25;
  result = vminq_u16(vsqaddq_u16(v23, v22), (uint16x8_t)v19);
  *(uint16x8_t *)((char *)a1 + 4 * a2) = v26;
  *(uint16x8_t *)((char *)a1 + 6 * a2) = result;
  return result;
}

uint16x8_t *sub_1C982AC18(uint16x8_t *result, uint64_t a2, uint64_t a3, int16x8_t *a4, int16x4_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint16x8_t *v7;
  uint16x8_t v8;
  int32x4_t v9;
  unsigned int v10;
  int16x8_t v11;
  int16x8_t v12;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int16x8_t v23;
  uint16x8_t *v24;
  uint16x8_t v25;
  uint16x8_t v26;
  uint16x8_t v27;

  v5 = 2 * a2;
  v6 = a3 - 128;
  v7 = result + 1;
  v8.i64[0] = 0xF000F000F000F000;
  v8.i64[1] = 0xF000F000F000F000;
  v9.i64[0] = 0xC0000000CLL;
  v9.i64[1] = 0xC0000000CLL;
  v10 = -2;
  do
  {
    v12 = *(int16x8_t *)(v6 + 128);
    v11 = *(int16x8_t *)(v6 + 144);
    v14 = *a4;
    v13 = a4[1];
    if (a5)
    {
      v15 = *(int16x8_t *)(v6 + 16);
      v16 = vdupq_laneq_s32(vsubw_s16(v9, *a5), 2);
      v17 = vshlq_s32(vmovl_s16(*(int16x4_t *)v6), v16);
      v18 = vshlq_s32(vmovl_high_s16(*(int16x8_t *)v6), v16);
      v19 = vshlq_s32(vmovl_s16(*(int16x4_t *)v15.i8), v16);
      v20 = vshlq_s32(vmovl_high_s16(v15), v16);
      v21 = vmovl_s16(vdup_lane_s16(*a5, 0));
      v22 = vmovl_s16(vdup_lane_s16(*a5, 1));
      v12 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v17, v21), 3uLL), vmulq_s32(v18, v21), 3uLL), v12);
      v11 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v19, v21), 3uLL), vmulq_s32(v20, v21), 3uLL), v11);
      v14 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v17, v22), 3uLL), vmulq_s32(v18, v22), 3uLL), v14);
      v13 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v19, v22), 3uLL), vmulq_s32(v20, v22), 3uLL), v13);
      *(_OWORD *)v6 = 0uLL;
      *(_OWORD *)(v6 + 16) = 0uLL;
    }
    *(_OWORD *)(v6 + 128) = 0uLL;
    *(_OWORD *)(v6 + 144) = 0uLL;
    v23 = vzip1q_s16(v12, v14);
    *a4 = 0uLL;
    a4[1] = 0uLL;
    a4 += 2;
    v24 = (uint16x8_t *)((char *)v7 + v5);
    v25 = vminq_u16(vsqaddq_u16(*v7, vzip2q_s16(v12, v14)), v8);
    v26 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)&v7[-1] + v5), vzip1q_s16(v11, v13)), v8);
    v27 = vminq_u16(vsqaddq_u16(*(uint16x8_t *)((char *)v7 + 2 * a2), vzip2q_s16(v11, v13)), v8);
    v7[-1] = vminq_u16(vsqaddq_u16(v7[-1], v23), v8);
    *v7 = v25;
    v10 += 2;
    v24[-1] = v26;
    *v24 = v27;
    v6 += 32;
    v7 = (uint16x8_t *)((char *)v7 + 4 * a2);
  }
  while (v10 < 6);
  return result;
}

uint16x8_t *sub_1C982AD40(uint16x8_t *result, uint64_t a2, uint64_t a3, uint64_t a4, int16x4_t *a5)
{
  uint64_t v5;
  uint16x8_t *v6;
  uint16x8_t v7;
  int32x4_t v8;
  _OWORD *v9;
  int16x8_t *v10;
  int16x8_t v11;
  int16x8_t v12;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t *v15;
  int16x8_t v16;
  int16x8_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int16x8_t v25;
  uint16x8_t v26;
  uint16x8_t v27;
  uint16x8_t v28;

  v5 = 0;
  v6 = result + 2;
  v7.i64[0] = 0xF000F000F000F000;
  v7.i64[1] = 0xF000F000F000F000;
  v8.i64[0] = 0xC0000000CLL;
  v8.i64[1] = 0xC0000000CLL;
  do
  {
    v9 = (_OWORD *)(a4 + v5);
    v10 = (int16x8_t *)(a3 + v5);
    v12 = *(int16x8_t *)(a3 + v5);
    v11 = *(int16x8_t *)(a3 + v5 + 16);
    v14 = *(int16x8_t *)(a4 + v5);
    v13 = *(int16x8_t *)(a4 + v5 + 16);
    if (a5)
    {
      v15 = v10 - 32;
      v16 = v10[-32];
      v17 = v10[-31];
      v18 = vdupq_laneq_s32(vsubw_s16(v8, *a5), 2);
      v19 = vshlq_s32(vmovl_s16(*(int16x4_t *)v16.i8), v18);
      v20 = vshlq_s32(vmovl_high_s16(v16), v18);
      v21 = vshlq_s32(vmovl_s16(*(int16x4_t *)v17.i8), v18);
      v22 = vshlq_s32(vmovl_high_s16(v17), v18);
      v23 = vmovl_s16(vdup_lane_s16(*a5, 0));
      v24 = vmovl_s16(vdup_lane_s16(*a5, 1));
      v12 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v19, v23), 3uLL), vmulq_s32(v20, v23), 3uLL), v12);
      v11 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v21, v23), 3uLL), vmulq_s32(v22, v23), 3uLL), v11);
      v14 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v19, v24), 3uLL), vmulq_s32(v20, v24), 3uLL), v14);
      v13 = vaddq_s16(vshrn_high_n_s32(vshrn_n_s32(vmulq_s32(v21, v24), 3uLL), vmulq_s32(v22, v24), 3uLL), v13);
      *v15 = 0uLL;
      v15[1] = 0uLL;
    }
    *v10 = 0uLL;
    v10[1] = 0uLL;
    v25 = vzip1q_s16(v12, v14);
    *v9 = 0uLL;
    v9[1] = 0uLL;
    v26 = vminq_u16(vsqaddq_u16(v6[-1], vzip2q_s16(v12, v14)), v7);
    v27 = vminq_u16(vsqaddq_u16(*v6, vzip1q_s16(v11, v13)), v7);
    v28 = vminq_u16(vsqaddq_u16(v6[1], vzip2q_s16(v11, v13)), v7);
    v6[-2] = vminq_u16(vsqaddq_u16(v6[-2], v25), v7);
    v6[-1] = v26;
    *v6 = v27;
    v6[1] = v28;
    v5 += 32;
    v6 = (uint16x8_t *)((char *)v6 + 2 * a2);
  }
  while ((_DWORD)v5 != 512);
  return result;
}

uint64_t sub_1C982AE68(uint64_t a1, uint64_t a2, int a3, int a4, _DWORD *a5, _DWORD *a6)
{
  int v7;
  uint64_t result;
  uint64_t i;
  uint8x8_t v10;
  uint8x8_t *v11;
  uint8x8_t v12;
  uint8x8_t *v13;
  uint8x8_t *v14;
  uint8x8_t *v15;
  uint8x8_t v16;
  uint8x8_t v17;
  uint8x8_t *v18;
  uint8x8_t v19;
  int16x8_t v20;
  int16x8_t v21;
  uint16x8_t v22;
  uint16x8_t v23;
  uint16x8_t v24;

  if (a4 < 1)
    return 0;
  v7 = 0;
  result = 0;
  do
  {
    if (a3 >= 1)
    {
      for (i = 0; i < a3; i += 8)
      {
        v10 = *(uint8x8_t *)(a1 + i);
        v11 = (uint8x8_t *)(a1 + i + a2);
        v12 = *v11;
        v13 = (uint8x8_t *)((char *)v11 + a2);
        v14 = (uint8x8_t *)((char *)v13 + a2);
        v15 = (uint8x8_t *)((char *)v13 + a2 + a2);
        v16 = *v13;
        v17 = *(uint8x8_t *)((char *)v15 + a2);
        v18 = (uint8x8_t *)((char *)v15 + a2 + a2);
        v19 = *(uint8x8_t *)((char *)v18 + a2);
        v20 = vpaddq_s16((int16x8_t)vaddw_u8(vaddw_u8(vaddl_u8(v12, v10), v16), *v14), (int16x8_t)vaddw_u8(vaddw_u8(vaddl_u8(v17, *v15), *v18), v19));
        v21 = vpaddq_s16(v20, v20);
        v22 = vrshrq_n_u16((uint16x8_t)vqtbl1q_s8((int8x16_t)v21, (int8x16_t)xmmword_1C9862D90), 4uLL);
        v23 = vabaq_u16(vabdq_u16(vmovl_u8(v12), v22), vmovl_u8(v10), v22);
        v24 = vrshrq_n_u16((uint16x8_t)vqtbl1q_s8((int8x16_t)v21, (int8x16_t)xmmword_1C9862DA0), 4uLL);
        v24.i32[0] = vaddlvq_u16(vabaq_u16(vabaq_u16(vabaq_u16(vabaq_u16(vabaq_u16(vabaq_u16(v23, vmovl_u8(v16), v22), vmovl_u8(*v14), v22), vmovl_u8(*v15), v24), vmovl_u8(v17), v24), vmovl_u8(*v18), v24), vmovl_u8(v19), v24));
        *a5++ = vpaddlq_u16((uint16x8_t)vpaddq_s16(v21, v21)).u32[0];
        *a6++ = v24.i32[0];
        result = (v24.i32[0] + result);
      }
    }
    a1 += 8 * a2;
    v7 += 8;
  }
  while (v7 < a4);
  return result;
}

uint64_t sub_1C982AF90(int16x8_t *a1, uint64_t a2, int a3, int a4, unsigned __int32 *a5, unsigned int *a6)
{
  int v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  int16x8_t *v11;
  int16x8_t v12;
  int16x8_t *v13;
  int16x8_t v14;
  int16x8_t v15;
  int16x8_t *v16;
  int16x8_t v17;
  int16x8_t *v18;
  int16x8_t v19;
  int16x8_t *v20;
  uint16x8_t v21;
  int16x8_t v22;
  int16x8_t v23;
  int16x8_t v24;
  unsigned __int32 v25;
  uint16x8_t v26;
  uint16x8_t v27;
  uint16x8_t v28;
  unsigned int v29;

  if (a4 < 1)
    return 0;
  v7 = 0;
  result = 0;
  v9 = 2 * a2;
  do
  {
    if (a3 >= 1)
    {
      v10 = 0;
      v11 = a1;
      do
      {
        v12 = *(int16x8_t *)((char *)v11 + 2 * a2);
        v13 = (int16x8_t *)((char *)v11 + v9 + v9);
        v14 = *v13;
        v15 = *(int16x8_t *)((char *)v13 + 2 * a2);
        v16 = (int16x8_t *)((char *)v13 + v9 + v9);
        v17 = *v16;
        v18 = (int16x8_t *)((char *)v16 + v9);
        v19 = *v18;
        v20 = (int16x8_t *)((char *)v18 + v9);
        v21 = *(uint16x8_t *)v20;
        v22 = *(int16x8_t *)((char *)v20 + 2 * a2);
        v23 = vpaddq_s16(vaddq_s16(vaddq_s16(vaddq_s16(v12, *v11), v14), v15), vaddq_s16(vaddq_s16(v19, v17), vaddq_s16(*v20, v22)));
        v24 = vpaddq_s16(v23, v23);
        v25 = vpaddlq_u16((uint16x8_t)vpaddq_s16(v24, v24)).u32[0];
        v26 = vrshrq_n_u16((uint16x8_t)vqtbl1q_s8((int8x16_t)v24, (int8x16_t)xmmword_1C9862D90), 4uLL);
        v27 = vrshrq_n_u16((uint16x8_t)vqtbl1q_s8((int8x16_t)v24, (int8x16_t)xmmword_1C9862DA0), 4uLL);
        v28 = vabaq_u16(vabaq_u16(vabaq_u16(vabdq_u16((uint16x8_t)v12, v26), *(uint16x8_t *)v11, v26), (uint16x8_t)v14, v26), (uint16x8_t)v15, v26);
        *a5++ = v25;
        v29 = vaddlvq_u16(vabaq_u16(vabaq_u16(vabaq_u16(vabaq_u16(v28, (uint16x8_t)v17, v27), (uint16x8_t)v19, v27), v21, v27), (uint16x8_t)v22, v27));
        *a6++ = v29;
        result = v29 + result;
        v10 += 8;
        ++v11;
      }
      while (v10 < a3);
    }
    v7 += 8;
    a1 += a2;
  }
  while (v7 < a4);
  return result;
}

unint64_t sub_1C982B0A0(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t *a5, uint64_t *a6, int64x2_t *a7)
{
  int v7;
  uint64x2_t v8;
  uint64_t v9;
  int v10;
  uint8x16_t v11;
  uint8x16_t *v12;
  uint8x16_t v13;
  uint8x16_t *v14;
  uint8x16_t v15;
  uint8x16_t *v16;
  uint8x16_t v17;
  uint8x16_t *v18;
  uint8x16_t v19;
  uint8x16_t *v20;
  uint8x16_t v21;
  uint8x16_t *v22;
  uint8x16_t v23;
  uint8x16_t v24;
  uint32x4_t v25;
  int32x4_t v26;
  int64x2_t v27;
  uint64x2_t v28;
  uint64_t v29;

  if (a4 < 1)
  {
    v8 = 0uLL;
  }
  else
  {
    v7 = 0;
    v8 = 0uLL;
    do
    {
      if (a3 >= 1)
      {
        v9 = 0;
        v10 = a3;
        do
        {
          v11 = *(uint8x16_t *)(a1 + v9);
          v12 = (uint8x16_t *)(a1 + v9 + a2);
          v13 = *v12;
          v14 = (uint8x16_t *)((char *)v12 + a2);
          v15 = *v14;
          v16 = (uint8x16_t *)((char *)v14 + a2);
          v17 = *v16;
          v18 = (uint8x16_t *)((char *)v16 + a2);
          v19 = *v18;
          v20 = (uint8x16_t *)((char *)v18 + a2);
          v21 = *v20;
          v22 = (uint8x16_t *)((char *)v20 + a2);
          v23 = *(uint8x16_t *)((char *)v22 + a2);
          v24 = *v22;
          v25 = vpadalq_u16(vpadalq_u16(vpadalq_u16(vpaddlq_u16(vmull_u8(*(uint8x8_t *)v13.i8, *(uint8x8_t *)v13.i8)), vmull_u8(*(uint8x8_t *)v11.i8, *(uint8x8_t *)v11.i8)), vmull_u8(*(uint8x8_t *)v15.i8, *(uint8x8_t *)v15.i8)), vmull_u8(*(uint8x8_t *)v17.i8, *(uint8x8_t *)v17.i8));
          v26 = (int32x4_t)vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpaddlq_u16(vmull_high_u8(v13, v13)), vmull_high_u8(v11, v11)), vmull_high_u8(v15, v15)), vmull_high_u8(v17, v17)), vmull_high_u8(v19, v19)), vmull_high_u8(v21, v21)), vmull_high_u8(v24, v24)), vmull_high_u8(v23, v23));
          v11.i64[0] = *a5;
          *a6 = *a5;
          v27 = (int64x2_t)vpaddlq_u32((uint32x4_t)vpaddq_s32((int32x4_t)vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(v25, vmull_u8(*(uint8x8_t *)v19.i8, *(uint8x8_t *)v19.i8)), vmull_u8(*(uint8x8_t *)v21.i8, *(uint8x8_t *)v21.i8)), vmull_u8(*(uint8x8_t *)v24.i8, *(uint8x8_t *)v24.i8)), vmull_u8(*(uint8x8_t *)v23.i8, *(uint8x8_t *)v23.i8)), v26));
          v28 = (uint64x2_t)vsubq_s64(v27, (int64x2_t)vshrq_n_u64(vmull_u32(*(uint32x2_t *)v11.i8, *(uint32x2_t *)v11.i8), 6uLL));
          if (v10 <= 15)
            v29 = 1;
          else
            v29 = 2;
          a6 = (uint64_t *)((char *)a6 + 4 * v29);
          *a7 = v27;
          v8 = vrsraq_n_u64(v8, v28, 6uLL);
          a5 = (uint64_t *)((char *)a5 + 4 * v29);
          a7 = (int64x2_t *)((char *)a7 + 8 * v29);
          v9 += 16;
          v10 -= 16;
        }
        while (v9 < a3);
      }
      a1 += 8 * a2;
      v7 += 8;
    }
    while (v7 < a4);
  }
  return (v8.i64[1] + ((a4 * a3) >> 7) + v8.i64[0]) / (unint64_t)((uint64_t)(a4 * a3) >> 6);
}

unint64_t sub_1C982B20C(int16x4_t *a1, uint64_t a2, int a3, int a4, uint32x2_t *a5, uint32x2_t *a6, int64x2_t *a7)
{
  int v7;
  uint64x2_t v8;
  uint64_t v9;
  uint64_t v10;
  int16x4_t *v11;
  int v12;
  int16x8_t *v13;
  int16x8_t v14;
  int16x8_t v15;
  int16x4_t *v16;
  int32x4_t v17;
  int32x4_t v18;
  int16x8_t *v19;
  int16x8_t v20;
  int32x4_t v21;
  char *v22;
  int16x8_t v23;
  int32x4_t v24;
  int32x4_t v25;
  char *v26;
  int16x8_t v27;
  int32x4_t v28;
  int16x4_t *v29;
  int64x2_t v30;
  int64x2_t v31;
  uint64x2_t v32;
  uint64_t v33;

  if (a4 < 1)
  {
    v8 = 0uLL;
  }
  else
  {
    v7 = 0;
    v8 = 0uLL;
    v9 = 2 * a2;
    do
    {
      if (a3 >= 1)
      {
        v10 = 0;
        v11 = a1;
        v12 = a3;
        do
        {
          v13 = (int16x8_t *)((char *)v11 + v9 + v9);
          v14 = *v13;
          v15 = v13[1];
          v16 = (int16x4_t *)&v13->i8[v9];
          v17 = vmlal_high_s16(vmlal_s16(vmlal_high_s16(vmlal_s16(vmlal_high_s16(vmlal_s16(vmlal_high_s16(vmull_s16(*v11, *v11), *(int16x8_t *)v11->i8, *(int16x8_t *)v11->i8), *(int16x4_t *)((char *)v11 + 2 * a2), *(int16x4_t *)((char *)v11 + 2 * a2)), *(int16x8_t *)&v11->i8[2 * a2], *(int16x8_t *)&v11->i8[2 * a2]), *(int16x4_t *)v14.i8, *(int16x4_t *)v14.i8), v14, v14), *v16, *v16), *(int16x8_t *)v16->i8, *(int16x8_t *)v16->i8);
          v18 = vmlal_high_s16(vmlal_s16(vmlal_high_s16(vmlal_s16(vmlal_high_s16(vmlal_s16(vmlal_high_s16(vmull_s16(v11[2], v11[2]), *(int16x8_t *)v11[2].i8, *(int16x8_t *)v11[2].i8), *(int16x4_t *)((char *)&v11[2] + v9), *(int16x4_t *)((char *)&v11[2] + v9)), *(int16x8_t *)&v11[2].i8[v9], *(int16x8_t *)&v11[2].i8[v9]), *(int16x4_t *)v15.i8, *(int16x4_t *)v15.i8), v15, v15), v16[2], v16[2]), *(int16x8_t *)v16[2].i8, *(int16x8_t *)v16[2].i8);
          v19 = (int16x8_t *)((char *)v16 + v9);
          v20 = v19[1];
          v21 = vmlal_high_s16(vmlal_s16(v17, *(int16x4_t *)v19->i8, *(int16x4_t *)v19->i8), *v19, *v19);
          v22 = &v19->i8[v9];
          v23 = *((int16x8_t *)v22 + 1);
          v24 = vmlal_s16(vmlal_high_s16(vmlal_s16(v18, *(int16x4_t *)v20.i8, *(int16x4_t *)v20.i8), v20, v20), *(int16x4_t *)v23.i8, *(int16x4_t *)v23.i8);
          v25 = vmlal_high_s16(vmlal_s16(v21, *(int16x4_t *)v22, *(int16x4_t *)v22), *(int16x8_t *)v22, *(int16x8_t *)v22);
          v26 = &v22[v9];
          v27 = *((int16x8_t *)v26 + 1);
          v28 = vmlal_high_s16(vmlal_s16(v25, *(int16x4_t *)v26, *(int16x4_t *)v26), *(int16x8_t *)v26, *(int16x8_t *)v26);
          v29 = (int16x4_t *)&v26[v9];
          v30 = (int64x2_t)vpaddlq_u32((uint32x4_t)vpaddq_s32(vmlal_high_s16(vmlal_s16(v28, *v29, *v29), *(int16x8_t *)v29->i8, *(int16x8_t *)v29->i8), vmlal_high_s16(vmlal_s16(vmlal_high_s16(vmlal_s16(vmlal_high_s16(v24, v23, v23), *(int16x4_t *)v27.i8, *(int16x4_t *)v27.i8), v27, v27), v29[2], v29[2]), *(int16x8_t *)v29[2].i8, *(int16x8_t *)v29[2].i8)));
          v31 = (int64x2_t)vshrq_n_u64(vmull_u32(*a5, *a5), 6uLL);
          *a6 = *a5;
          v32 = (uint64x2_t)vsubq_s64(v30, v31);
          if (v12 <= 15)
            v33 = 1;
          else
            v33 = 2;
          a6 = (uint32x2_t *)((char *)a6 + 4 * v33);
          v8 = vrsraq_n_u64(v8, v32, 6uLL);
          *a7 = v30;
          a5 = (uint32x2_t *)((char *)a5 + 4 * v33);
          a7 = (int64x2_t *)((char *)a7 + 8 * v33);
          v10 += 16;
          v12 -= 16;
          v11 += 4;
        }
        while (v10 < a3);
      }
      v7 += 8;
      a1 += 2 * a2;
    }
    while (v7 < a4);
  }
  return (v8.i64[1] + ((a4 * a3) >> 7) + v8.i64[0]) / (unint64_t)((uint64_t)(a4 * a3) >> 6);
}

unint64_t sub_1C982B384(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, _DWORD *a6, uint64_t a7)
{
  uint64_t v7;
  int v8;
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
  int v23;
  int32x2_t v24;
  int32x4_t v25;
  int32x4_t v26;
  uint8x16_t v27;
  uint8x16_t v28;
  uint8x16_t v29;
  uint8x16_t v30;
  uint8x16_t v31;
  uint8x16_t v32;
  uint8x16_t v33;
  uint8x16_t v34;
  uint8x16_t v35;
  uint8x16_t *v36;
  uint8x16_t v37;
  uint8x16_t *v38;
  uint8x16_t v39;
  uint8x16_t *v40;
  uint8x16_t v41;
  uint8x16_t *v42;
  uint8x16_t v43;
  uint8x16_t *v44;
  uint8x16_t v45;
  uint8x16_t *v46;
  uint8x16_t v47;
  uint8x16_t v48;
  int32x2_t v49;
  int32x4_t v50;
  uint32x4_t v51;
  int32x2_t v52;

  if (a4 < 1)
  {
    v7 = 0;
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = (uint64_t)a3 >> 3;
    v10 = 16 * a2;
    v11 = 8 * v9;
    v12 = a1 + 15 * a2;
    v13 = a1 + 14 * a2;
    v14 = a1 + 13 * a2;
    v15 = a1 + 12 * a2;
    v16 = a1 + 11 * a2;
    v17 = a1 + 10 * a2;
    v18 = a1 + 9 * a2;
    v19 = a5 + 4 * v9;
    v20 = a1 + 8 * a2;
    do
    {
      if (a3 >= 1)
      {
        v21 = 0;
        v22 = 0;
        v23 = a3;
        do
        {
          v24 = 0;
          v25 = 0uLL;
          v26 = 0uLL;
          if (a4 - v8 >= 16)
          {
            v27 = *(uint8x16_t *)(v20 + v22);
            v28 = *(uint8x16_t *)(v18 + v22);
            v29 = *(uint8x16_t *)(v17 + v22);
            v30 = *(uint8x16_t *)(v16 + v22);
            v31 = *(uint8x16_t *)(v15 + v22);
            v32 = *(uint8x16_t *)(v14 + v22);
            v33 = *(uint8x16_t *)(v13 + v22);
            v34 = *(uint8x16_t *)(v12 + v22);
            v25 = (int32x4_t)vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpaddlq_u16(vmull_u8(*(uint8x8_t *)v28.i8, *(uint8x8_t *)v28.i8)), vmull_u8(*(uint8x8_t *)v27.i8, *(uint8x8_t *)v27.i8)), vmull_u8(*(uint8x8_t *)v29.i8, *(uint8x8_t *)v29.i8)), vmull_u8(*(uint8x8_t *)v30.i8, *(uint8x8_t *)v30.i8)), vmull_u8(*(uint8x8_t *)v31.i8, *(uint8x8_t *)v31.i8)), vmull_u8(*(uint8x8_t *)v32.i8, *(uint8x8_t *)v32.i8)), vmull_u8(*(uint8x8_t *)v33.i8, *(uint8x8_t *)v33.i8)), vmull_u8(*(uint8x8_t *)v34.i8, *(uint8x8_t *)v34.i8));
            v26 = (int32x4_t)vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpaddlq_u16(vmull_high_u8(v28, v28)), vmull_high_u8(v27, v27)), vmull_high_u8(v29, v29)), vmull_high_u8(v30, v30)), vmull_high_u8(v31, v31)), vmull_high_u8(v32, v32)), vmull_high_u8(v33, v33)), vmull_high_u8(v34, v34));
            v24 = *(int32x2_t *)(v19 + v21);
          }
          v35 = *(uint8x16_t *)(a1 + v22);
          v36 = (uint8x16_t *)(a1 + v22 + a2);
          v37 = *v36;
          v38 = (uint8x16_t *)((char *)v36 + a2);
          v39 = *v38;
          v40 = (uint8x16_t *)((char *)v38 + a2);
          v41 = *v40;
          v42 = (uint8x16_t *)((char *)v40 + a2);
          v43 = *v42;
          v44 = (uint8x16_t *)((char *)v42 + a2);
          v45 = *v44;
          v46 = (uint8x16_t *)((char *)v44 + a2);
          v47 = *v46;
          v48 = *(uint8x16_t *)((char *)v46 + a2);
          v49 = *(int32x2_t *)(a5 + v21);
          if (v23 > 15)
          {
            v50 = (int32x4_t)vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpaddlq_u16(vmull_high_u8(v37, v37)), vmull_high_u8(v35, v35)), vmull_high_u8(v39, v39)), vmull_high_u8(v41, v41)), vmull_high_u8(v43, v43)), vmull_high_u8(v45, v45)), vmull_high_u8(v47, v47)), vmull_high_u8(v48, v48));
          }
          else
          {
            v49.i32[1] = 0;
            v24.i32[1] = 0;
            v26 = 0uLL;
            v50 = 0uLL;
          }
          v51 = (uint32x4_t)vaddq_s32(vaddq_s32((int32x4_t)vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpaddlq_u16(vmull_u8(*(uint8x8_t *)v37.i8, *(uint8x8_t *)v37.i8)), vmull_u8(*(uint8x8_t *)v35.i8, *(uint8x8_t *)v35.i8)), vmull_u8(*(uint8x8_t *)v39.i8, *(uint8x8_t *)v39.i8)), vmull_u8(*(uint8x8_t *)v41.i8, *(uint8x8_t *)v41.i8)), vmull_u8(*(uint8x8_t *)v43.i8, *(uint8x8_t *)v43.i8)), vmull_u8(*(uint8x8_t *)v45.i8, *(uint8x8_t *)v45.i8)), vmull_u8(*(uint8x8_t *)v47.i8, *(uint8x8_t *)v47.i8)), vmull_u8(*(uint8x8_t *)v48.i8, *(uint8x8_t *)v48.i8)), v25), vaddq_s32(v26, v50));
          v52 = vadd_s32(v49, v24);
          v52.i32[0] = vpadd_s32(v52, v52).u32[0];
          *a6++ = v52.i32[0];
          v51.i64[0] = vaddlvq_u32(v51);
          *(_QWORD *)(a7 + v21) = v51.i64[0];
          v7 += (v51.i64[0] - (unint64_t)((v52.i32[0] * v52.i32[0]) >> 8) + 128) >> 8;
          v22 += 16;
          v23 -= 16;
          v21 += 8;
        }
        while (v22 < a3);
        a7 += v21;
      }
      a1 += v10;
      v8 += 16;
      v19 += v11;
      a5 += v11;
      v12 += v10;
      v13 += v10;
      v14 += v10;
      v15 += v10;
      v16 += v10;
      v17 += v10;
      v18 += v10;
      v20 += v10;
    }
    while (v8 < a4);
  }
  return (v7 + ((a4 * a3) >> 9)) / (unint64_t)((uint64_t)(a4 * a3) >> 8);
}

unint64_t sub_1C982B668(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, _DWORD *a6, uint64_t a7)
{
  uint64_t v7;
  int v8;
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
  int v23;
  int32x2_t v24;
  int32x4_t v25;
  int32x4_t v26;
  uint8x16_t v27;
  uint8x16_t v28;
  uint8x16_t v29;
  uint8x16_t v30;
  uint8x16_t v31;
  uint8x16_t v32;
  uint8x16_t v33;
  uint8x16_t v34;
  uint8x16_t v35;
  uint8x16_t *v36;
  uint8x16_t v37;
  uint8x16_t *v38;
  uint8x16_t v39;
  uint8x16_t *v40;
  uint8x16_t v41;
  uint8x16_t *v42;
  uint8x16_t v43;
  uint8x16_t *v44;
  uint8x16_t v45;
  uint8x16_t *v46;
  uint8x16_t v47;
  uint8x16_t v48;
  int32x2_t v49;
  int32x4_t v50;
  uint32x4_t v51;
  int32x2_t v52;

  if (a4 < 1)
  {
    v7 = 0;
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = (uint64_t)a3 >> 3;
    v10 = 16 * a2;
    v11 = 8 * v9;
    v12 = a1 + 15 * a2;
    v13 = a1 + 14 * a2;
    v14 = a1 + 13 * a2;
    v15 = a1 + 12 * a2;
    v16 = a1 + 11 * a2;
    v17 = a1 + 10 * a2;
    v18 = a1 + 9 * a2;
    v19 = a5 + 4 * v9;
    v20 = a1 + 8 * a2;
    do
    {
      if (a3 >= 1)
      {
        v21 = 0;
        v22 = 0;
        v23 = a3;
        do
        {
          v24 = 0;
          v25 = 0uLL;
          v26 = 0uLL;
          if (a4 - v8 >= 16)
          {
            v27 = *(uint8x16_t *)(v20 + v22);
            v28 = *(uint8x16_t *)(v18 + v22);
            v29 = *(uint8x16_t *)(v17 + v22);
            v30 = *(uint8x16_t *)(v16 + v22);
            v31 = *(uint8x16_t *)(v15 + v22);
            v32 = *(uint8x16_t *)(v14 + v22);
            v33 = *(uint8x16_t *)(v13 + v22);
            v34 = *(uint8x16_t *)(v12 + v22);
            v25 = (int32x4_t)vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpaddlq_u16(vmull_u8(*(uint8x8_t *)v28.i8, *(uint8x8_t *)v28.i8)), vmull_u8(*(uint8x8_t *)v27.i8, *(uint8x8_t *)v27.i8)), vmull_u8(*(uint8x8_t *)v29.i8, *(uint8x8_t *)v29.i8)), vmull_u8(*(uint8x8_t *)v30.i8, *(uint8x8_t *)v30.i8)), vmull_u8(*(uint8x8_t *)v31.i8, *(uint8x8_t *)v31.i8)), vmull_u8(*(uint8x8_t *)v32.i8, *(uint8x8_t *)v32.i8)), vmull_u8(*(uint8x8_t *)v33.i8, *(uint8x8_t *)v33.i8)), vmull_u8(*(uint8x8_t *)v34.i8, *(uint8x8_t *)v34.i8));
            v26 = (int32x4_t)vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpaddlq_u16(vmull_high_u8(v28, v28)), vmull_high_u8(v27, v27)), vmull_high_u8(v29, v29)), vmull_high_u8(v30, v30)), vmull_high_u8(v31, v31)), vmull_high_u8(v32, v32)), vmull_high_u8(v33, v33)), vmull_high_u8(v34, v34));
            v24 = *(int32x2_t *)(v19 + v21);
          }
          v35 = *(uint8x16_t *)(a1 + v22);
          v36 = (uint8x16_t *)(a1 + v22 + a2);
          v37 = *v36;
          v38 = (uint8x16_t *)((char *)v36 + a2);
          v39 = *v38;
          v40 = (uint8x16_t *)((char *)v38 + a2);
          v41 = *v40;
          v42 = (uint8x16_t *)((char *)v40 + a2);
          v43 = *v42;
          v44 = (uint8x16_t *)((char *)v42 + a2);
          v45 = *v44;
          v46 = (uint8x16_t *)((char *)v44 + a2);
          v47 = *v46;
          v48 = *(uint8x16_t *)((char *)v46 + a2);
          v49 = *(int32x2_t *)(a5 + v21);
          if (v23 > 15)
          {
            v50 = (int32x4_t)vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpaddlq_u16(vmull_high_u8(v37, v37)), vmull_high_u8(v35, v35)), vmull_high_u8(v39, v39)), vmull_high_u8(v41, v41)), vmull_high_u8(v43, v43)), vmull_high_u8(v45, v45)), vmull_high_u8(v47, v47)), vmull_high_u8(v48, v48));
          }
          else
          {
            v49.i32[1] = 0;
            v24.i32[1] = 0;
            v26 = 0uLL;
            v50 = 0uLL;
          }
          v51 = (uint32x4_t)vaddq_s32(vaddq_s32((int32x4_t)vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpaddlq_u16(vmull_u8(*(uint8x8_t *)v37.i8, *(uint8x8_t *)v37.i8)), vmull_u8(*(uint8x8_t *)v35.i8, *(uint8x8_t *)v35.i8)), vmull_u8(*(uint8x8_t *)v39.i8, *(uint8x8_t *)v39.i8)), vmull_u8(*(uint8x8_t *)v41.i8, *(uint8x8_t *)v41.i8)), vmull_u8(*(uint8x8_t *)v43.i8, *(uint8x8_t *)v43.i8)), vmull_u8(*(uint8x8_t *)v45.i8, *(uint8x8_t *)v45.i8)), vmull_u8(*(uint8x8_t *)v47.i8, *(uint8x8_t *)v47.i8)), vmull_u8(*(uint8x8_t *)v48.i8, *(uint8x8_t *)v48.i8)), v25), vaddq_s32(v26, v50));
          v52 = vadd_s32(v49, v24);
          v52.i32[0] = vpadd_s32(v52, v52).u32[0];
          *a6++ = v52.i32[0];
          v51.i64[0] = vaddlvq_u32(v51);
          *(_QWORD *)(a7 + v21) = v51.i64[0];
          v7 += (v51.i64[0] - (unint64_t)((v52.i32[0] * v52.i32[0]) >> 8) + 128) >> 8;
          v22 += 16;
          v23 -= 16;
          v21 += 8;
        }
        while (v22 < a3);
        a7 += v21;
      }
      a1 += v10;
      v8 += 16;
      v19 += v11;
      a5 += v11;
      v12 += v10;
      v13 += v10;
      v14 += v10;
      v15 += v10;
      v16 += v10;
      v17 += v10;
      v18 += v10;
      v20 += v10;
    }
    while (v8 < a4);
  }
  return (v7 + ((a4 * a3) >> 9)) / (unint64_t)((uint64_t)(a4 * a3) >> 8);
}

uint64_t sub_1C982B94C(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int i;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  signed int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  unint64_t v28;
  signed int v29;
  int32x4_t v30;
  int32x4_t *v31;
  uint64_t v32;
  int32x4_t *v33;
  unint64_t v34;
  int32x4_t *v35;
  int32x4_t *v36;
  int v37;
  int8x16_t *v38;
  int v39;
  signed int v40;
  int v41;
  int v42;

  if ((a2 + 15) >> 4 >= ((int)result + 15) >> 4)
    v4 = ((int)result + 15) >> 4;
  else
    v4 = (a2 + 15) >> 4;
  if (a2 >= 1)
  {
    v5 = 0;
    LODWORD(v6) = 0;
    v7 = 4 * (int)result;
    v8 = v4;
    v41 = a2;
    for (i = -v4; ; ++i)
    {
      v10 = a2 >= v8 ? v8 : a2;
      if ((int)result >= 1)
        break;
LABEL_42:
      ++v5;
      ++v8;
      if (v5 == a2)
        return result;
    }
    v11 = 0;
    v42 = i;
    v12 = i & ~(i >> 31);
    v13 = v10 - v12;
    v14 = result * v12;
    v15 = (v5 - v4) & ~((v5 - v4) >> 31);
    v16 = v5 + v4;
    if (v5 + v4 >= a2)
      v16 = a2;
    v17 = v16 - v15;
    v18 = v15 * result;
    v19 = (v16 - v15) & 0xFFFFFFFE;
    v6 = (int)v6;
    v20 = v4;
    v21 = -v4;
    while (1)
    {
      v22 = v21 & ~(v21 >> 31);
      v23 = v14 + v22;
      if ((int)result >= v20)
        v24 = v20;
      else
        v24 = result;
      v25 = (v11 - v4) & ~((v11 - v4) >> 31);
      v26 = v11 + v4;
      if (v11 + v4 >= (int)result)
        v26 = result;
      v27 = v26 - v25;
      v28 = (v26 - v25) & 0xFFFFFFF8;
      if (v19 < 1)
        break;
      v29 = 0;
      v30 = 0uLL;
      v31 = (int32x4_t *)(a3 + 4 * v23);
      do
      {
        if ((int)v28 >= 1)
        {
          v32 = 0;
          v33 = v31;
          do
          {
            v30 = vaddq_s32(vaddq_s32(vaddq_s32(*v33, v30), *(int32x4_t *)((char *)v33 + 4 * (int)result + 16)), vaddq_s32(v33[1], *(int32x4_t *)((char *)v33 + 4 * (int)result)));
            v32 += 8;
            v33 += 2;
          }
          while (v32 < (int)v28);
        }
        v29 += 2;
        v31 = (int32x4_t *)((char *)v31 + 8 * (int)result);
      }
      while (v29 < v19);
      if ((v17 & 1) != 0)
        goto LABEL_27;
LABEL_30:
      if ((v27 & 4) == 0)
        goto LABEL_34;
      if (v17 >= 1)
      {
        v36 = (int32x4_t *)(a3 + 4 * (int)((v24 - v22) & 0xFFFFFFF8) + 4 * v23);
        LODWORD(v28) = v28 | 4;
        v37 = v13;
        do
        {
          v30 = vaddq_s32(*v36, v30);
          v36 = (int32x4_t *)((char *)v36 + v7);
          --v37;
        }
        while (v37);
LABEL_34:
        if (v17 >= 1 && (v27 & 3) != 0)
        {
          v38 = (int8x16_t *)(a3 + 4 * v23 + 4 * (int)v28);
          v39 = v13;
          do
          {
            v30 = vaddq_s32((int32x4_t)vandq_s8(*v38, *(int8x16_t *)((char *)&unk_1C98617F0 + 4 * (v27 & 3 ^ 3u))), v30);
            v38 = (int8x16_t *)((char *)v38 + v7);
            --v39;
          }
          while (v39);
        }
      }
      v40 = ((*(_DWORD *)(a3 + 4 * v6) + 32) >> 6)
          - (((vaddvq_s32(v30) + ((v27 * v17) >> 1)) / (v27 * v17) + 32) >> 6);
      if (v40 < 0)
        v40 = -v40;
      *(_DWORD *)(a4 + 4 * v6++) = v40;
      ++v11;
      ++v21;
      ++v20;
      if (v11 == (_DWORD)result)
      {
        a2 = v41;
        i = v42;
        goto LABEL_42;
      }
    }
    v31 = (int32x4_t *)(a3 + 4 * (v25 + v18));
    v30 = 0uLL;
    if ((v17 & 1) == 0)
      goto LABEL_30;
LABEL_27:
    if ((int)v28 >= 1)
    {
      v34 = 0;
      v35 = v31 + 1;
      do
      {
        v30 = vaddq_s32(vaddq_s32(v35[-1], v30), *v35);
        v34 += 8;
        v35 += 2;
      }
      while (v34 < v28);
    }
    goto LABEL_30;
  }
  return result;
}

uint64_t sub_1C982BBD8(int32x4_t *a1, uint64_t a2, int a3, int a4)
{
  unint64_t v4;
  signed int v5;
  int32x4_t v6;
  int32x4_t *v7;
  uint64_t v8;
  int32x4_t *v9;
  unint64_t v10;
  int32x4_t *v11;
  signed int v12;
  int v13;
  int32x4_t *v14;
  int8x16_t *v15;

  v4 = a3 & 0xFFFFFFF8;
  if ((int)(a4 & 0xFFFFFFFE) < 1)
  {
    v6 = 0uLL;
    v7 = a1;
  }
  else
  {
    v5 = 0;
    v6 = 0uLL;
    v7 = a1;
    do
    {
      if ((int)v4 >= 1)
      {
        v8 = 0;
        v9 = v7;
        do
        {
          v6 = vaddq_s32(vaddq_s32(vaddq_s32(*v9, v6), *(int32x4_t *)((char *)v9 + 4 * a2 + 16)), vaddq_s32(v9[1], *(int32x4_t *)((char *)v9 + 4 * a2)));
          v8 += 8;
          v9 += 2;
        }
        while (v8 < (int)v4);
      }
      v5 += 2;
      v7 = (int32x4_t *)((char *)v7 + 8 * a2);
    }
    while (v5 < (int)(a4 & 0xFFFFFFFE));
  }
  if ((a4 & 1) != 0 && (int)v4 >= 1)
  {
    v10 = 0;
    v11 = v7 + 1;
    do
    {
      v6 = vaddq_s32(vaddq_s32(v11[-1], v6), *v11);
      v10 += 8;
      v11 += 2;
    }
    while (v10 < v4);
  }
  if ((a3 & 4) != 0)
  {
    if (a4 < 1)
      return vaddvq_s32(v6);
    v12 = v4 | 4;
    v13 = a4;
    v14 = (int32x4_t *)((char *)a1 + 4 * (int)v4);
    do
    {
      v6 = vaddq_s32(*v14, v6);
      v14 = (int32x4_t *)((char *)v14 + 4 * a2);
      --v13;
    }
    while (v13);
  }
  else
  {
    v12 = a3 & 0xFFFFFFF8;
  }
  if ((a3 & 3) != 0 && a4 >= 1)
  {
    v15 = (int8x16_t *)((char *)a1 + 4 * v12);
    do
    {
      v6 = vaddq_s32((int32x4_t)vandq_s8(*v15, *(int8x16_t *)((char *)&unk_1C98617F0 + 4 * (a3 & 3 ^ 3u))), v6);
      v15 = (int8x16_t *)((char *)v15 + 4 * a2);
      --a4;
    }
    while (a4);
  }
  return vaddvq_s32(v6);
}

uint64_t sub_1C982BD10(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v4;
  int32x4_t v5;
  int64x2_t v6;
  uint64_t v7;
  int64x2_t v8;
  int64x2_t v9;
  int64x2_t v10;
  uint64_t v11;
  int64x2_t v12;
  int64x2_t v13;
  uint64_t v14;
  int64x2_t v15;
  int64x2_t v16;
  int v17;
  uint64_t v18;
  uint64_t i;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  BOOL v24;
  unint64_t v25;

  v4 = a1 + 12 * a2;
  v5 = 0uLL;
  v6 = 0uLL;
  v7 = 16 * a2;
  v8 = 0uLL;
  v9 = 0uLL;
  v10 = 0uLL;
  v11 = a1 + 8 * a2;
  v12 = 0uLL;
  v13 = 0uLL;
  v14 = a1 + 4 * a2;
  v15 = 0uLL;
  v16 = 0uLL;
  v17 = a4;
  do
  {
    if (a3 >= 1)
    {
      v18 = 0;
      for (i = 0; i < a3; i += 4)
      {
        v20 = *(int32x4_t *)(a1 + v18);
        v21 = *(int32x4_t *)(v14 + v18);
        v22 = *(int32x4_t *)(v11 + v18);
        v23 = *(int32x4_t *)(v4 + v18);
        v5 = vaddq_s32(vaddq_s32(vaddq_s32(v20, v5), vaddq_s32(v21, v22)), v23);
        v16 = (int64x2_t)vmlal_u32((uint64x2_t)v16, *(uint32x2_t *)v20.i8, *(uint32x2_t *)v20.i8);
        v15 = (int64x2_t)vmlal_high_u32((uint64x2_t)v15, (uint32x4_t)v20, (uint32x4_t)v20);
        v13 = (int64x2_t)vmlal_u32((uint64x2_t)v13, *(uint32x2_t *)v21.i8, *(uint32x2_t *)v21.i8);
        v12 = (int64x2_t)vmlal_high_u32((uint64x2_t)v12, (uint32x4_t)v21, (uint32x4_t)v21);
        v10 = (int64x2_t)vmlal_u32((uint64x2_t)v10, *(uint32x2_t *)v22.i8, *(uint32x2_t *)v22.i8);
        v9 = (int64x2_t)vmlal_high_u32((uint64x2_t)v9, (uint32x4_t)v22, (uint32x4_t)v22);
        v8 = (int64x2_t)vmlal_u32((uint64x2_t)v8, *(uint32x2_t *)v23.i8, *(uint32x2_t *)v23.i8);
        v6 = (int64x2_t)vmlal_high_u32((uint64x2_t)v6, (uint32x4_t)v23, (uint32x4_t)v23);
        v18 += 16;
      }
    }
    v4 += v7;
    v11 += v7;
    v14 += v7;
    a1 += v7;
    v24 = __OFSUB__(v17, 4);
    v17 -= 4;
  }
  while (!((v17 < 0) ^ v24 | (v17 == 0)));
  v25 = vaddlvq_u32((uint32x4_t)v5);
  return vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v8, v6), vaddq_s64(v9, v10)), vaddq_s64(vaddq_s64(v12, v13), v15)), v16))- (uint64_t)(v25 * v25 + ((a4 * a3) >> 1)) / (a4 * a3);
}

uint8x16_t sub_1C982BE14(int a1, uint64_t a2, __int32 *a3, uint64_t a4, __int32 *a5, uint64_t a6, _DWORD *a7)
{
  int v7;
  uint8x16_t v8;
  __int32 *v9;
  __int32 *v10;
  __int32 *v11;
  uint8x16_t v12;
  __int32 *v13;
  __int32 *v14;
  __int32 *v15;
  uint8x16_t result;
  _DWORD *v17;
  _DWORD *v18;

  v7 = a1 + 4;
  do
  {
    v8.i32[0] = *a3;
    v9 = (__int32 *)((char *)a3 + a2);
    v8.i32[1] = *v9;
    v10 = (__int32 *)((char *)v9 + a2);
    v8.i32[2] = *v10;
    v11 = (__int32 *)((char *)v10 + a2);
    v8.i32[3] = *v11;
    a3 = (__int32 *)((char *)v11 + a2);
    v12.i32[0] = *a5;
    v13 = (__int32 *)((char *)a5 + a4);
    v12.i32[1] = *v13;
    v14 = (__int32 *)((char *)v13 + a4);
    v12.i32[2] = *v14;
    v15 = (__int32 *)((char *)v14 + a4);
    v12.i32[3] = *v15;
    a5 = (__int32 *)((char *)v15 + a4);
    result = vrhaddq_u8(v8, v12);
    *a7 = result.i32[0];
    *(_DWORD *)((char *)a7 + a6) = result.i32[1];
    v17 = (_DWORD *)((char *)a7 + a6 + a6);
    *v17 = result.i32[2];
    v18 = (_DWORD *)((char *)v17 + a6);
    v7 -= 4;
    *v18 = result.i32[3];
    a7 = (_DWORD *)((char *)v18 + a6);
  }
  while (v7 > 4);
  return result;
}

uint8x8_t sub_1C982BE74(int a1, uint64_t a2, uint8x8_t *a3, uint64_t a4, uint8x8_t *a5, uint64_t a6, uint8x8_t *a7)
{
  int v7;
  uint8x8_t *v8;
  uint8x8_t v9;
  uint8x8_t *v10;
  uint8x8_t v11;
  uint8x8_t *v12;
  uint8x8_t v13;
  uint8x8_t *v14;
  uint8x8_t v15;
  uint8x8_t v16;
  uint8x8_t *v17;
  uint8x8_t *v18;
  uint8x8_t result;

  v7 = a1 + 4;
  do
  {
    v8 = (uint8x8_t *)((char *)a3 + a2 + a2);
    v9 = *v8;
    v10 = (uint8x8_t *)((char *)v8 + a2);
    v11 = *v10;
    v12 = (uint8x8_t *)((char *)a5 + a4 + a4);
    v13 = *v12;
    v14 = (uint8x8_t *)((char *)v12 + a4);
    v15 = *v14;
    v16 = vrhadd_u8(*(uint8x8_t *)((char *)a3 + a2), *(uint8x8_t *)((char *)a5 + a4));
    *a7 = vrhadd_u8(*a3, *a5);
    *(uint8x8_t *)((char *)a7 + a6) = v16;
    v17 = (uint8x8_t *)((char *)a7 + a6 + a6);
    *v17 = vrhadd_u8(v9, v13);
    v18 = (uint8x8_t *)((char *)v17 + a6);
    v7 -= 4;
    result = vrhadd_u8(v11, v15);
    *v18 = result;
    a3 = (uint8x8_t *)((char *)v10 + a2);
    a5 = (uint8x8_t *)((char *)v14 + a4);
    a7 = (uint8x8_t *)((char *)v18 + a6);
  }
  while (v7 > 4);
  return result;
}

uint8x16_t sub_1C982BEF8(int a1, uint64_t a2, uint8x16_t *a3, uint64_t a4, uint8x16_t *a5, uint64_t a6, uint8x16_t *a7)
{
  int v7;
  uint8x16_t *v8;
  uint8x16_t v9;
  uint8x16_t *v10;
  uint8x16_t v11;
  uint8x16_t *v12;
  uint8x16_t v13;
  uint8x16_t *v14;
  uint8x16_t v15;
  uint8x16_t v16;
  uint8x16_t *v17;
  uint8x16_t *v18;
  uint8x16_t result;

  v7 = a1 + 4;
  do
  {
    v8 = (uint8x16_t *)((char *)a3 + a2 + a2);
    v9 = *v8;
    v10 = (uint8x16_t *)((char *)v8 + a2);
    v11 = *v10;
    v12 = (uint8x16_t *)((char *)a5 + a4 + a4);
    v13 = *v12;
    v14 = (uint8x16_t *)((char *)v12 + a4);
    v15 = *v14;
    v16 = vrhaddq_u8(*(uint8x16_t *)((char *)a3 + a2), *(uint8x16_t *)((char *)a5 + a4));
    *a7 = vrhaddq_u8(*a3, *a5);
    *(uint8x16_t *)((char *)a7 + a6) = v16;
    v17 = (uint8x16_t *)((char *)a7 + a6 + a6);
    *v17 = vrhaddq_u8(v9, v13);
    v18 = (uint8x16_t *)((char *)v17 + a6);
    v7 -= 4;
    result = vrhaddq_u8(v11, v15);
    *v18 = result;
    a3 = (uint8x16_t *)((char *)v10 + a2);
    a5 = (uint8x16_t *)((char *)v14 + a4);
    a7 = (uint8x16_t *)((char *)v18 + a6);
  }
  while (v7 > 4);
  return result;
}

uint8x16_t sub_1C982BF7C(int a1, uint64_t a2, uint8x16_t *a3, uint64_t a4, uint8x16_t *a5, uint64_t a6, uint8x16_t *a7)
{
  int v7;
  uint8x16_t result;
  uint8x16_t v9;
  uint8x16_t v10;
  uint8x16_t v11;
  uint8x16_t *v12;

  v7 = a1 + 2;
  do
  {
    result = vrhaddq_u8(*a3, *a5);
    v9 = vrhaddq_u8(a3[1], a5[1]);
    v10 = vrhaddq_u8(*(uint8x16_t *)((char *)a3 + a2), *(uint8x16_t *)((char *)a5 + a4));
    v11 = vrhaddq_u8(*(uint8x16_t *)((char *)&a3[1] + a2), *(uint8x16_t *)((char *)&a5[1] + a4));
    *a7 = result;
    a7[1] = v9;
    v12 = (uint8x16_t *)((char *)a7 + a6);
    v7 -= 2;
    *v12 = v10;
    v12[1] = v11;
    a3 = (uint8x16_t *)((char *)a3 + a2 + a2);
    a5 = (uint8x16_t *)((char *)a5 + a4 + a4);
    a7 = (uint8x16_t *)((char *)a7 + a6 + a6);
  }
  while (v7 > 2);
  return result;
}

uint8x16_t sub_1C982BFD0(int a1, uint64_t a2, uint8x16_t *a3, uint64_t a4, uint8x16_t *a5, uint64_t a6, uint8x16_t *a7)
{
  int v7;
  uint8x16_t *v8;
  uint8x16_t *v9;
  uint8x16_t *v10;
  uint8x16_t result;
  uint8x16_t v12;
  uint8x16_t v13;
  uint8x16_t v14;

  v7 = a1 + 1;
  v8 = a3 + 2;
  v9 = a5 + 2;
  v10 = a7 + 2;
  do
  {
    result = vrhaddq_u8(v8[-2], v9[-2]);
    v12 = vrhaddq_u8(v8[-1], v9[-1]);
    v13 = vrhaddq_u8(*v8, *v9);
    v14 = vrhaddq_u8(v8[1], v9[1]);
    v10[-2] = result;
    v10[-1] = v12;
    --v7;
    *v10 = v13;
    v10[1] = v14;
    v8 = (uint8x16_t *)((char *)v8 + a2);
    v9 = (uint8x16_t *)((char *)v9 + a4);
    v10 = (uint8x16_t *)((char *)v10 + a6);
  }
  while (v7 > 1);
  return result;
}

int8x8_t sub_1C982C024(int a1, uint64_t a2, uint8x8_t *a3, uint64_t a4, uint8x8_t *a5, uint64_t a6, int8x8_t *a7)
{
  int v7;
  uint8x8_t *v8;
  uint8x8_t v9;
  uint8x8_t *v10;
  uint8x8_t *v11;
  uint8x8_t v12;
  uint8x8_t *v13;
  int16x8_t v14;
  int8x8_t v15;
  int8x8_t *v16;
  int8x8_t *v17;
  int8x8_t result;

  v7 = a1 + 4;
  do
  {
    v8 = (uint8x8_t *)((char *)a3 + a2 + a2);
    v9 = *v8;
    v10 = (uint8x8_t *)((char *)v8 + a2);
    v11 = (uint8x8_t *)((char *)a5 + a4 + a4);
    v12 = *v11;
    v13 = (uint8x8_t *)((char *)v11 + a4);
    v14 = (int16x8_t)vsubw_u8(vshll_n_u8(*v10, 1uLL), *v13);
    v15 = vqmovun_s16((int16x8_t)vsubw_u8(vshll_n_u8(*(uint8x8_t *)((char *)a3 + a2), 1uLL), *(uint8x8_t *)((char *)a5 + a4)));
    *a7 = vqmovun_s16((int16x8_t)vsubw_u8(vshll_n_u8(*a3, 1uLL), *a5));
    *(int8x8_t *)((char *)a7 + a6) = v15;
    v16 = (int8x8_t *)((char *)a7 + a6 + a6);
    *v16 = vqmovun_s16((int16x8_t)vsubw_u8(vshll_n_u8(v9, 1uLL), v12));
    v17 = (int8x8_t *)((char *)v16 + a6);
    v7 -= 4;
    result = vqmovun_s16(v14);
    *v17 = result;
    a3 = (uint8x8_t *)((char *)v10 + a2);
    a5 = (uint8x8_t *)((char *)v13 + a4);
    a7 = (int8x8_t *)((char *)v17 + a6);
  }
  while (v7 > 4);
  return result;
}

uint64_t sub_1C982C0C8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  char v8;
  char v9;
  uint8x8_t *v10;
  uint8x8_t *v11;
  int8x8_t *v12;
  int8x8_t v13;
  int8x8_t v14;
  int8x8_t v15;
  BOOL v16;

  do
  {
    v7 = 0;
    v8 = 1;
    do
    {
      v9 = v8;
      v10 = (uint8x8_t *)(a3 + v7);
      v11 = (uint8x8_t *)(a5 + v7);
      v12 = (int8x8_t *)(a7 + v7);
      v13 = vqmovun_s16((int16x8_t)vsubw_u8(vshll_n_u8(*(uint8x8_t *)((char *)v10 + a2), 1uLL), *(uint8x8_t *)((char *)v11 + a4)));
      v14 = vqmovun_s16((int16x8_t)vsubw_u8(vshll_n_u8(*(uint8x8_t *)((char *)v10 + 2 * a2), 1uLL), *(uint8x8_t *)((char *)v11 + 2 * a4)));
      v15 = vqmovun_s16((int16x8_t)vsubw_u8(vshll_n_u8(*(uint8x8_t *)((char *)v10 + 3 * a2), 1uLL), *(uint8x8_t *)((char *)v11 + 3 * a4)));
      *v12 = vqmovun_s16((int16x8_t)vsubw_u8(vshll_n_u8(*v10, 1uLL), *v11));
      *(int8x8_t *)((char *)v12 + a6) = v13;
      *(int8x8_t *)((char *)v12 + 2 * a6) = v14;
      *(int8x8_t *)((char *)v12 + 3 * a6) = v15;
      v7 = 8;
      v8 = 0;
    }
    while ((v9 & 1) != 0);
    a3 += 4 * a2;
    a5 += 4 * a4;
    a7 += 4 * a6;
    v16 = __OFSUB__((_DWORD)result, 4);
    result = (result - 4);
  }
  while (!(((int)result < 0) ^ v16 | ((_DWORD)result == 0)));
  return result;
}

uint64_t sub_1C982C190(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
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
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int8x8_t v20;
  int8x8_t v21;
  int8x8_t v22;
  BOOL v23;

  v7 = 4 * a2;
  v8 = a7 + 3 * a6;
  v9 = a7 + 2 * a6;
  v10 = 4 * a4;
  v11 = 4 * a6;
  v12 = a7 + a6;
  v13 = a5 + 3 * a4;
  v14 = a5 + a4;
  v15 = a3 + 3 * a2;
  v16 = a3 + a2;
  v17 = a5 + 2 * a4;
  v18 = a3 + 2 * a2;
  do
  {
    v19 = -8;
    do
    {
      v20 = vqmovun_s16((int16x8_t)vsubw_u8(vshll_n_u8(*(uint8x8_t *)(v16 + v19 + 8), 1uLL), *(uint8x8_t *)(v14 + v19 + 8)));
      v21 = vqmovun_s16((int16x8_t)vsubw_u8(vshll_n_u8(*(uint8x8_t *)(v18 + v19 + 8), 1uLL), *(uint8x8_t *)(v17 + v19 + 8)));
      v22 = vqmovun_s16((int16x8_t)vsubw_u8(vshll_n_u8(*(uint8x8_t *)(v15 + v19 + 8), 1uLL), *(uint8x8_t *)(v13 + v19 + 8)));
      *(int8x8_t *)(a7 + v19 + 8) = vqmovun_s16((int16x8_t)vsubw_u8(vshll_n_u8(*(uint8x8_t *)(a3 + v19 + 8), 1uLL), *(uint8x8_t *)(a5 + v19 + 8)));
      *(int8x8_t *)(v12 + v19 + 8) = v20;
      *(int8x8_t *)(v9 + v19 + 8) = v21;
      *(int8x8_t *)(v8 + v19 + 8) = v22;
      v19 += 8;
    }
    while (v19 < 0x18);
    a3 += v7;
    a5 += v10;
    a7 += v11;
    v8 += v11;
    v9 += v11;
    v12 += v11;
    v13 += v10;
    v17 += v10;
    v14 += v10;
    v15 += v7;
    v18 += v7;
    v16 += v7;
    v23 = __OFSUB__((_DWORD)result, 4);
    result = (result - 4);
  }
  while (!(((int)result < 0) ^ v23 | ((_DWORD)result == 0)));
  return result;
}

uint64_t sub_1C982C2B0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
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
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int8x8_t v20;
  int8x8_t v21;
  int8x8_t v22;
  BOOL v23;

  v7 = 4 * a2;
  v8 = a7 + 3 * a6;
  v9 = a7 + 2 * a6;
  v10 = 4 * a4;
  v11 = 4 * a6;
  v12 = a7 + a6;
  v13 = a5 + 3 * a4;
  v14 = a5 + a4;
  v15 = a3 + 3 * a2;
  v16 = a3 + a2;
  v17 = a5 + 2 * a4;
  v18 = a3 + 2 * a2;
  do
  {
    v19 = -8;
    do
    {
      v20 = vqmovun_s16((int16x8_t)vsubw_u8(vshll_n_u8(*(uint8x8_t *)(v16 + v19 + 8), 1uLL), *(uint8x8_t *)(v14 + v19 + 8)));
      v21 = vqmovun_s16((int16x8_t)vsubw_u8(vshll_n_u8(*(uint8x8_t *)(v18 + v19 + 8), 1uLL), *(uint8x8_t *)(v17 + v19 + 8)));
      v22 = vqmovun_s16((int16x8_t)vsubw_u8(vshll_n_u8(*(uint8x8_t *)(v15 + v19 + 8), 1uLL), *(uint8x8_t *)(v13 + v19 + 8)));
      *(int8x8_t *)(a7 + v19 + 8) = vqmovun_s16((int16x8_t)vsubw_u8(vshll_n_u8(*(uint8x8_t *)(a3 + v19 + 8), 1uLL), *(uint8x8_t *)(a5 + v19 + 8)));
      *(int8x8_t *)(v12 + v19 + 8) = v20;
      *(int8x8_t *)(v9 + v19 + 8) = v21;
      *(int8x8_t *)(v8 + v19 + 8) = v22;
      v19 += 8;
    }
    while (v19 < 0x38);
    a3 += v7;
    a5 += v10;
    a7 += v11;
    v8 += v11;
    v9 += v11;
    v12 += v11;
    v13 += v10;
    v17 += v10;
    v14 += v10;
    v15 += v7;
    v18 += v7;
    v16 += v7;
    v23 = __OFSUB__((_DWORD)result, 4);
    result = (result - 4);
  }
  while (!(((int)result < 0) ^ v23 | ((_DWORD)result == 0)));
  return result;
}

uint16x4_t sub_1C982C3D0(int a1, uint64_t a2, uint16x4_t *a3, uint64_t a4, uint16x4_t *a5, uint64_t a6, uint16x4_t *a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint16x4_t *v11;
  uint16x4_t v12;
  uint16x4_t *v13;
  uint16x4_t v14;
  uint16x4_t *v15;
  uint16x4_t v16;
  uint16x4_t *v17;
  uint16x4_t v18;
  uint16x4_t v19;
  uint16x4_t *v20;
  uint16x4_t *v21;
  uint16x4_t result;

  v7 = 2 * a2;
  v8 = 2 * a4;
  v9 = 2 * a6;
  v10 = a1 + 4;
  do
  {
    v11 = (uint16x4_t *)((char *)a3 + v7 + v7);
    v12 = *v11;
    v13 = (uint16x4_t *)((char *)v11 + v7);
    v14 = *v13;
    v15 = (uint16x4_t *)((char *)a5 + v8 + v8);
    v16 = *v15;
    v17 = (uint16x4_t *)((char *)v15 + v8);
    v18 = *v17;
    v19 = vrhadd_u16(*(uint16x4_t *)((char *)a3 + 2 * a2), *(uint16x4_t *)((char *)a5 + 2 * a4));
    *a7 = vrhadd_u16(*a3, *a5);
    *(uint16x4_t *)((char *)a7 + 2 * a6) = v19;
    v20 = (uint16x4_t *)((char *)a7 + v9 + v9);
    *v20 = vrhadd_u16(v12, v16);
    v21 = (uint16x4_t *)((char *)v20 + v9);
    v10 -= 4;
    result = vrhadd_u16(v14, v18);
    *v21 = result;
    a3 = (uint16x4_t *)((char *)v13 + v7);
    a5 = (uint16x4_t *)((char *)v17 + v8);
    a7 = (uint16x4_t *)((char *)v21 + v9);
  }
  while (v10 > 4);
  return result;
}

uint16x8_t sub_1C982C460(int a1, uint64_t a2, uint16x8_t *a3, uint64_t a4, uint16x8_t *a5, uint64_t a6, uint16x8_t *a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint16x8_t *v11;
  uint16x8_t v12;
  uint16x8_t *v13;
  uint16x8_t v14;
  uint16x8_t *v15;
  uint16x8_t v16;
  uint16x8_t *v17;
  uint16x8_t v18;
  uint16x8_t v19;
  uint16x8_t *v20;
  uint16x8_t *v21;
  uint16x8_t result;

  v7 = 2 * a2;
  v8 = 2 * a4;
  v9 = 2 * a6;
  v10 = a1 + 4;
  do
  {
    v11 = (uint16x8_t *)((char *)a3 + v7 + v7);
    v12 = *v11;
    v13 = (uint16x8_t *)((char *)v11 + v7);
    v14 = *v13;
    v15 = (uint16x8_t *)((char *)a5 + v8 + v8);
    v16 = *v15;
    v17 = (uint16x8_t *)((char *)v15 + v8);
    v18 = *v17;
    v19 = vrhaddq_u16(*(uint16x8_t *)((char *)a3 + 2 * a2), *(uint16x8_t *)((char *)a5 + 2 * a4));
    *a7 = vrhaddq_u16(*a3, *a5);
    *(uint16x8_t *)((char *)a7 + 2 * a6) = v19;
    v20 = (uint16x8_t *)((char *)a7 + v9 + v9);
    *v20 = vrhaddq_u16(v12, v16);
    v21 = (uint16x8_t *)((char *)v20 + v9);
    v10 -= 4;
    result = vrhaddq_u16(v14, v18);
    *v21 = result;
    a3 = (uint16x8_t *)((char *)v13 + v7);
    a5 = (uint16x8_t *)((char *)v17 + v8);
    a7 = (uint16x8_t *)((char *)v21 + v9);
  }
  while (v10 > 4);
  return result;
}

uint16x8_t sub_1C982C4F0(int a1, uint64_t a2, uint16x8_t *a3, uint64_t a4, uint16x8_t *a5, uint64_t a6, uint16x8_t *a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint16x8_t result;
  uint16x8_t v12;
  uint16x8_t v13;
  uint16x8_t v14;
  uint16x8_t *v15;

  v7 = 2 * a2;
  v8 = 2 * a4;
  v9 = 2 * a6;
  v10 = a1 + 2;
  do
  {
    result = vrhaddq_u16(*a3, *a5);
    v12 = vrhaddq_u16(a3[1], a5[1]);
    v13 = vrhaddq_u16(*(uint16x8_t *)((char *)a3 + 2 * a2), *(uint16x8_t *)((char *)a5 + 2 * a4));
    v14 = vrhaddq_u16(*(uint16x8_t *)((char *)&a3[1] + v7), *(uint16x8_t *)((char *)&a5[1] + v8));
    *a7 = result;
    a7[1] = v12;
    v15 = (uint16x8_t *)((char *)a7 + v9);
    v10 -= 2;
    *v15 = v13;
    v15[1] = v14;
    a3 = (uint16x8_t *)((char *)a3 + v7 + v7);
    a5 = (uint16x8_t *)((char *)a5 + v8 + v8);
    a7 = (uint16x8_t *)((char *)a7 + v9 + v9);
  }
  while (v10 > 2);
  return result;
}

uint16x8_t sub_1C982C550(int a1, uint64_t a2, uint16x8_t *a3, uint64_t a4, uint16x8_t *a5, uint64_t a6, uint16x8_t *a7)
{
  int v7;
  uint16x8_t *v8;
  uint16x8_t *v9;
  uint16x8_t *v10;
  uint16x8_t result;
  uint16x8_t v12;
  uint16x8_t v13;
  uint16x8_t v14;

  v7 = a1 + 1;
  v8 = a3 + 2;
  v9 = a5 + 2;
  v10 = a7 + 2;
  do
  {
    result = vrhaddq_u16(v8[-2], v9[-2]);
    v12 = vrhaddq_u16(v8[-1], v9[-1]);
    v13 = vrhaddq_u16(*v8, *v9);
    v14 = vrhaddq_u16(v8[1], v9[1]);
    v10[-2] = result;
    v10[-1] = v12;
    --v7;
    *v10 = v13;
    v10[1] = v14;
    v8 = (uint16x8_t *)((char *)v8 + 2 * a2);
    v9 = (uint16x8_t *)((char *)v9 + 2 * a4);
    v10 = (uint16x8_t *)((char *)v10 + 2 * a6);
  }
  while (v7 > 1);
  return result;
}

uint16x8_t sub_1C982C5B0(int a1, uint64_t a2, uint16x8_t *a3, uint64_t a4, uint16x8_t *a5, uint64_t a6, uint16x8_t *a7)
{
  int v7;
  uint16x8_t *v8;
  uint16x8_t *v9;
  uint16x8_t *v10;
  uint16x8_t v11;
  uint16x8_t v12;
  uint16x8_t v13;
  uint16x8_t result;
  uint16x8_t v15;
  uint16x8_t v16;
  uint16x8_t v17;

  v7 = a1 + 1;
  v8 = a3 + 4;
  v9 = a5 + 4;
  v10 = a7 + 4;
  do
  {
    v11 = vrhaddq_u16(v8[-3], v9[-3]);
    v12 = vrhaddq_u16(v8[-2], v9[-2]);
    v13 = vrhaddq_u16(v8[-1], v9[-1]);
    v10[-4] = vrhaddq_u16(v8[-4], v9[-4]);
    v10[-3] = v11;
    v10[-2] = v12;
    v10[-1] = v13;
    result = vrhaddq_u16(*v8, *v9);
    v15 = vrhaddq_u16(v8[1], v9[1]);
    v16 = vrhaddq_u16(v8[2], v9[2]);
    v17 = vrhaddq_u16(v8[3], v9[3]);
    *v10 = result;
    v10[1] = v15;
    --v7;
    v10[2] = v16;
    v10[3] = v17;
    v8 = (uint16x8_t *)((char *)v8 + 2 * a2);
    v9 = (uint16x8_t *)((char *)v9 + 2 * a4);
    v10 = (uint16x8_t *)((char *)v10 + 2 * a6);
  }
  while (v7 > 1);
  return result;
}

void sub_1C982C638(int a1, uint64_t a2, int16x8_t *a3, uint64_t a4, int16x8_t *a5, uint64_t a6, int16x8_t *a7)
{
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 8 * a2;
  v14 = a1 + 4;
  v15 = 8 * a4;
  v16 = 8 * a6;
  do
  {
    sub_1C982C8F4(a2, a3, a4, a5, a6, a7);
    v14 -= 4;
    a3 = (int16x8_t *)((char *)a3 + v13);
    a5 = (int16x8_t *)((char *)a5 + v15);
    a7 = (int16x8_t *)((char *)a7 + v16);
  }
  while (v14 > 4);
}

void sub_1C982C6CC(int a1, uint64_t a2, int16x8_t *a3, uint64_t a4, int16x8_t *a5, uint64_t a6, int16x8_t *a7)
{
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 8 * a2;
  v14 = a1 + 4;
  v15 = 8 * a4;
  v16 = 8 * a6;
  do
  {
    sub_1C982C8F4(a2, a3, a4, a5, a6, a7);
    sub_1C982C8F4(a2, a3 + 1, a4, a5 + 1, a6, a7 + 1);
    v14 -= 4;
    a3 = (int16x8_t *)((char *)a3 + v13);
    a5 = (int16x8_t *)((char *)a5 + v15);
    a7 = (int16x8_t *)((char *)a7 + v16);
  }
  while (v14 > 4);
}

void sub_1C982C77C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;

  v18 = 8 * a4;
  v19 = 8 * a6;
  v14 = 8 * a2;
  do
  {
    v15 = 0;
    v16 = -8;
    do
    {
      sub_1C982C8F4(a2, (int16x8_t *)(a3 + v15), a4, (int16x8_t *)(a5 + v15), a6, (int16x8_t *)(a7 + v15));
      v16 += 8;
      v15 += 16;
    }
    while (v16 < 0x18);
    a7 += v19;
    a5 += v18;
    a3 += v14;
    v17 = __OFSUB__(a1, 4);
    a1 -= 4;
  }
  while (!((a1 < 0) ^ v17 | (a1 == 0)));
}

void sub_1C982C838(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;

  v18 = 8 * a4;
  v19 = 8 * a6;
  v14 = 8 * a2;
  do
  {
    v15 = 0;
    v16 = -8;
    do
    {
      sub_1C982C8F4(a2, (int16x8_t *)(a3 + v15), a4, (int16x8_t *)(a5 + v15), a6, (int16x8_t *)(a7 + v15));
      v16 += 8;
      v15 += 16;
    }
    while (v16 < 0x38);
    a7 += v19;
    a5 += v18;
    a3 += v14;
    v17 = __OFSUB__(a1, 4);
    a1 -= 4;
  }
  while (!((a1 < 0) ^ v17 | (a1 == 0)));
}

int16x8_t sub_1C982C8F4(uint64_t a1, int16x8_t *a2, uint64_t a3, int16x8_t *a4, uint64_t a5, int16x8_t *a6)
{
  int16x8_t v6;
  int16x8_t result;
  int16x8_t v8;
  int16x8_t v9;
  int16x8_t v10;

  v6.i64[0] = 0xFC00FC00FC00FC00;
  v6.i64[1] = 0xFC00FC00FC00FC00;
  result = vminq_s16(vmaxq_s16(vsubq_s16(vaddq_s16(*a2, *a2), *a4), (int16x8_t)0), v6);
  v8 = vminq_s16(vmaxq_s16(vsubq_s16(vaddq_s16(*(int16x8_t *)((char *)a2 + 2 * a1), *(int16x8_t *)((char *)a2 + 2 * a1)), *(int16x8_t *)((char *)a4 + 2 * a3)), (int16x8_t)0), v6);
  v9 = vminq_s16(vmaxq_s16(vsubq_s16(vaddq_s16(*(int16x8_t *)((char *)a2 + 4 * a1), *(int16x8_t *)((char *)a2 + 4 * a1)), *(int16x8_t *)((char *)a4 + 4 * a3)), (int16x8_t)0), v6);
  v10 = vminq_s16(vmaxq_s16(vsubq_s16(vaddq_s16(*(int16x8_t *)((char *)a2 + 6 * a1), *(int16x8_t *)((char *)a2 + 6 * a1)), *(int16x8_t *)((char *)a4 + 6 * a3)), (int16x8_t)0), v6);
  *a6 = result;
  *(int16x8_t *)((char *)a6 + 2 * a5) = v8;
  *(int16x8_t *)((char *)a6 + 4 * a5) = v9;
  *(int16x8_t *)((char *)a6 + 6 * a5) = v10;
  return result;
}

BOOL sub_1C982C998(unsigned int a1, unsigned int a2, unsigned int a3, uint64_t *a4, uint64_t a5, _QWORD *a6, uint64_t a7, uint64_t a8, double a9, double a10, int16x4_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int8x16_t *a15)
{
  uint64_t v15;
  int32x4_t v16;
  int16x8_t v17;
  int8x16_t v18;
  uint64_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  char v23;
  int8x16_t v24;
  __int128 *v25;
  uint32x4_t v26;
  char v27;
  int8x16_t v28;
  int8x16_t v29;
  uint64_t *v30;
  int16x8_t v31;
  int16x8_t v32;
  int32x4_t v33;
  int32x4_t v34;
  int8x16_t v35;
  int32x4_t v36;
  int8x16_t v37;
  int32x4_t v38;
  int8x16_t v39;
  int16x8_t v40;
  int8x16_t v41;

  v15 = 0;
  v16 = vdupq_n_s32(a1);
  v17 = vdupq_n_s16(a3);
  a11.i32[0] = a3;
  v18 = vtstq_s8(*a15, *a15);
  v19 = 2 * a5;
  v20 = vdupq_n_s32(-a2);
  v21 = vdupq_n_s32(a2);
  v22 = vdupq_n_s32(8 - a2);
  v23 = 1;
  v24 = 0uLL;
  v25 = &xmmword_1C9861810;
  v26.i64[0] = 0x200000002;
  v26.i64[1] = 0x200000002;
  do
  {
    v27 = v23;
    v28 = (int8x16_t)*v25;
    v29 = (int8x16_t)v25[1];
    v25 += 2;
    v31.i64[0] = *a4;
    v30 = (uint64_t *)((char *)a4 + v19);
    v31.i64[1] = *v30;
    a4 = (uint64_t *)((char *)v30 + v19);
    v32 = vabsq_s16(v31);
    v33 = vmull_lane_s16(*(int16x4_t *)v32.i8, a11, 0);
    v34 = vmull_high_s16(v32, v17);
    *(int32x4_t *)(a12 + v15) = v33;
    *(int32x4_t *)(a12 + 4 * a13 + v15) = v34;
    v35 = (int8x16_t)vshlq_s32(vmlal_lane_s16(v16, *(int16x4_t *)v32.i8, a11, 0), v20);
    v36 = (int32x4_t)vandq_s8(vorrq_s8(vqtbl1q_s8(v18, v28), (int8x16_t)vcgtq_u32((uint32x4_t)v35, v26)), v35);
    *(int32x4_t *)(a8 + v15) = vshlq_s32(vsubq_s32(v33, vshlq_s32(v36, v21)), v22);
    v37 = (int8x16_t)vshlq_s32(vaddq_s32(v34, v16), v20);
    v38 = (int32x4_t)vandq_s8(vorrq_s8(vqtbl1q_s8(v18, v29), (int8x16_t)vcgtq_u32((uint32x4_t)v37, v26)), v37);
    *(int32x4_t *)(a8 + 4 * a13 + v15) = vshlq_s32(vsubq_s32(v34, vshlq_s32(v38, v21)), v22);
    v39 = (int8x16_t)vqmovn_high_s32(vqmovn_s32(v36), v38);
    v40 = vcltzq_s16(v31);
    v41 = (int8x16_t)vsubq_s16((int16x8_t)veorq_s8(v39, (int8x16_t)v40), v40);
    v24 = vorrq_s8(v41, v24);
    *a6 = v41.i64[0];
    *(_QWORD *)((char *)a6 + 2 * a7) = v41.i64[1];
    a6 = (_QWORD *)((char *)a6 + 4 * a7);
    v15 += 8 * a13;
    v23 = 0;
  }
  while ((v27 & 1) != 0);
  v16.i16[0] = vmaxvq_u16((uint16x8_t)v24);
  return v16.i32[0] != 0;
}

uint64_t sub_1C982CABC(unsigned int a1, unsigned int a2, unsigned int a3, int16x8_t *a4, uint64_t a5, int8x16_t *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  int v13;
  __int16 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  sub_1C982DCD8(8, a2, a12 + 16, a4, a5, a6, a7, a8, vdupq_n_s32(a1), vdupq_n_s16(a3), a9, a10, &v13);
  return ((_WORD)v13 != 0) | (2 * (*((_WORD *)&v13 + *(unsigned __int8 *)(a11 + 1)) != 0)) | (4
                                                                                              * (*((_WORD *)&v13
                                                                                                 + *(unsigned __int8 *)(a11 + 2)) != 0)) | (8 * (v14 != 0));
}

uint64_t sub_1C982CB74(unsigned int a1, unsigned int a2, unsigned int a3, int16x8_t *a4, uint64_t a5, int8x16_t *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int8x16_t *a11, uint64_t a12)
{
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v15;
  uint16x8_t v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  sub_1C982DCD8(16, a2, a12 + 80, a4, a5, a6, a7, a8, vdupq_n_s32(a1), vdupq_n_s16(a3), a9, a10, v17);
  v12 = (int8x16_t)vqmovn_high_u16(vqmovn_u16(v17[0]), v17[1]);
  v13 = vandq_s8(vqtbl1q_s8(vtstq_s8(v12, v12), *a11), (int8x16_t)xmmword_1C9863020);
  v14 = vpaddq_s8(v13, v13);
  v15 = vpaddq_s8(v14, v14);
  return vpaddq_s8(v15, v15).u16[0];
}

double sub_1C982CC1C(unsigned int a1, unsigned int a2, unsigned int a3, int16x8_t *a4, uint64_t a5, int8x16_t *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int8x16_t *a11, uint64_t a12)
{
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int8x16_t v16;
  double result;
  uint16x8_t v18[8];
  uint64_t v19;
  int8x16x4_t v20;

  v19 = *MEMORY[0x1E0C80C00];
  sub_1C982DCD8(32, a2, a12 + 336, a4, a5, a6, a7, a8, vdupq_n_s32(a1), vdupq_n_s16(a3), a9, a10, v18);
  v12 = (int8x16_t)vqmovn_high_u16(vqmovn_u16(v18[0]), v18[1]);
  v20.val[0] = vtstq_s8(v12, v12);
  v13 = (int8x16_t)vqmovn_high_u16(vqmovn_u16(v18[2]), v18[3]);
  v20.val[1] = vtstq_s8(v13, v13);
  v14 = (int8x16_t)vqmovn_high_u16(vqmovn_u16(v18[4]), v18[5]);
  v20.val[2] = vtstq_s8(v14, v14);
  v15 = (int8x16_t)vqmovn_high_u16(vqmovn_u16(v18[6]), v18[7]);
  v20.val[3] = vtstq_s8(v15, v15);
  v16 = vpaddq_s8(vpaddq_s8(vandq_s8(vqtbl4q_s8(v20, *a11), (int8x16_t)xmmword_1C9863020), vandq_s8(vqtbl4q_s8(v20, a11[1]), (int8x16_t)xmmword_1C9863020)), vpaddq_s8(vandq_s8(vqtbl4q_s8(v20, a11[2]), (int8x16_t)xmmword_1C9863020), vandq_s8(vqtbl4q_s8(v20, a11[3]), (int8x16_t)xmmword_1C9863020)));
  *(_QWORD *)&result = vpaddq_s8(v16, v16).u64[0];
  return result;
}

BOOL sub_1C982CD14(unsigned int a1, unsigned int a2, unsigned int a3, uint64_t *a4, uint64_t a5, _QWORD *a6, uint64_t a7, int32x4_t *a8, double a9, double a10, int16x4_t a11, uint64_t a12, int8x16_t *a13)
{
  int32x4_t v13;
  int16x8_t v14;
  int8x16_t v15;
  uint64_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int32x4_t v19;
  char v20;
  int8x16_t v21;
  __int128 *v22;
  uint32x4_t v23;
  char v24;
  int8x16_t v25;
  int8x16_t v26;
  uint64_t *v27;
  int16x8_t v28;
  int16x8_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int8x16_t v32;
  int32x4_t v33;
  int8x16_t v34;
  int32x4_t v35;
  int8x16_t v36;
  int16x8_t v37;
  int8x16_t v38;

  v13 = vdupq_n_s32(a1);
  v14 = vdupq_n_s16(a3);
  a11.i32[0] = a3;
  v15 = vtstq_s8(*a13, *a13);
  v16 = 2 * a5;
  v17 = vdupq_n_s32(-a2);
  v18 = vdupq_n_s32(a2);
  v19 = vdupq_n_s32(8 - a2);
  v20 = 1;
  v21 = 0uLL;
  v22 = &xmmword_1C9861810;
  v23.i64[0] = 0x200000002;
  v23.i64[1] = 0x200000002;
  do
  {
    v24 = v20;
    v25 = (int8x16_t)*v22;
    v26 = (int8x16_t)v22[1];
    v22 += 2;
    v28.i64[0] = *a4;
    v27 = (uint64_t *)((char *)a4 + v16);
    v28.i64[1] = *v27;
    a4 = (uint64_t *)((char *)v27 + v16);
    v29 = vabsq_s16(v28);
    v30 = vmull_lane_s16(*(int16x4_t *)v29.i8, a11, 0);
    v31 = vmull_high_s16(v29, v14);
    v32 = (int8x16_t)vshlq_s32(vmlal_lane_s16(v13, *(int16x4_t *)v29.i8, a11, 0), v17);
    v33 = (int32x4_t)vandq_s8(vorrq_s8(vqtbl1q_s8(v15, v25), (int8x16_t)vcgtq_u32((uint32x4_t)v32, v23)), v32);
    *a8 = vshlq_s32(vsubq_s32(v30, vshlq_s32(v33, v18)), v19);
    v34 = (int8x16_t)vshlq_s32(vaddq_s32(v31, v13), v17);
    v35 = (int32x4_t)vandq_s8(vorrq_s8(vqtbl1q_s8(v15, v26), (int8x16_t)vcgtq_u32((uint32x4_t)v34, v23)), v34);
    *(int32x4_t *)((char *)a8 + 4 * a12) = vshlq_s32(vsubq_s32(v31, vshlq_s32(v35, v18)), v19);
    v36 = (int8x16_t)vqmovn_high_s32(vqmovn_s32(v33), v35);
    v37 = vcltzq_s16(v28);
    v38 = (int8x16_t)vsubq_s16((int16x8_t)veorq_s8(v36, (int8x16_t)v37), v37);
    v21 = vorrq_s8(v38, v21);
    *a6 = v38.i64[0];
    *(_QWORD *)((char *)a6 + 2 * a7) = v38.i64[1];
    a6 = (_QWORD *)((char *)a6 + 4 * a7);
    a8 = (int32x4_t *)((char *)a8 + 8 * a12);
    v20 = 0;
  }
  while ((v24 & 1) != 0);
  v13.i16[0] = vmaxvq_u16((uint16x8_t)v21);
  return v13.i32[0] != 0;
}

BOOL sub_1C982CE24(unsigned int a1, unsigned int a2, __int32 a3, int16x4_t *a4, uint64_t a5, _QWORD *a6, uint64_t a7, int32x4_t *a8, double a9, double a10, double a11, double a12, uint16x4_t a13, uint64_t a14)
{
  uint32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int8x8_t v18;
  int v19;
  int16x4_t v20;
  uint16x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;

  v14 = (uint32x4_t)vdupq_n_s32(a1);
  v15 = vdupq_n_s32(-a2);
  v16 = vdupq_n_s32(a2);
  v17 = vdupq_n_s32(8 - a2);
  a13.i32[0] = a3;
  v18 = 0;
  v19 = 4;
  do
  {
    v20 = vcltz_s16(*a4);
    v21 = (uint16x4_t)vabs_s16(*a4);
    v22 = (int32x4_t)vmull_lane_u16(v21, a13, 0);
    v23 = vshlq_s32((int32x4_t)vmlal_lane_u16(v14, v21, a13, 0), v15);
    v24 = vshlq_s32(vsubq_s32(v22, vshlq_s32(v23, v16)), v17);
    *(int16x4_t *)v23.i8 = vsub_s16((int16x4_t)veor_s8((int8x8_t)vqmovn_s32(v23), (int8x8_t)v20), v20);
    *a6 = v23.i64[0];
    *a8 = v24;
    v18 = vorr_s8(*(int8x8_t *)v23.i8, v18);
    a4 = (int16x4_t *)((char *)a4 + 2 * a5);
    a6 = (_QWORD *)((char *)a6 + 2 * a7);
    a8 = (int32x4_t *)((char *)a8 + 4 * a14);
    --v19;
  }
  while (v19);
  return *(_QWORD *)&v18 != 0;
}

BOOL sub_1C982CEC0(unsigned int a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int32x4_t *a8, uint64_t a9, uint64_t a10)
{
  return sub_1C982DBBC(8, a2, a10 + 16, a4, a5, a6, a7, a8, vdupq_n_s32(a1), vdupq_n_s16(a3), a9);
}

BOOL sub_1C982CEDC(unsigned int a1, unsigned int a2, __int32 a3, int16x8_t *a4, uint64_t a5, int8x16_t *a6, uint64_t a7, int32x4_t *a8, double a9, double a10, double a11, double a12, uint16x4_t a13, uint64_t a14)
{
  return sub_1C982DAF8(8, a1, a2, a3, a4, a5, a6, a7, a9, a10, a11, a12, a13, a8, a14);
}

BOOL sub_1C982CF0C(unsigned int a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int32x4_t *a8, uint64_t a9, uint64_t a10)
{
  return sub_1C982DBBC(16, a2, a10 + 80, a4, a5, a6, a7, a8, vdupq_n_s32(a1), vdupq_n_s16(a3), a9);
}

uint64_t sub_1C982CF28(unsigned int a1, unsigned int a2, __int32 a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, double a12, uint16x4_t a13, uint64_t a14)
{
  uint64_t v21;
  char v22;
  char v23;
  char v24;
  BOOL v25;

  v21 = 0;
  v22 = 0;
  v23 = 1;
  do
  {
    v24 = v23;
    v25 = sub_1C982DAF8(16, a1, a2, a3, (int16x8_t *)(a4 + 2 * v21), a5, (int8x16_t *)(a6 + 2 * v21), a7, a9, a10, a11, a12, a13, (int32x4_t *)(a8 + 4 * v21), a14);
    v23 = 0;
    v22 |= v25;
    v21 = 8;
  }
  while ((v24 & 1) != 0);
  return v22 & 1;
}

BOOL sub_1C982CFE0(unsigned int a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int32x4_t *a8, uint64_t a9, uint64_t a10)
{
  return sub_1C982DBBC(32, a2, a10 + 336, a4, a5, a6, a7, a8, vdupq_n_s32(a1), vdupq_n_s16(a3), a9);
}

uint64_t sub_1C982CFFC(unsigned int a1, unsigned int a2, __int32 a3, int16x8_t *a4, uint64_t a5, int8x16_t *a6, uint64_t a7, int32x4_t *a8, double a9, double a10, double a11, double a12, uint16x4_t a13, uint64_t a14)
{
  int v21;
  unint64_t v22;

  v21 = 0;
  v22 = -8;
  do
  {
    v21 |= sub_1C982DAF8(32, a1, a2, a3, a4, a5, a6, a7, a9, a10, a11, a12, a13, a8, a14);
    v22 += 8;
    a8 += 2;
    ++a6;
    ++a4;
  }
  while (v22 < 0x18);
  return v21 & 1;
}

uint64_t sub_1C982D0B0(uint64_t result, __int32 a2, int16x4_t *a3, uint64_t a4, int16x4_t *a5, uint64_t a6, double a7, int16x4_t a8)
{
  int32x4_t v8;
  char v9;
  char v10;
  int16x4_t v11;

  v8 = vdupq_n_s32(-(int)result);
  a8.i32[0] = a2;
  v9 = 1;
  do
  {
    v10 = v9;
    v11 = vqmovn_s32(vrshlq_s32(vmull_lane_s16(*(int16x4_t *)((char *)a3 + 2 * a4), a8, 0), v8));
    *a5 = vqmovn_s32(vrshlq_s32(vmull_lane_s16(*a3, a8, 0), v8));
    *(int16x4_t *)((char *)a5 + 2 * a6) = v11;
    a3 = (int16x4_t *)((char *)a3 + 4 * a4);
    a5 = (int16x4_t *)((char *)a5 + 4 * a6);
    v9 = 0;
  }
  while ((v10 & 1) != 0);
  return result;
}

uint64_t sub_1C982D110(uint64_t result, __int32 a2, int16x4_t *a3, uint64_t a4, int16x8_t *a5, uint64_t a6, double a7, int16x4_t a8)
{
  int32x4_t v8;
  unsigned int v9;
  int16x8_t v10;

  v8 = vdupq_n_s32(-(int)result);
  a8.i32[0] = a2;
  v9 = -2;
  do
  {
    v10 = vqmovn_high_s32(vqmovn_s32(vrshlq_s32(vmull_lane_s16(*(int16x4_t *)((char *)a3 + 2 * a4), a8, 0), v8)), vrshlq_s32(vmull_high_lane_s16(*(int16x8_t *)&a3->i8[2 * a4], a8, 0), v8));
    *a5 = vqmovn_high_s32(vqmovn_s32(vrshlq_s32(vmull_lane_s16(*a3, a8, 0), v8)), vrshlq_s32(vmull_high_lane_s16(*(int16x8_t *)a3->i8, a8, 0), v8));
    *(int16x8_t *)((char *)a5 + 2 * a6) = v10;
    a3 = (int16x4_t *)((char *)a3 + 4 * a4);
    a5 = (int16x8_t *)((char *)a5 + 4 * a6);
    v9 += 2;
  }
  while (v9 < 6);
  return result;
}

uint64_t sub_1C982D188(uint64_t result, __int32 a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7, int16x4_t a8)
{
  uint64_t v8;
  int32x4_t v9;
  char v10;
  char v11;
  int16x4_t *v12;
  unsigned int v13;
  int16x8_t *v14;
  int16x8_t v15;

  v8 = 0;
  v9 = vdupq_n_s32(-(int)result);
  a8.i32[0] = a2;
  v10 = 1;
  do
  {
    v11 = v10;
    v12 = (int16x4_t *)(a3 + 2 * v8);
    v13 = -2;
    v14 = (int16x8_t *)(a5 + 2 * v8);
    do
    {
      v15 = vqmovn_high_s32(vqmovn_s32(vrshlq_s32(vmull_lane_s16(*(int16x4_t *)((char *)v12 + 2 * a4), a8, 0), v9)), vrshlq_s32(vmull_high_lane_s16(*(int16x8_t *)&v12->i8[2 * a4], a8, 0), v9));
      *v14 = vqmovn_high_s32(vqmovn_s32(vrshlq_s32(vmull_lane_s16(*v12, a8, 0), v9)), vrshlq_s32(vmull_high_lane_s16(*(int16x8_t *)v12->i8, a8, 0), v9));
      *(int16x8_t *)((char *)v14 + 2 * a6) = v15;
      v12 = (int16x4_t *)((char *)v12 + 4 * a4);
      v14 = (int16x8_t *)((char *)v14 + 4 * a6);
      v13 += 2;
    }
    while (v13 < 0xE);
    v10 = 0;
    v8 = 8;
  }
  while ((v11 & 1) != 0);
  return result;
}

uint64_t sub_1C982D220(uint64_t result, __int32 a2, int16x4_t *a3, uint64_t a4, int16x8_t *a5, uint64_t a6, double a7, int16x4_t a8)
{
  unint64_t v8;
  int32x4_t v9;
  unsigned int v10;
  int16x8_t *v11;
  int16x4_t *v12;
  int16x8_t v13;
  BOOL v14;

  v8 = 0;
  v9 = vdupq_n_s32(-(int)result);
  a8.i32[0] = a2;
  do
  {
    v10 = -2;
    v11 = a5;
    v12 = a3;
    do
    {
      v13 = vqmovn_high_s32(vqmovn_s32(vrshlq_s32(vmull_lane_s16(*(int16x4_t *)((char *)v12 + 2 * a4), a8, 0), v9)), vrshlq_s32(vmull_high_lane_s16(*(int16x8_t *)&v12->i8[2 * a4], a8, 0), v9));
      *v11 = vqmovn_high_s32(vqmovn_s32(vrshlq_s32(vmull_lane_s16(*v12, a8, 0), v9)), vrshlq_s32(vmull_high_lane_s16(*(int16x8_t *)v12->i8, a8, 0), v9));
      *(int16x8_t *)((char *)v11 + 2 * a6) = v13;
      v12 = (int16x4_t *)((char *)v12 + 4 * a4);
      v11 = (int16x8_t *)((char *)v11 + 4 * a6);
      v10 += 2;
    }
    while (v10 < 0x1E);
    a3 += 2;
    ++a5;
    v14 = v8 >= 0x18;
    v8 += 8;
  }
  while (!v14);
  return result;
}

BOOL sub_1C982D2BC(unsigned int a1, unsigned int a2, uint64_t a3, int16x4_t *a4, uint64_t a5, _QWORD *a6, uint64_t a7, int32x4_t *a8, uint64_t a9)
{
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t *v13;
  char v14;
  int8x16_t v15;
  char v16;
  int32x4_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int8x16_t v25;

  v9 = vdupq_n_s32(a1);
  v10 = vdupq_n_s32(-a2);
  v11 = vdupq_n_s32(a2);
  v12 = vdupq_n_s32(8 - a2);
  v13 = (int32x4_t *)(a3 + 20);
  v14 = 1;
  v15 = 0uLL;
  do
  {
    v16 = v14;
    v17 = vmovl_s16(*a4);
    v18 = vmovl_s16(*(int16x4_t *)((char *)a4 + 2 * a5));
    v19 = vmulq_s32(vabsq_s32(v17), v13[-1]);
    v20 = vmulq_s32(vabsq_s32(v18), *v13);
    v21 = vshlq_s32(vaddq_s32(v19, v9), v10);
    v22 = vshlq_s32(vaddq_s32(v20, v9), v10);
    v23 = vcltzq_s32(v17);
    v24 = vcltzq_s32(v18);
    v25 = (int8x16_t)vqmovn_high_s32(vqmovn_s32(vsubq_s32((int32x4_t)veorq_s8((int8x16_t)v21, (int8x16_t)v23), v23)), vsubq_s32((int32x4_t)veorq_s8((int8x16_t)v22, (int8x16_t)v24), v24));
    *a8 = vshlq_s32(vsubq_s32(v19, vshlq_s32(v21, v11)), v12);
    *(int32x4_t *)((char *)a8 + 4 * a9) = vshlq_s32(vsubq_s32(v20, vshlq_s32(v22, v11)), v12);
    *a6 = v25.i64[0];
    *(_QWORD *)((char *)a6 + 2 * a7) = v25.i64[1];
    v13 += 2;
    v15 = vorrq_s8(v25, v15);
    a4 = (int16x4_t *)((char *)a4 + 4 * a5);
    a6 = (_QWORD *)((char *)a6 + 4 * a7);
    a8 = (int32x4_t *)((char *)a8 + 8 * a9);
    v14 = 0;
  }
  while ((v16 & 1) != 0);
  v9.i16[0] = vmaxvq_u16((uint16x8_t)v15);
  return v9.i32[0] != 0;
}

BOOL sub_1C982D3B4(unsigned int a1, unsigned int a2, uint64_t a3, int16x4_t *a4, uint64_t a5, int8x16_t *a6, uint64_t a7, int32x4_t *a8, uint64_t a9)
{
  uint64_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int16x4_t *v14;
  int32x4_t *v15;
  int8x16_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int8x16_t v25;

  v9 = 0;
  v10 = vdupq_n_s32(a1);
  v11 = vdupq_n_s32(-a2);
  v12 = vdupq_n_s32(a2);
  v13 = vdupq_n_s32(8 - a2);
  v14 = a4 + 1;
  v15 = a8 + 1;
  v16 = 0uLL;
  do
  {
    v17 = vmovl_s16(v14[-1]);
    v18 = vmovl_s16(*v14);
    v19 = vmulq_s32(vabsq_s32(v17), *(int32x4_t *)(a3 + v9 + 4));
    v20 = vmulq_s32(vabsq_s32(v18), *(int32x4_t *)(a3 + v9 + 20));
    v21 = vshlq_s32(vaddq_s32(v19, v10), v11);
    v22 = vshlq_s32(vaddq_s32(v20, v10), v11);
    v23 = vcltzq_s32(v17);
    v24 = vcltzq_s32(v18);
    v25 = (int8x16_t)vqmovn_high_s32(vqmovn_s32(vsubq_s32((int32x4_t)veorq_s8((int8x16_t)v21, (int8x16_t)v23), v23)), vsubq_s32((int32x4_t)veorq_s8((int8x16_t)v22, (int8x16_t)v24), v24));
    v15[-1] = vshlq_s32(vsubq_s32(v19, vshlq_s32(v21, v12)), v13);
    *v15 = vshlq_s32(vsubq_s32(v20, vshlq_s32(v22, v12)), v13);
    *a6 = v25;
    v9 += 32;
    v16 = vorrq_s8(v25, v16);
    v14 = (int16x4_t *)((char *)v14 + 2 * a5);
    a6 = (int8x16_t *)((char *)a6 + 2 * a7);
    v15 = (int32x4_t *)((char *)v15 + 4 * a9);
  }
  while ((_DWORD)v9 != 256);
  v10.i16[0] = vmaxvq_u16((uint16x8_t)v16);
  return v10.i32[0] != 0;
}

BOOL sub_1C982D498(unsigned int a1, unsigned int a2, int8x16_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned int v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int32x4_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int8x16_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int8x16_t v34;
  int32x4_t v35;
  BOOL v36;

  v9 = 0;
  v10 = (int32x4_t)vqtbl1q_s8(*a3, (int8x16_t)xmmword_1C9863030);
  v11 = vdupq_n_s32(a1);
  v12 = vdupq_n_s32(-a2);
  v13 = vdupq_n_s32(a2);
  v14 = (int32x4_t)vqtbl1q_s8(*a3, (int8x16_t)xmmword_1C9863040);
  v15 = a6 + 2 * a7;
  v16 = 4 * a7;
  v17 = a8 + 4 * a9;
  v18 = vdupq_n_s32(8 - a2);
  v19 = 8 * a9;
  v20 = a4 + 2 * a5;
  v21 = 4 * a5;
  v22 = 0uLL;
  do
  {
    v23 = 0;
    v24 = 0;
    v25 = -4;
    do
    {
      v26 = vmovl_s16(*(int16x4_t *)(a4 + v24));
      v27 = vmovl_s16(*(int16x4_t *)(v20 + v24));
      v28 = vmulq_s32(vabsq_s32(v26), v10);
      v29 = vmulq_s32(vabsq_s32(v27), v14);
      v30 = vshlq_s32(vaddq_s32(v28, v11), v12);
      v31 = vshlq_s32(vaddq_s32(v29, v11), v12);
      v32 = vcltzq_s32(v26);
      v33 = vcltzq_s32(v27);
      v34 = (int8x16_t)vqmovn_high_s32(vqmovn_s32(vsubq_s32((int32x4_t)veorq_s8((int8x16_t)v30, (int8x16_t)v32), v32)), vsubq_s32((int32x4_t)veorq_s8((int8x16_t)v31, (int8x16_t)v33), v33));
      *(int32x4_t *)(a8 + v23) = vshlq_s32(vsubq_s32(v28, vshlq_s32(v30, v13)), v18);
      v35 = vshlq_s32(vsubq_s32(v29, vshlq_s32(v31, v13)), v18);
      *(int32x4_t *)(v17 + v23) = v35;
      *(_QWORD *)(a6 + v24) = v34.i64[0];
      *(_QWORD *)(v15 + v24) = v34.i64[1];
      v22 = vorrq_s8(v34, v22);
      v35.i64[0] = *(uint64_t *)((char *)&a3->i64[v24 / 8 + 1] + 4);
      v25 += 4;
      v14 = vzip1q_s32(v35, v35);
      v24 += 8;
      v23 += 16;
      v10 = v14;
    }
    while (v25 < 0xC);
    a3 = (int8x16_t *)((char *)a3 + v24);
    v15 += v16;
    a6 += v16;
    v17 += v19;
    a8 += v19;
    v20 += v21;
    a4 += v21;
    v10 = v14;
    v36 = v9 >= 0xE;
    v9 += 2;
  }
  while (!v36);
  v11.i16[0] = vmaxvq_u16((uint16x8_t)v22);
  return v11.i32[0] != 0;
}

BOOL sub_1C982D5EC(unsigned int a1, unsigned int a2, int8x16_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int32x4_t *a8, uint64_t a9)
{
  unsigned int v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  uint64_t v15;
  uint64_t v16;
  int32x4_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int8x16_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  int32x4_t *v27;
  int32x4_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int32x4_t v34;
  int32x4_t v35;
  int8x16_t v36;
  int32x4_t v37;
  int32x4_t v38;
  int32x4_t v39;
  int32x4_t v40;
  int32x4_t v41;
  int32x4_t v42;
  int32x4_t v43;
  int32x4_t v44;
  int8x16_t v45;
  const float *v46;
  unint64_t v47;
  BOOL v48;

  v9 = 0;
  v10 = (int32x4_t)vqtbl1q_s8(*a3, (int8x16_t)xmmword_1C9863050);
  v11 = vdupq_lane_s32(*(int32x2_t *)a3->i8, 1);
  v12 = vdupq_n_s32(a1);
  v13 = vdupq_n_s32(-a2);
  v14 = vdupq_n_s32(a2);
  v15 = 8 * a7;
  v16 = a6 + 4 * a7;
  v17 = vdupq_n_s32(8 - a2);
  v18 = a6 + 2 * a7;
  v19 = a6 + 6 * a7;
  v20 = 8 * a5;
  v21 = a4 + 6 * a5;
  v22 = 0uLL;
  v23 = a4 + 4 * a5;
  v24 = a4 + 2 * a5;
  do
  {
    v25 = 0;
    v26 = 0;
    v27 = a8;
    do
    {
      v28 = vmovl_s16(*(int16x4_t *)(a4 + v25));
      v29 = vmovl_s16(*(int16x4_t *)(v24 + v25));
      v30 = vmulq_s32(vabsq_s32(v28), v10);
      v31 = vmulq_s32(vabsq_s32(v29), v11);
      v32 = vshlq_s32(vaddq_s32(v30, v12), v13);
      v33 = vshlq_s32(vaddq_s32(v31, v12), v13);
      v34 = vcltzq_s32(v28);
      v35 = vcltzq_s32(v29);
      v36 = (int8x16_t)vqmovn_high_s32(vqmovn_s32(vsubq_s32((int32x4_t)veorq_s8((int8x16_t)v32, (int8x16_t)v34), v34)), vsubq_s32((int32x4_t)veorq_s8((int8x16_t)v33, (int8x16_t)v35), v35));
      *v27 = vshlq_s32(vsubq_s32(v30, vshlq_s32(v32, v14)), v17);
      *(int32x4_t *)((char *)v27 + 4 * a9) = vshlq_s32(vsubq_s32(v31, vshlq_s32(v33, v14)), v17);
      *(_QWORD *)(a6 + v25) = v36.i64[0];
      *(_QWORD *)(v18 + v25) = v36.i64[1];
      v37 = vmovl_s16(*(int16x4_t *)(v23 + v25));
      v38 = vmovl_s16(*(int16x4_t *)(v21 + v25));
      v39 = vmulq_s32(vabsq_s32(v37), v11);
      v40 = vmulq_s32(vabsq_s32(v38), v11);
      v41 = vshlq_s32(vaddq_s32(v39, v12), v13);
      v42 = vshlq_s32(vaddq_s32(v40, v12), v13);
      v43 = vcltzq_s32(v37);
      v44 = vcltzq_s32(v38);
      *(int32x4_t *)((char *)v27 + 8 * a9) = vshlq_s32(vsubq_s32(v39, vshlq_s32(v41, v14)), v17);
      *(int32x4_t *)((char *)v27 + 12 * a9) = vshlq_s32(vsubq_s32(v40, vshlq_s32(v42, v14)), v17);
      v45 = (int8x16_t)vqmovn_high_s32(vqmovn_s32(vsubq_s32((int32x4_t)veorq_s8((int8x16_t)v41, (int8x16_t)v43), v43)), vsubq_s32((int32x4_t)veorq_s8((int8x16_t)v42, (int8x16_t)v44), v44));
      *(_QWORD *)(v16 + v25) = v45.i64[0];
      *(_QWORD *)(v19 + v25) = v45.i64[1];
      v46 = (const float *)&a3->i32[v26 + 2];
      v10 = (int32x4_t)vld1q_dup_f32(v46);
      v47 = v26 * 4 + 4;
      v25 += 8;
      v22 = vorrq_s8(vorrq_s8(v36, v22), v45);
      ++v27;
      v11 = v10;
      v48 = v26++ >= 7;
    }
    while (!v48);
    a3 = (int8x16_t *)((char *)a3 + v47);
    v19 += v15;
    v16 += v15;
    v18 += v15;
    a6 += v15;
    a8 += a9;
    v21 += v20;
    v23 += v20;
    v24 += v20;
    a4 += v20;
    v11 = v10;
    v48 = v9 >= 0x1C;
    v9 += 4;
  }
  while (!v48);
  v12.i16[0] = vmaxvq_u16((uint16x8_t)v22);
  return v12.i32[0] != 0;
}

int16x8_t sub_1C982D7F4(int a1, unsigned int a2, uint64_t a3, int16x4_t *a4, uint64_t a5, _QWORD *a6, uint64_t a7)
{
  int8x16_t v7;
  int8x16_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int16x8_t v11;
  int16x8_t result;

  v7 = (int8x16_t)vmovl_u8(*(uint8x8_t *)(a3 + 1));
  v8 = (int8x16_t)vmovl_u8(*(uint8x8_t *)(a3 + 9));
  v9 = vdupq_n_s32(a2);
  v10 = vdupq_n_s32(-a1);
  v11 = vqmovn_high_s32(vqmovn_s32(vrshlq_s32(vmulq_s32(vmull_s16(*a4, *(int16x4_t *)v7.i8), v9), v10)), vrshlq_s32(vmulq_s32(vmull_s16(*(int16x4_t *)((char *)a4 + 2 * a5), (int16x4_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)), v9), v10));
  *a6 = v11.i64[0];
  *(_QWORD *)((char *)a6 + 2 * a7) = v11.i64[1];
  result = vqmovn_high_s32(vqmovn_s32(vrshlq_s32(vmulq_s32(vmull_s16(*(int16x4_t *)((char *)a4 + 4 * a5), *(int16x4_t *)v8.i8), v9), v10)), vrshlq_s32(vmulq_s32(vmull_s16(*(int16x4_t *)((char *)a4 + 4 * a5 + 2 * a5), (int16x4_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL)), v9), v10));
  *(_QWORD *)((char *)a6 + 4 * a7) = result.i64[0];
  *(_QWORD *)((char *)a6 + 6 * a7) = result.i64[1];
  return result;
}

uint64_t sub_1C982D894(uint64_t result, unsigned int a2, uint64_t a3, int16x4_t *a4, uint64_t a5, int16x8_t *a6, uint64_t a7)
{
  int32x4_t v7;
  int32x4_t v8;
  uint8x8_t *v9;
  unsigned int v10;
  int16x8_t v11;
  uint8x8_t v12;
  int16x8_t v13;

  v7 = vdupq_n_s32(a2);
  v8 = vdupq_n_s32(-(int)result);
  v9 = (uint8x8_t *)(a3 + 9);
  v10 = -2;
  do
  {
    v11 = (int16x8_t)vmovl_u8(v9[-1]);
    *a6 = vqmovn_high_s32(vqmovn_s32(vrshlq_s32(vmulq_s32(vmull_s16(*a4, *(int16x4_t *)v11.i8), v7), v8)), vrshlq_s32(vmulq_s32(vmull_high_s16(*(int16x8_t *)a4->i8, v11), v7), v8));
    v12 = *v9;
    v9 += 2;
    v13 = (int16x8_t)vmovl_u8(v12);
    *(int16x8_t *)((char *)a6 + 2 * a7) = vqmovn_high_s32(vqmovn_s32(vrshlq_s32(vmulq_s32(vmull_s16(*(int16x4_t *)((char *)a4 + 2 * a5), *(int16x4_t *)v13.i8), v7), v8)), vrshlq_s32(vmulq_s32(vmull_high_s16(*(int16x8_t *)&a4->i8[2 * a5], v13), v7), v8));
    a4 = (int16x4_t *)((char *)a4 + 4 * a5);
    a6 = (int16x8_t *)((char *)a6 + 4 * a7);
    v10 += 2;
  }
  while (v10 < 6);
  return result;
}

uint64_t sub_1C982D930(uint64_t result, unsigned int a2, uint64_t a3, int16x4_t *a4, uint64_t a5, int16x8_t *a6, uint64_t a7)
{
  int v7;
  int8x16_t v8;
  int16x8_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int16x4_t *v12;
  int16x8_t *v13;
  int16x8_t v14;

  v7 = 0;
  v8 = *(int8x16_t *)(a3 + 1);
  v9 = (int16x8_t)vqtbl1q_s8(v8, (int8x16_t)xmmword_1C9863060);
  v9.i8[0] = *(_BYTE *)a3;
  v10 = vdupq_n_s32(a2);
  v11 = vdupq_n_s32(-(int)result);
  v12 = a4 + 2;
  v13 = a6 + 1;
  do
  {
    v13[-1] = vqmovn_high_s32(vqmovn_s32(vrshlq_s32(vmulq_s32(vmull_s16(v12[-2], *(int16x4_t *)v9.i8), v10), v11)), vrshlq_s32(vmulq_s32(vmull_high_s16(*(int16x8_t *)v12[-2].i8, v9), v10), v11));
    v14 = (int16x8_t)vqtbl1q_s8(v8, (int8x16_t)xmmword_1C9863070);
    *v13 = vqmovn_high_s32(vqmovn_s32(vrshlq_s32(vmulq_s32(vmull_s16(*v12, *(int16x4_t *)v14.i8), v10), v11)), vrshlq_s32(vmulq_s32(vmull_high_s16(*(int16x8_t *)v12->i8, v14), v10), v11));
    a3 += v7 & 8;
    v8 = *(int8x16_t *)(a3 + 1);
    v9 = (int16x8_t)vqtbl1q_s8(v8, (int8x16_t)xmmword_1C9863060);
    v12 = (int16x4_t *)((char *)v12 + 2 * a5);
    v13 = (int16x8_t *)((char *)v13 + 2 * a7);
    v7 += 8;
  }
  while (v7 != 128);
  return result;
}

unint64_t sub_1C982D9E8(int a1, unsigned int a2, int8x16_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  unsigned int v7;
  int8x16_t v8;
  int32x4_t v9;
  int32x4_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t result;
  int16x8_t v21;
  int16x8_t v22;
  const char *v23;
  uint8x8_t v24;
  BOOL v25;

  v7 = 0;
  v8 = vqtbl1q_s8(*a3, (int8x16_t)xmmword_1C9863080);
  v9 = vdupq_n_s32(a2);
  v10 = vdupq_n_s32(-a1);
  v11 = a6 + 6 * a7;
  v12 = 8 * a7;
  v13 = a6 + 4 * a7;
  v14 = a6 + 2 * a7;
  v15 = 8 * a5;
  v16 = a4 + 6 * a5;
  v17 = a4 + 4 * a5;
  v18 = a4 + 2 * a5;
  do
  {
    v19 = 0;
    result = -4;
    do
    {
      v21 = vqmovn_high_s32(vqmovn_s32(vrshlq_s32(vmulq_s32(vmull_s16(*(int16x4_t *)(a4 + 8 * v19), *(int16x4_t *)v8.i8), v9), v10)), vrshlq_s32(vmulq_s32(vmull_s16(*(int16x4_t *)(v18 + 8 * v19), (int16x4_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL)), v9), v10));
      *(_QWORD *)(a6 + 8 * v19) = v21.i64[0];
      *(_QWORD *)(v14 + 8 * v19) = v21.i64[1];
      v22 = vqmovn_high_s32(vqmovn_s32(vrshlq_s32(vmulq_s32(vmull_lane_s16(*(int16x4_t *)(v17 + 8 * v19), *(int16x4_t *)v8.i8, 1), v9), v10)), vrshlq_s32(vmulq_s32(vmull_lane_s16(*(int16x4_t *)(v16 + 8 * v19), *(int16x4_t *)v8.i8, 1), v9), v10));
      *(_QWORD *)(v13 + 8 * v19) = v22.i64[0];
      *(_QWORD *)(v11 + 8 * v19) = v22.i64[1];
      v23 = &a3->i8[v19 + 2];
      v24 = (uint8x8_t)vld1_dup_s8(v23);
      v8 = (int8x16_t)vmovl_u8(v24);
      result += 4;
      ++v19;
    }
    while (result < 0x1C);
    a3 = (int8x16_t *)((char *)a3 + v19);
    v11 += v12;
    v13 += v12;
    v14 += v12;
    a6 += v12;
    v16 += v15;
    v17 += v15;
    v18 += v15;
    a4 += v15;
    v25 = v7 >= 0x1C;
    v7 += 4;
  }
  while (!v25);
  return result;
}

BOOL sub_1C982DAF8(int a1, unsigned int a2, unsigned int a3, __int32 a4, int16x8_t *a5, uint64_t a6, int8x16_t *a7, uint64_t a8, double a9, double a10, double a11, double a12, uint16x4_t a13, int32x4_t *a14, uint64_t a15)
{
  uint32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int32x4_t *v19;
  int8x16_t v20;
  int16x8_t v21;
  uint16x8_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int8x16_t v28;

  v15 = (uint32x4_t)vdupq_n_s32(a2);
  v16 = vdupq_n_s32(-a3);
  v17 = vdupq_n_s32(a3);
  v18 = vdupq_n_s32(8 - a3);
  a13.i32[0] = a4;
  v19 = a14 + 1;
  v20 = 0uLL;
  do
  {
    v21 = vcltzq_s16(*a5);
    v22 = (uint16x8_t)vabsq_s16(*a5);
    v23 = (int32x4_t)vmull_lane_u16(*(uint16x4_t *)v22.i8, a13, 0);
    v24 = (int32x4_t)vmull_high_lane_u16(v22, a13, 0);
    v25 = (int32x4_t)vmlal_high_lane_u16(v15, v22, a13, 0);
    v26 = vshlq_s32((int32x4_t)vmlal_lane_u16(v15, *(uint16x4_t *)v22.i8, a13, 0), v16);
    v27 = vshlq_s32(v25, v16);
    v28 = (int8x16_t)vsubq_s16((int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(v26), v27), (int8x16_t)v21), v21);
    *a7 = v28;
    v19[-1] = vshlq_s32(vsubq_s32(v23, vshlq_s32(v26, v17)), v18);
    *v19 = vshlq_s32(vsubq_s32(v24, vshlq_s32(v27, v17)), v18);
    v20 = vorrq_s8(v28, v20);
    a5 = (int16x8_t *)((char *)a5 + 2 * a6);
    a7 = (int8x16_t *)((char *)a7 + 2 * a8);
    v19 = (int32x4_t *)((char *)v19 + 4 * a15);
    --a1;
  }
  while (a1);
  return vorr_s8(*(int8x8_t *)v20.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v20, v20, 8uLL)) != 0;
}

BOOL sub_1C982DBBC(int a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int32x4_t *a8, int32x4_t a9, int16x8_t a10, uint64_t a11)
{
  int8x16_t v11;
  int v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t *v16;
  int8x16_t v17;
  uint32x4_t v18;
  uint64_t v19;
  uint64_t v20;
  int32x4_t *v21;
  int16x8_t v22;
  int16x8_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int8x16_t v26;
  int32x4_t v27;
  int8x16_t v28;
  int32x4_t v29;
  int8x16_t v30;
  int16x8_t v31;

  v12 = 0;
  v13 = vdupq_n_s32(-a2);
  v14 = vdupq_n_s32(a2);
  v15 = vdupq_n_s32(8 - a2);
  v16 = a8 + 1;
  v17 = 0uLL;
  v18.i64[0] = 0x200000002;
  v18.i64[1] = 0x200000002;
  do
  {
    v19 = 0;
    v20 = 0;
    v21 = v16;
    do
    {
      *(int8x8_t *)v11.i8 = vtst_s8(*(int8x8_t *)(a3 + v20), *(int8x8_t *)(a3 + v20));
      v22 = *(int16x8_t *)(a4 + v19);
      v23 = vabsq_s16(v22);
      v24 = vmull_s16(*(int16x4_t *)v23.i8, *(int16x4_t *)a10.i8);
      v25 = vmull_high_s16(v23, a10);
      v26 = (int8x16_t)vshlq_s32(vmlal_s16(a9, *(int16x4_t *)v23.i8, *(int16x4_t *)a10.i8), v13);
      v27 = (int32x4_t)vandq_s8(vorrq_s8(vqtbl1q_s8(v11, (int8x16_t)xmmword_1C9863090), (int8x16_t)vcgtq_u32((uint32x4_t)v26, v18)), v26);
      v28 = (int8x16_t)vshlq_s32(vaddq_s32(v25, a9), v13);
      v29 = (int32x4_t)vandq_s8(vorrq_s8(vqtbl1q_s8(v11, (int8x16_t)xmmword_1C98630A0), (int8x16_t)vcgtq_u32((uint32x4_t)v28, v18)), v28);
      v21[-1] = vshlq_s32(vsubq_s32(v24, vshlq_s32(v27, v14)), v15);
      *v21 = vshlq_s32(vsubq_s32(v25, vshlq_s32(v29, v14)), v15);
      v30 = (int8x16_t)vqmovn_high_s32(vqmovn_s32(v27), v29);
      v31 = vcltzq_s16(v22);
      v11 = (int8x16_t)vsubq_s16((int16x8_t)veorq_s8(v30, (int8x16_t)v31), v31);
      v17 = vorrq_s8(v11, v17);
      *(int8x16_t *)(a6 + v19) = v11;
      v20 += 8;
      v19 += 16;
      v21 += 2;
    }
    while ((int)v20 < a1);
    a3 += v20;
    ++v12;
    a6 += 2 * a7;
    v16 = (int32x4_t *)((char *)v16 + 4 * a11);
    a4 += 2 * a5;
  }
  while (v12 != a1);
  a9.i16[0] = vmaxvq_u16((uint16x8_t)v17);
  return a9.i32[0] != 0;
}

uint64_t sub_1C982DCD8(uint64_t result, unsigned int a2, uint64_t a3, int16x8_t *a4, uint64_t a5, int8x16_t *a6, uint64_t a7, uint64_t a8, int32x4_t a9, int16x8_t a10, uint64_t a11, uint64_t a12, _DWORD *a13)
{
  int8x16_t v13;
  int v14;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint32x4_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int8x16_t *v29;
  int16x8_t *v30;
  uint64_t v31;
  int8x8_t *v32;
  int8x16_t v33;
  int v34;
  int8x16_t *v35;
  int16x8_t *v36;
  int8x16_t *v37;
  int32x4_t *v38;
  int16x8_t v39;
  int16x8_t v40;
  int32x4_t v41;
  int32x4_t v42;
  int8x16_t v43;
  int32x4_t v44;
  int8x16_t v45;
  int32x4_t v46;
  int32x4_t v47;
  int32x4_t v48;
  int8x16_t v49;
  int16x8_t v50;
  int8x16_t v51;
  uint16x8_t v52;

  v14 = 0;
  v16 = vdupq_n_s32(-a2);
  v17 = vdupq_n_s32(a2);
  v19 = vdupq_n_s32(8 - a2);
  v20 = 8 * a5;
  v21 = 2 * a5;
  v22 = 8 * a7;
  v23 = 2 * a7;
  v24 = 16 * a12;
  v25.i64[0] = 0x200000002;
  v25.i64[1] = 0x200000002;
  do
  {
    v26 = 0;
    v27 = a11;
    v28 = a8;
    v29 = a6;
    v30 = a4;
    do
    {
      v31 = 0;
      v32 = (int8x8_t *)(a3 + v26);
      v33 = 0uLL;
      v34 = 4;
      v35 = v29;
      v36 = v30;
      do
      {
        v37 = (int8x16_t *)(v28 + v31);
        v38 = (int32x4_t *)(v27 + v31);
        *(int8x8_t *)v13.i8 = vtst_s8(*v32, *v32);
        v39 = *v36;
        v40 = vabsq_s16(*v36);
        v41 = vmull_s16(*(int16x4_t *)v40.i8, *(int16x4_t *)a10.i8);
        v42 = vmull_high_s16(v40, a10);
        *v38 = v41;
        v38[1] = v42;
        v43 = (int8x16_t)vshlq_s32(vmlal_s16(a9, *(int16x4_t *)v40.i8, *(int16x4_t *)a10.i8), v16);
        v44 = (int32x4_t)vandq_s8(vorrq_s8(vqtbl1q_s8(v13, (int8x16_t)xmmword_1C9863090), (int8x16_t)vcgtq_u32((uint32x4_t)v43, v25)), v43);
        v45 = (int8x16_t)vshlq_s32(vaddq_s32(v42, a9), v16);
        v46 = (int32x4_t)vandq_s8(vorrq_s8(vqtbl1q_s8(v13, (int8x16_t)xmmword_1C98630A0), (int8x16_t)vcgtq_u32((uint32x4_t)v45, v25)), v45);
        v47 = vsubq_s32(v41, vshlq_s32(v44, v17));
        v48 = vshlq_s32(vsubq_s32(v42, vshlq_s32(v46, v17)), v19);
        v49 = (int8x16_t)vqmovn_high_s32(vqmovn_s32(v44), v46);
        v13 = (int8x16_t)vshlq_s32(v47, v19);
        v50 = vcltzq_s16(v39);
        v51 = (int8x16_t)vsubq_s16((int16x8_t)veorq_s8(v49, (int8x16_t)v50), v50);
        v32 = (int8x8_t *)((char *)v32 + result);
        *v37 = v13;
        v37[1] = (int8x16_t)v48;
        v33 = vorrq_s8(v51, v33);
        *v35 = v51;
        v36 = (int16x8_t *)((char *)v36 + v21);
        v35 = (int8x16_t *)((char *)v35 + v23);
        v31 += 4 * a12;
        --v34;
      }
      while (v34);
      v52 = vpmaxq_u16((uint16x8_t)v33, (uint16x8_t)v33);
      *a13++ = vpmaxq_u16(v52, v52).u32[0];
      v26 += 8;
      ++v30;
      ++v29;
      v28 += 32;
      v27 += 32;
    }
    while ((int)v26 < (int)result);
    a3 += (4 * result);
    v14 += 4;
    a4 = (int16x8_t *)((char *)a4 + v20);
    a6 = (int8x16_t *)((char *)a6 + v22);
    a8 += v24;
    a11 += v24;
  }
  while (v14 < (int)result);
  return result;
}

float sub_1C982DE78(int a1, uint64_t a2, uint64_t a3, _DWORD *a4, float *a5)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int32x4_t v9;
  int8x16_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t i;
  int16x8_t v14;
  int16x8_t v15;
  int16x8_t v16;
  int16x8_t v17;
  float result;

  if (a1 < 1)
  {
    v10 = 0uLL;
    v9 = 0uLL;
  }
  else
  {
    v5 = 0;
    v6 = 8 * a2;
    v7 = a3 + 6 * a2;
    v8 = a3 + 4 * a2;
    v9 = 0uLL;
    v10 = 0uLL;
    v11 = a3 + 2 * a2;
    do
    {
      v12 = 0;
      for (i = 0; i < a1; i += 4)
      {
        v14.i64[0] = *(_QWORD *)(a3 + v12);
        v14.i64[1] = *(_QWORD *)(v11 + v12);
        v15.i64[0] = *(_QWORD *)(v8 + v12);
        v15.i64[1] = *(_QWORD *)(v7 + v12);
        v16 = vabsq_s16(v14);
        v17 = vabsq_s16(v15);
        v10 = vaddq_s8(v10, vceqzq_s8(vqmovn_high_s16(vqmovn_s16(v16), v17)));
        v9 = (int32x4_t)vpadalq_u16(vpadalq_u16((uint32x4_t)v9, (uint16x8_t)v16), (uint16x8_t)v17);
        v12 += 8;
      }
      v5 += 4;
      v7 += v6;
      v8 += v6;
      v11 += v6;
      a3 += v6;
    }
    while (v5 < a1);
  }
  *a4 = a1 * a1 + vaddvq_s8(v10);
  result = COERCE_FLOAT(vaddvq_s32(v9));
  *a5 = result;
  return result;
}

float sub_1C982DF3C(int a1, uint64_t a2, uint64_t a3, _DWORD *a4, float *a5)
{
  int v5;
  uint64_t v6;
  int32x4_t v7;
  int8x16_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  int16x8_t v12;
  int16x8_t v13;
  float result;

  if (a1 < 1)
  {
    v8 = 0uLL;
    v7 = 0uLL;
  }
  else
  {
    v5 = 0;
    v6 = 4 * a2;
    v7 = 0uLL;
    v8 = 0uLL;
    v9 = a3 + 2 * a2;
    do
    {
      v10 = 0;
      for (i = 0; i < a1; i += 8)
      {
        v12 = vabsq_s16(*(int16x8_t *)(a3 + v10));
        v13 = vabsq_s16(*(int16x8_t *)(v9 + v10));
        v8 = vaddq_s8(v8, vceqzq_s8(vqmovn_high_s16(vqmovn_s16(v12), v13)));
        v7 = (int32x4_t)vpadalq_u16(vpadalq_u16((uint32x4_t)v7, (uint16x8_t)v12), (uint16x8_t)v13);
        v10 += 16;
      }
      v5 += 2;
      v9 += v6;
      a3 += v6;
    }
    while (v5 < a1);
  }
  *a4 = a1 * a1 + vaddlvq_s8(v8);
  result = COERCE_FLOAT(vaddvq_s32(v7));
  *a5 = result;
  return result;
}

uint64_t sub_1C982DFDC(int16x8_t *a1, unsigned int a2, int *a3, _WORD *a4)
{
  unsigned int v4;
  uint64_t result;
  unsigned int v6;

  v4 = vaddlvq_u16((uint16x8_t)vorrq_s8(vbicq_s8(xmmword_1C9861850[2 * (int)a2 + 1], (int8x16_t)vceqzq_s16(a1[1])), vbicq_s8(xmmword_1C9861850[2 * (int)a2], (int8x16_t)vceqzq_s16(*a1))));
  if (!v4)
    return 0xFFFFFFFFLL;
  *a4 = v4;
  result = __clz(v4) ^ 0x1FLL;
  v6 = byte_1C9861A40[64 * (unint64_t)a2 + result];
  *a3 = v6 & 3;
  a3[1] = v6 >> 2;
  return result;
}

uint64_t sub_1C982E04C(uint64_t a1, unsigned int a2, unsigned int *a3, _QWORD *a4)
{
  const double *v4;
  const double *v5;
  const double *v6;
  int64x2_t v7;
  int8x16_t *v8;
  int8x16_t v9;
  int16x8_t v10;
  int16x8_t v11;
  int16x8_t v12;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  int16x8_t v16;
  uint64_t result;
  unsigned int v18;
  float64x2x2_t v19;
  float64x2x2_t v20;
  float64x2x2_t v21;

  v4 = (const double *)(a1 + 32);
  v19 = vld2q_f64(v4);
  v5 = (const double *)(a1 + 64);
  v20 = vld2q_f64(v5);
  v6 = (const double *)(a1 + 96);
  v21 = vld2q_f64(v6);
  v7 = *(int64x2_t *)(a1 + 16);
  v8 = &xmmword_1C9861850[2 * (int)a2];
  v9 = v8[1];
  v10 = (int16x8_t)vorrq_s8(vbicq_s8(v9, (int8x16_t)vceqzq_s16((int16x8_t)v19.val[0])), vbicq_s8(*v8, (int8x16_t)vceqzq_s16((int16x8_t)vzip1q_s64(*(int64x2_t *)a1, v7))));
  v11 = (int16x8_t)vorrq_s8(vbicq_s8(v9, (int8x16_t)vceqzq_s16((int16x8_t)v19.val[1])), vbicq_s8(*v8, (int8x16_t)vceqzq_s16((int16x8_t)vzip2q_s64(*(int64x2_t *)a1, v7))));
  v12 = (int16x8_t)vorrq_s8(vbicq_s8(v9, (int8x16_t)vceqzq_s16((int16x8_t)v21.val[0])), vbicq_s8(*v8, (int8x16_t)vceqzq_s16((int16x8_t)v20.val[0])));
  v13 = (int16x8_t)vorrq_s8(vbicq_s8(v9, (int8x16_t)vceqzq_s16((int16x8_t)v21.val[1])), vbicq_s8(*v8, (int8x16_t)vceqzq_s16((int16x8_t)v20.val[1])));
  if (a2 == 1)
  {
    v14 = vpaddq_s16(v10, v11);
    v15 = vpaddq_s16(v12, v13);
  }
  else
  {
    v14 = vpaddq_s16(v10, v12);
    v15 = vpaddq_s16(v11, v13);
  }
  v16 = vpaddq_s16(v14, v15);
  v16.i64[0] = vpaddq_s16(v16, v16).u64[0];
  *a4 = v16.i64[0];
  result = 63 - __clz(v16.u64[0]);
  v18 = byte_1C9861A40[64 * (unint64_t)a2 + 16 + (result & 0xF)]
      + byte_1C98618B0[4 * a2 + (result >> 4)];
  *a3 = v18 & 7;
  a3[1] = v18 >> 3;
  return result;
}

uint64_t sub_1C982E150(int64x2_t *a1, int a2, unsigned int *a3, uint64_t a4)
{
  unint64_t v4;
  int8x16_t *v5;
  int8x16_t v6;
  int8x16_t v7;
  const double *i64;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  unsigned int v13;
  unint64_t v14;
  uint64_t result;
  unsigned int v16;
  float64x2x4_t v17;

  v4 = 0;
  v5 = &xmmword_1C9861850[2 * a2];
  v6 = *v5;
  v7 = v5[1];
  do
  {
    i64 = (const double *)a1[4].i64;
    v17 = vld4q_f64(i64);
    v17.val[0] = (float64x2_t)vpaddq_s16(vpaddq_s16((int16x8_t)vorrq_s8(vbicq_s8(v7, (int8x16_t)vceqzq_s16((int16x8_t)v17.val[0])), vbicq_s8(v6, (int8x16_t)vceqzq_s16((int16x8_t)vzip1q_s64(*a1, a1[2])))), (int16x8_t)vorrq_s8(vbicq_s8(v7, (int8x16_t)vceqzq_s16((int16x8_t)v17.val[1])), vbicq_s8(v6, (int8x16_t)vceqzq_s16((int16x8_t)vzip2q_s64(*a1, a1[2]))))), vpaddq_s16((int16x8_t)vorrq_s8(vbicq_s8(v7, (int8x16_t)vceqzq_s16((int16x8_t)v17.val[2])), vbicq_s8(v6, (int8x16_t)vceqzq_s16((int16x8_t)vzip1q_s64(a1[1], a1[3])))), (int16x8_t)vorrq_s8(vbicq_s8(v7, (int8x16_t)vceqzq_s16((int16x8_t)v17.val[3])), vbicq_s8(v6, (int8x16_t)vceqzq_s16((int16x8_t)vzip2q_s64(a1[1], a1[3]))))));
    *(_QWORD *)&v17.val[0].f64[0] = vpaddq_s16((int16x8_t)v17.val[0], (int16x8_t)v17.val[0]).u64[0];
    v9 = byte_1C9862680[v4 + 1];
    v10 = byte_1C9862680[v4 + 2];
    v11 = byte_1C9862680[v4 + 3];
    *(_WORD *)(a4 + 2 * byte_1C9862680[v4]) = LOWORD(v17.val[0].f64[0]);
    *(_WORD *)(a4 + 2 * v9) = WORD1(v17.val[0].f64[0]);
    *(_WORD *)(a4 + 2 * v10) = WORD2(v17.val[0].f64[0]);
    *(_WORD *)(a4 + 2 * v11) = HIWORD(v17.val[0].f64[0]);
    a1 += 8;
    v12 = v4 >= 0xC;
    v4 += 4;
  }
  while (!v12);
  v13 = 3;
  while (1)
  {
    v14 = *(_QWORD *)(a4 + 8 * v13);
    if (v14)
      break;
    if (--v13 == -1)
    {
      result = 0;
      goto LABEL_9;
    }
  }
  result = ((v13 << 6) | 0x3F) - __clz(v14);
LABEL_9:
  v16 = byte_1C9861A60[result & 0xF] + 4 * byte_1C9861A60[result >> 4];
  *a3 = v16 & 0xF;
  a3[1] = v16 >> 4;
  return result;
}

uint64_t sub_1C982E290(uint64_t a1, int a2, int *a3, uint64_t a4)
{
  uint64_t v4;
  int8x16_t *v5;
  int8x16_t v6;
  int8x16_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  int64x2_t *v11;
  int16x8_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  unsigned int v17;
  unint64_t v18;
  uint64_t result;
  unsigned int v20;
  unsigned int v21;

  LODWORD(v4) = 0;
  v5 = &xmmword_1C9861850[2 * a2];
  v6 = *v5;
  v7 = v5[1];
  do
  {
    v8 = 0;
    v4 = (int)v4;
    v9 = 1;
    do
    {
      v10 = v4;
      v11 = (int64x2_t *)(a1 + 2 * v8);
      v12 = vpaddq_s16(vpaddq_s16((int16x8_t)vorrq_s8(vbicq_s8(v7, (int8x16_t)vceqzq_s16((int16x8_t)vzip1q_s64(v11[8], v11[12]))), vbicq_s8(v6, (int8x16_t)vceqzq_s16((int16x8_t)vzip1q_s64(*v11, v11[4])))), (int16x8_t)vorrq_s8(vbicq_s8(v7, (int8x16_t)vceqzq_s16((int16x8_t)vzip2q_s64(v11[8], v11[12]))), vbicq_s8(v6, (int8x16_t)vceqzq_s16((int16x8_t)vzip2q_s64(*v11, v11[4]))))), vpaddq_s16((int16x8_t)vorrq_s8(vbicq_s8(v7, (int8x16_t)vceqzq_s16((int16x8_t)vzip1q_s64(v11[9], v11[13]))), vbicq_s8(v6, (int8x16_t)vceqzq_s16((int16x8_t)vzip1q_s64(v11[1], v11[5])))), (int16x8_t)vorrq_s8(vbicq_s8(v7, (int8x16_t)vceqzq_s16((int16x8_t)vzip2q_s64(v11[9], v11[13]))), vbicq_s8(v6, (int8x16_t)vceqzq_s16((int16x8_t)vzip2q_s64(v11[1], v11[5]))))));
      v12.i64[0] = vpaddq_s16(v12, v12).u64[0];
      v13 = byte_1C98626B0[v10 + 1];
      v14 = byte_1C98626B0[v10 + 2];
      v15 = byte_1C98626B0[v10 + 3];
      *(_WORD *)(a4 + 2 * byte_1C98626B0[v10]) = v12.i16[0];
      v16 = v9;
      *(_WORD *)(a4 + 2 * v13) = v12.i16[1];
      *(_WORD *)(a4 + 2 * v14) = v12.i16[2];
      *(_WORD *)(a4 + 2 * v15) = v12.i16[3];
      v4 = v10 + 4;
      v8 = 16;
      v9 = 0;
    }
    while ((v16 & 1) != 0);
    a1 += 256;
  }
  while ((int)v10 < 60);
  v17 = 15;
  while (1)
  {
    v18 = *(_QWORD *)(a4 + 8 * v17);
    if (v18)
      break;
    if (--v17 == -1)
    {
      result = 0;
      goto LABEL_10;
    }
  }
  result = ((v17 << 6) | 0x3F) - __clz(v18);
LABEL_10:
  v20 = byte_1C9861A00[(unint64_t)result >> 4];
  v21 = byte_1C9861A40[result & 0xF];
  *a3 = v21 & 3 | (4 * (v20 & 7));
  a3[1] = ((v20 >> 1) & 0x7C) + (v21 >> 2);
  return result;
}

uint64_t sub_1C982E414(uint64_t a1, uint64_t a2, int a3)
{
  int v4;
  int32x4_t v5;
  uint16x8_t v6;
  uint16x8_t v7;
  int32x4_t v8;
  int v9;
  int v10;
  int8x16_t v11;
  int32x4_t v12;
  int8x16_t v13;
  int8x16_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  uint64_t v18;
  uint64_t v19;
  uint16x8_t v20;
  uint16x8_t v21;
  uint16x8_t v22;
  int8x16_t v23;
  uint16x8_t v24;
  uint8x16_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  unsigned int v29;
  int *v30;
  int32x4_t v31;
  int v32;
  int64x2_t v33;
  int64x2_t v34;
  int64x2_t v35;
  int64x2_t v36;
  int64x2_t v37;
  int32x4_t v38;
  int64x2_t v39;
  const double *v40;
  int64x2_t v41;
  uint64_t v42;
  int32x4_t v43;
  uint64_t v44;
  int64x2_t v45;
  int64x2_t v46;
  int64x2_t v47;
  int64x2_t v48;
  int64x2_t v49;
  int16x8_t v50;
  uint8x16_t v51;
  int16x8_t v52;
  int16x8_t v53;
  unint64_t v54;
  uint64_t v55[3];

  v55[2] = *MEMORY[0x1E0C80C00];
  if (a3 < 4)
    return 0xFFFFFFFFLL;
  v4 = 1 << a3;
  if (a3 == 31)
  {
    v5 = 0uLL;
    v6 = 0uLL;
    v7 = 0uLL;
    v8 = 0uLL;
  }
  else
  {
    v9 = 0;
    if (v4 <= 1)
      v10 = 1;
    else
      v10 = 1 << a3;
    v11 = 0uLL;
    v7 = 0uLL;
    v12 = 0uLL;
    v13.i64[0] = 0x1010101010101010;
    v13.i64[1] = 0x1010101010101010;
    v14.i64[0] = 0x101010101010101;
    v14.i64[1] = 0x101010101010101;
    v15 = 0uLL;
    v16 = 0uLL;
    v17 = 0uLL;
    v18 = a2;
    v6 = 0uLL;
    do
    {
      v19 = 0;
      v20 = 0uLL;
      v21 = 0uLL;
      v22 = 0uLL;
      v23 = (int8x16_t)xmmword_1C9862BE0;
      v24 = 0uLL;
      do
      {
        v25 = *(uint8x16_t *)(v18 + v19);
        v21 = vmlal_u8(v21, *(uint8x8_t *)v25.i8, *(uint8x8_t *)v23.i8);
        v24 = vmlal_u8(v24, *(uint8x8_t *)v25.i8, *(uint8x8_t *)v11.i8);
        v6 = vaddw_u8(v6, *(uint8x8_t *)v25.i8);
        v20 = vmlal_high_u8(v20, v25, (uint8x16_t)v23);
        v22 = vmlal_high_u8(v22, v25, (uint8x16_t)v11);
        v7 = vaddw_high_u8(v7, v25);
        v23 = vaddq_s8(v23, v13);
        v19 += 16;
      }
      while (v19 < v4);
      v15 = (int32x4_t)vaddw_high_u16(vaddw_u16((uint32x4_t)v15, *(uint16x4_t *)v21.i8), v21);
      v12 = (int32x4_t)vaddw_high_u16(vaddw_u16((uint32x4_t)v12, *(uint16x4_t *)v20.i8), v20);
      v17 = (int32x4_t)vaddw_high_u16(vaddw_u16((uint32x4_t)v17, *(uint16x4_t *)v24.i8), v24);
      v16 = (int32x4_t)vaddw_high_u16(vaddw_u16((uint32x4_t)v16, *(uint16x4_t *)v22.i8), v22);
      v11 = vaddq_s8(v11, v14);
      v18 += a1;
      ++v9;
    }
    while (v9 != v10);
    v5 = vaddq_s32(v12, v15);
    v8 = vaddq_s32(v16, v17);
  }
  v26 = 0;
  v27 = vaddvq_s32(v5);
  v28 = vaddvq_s32(v8);
  v29 = vaddvq_s32((int32x4_t)vaddw_high_u16(vaddw_u16(vpaddlq_u16(v6), *(uint16x4_t *)v7.i8), v7));
  v30 = (int *)((char *)&unk_1C98618BC + 36 * (a3 - 2) + 8);
  do
  {
    v55[v26++ - 1] = *(v30 - 2) * v27 + *(v30 - 1) * (unint64_t)v28 + *v30 * (unint64_t)v29;
    v30 += 3;
  }
  while (v26 != 3);
  v31 = 0uLL;
  if (a3 != 31)
  {
    v32 = 0;
    v33 = vdupq_n_s64(v54);
    v34 = vaddq_s64(v33, v33);
    v35 = vshlq_n_s64(v33, 2uLL);
    v36 = vshlq_n_s64(v33, 3uLL);
    v37 = vdupq_lane_s64(v55[1], 0);
    v38 = 0uLL;
    v39.i64[0] = 0;
    v39.i64[1] = v54;
    v40 = (const double *)v55;
    v41 = (int64x2_t)vld1q_dup_f64(v40);
    v42 = v4;
    if (v4 <= 1)
      v4 = 1;
    v43 = 0uLL;
    do
    {
      v44 = 0;
      v45 = vaddq_s64(v37, v39);
      do
      {
        v46 = vaddq_s64(v45, v34);
        v47 = vaddq_s64(v46, v35);
        v48 = vaddq_s64(v45, v36);
        v49 = vaddq_s64(v46, v36);
        v50 = vuzp1q_s16((int16x8_t)vshrn_high_n_s64(vshrn_n_s64(v45, 0x18uLL), v46, 0x18uLL), (int16x8_t)vshrn_high_n_s64(vshrn_n_s64(vaddq_s64(v45, v35), 0x18uLL), v47, 0x18uLL));
        v51 = *(uint8x16_t *)(a2 + v44);
        v52 = vsubq_s16((int16x8_t)vmovl_u8(*(uint8x8_t *)v51.i8), v50);
        v53 = vsubq_s16((int16x8_t)vmovl_high_u8(v51), vuzp1q_s16((int16x8_t)vshrn_high_n_s64(vshrn_n_s64(v48, 0x18uLL), v49, 0x18uLL), (int16x8_t)vshrn_high_n_s64(vshrn_n_s64(vaddq_s64(v48, v35), 0x18uLL), vaddq_s64(v47, v36), 0x18uLL)));
        v38 = vmlal_high_s16(vmlal_s16(v38, *(int16x4_t *)v52.i8, *(int16x4_t *)v52.i8), v52, v52);
        v43 = vmlal_high_s16(vmlal_s16(v43, *(int16x4_t *)v53.i8, *(int16x4_t *)v53.i8), v53, v53);
        v44 += 16;
        v45 = vaddq_s64(v48, v36);
      }
      while (v44 < v42);
      v37 = vaddq_s64(v41, v37);
      a2 += a1;
      ++v32;
    }
    while (v32 != v4);
    v31 = vaddq_s32(v38, v43);
  }
  return vaddvq_s32(v31) >> (2 * a3);
}

unsigned __int8 *sub_1C982E6B8(unsigned __int8 *result, int a2, int a3, int a4, int a5, int __c, int a7)
{
  int v7;
  int v8;
  int v9;
  uint64_t v11;
  unsigned __int8 *v12;
  unint64_t v14;
  size_t v15;
  uint64_t v16;
  char v17;
  char *v18;
  uint64_t v19;

  if (((a3 | a2) & 0x80000000) == 0)
  {
    v7 = a2 - *((_DWORD *)result + 1);
    v8 = a3 - *((_DWORD *)result + 2);
    v9 = *result;
    if (v7 <= v9 && v8 <= v9)
    {
      v11 = *(_QWORD *)&result[8 * a7 + 136];
      v12 = a5 <= 0 ? *(unsigned __int8 **)&result[8 * a7 + 136] : (unsigned __int8 *)(v11 + 1);
      if (a4)
      {
        v14 = (unint64_t)*v12 >> 2;
        v15 = a4;
        v16 = *(_QWORD *)(v11 + 8 * a5 + 8);
        if (a5)
          v17 = 3;
        else
          v17 = 2;
        v18 = (char *)(v16 + (v7 >> v17) + (int)v14 * (uint64_t)(v8 >> v17));
        v19 = a4;
        do
        {
          --v19;
          result = (unsigned __int8 *)memset(v18, __c, v15);
          v18 += v14;
        }
        while (v19);
      }
    }
  }
  return result;
}

uint64_t sub_1C982E770(uint64_t result, int a2)
{
  char v2;
  __int16 *v3;
  uint64_t v4;
  __int16 v5;
  unsigned int v6;
  __int16 *v7;
  uint64_t v8;
  __int16 v9;
  unsigned int v10;

  if (!*(_BYTE *)(result + 163))
  {
    if (a2 < 0)
    {
      if (*(_BYTE *)(result + 176))
      {
        v7 = (__int16 *)(result + 178);
        v8 = *(unsigned __int8 *)(result + 176);
        do
        {
          v9 = *v7++;
          LOWORD(a2) = a2 + v9 + 1;
          --v8;
        }
        while (v8);
        v10 = *(unsigned __int8 *)(result + 176);
      }
      else
      {
        v10 = 0;
      }
      ++*(_BYTE *)(result + 176);
      result += 176;
      *(_WORD *)(result + 2 * v10 + 2) = ~(_WORD)a2;
      *(_WORD *)(result + 66) &= ~(1 << v10);
    }
    else
    {
      v2 = *(_BYTE *)(result + 177);
      if (v2)
      {
        v3 = (__int16 *)(result + 210);
        v4 = *(unsigned __int8 *)(result + 177);
        do
        {
          v5 = *v3++;
          LOWORD(a2) = a2 + ~v5;
          --v4;
        }
        while (v4);
        v6 = *(unsigned __int8 *)(result + 177);
      }
      else
      {
        v6 = 0;
      }
      *(_WORD *)(result + 2 * v6 + 210) = a2 - 1;
      *(_WORD *)(result + 244) &= ~(1 << v6);
      *(_BYTE *)(result + 177) = v2 + 1;
    }
  }
  return result;
}

uint64_t sub_1C982E838(uint64_t result, int a2)
{
  char v2;
  __int16 *v3;
  uint64_t v4;
  __int16 v5;
  unsigned int v6;
  __int16 *v7;
  uint64_t v8;
  __int16 v9;
  unsigned int v10;

  if (!*(_BYTE *)(result + 163))
  {
    if (a2 < 0)
    {
      if (*(_BYTE *)(result + 176))
      {
        v7 = (__int16 *)(result + 178);
        v8 = *(unsigned __int8 *)(result + 176);
        do
        {
          v9 = *v7++;
          LOWORD(a2) = a2 + v9 + 1;
          --v8;
        }
        while (v8);
        v10 = *(unsigned __int8 *)(result + 176);
      }
      else
      {
        v10 = 0;
      }
      ++*(_BYTE *)(result + 176);
      result += 176;
      *(_WORD *)(result + 2 * v10 + 2) = ~(_WORD)a2;
      *(_WORD *)(result + 66) |= 1 << v10;
    }
    else
    {
      v2 = *(_BYTE *)(result + 177);
      if (v2)
      {
        v3 = (__int16 *)(result + 210);
        v4 = *(unsigned __int8 *)(result + 177);
        do
        {
          v5 = *v3++;
          LOWORD(a2) = a2 + ~v5;
          --v4;
        }
        while (v4);
        v6 = *(unsigned __int8 *)(result + 177);
      }
      else
      {
        v6 = 0;
      }
      *(_WORD *)(result + 2 * v6 + 210) = a2 - 1;
      *(_WORD *)(result + 244) |= 1 << v6;
      *(_BYTE *)(result + 177) = v2 + 1;
    }
  }
  return result;
}

uint64_t sub_1C982E900(uint64_t result, int a2)
{
  unsigned __int8 v2;
  unint64_t v3;
  uint64_t v4;
  _WORD *v5;
  __int16 v6;
  int v7;
  int v8;
  int v9;
  int v10;
  unsigned __int8 v11;
  unint64_t v12;
  uint64_t v13;
  _WORD *v14;
  __int16 v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;

  if (!*(_BYTE *)(result + 163))
  {
    if (a2 < 0)
    {
      v11 = *(_BYTE *)(result + 176);
      if (v11)
      {
        v12 = 0;
        do
        {
          if (a2)
          {
            v13 = result + 2 * v12;
            v16 = *(unsigned __int16 *)(v13 + 178);
            v14 = (_WORD *)(v13 + 178);
            v15 = v16;
            v17 = a2 + v16;
            a2 += v16 + 1;
            if (v17 == -1)
            {
              *(_BYTE *)(result + 176) = --v11;
              v18 = 1 << v12;
              v19 = 2 << v12++;
              *v14 = v15 + *(_WORD *)(result + 176 + 2 * v12 + 2) + 1;
              v20 = *(unsigned __int16 *)(result + 242) & ~v18;
              *(_WORD *)(result + 242) = v20 | ((v19 & v20) >> 1);
            }
            else
            {
              ++v12;
            }
          }
          else
          {
            *(_WORD *)(result + 178 + 2 * v12) = *(_WORD *)(result + 178 + 2 * (v12 + 1));
            *(_WORD *)(result + 242) = *(_WORD *)(result + 242) & ~(1 << v12) | (((2 << v12) & *(unsigned __int16 *)(result + 242) & ~(1 << v12)) >> 1);
            ++v12;
          }
        }
        while (v12 < v11);
      }
    }
    else
    {
      v2 = *(_BYTE *)(result + 177);
      if (v2)
      {
        v3 = 0;
        do
        {
          if (a2)
          {
            v4 = result + 2 * v3;
            v7 = *(unsigned __int16 *)(v4 + 210);
            v5 = (_WORD *)(v4 + 210);
            v6 = v7;
            a2 += ~v7;
            if (a2)
            {
              ++v3;
            }
            else
            {
              v8 = 1 << v3;
              v9 = 2 << v3++;
              *v5 = v6 + *(_WORD *)(result + 2 * v3 + 210) + 1;
              *(_BYTE *)(result + 177) = --v2;
              v10 = *(unsigned __int16 *)(result + 244) & ~v8;
              *(_WORD *)(result + 244) = v10 | ((v9 & v10) >> 1);
            }
          }
          else
          {
            *(_WORD *)(result + 210 + 2 * v3) = *(_WORD *)(result + 210 + 2 * (v3 + 1));
            *(_WORD *)(result + 244) = *(_WORD *)(result + 244) & ~(1 << v3) | (((2 << v3) & *(unsigned __int16 *)(result + 244) & ~(1 << v3)) >> 1);
            ++v3;
          }
        }
        while (v3 < v2);
      }
    }
  }
  return result;
}

BOOL sub_1C982EA74(__int16 *a1, __int16 *a2)
{
  return *a1 > *a2;
}

void *sub_1C982EA88(uint64_t a1)
{
  unint64_t v1;
  const std::nothrow_t *v2;
  void *result;
  BOOL v4;

  if (a1 < 1)
    return 0;
  if (a1 >= 0x1FFFFFFFFFFFFFFFLL)
    v1 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v1 = a1;
  v2 = (const std::nothrow_t *)MEMORY[0x1E0DE4E10];
  while (1)
  {
    result = operator new(4 * v1, v2);
    if (result)
      break;
    v4 = v1 > 1;
    v1 >>= 1;
    if (!v4)
      return 0;
  }
  return result;
}

uint64_t sub_1C982EAE8(uint64_t result, int *a2, uint64_t (**a3)(int *, int *), unint64_t a4, int *a5, uint64_t a6)
{
  int *v8;
  int *v9;
  int v10;
  int *v12;
  uint64_t v13;
  int *v14;
  int *v15;
  uint64_t v16;
  int *v17;
  char *v19;
  unint64_t v20;
  int *v21;
  unint64_t v22;
  int *v23;
  char *v24;
  int *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;

  if (a4 >= 2)
  {
    v8 = (int *)result;
    if (a4 == 2)
    {
      v9 = a2 - 1;
      result = (*a3)(a2 - 1, (int *)result);
      if ((_DWORD)result)
      {
        v10 = *v8;
        *v8 = *v9;
        *v9 = v10;
      }
    }
    else if ((uint64_t)a4 > 128)
    {
      v19 = (char *)a5;
      v20 = a4 >> 1;
      v21 = (int *)(result + 4 * (a4 >> 1));
      v22 = a4 >> 1;
      if ((uint64_t)a4 <= a6)
      {
        sub_1C982ED60((int *)result, v21, a3, v22, a5);
        v23 = (int *)&v19[4 * v20];
        result = (uint64_t)sub_1C982ED60(&v8[a4 >> 1], a2, a3, a4 - (a4 >> 1), v23);
        v24 = &v19[4 * a4];
        v25 = v23;
        while (v25 != (int *)v24)
        {
          result = (*a3)(v25, (int *)v19);
          if ((_DWORD)result)
            v26 = (char *)v25;
          else
            v26 = v19;
          v19 += 4 * (result ^ 1);
          v25 += result;
          *v8++ = *(_DWORD *)v26;
          if (v19 == (char *)v23)
          {
            if (v25 != (int *)v24)
            {
              v27 = 0;
              do
              {
                v8[v27] = v25[v27];
                ++v27;
              }
              while (&v25[v27] != (int *)v24);
            }
            return result;
          }
        }
        if (v19 != (char *)v23)
        {
          v28 = 0;
          do
          {
            v8[v28] = *(_DWORD *)&v19[v28 * 4];
            ++v28;
          }
          while (&v19[v28 * 4] != (char *)v23);
        }
      }
      else
      {
        sub_1C982EAE8(result, v21, a3, v22, a5, a6);
        sub_1C982EAE8(&v8[a4 >> 1], a2, a3, a4 - (a4 >> 1), v19, a6);
        return sub_1C9753EC4((uint64_t)v8, &v8[a4 >> 1], a2, (uint64_t (**)(_QWORD, _QWORD))a3, a4 >> 1, a4 - (a4 >> 1), v19, a6);
      }
    }
    else if ((int *)result != a2)
    {
      v12 = (int *)(result + 4);
      if ((int *)(result + 4) != a2)
      {
        v13 = 0;
        v14 = (int *)result;
        do
        {
          v15 = v14;
          v14 = v12;
          result = (*a3)(v12, v15);
          if ((_DWORD)result)
          {
            v29 = *v14;
            v16 = v13;
            while (1)
            {
              *(int *)((char *)v8 + v16 + 4) = *(int *)((char *)v8 + v16);
              if (!v16)
                break;
              v16 -= 4;
              result = (*a3)(&v29, (int *)((char *)v8 + v16));
              if ((result & 1) == 0)
              {
                v17 = (int *)((char *)v8 + v16 + 4);
                goto LABEL_15;
              }
            }
            v17 = v8;
LABEL_15:
            *v17 = v29;
          }
          v12 = v14 + 1;
          v13 += 4;
        }
        while (v14 + 1 != a2);
      }
    }
  }
  return result;
}

BOOL sub_1C982ED4C(__int16 *a1, __int16 *a2)
{
  return *a1 < *a2;
}

int *sub_1C982ED60(int *result, int *a2, uint64_t (**a3)(int *, int *), unint64_t a4, int *a5)
{
  int *v5;
  int *v8;
  int *v9;
  int *v10;
  int *v11;
  int *v13;
  uint64_t v14;
  int *v15;
  int *v16;
  int *v17;
  uint64_t v18;
  int v19;
  int *v20;
  int *v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;

  v5 = a5;
  v8 = result;
  if (a4 == 2)
  {
    v9 = a2 - 1;
    result = (int *)(*a3)(a2 - 1, result);
    if ((_DWORD)result)
      v10 = v9;
    else
      v10 = v8;
    if ((_DWORD)result)
      v11 = v8;
    else
      v11 = v9;
    *v5 = *v10;
    v5[1] = *v11;
  }
  else if ((uint64_t)a4 > 8)
  {
    v20 = &result[a4 >> 1];
    sub_1C982EAE8(result, v20, a3, a4 >> 1, a5, a4 >> 1);
    result = (int *)sub_1C982EAE8(&v8[a4 >> 1], a2, a3, a4 - (a4 >> 1), &v5[a4 >> 1], a4 - (a4 >> 1));
    v21 = &v8[a4 >> 1];
    while (v21 != a2)
    {
      result = (int *)(*a3)(v21, v8);
      if ((_DWORD)result)
        v22 = v21;
      else
        v22 = v8;
      v21 += result;
      v8 += result ^ 1;
      *v5++ = *v22;
      if (v8 == v20)
      {
        if (v21 != a2)
        {
          v23 = 0;
          do
          {
            v5[v23] = v21[v23];
            ++v23;
          }
          while (&v21[v23] != a2);
        }
        return result;
      }
    }
    if (v8 != v20)
    {
      v24 = 0;
      do
      {
        v5[v24] = v8[v24];
        ++v24;
      }
      while (&v8[v24] != v20);
    }
  }
  else if (result != a2)
  {
    v13 = result + 1;
    *a5 = *result;
    if (result + 1 != a2)
    {
      v14 = 0;
      v15 = a5;
      do
      {
        v16 = v15++;
        result = (int *)(*a3)(v13, v16);
        v17 = v15;
        if ((_DWORD)result)
        {
          v16[1] = *v16;
          v17 = v5;
          if (v16 != v5)
          {
            v18 = v14;
            while (1)
            {
              v17 = (int *)((char *)v5 + v18);
              result = (int *)(*a3)(v13, (int *)((char *)v5 + v18 - 4));
              if (!(_DWORD)result)
                break;
              *(int *)((char *)v5 + v18) = *(int *)((char *)v5 + v18 - 4);
              v18 -= 4;
              if (!v18)
              {
                v17 = v5;
                break;
              }
            }
          }
        }
        v19 = *v13++;
        *v17 = v19;
        v14 += 4;
      }
      while (v13 != a2);
    }
  }
  return result;
}

uint64_t sub_1C982EF5C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t result;
  int v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  unsigned __int8 *v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unint64_t v23;
  unsigned __int16 v24;
  unsigned int v25;
  unsigned int v26;
  unint64_t v27;
  unsigned __int16 v28;
  unsigned int v29;
  unsigned int v30;

  if (a4 >= 1)
    sub_1C9750D54(a2, *(unsigned __int8 *)(a1 + 163), 1);
  if (!*(_BYTE *)(a1 + 163))
  {
    v19 = *(unsigned __int8 *)(a1 + 176) + 1;
    v20 = __clz(v19);
    sub_1C9750D54(a2, (v19 - (0x80000000 >> v20)) | (0x80000000 >> v20), (2 * v20) ^ 0x3F);
    v21 = *(unsigned __int8 *)(a1 + 177) + 1;
    v22 = __clz(v21);
    sub_1C9750D54(a2, (v21 - (0x80000000 >> v22)) | (0x80000000 >> v22), (2 * v22) ^ 0x3F);
    if (*(_BYTE *)(a1 + 176))
    {
      v23 = 0;
      v24 = *(_WORD *)(a1 + 242);
      do
      {
        v25 = *(unsigned __int16 *)(a1 + 178 + 2 * v23) + 1;
        v26 = __clz(v25);
        sub_1C9750D54(a2, (v25 - (0x80000000 >> v26)) | (0x80000000 >> v26), (2 * v26) ^ 0x3F);
        sub_1C9750D54(a2, v24 & 1, 1);
        ++v23;
        v24 >>= 1;
      }
      while (v23 < *(unsigned __int8 *)(a1 + 176));
    }
    if (*(_BYTE *)(a1 + 177))
    {
      v27 = 0;
      v28 = *(_WORD *)(a1 + 244);
      do
      {
        v29 = *(unsigned __int16 *)(a1 + 210 + 2 * v27) + 1;
        v30 = __clz(v29);
        sub_1C9750D54(a2, (v29 - (0x80000000 >> v30)) | (0x80000000 >> v30), (2 * v30) ^ 0x3F);
        sub_1C9750D54(a2, v28 & 1, 1);
        ++v27;
        v28 >>= 1;
      }
      while (v27 < *(unsigned __int8 *)(a1 + 177));
    }
    return 0;
  }
  if (*(_DWORD *)(a3 + 288) == a4)
  {
    v8 = *(_DWORD *)(a1 + 164) + 1;
    v9 = __clz(v8);
    sub_1C9750D54(a2, (v8 - (0x80000000 >> v9)) | (0x80000000 >> v9), 63 - 2 * v9);
  }
  sub_1C9750D54(a2, *(unsigned __int8 *)(a1 + 168), 1);
  v10 = *(unsigned __int16 *)(a1 + 170) + 1;
  v11 = __clz(v10);
  sub_1C9750D54(a2, (v10 - (0x80000000 >> v11)) | (0x80000000 >> v11), (2 * v11) ^ 0x3F);
  result = 4294954387;
  v13 = ~*(_DWORD *)(a1 + 164) + a4;
  if (v13 >= 0 && v13 < a4)
  {
    v14 = *(_QWORD *)(a3 + 296);
    v15 = *(unsigned __int16 *)(a1 + 172);
    v16 = *(unsigned __int16 *)(a1 + 174);
    v17 = (unsigned __int8 *)(v14 + 248 * v13 + 162);
    v18 = -1;
    do
    {
      sub_1C9750D54(a2, v15 & 1, 1);
      if ((v15 & 1) == 0)
        sub_1C9750D54(a2, v16 & 1, 1);
      v15 >>= 1;
      v16 >>= 1;
      ++v18;
    }
    while (v18 < *v17);
    return 0;
  }
  return result;
}

uint64_t sub_1C982F1BC(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  _BOOL4 v8;
  _BOOL4 v9;
  BOOL v10;
  int v11;
  unsigned int v12;

  if (a2 < 1)
    return 0xFFFFFFFFLL;
  v4 = 0;
  v5 = 0;
  v6 = 0xFFFFFFFFLL;
  do
  {
    v7 = *(_DWORD *)(a1 + 4 * v4);
    if (a4 >= 1 && v7 < 0)
    {
      if (-v7 < a3 && v5 < -v7)
      {
        v5 = -v7;
        v6 = v4;
      }
      else
      {
        v6 = v6;
      }
    }
    else if (!a4)
    {
      v8 = v7 < a3;
      v9 = v7 > v5;
      v10 = !v8 || !v9;
      if (v8 && v9)
        v11 = *(_DWORD *)(a1 + 4 * v4);
      else
        v11 = v5;
      if (v10)
        v12 = v6;
      else
        v12 = v4;
      if (v7 < 1)
      {
        v6 = v6;
      }
      else
      {
        v5 = v11;
        v6 = v12;
      }
    }
    ++v4;
  }
  while (a2 != v4);
  return v6;
}

uint64_t sub_1C982F250(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  _BOOL4 v8;
  _BOOL4 v9;
  BOOL v10;
  int v11;
  unsigned int v12;

  if (a2 < 1)
    return 0xFFFFFFFFLL;
  v4 = 0;
  v5 = 0x7FFFFFFF;
  v6 = 0xFFFFFFFFLL;
  do
  {
    v7 = *(_DWORD *)(a1 + 4 * v4);
    if (a4 >= 1 && v7 < 0)
    {
      if (-v7 > a3 && v5 > -v7)
      {
        v5 = -v7;
        v6 = v4;
      }
      else
      {
        v6 = v6;
      }
    }
    else if (!a4)
    {
      v8 = v7 > a3;
      v9 = v7 < v5;
      v10 = !v8 || !v9;
      if (v8 && v9)
        v11 = *(_DWORD *)(a1 + 4 * v4);
      else
        v11 = v5;
      if (v10)
        v12 = v6;
      else
        v12 = v4;
      if (v7 < 1)
      {
        v6 = v6;
      }
      else
      {
        v5 = v11;
        v6 = v12;
      }
    }
    ++v4;
  }
  while (a2 != v4);
  return v6;
}

size_t sub_1C982F2E4(size_t result, FILE *__stream, uint64_t a3, int a4)
{
  uint64_t v7;
  int v8;
  unint64_t v9;
  unsigned __int8 *v10;
  unint64_t v12;
  unint64_t v13;

  v7 = result;
  v8 = dword_1ED1ACCC0;
  if (dword_1ED1ACCC0 >= 6)
  {
    result = fprintf(__stream, "  short_term_ref_pic_set(%d) {\n", a4);
    v8 = dword_1ED1ACCC0;
    if (dword_1ED1ACCC0 >= 6)
    {
      result = fprintf(__stream, "    %-42s : %lld\n", "inter_ref_pic_set_prediction_flag", *(unsigned __int8 *)(v7 + 163));
      v8 = dword_1ED1ACCC0;
    }
  }
  if (*(_BYTE *)(v7 + 163))
  {
    if (v8 >= 6)
    {
      result = fprintf(__stream, "    %-42s : %lld\n", "delta_idx_minus1", *(int *)(v7 + 164));
      v8 = dword_1ED1ACCC0;
      if (dword_1ED1ACCC0 >= 6)
      {
        result = fprintf(__stream, "    %-42s : %lld\n", "delta_rps_sign", *(unsigned __int8 *)(v7 + 168));
        v8 = dword_1ED1ACCC0;
        if (dword_1ED1ACCC0 >= 6)
        {
          result = fprintf(__stream, "    %-42s : %lld\n", "abs_delta_rps_minus1", *(unsigned __int16 *)(v7 + 170));
          v8 = dword_1ED1ACCC0;
        }
      }
    }
    v9 = 0;
    v10 = (unsigned __int8 *)(*(_QWORD *)(a3 + 296) + 248 * (~*(_DWORD *)(v7 + 164) + a4) + 162);
    do
    {
      if (v8 >= 6)
      {
        result = fprintf(__stream, "      %-40s : %lld\n", "used_by_curr_pic_flag", (*(unsigned __int16 *)(v7 + 172) >> v9) & 1);
        v8 = dword_1ED1ACCC0;
        if (((*(unsigned __int16 *)(v7 + 172) >> v9) & 1) == 0 && dword_1ED1ACCC0 >= 6)
        {
          result = fprintf(__stream, "      %-40s : %lld\n", "use_delta_flag", (*(unsigned __int16 *)(v7 + 174) >> v9) & 1);
          v8 = dword_1ED1ACCC0;
        }
      }
    }
    while (v9++ < *v10);
  }
  else
  {
    if (v8 >= 6)
    {
      result = fprintf(__stream, "    %-42s : %lld\n", "num_negative_pics", *(unsigned __int8 *)(v7 + 176));
      v8 = dword_1ED1ACCC0;
      if (dword_1ED1ACCC0 >= 6)
      {
        result = fprintf(__stream, "    %-42s : %lld\n", "num_positive_pics", *(unsigned __int8 *)(v7 + 177));
        v8 = dword_1ED1ACCC0;
      }
    }
    if (*(_BYTE *)(v7 + 176))
    {
      v12 = 0;
      do
      {
        if (v8 >= 6)
        {
          result = fprintf(__stream, "      %-40s : %lld\n", "delta_poc_s0_minus1", *(unsigned __int16 *)(v7 + 178 + 2 * v12));
          v8 = dword_1ED1ACCC0;
          if (dword_1ED1ACCC0 >= 6)
          {
            result = fprintf(__stream, "      %-40s : %lld\n", "used_by_curr_pic_s0_flag", (*(unsigned __int16 *)(v7 + 242) >> v12) & 1);
            v8 = dword_1ED1ACCC0;
          }
        }
        ++v12;
      }
      while (v12 < *(unsigned __int8 *)(v7 + 176));
    }
    if (*(_BYTE *)(v7 + 177))
    {
      v13 = 0;
      do
      {
        if (v8 >= 6)
        {
          result = fprintf(__stream, "      %-40s : %lld\n", "delta_poc_s1_minus1", *(unsigned __int16 *)(v7 + 210 + 2 * v13));
          v8 = dword_1ED1ACCC0;
          if (dword_1ED1ACCC0 >= 6)
          {
            result = fprintf(__stream, "      %-40s : %lld\n", "used_by_curr_pic_s1_flag", (*(unsigned __int16 *)(v7 + 244) >> v13) & 1);
            v8 = dword_1ED1ACCC0;
          }
        }
        ++v13;
      }
      while (v13 < *(unsigned __int8 *)(v7 + 177));
    }
  }
  if (v8 >= 6)
    return fwrite("  }\n", 4uLL, 1uLL, __stream);
  return result;
}

uint64_t sub_1C982F648(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;
  int v13;
  uint64_t i;
  unsigned int v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  int v23;

  if (*(_DWORD *)(a2 + 324))
    v6 = sub_1C971B8B0(a3);
  else
    v6 = 0;
  *a1 = v6;
  v7 = sub_1C971B8B0(a3);
  a1[1] = v7;
  LODWORD(v8) = *a1;
  v9 = *(_DWORD *)(a2 + 324);
  if (*a1 > v9)
  {
    if (dword_1ED1ACCC0 >= 3)
    {
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "num_long_term_sps (%d) > %d\n", *a1, v9);
      syslog(27, "num_long_term_sps (%d) > %d\n");
    }
    return 4294954387;
  }
  if (v8 + v7 >= 0x11)
  {
    if (dword_1ED1ACCC0 >= 3)
    {
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "# LT ref pics (%d + %d = %d) > kMaxDpbSize (%u)\n", v8, v7, v8 + v7, 16);
      syslog(27, "# LT ref pics (%d + %d = %d) > kMaxDpbSize (%u)\n");
    }
    return 4294954387;
  }
  v10 = 0;
  a1[46] = 0;
  if (v7 + (_DWORD)v8)
  {
    v12 = 0;
    v13 = 0;
    for (i = 30; ; ++i)
    {
      if (v12 >= v8)
      {
        *((_WORD *)a1 + v12 + 12) = sub_1C971C898(a3, *(unsigned __int8 *)(a2 + 224) + 4);
        LOWORD(v19) = sub_1C971C898(a3, 1) != 0;
      }
      else
      {
        v15 = *(_DWORD *)(a2 + 324);
        if (v15 < 2)
        {
          v18 = 0;
        }
        else
        {
          v16 = __clz(v15) ^ 0x1F;
          if ((v15 & (v15 - 1)) != 0)
            v17 = v16 + 1;
          else
            v17 = v16;
          v18 = sub_1C971C898(a3, v17);
        }
        *((_BYTE *)a1 + v12 + 8) = v18;
        v20 = *(_DWORD *)(a2 + 324);
        if (v20 <= v18)
        {
          if (dword_1ED1ACCC0 >= 3)
          {
            fprintf((FILE *)*MEMORY[0x1E0C80C10], "Parsed invalid long term reference index %d (max %d)\n", v18, v20);
            syslog(27, "Parsed invalid long term reference index %d (max %d)\n");
          }
          return 4294954387;
        }
        *((_WORD *)a1 + v12 + 12) = *(_WORD *)(a2 + 2 * v18 + 328);
        v19 = (*(_DWORD *)(a2 + 392) >> v18) & 1;
      }
      *((_WORD *)a1 + 92) |= (_WORD)v19 << v12;
      v21 = sub_1C971C898(a3, 1);
      *((_WORD *)a1 + 93) |= (v21 != 0) << v12;
      if (v21)
        v21 = sub_1C971B8B0(a3);
      a1[i - 16] = v21;
      v8 = *a1;
      if (v12 == v8 || v12 == 0)
        v23 = 0;
      else
        v23 = v13;
      v13 = v21 + v23;
      a1[i] = v21 + v23;
      if (++v12 >= a1[1] + v8)
        return 0;
    }
  }
  return v10;
}

uint64_t sub_1C982F8F8(unsigned __int8 *a1, FILE *__stream)
{
  FILE *v2;
  uint64_t result;
  int v5;
  unsigned __int8 v6;
  unint64_t v7;
  int v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  unint64_t v13;
  int v14;
  FILE *v15;
  uint64_t v16;
  uint64_t v17;
  FILE *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  unint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  unint64_t v35;
  int v36;
  int v37;
  FILE *__streama;
  uint64_t v39;

  v2 = __stream;
  if (dword_1ED1ACCC0 >= 6)
  {
    fprintf(__stream, "=========== Sequence Parameter Set ID: %d ===========\n", a1[200]);
    if (dword_1ED1ACCC0 >= 6)
    {
      fprintf(v2, "  %-44s : %lld\n", "sps_video_parameter_set_id", *a1);
      if (dword_1ED1ACCC0 >= 6)
      {
        fprintf(v2, "  %-44s : %lld\n", "sps_max_sub_layers_minus1", a1[1]);
        if (dword_1ED1ACCC0 >= 6)
          fprintf(v2, "  %-44s : %lld\n", "sps_temporal_id_nesting_flag", a1[2]);
      }
    }
  }
  result = sub_1C979F1A8((uint64_t)(a1 + 4), a1[1], v2);
  v5 = dword_1ED1ACCC0;
  if (dword_1ED1ACCC0 >= 6)
  {
    result = fprintf(v2, "  %-44s : %lld\n", "sps_seq_parameter_set_id", a1[200]);
    v5 = dword_1ED1ACCC0;
    if (dword_1ED1ACCC0 >= 6)
    {
      result = fprintf(v2, "  %-44s : %lld\n", "chroma_format_idc", a1[201]);
      v5 = dword_1ED1ACCC0;
      if (a1[201] == 3 && dword_1ED1ACCC0 >= 6)
      {
        result = fprintf(v2, "  %-44s : %lld\n", "separate_colour_plane_flag", a1[202]);
        v5 = dword_1ED1ACCC0;
      }
      if (v5 >= 6)
      {
        result = fprintf(v2, "  %-44s : %lld\n", "pic_width_in_luma_samples", *((int *)a1 + 51));
        v5 = dword_1ED1ACCC0;
        if (dword_1ED1ACCC0 >= 6)
        {
          result = fprintf(v2, "  %-44s : %lld\n", "pic_height_in_luma_samples", *((int *)a1 + 52));
          v5 = dword_1ED1ACCC0;
          if (dword_1ED1ACCC0 >= 6)
          {
            result = fprintf(v2, "  %-44s : %lld\n", "conformance_window_flag", a1[212]);
            v5 = dword_1ED1ACCC0;
          }
        }
      }
    }
  }
  if (a1[212])
  {
    if (v5 < 6)
      goto LABEL_26;
    result = fprintf(v2, "  %-44s : %lld\n", "conf_win_left_offset", *((unsigned __int16 *)a1 + 107));
    v5 = dword_1ED1ACCC0;
    if (dword_1ED1ACCC0 < 6)
      goto LABEL_26;
    result = fprintf(v2, "  %-44s : %lld\n", "conf_win_right_offset", *((unsigned __int16 *)a1 + 108));
    v5 = dword_1ED1ACCC0;
    if (dword_1ED1ACCC0 < 6)
      goto LABEL_26;
    result = fprintf(v2, "  %-44s : %lld\n", "conf_win_top_offset", *((unsigned __int16 *)a1 + 109));
    v5 = dword_1ED1ACCC0;
    if (dword_1ED1ACCC0 < 6)
      goto LABEL_26;
    result = fprintf(v2, "  %-44s : %lld\n", "conf_win_bottom_offset", *((unsigned __int16 *)a1 + 110));
    v5 = dword_1ED1ACCC0;
  }
  if (v5 >= 6)
  {
    result = fprintf(v2, "  %-44s : %lld\n", "bit_depth_luma_minus8", a1[222]);
    v5 = dword_1ED1ACCC0;
    if (dword_1ED1ACCC0 >= 6)
    {
      result = fprintf(v2, "  %-44s : %lld\n", "bit_depth_chroma_minus8", a1[223]);
      v5 = dword_1ED1ACCC0;
      if (dword_1ED1ACCC0 >= 6)
      {
        result = fprintf(v2, "  %-44s : %lld\n", "log2_max_pic_order_cnt_lsb_minus4", a1[224]);
        v5 = dword_1ED1ACCC0;
        if (dword_1ED1ACCC0 >= 6)
        {
          result = fprintf(v2, "  %-44s : %lld\n", "sps_sub_layer_ordering_info_present_flag", a1[225]);
          v5 = dword_1ED1ACCC0;
        }
      }
    }
  }
LABEL_26:
  v6 = a1[1];
  if (a1[225])
    v6 = 0;
  v7 = v6;
  do
  {
    if (v5 >= 6)
    {
      result = fprintf(v2, "    %-42s : %lld\n", "sps_max_dec_pic_buffering_minus1", a1[v7 + 226]);
      v5 = dword_1ED1ACCC0;
      if (dword_1ED1ACCC0 >= 6)
      {
        result = fprintf(v2, "    %-42s : %lld\n", "sps_max_num_reorder_pics", a1[v7 + 233]);
        v5 = dword_1ED1ACCC0;
        if (dword_1ED1ACCC0 >= 6)
        {
          result = fprintf(v2, "    %-42s : %lld\n", "sps_max_latency_increase_plus1", *(unsigned int *)&a1[4 * v7 + 240]);
          v5 = dword_1ED1ACCC0;
        }
      }
    }
  }
  while (v7++ < a1[1]);
  if (v5 >= 6)
  {
    result = fprintf(v2, "  %-44s : %lld\n", "log2_min_coding_block_size_minus3", a1[268]);
    if (dword_1ED1ACCC0 >= 6)
    {
      result = fprintf(v2, "  %-44s : %lld\n", "log2_diff_max_min_coding_block_size", a1[269]);
      if (dword_1ED1ACCC0 >= 6)
      {
        result = fprintf(v2, "  %-44s : %lld\n", "log2_min_transform_block_size_minus2", a1[270]);
        if (dword_1ED1ACCC0 >= 6)
        {
          result = fprintf(v2, "  %-44s : %lld\n", "log2_diff_max_min_transform_block_size", a1[271]);
          if (dword_1ED1ACCC0 >= 6)
          {
            result = fprintf(v2, "  %-44s : %lld\n", "max_transform_hierarchy_depth_inter", a1[272]);
            if (dword_1ED1ACCC0 >= 6)
            {
              result = fprintf(v2, "  %-44s : %lld\n", "max_transform_hierarchy_depth_intra", a1[273]);
              if (dword_1ED1ACCC0 >= 6)
                result = fprintf(v2, "  %-44s : %lld\n", "scaling_list_enabled_flag", a1[274]);
            }
          }
        }
      }
    }
  }
  if (a1[274])
  {
    if (dword_1ED1ACCC0 >= 6)
      result = fprintf(v2, "  %-44s : %lld\n", "sps_scaling_list_data_present_flag", a1[275]);
    if (a1[275])
      result = sub_1C9751A54((uint64_t)(a1 + 416), v2);
  }
  v9 = dword_1ED1ACCC0;
  if (dword_1ED1ACCC0 >= 6)
  {
    result = fprintf(v2, "  %-44s : %lld\n", "amp_enabled_flag", a1[276]);
    v9 = dword_1ED1ACCC0;
    if (dword_1ED1ACCC0 >= 6)
    {
      result = fprintf(v2, "  %-44s : %lld\n", "sample_adaptive_offset_enabled_flag", a1[277]);
      v9 = dword_1ED1ACCC0;
      if (dword_1ED1ACCC0 >= 6)
      {
        result = fprintf(v2, "  %-44s : %lld\n", "pcm_enabled_flag", a1[278]);
        v9 = dword_1ED1ACCC0;
      }
    }
  }
  if (a1[278])
  {
    if (v9 < 6)
      goto LABEL_61;
    result = fprintf(v2, "  %-44s : %lld\n", "pcm.pcm_sample_bit_depth_luma_minus1", a1[279]);
    if (dword_1ED1ACCC0 < 6)
      goto LABEL_61;
    result = fprintf(v2, "  %-44s : %lld\n", "pcm.pcm_sample_bit_depth_chroma_minus1", a1[280]);
    if (dword_1ED1ACCC0 < 6)
      goto LABEL_61;
    result = fprintf(v2, "  %-44s : %lld\n", "pcm.log2_min_pcm_luma_coding_block_size_minus3", a1[281]);
    if (dword_1ED1ACCC0 < 6)
      goto LABEL_61;
    result = fprintf(v2, "  %-44s : %lld\n", "pcm.log2_diff_max_min_pcm_luma_coding_block_size", a1[282]);
    if (dword_1ED1ACCC0 < 6)
      goto LABEL_61;
    result = fprintf(v2, "  %-44s : %lld\n", "pcm.pcm_loop_filter_disabled_flag", a1[283]);
    v9 = dword_1ED1ACCC0;
  }
  if (v9 >= 6)
    result = fprintf(v2, "  %-44s : %lld\n", "num_short_term_ref_pic_sets", *((unsigned int *)a1 + 72));
LABEL_61:
  if (*((_DWORD *)a1 + 72))
  {
    v10 = 0;
    v11 = 0;
    do
    {
      result = sub_1C982F2E4(*((_QWORD *)a1 + 37) + v10, v2, (uint64_t)a1, v11++);
      v10 += 248;
    }
    while (v11 < *((unsigned int *)a1 + 72));
  }
  v12 = dword_1ED1ACCC0;
  if (dword_1ED1ACCC0 > 5)
  {
    result = fprintf(v2, "  %-44s : %lld\n", "long_term_ref_pics_present_flag", a1[320]);
    v12 = dword_1ED1ACCC0;
  }
  if (a1[320])
  {
    if (v12 >= 6)
    {
      result = fprintf(v2, "  %-44s : %lld\n", "num_long_term_ref_pics_sps", *((unsigned int *)a1 + 81));
      v12 = dword_1ED1ACCC0;
    }
    if (*((_DWORD *)a1 + 81))
    {
      v13 = 0;
      do
      {
        if (v12 >= 6)
        {
          result = fprintf(v2, "    %-42s : %lld\n", "lt_ref_pic_poc_lsb_sps", *(unsigned __int16 *)&a1[2 * v13 + 328]);
          v12 = dword_1ED1ACCC0;
          if (dword_1ED1ACCC0 >= 6)
          {
            result = fprintf(v2, "    %-42s : %lld\n", "used_by_curr_pic_lt_sps_flag", (*((unsigned int *)a1 + 98) >> v13) & 1);
            v12 = dword_1ED1ACCC0;
          }
        }
        ++v13;
      }
      while (v13 < *((unsigned int *)a1 + 81));
    }
  }
  if (v12 >= 6)
  {
    result = fprintf(v2, "  %-44s : %lld\n", "sps_temporal_mvp_enable_flag", a1[396]);
    v12 = dword_1ED1ACCC0;
    if (dword_1ED1ACCC0 >= 6)
    {
      result = fprintf(v2, "  %-44s : %lld\n", "sps_strong_intra_smoothing_enable_flag", a1[397]);
      v12 = dword_1ED1ACCC0;
      if (dword_1ED1ACCC0 >= 6)
      {
        result = fprintf(v2, "  %-44s : %lld\n", "vui_parameters_present_flag", a1[398]);
        v12 = dword_1ED1ACCC0;
      }
    }
  }
  if (a1[398])
  {
    if (v12 >= 6)
    {
      result = fwrite("  VUI {\n", 8uLL, 1uLL, v2);
      if (dword_1ED1ACCC0 >= 6)
      {
        result = fprintf(v2, "    %-42s : %lld\n", "sar_width", *((unsigned __int16 *)a1 + 992));
        if (dword_1ED1ACCC0 >= 6)
        {
          result = fprintf(v2, "    %-42s : %lld\n", "sar_height", *((unsigned __int16 *)a1 + 993));
          if (dword_1ED1ACCC0 >= 6)
          {
            result = fprintf(v2, "    %-42s : %lld\n", "overscan_info_present_flag", a1[1988]);
            if (dword_1ED1ACCC0 >= 6)
            {
              result = fprintf(v2, "    %-42s : %lld\n", "overscan_appropriate_flag", a1[1989]);
              if (dword_1ED1ACCC0 >= 6)
              {
                result = fprintf(v2, "    %-42s : %lld\n", "video_format", a1[1990]);
                if (dword_1ED1ACCC0 >= 6)
                {
                  result = fprintf(v2, "    %-42s : %lld\n", "video_full_range_flag", a1[1991]);
                  if (dword_1ED1ACCC0 >= 6)
                  {
                    result = fprintf(v2, "    %-42s : %lld\n", "colour_primaries", a1[1992]);
                    if (dword_1ED1ACCC0 >= 6)
                    {
                      result = fprintf(v2, "    %-42s : %lld\n", "transfer_characteristics", a1[1993]);
                      if (dword_1ED1ACCC0 >= 6)
                      {
                        result = fprintf(v2, "    %-42s : %lld\n", "matrix_coeffs", a1[1994]);
                        if (dword_1ED1ACCC0 >= 6)
                        {
                          result = fprintf(v2, "    %-42s : %lld\n", "chroma_sample_loc_type_top_field", a1[1995]);
                          if (dword_1ED1ACCC0 >= 6)
                          {
                            result = fprintf(v2, "    %-42s : %lld\n", "chroma_sample_loc_type_bottom_field", a1[1996]);
                            if (dword_1ED1ACCC0 >= 6)
                            {
                              result = fprintf(v2, "    %-42s : %lld\n", "neutral_chroma_indication_flag", a1[1997]);
                              if (dword_1ED1ACCC0 >= 6)
                              {
                                result = fprintf(v2, "    %-42s : %lld\n", "field_seq_flag", a1[1998]);
                                if (dword_1ED1ACCC0 >= 6)
                                {
                                  result = fprintf(v2, "    %-42s : %lld\n", "frame_field_info_present_flag", a1[1999]);
                                  if (dword_1ED1ACCC0 >= 6)
                                  {
                                    result = fprintf(v2, "    %-42s : %lld\n", "def_disp_win_left_offset", *((unsigned __int16 *)a1 + 1000));
                                    if (dword_1ED1ACCC0 >= 6)
                                    {
                                      result = fprintf(v2, "    %-42s : %lld\n", "def_disp_win_right_offset", *((unsigned __int16 *)a1 + 1001));
                                      if (dword_1ED1ACCC0 >= 6)
                                      {
                                        result = fprintf(v2, "    %-42s : %lld\n", "def_disp_win_top_offset", *((unsigned __int16 *)a1 + 1002));
                                        if (dword_1ED1ACCC0 >= 6)
                                        {
                                          result = fprintf(v2, "    %-42s : %lld\n", "def_disp_win_bottom_offset", *((unsigned __int16 *)a1 + 1003));
                                          if (dword_1ED1ACCC0 >= 6)
                                            result = fprintf(v2, "    %-42s : %lld\n", "vui_timing_info_present_flag", a1[2008]);
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    __streama = v2;
    if (a1[2008])
    {
      if (dword_1ED1ACCC0 >= 6)
      {
        result = fprintf(v2, "      %-40s : %lld\n", "vui_num_units_in_tick", *((unsigned int *)a1 + 503));
        if (dword_1ED1ACCC0 >= 6)
        {
          result = fprintf(v2, "      %-40s : %lld\n", "vui_time_scale", *((unsigned int *)a1 + 504));
          if (dword_1ED1ACCC0 >= 6)
          {
            result = fprintf(v2, "      %-40s : %lld\n", "vui_poc_proportional_to_timing_flag", a1[2020]);
            v14 = dword_1ED1ACCC0;
            if (a1[2020] && dword_1ED1ACCC0 >= 6)
            {
              result = fprintf(v2, "      %-40s : %lld\n", "vui_num_ticks_poc_diff_one_minus1", *((unsigned int *)a1 + 506));
              v14 = dword_1ED1ACCC0;
            }
            if (v14 >= 6)
              result = fprintf(v2, "      %-40s : %lld\n", "vui_hrd_parameters_present_flag", a1[2028]);
          }
        }
      }
      if (a1[2028])
      {
        v15 = (FILE *)*MEMORY[0x1E0C80C10];
        if (dword_1ED1ACCC0 >= 6)
        {
          result = fwrite("      ------ HDR parameters ------\n", 0x23uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
          if (dword_1ED1ACCC0 >= 6)
          {
            result = fprintf(v15, "      %-40s : %lld\n", "nal_hrd_parameters_present_flag", a1[2032]);
            if (dword_1ED1ACCC0 >= 6)
            {
              result = fprintf(v15, "      %-40s : %lld\n", "vcl_hrd_parameters_present_flag", a1[2033]);
              if (dword_1ED1ACCC0 >= 6)
              {
                result = fprintf(v15, "      %-40s : %lld\n", "sub_pic_hrd_params_present_flag", a1[2034]);
                if (dword_1ED1ACCC0 >= 6)
                {
                  result = fprintf(v15, "      %-40s : %lld\n", "tick_divisor_minus2", a1[2035]);
                  if (dword_1ED1ACCC0 >= 6)
                  {
                    result = fprintf(v15, "      %-40s : %lld\n", "du_cpb_removal_delay_increment_length_minus1", a1[2036]);
                    if (dword_1ED1ACCC0 >= 6)
                    {
                      result = fprintf(v15, "      %-40s : %lld\n", "sub_pic_cpb_params_in_pic_timing_sei_flag", a1[2037]);
                      if (dword_1ED1ACCC0 >= 6)
                      {
                        result = fprintf(v15, "      %-40s : %lld\n", "dpb_output_delay_du_length_minus1", a1[2038]);
                        if (dword_1ED1ACCC0 >= 6)
                        {
                          result = fprintf(v15, "      %-40s : %lld\n", "bit_rate_scale", a1[2039]);
                          if (dword_1ED1ACCC0 >= 6)
                          {
                            result = fprintf(v15, "      %-40s : %lld\n", "cpb_size_scale", a1[2040]);
                            if (dword_1ED1ACCC0 >= 6)
                            {
                              result = fprintf(v15, "      %-40s : %lld\n", "cpb_size_du_scale", a1[2041]);
                              if (dword_1ED1ACCC0 >= 6)
                              {
                                result = fprintf(v15, "      %-40s : %lld\n", "initial_cpb_removal_delay_length_minus1", a1[2042]);
                                if (dword_1ED1ACCC0 >= 6)
                                {
                                  result = fprintf(v15, "      %-40s : %lld\n", "au_cpb_removal_delay_length_minus1", a1[2043]);
                                  if (dword_1ED1ACCC0 >= 6)
                                    result = fprintf(v15, "      %-40s : %lld\n", "dpb_output_delay_length_minus1", a1[2044]);
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        v16 = *((_QWORD *)a1 + 256);
        if (*((_QWORD *)a1 + 257) != v16)
        {
          v17 = 0;
          do
          {
            if (dword_1ED1ACCC0 <= 5)
            {
              v18 = (FILE *)*MEMORY[0x1E0C80C10];
            }
            else
            {
              result = fprintf(v15, "      ------ HDR parameters sublabyer %d ------\n", v17);
              v16 = *((_QWORD *)a1 + 256);
              v18 = (FILE *)*MEMORY[0x1E0C80C10];
              if (dword_1ED1ACCC0 >= 6)
              {
                result = fprintf(v18, "      %-40s : %lld\n", "fixed_pic_rate_general_flag", *(unsigned __int8 *)(v16 + 56 * v17));
                if (dword_1ED1ACCC0 >= 6)
                {
                  result = fprintf(v18, "      %-40s : %lld\n", "fixed_pic_rate_within_cvs_flag", *(unsigned __int8 *)(v16 + 56 * v17 + 1));
                  if (dword_1ED1ACCC0 >= 6)
                  {
                    result = fprintf(v18, "      %-40s : %lld\n", "elemental_duration_in_tc_minus1", *(unsigned __int16 *)(v16 + 56 * v17 + 2));
                    if (dword_1ED1ACCC0 >= 6)
                    {
                      result = fprintf(v18, "      %-40s : %lld\n", "low_delay_hrd_flag", *(unsigned __int8 *)(v16 + 56 * v17 + 4));
                      if (dword_1ED1ACCC0 >= 6)
                        result = fprintf(v18, "      %-40s : %lld\n", "cpb_cnt_minus1", *(unsigned __int16 *)(v16 + 56 * v17 + 6));
                    }
                  }
                }
              }
            }
            v39 = v17;
            v19 = v16 + 56 * v17;
            v22 = *(_QWORD *)(v19 + 8);
            v21 = (uint64_t *)(v19 + 8);
            v20 = v22;
            v24 = v21 + 1;
            v23 = v21[1];
            if (v23 != v22)
            {
              if (dword_1ED1ACCC0 >= 6)
              {
                result = fwrite("      ------ HDR parameters sublabyer nal ------\n", 0x31uLL, 1uLL, v18);
                v23 = *v24;
                v20 = *v21;
              }
              if (v23 != v20)
              {
                v25 = 0;
                v26 = 0;
                v27 = dword_1ED1ACCC0;
                do
                {
                  if (v27 >= 6)
                  {
                    result = fprintf(v18, "      %-40s : %lld\n", "nal_cpb_layers_[i].bit_rate_value_minus1", *(unsigned int *)(v20 + v25));
                    v27 = dword_1ED1ACCC0;
                    v20 = *v21;
                    if (dword_1ED1ACCC0 >= 6)
                    {
                      result = fprintf(v18, "      %-40s : %lld\n", "nal_cpb_layers_[i].cpb_size_value_minus1", *(unsigned int *)(v20 + v25 + 4));
                      v27 = dword_1ED1ACCC0;
                      v20 = *v21;
                      if (dword_1ED1ACCC0 >= 6)
                      {
                        result = fprintf(v18, "      %-40s : %lld\n", "nal_cpb_layers_[i].cpb_size_du_value_minus1", *(unsigned int *)(v20 + v25 + 8));
                        v27 = dword_1ED1ACCC0;
                        v20 = *v21;
                        if (dword_1ED1ACCC0 >= 6)
                        {
                          result = fprintf(v18, "      %-40s : %lld\n", "nal_cpb_layers_[i].bit_rate_du_value_minus1", *(unsigned int *)(v20 + v25 + 12));
                          v27 = dword_1ED1ACCC0;
                          v20 = *v21;
                          if (dword_1ED1ACCC0 >= 6)
                          {
                            result = fprintf(v18, "      %-40s : %lld\n", "nal_cpb_layers_[i].cbr_flag", *(unsigned __int8 *)(v20 + v25 + 16));
                            v27 = dword_1ED1ACCC0;
                            v20 = *v21;
                          }
                        }
                      }
                    }
                  }
                  ++v26;
                  v25 += 20;
                }
                while (0xCCCCCCCCCCCCCCCDLL * ((*v24 - v20) >> 2) > v26);
              }
            }
            v28 = v16 + 56 * v39;
            v31 = *(_QWORD *)(v28 + 32);
            v30 = (uint64_t *)(v28 + 32);
            v29 = v31;
            v33 = v30 + 1;
            v32 = v30[1];
            if (v32 != v31)
            {
              if (dword_1ED1ACCC0 >= 6)
              {
                result = fwrite("      ------ HDR parameters sublabyer vcl ------\n", 0x31uLL, 1uLL, v18);
                v32 = *v33;
                v29 = *v30;
              }
              if (v32 != v29)
              {
                v34 = 0;
                v35 = 0;
                v36 = dword_1ED1ACCC0;
                do
                {
                  if (v36 >= 6)
                  {
                    result = fprintf(v18, "      %-40s : %lld\n", "vcl_cpb_layers_[i].bit_rate_value_minus1", *(unsigned int *)(v29 + v34));
                    v36 = dword_1ED1ACCC0;
                    v29 = *v30;
                    if (dword_1ED1ACCC0 >= 6)
                    {
                      result = fprintf(v18, "      %-40s : %lld\n", "vcl_cpb_layers_[i].cpb_size_value_minus1", *(unsigned int *)(v29 + v34 + 4));
                      v36 = dword_1ED1ACCC0;
                      v29 = *v30;
                      if (dword_1ED1ACCC0 >= 6)
                      {
                        result = fprintf(v18, "      %-40s : %lld\n", "vcl_cpb_layers_[i].cpb_size_du_value_minus1", *(unsigned int *)(v29 + v34 + 8));
                        v36 = dword_1ED1ACCC0;
                        v29 = *v30;
                        if (dword_1ED1ACCC0 >= 6)
                        {
                          result = fprintf(v18, "      %-40s : %lld\n", "vcl_cpb_layers_[i].bit_rate_du_value_minus1", *(unsigned int *)(v29 + v34 + 12));
                          v36 = dword_1ED1ACCC0;
                          v29 = *v30;
                          if (dword_1ED1ACCC0 >= 6)
                          {
                            result = fprintf(v18, "      %-40s : %lld\n", "vcl_cpb_layers_[i].cbr_flag", *(unsigned __int8 *)(v29 + v34 + 16));
                            v36 = dword_1ED1ACCC0;
                            v29 = *v30;
                          }
                        }
                      }
                    }
                  }
                  ++v35;
                  v34 += 20;
                }
                while (0xCCCCCCCCCCCCCCCDLL * ((*v33 - v29) >> 2) > v35);
              }
            }
            v17 = v39 + 1;
            v16 = *((_QWORD *)a1 + 256);
          }
          while (0x6DB6DB6DB6DB6DB7 * ((*((_QWORD *)a1 + 257) - v16) >> 3) > (unint64_t)(v39 + 1));
        }
      }
    }
    v37 = dword_1ED1ACCC0;
    v2 = __streama;
    if (dword_1ED1ACCC0 >= 6)
    {
      result = fprintf(__streama, "    %-42s : %lld\n", "bitstream_restriction_flag", a1[2072]);
      v37 = dword_1ED1ACCC0;
    }
    if (a1[2072])
    {
      if (v37 < 6)
        return result;
      result = fprintf(__streama, "      %-40s : %lld\n", "tiles_fixed_structure_flag", a1[2073]);
      if (dword_1ED1ACCC0 < 6)
        return result;
      result = fprintf(__streama, "      %-40s : %lld\n", "motion_vectors_over_pic_boundaries_flag", a1[2074]);
      if (dword_1ED1ACCC0 < 6)
        return result;
      result = fprintf(__streama, "      %-40s : %lld\n", "restricted_ref_pic_lists_flag", a1[2075]);
      if (dword_1ED1ACCC0 < 6)
        return result;
      result = fprintf(__streama, "      %-40s : %lld\n", "min_spatial_segmentation_idc", *((unsigned int *)a1 + 519));
      if (dword_1ED1ACCC0 < 6)
        return result;
      result = fprintf(__streama, "      %-40s : %lld\n", "max_bytes_per_pic_denom", *((unsigned int *)a1 + 520));
      if (dword_1ED1ACCC0 < 6)
        return result;
      result = fprintf(__streama, "      %-40s : %lld\n", "max_bits_per_min_cu_denom", *((unsigned int *)a1 + 521));
      if (dword_1ED1ACCC0 < 6)
        return result;
      result = fprintf(__streama, "      %-40s : %lld\n", "log2_max_mv_length_horizontal", *((unsigned int *)a1 + 522));
      if (dword_1ED1ACCC0 < 6)
        return result;
      result = fprintf(__streama, "      %-40s : %lld\n", "log2_max_mv_length_vertical", *((unsigned int *)a1 + 523));
      v37 = dword_1ED1ACCC0;
    }
    if (v37 < 6)
      return result;
    result = fwrite("  }\n", 4uLL, 1uLL, __streama);
    v12 = dword_1ED1ACCC0;
  }
  if (v12 >= 6)
  {
    result = fprintf(v2, "  %-44s : %lld\n", "sps_extension_present_flag", a1[399]);
    if (a1[399])
    {
      if (dword_1ED1ACCC0 >= 6)
      {
        result = fprintf(v2, "  %-44s : %lld\n", "sps_range_extension_flag", a1[400]);
        if (a1[400])
        {
          if (dword_1ED1ACCC0 >= 6)
          {
            result = fprintf(v2, "    %-42s : %lld\n", "rext.transform_skip_rotation_enabled_flag", a1[401]);
            if (dword_1ED1ACCC0 >= 6)
            {
              result = fprintf(v2, "    %-42s : %lld\n", "rext.transform_skip_context_enabled_flag", a1[402]);
              if (dword_1ED1ACCC0 >= 6)
              {
                result = fprintf(v2, "    %-42s : %lld\n", "rext.implicit_rdpcm_enabled_flag", a1[403]);
                if (dword_1ED1ACCC0 >= 6)
                {
                  result = fprintf(v2, "    %-42s : %lld\n", "rext.explicit_rdpcm_enabled_flag", a1[404]);
                  if (dword_1ED1ACCC0 >= 6)
                  {
                    result = fprintf(v2, "    %-42s : %lld\n", "rext.extended_precision_processing_flag", a1[405]);
                    if (dword_1ED1ACCC0 >= 6)
                    {
                      result = fprintf(v2, "    %-42s : %lld\n", "rext.intra_smoothing_disabled_flag", a1[406]);
                      if (dword_1ED1ACCC0 >= 6)
                      {
                        result = fprintf(v2, "    %-42s : %lld\n", "rext.high_precision_offsets_enabled_flag", a1[407]);
                        if (dword_1ED1ACCC0 >= 6)
                        {
                          result = fprintf(v2, "    %-42s : %lld\n", "rext.persistent_rice_adaptation_enabled_flag", a1[408]);
                          if (dword_1ED1ACCC0 >= 6)
                            return fprintf(v2, "    %-42s : %lld\n", "rext.cabac_bypass_alignment_enabled_flag", a1[409]);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

unsigned __int16 *sub_1C9831118(uint64_t a1, unint64_t a2)
{
  uint8x16_t *v2;
  unsigned __int8 *v3;
  uint8x16_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;
  unsigned __int8 *v8;
  int v9;
  unsigned __int16 v10;
  int v11;
  unsigned int v12;
  uint8x16_t *v13;
  __int8 *v14;
  unsigned __int16 *v15;
  unsigned int v16;
  unsigned __int16 *v17;
  int v18;
  unsigned int v19;

  v2 = (uint8x16_t *)(a1 + 2);
  if (a1 + 19 >= a2)
  {
    v13 = (uint8x16_t *)(a1 + 2);
LABEL_13:
    v15 = &v13->u16[1];
    if ((unint64_t)v13->u64 + 2 < a2)
    {
      v16 = bswap32(v13->u16[0]) >> 16;
      v17 = v15;
      while (1)
      {
        v18 = *(unsigned __int8 *)v17;
        v17 = (unsigned __int16 *)((char *)v17 + 1);
        v19 = v18 & 0xFF0000FF | ((unsigned __int16)v16 << 8);
        if (v19 < 2)
          break;
        v15 = v17;
        LOWORD(v16) = v19;
        if ((unint64_t)v17 >= a2)
          return (unsigned __int16 *)a2;
      }
      return v15 - 1;
    }
  }
  else
  {
    v3 = (unsigned __int8 *)(a1 + 4);
    while (1)
    {
      v4 = *v2;
      v4.i8[0] = vminvq_u8(*v2);
      if (!v4.i32[0])
      {
        v5 = 0;
        v6 = v3;
        do
        {
          v7 = v5;
          v8 = v6;
          v9 = v2->u8[v5++];
          ++v6;
        }
        while (v9);
        if ((v7 & 0xFFFFFFF0) == 0)
          break;
      }
LABEL_10:
      v13 = v2 + 1;
      v14 = &v2[2].i8[1];
      v3 += 16;
      ++v2;
      if ((unint64_t)v14 >= a2)
        goto LABEL_13;
    }
    v10 = v2->u8[v5];
    while (1)
    {
      v11 = *v8++;
      v12 = v11 & 0xFF0000FF | (v10 << 8);
      if (v12 < 2)
        return (unsigned __int16 *)((char *)v2 + v7);
      ++v7;
      v10 = v12;
      if (v7 == 16)
        goto LABEL_10;
    }
  }
  return (unsigned __int16 *)a2;
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80310](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80318](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80320](c, data, *(_QWORD *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D10](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98538](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1E0C985C8](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x1E0C98910](number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x1E0C98A50](applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1E0C9D620](dict, rect);
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x1E0C9EB10]();
}

OSStatus CMBlockBufferCreateContiguous(CFAllocatorRef structureAllocator, CMBlockBufferRef sourceBuffer, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1E0C9EB70](structureAllocator, sourceBuffer, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1E0C9EB88](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x1E0C9EBA8](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x1E0C9ED90]();
}

Boolean CMFormatDescriptionEqual(CMFormatDescriptionRef formatDescription, CMFormatDescriptionRef otherFormatDescription)
{
  return MEMORY[0x1E0C9EDB8](formatDescription, otherFormatDescription);
}

CFPropertyListRef CMFormatDescriptionGetExtension(CMFormatDescriptionRef desc, CFStringRef extensionKey)
{
  return (CFPropertyListRef)MEMORY[0x1E0C9EDC8](desc, extensionKey);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x1E0C9EE00](target, key, attachmentModeOut);
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1E0C9EF40](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x1E0C9EFB0](sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x1E0C9EFD0](sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x1E0C9F010](sbuf, createIfNecessary);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1E0C9F2D8](time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F400](retstr, lhs, rhs);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x1E0C9F558](videoDesc);
}

CFTypeRef CVBufferGetAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x1E0CA8910](buffer, key, attachmentMode);
}

CFDictionaryRef CVBufferGetAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA8918](buffer, *(_QWORD *)&attachmentMode);
}

void CVBufferPropagateAttachments(CVBufferRef sourceBuffer, CVBufferRef destinationBuffer)
{
  MEMORY[0x1E0CA8928](sourceBuffer, destinationBuffer);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
  MEMORY[0x1E0CA8950](buffer, key, value, *(_QWORD *)&attachmentMode);
}

void CVBufferSetAttachments(CVBufferRef buffer, CFDictionaryRef theAttachments, CVAttachmentMode attachmentMode)
{
  MEMORY[0x1E0CA8958](buffer, theAttachments, *(_QWORD *)&attachmentMode);
}

int CVColorPrimariesGetIntegerCodePointForString(CFStringRef colorPrimariesString)
{
  return MEMORY[0x1E0CA8960](colorPrimariesString);
}

CFStringRef CVColorPrimariesGetStringForIntegerCodePoint(int colorPrimariesCodePoint)
{
  return (CFStringRef)MEMORY[0x1E0CA8968](*(_QWORD *)&colorPrimariesCodePoint);
}

CVReturn CVPixelBufferCreateResolvedAttributesDictionary(CFAllocatorRef allocator, CFArrayRef attributes, CFDictionaryRef *resolvedDictionaryOut)
{
  return MEMORY[0x1E0CA8AA8](allocator, attributes, resolvedDictionaryOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1E0CA8AE0](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1E0CA8AE8](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8AF8](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B00](pixelBuffer, planeIndex);
}

void CVPixelBufferGetExtendedPixels(CVPixelBufferRef pixelBuffer, size_t *extraColumnsOnLeft, size_t *extraColumnsOnRight, size_t *extraRowsOnTop, size_t *extraRowsOnBottom)
{
  MEMORY[0x1E0CA8B10](pixelBuffer, extraColumnsOnLeft, extraColumnsOnRight, extraRowsOnTop, extraRowsOnBottom);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B20](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B28](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1E0CA8B30](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B38](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B40](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B50](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B58](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1E0CA8B70](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x1E0CA8B78](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8B80](allocator, pixelBufferPool, pixelBufferOut);
}

CFDictionaryRef CVPixelBufferPoolGetPixelBufferAttributes(CVPixelBufferPoolRef pool)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA8BA8](pool);
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
  MEMORY[0x1E0CA8BC8](pixelBufferPool);
}

CVPixelBufferPoolRef CVPixelBufferPoolRetain(CVPixelBufferPoolRef pixelBufferPool)
{
  return (CVPixelBufferPoolRef)MEMORY[0x1E0CA8BD0](pixelBufferPool);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x1E0CA8BF0](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1E0CA8BF8](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1E0CA8C00](pixelBuffer, unlockFlags);
}

void CVPixelFormatDescriptionRegisterDescriptionWithPixelFormatType(CFDictionaryRef description, OSType pixelFormat)
{
  MEMORY[0x1E0CA8C20](description, *(_QWORD *)&pixelFormat);
}

int CVTransferFunctionGetIntegerCodePointForString(CFStringRef transferFunctionString)
{
  return MEMORY[0x1E0CA8C30](transferFunctionString);
}

CFStringRef CVTransferFunctionGetStringForIntegerCodePoint(int transferFunctionCodePoint)
{
  return (CFStringRef)MEMORY[0x1E0CA8C38](*(_QWORD *)&transferFunctionCodePoint);
}

int CVYCbCrMatrixGetIntegerCodePointForString(CFStringRef yCbCrMatrixString)
{
  return MEMORY[0x1E0CA8C40](yCbCrMatrixString);
}

CFStringRef CVYCbCrMatrixGetStringForIntegerCodePoint(int yCbCrMatrixCodePoint)
{
  return (CFStringRef)MEMORY[0x1E0CA8C48](*(_QWORD *)&yCbCrMatrixCodePoint);
}

uint64_t FigFormatDescriptionRelease()
{
  return MEMORY[0x1E0CA0918]();
}

uint64_t FigFormatDescriptionRetain()
{
  return MEMORY[0x1E0CA0920]();
}

uint64_t FigThreadRunOnce()
{
  return MEMORY[0x1E0CA1810]();
}

uint64_t IOSurfaceAcceleratorCreate()
{
  return MEMORY[0x1E0D3A1D0]();
}

uint64_t IOSurfaceAcceleratorTransformSurface()
{
  return MEMORY[0x1E0D3A200]();
}

uint64_t VTDecoderSessionEmitDecodedFrame()
{
  return MEMORY[0x1E0CEC9F0]();
}

uint64_t VTDecoderSessionGetPixelBufferPool()
{
  return MEMORY[0x1E0CEC9F8]();
}

uint64_t VTDecoderSessionSetPixelBufferAttributes()
{
  return MEMORY[0x1E0CECA00]();
}

uint64_t VTEncoderSessionCreateVideoFormatDescription()
{
  return MEMORY[0x1E0CECAB0]();
}

uint64_t VTEncoderSessionDequeueDecodeTimeStamp()
{
  return MEMORY[0x1E0CECAB8]();
}

uint64_t VTEncoderSessionEmitEncodedFrame()
{
  return MEMORY[0x1E0CECAC0]();
}

uint64_t VTEncoderSessionEmitEncodedTile()
{
  return MEMORY[0x1E0CECAC8]();
}

uint64_t VTEncoderSessionEnqueuePresentationTimeStamp()
{
  return MEMORY[0x1E0CECAD0]();
}

uint64_t VTEncoderSessionSetPixelBufferAttributes()
{
  return MEMORY[0x1E0CECAD8]();
}

uint64_t VTRegisterVideoDecoderWithInfo()
{
  return MEMORY[0x1E0CECD40]();
}

uint64_t VTTileDecoderSessionEmitDecodedTile()
{
  return MEMORY[0x1E0CECDE0]();
}

uint64_t VTTileDecoderSessionSetTileDecodeRequirements()
{
  return MEMORY[0x1E0CECDE8]();
}

uint64_t VTTileEncoderSessionCreateVideoFormatDescription()
{
  return MEMORY[0x1E0CECE10]();
}

uint64_t VTTileEncoderSessionSetTileEncodeRequirements()
{
  return MEMORY[0x1E0CECE20]();
}

uint64_t VTVideoDecoderGetCMBaseObject()
{
  return MEMORY[0x1E0CECE48]();
}

uint64_t VTVideoDecoderGetClassID()
{
  return MEMORY[0x1E0CECE50]();
}

uint64_t VTVideoEncoderGetCMBaseObject()
{
  return MEMORY[0x1E0CECE58]();
}

uint64_t VTVideoEncoderGetClassID()
{
  return MEMORY[0x1E0CECE60]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1E0DE41F0]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
  MEMORY[0x1E0DE43A8](a1, a2, a3);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4408](this, __pos, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4440](this, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x1E0DE4480](this, __n, __c);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x1E0DE4590]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x1E0DE45A8]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x1E0DE45B0]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x1E0DE4608]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x1E0DE4628]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x1E0DE4648]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE46D8]();
}

{
  return MEMORY[0x1E0DE4700]();
}

{
  return MEMORY[0x1E0DE4708]();
}

{
  return MEMORY[0x1E0DE4728]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1E0DE47A8]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
  MEMORY[0x1E0DE4890](this);
}

void std::condition_variable::wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk)
{
  MEMORY[0x1E0DE48A8](this, __lk);
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
  MEMORY[0x1E0DE48B0](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
  MEMORY[0x1E0DE4920](*(_QWORD *)&__ev, __what_arg);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA0](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA8](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x1E0DE4AB8](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x1E0DE4C50](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x1E0DE4DB0](this);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD8](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E8290A10();
}

void operator delete(void *__p)
{
  off_1E8290A18(__p);
}

void operator delete(void *__p, const std::nothrow_t *a2)
{
  off_1E8290A20(__p, a2);
}

void operator delete(void *__p, std::align_val_t a2)
{
  off_1E8290A28(__p, a2);
}

uint64_t operator delete()
{
  return off_1E8290A30();
}

uint64_t operator new[]()
{
  return off_1E8290A38();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E8290A40(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_1E8290A48(__sz, a2);
}

void *__cdecl operator new(size_t __sz, std::align_val_t a2)
{
  return (void *)off_1E8290A50(__sz, a2);
}

void *__cdecl operator new(size_t __sz, std::align_val_t a2, const std::nothrow_t *a3)
{
  return (void *)off_1E8290A58(__sz, a2, a3);
}

uint64_t operator new()
{
  return off_1E8290A60();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1E0C80A98](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x1E0DE50B0](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x1E0DE50D0]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82C18](queue, context, work);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82D18](group, queue, context, work);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

float exp2f(float a1)
{
  float result;

  MEMORY[0x1E0C83290](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C83488](*(_QWORD *)&a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fscanf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83520](a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83BB0](a1, a2);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BE8](__x);
  return result;
}

float log2f(float a1)
{
  float result;

  MEMORY[0x1E0C83BF0](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x1E0C83F08](memptr, alignment, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

char *__cdecl setlocale(int a1, const char *a2)
{
  return (char *)MEMORY[0x1E0C85358](*(_QWORD *)&a1, a2);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1E0C85558](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1E0C855F0](__stringp, __delim);
}

double strtod(const char *a1, char **a2)
{
  double result;

  MEMORY[0x1E0C85618](a1, a2);
  return result;
}

intmax_t strtoimax(const char *__nptr, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85638](__nptr, __endptr, *(_QWORD *)&__base);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x1E0C85650](__str, __sep, __lasts);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85678](__str, __endptr, *(_QWORD *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

