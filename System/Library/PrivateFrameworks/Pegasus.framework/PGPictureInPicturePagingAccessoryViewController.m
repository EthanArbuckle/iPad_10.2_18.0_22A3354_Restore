@implementation PGPictureInPicturePagingAccessoryViewController

- (PGPictureInPicturePagingAccessoryViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PGPictureInPicturePagingAccessoryViewController;
  return -[PGPictureInPicturePagingAccessoryViewController initWithNibName:bundle:](&v3, sel_initWithNibName_bundle_, 0, 0);
}

- (void)setCurrentPage:(int64_t)a3 numberOfPages:(unint64_t)a4
{
  self->_currentPage = a3;
  self->_numberOfPages = a4;
  -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:");
  -[UIPageControl setNumberOfPages:](self->_pageControl, "setNumberOfPages:", a4);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UIPageControl *v5;
  UIPageControl *pageControl;
  UIPageControl *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CGAffineTransform v25;
  objc_super v26;
  _QWORD v27[6];

  v27[4] = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)PGPictureInPicturePagingAccessoryViewController;
  -[PGPictureInPicturePagingAccessoryViewController viewDidLoad](&v26, sel_viewDidLoad);
  -[PGPictureInPicturePagingAccessoryViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = (UIPageControl *)objc_alloc_init(MEMORY[0x1E0CEA7E8]);
  pageControl = self->_pageControl;
  self->_pageControl = v5;
  v7 = v5;

  -[UIPageControl setNumberOfPages:](v7, "setNumberOfPages:", self->_numberOfPages);
  -[UIPageControl setCurrentPage:](v7, "setCurrentPage:", self->_currentPage);
  -[UIPageControl sizeToFit](v7, "sizeToFit");
  -[UIPageControl setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v8) = 1144750080;
  -[UIPageControl setContentHuggingPriority:forAxis:](v7, "setContentHuggingPriority:forAxis:", 0, v8);
  LODWORD(v9) = 1144750080;
  -[UIPageControl setContentHuggingPriority:forAxis:](v7, "setContentHuggingPriority:forAxis:", 1, v9);
  CGAffineTransformMakeRotation(&v25, 1.57079633);
  -[UIPageControl setTransform:](v7, "setTransform:", &v25);
  objc_msgSend(v3, "addSubview:", v7);
  -[UIPageControl widthAnchor](v7, "widthAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heightAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v22;
  -[UIPageControl heightAnchor](v7, "heightAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widthAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v10;
  -[UIPageControl centerXAnchor](v7, "centerXAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerXAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v13;
  -[UIPageControl centerYAnchor](v7, "centerYAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerYAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v17);
  LODWORD(v18) = 1144750080;
  objc_msgSend(v3, "setContentHuggingPriority:forAxis:", 0, v18);
  LODWORD(v19) = 1144750080;
  objc_msgSend(v3, "setContentHuggingPriority:forAxis:", 1, v19);

}

- (unint64_t)currentPage
{
  return self->_currentPage;
}

- (void)setCurrentPage:(unint64_t)a3
{
  self->_currentPage = a3;
}

- (unint64_t)numberOfPages
{
  return self->_numberOfPages;
}

- (void)setNumberOfPages:(unint64_t)a3
{
  self->_numberOfPages = a3;
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
  objc_storeStrong((id *)&self->_pageControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageControl, 0);
}

@end
