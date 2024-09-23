@implementation PFLGeneratePhotosFaceCommon

void __PFLGeneratePhotosFaceCommon_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  NSObject *v29;
  id v30;
  id v31;
  void *v32;
  BOOL v33;
  uint64_t v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  CGImage *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  NSObject *v47;
  CGColorSpace *space;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  int v53;
  char v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  _BYTE buf[24];
  void *v78;
  uint64_t *v79;
  uint64_t *v80;
  uint64_t *v81;
  id v82;
  id v83;
  uint64_t *v84;
  uint64_t *v85;
  CGImage *v86;
  int v87;
  char v88;
  uint8_t v89[24];
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pfl_layout_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = objc_msgSend(v5, "count");
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_243C29000, v7, OS_LOG_TYPE_DEFAULT, "bestSegmentationForAsset returned %ld layouts, error == %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "logCurrentInterval");
  objc_msgSend(*(id *)(a1 + 32), "reset");
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "fileSystemRepresentation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0;
    objc_msgSend(v8, "createDirectoryIfNeededAtPath:error:", v9, &v60);
    v10 = v60;

    if (v10)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_40:

      goto LABEL_41;
    }
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("PFCLSaveFullsizeMask"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v11, "BOOLValue");

    v12 = *(void **)(a1 + 40);
    v13 = *(id *)(a1 + 56);
    v58 = v5;
    v57 = v12;
    pfl_layout_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "localIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v58, "count");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v16;
      _os_log_impl(&dword_243C29000, v14, OS_LOG_TYPE_DEFAULT, "PFLGenerateWatchLayers: generating layers for %@, %ld layouts", buf, 0x16u);

    }
    v54 = canEncodeHEIC();
    v17 = (void *)MEMORY[0x24BDE3488];
    objc_msgSend(v13, "localIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "uuidFromLocalIdentifier:", v18);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)objc_opt_new();
    objc_msgSend(v13, "localIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setLocalIdentifier:", v20);

    objc_msgSend(v13, "pfl_modificationDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setModificationDate:", v21);

    objc_msgSend(v19, "setParallaxScale:", *MEMORY[0x24BE723B0]);
    objc_msgSend(v19, "setUserEdited:", 0);
    v59 = v13;
    v22 = (void *)objc_opt_new();
    objc_msgSend(v22, "setVersion:", 0);
    objc_msgSend(v22, "setDeliveryMode:", 1);
    objc_msgSend(v22, "setNetworkAccessAllowed:", 1);
    objc_msgSend(v22, "setSynchronous:", 1);
    v71 = 0;
    v72 = &v71;
    v73 = 0x3032000000;
    v74 = __Block_byref_object_copy_;
    v75 = __Block_byref_object_dispose_;
    v76 = 0;
    v67 = 0;
    v68 = &v67;
    v69 = 0x2020000000;
    v70 = 1;
    v61 = 0;
    v62 = &v61;
    v63 = 0x3032000000;
    v64 = (uint64_t)__Block_byref_object_copy_;
    v65 = __Block_byref_object_dispose_;
    v66 = 0;
    objc_msgSend(MEMORY[0x24BDE3590], "defaultManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __imageDataForAsset_block_invoke;
    v78 = &unk_251457AF8;
    v79 = &v71;
    v80 = &v67;
    v81 = &v61;
    objc_msgSend(v23, "requestImageDataAndOrientationForAsset:options:resultHandler:", v59, v22, buf);

    v24 = (void *)v72[5];
    if (v24 && !v62[5])
    {
      v53 = *((_DWORD *)v68 + 6);
      v27 = objc_retainAutorelease(v24);
    }
    else
    {
      pfl_layout_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v59, "localIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        __PFLGeneratePhotosFaceCommon_block_invoke_cold_1(v26, (uint64_t)&v62, v89, v25);
      }

      v27 = 0;
      v53 = 1;
    }
    v28 = (id)v62[5];
    _Block_object_dispose(&v61, 8);

    _Block_object_dispose(&v67, 8);
    _Block_object_dispose(&v71, 8);

    v55 = v27;
    if (v28)
    {
      pfl_layout_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v59;
        _os_log_impl(&dword_243C29000, v29, OS_LOG_TYPE_DEFAULT, "PFLGenerateWatchLayers: no data for %@", buf, 0xCu);
      }

      v30 = objc_retainAutorelease(v28);
      v31 = 0;
      goto LABEL_34;
    }
    objc_msgSend(v58, "objectAtIndexedSubscript:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "foregroundMask") == 0;

    if (v33)
    {
      v39 = 0;
    }
    else
    {
      objc_msgSend(v58, "objectAtIndexedSubscript:", 0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v51, "foregroundMask");
      objc_msgSend(v58, "objectAtIndexedSubscript:", 0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v50, "maskIsInverted");
      objc_msgSend(MEMORY[0x24BDBF660], "imageWithCVPixelBuffer:", v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBF648], "context");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      space = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF288]);
      if (v35)
      {
        objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIColorInvert"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setValue:forKey:", v36, *MEMORY[0x24BDBF960]);
        objc_msgSend(v37, "outputImage");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "extent");
        v39 = (CGImage *)objc_msgSend(v49, "createCGImage:fromRect:format:colorSpace:", v38, *MEMORY[0x24BDBF878], space);

      }
      else
      {
        objc_msgSend(v36, "extent");
        v39 = (CGImage *)objc_msgSend(v49, "createCGImage:fromRect:format:colorSpace:", v36, *MEMORY[0x24BDBF878], space);
      }
      CGColorSpaceRelease(space);

      if (!v39)
      {
        pfl_layout_log();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_243C29000, v41, OS_LOG_TYPE_DEFAULT, "PFLGenerateWatchLayers: cannot create a CGImage mask from CVPixelBuffer", buf, 2u);
        }
        goto LABEL_32;
      }
      if (v52)
      {
        pfl_layout_log();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v57;
          _os_log_impl(&dword_243C29000, v40, OS_LOG_TYPE_DEFAULT, "PFLGenerateWatchLayers: also saving full size mask in %@", buf, 0xCu);
        }

        pngDataFromImage(v39);
        v41 = objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          objc_msgSend(v57, "URLByAppendingPathComponent:isDirectory:", CFSTR("FullSizeMask.png"), 0);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = saveDataToFile(v41, v42);

        }
LABEL_32:

      }
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v58, "count", space));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = 0;
    v72 = &v71;
    v73 = 0x2020000000;
    v74 = (uint64_t (*)(uint64_t, uint64_t))0xBFF0000000000000;
    v61 = 0;
    v62 = &v61;
    v63 = 0x2020000000;
    v64 = -1;
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __generateWatchLayers_block_invoke;
    v78 = &unk_251457AD0;
    v84 = &v71;
    v85 = &v61;
    v86 = v39;
    v79 = (uint64_t *)v59;
    v80 = (uint64_t *)v55;
    v87 = v53;
    v81 = (uint64_t *)v57;
    v82 = v56;
    v88 = v54;
    v45 = v44;
    v83 = v45;
    objc_msgSend(v58, "enumerateObjectsUsingBlock:", buf);
    CGImageRelease(v39);
    objc_msgSend(v19, "setLayouts:", v45);
    objc_msgSend(v19, "setPreferredLayout:", v62[3]);
    v31 = v19;

    _Block_object_dispose(&v61, 8);
    _Block_object_dispose(&v71, 8);

LABEL_34:
    v46 = v28;
    objc_msgSend(*(id *)(a1 + 32), "logCurrentInterval");
    if (v28)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }
    else
    {
      pfl_layout_log();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v31;
        _os_log_impl(&dword_243C29000, v47, OS_LOG_TYPE_DEFAULT, "PFLGeneratePhotosFace: Returning photo %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }

    goto LABEL_40;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_41:

}

void __PFLGeneratePhotosFaceCommon_block_invoke_cold_1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)a2 + 40);
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = v5;
  _os_log_error_impl(&dword_243C29000, log, OS_LOG_TYPE_ERROR, "Couldn't retrieve image data for asset %@, error == %@", buf, 0x16u);

}

@end
