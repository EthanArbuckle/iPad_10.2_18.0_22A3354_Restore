@implementation TUIBarButtonItem

- (void)setMenuModel:(id)a3
{
  TUIMenuModel *v5;
  TUIMenuModel *menuModel;
  unsigned __int8 v7;
  id v8;
  TUIMenuModel *v9;

  v5 = (TUIMenuModel *)a3;
  menuModel = self->_menuModel;
  if (menuModel != v5)
  {
    v9 = v5;
    v7 = -[TUIMenuModel isEqual:](menuModel, "isEqual:", v5);
    v5 = v9;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_menuModel, a3);
      if (-[NSDictionary count](self->_imageModelIDToResource, "count"))
        -[TUIMenuModel loadImagesFromResourceMap:](self->_menuModel, "loadImagesFromResourceMap:", self->_imageModelIDToResource);
      v8 = -[TUIMenuModel newUIMenuElement](v9, "newUIMenuElement");
      -[TUIBarButtonItem setMenu:](self, "setMenu:", v8);

      v5 = v9;
    }
  }

}

- (void)setImageModelIDToResource:(id)a3
{
  unsigned __int8 v4;
  void *v5;
  NSDictionary *imageModelIDToResource;
  NSDictionary *v7;
  NSDictionary *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];

  v10 = a3;
  v4 = -[NSDictionary isEqualToDictionary:](self->_imageModelIDToResource, "isEqualToDictionary:", v10);
  v5 = v10;
  if ((v4 & 1) == 0)
  {
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", &stru_23D878);
    imageModelIDToResource = self->_imageModelIDToResource;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_15E08;
    v12[3] = &unk_23D8A0;
    v12[4] = self;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](imageModelIDToResource, "enumerateKeysAndObjectsUsingBlock:", v12);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_15E48;
    v11[3] = &unk_23D8A0;
    v11[4] = self;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v11);
    v7 = (NSDictionary *)objc_msgSend(v10, "copy");
    v8 = self->_imageModelIDToResource;
    self->_imageModelIDToResource = v7;

    if (self->_menuModel && -[NSDictionary count](self->_imageModelIDToResource, "count"))
    {
      -[TUIMenuModel loadImagesFromResourceMap:](self->_menuModel, "loadImagesFromResourceMap:", self->_imageModelIDToResource);
      v9 = -[TUIMenuModel newUIMenuElement](self->_menuModel, "newUIMenuElement");
      -[TUIBarButtonItem setMenu:](self, "setMenu:", v9);

    }
    v5 = v10;
  }

}

- (void)dealloc
{
  NSDictionary *imageModelIDToResource;
  objc_super v4;
  _QWORD v5[5];

  imageModelIDToResource = self->_imageModelIDToResource;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_15EDC;
  v5[3] = &unk_23D8A0;
  v5[4] = self;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](imageModelIDToResource, "enumerateKeysAndObjectsUsingBlock:", v5);
  v4.receiver = self;
  v4.super_class = (Class)TUIBarButtonItem;
  -[TUIBarButtonItem dealloc](&v4, "dealloc");
}

- (void)imageResourceDidChangeImage:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_15F98;
  v4[3] = &unk_23D7D0;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (void)setAttributedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)buttonType
{
  return self->_buttonType;
}

- (void)setButtonType:(unint64_t)a3
{
  self->_buttonType = a3;
}

- (unint64_t)buttonRole
{
  return self->_buttonRole;
}

- (void)setButtonRole:(unint64_t)a3
{
  self->_buttonRole = a3;
}

- (double)buttonWidth
{
  return self->_buttonWidth;
}

- (void)setButtonWidth:(double)a3
{
  self->_buttonWidth = a3;
}

- (double)minButtonWidth
{
  return self->_minButtonWidth;
}

- (void)setMinButtonWidth:(double)a3
{
  self->_minButtonWidth = a3;
}

- (double)maxButtonWidth
{
  return self->_maxButtonWidth;
}

- (void)setMaxButtonWidth:(double)a3
{
  self->_maxButtonWidth = a3;
}

- (TUIMenuModel)menuModel
{
  return self->_menuModel;
}

- (TUIAXAttributes)axAttributes
{
  return self->_axAttributes;
}

- (void)setAxAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDictionary)imageModelIDToResource
{
  return self->_imageModelIDToResource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageModelIDToResource, 0);
  objc_storeStrong((id *)&self->_axAttributes, 0);
  objc_storeStrong((id *)&self->_menuModel, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
}

@end
