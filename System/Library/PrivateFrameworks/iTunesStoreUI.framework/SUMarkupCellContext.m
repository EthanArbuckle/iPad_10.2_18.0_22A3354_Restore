@implementation SUMarkupCellContext

- (void)dealloc
{
  __CFDictionary *webViewCache;
  objc_super v4;

  self->_stylesheet = 0;
  webViewCache = self->_webViewCache;
  if (webViewCache)
  {
    CFRelease(webViewCache);
    self->_webViewCache = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SUMarkupCellContext;
  -[SUItemCellContext dealloc](&v4, sel_dealloc);
}

- (id)webViewForMarkup:(id)a3
{
  __CFDictionary *webViewCache;
  SUWebDocumentView *Value;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  webViewCache = self->_webViewCache;
  if (!webViewCache)
  {
    webViewCache = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x24BDBD6B0]);
    self->_webViewCache = webViewCache;
  }
  Value = (SUWebDocumentView *)CFDictionaryGetValue(webViewCache, a3);
  if (!Value)
  {
    -[SUMarkupCellContext webViewWidth](self, "webViewWidth");
    v8 = v7;
    Value = -[SUWebDocumentView initWithFrame:]([SUWebDocumentView alloc], "initWithFrame:", 0.0, 0.0, v7, 1.0);
    -[SUWebDocumentView setViewportSize:forDocumentTypes:](Value, "setViewportSize:forDocumentTypes:", 0xFFFFFFLL, v8, *MEMORY[0x24BDF7FC0]);
    -[SUWebDocumentView setDrawsBackground:](Value, "setDrawsBackground:", 0);
    -[SUWebDocumentView setIgnoresKeyEvents:](Value, "setIgnoresKeyEvents:", 1);
    -[SUWebDocumentView setIgnoresFocusingMouse:](Value, "setIgnoresFocusingMouse:", 1);
    -[SUWebDocumentView setLoadDelegate:](Value, "setLoadDelegate:", self);
    -[SUWebDocumentView setLoadsSynchronously:](Value, "setLoadsSynchronously:", 1);
    -[SUWebDocumentView setUserInteractionEnabled:](Value, "setUserInteractionEnabled:", 0);
    CFDictionarySetValue(self->_webViewCache, a3, Value);
    self->_pendingWebViewLoads += 2;
    -[SUWebDocumentView setStylesheet:](Value, "setStylesheet:", -[SUMarkupCellContext stylesheet](self, "stylesheet"));
    -[SUWebDocumentView setHTMLFragment:](Value, "setHTMLFragment:", a3);
    -[SUWebDocumentView frame](Value, "frame");
    v10 = v9;
    v12 = v11;
    -[SUWebDocumentView documentBounds](Value, "documentBounds");
    -[SUWebDocumentView setFrame:](Value, "setFrame:", v10, v12);

  }
  return Value;
}

- (void)webViewDidFinishLoading:(id)a3
{
  int64_t pendingWebViewLoads;
  BOOL v4;
  BOOL v5;
  int64_t v6;

  pendingWebViewLoads = self->_pendingWebViewLoads;
  v4 = pendingWebViewLoads == 1;
  v5 = pendingWebViewLoads < 1;
  v6 = pendingWebViewLoads - 1;
  if (!v5)
  {
    self->_pendingWebViewLoads = v6;
    if (v4)
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3), "postNotificationName:object:", CFSTR("SUMarkupCellContextLoadedAllWebViewsNotifications"), 0);
  }
}

- (NSString)stylesheet
{
  return self->_stylesheet;
}

- (void)setStylesheet:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (double)webViewWidth
{
  return self->_webViewWidth;
}

- (void)setWebViewWidth:(double)a3
{
  self->_webViewWidth = a3;
}

@end
