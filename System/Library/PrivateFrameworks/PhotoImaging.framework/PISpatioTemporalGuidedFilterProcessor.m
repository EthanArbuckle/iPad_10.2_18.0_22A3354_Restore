@implementation PISpatioTemporalGuidedFilterProcessor

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
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
  int v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  __CFString *v76;
  void *v77;
  id v78;
  id v79;
  void *v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD v86[3];
  void *v87;
  _QWORD v88[3];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "metalCommandBuffer");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "device");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v8;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
  v69 = objc_claimAutoreleasedReturnValue();
  v70 = v12;
  objc_msgSend(v12, "metalTexture");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v10;
  objc_msgSend(v10, "metalTexture");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "width");
  v15 = objc_msgSend(v13, "height");
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("epsilon"));
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = &unk_1E5051B38;
  if (v16)
    v18 = (void *)v16;
  v19 = v18;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("radius"));
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  v22 = &unk_1E50511C0;
  if (v20)
    v22 = (void *)v20;
  v23 = v22;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("channels"));
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v24)
    v26 = (__CFString *)v24;
  else
    v26 = CFSTR("RGB");
  v27 = v26;

  v76 = v27;
  v28 = -[__CFString isEqualToString:](v27, "isEqualToString:", CFSTR("RGB"));
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("iterations"));
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  v31 = &unk_1E50511D8;
  if (v29)
    v31 = (void *)v29;
  v78 = v31;

  v74 = v9;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("constrainToAlpha"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "BOOLValue");

  v34 = (void *)MEMORY[0x1E0CC6E98];
  v67 = v23;
  v35 = (2 * objc_msgSend(v23, "unsignedIntegerValue")) | 1;
  v68 = (void *)v19;
  objc_msgSend((id)v19, "floatValue");
  if (v28)
    v36 = 3;
  else
    v36 = 1;
  objc_msgSend(v34, "filterDescriptorWithWidth:height:arrayLength:kernelSpatialDiameter:kernelTemporalDiameter:epsilon:sourceChannels:guideChannels:", v14, v15, 1, v35, 1, v36, 3);
  v71 = (void *)v11;
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E90]), "initWithDevice:filterDescriptor:", v11, v66);
  v81 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v79 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v77 = 0;
  v64 = v33;
  if (v33)
    v77 = (void *)objc_msgSend(v13, "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:", objc_msgSend(v13, "pixelFormat"), objc_msgSend(v13, "textureType"), 0, 1, 0, 1, 17106181);
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, objc_msgSend(v80, "width"), objc_msgSend(v80, "height"), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setStorageMode:", 2);
  objc_msgSend(v38, "setUsage:", 3);
  v65 = v37;
  if (v28)
  {
    v63 = v28;
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v39 = objc_msgSend(&unk_1E5058D70, "countByEnumeratingWithState:objects:count:", &v82, v89, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v83;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v83 != v41)
            objc_enumerationMutation(&unk_1E5058D70);
          v19 = (65793 * objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * i), "unsignedCharValue")) | v19 & 0xFFFFFFFF00000000 | 0x1000000;
          v43 = (void *)objc_msgSend(v13, "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:", objc_msgSend(v13, "pixelFormat"), objc_msgSend(v13, "textureType"), 0, 1, 0, 1, v19);
          objc_msgSend(v81, "addObject:", v43);
          objc_msgSend(v80, "device");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (void *)objc_msgSend(v44, "newTextureWithDescriptor:", v38);

          objc_msgSend(v79, "addObject:", v45);
        }
        v40 = objc_msgSend(&unk_1E5058D70, "countByEnumeratingWithState:objects:count:", &v82, v89, 16);
      }
      while (v40);
    }
    if (v64)
    {
      v88[0] = v77;
      v88[1] = v77;
      v88[2] = v77;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 3);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v46 = 0;
    }
    v50 = v72;
    v48 = (void *)v69;
    v37 = v65;
    v28 = v63;
    v49 = v79;
  }
  else
  {
    if ((-[__CFString isEqualToString:](v76, "isEqualToString:", CFSTR("Red")) & 1) != 0)
    {
      v47 = 16908802;
      v48 = (void *)v69;
      v49 = v79;
    }
    else
    {
      v48 = (void *)v69;
      v49 = v79;
      if ((-[__CFString isEqualToString:](v76, "isEqualToString:", CFSTR("Green")) & 1) != 0)
      {
        v47 = 16974595;
      }
      else if (-[__CFString isEqualToString:](v76, "isEqualToString:", CFSTR("Blue")))
      {
        v47 = 17040388;
      }
      else
      {
        v47 = 0x1000000;
      }
    }
    v51 = (void *)objc_msgSend(v13, "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:", objc_msgSend(v13, "pixelFormat"), objc_msgSend(v13, "textureType"), 0, 1, 0, 1, v47);
    objc_msgSend(v81, "addObject:", v51);
    v46 = 0;
    if (v33)
    {
      v87 = v77;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v80, "device");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v52, "newTextureWithDescriptor:", v38);

    objc_msgSend(v49, "addObject:", v53);
    v50 = v72;
  }
  objc_msgSend(v48, "metalTexture");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "encodeToCommandBuffer:sourceTextureArray:guidanceTexture:constraintsTextureArray:numberOfIterations:destinationTextureArray:", v50, v81, v54, v46, objc_msgSend(v78, "unsignedIntegerValue"), v49);

  if (v28)
  {
    v55 = v80;
    +[PICombineRGBKernel combineRGBTextures:intoDestinationTexture:withCommandBuffer:](PICombineRGBKernel, "combineRGBTextures:intoDestinationTexture:withCommandBuffer:", v49, v80, v50);
  }
  else
  {
    objc_msgSend(v49, "objectAtIndexedSubscript:", 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v86[0] = v56;
    objc_msgSend(v49, "objectAtIndexedSubscript:", 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v86[1] = v57;
    objc_msgSend(v49, "objectAtIndexedSubscript:", 0);
    v58 = v48;
    v59 = v46;
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v86[2] = v60;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 3);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v80;
    +[PICombineRGBKernel combineRGBTextures:intoDestinationTexture:withCommandBuffer:](PICombineRGBKernel, "combineRGBTextures:intoDestinationTexture:withCommandBuffer:", v61, v80, v50);

    v49 = v79;
    v46 = v59;
    v48 = v58;

    v37 = v65;
  }

  return 1;
}

+ (int)outputFormat
{
  return *MEMORY[0x1E0C9E080];
}

+ (BOOL)outputIsOpaque
{
  return 1;
}

+ (BOOL)synchronizeInputs
{
  return 0;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return *MEMORY[0x1E0C9E080];
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

@end
