@implementation WXSpecialCharacter

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v7;
  CXNamespace *v8;
  uint64_t v9;
  uint64_t v10;
  CXNamespace *v11;
  uint64_t v12;
  id v13;

  v13 = a4;
  v7 = a5;
  objc_msgSend(v7, "WXMainNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v9 = OCXFindChild(a3, v8, "separator");

  if (v9)
  {
    v10 = 3;
  }
  else
  {
    objc_msgSend(v7, "WXMainNamespace");
    v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v12 = OCXFindChild(a3, v11, "continuationSeparator");

    if (v12)
      v10 = 4;
    else
      v10 = 0xFFFFLL;
  }
  objc_msgSend(v13, "setCharacterType:", v10);

}

@end
