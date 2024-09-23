@implementation _BEFixedLayoutWKWebView

- (void)setFrame:(CGRect)a3
{
  _QWORD *v4;
  _QWORD v5[5];
  CGRect v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_C8E0;
  v5[3] = &unk_377A20;
  v6 = a3;
  v5[4] = self;
  v4 = objc_retainBlock(v5);
  if (-[BEWKWebView be_finishedInit](self, "be_finishedInit"))
  {
    -[_BEFixedLayoutWKWebView _beginAnimatedResizeWithUpdates:](self, "_beginAnimatedResizeWithUpdates:", v4);
    -[_BEFixedLayoutWKWebView _endAnimatedResize](self, "_endAnimatedResize");
  }
  else
  {
    ((void (*)(_QWORD *))v4[2])(v4);
  }

}

- (void)be_applyMetaViewportOverridesForFixedLayoutSize:(CGSize)a3
{
  id v4;

  if (a3.height > 0.0 && a3.width > 0.0)
  {
    -[_BEFixedLayoutWKWebView setBe_fixedLayoutSize:](self, "setBe_fixedLayoutSize:");
    -[_BEFixedLayoutWKWebView setBe_minScale:](self, "setBe_minScale:", 0.01);
    -[_BEFixedLayoutWKWebView setBe_maxScale:](self, "setBe_maxScale:", 10.0);
  }
  v4 = (id)objc_claimAutoreleasedReturnValue(-[_BEFixedLayoutWKWebView be_viewportArguments](self, "be_viewportArguments"));
  -[_BEFixedLayoutWKWebView _overrideViewportWithArguments:](self, "_overrideViewportWithArguments:", v4);

}

- (void)be_applyViewportArgumentsIfNeeded
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  objc_super v10;

  -[_BEFixedLayoutWKWebView be_initialScale](self, "be_initialScale");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_BEFixedLayoutWKWebView currentInitialScaleString](self, "currentInitialScaleString"));
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_BEFixedLayoutWKWebView be_viewportArgumentsAtScale:](self, "be_viewportArgumentsAtScale:", v4));
    v10.receiver = self;
    v10.super_class = (Class)_BEFixedLayoutWKWebView;
    -[_BEFixedLayoutWKWebView _overrideViewportWithArguments:](&v10, "_overrideViewportWithArguments:", v9);

  }
}

- (double)be_initialScale
{
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double width;
  CGFloat v12;
  double height;
  double result;
  CGRect v15;
  CGRect v16;

  -[_BEFixedLayoutWKWebView frame](self, "frame");
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  width = self->_be_fixedLayoutSize.width;
  v12 = 0.0;
  if (width > 0.0)
    v12 = CGRectGetWidth(*(CGRect *)&v3) / width;
  height = self->_be_fixedLayoutSize.height;
  if (height > 0.0)
  {
    v15.origin.x = v7;
    v15.origin.y = v8;
    v15.size.width = v9;
    v15.size.height = v10;
    if (v12 * height < CGRectGetHeight(v15))
    {
      v16.origin.x = v7;
      v16.origin.y = v8;
      v16.size.width = v9;
      v16.size.height = v10;
      v12 = CGRectGetHeight(v16) / height;
    }
  }
  result = self->_be_minScale;
  if (v12 >= result)
    result = v12;
  if (result >= self->_be_maxScale)
    return self->_be_maxScale;
  return result;
}

- (id)be_viewportArguments
{
  -[_BEFixedLayoutWKWebView be_initialScale](self, "be_initialScale");
  return -[_BEFixedLayoutWKWebView be_viewportArgumentsAtScale:](self, "be_viewportArgumentsAtScale:");
}

- (id)be_viewportArgumentsAtScale:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[7];
  _QWORD v17[7];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));

  -[_BEFixedLayoutWKWebView setCurrentInitialScaleString:](self, "setCurrentInitialScaleString:", v5);
  v17[0] = v5;
  v16[0] = CFSTR("initial-scale");
  v16[1] = CFSTR("width");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_be_fixedLayoutSize.width));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));
  v17[1] = v7;
  v16[2] = CFSTR("height");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_be_fixedLayoutSize.height));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringValue"));
  v17[2] = v9;
  v17[3] = CFSTR("no");
  v16[3] = CFSTR("user-scalable");
  v16[4] = CFSTR("minimum-scale");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_be_minScale));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
  v17[4] = v11;
  v16[5] = CFSTR("maximum-scale");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_be_maxScale));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringValue"));
  v16[6] = CFSTR("shrink-to-fit");
  v17[5] = v13;
  v17[6] = CFSTR("yes");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 7));

  return v14;
}

- (CGRect)_visibleContentRect
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  CGFloat x;
  double v11;
  CGFloat y;
  double v13;
  CGFloat width;
  double v15;
  CGFloat height;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  id v29;
  NSObject *v30;
  NSString *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  objc_super v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  uint64_t v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect result;
  CGRect v46;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_BEFixedLayoutWKWebView scrollView](self, "scrollView"));
  objc_msgSend(v3, "zoomScale");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_BEFixedLayoutWKWebView _scroller](self, "_scroller"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_BEFixedLayoutWKWebView be_contentView](self, "be_contentView"));
    objc_msgSend(v6, "zoomScale");
    if (v8 == 1.0)
    {
      objc_msgSend(v7, "bounds");
      x = v9;
      y = v11;
      width = v13;
      height = v15;
    }
    else
    {
      objc_msgSend(v6, "visibleBounds");
      objc_msgSend(v7, "convertRect:fromView:", v6);
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;
      objc_msgSend(v7, "bounds");
      v46.origin.x = v22;
      v46.origin.y = v24;
      v46.size.width = v26;
      v46.size.height = v28;
      v43 = CGRectIntersection(v42, v46);
      x = v43.origin.x;
      y = v43.origin.y;
      width = v43.size.width;
      height = v43.size.height;
      v29 = _BookEPUBLog();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        v44.origin.x = x;
        v44.origin.y = y;
        v44.size.width = width;
        v44.size.height = height;
        v31 = NSStringFromCGRect(v44);
        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        *(_DWORD *)buf = 138412546;
        v39 = v32;
        v40 = 2048;
        v41 = v5;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEBUG, "{WebViewLifeCycle} webView new visibleFrame %@ at scale %f", buf, 0x16u);

      }
    }

  }
  else
  {
    v37.receiver = self;
    v37.super_class = (Class)_BEFixedLayoutWKWebView;
    -[BEWKWebView _visibleContentRect](&v37, "_visibleContentRect");
    x = v17;
    y = v18;
    width = v19;
    height = v20;
  }

  v33 = x;
  v34 = y;
  v35 = width;
  v36 = height;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (CGSize)be_fixedLayoutSize
{
  double width;
  double height;
  CGSize result;

  width = self->_be_fixedLayoutSize.width;
  height = self->_be_fixedLayoutSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setBe_fixedLayoutSize:(CGSize)a3
{
  self->_be_fixedLayoutSize = a3;
}

- (double)be_minScale
{
  return self->_be_minScale;
}

- (void)setBe_minScale:(double)a3
{
  self->_be_minScale = a3;
}

- (double)be_maxScale
{
  return self->_be_maxScale;
}

- (void)setBe_maxScale:(double)a3
{
  self->_be_maxScale = a3;
}

- (NSString)currentInitialScaleString
{
  return self->_currentInitialScaleString;
}

- (void)setCurrentInitialScaleString:(id)a3
{
  objc_storeStrong((id *)&self->_currentInitialScaleString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentInitialScaleString, 0);
}

@end
