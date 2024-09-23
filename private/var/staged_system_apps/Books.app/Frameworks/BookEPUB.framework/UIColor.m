@implementation UIColor

+ (id)be_fromHexString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("#"), &stru_38FF08));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uppercaseString"));

  v6 = 0;
  switch((unint64_t)objc_msgSend(v5, "length"))
  {
    case 3uLL:
      objc_msgSend(a1, "be_colorComponentFrom:start:length:", v5, 0, 1);
      v8 = v7;
      objc_msgSend(a1, "be_colorComponentFrom:start:length:", v5, 1, 1);
      v10 = v9;
      v11 = a1;
      v12 = v5;
      v13 = 2;
      v14 = 1;
      goto LABEL_5;
    case 4uLL:
      objc_msgSend(a1, "be_colorComponentFrom:start:length:", v5, 0, 1);
      v8 = v15;
      objc_msgSend(a1, "be_colorComponentFrom:start:length:", v5, 1, 1);
      v10 = v16;
      objc_msgSend(a1, "be_colorComponentFrom:start:length:", v5, 2, 1);
      v18 = v17;
      v19 = a1;
      v20 = v5;
      v21 = 3;
      v22 = 1;
      goto LABEL_7;
    case 6uLL:
      objc_msgSend(a1, "be_colorComponentFrom:start:length:", v5, 0, 2);
      v8 = v23;
      objc_msgSend(a1, "be_colorComponentFrom:start:length:", v5, 2, 2);
      v10 = v24;
      v11 = a1;
      v12 = v5;
      v13 = 4;
      v14 = 2;
LABEL_5:
      objc_msgSend(v11, "be_colorComponentFrom:start:length:", v12, v13, v14);
      v18 = v25;
      v26 = 1.0;
      goto LABEL_8;
    case 8uLL:
      objc_msgSend(a1, "be_colorComponentFrom:start:length:", v5, 0, 2);
      v8 = v27;
      objc_msgSend(a1, "be_colorComponentFrom:start:length:", v5, 2, 2);
      v10 = v28;
      objc_msgSend(a1, "be_colorComponentFrom:start:length:", v5, 4, 2);
      v18 = v29;
      v19 = a1;
      v20 = v5;
      v21 = 6;
      v22 = 2;
LABEL_7:
      objc_msgSend(v19, "be_colorComponentFrom:start:length:", v20, v21, v22);
      v26 = v30;
LABEL_8:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v8, v10, v18, v26));
      break;
    default:
      break;
  }

  return v6;
}

+ (double)be_colorComponentFrom:(id)a3 start:(unint64_t)a4 length:(unint64_t)a5
{
  void *v6;
  void *v7;
  id v8;
  double v9;
  void *v10;
  unint64_t v11;
  double v12;
  int v14;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "substringWithRange:", a4, a5));
  v7 = v6;
  if (a5 == 2)
  {
    v8 = v6;
    v9 = 255.0;
  }
  else
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v6, v6));
    v9 = 15.0;
  }
  v14 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v8));
  objc_msgSend(v10, "scanHexInt:", &v14);

  LODWORD(v11) = v14;
  v12 = (double)v11 / v9;

  return v12;
}

@end
