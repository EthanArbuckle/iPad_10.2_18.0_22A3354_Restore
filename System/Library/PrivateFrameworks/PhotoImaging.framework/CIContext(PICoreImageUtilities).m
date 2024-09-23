@implementation CIContext(PICoreImageUtilities)

- (id)pi_createColorCubeDataForFilters:()PICoreImageUtilities dimension:colorSpace:
{
  id v8;
  unint64_t v9;
  void *v10;
  id v11;
  _BYTE *v12;
  unint64_t v13;
  float v14;
  unint64_t v15;
  float v16;
  float v17;
  int v18;
  unint64_t v19;
  float v20;
  float v21;
  int v22;
  float v23;
  float v24;
  int v25;
  double v26;
  double v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  unsigned int v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4 * a4;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", a4 * a4 * 4 * a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v49 = v10;
    v11 = objc_retainAutorelease(v10);
    v12 = (_BYTE *)objc_msgSend(v11, "mutableBytes");
    if (a4)
    {
      v13 = 0;
      v14 = (float)(a4 - 1);
      do
      {
        v15 = 0;
        v16 = 255.0;
        v17 = (float)((float)((float)v13 / v14) * 255.0) + 0.5;
        if (v17 < 255.0)
          v16 = (float)((float)((float)v13 / v14) * 255.0) + 0.5;
        v18 = (int)v16;
        if (v17 < 0.0)
          LOBYTE(v18) = 0;
        do
        {
          v19 = 0;
          v20 = 255.0;
          v21 = (float)((float)((float)v15 / v14) * 255.0) + 0.5;
          if (v21 < 255.0)
            v20 = (float)((float)((float)v15 / v14) * 255.0) + 0.5;
          v22 = (int)v20;
          if (v21 < 0.0)
            LOBYTE(v22) = 0;
          do
          {
            v23 = 255.0;
            v24 = (float)((float)((float)v19 / v14) * 255.0) + 0.5;
            if (v24 < 255.0)
              v23 = (float)((float)((float)v19 / v14) * 255.0) + 0.5;
            v25 = (int)v23;
            if (v24 < 0.0)
              LOBYTE(v25) = 0;
            *v12 = v25;
            v12[1] = v22;
            v12[2] = v18;
            v12[3] = -1;
            v12 += 4;
            ++v19;
          }
          while (a4 != v19);
          ++v15;
        }
        while (v15 != a4);
        ++v13;
      }
      while (v13 != a4);
    }
    v48 = a4 * a4 * 4 * a4;
    v46 = a1;
    v26 = (double)a4;
    v27 = (double)v9;
    v45 = 4 * a4;
    v44 = *MEMORY[0x1E0C9E070];
    v47 = a5;
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", v11, 4 * a4, (double)a4, (double)v9);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v50 = v8;
    v29 = v8;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    v31 = v28;
    if (v30)
    {
      v32 = v30;
      v33 = *(_QWORD *)v52;
      v34 = *MEMORY[0x1E0C9E1F8];
      v31 = v28;
      do
      {
        v35 = 0;
        v36 = v31;
        do
        {
          if (*(_QWORD *)v52 != v33)
            objc_enumerationMutation(v29);
          v37 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v35);
          objc_msgSend(v37, "valueForKey:", v34);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setValue:forKey:", v36, v34);
          objc_msgSend(v37, "outputImage");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v37, "setValue:forKey:", v38, v34);
          ++v35;
          v36 = v31;
        }
        while (v32 != v35);
        v32 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      }
      while (v32);
    }

    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v48);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v39)
    {
      v41 = objc_retainAutorelease(v39);
      objc_msgSend(v46, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v31, objc_msgSend(v41, "mutableBytes"), v45, v44, v47, 0.0, 0.0, v26, v27);
      v42 = v41;
    }

    v10 = v49;
    v8 = v50;
  }
  else
  {
    v40 = 0;
  }

  return v40;
}

@end
