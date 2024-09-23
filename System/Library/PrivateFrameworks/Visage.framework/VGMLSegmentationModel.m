@implementation VGMLSegmentationModel

- (VGMLSegmentationModel)init
{
  VGMLSegmentationModel *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  NSOrderedSet *outputSegmentationMaps;
  VGMLSegmentationModel *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v27.receiver = self;
  v27.super_class = (Class)VGMLSegmentationModel;
  v2 = -[VGMLSegmentationModel init](&v27, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    humanAttributesMap();
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v24;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v24 != v6)
            objc_enumerationMutation(v4);
          v8 = *(id *)(*((_QWORD *)&v23 + 1) + 8 * v7);
          objc_msgSend(v4, "objectForKeyedSubscript:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v9);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v5);
    }

    objc_msgSend(v3, "addObject:", CFSTR("person"));
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    personInstancesMapNames();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v20;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v10);
          v14 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * v13);
          objc_msgSend(v3, "addObject:", v14, (_QWORD)v19);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
      }
      while (v11);
    }

    objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v3);
    v15 = objc_claimAutoreleasedReturnValue();
    outputSegmentationMaps = v2->_outputSegmentationMaps;
    v2->_outputSegmentationMaps = (NSOrderedSet *)v15;

    v17 = v2;
  }

  return v2;
}

- (id)_performSegmentationRequest:(id)a3 onPixelBuffer:(__CVBuffer *)a4 segmentationRequestRevision:(unint64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  NSObject *v15;
  const char *v16;
  double v17;
  id v18;
  NSObject *v19;
  uint32_t v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = objc_alloc(MEMORY[0x24BDF9C28]);
  v11 = (void *)objc_msgSend(v10, "initWithCVPixelBuffer:options:", a4, MEMORY[0x24BDBD1B8]);
  if (!v11)
  {
    __VGLogSharedInstance();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    *(_WORD *)buf = 0;
    v16 = " Vision request handler failed to instantiate ";
LABEL_23:
    v19 = v15;
    v20 = 2;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v9;
    objc_msgSend(v12, "setQualityLevel:", 0);
    objc_msgSend(v12, "setOutputPixelFormat:", 1278226534);
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __VGLogSharedInstance();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    *(_WORD *)buf = 0;
    v16 = " Unsupported type received for VNGenerateSegmentationRequest. ";
    goto LABEL_23;
  }
  v15 = v9;
  -[NSObject setQualityLevel:](v15, "setQualityLevel:", 0);
  if ((-[NSObject setRevision:error:](v15, "setRevision:error:", a5, a6) & 1) == 0)
  {
    __VGLogSharedInstance();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = *a6;
      *(_DWORD *)buf = 138412290;
      v27 = v23;
      _os_log_impl(&dword_249CAD000, v22, OS_LOG_TYPE_ERROR, " Error setting revision for person instance model %@ ", buf, 0xCu);
    }

    goto LABEL_25;
  }
  LODWORD(v17) = 0;
  -[NSObject setMinimumConfidence:](v15, "setMinimumConfidence:", v17);
  -[NSObject setOutputPixelFormat:](v15, "setOutputPixelFormat:", 1278226534);
LABEL_4:

  v25 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "performRequests:error:", v13, a6);

  if ((v14 & 1) == 0)
  {
    __VGLogSharedInstance();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = *a6;
      *(_DWORD *)buf = 138412290;
      v27 = v18;
      v16 = " Failed to process segmentation request %@ ";
      v19 = v15;
      v20 = 12;
LABEL_24:
      _os_log_impl(&dword_249CAD000, v19, OS_LOG_TYPE_ERROR, v16, buf, v20);
      goto LABEL_25;
    }
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __VGLogSharedInstance();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v16 = " SegmentationRequest not of supported type. ";
        goto LABEL_23;
      }
LABEL_25:

      v21 = 0;
      goto LABEL_26;
    }
  }
  objc_msgSend(v9, "results");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

  return v21;
}

- (id)_resizePixelBuffer:(__CVBuffer *)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  IOSurface *v7;
  void *v8;

  CVPixelBufferGetIOSurface(a3);
  v7 = (IOSurface *)objc_claimAutoreleasedReturnValue();
  resizeSurface(v7, a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)segmentationSurfaces:(__CVBuffer *)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  __CVBuffer *v38;
  void *v39;
  NSObject *obj;
  id obja;
  size_t Height;
  size_t Width;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  _BYTE v56[128];
  uint8_t v57[128];
  uint8_t buf[4];
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v44 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", -[NSOrderedSet count](self->_outputSegmentationMaps, "count"));
  v55 = 0;
  v34 = (void *)objc_opt_new();
  v38 = a3;
  -[VGMLSegmentationModel _performSegmentationRequest:onPixelBuffer:segmentationRequestRevision:error:](self, "_performSegmentationRequest:onPixelBuffer:segmentationRequestRevision:error:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  if (v35)
  {
    __VGLogSharedInstance();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v59 = v35;
      _os_log_impl(&dword_249CAD000, v5, OS_LOG_TYPE_ERROR, " Could not perform human attributes segmentation request. %@ ", buf, 0xCu);
    }
  }
  else
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v5 = v36;
    obj = v5;
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v52 != v7)
            objc_enumerationMutation(obj);
          v9 = *(id *)(*((_QWORD *)&v51 + 1) + 8 * i);
          humanAttributesMap();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "featureName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12 == 0;

          if (v13)
          {
            __VGLogSharedInstance();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v9, "featureName");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v59 = v17;
              _os_log_impl(&dword_249CAD000, v14, OS_LOG_TYPE_ERROR, " Received an unexpected output map from VNGenerateHumanAttributesSegmentationRequest: %@ ", buf, 0xCu);

            }
          }
          else
          {
            -[VGMLSegmentationModel _resizePixelBuffer:width:height:](self, "_resizePixelBuffer:width:height:", objc_msgSend(v9, "pixelBuffer"), Width, Height);
            v14 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "featureName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setObject:forKey:", v14, v16);

          }
        }
        v5 = obj;
        v6 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      }
      while (v6);
    }
  }

  v50 = v35;
  v37 = (void *)objc_opt_new();
  -[VGMLSegmentationModel _performSegmentationRequest:onPixelBuffer:segmentationRequestRevision:error:](self, "_performSegmentationRequest:onPixelBuffer:segmentationRequestRevision:error:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  obja = v35;

  if (obja)
  {
    __VGLogSharedInstance();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v59 = obja;
      _os_log_impl(&dword_249CAD000, v18, OS_LOG_TYPE_ERROR, " Could not perform person segmentation request. %@ ", buf, 0xCu);
    }
  }
  else
  {
    personInstancesMapNames();
    v18 = objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v19 = v39;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    if (v20)
    {
      v21 = 0;
      v22 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v47 != v22)
            objc_enumerationMutation(v19);
          v24 = *(id *)(*((_QWORD *)&v46 + 1) + 8 * j);
          -[VGMLSegmentationModel _resizePixelBuffer:width:height:](self, "_resizePixelBuffer:width:height:", objc_msgSend(v24, "pixelBuffer"), Width, Height);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectAtIndexedSubscript:](v18, "objectAtIndexedSubscript:", v21 + j);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setObject:forKey:", v25, v26);

        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
        v21 += j;
      }
      while (v20);
    }

  }
  v27 = (void *)objc_opt_new();
  v45 = obja;
  -[VGMLSegmentationModel _performSegmentationRequest:onPixelBuffer:segmentationRequestRevision:error:](self, "_performSegmentationRequest:onPixelBuffer:segmentationRequestRevision:error:", v27, v38, 1, &v45);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v45;

  if (v29)
  {
    __VGLogSharedInstance();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v59 = v29;
      _os_log_impl(&dword_249CAD000, v30, OS_LOG_TYPE_ERROR, " Could not perform person segmentation request. %@ ", buf, 0xCu);
    }

  }
  else if (objc_msgSend(v28, "count"))
  {
    objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGMLSegmentationModel _resizePixelBuffer:width:height:](self, "_resizePixelBuffer:width:height:", objc_msgSend(v32, "pixelBuffer"), Width, Height);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v44, "setObject:forKey:", v31, CFSTR("person"));
    goto LABEL_33;
  }
  v31 = 0;
LABEL_33:

  return v44;
}

- (id)segmentationMaps:(__CVBuffer *)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  IOSurface *v9;
  CVPixelBufferRef CVPixelBufferFromIOSurface;
  void (**v11)(_QWORD);
  VGMLImageIOData *v12;
  void *v14;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[VGMLSegmentationModel segmentationSurfaces:](self, "segmentationSurfaces:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v14, "count"));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v14;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v8, v14);
        v9 = (IOSurface *)objc_claimAutoreleasedReturnValue();
        CVPixelBufferFromIOSurface = createCVPixelBufferFromIOSurface(v9);

        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __42__VGMLSegmentationModel_segmentationMaps___block_invoke;
        v15[3] = &__block_descriptor_40_e5_v8__0l;
        v15[4] = CVPixelBufferFromIOSurface;
        v11 = (void (**)(_QWORD))MEMORY[0x24BD03294](v15);
        v12 = -[VGMLImageIOData initWithCVPixelBufferRef:]([VGMLImageIOData alloc], "initWithCVPixelBufferRef:", CVPixelBufferFromIOSurface);
        objc_msgSend(v3, "setObject:forKey:", v12, v8);

        v11[2](v11);
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  return v3;
}

void __42__VGMLSegmentationModel_segmentationMaps___block_invoke(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputSegmentationMaps, 0);
}

@end
