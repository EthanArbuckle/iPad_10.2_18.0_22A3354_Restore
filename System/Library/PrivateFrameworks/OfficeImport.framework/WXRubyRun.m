@implementation WXRubyRun

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v7;
  _xmlNode *i;
  void *v9;
  xmlNs *ns;
  void *v11;
  xmlNs *v12;
  id v13;

  v13 = a4;
  v7 = a5;
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (xmlStrEqual(i->name, (const xmlChar *)"rubyPr"))
    {
      objc_msgSend(v13, "rubyProperties");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXRubyProperties readFrom:to:state:](WXRubyProperties, "readFrom:to:state:", i, v9, v7);
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"rt"))
    {
      ns = i->ns;
      objc_msgSend(v13, "paragraph");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "phoneticRun");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXParagraph readRunsFrom:paragraphNamespace:to:targetRun:state:](WXParagraph, "readRunsFrom:paragraphNamespace:to:targetRun:state:", i, ns, v9, v11, v7);

    }
    else
    {
      if (!xmlStrEqual(i->name, (const xmlChar *)"rubyBase"))
        continue;
      v12 = i->ns;
      objc_msgSend(v13, "paragraph");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXParagraph readRunsFrom:paragraphNamespace:to:targetRun:state:](WXParagraph, "readRunsFrom:paragraphNamespace:to:targetRun:state:", i, v12, v9, v13, v7);
    }

  }
}

@end
