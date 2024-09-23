@implementation XMLStringSimplifier

+ (id)simplifiedStringFromString:(id)a3 isXML:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)objc_opt_class(a1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "simplifiedStringFromString:isXML:", v6, v4));

  return v8;
}

- (id)simplifiedStringFromString:(id)a3 isXML:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  unsigned int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v21;

  v4 = a4;
  v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)NSScanner), "initWithString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet alphanumericCharacterSet](NSCharacterSet, "alphanumericCharacterSet"));
  v8 = objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v8, "invert");
  v9 = objc_msgSend(v8, "mutableCopy");
  v10 = v9;
  if (v4)
  {
    objc_msgSend(v9, "addCharactersInString:", CFSTR("<"));
    objc_msgSend(v8, "removeCharactersInString:", CFSTR("<"));
  }
  objc_msgSend(v6, "setCharactersToBeSkipped:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  if (objc_msgSend(v5, "length"))
  {
    while (1)
    {
      if ((objc_msgSend(v6, "isAtEnd") & 1) != 0)
      {
        v18 = objc_msgSend(v11, "copy");
        goto LABEL_15;
      }
      v12 = objc_msgSend(v6, "scanLocation");
      v21 = 0;
      v13 = objc_msgSend(v6, "scanUpToCharactersFromSet:intoString:", v10, &v21);
      v14 = v21;
      v15 = v14;
      if (v13 && objc_msgSend(v14, "length"))
        objc_msgSend(v11, "appendString:", v15);
      if ((objc_msgSend(v6, "isAtEnd") & 1) == 0)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "string"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "substringWithRange:", objc_msgSend(v6, "scanLocation"), 1));

        LODWORD(v16) = objc_msgSend(v17, "isEqualToString:", CFSTR("<"));
        if ((_DWORD)v16)
        {
          objc_msgSend(v6, "scanUpToString:intoString:", CFSTR(">"), 0);
          objc_msgSend(v6, "scanString:intoString:", CFSTR(">"), 0);
        }
      }
      objc_msgSend(v6, "scanCharactersFromSet:intoString:", v8, 0);
      if (objc_msgSend(v6, "scanLocation") == v12)
        break;

    }
    NSLog(CFSTR("We didn't move at all in that iteration. That's not expected. Failing."));

    v19 = 0;
  }
  else
  {
    v18 = v5;
LABEL_15:
    v19 = v18;
  }

  return v19;
}

@end
