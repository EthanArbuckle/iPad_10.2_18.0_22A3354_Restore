@implementation WFCompactMapThumbnailViewController

- (WFCompactMapThumbnailViewController)initWithCLPlacemark:(id)a3
{
  id v5;
  WFCompactMapThumbnailViewController *v6;
  WFCompactMapThumbnailViewController *v7;
  WFCompactMapThumbnailViewController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFCompactMapThumbnailViewController;
  v6 = -[WFCompactMapThumbnailViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_placemark, a3);
    v8 = v7;
  }

  return v7;
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)WFCompactMapThumbnailViewController;
  -[WFCompactMapThumbnailViewController loadView](&v9, sel_loadView);
  v3 = objc_alloc_init(MEMORY[0x24BDDB130]);
  objc_msgSend(v3, "setZoomEnabled:", 0);
  objc_msgSend(v3, "setScrollEnabled:", 0);
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);
  -[WFCompactMapThumbnailViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

  objc_msgSend(v3, "setAutoresizingMask:", 18);
  -[WFCompactMapThumbnailViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v3);

  -[WFCompactMapThumbnailViewController placemark](self, "placemark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB160]), "initWithPlacemark:", v6);
    objc_msgSend(v3, "addAnnotation:", v7);
    v10[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "showAnnotations:animated:", v8, 0);

  }
}

- (double)contentHeightForWidth:(double)a3
{
  return a3 * 0.75;
}

- (CLPlacemark)placemark
{
  return self->_placemark;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placemark, 0);
}

@end
