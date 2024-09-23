@implementation WFDocumentStructureTag

+ (id)tagForNumberOfImages:(int64_t)a3
{
  uint64_t v3;
  BOOL v4;
  void *v5;

  v3 = 100;
  do
  {
    if (v3 <= a3)
    {
      v5 = (void *)MEMORY[0x24BDD17C8];
      return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("ImageCount%dWebFilterTag"), v3);
    }
    v4 = v3 >= 0xA;
    v3 = (v3 - 10);
  }
  while ((_DWORD)v3 != 0 && v4);
  if (a3 >= 6)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    v3 = 5;
    return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("ImageCount%dWebFilterTag"), v3);
  }
  if (a3 >= 3)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    v3 = 2;
    return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("ImageCount%dWebFilterTag"), v3);
  }
  v5 = (void *)MEMORY[0x24BDD17C8];
  if (a3 >= 1)
  {
    v3 = 1;
    return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("ImageCount%dWebFilterTag"), v3);
  }
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("NoImagesWebFilterTag"));
}

+ (id)tagForNumberOfPixels:(int64_t)a3
{
  if (a3 > 2000000)
    return CFSTR("Images2MegaPixelsWebFilterTag");
  if (a3 > 1000000)
    return CFSTR("Images1MegaPixelsWebFilterTag");
  if (a3 > 700000)
    return CFSTR("Images700KiloPixelsWebFilterTag");
  if (a3 > 400000)
    return CFSTR("Images400KiloPixelsWebFilterTag");
  if (a3 > 100000)
    return CFSTR("Images100KiloPixelsWebFilterTag");
  if (a3 > 50000)
    return CFSTR("Images50KiloPixelsWebFilterTag");
  if (a3 > 25000)
    return CFSTR("Images25KiloPixelsWebFilterTag");
  if (a3 > 15000)
    return CFSTR("Images15KiloPixelsWebFilterTag");
  if (a3 <= 5000)
    return CFSTR("ImagesNoPixelsWebFilterTag");
  return CFSTR("Images5KiloPixelsWebFilterTag");
}

- (WFDocumentStructureTag)tagWithWebpage:(id)a3
{
  WFDocumentStructureTag *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (WFDocumentStructureTag *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = objc_msgSend(a3, "numberOfKnownImagePixels");
  v6 = objc_msgSend(a3, "numberOfImages");
  -[WFDocumentStructureTag appendFormat:](v4, "appendFormat:", CFSTR("%@ (TotAreaWFImagesTag:%ld)"), objc_msgSend((id)objc_opt_class(), "tagForNumberOfPixels:", v5), v5);
  -[WFDocumentStructureTag appendString:](v4, "appendString:", CFSTR(" | "));
  -[WFDocumentStructureTag appendFormat:](v4, "appendFormat:", CFSTR("%@ (TotNumWFImagesTag:%ld)"), objc_msgSend((id)objc_opt_class(), "tagForNumberOfImages:", v6), v6);
  return v4;
}

@end
