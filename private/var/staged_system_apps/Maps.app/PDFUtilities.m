@implementation PDFUtilities

+ (id)imageForType:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 > 0xB)
    return 0;
  else
    return (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", *(&off_1011B81F0 + (int)a3), v3, v4));
}

+ (void)renderDocumentForType:(unsigned int)a3 inRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "imageForType:", *(_QWORD *)&a3));
  objc_msgSend(v8, "drawInRect:", x, y, width, height);

}

@end
