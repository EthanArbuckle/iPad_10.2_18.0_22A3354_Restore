@implementation TFFeedbackEntryTypeCellProvider

+ (id)reuseIdentifierForEntryType:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return CFSTR("SHORT_TEXT");
  else
    return off_24D7944C0[a3 - 1];
}

+ (Class)cellClassForEntryType:(unint64_t)a3
{
  if (a3 <= 3)
  {
    objc_opt_class();
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (Class)a1;
}

+ (CGSize)cellSizeForEntry:(id)a3 dataSource:(id)a4 fittingSize:(CGSize)a5 inTraitEnvironment:(id)a6
{
  double height;
  double width;
  id v10;
  id v11;
  id v12;
  __objc2_class *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a5.height;
  width = a5.width;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  switch(objc_msgSend(v10, "type"))
  {
    case 0:
      v13 = TFFeedbackFormShortTextCell;
      goto LABEL_6;
    case 1:
      v13 = TFFeedbackFormLongTextCell;
      goto LABEL_6;
    case 2:
      v13 = TFFeedbackFormGroupToggleCell;
      goto LABEL_6;
    case 3:
      v13 = TFFeedbackFormImageCollectionCell;
LABEL_6:
      -[__objc2_class sizeForEntry:dataSource:fittingSize:inTraitEnvironment:](v13, "sizeForEntry:dataSource:fittingSize:inTraitEnvironment:", v10, v11, v12, width, height);
      height = v14;
      width = v15;
      break;
    default:
      break;
  }

  v16 = height;
  v17 = width;
  result.height = v17;
  result.width = v16;
  return result;
}

@end
