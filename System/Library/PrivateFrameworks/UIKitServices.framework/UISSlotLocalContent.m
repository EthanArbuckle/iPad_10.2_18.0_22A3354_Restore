@implementation UISSlotLocalContent

- (UISSlotLocalContent)initWithDrawing:(id)a3 scale:(unsigned __int8)a4 range:(unint64_t)a5
{
  unsigned int v6;
  id v8;
  UISSlotLocalContent *v9;
  UISSlotLocalContent *v10;
  CGFloat v11;
  CGFloat v12;
  objc_super v14;

  v6 = a4;
  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UISSlotLocalContent;
  v9 = -[UISSlotLocalContent init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_contentScale = v6;
    objc_msgSend(v8, "drawingSize");
    v10->_contentSize.width = v11;
    v10->_contentSize.height = v12;
    v10->_localImage = UISCreateImageFromDrawing(v8, a5, (double)v6);
  }

  return v10;
}

- (UISSlotLocalContent)initWithImage:(CGImage *)a3 scale:(unsigned __int8)a4
{
  unsigned int v4;
  UISSlotLocalContent *v6;
  UISSlotLocalContent *v7;
  CGFloat v8;
  size_t Height;
  objc_super v11;

  v4 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UISSlotLocalContent;
  v6 = -[UISSlotLocalContent init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_contentScale = v4;
    v8 = (double)(CGImageGetWidth(a3) / v4);
    Height = CGImageGetHeight(a3);
    v7->_contentSize.width = v8;
    v7->_contentSize.height = (double)(Height / v4);
    v7->_localImage = CGImageRetain(a3);
  }
  return v7;
}

+ (id)contentWithDrawing:(id)a3 scale:(unsigned __int8)a4 range:(unint64_t)a5
{
  uint64_t v6;
  id v7;
  UISSlotLocalContent *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[UISSlotLocalContent initWithDrawing:scale:range:]([UISSlotLocalContent alloc], "initWithDrawing:scale:range:", v7, v6, a5);

  return v8;
}

+ (id)contentWithDrawing:(id)a3 style:(id)a4
{
  id v5;
  id v6;
  UISSlotLocalContent *v7;
  uint64_t v8;
  uint64_t v9;
  UISSlotLocalContent *v10;

  v5 = a4;
  v6 = a3;
  v7 = [UISSlotLocalContent alloc];
  v8 = objc_msgSend(v5, "displayScale");
  v9 = objc_msgSend(v5, "displayRange");

  v10 = -[UISSlotLocalContent initWithDrawing:scale:range:](v7, "initWithDrawing:scale:range:", v6, v8, v9);
  return v10;
}

+ (id)contentWithImage:(CGImage *)a3 scale:(unsigned __int8)a4
{
  return -[UISSlotLocalContent initWithImage:scale:]([UISSlotLocalContent alloc], "initWithImage:scale:", a3, a4);
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_localImage);
  v3.receiver = self;
  v3.super_class = (Class)UISSlotLocalContent;
  -[UISSlotLocalContent dealloc](&v3, sel_dealloc);
}

- (id)image
{
  return self->_localImage;
}

- (BOOL)isRemote
{
  return 0;
}

- (unsigned)contentScale
{
  return self->_contentScale;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)shouldReplaceExistingContent
{
  return 1;
}

@end
