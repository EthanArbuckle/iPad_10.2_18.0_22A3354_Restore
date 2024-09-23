@implementation BEUIHandler

- (void)buildMenuWithBuilder:(id)a3 inWebView:(id)a4 atPoint:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  id v11;

  y = a5.y;
  x = a5.x;
  v11 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BEUIHandler delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v10, "buildMenuWithBuilder:inWebView:atPoint:") & 1) != 0)
    objc_msgSend(v10, "buildMenuWithBuilder:inWebView:atPoint:", v11, v9, x, y);

}

- (void)webView:(id)a3 runJavaScriptAlertPanelWithMessage:(id)a4 initiatedByFrame:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_2A1A8;
  v10[3] = &unk_378538;
  v11 = a4;
  v12 = a6;
  v10[4] = self;
  v8 = v11;
  v9 = v12;
  -[BEUIHandler _throttledRunJavaScriptAlertPanel:](self, "_throttledRunJavaScriptAlertPanel:", v10);

}

- (void)webView:(id)a3 runJavaScriptConfirmPanelWithMessage:(id)a4 initiatedByFrame:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_2A418;
  v10[3] = &unk_378538;
  v11 = a4;
  v12 = a6;
  v10[4] = self;
  v8 = v11;
  v9 = v12;
  -[BEUIHandler _throttledRunJavaScriptAlertPanel:](self, "_throttledRunJavaScriptAlertPanel:", v10);

}

- (void)webView:(id)a3 contextMenuConfigurationForElement:(id)a4 completionHandler:(id)a5
{
  -[BEUIHandler _handleContextMenuConfigurationForElement:completionHandler:](self, "_handleContextMenuConfigurationForElement:completionHandler:", a4, a5);
}

- (void)_webView:(id)a3 contextMenuConfigurationForElement:(id)a4 completionHandler:(id)a5
{
  -[BEUIHandler _handleContextMenuConfigurationForElement:completionHandler:](self, "_handleContextMenuConfigurationForElement:completionHandler:", a4, a5);
}

- (void)_webView:(id)a3 requestGeolocationPermissionForFrame:(id)a4 decisionHandler:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (id)_webView:(id)a3 adjustedDataInteractionItemProvidersForItemProvider:(id)a4 representingObjects:(id)a5 additionalData:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  __CFString *v20;
  void *v21;
  void *v22;
  id v24;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeImage, "identifier"));
  v13 = objc_msgSend(v10, "hasItemConformingToTypeIdentifier:", v12);

  if ((v13 & 1) != 0)
  {
    v14 = &__NSArray0__struct;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BEUIHandler delegate](self, "delegate"));
    v16 = v10;
    if (v11)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeUTF8PlainText, "identifier"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v17));

      v19 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v18, 4);
      if (objc_msgSend(v19, "length")
        && (objc_opt_respondsToSelector(v15, "handler:citationForText:webView:") & 1) != 0)
      {
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "handler:citationForText:webView:", self, v19, v9));
      }
      else
      {
        v20 = &stru_38FF08;
      }

    }
    else
    {
      v20 = &stru_38FF08;
    }
    if (-[__CFString length](v20, "length")
      && (objc_opt_respondsToSelector(v15, "adjustedItemProvidersWithCitation:withExcerptString:") & 1) != 0)
    {
      v24 = v16;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "adjustedItemProvidersWithCitation:withExcerptString:", v21, v20));

    }
    else
    {
      v22 = &__NSArray0__struct;
    }
    v14 = v22;

  }
  return v14;
}

- (void)_webView:(id)a3 didNotHandleTapAsClickAtPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  y = a4.y;
  x = a4.x;
  v13 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BEUIHandler delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v7, "handler:webView:didNotHandleTapAsClickAtPoint:") & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "be_contentView"));
    objc_msgSend(v8, "convertPoint:toView:", v13, x, y);
    v10 = v9;
    v12 = v11;

    objc_msgSend(v7, "handler:webView:didNotHandleTapAsClickAtPoint:", self, v13, v10, v12);
  }

}

- (void)_webViewDidEnterFullscreen:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BEUIHandler delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "webViewDidEnterFullscreen:") & 1) != 0)
    objc_msgSend(v4, "webViewDidEnterFullscreen:", v5);

}

- (void)_webViewDidExitFullscreen:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BEUIHandler delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "webViewDidExitFullscreen:") & 1) != 0)
    objc_msgSend(v4, "webViewDidExitFullscreen:", v5);

}

- (void)_webViewFullscreenMayReturnToInline:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BEUIHandler delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "webViewFullscreenMayReturnToInline:") & 1) != 0)
    objc_msgSend(v4, "webViewFullscreenMayReturnToInline:", v5);

}

- (id)_contextMenuHintPreviewContainerViewForWebView:(id)a3
{
  return objc_msgSend(a3, "window");
}

- (BUBlockCallThrottler)alertThrottler
{
  BUBlockCallThrottler *alertThrottler;
  BUBlockCallThrottler *v4;
  BUBlockCallThrottler *v5;

  alertThrottler = self->_alertThrottler;
  if (!alertThrottler)
  {
    v4 = (BUBlockCallThrottler *)objc_alloc_init((Class)BUBlockCallThrottler);
    v5 = self->_alertThrottler;
    self->_alertThrottler = v4;

    alertThrottler = self->_alertThrottler;
  }
  return alertThrottler;
}

- (void)_throttledRunJavaScriptAlertPanel:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[8];
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BEUIHandler alertThrottler](self, "alertThrottler"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_2AC18;
  v10[3] = &unk_378560;
  v6 = v4;
  v11 = v6;
  LOBYTE(v4) = objc_msgSend(v5, "runBlockThrottled:", v10);

  if ((v4 & 1) == 0)
  {
    v7 = _BookEPUBLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Suppressed JS alert panels", v9, 2u);
    }

    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

- (void)_handleContextMenuConfigurationForElement:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char *v8;
  Block_layout *v9;
  void *v10;
  void (**v11)(id, void *);

  v11 = (void (**)(id, void *))a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "linkURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_activatedElementInfo"));

  v8 = (char *)objc_msgSend(v7, "type");
  if (!v8)
  {
    if (BEURLHandlerSchemeIsOkForBookToLoad(v6))
    {
      v9 = &stru_3785A0;
      goto LABEL_6;
    }
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  if (v8 != (_BYTE *)&dword_0 + 1)
    goto LABEL_7;
  v9 = 0;
LABEL_6:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v9));
LABEL_8:
  v11[2](v11, v10);

}

- (BEUIHandlerDelegate)delegate
{
  return (BEUIHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setAlertThrottler:(id)a3
{
  objc_storeStrong((id *)&self->_alertThrottler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertThrottler, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
