@implementation PXVisualDiagnosticsContext

- (PXVisualDiagnosticsContext)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVisualDiagnosticsContext.m"), 41, CFSTR("%s is not available as initializer"), "-[PXVisualDiagnosticsContext init]");

  abort();
}

- (PXVisualDiagnosticsContext)initWithConfiguration:(id)a3
{
  return -[PXVisualDiagnosticsContext initWithConfiguration:dataConsumer:](self, "initWithConfiguration:dataConsumer:", a3, 0);
}

- (PXVisualDiagnosticsContext)initWithConfiguration:(id)a3 dataConsumer:(CGDataConsumer *)a4
{
  id v7;
  PXVisualDiagnosticsContext *v8;
  PXVisualDiagnosticsContext *v9;
  CGSize v10;
  CGFloat v11;
  CGFloat v12;
  id v13;
  __CFString *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSURL *fileURL;
  CGRect mediaBox;
  objc_super v27;

  v7 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PXVisualDiagnosticsContext;
  v8 = -[PXVisualDiagnosticsContext init](&v27, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_configuration, a3);
    v10 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
    v9->_currentPageBounds.origin = (CGPoint)*MEMORY[0x24BDBF070];
    v9->_currentPageBounds.size = v10;
    -[PXVisualDiagnosticsConfiguration defaultPageSize](v9->_configuration, "defaultPageSize");
    mediaBox.origin = (CGPoint)*MEMORY[0x24BDBEFB0];
    mediaBox.size.width = v11;
    mediaBox.size.height = v12;
    v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("Photos Visual Diagnostics"), *MEMORY[0x24BDBF3F0]);
    if (a4)
    {
      v9->_CGContext = CGPDFContextCreate(a4, &mediaBox, (CFDictionaryRef)v13);
    }
    else
    {
      -[PXVisualDiagnosticsConfiguration name](v9->_configuration, "name");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!-[__CFString length](v14, "length"))
      {

        v14 = CFSTR("VisualDiagnostics");
      }
      v15 = objc_alloc_init(MEMORY[0x24BDD1500]);
      objc_msgSend(v15, "setDateFormat:", CFSTR("yyyy-MM-dd-HHmmss"));
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringFromDate:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingFormat:](v14, "stringByAppendingFormat:", CFSTR("-%@"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x24BDBCF48];
      NSTemporaryDirectory();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "fileURLWithPath:isDirectory:", v20, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "URLByAppendingPathComponent:isDirectory:", v18, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "URLByAppendingPathExtension:", CFSTR("pdf"));
      v23 = objc_claimAutoreleasedReturnValue();
      fileURL = v9->_fileURL;
      v9->_fileURL = (NSURL *)v23;

      v9->_CGContext = CGPDFContextCreateWithURL((CFURLRef)v9->_fileURL, &mediaBox, (CFDictionaryRef)v13);
    }

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  CGContextRelease(self->_CGContext);
  v3.receiver = self;
  v3.super_class = (Class)PXVisualDiagnosticsContext;
  -[PXVisualDiagnosticsContext dealloc](&v3, sel_dealloc);
}

- (CGSize)defaultPageSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PXVisualDiagnosticsContext configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultPageSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)beginPage
{
  -[PXVisualDiagnosticsContext beginPageWithConfiguration:](self, "beginPageWithConfiguration:", &__block_literal_global_1596);
}

- (void)beginPageWithConfiguration:(id)a3
{
  void (**v4)(id, void *);
  _PXVisualDiagnosticsPageConfiguration *v5;
  void *v6;
  _PXVisualDiagnosticsPageConfiguration *v7;
  CGContext *v8;
  NSObject *v9;
  CGFloat v10;
  CGFloat v11;
  id v12;
  void *v13;
  CGFloat MaxY;
  __int16 v15[8];
  CGRect v16;

  v4 = (void (**)(id, void *))a3;
  v5 = [_PXVisualDiagnosticsPageConfiguration alloc];
  -[PXVisualDiagnosticsContext configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_PXVisualDiagnosticsPageConfiguration initWithConfiguration:](v5, "initWithConfiguration:", v6);

  v4[2](v4, v7);
  v8 = -[PXVisualDiagnosticsContext CGContext](self, "CGContext");
  -[PXVisualDiagnosticsContext currentPageBounds](self, "currentPageBounds");
  if (!CGRectIsNull(v16))
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15[0] = 0;
      _os_log_error_impl(&dword_24430E000, v9, OS_LOG_TYPE_ERROR, "unbalanced page begin", (uint8_t *)v15, 2u);
    }

  }
  -[_PXVisualDiagnosticsPageConfiguration pageSize](v7, "pageSize");
  self->_currentPageBounds.origin = (CGPoint)*MEMORY[0x24BDBEFB0];
  self->_currentPageBounds.size.width = v10;
  self->_currentPageBounds.size.height = v11;
  v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", self->_currentPageBounds.origin.x, self->_currentPageBounds.origin.y, self->_currentPageBounds.size.width, self->_currentPageBounds.size.height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDBF470]);

  CGPDFContextBeginPage(v8, (CFDictionaryRef)v12);
  UIGraphicsPushContext(v8);
  MaxY = CGRectGetMaxY(self->_currentPageBounds);
  CGContextTranslateCTM(v8, 0.0, MaxY);
  CGContextScaleCTM(v8, 1.0, -1.0);

}

- (void)endPage
{
  NSObject *v3;
  CGSize v4;
  uint8_t v5[16];
  CGRect v6;

  -[PXVisualDiagnosticsContext currentPageBounds](self, "currentPageBounds");
  if (CGRectIsNull(v6))
  {
    PXAssertGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_24430E000, v3, OS_LOG_TYPE_ERROR, "unbalanced page end", v5, 2u);
    }

  }
  v4 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
  self->_currentPageBounds.origin = (CGPoint)*MEMORY[0x24BDBF070];
  self->_currentPageBounds.size = v4;
  UIGraphicsPopContext();
  CGPDFContextEndPage(-[PXVisualDiagnosticsContext CGContext](self, "CGContext"));
}

- (void)strokeRect:(CGRect)a3 configuration:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void (**v9)(id, _PXVisualDiagnosticsStrokeRectConfiguration *);
  CGContext *v10;
  id v11;
  CGFloat v12;
  _PXVisualDiagnosticsStrokeRectConfiguration *v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (void (**)(id, _PXVisualDiagnosticsStrokeRectConfiguration *))a4;
  v13 = objc_alloc_init(_PXVisualDiagnosticsStrokeRectConfiguration);
  v9[2](v9, v13);

  v10 = -[PXVisualDiagnosticsContext CGContext](self, "CGContext");
  -[_PXVisualDiagnosticsStrokeRectConfiguration strokeColor](v13, "strokeColor");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(v10, (CGColorRef)objc_msgSend(v11, "CGColor"));

  -[_PXVisualDiagnosticsStrokeRectConfiguration lineWidth](v13, "lineWidth");
  CGContextSetLineWidth(v10, v12);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  CGContextStrokeRect(v10, v14);

}

- (void)fillRect:(CGRect)a3 configuration:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void (**v9)(id, _PXVisualDiagnosticsFillRectConfiguration *);
  CGContext *v10;
  id v11;
  _PXVisualDiagnosticsFillRectConfiguration *v12;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (void (**)(id, _PXVisualDiagnosticsFillRectConfiguration *))a4;
  v12 = objc_alloc_init(_PXVisualDiagnosticsFillRectConfiguration);
  v9[2](v9, v12);

  v10 = -[PXVisualDiagnosticsContext CGContext](self, "CGContext");
  -[_PXVisualDiagnosticsFillRectConfiguration fillColor](v12, "fillColor");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v10, (CGColorRef)objc_msgSend(v11, "CGColor"));

  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  CGContextFillRect(v10, v13);

}

- (void)drawTextInRect:(CGRect)a3 configuration:(id)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  void (**v8)(id, _PXVisualDiagnosticsDrawTextConfiguration *);
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double MinX;
  double v32;
  double MinY;
  double v34;
  _PXVisualDiagnosticsDrawTextConfiguration *v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void (**)(id, _PXVisualDiagnosticsDrawTextConfiguration *))a4;
  v35 = objc_alloc_init(_PXVisualDiagnosticsDrawTextConfiguration);
  v8[2](v8, v35);

  -[_PXVisualDiagnosticsDrawTextConfiguration relativePosition](v35, "relativePosition");
  v10 = v9;
  v12 = v11;
  -[_PXVisualDiagnosticsDrawTextConfiguration attributedText](v35, "attributedText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    goto LABEL_14;
  v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[_PXVisualDiagnosticsDrawTextConfiguration font](v35, "font");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BEBB360]);
  }
  else
  {
    v16 = (void *)MEMORY[0x24BEBB520];
    -[_PXVisualDiagnosticsDrawTextConfiguration fontSize](v35, "fontSize");
    objc_msgSend(v16, "monospacedSystemFontOfSize:weight:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BEBB360]);

  }
  -[_PXVisualDiagnosticsDrawTextConfiguration textColor](v35, "textColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BEBB368]);

  -[_PXVisualDiagnosticsDrawTextConfiguration backgroundColor](v35, "backgroundColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BEBB320]);

  v20 = objc_alloc_init(MEMORY[0x24BEBB490]);
  v21 = v20;
  if (v10 > 0.666666667)
  {
    v22 = 2;
LABEL_9:
    objc_msgSend(v20, "setAlignment:", v22);
    goto LABEL_10;
  }
  if (v10 > 0.333333333)
  {
    v22 = 1;
    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, *MEMORY[0x24BEBB3A8]);
  v23 = objc_alloc(MEMORY[0x24BDD1458]);
  -[_PXVisualDiagnosticsDrawTextConfiguration text](v35, "text");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v24)
    v26 = (const __CFString *)v24;
  else
    v26 = &stru_2514D17B8;
  v13 = (void *)objc_msgSend(v23, "initWithString:attributes:", v26, v14);

LABEL_14:
  objc_msgSend(v13, "boundingRectWithSize:options:context:", 1, 0, width, height, v12);
  v28 = v27;
  v30 = v29;
  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = width;
  v36.size.height = height;
  MinX = CGRectGetMinX(v36);
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  v32 = MinX + v10 * (CGRectGetMaxX(v37) - v28 - MinX);
  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  MinY = CGRectGetMinY(v38);
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  objc_msgSend(v13, "drawInRect:", v32, MinY + v34 * (CGRectGetMaxY(v39) - v30 - MinY), v28, v30);

}

- (void)drawImageInRect:(CGRect)a3 configuration:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void (**v8)(id, _PXVisualDiagnosticsDrawImageConfiguration *);
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _PXVisualDiagnosticsDrawImageConfiguration *v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void (**)(id, _PXVisualDiagnosticsDrawImageConfiguration *))a4;
  v17 = objc_alloc_init(_PXVisualDiagnosticsDrawImageConfiguration);
  v8[2](v8, v17);

  -[_PXVisualDiagnosticsDrawImageConfiguration image](v17, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXVisualDiagnosticsDrawImageConfiguration symbolName](v17, "symbolName");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9)
    v12 = 1;
  else
    v12 = v10 == 0;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v9)
  {
    objc_msgSend(v9, "size");
    PXSizeGetAspectRatio(v13, v14);
    PFSizeWithAspectRatioFittingSize();
    objc_msgSend(v9, "drawInRect:", x + width * 0.5 + v15 * -0.5, y + height * 0.5 + v16 * -0.5, v15);
  }

}

- (void)addTitlePageWithTitle:(id)a3 subtitle:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  uint64_t v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double x;
  double y;
  double width;
  double height;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, void *);
  void *v31;
  id v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[3];
  CGRect v37;
  CGRect v38;

  v36[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (objc_class *)MEMORY[0x24BDD1688];
  v8 = a3;
  v9 = [v7 alloc];
  v10 = *MEMORY[0x24BEBB360];
  v35[0] = *MEMORY[0x24BEBB360];
  v11 = *MEMORY[0x24BEBB5E8];
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 24.0, *MEMORY[0x24BEBB5E8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v12;
  v13 = *MEMORY[0x24BEBB368];
  v35[1] = *MEMORY[0x24BEBB368];
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v9, "initWithString:attributes:", v8, v15);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", CFSTR("\n"));
  objc_msgSend(v16, "appendAttributedString:", v17);

  if (objc_msgSend(v6, "length"))
  {
    v18 = objc_alloc(MEMORY[0x24BDD1458]);
    v33[0] = v10;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 18.0, v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v13;
    v34[0] = v19;
    objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v18, "initWithString:attributes:", v6, v21);
    objc_msgSend(v16, "appendAttributedString:", v22);

  }
  -[PXVisualDiagnosticsContext beginPage](self, "beginPage");
  -[PXVisualDiagnosticsContext currentPageBounds](self, "currentPageBounds");
  v38 = CGRectInset(v37, 80.0, 100.0);
  x = v38.origin.x;
  y = v38.origin.y;
  width = v38.size.width;
  height = v38.size.height;
  v28 = MEMORY[0x24BDAC760];
  v29 = 3221225472;
  v30 = __61__PXVisualDiagnosticsContext_addTitlePageWithTitle_subtitle___block_invoke;
  v31 = &unk_2514CFF18;
  v32 = v16;
  v27 = v16;
  -[PXVisualDiagnosticsContext drawTextInRect:configuration:](self, "drawTextInRect:configuration:", &v28, x, y, width, height);
  -[PXVisualDiagnosticsContext endPage](self, "endPage", v28, v29, v30, v31);

}

- (void)addPagesForTableWithConfiguration:(id)a3 columnsConfiguration:(id)a4 rowsConfiguration:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, PXVisualDiagnosticsTable *);
  PXVisualDiagnosticsTable *v11;

  v8 = a5;
  v9 = a4;
  v10 = (void (**)(id, PXVisualDiagnosticsTable *))a3;
  v11 = objc_alloc_init(PXVisualDiagnosticsTable);
  -[PXVisualDiagnosticsTable setMargins:](v11, "setMargins:", 10.0, 10.0, 10.0, 10.0);
  v10[2](v10, v11);

  -[PXVisualDiagnosticsTable configureColumnsWithConfiguration:](v11, "configureColumnsWithConfiguration:", v9);
  -[PXVisualDiagnosticsTable renderInContext:withRowsConfiguration:](v11, "renderInContext:withRowsConfiguration:", self, v8);

}

- (BOOL)isPrivateDataAllowed
{
  void *v2;
  char v3;

  -[PXVisualDiagnosticsContext configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPrivateDataAllowed");

  return v3;
}

- (CGContext)CGContext
{
  return self->_CGContext;
}

- (CGRect)currentPageBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_currentPageBounds.origin.x;
  y = self->_currentPageBounds.origin.y;
  width = self->_currentPageBounds.size.width;
  height = self->_currentPageBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (PXVisualDiagnosticsConfiguration)configuration
{
  return self->_configuration;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

uint64_t __61__PXVisualDiagnosticsContext_addTitlePageWithTitle_subtitle___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAttributedText:", *(_QWORD *)(a1 + 32));
}

@end
