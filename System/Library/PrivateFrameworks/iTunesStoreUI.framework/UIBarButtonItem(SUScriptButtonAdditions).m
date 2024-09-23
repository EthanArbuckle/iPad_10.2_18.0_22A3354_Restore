@implementation UIBarButtonItem(SUScriptButtonAdditions)

- (uint64_t)configureFromScriptButton:()SUScriptButtonAdditions
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  objc_msgSend(a1, "setEnabled:", objc_msgSend(a3, "enabled"));
  objc_msgSend(a3, "image");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = 0;
  else
    v5 = objc_msgSend(a3, "image");
  objc_msgSend(a1, "setImage:", v5);
  objc_msgSend(a3, "imageEdgeInsets");
  objc_msgSend(a1, "setImageInsets:");
  v6 = objc_msgSend(a3, "style");
  v7 = 0;
  while (!objc_msgSend((id)__BarButtonStyles[v7 + 1], "isEqualToString:", v6))
  {
    v7 += 2;
    if (v7 == 8)
    {
      v8 = 0;
      goto LABEL_9;
    }
  }
  v8 = __BarButtonStyles[v7];
LABEL_9:
  objc_msgSend(a1, "setStyle:", v8);
  objc_msgSend(a3, "title");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = 0;
  else
    v9 = objc_msgSend(a3, "title");
  objc_msgSend(a1, "setTitle:", v9);
  result = objc_msgSend(a3, "tag");
  if (result)
    return objc_msgSend(a1, "setTag:", result);
  return result;
}

@end
