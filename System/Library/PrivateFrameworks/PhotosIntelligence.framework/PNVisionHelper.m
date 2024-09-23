@implementation PNVisionHelper

+ (id)faceprintFromFaceprintArchive:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;

  v5 = (objc_class *)MEMORY[0x24BDF9BC0];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithState:error:", v6, a4);

  return v7;
}

- (float)distanceBetweenFaceObservation:(id)a3 andFaceObservation:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  float v16;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "faceprint");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9
    && (v10 = (void *)v9,
        objc_msgSend(v8, "faceprint"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    objc_msgSend(v7, "faceprint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "faceprint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "computeDistance:withDistanceFunction:error:", v13, 0, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "floatValue");
      v16 = v15;
    }
    else
    {
      v16 = 1.0;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        v18 = 138412546;
        v19 = v7;
        v20 = 2112;
        v21 = v8;
        _os_log_debug_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Failed to get a distance between person \"%@\" and \"%@\", (uint8_t *)&v18, 0x16u);
      }
    }

  }
  else
  {
    v16 = 1.0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v18 = 138412546;
      v19 = v7;
      v20 = 2112;
      v21 = v8;
      _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed computing distance between person \"%@\" and \"%@\", (uint8_t *)&v18, 0x16u);
    }
  }

  return v16;
}

- (id)faceObservationFromFace:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "vuObservationID") < 1)
    v4 = objc_msgSend(v3, "clusterSequenceNumber");
  else
    v4 = objc_msgSend(v3, "vuObservationID");
  v5 = v4;
  if (v4 < 1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v3;
      _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Cannot create VNFaceObservation for an unclustered face \"%@\", buf, 0xCu);
    }
    v9 = 0;
  }
  else
  {
    objc_msgSend(v3, "faceprintData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v12 = 0;
      objc_msgSend((id)objc_opt_class(), "faceprintFromFaceprintArchive:error:", v6, &v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v12;
      if (v7)
      {
        v9 = objc_alloc_init(MEMORY[0x24BDF9BB8]);
        objc_msgSend(v9, "setFaceId:", v5);
        objc_msgSend(v9, "setFaceTorsoprint:", v7);
        objc_msgSend(v7, "faceprint");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setFaceprint:", v10);

      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v14 = v3;
          v15 = 2112;
          v16 = v8;
          _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to get VNFaceTorsoprint from faceprint data for face \"%@\", error: %@", buf, 0x16u);
        }
        v9 = 0;
      }

    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v3;
        _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed retrieving faceprint data from face \"%@\", buf, 0xCu);
      }
      v9 = 0;
    }

  }
  return v9;
}

- (id)representativenessFromFaceObservations:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDF9B08], "representativenessForFaces:error:", a3, a4);
}

@end
