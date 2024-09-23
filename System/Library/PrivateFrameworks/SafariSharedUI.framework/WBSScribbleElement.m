@implementation WBSScribbleElement

- (WBSScribbleElement)initWithTargetedElements:(id)a3 webView:(id)a4
{
  id v6;
  id v7;
  WBSScribbleElement *v8;
  WBSScribbleElement *v9;
  WBSScribbleElement *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WBSScribbleElement;
  v8 = -[WBSScribbleElement init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[WBSScribbleElement _setUpWithTargetedElements:webView:](v8, "_setUpWithTargetedElements:webView:", v6, v7);
    -[WBSScribbleElement _updateEdgeInsetsAndScaleWithWebView:](v9, "_updateEdgeInsetsAndScaleWithWebView:", v7);
    v10 = v9;
  }

  return v9;
}

- (void)_setUpWithTargetedElements:(id)a3 webView:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  void *v40;
  id v41;
  id v42;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t i;
  void *v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  void *v57;
  uint64_t v58;
  void *v59;
  __CFString *v60;
  NSString *v61;
  NSString *renderTreeText;
  NSString *v63;
  NSString *searchableText;
  NSString *v65;
  NSString *screenReaderText;
  id v67;
  NSArray *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t j;
  void *v74;
  void *v75;
  NSArray *allSelectorsIncludingShadowHosts;
  id v77;
  NSSet *v78;
  NSArray *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t k;
  void *v84;
  NSSet *mediaAndLinkURLs;
  NSArray *targetedElements;
  void *v87;
  id obj;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[4];
  id v94;
  id v95;
  uint64_t v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;

  v96 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v7;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = 0;
    v14 = *(_QWORD *)v90;
LABEL_3:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v90 != v14)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v15);
      if (!objc_msgSend(v16, "safari_isOutOfFlow"))
        break;
      v17 = objc_msgSend(v16, "isNearbyTarget");
      v12 += v17;
      v13 += v17 ^ 1;
      if (v11 == ++v15)
      {
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
        if (v11)
          goto LABEL_3;
        v18 = obj;

        if (v13 < v12)
        {
          objc_msgSend(obj, "firstObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v93[0] = MEMORY[0x1E0C809B0];
          v93[1] = 3221225472;
          v93[2] = __collectElementsToHide_block_invoke;
          v93[3] = &unk_1E5446C08;
          v94 = v19;
          v95 = v9;
          v20 = v19;
          objc_msgSend(obj, "safari_filterObjectsUsingBlock:", v93);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_21;
        }
        goto LABEL_12;
      }
    }
  }
  v18 = obj;

LABEL_12:
  objc_msgSend(v18, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bounds");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;

  v21 = (void *)objc_opt_new();
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v20 = v18;
  v31 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v90;
LABEL_14:
    v34 = 0;
    while (1)
    {
      if (*(_QWORD *)v90 != v33)
        objc_enumerationMutation(v20);
      v35 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v34);
      objc_msgSend(v35, "bounds");
      if (!targetedElementRectsAreSimilar(v24, v26, v28, v30, v36, v37, v38, v39)
        && !objc_msgSend(v35, "safari_isProbablyFullPageModalOverlay:", v9))
      {
        break;
      }
      objc_msgSend(v21, "addObject:", v35);
      if (v32 == ++v34)
      {
        v32 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
        if (v32)
          goto LABEL_14;
        break;
      }
    }
  }
LABEL_21:

  objc_msgSend(v21, "firstObject");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v21;
  v42 = v9;
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v47 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v90;
    v50 = 1;
    do
    {
      for (i = 0; i != v48; ++i)
      {
        if (*(_QWORD *)v90 != v49)
          objc_enumerationMutation(v41);
        v52 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
        if ((v50 & 1) != 0
          || (objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * i), "safari_isProbablyFullPageModalOverlay:", v42) & 1) == 0)
        {
          objc_msgSend(v52, "bounds");
          v99.origin.x = v53;
          v99.origin.y = v54;
          v99.size.width = v55;
          v99.size.height = v56;
          v97.origin.x = x;
          v97.origin.y = y;
          v97.size.width = width;
          v97.size.height = height;
          v98 = CGRectUnion(v97, v99);
          x = v98.origin.x;
          y = v98.origin.y;
          width = v98.size.width;
          height = v98.size.height;
        }
        v50 = 0;
      }
      v48 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
      v50 = 0;
    }
    while (v48);
  }

  self->_geometry.origin.x = x;
  self->_geometry.origin.y = y;
  self->_geometry.size.width = width;
  self->_geometry.size.height = height;
  objc_msgSend(v40, "selectors");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "firstObject");
  v58 = objc_claimAutoreleasedReturnValue();
  v59 = (void *)v58;
  if (v58)
    v60 = (__CFString *)v58;
  else
    v60 = &stru_1E5449658;
  objc_storeStrong((id *)&self->_selector, v60);

  objc_msgSend(v40, "renderedText");
  v61 = (NSString *)objc_claimAutoreleasedReturnValue();
  renderTreeText = self->_renderTreeText;
  self->_renderTreeText = v61;

  objc_msgSend(v40, "searchableText");
  v63 = (NSString *)objc_claimAutoreleasedReturnValue();
  searchableText = self->_searchableText;
  self->_searchableText = v63;

  objc_msgSend(v40, "screenReaderText");
  v65 = (NSString *)objc_claimAutoreleasedReturnValue();
  screenReaderText = self->_screenReaderText;
  self->_screenReaderText = v65;

  self->_anchor = objc_msgSend(v40, "offsetEdges");
  v87 = v40;
  self->_positionType = objc_msgSend(v40, "positionType");
  v67 = v41;
  v68 = (NSArray *)objc_opt_new();
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v69 = v67;
  v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
  if (v70)
  {
    v71 = v70;
    v72 = *(_QWORD *)v90;
    do
    {
      for (j = 0; j != v71; ++j)
      {
        if (*(_QWORD *)v90 != v72)
          objc_enumerationMutation(v69);
        objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * j), "selectorsIncludingShadowHosts");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "safari_mapObjectsUsingBlock:", &__block_literal_global_47);
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v75, "count"))
          -[NSArray addObject:](v68, "addObject:", v75);

      }
      v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
    }
    while (v71);
  }

  allSelectorsIncludingShadowHosts = self->_allSelectorsIncludingShadowHosts;
  self->_allSelectorsIncludingShadowHosts = v68;

  v77 = v69;
  v78 = (NSSet *)objc_opt_new();
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v79 = (NSArray *)v77;
  v80 = -[NSArray countByEnumeratingWithState:objects:count:](v79, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
  if (v80)
  {
    v81 = v80;
    v82 = *(_QWORD *)v90;
    do
    {
      for (k = 0; k != v81; ++k)
      {
        if (*(_QWORD *)v90 != v82)
          objc_enumerationMutation(v79);
        objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * k), "mediaAndLinkURLs");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v84, "count"))
          -[NSSet unionSet:](v78, "unionSet:", v84);

      }
      v81 = -[NSArray countByEnumeratingWithState:objects:count:](v79, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
    }
    while (v81);
  }

  mediaAndLinkURLs = self->_mediaAndLinkURLs;
  self->_mediaAndLinkURLs = v78;

  targetedElements = self->_targetedElements;
  self->_targetedElements = v79;

}

- (void)_updateEdgeInsetsAndScaleWithWebView:(id)a3
{
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  unint64_t anchor;
  double MaxY;
  double v14;
  double MaxX;
  id v16;
  CGRect v17;

  v16 = a3;
  objc_msgSend(v16, "bounds");
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  anchor = self->_anchor;
  if ((anchor & 1) != 0)
  {
    self->_edgeInsets.left = self->_geometry.origin.x;
    if ((anchor & 2) == 0)
    {
LABEL_3:
      if ((anchor & 4) == 0)
        goto LABEL_4;
LABEL_9:
      MaxX = CGRectGetMaxX(*(CGRect *)&v4);
      self->_edgeInsets.right = MaxX - CGRectGetMaxX(self->_geometry);
      if ((self->_anchor & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((anchor & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_edgeInsets.top = self->_geometry.origin.y;
  if ((anchor & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((anchor & 8) != 0)
  {
LABEL_5:
    v17.origin.x = v8;
    v17.origin.y = v9;
    v17.size.width = v10;
    v17.size.height = v11;
    MaxY = CGRectGetMaxY(v17);
    self->_edgeInsets.bottom = MaxY - CGRectGetMaxY(self->_geometry);
  }
LABEL_6:
  objc_msgSend(v16, "safari_zoomScale");
  self->_webViewZoomScale = v14;

}

- (WBSScribbleElement)initWithResult:(id)a3
{
  id v4;
  WBSScribbleElement *v5;
  void *v6;
  uint64_t v7;
  NSString *selector;
  uint64_t v9;
  NSString *tag;
  void *v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  CGFloat v16;
  void *v17;
  double v18;
  CGFloat v19;
  void *v20;
  CGFloat v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  NSURL *iframeSourceURL;
  uint64_t v28;
  NSString *iframeTitle;
  WBSScribbleElement *v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)WBSScribbleElement;
  v5 = -[WBSScribbleElement init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "safari_numberForKey:", CFSTR("requestID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_requestID = objc_msgSend(v6, "integerValue");

    objc_msgSend(v4, "safari_stringForKey:", CFSTR("cssPath"));
    v7 = objc_claimAutoreleasedReturnValue();
    selector = v5->_selector;
    v5->_selector = (NSString *)v7;

    objc_msgSend(v4, "safari_stringForKey:", CFSTR("tag"));
    v9 = objc_claimAutoreleasedReturnValue();
    tag = v5->_tag;
    v5->_tag = (NSString *)v9;

    objc_msgSend(v4, "safari_numberForKey:", CFSTR("x"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;
    objc_msgSend(v4, "safari_numberForKey:", CFSTR("y"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15;
    objc_msgSend(v4, "safari_numberForKey:", CFSTR("w"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v19 = v18;
    objc_msgSend(v4, "safari_numberForKey:", CFSTR("h"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v5->_geometry.origin.x = v13;
    v5->_geometry.origin.y = v16;
    v5->_geometry.size.width = v19;
    v5->_geometry.size.height = v21;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("embeddedIFrame"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = (void *)MEMORY[0x1E0C99E98];
      v24 = v22;
      objc_msgSend(v24, "safari_stringForKey:", CFSTR("src"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "URLWithString:", v25);
      v26 = objc_claimAutoreleasedReturnValue();
      iframeSourceURL = v5->_iframeSourceURL;
      v5->_iframeSourceURL = (NSURL *)v26;

      objc_msgSend(v24, "safari_stringForKey:", CFSTR("title"));
      v28 = objc_claimAutoreleasedReturnValue();

      iframeTitle = v5->_iframeTitle;
      v5->_iframeTitle = (NSString *)v28;

    }
    v30 = v5;

  }
  return v5;
}

- (WBSScribbleElement)initWithContentBlockerAction:(id)a3
{
  id v4;
  WBSScribbleElement *v5;
  uint64_t v6;
  NSString *selector;
  uint64_t v8;
  NSString *renderTreeText;
  uint64_t v10;
  NSString *searchableText;
  uint64_t v12;
  NSString *screenReaderText;
  uint64_t v14;
  NSString *imageAnalysisText;
  uint64_t v16;
  NSArray *allSelectorsIncludingShadowHosts;
  uint64_t v18;
  NSSet *mediaAndLinkURLs;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  WBSScribbleElement *v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)WBSScribbleElement;
  v5 = -[WBSScribbleElement init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "selector");
    v6 = objc_claimAutoreleasedReturnValue();
    selector = v5->_selector;
    v5->_selector = (NSString *)v6;

    objc_msgSend(v4, "renderTreeText");
    v8 = objc_claimAutoreleasedReturnValue();
    renderTreeText = v5->_renderTreeText;
    v5->_renderTreeText = (NSString *)v8;

    objc_msgSend(v4, "searchableText");
    v10 = objc_claimAutoreleasedReturnValue();
    searchableText = v5->_searchableText;
    v5->_searchableText = (NSString *)v10;

    objc_msgSend(v4, "screenReaderText");
    v12 = objc_claimAutoreleasedReturnValue();
    screenReaderText = v5->_screenReaderText;
    v5->_screenReaderText = (NSString *)v12;

    objc_msgSend(v4, "imageAnalysisText");
    v14 = objc_claimAutoreleasedReturnValue();
    imageAnalysisText = v5->_imageAnalysisText;
    v5->_imageAnalysisText = (NSString *)v14;

    v5->_anchor = objc_msgSend(v4, "edgeAnchors");
    objc_msgSend(v4, "allSelectorsIncludingShadowHosts");
    v16 = objc_claimAutoreleasedReturnValue();
    allSelectorsIncludingShadowHosts = v5->_allSelectorsIncludingShadowHosts;
    v5->_allSelectorsIncludingShadowHosts = (NSArray *)v16;

    objc_msgSend(v4, "mediaAndLinkURLs");
    v18 = objc_claimAutoreleasedReturnValue();
    mediaAndLinkURLs = v5->_mediaAndLinkURLs;
    v5->_mediaAndLinkURLs = (NSSet *)v18;

    v5->_positionType = objc_msgSend(v4, "positionType");
    objc_msgSend(v4, "bounds");
    v5->_geometry.origin.x = v20;
    v5->_geometry.origin.y = v21;
    v5->_geometry.size.width = v22;
    v5->_geometry.size.height = v23;
    objc_msgSend(v4, "typeString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_scribbleStrategy = objc_msgSend(v24, "isEqualToString:", *MEMORY[0x1E0D8A6D0]) ^ 1;

    objc_msgSend(v4, "edgeInsets");
    v5->_edgeInsets.left = v25;
    v5->_edgeInsets.top = v26;
    v5->_edgeInsets.right = v27;
    v5->_edgeInsets.bottom = v28;
    objc_msgSend(v4, "viewZoomScale");
    v5->_webViewZoomScale = v29;
    v30 = v5;
  }

  return v5;
}

- (WBSScribbleElement)initWithCoder:(id)a3
{
  id v4;
  WBSScribbleElement *v5;
  uint64_t v6;
  NSString *selector;
  uint64_t v8;
  NSString *tag;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  WBSScribbleElement *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WBSScribbleElement;
  v5 = -[WBSScribbleElement init](&v17, sel_init);
  if (v5)
  {
    v5->_requestID = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("requestID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cssPath"));
    v6 = objc_claimAutoreleasedReturnValue();
    selector = v5->_selector;
    v5->_selector = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tag"));
    v8 = objc_claimAutoreleasedReturnValue();
    tag = v5->_tag;
    v5->_tag = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("geometry"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "CGRectValue");
    v5->_geometry.origin.x = v11;
    v5->_geometry.origin.y = v12;
    v5->_geometry.size.width = v13;
    v5->_geometry.size.height = v14;
    v15 = v5;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t requestID_low;
  id v5;
  CGSize size;
  void *v7;
  _OWORD v8[2];

  requestID_low = LODWORD(self->_requestID);
  v5 = a3;
  objc_msgSend(v5, "encodeInt:forKey:", requestID_low, CFSTR("requestID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_selector, CFSTR("cssPath"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tag, CFSTR("tag"));
  size = self->_geometry.size;
  v8[0] = self->_geometry.origin;
  v8[1] = size;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v8, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("geometry"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[WBSScribbleElement tag](self, "tag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSScribbleElement selector](self, "selector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSScribbleElement iframeSourceURL](self, "iframeSourceURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("; (has iframe)");
  if (!v7)
    v8 = &stru_1E5449658;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p tag=%@; sel=%@%@>"), v4, self, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)makeContentBlockerAction
{
  id *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (id *)MEMORY[0x1E0D8A6D0];
  if (self->_scribbleStrategy)
    v3 = (id *)MEMORY[0x1E0D8A6D8];
  v4 = (objc_class *)MEMORY[0x1E0D8A220];
  v5 = *v3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithSelector:type:", self->_selector, v5);
  -[WBSScribbleElement crossSiteContentIfAvailable](self, "crossSiteContentIfAvailable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCrossSiteContentCandidate:", v7);

  objc_msgSend(v6, "setRenderTreeText:", self->_renderTreeText);
  objc_msgSend(v6, "setSearchableText:", self->_searchableText);
  objc_msgSend(v6, "setScreenReaderText:", self->_screenReaderText);
  objc_msgSend(v6, "setImageAnalysisText:", self->_imageAnalysisText);
  objc_msgSend(v6, "setEdgeAnchors:", self->_anchor);
  objc_msgSend(v6, "setAllSelectorsIncludingShadowHosts:", self->_allSelectorsIncludingShadowHosts);
  objc_msgSend(v6, "setMediaAndLinkURLs:", self->_mediaAndLinkURLs);

  objc_msgSend(v6, "setPositionType:", self->_positionType);
  objc_msgSend(v6, "setBounds:", self->_geometry.origin.x, self->_geometry.origin.y, self->_geometry.size.width, self->_geometry.size.height);
  objc_msgSend(v6, "setViewZoomScale:", self->_webViewZoomScale);
  objc_msgSend(v6, "setEdgeInsets:", self->_edgeInsets.left, self->_edgeInsets.top, self->_edgeInsets.right, self->_edgeInsets.bottom);
  return v6;
}

- (BOOL)isOutOfFlow
{
  return positionTypeIsOutOfFlow(-[WBSScribbleElement positionType](self, "positionType"));
}

- (WBSUserDefinedContentBlockerCrossSiteContent)crossSiteContentIfAvailable
{
  WBSUserDefinedContentBlockerCrossSiteContent *crossSiteContent;
  WBSUserDefinedContentBlockerCrossSiteContent *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  WBSUserDefinedContentBlockerCrossSiteContent *v10;
  WBSUserDefinedContentBlockerCrossSiteContent *v11;

  crossSiteContent = self->_crossSiteContent;
  if (crossSiteContent)
  {
    v3 = crossSiteContent;
  }
  else if (-[NSString length](self->_selector, "length") && self->_iframeSourceURL)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", self->_iframeSourceURL, 0);
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "setQuery:", 0);
      objc_msgSend(v6, "setFragment:", 0);
      objc_msgSend(v6, "URL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "absoluteString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[NSURL absoluteString](self->_iframeSourceURL, "absoluteString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_alloc(MEMORY[0x1E0D8A228]);
    v10 = (WBSUserDefinedContentBlockerCrossSiteContent *)objc_msgSend(v9, "initWithSource:title:extraAttributes:", v8, self->_iframeTitle, MEMORY[0x1E0C9AA70]);
    v11 = self->_crossSiteContent;
    self->_crossSiteContent = v10;

    v3 = self->_crossSiteContent;
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (CGPoint)hitTestLocationInWebView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v16;
  double v17;
  unint64_t anchor;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double left;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double MaxX;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat MaxY;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double top;
  double right;
  double bottom;
  CGFloat v40;
  CGFloat v41;
  double MidY;
  double MidX;
  CGPoint result;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  v41 = v5;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  x = self->_geometry.origin.x;
  y = self->_geometry.origin.y;
  width = self->_geometry.size.width;
  height = self->_geometry.size.height;
  v45.origin.x = x;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = height;
  MidX = CGRectGetMidX(v45);
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  MidY = CGRectGetMidY(v46);
  objc_msgSend(v4, "safari_zoomScale");
  v17 = v16;

  if (!-[WBSScribbleElement isOutOfFlow](self, "isOutOfFlow") || (v40 = v11, (anchor = self->_anchor) == 0))
  {
    v26 = MidX;
LABEL_12:
    v35 = MidY;
    goto LABEL_13;
  }
  top = self->_edgeInsets.top;
  right = self->_edgeInsets.right;
  bottom = self->_edgeInsets.bottom;
  v19 = x;
  v20 = y;
  v21 = width;
  v22 = height;
  if ((anchor & 1) != 0)
  {
    left = self->_edgeInsets.left;
    v47.origin.x = v19;
    v47.origin.y = v20;
    v47.size.width = v21;
    v47.size.height = v22;
    MidX = v17 * (left + CGRectGetWidth(v47) * 0.5);
    anchor = self->_anchor;
  }
  v24 = v7;
  if ((anchor & 2) != 0)
  {
    v48.origin.x = v19;
    v48.origin.y = v20;
    v48.size.width = v21;
    v48.size.height = v22;
    MidY = v17 * (top + CGRectGetHeight(v48) * 0.5);
    anchor = self->_anchor;
  }
  v25 = v9;
  v26 = MidX;
  if ((anchor & 4) != 0)
  {
    v49.size.height = v40;
    v49.origin.x = v41;
    v49.origin.y = v24;
    v49.size.width = v25;
    MaxX = CGRectGetMaxX(v49);
    v50.origin.x = v19;
    v50.origin.y = v20;
    v50.size.width = v21;
    v50.size.height = v22;
    v26 = MaxX - v17 * (right + CGRectGetWidth(v50) * 0.5);
    anchor = self->_anchor;
  }
  v29 = v40;
  v28 = v41;
  if ((anchor & 8) == 0)
    goto LABEL_12;
  v30 = v24;
  v31 = v25;
  MaxY = CGRectGetMaxY(*(CGRect *)&v28);
  v33 = v19;
  v34 = MaxY;
  v51.origin.x = v33;
  v51.origin.y = v20;
  v51.size.width = v21;
  v51.size.height = v22;
  v35 = v34 - v17 * (bottom + CGRectGetHeight(v51) * 0.5);
LABEL_13:
  v36 = v26;
  result.y = v35;
  result.x = v36;
  return result;
}

- (unint64_t)requestID
{
  return self->_requestID;
}

- (NSString)selector
{
  return self->_selector;
}

- (NSString)tag
{
  return self->_tag;
}

- (CGRect)geometry
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_geometry.origin.x;
  y = self->_geometry.origin.y;
  width = self->_geometry.size.width;
  height = self->_geometry.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSURL)iframeSourceURL
{
  return self->_iframeSourceURL;
}

- (void)setIframeSourceURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)iframeTitle
{
  return self->_iframeTitle;
}

- (void)setIframeTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)renderTreeText
{
  return self->_renderTreeText;
}

- (void)setRenderTreeText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)imageAnalysisText
{
  return self->_imageAnalysisText;
}

- (void)setImageAnalysisText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)searchableText
{
  return self->_searchableText;
}

- (void)setSearchableText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)screenReaderText
{
  return self->_screenReaderText;
}

- (void)setScreenReaderText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (unint64_t)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(unint64_t)a3
{
  self->_anchor = a3;
}

- (int64_t)positionType
{
  return self->_positionType;
}

- (void)setPositionType:(int64_t)a3
{
  self->_positionType = a3;
}

- (NSArray)allSelectorsIncludingShadowHosts
{
  return self->_allSelectorsIncludingShadowHosts;
}

- (void)setAllSelectorsIncludingShadowHosts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSSet)mediaAndLinkURLs
{
  return self->_mediaAndLinkURLs;
}

- (void)setMediaAndLinkURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (int64_t)scribbleStrategy
{
  return self->_scribbleStrategy;
}

- (void)setScribbleStrategy:(int64_t)a3
{
  self->_scribbleStrategy = a3;
}

- (NSArray)targetedElements
{
  return self->_targetedElements;
}

- (void)setTargetedElements:(id)a3
{
  objc_storeStrong((id *)&self->_targetedElements, a3);
}

- (BOOL)restoredFromGlobalRule
{
  return self->_restoredFromGlobalRule;
}

- (void)setRestoredFromGlobalRule:(BOOL)a3
{
  self->_restoredFromGlobalRule = a3;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)edgeInsets
{
  double left;
  double top;
  double right;
  double bottom;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  left = self->_edgeInsets.left;
  top = self->_edgeInsets.top;
  right = self->_edgeInsets.right;
  bottom = self->_edgeInsets.bottom;
  result.var3 = bottom;
  result.var2 = right;
  result.var1 = top;
  result.var0 = left;
  return result;
}

- (double)webViewZoomScale
{
  return self->_webViewZoomScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetedElements, 0);
  objc_storeStrong((id *)&self->_mediaAndLinkURLs, 0);
  objc_storeStrong((id *)&self->_allSelectorsIncludingShadowHosts, 0);
  objc_storeStrong((id *)&self->_screenReaderText, 0);
  objc_storeStrong((id *)&self->_searchableText, 0);
  objc_storeStrong((id *)&self->_imageAnalysisText, 0);
  objc_storeStrong((id *)&self->_renderTreeText, 0);
  objc_storeStrong((id *)&self->_iframeTitle, 0);
  objc_storeStrong((id *)&self->_iframeSourceURL, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_selector, 0);
  objc_storeStrong((id *)&self->_crossSiteContent, 0);
}

@end
