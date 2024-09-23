@implementation UIButton(SUScriptButtonAdditions)

- (uint64_t)configureFromScriptButton:()SUScriptButtonAdditions
{
  uint64_t v5;
  char isKindOfClass;
  uint64_t v7;
  uint64_t result;

  objc_msgSend(a1, "setEnabled:", objc_msgSend(a3, "enabled"));
  objc_msgSend(a3, "image");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = 0;
  else
    v5 = objc_msgSend(a3, "image");
  objc_msgSend(a1, "setImage:forState:", v5, 0);
  objc_msgSend(a3, "imageEdgeInsets");
  objc_msgSend(a1, "setImageEdgeInsets:");
  objc_msgSend(a3, "title");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = 0;
  if ((isKindOfClass & 1) == 0)
    v7 = objc_msgSend(a3, "title", 0);
  objc_msgSend(a1, "setTitle:forState:", v7, 0);
  result = objc_msgSend(a3, "tag");
  if (result)
    return objc_msgSend(a1, "setTag:", result);
  return result;
}

@end
