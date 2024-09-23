@implementation NSLayoutConstraint(_UIViewBaselineSupport)

- (uint64_t)_debuggableEquationBaseDescription
{
  objc_class *v2;
  NSString *v3;
  int v4;
  const __CFString *v5;

  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  v4 = -[NSString isEqual:](v3, "isEqual:", CFSTR("NSAutoresizingMaskLayoutConstraint"));
  v5 = CFSTR("NSAutoResizeMaskCn");
  if (!v4)
    v5 = (const __CFString *)v3;
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>  ::  "), v5, a1);
}

- (uint64_t)_debuggableEquationLegendDescription
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;

  v2 = 0;
  switch(objc_msgSend(a1, "_constraintType"))
  {
    case 3u:
    case 9u:
      v3 = (void *)objc_msgSend(a1, "firstItem");
      goto LABEL_4;
    case 4u:
    case 0xAu:
      v3 = (void *)objc_msgSend(a1, "secondItem");
LABEL_4:
      v2 = (void *)objc_msgSend(v3, "nsli_superitem");
      break;
    default:
      break;
  }
  v4 = (void *)objc_msgSend(a1, "firstItem");
  if ((objc_msgSend(v4, "nsli_descriptionIncludesPointer") & 1) != 0)
    v5 = 0;
  else
    v5 = objc_msgSend((id)objc_msgSend(v4, "nsli_description"), "stringByAppendingFormat:", CFSTR(":%p"), v4);
  v6 = objc_msgSend(a1, "firstItem");
  if (v6 == objc_msgSend(a1, "secondItem")
    || (v7 = (void *)objc_msgSend(a1, "secondItem"), (objc_msgSend(v7, "nsli_descriptionIncludesPointer") & 1) != 0))
  {
    v8 = 0;
    if (!v2)
      goto LABEL_16;
  }
  else
  {
    v8 = objc_msgSend((id)objc_msgSend(v7, "nsli_description"), "stringByAppendingFormat:", CFSTR(":%p"), v7);
    if (!v2)
      goto LABEL_16;
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = objc_msgSend(v2, "nsli_descriptionIncludesPointer");
  v11 = (void *)objc_msgSend(v2, "nsli_description");
  if ((v10 & 1) == 0)
    v11 = (void *)objc_msgSend(v11, "stringByAppendingFormat:", CFSTR(":%p"), v2);
  v2 = (void *)objc_msgSend(v9, "stringWithFormat:", CFSTR("'|':%@"), v11);
LABEL_16:
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = v12;
  if (v5)
    objc_msgSend(v12, "addObject:", v5);
  if (v8)
    objc_msgSend(v13, "addObject:", v8);
  if (v2)
    objc_msgSend(v13, "addObject:", v2);
  return objc_msgSend((id)objc_msgSend(a1, "_debuggableEquationBaseDescription"), "stringByAppendingString:", objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", ")));
}

- (uint64_t)_debuggableEquationDescriptionWithoutLegend
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "valueForKey:", CFSTR("asciiArtDescription"));
  if (!v2)
  {
    v2 = objc_msgSend(a1, "valueForKey:", CFSTR("equationDescription"));
    if (!v2)
      v2 = objc_msgSend(a1, "description");
  }
  return objc_msgSend((id)objc_msgSend(a1, "_debuggableEquationBaseDescription"), "stringByAppendingString:", v2);
}

@end
