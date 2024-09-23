@implementation WBSFormAutoFillCorrectionManager

- (WBSFormAutoFillCorrectionManager)initWithCorrectionsStore:(id)a3
{
  id v5;
  WBSFormAutoFillCorrectionManager *v6;
  WBSFormAutoFillCorrectionManager *v7;
  WBSFormAutoFillCorrectionManager *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSFormAutoFillCorrectionManager;
  v6 = -[WBSFormAutoFillCorrectionManager init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_correctionsStore, a3);
    v8 = v7;
  }

  return v7;
}

- (void)getCorrectionsForFormFieldFingerprint:(id)a3 onDomain:(id)a4 completionHandler:(id)a5
{
  id v8;
  WBSFormAutoFillCorrectionsStore *correctionsStore;
  id v10;
  _QWORD v11[5];
  id v12;

  v8 = a5;
  correctionsStore = self->_correctionsStore;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __101__WBSFormAutoFillCorrectionManager_getCorrectionsForFormFieldFingerprint_onDomain_completionHandler___block_invoke;
  v11[3] = &unk_1E4B2AE38;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  -[WBSFormAutoFillCorrectionsStore getClassificationForFieldWithFingerprint:onDomain:completionHandler:](correctionsStore, "getClassificationForFieldWithFingerprint:onDomain:completionHandler:", a3, a4, v11);

}

void __101__WBSFormAutoFillCorrectionManager_getCorrectionsForFormFieldFingerprint_onDomain_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__WBSFormAutoFillCorrectionManager_getCorrectionsForFormFieldFingerprint_onDomain_completionHandler___block_invoke_2;
  block[3] = &unk_1E4B2AFC0;
  v4 = *(id *)(a1 + 40);
  v7 = v3;
  v8 = v4;
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __101__WBSFormAutoFillCorrectionManager_getCorrectionsForFormFieldFingerprint_onDomain_completionHandler___block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  id v2;

  v1 = a1[6];
  objc_msgSend(*(id *)(a1[4] + 16), "transformedValue:", a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (void)_setCorrections:(id)a3 forFingerprint:(id)a4 onDomain:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  WBSFormAutoFillClassificationToCorrectionsTransformer *classificationToCorrectionsTransformer;
  WBSFormAutoFillClassificationToCorrectionsTransformer *v13;
  WBSFormAutoFillClassificationToCorrectionsTransformer *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v16;
  v11 = v9;
  classificationToCorrectionsTransformer = self->_classificationToCorrectionsTransformer;
  if (!classificationToCorrectionsTransformer)
  {
    v13 = objc_alloc_init(WBSFormAutoFillClassificationToCorrectionsTransformer);
    v14 = self->_classificationToCorrectionsTransformer;
    self->_classificationToCorrectionsTransformer = v13;

    classificationToCorrectionsTransformer = self->_classificationToCorrectionsTransformer;
    v10 = v16;
  }
  -[WBSFormAutoFillClassificationToCorrectionsTransformer reverseTransformedValue:](classificationToCorrectionsTransformer, "reverseTransformedValue:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    -[WBSFormAutoFillCorrectionsStore setLocalClassification:forFieldWithFingerprint:onDomain:completionHandler:](self->_correctionsStore, "setLocalClassification:forFieldWithFingerprint:onDomain:completionHandler:", v15, v8, v11, 0);

}

- (void)setCorrectionSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t);
  void *v15;
  WBSFormAutoFillCorrectionManager *v16;
  id v17;

  v4 = a3;
  objc_msgSend(v4, "fingerprintsToCorrections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __53__WBSFormAutoFillCorrectionManager_setCorrectionSet___block_invoke;
  v15 = &unk_1E4B39120;
  v16 = self;
  v7 = v6;
  v17 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v12);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(WeakRetained, "autoFillCorrectionManagerShouldProcessFeedback:", self, v12, v13, v14, v15, v16) & 1) == 0)
  {
    v11 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[WBSFormAutoFillCorrectionManager setCorrectionSet:].cold.2(v11);
  }
  else
  {
    v9 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[WBSFormAutoFillCorrectionManager setCorrectionSet:].cold.1((uint64_t)v4, (uint64_t)v7, v9);
    -[WBSFormAutoFillCorrectionManager _feedbackProcessor](self, "_feedbackProcessor", v12, v13, v14, v15, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendFeedbackWithCorrectionSet:", v4);

  }
}

uint64_t __53__WBSFormAutoFillCorrectionManager_setCorrectionSet___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setCorrections:forFingerprint:onDomain:", a3, a2, *(_QWORD *)(a1 + 40));
}

- (id)_feedbackProcessor
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "feedbackProcessorForAutoFillCorrectionManager:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (WBSFormAutoFillCorrectionManagerDelegate)delegate
{
  return (WBSFormAutoFillCorrectionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_classificationToCorrectionsTransformer, 0);
  objc_storeStrong((id *)&self->_correctionsStore, 0);
}

- (void)setCorrectionSet:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1A3D90000, log, OS_LOG_TYPE_DEBUG, "Preparing to send AutoFill corrections: %@ on domain: %@", (uint8_t *)&v3, 0x16u);
}

- (void)setCorrectionSet:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A3D90000, log, OS_LOG_TYPE_DEBUG, "Not sending AutoFill feedback since the correction manager told us not to", v1, 2u);
}

@end
