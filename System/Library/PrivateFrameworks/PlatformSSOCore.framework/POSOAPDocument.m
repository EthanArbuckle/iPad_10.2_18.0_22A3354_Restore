@implementation POSOAPDocument

+ (id)definition
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("Envelope"), CFSTR("http://www.w3.org/2003/05/soap-envelope"), objc_opt_class());
  return v2;
}

- (NSString)description
{
  return (NSString *)+[POXSComplexTypeDefinition descriptionForValue:](POXSComplexTypeDefinition, "descriptionForValue:", self);
}

- (id)XMLStringWithOptions:(unint64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[POSOAPDocument _XMLStringWithOptions:appendingToString:](self, "_XMLStringWithOptions:appendingToString:", a3, v5);
  return v5;
}

- (void)_XMLQualifiedNameForNamespace:(id)a3 elementName:(id)a4 options:(unint64_t)a5 appendingToString:(id)a6
{
  id v8;
  void *v9;
  id v10;

  v10 = a4;
  v8 = a6;
  +[POXSNamespaces prefixForNamespaceURI:](POXSNamespaces, "prefixForNamespaceURI:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(v8, "appendString:", v9);
    objc_msgSend(v8, "appendString:", CFSTR(":"));
  }
  objc_msgSend(v8, "appendString:", v10);

}

- (void)_XMLAttributeStringWithPrefix:(id)a3 name:(id)a4 value:(id)a5 options:(unint64_t)a6 appendingToString:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;

  v13 = a3;
  v10 = a4;
  v11 = a7;
  v12 = a5;
  objc_msgSend(v11, "appendString:", CFSTR(" "));
  if (objc_msgSend(v13, "length"))
  {
    objc_msgSend(v11, "appendString:", v13);
    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(v11, "appendString:", CFSTR(":"));
LABEL_5:
      objc_msgSend(v11, "appendString:", v10);
    }
  }
  else if (objc_msgSend(v10, "length"))
  {
    goto LABEL_5;
  }
  objc_msgSend(v11, "appendString:", CFSTR("=\"));
  objc_msgSend(v11, "appendString:", v12);

  objc_msgSend(v11, "appendString:", CFSTR("\"));
}

- (void)_XMLAttributesStringWithComplexType:(id)a3 options:(unint64_t)a4 appendingToString:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  id v28;
  void *v31;
  id obj;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v28 = a5;
  +[POXSDefinitions definitionForType:](POXSDefinitions, "definitionForType:", objc_opt_class());
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "attributes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  v31 = v6;
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v39 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v6, "valueForKey:", v11, v28);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v33, "isSpecifiedKeyForAttributeName:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v13
            || (objc_msgSend(v6, "valueForKey:", v13),
                v14 = (void *)objc_claimAutoreleasedReturnValue(),
                v15 = objc_msgSend(v14, "BOOLValue"),
                v14,
                v15))
          {
            +[POXSDefinitions definitionForType:](POXSDefinitions, "definitionForType:", objc_msgSend(v33, "typeForName:", v11));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "namespaceForAttributeName:", v11);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "stringFromValue:", v12);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              +[POXSNamespaces prefixForNamespaceURI:](POXSNamespaces, "prefixForNamespaceURI:", v17);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[POSOAPDocument _XMLAttributeStringWithPrefix:name:value:options:appendingToString:](self, "_XMLAttributeStringWithPrefix:name:value:options:appendingToString:", v19, v11, v18, a4, v28);

              v6 = v31;
            }

          }
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v8);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v33, "namespaces");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  v22 = v28;
  if (v21)
  {
    v23 = v21;
    v24 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v35 != v24)
          objc_enumerationMutation(v20);
        v26 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
        +[POXSNamespaces prefixForNamespaceURI:](POXSNamespaces, "prefixForNamespaceURI:", v26, v28);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[POSOAPDocument _XMLAttributeStringWithPrefix:name:value:options:appendingToString:](self, "_XMLAttributeStringWithPrefix:name:value:options:appendingToString:", CFSTR("xmlns"), v27, v26, a4, v22);

      }
      v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v23);
  }

}

- (void)_XMLStringWithComplexType:(id)a3 options:(unint64_t)a4 appendingToString:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  POSOAPDocument *v37;
  void *v38;
  void *v39;
  uint64_t i;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  unint64_t v67;
  void *v68;
  const __CFString *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  const __CFString *v86;
  char v87;
  const __CFString *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  id v92;
  void *v93;
  int v94;
  id obj;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  POSOAPDocument *v103;
  void *v104;
  void *v105;
  id v106;
  uint64_t v107;
  char isKindOfClass;
  void *v109;
  uint64_t v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _BYTE v119[128];
  _BYTE v120[128];
  uint64_t v121;

  v121 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  +[POXSDefinitions definitionForType:](POXSDefinitions, "definitionForType:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  objc_msgSend(v10, "elements");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v120, 16);
  if (v98)
  {
    v97 = *(_QWORD *)v116;
    v92 = v8;
    v93 = v10;
    v103 = self;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v116 != v97)
          objc_enumerationMutation(obj);
        v100 = v11;
        v12 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * v11);
        objc_msgSend(v12, "elementName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "valueForKey:", v13);
        v14 = objc_claimAutoreleasedReturnValue();

        v101 = (void *)v14;
        if (v14)
        {
          v109 = v12;
          objc_msgSend(v12, "elementName");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v10, "typeForName:", v15);
          +[POXSDefinitions definitionForType:](POXSDefinitions, "definitionForType:", v16);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = (void *)v15;
          objc_msgSend(v10, "isSpecifiedKeyForElementName:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17
            && (objc_msgSend(v8, "valueForKey:", v17),
                v18 = (void *)objc_claimAutoreleasedReturnValue(),
                v19 = objc_msgSend(v18, "BOOLValue"),
                v18,
                !v19))
          {
            v31 = v105;
          }
          else
          {
            v96 = v17;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();
              if ((isKindOfClass & 1) != 0)
              {
                v20 = v101;
                v21 = v109;
                if ((objc_msgSend(v10, "flattenMultiValueElementWithName:", v99) & 1) != 0)
                {
                  v94 = 0;
                }
                else
                {
                  objc_msgSend(v9, "appendString:", CFSTR("<"));
                  objc_msgSend(v109, "namespaceURI");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v109, "elementName");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  -[POSOAPDocument _XMLQualifiedNameForNamespace:elementName:options:appendingToString:](self, "_XMLQualifiedNameForNamespace:elementName:options:appendingToString:", v38, v39, a4, v9);

                  objc_msgSend(v9, "appendString:", CFSTR(">"));
                  v94 = 1;
                }
              }
              else
              {
                v94 = 0;
                v20 = v101;
                v21 = v109;
              }
              v113 = 0u;
              v114 = 0u;
              v111 = 0u;
              v112 = 0u;
              v106 = v20;
              v110 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v111, v119, 16);
              if (!v110)
                goto LABEL_49;
              v107 = *(_QWORD *)v112;
              while (1)
              {
                for (i = 0; i != v110; ++i)
                {
                  if (*(_QWORD *)v112 != v107)
                    objc_enumerationMutation(v106);
                  v41 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * i);
                  v42 = v21;
                  v43 = objc_opt_class();
                  if ((isKindOfClass & 1) != 0)
                  {
                    objc_msgSend(v105, "elementForValue:", v41);
                    v44 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v44, "elementName");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    v46 = objc_msgSend(v105, "typeForName:", v45);

                    v42 = v44;
                  }
                  else
                  {
                    v46 = v43;
                  }
                  objc_msgSend(v9, "appendString:", CFSTR("<"));
                  objc_msgSend(v42, "namespaceURI");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "elementName");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  -[POSOAPDocument _XMLQualifiedNameForNamespace:elementName:options:appendingToString:](self, "_XMLQualifiedNameForNamespace:elementName:options:appendingToString:", v47, v48, a4, v9);

                  +[POXSDefinitions definitionForType:](POXSDefinitions, "definitionForType:", v46);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v52 = v9;
                      if (v41)
                      {
                        objc_msgSend(v9, "appendString:", CFSTR(">"));
                        objc_msgSend(v49, "stringFromValue:", v41);
                        v53 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v9, "appendString:", v53);

LABEL_38:
                        objc_msgSend(v9, "appendString:", CFSTR("</"));
                        objc_msgSend(v42, "namespaceURI");
                        v54 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v42, "elementName");
                        v55 = (void *)objc_claimAutoreleasedReturnValue();
                        -[POSOAPDocument _XMLQualifiedNameForNamespace:elementName:options:appendingToString:](self, "_XMLQualifiedNameForNamespace:elementName:options:appendingToString:", v54, v55, a4, v9);

                        v52 = v9;
                        v56 = CFSTR(">");
                      }
                      else
                      {
                        v56 = CFSTR("/>");
                      }
                      objc_msgSend(v52, "appendString:", v56);
                      goto LABEL_47;
                    }
LABEL_43:
                    objc_msgSend(v9, "appendString:", CFSTR("/>"));
                    goto LABEL_47;
                  }
                  -[POSOAPDocument _XMLAttributesStringWithComplexType:options:appendingToString:](self, "_XMLAttributesStringWithComplexType:options:appendingToString:", v41, a4, v9);
                  objc_msgSend(v49, "elements");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  v51 = objc_msgSend(v50, "count");

                  if (v51)
                  {
                    objc_msgSend(v9, "appendString:", CFSTR(">"));
                    -[POSOAPDocument _XMLStringWithComplexType:options:appendingToString:](self, "_XMLStringWithComplexType:options:appendingToString:", v41, a4, v9);
                    goto LABEL_38;
                  }
                  objc_msgSend(v49, "contentPropertyName");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v57)
                    goto LABEL_43;
                  +[POXSDefinitions definitionForType:](POXSDefinitions, "definitionForType:", v46);
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v58, "contentPropertyName");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  v104 = v58;
                  v60 = objc_msgSend(v58, "typeForName:", v59);
                  objc_msgSend(v41, "valueForKey:", v59);
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  +[POXSDefinitions definitionForType:](POXSDefinitions, "definitionForType:", v60);
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v62, "stringFromValue:", v61);
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v63)
                  {
                    objc_msgSend(v9, "appendString:", CFSTR(">"));
                    objc_msgSend(v9, "appendString:", v63);
                    objc_msgSend(v9, "appendString:", CFSTR("</"));
                    objc_msgSend(v42, "namespaceURI");
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v42, "elementName");
                    v102 = v59;
                    v65 = v62;
                    v66 = v61;
                    v67 = a4;
                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                    -[POSOAPDocument _XMLQualifiedNameForNamespace:elementName:options:appendingToString:](v103, "_XMLQualifiedNameForNamespace:elementName:options:appendingToString:", v64, v68, v67, v9);

                    a4 = v67;
                    v61 = v66;
                    v62 = v65;
                    v59 = v102;

                    self = v103;
                    v69 = CFSTR(">");
                  }
                  else
                  {
                    v69 = CFSTR("/>");
                  }
                  objc_msgSend(v9, "appendString:", v69);

LABEL_47:
                  v21 = v109;
                }
                v110 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v111, v119, 16);
                if (!v110)
                {
LABEL_49:

                  if (v94)
                  {
                    objc_msgSend(v9, "appendString:", CFSTR("</"));
                    objc_msgSend(v21, "namespaceURI");
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v21, "elementName");
                    v71 = (void *)objc_claimAutoreleasedReturnValue();
                    -[POSOAPDocument _XMLQualifiedNameForNamespace:elementName:options:appendingToString:](self, "_XMLQualifiedNameForNamespace:elementName:options:appendingToString:", v70, v71, a4, v9);

                    objc_msgSend(v9, "appendString:", CFSTR(">"));
                  }
                  v31 = v105;
                  v8 = v92;
                  goto LABEL_52;
                }
              }
            }
            objc_opt_class();
            v22 = v105;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v9, "appendString:", CFSTR("<"));
              objc_msgSend(v109, "namespaceURI");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v109, "elementName");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[POSOAPDocument _XMLQualifiedNameForNamespace:elementName:options:appendingToString:](self, "_XMLQualifiedNameForNamespace:elementName:options:appendingToString:", v23, v24, a4, v9);

              -[POSOAPDocument _XMLAttributesStringWithComplexType:options:appendingToString:](self, "_XMLAttributesStringWithComplexType:options:appendingToString:", v101, a4, v9);
              objc_msgSend(v105, "elements");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "count");

              if (v26)
              {
                objc_msgSend(v9, "appendString:", CFSTR(">"));
                -[POSOAPDocument _XMLStringWithComplexType:options:appendingToString:](self, "_XMLStringWithComplexType:options:appendingToString:", v101, a4, v9);
                objc_msgSend(v9, "appendString:", CFSTR("</"));
                objc_msgSend(v109, "namespaceURI");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v109, "elementName");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                -[POSOAPDocument _XMLQualifiedNameForNamespace:elementName:options:appendingToString:](self, "_XMLQualifiedNameForNamespace:elementName:options:appendingToString:", v27, v28, a4, v9);

                v29 = v9;
                v30 = CFSTR(">");
              }
              else
              {
                objc_msgSend(v105, "contentPropertyName");
                v78 = (void *)objc_claimAutoreleasedReturnValue();

                if (v78)
                {
                  objc_msgSend(v105, "contentPropertyName");
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  v80 = objc_msgSend(v105, "typeForName:", v79);
                  objc_msgSend(v101, "valueForKey:", v79);
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  +[POXSDefinitions definitionForType:](POXSDefinitions, "definitionForType:", v80);
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v82, "stringFromValue:", v81);
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  v8 = v92;
                  if (v83)
                  {
                    objc_msgSend(v9, "appendString:", CFSTR(">"));
                    objc_msgSend(v9, "appendString:", v83);
                    objc_msgSend(v9, "appendString:", CFSTR("</"));
                    objc_msgSend(v109, "namespaceURI");
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v109, "elementName");
                    v85 = (void *)objc_claimAutoreleasedReturnValue();
                    -[POSOAPDocument _XMLQualifiedNameForNamespace:elementName:options:appendingToString:](v103, "_XMLQualifiedNameForNamespace:elementName:options:appendingToString:", v84, v85, a4, v9);

                    v22 = v105;
                    v86 = CFSTR(">");
                  }
                  else
                  {
                    v86 = CFSTR("/>");
                  }
                  objc_msgSend(v9, "appendString:", v86);

                  v31 = v22;
                  goto LABEL_52;
                }
                v29 = v9;
                v30 = CFSTR("/>");
              }
              objc_msgSend(v29, "appendString:", v30);
              v31 = v105;
              v17 = v96;
              v8 = v92;
              goto LABEL_54;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v105, "elementForValue:", v101);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "namespaceURI");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "elementName");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "appendString:", CFSTR("<"));
              -[POSOAPDocument _XMLQualifiedNameForNamespace:elementName:options:appendingToString:](self, "_XMLQualifiedNameForNamespace:elementName:options:appendingToString:", v33, v34, a4, v9);
              -[POSOAPDocument _XMLAttributesStringWithComplexType:options:appendingToString:](self, "_XMLAttributesStringWithComplexType:options:appendingToString:", v101, a4, v9);
              +[POXSDefinitions definitionForType:](POXSDefinitions, "definitionForType:", objc_msgSend(v32, "type"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v31, "elements");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = objc_msgSend(v35, "count");

                if (v36)
                {
                  objc_msgSend(v9, "appendString:", CFSTR(">"));
                  v37 = v103;
                  -[POSOAPDocument _XMLStringWithComplexType:options:appendingToString:](v103, "_XMLStringWithComplexType:options:appendingToString:", v101, a4, v9);
                  goto LABEL_66;
                }
              }
              objc_opt_class();
              v87 = objc_opt_isKindOfClass();
              v88 = CFSTR("/>");
              if ((v87 & 1) != 0)
              {
                objc_msgSend(v31, "stringFromValue:", v101);
                v89 = objc_claimAutoreleasedReturnValue();
                if (v89)
                {
                  v90 = (void *)v89;
                  objc_msgSend(v9, "appendString:", CFSTR(">"));
                  objc_msgSend(v9, "appendString:", v90);

                  v37 = v103;
LABEL_66:
                  objc_msgSend(v9, "appendString:", CFSTR("</"));
                  -[POSOAPDocument _XMLQualifiedNameForNamespace:elementName:options:appendingToString:](v37, "_XMLQualifiedNameForNamespace:elementName:options:appendingToString:", v33, v34, a4, v9);
                  v88 = CFSTR(">");
                }
                else
                {
                  v88 = CFSTR("/>");
                }
              }
              objc_msgSend(v9, "appendString:", v88);

              v10 = v93;
            }
            else
            {
              +[POXSDefinitions definitionForType:](POXSDefinitions, "definitionForType:", v16);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "stringFromValue:", v101);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              if (v73)
              {
                objc_msgSend(v9, "appendString:", CFSTR("<"));
                objc_msgSend(v109, "namespaceURI");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v109, "elementName");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                -[POSOAPDocument _XMLQualifiedNameForNamespace:elementName:options:appendingToString:](self, "_XMLQualifiedNameForNamespace:elementName:options:appendingToString:", v74, v75, a4, v9);

                objc_msgSend(v9, "appendString:", CFSTR(">"));
                objc_msgSend(v9, "appendString:", v73);
                objc_msgSend(v9, "appendString:", CFSTR("</"));
                objc_msgSend(v109, "namespaceURI");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v109, "elementName");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                -[POSOAPDocument _XMLQualifiedNameForNamespace:elementName:options:appendingToString:](self, "_XMLQualifiedNameForNamespace:elementName:options:appendingToString:", v76, v77, a4, v9);

                objc_msgSend(v9, "appendString:", CFSTR(">"));
              }

              v31 = v105;
LABEL_52:
              v10 = v93;
            }
            v17 = v96;
          }
LABEL_54:

          self = v103;
        }

        v11 = v100 + 1;
      }
      while (v100 + 1 != v98);
      v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v120, 16);
      v98 = v91;
    }
    while (v91);
  }

}

- (void)_XMLStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = v6;
  v8 = v6;
  if ((a3 & 1) == 0)
  {
    objc_msgSend(v6, "appendString:", CFSTR("<?xml version=\"1.0\" encoding=\"utf-8\"?>"));
    v7 = v8;
  }
  -[POSOAPDocument _XMLStringWithComplexType:options:appendingToString:](self, "_XMLStringWithComplexType:options:appendingToString:", self, a3, v7);

}

- (POSOAPEnvelope)Envelope
{
  return self->_Envelope;
}

- (void)setEnvelope:(id)a3
{
  objc_storeStrong((id *)&self->_Envelope, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_Envelope, 0);
}

@end
