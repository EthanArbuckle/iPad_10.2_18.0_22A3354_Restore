@implementation POXSComplexTypeDefinition

- (POXSComplexTypeDefinition)init
{
  POXSComplexTypeDefinition *v2;
  uint64_t v3;
  NSMutableArray *attributes;
  uint64_t v5;
  NSMutableArray *elements;
  uint64_t v7;
  NSMutableArray *namespaces;
  uint64_t v9;
  NSMutableDictionary *properties;
  uint64_t v11;
  NSMutableDictionary *elementAttributes;
  uint64_t v13;
  NSMutableDictionary *attributeAttributes;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)POXSComplexTypeDefinition;
  v2 = -[POXSDefinition init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    attributes = v2->_attributes;
    v2->_attributes = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    elements = v2->_elements;
    v2->_elements = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    namespaces = v2->_namespaces;
    v2->_namespaces = (NSMutableArray *)v7;

    v9 = objc_opt_new();
    properties = v2->_properties;
    v2->_properties = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    elementAttributes = v2->_elementAttributes;
    v2->_elementAttributes = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    attributeAttributes = v2->_attributeAttributes;
    v2->_attributeAttributes = (NSMutableDictionary *)v13;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)POXSComplexTypeDefinition;
  v5 = -[POXSDefinition copyWithZone:](&v21, sel_copyWithZone_);
  v6 = -[NSMutableArray mutableCopyWithZone:](self->_attributes, "mutableCopyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSMutableArray mutableCopyWithZone:](self->_elements, "mutableCopyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSMutableArray mutableCopyWithZone:](self->_namespaces, "mutableCopyWithZone:", a3);
  v11 = (void *)v5[6];
  v5[6] = v10;

  v12 = -[NSMutableDictionary mutableCopyWithZone:](self->_properties, "mutableCopyWithZone:", a3);
  v13 = (void *)v5[7];
  v5[7] = v12;

  v14 = -[NSMutableDictionary mutableCopyWithZone:](self->_elementAttributes, "mutableCopyWithZone:", a3);
  v15 = (void *)v5[4];
  v5[4] = v14;

  v16 = -[NSMutableDictionary mutableCopyWithZone:](self->_attributeAttributes, "mutableCopyWithZone:", a3);
  v17 = (void *)v5[5];
  v5[5] = v16;

  v18 = -[NSString copyWithZone:](self->_contentPropertyName, "copyWithZone:", a3);
  v19 = (void *)v5[8];
  v5[8] = v18;

  return v5;
}

- (id)propertyForName:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", a3);
}

- (NSArray)attributes
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_attributes, "copy");
}

- (NSArray)elements
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_elements, "copy");
}

- (NSArray)namespaces
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_namespaces, "copy");
}

- (void)addAttributeWithName:(id)a3 type:(Class)a4
{
  -[POXSComplexTypeDefinition addAttributeWithName:type:isSpecifiedKey:](self, "addAttributeWithName:type:isSpecifiedKey:", a3, a4, 0);
}

- (void)addAttributeWithName:(id)a3 type:(Class)a4 isSpecifiedKey:(id)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a5;
  -[NSMutableArray addObject:](self->_attributes, "addObject:", v9);
  -[POXSDefinition setType:forName:](self, "setType:forName:", a4, v9);
  if (v8)
    -[POXSComplexTypeDefinition _setAttribute:forName:ofAttributeWithName:](self, "_setAttribute:forName:ofAttributeWithName:", v8, CFSTR("isSpecifiedKey"), v9);

}

- (void)addAttributeWithName:(id)a3 type:(Class)a4 namespaceURI:(id)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a5;
  -[NSMutableArray addObject:](self->_attributes, "addObject:", v9);
  -[POXSDefinition setType:forName:](self, "setType:forName:", a4, v9);
  if (v8)
    -[POXSComplexTypeDefinition _setAttribute:forName:ofAttributeWithName:](self, "_setAttribute:forName:ofAttributeWithName:", v8, CFSTR("namespace"), v9);

}

- (id)isSpecifiedKeyForAttributeName:(id)a3
{
  return -[POXSComplexTypeDefinition _attributeForName:ofAttributeWithName:](self, "_attributeForName:ofAttributeWithName:", CFSTR("isSpecifiedKey"), a3);
}

- (id)isSpecifiedKeyForElementName:(id)a3
{
  return -[POXSComplexTypeDefinition _attributeForName:ofElementWithName:](self, "_attributeForName:ofElementWithName:", CFSTR("isSpecifiedKey"), a3);
}

- (id)namespaceForAttributeName:(id)a3
{
  return -[POXSComplexTypeDefinition _attributeForName:ofAttributeWithName:](self, "_attributeForName:ofAttributeWithName:", CFSTR("namespace"), a3);
}

- (void)addElementWithName:(id)a3 namespaceURI:(id)a4 type:(Class)a5
{
  -[POXSComplexTypeDefinition addElementWithName:namespaceURI:type:isSpecifiedKey:](self, "addElementWithName:namespaceURI:type:isSpecifiedKey:", a3, a4, a5, 0);
}

- (void)addElementWithName:(id)a3 namespaceURI:(id)a4 type:(Class)a5 isSpecifiedKey:(id)a6
{
  id v10;
  id v11;

  v10 = a6;
  v11 = a3;
  -[POXSComplexTypeDefinition addElementWithName:namespaceURI:type:maxOccurs:minOccurs:](self, "addElementWithName:namespaceURI:type:maxOccurs:minOccurs:", v11, a4, a5, 1, 1);
  -[POXSComplexTypeDefinition setIsSpecifiedKey:onElementWithName:](self, "setIsSpecifiedKey:onElementWithName:", v10, v11);

}

- (void)addUnboundedElementWithName:(id)a3 namespaceURI:(id)a4 type:(Class)a5
{
  -[POXSComplexTypeDefinition addElementWithName:namespaceURI:type:maxOccurs:minOccurs:](self, "addElementWithName:namespaceURI:type:maxOccurs:minOccurs:", a3, a4, a5, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (void)setProperty:(id)a3 forName:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", a3, a4);
}

- (void)addElementWithName:(id)a3 namespaceURI:(id)a4 type:(Class)a5 maxOccurs:(unint64_t)a6 minOccurs:(unint64_t)a7
{
  -[POXSComplexTypeDefinition addElementWithName:namespaceURI:type:maxOccurs:minOccurs:flattenMultiValue:](self, "addElementWithName:namespaceURI:type:maxOccurs:minOccurs:flattenMultiValue:", a3, a4, a5, a6, a7, 0);
}

- (void)addElementWithName:(id)a3 namespaceURI:(id)a4 type:(Class)a5 maxOccurs:(unint64_t)a6 minOccurs:(unint64_t)a7 flattenMultiValue:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  POXSElement *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  POXSElement *v29;
  id v30;
  _BOOL4 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v8 = a8;
  v37 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = -[POXSElement initWithElementName:namespaceURI:type:]([POXSElement alloc], "initWithElementName:namespaceURI:type:", v14, v15, a5);
  -[NSMutableArray addObject:](self->_elements, "addObject:", v16);
  -[POXSComplexTypeDefinition setProperty:forName:](self, "setProperty:forName:", v14, v14);
  -[POXSDefinition setType:forName:](self, "setType:forName:", a5, v14);
  if (-[objc_class isSubclassOfClass:](a5, "isSubclassOfClass:", objc_opt_class()))
  {
    v28 = a7;
    v29 = v16;
    v30 = v15;
    v31 = v8;
    +[POXSDefinitions definitionForType:](POXSDefinitions, "definitionForType:", a5);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "elements");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v33 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v22, "elementName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[POXSComplexTypeDefinition setProperty:forName:](self, "setProperty:forName:", v14, v23);

          objc_msgSend(v22, "elementName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[POXSDefinition setType:forName:](self, "setType:forName:", a5, v24);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v19);
    }

    v8 = v31;
    v16 = v29;
    v15 = v30;
    a7 = v28;
  }
  if (a6 != 1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[POXSComplexTypeDefinition _setAttribute:forName:ofElementWithName:](self, "_setAttribute:forName:ofElementWithName:", v25, CFSTR("maxCount"), v14);

  }
  if (a7 != 1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[POXSComplexTypeDefinition _setAttribute:forName:ofElementWithName:](self, "_setAttribute:forName:ofElementWithName:", v26, CFSTR("minCount"), v14);

  }
  if (v8)
    -[POXSComplexTypeDefinition _setAttribute:forName:ofElementWithName:](self, "_setAttribute:forName:ofElementWithName:", MEMORY[0x24BDBD1C8], CFSTR("flattenMultiValue"), v14);

}

- (void)setContentPropertyName:(id)a3 type:(Class)a4
{
  NSString *v7;

  v7 = (NSString *)a3;
  if (self->_contentPropertyName != v7)
    objc_storeStrong((id *)&self->_contentPropertyName, a3);
  -[POXSDefinition setType:forName:](self, "setType:forName:", a4, v7);

}

- (void)setIsSpecifiedKey:(id)a3 onElementWithName:(id)a4
{
  if (a3)
    -[POXSComplexTypeDefinition _setAttribute:forName:ofElementWithName:](self, "_setAttribute:forName:ofElementWithName:", a3, CFSTR("isSpecifiedKey"), a4);
}

- (void)addNamespaceWithURI:(id)a3
{
  -[NSMutableArray addObject:](self->_namespaces, "addObject:", a3);
}

- (unint64_t)maxCountForElementName:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[POXSComplexTypeDefinition _attributeForName:ofElementWithName:](self, "_attributeForName:ofElementWithName:", CFSTR("maxCount"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v5 = 1;

  return v5;
}

- (unint64_t)minCountForElementName:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[POXSComplexTypeDefinition _attributeForName:ofElementWithName:](self, "_attributeForName:ofElementWithName:", CFSTR("minCount"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v5 = 1;

  return v5;
}

- (BOOL)flattenMultiValueElementWithName:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[POXSComplexTypeDefinition _attributeForName:ofElementWithName:](self, "_attributeForName:ofElementWithName:", CFSTR("flattenMultiValue"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (void)_setAttribute:(id)a3 forName:(id)a4 ofNodeWithName:(id)a5 attributes:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, v10);
  }
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, v9);

}

- (id)_attributeForName:(id)a3 ofNodeWithName:(id)a4 attributes:(id)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a3;
  objc_msgSend(a5, "objectForKeyedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_setAttribute:(id)a3 forName:(id)a4 ofElementWithName:(id)a5
{
  -[POXSComplexTypeDefinition _setAttribute:forName:ofNodeWithName:attributes:](self, "_setAttribute:forName:ofNodeWithName:attributes:", a3, a4, a5, self->_elementAttributes);
}

- (id)_attributeForName:(id)a3 ofElementWithName:(id)a4
{
  return -[POXSComplexTypeDefinition _attributeForName:ofNodeWithName:attributes:](self, "_attributeForName:ofNodeWithName:attributes:", a3, a4, self->_elementAttributes);
}

- (void)_setAttribute:(id)a3 forName:(id)a4 ofAttributeWithName:(id)a5
{
  -[POXSComplexTypeDefinition _setAttribute:forName:ofNodeWithName:attributes:](self, "_setAttribute:forName:ofNodeWithName:attributes:", a3, a4, a5, self->_attributeAttributes);
}

- (id)_attributeForName:(id)a3 ofAttributeWithName:(id)a4
{
  return -[POXSComplexTypeDefinition _attributeForName:ofNodeWithName:attributes:](self, "_attributeForName:ofNodeWithName:attributes:", a3, a4, self->_attributeAttributes);
}

+ (id)descriptionForValue:(id)a3
{
  return (id)objc_msgSend(a1, "_descriptionForValue:prefix:", a3, &stru_251503878);
}

+ (id)_descriptionForValue:(id)a3 prefix:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  id obj;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("<%@> {\n"), objc_opt_class());
  +[POXSDefinitions definitionForType:](POXSDefinitions, "definitionForType:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v45 = v8;
    objc_msgSend(v8, "attributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v69;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v69 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i);
          objc_msgSend(v5, "valueForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendFormat:", CFSTR("%@    %@: %@;\n"), v6, v14, v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
      }
      while (v11);
    }

    v8 = v45;
    objc_msgSend(v45, "elements");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_257373468))
    {
      v47 = objc_msgSend(v5, "elementsNeedRedaction");
      objc_msgSend(v5, "allowedElementKeys");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v46 = 0;
      v47 = 0;
    }
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    obj = v16;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
    v18 = 0x2514FE000uLL;
    if (v17)
    {
      v19 = v17;
      v53 = 0;
      v20 = 0;
      v49 = *(_QWORD *)v65;
      v57 = v7;
      v58 = v6;
      do
      {
        v21 = 0;
        v54 = v20;
        v44 = v20 + v19;
        v48 = v19;
        do
        {
          if (*(_QWORD *)v65 != v49)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * v21), "elementName");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "valueForKey:");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          if (v56)
          {
            v51 = v21;
            objc_msgSend(*(id *)(v18 + 3496), "definitionForType:", objc_opt_class());
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            if (v47)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
                || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                if ((objc_msgSend(v46, "containsObject:", v55) & 1) == 0)
                {
                  objc_msgSend(v7, "appendFormat:", CFSTR("%@    %@ = <>;\n"), v6, v55, v43);
                  goto LABEL_42;
                }
              }
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v6, "stringByAppendingString:", CFSTR("    "));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "_descriptionForValue:prefix:", v56, v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "appendFormat:", CFSTR("%@    %@ = %@\n"), v6, v55, v23);

              ++v53;
              goto LABEL_42;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v24 = v56;
              objc_msgSend(v7, "appendFormat:", CFSTR("%@    %@ = [\n"), v6, v55);
              v62 = 0u;
              v63 = 0u;
              v60 = 0u;
              v61 = 0u;
              v25 = v24;
              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
              if (v26)
              {
                v27 = v26;
                v28 = 0;
                v29 = *(_QWORD *)v61;
                while (2)
                {
                  for (j = 0; j != v27; ++j)
                  {
                    if (*(_QWORD *)v61 != v29)
                      objc_enumerationMutation(v25);
                    v31 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j);
                    objc_msgSend(v58, "stringByAppendingString:", CFSTR("        "));
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(a1, "_descriptionForValue:prefix:", v31, v32);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v57, "appendFormat:", CFSTR("%@        [%lu] = %@\n"), v58, v28 + j, v33);

                    if (v28 + j == 4)
                    {
                      v34 = objc_msgSend(v25, "count");
                      if (v34 != 5)
                      {
                        objc_msgSend(v57, "appendFormat:", CFSTR("%@        -- %lu remaining entries in array --\n"), v58, v34 - 5);
                        goto LABEL_41;
                      }
                    }
                  }
                  v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
                  v28 += j;
                  if (v27)
                    continue;
                  break;
                }
              }
LABEL_41:
              v35 = v25;

              v7 = v57;
              v6 = v58;
              objc_msgSend(v57, "appendFormat:", CFSTR("%@    ]\n"), v58);

              v8 = v45;
              v18 = 0x2514FE000;
LABEL_42:
              v19 = v48;
              v21 = v51;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v38 = v56;
                  objc_msgSend(v38, "calendar");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "dateFromComponents:", v38);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v7, "appendFormat:", CFSTR("%@    %@ = %@;\n"), v6, v55, v40);
                }
                else
                {
                  objc_msgSend(v7, "appendFormat:", CFSTR("%@    %@ = %@;\n"), v6, v55, v56);
                }
                goto LABEL_42;
              }
              v19 = v48;
              if (objc_msgSend(v56, "integerValue"))
                objc_msgSend(v7, "appendFormat:", CFSTR("%@    %@ = %@;\n"), v6, v55, v56);
            }

          }
          v36 = v54 + 1;
          if (v53 == 5)
          {
            v37 = objc_msgSend(obj, "count");
            v36 = v54 + 1;
            if (v37 != v54 + 1)
            {
              objc_msgSend(v7, "appendFormat:", CFSTR("%@    -- %lu remaining elements --\n"), v6, v37 - (v54 + 1));

              goto LABEL_54;
            }
          }
          v54 = v36;

          ++v21;
        }
        while (v21 != v19);
        v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
        v19 = v41;
        v20 = v44;
      }
      while (v41);
    }
LABEL_54:

  }
  objc_msgSend(v7, "appendFormat:", CFSTR("%@}\n"), v6);

  return v7;
}

- (NSString)contentPropertyName
{
  return self->_contentPropertyName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentPropertyName, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_namespaces, 0);
  objc_storeStrong((id *)&self->_attributeAttributes, 0);
  objc_storeStrong((id *)&self->_elementAttributes, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
