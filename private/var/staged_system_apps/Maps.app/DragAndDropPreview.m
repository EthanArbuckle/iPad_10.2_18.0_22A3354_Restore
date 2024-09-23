@implementation DragAndDropPreview

- (DragAndDropPreview)init
{
  -[DragAndDropPreview doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (DragAndDropPreview)initWithDragAndDropMapItem:(id)a3 traitCollection:(id)a4
{
  id v7;
  id v8;
  DragAndDropPreview *v9;
  DragAndDropPreview *v10;
  DragAndDropAnchorView *v11;
  DragAndDropAnchorView *anchorView;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DragAndDropPreview;
  v9 = -[DragAndDropPreview init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dragItem, a3);
    -[DragAndDropMapItem setObserver:](v10->_dragItem, "setObserver:", v10);
    objc_storeStrong((id *)&v10->_traitCollection, a4);
    v11 = -[DragAndDropAnchorView initWithDragAndDropMapItem:previewTraitCollection:]([DragAndDropAnchorView alloc], "initWithDragAndDropMapItem:previewTraitCollection:", v7, v8);
    anchorView = v10->_anchorView;
    v10->_anchorView = v11;

    -[DragAndDropAnchorView setContentUpdateDelegate:](v10->_anchorView, "setContentUpdateDelegate:", v10);
    -[DragAndDropPreview createSnapshot](v10, "createSnapshot");
  }

  return v10;
}

- (id)dragFeatures
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropPreview mapItem](self, "mapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DragCustomFeature customFeatureForMapItem:](_DragCustomFeature, "customFeatureForMapItem:", v2));
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  return v4;
}

- (id)mapItem
{
  MKMapItem *resolvedMapItem;

  resolvedMapItem = self->_resolvedMapItem;
  if (resolvedMapItem)
    return resolvedMapItem;
  else
    return (id)objc_claimAutoreleasedReturnValue(-[DragAndDropMapItem originalMapItem](self->_dragItem, "originalMapItem"));
}

- (void)createSnapshot
{
  void *v3;
  UIUserInterfaceIdiom v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  DragAndDropPreview *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropPreview mapItem](self, "mapItem"));
  if (v3 && !self->_snapshotStarted)
  {
    v16 = v3;
    v4 = -[UITraitCollection userInterfaceIdiom](self->_traitCollection, "userInterfaceIdiom");

    if (v4 != UIUserInterfaceIdiomMac)
    {
      self->_snapshotStarted = 1;
      kdebug_trace(731618372, 0, 0, 0, 0);
      v5 = objc_alloc_init((Class)MKMapSnapshotOptions);
      objc_msgSend(v5, "setMapType:", 0);
      objc_msgSend(v5, "setSize:", 206.0, 104.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropPreview mapItem](self, "mapItem"));
      -[DragAndDropPreview presentationMapRectForMapItem:](self, "presentationMapRectForMapItem:", v6);
      objc_msgSend(v5, "setMapRect:");

      objc_msgSend(v5, "_setRendersInBackground:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropPreview dragFeatures](self, "dragFeatures"));
      objc_msgSend(v5, "_setCustomFeatureAnnotations:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKPointOfInterestFilter filterIncludingAllCategories](MKPointOfInterestFilter, "filterIncludingAllCategories"));
      objc_msgSend(v5, "setPointOfInterestFilter:", v8);

      objc_msgSend(v5, "_setSearchResultsType:", 1);
      objc_msgSend(v5, "_setUseSnapshotService:", 0);
      objc_msgSend(v5, "_setShowsNightMode:", (id)-[UITraitCollection userInterfaceStyle](self->_traitCollection, "userInterfaceStyle") == (id)2);
      v9 = objc_msgSend(objc_alloc((Class)MKMapSnapshotter), "initWithOptions:", v5);
      v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INTERACTIVE, 0);
      v13 = objc_claimAutoreleasedReturnValue(v12);

      v14 = dispatch_queue_create("dragPreviewRender", v13);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100C7533C;
      block[3] = &unk_1011AC8B0;
      v18 = v9;
      v19 = self;
      v15 = v9;
      dispatch_async(v14, block);

    }
  }
  else
  {

  }
}

- (void)updateWithSnapshot:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_snapshotImage, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[DragAndDropPreview contentUpdateDelegate](self, "contentUpdateDelegate"));
  objc_msgSend(v4, "dragAndDropPreviewDidUpdate:", self);

}

- (id)imageRepresentation
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[17];

  -[DragAndDropAnchorView intrinsicContentSize](self->_anchorView, "intrinsicContentSize");
  v4 = v3;
  if ((id)-[UITraitCollection userInterfaceIdiom](self->_traitCollection, "userInterfaceIdiom") == (id)5)
    v5 = 0.0;
  else
    v5 = 104.0;
  if ((id)-[UITraitCollection userInterfaceIdiom](self->_traitCollection, "userInterfaceIdiom") == (id)5)
    v6 = 200.0;
  else
    v6 = 206.0;
  -[DragAndDropAnchorView setFrame:](self->_anchorView, "setFrame:", 0.0, v5, v6, v4);
  -[DragAndDropAnchorView layoutIfNeeded](self->_anchorView, "layoutIfNeeded");
  v7 = objc_alloc((Class)UIGraphicsImageRenderer);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIGraphicsImageRendererFormat formatForTraitCollection:](UIGraphicsImageRendererFormat, "formatForTraitCollection:", self->_traitCollection));
  v9 = objc_msgSend(v7, "initWithSize:format:", v8, v6, v4 + v5);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100C75654;
  v12[3] = &unk_1011EA6A8;
  v12[5] = 0;
  v12[6] = 0;
  v12[4] = self;
  *(double *)&v12[7] = v6;
  *(double *)&v12[8] = v4 + v5;
  v12[9] = 0;
  *(double *)&v12[10] = v5;
  *(double *)&v12[11] = v6;
  *(double *)&v12[12] = v4;
  v12[13] = 0;
  v12[14] = 0;
  *(double *)&v12[15] = v6;
  *(double *)&v12[16] = v5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageWithActions:", v12));

  return v10;
}

- ($C79183323B9A0D5602617FF3BE5395AC)presentationMapRectForMapItem:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  $C79183323B9A0D5602617FF3BE5395AC result;

  objc_msgSend(a3, "_coordinate");
  v5 = MKMapRectMakeWithRadialDistance(v3, v4, 350.0);
  v9 = objc_msgSend(objc_alloc((Class)GEOMapRegion), "initWithMapRect:", v5, v6, v7, v8);
  v11 = GEOMapRectForMapRegion(v9, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.var1.var1 = v21;
  result.var1.var0 = v20;
  result.var0.var1 = v19;
  result.var0.var0 = v18;
  return result;
}

- (DragAndDropPreviewImage)renderPreviewImage
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  DragAndDropPreviewImage *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropPreview imageRepresentation](self, "imageRepresentation"));
  objc_msgSend(v2, "size");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v3, v4, 13.0));
  v6 = objc_alloc_init(DragAndDropPreviewImage);
  -[DragAndDropPreviewImage setImage:](v6, "setImage:", v2);
  -[DragAndDropPreviewImage setVisiblePath:](v6, "setVisiblePath:", v5);
  -[DragAndDropPreviewImage setCornerRadius:](v6, "setCornerRadius:", 13.0);

  return v6;
}

- (void)dragAndDropItem:(id)a3 didResolveMapItem:(id)a4
{
  id v6;

  objc_storeStrong((id *)&self->_resolvedMapItem, a4);
  v6 = a4;
  -[DragAndDropAnchorView updateWithResolvedMapItem:](self->_anchorView, "updateWithResolvedMapItem:", v6);

  -[DragAndDropPreview createSnapshot](self, "createSnapshot");
}

- (void)dragAndDropAnchorViewCellDidUpdateContent:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[DragAndDropPreview contentUpdateDelegate](self, "contentUpdateDelegate", a3));
  objc_msgSend(v4, "dragAndDropPreviewDidUpdate:", self);

}

- (DragAndDropMapItem)item
{
  return self->_dragItem;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (DragAndDropPreviewContentUpdateDelegate)contentUpdateDelegate
{
  return (DragAndDropPreviewContentUpdateDelegate *)objc_loadWeakRetained((id *)&self->_contentUpdateDelegate);
}

- (void)setContentUpdateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contentUpdateDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentUpdateDelegate);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_resolvedMapItem, 0);
  objc_storeStrong((id *)&self->_anchorView, 0);
  objc_storeStrong((id *)&self->_dragItem, 0);
  objc_storeStrong((id *)&self->_snapshotImage, 0);
}

@end
