@implementation _UILargeContentViewerItemStoredProperties

- (void)setShowsLargeContentViewer:(BOOL)a3
{
  -[_UILargeContentViewerItemStoredProperties setDidSetShowsLargeContentViewer:](self, "setDidSetShowsLargeContentViewer:", 1);
  self->_showsLargeContentViewer = a3;
}

- (void)setDidSetShowsLargeContentViewer:(BOOL)a3
{
  self->_didSetShowsLargeContentViewer = a3;
}

- (void)setLargeContentTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *largeContentTitle;

  v4 = a3;
  -[_UILargeContentViewerItemStoredProperties setDidSetLargeContentTitle:](self, "setDidSetLargeContentTitle:", 1);
  v5 = (NSString *)objc_msgSend(v4, "copy");

  largeContentTitle = self->_largeContentTitle;
  self->_largeContentTitle = v5;

}

- (void)setDidSetLargeContentTitle:(BOOL)a3
{
  self->_didSetLargeContentTitle = a3;
}

- (void)setLargeContentImage:(id)a3
{
  UIImage *v4;
  UIImage *largeContentImage;

  v4 = (UIImage *)a3;
  -[_UILargeContentViewerItemStoredProperties setDidSetLargeContentImage:](self, "setDidSetLargeContentImage:", 1);
  largeContentImage = self->_largeContentImage;
  self->_largeContentImage = v4;

}

- (void)setDidSetLargeContentImage:(BOOL)a3
{
  self->_didSetLargeContentImage = a3;
}

- (void)setScalesLargeContentImage:(BOOL)a3
{
  -[_UILargeContentViewerItemStoredProperties setDidSetScalesLargeContentImage:](self, "setDidSetScalesLargeContentImage:", 1);
  self->_scalesLargeContentImage = a3;
}

- (void)setDidSetScalesLargeContentImage:(BOOL)a3
{
  self->_didSetScalesLargeContentImage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeContentImage, 0);
  objc_storeStrong((id *)&self->_largeContentTitle, 0);
}

- (NSString)largeContentTitle
{
  return self->_largeContentTitle;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UILargeContentViewerItemStoredProperties)initWithCoder:(id)a3
{
  id v4;
  _UILargeContentViewerItemStoredProperties *v5;
  uint64_t v6;
  NSString *largeContentTitle;
  uint64_t v8;
  UIImage *largeContentImage;
  void *v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UILargeContentViewerItemStoredProperties;
  v5 = -[_UILargeContentViewerItemStoredProperties init](&v17, sel_init);
  if (v5)
  {
    v5->_didSetShowsLargeContentViewer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DidSetShowsLargeContentViewer"));
    v5->_showsLargeContentViewer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ShowsLargeContentViewer"));
    v5->_didSetLargeContentTitle = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DidSetLargeContentTitle"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LargeContentTitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    largeContentTitle = v5->_largeContentTitle;
    v5->_largeContentTitle = (NSString *)v6;

    v5->_didSetLargeContentImage = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DidSetLargeContentImage"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LargeContentImage"));
    v8 = objc_claimAutoreleasedReturnValue();
    largeContentImage = v5->_largeContentImage;
    v5->_largeContentImage = (UIImage *)v8;

    v5->_didSetScalesLargeContentImage = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DidSetScalesLargeContentImage"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ScalesLargeContentImage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_scalesLargeContentImage = v10 != 0;

    v5->_didSetLargeContentImageInsets = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DidSetLargeContentImageInsets"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LargeContentImageInsets"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UIEdgeInsetsValue");
    v5->_largeContentImageInsets.top = v12;
    v5->_largeContentImageInsets.left = v13;
    v5->_largeContentImageInsets.bottom = v14;
    v5->_largeContentImageInsets.right = v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[_UILargeContentViewerItemStoredProperties didSetShowsLargeContentViewer](self, "didSetShowsLargeContentViewer"), CFSTR("DidSetShowsLargeContentViewer"));
  objc_msgSend(v4, "encodeBool:forKey:", -[_UILargeContentViewerItemStoredProperties showsLargeContentViewer](self, "showsLargeContentViewer"), CFSTR("ShowsLargeContentViewer"));
  objc_msgSend(v4, "encodeBool:forKey:", -[_UILargeContentViewerItemStoredProperties didSetLargeContentTitle](self, "didSetLargeContentTitle"), CFSTR("DidSetLargeContentTitle"));
  -[_UILargeContentViewerItemStoredProperties largeContentTitle](self, "largeContentTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("LargeContentTitle"));

  objc_msgSend(v4, "encodeBool:forKey:", -[_UILargeContentViewerItemStoredProperties didSetLargeContentImage](self, "didSetLargeContentImage"), CFSTR("DidSetLargeContentImage"));
  -[_UILargeContentViewerItemStoredProperties largeContentImage](self, "largeContentImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("LargeContentImage"));

  objc_msgSend(v4, "encodeBool:forKey:", -[_UILargeContentViewerItemStoredProperties didSetScalesLargeContentImage](self, "didSetScalesLargeContentImage"), CFSTR("DidSetScalesLargeContentImage"));
  objc_msgSend(v4, "encodeBool:forKey:", -[_UILargeContentViewerItemStoredProperties scalesLargeContentImage](self, "scalesLargeContentImage"), CFSTR("ScalesLargeContentImage"));
  objc_msgSend(v4, "encodeBool:forKey:", -[_UILargeContentViewerItemStoredProperties didSetLargeContentImageInsets](self, "didSetLargeContentImageInsets"), CFSTR("DidSetLargeContentImageInsets"));
  v7 = (void *)MEMORY[0x1E0CB3B18];
  -[_UILargeContentViewerItemStoredProperties largeContentImageInsets](self, "largeContentImageInsets");
  objc_msgSend(v7, "valueWithUIEdgeInsets:");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("LargeContentImageInsets"));

}

- (void)setLargeContentImageInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[_UILargeContentViewerItemStoredProperties setDidSetLargeContentImageInsets:](self, "setDidSetLargeContentImageInsets:", 1);
  self->_largeContentImageInsets.top = top;
  self->_largeContentImageInsets.left = left;
  self->_largeContentImageInsets.bottom = bottom;
  self->_largeContentImageInsets.right = right;
}

- (BOOL)didSetShowsLargeContentViewer
{
  return self->_didSetShowsLargeContentViewer;
}

- (BOOL)showsLargeContentViewer
{
  return self->_showsLargeContentViewer;
}

- (BOOL)didSetLargeContentTitle
{
  return self->_didSetLargeContentTitle;
}

- (BOOL)didSetLargeContentImage
{
  return self->_didSetLargeContentImage;
}

- (UIImage)largeContentImage
{
  return self->_largeContentImage;
}

- (BOOL)didSetScalesLargeContentImage
{
  return self->_didSetScalesLargeContentImage;
}

- (BOOL)scalesLargeContentImage
{
  return self->_scalesLargeContentImage;
}

- (BOOL)didSetLargeContentImageInsets
{
  return self->_didSetLargeContentImageInsets;
}

- (void)setDidSetLargeContentImageInsets:(BOOL)a3
{
  self->_didSetLargeContentImageInsets = a3;
}

- (UIEdgeInsets)largeContentImageInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_largeContentImageInsets.top;
  left = self->_largeContentImageInsets.left;
  bottom = self->_largeContentImageInsets.bottom;
  right = self->_largeContentImageInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

@end
