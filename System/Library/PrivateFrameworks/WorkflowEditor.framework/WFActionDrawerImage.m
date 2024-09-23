@implementation WFActionDrawerImage

- (WFActionDrawerImage)initWithImage:(id)a3 shouldAspectFill:(BOOL)a4
{
  id v8;
  WFActionDrawerImage *v9;
  WFActionDrawerImage *v10;
  WFActionDrawerImage *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionDrawerImageLoader.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("image"));

  }
  v14.receiver = self;
  v14.super_class = (Class)WFActionDrawerImage;
  v9 = -[WFActionDrawerImage init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_image, a3);
    v10->_shouldAspectFill = a4;
    v11 = v10;
  }

  return v10;
}

- (WFImage)image
{
  return self->_image;
}

- (BOOL)shouldAspectFill
{
  return self->_shouldAspectFill;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
