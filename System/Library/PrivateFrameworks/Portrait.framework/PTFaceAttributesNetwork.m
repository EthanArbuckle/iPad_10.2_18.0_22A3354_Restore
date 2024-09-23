@implementation PTFaceAttributesNetwork

- (id)createRequest
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v24;

  v3 = (void *)objc_opt_new();
  +[PTInference ANEConfigForAsynchronousWork](PTInference, "ANEConfigForAsynchronousWork");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setModelExecutionPriority:", objc_msgSend(v4, "VNRequestModelExecutionPriority"));

  v24 = 0;
  v5 = objc_msgSend(v3, "setRevision:error:", 3737841669, &v24);
  v6 = v24;
  if ((v5 & 1) == 0)
  {
    _PTLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PTFaceAttributesNetwork createRequest].cold.2((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  }
  objc_msgSend(MEMORY[0x1E0CEDFC0], "defaultANEDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v3, "setComputeDevice:forComputeStage:", self->_aneDevice, *MEMORY[0x1E0CEE290]);
    objc_msgSend(v3, "setComputeDevice:forComputeStage:", self->_aneDevice, *MEMORY[0x1E0CEE298]);
  }
  else
  {
    _PTLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[PTFaceAttributesNetwork createRequest].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

  }
  return v3;
}

uint64_t __31__PTFaceAttributesNetwork_init__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (PTFaceAttributesNetwork)init
{
  PTFaceAttributesNetwork *v2;
  uint64_t v3;
  VNSession *session;
  uint64_t v5;
  void *v6;
  VNSession *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  VNSequenceRequestHandler *handler;
  NSObject *v20;
  uint64_t v21;
  NSObject *aneDevice;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  PTFaceAttributesNetwork *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v47;
  objc_super v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v48.receiver = self;
  v48.super_class = (Class)PTFaceAttributesNetwork;
  v2 = -[PTFaceAttributesNetwork init](&v48, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    session = v2->_session;
    v2->_session = (VNSession *)v3;

    -[PTFaceAttributesNetwork createRequest](v2, "createRequest");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
    {
      v7 = v2->_session;
      v49[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0;
      v9 = -[VNSession prepareForPerformingRequests:error:](v7, "prepareForPerformingRequests:error:", v8, &v47);
      v10 = v47;

      if ((v9 & 1) == 0)
      {
        _PTLogSystem();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[PTFaceAttributesNetwork init].cold.4((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);

      }
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEE038]), "initWithSession:", v2->_session);
      handler = v2->_handler;
      v2->_handler = (VNSequenceRequestHandler *)v18;

      if (v2->_handler)
      {
        MLAllComputeDevices();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = -[NSObject indexOfObjectPassingTest:](v20, "indexOfObjectPassingTest:", &__block_literal_global_7);
        if (v21 == 0x7FFFFFFFFFFFFFFFLL)
        {
          _PTLogSystem();
          aneDevice = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(aneDevice, OS_LOG_TYPE_ERROR))
            -[PTCVMNetwork initWithMetalContext:colorSize:effectUtil:util:useHighResNetwork:sharedResources:].cold.9(aneDevice, v23, v24, v25, v26, v27, v28, v29);
        }
        else
        {
          -[NSObject objectAtIndexedSubscript:](v20, "objectAtIndexedSubscript:", v21);
          v45 = objc_claimAutoreleasedReturnValue();
          aneDevice = v2->_aneDevice;
          v2->_aneDevice = (MLComputeDeviceProtocol *)v45;
        }

        v30 = v2;
        goto LABEL_20;
      }
      _PTLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[PTFaceAttributesNetwork init].cold.2(v20, v38, v39, v40, v41, v42, v43, v44);
    }
    else
    {
      _PTLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[PTFaceAttributesNetwork init].cold.1(v20, v31, v32, v33, v34, v35, v36, v37);
      v10 = 0;
    }
    v30 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v30 = 0;
LABEL_21:

  return v30;
}

- (id)faceLandmarksInPixelBuffer:(__CVBuffer *)a3 faceRects:(id)a4 orientation:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  VNSequenceRequestHandler *handler;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v23;
  _QWORD v24[2];

  v5 = *(_QWORD *)&a5;
  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[PTFaceAttributesNetwork createRequest](self, "createRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInputFaceObservations:", v8);

  if (!v9)
  {
    _PTLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[PTFaceAttributesNetwork faceLandmarksInPixelBuffer:faceRects:orientation:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

    v12 = 0;
    goto LABEL_7;
  }
  handler = self->_handler;
  v24[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  LODWORD(handler) = -[VNSequenceRequestHandler performRequests:onCVPixelBuffer:orientation:error:](handler, "performRequests:onCVPixelBuffer:orientation:error:", v11, a3, v5, &v23);
  v12 = v23;

  if (!(_DWORD)handler)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v9, "results");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aneDevice, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_handler, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a2, a3, "prepareForPerformingRequests failed %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)createRequest
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a2, a3, "Private variant unsupported. Using default behavior. Error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)faceLandmarksInPixelBuffer:(uint64_t)a3 faceRects:(uint64_t)a4 orientation:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, a1, a3, "request nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_12();
}

@end
