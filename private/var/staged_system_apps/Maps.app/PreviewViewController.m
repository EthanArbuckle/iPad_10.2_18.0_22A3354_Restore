@implementation PreviewViewController

- (void)viewDidLoad
{
  UIImageView *v3;
  UIImageView *imageSourceView;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PreviewViewController;
  -[PreviewViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  imageSourceView = self->_imageSourceView;
  self->_imageSourceView = v3;

  -[UIImageView setOpaque:](self->_imageSourceView, "setOpaque:", 0);
  -[UIImageView setUserInteractionEnabled:](self->_imageSourceView, "setUserInteractionEnabled:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PreviewViewController view](self, "view"));
  objc_msgSend(v5, "addSubview:", self->_imageSourceView);

}

- (void)dragAndDropPreviewDidUpdate:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  id v8;

  if (self->_previewView == a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "renderPreviewImage"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "image"));

    -[UIImageView setImage:](self->_imageSourceView, "setImage:", v8);
    objc_msgSend(v8, "size");
    v6 = v5;
    objc_msgSend(v8, "size");
    -[UIImageView setFrame:](self->_imageSourceView, "setFrame:", 0.0, 0.0, v6, v7);
    objc_msgSend(v8, "size");
    -[PreviewViewController setPreferredContentSize:](self, "setPreferredContentSize:");

  }
}

- (void)setLabelMarker:(id)a3 searchresult:(id)a4 mapView:(id)a5
{
  id v8;
  id v9;
  double v10;
  CLLocationDegrees v11;
  CLLocationDegrees v12;
  CLLocationCoordinate2D v13;
  id v14;
  DragAndDropMapItem *v15;
  DragAndDropMapItem *dragItem;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v17, "coordinate");
  v11 = v10;
  objc_msgSend(v17, "coordinate");
  v13 = CLLocationCoordinate2DMake(v11, v12);
  if (v17)
  {
    v14 = v17;
  }
  else
  {
    if (!v8)
      goto LABEL_6;
    v14 = v8;
  }
  v15 = (DragAndDropMapItem *)objc_claimAutoreleasedReturnValue(+[DragAndDropMapItem dragAndDropItemWithObject:](DragAndDropMapItem, "dragAndDropItemWithObject:", v14));
  dragItem = self->_dragItem;
  self->_dragItem = v15;

LABEL_6:
  -[DragAndDropMapItem setSourceView:](self->_dragItem, "setSourceView:", v9);
  -[DragAndDropMapItem setSourceCoordinate:](self->_dragItem, "setSourceCoordinate:", v13.latitude, v13.longitude);
  -[PreviewViewController _updatePreview](self, "_updatePreview");

}

- (void)_updatePreview
{
  DragAndDropPreview *v3;
  DragAndDropMapItem *dragItem;
  void *v5;
  DragAndDropPreview *v6;
  DragAndDropPreview *previewView;
  void *v8;
  id v9;

  v3 = [DragAndDropPreview alloc];
  dragItem = self->_dragItem;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PreviewViewController traitCollection](self, "traitCollection"));
  v6 = -[DragAndDropPreview initWithDragAndDropMapItem:traitCollection:](v3, "initWithDragAndDropMapItem:traitCollection:", dragItem, v5);
  previewView = self->_previewView;
  self->_previewView = v6;

  -[DragAndDropPreview setContentUpdateDelegate:](self->_previewView, "setContentUpdateDelegate:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropPreview renderPreviewImage](self->_previewView, "renderPreviewImage"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "image"));

  objc_msgSend(v9, "size");
  -[PreviewViewController setPreferredContentSize:](self, "setPreferredContentSize:");

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  id v8;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PreviewViewController;
  -[PreviewViewController traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v5);
  if (v5
    && (v6 = objc_msgSend(v5, "userInterfaceStyle"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[PreviewViewController traitCollection](self, "traitCollection")),
        v6 == objc_msgSend(v3, "userInterfaceStyle")))
  {

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PreviewViewController traitCollection](self, "traitCollection"));
    v8 = objc_msgSend(v7, "userInterfaceStyle");

    if (v5)
    if (v8)
    {
      -[UIImageView setImage:](self->_imageSourceView, "setImage:", 0);
      -[PreviewViewController _updatePreview](self, "_updatePreview");
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSourceView, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_dragItem, 0);
}

@end
