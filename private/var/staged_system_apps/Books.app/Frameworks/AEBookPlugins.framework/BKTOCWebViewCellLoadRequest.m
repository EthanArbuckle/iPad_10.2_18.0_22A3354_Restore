@implementation BKTOCWebViewCellLoadRequest

+ (BKTOCWebViewCellLoadRequest)loadRequestWithHTML:(id)a3 maxSpan:(double)a4 selectedColor:(id)a5 baseURL:(id)a6 forObject:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  BKTOCWebViewCellLoadRequest *v15;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  v15 = -[BKTOCWebViewCellLoadRequest initWithHTML:maxSpan:selectedColor:baseURL:forObject:]([BKTOCWebViewCellLoadRequest alloc], "initWithHTML:maxSpan:selectedColor:baseURL:forObject:", v14, v13, v12, v11, a4);

  return v15;
}

+ (BKTOCWebViewCellLoadRequest)loadRequestWithContents:(id)a3 template:(id)a4 fontFamily:(id)a5 fontSize:(double)a6 maxSpan:(double)a7 textColor:(id)a8 selectedColor:(id)a9 backgroundColor:(id)a10 baseURL:(id)a11 forObject:(id)a12
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v36;
  uint64_t v37;
  _QWORD v38[6];
  _QWORD v39[6];

  v19 = a3;
  v20 = a5;
  v21 = a9;
  v22 = a11;
  v23 = a12;
  v24 = a10;
  v25 = a4;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a8, "bc_rgbaString"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bc_rgbaString"));

  v38[0] = CFSTR("contents");
  v38[1] = CFSTR("fontFamily");
  v36 = v19;
  v39[0] = v19;
  v39[1] = v20;
  v38[2] = CFSTR("fontSize");
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a6));
  v39[2] = v28;
  v38[3] = CFSTR("maxSpan");
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a7));
  v39[3] = v29;
  v39[4] = v26;
  v38[4] = CFSTR("textColor");
  v38[5] = CFSTR("backgroundColor");
  v39[5] = v27;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 6));

  v37 = 0;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "evaluateWithData:error:", v30, &v37));

  v32 = v37;
  if (!v25)
  {
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/Directory/Web Base TOC/BKTOCWebViewCellLoadRequest.m", 45, "+[BKTOCWebViewCellLoadRequest loadRequestWithContents:template:fontFamily:fontSize:maxSpan:textColor:selectedColor:backgroundColor:baseURL:forObject:]", "template", 0);
    if (!v32)
      goto LABEL_3;
LABEL_5:
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/Directory/Web Base TOC/BKTOCWebViewCellLoadRequest.m", 46, "+[BKTOCWebViewCellLoadRequest loadRequestWithContents:template:fontFamily:fontSize:maxSpan:textColor:selectedColor:backgroundColor:baseURL:forObject:]", "!templateEvaluationError", 0);
    goto LABEL_3;
  }
  if (v37)
    goto LABEL_5;
LABEL_3:
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "loadRequestWithHTML:maxSpan:selectedColor:baseURL:forObject:", v31, v21, v22, v23, a7, a1));

  return (BKTOCWebViewCellLoadRequest *)v33;
}

- (NSString)cacheKey
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;

  *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewCellLoadRequest htmlContentString](self, "htmlContentString", v3));
  -[BKTOCWebViewCellLoadRequest span](self, "span");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewCellLoadRequest baseURL](self, "baseURL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_generateCacheKey:maxSpan:baseURL:", v6, v9, v8));

  return (NSString *)v10;
}

+ (id)_generateCacheKey:(id)a3 maxSpan:(double)a4 baseURL:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a5;
  v8 = a3;
  v9 = objc_alloc((Class)NSString);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "absoluteString"));

  v12 = objc_msgSend(v9, "initWithFormat:", CFSTR("%@-%@-%@"), v8, v10, v11);
  return v12;
}

- (BKTOCWebViewCellLoadRequest)initWithHTML:(id)a3 maxSpan:(double)a4 selectedColor:(id)a5 baseURL:(id)a6 forObject:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  BKTOCWebViewCellLoadRequest *v16;
  NSString *v17;
  NSString *htmlContentString;
  UIColor *v19;
  UIColor *selectedColor;
  objc_super v22;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)BKTOCWebViewCellLoadRequest;
  v16 = -[BKTOCWebViewCellLoadRequest init](&v22, "init");
  if (v16)
  {
    v17 = (NSString *)objc_msgSend(v12, "copy");
    htmlContentString = v16->_htmlContentString;
    v16->_htmlContentString = v17;

    v16->_span = a4;
    objc_storeStrong((id *)&v16->_baseURL, a6);
    objc_storeWeak((id *)&v16->_requester, v15);
    if (v13)
      v19 = (UIColor *)v13;
    else
      v19 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor lightGrayColor](UIColor, "lightGrayColor"));
    selectedColor = v16->_selectedColor;
    v16->_selectedColor = v19;

  }
  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewCellLoadRequest htmlContentString](self, "htmlContentString", a3));
  -[BKTOCWebViewCellLoadRequest span](self, "span");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewCellLoadRequest selectedColor](self, "selectedColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewCellLoadRequest baseURL](self, "baseURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewCellLoadRequest requester](self, "requester"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKTOCWebViewCellLoadRequest loadRequestWithHTML:maxSpan:selectedColor:baseURL:forObject:](BKTOCWebViewCellLoadRequest, "loadRequestWithHTML:maxSpan:selectedColor:baseURL:forObject:", v4, v7, v8, v9, v6));

  return v10;
}

- (NSString)htmlContentString
{
  return self->_htmlContentString;
}

- (AEMinimalTemplate)htmlTemplate
{
  return self->_htmlTemplate;
}

- (double)span
{
  return self->_span;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (BKTOCWebViewCellLoadDelegate)requester
{
  return (BKTOCWebViewCellLoadDelegate *)objc_loadWeakRetained((id *)&self->_requester);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_requester);
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_htmlTemplate, 0);
  objc_storeStrong((id *)&self->_htmlContentString, 0);
}

@end
