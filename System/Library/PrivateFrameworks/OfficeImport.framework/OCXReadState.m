@implementation OCXReadState

- (id)OCXReadRelationshipForNode:(_xmlNode *)a3 attributeName:(const char *)a4 packagePart:(id)a5
{
  id v8;
  xmlAttrPtr v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = CXXmlHasNsPropWithFallbackNs(a3, (const unsigned __int8 *)a4, self->super.mOCXRelationshipsNamespace);
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithValueOfXmlAttribute:", v9);
    objc_msgSend(v8, "relationshipForIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)OCXReadRelationshipForNode:(_xmlNode *)a3 packagePart:(id)a4
{
  -[OCXReadState OCXReadRelationshipForNode:attributeName:packagePart:](self, "OCXReadRelationshipForNode:attributeName:packagePart:", a3, "id", a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)OCXReadRequiredRelationshipForNode:(_xmlNode *)a3 attributeName:(const char *)a4 packagePart:(id)a5
{
  void *v6;

  -[OCXReadState OCXReadRelationshipForNode:attributeName:packagePart:](self, "OCXReadRelationshipForNode:attributeName:packagePart:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("OCXException"), CFSTR("Could not find required relationship: %s"), a4);
  return v6;
}

- (id)OCXReadRequiredRelationshipForNode:(_xmlNode *)a3 packagePart:(id)a4
{
  void *v4;

  -[OCXReadState OCXReadRelationshipForNode:attributeName:packagePart:](self, "OCXReadRelationshipForNode:attributeName:packagePart:", a3, "id", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("OCXException"), CFSTR("Could not find required relationship: id"));
  return v4;
}

@end
