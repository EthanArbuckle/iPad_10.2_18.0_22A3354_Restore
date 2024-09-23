@implementation OCPPackageRelationship

- (OCPPackageRelationship)initWithXmlElement:(_xmlNode *)a3 baseLocation:(id)a4
{
  id v6;

  v6 = a4;
  self->mTargetMode = 0;
  -[OCPPackageRelationship readFromElement:baseLocation:](self, "readFromElement:baseLocation:", a3, v6);

  return self;
}

- (void)readFromElement:(_xmlNode *)a3 baseLocation:(id)a4
{
  _xmlAttr *properties;
  char i;
  NSString *v8;
  NSString *mIdentifier;
  NSString *v10;
  NSURL *v11;
  NSURL *mTargetLocation;
  xmlChar *String;
  int v14;
  id v15;

  v15 = a4;
  properties = a3->properties;
  for (i = 0; properties; properties = properties->next)
  {
    if (!properties->ns)
    {
      if (xmlStrEqual(properties->name, (const xmlChar *)"Id"))
      {
        v8 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithValueOfXmlAttribute:", properties);
        mIdentifier = self->mIdentifier;
        self->mIdentifier = v8;
LABEL_11:

        continue;
      }
      if (xmlStrEqual(properties->name, (const xmlChar *)"Type"))
      {
        v10 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithValueOfXmlAttribute:", properties);
        mIdentifier = self->mType;
        self->mType = v10;
        goto LABEL_11;
      }
      if (xmlStrEqual(properties->name, (const xmlChar *)"Target"))
      {
        mIdentifier = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "tc_initWithValueOfXmlAttribute:", properties);
        if (!-[NSString isEqualToString:](mIdentifier, "isEqualToString:", CFSTR("NULL")))
        {
          -[NSString replaceOccurrencesOfString:withString:options:range:](mIdentifier, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\"), CFSTR("/"), 0, 0, -[NSString length](mIdentifier, "length"));
          v11 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:relativeToURL:", mIdentifier, v15);
          mTargetLocation = self->mTargetLocation;
          self->mTargetLocation = v11;

        }
        i = 1;
        goto LABEL_11;
      }
      if (xmlStrEqual(properties->name, (const xmlChar *)"TargetMode"))
      {
        String = xmlNodeListGetString(properties->doc, properties->children, 1);
        if (xmlStrEqual(String, (const xmlChar *)"External"))
        {
          v14 = 1;
          goto LABEL_19;
        }
        if (xmlStrEqual(String, (const xmlChar *)"Internal"))
        {
          v14 = 0;
LABEL_19:
          self->mTargetMode = v14;
        }
        else
        {
          +[OCPException raise:format:](OCPException, "raise:format:", CFSTR("OCPPackageRelationshipError"), CFSTR("Unexpected target mode value: %s"), String);
        }
        ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(String);
      }
    }
  }
  if (!self->mIdentifier || ((self->mType != 0) & i) == 0)
    +[OCPException raise:format:](OCPException, "raise:format:", CFSTR("OCPPackageRelationshipError"), CFSTR("Could not find required relationship attributes"));

}

- (id)identifier
{
  return self->mIdentifier;
}

- (id)type
{
  return self->mType;
}

- (id)targetLocation
{
  return self->mTargetLocation;
}

- (int)targetMode
{
  return self->mTargetMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTargetLocation, 0);
  objc_storeStrong((id *)&self->mType, 0);
  objc_storeStrong((id *)&self->mIdentifier, 0);
}

@end
