@implementation PXActionMenu

- (PXActionMenu)initWithTitle:(id)a3 systemImageName:(id)a4 childElements:(id)a5
{
  id v8;
  id v9;
  id v10;
  PXActionMenu *v11;
  uint64_t v12;
  NSString *title;
  uint64_t v14;
  NSString *systemImageName;
  uint64_t v16;
  NSArray *childElements;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PXActionMenu;
  v11 = -[PXActionMenu init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    title = v11->_title;
    v11->_title = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    systemImageName = v11->_systemImageName;
    v11->_systemImageName = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    childElements = v11->_childElements;
    v11->_childElements = (NSArray *)v16;

  }
  return v11;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (NSArray)childElements
{
  return self->_childElements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childElements, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (id)menuWithTitle:(id)a3 childElements:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:systemImageName:childElements:", v7, 0, v6);

  return v8;
}

@end
