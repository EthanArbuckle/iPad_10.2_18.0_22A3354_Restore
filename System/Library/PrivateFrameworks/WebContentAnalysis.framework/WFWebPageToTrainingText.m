@implementation WFWebPageToTrainingText

+ (id)documentSignature
{
  return (id)WFWebPageToTrainingText_Signature;
}

+ (id)signatureForCategory:(unint64_t)a3
{
  id result;

  switch(a3)
  {
    case 1uLL:
      result = WFWebPageToTrainingText_Category1;
      break;
    case 2uLL:
      result = (id)WFWebPageToTrainingText_Category2;
      break;
    case 3uLL:
      result = (id)WFWebPageToTrainingText_Category3;
      break;
    case 4uLL:
      result = (id)WFWebPageToTrainingText_Category4;
      break;
    case 5uLL:
      result = (id)WFWebPageToTrainingText_Category5;
      break;
    case 6uLL:
      result = (id)WFWebPageToTrainingText_Category6;
      break;
    case 7uLL:
      result = (id)WFWebPageToTrainingText_Category7;
      break;
    case 8uLL:
      result = (id)WFWebPageToTrainingText_Category8;
      break;
    case 9uLL:
      result = (id)WFWebPageToTrainingText_Category9;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)categorySignature
{
  return self->categorySignature;
}

- (void)setCategorySignature:(id)a3
{
  id v5;

  v5 = a3;

  self->categorySignature = (NSString *)a3;
}

- (id)rawPlainText
{
  void *v3;
  id v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendString:", WFWebPageToTrainingText_Signature);
  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  v4 = -[WFWebPageToTrainingText categorySignature](self, "categorySignature");
  if (v4)
    objc_msgSend(v3, "appendString:", v4);
  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:weight:](self, "plainTextAttributeWithSelector:title:weight:", sel_pageTitle, CFSTR("========="), 15));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:weight:](self, "plainTextAttributeWithSelector:title:weight:", sel_tags, CFSTR("========="), 5));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:weight:](self, "plainTextAttributeWithSelector:title:weight:", sel_metaTagDescription, CFSTR("========="), 10));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:weight:](self, "plainTextAttributeWithSelector:title:weight:", sel_metaTagKeywords, CFSTR("========="), 10));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:](self, "plainTextAttributeWithSelector:title:", sel_imageAltsText, CFSTR("=========")));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:](self, "plainTextAttributeWithSelector:title:", sel_linkTitlesText, CFSTR("=========")));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:](self, "plainTextAttributeWithSelector:title:", sel_pageContent, CFSTR("=========")));
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFWebPageToTrainingText;
  -[WFWebPageDecorator dealloc](&v3, sel_dealloc);
}

@end
