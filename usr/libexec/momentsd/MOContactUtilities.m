@implementation MOContactUtilities

+ (id)cNContactIdentifierFromPPContactIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("CN:")))
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("CN:"), "length")));
  else
    v4 = 0;

  return v4;
}

@end
