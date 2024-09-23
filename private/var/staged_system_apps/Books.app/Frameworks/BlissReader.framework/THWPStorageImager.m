@implementation THWPStorageImager

- (THWPStorageImager)initWithStorage:(id)a3
{
  THWPStorageImager *v4;
  THWPStorageImager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THWPStorageImager;
  v4 = -[THWPStorageImager init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    -[THWPStorageImager setWpStorage:](v4, "setWpStorage:", a3);
    -[THWPStorageImager setWpTextHelper:](v5, "setWpTextHelper:", objc_msgSend(objc_alloc((Class)TSWPText), "initWithParagraphStyle:columnStyle:", objc_msgSend(objc_msgSend(a3, "stylesheet"), "defaultParagraphStyle"), +[TSWPColumnStyle defaultStyleWithContext:](TSWPColumnStyle, "defaultStyleWithContext:", +[THTemporaryObjectContext temporaryContextForDocumentContext:](THTemporaryObjectContext, "temporaryContextForDocumentContext:", objc_msgSend(a3, "context")))));
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->mWPStorage = 0;
  self->mWPTextHelper = 0;

  self->mWPColumnHelper = 0;
  v3.receiver = self;
  v3.super_class = (Class)THWPStorageImager;
  -[THWPStorageImager dealloc](&v3, "dealloc");
}

+ (id)imageForStorage:(id)a3 maxSize:(CGSize)a4
{
  double height;
  double width;
  id v6;
  id v7;

  height = a4.height;
  width = a4.width;
  v6 = objc_msgSend(objc_alloc((Class)a1), "initWithStorage:", a3);
  v7 = objc_msgSend(v6, "imageForMaxSize:", width, height);

  return v7;
}

+ (id)imageForStorage:(id)a3 maxSize:(CGSize)a4 viewScale:(double)a5
{
  double height;
  double width;
  id v7;
  id v8;

  height = a4.height;
  width = a4.width;
  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithStorage:", a3);
  objc_msgSend(v7, "sizeForMaxSize:", width, height);
  v8 = objc_msgSend(v7, "imageWithUnscaledSize:viewScale:");

  return v8;
}

- (id)imageForMaxSize:(CGSize)a3
{
  -[THWPStorageImager sizeForMaxSize:](self, "sizeForMaxSize:", a3.width, a3.height);
  return -[THWPStorageImager imageWithSize:](self, "imageWithSize:");
}

+ (CGSize)sizeForMaxSize:(CGSize)a3 withStorage:(id)a4
{
  double height;
  double width;
  THWPStorageImager *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = -[THWPStorageImager initWithStorage:]([THWPStorageImager alloc], "initWithStorage:", a4);
  -[THWPStorageImager sizeForMaxSize:](v6, "sizeForMaxSize:", width, height);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)sizeForMaxSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  BOOL v8;
  double v9;
  double v10;
  CGSize result;
  CGRect v12;
  CGRect v13;

  height = a3.height;
  width = a3.width;
  if (!-[THWPStorageImager wpColumnHelper](self, "wpColumnHelper")
    || ((-[TSWPColumn frameBounds](-[THWPStorageImager wpColumnHelper](self, "wpColumnHelper"), "frameBounds"),
         width == v7)
      ? (v8 = height == v6)
      : (v8 = 0),
        !v8))
  {
    -[THWPStorageImager setWpColumnHelper:](self, "setWpColumnHelper:", -[TSWPText layoutTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:](-[THWPStorageImager wpTextHelper](self, "wpTextHelper"), "layoutTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:", -[THWPStorageImager wpStorage](self, "wpStorage"), 0, 0, 4111, CGSizeZero.width, CGSizeZero.height, width, height, CGPointZero.x, CGPointZero.y));
  }
  -[TSWPColumn frameBounds](-[THWPStorageImager wpColumnHelper](self, "wpColumnHelper"), "frameBounds");
  v12.origin.x = 0.0;
  v12.origin.y = 0.0;
  v13 = CGRectIntegral(v12);
  v9 = v13.size.width;
  v10 = v13.size.height + 1.0;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)imageWithSize:(CGSize)a3
{
  return -[THWPStorageImager imageWithUnscaledSize:viewScale:](self, "imageWithUnscaledSize:viewScale:", a3.width, a3.height, 1.0);
}

- (id)imageWithUnscaledSize:(CGSize)a3 viewScale:(double)a4
{
  double height;
  double width;
  _QWORD v9[6];
  CGAffineTransform v10;
  CGRect v11;
  CGRect v12;

  height = a3.height;
  width = a3.width;
  -[TSWPColumn frameBounds](-[THWPStorageImager wpColumnHelper](self, "wpColumnHelper"), "frameBounds");
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v12 = CGRectIntegral(v11);
  if (height != v12.size.height)
    -[THWPStorageImager setWpColumnHelper:](self, "setWpColumnHelper:", -[TSWPText layoutTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:](-[THWPStorageImager wpTextHelper](self, "wpTextHelper", v12.origin.x, v12.origin.y, v12.size.width), "layoutTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:", -[THWPStorageImager wpStorage](self, "wpStorage"), 0, 0, 4111, width, height, width, height, CGPointZero.x, CGPointZero.y));
  CGAffineTransformMakeScale(&v10, a4, a4);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_6BF3C;
  v9[3] = &unk_4281C8;
  *(double *)&v9[5] = a4;
  v9[4] = self;
  return +[TSUImage imageWithSize:drawnUsingBlock:](TSUImage, "imageWithSize:drawnUsingBlock:", v9, height * v10.c + v10.a * width, height * v10.d + v10.b * width);
}

- (TSWPStorage)wpStorage
{
  return self->mWPStorage;
}

- (void)setWpStorage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (TSWPText)wpTextHelper
{
  return self->mWPTextHelper;
}

- (void)setWpTextHelper:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (TSWPColumn)wpColumnHelper
{
  return self->mWPColumnHelper;
}

- (void)setWpColumnHelper:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
