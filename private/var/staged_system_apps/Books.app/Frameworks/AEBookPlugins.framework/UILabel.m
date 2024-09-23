@implementation UILabel

+ (CGSize)bkSizeForString:(id)a3 font:(id)a4
{
  id v5;
  id v6;
  id v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc((Class)NSAttributedString);
  LODWORD(v8) = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, NSFontAttributeName, v9, NSKernAttributeName, 0));

  v11 = objc_msgSend(v7, "initWithString:attributes:", v6, v10);
  objc_msgSend(v11, "size");
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

+ (CGSize)bkSizeForString:(id)a3 constrainedToSize:(CGSize)a4 font:(id)a5 lineBreakMode:(int64_t)a6
{
  double height;
  double width;
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v10 = a5;
  v11 = a3;
  v12 = objc_alloc_init((Class)NSMutableParagraphStyle);
  objc_msgSend(v12, "setLineBreakMode:", a6);
  v13 = objc_alloc((Class)NSAttributedString);
  LODWORD(v14) = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v10, NSFontAttributeName, v15, NSKernAttributeName, v12, NSParagraphStyleAttributeName, 0));

  v17 = objc_msgSend(v13, "initWithString:attributes:", v11, v16);
  objc_msgSend(v17, "boundingRectWithSize:options:context:", 3, 0, width, height);
  v19 = v18;
  v21 = v20;

  v22 = v19;
  v23 = v21;
  result.height = v23;
  result.width = v22;
  return result;
}

- (void)bkSetText:(id)a3 font:(id)a4 lineBreakMode:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v13 = a3;
  v8 = a4;
  if ((objc_opt_respondsToSelector(self, "setAttributedText:") & 1) != 0)
  {
    v9 = objc_alloc_init((Class)NSMutableParagraphStyle);
    objc_msgSend(v9, "setLineBreakMode:", a5);
    v10 = objc_alloc((Class)NSAttributedString);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v8, NSFontAttributeName, &off_1CD328, NSKernAttributeName, v9, NSParagraphStyleAttributeName, 0));

    v12 = objc_msgSend(v10, "initWithString:attributes:", v13, v11);
    -[UILabel setAttributedText:](self, "setAttributedText:", v12);

    v8 = v9;
  }
  else
  {
    -[UILabel setText:](self, "setText:", v13);
    -[UILabel setFont:](self, "setFont:", v8);
  }

}

@end
