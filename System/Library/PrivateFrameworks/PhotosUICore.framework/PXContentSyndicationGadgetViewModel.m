@implementation PXContentSyndicationGadgetViewModel

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXContentSyndicationGadgetViewModel;
  -[PXContentSyndicationGadgetViewModel performChanges:](&v3, sel_performChanges_, a3);
}

- (void)setOverlayTitle:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *overlayTitle;
  BOOL v6;
  NSAttributedString *v7;
  NSAttributedString *v8;
  NSAttributedString *v9;

  v4 = (NSAttributedString *)a3;
  overlayTitle = self->_overlayTitle;
  if (overlayTitle != v4)
  {
    v9 = v4;
    v6 = -[NSAttributedString isEqualToAttributedString:](overlayTitle, "isEqualToAttributedString:", v4);
    v4 = v9;
    if (!v6)
    {
      v7 = (NSAttributedString *)-[NSAttributedString copy](v9, "copy");
      v8 = self->_overlayTitle;
      self->_overlayTitle = v7;

      -[PXContentSyndicationGadgetViewModel signalChange:](self, "signalChange:", 1);
      v4 = v9;
    }
  }

}

- (void)setKeyImageCount:(int64_t)a3
{
  if (self->_keyImageCount != a3)
  {
    self->_keyImageCount = a3;
    -[PXContentSyndicationGadgetViewModel signalChange:](self, "signalChange:", 2);
  }
}

- (void)setAvatarImage:(id)a3
{
  UIImage *v4;
  char v5;
  UIImage *v6;
  UIImage *avatarImage;
  UIImage *v8;

  v8 = (UIImage *)a3;
  v4 = self->_avatarImage;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[UIImage isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (UIImage *)-[UIImage copy](v8, "copy");
      avatarImage = self->_avatarImage;
      self->_avatarImage = v6;

      -[PXContentSyndicationGadgetViewModel signalChange:](self, "signalChange:", 8);
    }
  }

}

- (void)setKeyImage:(id)a3 atIndex:(int64_t)a4
{
  NSMutableDictionary *keyImages;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  id v16;

  v16 = a3;
  keyImages = self->_keyImages;
  if (!keyImages)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v8 = self->_keyImages;
    self->_keyImages = v7;

    keyImages = self->_keyImages;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](keyImages, "objectForKeyedSubscript:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 == v16)
  {

  }
  else
  {
    v11 = v10;
    v12 = objc_msgSend(v10, "isEqual:", v16);

    if ((v12 & 1) == 0)
    {
      v13 = (void *)objc_msgSend(v16, "copy");
      v14 = self->_keyImages;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, v15);

      -[PXContentSyndicationGadgetViewModel signalChange:](self, "signalChange:", 4);
    }
  }

}

- (id)keyImageAtIndex:(int64_t)a3
{
  NSMutableDictionary *keyImages;
  void *v4;
  void *v5;

  keyImages = self->_keyImages;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](keyImages, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setSocialLayerHighlight:(id)a3
{
  SLHighlight *v5;
  SLHighlight *v6;
  char v7;
  SLHighlight *v8;

  v8 = (SLHighlight *)a3;
  v5 = self->_socialLayerHighlight;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[SLHighlight isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_socialLayerHighlight, a3);
      -[PXContentSyndicationGadgetViewModel signalChange:](self, "signalChange:", 16);
    }
  }

}

- (NSAttributedString)overlayTitle
{
  return self->_overlayTitle;
}

- (int64_t)keyImageCount
{
  return self->_keyImageCount;
}

- (UIImage)avatarImage
{
  return self->_avatarImage;
}

- (SLHighlight)socialLayerHighlight
{
  return self->_socialLayerHighlight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socialLayerHighlight, 0);
  objc_storeStrong((id *)&self->_avatarImage, 0);
  objc_storeStrong((id *)&self->_overlayTitle, 0);
  objc_storeStrong((id *)&self->_keyImages, 0);
}

@end
