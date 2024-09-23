@implementation PFLImageDataScaler

- (PFLImageDataScaler)initWithSize:(CGSize)a3 crop:(CGRect)a4 data:(id)a5 orientation:(unsigned int)a6 type:(id)a7 outputSize:(CGSize)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat v13;
  CGFloat v14;
  CGFloat y;
  CGFloat x;
  CGFloat v17;
  CGFloat v18;
  id v20;
  id v21;
  PFLImageDataScaler *v22;
  PFLImageDataScaler *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  int v30;
  NSObject *v31;
  objc_super v33;

  height = a8.height;
  width = a8.width;
  v13 = a4.size.height;
  v14 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v17 = a3.height;
  v18 = a3.width;
  v20 = a5;
  v21 = a7;
  v33.receiver = self;
  v33.super_class = (Class)PFLImageDataScaler;
  v22 = -[PFLImageDataScaler init](&v33, sel_init);
  v23 = v22;
  if (v22)
  {
    v22->_inputSize.width = v18;
    v22->_inputSize.height = v17;
    v22->_inputCrop.origin.x = x;
    v22->_inputCrop.origin.y = y;
    v22->_inputCrop.size.width = v14;
    v22->_inputCrop.size.height = v13;
    objc_storeStrong((id *)&v22->_data, a5);
    v23->_orientation = a6;
    objc_storeStrong((id *)&v23->_type, a7);
    v23->_outputSize.width = width;
    v23->_outputSize.height = height;
    objc_msgSend((id)*MEMORY[0x24BDF8438], "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BDF83E8], "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UTType identifier](v23->_type, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqualToString:", v24);

    if (v27)
    {
      v28 = 0x3FEB333333333333;
    }
    else
    {
      -[UTType identifier](v23->_type, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isEqualToString:", v25);

      if (!v30)
      {
        pfl_layout_log();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          -[PFLImageDataScaler initWithSize:crop:data:orientation:type:outputSize:].cold.1((id *)&v23->_type, v31);

        v23 = 0;
        goto LABEL_10;
      }
      v28 = 0x3FECCCCCCCCCCCCDLL;
    }
    *(_QWORD *)&v23->_compressionQuality = v28;
LABEL_10:

  }
  return v23;
}

- (void)cropAndScaleWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(25, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke;
  v7[3] = &unk_251457B48;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  uint64_t v5;
  double *v6;
  double v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  const __CFData *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  CGImageSource *v22;
  CGImageSource *v23;
  CGImageRef ImageAtIndex;
  CGImage *v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  size_t Width;
  size_t Height;
  CGImageRef v35;
  CGImage *v36;
  __CFData *v37;
  __CFString *v38;
  CGImageDestination *v39;
  double v40;
  void *v41;
  double v42;
  uint64_t v43;
  void *v44;
  const __CFDictionary *v45;
  const __CFData *v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  id v54;
  CGImageSourceRef v55;
  CGImageSource *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  double v64;
  double v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  void *v69;
  const __CFDictionary *v70;
  CGImageRef ThumbnailAtIndex;
  CGImage *v72;
  CGImageRef v73;
  CGImage *v74;
  __CFString *v75;
  CGImageDestination *v76;
  double v77;
  void *v78;
  void *v79;
  const __CFDictionary *v80;
  NSObject *v81;
  NSObject *v82;
  NSObject *v83;
  NSObject *v84;
  NSObject *v85;
  uint64_t v86;
  void *v87;
  id v88;
  uint64_t v89;
  double v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  double v95;
  _QWORD block[5];
  id v97;
  void *v98;
  void *v99;
  CGFloat v100;
  uint64_t v101;
  CGAffineTransform v102;
  CGAffineTransform v103;
  _QWORD v104[3];
  CGAffineTransform buf;
  uint64_t v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;

  v106 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 16))
  {
    reduceRectToAspectRatioAndCenter(*(double *)(v2 + 80), *(double *)(v2 + 88), *(double *)(v2 + 96), *(double *)(v2 + 104), *(double *)(v2 + 64) / *(double *)(v2 + 72));
    v5 = (uint64_t)(v4 * v3);
    v6 = *(double **)(a1 + 32);
    v7 = v6[8] / v4;
    if (v7 < v6[9] / v3)
      v7 = v6[9] / v3;
    v8 = (uint64_t)(v7 * (v6[7] * (v6[6] * v7)));
    pfl_layout_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.a) = 134218240;
      *(double *)((char *)&buf.a + 4) = (double)v5 * 0.000000953674316;
      WORD2(buf.b) = 2048;
      *(double *)((char *)&buf.b + 6) = (double)v8 * 0.000000953674316;
      _os_log_impl(&dword_243C29000, v9, OS_LOG_TYPE_DEFAULT, "cropThenScale ==> %.3f MP; scaleThenCrop ==> %.3f MP",
        (uint8_t *)&buf,
        0x16u);
    }

    v10 = (void *)MEMORY[0x249503304]();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(double *)(v11 + 96);
    if (v5 >= v8)
    {
      v46 = *(const __CFData **)(v11 + 32);
      v47 = *(_QWORD *)(v11 + 8);
      v48 = *(double *)(v11 + 48);
      v49 = *(double *)(v11 + 56);
      v50 = *(double *)(v11 + 80);
      v51 = *(double *)(v11 + 88);
      v52 = *(double *)(v11 + 104);
      v53 = *(double *)(v11 + 72);
      v95 = *(double *)(v11 + 64);
      v54 = *(id *)(v11 + 40);
      v55 = CGImageSourceCreateWithData(v46, 0);
      if (v55)
      {
        v56 = v55;
        v89 = v47;
        v59 = reduceRectToAspectRatioAndCenter(v50, v51, v12, v52, v95 / v53);
        v61 = v60;
        v62 = v57;
        v63 = v58;
        if (v95 / v57 >= v53 / v58)
          v64 = v95 / v57;
        else
          v64 = v53 / v58;
        v65 = v48 * v64;
        if (v48 * v64 < v49 * v64)
          v65 = v49 * v64;
        v66 = *MEMORY[0x24BDD9778];
        v67 = MEMORY[0x24BDBD1C8];
        *(_QWORD *)&v103.a = MEMORY[0x24BDBD1C8];
        v68 = *MEMORY[0x24BDD9808];
        v102.a = v66;
        v102.b = v68;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", ceil(v65), v89);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v102.c = *(CGFloat *)MEMORY[0x24BDD9788];
        *(_QWORD *)&v103.b = v69;
        v103.c = v67;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v103, &v102, 3);
        v70 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

        ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v56, 0, v70);
        if (ThumbnailAtIndex)
        {
          v72 = ThumbnailAtIndex;
          v93 = v54;
          CGAffineTransformMakeScale(&buf, v64, v64);
          v109.origin.x = v59;
          v109.origin.y = v61;
          v109.size.width = v62;
          v109.size.height = v63;
          v110 = CGRectApplyAffineTransform(v109, &buf);
          v110.origin.x = rint(v110.origin.x);
          v110.origin.y = rint(v110.origin.y);
          v110.size.width = rint(v95);
          v110.size.height = rint(v53);
          v73 = CGImageCreateWithImageInRect(v72, v110);
          if (v73)
          {
            v74 = v73;
            v92 = v10;
            objc_msgSend(MEMORY[0x24BDBCEC8], "data");
            v37 = (__CFData *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "identifier");
            v75 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v76 = CGImageDestinationCreateWithData(v37, v75, 1uLL, 0);

            if (v76)
            {
              if (v95 >= v53)
                v77 = v95;
              else
                v77 = v53;
              v104[0] = *MEMORY[0x24BDD9220];
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v90);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v98 = v78;
              v104[1] = *MEMORY[0x24BDD9218];
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v77);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              v104[2] = *MEMORY[0x24BDD9248];
              v99 = v79;
              v100 = v67;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v98, v104, 3);
              v80 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

              CGImageDestinationAddImage(v76, v74, v80);
              CGImageDestinationFinalize(v76);
              CFRelease(v76);
            }
            else
            {

              pfl_layout_log();
              v80 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled((os_log_t)v80, OS_LOG_TYPE_ERROR))
                __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_4();
              v37 = 0;
            }
            v10 = v92;

            CFRelease(v74);
          }
          else
          {
            pfl_layout_log();
            v85 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
              __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_3();

            v37 = 0;
          }
          v54 = v93;
          CFRelease(v72);
        }
        else
        {
          pfl_layout_log();
          v83 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
            __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_6();

          v37 = 0;
        }
        CFRelease(v56);
      }
      else
      {
        pfl_layout_log();
        v70 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v70, OS_LOG_TYPE_ERROR))
          __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_1();
        v37 = 0;
      }

    }
    else
    {
      v13 = *(unsigned int *)(v11 + 24);
      v14 = *(const __CFData **)(v11 + 32);
      v15 = *(double *)(v11 + 8);
      v16 = *(double *)(v11 + 80);
      v17 = *(double *)(v11 + 88);
      v18 = *(double *)(v11 + 104);
      v19 = *(double *)(v11 + 64);
      v20 = *(double *)(v11 + 72);
      v21 = *(id *)(v11 + 40);
      v22 = CGImageSourceCreateWithData(v14, 0);
      if (v22)
      {
        v23 = v22;
        ImageAtIndex = CGImageSourceCreateImageAtIndex(v22, 0, 0);
        if (ImageAtIndex)
        {
          v25 = ImageAtIndex;
          v26 = reduceRectToAspectRatioAndCenter(v16, v17, v12, v18, v19 / v20);
          v28 = v27;
          v30 = v29;
          v32 = v31;
          Width = CGImageGetWidth(v25);
          Height = CGImageGetHeight(v25);
          memset(&buf, 0, sizeof(buf));
          makePresentationTransform(v13, Width, Height, (uint64_t)&v103);
          CGAffineTransformInvert(&buf, &v103);
          v102 = buf;
          v107.origin.x = v26;
          v107.origin.y = v28;
          v107.size.width = v30;
          v107.size.height = v32;
          v108 = CGRectApplyAffineTransform(v107, &v102);
          v35 = CGImageCreateWithImageInRect(v25, v108);
          if (v35)
          {
            v36 = v35;
            v91 = v10;
            objc_msgSend(MEMORY[0x24BDBCEC8], "data");
            v37 = (__CFData *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "identifier");
            v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v39 = CGImageDestinationCreateWithData(v37, v38, 1uLL, 0);

            if (v39)
            {
              if (v19 >= v20)
                v40 = v19;
              else
                v40 = v20;
              v98 = (void *)*MEMORY[0x24BDD9220];
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15);
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)&v102.a = v94;
              v99 = (void *)*MEMORY[0x24BDD9218];
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = *MEMORY[0x24BDD9248];
              *(_QWORD *)&v102.b = v41;
              *(_QWORD *)&v102.c = MEMORY[0x24BDBD1C8];
              v43 = *MEMORY[0x24BDD9698];
              v100 = v42;
              v101 = v43;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", getImageOrientationFromSource(v23));
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)&v102.d = v44;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v102, &v98, 4);
              v45 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

              CGImageDestinationAddImage(v39, v36, v45);
              CGImageDestinationFinalize(v39);
              CFRelease(v39);
            }
            else
            {

              pfl_layout_log();
              v45 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled((os_log_t)v45, OS_LOG_TYPE_ERROR))
                __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_4();
              v37 = 0;
            }

            CFRelease(v36);
            v10 = v91;
          }
          else
          {
            pfl_layout_log();
            v84 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
              __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_3();

            v37 = 0;
          }
          CFRelease(v25);
        }
        else
        {
          pfl_layout_log();
          v82 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
            __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_2();

          v37 = 0;
        }
        CFRelease(v23);
      }
      else
      {
        pfl_layout_log();
        v81 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_1();

        v37 = 0;
      }

    }
    v86 = *(_QWORD *)(a1 + 32);
    v87 = *(void **)(v86 + 16);
    *(_QWORD *)(v86 + 16) = v37;

    objc_autoreleasePoolPop(v10);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_1;
  block[3] = &unk_251457B20;
  v88 = *(id *)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v97 = v88;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (CGSize)inputSize
{
  double width;
  double height;
  CGSize result;

  width = self->_inputSize.width;
  height = self->_inputSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGRect)inputCrop
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_inputCrop.origin.x;
  y = self->_inputCrop.origin.y;
  width = self->_inputCrop.size.width;
  height = self->_inputCrop.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSData)data
{
  return self->_data;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (UTType)type
{
  return self->_type;
}

- (CGSize)outputSize
{
  double width;
  double height;
  CGSize result;

  width = self->_outputSize.width;
  height = self->_outputSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_outputData, 0);
}

- (void)initWithSize:(id *)a1 crop:(NSObject *)a2 data:orientation:type:outputSize:.cold.1(id *a1, NSObject *a2)
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 136315394;
  v5 = "-[PFLImageDataScaler initWithSize:crop:data:orientation:type:outputSize:]";
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_243C29000, a2, OS_LOG_TYPE_ERROR, "%s only supports JPEG and HEIC; not %@",
    (uint8_t *)&v4,
    0x16u);

}

void __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_243C29000, v0, v1, "Could not create imageSourceRef", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_243C29000, v0, v1, "Could not create originalImageRef", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_243C29000, v0, v1, "Could not create croppedImageRef", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_243C29000, v0, v1, "Could not create imageDestinationRef", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __49__PFLImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_243C29000, v0, v1, "Could not create thumbnailImageRef", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
