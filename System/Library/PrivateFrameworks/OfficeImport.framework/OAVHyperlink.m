@implementation OAVHyperlink

+ (id)readFromDrawable:(_xmlNode *)a3 state:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  OADHyperlink *v9;

  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"href", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"title", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc_init(OADHyperlink);
      -[OADHyperlink setTargetLocation:](v9, "setTargetLocation:", v7);
      -[OADHyperlink setTargetMode:](v9, "setTargetMode:", objc_msgSend(v6, "characterAtIndex:", 0) != 35);
      -[OADHyperlink setTooltip:](v9, "setTooltip:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
