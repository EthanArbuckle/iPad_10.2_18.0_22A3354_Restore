@implementation PXVisualDiagnosticsFactory

+ (void)showVisualDiagnosticsWithConfiguration:(id)a3 fromViewController:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = MEMORY[0x1E0C809B0];
  v11 = a5;
  if (!a5)
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __106__PXVisualDiagnosticsFactory_showVisualDiagnosticsWithConfiguration_fromViewController_completionHandler___block_invoke;
    v26[3] = &unk_1E5148B78;
    v11 = v26;
    v20 = &v27;
    v27 = v8;
  }
  v12 = _Block_copy(v11);
  v13 = v9;
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "px_firstKeyWindow");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "rootViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __106__PXVisualDiagnosticsFactory_showVisualDiagnosticsWithConfiguration_fromViewController_completionHandler___block_invoke_1;
  v21[3] = &unk_1E5127630;
  v25 = a1;
  v17 = v8;
  v22 = v17;
  v18 = v12;
  v23 = v14;
  v24 = v18;
  v19 = v14;
  objc_msgSend(a1, "_presentProgressIndicatorFromViewController:completionHandler:", v19, v21);

  if (!a5)
}

+ (void)_presentProgressIndicatorFromViewController:(id)a3 completionHandler:(id)a4
{
  void (**v4)(id, id);
  id v5;

  v4 = (void (**)(id, id))a4;
  +[PXProgressIndicatorAlertController beginShowingModalProgressWithConfiguration:](PXProgressIndicatorAlertController, "beginShowingModalProgressWithConfiguration:", &__block_literal_global_109334);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5);

}

+ (void)_dismissProgressIndicator:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  objc_msgSend(v6, "stopShowing:", v5);

}

+ (void)requestVisualDiagnosticsPDFDocumentWithConfiguration:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __97__PXVisualDiagnosticsFactory_requestVisualDiagnosticsPDFDocumentWithConfiguration_resultHandler___block_invoke;
  v8[3] = &unk_1E51414E0;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "requestVisualDiagnosticsPDFDocumentURLWithConfiguration:resultHandler:", a3, v8);

}

+ (void)requestVisualDiagnosticsPDFDocumentURLWithConfiguration:(id)a3 resultHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "rootProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B5EF8), "initWithConfiguration:", v5);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __100__PXVisualDiagnosticsFactory_requestVisualDiagnosticsPDFDocumentURLWithConfiguration_resultHandler___block_invoke;
    v10[3] = &unk_1E5148348;
    v11 = v8;
    v12 = v6;
    v9 = v8;
    objc_msgSend(v7, "addVisualDiagnosticsToContext:completionHandler:", v9, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("root provider not specified"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v6 + 2))(v6, 0, v9);
  }

}

+ (id)debugQuickLookObjectWithRootProvider:(id)a3
{
  id v3;
  __CFData *Mutable;
  void *v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  CGDataProvider *v8;
  CGPDFDocument *v9;
  size_t NumberOfPages;
  uint64_t v11;
  CGFloat v12;
  double v13;
  double v14;
  CGFloat v15;
  uint64_t v16;
  CGPDFPage *Page;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGColorSpace *DeviceRGB;
  CGContext *v23;
  uint64_t v24;
  CGPDFPage *v25;
  CGFloat v26;
  CGImage *Image;
  void *v28;
  CGDataConsumer *consumer;
  void *v31;
  _QWORD v32[4];
  NSObject *v33;
  CGRect BoxRect;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v3 = a3;
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  consumer = CGDataConsumerCreateWithCFData(Mutable);
  v31 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B5EF0), "initWithRootProvider:", v3);
  v5 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B5EF8), "initWithConfiguration:dataConsumer:", v31, consumer);
  v6 = dispatch_semaphore_create(0);
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __67__PXVisualDiagnosticsFactory_debugQuickLookObjectWithRootProvider___block_invoke;
  v32[3] = &unk_1E5148B78;
  v7 = v6;
  v33 = v7;
  objc_msgSend(v3, "addVisualDiagnosticsToContext:completionHandler:", v5, v32);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  CGPDFContextClose((CGContextRef)objc_msgSend(v5, "CGContext"));
  v8 = CGDataProviderCreateWithCFData(Mutable);
  v9 = CGPDFDocumentCreateWithProvider(v8);
  NumberOfPages = CGPDFDocumentGetNumberOfPages(v9);
  if (NumberOfPages)
  {
    v11 = 0;
    v12 = 0.0;
    v13 = 64.0;
    v14 = 64.0;
    v15 = 0.0;
    do
    {
      v16 = v11 + 1;
      Page = CGPDFDocumentGetPage(v9, v11 + 1);
      BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFMediaBox);
      x = BoxRect.origin.x;
      y = BoxRect.origin.y;
      width = BoxRect.size.width;
      height = BoxRect.size.height;
      if (v11)
      {
        v35 = CGRectOffset(BoxRect, 0.0, v13);
        x = v35.origin.x;
        y = v35.origin.y;
        width = v35.size.width;
        height = v35.size.height;
      }
      v36.origin.x = v15;
      v36.origin.y = v12;
      v36.size.width = v14;
      v36.size.height = v13;
      v40.origin.x = x;
      v40.origin.y = y;
      v40.size.width = width;
      v40.size.height = height;
      v37 = CGRectUnion(v36, v40);
      v15 = v37.origin.x;
      v12 = v37.origin.y;
      v14 = v37.size.width;
      v13 = v37.size.height;
      ++v11;
    }
    while (NumberOfPages != v16);
  }
  else
  {
    v15 = 0.0;
    v14 = 64.0;
    v12 = 0.0;
    v13 = 64.0;
  }
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v23 = CGBitmapContextCreate(0, (unint64_t)v14, (unint64_t)v13, 8uLL, 0, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  CGContextSetRGBFillColor(v23, 1.0, 1.0, 1.0, 1.0);
  v38.origin.x = v15;
  v38.origin.y = v12;
  v38.size.width = v14;
  v38.size.height = v13;
  CGContextFillRect(v23, v38);
  if (NumberOfPages)
  {
    v24 = 0;
    do
    {
      v25 = CGPDFDocumentGetPage(v9, ++v24);
      v39 = CGPDFPageGetBoxRect(v25, kCGPDFMediaBox);
      v26 = v39.size.height;
      CGContextDrawPDFPage(v23, v25);
      CGContextTranslateCTM(v23, 0.0, v26);
    }
    while (NumberOfPages != v24);
  }
  CGContextFlush(v23);
  Image = CGBitmapContextCreateImage(v23);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", Image);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(Image);
  CGContextRelease(v23);
  CGPDFDocumentRelease(v9);
  CGDataProviderRelease(v8);
  CGDataConsumerRelease(consumer);
  CFRelease(Mutable);

  return v28;
}

void __67__PXVisualDiagnosticsFactory_debugQuickLookObjectWithRootProvider___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "visual diagnostics failed: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __100__PXVisualDiagnosticsFactory_requestVisualDiagnosticsPDFDocumentURLWithConfiguration_resultHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = a3;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v5 = v4;
  px_dispatch_on_main_queue();

}

void __100__PXVisualDiagnosticsFactory_requestVisualDiagnosticsPDFDocumentURLWithConfiguration_resultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  CGPDFContextClose((CGContextRef)objc_msgSend(*(id *)(a1 + 32), "CGContext"));
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "fileURL");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 48);
    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("missing fileURL"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v6);

      v5 = 0;
      goto LABEL_7;
    }
    v7 = v2;
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, v2, 0);
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithUnderlyingError:debugDescription:", *(_QWORD *)(a1 + 40), CFSTR("visual diagnostics failed to be added"));
    v7 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 16))(v4, 0, v7);
  }
  v5 = (void *)v7;
LABEL_7:

}

void __97__PXVisualDiagnosticsFactory_requestVisualDiagnosticsPDFDocumentWithConfiguration_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  uint64_t v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2050000000;
    v7 = (void *)getPDFDocumentClass_softClass;
    v14 = getPDFDocumentClass_softClass;
    if (!getPDFDocumentClass_softClass)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __getPDFDocumentClass_block_invoke;
      v10[3] = &unk_1E51482E0;
      v10[4] = &v11;
      __getPDFDocumentClass_block_invoke((uint64_t)v10);
      v7 = (void *)v12[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v11, 8);
    v9 = objc_msgSend([v8 alloc], "initWithURL:", v5);
  }
  else
  {
    v9 = 0;
  }
  if (!(v6 | v9))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("failed to create a document"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __92__PXVisualDiagnosticsFactory__presentProgressIndicatorFromViewController_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setDelay:", 0.0);
  objc_msgSend(v2, "setIsInternalUIAllowed:", 1);
  objc_msgSend(v2, "setLabel:", CFSTR("Generating visual diagnostics…"));

}

void __106__PXVisualDiagnosticsFactory_showVisualDiagnosticsWithConfiguration_fromViewController_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "failed to show visual diagnostics for %@: %@", (uint8_t *)&v8, 0x16u);
    }

  }
}

void __106__PXVisualDiagnosticsFactory_showVisualDiagnosticsWithConfiguration_fromViewController_completionHandler___block_invoke_1(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __106__PXVisualDiagnosticsFactory_showVisualDiagnosticsWithConfiguration_fromViewController_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5127608;
  v5 = *(void **)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v8 = v3;
  v10 = v5;
  v9 = *(id *)(a1 + 40);
  v6 = v3;
  objc_msgSend(v11, "requestVisualDiagnosticsPDFDocumentWithConfiguration:resultHandler:", v4, v7);

}

void __106__PXVisualDiagnosticsFactory_showVisualDiagnosticsWithConfiguration_fromViewController_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __106__PXVisualDiagnosticsFactory_showVisualDiagnosticsWithConfiguration_fromViewController_completionHandler___block_invoke_3;
  v11[3] = &unk_1E5148370;
  v12 = v5;
  v13 = v6;
  v8 = *(void **)(a1 + 56);
  v15 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 40);
  v9 = v6;
  v10 = v5;
  objc_msgSend(v8, "_dismissProgressIndicator:completionHandler:", v7, v11);

}

void __106__PXVisualDiagnosticsFactory_showVisualDiagnosticsWithConfiguration_fromViewController_completionHandler___block_invoke_3(uint64_t a1)
{
  PXVisualDiagnosticsViewController *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = objc_alloc_init(PXVisualDiagnosticsViewController);
    -[PXVisualDiagnosticsViewController setDocument:](v2, "setDocument:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v2);
    objc_msgSend(v3, "setModalInPresentation:", 1);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __106__PXVisualDiagnosticsFactory_showVisualDiagnosticsWithConfiguration_fromViewController_completionHandler___block_invoke_4;
    v6[3] = &unk_1E5148A40;
    v4 = *(void **)(a1 + 48);
    v7 = *(id *)(a1 + 56);
    objc_msgSend(v4, "px_presentOverTopmostPresentedViewController:animated:completion:", v3, 1, v6);

  }
  else
  {
    v5 = +[PXAlert showForError:](PXAlert, "showForError:", *(_QWORD *)(a1 + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

uint64_t __106__PXVisualDiagnosticsFactory_showVisualDiagnosticsWithConfiguration_fromViewController_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
