@implementation _LTBatchTranslationResponseHandler

- (void)streamDidReceiveBatchTranslationStreamingResponse:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _LTBatchedParagraphsHolder *batchedParagraphs;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  unsigned int v39;
  void *v40;
  void *v41;
  BOOL v42;
  NSObject *v43;
  _LTBatchedParagraphsHolder *v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  unint64_t v49;
  int v50;
  void *v51;
  __int16 v52;
  unint64_t v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (id)_LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[FTMutableBatchTranslationRequest request_id](self->_request, "request_id");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 138543362;
    v51 = v6;
    _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "streamDidReceiveBatchTranslationStreamingResponse request_id %{public}@", (uint8_t *)&v50, 0xCu);

  }
  if (objc_msgSend(v4, "content_type") == 1)
  {
    v7 = (id)_LTOSLogTranslationEngine();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      -[FTMutableBatchTranslationRequest request_id](self->_request, "request_id");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 138543362;
      v51 = v8;
      _os_log_impl(&dword_2491B9000, v7, OS_LOG_TYPE_INFO, "found BatchTranslationResponse request_id %{public}@", (uint8_t *)&v50, 0xCu);

    }
    objc_msgSend(v4, "contentAsFTBatchTranslationResponse");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      batchedParagraphs = self->_batchedParagraphs;
      objc_msgSend(v9, "paragraph_id");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LTBatchedParagraphsHolder paragraphWithId:](batchedParagraphs, "paragraphWithId:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v10, "return_code") == 200)
      {
        objc_msgSend(v13, "requestParagraph");
        v14 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "paragraph");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (id)_LTOSLogTranslationEngine();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          -[FTMutableBatchTranslationRequest request_id](self->_request, "request_id");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "span");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "count");
          v50 = 138543618;
          v51 = v17;
          v52 = 2048;
          v53 = v19;
          _os_log_impl(&dword_2491B9000, v16, OS_LOG_TYPE_INFO, "Succeeded request %{public}@ (%zu alignments)", (uint8_t *)&v50, 0x16u);

        }
        v20 = (id)_LTOSLogTranslationEngine();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v10, "translated_text");
          objc_claimAutoreleasedReturnValue();
          -[NSObject text](v14, "text");
          objc_claimAutoreleasedReturnValue();
          -[_LTBatchTranslationResponseHandler streamDidReceiveBatchTranslationStreamingResponse:].cold.3();
        }

        v21 = objc_alloc(MEMORY[0x24BDF64A8]);
        -[NSObject text](v14, "text");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v21, "initWithOspreyBatchResponse:sourceText:", v10, v22);

        objc_msgSend(v23, "setRoute:", 2);
        -[NSObject paragraph_id](v14, "paragraph_id");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setIdentifier:", v24);

        objc_msgSend(v23, "setLocale:", self->_targetLocale);
        -[NSObject text](v14, "text");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setSourceString:", v25);

        objc_msgSend(v15, "spans");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "span");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "updateAlignmentWithSourceSpan:targetSpan:", v26, v27);

        v28 = 0;
      }
      else
      {
        v38 = (id)_LTOSLogTranslationEngine();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v10, "return_code");
          objc_msgSend(v10, "return_string");
          objc_claimAutoreleasedReturnValue();
          -[_LTBatchTranslationResponseHandler streamDidReceiveBatchTranslationStreamingResponse:].cold.5();
        }

        v39 = objc_msgSend(v10, "return_code");
        objc_msgSend(v10, "return_string");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        _LTErrorFromRemoteFailure(v39, v40);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = (id)_LTOSLogTranslationEngine();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          -[FTMutableBatchTranslationRequest request_id](self->_request, "request_id");
          objc_claimAutoreleasedReturnValue();
          -[_LTBatchTranslationResponseHandler streamDidReceiveBatchTranslationStreamingResponse:].cold.4();
        }
        v23 = 0;
      }

      objc_msgSend(v13, "completion");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41 == 0;

      if (v42)
      {
        v43 = (id)_LTOSLogTranslationEngine();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v10, "paragraph_id");
          objc_claimAutoreleasedReturnValue();
          -[_LTBatchTranslationResponseHandler streamDidReceiveBatchTranslationStreamingResponse:].cold.2();
        }
      }
      else
      {
        objc_msgSend(v13, "completion");
        v43 = objc_claimAutoreleasedReturnValue();
        ((void (*)(NSObject *, void *, void *))v43[2].isa)(v43, v23, v28);
      }

      v44 = self->_batchedParagraphs;
      objc_msgSend(v10, "paragraph_id");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LTBatchedParagraphsHolder removeParagraphWithId:](v44, "removeParagraphWithId:", v45);

    }
    else
    {
      v37 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        -[_LTBatchTranslationResponseHandler streamDidReceiveBatchTranslationStreamingResponse:].cold.1();
    }

  }
  else if (objc_msgSend(v4, "content_type") == 2)
  {
    -[_LTBatchTranslationResponseHandler setHasFinalServerResponse:](self, "setHasFinalServerResponse:", 1);
    objc_msgSend(v4, "contentAsFTFinalBlazarResponse");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      if (objc_msgSend(v29, "return_code") != 200)
      {
        v31 = (id)_LTOSLogTranslationEngine();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v30, "return_code");
          objc_msgSend(v30, "return_str");
          objc_claimAutoreleasedReturnValue();
          -[_LTBatchTranslationResponseHandler streamDidReceiveBatchTranslationStreamingResponse:].cold.5();
        }

        v32 = objc_msgSend(v30, "return_code");
        objc_msgSend(v30, "return_str");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        _LTErrorFromRemoteFailure(v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = (id)_LTOSLogTranslationEngine();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          -[FTMutableBatchTranslationRequest request_id](self->_request, "request_id");
          objc_claimAutoreleasedReturnValue();
          -[_LTBatchTranslationResponseHandler streamDidReceiveBatchTranslationStreamingResponse:].cold.4();
        }

      }
    }
    else
    {
      v46 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        -[_LTBatchTranslationResponseHandler streamDidReceiveBatchTranslationStreamingResponse:].cold.6();
    }
    v47 = (id)_LTOSLogTranslationEngine();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      -[FTMutableBatchTranslationRequest request_id](self->_request, "request_id");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[_LTBatchedParagraphsHolder count](self->_batchedParagraphs, "count");
      v50 = 138543874;
      v51 = v48;
      v52 = 2048;
      v53 = v49;
      v54 = 2112;
      v55 = 0;
      _os_log_impl(&dword_2491B9000, v47, OS_LOG_TYPE_INFO, "found FTFinalBlazarResponse request_id %{public}@ outstanding paragraphs %zu error %@", (uint8_t *)&v50, 0x20u);

    }
    -[_LTBatchTranslationResponseHandler callCompletionHandlersWithError:](self, "callCompletionHandlersWithError:", 0);

  }
  else
  {
    v36 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[_LTBatchTranslationResponseHandler streamDidReceiveBatchTranslationStreamingResponse:].cold.9();
  }

}

- (void)streamFailVerifyBatchTranslationStreamingResponse:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  v5 = (id)_LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    -[FTMutableBatchTranslationRequest request_id](self->_request, "request_id");
    objc_claimAutoreleasedReturnValue();
    -[_LTBatchTranslationResponseHandler streamDidReceiveBatchTranslationStreamingResponse:].cold.4();
  }

  -[_LTBatchTranslationResponseHandler callCompletionHandlersWithError:](self, "callCompletionHandlersWithError:", v4);
}

- (void)callCompletionHandlersWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    -[FTMutableBatchTranslationRequest request_id](self->_request, "request_id");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v14[0] = CFSTR("request_id");
      -[FTMutableBatchTranslationRequest request_id](self->_request, "request_id");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v6;
      v14[1] = CFSTR("hasFinalServerResponse");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasFinalServerResponse);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15[1] = v7;
      v14[2] = CFSTR("completionHandlerCalled");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_completionHandlerCalled);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
      v9 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v9;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("MISSING_BATCH_RESPONSE_ERROR_DESCRIPTION"), &stru_251A15610, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lt_errorWithCode:description:userInfo:", 13, v12, v5);
    v13 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v13;
  }
  -[_LTBatchedParagraphsHolder completeAllAndCleanWithError:](self->_batchedParagraphs, "completeAllAndCleanWithError:", v4);

}

- (FTMutableBatchTranslationRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (NSLocale)toLocale
{
  return self->_toLocale;
}

- (void)setToLocale:(id)a3
{
  objc_storeStrong((id *)&self->_toLocale, a3);
}

- (_LTTranslationParagraph)paragraph
{
  return self->_paragraph;
}

- (void)setParagraph:(id)a3
{
  objc_storeStrong((id *)&self->_paragraph, a3);
}

- (_LTBatchedParagraphsHolder)batchedParagraphs
{
  return self->_batchedParagraphs;
}

- (void)setBatchedParagraphs:(id)a3
{
  objc_storeStrong((id *)&self->_batchedParagraphs, a3);
}

- (int64_t)taskHint
{
  return self->_taskHint;
}

- (void)setTaskHint:(int64_t)a3
{
  self->_taskHint = a3;
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (void)setBufferSize:(unint64_t)a3
{
  self->_bufferSize = a3;
}

- (NSLocale)sourceLocale
{
  return self->_sourceLocale;
}

- (void)setSourceLocale:(id)a3
{
  objc_storeStrong((id *)&self->_sourceLocale, a3);
}

- (NSLocale)targetLocale
{
  return self->_targetLocale;
}

- (void)setTargetLocale:(id)a3
{
  objc_storeStrong((id *)&self->_targetLocale, a3);
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_requestID, a3);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (NSString)clientHeader
{
  return self->_clientHeader;
}

- (void)setClientHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
  objc_storeStrong((id *)&self->_sourceURL, a3);
}

- (BOOL)hasFinalServerResponse
{
  return self->_hasFinalServerResponse;
}

- (void)setHasFinalServerResponse:(BOOL)a3
{
  self->_hasFinalServerResponse = a3;
}

- (BOOL)completionHandlerCalled
{
  return self->_completionHandlerCalled;
}

- (void)setCompletionHandlerCalled:(BOOL)a3
{
  self->_completionHandlerCalled = a3;
}

- (NSUUID)logIdentifier
{
  return self->_logIdentifier;
}

- (void)setLogIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)supportsGenderDisambiguation
{
  return self->_supportsGenderDisambiguation;
}

- (void)setSupportsGenderDisambiguation:(BOOL)a3
{
  self->_supportsGenderDisambiguation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_clientHeader, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_targetLocale, 0);
  objc_storeStrong((id *)&self->_sourceLocale, 0);
  objc_storeStrong((id *)&self->_batchedParagraphs, 0);
  objc_storeStrong((id *)&self->_paragraph, 0);
  objc_storeStrong((id *)&self->_toLocale, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)streamDidReceiveBatchTranslationStreamingResponse:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "FIXME: NULL FTBatchTranslationResponse!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)streamDidReceiveBatchTranslationStreamingResponse:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_14_0();
  *(_DWORD *)v1 = 138543362;
  *(_QWORD *)(v1 + 4) = v2;
  _os_log_error_impl(&dword_2491B9000, v3, OS_LOG_TYPE_ERROR, "Missing paragraphBatchInfo for paragraph ID: %{public}@", v4, 0xCu);

  OUTLINED_FUNCTION_16();
}

- (void)streamDidReceiveBatchTranslationStreamingResponse:.cold.3()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_12_0();
  *(_DWORD *)v2 = 138740227;
  *(_QWORD *)(v2 + 4) = v3;
  *(_WORD *)(v2 + 12) = 2117;
  *(_QWORD *)(v2 + 14) = v4;
  OUTLINED_FUNCTION_8_2(&dword_2491B9000, "Translation: %{sensitive}@ for %{sensitive}@", v5, v6);

  OUTLINED_FUNCTION_16();
}

- (void)streamDidReceiveBatchTranslationStreamingResponse:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_4_2(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_3_4(&dword_2491B9000, "Translation error on %{public}@: %@", v4, v5);

  OUTLINED_FUNCTION_16();
}

- (void)streamDidReceiveBatchTranslationStreamingResponse:.cold.5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_11(v1, v2, v3, 1.5047e-36);
  OUTLINED_FUNCTION_9_2(&dword_2491B9000, "GRPC error %d: %@", v4, v5);

  OUTLINED_FUNCTION_16();
}

- (void)streamDidReceiveBatchTranslationStreamingResponse:.cold.6()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_2491B9000, v0, OS_LOG_TYPE_DEBUG, "NULL FTFinalBlazarResponse!", v1, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)streamDidReceiveBatchTranslationStreamingResponse:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Unrecognized message type from server recieved!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
