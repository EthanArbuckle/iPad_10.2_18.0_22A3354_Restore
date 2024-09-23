@implementation PXFeedbackTapToRadarRequestHandler

+ (void)fileRadarFromSourceView:(id)a3 viewTitleForRadar:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  PXMemoriesRelatedTapToRadarService *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXFeedbackTapToRadarRequestHandler.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceView"));

  }
  objc_msgSend(v9, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rootViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "bounds");
  PXRectGetCenter();
  objc_msgSend(v24, "px_diagnosticsItemProvidersForPoint:inCoordinateSpace:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PXDiagnosticsService initWithItemProviders:]([PXMemoriesRelatedTapToRadarService alloc], "initWithItemProviders:", v13);
  -[PXMemoriesRelatedTapToRadarService collectProviderItemsSummaryAndLibraryStat](v14, "collectProviderItemsSummaryAndLibraryStat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v16 = -[PXMemoriesRelatedTapToRadarService snapshotMemoriesRelatedResults:error:](v14, "snapshotMemoriesRelatedResults:error:", v15, &v27);
  v17 = v27;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TTR Photos %@"), v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMemoriesRelatedTapToRadarService tapToRadarURLWithTitle:descriptionString:](v14, "tapToRadarURLWithTitle:descriptionString:", v18, &stru_1E5149688);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v20 = v10;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __98__PXFeedbackTapToRadarRequestHandler_fileRadarFromSourceView_viewTitleForRadar_completionHandler___block_invoke;
  v25[3] = &unk_1E51471A0;
  v26 = v11;
  v22 = v11;
  objc_msgSend(v21, "openURL:configuration:completionHandler:", v19, 0, v25);

}

void __98__PXFeedbackTapToRadarRequestHandler_fileRadarFromSourceView_viewTitleForRadar_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v6 = *(id *)(a1 + 32);
  v5 = v4;
  px_dispatch_on_main_queue();

}

uint64_t __98__PXFeedbackTapToRadarRequestHandler_fileRadarFromSourceView_viewTitleForRadar_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
