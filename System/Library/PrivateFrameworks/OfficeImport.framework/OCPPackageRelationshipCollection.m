@implementation OCPPackageRelationshipCollection

- (OCPPackageRelationshipCollection)initWithRelationshipsXml:(_xmlDoc *)a3 baseLocation:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *mIdentifierMap;
  NSMutableDictionary *v9;
  NSMutableDictionary *mTypeMap;
  xmlNodePtr RootElement;
  xmlNsPtr v12;
  xmlNs *ns;
  _xmlNode *i;
  OCPPackageRelationship *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a4;
  v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  mIdentifierMap = self->mIdentifierMap;
  self->mIdentifierMap = v7;

  v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  mTypeMap = self->mTypeMap;
  self->mTypeMap = v9;

  if (a3)
  {
    RootElement = xmlDocGetRootElement(a3);
    if (!RootElement)
      +[OCPException raise:format:](OCPException, "raise:format:", CFSTR("OCPPackageError"), CFSTR("No relationship root element"));
    v12 = xmlSearchNsByHref(a3, RootElement, (const xmlChar *)"http://schemas.openxmlformats.org/package/2006/relationships");
    if (!v12)
      +[OCPException raise:format:](OCPException, "raise:format:", CFSTR("OCPPackageError"), CFSTR("Could not find relationships namespace"));
    if (!RootElement
      || (ns = RootElement->ns) == 0
      || !xmlStrEqual(ns->href, v12->href)
      || !xmlStrEqual(RootElement->name, (const xmlChar *)"Relationships"))
    {
      +[OCPException raise:format:](OCPException, "raise:format:", CFSTR("OCPPackageError"), CFSTR("Could not find relationships root"));
    }
    for (i = RootElement->children; i; i = i->next)
    {
      if (i->type == XML_ELEMENT_NODE
        && xmlStrEqual(i->ns->href, v12->href)
        && xmlStrEqual(i->name, (const xmlChar *)"Relationship"))
      {
        v15 = -[OCPPackageRelationship initWithXmlElement:baseLocation:]([OCPPackageRelationship alloc], "initWithXmlElement:baseLocation:", i, v6);
        -[OCPPackageRelationship identifier](v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](self->mIdentifierMap, "setObject:forKey:", v15, v16);
        -[OCPPackageRelationship type](v15, "type");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](self->mTypeMap, "objectForKey:", v17);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        if (!v18)
        {
          v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          -[NSMutableDictionary setObject:forKey:](self->mTypeMap, "setObject:forKey:");
        }
        objc_msgSend(v18, "addObject:", v15);

      }
    }
  }

  return self;
}

- (id)relationshipsByType:(id)a3
{
  -[NSMutableDictionary objectForKey:](self->mTypeMap, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)relationshipForIdentifier:(id)a3
{
  -[NSMutableDictionary objectForKey:](self->mIdentifierMap, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTypeMap, 0);
  objc_storeStrong((id *)&self->mIdentifierMap, 0);
}

@end
