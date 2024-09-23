@implementation QLPreviewExtensionRenderer

- (QLPreviewExtensionRenderer)initWithPreview:(id)a3
{
  id v5;
  QLPreviewExtensionRenderer *v6;
  QLPreviewExtensionRenderer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLPreviewExtensionRenderer;
  v6 = -[QLPreviewExtensionRenderer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_preview, a3);

  return v7;
}

- (void)drawInContextOfSize:(CGSize)a3 drawingBlock:(id)a4 completionHandler:(id)a5
{
  double height;
  double width;
  void (**v9)(id, CGContext *);
  void (**v10)(id, dispatch_data_t, void *, _QWORD);
  CGColorSpaceRef DeviceRGB;
  CGContext *v12;
  void *v13;
  NSObject *v14;
  void *Data;
  size_t BytesPerRow;
  size_t v17;
  NSObject *v18;
  dispatch_data_t v19;
  void *v20;

  height = a3.height;
  width = a3.width;
  v9 = (void (**)(id, CGContext *))a4;
  v10 = (void (**)(id, dispatch_data_t, void *, _QWORD))a5;
  if (!v9)
  {
    extensionLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[QLPreviewExtensionRenderer drawInContextOfSize:drawingBlock:completionHandler:].cold.1(self);
    goto LABEL_13;
  }
  if (width <= 0.0 || height <= 0.0)
  {
    extensionLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[QLPreviewExtensionRenderer drawInContextOfSize:drawingBlock:completionHandler:].cold.2(self);
    goto LABEL_13;
  }
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v12 = (CGContext *)QLTCreateCGContextWithSize();
  CFRelease(DeviceRGB);
  if (!v12)
  {
    extensionLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[QLPreviewExtensionRenderer drawInContextOfSize:drawingBlock:completionHandler:].cold.3(self);
LABEL_13:

    -[QLPreviewExtensionRenderer _failedToDrawError](self, "_failedToDrawError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v9[2](v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    Data = CGBitmapContextGetData(v12);
    BytesPerRow = CGBitmapContextGetBytesPerRow(v12);
    v17 = CGBitmapContextGetHeight(v12) * BytesPerRow;
    dispatch_get_global_queue(0, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_data_create(Data, v17, v18, (dispatch_block_t)*MEMORY[0x24BDAC988]);

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE5EE0]), "initWithBitmapContext:", v12);
    v10[2](v10, v19, v20, 0);
    CGContextRelease(v12);

    goto LABEL_15;
  }
  CGContextRelease(v12);
LABEL_14:
  ((void (**)(id, dispatch_data_t, void *, void *))v10)[2](v10, 0, 0, v13);
LABEL_15:

}

- (void)drawInPDFContextOfSize:(CGSize)a3 drawingBlock:(id)a4 completionHandler:(id)a5
{
  double height;
  double width;
  void (**v9)(id, CGContext *);
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  __CFData *v12;
  void *v13;
  CGDataConsumer *v14;
  CGDataConsumer *v15;
  CGContext *v16;
  CGContext *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  CGRect v25;

  height = a3.height;
  width = a3.width;
  v9 = (void (**)(id, CGContext *))a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  extensionLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[QLPreviewExtensionRenderer drawInPDFContextOfSize:drawingBlock:completionHandler:].cold.6(self, v11);

  if (!v9)
  {
    extensionLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[QLPreviewExtensionRenderer drawInContextOfSize:drawingBlock:completionHandler:].cold.1(self);
    goto LABEL_15;
  }
  if (width <= 0.0 || height <= 0.0)
  {
    extensionLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[QLPreviewExtensionRenderer drawInPDFContextOfSize:drawingBlock:completionHandler:].cold.2(self);
LABEL_15:

    -[QLPreviewExtensionRenderer _failedToDrawError](self, "_failedToDrawError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v13);
    goto LABEL_27;
  }
  v12 = (__CFData *)objc_opt_new();
  v13 = v12;
  if (!v12)
  {
    extensionLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[QLPreviewExtensionRenderer drawInPDFContextOfSize:drawingBlock:completionHandler:].cold.3(self);
    goto LABEL_20;
  }
  v14 = CGDataConsumerCreateWithCFData(v12);
  if (!v14)
  {
    extensionLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[QLPreviewExtensionRenderer drawInPDFContextOfSize:drawingBlock:completionHandler:].cold.4(self);
LABEL_20:

    -[QLPreviewExtensionRenderer _failedToDrawError](self, "_failedToDrawError");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v18);
LABEL_26:

    goto LABEL_27;
  }
  v15 = v14;
  v25.origin = (CGPoint)*MEMORY[0x24BDBF090];
  v25.size.width = width;
  v25.size.height = height;
  v16 = CGPDFContextCreate(v14, &v25, 0);
  if (v16)
  {
    v17 = v16;
    CGPDFContextBeginPage(v16, 0);
    v9[2](v9, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    CGPDFContextEndPage(v17);
    CGPDFContextClose(v17);
    if (v18)
    {
      v19 = 0;
      v20 = v18;
    }
    else
    {
      v19 = v13;
      v20 = 0;
    }
    ((void (**)(id, void *, void *))v10)[2](v10, v19, v20);
    CGContextRelease(v17);
    CGDataConsumerRelease(v15);
    goto LABEL_26;
  }
  extensionLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    -[QLPreviewExtensionRenderer drawInPDFContextOfSize:drawingBlock:completionHandler:].cold.5(self);

  -[QLPreviewExtensionRenderer _failedToDrawError](self, "_failedToDrawError");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2](v10, 0, v24);

  CGDataConsumerRelease(v15);
LABEL_27:

}

- (id)_failedToDrawError
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v6 = *MEMORY[0x24BDD0FC8];
  v7[0] = CFSTR("Unable to render preview");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("QuickLookPreviewErrors"), 3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)preview
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setPreview:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_preview, 0);
}

- (void)drawInContextOfSize:(void *)a1 drawingBlock:completionHandler:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "preview");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_20D4C7000, v2, v3, "(%@): Missing drawing block", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)drawInContextOfSize:(void *)a1 drawingBlock:completionHandler:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "preview");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_20D4C7000, v2, v3, "(%@): Context size invalid in preview generation", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)drawInContextOfSize:(void *)a1 drawingBlock:completionHandler:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "preview");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_20D4C7000, v2, v3, "(%@): Could not create CGContext for preview extension. Cancelling preview generation.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)drawInPDFContextOfSize:(void *)a1 drawingBlock:completionHandler:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "preview");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_20D4C7000, v2, v3, "(%@): Invalid context size creating PDF context", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)drawInPDFContextOfSize:(void *)a1 drawingBlock:completionHandler:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "preview");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_20D4C7000, v2, v3, "(%@): Unable to create data for pdf context for preview", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)drawInPDFContextOfSize:(void *)a1 drawingBlock:completionHandler:.cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "preview");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_20D4C7000, v2, v3, "(%@): Unable to create pdf context for preview (can't create consumer)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)drawInPDFContextOfSize:(void *)a1 drawingBlock:completionHandler:.cold.5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "preview");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_20D4C7000, v2, v3, "(%@): Unable to create pdf context for preview", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)drawInPDFContextOfSize:(void *)a1 drawingBlock:(NSObject *)a2 completionHandler:.cold.6(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "preview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_20D4C7000, a2, OS_LOG_TYPE_DEBUG, "(%@): Creating vectorized context for preview", v4, 0xCu);

  OUTLINED_FUNCTION_1_0();
}

@end
