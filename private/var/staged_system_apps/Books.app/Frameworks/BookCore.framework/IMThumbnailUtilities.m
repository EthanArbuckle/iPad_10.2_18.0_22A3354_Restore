@implementation IMThumbnailUtilities

+ (CGSize)proportionalScaleSize:(CGSize)a3 toDestinationSize:(CGSize)a4 options:(int64_t)a5
{
  double width;
  double v6;
  double height;
  double v8;
  double v9;
  double v10;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  width = (double)(uint64_t)a3.width;
  v6 = a4.width / width;
  height = (double)(uint64_t)a3.height;
  v8 = a4.height / height;
  if (v6 >= v8)
    v6 = v8;
  v9 = v6 * width;
  v10 = v6 * height;
  if ((a5 & 2) != 0 && v9 / v10 + 0.072 >= 0.667 && v9 / v10 + -0.072 <= 0.667)
    v9 = v10 * 0.667;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v12, "scale");
  v14 = v13;

  v15 = v14 * round(v9 / v14);
  v16 = v14 * round(v10 / v14);
  result.height = v16;
  result.width = v15;
  return result;
}

+ (id)scaleImage:(id)a3 toSize:(CGSize)a4 options:(int64_t)a5
{
  double height;
  double width;
  id v8;
  double v9;
  double v10;
  BOOL v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  objc_msgSend(v8, "size");
  if (!a5 && (v9 == width ? (v11 = v10 == height) : (v11 = 0), v11))
  {
    v12 = v8;
  }
  else if (v8)
  {
    objc_msgSend(v8, "size");
    +[IMThumbnailUtilities proportionalScaleSize:toDestinationSize:options:](IMThumbnailUtilities, "proportionalScaleSize:toDestinationSize:options:", a5);
    v14 = v13;
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIGraphicsImageRendererFormat preferredFormat](UIGraphicsImageRendererFormat, "preferredFormat"));
    v18 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:format:", v17, v14, v16);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10950;
    v20[3] = &unk_28BCA8;
    v22 = v14;
    v23 = v16;
    v24 = 0;
    v25 = 0;
    v26 = v14;
    v27 = v16;
    v21 = v8;
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "imageWithActions:", v20));

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
