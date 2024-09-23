@implementation BKPaginationLayoutJob

+ (id)jobName
{
  return CFSTR("BKPaginationLayoutJob");
}

- (BKPaginationLayoutJob)init
{
  BKPaginationLayoutJob *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKPaginationLayoutJob;
  v2 = -[BKPaginationBatchJob init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKPaginationLayoutJob jobName](BKPaginationLayoutJob, "jobName"));
    -[BKJob setName:](v2, "setName:", v3);

  }
  return v2;
}

- (void)copyState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BKPaginationLayoutJob;
  v4 = a3;
  -[BKPaginationBatchJob copyState:](&v14, "copyState:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "href", v14.receiver, v14.super_class));
  -[BKPaginationLayoutJob setHref:](self, "setHref:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
  -[BKPaginationLayoutJob setUrl:](self, "setUrl:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bookmarks"));
  -[BKPaginationLayoutJob setBookmarks:](self, "setBookmarks:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationInfoAnchors"));
  -[BKPaginationLayoutJob setNavigationInfoAnchors:](self, "setNavigationInfoAnchors:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "landmarkAnchors"));
  -[BKPaginationLayoutJob setLandmarkAnchors:](self, "setLandmarkAnchors:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "physicalPageAnchors"));
  -[BKPaginationLayoutJob setPhysicalPageAnchors:](self, "setPhysicalPageAnchors:", v10);

  -[BKPaginationLayoutJob setDocumentOrdinal:](self, "setDocumentOrdinal:", objc_msgSend(v4, "documentOrdinal"));
  objc_msgSend(v4, "contentLayoutSize");
  -[BKPaginationLayoutJob setContentLayoutSize:](self, "setContentLayoutSize:");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bookSnapshot"));
  -[BKPaginationLayoutJob setBookSnapshot:](self, "setBookSnapshot:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotationsToUpgrade"));
  -[BKPaginationLayoutJob setAnnotationsToUpgrade:](self, "setAnnotationsToUpgrade:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotationCFIStrings"));
  -[BKPaginationLayoutJob setAnnotationCFIStrings:](self, "setAnnotationCFIStrings:", v13);

}

- (void)copyBatchState:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKPaginationLayoutJob;
  v4 = a3;
  -[BKPaginationBatchJob copyState:](&v10, "copyState:", v4);
  -[BKPaginationLayoutJob setHref:](self, "setHref:", 0, v10.receiver, v10.super_class);
  -[BKPaginationLayoutJob setUrl:](self, "setUrl:", 0);
  -[BKPaginationLayoutJob setBookmarks:](self, "setBookmarks:", 0);
  -[BKPaginationLayoutJob setNavigationInfoAnchors:](self, "setNavigationInfoAnchors:", 0);
  -[BKPaginationLayoutJob setLandmarkAnchors:](self, "setLandmarkAnchors:", 0);
  -[BKPaginationLayoutJob setPhysicalPageAnchors:](self, "setPhysicalPageAnchors:", 0);
  -[BKPaginationLayoutJob setDocumentOrdinal:](self, "setDocumentOrdinal:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
  -[BKPaginationBatchJob setConfiguration:](self, "setConfiguration:", v5);

  objc_msgSend(v4, "pageSize");
  v7 = v6;
  v9 = v8;

  -[BKPaginationLayoutJob setContentLayoutSize:](self, "setContentLayoutSize:", v7, v9);
  -[BKPaginationLayoutJob setBookSnapshot:](self, "setBookSnapshot:", 0);
  -[BKPaginationLayoutJob setAnnotationsToUpgrade:](self, "setAnnotationsToUpgrade:", 0);
  -[BKPaginationLayoutJob setAnnotationCFIStrings:](self, "setAnnotationCFIStrings:", 0);
}

- (NSString)href
{
  return self->_href;
}

- (void)setHref:(id)a3
{
  objc_storeStrong((id *)&self->_href, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSArray)bookmarks
{
  return self->_bookmarks;
}

- (void)setBookmarks:(id)a3
{
  objc_storeStrong((id *)&self->_bookmarks, a3);
}

- (NSArray)navigationInfoAnchors
{
  return self->_navigationInfoAnchors;
}

- (void)setNavigationInfoAnchors:(id)a3
{
  objc_storeStrong((id *)&self->_navigationInfoAnchors, a3);
}

- (NSArray)landmarkAnchors
{
  return self->_landmarkAnchors;
}

- (void)setLandmarkAnchors:(id)a3
{
  objc_storeStrong((id *)&self->_landmarkAnchors, a3);
}

- (NSArray)physicalPageAnchors
{
  return self->_physicalPageAnchors;
}

- (void)setPhysicalPageAnchors:(id)a3
{
  objc_storeStrong((id *)&self->_physicalPageAnchors, a3);
}

- (int)documentOrdinal
{
  return self->_documentOrdinal;
}

- (void)setDocumentOrdinal:(int)a3
{
  self->_documentOrdinal = a3;
}

- (AEBookInfoSnapshot)bookSnapshot
{
  return self->_bookSnapshot;
}

- (void)setBookSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_bookSnapshot, a3);
}

- (CGSize)contentLayoutSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentLayoutSize.width;
  height = self->_contentLayoutSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContentLayoutSize:(CGSize)a3
{
  self->_contentLayoutSize = a3;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (NSArray)annotationsToUpgrade
{
  return self->_annotationsToUpgrade;
}

- (void)setAnnotationsToUpgrade:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSDictionary)annotationCFIStrings
{
  return self->_annotationCFIStrings;
}

- (void)setAnnotationCFIStrings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationCFIStrings, 0);
  objc_storeStrong((id *)&self->_annotationsToUpgrade, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_bookSnapshot, 0);
  objc_storeStrong((id *)&self->_physicalPageAnchors, 0);
  objc_storeStrong((id *)&self->_landmarkAnchors, 0);
  objc_storeStrong((id *)&self->_navigationInfoAnchors, 0);
  objc_storeStrong((id *)&self->_bookmarks, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_href, 0);
}

@end
