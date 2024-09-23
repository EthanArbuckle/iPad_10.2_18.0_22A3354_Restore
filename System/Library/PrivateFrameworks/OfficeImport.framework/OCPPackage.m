@implementation OCPPackage

- (void)readContentTypesXml:(_xmlDoc *)a3
{
  xmlNodePtr RootElement;
  xmlNsPtr v6;
  xmlNs *ns;
  _xmlNode *i;

  RootElement = xmlDocGetRootElement(a3);
  if (!RootElement)
    +[OCPException raise:format:](OCPException, "raise:format:", CFSTR("OCPPackageError"), CFSTR("No content types root element"));
  v6 = xmlSearchNsByHref(a3, RootElement, (const xmlChar *)"http://schemas.openxmlformats.org/package/2006/content-types");
  if (v6)
  {
    if (RootElement)
      goto LABEL_5;
LABEL_19:
    +[OCPException raise:format:](OCPException, "raise:format:", CFSTR("OCPPackageError"), CFSTR("Could not find content types root"));
    return;
  }
  +[OCPException raise:format:](OCPException, "raise:format:", CFSTR("OCPPackageError"), CFSTR("Could not find content types namespace"));
  if (!RootElement)
    goto LABEL_19;
LABEL_5:
  ns = RootElement->ns;
  if (!ns || !xmlStrEqual(ns->href, v6->href) || !xmlStrEqual(RootElement->name, (const xmlChar *)"Types"))
    +[OCPException raise:format:](OCPException, "raise:format:", CFSTR("OCPPackageError"), CFSTR("Could not find content types root"));
  for (i = RootElement->children; i; i = i->next)
  {
    if (i->type == XML_ELEMENT_NODE && i->ns == v6)
    {
      if (xmlStrEqual(i->name, (const xmlChar *)"Default"))
      {
        -[OCPPackage readDefaultContentTypeFromElement:](self, "readDefaultContentTypeFromElement:", i);
      }
      else if (xmlStrEqual(i->name, (const xmlChar *)"Override"))
      {
        -[OCPPackage readContentTypeOverrideFromElement:](self, "readContentTypeOverrideFromElement:", i);
      }
    }
  }
}

- (void)readDefaultContentTypeFromElement:(_xmlNode *)a3
{
  _xmlAttr *properties;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  properties = a3->properties;
  if (!properties)
  {
    v9 = 0;
    v5 = 0;
LABEL_14:
    +[OCPException raise:format:](OCPException, "raise:format:", CFSTR("OCPPackageError"), CFSTR("Could not find required content type attributes"));
    goto LABEL_15;
  }
  v9 = 0;
  v5 = 0;
  do
  {
    if (properties->ns)
      goto LABEL_9;
    if (xmlStrEqual(properties->name, (const xmlChar *)"Extension"))
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithValueOfXmlAttribute:", properties);
      v7 = v9;
      v9 = (id)v6;
    }
    else
    {
      if (!xmlStrEqual(properties->name, (const xmlChar *)"ContentType"))
        goto LABEL_9;
      v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithValueOfXmlAttribute:", properties);
      v7 = v5;
      v5 = (void *)v8;
    }

LABEL_9:
    properties = properties->next;
  }
  while (properties);
  if (!v9 || !v5)
    goto LABEL_14;
  -[NSMutableDictionary setObject:forKey:](self->mDefaultContentTypes, "setObject:forKey:", v5, v9);
LABEL_15:

}

- (id)contentTypeForPartLocation:(id)a3
{
  void *v4;
  __CFString *v5;
  NSMutableDictionary *mDefaultContentTypes;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  objc_msgSend(a3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->mContentTypeOverrides, "objectForKey:", v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    mDefaultContentTypes = self->mDefaultContentTypes;
    objc_msgSend(v4, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](mDefaultContentTypes, "objectForKey:", v7);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v8 = self->mDefaultContentTypes;
      objc_msgSend(v4, "pathExtension");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lowercaseString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v8, "objectForKey:", v10);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        v11 = self->mDefaultContentTypes;
        objc_msgSend(v4, "pathExtension");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "uppercaseString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](v11, "objectForKey:", v13);
        v14 = objc_claimAutoreleasedReturnValue();

        if (v14)
          v5 = (__CFString *)v14;
        else
          v5 = CFSTR("application/octet-stream");
      }
    }
  }

  return v5;
}

- (id)properties
{
  return self->mProperties;
}

- (OCPPackage)init
{

  return 0;
}

- (id)partForLocation:(id)a3
{
  return 0;
}

- (id)relationshipForIdentifier:(id)a3
{
  -[OCPPackageRelationshipCollection relationshipForIdentifier:](self->mRelationships, "relationshipForIdentifier:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)relationshipsByType:(id)a3
{
  -[OCPPackageRelationshipCollection relationshipsByType:](self->mRelationships, "relationshipsByType:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)partByRelationshipType:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[OCPPackageRelationshipCollection relationshipsByType:](self->mRelationships, "relationshipsByType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OCPPackage partForLocation:](self, "partForLocation:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)mainDocumentPart
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  -[OCPPackage relationshipsByType:](self, "relationshipsByType:", CFSTR("http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    v5 = CFSTR("http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument");
  else
    v5 = CFSTR("http://purl.oclc.org/ooxml/officeDocument/relationships/officeDocument");
  -[OCPPackage partByRelationshipType:](self, "partByRelationshipType:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mContentTypeOverrides, 0);
  objc_storeStrong((id *)&self->mDefaultContentTypes, 0);
  objc_storeStrong((id *)&self->mProperties, 0);
  objc_storeStrong((id *)&self->mRelationships, 0);
}

- (OCPPackage)initWithRelationshipsXml:(_xmlDoc *)a3 corePropertiesXml:(_xmlDoc *)a4 appPropertiesXml:(_xmlDoc *)a5 contentTypesXml:(_xmlDoc *)a6
{
  void *v11;
  OCPPackageRelationshipCollection *v12;
  OCPPackageRelationshipCollection *mRelationships;
  OCPPackageProperties *v14;
  OCPPackageProperties *mProperties;
  NSMutableDictionary *v16;
  NSMutableDictionary *mDefaultContentTypes;
  NSMutableDictionary *v18;
  NSMutableDictionary *mContentTypeOverrides;

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", CFSTR("/"));
  v12 = -[OCPPackageRelationshipCollection initWithRelationshipsXml:baseLocation:]([OCPPackageRelationshipCollection alloc], "initWithRelationshipsXml:baseLocation:", a3, v11);
  mRelationships = self->mRelationships;
  self->mRelationships = v12;

  if (a4)
  {
    v14 = -[OCPPackageProperties initWithCoreXml:appXml:]([OCPPackageProperties alloc], "initWithCoreXml:appXml:", a4, a5);
    mProperties = self->mProperties;
    self->mProperties = v14;

  }
  v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  mDefaultContentTypes = self->mDefaultContentTypes;
  self->mDefaultContentTypes = v16;

  v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  mContentTypeOverrides = self->mContentTypeOverrides;
  self->mContentTypeOverrides = v18;

  -[OCPPackage readContentTypesXml:](self, "readContentTypesXml:", a6);
  return self;
}

- (void)readContentTypeOverrideFromElement:(_xmlNode *)a3
{
  _xmlAttr *properties;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  properties = a3->properties;
  if (!properties)
  {
    v9 = 0;
    v5 = 0;
LABEL_14:
    +[OCPException raise:format:](OCPException, "raise:format:", CFSTR("OCPPackageError"), CFSTR("Could not find required content type attributes"));
    goto LABEL_15;
  }
  v9 = 0;
  v5 = 0;
  do
  {
    if (properties->ns)
      goto LABEL_9;
    if (xmlStrEqual(properties->name, (const xmlChar *)"PartName"))
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithValueOfXmlAttribute:", properties);
      v7 = v9;
      v9 = (id)v6;
    }
    else
    {
      if (!xmlStrEqual(properties->name, (const xmlChar *)"ContentType"))
        goto LABEL_9;
      v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithValueOfXmlAttribute:", properties);
      v7 = v5;
      v5 = (void *)v8;
    }

LABEL_9:
    properties = properties->next;
  }
  while (properties);
  if (!v9 || !v5)
    goto LABEL_14;
  -[NSMutableDictionary setObject:forKey:](self->mContentTypeOverrides, "setObject:forKey:", v5, v9);
LABEL_15:

}

@end
