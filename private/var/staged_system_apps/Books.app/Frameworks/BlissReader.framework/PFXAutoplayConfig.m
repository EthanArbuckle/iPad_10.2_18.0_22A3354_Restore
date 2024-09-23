@implementation PFXAutoplayConfig

+ (id)autoplayConfigWithState:(id)a3
{
  id v3;
  const xmlChar *v4;
  _BOOL8 v5;

  v3 = objc_msgSend(a3, "currentHtmlStackEntry");
  v4 = (const xmlChar *)objc_msgSend(v3, "xmlValueForAttribute:", PFXWidgetConstantDataAutoplay[0]);
  if (v4)
    v5 = xmlStrEqual(v4, (const xmlChar *)"yes") != 0;
  else
    v5 = 0;
  return -[THWAutoplayConfig initWithAutoplayEnabled:]([THWAutoplayConfig alloc], "initWithAutoplayEnabled:", v5);
}

@end
