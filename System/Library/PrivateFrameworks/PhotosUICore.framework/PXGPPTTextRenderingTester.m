@implementation PXGPPTTextRenderingTester

- (void)runRenderTextTestWithOptions:(id)a3 latencyMeter:(id)a4 completionHandler:(id)a5 failureHandler:(id)a6
{
  PXGStringTextureProvider *v10;
  void *v11;
  PXGPPTStringsLayout *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  PXGStringTextureProvider *v21;
  PXGPPTStringsLayout *v22;
  void *v23;
  PXGPPTTextRenderingTester *v24;
  id v25;
  id v26;
  id v27;
  void (**v28)(_QWORD);
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD v42[5];
  PXGPPTTextRenderingTester *v43;
  _QWORD aBlock[4];
  PXGStringTextureProvider *v45;
  PXGPPTStringsLayout *v46;
  _QWORD *v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[4];
  _QWORD v53[3];
  int v54;

  v29 = a3;
  v31 = a4;
  v32 = a5;
  v30 = a6;
  objc_msgSend(v31, "setMeasurementsUnit:", CFSTR("ms"));
  v10 = objc_alloc_init(PXGStringTextureProvider);
  v11 = (void *)MEMORY[0x1E0C80D38];
  -[PXGTextureProvider setRequestQueue:](v10, "setRequestQueue:", MEMORY[0x1E0C80D38]);
  -[PXGTextureProvider setProcessingQueue:](v10, "setProcessingQueue:", v11);

  -[PXGTextureProvider setDelegate:](v10, "setDelegate:", self);
  v12 = -[PXGPPTStringsLayout initWithStringCount:localeCodes:]([PXGPPTStringsLayout alloc], "initWithStringCount:localeCodes:", 5, &unk_1E53EAC80);
  -[PXGLayout setReferenceSize:](v12, "setReferenceSize:", 600.0, 400.0);
  -[PXGLayout setDisplayScale:](v12, "setDisplayScale:", 2.0);
  -[PXGLayout updateIfNeeded](v12, "updateIfNeeded");
  -[PXGPPTTextRenderingTester setStringTextureProvider:](self, "setStringTextureProvider:", v10);
  -[PXGPPTTextRenderingTester setStringsLayout:](self, "setStringsLayout:", v12);
  v13 = -[PXGItemsLayout numberOfItems](v12, "numberOfItems");
  -[PXGLayout spriteDataStore](v12, "spriteDataStore");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = objc_msgSend(v14, "geometries");

  -[PXGLayout spriteDataStore](v12, "spriteDataStore");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = objc_msgSend(v16, "styles");

  -[PXGLayout spriteDataStore](v12, "spriteDataStore");
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v19 = objc_msgSend(v18, "infos");

  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  v54 = 0;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x2020000000;
  v20 = MEMORY[0x1E0C809B0];
  v52[3] = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __104__PXGPPTTextRenderingTester_runRenderTextTestWithOptions_latencyMeter_completionHandler_failureHandler___block_invoke;
  aBlock[3] = &unk_1E5147400;
  v47 = v52;
  v21 = v10;
  v45 = v21;
  v48 = v53;
  v49 = v15;
  v50 = v17;
  v51 = v19;
  v22 = v12;
  v46 = v22;
  v23 = _Block_copy(aBlock);
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__294326;
  v42[4] = __Block_byref_object_dispose__294327;
  v24 = self;
  v43 = v24;
  v33[0] = v20;
  v33[1] = 3221225472;
  v33[2] = __104__PXGPPTTextRenderingTester_runRenderTextTestWithOptions_latencyMeter_completionHandler_failureHandler___block_invoke_10;
  v33[3] = &unk_1E5147428;
  v25 = v30;
  v35 = v25;
  v38 = v53;
  v39 = v52;
  v26 = v31;
  v40 = v42;
  v41 = v13;
  v34 = v26;
  v27 = v32;
  v36 = v27;
  v28 = v23;
  v37 = v28;
  -[PXGPPTTextRenderingTester setTextureProviderDidProvideCGImageHandler:](v24, "setTextureProviderDidProvideCGImageHandler:", v33);
  v28[2](v28);

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v52, 8);
  _Block_object_dispose(v53, 8);

}

- (void)textureProvider:(id)a3 didProvideCGImage:(CGImage *)a4 options:(id)a5 adjustment:(id)a6 isDegraded:(BOOL)a7 forRequestID:(int)a8
{
  void *v10;
  void (**v11)(id, CGImage *);

  -[PXGPPTTextRenderingTester textureProviderDidProvideCGImageHandler](self, "textureProviderDidProvideCGImageHandler", a3, a4, *(_QWORD *)&a5.var0, *(_QWORD *)&a5.var2, a6, a7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PXGPPTTextRenderingTester textureProviderDidProvideCGImageHandler](self, "textureProviderDidProvideCGImageHandler");
    v11 = (void (**)(id, CGImage *))objc_claimAutoreleasedReturnValue();
    v11[2](v11, a4);

  }
}

- (id)textureProvider:(id)a3 requestRenderSnapshot:(id *)a4
{
  return 0;
}

- (PXGStringTextureProvider)stringTextureProvider
{
  return self->_stringTextureProvider;
}

- (void)setStringTextureProvider:(id)a3
{
  objc_storeStrong((id *)&self->_stringTextureProvider, a3);
}

- (PXGPPTStringsLayout)stringsLayout
{
  return self->_stringsLayout;
}

- (void)setStringsLayout:(id)a3
{
  objc_storeStrong((id *)&self->_stringsLayout, a3);
}

- (id)textureProviderDidProvideCGImageHandler
{
  return self->_textureProviderDidProvideCGImageHandler;
}

- (void)setTextureProviderDidProvideCGImageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_textureProviderDidProvideCGImageHandler, 0);
  objc_storeStrong((id *)&self->_stringsLayout, 0);
  objc_storeStrong((id *)&self->_stringTextureProvider, 0);
}

uint64_t __104__PXGPPTTextRenderingTester_runRenderTextTestWithOptions_latencyMeter_completionHandler_failureHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2;
  return objc_msgSend(*(id *)(a1 + 32), "requestTexturesForSpritesInRange:geometries:styles:infos:inLayout:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) | 0x100000000, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40));
}

void __104__PXGPPTTextRenderingTester_runRenderTextTestWithOptions_latencyMeter_completionHandler_failureHandler___block_invoke_10(uint64_t a1, uint64_t a2)
{
  double v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (a2)
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(*(id *)(a1 + 32), "reportLatency:forOutputQuality:", 2, (v3 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)) * 1000.0);
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to render a texture with index: %d"), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  if (*(_QWORD *)(a1 + 88) == *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setStringTextureProvider:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setStringsLayout:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

@end
