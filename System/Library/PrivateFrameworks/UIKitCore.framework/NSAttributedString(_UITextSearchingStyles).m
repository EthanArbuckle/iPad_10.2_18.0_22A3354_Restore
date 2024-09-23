@implementation NSAttributedString(_UITextSearchingStyles)

+ (id)_systemTextSearchTextAttributesForStyle:()_UITextSearchingStyles
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 2:
      +[UIColor yellowColor](UIColor, "yellowColor");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      +[UIColor lightGrayColor](UIColor, "lightGrayColor");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 0:
      +[UIColor clearColor](UIColor, "clearColor");
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v6 = (void *)v5;
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *(_QWORD *)off_1E1678C50);

      break;
  }
  return v4;
}

@end
