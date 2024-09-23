@implementation TURemoteVideoClient

- (TURemoteVideoClient)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TURemoteVideoClient.m"), 44, CFSTR("%s is not available. Use a designated initializer instead."), "-[TURemoteVideoClient init]");

  return 0;
}

- (TURemoteVideoClient)initWithVideoContextSlotIdentifier:(int64_t)a3
{
  TURemoteVideoClient *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TURemoteVideoClient;
  result = -[TURemoteVideoClient init](&v5, sel_init);
  if (result)
    result->_videoContextSlotIdentifier = a3;
  return result;
}

- (void)setVideoLayer:(id)a3 forMode:(int)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[TURemoteVideoClient videoLayer](self, "videoLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v10)
  {
    -[TURemoteVideoClient videoLayer](self, "videoLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[TURemoteVideoClient videoLayer](self, "videoLayer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TURemoteVideoClient cleanUpSubLayerForLayer:](self, "cleanUpSubLayerForLayer:", v7);

    }
    -[TURemoteVideoClient setVideoLayer:](self, "setVideoLayer:", v10);
    -[TURemoteVideoClient videoLayer](self, "videoLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(getCATransactionClass(), "begin");
      -[TURemoteVideoClient videoLayer](self, "videoLayer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TURemoteVideoClient insertSubLayerInLayer:videoSlotIdentifier:](self, "insertSubLayerInLayer:videoSlotIdentifier:", v9, -[TURemoteVideoClient videoContextSlotIdentifier](self, "videoContextSlotIdentifier"));

      objc_msgSend(getCATransactionClass(), "commit");
    }
  }

}

- (void)insertSubLayerInLayer:(id)a3 videoSlotIdentifier:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void (*v22)(_OWORD *__return_ptr, double);
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  int64_t v30;
  _OWORD v31[8];
  _OWORD v32[3];
  _OWORD v33[8];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[TURemoteVideoClient nameForSubLayer](self, "nameForSubLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v6, "sublayers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v35;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v35 != v10)
        objc_enumerationMutation(v8);
      v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v11);
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", v7);

      if ((v14 & 1) != 0)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v15 = v12;

    if (v15)
      goto LABEL_14;
  }
  else
  {
LABEL_9:

  }
  v38 = 0;
  v39 = &v38;
  v40 = 0x2050000000;
  v16 = (void *)getCALayerClass_softClass;
  v41 = (void *)getCALayerClass_softClass;
  if (!getCALayerClass_softClass)
  {
    *(_QWORD *)&v42 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v42 + 1) = 3221225472;
    *(_QWORD *)&v43 = __getCALayerClass_block_invoke;
    *((_QWORD *)&v43 + 1) = &unk_1E38A1710;
    *(_QWORD *)&v44 = &v38;
    __getCALayerClass_block_invoke((uint64_t)&v42);
    v16 = (void *)v39[3];
  }
  v17 = objc_retainAutorelease(v16);
  _Block_object_dispose(&v38, 8);
  objc_msgSend(v17, "layer");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSublayer:", v15);
LABEL_14:
  objc_msgSend(v6, "bounds");
  v19 = v18;
  v21 = v20;
  objc_msgSend(v15, "setBounds:", 0.0, 0.0, v20, v18);
  objc_msgSend(v15, "setPosition:", v19 * 0.5, v21 * 0.5);
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v22 = (void (*)(_OWORD *__return_ptr, double))getCGAffineTransformMakeRotationSymbolLoc_ptr;
  v41 = getCGAffineTransformMakeRotationSymbolLoc_ptr;
  if (!getCGAffineTransformMakeRotationSymbolLoc_ptr)
  {
    *(_QWORD *)&v42 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v42 + 1) = 3221225472;
    *(_QWORD *)&v43 = __getCGAffineTransformMakeRotationSymbolLoc_block_invoke;
    *((_QWORD *)&v43 + 1) = &unk_1E38A1710;
    *(_QWORD *)&v44 = &v38;
    __getCGAffineTransformMakeRotationSymbolLoc_block_invoke((uint64_t)&v42);
    v22 = (void (*)(_OWORD *__return_ptr, double))v39[3];
  }
  _Block_object_dispose(&v38, 8);
  if (!v22)
    -[TURemoteVideoClient insertSubLayerInLayer:videoSlotIdentifier:].cold.1();
  v22(v32, 1.57079633);
  *(_QWORD *)&v42 = 0;
  *((_QWORD *)&v42 + 1) = &v42;
  *(_QWORD *)&v43 = 0x2020000000;
  v23 = getCATransform3DMakeAffineTransformSymbolLoc_ptr;
  *((_QWORD *)&v43 + 1) = getCATransform3DMakeAffineTransformSymbolLoc_ptr;
  if (!getCATransform3DMakeAffineTransformSymbolLoc_ptr)
  {
    v24 = (void *)QuartzCoreLibrary();
    v23 = dlsym(v24, "CATransform3DMakeAffineTransform");
    *(_QWORD *)(*((_QWORD *)&v42 + 1) + 24) = v23;
    getCATransform3DMakeAffineTransformSymbolLoc_ptr = v23;
  }
  _Block_object_dispose(&v42, 8);
  if (!v23)
    -[TURemoteVideoClient insertSubLayerInLayer:videoSlotIdentifier:].cold.2();
  v42 = v32[0];
  v43 = v32[1];
  v44 = v32[2];
  ((void (*)(_OWORD *__return_ptr, __int128 *))v23)(v33, &v42);
  v31[4] = v33[4];
  v31[5] = v33[5];
  v31[6] = v33[6];
  v31[7] = v33[7];
  v31[0] = v33[0];
  v31[1] = v33[1];
  v31[2] = v33[2];
  v31[3] = v33[3];
  objc_msgSend(v15, "setTransform:", v31);
  getkCAGravityResizeAspectFill();
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    getkCAGravityResizeAspectFill();
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setContentsGravity:", v26);
  }
  else
  {
    TUDefaultLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[TURemoteVideoClient insertSubLayerInLayer:videoSlotIdentifier:].cold.3(v26);
  }

  objc_msgSend(v15, "setName:", v7);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __65__TURemoteVideoClient_insertSubLayerInLayer_videoSlotIdentifier___block_invoke;
  v28[3] = &unk_1E38A1D10;
  v29 = v15;
  v30 = a4;
  v27 = v15;
  dispatch_async(MEMORY[0x1E0C80D38], v28);

}

uint64_t __65__TURemoteVideoClient_insertSubLayerInLayer_videoSlotIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(getCATransactionClass(), "begin");
  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v2 = (void *)getCAContextClass_softClass;
  v10 = getCAContextClass_softClass;
  if (!getCAContextClass_softClass)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __getCAContextClass_block_invoke;
    v6[3] = &unk_1E38A1710;
    v6[4] = &v7;
    __getCAContextClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v7, 8);
  objc_msgSend(v3, "objectForSlot:", *(unsigned int *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setContents:", v4);

  return objc_msgSend(getCATransactionClass(), "commit");
}

- (id)nameForSubLayer
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), CFSTR("TURemoteVideoSubLayer"), self);
}

- (void)cleanUpSubLayerForLayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TURemoteVideoClient nameForSubLayer](self, "nameForSubLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "sublayers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
      objc_msgSend(v11, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", v5);

      if ((v13 & 1) != 0)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v14 = v11;

    if (!v14)
      goto LABEL_13;
    objc_msgSend(v14, "setContents:", 0);
    objc_msgSend(v14, "removeFromSuperlayer");
    v6 = v14;
  }
LABEL_12:

LABEL_13:
}

- (int64_t)videoContextSlotIdentifier
{
  return self->_videoContextSlotIdentifier;
}

- (CALayer)videoLayer
{
  return self->_videoLayer;
}

- (void)setVideoLayer:(id)a3
{
  objc_storeStrong((id *)&self->_videoLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoLayer, 0);
}

- (void)insertSubLayerInLayer:videoSlotIdentifier:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGAffineTransform _CGAffineTransformMakeRotation(CGFloat)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TURemoteVideoClient.m"), 18, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

- (void)insertSubLayerInLayer:videoSlotIdentifier:.cold.2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CATransform3D _CATransform3DMakeAffineTransform(CGAffineTransform)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TURemoteVideoClient.m"), 22, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

- (void)insertSubLayerInLayer:(os_log_t)log videoSlotIdentifier:.cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19A50D000, log, OS_LOG_TYPE_ERROR, "Unable to weak-link symbol kCAGravityResizeAspectFill", v1, 2u);
}

@end
