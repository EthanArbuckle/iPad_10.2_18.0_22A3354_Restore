@implementation WFJoeColorUtility

+ (id)colorForImage:(id)a3
{
  id v3;
  id v4;
  CGColorSpace *DeviceRGB;
  CGImage *CopyWithColorSpace;
  CGDataProvider *DataProvider;
  const __CFData *v8;
  const UInt8 *BytePtr;
  size_t BitsPerPixel;
  size_t BitsPerComponent;
  size_t BytesPerRow;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  size_t v16;
  const UInt8 *v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  void *v57;
  void *v58;
  unsigned int v59;
  void *v60;
  unsigned int v61;
  id v62;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  id obj;
  size_t v69;
  size_t Width;
  uint64_t v71;
  size_t Height;
  id v73;
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
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  CGFloat components[5];

  components[3] = *(CGFloat *)MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD14E0]);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v65 = v3;
    CopyWithColorSpace = CGImageCreateCopyWithColorSpace((CGImageRef)objc_msgSend(v3, "CGImage"), DeviceRGB);
    DataProvider = CGImageGetDataProvider(CopyWithColorSpace);
    v8 = CGDataProviderCopyData(DataProvider);
    BytePtr = CFDataGetBytePtr(v8);
    BitsPerPixel = CGImageGetBitsPerPixel(CopyWithColorSpace);
    BitsPerComponent = CGImageGetBitsPerComponent(CopyWithColorSpace);
    BytesPerRow = CGImageGetBytesPerRow(CopyWithColorSpace);
    Width = CGImageGetWidth(CopyWithColorSpace);
    Height = CGImageGetHeight(CopyWithColorSpace);
    if (Width)
    {
      v14 = 0;
      v69 = BitsPerPixel / BitsPerComponent;
      do
      {
        if (Height)
        {
          v15 = 0;
          v16 = Height;
          do
          {
            v17 = &BytePtr[v14 * v69 + v15 * BytesPerRow];
            LOBYTE(v13) = *v17;
            v18 = (double)v13 / 255.0;
            components[0] = v18;
            LOBYTE(v18) = v17[1];
            v19 = (double)*(unint64_t *)&v18 / 255.0;
            components[1] = v19;
            LOBYTE(v19) = v17[2];
            components[2] = (double)*(unint64_t *)&v19 / 255.0;
            v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC1398]), "initWithCGColor:", CGColorCreate(DeviceRGB, components));
            if ((objc_msgSend(v20, "wf_isVeryDark") & 1) == 0 && (objc_msgSend(v20, "wf_isVeryLight") & 1) == 0)
              objc_msgSend(v4, "addObject:", v20);

            ++v15;
            --v16;
          }
          while (v16);
        }
        if ((unint64_t)objc_msgSend(v4, "count") > 0x20)
          break;
        ++v14;
      }
      while (v14 != Width);
    }
    v73 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v21 = v4;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v86, v93, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v87;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v87 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * i);
          v27 = objc_msgSend(v21, "countForObject:", v26);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "setObject:forKeyedSubscript:", v28, v26);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v86, v93, 16);
      }
      while (v23);
    }

    objc_msgSend(v73, "keysSortedByValueUsingSelector:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "reverseObjectEnumerator");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "allObjects");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    obj = v31;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
    v64 = v21;
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v83;
      v66 = *(_QWORD *)v83;
      do
      {
        v36 = 0;
        v67 = v34;
        do
        {
          if (*(_QWORD *)v83 != v35)
            objc_enumerationMutation(obj);
          v37 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * v36);
          if (objc_msgSend(v32, "count", v64))
          {
            v80 = 0u;
            v81 = 0u;
            v78 = 0u;
            v79 = 0u;
            objc_msgSend(v32, "keysSortedByValueUsingSelector:", sel_compare_);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "reverseObjectEnumerator");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "allObjects");
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
            if (v41)
            {
              v42 = v41;
              v71 = v36;
              v43 = *(_QWORD *)v79;
              do
              {
                for (j = 0; j != v42; ++j)
                {
                  if (*(_QWORD *)v79 != v43)
                    objc_enumerationMutation(v40);
                  if (objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * j), "isCloseToColor:", v37))
                  {
                    v45 = (void *)MEMORY[0x24BDD16E0];
                    objc_msgSend(v32, "objectForKeyedSubscript:", v37);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    v47 = objc_msgSend(v46, "unsignedIntValue");
                    objc_msgSend(v73, "objectForKeyedSubscript:", v37);
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "numberWithUnsignedInt:", objc_msgSend(v48, "unsignedIntValue") + v47);
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "setObject:forKeyedSubscript:", v49, v37);

                  }
                  else
                  {
                    objc_msgSend(v73, "objectForKeyedSubscript:", v37);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "setObject:forKeyedSubscript:", v46, v37);
                  }

                }
                v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
              }
              while (v42);
              v35 = v66;
              v34 = v67;
              v36 = v71;
            }
          }
          else
          {
            objc_msgSend(v73, "objectForKeyedSubscript:", v37);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setObject:forKeyedSubscript:", v40, v37);
          }

          ++v36;
        }
        while (v36 != v34);
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
      }
      while (v34);
    }

    objc_msgSend(v32, "allKeys");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "firstObject");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    objc_msgSend(v32, "allKeys");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v75;
      do
      {
        for (k = 0; k != v54; ++k)
        {
          if (*(_QWORD *)v75 != v55)
            objc_enumerationMutation(v52);
          v57 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * k);
          objc_msgSend(v32, "objectForKeyedSubscript:", v51, v64);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v58, "unsignedIntValue");

          objc_msgSend(v32, "objectForKeyedSubscript:", v57);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend(v60, "unsignedIntValue");

          if (v59 <= v61)
          {
            v62 = v57;

            v51 = v62;
          }
        }
        v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
      }
      while (v54);
    }

    v3 = v65;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEC1398], "colorWithSystemColor:", 14);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v51;
}

@end
