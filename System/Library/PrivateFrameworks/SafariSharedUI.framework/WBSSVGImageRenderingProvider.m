@implementation WBSSVGImageRenderingProvider

- (BOOL)canHandleRequest:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_requestIsValid:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "safari_isHTTPFamilyURL") & 1) != 0
    || (objc_msgSend(v4, "isFileURL") & 1) != 0
    || (objc_msgSend(v3, "svgContent"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "length"),
        v5,
        v6))
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v3, "urls");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v17 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            if ((objc_msgSend(v15, "safari_isHTTPFamilyURL", (_QWORD)v16) & 1) == 0
              && !objc_msgSend(v15, "isFileURL"))
            {
              v7 = 0;
              goto LABEL_19;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v12)
            continue;
          break;
        }
      }
      v7 = 1;
LABEL_19:

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (id)responseForRequest:(id)a3 willProvideUpdates:(BOOL *)a4
{
  *a4 = -[WBSSVGImageRenderingProvider _requestIsValid:](self, "_requestIsValid:", a3);
  return 0;
}

- (void)prepareResponseForRequest:(id)a3 allowDelayedResponse:(BOOL)a4
{
  id v5;
  id WeakRetained;
  id v7;
  _QWORD v8[4];
  id v9;
  WBSSVGImageRenderingProvider *v10;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__WBSSVGImageRenderingProvider_prepareResponseForRequest_allowDelayedResponse___block_invoke;
  v8[3] = &unk_1E5446850;
  v9 = v5;
  v10 = self;
  v7 = v5;
  objc_msgSend(WeakRetained, "siteMetadataProvider:didReceiveResponse:forRequest:beginOperationUsingBlock:", self, 0, v7, v8);

}

WBSSVGImageRenderingFetchOperation *__79__WBSSVGImageRenderingProvider_prepareResponseForRequest_allowDelayedResponse___block_invoke(int8x16_t *a1)
{
  WBSSVGImageRenderingFetchOperation *v2;
  WBSSVGImageRenderingFetchOperation *v3;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;

  v2 = [WBSSVGImageRenderingFetchOperation alloc];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__WBSSVGImageRenderingProvider_prepareResponseForRequest_allowDelayedResponse___block_invoke_2;
  v6[3] = &unk_1E5446828;
  v5 = a1[2];
  v7 = vextq_s8(v5, v5, 8uLL);
  v3 = -[WBSSVGImageRenderingFetchOperation initWithRequest:completionHandler:](v2, "initWithRequest:completionHandler:", (id)v5.i64[0], v6);
  -[WBSWebViewMetadataFetchOperation setDelegate:](v3, "setDelegate:", a1[2].i64[1]);

  return v3;
}

void __79__WBSSVGImageRenderingProvider_prepareResponseForRequest_allowDelayedResponse___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "siteMetadataProvider:didReceiveResponse:ofType:didReceiveNewData:forRequest:", *(_QWORD *)(a1 + 32), v4, 0, 0, *(_QWORD *)(a1 + 40));

}

- (void)webViewMetadataFetchOperation:(id)a3 getWebViewOfSize:(CGSize)a4 withConfiguration:(id)a5 completionHandler:(id)a6
{
  double height;
  double width;
  WBSSiteMetadataProviderDelegate **p_providerDelegate;
  id v11;
  id v12;
  id WeakRetained;

  height = a4.height;
  width = a4.width;
  p_providerDelegate = &self->_providerDelegate;
  v11 = a6;
  v12 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_providerDelegate);
  objc_msgSend(WeakRetained, "siteMetadataProvider:getWebViewOfSize:withConfiguration:completionHandler:", self, v12, v11, width, height);

}

- (void)webViewMetadataFetchOperation:(id)a3 didFinishUsingWebView:(id)a4
{
  WBSSiteMetadataProviderDelegate **p_providerDelegate;
  id v6;
  id WeakRetained;

  p_providerDelegate = &self->_providerDelegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_providerDelegate);
  objc_msgSend(WeakRetained, "siteMetadataProvider:didFinishUsingWebView:", self, v6);

}

- (WBSSiteMetadataProviderDelegate)providerDelegate
{
  return (WBSSiteMetadataProviderDelegate *)objc_loadWeakRetained((id *)&self->_providerDelegate);
}

- (void)setProviderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_providerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_providerDelegate);
}

@end
