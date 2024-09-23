@implementation NSObject

- (void)tui_assertCopyHasCorrectProperties:(id)a3
{
  -[NSObject tui_assertCopy:hasCorrectPropertiesIgnoring:](self, "tui_assertCopy:hasCorrectPropertiesIgnoring:", a3, 0);
}

- (id)_tui_getClassPropertyList
{
  objc_class *v2;
  objc_property_t *v3;
  void *v4;
  unint64_t i;
  const char *Name;
  void *v7;
  id v8;
  unsigned int outCount;

  outCount = 0;
  v2 = (objc_class *)objc_opt_class(self, a2);
  v3 = class_copyPropertyList(v2, &outCount);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", outCount));
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      Name = property_getName(v3[i]);
      if (Name)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", Name, 4));
        objc_msgSend(v4, "addObject:", v7);

      }
    }
  }
  free(v3);
  v8 = objc_msgSend(v4, "copy");

  return v8;
}

@end
