@implementation UIColor(SXJSONObject)

- (uint64_t)initWithJSONObject:()SXJSONObject andVersion:
{
  id v5;
  id v6;
  uint64_t v7;
  size_t v8;
  unint64_t v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  int v14;
  float32x2_t v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  int v20;
  float v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  int v26;
  float v27;
  uint64_t v28;
  int v29;
  unsigned int v30;
  unsigned int v31;
  int v32;
  int v33;
  int v34;
  unsigned int v35;
  unsigned int v36;
  int v37;
  int v38;
  float v39;
  int v40;
  unsigned int v41;
  unsigned int v42;
  int v43;
  int v44;
  int v45;
  unsigned int v46;
  unsigned int v47;
  int v48;
  int v49;
  float v50;
  void *v51;
  void *v52;
  int8x16_t v53;
  int8x16_t v54;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "hasPrefix:", CFSTR("#")))
  {
    objc_msgSend(v5, "stringByReplacingCharactersInRange:withString:", 0, 1, CFSTR("0x"));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "UTF8String");

    v8 = strlen((const char *)v7);
    v9 = strtoll((const char *)v7, 0, 0);
    switch(v8)
    {
      case 5uLL:
        v10 = *(char *)(v7 + 2);
        v11 = v10 - 48;
        v12 = v10 - 97;
        if ((v10 - 65) >= 6)
          v13 = 0;
        else
          v13 = v10 - 55;
        v14 = v10 - 87;
        if (v12 > 5)
          v14 = v13;
        if (v11 <= 9)
          v14 = v11;
        v15.f32[0] = (float)((float)v14 + (float)((float)v14 * 16.0)) / 255.0;
        v16 = *(char *)(v7 + 3);
        v17 = v16 - 48;
        v18 = v16 - 97;
        if ((v16 - 65) >= 6)
          v19 = 0;
        else
          v19 = v16 - 55;
        v20 = v16 - 87;
        if (v18 > 5)
          v20 = v19;
        if (v17 <= 9)
          v20 = v17;
        v21 = (float)((float)v20 + (float)((float)v20 * 16.0)) / 255.0;
        v22 = *(char *)(v7 + 4);
        v23 = v22 - 48;
        v24 = v22 - 97;
        if ((v22 - 65) >= 6)
          v25 = 0;
        else
          v25 = v22 - 55;
        v26 = v22 - 87;
        if (v24 > 5)
          v26 = v25;
        if (v23 <= 9)
          v26 = v23;
        v27 = (float)((float)v26 + (float)((float)v26 * 16.0)) / 255.0;
        v15.f32[1] = v21;
        goto LABEL_58;
      case 6uLL:
        v29 = *(char *)(v7 + 2);
        v30 = v29 - 48;
        v31 = v29 - 97;
        if ((v29 - 65) >= 6)
          v32 = 0;
        else
          v32 = v29 - 55;
        v33 = v29 - 87;
        if (v31 > 5)
          v33 = v32;
        if (v30 <= 9)
          v33 = v30;
        v15.f32[0] = (float)((float)v33 + (float)((float)v33 * 16.0)) / 255.0;
        v34 = *(char *)(v7 + 3);
        v35 = v34 - 48;
        v36 = v34 - 97;
        if ((v34 - 65) >= 6)
          v37 = 0;
        else
          v37 = v34 - 55;
        v38 = v34 - 87;
        if (v36 > 5)
          v38 = v37;
        if (v35 <= 9)
          v38 = v35;
        v39 = (float)((float)v38 + (float)((float)v38 * 16.0)) / 255.0;
        v40 = *(char *)(v7 + 4);
        v41 = v40 - 48;
        v42 = v40 - 97;
        if ((v40 - 65) >= 6)
          v43 = 0;
        else
          v43 = v40 - 55;
        v44 = v40 - 87;
        if (v42 > 5)
          v44 = v43;
        if (v41 <= 9)
          v44 = v41;
        v27 = (float)((float)v44 + (float)((float)v44 * 16.0)) / 255.0;
        v45 = *(char *)(v7 + 5);
        v46 = v45 - 48;
        v47 = v45 - 97;
        if ((v45 - 65) >= 6)
          v48 = 0;
        else
          v48 = v45 - 55;
        v49 = v45 - 87;
        if (v47 > 5)
          v49 = v48;
        if (v46 <= 9)
          v49 = v46;
        v50 = (float)((float)v49 + (float)((float)v49 * 16.0)) / 255.0;
        v15.f32[1] = v39;
        break;
      case 8uLL:
        v53.i64[0] = 255;
        v53.i64[1] = 255;
        v15 = vcvt_f32_f64(vdivq_f64(vcvtq_f64_s64((int64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)vdupq_n_s64(v9), (uint64x2_t)xmmword_21713C7A0), v53)), (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL)));
        v27 = (double)v9 / 255.0;
LABEL_58:
        v50 = 1.0;
        break;
      case 0xAuLL:
        v54.i64[0] = 255;
        v54.i64[1] = 255;
        v15 = vcvt_f32_f64(vdivq_f64(vcvtq_f64_s64((int64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)vdupq_n_s64(v9), (uint64x2_t)xmmword_21713C790), v54)), (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL)));
        v27 = (double)BYTE1(v9) / 255.0;
        v50 = (double)v9 / 255.0;
        break;
      default:
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "UIColor+SXJSONObject.m");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, v52, 84, CFSTR("Invalid color string"));

        v15 = 0;
        v27 = 0.0;
        v50 = 0.0;
        break;
    }
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", v15.f32[0], v15.f32[1], v27, v50);
    v28 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

@end
