@implementation PISelectiveColorFilter

- (id)hueSatLumTable
{
  CGColorSpaceRef v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  CGColorSpace *v51;
  void *v52;
  NSArray *obj;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[7];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v3 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA00]);
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIConstantColorGenerator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v3;
  objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:alpha:colorSpace:", v3, 0.0, 0.0, 0.0, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v5, CFSTR("inputColor"));

  v52 = v4;
  objc_msgSend(v4, "outputImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageByCroppingToRect:", 0.0, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[PISelectiveColorFilter selectiveColorKernels](PISelectiveColorFilter, "selectiveColorKernels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("add_gaussian"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = self->_inputCorrections;
  v56 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  if (v56)
  {
    v55 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v56; ++i)
      {
        if (*(_QWORD *)v60 != v55)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("red"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("green"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("blue"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("spread"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("hueShift"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("saturation"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("luminance"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "doubleValue");
        v18 = 0.0000001;
        if (v19 > 0.0000001)
        {
          objc_msgSend(v14, "doubleValue");
          v18 = v20;
        }
        objc_msgSend(v15, "doubleValue");
        if (v21 != 0.0
          || (objc_msgSend(v16, "doubleValue"), v22 != 0.0)
          || (objc_msgSend(v17, "doubleValue"), v23 != 0.0))
        {
          objc_msgSend(v7, "extent");
          v25 = v24;
          v27 = v26;
          v29 = v28;
          v31 = v30;
          v63[0] = v7;
          v63[1] = &unk_1E5052198;
          v63[2] = v15;
          v63[3] = v16;
          v63[4] = v17;
          v57 = v17;
          v58 = v16;
          v32 = v11;
          v33 = (void *)MEMORY[0x1E0CB37E8];
          v34 = v14;
          objc_msgSend(v32, "doubleValue");
          v36 = v35;
          objc_msgSend(v12, "doubleValue");
          v38 = v37;
          objc_msgSend(v13, "doubleValue");
          +[PISelectiveColorFilter iptHueAngleFromRed:green:blue:](PISelectiveColorFilter, "iptHueAngleFromRed:green:blue:", v36, v38, v39);
          objc_msgSend(v33, "numberWithDouble:");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v63[5] = v40;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18 * 0.0833333333 * (v18 * 0.0833333333));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v63[6] = v41;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 7);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_15, v42, v25, v27, v29, v31);
          v43 = objc_claimAutoreleasedReturnValue();
          v44 = v7;
          v7 = (void *)v43;

          v14 = v34;
          v16 = v58;

          v11 = v32;
          v17 = v57;
        }

      }
      v56 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    }
    while (v56);
  }

  objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:alpha:colorSpace:", v51, 0.0, 1.0, 1.0, 1.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setValue:forKey:", v45, CFSTR("inputColor"));

  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIAdditionCompositing"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setValue:forKey:", v7, CFSTR("inputBackgroundImage"));
  objc_msgSend(v52, "outputImage");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setValue:forKey:", v47, CFSTR("inputImage"));

  objc_msgSend(v46, "outputImage");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v48, "imageByCroppingToRect:", 0.0, 0.0, 360.0, 1.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  CGColorSpaceRelease(v51);
  return v49;
}

- (id)outputImage
{
  CIImage *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v3 = self->_inputImage;
  +[PISelectiveColorFilter convertToIPT:](PISelectiveColorFilter, "convertToIPT:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PISelectiveColorFilter hueSatLumTable](self, "hueSatLumTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PISelectiveColorFilter selectiveColorKernels](PISelectiveColorFilter, "selectiveColorKernels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("iptLumHueSatTable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "extent");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v20[0] = v4;
  v20[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applyWithExtent:roiCallback:arguments:options:", &__block_literal_global_39_19264, v16, 0, v9, v11, v13, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[PISelectiveColorFilter convertFromIPT:](PISelectiveColorFilter, "convertFromIPT:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputImage, a3);
}

- (NSArray)inputCorrections
{
  return self->_inputCorrections;
}

- (void)setInputCorrections:(id)a3
{
  objc_storeStrong((id *)&self->_inputCorrections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputCorrections, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

double __37__PISelectiveColorFilter_outputImage__block_invoke(uint64_t a1, int a2)
{
  double result;

  if (a2 > 0)
    return 0.0;
  return result;
}

double __40__PISelectiveColorFilter_hueSatLumTable__block_invoke()
{
  return 0.0;
}

+ (void)iptFromLinearInto:(float *)a3 fromRed:(float)a4 green:(float)a5 blue:(float)a6
{
  uint64_t v7;
  float *v8;
  float v9;
  float v10;
  uint64_t v11;
  float v12;
  float v13;
  uint64_t v14;
  uint64_t v15;
  float *v16;
  float v17;
  float v18;
  float v19;
  float v20;
  uint64_t v21;
  float v22;
  uint64_t v23;
  float v24;
  uint64_t v25;

  v7 = 0;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = (float *)&dword_1A64D6F64;
  do
  {
    v9 = (float)(*(v8 - 1) * a5) + (float)(*(v8 - 2) * a4);
    v10 = *v8;
    v8 += 3;
    *(float *)((char *)&v23 + v7) = v9 + (float)(v10 * a6);
    v7 += 4;
  }
  while (v7 != 12);
  v11 = 0;
  v21 = v23;
  v22 = v24;
  do
  {
    v12 = *(float *)((char *)&v21 + v11);
    v13 = powf(fabsf(v12), 0.43);
    if (v12 < 0.0)
      v13 = -v13;
    *(float *)((char *)&v21 + v11) = v13;
    v11 += 4;
  }
  while (v11 != 12);
  v14 = 0;
  v15 = v21;
  v16 = (float *)&dword_1A64D6F88;
  v17 = v22;
  do
  {
    v18 = (float)(*((float *)&v15 + 1) * *(v16 - 1)) + (float)(*(v16 - 2) * *(float *)&v15);
    v19 = *v16;
    v16 += 3;
    *(float *)((char *)&v23 + v14) = v18 + (float)(v19 * v17);
    v14 += 4;
  }
  while (v14 != 12);
  v20 = v24;
  *(_QWORD *)a3 = v23;
  a3[2] = v20;
}

+ (float)hueAngleFrom:(const float *)a3
{
  float v3;

  v3 = atan2f(a3[2], a3[1]) / 6.28318531;
  return v3 + 0.5;
}

+ (double)iptHueAngleFromRed:(double)a3 green:(double)a4 blue:(double)a5
{
  float v6;
  _BYTE v8[16];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  *(float *)&a3 = a3;
  *(float *)&a4 = a4;
  *(float *)&a5 = a5;
  objc_msgSend(a1, "iptFromLinearInto:fromRed:green:blue:", v8, a3, a4, a5);
  objc_msgSend(a1, "hueAngleFrom:", v8);
  return v6;
}

+ (id)selectiveColorKernels
{
  if (selectiveColorKernels_onceToken != -1)
    dispatch_once(&selectiveColorKernels_onceToken, &__block_literal_global_19310);
  return (id)selectiveColorKernels_selectiveColorKernels;
}

+ (id)convertToIPT:(id)a3
{
  const __CFString *v3;
  id v4;
  CGColorSpace *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = (const __CFString *)*MEMORY[0x1E0C9D958];
  v4 = a3;
  v5 = CGColorSpaceCreateWithName(v3);
  objc_msgSend(v4, "imageByColorMatchingWorkingSpaceToColorSpace:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PISelectiveColorFilter selectiveColorKernels](PISelectiveColorFilter, "selectiveColorKernels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("srgbToIPT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "extent");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v20[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applyWithExtent:arguments:", v17, v10, v12, v14, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  CGColorSpaceRelease(v5);
  return v18;
}

+ (id)convertFromIPT:(id)a3
{
  const __CFString *v3;
  id v4;
  CGColorSpace *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = (const __CFString *)*MEMORY[0x1E0C9D958];
  v4 = a3;
  v5 = CGColorSpaceCreateWithName(v3);
  +[PISelectiveColorFilter selectiveColorKernels](PISelectiveColorFilter, "selectiveColorKernels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("iptToSRGB"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "extent");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v20[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "applyWithExtent:arguments:", v16, v9, v11, v13, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "imageByColorMatchingColorSpaceToWorkingSpace:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  CGColorSpaceRelease(v5);
  return v18;
}

void __47__PISelectiveColorFilter_selectiveColorKernels__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DDD0], "kernelsDictionaryWithString:", CFSTR("kernel vec4 iptLumHueSatTable(sampler image, __table sampler hueSatLumTable)\n{\nvec4 im = sample(image, samplerCoord(image)) ;\nvec4 result = im;\nfloat hue = atan(im.b, im.g);\nfloat hueIdx = 359.0 * 0.5 * (hue/3.1416 + 1.0);\nhueIdx = clamp(hueIdx, 0.0, 359.0) + 0.5;\nfloat hueChange = (sample(hueSatLumTable, samplerTransform(hueSatLumTable, vec2(hueIdx,0.5))).r);\nfloat satChange = (sample(hueSatLumTable, samplerTransform(hueSatLumTable, vec2(hueIdx,0.5))).g);\nfloat lumChange = (sample(hueSatLumTable, samplerTransform(hueSatLumTable, vec2(hueIdx,0.5))).b);\nfloat chroma = sqrt(im.g*im.g+im.b*im.b) ;\nchroma *= satChange ;\nhue += hueChange ;\nvec3 adjustIm = im.rgb;\nfloat hueAngle = hue  ;\nlumChange = mix(1.0, lumChange, clamp(chroma,-0.7,0.7));\nadjustIm.r *= lumChange;\nadjustIm.g = chroma * cos(hueAngle) ;\nadjustIm.b = chroma * sin(hueAngle) ;\nresult.rgb = adjustIm.rgb;\nresult.a = im.a ;\nreturn result ;\n}\nkernel vec4 srgbToIPT(sampler image){\nvec4 im = sample(image, samplerCoord(image));\nvec3 lms, ipt;\nlms = im.r * vec3(0.3139902162, 0.155372406, 0.017752387) +\nim.g * vec3(0.6395129383, 0.7578944616, 0.109442094) +\nim.b * vec3(0.0464975462, 0.0867014186, 0.8725692246);\nlms = sign(lms)*pow(abs(lms), vec3(0.43, 0.43, 0.43));\nipt = lms.r * vec3(0.4, 4.455, 0.8056) +\nlms.g * vec3(0.4, -4.851, 0.3572) +\nlms.b * vec3(0.2, 0.3960, -1.1628);\nreturn vec4(ipt, im.a);\n}\nkernel vec4 iptToSRGB(sampler image){\nvec4 im = sample(image, samplerCoord(image));\nvec3 lms, rgb;\nlms = im.rrr +\nim.g * vec3(0.09756893,-0.11387649,0.03261511) +\nim.b * vec3(0.20522644, 0.13321716,  -0.67688718);\nlms = sign(lms)*pow(abs(lms), vec3(1.0/.43));\nrgb = lms.r * vec3( 5.472212058380287,  -1.125241895533569,   0.029801651173470) +\nlms.g * vec3(-4.641960098354470, 2.293170938060623, -0.193180728257140) +\nlms.b * vec3(0.169637076827974,  -0.167895202223709, 1.163647892783812);\nreturn vec4(rgb, im.a);\n}\nkernel vec4 add_gaussian(sampler srcTable, float tableSize, float hueAmplitude, float satAmplitude, float lumAmplitude, float gaussX, float gaussSigmaSquared) {\nvec2 d = destCoord();\nvec4 src = sample(srcTable, samplerCoord(srcTable));\nfloat x = d.x / (tableSize - 1.0);\nfloat dist = min(min(abs(x - gaussX), abs(x - 1.0 - gaussX)), abs(x + 1.0 - gaussX));\nfloat p = -((dist * dist) / (2.0 * gaussSigmaSquared));\nfloat ep = exp(p);\nfloat hue = hueAmplitude * ep;\nfloat sat = satAmplitude * ep;\nfloat lum = lumAmplitude * ep;\nfloat h = clamp(src.r + hue, -1.0, 1.0);\nfloat s = clamp(src.g + sat, -1.0, 1.0);\nfloat l = clamp(src.b + lum, -1.0, 1.0);\nreturn vec4(h,s,l,1.0);\n}\n\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)selectiveColorKernels_selectiveColorKernels;
  selectiveColorKernels_selectiveColorKernels = v0;

}

@end
