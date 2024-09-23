void xsltParseStylesheetAttributeSet(xsltStylesheetPtr style, xmlNodePtr cur)
{
  xmlChar *NsProp;
  const char *v5;
  void (**v6)(const char *);
  const char *v7;
  xmlNsPtr v8;
  const xmlChar *href;
  xmlHashTable *attributeSets;
  _QWORD *v11;
  _QWORD *v12;
  _xmlNode *children;
  const char *v14;
  const xmlChar *v15;
  const xmlChar *v16;
  const char *v17;
  xmlNs *ns;
  _QWORD *v19;
  const xmlChar *v20;
  const char *v21;
  const xmlChar *v22;
  const char *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  xmlChar *v28;
  unsigned int v29;
  const xmlChar *v30;
  unsigned int v31;
  uint64_t v32;
  int v33;
  const char *v34;
  const xmlChar *v35;
  const xmlChar *v36;
  xmlChar *v37;
  xmlNsPtr v38;
  xmlChar *name;
  const char *v40;
  xmlChar *nameSpace;
  xmlChar *prefix;

  if (!style || !cur || cur->type != XML_ELEMENT_NODE)
    return;
  NsProp = xmlGetNsProp(cur, (const xmlChar *)"name", 0);
  if (!NsProp)
  {
    xsltGenericError(xsltGenericErrorContext, "xsl:attribute-set : name is missing\n");
    return;
  }
  v5 = (const char *)NsProp;
  prefix = 0;
  v6 = (void (**)(const char *))MEMORY[0x24BEDE758];
  if (!*NsProp)
  {
    xsltGenericError(xsltGenericErrorContext, "xsl:attribute-set : name is missing\n");
    goto LABEL_10;
  }
  if (xmlValidateQName(NsProp, 0))
  {
    xsltTransformError(0, style, cur, "xsl:attribute-set : The name '%s' is not a valid QName.\n", v5);
    ++style->errors;
LABEL_10:
    (*v6)(v5);
    return;
  }
  v7 = (const char *)xsltSplitQName(style->dict, (const xmlChar *)v5, (const xmlChar **)&prefix);
  (*v6)(v5);
  if (prefix)
  {
    v8 = xmlSearchNs(style->doc, cur, prefix);
    if (!v8)
    {
      xsltTransformError(0, style, cur, "xsl:attribute-set : No namespace found for QName '%s:%s'\n", (const char *)prefix, v7);
      ++style->errors;
      return;
    }
    href = v8->href;
  }
  else
  {
    href = 0;
  }
  attributeSets = style->attributeSets;
  if (attributeSets
    || (xsltGenericDebug(xsltGenericDebugContext, "creating attribute set table\n"),
        attributeSets = xmlHashCreate(10),
        (style->attributeSets = attributeSets) != 0))
  {
    v11 = xmlHashLookup2(attributeSets, (const xmlChar *)v7, href);
    if (!v11)
    {
      v12 = xsltNewAttrSet();
      if (!v12)
        return;
      v11 = v12;
      xmlHashAddEntry2(style->attributeSets, (const xmlChar *)v7, href, v12);
    }
    children = cur->children;
    v40 = v7;
    if (children)
    {
      v14 = "xsl:attribute-set : unexpected child %s\n";
      v15 = (const xmlChar *)"http://www.w3.org/1999/XSL/Transform";
      v16 = (const xmlChar *)"attribute";
      v17 = "add attribute to list %s\n";
      do
      {
        if (children->type != XML_ELEMENT_NODE)
          goto LABEL_34;
        ns = children->ns;
        if (!ns)
          goto LABEL_33;
        if (xmlStrEqual(ns->href, v15))
        {
          if (xmlStrEqual(children->name, v16))
          {
            xsltGenericDebug(xsltGenericDebugContext, v17, v7);
            xsltStylePreCompute(style, children);
            if (children->children)
              xsltParseTemplateContent(style, children);
            if (children->psvi)
            {
              v19 = v11;
              v20 = v15;
              v21 = v14;
              v22 = v16;
              v23 = v17;
              v24 = v19;
              v25 = (_QWORD *)v19[1];
              v26 = v25;
              if (v25)
              {
                do
                {
                  v27 = v26;
                  v26 = (_QWORD *)*v26;
                }
                while (v26);
                *v27 = xsltNewAttrElem((uint64_t)children);
              }
              else
              {
                v25 = xsltNewAttrElem((uint64_t)children);
              }
              v24[1] = v25;
              v7 = v40;
              v17 = v23;
              v16 = v22;
              v14 = v21;
              v15 = v20;
              v11 = v24;
            }
            else
            {
              xsltTransformError(0, style, children, "xsl:attribute-set : internal error, attribute %s not compiled\n");
            }
          }
          else
          {
            xsltTransformError(0, style, children, "xsl:attribute-set : unexpected child xsl:%s\n");
          }
          goto LABEL_35;
        }
        if (children->type == XML_ELEMENT_NODE)
LABEL_33:
          xsltTransformError(0, style, children, v14, children->name);
        else
LABEL_34:
          xsltTransformError(0, style, children, "xsl:attribute-set : child of unexpected type\n");
LABEL_35:
        children = children->next;
      }
      while (children);
    }
    v28 = xmlGetNsProp(cur, (const xmlChar *)"use-attribute-sets", 0);
    if (v28)
    {
      name = v28;
      v29 = *v28;
      if (*v28)
      {
        v30 = v28;
        while (1)
        {
          if (v29 > 0x20)
            goto LABEL_48;
          if (((1 << v29) & 0x100002600) != 0)
          {
            v31 = *++v30;
            v29 = v31;
          }
          else
          {
            if (!v29)
              break;
LABEL_48:
            v32 = 0;
            while (v29 > 0x20 || ((1 << v29) & 0x100002601) == 0)
              v29 = v30[++v32];
            if (v32 >= 0x7FFFFFFF)
              v33 = 0x7FFFFFFF;
            else
              v33 = v32;
            v34 = (const char *)xmlDictLookup(style->dict, v30, v33);
            if (v34)
            {
              v35 = (const xmlChar *)v34;
              nameSpace = 0;
              xsltGenericDebug(xsltGenericDebugContext, "xsl:attribute-set : %s adds use %s\n", v40, v34);
              if (xmlValidateQName(v35, 0))
              {
                xsltTransformError(0, style, cur, "xsl:attribute-set : The name '%s' in use-attribute-sets is not a valid QName.\n");
                goto LABEL_67;
              }
              v36 = xsltSplitQName(style->dict, v35, (const xmlChar **)&nameSpace);
              v37 = nameSpace;
              if (nameSpace)
              {
                v38 = xmlSearchNs(style->doc, cur, nameSpace);
                if (!v38)
                {
                  xsltTransformError(0, style, cur, "xsl:attribute-set : No namespace found for QName '%s:%s' in use-attribute-sets\n");
LABEL_67:
                  ++style->errors;
                  ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(name);
                  return;
                }
                v37 = (xmlChar *)v38->href;
              }
              v11[2] = xsltAddUseAttrSetList((_QWORD *)v11[2], (uint64_t)v36, (uint64_t)v37);
            }
            v30 += v32;
            v29 = *v30;
            if (!*v30)
              break;
          }
        }
      }
      ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(name);
      v7 = v40;
    }
    xsltGenericDebug(xsltGenericDebugContext, "updated attribute list %s\n", v7);
  }
}

_QWORD *xsltAddUseAttrSetList(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v4;
  _QWORD *v5;

  if (!a2)
    return a1;
  if (a1)
  {
    v4 = a1;
    while (1)
    {
      v5 = v4;
      if (v4[1] == a2 && v4[2] == a3)
        break;
      v4 = (_QWORD *)*v4;
      if (!*v5)
      {
        *v5 = xsltNewUseAttrSet(a2, a3);
        return a1;
      }
    }
    return a1;
  }
  return xsltNewUseAttrSet(a2, a3);
}

void xsltResolveStylesheetAttributeSet(xsltStylesheetPtr style)
{
  xsltStylesheetPtr Import;
  xmlHashTable *attributeSets;
  xsltStylesheetPtr v4;
  xsltStylesheetPtr v5;

  xsltGenericDebug(xsltGenericDebugContext, "Resolving attribute sets references\n");
  v4 = style;
  if (style)
  {
    v5 = 0;
    Import = style;
    do
    {
      attributeSets = Import->attributeSets;
      if (attributeSets)
      {
        if (!style->attributeSets)
        {
          xsltGenericDebug(xsltGenericDebugContext, "creating attribute set table\n", v4);
          style->attributeSets = xmlHashCreate(10);
          attributeSets = Import->attributeSets;
        }
        v5 = Import;
        xmlHashScanFull(attributeSets, (xmlHashScannerFull)xsltResolveSASCallback, &v4);
        if (Import != style)
        {
          xmlHashFree(Import->attributeSets, 0);
          Import->attributeSets = 0;
        }
      }
      Import = xsltNextImport(Import);
    }
    while (Import);
  }
}

void xsltResolveSASCallback(_QWORD *a1, xsltStylesheetPtr *a2, const char *a3, const xmlChar *a4)
{
  xsltStylesheetPtr v7;
  xsltStylesheet *v8;

  v7 = *a2;
  v8 = a2[1];
  xsltResolveAttrSet(a1, *a2, v8, a3, a4, 1);
  if (v8 != v7 && xmlHashAddEntry2(v7->attributeSets, (const xmlChar *)a3, a4, a1) < 0)
    xsltGenericError(xsltGenericErrorContext, "xsl:attribute-set : internal error, can't move imported  attribute set %s\n", a3);
}

void xsltAttribute(xsltTransformContextPtr ctxt, xmlNodePtr node, xmlNodePtr inst, xsltElemPreCompPtr comp)
{
  xmlNodePtr insert;
  const xmlChar *next;
  const char *v10;
  xsltTransformFunction func;
  const xmlChar *href;
  xmlChar *v13;
  const char *v14;
  xmlNsPtr v15;
  xmlChar *v16;
  xmlChar *v17;
  xmlChar *v18;
  xmlNs *SpecialNamespace;
  _xmlNode *children;
  xmlAttrPtr v21;
  xmlAttr *v22;
  _xmlDoc *doc;
  xmlNodePtr v24;
  xmlNodePtr v25;
  _xmlNode *v26;
  xmlDoc *v27;
  xmlChar *v28;
  xmlNode *v29;
  xmlNodePtr v30;
  xmlChar *prefix;

  prefix = 0;
  if (!ctxt)
    return;
  if (!node)
    return;
  if (!inst)
    return;
  if (inst->type != XML_ELEMENT_NODE)
    return;
  if (!comp[3].type)
    return;
  insert = ctxt->insert;
  if (!insert || insert->type != XML_ELEMENT_NODE)
    return;
  if (insert->children)
  {
    xsltTransformError(ctxt, 0, inst, "xsl:attribute: Cannot add attributes to an element if children have been already added to the element.\n");
    return;
  }
  if (ctxt->debugStatus)
    xslHandleDebugger(inst, node, 0, ctxt);
  next = (const xmlChar *)comp[3].next;
  if (next)
  {
    v10 = (const char *)xsltSplitQName(ctxt->dict, next, (const xmlChar **)&prefix);
  }
  else
  {
    v13 = xsltEvalAttrValueTemplate(ctxt, inst, (const xmlChar *)"name", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
    if (!v13)
    {
      xsltTransformError(ctxt, 0, inst, "xsl:attribute: The attribute 'name' is missing.\n");
      return;
    }
    v14 = (const char *)v13;
    if (xmlValidateQName(v13, 0))
      xsltTransformError(ctxt, 0, inst, "xsl:attribute: The effective name '%s' is not a valid QName.\n", v14);
    if (xmlStrEqual((const xmlChar *)v14, (const xmlChar *)"xmlns"))
    {
      xsltTransformError(ctxt, 0, inst, "xsl:attribute: The effective name 'xmlns' is not allowed.\n");
      ((void (*)(const char *))*MEMORY[0x24BEDE758])(v14);
      return;
    }
    v10 = (const char *)xsltSplitQName(ctxt->dict, (const xmlChar *)v14, (const xmlChar **)&prefix);
    ((void (*)(const char *))*MEMORY[0x24BEDE758])(v14);
  }
  if (!LODWORD(comp[3].inst))
  {
    if (prefix)
    {
      v15 = xmlSearchNs(inst->doc, inst, prefix);
      if (v15)
      {
        href = v15->href;
        goto LABEL_43;
      }
      xsltTransformError(ctxt, 0, inst, "xsl:attribute: The QName '%s:%s' has no namespace binding in scope in the stylesheet; this is an error, since th"
        "e namespace was not specified by the instruction itself.\n",
        (const char *)prefix,
        v10);
    }
LABEL_47:
    SpecialNamespace = 0;
    goto LABEL_50;
  }
  func = comp[3].func;
  if (func)
  {
    if (*(_BYTE *)func)
      href = (const xmlChar *)comp[3].func;
    else
      href = 0;
  }
  else
  {
    v16 = xsltEvalAttrValueTemplate(ctxt, inst, (const xmlChar *)"namespace", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
    v17 = v16;
    if (v16 && *v16)
      href = xmlDictLookup(ctxt->dict, v16, -1);
    else
      href = 0;
    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v17);
  }
  if (xmlStrEqual(href, (const xmlChar *)"http://www.w3.org/2000/xmlns/"))
  {
    xsltTransformError(ctxt, 0, inst, "xsl:attribute: Namespace http://www.w3.org/2000/xmlns/ forbidden.\n");
    return;
  }
  if (xmlStrEqual(href, (const xmlChar *)"http://www.w3.org/XML/1998/namespace"))
  {
    prefix = (xmlChar *)"xml";
  }
  else if (xmlStrEqual(prefix, (const xmlChar *)"xml"))
  {
    prefix = 0;
  }
LABEL_43:
  if (!href)
    goto LABEL_47;
  if (prefix && !xmlStrEqual(prefix, (const xmlChar *)"xmlns"))
  {
    SpecialNamespace = xsltGetSpecialNamespace(ctxt, inst, href, prefix, insert);
  }
  else
  {
    v18 = xmlStrdup((const xmlChar *)"ns_1");
    SpecialNamespace = xsltGetSpecialNamespace(ctxt, inst, href, v18, insert);
    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v18);
  }
  if (!SpecialNamespace)
  {
    xsltTransformError(ctxt, 0, inst, "Namespace fixup error: Failed to acquire an in-scope namespace binding for the generated attribute '{%s}%s'.\n");
    return;
  }
LABEL_50:
  children = inst->children;
  if (!children)
  {
    v29 = ctxt->insert;
LABEL_67:
    xmlSetNsProp(v29, SpecialNamespace, (const xmlChar *)v10, (const xmlChar *)&unk_209C1ADF6);
    return;
  }
  if (children->next || children->type - 3 > 1)
  {
    v28 = xsltEvalTemplateString(ctxt, node, inst);
    v29 = ctxt->insert;
    if (v28)
    {
      xmlSetNsProp(v29, SpecialNamespace, (const xmlChar *)v10, v28);
      ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v28);
      return;
    }
    goto LABEL_67;
  }
  v21 = xmlSetNsProp(ctxt->insert, SpecialNamespace, (const xmlChar *)v10, 0);
  if (!v21)
    return;
  v22 = v21;
  if (ctxt->internalized && (doc = ctxt->insert->doc) != 0 && doc->dict == ctxt->dict)
  {
    v30 = xmlNewText(0);
    if (!v30)
      return;
    v25 = v30;
    v26 = inst->children;
    v30->content = v26->content;
    if (v26->name == (const xmlChar *)MEMORY[0x24BEDEC70])
      v30->name = (const xmlChar *)MEMORY[0x24BEDEC70];
  }
  else
  {
    v24 = xmlNewText(inst->children->content);
    if (!v24)
      return;
    v25 = v24;
    v26 = inst->children;
  }
  v22->children = v25;
  v22->last = v25;
  v25->parent = (_xmlNode *)v22;
  v27 = v22->doc;
  v25->doc = v27;
  if (v26->name == (const xmlChar *)MEMORY[0x24BEDEC70])
    v25->name = (const xmlChar *)MEMORY[0x24BEDEC70];
  if (v25->content)
  {
    if (xmlIsID(v27, v22->parent, v22))
      xmlAddID(0, v22->doc, v25->content, v22);
  }
}

void xsltApplyAttributeSet(xsltTransformContextPtr ctxt, xmlNodePtr node, xmlNodePtr inst, const xmlChar *attributes)
{
  const xmlChar *content;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  const char *v11;
  const xmlChar *v12;
  const xmlChar *v13;
  xmlNsPtr v14;
  const xmlChar *href;
  xsltStylesheetPtr style;
  xmlHashTable *attributeSets;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *i;
  uint64_t v23;
  _xmlNode *children;
  xmlChar *prefix;

  content = attributes;
  prefix = 0;
  if (attributes
    || inst
    && inst->type == XML_ATTRIBUTE_NODE
    && (children = inst->children) != 0
    && (content = children->content) != 0)
  {
    v7 = *content;
    if (*content)
    {
      while (1)
      {
        if (v7 > 0x20)
          goto LABEL_7;
        if (((1 << v7) & 0x100002600) != 0)
        {
          v8 = *++content;
          v7 = v8;
        }
        else
        {
          if (!v7)
            return;
LABEL_7:
          v9 = 0;
          while (v7 > 0x20 || ((1 << v7) & 0x100002601) == 0)
            v7 = content[++v9];
          if (v9 >= 0x7FFFFFFF)
            v10 = 0x7FFFFFFF;
          else
            v10 = v9;
          v11 = (const char *)xmlDictLookup(ctxt->dict, content, v10);
          if (v11)
          {
            v12 = (const xmlChar *)v11;
            xsltGenericDebug(xsltGenericDebugContext, "apply attribute set %s\n", v11);
            if (xmlValidateQName(v12, 0))
            {
              xsltTransformError(ctxt, 0, inst, "The name '%s' in use-attribute-sets is not a valid QName.\n");
              return;
            }
            v13 = xsltSplitQName(ctxt->dict, v12, (const xmlChar **)&prefix);
            if (prefix)
            {
              v14 = xmlSearchNs(inst->doc, inst, prefix);
              if (!v14)
              {
                xsltTransformError(ctxt, 0, inst, "use-attribute-set : No namespace found for QName '%s:%s'\n");
                return;
              }
              href = v14->href;
            }
            else
            {
              href = 0;
            }
            style = ctxt->style;
            if (ctxt->style)
            {
              attributeSets = style->attributeSets;
              if (attributeSets)
              {
                if (ctxt->debugStatus)
                {
                  v18 = xmlHashLookup2(attributeSets, v13, href);
                  if (v18)
                  {
                    v19 = v18[1];
                    if (v19)
                    {
                      v20 = *(_QWORD *)(v19 + 8);
                      if (v20)
                        xslHandleDebugger(*(xmlNodePtr *)(v20 + 40), node, 0, ctxt);
                    }
                  }
                }
              }
            }
            v21 = xmlHashLookup2(style->attributeSets, v13, href);
            if (v21)
            {
              for (i = (_QWORD *)v21[1]; i; i = (_QWORD *)*i)
              {
                v23 = i[1];
                if (v23)
                  xsltAttribute(ctxt, node, (xmlNodePtr)v23, *(xsltElemPreCompPtr *)(v23 + 104));
              }
            }
          }
          content += v9;
          v7 = *content;
          if (!*content)
            return;
        }
      }
    }
  }
}

void xsltFreeAttributeSetsHashes(xsltStylesheetPtr style)
{
  xmlHashTable *attributeSets;

  attributeSets = style->attributeSets;
  if (attributeSets)
    xmlHashFree(attributeSets, (xmlHashDeallocator)xsltFreeAttributeSetsEntry);
  style->attributeSets = 0;
}

_QWORD *xsltNewAttrSet()
{
  _QWORD *v0;
  _QWORD *v1;

  v0 = (_QWORD *)((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(24);
  v1 = v0;
  if (v0)
  {
    *v0 = 0;
    v0[1] = 0;
    v0[2] = 0;
  }
  else
  {
    xsltGenericError(xsltGenericErrorContext, "xsltNewAttrSet : malloc failed\n");
  }
  return v1;
}

_QWORD *xsltNewAttrElem(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = (_QWORD *)((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(16);
  v3 = v2;
  if (v2)
  {
    *v2 = 0;
    v2[1] = a1;
  }
  else
  {
    xsltGenericError(xsltGenericErrorContext, "xsltNewAttrElem : malloc failed\n");
  }
  return v3;
}

_QWORD *xsltNewUseAttrSet(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = (_QWORD *)((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(24);
  v5 = v4;
  if (v4)
  {
    *v4 = 0;
    v4[1] = a1;
    v4[2] = a2;
  }
  else
  {
    xsltGenericError(xsltGenericErrorContext, "xsltNewUseAttrSet : malloc failed\n");
  }
  return v5;
}

void xsltResolveAttrSet(_QWORD *a1, xsltStylesheetPtr style, xsltStylesheet *a3, const char *a4, const xmlChar *a5, int a6)
{
  xsltStylesheetPtr Import;
  xsltStylesheetPtr v12;
  xmlHashTable *attributeSets;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;

  if (*(_DWORD *)a1 != 2)
  {
    if (*(_DWORD *)a1 == 1)
    {
      xsltTransformError(0, style, 0, "xsl:attribute-set : use-attribute-sets recursion detected on %s\n", a4);
      ++style->errors;
    }
    else
    {
      if (a6 >= 101)
      {
        xsltTransformError(0, style, 0, "xsl:attribute-set : use-attribute-sets maximum recursion depth exceeded on %s\n", a4);
        ++style->errors;
        return;
      }
      *(_DWORD *)a1 = 1;
      xsltResolveUseAttrSets(a1, style);
      Import = xsltNextImport(a3);
      if (Import)
      {
        v12 = Import;
        do
        {
          attributeSets = v12->attributeSets;
          if (attributeSets)
          {
            v14 = xmlHashLookup2(attributeSets, (const xmlChar *)a4, a5);
            if (v14)
            {
              v21 = v14;
              xsltGenericDebug(xsltGenericDebugContext, "xsl:attribute-set : merging import for %s\n", v15, v16, v17, v18, v19, v20, (char)a4);
              xsltResolveUseAttrSets(v21, style);
              xsltMergeAttrSets(a1, (uint64_t)v21);
              xmlHashRemoveEntry2(v12->attributeSets, (const xmlChar *)a4, a5, 0);
              xsltFreeAttrSet((uint64_t)v21);
            }
          }
          v12 = xsltNextImport(v12);
        }
        while (v12);
      }
    }
    *(_DWORD *)a1 = 2;
  }
}

_QWORD *xsltResolveUseAttrSets(_QWORD *result, xsltStylesheetPtr style)
{
  _QWORD *v2;
  uint64_t *v3;
  uint64_t (**v5)(uint64_t *);
  xsltStylesheetPtr Import;
  xmlHashTable *attributeSets;
  void *v8;
  uint64_t v9;
  uint64_t *v10;

  v2 = result;
  v3 = (uint64_t *)result[2];
  if (v3)
  {
    v5 = (uint64_t (**)(uint64_t *))MEMORY[0x24BEDE758];
    do
    {
      if (style)
      {
        Import = style;
        while (1)
        {
          attributeSets = Import->attributeSets;
          if (attributeSets)
          {
            v8 = xmlHashLookup2(attributeSets, (const xmlChar *)v3[1], (const xmlChar *)v3[2]);
            if (v8)
              break;
          }
          Import = xsltNextImport(Import);
          if (!Import)
            goto LABEL_10;
        }
        v9 = (uint64_t)v8;
        xsltResolveAttrSet((int)v8, style);
        xsltMergeAttrSets(v2, v9);
      }
LABEL_10:
      v10 = (uint64_t *)*v3;
      result = (_QWORD *)(*v5)(v3);
      v3 = v10;
    }
    while (v10);
  }
  v2[2] = 0;
  return result;
}

_QWORD *xsltMergeAttrSets(_QWORD *result, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD **)(a2 + 8);
  if (v2)
  {
    v3 = result;
    do
    {
      v4 = (_QWORD *)v3[1];
      while (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)(v4[1] + 104);
        result = (_QWORD *)v2[1];
        v7 = result[13];
        if (*(_QWORD *)(v6 + 120) == *(_QWORD *)(v7 + 120) && *(_QWORD *)(v6 + 136) == *(_QWORD *)(v7 + 136))
          goto LABEL_10;
        v4 = (_QWORD *)*v5;
        if (!*v5)
        {
          result = xsltNewAttrElem((uint64_t)result);
          *v5 = result;
          goto LABEL_10;
        }
      }
      result = xsltNewAttrElem(v2[1]);
      v3[1] = result;
LABEL_10:
      v2 = (_QWORD *)*v2;
    }
    while (v2);
  }
  return result;
}

uint64_t xsltFreeAttrSet(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;
  void (**v3)(void);
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;

  if (result)
  {
    v1 = result;
    v2 = *(_QWORD **)(result + 8);
    v3 = (void (**)(void))MEMORY[0x24BEDE758];
    if (v2)
    {
      do
      {
        v4 = (_QWORD *)*v2;
        (*v3)();
        v2 = v4;
      }
      while (v4);
    }
    v5 = *(_QWORD **)(v1 + 16);
    if (v5)
    {
      do
      {
        v6 = (_QWORD *)*v5;
        (*v3)();
        v5 = v6;
      }
      while (v6);
    }
    return ((uint64_t (*)(uint64_t))*v3)(v1);
  }
  return result;
}

void xsltFreeAVTList(void *avt)
{
  _DWORD *v1;
  void (**v2)(void);
  _DWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  if (avt)
  {
    v1 = avt;
    v2 = (void (**)(void))MEMORY[0x24BEDE758];
    do
    {
      v3 = *(_DWORD **)v1;
      v4 = v1[2];
      if (v1[4] == 1)
      {
        if (v4 >= 1)
        {
          v5 = 0;
          do
          {
            if (*(_QWORD *)&v1[2 * v5 + 10])
            {
              (*v2)();
              v4 = v1[2];
            }
            v5 += 2;
          }
          while (v4 > (int)v5);
          if (v4 >= 2)
          {
            v6 = 6;
            do
            {
              xmlXPathFreeCompExpr(*(xmlXPathCompExprPtr *)&v1[2 * v6]);
              v6 += 2;
            }
            while (v1[2] > (int)v6 - 5);
          }
        }
      }
      else if (v4 >= 1)
      {
        v7 = 0;
        do
        {
          xmlXPathFreeCompExpr(*(xmlXPathCompExprPtr *)&v1[2 * v7 + 10]);
          v7 += 2;
          v8 = v1[2];
        }
        while (v8 > (int)v7);
        if (v8 >= 2)
        {
          v9 = 6;
          do
          {
            if (*(_QWORD *)&v1[2 * v9])
            {
              (*v2)();
              v8 = v1[2];
            }
            v9 += 2;
          }
          while (v8 > (int)v9 - 5);
        }
      }
      if (*((_QWORD *)v1 + 3))
        (*v2)();
      ((void (*)(_DWORD *))*v2)(v1);
      v1 = v3;
    }
    while (v3);
  }
}

void xsltCompileAttr(xsltStylesheetPtr style, xmlAttrPtr attr)
{
  _xmlNode *children;
  xmlChar *content;
  void *v6;
  uint64_t v7;
  xmlNsPtr *NsList;
  int v9;
  uint64_t v10;
  int v11;
  void (**v12)(xmlChar *);
  xmlChar *v13;
  uint64_t v14;
  unsigned __int8 *i;
  int v16;
  unsigned __int8 *v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  unsigned int v22;
  unsigned __int8 *v23;
  int v24;
  int v25;
  BOOL v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  xmlChar *v34;
  xmlXPathCompExpr *v35;

  if (style)
  {
    if (attr)
    {
      children = attr->children;
      if (children)
      {
        if (children->type != XML_TEXT_NODE || children->next)
        {
          xsltTransformError(0, style, attr->parent, "Attribute '%s': The content is expected to be a single text node when compiling an AVT.\n", (const char *)attr->name);
          ++style->errors;
          return;
        }
        content = children->content;
        if (xmlStrchr(content, 0x7Bu) || xmlStrchr(content, 0x7Du))
        {
          xsltGenericDebug(xsltGenericDebugContext, "Found AVT %s: %s\n", (const char *)attr->name, (const char *)content);
          if (attr->psvi)
          {
            xsltGenericDebug(xsltGenericDebugContext, "AVT %s: already compiled\n", (const char *)attr->name);
            return;
          }
          v6 = (void *)xsltNewAttrVT(style);
          if (v6)
          {
            v7 = (uint64_t)v6;
            attr->psvi = v6;
            NsList = xmlGetNsList(attr->doc, attr->parent);
            *(_QWORD *)(v7 + 24) = NsList;
            if (NsList)
            {
              v9 = -1;
              do
              {
                v10 = (uint64_t)*NsList++;
                ++v9;
              }
              while (v10);
            }
            else
            {
              v9 = 0;
            }
            v11 = 0;
            *(_DWORD *)(v7 + 32) = v9;
            v12 = (void (**)(xmlChar *))MEMORY[0x24BEDE758];
LABEL_19:
            v13 = 0;
            while (1)
            {
              v14 = 0;
              for (i = content + 1; ; ++i)
              {
                v16 = *(i - 1);
                if (!*(i - 1))
                {
                  if (v13 || v14 >= 1)
                  {
                    if (v14 >= 0x7FFFFFFF)
                      v32 = 0x7FFFFFFF;
                    else
                      v32 = v14;
                    v13 = xmlStrncat(v13, content, v32);
                    if (!*(_DWORD *)(v7 + 8))
                      *(_DWORD *)(v7 + 16) = 1;
                    v33 = xsltSetAttrVTsegment(v7, (uint64_t)v13);
                    v34 = 0;
                    v35 = 0;
                    if (v33)
                    {
                      v13 = 0;
                      v7 = v33;
                    }
                    goto LABEL_85;
                  }
                  v13 = 0;
                  goto LABEL_76;
                }
                if (v16 == 125)
                {
                  v17 = i;
                  if (*i != 125)
                  {
                    xsltTransformError(0, style, attr->parent, "Attribute '%s': The AVT has an unmatched '}'.\n", (const char *)attr->name);
LABEL_76:
                    v34 = 0;
                    goto LABEL_77;
                  }
                  goto LABEL_31;
                }
                if (v16 == 123)
                  break;
                ++v14;
              }
              v17 = i - 1;
              v18 = *i;
              if (v18 == 123)
              {
                v17 = i;
              }
              else if (v18 != 125)
              {
                if (v13 || v14 >= 1)
                {
                  if (v14 >= 0x7FFFFFFF)
                    v20 = 0x7FFFFFFF;
                  else
                    v20 = v14;
                  v13 = xmlStrncat(v13, content, v20);
                  if (!*(_DWORD *)(v7 + 8))
                    *(_DWORD *)(v7 + 16) = 1;
                  v21 = xsltSetAttrVTsegment(v7, (uint64_t)v13);
                  if (v21)
                  {
                    v11 = 0;
                    content = i - 1;
                    v7 = v21;
                    goto LABEL_44;
                  }
                  goto LABEL_76;
                }
                while (1)
                {
LABEL_44:
                  v22 = *i;
                  if (v22 > 0x26)
                  {
                    if (v22 != 39)
                    {
                      if (v22 == 125)
                      {
                        v27 = v11;
                        if (i - (content + 1) >= 0x7FFFFFFF)
                          v28 = 0x7FFFFFFF;
                        else
                          v28 = (_DWORD)i - ((_DWORD)content + 1);
                        v34 = xmlStrndup(content + 1, v28);
                        if (v34)
                        {
                          v35 = xsltXPathCompile(style, v34);
                          if (v35)
                          {
                            if (!*(_DWORD *)(v7 + 8))
                              *(_DWORD *)(v7 + 16) = 0;
                            if (v27 == 1)
                            {
                              v29 = xsltSetAttrVTsegment(v7, 0);
                              if (!v29)
                              {
                                xsltTransformError(0, style, attr->parent, "out of memory\n");
                                v13 = 0;
                                goto LABEL_85;
                              }
                            }
                            else
                            {
                              v29 = v7;
                            }
                            v30 = v29;
                            v31 = xsltSetAttrVTsegment(v29, (uint64_t)v35);
                            if (v31)
                            {
                              v7 = v31;
                              (*v12)(v34);
                              content = i + 1;
                              v11 = 1;
                              goto LABEL_19;
                            }
                            xsltTransformError(0, style, attr->parent, "out of memory\n");
                            v13 = 0;
                            v7 = v30;
LABEL_85:
                            if (attr->psvi != (void *)v7)
                            {
                              attr->psvi = (void *)v7;
                              style->attVTs = (void *)v7;
                            }
                            if (v13)
                              (*v12)(v13);
                            if (v34)
                              (*v12)(v34);
                            if (v35)
                              xmlXPathFreeCompExpr(v35);
                            return;
                          }
                          xsltTransformError(0, style, attr->parent, "Attribute '%s': Failed to compile the expression '%s' in the AVT.\n", (const char *)attr->name, (const char *)v34);
                          v13 = 0;
LABEL_93:
                          ++style->errors;
                          goto LABEL_85;
                        }
                        xsltGenericError(xsltGenericErrorContext, "Unimplemented block at %s:%d\n", "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libxslt/attrvt.c", 284);
                        v13 = 0;
LABEL_77:
                        v35 = 0;
                        goto LABEL_85;
                      }
                      goto LABEL_59;
                    }
                  }
                  else if (v22 != 34)
                  {
                    if (!*i)
                    {
                      xsltTransformError(0, style, attr->parent, "Attribute '%s': The AVT has an unmatched '{'.\n", (const char *)attr->name);
                      v13 = 0;
                      v34 = 0;
                      v35 = 0;
                      goto LABEL_93;
                    }
LABEL_59:
                    ++i;
                    continue;
                  }
                  v23 = i + 1;
                  do
                  {
                    v25 = *v23++;
                    v24 = v25;
                    if (v25)
                      v26 = v24 == v22;
                    else
                      v26 = 1;
                  }
                  while (!v26);
                  if (v24)
                    i = v23;
                  else
                    i = v23 - 1;
                }
              }
LABEL_31:
              if (v17 - content >= 0x7FFFFFFF)
                v19 = 0x7FFFFFFF;
              else
                v19 = (_DWORD)v17 - (_DWORD)content;
              v13 = xmlStrncat(v13, content, v19);
              content = i + 1;
            }
          }
        }
      }
    }
  }
}

uint64_t xsltNewAttrVT(xsltStylesheet *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = ((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(120);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)v2 = 0u;
    *(_OWORD *)(v2 + 16) = 0u;
    *(_QWORD *)(v2 + 112) = 0;
    *(_OWORD *)(v2 + 80) = 0u;
    *(_OWORD *)(v2 + 96) = 0u;
    *(_OWORD *)(v2 + 48) = 0u;
    *(_OWORD *)(v2 + 64) = 0u;
    *(_OWORD *)(v2 + 32) = 0u;
    *(_QWORD *)(v2 + 8) = 0xA00000000;
    *(_DWORD *)(v2 + 16) = 0;
    *(_QWORD *)v2 = a1->attVTs;
    a1->attVTs = (void *)v2;
  }
  else
  {
    xsltTransformError(0, a1, 0, "xsltNewAttrVTPtr : malloc failed\n");
    ++a1->errors;
  }
  return v3;
}

uint64_t xsltSetAttrVTsegment(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;

  v3 = *(_DWORD *)(result + 8);
  if (v3 >= *(_DWORD *)(result + 12))
  {
    result = ((uint64_t (*)(void))*MEMORY[0x24BEDEB10])();
    if (!result)
      return result;
    v4 = result + 8 * *(int *)(result + 8);
    *(_OWORD *)(v4 + 104) = 0u;
    *(_OWORD *)(v4 + 88) = 0u;
    *(_OWORD *)(v4 + 72) = 0u;
    *(_OWORD *)(v4 + 56) = 0u;
    *(_OWORD *)(v4 + 40) = 0u;
    v3 = *(_DWORD *)(result + 8);
    *(_DWORD *)(result + 12) += 10;
  }
  *(_DWORD *)(result + 8) = v3 + 1;
  *(_QWORD *)(result + 8 * v3 + 40) = a2;
  return result;
}

xmlChar *__cdecl xsltEvalAVT(xsltTransformContextPtr ctxt, void *avt, xmlNodePtr node)
{
  xmlChar *v3;
  uint64_t v6;
  int v7;
  void (**v8)(xmlChar *);
  xmlChar *v9;
  xmlChar *v10;
  xmlChar *v11;

  v3 = 0;
  if (ctxt && avt && node)
  {
    if (*((int *)avt + 2) < 1)
    {
      return 0;
    }
    else
    {
      v6 = 0;
      v3 = 0;
      v7 = *((_DWORD *)avt + 4);
      v8 = (void (**)(xmlChar *))MEMORY[0x24BEDE758];
      do
      {
        v9 = (xmlChar *)*((_QWORD *)avt + v6 + 5);
        if (v7)
        {
          v3 = xmlStrcat(v3, v9);
        }
        else
        {
          v10 = xsltEvalXPathStringNs(ctxt, (xmlXPathCompExprPtr)v9, *((_DWORD *)avt + 8), *((xmlNsPtr **)avt + 3));
          if (v10)
          {
            v11 = v10;
            if (v3)
            {
              v3 = xmlStrcat(v3, v10);
              (*v8)(v11);
            }
            else
            {
              v3 = v10;
            }
          }
        }
        v7 = v7 == 0;
        ++v6;
      }
      while (v6 < *((int *)avt + 2));
    }
  }
  return v3;
}

xmlDocPtr xsltDocDefaultLoaderFunc(const char *a1, xmlDict *a2, int a3)
{
  xmlParserCtxtPtr v6;
  xmlParserCtxt *v7;
  xmlDict *dict;
  xmlParserInput *ExternalEntity;
  xmlDocPtr myDoc;

  v6 = xmlNewParserCtxt();
  if (!v6)
    return 0;
  v7 = v6;
  if (a2)
  {
    dict = v6->dict;
    if (dict)
      xmlDictFree(dict);
    v7->dict = a2;
    xmlDictReference(a2);
    xsltGenericDebug(xsltGenericDebugContext, "Reusing dictionary for document\n");
  }
  xmlCtxtUseOptions(v7, a3);
  ExternalEntity = xmlLoadExternalEntity(a1, 0, v7);
  if (ExternalEntity)
  {
    inputPush(v7, ExternalEntity);
    if (!v7->directory)
      v7->directory = xmlParserGetDirectory(a1);
    xmlParseDocument(v7);
    myDoc = v7->myDoc;
    if (!v7->wellFormed)
    {
      xmlFreeDoc(v7->myDoc);
      myDoc = 0;
      v7->myDoc = 0;
    }
  }
  else
  {
    myDoc = 0;
  }
  xmlFreeParserCtxt(v7);
  return myDoc;
}

void xsltSetLoaderFunc(xsltDocLoaderFunc f)
{
  xmlDocPtr (__cdecl *v1)(const xmlChar *, xmlDictPtr, int, void *, xsltLoadType);

  v1 = (xmlDocPtr (__cdecl *)(const xmlChar *, xmlDictPtr, int, void *, xsltLoadType))xsltDocDefaultLoaderFunc;
  if (f)
    v1 = f;
  xsltDocDefaultLoader = v1;
}

xsltDocumentPtr xsltNewDocument(xsltTransformContextPtr ctxt, xmlDocPtr doc)
{
  uint64_t v4;
  xsltDocument *v5;
  char *name;

  v4 = ((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(48);
  v5 = (xsltDocument *)v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 16) = 0u;
    *(_OWORD *)(v4 + 32) = 0u;
    *(_OWORD *)v4 = 0u;
    *(_QWORD *)(v4 + 16) = doc;
    if (ctxt)
    {
      if (!doc || doc->type != XML_DOCUMENT_NODE || (name = doc->name) == 0 || *name != 32)
      {
        *(_QWORD *)v4 = ctxt->docList;
        ctxt->docList = (xsltDocumentPtr)v4;
      }
    }
  }
  else
  {
    xsltTransformError(ctxt, 0, (xmlNodePtr)doc, "xsltNewDocument : malloc failed\n");
  }
  return v5;
}

xsltDocumentPtr xsltNewStyleDocument(xsltStylesheetPtr style, xmlDocPtr doc)
{
  uint64_t v4;
  xsltDocument *v5;

  v4 = ((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(48);
  v5 = (xsltDocument *)v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 16) = 0u;
    *(_OWORD *)(v4 + 32) = 0u;
    *(_OWORD *)v4 = 0u;
    *(_QWORD *)(v4 + 16) = doc;
    if (style)
    {
      *(_QWORD *)v4 = style->docList;
      style->docList = (xsltDocumentPtr)v4;
    }
  }
  else
  {
    xsltTransformError(0, style, (xmlNodePtr)doc, "xsltNewStyleDocument : malloc failed\n");
  }
  return v5;
}

void xsltFreeStyleDocuments(xsltStylesheetPtr style)
{
  xsltDocumentPtr docList;
  void (**v2)(xsltDocumentPtr);
  xsltDocument *next;

  if (style)
  {
    docList = style->docList;
    if (docList)
    {
      v2 = (void (**)(xsltDocumentPtr))MEMORY[0x24BEDE758];
      do
      {
        next = docList->next;
        xsltFreeDocumentKeys(docList);
        if (!docList->main)
          xmlFreeDoc(docList->doc);
        (*v2)(docList);
        docList = next;
      }
      while (next);
    }
  }
}

void xsltFreeDocuments(xsltTransformContextPtr ctxt)
{
  xsltDocumentPtr docList;
  void (**v3)(xsltDocumentPtr);
  xsltDocument *next;
  xsltDocumentPtr styleList;
  xsltDocument *v6;

  docList = ctxt->docList;
  v3 = (void (**)(xsltDocumentPtr))MEMORY[0x24BEDE758];
  if (docList)
  {
    do
    {
      next = docList->next;
      xsltFreeDocumentKeys(docList);
      if (!docList->main)
        xmlFreeDoc(docList->doc);
      (*v3)(docList);
      docList = next;
    }
    while (next);
  }
  styleList = ctxt->styleList;
  if (styleList)
  {
    do
    {
      v6 = styleList->next;
      xsltFreeDocumentKeys(styleList);
      if (!styleList->main)
        xmlFreeDoc(styleList->doc);
      (*v3)(styleList);
      styleList = v6;
    }
    while (v6);
  }
}

xsltDocumentPtr xsltLoadDocument(xsltTransformContextPtr ctxt, const xmlChar *URI)
{
  xsltDocumentPtr i;
  xsltSecurityPrefs *sec;
  int v6;
  xmlDocPtr doc;
  const xmlChar *URL;
  xmlDoc *v9;
  xmlDoc *v10;
  xmlNode *RootElement;

  i = 0;
  if (!ctxt || !URI)
    return i;
  sec = (xsltSecurityPrefs *)ctxt->sec;
  if (sec)
  {
    v6 = xsltCheckRead(sec, ctxt, URI);
    if (v6 <= 0)
    {
      if (!v6)
        xsltTransformError(ctxt, 0, 0, "xsltLoadDocument: read rights for %s denied\n", (const char *)URI);
      return 0;
    }
  }
  for (i = ctxt->docList; i; i = i->next)
  {
    doc = i->doc;
    if (doc)
    {
      URL = doc->URL;
      if (URL)
      {
        if (xmlStrEqual(URL, URI))
          return i;
      }
    }
  }
  v9 = xsltDocDefaultLoader(URI, ctxt->dict, ctxt->parserOptions, ctxt, XSLT_LOAD_DOCUMENT);
  if (!v9)
    return 0;
  v10 = v9;
  if (ctxt->xinclude)
    xmlXIncludeProcessFlags(v9, ctxt->parserOptions);
  if (xsltNeedElemSpaceHandling(ctxt))
  {
    RootElement = xmlDocGetRootElement(v10);
    xsltApplyStripSpaces(ctxt, RootElement);
  }
  if (!ctxt->debugStatus)
    xmlXPathOrderDocElems(v10);
  return xsltNewDocument(ctxt, v10);
}

xsltDocumentPtr xsltLoadStyleDocument(xsltStylesheetPtr style, const xmlChar *URI)
{
  xsltDocumentPtr i;
  xsltSecurityPrefs *DefaultSecurityPrefs;
  int v6;
  xmlDocPtr doc;
  const xmlChar *URL;
  xmlDoc *v9;

  i = 0;
  if (style && URI)
  {
    DefaultSecurityPrefs = xsltGetDefaultSecurityPrefs();
    if (DefaultSecurityPrefs && (v6 = xsltCheckRead(DefaultSecurityPrefs, 0, URI), v6 <= 0))
    {
      if (!v6)
        xsltTransformError(0, 0, 0, "xsltLoadStyleDocument: read rights for %s denied\n", (const char *)URI);
    }
    else
    {
      for (i = style->docList; i; i = i->next)
      {
        doc = i->doc;
        if (doc)
        {
          URL = doc->URL;
          if (URL)
          {
            if (xmlStrEqual(URL, URI))
              return i;
          }
        }
      }
      v9 = xsltDocDefaultLoader(URI, style->dict, 16398, style, XSLT_LOAD_STYLESHEET);
      if (v9)
        return xsltNewStyleDocument(style, v9);
    }
    return 0;
  }
  return i;
}

xsltDocumentPtr xsltFindDocument(xsltTransformContextPtr ctxt, xmlDocPtr doc)
{
  xsltDocumentPtr result;

  result = 0;
  if (ctxt && doc)
  {
    result = (xsltDocumentPtr)&ctxt->docList;
    while (1)
    {
      result = result->next;
      if (!result)
        break;
      if (result->doc == doc)
        return result;
    }
    if (ctxt->style->doc == doc)
      return ctxt->document;
    else
      return 0;
  }
  return result;
}

void xsltFreeExts(xsltStylesheetPtr style)
{
  _QWORD *nsDefs;
  void (**v2)(void);
  _QWORD *v3;

  nsDefs = style->nsDefs;
  if (nsDefs)
  {
    v2 = (void (**)(void))MEMORY[0x24BEDE758];
    do
    {
      v3 = (_QWORD *)*nsDefs;
      if (nsDefs[1])
        (*v2)();
      if (nsDefs[2])
        (*v2)();
      ((void (*)(_QWORD *))*v2)(nsDefs);
      nsDefs = v3;
    }
    while (v3);
  }
}

int xsltRegisterExtPrefix(xsltStylesheetPtr style, const xmlChar *prefix, const xmlChar *URI)
{
  int result;
  void **p_nsDefs;
  void **v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  void *v12;

  result = -1;
  if (style && URI)
  {
    xsltGenericDebug(xsltGenericDebugContext, "Registering extension namespace '%s'.\n", (const char *)URI);
    p_nsDefs = &style->nsDefs;
    v8 = &style->nsDefs;
    while (1)
    {
      v8 = (void **)*v8;
      if (!v8)
        break;
      if (xmlStrEqual(prefix, (const xmlChar *)v8[1]))
        return -1;
    }
    v9 = ((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(32);
    if (!v9)
    {
      xsltTransformError(0, 0, 0, "xsltNewExtDef : malloc failed\n");
      return -1;
    }
    v10 = (_QWORD *)v9;
    *(_OWORD *)v9 = 0u;
    *(_OWORD *)(v9 + 16) = 0u;
    if (prefix)
      *(_QWORD *)(v9 + 8) = xmlStrdup(prefix);
    v10[2] = xmlStrdup(URI);
    *v10 = *p_nsDefs;
    *p_nsDefs = v10;
    if (xsltExtensionsHash)
    {
      xmlMutexLock((xmlMutexPtr)xsltExtMutex);
      v11 = xmlHashLookup((xmlHashTablePtr)xsltExtensionsHash, URI);
      xmlMutexUnlock((xmlMutexPtr)xsltExtMutex);
      if (v11
        || !xsltExtModuleRegisterDynamic(URI)
        && (xmlMutexLock((xmlMutexPtr)xsltExtMutex),
            v12 = xmlHashLookup((xmlHashTablePtr)xsltExtensionsHash, URI),
            xmlMutexUnlock((xmlMutexPtr)xsltExtMutex),
            v12))
      {
        xsltStyleGetExtData(style, URI);
      }
    }
    return 0;
  }
  return result;
}

uint64_t xsltExtModuleRegisterDynamic(const xmlChar *a1)
{
  void *v2;
  const xmlChar *v3;
  const xmlChar *v4;
  xmlChar *v5;
  xmlChar *i;
  int v7;
  int v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  xmlModulePtr v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  xmlModule *v37;
  xmlChar *v38;
  xmlChar *v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void (**v49)(xmlChar *);
  void *result;
  xmlChar buf[1024];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  if (!xsltModuleHash)
  {
    xsltModuleHash = (uint64_t)xmlHashCreate(5);
    if (!xsltModuleHash)
      return 0xFFFFFFFFLL;
  }
  xmlMutexLock((xmlMutexPtr)xsltExtMutex);
  v2 = xmlHashLookup((xmlHashTablePtr)xsltModuleHash, a1);
  xmlMutexUnlock((xmlMutexPtr)xsltExtMutex);
  if (v2)
    return 0xFFFFFFFFLL;
  v3 = xmlStrstr(a1, (const xmlChar *)"://");
  v4 = v3 ? v3 + 3 : a1;
  v5 = xmlStrdup(v4);
  if (!v5)
    return 0xFFFFFFFFLL;
  bzero(buf, 0x400uLL);
  for (i = v5; ; ++i)
  {
    v7 = *i;
    if ((v7 - 45) <= 0x2F && ((1 << (v7 - 45)) & 0x800000000007) != 0)
    {
      *i = 95;
      continue;
    }
    if (!*i)
      break;
  }
  while (i > v5)
  {
    v9 = *--i;
    if (v9 != 95)
      break;
    *i = 0;
  }
  v10 = getenv("LIBXSLT_PLUGINS_PATH");
  if (v10)
  {
    v17 = v10;
    xsltGenericDebug(xsltGenericDebugContext, "LIBXSLT_PLUGINS_PATH is %s\n", v11, v12, v13, v14, v15, v16, (char)v10);
  }
  else
  {
    v17 = "/usr/lib/libxslt-plugins";
  }
  xmlStrPrintf(buf, 1024, "%s/%s%s", v17, (const char *)v5, ".so");
  xsltGenericDebug(xsltGenericDebugContext, "Attempting to load plugin: %s for URI: %s\n", v18, v19, v20, v21, v22, v23, (char)buf);
  if (xmlCheckFilename((const char *)buf) != 1)
  {
    xsltGenericDebug(xsltGenericDebugContext, "xmlCheckFilename failed for plugin: %s\n", v24, v25, v26, v27, v28, v29, (char)buf);
LABEL_28:
    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v5);
    return 0xFFFFFFFFLL;
  }
  v30 = xmlModuleOpen((const char *)buf, 0);
  if (!v30)
  {
    xsltGenericDebug(xsltGenericDebugContext, "xmlModuleOpen failed for plugin: %s\n", v31, v32, v33, v34, v35, v36, (char)buf);
    goto LABEL_28;
  }
  v37 = v30;
  v38 = xmlStrdup(v5);
  v39 = xmlStrcat(v38, (const xmlChar *)"_init");
  result = 0;
  v40 = xmlModuleSymbol(v37, (const char *)v39, &result);
  v47 = result;
  if (v40)
  {
    xsltGenericDebug(xsltGenericDebugContext, "xmlModuleSymbol failed for plugin: %s, regfunc: %s\n", v41, v42, v43, v44, v45, v46, (char)buf);
    xmlModuleClose(v37);
  }
  else
  {
    ((void (*)(void))result)();
    xmlMutexLock((xmlMutexPtr)xsltExtMutex);
    xmlHashAddEntry((xmlHashTablePtr)xsltModuleHash, a1, v37);
    xmlMutexUnlock((xmlMutexPtr)xsltExtMutex);
  }
  v49 = (void (**)(xmlChar *))MEMORY[0x24BEDE758];
  ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v5);
  (*v49)(v39);
  if (v47)
    return 0;
  else
    return 0xFFFFFFFFLL;
}

void *__cdecl xsltStyleGetExtData(xsltStylesheetPtr style, const xmlChar *URI)
{
  void *result;
  xsltStylesheetPtr Import;
  xmlHashTable *extInfos;
  void *v7;
  uint64_t (**v8)(xsltStylesheetPtr, const xmlChar *);
  uint64_t v9;
  uint64_t (***v10)(xsltStylesheetPtr, const xmlChar *);
  uint64_t (***v11)(xsltStylesheetPtr, const xmlChar *);
  uint64_t (*v12)(xsltStylesheetPtr, const xmlChar *);

  result = 0;
  if (style && URI && xsltExtensionsHash)
  {
    Import = style;
    do
    {
      extInfos = Import->extInfos;
      if (extInfos)
      {
        v7 = xmlHashLookup(extInfos, URI);
        if (v7)
          return (void *)*((_QWORD *)v7 + 1);
      }
      Import = xsltNextImport(Import);
    }
    while (Import);
    if (!xsltExtensionsHash
      || (xmlMutexLock((xmlMutexPtr)xsltExtMutex),
          v8 = (uint64_t (**)(xsltStylesheetPtr, const xmlChar *))xmlHashLookup((xmlHashTablePtr)xsltExtensionsHash, URI), xmlMutexUnlock((xmlMutexPtr)xsltExtMutex), !v8))
    {
      xsltGenericDebug(xsltGenericDebugContext, "Not registered extension module: %s\n", (const char *)URI);
      return 0;
    }
    if (style->extInfos || (result = xmlHashCreate(10), (style->extInfos = (xmlHashTablePtr)result) != 0))
    {
      if (v8[2])
      {
        xsltGenericDebug(xsltGenericDebugContext, "Initializing module with callback: %s\n", (const char *)URI);
        v9 = v8[2](style, URI);
      }
      else
      {
        xsltGenericDebug(xsltGenericDebugContext, "Initializing module with *no* callback: %s\n", (const char *)URI);
        v9 = 0;
      }
      v10 = (uint64_t (***)(xsltStylesheetPtr, const xmlChar *))((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(16);
      if (v10)
      {
        v11 = v10;
        *v10 = v8;
        v10[1] = (uint64_t (**)(xsltStylesheetPtr, const xmlChar *))v9;
        if ((xmlHashAddEntry(style->extInfos, URI, v10) & 0x80000000) == 0)
          return v11[1];
        xsltTransformError(0, style, 0, "Failed to register module '%s'.\n", (const char *)URI);
        ++style->errors;
        v12 = v8[3];
        if (v12)
          ((void (*)(xsltStylesheetPtr, const xmlChar *, uint64_t))v12)(style, URI, v9);
        ((void (*)(uint64_t (***)(xsltStylesheetPtr, const xmlChar *)))*MEMORY[0x24BEDE758])(v11);
      }
      else
      {
        xsltTransformError(0, 0, 0, "xsltNewExtData : malloc failed\n");
      }
      return 0;
    }
  }
  return result;
}

int xsltRegisterExtFunction(xsltTransformContextPtr ctxt, const xmlChar *name, const xmlChar *URI, xmlXPathFunction function)
{
  xmlXPathContext *xpathCtxt;
  xmlHashTable *extFunctions;

  if (!ctxt || !name || !URI || !function)
    return -1;
  xpathCtxt = ctxt->xpathCtxt;
  if (xpathCtxt)
    xmlXPathRegisterFuncNS(xpathCtxt, name, URI, function);
  extFunctions = ctxt->extFunctions;
  if (extFunctions)
    return xmlHashAddEntry2(extFunctions, name, URI, function);
  extFunctions = xmlHashCreate(10);
  ctxt->extFunctions = extFunctions;
  if (extFunctions)
    return xmlHashAddEntry2(extFunctions, name, URI, function);
  else
    return -1;
}

int xsltRegisterExtElement(xsltTransformContextPtr ctxt, const xmlChar *name, const xmlChar *URI, xsltTransformFunction function)
{
  xmlHashTable *extElements;

  if (ctxt
    && name
    && URI
    && function
    && ((extElements = ctxt->extElements) != 0
     || (extElements = xmlHashCreate(10), (ctxt->extElements = extElements) != 0)))
  {
    return xmlHashAddEntry2(extElements, name, URI, function);
  }
  else
  {
    return -1;
  }
}

void xsltFreeCtxtExts(xsltTransformContextPtr ctxt)
{
  xmlHashTable *extElements;
  xmlHashTable *extFunctions;

  extElements = ctxt->extElements;
  if (extElements)
    xmlHashFree(extElements, 0);
  extFunctions = ctxt->extFunctions;
  if (extFunctions)
    xmlHashFree(extFunctions, 0);
}

void *__cdecl xsltGetExtData(xsltTransformContextPtr ctxt, const xmlChar *URI)
{
  void *result;
  xmlHashTable *extInfos;
  void *v6;
  uint64_t (**v7)(xsltTransformContextPtr, const xmlChar *);
  uint64_t (**v8)(xsltTransformContextPtr, const xmlChar *);
  uint64_t (***v9)(xsltTransformContextPtr, const xmlChar *);
  uint64_t (*v10)(xsltTransformContextPtr, const xmlChar *);

  result = 0;
  if (ctxt && URI)
  {
    extInfos = ctxt->extInfos;
    if (extInfos)
    {
      v6 = xmlHashLookup(extInfos, URI);
      if (v6)
        return (void *)*((_QWORD *)v6 + 1);
    }
    else
    {
      result = xmlHashCreate(10);
      ctxt->extInfos = (xmlHashTablePtr)result;
      if (!result)
        return result;
    }
    xmlMutexLock((xmlMutexPtr)xsltExtMutex);
    v7 = (uint64_t (**)(xsltTransformContextPtr, const xmlChar *))xmlHashLookup((xmlHashTablePtr)xsltExtensionsHash, URI);
    xmlMutexUnlock((xmlMutexPtr)xsltExtMutex);
    if (v7)
    {
      if (*v7)
      {
        xsltGenericDebug(xsltGenericDebugContext, "Initializing module: %s\n", (const char *)URI);
        result = (void *)(*v7)(ctxt, URI);
        if (!result)
          return result;
        v8 = (uint64_t (**)(xsltTransformContextPtr, const xmlChar *))result;
        v9 = (uint64_t (***)(xsltTransformContextPtr, const xmlChar *))((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(16);
        if (v9)
        {
          v6 = v9;
          *v9 = v7;
          v9[1] = v8;
          if ((xmlHashAddEntry(ctxt->extInfos, URI, v9) & 0x80000000) == 0)
            return (void *)*((_QWORD *)v6 + 1);
          xsltTransformError(ctxt, 0, 0, "Failed to register module data: %s\n", (const char *)URI);
          v10 = v7[1];
          if (v10)
            ((void (*)(xsltTransformContextPtr, const xmlChar *, uint64_t (**)(xsltTransformContextPtr, const xmlChar *)))v10)(ctxt, URI, v8);
          ((void (*)(void *))*MEMORY[0x24BEDE758])(v6);
        }
        else
        {
          xsltTransformError(0, 0, 0, "xsltNewExtData : malloc failed\n");
        }
      }
    }
    else
    {
      xsltGenericDebug(xsltGenericDebugContext, "Not registered extension module: %s\n", (const char *)URI);
    }
    return 0;
  }
  return result;
}

int xsltInitCtxtExts(xsltTransformContextPtr ctxt)
{
  xsltStylesheetPtr style;
  xmlHashTable *extInfos;
  xsltTransformContextPtr data;
  uint64_t v5;

  if (!ctxt)
    return -1;
  style = ctxt->style;
  if (ctxt->style)
  {
    data = ctxt;
    v5 = 0;
    while (1)
    {
      extInfos = style->extInfos;
      if (extInfos)
      {
        xmlHashScan(extInfos, (xmlHashScanner)xsltInitCtxtExt, &data);
        if ((_DWORD)v5 == -1)
          break;
      }
      style = xsltNextImport(style);
      if (!style)
      {
        xsltGenericDebug(xsltGenericDebugContext, "Registered %d modules\n", v5);
        return v5;
      }
    }
  }
  return -1;
}

void xsltInitCtxtExt(_QWORD **a1, _QWORD *a2, xmlChar *name, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  _QWORD *v11;
  void (*v12)(uint64_t, const char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char);
  void *v13;
  const char *v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  xmlHashTable *v18;
  int v19;
  void (*v20)(_QWORD, xmlChar *, uint64_t);

  if (!a1 || !a2 || !name || *((_DWORD *)a2 + 2) == -1)
  {
    v12 = (void (*)(uint64_t, const char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char))xsltGenericDebug;
    v13 = xsltGenericDebugContext;
    v14 = "xsltInitCtxtExt: NULL param or error\n";
    goto LABEL_11;
  }
  v11 = *a1;
  if (!*a1 || !*v11)
  {
    v12 = (void (*)(uint64_t, const char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char))xsltGenericDebug;
    v13 = xsltGenericDebugContext;
    v14 = "xsltInitCtxtExt: no module or no initFunc\n";
    goto LABEL_11;
  }
  if (xmlHashLookup(*(xmlHashTablePtr *)(*a2 + 88), name))
  {
    v12 = (void (*)(uint64_t, const char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char))xsltGenericDebug;
    v13 = xsltGenericDebugContext;
    v14 = "xsltInitCtxtExt: already initialized\n";
LABEL_11:
    v12((uint64_t)v13, v14, (uint64_t)v12, a4, a5, a6, a7, a8, a9);
    return;
  }
  v15 = ((uint64_t (*)(_QWORD, xmlChar *))*v11)(*a2, name);
  if (!v15)
    xsltGenericDebug(xsltGenericDebugContext, "xsltInitCtxtExt: no extData\n");
  v16 = (_QWORD *)((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(16);
  if (!v16)
  {
    xsltTransformError(0, 0, 0, "xsltNewExtData : malloc failed\n");
LABEL_23:
    v19 = -1;
    goto LABEL_24;
  }
  v17 = v16;
  *v16 = v11;
  v16[1] = v15;
  v18 = *(xmlHashTable **)(*a2 + 88);
  if (!v18)
  {
    v18 = xmlHashCreate(10);
    *(_QWORD *)(*a2 + 88) = v18;
    if (!v18)
      goto LABEL_23;
  }
  if (xmlHashAddEntry(v18, name, v17) < 0)
  {
    xsltGenericError(xsltGenericErrorContext, "Failed to register module data: %s\n", (const char *)name);
    v20 = (void (*)(_QWORD, xmlChar *, uint64_t))v11[1];
    if (v20)
      v20(*a2, name, v15);
    ((void (*)(void *))*MEMORY[0x24BEDE758])(v17);
    goto LABEL_23;
  }
  xsltGenericDebug(xsltGenericDebugContext, "Registered module %s\n", (const char *)name);
  v19 = *((_DWORD *)a2 + 2) + 1;
LABEL_24:
  *((_DWORD *)a2 + 2) = v19;
}

void xsltShutdownCtxtExts(xsltTransformContextPtr ctxt)
{
  xmlHashTable *extInfos;

  if (ctxt)
  {
    extInfos = ctxt->extInfos;
    if (extInfos)
    {
      xmlHashScan(extInfos, (xmlHashScanner)xsltShutdownCtxtExt, ctxt);
      xmlHashFree(ctxt->extInfos, (xmlHashDeallocator)xsltFreeExtDataEntry);
      ctxt->extInfos = 0;
    }
  }
}

_QWORD *xsltShutdownCtxtExt(_QWORD *result, uint64_t a2, const char *a3)
{
  _QWORD *v5;
  uint64_t v6;

  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        v5 = result;
        v6 = *result;
        if (*result)
        {
          if (*(_QWORD *)(v6 + 8))
          {
            xsltGenericDebug(xsltGenericDebugContext, "Shutting down module : %s\n", a3);
            return (_QWORD *)(*(uint64_t (**)(uint64_t, const char *, _QWORD))(v6 + 8))(a2, a3, v5[1]);
          }
        }
      }
    }
  }
  return result;
}

uint64_t xsltFreeExtDataEntry(uint64_t result)
{
  if (result)
    return ((uint64_t (*)(void))*MEMORY[0x24BEDE758])();
  return result;
}

void xsltShutdownExts(xsltStylesheetPtr style)
{
  xmlHashTable *extInfos;

  if (style)
  {
    extInfos = style->extInfos;
    if (extInfos)
    {
      xmlHashScan(extInfos, (xmlHashScanner)xsltShutdownExt, style);
      xmlHashFree(style->extInfos, (xmlHashDeallocator)xsltFreeExtDataEntry);
      style->extInfos = 0;
    }
  }
}

_QWORD *xsltShutdownExt(_QWORD *result, uint64_t a2, const char *a3)
{
  _QWORD *v5;
  uint64_t v6;

  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        v5 = result;
        v6 = *result;
        if (*result)
        {
          if (*(_QWORD *)(v6 + 24))
          {
            xsltGenericDebug(xsltGenericDebugContext, "Shutting down module : %s\n", a3);
            return (_QWORD *)(*(uint64_t (**)(uint64_t, const char *, _QWORD))(v6 + 24))(a2, a3, v5[1]);
          }
        }
      }
    }
  }
  return result;
}

int xsltCheckExtPrefix(xsltStylesheetPtr style, const xmlChar *URI)
{
  const xmlChar *nsDefs;
  const xmlChar *v3;

  if (style)
  {
    nsDefs = (const xmlChar *)style->nsDefs;
    if (nsDefs)
    {
      if (URI)
        v3 = URI;
      else
        v3 = (const xmlChar *)"#default";
      while (!xmlStrEqual(v3, *((const xmlChar **)nsDefs + 1)))
      {
        nsDefs = *(const xmlChar **)nsDefs;
        if (!nsDefs)
          goto LABEL_8;
      }
      LODWORD(style) = 1;
    }
    else
    {
LABEL_8:
      LODWORD(style) = 0;
    }
  }
  return (int)style;
}

int xsltCheckExtURI(xsltStylesheetPtr style, const xmlChar *URI)
{
  xsltStylesheetPtr v3;
  const xmlChar *nsDefs;

  if (style)
  {
    v3 = style;
    LODWORD(style) = 0;
    if (URI)
    {
      nsDefs = (const xmlChar *)v3->nsDefs;
      if (nsDefs)
      {
        while (!xmlStrEqual(URI, *((const xmlChar **)nsDefs + 2)))
        {
          nsDefs = *(const xmlChar **)nsDefs;
          if (!nsDefs)
          {
            LODWORD(style) = 0;
            return (int)style;
          }
        }
        LODWORD(style) = 1;
      }
    }
  }
  return (int)style;
}

int xsltRegisterExtModuleFull(const xmlChar *URI, xsltExtInitFunction initFunc, xsltExtShutdownFunction shutdownFunc, xsltStyleExtInitFunction styleInitFunc, xsltStyleExtShutdownFunction styleShutdownFunc)
{
  int v5;
  xsltExtShutdownFunction *v11;
  xsltExtInitFunction *v12;

  v5 = -1;
  if (URI && initFunc)
  {
    if (xsltExtensionsHash || (xsltExtensionsHash = (uint64_t)xmlHashCreate(10)) != 0)
    {
      xmlMutexLock((xmlMutexPtr)xsltExtMutex);
      v11 = (xsltExtShutdownFunction *)xmlHashLookup((xmlHashTablePtr)xsltExtensionsHash, URI);
      if (v11)
      {
        if ((char *)*v11 == (char *)initFunc && v11[1] == shutdownFunc)
        {
          v5 = 0;
LABEL_14:
          xmlMutexUnlock((xmlMutexPtr)xsltExtMutex);
          return v5;
        }
      }
      else
      {
        v12 = (xsltExtInitFunction *)((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(32);
        if (v12)
        {
          *v12 = initFunc;
          v12[1] = (xsltExtInitFunction)shutdownFunc;
          v12[2] = (xsltExtInitFunction)styleInitFunc;
          v12[3] = (xsltExtInitFunction)styleShutdownFunc;
          v5 = xmlHashAddEntry((xmlHashTablePtr)xsltExtensionsHash, URI, v12);
          goto LABEL_14;
        }
        xsltTransformError(0, 0, 0, "xsltNewExtModule : malloc failed\n");
      }
      v5 = -1;
      goto LABEL_14;
    }
    return -1;
  }
  return v5;
}

int xsltRegisterExtModule(const xmlChar *URI, xsltExtInitFunction initFunc, xsltExtShutdownFunction shutdownFunc)
{
  return xsltRegisterExtModuleFull(URI, initFunc, shutdownFunc, 0, 0);
}

int xsltUnregisterExtModule(const xmlChar *URI)
{
  const xmlChar *v1;

  if (!URI || !xsltExtensionsHash)
    return -1;
  v1 = URI;
  xmlMutexLock((xmlMutexPtr)xsltExtMutex);
  LODWORD(v1) = xmlHashRemoveEntry((xmlHashTablePtr)xsltExtensionsHash, v1, (xmlHashDeallocator)xsltFreeExtModuleEntry);
  xmlMutexUnlock((xmlMutexPtr)xsltExtMutex);
  return (int)v1;
}

uint64_t xsltFreeExtModuleEntry(uint64_t result)
{
  if (result)
    return ((uint64_t (*)(void))*MEMORY[0x24BEDE758])();
  return result;
}

xsltTransformContextPtr xsltXPathGetTransformContext(xsltTransformContextPtr ctxt)
{
  uint64_t v1;

  if (ctxt)
  {
    v1 = *(_QWORD *)&ctxt->templNr;
    if (v1)
      return *(xsltTransformContextPtr *)(v1 + 160);
    else
      return 0;
  }
  return ctxt;
}

int xsltRegisterExtModuleFunction(const xmlChar *name, const xmlChar *URI, xmlXPathFunction function)
{
  int result;

  result = -1;
  if (name && URI && function)
  {
    if (xsltFunctionsHash || (xsltFunctionsHash = (uint64_t)xmlHashCreate(10)) != 0)
    {
      xmlMutexLock((xmlMutexPtr)xsltExtMutex);
      xmlHashUpdateEntry2((xmlHashTablePtr)xsltFunctionsHash, name, URI, function, 0);
      xmlMutexUnlock((xmlMutexPtr)xsltExtMutex);
      return 0;
    }
    else
    {
      return -1;
    }
  }
  return result;
}

xmlXPathFunction xsltExtModuleFunctionLookup(const xmlChar *name, const xmlChar *URI)
{
  void (__cdecl *v2)(xmlXPathParserContextPtr, int);
  void (__cdecl *v6)(xmlXPathParserContextPtr, int);

  v2 = 0;
  if (!URI)
    return v2;
  if (!name)
    return v2;
  if (!xsltFunctionsHash)
    return v2;
  xmlMutexLock((xmlMutexPtr)xsltExtMutex);
  v2 = (void (__cdecl *)(xmlXPathParserContextPtr, int))xmlHashLookup2((xmlHashTablePtr)xsltFunctionsHash, name, URI);
  xmlMutexUnlock((xmlMutexPtr)xsltExtMutex);
  if (v2)
    return v2;
  if (xsltExtModuleRegisterDynamic(URI))
    return 0;
  xmlMutexLock((xmlMutexPtr)xsltExtMutex);
  v6 = (void (__cdecl *)(xmlXPathParserContextPtr, int))xmlHashLookup2((xmlHashTablePtr)xsltFunctionsHash, name, URI);
  xmlMutexUnlock((xmlMutexPtr)xsltExtMutex);
  return v6;
}

int xsltUnregisterExtModuleFunction(const xmlChar *name, const xmlChar *URI)
{
  const xmlChar *v3;

  if (!URI || !name || !xsltFunctionsHash)
    return -1;
  v3 = URI;
  xmlMutexLock((xmlMutexPtr)xsltExtMutex);
  LODWORD(v3) = xmlHashRemoveEntry2((xmlHashTablePtr)xsltFunctionsHash, name, v3, 0);
  xmlMutexUnlock((xmlMutexPtr)xsltExtMutex);
  return (int)v3;
}

xsltElemPreCompPtr xsltNewElemPreComp(xsltStylesheetPtr style, xmlNodePtr inst, xsltTransformFunction function)
{
  uint64_t v6;
  xsltElemPreComp *v7;

  v6 = ((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(40);
  v7 = (xsltElemPreComp *)v6;
  if (v6)
  {
    *(_OWORD *)v6 = 0u;
    *(_OWORD *)(v6 + 16) = 0u;
    *(_QWORD *)(v6 + 24) = inst;
    *(_QWORD *)(v6 + 32) = 0;
    *(_DWORD *)(v6 + 8) = 22;
    *(_QWORD *)(v6 + 16) = function;
    *(_QWORD *)(v6 + 32) = xsltFreeElemPreComp;
    *(_QWORD *)v6 = style->preComps;
    style->preComps = (xsltElemPreCompPtr)v6;
  }
  else
  {
    xsltTransformError(0, style, 0, "xsltNewExtElement : malloc failed\n");
  }
  return v7;
}

void xsltInitElemPreComp(xsltElemPreCompPtr comp, xsltStylesheetPtr style, xmlNodePtr inst, xsltTransformFunction function, xsltElemPreCompDeallocator freeFunc)
{
  comp->type = XSLT_FUNC_EXTENSION;
  comp->func = function;
  comp->inst = inst;
  comp->free = freeFunc;
  comp->next = style->preComps;
  style->preComps = comp;
}

uint64_t xsltFreeElemPreComp()
{
  return ((uint64_t (*)(void))*MEMORY[0x24BEDE758])();
}

xsltElemPreCompPtr xsltPreComputeExtModuleElement(xsltStylesheetPtr style, xmlNodePtr inst)
{
  xsltElemPreCompPtr result;
  xsltTransformFunction *v5;

  result = 0;
  if (style && inst)
  {
    if (inst->type == XML_ELEMENT_NODE
      && inst->ns
      && (xmlMutexLock((xmlMutexPtr)xsltExtMutex),
          v5 = (xsltTransformFunction *)xmlHashLookup2((xmlHashTablePtr)xsltElementsHash, inst->name, inst->ns->href),
          xmlMutexUnlock((xmlMutexPtr)xsltExtMutex),
          v5))
    {
      if (!*v5)
        return xsltNewElemPreComp(style, inst, v5[1]);
      result = (xsltElemPreCompPtr)((uint64_t (*)(xsltStylesheetPtr, xmlNodePtr, xsltTransformFunction))*v5)(style, inst, v5[1]);
      if (!result)
        return xsltNewElemPreComp(style, inst, v5[1]);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

int xsltRegisterExtModuleElement(const xmlChar *name, const xmlChar *URI, xsltPreComputeFunction precomp, xsltTransformFunction transform)
{
  int v4;
  xsltPreComputeFunction *v9;

  v4 = -1;
  if (name && URI && transform)
  {
    if (xsltElementsHash || (xsltElementsHash = (uint64_t)xmlHashCreate(10)) != 0)
    {
      xmlMutexLock((xmlMutexPtr)xsltExtMutex);
      v9 = (xsltPreComputeFunction *)((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(16);
      if (v9)
      {
        *v9 = precomp;
        v9[1] = (xsltPreComputeFunction)transform;
        xmlHashUpdateEntry2((xmlHashTablePtr)xsltElementsHash, name, URI, v9, (xmlHashDeallocator)xsltFreeExtElementEntry);
        v4 = 0;
      }
      else
      {
        xsltTransformError(0, 0, 0, "xsltNewExtElement : malloc failed\n");
        v4 = -1;
      }
      xmlMutexUnlock((xmlMutexPtr)xsltExtMutex);
    }
    else
    {
      return -1;
    }
  }
  return v4;
}

uint64_t xsltFreeExtElementEntry(uint64_t result)
{
  if (result)
    return ((uint64_t (*)(void))*MEMORY[0x24BEDE758])();
  return result;
}

xsltTransformFunction xsltExtElementLookup(xsltTransformContextPtr ctxt, const xmlChar *name, const xmlChar *URI)
{
  xsltTransformFunction result;
  xmlHashTable *extElements;

  result = 0;
  if (name)
  {
    if (URI)
    {
      if (!ctxt)
        return xsltExtModuleElementLookup(name, URI);
      extElements = ctxt->extElements;
      if (!extElements)
        return xsltExtModuleElementLookup(name, URI);
      result = (xsltTransformFunction)xmlHashLookup2(extElements, name, URI);
      if (!result)
        return xsltExtModuleElementLookup(name, URI);
    }
  }
  return result;
}

xsltTransformFunction xsltExtModuleElementLookup(const xmlChar *name, const xmlChar *URI)
{
  xsltTransformFunction result;
  void *v5;

  result = 0;
  if (URI && name && xsltElementsHash)
  {
    xmlMutexLock((xmlMutexPtr)xsltExtMutex);
    v5 = xmlHashLookup2((xmlHashTablePtr)xsltElementsHash, name, URI);
    xmlMutexUnlock((xmlMutexPtr)xsltExtMutex);
    if (v5)
      return (xsltTransformFunction)*((_QWORD *)v5 + 1);
    if (!xsltExtModuleRegisterDynamic(URI)
      && (xmlMutexLock((xmlMutexPtr)xsltExtMutex),
          v5 = xmlHashLookup2((xmlHashTablePtr)xsltElementsHash, name, URI),
          xmlMutexUnlock((xmlMutexPtr)xsltExtMutex),
          v5))
    {
      return (xsltTransformFunction)*((_QWORD *)v5 + 1);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

xsltPreComputeFunction xsltExtModuleElementPreComputeLookup(const xmlChar *name, const xmlChar *URI)
{
  xsltPreComputeFunction result;
  xsltPreComputeFunction *v5;

  result = 0;
  if (URI && name && xsltElementsHash)
  {
    xmlMutexLock((xmlMutexPtr)xsltExtMutex);
    v5 = (xsltPreComputeFunction *)xmlHashLookup2((xmlHashTablePtr)xsltElementsHash, name, URI);
    xmlMutexUnlock((xmlMutexPtr)xsltExtMutex);
    if (v5)
      return *v5;
    if (!xsltExtModuleRegisterDynamic(URI)
      && (xmlMutexLock((xmlMutexPtr)xsltExtMutex),
          v5 = (xsltPreComputeFunction *)xmlHashLookup2((xmlHashTablePtr)xsltElementsHash, name, URI),
          xmlMutexUnlock((xmlMutexPtr)xsltExtMutex),
          v5))
    {
      return *v5;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

int xsltUnregisterExtModuleElement(const xmlChar *name, const xmlChar *URI)
{
  const xmlChar *v3;

  if (!URI || !name || !xsltElementsHash)
    return -1;
  v3 = URI;
  xmlMutexLock((xmlMutexPtr)xsltExtMutex);
  LODWORD(v3) = xmlHashRemoveEntry2((xmlHashTablePtr)xsltElementsHash, name, v3, (xmlHashDeallocator)xsltFreeExtElementEntry);
  xmlMutexUnlock((xmlMutexPtr)xsltExtMutex);
  return (int)v3;
}

int xsltRegisterExtModuleTopLevel(const xmlChar *name, const xmlChar *URI, xsltTopLevelFunction function)
{
  int result;

  result = -1;
  if (name && URI && function)
  {
    if (xsltTopLevelsHash || (xsltTopLevelsHash = (uint64_t)xmlHashCreate(10)) != 0)
    {
      xmlMutexLock((xmlMutexPtr)xsltExtMutex);
      xmlHashUpdateEntry2((xmlHashTablePtr)xsltTopLevelsHash, name, URI, function, 0);
      xmlMutexUnlock((xmlMutexPtr)xsltExtMutex);
      return 0;
    }
    else
    {
      return -1;
    }
  }
  return result;
}

xsltTopLevelFunction xsltExtModuleTopLevelLookup(const xmlChar *name, const xmlChar *URI)
{
  void (__cdecl *v2)(xsltStylesheetPtr, xmlNodePtr);
  void (__cdecl *v6)(xsltStylesheetPtr, xmlNodePtr);

  v2 = 0;
  if (!URI)
    return v2;
  if (!name)
    return v2;
  if (!xsltTopLevelsHash)
    return v2;
  xmlMutexLock((xmlMutexPtr)xsltExtMutex);
  v2 = (void (__cdecl *)(xsltStylesheetPtr, xmlNodePtr))xmlHashLookup2((xmlHashTablePtr)xsltTopLevelsHash, name, URI);
  xmlMutexUnlock((xmlMutexPtr)xsltExtMutex);
  if (v2)
    return v2;
  if (xsltExtModuleRegisterDynamic(URI))
    return 0;
  xmlMutexLock((xmlMutexPtr)xsltExtMutex);
  v6 = (void (__cdecl *)(xsltStylesheetPtr, xmlNodePtr))xmlHashLookup2((xmlHashTablePtr)xsltTopLevelsHash, name, URI);
  xmlMutexUnlock((xmlMutexPtr)xsltExtMutex);
  return v6;
}

int xsltUnregisterExtModuleTopLevel(const xmlChar *name, const xmlChar *URI)
{
  const xmlChar *v3;

  if (!URI || !name || !xsltTopLevelsHash)
    return -1;
  v3 = URI;
  xmlMutexLock((xmlMutexPtr)xsltExtMutex);
  LODWORD(v3) = xmlHashRemoveEntry2((xmlHashTablePtr)xsltTopLevelsHash, name, v3, 0);
  xmlMutexUnlock((xmlMutexPtr)xsltExtMutex);
  return (int)v3;
}

xmlHashTablePtr xsltGetExtInfo(xsltStylesheetPtr style, const xmlChar *URI)
{
  xmlHashTable *extInfos;
  void *v3;
  xmlHashTablePtr result;

  if (!style)
    return 0;
  extInfos = style->extInfos;
  if (!extInfos)
    return 0;
  v3 = xmlHashLookup(extInfos, URI);
  if (!v3)
    return 0;
  result = (xmlHashTablePtr)*((_QWORD *)v3 + 1);
  if (!result)
    return 0;
  return result;
}

void xsltRegisterTestModule(void)
{
  pthread_once(&once_control, (void (*)(void))_xsltInitGlobalsOnce);
  xsltRegisterExtModuleFull((const xmlChar *)"http://xmlsoft.org/XSLT/", (xsltExtInitFunction)xsltExtInitTest, (xsltExtShutdownFunction)xsltExtShutdownTest, (xsltStyleExtInitFunction)xsltExtStyleInitTest, (xsltStyleExtShutdownFunction)xsltExtStyleShutdownTest);
  xsltRegisterExtModuleFunction((const xmlChar *)"test", (const xmlChar *)"http://xmlsoft.org/XSLT/", (xmlXPathFunction)xsltExtFunctionTest);
  xsltRegisterExtModuleElement((const xmlChar *)"test", (const xmlChar *)"http://xmlsoft.org/XSLT/", (xsltPreComputeFunction)xsltExtElementPreCompTest, (xsltTransformFunction)xsltExtElementTest);
}

void xsltInitGlobals(void)
{
  pthread_once(&once_control, (void (*)(void))_xsltInitGlobalsOnce);
}

uint64_t xsltExtInitTest(xsltTransformContextPtr ctxt, const char *a2)
{
  if (testStyleData
    || (xsltGenericDebug(xsltGenericErrorContext, "xsltExtInitTest: not initialized, calling xsltStyleGetExtData\n"),
        (testStyleData = (uint64_t)xsltStyleGetExtData(ctxt->style, (const xmlChar *)a2)) != 0))
  {
    if (!testData)
    {
      testData = (uint64_t)"test data";
      xsltGenericDebug(xsltGenericDebugContext, "Registered test module : %s\n", a2);
      return testData;
    }
    xsltTransformError(ctxt, 0, 0, "xsltExtInitTest: already initialized\n");
  }
  else
  {
    xsltTransformError(ctxt, 0, 0, "xsltExtInitTest: not initialized\n");
  }
  return 0;
}

void xsltExtShutdownTest(xsltTransformContext *a1, const char *a2, uint64_t a3)
{
  if (testData)
  {
    if (testData != a3)
      xsltTransformError(a1, 0, 0, "xsltExtShutdownTest: wrong data\n");
    testData = 0;
    xsltGenericDebug(xsltGenericDebugContext, "Unregistered test module : %s\n", a2);
  }
  else
  {
    xsltTransformError(a1, 0, 0, "xsltExtShutdownTest: not initialized\n");
  }
}

uint64_t xsltExtStyleInitTest(uint64_t a1, const char *a2)
{
  if (testStyleData)
  {
    xsltTransformError(0, 0, 0, "xsltExtInitTest: already initialized\n");
    return 0;
  }
  else
  {
    testStyleData = (uint64_t)"test data";
    xsltGenericDebug(xsltGenericDebugContext, "Registered test module : %s\n", a2);
    return testStyleData;
  }
}

void xsltExtStyleShutdownTest(uint64_t a1, const char *a2, uint64_t a3)
{
  if (testStyleData)
  {
    if (testStyleData != a3)
      xsltTransformError(0, 0, 0, "xsltExtShutdownTest: wrong data\n");
    testStyleData = 0;
    xsltGenericDebug(xsltGenericDebugContext, "Unregistered test module : %s\n", a2);
  }
  else
  {
    xsltGenericError(xsltGenericErrorContext, "xsltExtShutdownTest: not initialized\n");
  }
}

void xsltExtFunctionTest(uint64_t a1)
{
  uint64_t v2;
  xsltTransformContext *v3;
  void *ExtData;
  uint64_t v5;
  xsltTransformContext *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;

  if (a1 && (v2 = *(_QWORD *)(a1 + 24)) != 0)
    v3 = *(xsltTransformContext **)(v2 + 160);
  else
    v3 = 0;
  if (testData)
  {
    if (v3)
    {
      ExtData = xsltGetExtData(v3, (const xmlChar *)"http://xmlsoft.org/XSLT/");
      if (!ExtData)
      {
        if (a1 && (v5 = *(_QWORD *)(a1 + 24)) != 0)
          v6 = *(xsltTransformContext **)(v5 + 160);
        else
          v6 = 0;
        v9 = "xsltExtFunctionTest: failed to get module data\n";
        goto LABEL_28;
      }
      goto LABEL_13;
    }
LABEL_17:
    if (a1 && (v8 = *(_QWORD *)(a1 + 24)) != 0)
      v6 = *(xsltTransformContext **)(v8 + 160);
    else
      v6 = 0;
    v9 = "xsltExtFunctionTest: failed to get the transformation context\n";
    goto LABEL_28;
  }
  xsltGenericDebug(xsltGenericDebugContext, "xsltExtFunctionTest: not initialized, calling xsltGetExtData\n");
  ExtData = xsltGetExtData(v3, (const xmlChar *)"http://xmlsoft.org/XSLT/");
  if (!ExtData)
  {
    v9 = "xsltExtElementTest: not initialized\n";
    v6 = v3;
LABEL_28:
    xsltTransformError(v6, 0, 0, v9);
    return;
  }
  if (!v3)
    goto LABEL_17;
LABEL_13:
  if (ExtData != (void *)testData)
  {
    if (a1 && (v7 = *(_QWORD *)(a1 + 24)) != 0)
      v6 = *(xsltTransformContext **)(v7 + 160);
    else
      v6 = 0;
    v9 = "xsltExtFunctionTest: got wrong module data\n";
    goto LABEL_28;
  }
}

xsltElemPreCompPtr xsltExtElementPreCompTest(xsltStylesheet *ctxt, xmlNodePtr node, xsltTransformFunction function)
{
  if (ctxt)
  {
    if (testStyleData
      || (xsltGenericDebug(xsltGenericDebugContext, "xsltExtElementPreCompTest: not initialized, calling xsltStyleGetExtData\n"), xsltStyleGetExtData(ctxt, (const xmlChar *)"http://xmlsoft.org/XSLT/"), testStyleData))
    {
      if (node)
        return xsltNewElemPreComp(ctxt, node, function);
      xsltTransformError(0, ctxt, 0, "xsltExtElementPreCompTest: no instruction\n");
    }
    else
    {
      xsltTransformError(0, ctxt, node, "xsltExtElementPreCompTest: not initialized\n");
    }
    ++ctxt->errors;
  }
  else
  {
    xsltTransformError(0, 0, node, "xsltExtElementTest: no transformation context\n");
  }
  return 0;
}

void xsltExtElementTest(xsltTransformContextPtr ctxt, uint64_t a2, xmlNodePtr node)
{
  xmlNode *v6;
  const char *v7;
  xsltTransformContext *v8;
  xmlNode *v9;

  if (!testData)
  {
    xsltGenericDebug(xsltGenericDebugContext, "xsltExtElementTest: not initialized, calling xsltGetExtData\n");
    xsltGetExtData(ctxt, (const xmlChar *)"http://xmlsoft.org/XSLT/");
    if (!testData)
    {
      v7 = "xsltExtElementTest: not initialized\n";
      goto LABEL_13;
    }
  }
  if (!ctxt)
  {
    v7 = "xsltExtElementTest: no transformation context\n";
    v8 = 0;
LABEL_14:
    v9 = node;
    goto LABEL_15;
  }
  if (!a2)
  {
    v7 = "xsltExtElementTest: no current node\n";
LABEL_13:
    v8 = ctxt;
    goto LABEL_14;
  }
  if (node)
  {
    if (ctxt->insert)
    {
      v6 = xmlNewComment((const xmlChar *)"libxslt:test element test worked");
      xmlAddChild(ctxt->insert, v6);
      return;
    }
    v7 = "xsltExtElementTest: no insertion point\n";
    goto LABEL_13;
  }
  v7 = "xsltExtElementTest: no instruction\n";
  v8 = ctxt;
  v9 = 0;
LABEL_15:
  xsltTransformError(v8, 0, v9, v7);
}

xmlMutexPtr _xsltInitGlobalsOnce()
{
  xmlMutexPtr result;

  result = xmlNewMutex();
  xsltExtMutex = (uint64_t)result;
  return result;
}

void xsltCleanupGlobals(void)
{
  if (xsltExtensionsHash)
  {
    xmlMutexLock((xmlMutexPtr)xsltExtMutex);
    xmlHashFree((xmlHashTablePtr)xsltExtensionsHash, (xmlHashDeallocator)xsltFreeExtModuleEntry);
    xsltExtensionsHash = 0;
    xmlMutexUnlock((xmlMutexPtr)xsltExtMutex);
  }
  xmlMutexLock((xmlMutexPtr)xsltExtMutex);
  xmlHashFree((xmlHashTablePtr)xsltFunctionsHash, 0);
  xsltFunctionsHash = 0;
  xmlMutexUnlock((xmlMutexPtr)xsltExtMutex);
  xmlMutexLock((xmlMutexPtr)xsltExtMutex);
  xmlHashFree((xmlHashTablePtr)xsltElementsHash, (xmlHashDeallocator)xsltFreeExtElementEntry);
  xsltElementsHash = 0;
  xmlMutexUnlock((xmlMutexPtr)xsltExtMutex);
  xmlMutexLock((xmlMutexPtr)xsltExtMutex);
  xmlHashFree((xmlHashTablePtr)xsltTopLevelsHash, 0);
  xsltTopLevelsHash = 0;
  xmlMutexUnlock((xmlMutexPtr)xsltExtMutex);
  xmlMutexLock((xmlMutexPtr)xsltExtMutex);
  if (xsltModuleHash)
  {
    xmlHashScan((xmlHashTablePtr)xsltModuleHash, (xmlHashScanner)xsltHashScannerModuleFree, 0);
    xmlHashFree((xmlHashTablePtr)xsltModuleHash, 0);
    xsltModuleHash = 0;
  }
  xmlMutexUnlock((xmlMutexPtr)xsltExtMutex);
  xmlFreeMutex((xmlMutexPtr)xsltExtMutex);
  xsltExtMutex = 0;
  xsltFreeLocales();
  xsltUninit();
}

void xsltDebugDumpExtensions(FILE *output)
{
  FILE *v1;

  if (output)
    v1 = output;
  else
    v1 = (FILE *)*MEMORY[0x24BDAC8E8];
  fwrite("Registered XSLT Extensions\n--------------------------\n", 0x36uLL, 1uLL, v1);
  if (xsltFunctionsHash)
  {
    fwrite("Registered Extension Functions:\n", 0x20uLL, 1uLL, v1);
    xmlMutexLock((xmlMutexPtr)xsltExtMutex);
    xmlHashScanFull((xmlHashTablePtr)xsltFunctionsHash, (xmlHashScannerFull)xsltDebugDumpExtensionsCallback, v1);
    xmlMutexUnlock((xmlMutexPtr)xsltExtMutex);
  }
  else
  {
    fwrite("No registered extension functions\n", 0x22uLL, 1uLL, v1);
  }
  if (xsltElementsHash)
  {
    fwrite("\nRegistered Extension Elements:\n", 0x20uLL, 1uLL, v1);
    xmlMutexLock((xmlMutexPtr)xsltExtMutex);
    xmlHashScanFull((xmlHashTablePtr)xsltElementsHash, (xmlHashScannerFull)xsltDebugDumpExtensionsCallback, v1);
    xmlMutexUnlock((xmlMutexPtr)xsltExtMutex);
  }
  else
  {
    fwrite("\nNo registered extension elements\n", 0x22uLL, 1uLL, v1);
  }
  if (xsltExtensionsHash)
  {
    fwrite("\nRegistered Extension Modules:\n", 0x1FuLL, 1uLL, v1);
    xmlMutexLock((xmlMutexPtr)xsltExtMutex);
    xmlHashScanFull((xmlHashTablePtr)xsltExtensionsHash, (xmlHashScannerFull)xsltDebugDumpExtModulesCallback, v1);
    xmlMutexUnlock((xmlMutexPtr)xsltExtMutex);
  }
  else
  {
    fwrite("\nNo registered extension modules\n", 0x21uLL, 1uLL, v1);
  }
}

uint64_t xsltDebugDumpExtensionsCallback(int a1, FILE *a2, const char *a3, const char *a4)
{
  uint64_t result;

  if (a3)
  {
    if (a4)
      return fprintf(a2, "{%s}%s\n", a4, a3);
  }
  return result;
}

uint64_t xsltDebugDumpExtModulesCallback(int a1, FILE *a2, const char *a3)
{
  uint64_t result;

  if (a3)
    return fprintf(a2, "%s\n", a3);
  return result;
}

void xsltDebug(xsltTransformContextPtr ctxt, xmlNodePtr node, xmlNodePtr inst, xsltElemPreCompPtr comp)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int templNr;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  xsltTemplatePtr v22;
  const xmlChar *name;
  xmlChar *match;
  const xmlChar *mode;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int varsNr;
  int v33;
  int v34;
  void **v35;
  void **v36;
  _QWORD *i;
  uint64_t v38;
  int v39;
  xmlXPathObject *v40;
  BOOL v41;
  int v42;
  xsltTransformContextPtr v43;

  xsltGenericError(xsltGenericErrorContext, "Templates:\n", inst, comp);
  templNr = ctxt->templNr;
  if (templNr >= 1)
  {
    v12 = 0;
    v13 = templNr - 1;
    if ((templNr - 1) >= 0xE)
      v13 = 14;
    v14 = templNr - 1;
    v15 = v13 + 1;
    do
    {
      xsltGenericError(xsltGenericErrorContext, "#%d ", v5, v6, v7, v8, v9, v10, v12);
      v22 = ctxt->templTab[v14];
      name = v22->name;
      if (name)
      {
        xsltGenericError(xsltGenericErrorContext, "name %s ", v16, v17, v18, v19, v20, v21, (char)name);
        v22 = ctxt->templTab[v14];
      }
      match = v22->match;
      if (match)
      {
        xsltGenericError(xsltGenericErrorContext, "name %s ", v16, v17, v18, v19, v20, v21, (char)match);
        v22 = ctxt->templTab[v14];
      }
      mode = v22->mode;
      if (mode)
        xsltGenericError(xsltGenericErrorContext, "name %s ", v16, v17, v18, v19, v20, v21, (char)mode);
      xsltGenericError(xsltGenericErrorContext, "\n");
      ++v12;
      --v14;
    }
    while (v15 != v12);
  }
  xsltGenericError(xsltGenericErrorContext, "Variables:\n");
  v43 = ctxt;
  varsNr = ctxt->varsNr;
  if (varsNr >= 1)
  {
    v33 = 0;
    v34 = varsNr - 1;
    if ((varsNr - 1) >= 0xE)
      v34 = 14;
    v42 = v34;
    v35 = (void **)MEMORY[0x24BDAC8E8];
    v36 = (void **)MEMORY[0x24BDAC8D8];
    do
    {
      if (v43->varsTab[--varsNr])
      {
        xsltGenericError(xsltGenericErrorContext, "#%d\n", v26, v27, v28, v29, v30, v31, v33);
        for (i = &v43->varsTab[varsNr]->next; i; i = (_QWORD *)*i)
        {
          v38 = i[1];
          if (v38)
          {
            v39 = *(_DWORD *)(v38 + 8);
            if (v39 == 19)
            {
              xsltGenericError(xsltGenericErrorContext, "param ");
            }
            else if (v39 == 20)
            {
              xsltGenericError(xsltGenericErrorContext, "var ");
            }
          }
          else
          {
            xsltGenericError(xsltGenericErrorContext, "corrupted !!!\n");
          }
          if (i[3])
            xsltGenericError(xsltGenericErrorContext, "%s ");
          else
            xsltGenericError(xsltGenericErrorContext, "noname !!!!");
          v40 = (xmlXPathObject *)i[7];
          if (v40)
          {
            v41 = xsltGenericDebugContext == *v35 || xsltGenericDebugContext == *v36;
            if (v41)
              xmlXPathDebugDumpObject((FILE *)xsltGenericDebugContext, v40, 1);
          }
          else
          {
            xsltGenericError(xsltGenericErrorContext, "NULL !!!!");
          }
          xsltGenericError(xsltGenericErrorContext, "\n");
        }
      }
      v41 = v33++ == v42;
    }
    while (!v41);
  }
}

void xsltFunctionNodeSet(xmlXPathParserContextPtr ctxt, int nargs)
{
  xmlXPathObjectPtr value;
  xsltTransformContext *v4;
  int v5;
  xsltTransformContext *TransformContext;

  if (nargs == 1)
  {
    value = ctxt->value;
    if (value)
    {
      if (value->type == XPATH_NODESET)
        return;
      if (value->type == XPATH_XSLT_TREE)
      {
        value->type = XPATH_NODESET;
        return;
      }
    }
    TransformContext = xsltXPathGetTransformContext(ctxt);
    xsltTransformError(TransformContext, 0, 0, "node-set() invalid arg expecting a result tree\n");
    v5 = 11;
  }
  else
  {
    v4 = xsltXPathGetTransformContext(ctxt);
    xsltTransformError(v4, 0, 0, "node-set() : expects one result-tree arg\n");
    v5 = 12;
  }
  ctxt->error = v5;
}

void xsltRegisterAllExtras(void)
{
  xsltRegisterExtModuleFunction((const xmlChar *)"node-set", (const xmlChar *)"http://xmlsoft.org/XSLT/namespace", xsltFunctionNodeSet);
  xsltRegisterExtModuleFunction((const xmlChar *)"node-set", (const xmlChar *)"http://icl.com/saxon", xsltFunctionNodeSet);
  xsltRegisterExtModuleFunction((const xmlChar *)"node-set", (const xmlChar *)"http://www.jclark.com/xt", xsltFunctionNodeSet);
  xsltRegisterExtModuleElement((const xmlChar *)"debug", (const xmlChar *)"http://xmlsoft.org/XSLT/namespace", 0, xsltDebug);
  xsltRegisterExtModuleElement((const xmlChar *)"output", (const xmlChar *)"http://icl.com/saxon", xsltDocumentComp, xsltDocumentElem);
  xsltRegisterExtModuleElement((const xmlChar *)"write", (const xmlChar *)"org.apache.xalan.xslt.extensions.Redirect", xsltDocumentComp, xsltDocumentElem);
  xsltRegisterExtModuleElement((const xmlChar *)"document", (const xmlChar *)"http://www.jclark.com/xt", xsltDocumentComp, xsltDocumentElem);
  xsltRegisterExtModuleElement((const xmlChar *)"document", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform", xsltDocumentComp, xsltDocumentElem);
}

xmlXPathFunction xsltXPathFunctionLookup(void *vctxt, const xmlChar *name, const xmlChar *ns_uri)
{
  void (__cdecl *v3)(xmlXPathParserContextPtr, int);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = 0;
  if (vctxt)
  {
    if (name)
    {
      if (ns_uri)
      {
        xsltGenericDebug(xsltGenericDebugContext, "Lookup function {%s}%s\n", (const char *)ns_uri, (const char *)name);
        v3 = (void (__cdecl *)(xmlXPathParserContextPtr, int))xmlHashLookup2(*((xmlHashTablePtr *)vctxt + 7), name, ns_uri);
        if (v3 || (v3 = xsltExtModuleFunctionLookup(name, ns_uri)) != 0)
          xsltGenericDebug(xsltGenericDebugContext, "found function %s\n", v7, v8, v9, v10, v11, v12, (char)name);
      }
    }
  }
  return v3;
}

void xsltDocumentFunction(xmlXPathParserContextPtr ctxt, int nargs)
{
  xsltTransformContext *TransformContext;
  int v5;
  xmlXPathObjectPtr value;
  xmlXPathObjectPtr v7;
  xsltTransformContext *v8;
  xmlXPathObjectPtr v9;
  xmlXPathObjectPtr v10;
  int *p_nodeNr;
  uint64_t v12;
  xmlXPathObject *v13;
  xmlXPathObject *v14;
  xmlXPathObjectPtr v15;
  xmlXPathObjectPtr v16;
  xsltTransformContextPtr v17;
  xsltTransformContextPtr v18;
  xmlNodeSetPtr nodesetval;
  xmlNodePtr inst;
  unsigned int type;
  int v22;
  xsltTransformContext *v23;
  xsltTransformContext *v24;
  const xmlDoc *doc;
  xmlChar *Base;
  xmlChar *v27;
  xsltStylesheetPtr style;
  xsltTransformContextPtr v29;
  xsltTransformContext *v30;
  xmlURIPtr v31;
  xmlURI *v32;
  const xmlChar *fragment;
  xmlChar *v34;
  xsltDocumentPtr Document;
  xmlDocPtr v36;
  xmlNode *v37;
  xmlXPathObject *v38;
  xmlDoc *v39;
  xmlXPathObject *v40;
  xmlDoc **p_doc;
  xmlDocPtr v42;
  xmlXPathContextPtr v43;
  xmlXPathContextPtr v44;
  xmlXPathContextPtr context;
  xmlXPathObjectPtr v46;
  xmlXPathObject *v47;
  xmlXPathParserContext *v48;
  xmlXPathObject *v49;

  if ((nargs - 3) <= 0xFFFFFFFD)
  {
    TransformContext = xsltXPathGetTransformContext(ctxt);
    xsltTransformError(TransformContext, 0, 0, "document() : invalid number of args %d\n", nargs);
    v5 = 12;
LABEL_34:
    ctxt->error = v5;
    return;
  }
  value = ctxt->value;
  if (!value)
  {
    v8 = xsltXPathGetTransformContext(ctxt);
    xsltTransformError(v8, 0, 0, "document() : invalid arg value\n");
    goto LABEL_33;
  }
  if (nargs == 2)
  {
    if (value->type == XPATH_NODESET)
    {
      v7 = valuePop(ctxt);
      value = ctxt->value;
      goto LABEL_9;
    }
    v23 = xsltXPathGetTransformContext(ctxt);
    xsltTransformError(v23, 0, 0, "document() : invalid arg expecting a nodeset\n");
LABEL_33:
    v5 = 11;
    goto LABEL_34;
  }
  v7 = 0;
LABEL_9:
  if (value->type != XPATH_NODESET)
  {
    xmlXPathStringFunction(ctxt, 1);
    if (ctxt->value->type != XPATH_STRING)
    {
      v24 = xsltXPathGetTransformContext(ctxt);
      xsltTransformError(v24, 0, 0, "document() : invalid arg expecting a string\n");
      ctxt->error = 11;
      if (!v7)
        return;
LABEL_85:
      xmlXPathFreeObject(v7);
      return;
    }
    v16 = valuePop(ctxt);
    if (!v16->stringval)
      goto LABEL_57;
    v17 = xsltXPathGetTransformContext(ctxt);
    v18 = v17;
    if (v7)
    {
      nodesetval = v7->nodesetval;
      if (nodesetval)
      {
        if (nodesetval->nodeNr >= 1)
        {
          inst = *nodesetval->nodeTab;
          if (inst)
          {
            type = inst->type;
            if (type <= 0xD)
            {
              v22 = 1 << type;
              if ((v22 & 0x231A) != 0)
              {
LABEL_40:
                doc = inst->doc;
                goto LABEL_41;
              }
              if ((v22 & 0x84) != 0)
              {
                inst = inst->parent;
                goto LABEL_40;
              }
            }
          }
        }
      }
    }
    if (v17)
    {
      inst = v17->inst;
      if (inst)
        goto LABEL_40;
      style = v17->style;
      if (v17->style)
      {
        doc = style->doc;
        if (doc)
        {
          inst = (xmlNodePtr)style->doc;
LABEL_41:
          Base = xmlNodeGetBase(doc, inst);
          v27 = xmlBuildURI(v16->stringval, Base);
          if (Base)
            ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(Base);
LABEL_47:
          if (v27)
          {
            v29 = xsltXPathGetTransformContext(ctxt);
            if (v29)
            {
              v30 = v29;
              v31 = xmlParseURI((const char *)v27);
              if (v31)
              {
                v32 = v31;
                fragment = (const xmlChar *)v31->fragment;
                if (fragment)
                {
                  v31->fragment = 0;
                  v34 = xmlSaveUri(v31);
                  Document = xsltLoadDocument(v30, v34);
                  ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v34);
                }
                else
                {
                  Document = xsltLoadDocument(v30, v27);
                }
                xmlFreeURI(v32);
                if (Document)
                {
                  p_doc = &Document->doc;
                }
                else
                {
                  if (*v27 != 35)
                  {
                    v42 = v30->style->doc;
                    if (!v42 || !xmlStrEqual(v42->URL, v27))
                    {
                      v49 = xmlXPathNewNodeSet(0);
                      valuePush(ctxt, v49);
                      if (!fragment)
                        goto LABEL_83;
                      goto LABEL_82;
                    }
                  }
                  p_doc = &v30->style->doc;
                }
                v39 = *p_doc;
                if (fragment)
                {
                  v43 = xmlXPtrNewContext(v39, 0, 0);
                  if (v43)
                  {
                    v44 = v43;
                    if (linkedOnOrAfterFall2022OSVersions())
                    {
                      context = ctxt->context;
                      *(_OWORD *)&v44->opLimit = *(_OWORD *)&context->opLimit;
                      v44->depth = context->depth;
                    }
                    v46 = xmlXPtrEval(fragment, v44);
                    if (linkedOnOrAfterFall2022OSVersions())
                      ctxt->context->opCount = v44->opCount;
                    xmlXPathFreeContext(v44);
                    if (v46)
                    {
                      if (v46->type - 2 >= 8 && v46->type)
                      {
                        v48 = ctxt;
                        v47 = v46;
                        goto LABEL_81;
                      }
                      xsltTransformError(v30, 0, 0, "document() : XPointer does not select a node set: #%s\n", (const char *)fragment);
                      xmlXPathFreeObject(v46);
                    }
                  }
                  else
                  {
                    xsltTransformError(v30, 0, 0, "document() : internal error xptrctxt == NULL\n");
                  }
                  v47 = xmlXPathNewNodeSet(0);
                  v48 = ctxt;
LABEL_81:
                  valuePush(v48, v47);
LABEL_82:
                  ((void (*)(const xmlChar *))*MEMORY[0x24BEDE758])(fragment);
                  goto LABEL_83;
                }
LABEL_62:
                v40 = xmlXPathNewNodeSet((xmlNodePtr)v39);
                valuePush(ctxt, v40);
LABEL_83:
                ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v27);
LABEL_84:
                xmlXPathFreeObject(v16);
                if (!v7)
                  return;
                goto LABEL_85;
              }
              xsltTransformError(v30, 0, 0, "document() : failed to parse URI\n");
            }
            else
            {
              xsltTransformError(0, 0, 0, "document() : internal error tctxt == NULL\n");
            }
            v39 = 0;
            goto LABEL_62;
          }
          if (v18)
          {
            if (v18->style)
            {
              v36 = v18->style->doc;
              if (v36)
              {
                if (xmlStrEqual(0, v36->URL))
                {
                  v37 = (xmlNode *)v18->style->doc;
LABEL_58:
                  v38 = xmlXPathNewNodeSet(v37);
                  valuePush(ctxt, v38);
                  goto LABEL_84;
                }
              }
            }
          }
LABEL_57:
          v37 = 0;
          goto LABEL_58;
        }
      }
    }
    v27 = xmlBuildURI(v16->stringval, 0);
    goto LABEL_47;
  }
  v9 = valuePop(ctxt);
  v10 = xmlXPathNewNodeSet(0);
  if (v9)
  {
    p_nodeNr = &v9->nodesetval->nodeNr;
    if (p_nodeNr && *p_nodeNr >= 1)
    {
      v12 = 0;
      do
      {
        v13 = xmlXPathNewNodeSet(*(xmlNodePtr *)(*((_QWORD *)p_nodeNr + 1) + 8 * v12));
        valuePush(ctxt, v13);
        xmlXPathStringFunction(ctxt, 1);
        if (nargs == 2)
          v14 = xmlXPathObjectCopy(v7);
        else
          v14 = xmlXPathNewNodeSet(v9->nodesetval->nodeTab[v12]);
        valuePush(ctxt, v14);
        xsltDocumentFunction(ctxt, 2);
        v15 = valuePop(ctxt);
        v10->nodesetval = xmlXPathNodeSetMerge(v10->nodesetval, v15->nodesetval);
        xmlXPathFreeObject(v15);
        ++v12;
        p_nodeNr = &v9->nodesetval->nodeNr;
      }
      while (v12 < *p_nodeNr);
    }
    xmlXPathFreeObject(v9);
  }
  if (v7)
    xmlXPathFreeObject(v7);
  valuePush(ctxt, v10);
}

void xsltKeyFunction(xmlXPathParserContextPtr ctxt, int nargs)
{
  xmlXPathObjectPtr v3;
  xmlXPathObjectPtr value;
  xmlXPathObjectPtr v5;
  xmlXPathObjectPtr v6;
  int *p_nodeNr;
  uint64_t v8;
  xmlXPathObject *v9;
  xmlXPathObject *v10;
  xmlXPathObjectPtr v11;
  xsltTransformContext *TransformContext;
  xsltTransformContext *v13;
  xmlXPathContextPtr context;
  xsltTransformContextPtr v15;
  xsltTransformContextPtr v16;
  xsltDocumentPtr document;
  xmlChar *v18;
  xmlChar *v19;
  const xmlChar *v20;
  xmlNodeSet *Key;
  xmlXPathObjectPtr v22;
  const xmlChar *stringval;
  xmlNodePtr node;
  xmlDoc *doc;
  xsltDocumentPtr v26;
  char *name;
  xsltDocumentPtr v28;
  xsltDocumentPtr v29;
  xmlNodeSet *v30;
  xmlXPathObject *v31;
  xmlChar *prefix;

  if (nargs != 2)
  {
    TransformContext = xsltXPathGetTransformContext(ctxt);
    xsltTransformError(TransformContext, 0, 0, "key() : expects two arguments\n");
    ctxt->error = 12;
    return;
  }
  v3 = valuePop(ctxt);
  xmlXPathStringFunction(ctxt, 1);
  if (!v3 || (value = ctxt->value) == 0 || value->type != XPATH_STRING)
  {
    v13 = xsltXPathGetTransformContext(ctxt);
    xsltTransformError(v13, 0, 0, "key() : invalid arg expecting a string\n");
    ctxt->error = 11;
    xmlXPathFreeObject(v3);
    return;
  }
  v5 = valuePop(ctxt);
  if ((v3->type | 8) != 9)
  {
    prefix = 0;
    context = ctxt->context;
    v15 = xsltXPathGetTransformContext(ctxt);
    v16 = v15;
    document = v15->document;
    if (!context->node)
    {
      xsltTransformError(v15, 0, v15->inst, "Internal error in xsltKeyFunction(): The context node is not set on the XPath context.\n");
      Key = 0;
      v19 = 0;
      goto LABEL_21;
    }
    v18 = xmlSplitQName2(v5->stringval, &prefix);
    if (v18)
    {
      v19 = v18;
      if (prefix)
      {
        v20 = xmlXPathNsLookup(context, prefix);
        if (!v20)
          xsltTransformError(v16, 0, v16->inst, "key() : prefix %s is not bound\n", (const char *)prefix);
        ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(prefix);
        goto LABEL_25;
      }
    }
    else
    {
      v19 = xmlStrdup(v5->stringval);
      if (prefix)
        ((void (*)(void))*MEMORY[0x24BEDE758])();
    }
    v20 = 0;
LABEL_25:
    valuePush(ctxt, v3);
    xmlXPathStringFunction(ctxt, 1);
    v22 = valuePop(ctxt);
    v3 = v22;
    if (!v22 || v22->type != XPATH_STRING)
    {
      xsltTransformError(v16, 0, v16->inst, "key() : invalid arg expecting a string\n");
      Key = 0;
      ctxt->error = 11;
      goto LABEL_43;
    }
    stringval = v22->stringval;
    node = context->node;
    if (node->type == XML_NAMESPACE_DECL
      && ((node = (xmlNodePtr)node->_private) == 0 || node->type != XML_ELEMENT_NODE)
      || (doc = node->doc) == 0)
    {
      xsltTransformError(v16, 0, v16->inst, "Internal error in xsltKeyFunction(): Couldn't get the doc of the XPath context node.\n");
      goto LABEL_40;
    }
    v26 = v16->document;
    if (v26 && v26->doc == doc)
      goto LABEL_42;
    name = doc->name;
    if (name && *name == 32)
    {
      v28 = (xsltDocumentPtr)doc->_private;
      if (doc->_private || (v28 = xsltNewDocument(v16, doc), (node->doc->_private = v28) != 0))
      {
        v16->document = v28;
LABEL_42:
        Key = xsltGetKey(v16, v19, v20, stringval);
LABEL_43:
        v16->document = document;
        v30 = xmlXPathNodeSetMerge(0, Key);
        v31 = xmlXPathWrapNodeSet(v30);
        valuePush(ctxt, v31);
        if (v19)
          ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v19);
        goto LABEL_45;
      }
LABEL_40:
      Key = 0;
      goto LABEL_43;
    }
    v29 = xsltFindDocument(v16, doc);
    v16->document = v29;
    if (v29)
      goto LABEL_42;
    xsltTransformError(v16, 0, v16->inst, "Internal error in xsltKeyFunction(): Could not get the document info of a context doc.\n");
    Key = 0;
LABEL_21:
    v16->state = XSLT_STATE_STOPPED;
    goto LABEL_43;
  }
  v6 = xmlXPathNewNodeSet(0);
  p_nodeNr = &v3->nodesetval->nodeNr;
  if (p_nodeNr && *p_nodeNr >= 1)
  {
    v8 = 0;
    do
    {
      v9 = xmlXPathObjectCopy(v5);
      valuePush(ctxt, v9);
      v10 = xmlXPathNewNodeSet(v3->nodesetval->nodeTab[v8]);
      valuePush(ctxt, v10);
      xmlXPathStringFunction(ctxt, 1);
      xsltKeyFunction(ctxt, 2);
      v11 = valuePop(ctxt);
      v6->nodesetval = xmlXPathNodeSetMerge(v6->nodesetval, v11->nodesetval);
      xmlXPathFreeObject(v11);
      ++v8;
    }
    while (v8 < v3->nodesetval->nodeNr);
  }
  valuePush(ctxt, v6);
LABEL_45:
  if (v5)
    xmlXPathFreeObject(v5);
  if (v3)
    xmlXPathFreeObject(v3);
}

void xsltUnparsedEntityURIFunction(xmlXPathParserContextPtr ctxt, int nargs)
{
  xmlXPathObject *v3;
  xmlXPathObjectPtr v4;
  const xmlChar *stringval;
  xmlEntityPtr DocEntity;
  const xmlChar *v7;
  const xmlChar *URI;
  xmlXPathObject *v9;

  if (nargs == 1 && ctxt->value)
  {
    v3 = valuePop(ctxt);
    v4 = v3;
    if (v3->type != XPATH_STRING)
      v4 = xmlXPathConvertString(v3);
    stringval = v4->stringval;
    if (stringval)
    {
      DocEntity = xmlGetDocEntity(ctxt->context->doc, stringval);
      v7 = (const xmlChar *)&unk_209C1ADF6;
      if (DocEntity)
      {
        URI = DocEntity->URI;
        if (URI)
          v7 = URI;
      }
    }
    else
    {
      v7 = (const xmlChar *)&unk_209C1ADF6;
    }
    v9 = xmlXPathNewString(v7);
    valuePush(ctxt, v9);
    xmlXPathFreeObject(v4);
  }
  else
  {
    xsltGenericError(xsltGenericErrorContext, "unparsed-entity-uri() : expects one string arg\n");
    ctxt->error = 12;
  }
}

void xsltFormatNumberFunction(xmlXPathParserContextPtr ctxt, int nargs)
{
  xsltTransformContextPtr TransformContext;
  xsltTransformContext *v5;
  xsltStylesheet *style;
  xsltDecimalFormat *decimalFormat;
  xmlXPathObjectPtr value;
  xmlXPathObjectPtr v9;
  const xmlChar *v10;
  xmlNsPtr v11;
  const xmlChar *href;
  xmlXPathObjectPtr v13;
  xmlXPathObjectPtr v14;
  xmlXPathObjectPtr v15;
  xmlXPathObjectPtr v16;
  xmlXPathObject *v17;
  xmlXPathObject *v18;
  xmlChar *prefix;
  xmlChar *result;

  prefix = 0;
  TransformContext = xsltXPathGetTransformContext(ctxt);
  if (!TransformContext)
    return;
  v5 = TransformContext;
  if (!TransformContext->inst)
    return;
  result = 0;
  style = TransformContext->style;
  if (!TransformContext->style)
    return;
  decimalFormat = style->decimalFormat;
  if (nargs == 2)
  {
    v9 = 0;
    goto LABEL_19;
  }
  if (nargs != 3)
  {
    xmlXPathErr(ctxt, 12);
    return;
  }
  value = ctxt->value;
  if (value && value->type != XPATH_STRING)
    xmlXPathStringFunction(ctxt, 1);
  v9 = valuePop(ctxt);
  v10 = xsltSplitQName(style->dict, v9->stringval, (const xmlChar **)&prefix);
  if (!prefix)
  {
    href = 0;
LABEL_15:
    if (v10)
      decimalFormat = xsltDecimalFormatGetByQName(style, href, v10);
    if (decimalFormat)
      goto LABEL_19;
    goto LABEL_18;
  }
  v11 = xmlSearchNs(v5->inst->doc, v5->inst, prefix);
  if (v11)
  {
    href = v11->href;
    goto LABEL_15;
  }
  xsltTransformError(v5, 0, 0, "format-number : No namespace found for QName '%s:%s'\n", (const char *)prefix, (const char *)v10);
  ++style->errors;
  if (!decimalFormat)
LABEL_18:
    xsltTransformError(v5, 0, 0, "format-number() : undeclared decimal format '%s'\n", (const char *)v9->stringval);
LABEL_19:
  v13 = ctxt->value;
  if (v13 && v13->type != XPATH_STRING)
    xmlXPathStringFunction(ctxt, 1);
  v14 = valuePop(ctxt);
  v15 = ctxt->value;
  if (v15 && v15->type != XPATH_NUMBER)
    xmlXPathNumberFunction(ctxt, 1);
  v16 = valuePop(ctxt);
  v17 = v16;
  if (decimalFormat)
  {
    if (xsltFormatNumberConversion(decimalFormat, v14->stringval, v16->floatval, &result) == XPATH_EXPRESSION_OK)
    {
      v18 = xmlXPathNewString(result);
      valuePush(ctxt, v18);
      ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(result);
    }
  }
  xmlXPathFreeObject(v17);
  xmlXPathFreeObject(v14);
  xmlXPathFreeObject(v9);
}

void xsltGenerateIdFunction(xmlXPathParserContextPtr ctxt, int nargs)
{
  xsltTransformContext *TransformContext;
  xsltTransformContext *v5;
  xmlXPathObjectPtr v6;
  xmlNodePtr node;
  const xmlChar *children;
  uint64_t v9;
  size_t v10;
  xmlXPathObjectPtr value;
  int *p_nodeNr;
  uint64_t v13;
  int v14;
  uint64_t PSVIPtr;
  unint64_t *v16;
  xmlXPathObject *v17;
  unint64_t v18;
  unint64_t currentId;
  char *v20;
  char *v21;
  size_t i;
  char v23;
  char *v24;
  char v25;
  unsigned int v26;
  char v27;
  char v28;
  char __str[8];
  uint64_t v30;
  _WORD v31[7];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  TransformContext = xsltXPathGetTransformContext(ctxt);
  v5 = TransformContext;
  if (nargs == 1)
  {
    value = ctxt->value;
    if (!value || value->type != XPATH_NODESET)
    {
      ctxt->error = 11;
      xsltTransformError(TransformContext, 0, 0, "generate-id() : invalid arg expecting a node-set\n");
      v6 = 0;
      goto LABEL_54;
    }
    v6 = valuePop(ctxt);
    p_nodeNr = &v6->nodesetval->nodeNr;
    if (!p_nodeNr || *p_nodeNr <= 0)
    {
      v17 = xmlXPathNewCString((const char *)&unk_209C1ADF6);
      goto LABEL_53;
    }
    node = (xmlNodePtr)**((_QWORD **)p_nodeNr + 1);
    if (*p_nodeNr != 1)
    {
      v13 = 1;
      do
      {
        if (xmlXPathCmpNodes(node, *(xmlNodePtr *)(*((_QWORD *)p_nodeNr + 1) + 8 * v13)) == -1)
          node = *(xmlNodePtr *)(*((_QWORD *)p_nodeNr + 1) + 8 * v13);
        ++v13;
      }
      while (v13 < *p_nodeNr);
    }
  }
  else
  {
    if (nargs)
    {
      xsltTransformError(TransformContext, 0, 0, "generate-id() : invalid number of args %d\n", nargs);
      v6 = 0;
      v14 = 12;
      goto LABEL_21;
    }
    v6 = 0;
    node = ctxt->context->node;
  }
  if (!linkedOnOrAfterFall2023OSVersions())
  {
    *(_QWORD *)__str = 0;
    v30 = 0;
    memset(v31, 0, sizeof(v31));
    pthread_once(&once_control_0, (void (*)(void))_initBaseValue);
    if ((uint64_t)node - base_value < 0)
      snprintf(__str, 0x1EuLL, "idm%ld");
    else
      snprintf(__str, 0x1EuLL, "idp%ld");
    v17 = xmlXPathNewString((const xmlChar *)__str);
    goto LABEL_53;
  }
  if (node->type == XML_NAMESPACE_DECL)
  {
    if (node->children)
      children = (const xmlChar *)node->children;
    else
      children = (const xmlChar *)&unk_209C1ADF6;
    v9 = xmlStrlen(children);
    v10 = 2 * v9 + 32;
    node = (xmlNodePtr)node->_private;
  }
  else
  {
    children = 0;
    v9 = 0;
    v10 = 30;
  }
  PSVIPtr = xsltGetPSVIPtr((uint64_t)node);
  if (PSVIPtr)
  {
    v16 = (unint64_t *)PSVIPtr;
    if ((xsltGetSourceNodeFlags((uint64_t)node) & 2) != 0)
    {
      v18 = *v16;
    }
    else
    {
      if (node->type == XML_TEXT_NODE && (__int16)node->line == -1)
      {
        node->line = 0;
      }
      else if (*v16)
      {
        xsltTransformError(v5, 0, 0, "generate-id(): psvi already set\n");
LABEL_56:
        v14 = 15;
        goto LABEL_21;
      }
      currentId = v5->currentId;
      if (currentId == -1)
      {
        xsltTransformError(v5, 0, 0, "generate-id(): id overflow\n");
        goto LABEL_56;
      }
      v18 = currentId + 1;
      v5->currentId = currentId + 1;
      *v16 = currentId + 1;
      xsltSetSourceNodeFlags((uint64_t)v5, (uint64_t)node, 2);
    }
    v20 = (char *)((uint64_t (*)(size_t))*MEMORY[0x24BEDE910])(v10);
    if (!v20)
    {
      xsltTransformError(v5, 0, 0, "generate-id(): out of memory\n");
      goto LABEL_56;
    }
    v21 = v20;
    if (children)
    {
      snprintf(v20, v10, "id%luns", v18);
      for (i = strlen(v21); v9; --v9)
      {
        if (*children >= 0xA0u)
          v23 = (*children >> 4) + 55;
        else
          v23 = (*children >> 4) | 0x30;
        v24 = &v21[i];
        v21[i] = v23;
        v25 = *children++;
        v26 = v25 & 0xF;
        v27 = v25 & 0xF | 0x30;
        v28 = v26 + 55;
        if (v26 < 0xA)
          v28 = v27;
        i += 2;
        v24[1] = v28;
      }
      v21[i] = 0;
    }
    else
    {
      snprintf(v20, v10, "id%lu", v18);
    }
    v17 = xmlXPathWrapString((xmlChar *)v21);
LABEL_53:
    valuePush(ctxt, v17);
    goto LABEL_54;
  }
  xsltTransformError(v5, 0, 0, "generate-id(): invalid node type %d\n", node->type);
  v14 = 11;
LABEL_21:
  ctxt->error = v14;
LABEL_54:
  xmlXPathFreeObject(v6);
}

void xsltSystemPropertyFunction(xmlXPathParserContextPtr ctxt, int nargs)
{
  xmlXPathObjectPtr value;
  xmlXPathObjectPtr v4;
  const xmlChar *stringval;
  xmlChar *v6;
  xmlChar *v7;
  const xmlChar *v8;
  xsltTransformContext *v9;
  xsltTransformContext *v10;
  int v11;
  xsltTransformContext *v12;
  xmlXPathObject *v13;
  const char *v14;
  xsltTransformContextPtr TransformContext;
  _QWORD *p_style;
  xmlNodePtr inst;
  uint64_t v18;
  uint64_t v19;
  const xmlChar *v20;
  xmlXPathObject *v21;
  void (**v22)(void);
  xmlChar *prefix;

  if (nargs == 1)
  {
    value = ctxt->value;
    if (value)
    {
      prefix = 0;
      if (value->type == XPATH_STRING)
      {
        v4 = valuePop(ctxt);
        stringval = v4->stringval;
        if (!stringval)
        {
          v13 = xmlXPathNewString((const xmlChar *)&unk_209C1ADF6);
          valuePush(ctxt, v13);
LABEL_36:
          xmlXPathFreeObject(v4);
          return;
        }
        v6 = xmlSplitQName2(stringval, &prefix);
        if (v6)
        {
          v7 = v6;
          v8 = xmlXPathNsLookup(ctxt->context, prefix);
          if (v8)
          {
LABEL_15:
            v14 = (const char *)&unk_209C1ADF6;
            if (xmlStrEqual(v8, (const xmlChar *)"http://www.w3.org/1999/XSL/Transform"))
            {
              if (xmlStrEqual(v7, (const xmlChar *)"vendor"))
              {
                TransformContext = xsltXPathGetTransformContext(ctxt);
                if (TransformContext
                  && (p_style = &TransformContext->style, (inst = TransformContext->inst) != 0)
                  && xmlStrEqual(inst->name, (const xmlChar *)"variable")
                  && (v18 = *(_QWORD *)(p_style[23] + 40)) != 0
                  && xmlStrEqual(*(const xmlChar **)(v18 + 16), (const xmlChar *)"template")
                  && *p_style
                  && (v19 = *(_QWORD *)(*p_style + 32)) != 0
                  && (v20 = *(const xmlChar **)(v19 + 136)) != 0
                  && xmlStrstr(v20, (const xmlChar *)"chunk"))
                {
                  v14 = "libxslt (SAXON 6.2 compatible)";
                }
                else
                {
                  v14 = "libxslt";
                }
              }
              else if (xmlStrEqual(v7, (const xmlChar *)"version"))
              {
                v14 = "1.0";
              }
              else if (xmlStrEqual(v7, (const xmlChar *)"vendor-url"))
              {
                v14 = "http://xmlsoft.org/XSLT/";
              }
            }
            v21 = xmlXPathNewString((const xmlChar *)v14);
            valuePush(ctxt, v21);
            v22 = (void (**)(void))MEMORY[0x24BEDE758];
            if (v7)
              ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v7);
            if (prefix)
              (*v22)();
            goto LABEL_36;
          }
          v9 = xsltXPathGetTransformContext(ctxt);
          xsltTransformError(v9, 0, 0, "system-property() : prefix %s is not bound\n", (const char *)prefix);
        }
        else
        {
          v7 = xmlStrdup(v4->stringval);
        }
        v8 = 0;
        goto LABEL_15;
      }
    }
    v12 = xsltXPathGetTransformContext(ctxt);
    xsltTransformError(v12, 0, 0, "system-property() : invalid arg expecting a string\n");
    v11 = 11;
  }
  else
  {
    v10 = xsltXPathGetTransformContext(ctxt);
    xsltTransformError(v10, 0, 0, "system-property() : expects one string arg\n");
    v11 = 12;
  }
  ctxt->error = v11;
}

void xsltElementAvailableFunction(xmlXPathParserContextPtr ctxt, int nargs)
{
  xmlXPathObjectPtr value;
  xmlXPathObjectPtr v4;
  xsltTransformContextPtr v5;
  xsltTransformContext *v6;
  xmlChar *v7;
  xmlChar *v8;
  const xmlChar *v9;
  const xmlChar *href;
  xsltTransformContext *TransformContext;
  int v12;
  xsltTransformContext *v13;
  xsltTransformContext *v14;
  xmlXPathObject *v15;
  xmlNsPtr v16;
  xsltTransformContext *v17;
  _BOOL4 v18;
  xmlXPathObject *v19;
  void (**v20)(void);
  xmlChar *prefix;

  if (nargs != 1)
  {
    TransformContext = xsltXPathGetTransformContext(ctxt);
    xsltTransformError(TransformContext, 0, 0, "element-available() : expects one string arg\n");
    v12 = 12;
LABEL_11:
    ctxt->error = v12;
    return;
  }
  xmlXPathStringFunction(ctxt, 1);
  value = ctxt->value;
  if (!value || (prefix = 0, value->type != XPATH_STRING))
  {
    v13 = xsltXPathGetTransformContext(ctxt);
    xsltTransformError(v13, 0, 0, "element-available() : invalid arg expecting a string\n");
    v12 = 11;
    goto LABEL_11;
  }
  v4 = valuePop(ctxt);
  v5 = xsltXPathGetTransformContext(ctxt);
  if (!v5 || (v6 = v5, !v5->inst))
  {
    v14 = xsltXPathGetTransformContext(ctxt);
    xsltTransformError(v14, 0, 0, "element-available() : internal error tctxt == NULL\n");
    xmlXPathFreeObject(v4);
    v15 = xmlXPathNewBoolean(0);
    valuePush(ctxt, v15);
    return;
  }
  v7 = xmlSplitQName2(v4->stringval, &prefix);
  if (!v7)
  {
    v8 = xmlStrdup(v4->stringval);
    v16 = xmlSearchNs(v6->inst->doc, v6->inst, 0);
    if (v16)
    {
      href = v16->href;
      goto LABEL_18;
    }
LABEL_17:
    href = 0;
    goto LABEL_18;
  }
  v8 = v7;
  v9 = xmlXPathNsLookup(ctxt->context, prefix);
  if (!v9)
  {
    v17 = xsltXPathGetTransformContext(ctxt);
    xsltTransformError(v17, 0, 0, "element-available() : prefix %s is not bound\n", (const char *)prefix);
    goto LABEL_17;
  }
  href = v9;
LABEL_18:
  v18 = xsltExtElementLookup(v6, v8, href) != 0;
  v19 = xmlXPathNewBoolean(v18);
  valuePush(ctxt, v19);
  xmlXPathFreeObject(v4);
  v20 = (void (**)(void))MEMORY[0x24BEDE758];
  if (v8)
    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v8);
  if (prefix)
    (*v20)();
}

void xsltFunctionAvailableFunction(xmlXPathParserContextPtr ctxt, int nargs)
{
  xmlXPathObjectPtr value;
  xmlXPathObjectPtr v4;
  xmlChar *v5;
  xmlChar *v6;
  const xmlChar *v7;
  const xmlChar *v8;
  xsltTransformContext *TransformContext;
  int v10;
  xsltTransformContext *v11;
  xsltTransformContext *v12;
  _BOOL4 v13;
  xmlXPathObject *v14;
  void (**v15)(void);
  xmlChar *prefix;

  if (nargs != 1)
  {
    TransformContext = xsltXPathGetTransformContext(ctxt);
    xsltTransformError(TransformContext, 0, 0, "function-available() : expects one string arg\n");
    v10 = 12;
LABEL_9:
    ctxt->error = v10;
    return;
  }
  xmlXPathStringFunction(ctxt, 1);
  value = ctxt->value;
  if (!value || (prefix = 0, value->type != XPATH_STRING))
  {
    v11 = xsltXPathGetTransformContext(ctxt);
    xsltTransformError(v11, 0, 0, "function-available() : invalid arg expecting a string\n");
    v10 = 11;
    goto LABEL_9;
  }
  v4 = valuePop(ctxt);
  v5 = xmlSplitQName2(v4->stringval, &prefix);
  if (!v5)
  {
    v6 = xmlStrdup(v4->stringval);
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  v6 = v5;
  v7 = xmlXPathNsLookup(ctxt->context, prefix);
  if (!v7)
  {
    v12 = xsltXPathGetTransformContext(ctxt);
    xsltTransformError(v12, 0, 0, "function-available() : prefix %s is not bound\n", (const char *)prefix);
    goto LABEL_13;
  }
  v8 = v7;
LABEL_14:
  v13 = xmlXPathFunctionLookupNS(ctxt->context, v6, v8) != 0;
  v14 = xmlXPathNewBoolean(v13);
  valuePush(ctxt, v14);
  xmlXPathFreeObject(v4);
  v15 = (void (**)(void))MEMORY[0x24BEDE758];
  if (v6)
    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v6);
  if (prefix)
    (*v15)();
}

void xsltRegisterAllFunctions(xmlXPathContextPtr ctxt)
{
  xmlXPathRegisterFunc(ctxt, (const xmlChar *)"current", (xmlXPathFunction)xsltCurrentFunction);
  xmlXPathRegisterFunc(ctxt, (const xmlChar *)"document", xsltDocumentFunction);
  xmlXPathRegisterFunc(ctxt, (const xmlChar *)"key", xsltKeyFunction);
  xmlXPathRegisterFunc(ctxt, (const xmlChar *)"unparsed-entity-uri", xsltUnparsedEntityURIFunction);
  xmlXPathRegisterFunc(ctxt, (const xmlChar *)"format-number", xsltFormatNumberFunction);
  xmlXPathRegisterFunc(ctxt, (const xmlChar *)"generate-id", xsltGenerateIdFunction);
  xmlXPathRegisterFunc(ctxt, (const xmlChar *)"system-property", xsltSystemPropertyFunction);
  xmlXPathRegisterFunc(ctxt, (const xmlChar *)"element-available", xsltElementAvailableFunction);
  xmlXPathRegisterFunc(ctxt, (const xmlChar *)"function-available", xsltFunctionAvailableFunction);
}

void xsltCurrentFunction(xmlXPathParserContext *a1, int a2)
{
  xsltTransformContextPtr TransformContext;
  xmlNode *node;
  xsltTransformContext *v6;
  xmlXPathObject *v7;

  TransformContext = xsltXPathGetTransformContext(a1);
  if (a2)
  {
    xsltTransformError(TransformContext, 0, 0, "current() : function uses no argument\n");
    a1->error = 12;
  }
  else
  {
    if (TransformContext)
    {
      node = TransformContext->node;
    }
    else
    {
      v6 = xsltXPathGetTransformContext(a1);
      xsltTransformError(v6, 0, 0, "current() : internal error tctxt == NULL\n");
      node = 0;
    }
    v7 = xmlXPathNewNodeSet(node);
    valuePush(a1, v7);
  }
}

uint64_t _initBaseValue()
{
  unsigned int v0;
  uint64_t result;
  _BOOL8 v2;

  v0 = time(0);
  srandom(v0);
  result = random();
  if (result)
  {
    v2 = 1;
  }
  else
  {
    result = random();
    v2 = result != 0;
  }
  base_value = v2;
  return result;
}

int xsltParseStylesheetImport(xsltStylesheetPtr style, xmlNodePtr cur)
{
  int v2;
  xmlChar *NsProp;
  const xmlChar *v6;
  xmlChar *Base;
  xmlChar *v8;
  const xmlChar *v9;
  xsltSecurityPrefs *DefaultSecurityPrefs;
  int v11;
  xsltStylesheetPtr v12;
  xmlDoc *v13;
  xmlDoc *v14;
  xsltStylesheetPtr v15;
  const char *v16;
  void (**v17)(xmlChar *);
  const xmlChar *v19;

  v2 = -1;
  if (!style || !cur)
    return v2;
  NsProp = xmlGetNsProp(cur, (const xmlChar *)"href", 0);
  if (!NsProp)
  {
    xsltTransformError(0, style, cur, "xsl:import : missing href attribute\n");
    return v2;
  }
  v6 = NsProp;
  Base = xmlNodeGetBase(style->doc, cur);
  v8 = xmlBuildURI(v6, Base);
  v9 = v8;
  if (v8)
  {
    if ((xsltCheckCycle(style, v8) & 0x80000000) != 0)
    {
      v19 = v9;
      v16 = "xsl:import : recursion detected on imported URL %s\n";
    }
    else
    {
      DefaultSecurityPrefs = xsltGetDefaultSecurityPrefs();
      if (DefaultSecurityPrefs)
      {
        v11 = xsltCheckRead(DefaultSecurityPrefs, 0, v9);
        if (v11 <= 0)
        {
          if (!v11)
            xsltTransformError(0, 0, 0, "xsl:import: read rights for %s denied\n");
          goto LABEL_18;
        }
      }
      v13 = xsltDocDefaultLoader(v9, style->dict, 16398, style, XSLT_LOAD_STYLESHEET);
      if (v13)
      {
        v14 = v13;
        v15 = xsltParseStylesheetImportedDoc(v13, style);
        if (v15)
        {
          v12 = v15;
          v15->next = style->imports;
          style->imports = v15;
          if (!style->parent)
            xsltFixImportedCompSteps(style, (uint64_t)v15);
          v2 = 0;
        }
        else
        {
          xmlFreeDoc(v14);
          v2 = -1;
        }
        goto LABEL_18;
      }
      v19 = v9;
      v16 = "xsl:import : unable to load %s\n";
    }
  }
  else
  {
    v19 = v6;
    v16 = "xsl:import : invalid URI reference %s\n";
  }
  xsltTransformError(0, style, cur, v16, v19);
LABEL_18:
  v17 = (void (**)(xmlChar *))MEMORY[0x24BEDE758];
  ((void (*)(const xmlChar *, xsltStylesheetPtr))*MEMORY[0x24BEDE758])(v6, v12);
  if (Base)
    (*v17)(Base);
  if (v9)
    (*v17)((xmlChar *)v9);
  return v2;
}

uint64_t xsltCheckCycle(_QWORD *a1, xmlChar *str2)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = a1;
  v4 = a1[43];
  if (v4)
  {
    while (!xmlStrEqual(*(const xmlChar **)(*(_QWORD *)(v4 + 16) + 136), str2))
    {
      v4 = *(_QWORD *)(v4 + 32);
      if (!v4)
      {
        if (v3)
          goto LABEL_5;
        return 0;
      }
    }
  }
  else
  {
LABEL_5:
    while (!xmlStrEqual(*(const xmlChar **)(v3[4] + 136), str2))
    {
      v3 = (_QWORD *)*v3;
      if (!v3)
        return 0;
    }
  }
  return 0xFFFFFFFFLL;
}

void xsltFixImportedCompSteps(_DWORD *a1, uint64_t a2)
{
  uint64_t i;

  xmlHashScan(*(xmlHashTablePtr *)(a2 + 80), xsltNormalizeCompSteps, a1);
  a1[84] += *(_DWORD *)(a2 + 336);
  for (i = *(_QWORD *)(a2 + 16); i; i = *(_QWORD *)(i + 8))
    xsltFixImportedCompSteps(a1, i);
}

int xsltParseStylesheetInclude(xsltStylesheetPtr style, xmlNodePtr cur)
{
  int v2;
  xmlChar *NsProp;
  const xmlChar *v6;
  xmlChar *Base;
  xmlChar *v8;
  const xmlChar *v9;
  xsltDocumentPtr StyleDocument;
  xsltDocumentPtr v11;
  xmlDoc *doc;
  xmlDoc *v13;
  int nopreproc;
  xsltStylesheetPtr v15;
  void (**v16)(xmlChar *);

  v2 = -1;
  if (style && cur)
  {
    NsProp = xmlGetNsProp(cur, (const xmlChar *)"href", 0);
    if (NsProp)
    {
      v6 = NsProp;
      Base = xmlNodeGetBase(style->doc, cur);
      v8 = xmlBuildURI(v6, Base);
      v9 = v8;
      if (v8)
      {
        if ((xsltCheckCycle(style, v8) & 0x80000000) != 0)
        {
          xsltTransformError(0, style, cur, "xsl:include : recursion detected on included URL %s\n");
        }
        else
        {
          StyleDocument = xsltLoadStyleDocument(style, v9);
          if (StyleDocument)
          {
            v11 = StyleDocument;
            doc = style->doc;
            v13 = StyleDocument->doc;
            style->doc = v13;
            StyleDocument->includes = style->includes;
            style->includes = StyleDocument;
            nopreproc = style->nopreproc;
            style->nopreproc = StyleDocument->preproc;
            v15 = xsltParseStylesheetProcess(style, v13);
            style->nopreproc = nopreproc;
            v11->preproc = 1;
            style->includes = v11->includes;
            style->doc = doc;
            if (v15)
              v2 = 0;
            else
              v2 = -1;
          }
          else
          {
            xsltTransformError(0, style, cur, "xsl:include : unable to load %s\n");
          }
        }
      }
      else
      {
        xsltTransformError(0, style, cur, "xsl:include : invalid URI reference %s\n");
      }
      v16 = (void (**)(xmlChar *))MEMORY[0x24BEDE758];
      ((void (*)(const xmlChar *))*MEMORY[0x24BEDE758])(v6);
      if (Base)
        (*v16)(Base);
      if (v9)
        (*v16)((xmlChar *)v9);
    }
    else
    {
      xsltTransformError(0, style, cur, "xsl:include : missing href attribute\n");
    }
  }
  return v2;
}

xsltStylesheetPtr xsltNextImport(xsltStylesheetPtr style)
{
  xsltStylesheet *imports;

  if (!style)
    return 0;
  imports = style->imports;
  if (!imports)
  {
    while (1)
    {
      imports = style->next;
      if (imports)
        break;
      style = style->parent;
      if (!style)
        return 0;
    }
  }
  return imports;
}

int xsltNeedElemSpaceHandling(xsltTransformContextPtr ctxt)
{
  xsltStylesheetPtr style;
  _xsltStylesheet *imports;

  if (ctxt)
  {
    style = ctxt->style;
    if (ctxt->style)
    {
      if (!style->stripSpaces)
      {
        do
        {
          imports = style->imports;
          if (!imports)
          {
            while (1)
            {
              imports = style->next;
              if (imports)
                break;
              style = style->parent;
              if (!style)
                goto LABEL_12;
            }
          }
          style = imports;
        }
        while (!imports->stripSpaces);
      }
      LODWORD(ctxt) = 1;
    }
    else
    {
LABEL_12:
      LODWORD(ctxt) = 0;
    }
  }
  return (int)ctxt;
}

int xsltFindElemSpaceHandling(xsltTransformContextPtr ctxt, xmlNodePtr node)
{
  int result;
  xsltStylesheetPtr style;
  xsltStylesheetPtr v6;
  xmlNs *ns;
  xmlHashTable *stripSpaces;
  const xmlChar *name;
  const xmlChar *v10;
  const xmlChar *href;

  result = 0;
  if (ctxt && node)
  {
    style = ctxt->style;
    if (style)
    {
      while (1)
      {
        v6 = style;
        ns = node->ns;
        stripSpaces = v6->stripSpaces;
        name = node->name;
        if (!ns)
          break;
        v10 = (const xmlChar *)xmlHashLookup2(stripSpaces, name, ns->href);
        if (!v10)
        {
          stripSpaces = v6->stripSpaces;
          href = node->ns->href;
          name = (const xmlChar *)"*";
          goto LABEL_8;
        }
LABEL_9:
        if (xmlStrEqual(v10, (const xmlChar *)"strip"))
          return 1;
        if (xmlStrEqual(v10, (const xmlChar *)"preserve"))
          return 0;
LABEL_11:
        result = v6->stripAll;
        if (result == -1)
          return 0;
        if (result == 1)
          return result;
        style = v6->imports;
        if (!style)
        {
          while (1)
          {
            style = v6->next;
            if (style)
              break;
            v6 = v6->parent;
            if (!v6)
              return 0;
          }
        }
      }
      href = 0;
LABEL_8:
      v10 = (const xmlChar *)xmlHashLookup2(stripSpaces, name, href);
      if (!v10)
        goto LABEL_11;
      goto LABEL_9;
    }
    return 0;
  }
  return result;
}

xsltTemplatePtr xsltFindTemplate(xsltTransformContextPtr ctxt, const xmlChar *name, const xmlChar *nameURI)
{
  xsltTemplatePtr result;
  xsltStylesheetPtr style;
  _QWORD *p_parent;
  xmlHashTable *namedTemplates;

  result = 0;
  if (ctxt && name)
  {
    style = ctxt->style;
    if (style)
    {
      while (1)
      {
        p_parent = &style->parent;
        namedTemplates = style->namedTemplates;
        if (namedTemplates)
        {
          result = (xsltTemplatePtr)xmlHashLookup2(namedTemplates, name, nameURI);
          if (result)
            break;
        }
        style = (xsltStylesheetPtr)p_parent[2];
        if (!style)
        {
          while (1)
          {
            style = (xsltStylesheetPtr)p_parent[1];
            if (style)
              break;
            p_parent = (_QWORD *)*p_parent;
            if (!p_parent)
              return 0;
          }
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void xsltFreeKeys(xsltStylesheetPtr style)
{
  _QWORD *keys;
  _QWORD *v2;

  keys = style->keys;
  if (keys)
  {
    do
    {
      v2 = (_QWORD *)*keys;
      xsltFreeKeyDef((uint64_t)keys);
      keys = v2;
    }
    while (v2);
  }
}

int xsltAddKey(xsltStylesheetPtr style, const xmlChar *name, const xmlChar *nameURI, const xmlChar *match, const xmlChar *use, xmlNodePtr inst)
{
  int result;
  _OWORD *v13;
  uint64_t v14;
  xmlNsPtr *NsList;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  xmlChar *v20;
  const xmlChar *v21;
  const xmlChar *v22;
  const xmlChar *v23;
  uint64_t i;
  unsigned int v25;
  uint64_t v26;
  uint64_t v28;
  int v29;
  int v30;
  unsigned int v31;
  int v32;
  uint64_t v33;
  const xmlChar *v34;
  int v35;
  int v36;
  int v37;
  xmlChar *v38;
  const xmlChar *v39;
  xmlChar *v40;
  xmlChar *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  xmlXPathCompExprPtr v49;
  xmlXPathCompExprPtr v50;
  void **j;
  void **p_keys;
  void **keys;
  const xmlChar *v54;

  result = -1;
  if (!style || !name || !match || !use)
    return result;
  xsltGenericDebug(xsltGenericDebugContext, "Add key %s, match %s, use %s\n", (const char *)name, (const char *)match, (const char *)use);
  v13 = (_OWORD *)((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(80);
  v14 = (uint64_t)v13;
  if (v13)
  {
    v13[3] = 0u;
    v13[4] = 0u;
    v13[1] = 0u;
    v13[2] = 0u;
    *v13 = 0u;
    *((_QWORD *)v13 + 2) = xmlStrdup(name);
    if (nameURI)
      *(_QWORD *)(v14 + 24) = xmlStrdup(nameURI);
    *(_QWORD *)(v14 + 64) = 0;
  }
  else
  {
    xsltTransformError(0, 0, 0, "xsltNewKeyDef : malloc failed\n");
  }
  *(_QWORD *)(v14 + 32) = xmlStrdup(match);
  *(_QWORD *)(v14 + 40) = xmlStrdup(use);
  *(_QWORD *)(v14 + 8) = inst;
  NsList = xmlGetNsList(inst->doc, inst);
  *(_QWORD *)(v14 + 64) = NsList;
  if (NsList)
  {
    v16 = -1;
    do
    {
      v17 = (uint64_t)*NsList++;
      ++v16;
    }
    while (v17);
  }
  else
  {
    v16 = 0;
  }
  *(_DWORD *)(v14 + 72) = v16;
  v18 = *match;
  if (!*match)
    goto LABEL_78;
  v19 = 0;
  v20 = 0;
  v21 = match + 1;
  v22 = match;
LABEL_17:
  v23 = &match[(int)v19];
  for (i = v19; ; i = (i + 1))
  {
    v25 = *v23++;
    v26 = (1 << v25) & 0x100002600;
    if (v25 > 0x20 || v26 == 0)
      break;
  }
  v28 = i;
  while (1)
  {
    while (1)
    {
      v29 = match[(int)v28];
      if (v29 == 91)
        break;
      if (!match[(int)v28] || v29 == 124)
      {
        if ((_DWORD)v28 == (_DWORD)i)
        {
          xsltTransformError(0, style, inst, "xsl:key : 'match' pattern is empty\n");
          goto LABEL_71;
        }
        v54 = v21;
        if (v18 != 47)
        {
          v38 = v20;
          v39 = v22;
          v40 = xmlStrcat(v38, (const xmlChar *)"//");
          v22 = v39;
          v20 = v40;
          if (!v40)
            goto LABEL_79;
        }
        v41 = xmlStrncat(v20, v22, (int)v28 - (int)v19);
        if (!v41)
          goto LABEL_79;
        v20 = v41;
        v48 = (int)v28;
        v18 = match[(int)v28];
        if (v18 == 124)
        {
          v20 = xmlStrcat(v41, (const xmlChar *)"|");
          v48 = (int)v28 + 1;
          v18 = match[v48];
          v28 = v48;
        }
        v21 = v54;
        v22 = &match[v48];
        v19 = v28;
        if (!v18)
        {
          if (v20)
          {
            xsltGenericDebug(xsltGenericDebugContext, "   resulting pattern %s\n", v42, v43, v44, v45, v46, v47, (char)v20);
            v49 = xsltXPathCompileFlags(style, v20, 2);
            *(_QWORD *)(v14 + 48) = v49;
            if (!v49)
            {
              xsltTransformError(0, style, inst, "xsl:key : 'match' pattern compilation failed '%s'\n", (const char *)v20);
              ++style->errors;
            }
            v50 = xsltXPathCompileFlags(style, use, 2);
            *(_QWORD *)(v14 + 56) = v50;
            if (!v50)
            {
              xsltTransformError(0, style, inst, "xsl:key : 'use' expression compilation failed '%s'\n", (const char *)use);
              ++style->errors;
            }
            keys = (void **)style->keys;
            p_keys = &style->keys;
            for (j = keys; j; j = (void **)*j)
              p_keys = j;
            *p_keys = (void *)v14;
            *(_QWORD *)v14 = 0;
            v14 = 0;
            goto LABEL_72;
          }
LABEL_78:
          xsltTransformError(0, style, inst, "xsl:key : 'match' pattern is empty\n");
LABEL_79:
          ++style->errors;
          if (v14)
            goto LABEL_75;
          return 0;
        }
        goto LABEL_17;
      }
      v28 = (v28 + 1);
    }
    if ((v28 & 0x80000000) != 0)
      goto LABEL_70;
    if (match[v28] == 91)
      break;
LABEL_53:
    if ((int)v28 <= 0)
      goto LABEL_70;
  }
  v30 = 0;
LABEL_31:
  LODWORD(v28) = v28 + 1;
  while (1)
  {
    v31 = match[(int)v28];
    if (v31 <= 0x26)
    {
      if (v31 != 34)
      {
        if (!match[(int)v28])
          goto LABEL_70;
        goto LABEL_31;
      }
    }
    else if (v31 != 39)
    {
      if (v31 == 91)
      {
        v37 = 1;
        goto LABEL_51;
      }
      if (v31 != 93)
        goto LABEL_31;
      if (v30)
      {
        v37 = -1;
LABEL_51:
        v30 += v37;
        goto LABEL_31;
      }
      v28 = (v28 + 1);
      goto LABEL_53;
    }
    if ((v28 & 0x80000000) != 0)
      goto LABEL_70;
    v32 = match[v28];
    if (v32 == 39 || v32 == 34)
      break;
LABEL_42:
    if ((int)v28 < 1)
      goto LABEL_70;
  }
  v33 = v28;
  LODWORD(v28) = v28 + 1;
  v34 = &v21[v33];
  while (1)
  {
    v36 = *v34++;
    v35 = v36;
    if (!v36)
      break;
    LODWORD(v28) = v28 + 1;
    if (v35 == v32)
      goto LABEL_42;
  }
LABEL_70:
  xsltTransformError(0, style, inst, "xsl:key : 'match' pattern is malformed: %s");
LABEL_71:
  ++style->errors;
LABEL_72:
  if (v20)
    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v20);
  if (v14)
LABEL_75:
    xsltFreeKeyDef(v14);
  return 0;
}

uint64_t xsltFreeKeyDef(uint64_t a1)
{
  xmlXPathCompExpr *v2;
  xmlXPathCompExpr *v3;
  void (**v4)(void);
  __int128 v5;

  v2 = *(xmlXPathCompExpr **)(a1 + 48);
  if (v2)
    xmlXPathFreeCompExpr(v2);
  v3 = *(xmlXPathCompExpr **)(a1 + 56);
  if (v3)
    xmlXPathFreeCompExpr(v3);
  v4 = (void (**)(void))MEMORY[0x24BEDE758];
  if (*(_QWORD *)(a1 + 16))
    ((void (*)(void))*MEMORY[0x24BEDE758])();
  if (*(_QWORD *)(a1 + 24))
    (*v4)();
  if (*(_QWORD *)(a1 + 32))
    (*v4)();
  if (*(_QWORD *)(a1 + 40))
    (*v4)();
  if (*(_QWORD *)(a1 + 64))
    (*v4)();
  *(_QWORD *)&v5 = -1;
  *((_QWORD *)&v5 + 1) = -1;
  *(_OWORD *)(a1 + 48) = v5;
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 16) = v5;
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)a1 = v5;
  return ((uint64_t (*)(uint64_t))*v4)(a1);
}

xmlNodeSetPtr xsltGetKey(xsltTransformContextPtr ctxt, const xmlChar *name, const xmlChar *nameURI, const xmlChar *value)
{
  char i;
  void *keys;

  if (!ctxt)
    return 0;
  if (!name)
    return 0;
  if (!value)
    return 0;
  if (!ctxt->document)
    return 0;
  xsltGenericDebug(xsltGenericDebugContext, "Get key %s, value %s\n", (const char *)name, (const char *)value);
  if (ctxt->document->nbKeysComputed < ctxt->nbKeys && !ctxt->keyInitLevel && xsltInitAllDocKeys(ctxt))
    return 0;
  for (i = 1; ; i = 0)
  {
    keys = ctxt->document->keys;
    if (keys)
      break;
LABEL_15:
    if (ctxt->keyInitLevel == 0 || (i & 1) == 0)
      return 0;
    xsltInitDocKeyTable(ctxt, (xmlChar *)name, nameURI);
  }
  while ((nameURI == 0) == (*((_QWORD *)keys + 2) != 0)
       || !xmlStrEqual(*((const xmlChar **)keys + 1), name)
       || !xmlStrEqual(*((const xmlChar **)keys + 2), nameURI))
  {
    keys = *(void **)keys;
    if (!keys)
      goto LABEL_15;
  }
  return (xmlNodeSetPtr)xmlHashLookup(*((xmlHashTablePtr *)keys + 3), value);
}

int xsltInitAllDocKeys(xsltTransformContextPtr ctxt)
{
  xsltStylesheetPtr style;
  void *i;
  void *keys;
  xsltStylesheetPtr Import;

  if (ctxt)
  {
    if (ctxt->document->nbKeysComputed == ctxt->nbKeys || (style = ctxt->style) == 0)
    {
      LODWORD(Import) = 0;
    }
    else
    {
      do
      {
        for (i = style->keys; i; i = *(void **)i)
        {
          keys = ctxt->document->keys;
          if (keys)
          {
            while ((*((_QWORD *)i + 3) == 0) == (*((_QWORD *)keys + 2) != 0)
                 || !xmlStrEqual(*((const xmlChar **)i + 2), *((const xmlChar **)keys + 1))
                 || !xmlStrEqual(*((const xmlChar **)i + 3), *((const xmlChar **)keys + 2)))
            {
              keys = *(void **)keys;
              if (!keys)
                goto LABEL_10;
            }
          }
          else
          {
LABEL_10:
            xsltInitDocKeyTable(ctxt, *((xmlChar **)i + 2), *((const xmlChar **)i + 3));
          }
        }
        Import = xsltNextImport(style);
        style = Import;
      }
      while (Import);
    }
  }
  else
  {
    LODWORD(Import) = -1;
  }
  return (int)Import;
}

void xsltInitDocKeyTable(xsltTransformContextPtr ctxt, xmlChar *str2, const xmlChar *a3)
{
  xsltStylesheetPtr style;
  int v7;
  xsltKeyDef *i;
  unint64_t *traceCode;

  style = ctxt->style;
  if (!ctxt->style)
    goto LABEL_12;
  v7 = 0;
  do
  {
    for (i = (xsltKeyDef *)style->keys; i; i = i->next)
    {
      if ((a3 != 0) != (i->nameURI == 0) && xmlStrEqual(i->name, str2) && xmlStrEqual(i->nameURI, a3))
      {
        xsltInitCtxtKey(ctxt, ctxt->document, i);
        if (ctxt->document->nbKeysComputed == ctxt->nbKeys)
          return;
        v7 = 1;
      }
    }
    style = xsltNextImport(style);
  }
  while (style);
  if (!v7)
  {
LABEL_12:
    traceCode = ctxt->traceCode;
    if (traceCode)
    {
      if ((*((_BYTE *)traceCode + 1) & 0x80) != 0)
        xsltGenericDebug(xsltGenericDebugContext, "xsltInitDocKeyTable: did not found %s\n", (const char *)str2);
    }
    xsltTransformError(ctxt, 0, 0, "Failed to find key definition for %s\n", (const char *)str2);
    ctxt->state = XSLT_STATE_STOPPED;
  }
}

int xsltInitCtxtKey(xsltTransformContextPtr ctxt, xsltDocumentPtr doc, xsltKeyDefPtr keyd)
{
  xmlXPathCompExpr *comp;
  int keyInitLevel;
  unint64_t *traceCode;
  xmlXPathContextPtr xpathCtxt;
  xmlNode *inst;
  uint64_t v12;
  int nsNr;
  xmlNsPtr *namespaces;
  xmlNode *v15;
  xmlXPathObjectPtr v16;
  xmlXPathObject *v17;
  int *p_nodeNr;
  unint64_t *v19;
  void *i;
  xmlChar *nameURI;
  const xmlChar *v22;
  _QWORD *v23;
  int *v24;
  uint64_t v25;
  xmlXPathObject *v26;
  uint64_t v27;
  unsigned int v28;
  BOOL v29;
  int v30;
  xmlXPathObjectPtr v32;
  xmlNodeSetPtr nodesetval;
  int nodeNr;
  xmlChar *stringval;
  unint64_t v36;
  int v37;
  uint64_t v38;
  unint64_t *v39;
  xmlNodeSet *v40;
  xmlNodeSetPtr v41;
  unsigned int v42;
  unint64_t *v43;
  const char *v44;
  unint64_t *v45;
  xmlXPathObject *v46;
  xmlNode *v47;
  int v48;
  _DWORD *v49;
  xmlNsPtr *v50;
  __int128 v51;
  __int128 v52;

  comp = keyd->comp;
  if (!comp || !keyd->usecomp)
    return -1;
  keyInitLevel = ctxt->keyInitLevel;
  if (keyInitLevel > ctxt->nbKeys)
  {
    traceCode = ctxt->traceCode;
    if (traceCode)
    {
      if ((*((_BYTE *)traceCode + 1) & 0x80) != 0)
        xsltGenericDebug(xsltGenericDebugContext, "xsltInitCtxtKey: key definition of %s is recursive\n", (const char *)keyd->name);
    }
    xsltTransformError(ctxt, 0, keyd->inst, "Key definition for %s is recursive\n", (const char *)keyd->name);
    ctxt->state = XSLT_STATE_STOPPED;
    return -1;
  }
  ctxt->keyInitLevel = keyInitLevel + 1;
  xpathCtxt = ctxt->xpathCtxt;
  ++doc->nbKeysComputed;
  inst = ctxt->inst;
  v51 = *(_OWORD *)&xpathCtxt->doc;
  v52 = *(_OWORD *)&ctxt->document;
  v12 = *(_QWORD *)&xpathCtxt->contextSize;
  nsNr = xpathCtxt->nsNr;
  namespaces = xpathCtxt->namespaces;
  v15 = (xmlNode *)doc->doc;
  ctxt->document = doc;
  ctxt->node = v15;
  ctxt->inst = keyd->inst;
  xpathCtxt->doc = (xmlDocPtr)v15;
  xpathCtxt->node = v15;
  xpathCtxt->namespaces = keyd->nsList;
  xpathCtxt->nsNr = keyd->nsNr;
  v16 = xmlXPathCompiledEval(comp, xpathCtxt);
  v17 = v16;
  v50 = namespaces;
  if (!v16)
  {
    v43 = ctxt->traceCode;
    if (!v43)
    {
      xsltTransformError(ctxt, 0, keyd->inst, "Failed to evaluate the 'match' expression.\n");
      goto LABEL_84;
    }
    v44 = "Failed to evaluate the 'match' expression.\n";
    if ((*((_BYTE *)v43 + 1) & 0x80) != 0)
      xsltGenericDebug(xsltGenericDebugContext, "xsltInitCtxtKey: %s evaluation failed\n");
    goto LABEL_83;
  }
  if (v16->type != XPATH_NODESET)
  {
    v45 = ctxt->traceCode;
    if (v45)
    {
      v44 = "The 'match' expression did not evaluate to a node set.\n";
      if ((*((_BYTE *)v45 + 1) & 0x80) != 0)
        xsltGenericDebug(xsltGenericDebugContext, "xsltInitCtxtKey: %s is not a node set\n");
    }
    else
    {
      v44 = "The 'match' expression did not evaluate to a node set.\n";
    }
LABEL_83:
    xsltTransformError(ctxt, 0, keyd->inst, v44);
    goto LABEL_84;
  }
  p_nodeNr = &v16->nodesetval->nodeNr;
  if (!p_nodeNr)
    goto LABEL_80;
  v19 = ctxt->traceCode;
  v49 = &v16->nodesetval->nodeNr;
  if (v19 && (*((_BYTE *)v19 + 1) & 0x80) != 0)
  {
    xsltGenericDebug(xsltGenericDebugContext, "xsltInitCtxtKey: %s evaluates to %d nodes\n", (const char *)keyd->match, *v49);
    p_nodeNr = v49;
  }
  if (*p_nodeNr < 1)
    goto LABEL_80;
  for (i = doc->keys; i; i = *(void **)i)
  {
    if (xmlStrEqual(*((const xmlChar **)i + 1), keyd->name))
    {
      nameURI = keyd->nameURI;
      v22 = (const xmlChar *)*((_QWORD *)i + 2);
      if (nameURI)
      {
        if (v22 && xmlStrEqual(v22, nameURI))
          goto LABEL_26;
      }
      else if (!v22)
      {
        goto LABEL_26;
      }
    }
  }
  v23 = (_QWORD *)xsltNewKeyTable(keyd->name, keyd->nameURI);
  if (!v23)
    goto LABEL_80;
  i = v23;
  *v23 = doc->keys;
  doc->keys = v23;
LABEL_26:
  v24 = v49;
  *(_QWORD *)&xpathCtxt->contextSize = 0x100000001;
  if ((int)*v49 < 1)
  {
LABEL_80:
    v26 = 0;
    stringval = 0;
    goto LABEL_85;
  }
  v25 = 0;
  v26 = 0;
  v46 = v17;
  v47 = inst;
  v48 = nsNr;
  while (1)
  {
    v27 = *(_QWORD *)(*((_QWORD *)v24 + 1) + 8 * v25);
    if (v27)
    {
      v28 = *(_DWORD *)(v27 + 8);
      v29 = v28 > 0xD;
      v30 = (1 << v28) & 0x239E;
      if (!v29 && v30 != 0)
        break;
    }
    nsNr = v48;
LABEL_72:
    stringval = 0;
    if (++v25 >= *v24)
      goto LABEL_85;
  }
  ctxt->node = (xmlNodePtr)v27;
  xpathCtxt->node = (xmlNodePtr)v27;
  if (v26)
    xmlXPathFreeObject(v26);
  v32 = xmlXPathCompiledEval(keyd->usecomp, xpathCtxt);
  if (v32)
  {
    v26 = v32;
    if (v32->type == XPATH_STRING)
    {
      stringval = v32->stringval;
      v32->stringval = 0;
    }
    else
    {
      if (v32->type == XPATH_NODESET)
      {
        nodesetval = v32->nodesetval;
        if (!nodesetval)
        {
LABEL_71:
          nsNr = v48;
          v24 = v49;
          goto LABEL_72;
        }
        nodeNr = nodesetval->nodeNr;
        if (!nodesetval->nodeNr)
        {
LABEL_70:
          inst = v47;
          goto LABEL_71;
        }
        stringval = xmlXPathCastNodeToString(*nodesetval->nodeTab);
LABEL_45:
        v36 = 0;
        if (nodeNr <= 1)
          v37 = 1;
        else
          v37 = nodeNr;
        v38 = 8 * (v37 - 1);
        if (!stringval)
          goto LABEL_66;
LABEL_49:
        v39 = ctxt->traceCode;
        if (v39 && (*((_BYTE *)v39 + 1) & 0x80) != 0)
          xsltGenericDebug(xsltGenericDebugContext, "xsl:key : node associated to ('%s', '%s')\n", (const char *)keyd->name, (const char *)stringval);
        v40 = (xmlNodeSet *)xmlHashLookup(*((xmlHashTablePtr *)i + 3), stringval);
        if (v40)
        {
          xmlXPathNodeSetAdd(v40, (xmlNodePtr)v27);
        }
        else
        {
          v41 = xmlXPathNodeSetCreate((xmlNodePtr)v27);
          if (!v41)
          {
            v17 = v46;
            inst = v47;
            nsNr = v48;
            goto LABEL_85;
          }
          xmlHashAddEntry(*((xmlHashTablePtr *)i + 3), stringval, v41);
        }
        if (linkedOnOrAfterFall2023OSVersions())
        {
          xsltSetSourceNodeFlags((uint64_t)ctxt, v27, 1);
        }
        else
        {
          v42 = *(_DWORD *)(v27 + 8);
          if (v42 <= 0xD)
          {
            if (((1 << v42) & 0x19A) != 0)
            {
              *(_QWORD *)(v27 + 104) = keyd;
            }
            else if (((1 << v42) & 0x2200) != 0)
            {
              *(_QWORD *)(v27 + 160) = keyd;
            }
            else if (v42 == 2)
            {
              *(_QWORD *)(v27 + 88) = keyd;
            }
          }
        }
        ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(stringval);
LABEL_66:
        while (v38 != v36)
        {
          stringval = xmlXPathCastNodeToString(v26->nodesetval->nodeTab[v36 / 8 + 1]);
          v36 += 8;
          if (stringval)
            goto LABEL_49;
        }
        v17 = v46;
        goto LABEL_70;
      }
      stringval = xmlXPathCastToString(v32);
    }
    nodeNr = 1;
    goto LABEL_45;
  }
  nsNr = v48;
  xsltTransformError(ctxt, 0, keyd->inst, "Failed to evaluate the 'use' expression.\n");
LABEL_84:
  v26 = 0;
  stringval = 0;
  ctxt->state = XSLT_STATE_STOPPED;
LABEL_85:
  --ctxt->keyInitLevel;
  *(_OWORD *)&xpathCtxt->doc = v51;
  xpathCtxt->nsNr = nsNr;
  xpathCtxt->namespaces = v50;
  *(_QWORD *)&xpathCtxt->contextSize = v12;
  *(_OWORD *)&ctxt->document = v52;
  ctxt->inst = inst;
  if (stringval)
    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(stringval);
  if (v26)
    xmlXPathFreeObject(v26);
  if (v17)
    xmlXPathFreeObject(v17);
  return 0;
}

uint64_t xsltNewKeyTable(const xmlChar *a1, const xmlChar *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = ((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(32);
  v5 = v4;
  if (v4)
  {
    *(_OWORD *)v4 = 0u;
    *(_OWORD *)(v4 + 16) = 0u;
    if (a1)
      *(_QWORD *)(v4 + 8) = xmlStrdup(a1);
    if (a2)
      *(_QWORD *)(v5 + 16) = xmlStrdup(a2);
    *(_QWORD *)(v5 + 24) = xmlHashCreate(0);
  }
  else
  {
    xsltTransformError(0, 0, 0, "xsltNewKeyTable : malloc failed\n");
  }
  return v5;
}

void xsltInitCtxtKeys(xsltTransformContextPtr ctxt, xsltDocumentPtr doc)
{
  xmlDocPtr v4;
  const char *URL;
  unint64_t *traceCode;
  xsltStylesheetPtr i;
  xsltKeyDef *j;

  if (ctxt && doc)
  {
    v4 = doc->doc;
    if (v4)
    {
      URL = (const char *)v4->URL;
      if (URL)
      {
        traceCode = ctxt->traceCode;
        if (traceCode)
        {
          if ((*((_BYTE *)traceCode + 1) & 0x80) != 0)
            xsltGenericDebug(xsltGenericDebugContext, "Initializing keys on %s\n", URL);
        }
      }
    }
    for (i = ctxt->style; i; i = xsltNextImport(i))
    {
      for (j = (xsltKeyDef *)i->keys; j; j = j->next)
        xsltInitCtxtKey(ctxt, doc, j);
    }
  }
}

void xsltFreeDocumentKeys(xsltDocumentPtr doc)
{
  _QWORD *keys;
  void (**v2)(void);
  _QWORD *v3;
  xmlHashTable *v4;
  __int128 v5;

  if (doc)
  {
    keys = doc->keys;
    if (keys)
    {
      v2 = (void (**)(void))MEMORY[0x24BEDE758];
      do
      {
        v3 = (_QWORD *)*keys;
        if (keys[1])
          (*v2)();
        if (keys[2])
          (*v2)();
        v4 = (xmlHashTable *)keys[3];
        if (v4)
          xmlHashFree(v4, (xmlHashDeallocator)xsltFreeNodeSetEntry);
        *(_QWORD *)&v5 = -1;
        *((_QWORD *)&v5 + 1) = -1;
        *(_OWORD *)keys = v5;
        *((_OWORD *)keys + 1) = v5;
        ((void (*)(_QWORD *))*v2)(keys);
        keys = v3;
      }
      while (v3);
    }
  }
}

void xsltNamespaceAlias(xsltStylesheetPtr style, xmlNodePtr node)
{
  xmlChar *NsProp;
  const xmlChar *v5;
  xmlChar *v6;
  const xmlChar *v7;
  int v8;
  _xmlDoc *doc;
  xmlNsPtr v10;
  const xmlChar *href;
  void (*v12)(const xmlChar *);
  const xmlChar *v13;
  xmlNsPtr v14;
  int v15;
  _xmlDoc *v16;
  xmlNsPtr v17;
  uint64_t v18;
  xmlNsPtr v19;
  xmlHashTable *nsAliases;
  void (**v21)(const xmlChar *);

  if (style && node)
  {
    NsProp = xmlGetNsProp(node, (const xmlChar *)"stylesheet-prefix", 0);
    if (!NsProp)
    {
      xsltTransformError(0, style, node, "namespace-alias: stylesheet-prefix attribute missing\n");
      return;
    }
    v5 = NsProp;
    v6 = xmlGetNsProp(node, (const xmlChar *)"result-prefix", 0);
    if (!v6)
    {
      xsltTransformError(0, style, node, "namespace-alias: result-prefix attribute missing\n");
      v12 = (void (*)(const xmlChar *))*MEMORY[0x24BEDE758];
      v13 = v5;
LABEL_29:
      v12(v13);
      return;
    }
    v7 = v6;
    v8 = xmlStrEqual(v5, (const xmlChar *)"#default");
    doc = node->doc;
    if (v8)
    {
      v10 = xmlSearchNs(doc, node, 0);
      if (v10)
        href = v10->href;
      else
        href = 0;
    }
    else
    {
      v14 = xmlSearchNs(doc, node, v5);
      if (!v14)
        goto LABEL_27;
      href = v14->href;
      if (!href)
        goto LABEL_27;
    }
    v15 = xmlStrEqual(v7, (const xmlChar *)"#default");
    v16 = node->doc;
    if (v15)
    {
      v17 = xmlSearchNs(v16, node, 0);
      if (!v17)
      {
        if (!href)
          goto LABEL_28;
        v18 = -1;
        goto LABEL_24;
      }
      v18 = (uint64_t)v17->href;
LABEL_20:
      if (!href)
      {
        style->defaultAlias = (const xmlChar *)v18;
LABEL_28:
        v21 = (void (**)(const xmlChar *))MEMORY[0x24BEDE758];
        ((void (*)(const xmlChar *))*MEMORY[0x24BEDE758])(v5);
        v12 = *v21;
        v13 = v7;
        goto LABEL_29;
      }
LABEL_24:
      nsAliases = style->nsAliases;
      if (nsAliases || (nsAliases = xmlHashCreate(10), (style->nsAliases = nsAliases) != 0))
        xmlHashAddEntry(nsAliases, href, (void *)v18);
      else
        xsltTransformError(0, style, node, "namespace-alias: cannot create hash table\n");
      goto LABEL_28;
    }
    v19 = xmlSearchNs(v16, node, v7);
    if (v19)
    {
      v18 = (uint64_t)v19->href;
      if (v18)
        goto LABEL_20;
    }
LABEL_27:
    xsltTransformError(0, style, node, "namespace-alias: prefix %s not bound to any namespace\n");
    goto LABEL_28;
  }
}

xmlNsPtr xsltGetSpecialNamespace(xsltTransformContextPtr ctxt, xmlNodePtr cur, const xmlChar *URI, const xmlChar *prefix, xmlNodePtr out)
{
  xmlNs *ns;
  const xmlChar *v12;
  _xmlNode *v13;
  const xmlChar *v14;
  xmlNsPtr v15;
  _xmlAttr *properties;
  xmlNs *v17;
  const char *v18;
  int i;
  xmlNsPtr v20;
  xmlNs *nsDef;
  _xmlNode *parent;
  xmlNsPtr v23;
  const xmlChar *v24;
  const xmlChar *href;
  char __str[8];
  uint64_t v27;
  _WORD v28[7];
  uint64_t v29;

  ns = 0;
  v29 = *MEMORY[0x24BDAC8D0];
  if (!ctxt || !out)
    return ns;
  if (out->type != XML_ELEMENT_NODE)
    return 0;
  if (prefix)
  {
    if (*prefix == 120 && prefix[1] == 109 && prefix[2] == 108 && !prefix[3])
      return xmlSearchNs(out->doc, out, prefix);
  }
  else if (!URI || !*URI)
  {
    nsDef = out->nsDef;
    if (nsDef)
    {
      while (nsDef->prefix)
      {
        nsDef = nsDef->next;
        if (!nsDef)
          goto LABEL_43;
      }
      href = nsDef->href;
      if (href && *href)
        xsltTransformError(ctxt, 0, cur, "Namespace normalization error: Cannot undeclare the default namespace, since the default namespace '%s' is already declared on the result element '%s'.\n");
    }
    else
    {
LABEL_43:
      parent = out->parent;
      if (parent)
      {
        if (parent->type == XML_ELEMENT_NODE)
        {
          if (parent->ns)
          {
            v23 = xmlSearchNs(out->doc, parent, 0);
            if (v23)
            {
              v24 = v23->href;
              if (v24)
              {
                if (*v24)
                  xmlNewNs(out, (const xmlChar *)&unk_209C1ADF6, 0);
              }
            }
          }
        }
      }
    }
    return 0;
  }
  ns = out->nsDef;
  if (ns)
  {
    while (1)
    {
      v12 = ns->prefix;
      if ((prefix == 0) != (v12 != 0) && (v12 == prefix || xmlStrEqual(v12, prefix)))
        break;
      ns = ns->next;
      if (!ns)
        goto LABEL_17;
    }
    if (xmlStrEqual(ns->href, URI))
      return ns;
  }
  else
  {
LABEL_17:
    v13 = out->parent;
    if (!v13 || v13->type != XML_ELEMENT_NODE)
      return xmlNewNs(out, URI, prefix);
    ns = v13->ns;
    if (ns)
    {
      v14 = ns->prefix;
      if ((prefix == 0) != (v14 != 0) && (!prefix || xmlStrEqual(v14, prefix)))
      {
        if (xmlStrEqual(ns->href, URI))
          return ns;
      }
    }
    v15 = xmlSearchNs(out->doc, out->parent, prefix);
    if (!v15)
      return xmlNewNs(out, URI, prefix);
    ns = v15;
    if (xmlStrEqual(v15->href, URI))
      return ns;
    properties = out->properties;
    if (!properties)
      return xmlNewNs(out, URI, prefix);
    while (1)
    {
      v17 = properties->ns;
      if (v17)
      {
        if (xmlStrEqual(v17->prefix, prefix))
          break;
      }
      properties = properties->next;
      if (!properties)
        return xmlNewNs(out, URI, prefix);
    }
  }
  ns = xmlSearchNsByHref(out->doc, out, URI);
  if (!ns)
  {
    *(_QWORD *)__str = 0;
    v27 = 0;
    memset(v28, 0, sizeof(v28));
    if (prefix)
      v18 = (const char *)prefix;
    else
      v18 = "ns";
    for (i = 1; ; ++i)
    {
      snprintf(__str, 0x1EuLL, "%s_%d", v18, i);
      v20 = xmlSearchNs(out->doc, out, (const xmlChar *)__str);
      if (i == 1000)
        break;
      if (!v20)
        return xmlNewNs(out, URI, (const xmlChar *)__str);
    }
    xsltTransformError(ctxt, 0, cur, "Internal error in xsltAcquireResultInScopeNs(): Failed to compute a unique ns-prefix for the generated element");
    return 0;
  }
  return ns;
}

xmlNsPtr xsltGetNamespace(xsltTransformContextPtr ctxt, xmlNodePtr cur, xmlNsPtr ns, xmlNodePtr out)
{
  xsltStylesheetPtr style;
  xmlHashTable *nsAliases;
  const xmlChar *v10;
  xsltTransformContext *v11;
  xmlNode *v12;
  const xmlChar *prefix;
  const xmlChar *href;

  if (!ns || !ctxt || !cur || !out)
    return 0;
  style = ctxt->style;
  if (!ctxt->style)
  {
LABEL_9:
    href = ns->href;
LABEL_14:
    prefix = ns->prefix;
    v11 = ctxt;
    v12 = cur;
    return xsltGetSpecialNamespace(v11, v12, href, prefix, out);
  }
  while (1)
  {
    nsAliases = style->nsAliases;
    if (nsAliases)
    {
      v10 = (const xmlChar *)xmlHashLookup(nsAliases, ns->href);
      if (v10)
        break;
    }
    style = xsltNextImport(style);
    if (!style)
      goto LABEL_9;
  }
  href = v10;
  if (v10 != (const xmlChar *)-1)
    goto LABEL_14;
  v11 = ctxt;
  v12 = cur;
  href = 0;
  prefix = 0;
  return xsltGetSpecialNamespace(v11, v12, href, prefix, out);
}

xmlNsPtr xsltCopyNamespaceList(xsltTransformContextPtr ctxt, xmlNodePtr node, xmlNsPtr cur)
{
  xmlNsPtr v3;
  xmlNodePtr v5;
  xmlNs *v6;
  xmlNs *v8;
  xmlNs *ns;
  xmlNsPtr v10;
  const xmlChar *v11;
  const xmlChar *href;
  xmlNsPtr v13;

  if (cur)
  {
    v3 = cur;
    if (cur->type == XML_NAMESPACE_DECL)
    {
      if (node)
      {
        if (node->type == XML_ELEMENT_NODE)
          v5 = node;
        else
          v5 = 0;
      }
      else
      {
        v5 = 0;
      }
      v8 = 0;
      v6 = 0;
      while (1)
      {
        while (1)
        {
          if (v3->type != XML_NAMESPACE_DECL)
            return v6;
          if (!v5)
            break;
          ns = v5->ns;
          if (!ns || !xmlStrEqual(ns->prefix, v3->prefix) || !xmlStrEqual(v5->ns->href, v3->href))
          {
            v10 = xmlSearchNs(v5->doc, v5, v3->prefix);
            if (!v10 || !xmlStrEqual(v10->href, v3->href))
              break;
          }
LABEL_20:
          v3 = v3->next;
          if (!v3)
            return v6;
        }
        if (xmlStrEqual(v3->href, (const xmlChar *)"http://www.w3.org/1999/XSL/Transform"))
        {
          v13 = v8;
        }
        else
        {
          v11 = (const xmlChar *)xmlHashLookup(ctxt->style->nsAliases, v3->href);
          if (v11 == (const xmlChar *)-1)
            goto LABEL_20;
          href = v11;
          if (!v11)
            href = v3->href;
          v13 = xmlNewNs(v5, href, v3->prefix);
          if (v8)
            v8->next = v13;
          else
            v6 = v13;
        }
        v3 = v3->next;
        v8 = v13;
        if (!v3)
          return v6;
      }
    }
  }
  return 0;
}

xmlNsPtr xsltCopyNamespace(xsltTransformContextPtr ctxt, xmlNodePtr elem, xmlNsPtr ns)
{
  if (!ns || ns->type != XML_NAMESPACE_DECL)
    return 0;
  if (elem)
  {
    if (elem->type != XML_ELEMENT_NODE)
      elem = 0;
  }
  return xmlNewNs(elem, ns->href, ns->prefix);
}

void xsltFreeNamespaceAliasHashes(xsltStylesheetPtr style)
{
  xmlHashTable *nsAliases;

  nsAliases = style->nsAliases;
  if (nsAliases)
    xmlHashFree(nsAliases, 0);
  style->nsAliases = 0;
}

void xsltNumberFormat(xsltTransformContextPtr ctxt, xsltNumberDataPtr data, xmlNodePtr node)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  xsltTransformContext *v8;
  const xmlChar *v9;
  xmlBufferPtr v10;
  xmlBuffer *v11;
  const xmlChar *v12;
  xmlXPathContext *xpathCtxt;
  xmlBuffer *v14;
  xmlBuffer *v15;
  const xmlChar *v16;
  xmlXPathObjectPtr v17;
  xmlChar *v18;
  xmlChar *v19;
  int MultipleLevel;
  int v21;
  double *p_floatval;
  uint64_t v23;
  xsltCompMatch *v24;
  xsltCompMatch *v25;
  xmlNode *insert;
  const xmlChar *v27;
  void (**v28)(void);
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  double floatval;
  _QWORD v36[1025];

  v3 = MEMORY[0x24BDAC7A8](ctxt, data, node);
  v5 = v4;
  v7 = v6;
  v8 = (xsltTransformContext *)v3;
  v36[1024] = *MEMORY[0x24BDAC8D0];
  bzero(&v31, 0x4018uLL);
  v9 = *(const xmlChar **)(v7 + 32);
  if (v9)
  {
    xsltNumberFormatTokenize(v9, (uint64_t)&v31);
  }
  else
  {
    if (!*(_DWORD *)(v7 + 40))
      return;
    v18 = xsltEvalAttrValueTemplate(v8, *(xmlNodePtr *)(v7 + 64), (const xmlChar *)"format", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
    if (!v18)
      return;
    v19 = v18;
    xsltNumberFormatTokenize(v18, (uint64_t)&v31);
    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v19);
  }
  v10 = xmlBufferCreate();
  if (v10)
  {
    v11 = v10;
    floatval = 0.0;
    v12 = *(const xmlChar **)(v7 + 24);
    if (v12)
    {
      xpathCtxt = v8->xpathCtxt;
      v14 = xmlBufferCreate();
      if (v14)
      {
        v15 = v14;
        xmlBufferCCat(v14, "number(");
        xmlBufferCat(v15, v12);
        xmlBufferCCat(v15, ")");
        xpathCtxt->node = (xmlNodePtr)v5;
        v16 = xmlBufferContent(v15);
        v17 = xmlXPathEval(v16, xpathCtxt);
        if (v17)
        {
          floatval = v17->floatval;
          xmlXPathFreeObject(v17);
          xmlBufferFree(v15);
          xsltNumberFormatInsertNumbers(v7, (uint64_t)&floatval, 1, (uint64_t)&v31, v11);
        }
        else
        {
          xmlBufferFree(v15);
        }
      }
      goto LABEL_27;
    }
    if (!*(_QWORD *)v7)
    {
LABEL_27:
      insert = v8->insert;
      v27 = xmlBufferContent(v11);
      xsltCopyTextString(v8, insert, v27, 0);
      xmlBufferFree(v11);
      goto LABEL_28;
    }
    if (xmlStrEqual(*(const xmlChar **)v7, (const xmlChar *)"single"))
    {
      if (xsltNumberFormatGetMultipleLevel(v8, v5, *(xsltCompMatch **)(v7 + 72), *(xsltCompMatch **)(v7 + 80), (uint64_t)&floatval, 1) != 1)goto LABEL_23;
      goto LABEL_21;
    }
    if (xmlStrEqual(*(const xmlChar **)v7, (const xmlChar *)"multiple"))
    {
      bzero(v36, 0x2000uLL);
      MultipleLevel = xsltNumberFormatGetMultipleLevel(v8, v5, *(xsltCompMatch **)(v7 + 72), *(xsltCompMatch **)(v7 + 80), (uint64_t)v36, 1024);
      if (MultipleLevel >= 1)
      {
        v21 = MultipleLevel;
        p_floatval = (double *)v36;
        v23 = v7;
LABEL_22:
        xsltNumberFormatInsertNumbers(v23, (uint64_t)p_floatval, v21, (uint64_t)&v31, v11);
      }
    }
    else if (xmlStrEqual(*(const xmlChar **)v7, (const xmlChar *)"any"))
    {
      xsltNumberFormatGetAnyLevel((uint64_t)v8, v5, *(xsltCompMatch **)(v7 + 72), *(xsltCompMatch **)(v7 + 80), &floatval);
LABEL_21:
      p_floatval = &floatval;
      v23 = v7;
      v21 = 1;
      goto LABEL_22;
    }
LABEL_23:
    v24 = *(xsltCompMatch **)(v7 + 72);
    if (v24)
      xsltCompMatchClearCache(v8, v24);
    v25 = *(xsltCompMatch **)(v7 + 80);
    if (v25)
      xsltCompMatchClearCache(v8, v25);
    goto LABEL_27;
  }
LABEL_28:
  v28 = (void (**)(void))MEMORY[0x24BEDE758];
  if (v31)
    ((void (*)(void))*MEMORY[0x24BEDE758])();
  if (v34)
    (*v28)();
  v29 = v33;
  if (v33 >= 1)
  {
    v30 = &v32;
    do
    {
      if (*v30)
        (*v28)();
      v30 += 2;
      --v29;
    }
    while (v29);
  }
}

xmlChar *xsltNumberFormatTokenize(const xmlChar *a1, uint64_t a2)
{
  uint64_t v3;
  const xmlChRangeGroup *v4;
  const xmlChRangeGroup *v5;
  int v6;
  signed int v7;
  xmlChar *result;
  uint64_t v9;
  int v10;
  const xmlChRangeGroup *v11;
  const xmlChar *v12;
  int v13;
  int v14;
  int IsDigitZero;
  int v16;
  uint64_t v17;
  int v18;
  int *v19;
  int *v20;
  uint64_t v21;
  const xmlChRangeGroup *v22;
  BOOL v23;
  BOOL v25;
  BOOL v26;
  int v29;
  unsigned int v30;
  unint64_t v31;
  BOOL v32;
  int v33;
  BOOL v34;
  int *v36;
  int len;

  v3 = 0;
  len = 0;
  qword_2545ADBA8 = 0x100000030;
  default_token = (uint64_t)".";
  *(_QWORD *)(a2 + 16400) = 0;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  v4 = (const xmlChRangeGroup *)MEMORY[0x24BEDE8E0];
  v5 = (const xmlChRangeGroup *)MEMORY[0x24BEDE8C8];
  while (1)
  {
    v6 = xmlStringCurrentChar(0, &a1[(int)v3], &len);
    v7 = xmlStringCurrentChar(0, &a1[(int)v3], &len);
    if (v6 <= 255)
      break;
    result = (xmlChar *)xmlCharInRange(v7, v5);
    if ((_DWORD)result)
      goto LABEL_27;
LABEL_14:
    LODWORD(result) = xmlStringCurrentChar(0, &a1[(int)v3], &len);
    if ((int)result < 256)
      goto LABEL_15;
    if (xmlStringCurrentChar(0, &a1[(int)v3], &len) >= 19968)
    {
      result = (xmlChar *)xmlStringCurrentChar(0, &a1[(int)v3], &len);
      if ((int)result < 40870)
        goto LABEL_27;
    }
    result = (xmlChar *)xmlStringCurrentChar(0, &a1[(int)v3], &len);
    if ((_DWORD)result == 12295)
      goto LABEL_27;
    LODWORD(result) = xmlStringCurrentChar(0, &a1[(int)v3], &len);
    if ((int)result < 12321)
    {
      if ((int)result <= 255)
      {
LABEL_15:
        result = (xmlChar *)(((_DWORD)result - 48) < 0xA);
        if ((_DWORD)result)
          goto LABEL_27;
        goto LABEL_25;
      }
    }
    else
    {
      result = (xmlChar *)xmlStringCurrentChar(0, &a1[(int)v3], &len);
      if ((int)result < 12330)
        goto LABEL_27;
    }
    result = (xmlChar *)xmlCharInRange(result, v4);
    if ((_DWORD)result)
      goto LABEL_27;
LABEL_25:
    if (!a1[(int)v3])
      goto LABEL_27;
    v3 = (len + v3);
  }
  if (v7 < 65 || (result = (xmlChar *)xmlStringCurrentChar(0, &a1[(int)v3], &len), (int)result >= 91))
  {
    if (xmlStringCurrentChar(0, &a1[(int)v3], &len) < 97
      || (result = (xmlChar *)xmlStringCurrentChar(0, &a1[(int)v3], &len), (int)result >= 123))
    {
      if (xmlStringCurrentChar(0, &a1[(int)v3], &len) < 192
        || (result = (xmlChar *)xmlStringCurrentChar(0, &a1[(int)v3], &len), (int)result >= 215))
      {
        if (xmlStringCurrentChar(0, &a1[(int)v3], &len) < 216
          || (result = (xmlChar *)xmlStringCurrentChar(0, &a1[(int)v3], &len), (int)result >= 247))
        {
          result = (xmlChar *)xmlStringCurrentChar(0, &a1[(int)v3], &len);
          if ((int)result <= 247)
            goto LABEL_14;
        }
      }
    }
  }
LABEL_27:
  v9 = a2;
  if ((int)v3 >= 1)
  {
    result = xmlStrndup(a1, v3);
    *(_QWORD *)a2 = result;
  }
  v10 = 0;
  *(_DWORD *)(a2 + 16392) = 0;
  v11 = (const xmlChRangeGroup *)MEMORY[0x24BEDE8C8];
  v36 = (int *)(a2 + 16392);
  while (2)
  {
    v12 = &a1[(int)v3];
    if (!*v12)
      return result;
    if (v10 >= 1)
    {
      *(_QWORD *)(v9 + 16 * v10 + 8) = *(_QWORD *)(v9 + 16400);
      *(_QWORD *)(v9 + 16400) = 0;
    }
    v13 = xmlStringCurrentChar(0, v12, &len);
    v14 = v13 - 1;
    IsDigitZero = xsltIsDigitZero(v13 - 1);
    v16 = xsltIsDigitZero(v13);
    if (IsDigitZero)
    {
      v17 = a2;
      *(_DWORD *)(a2 + 16 * *v36 + 20) = 1;
      if (!v16)
        goto LABEL_40;
      goto LABEL_38;
    }
    if (v16)
    {
      v17 = a2;
      *(_DWORD *)(a2 + 16 * *v36 + 20) = 1;
      do
      {
LABEL_38:
        ++*(_DWORD *)(v17 + 16 * *v36 + 20);
        v3 = len + (uint64_t)(int)v3;
        v13 = xmlStringCurrentChar(0, &a1[v3], &len);
      }
      while (xsltIsDigitZero(v13));
      v14 = v13 - 1;
LABEL_40:
      v18 = xsltIsDigitZero(v14);
      v19 = (int *)(v17 + 16 * *v36 + 16);
      if (v18)
      {
        *v19 = v14;
        v3 = len + (uint64_t)(int)v3;
        v13 = xmlStringCurrentChar(0, &a1[v3], &len);
      }
      else
      {
        *(_QWORD *)v19 = 0x100000030;
      }
      v20 = (int *)(a2 + 16392);
    }
    else
    {
      HIDWORD(v31) = v13 - 65;
      LODWORD(v31) = v13 - 65;
      v30 = v31 >> 3;
      v32 = v30 > 5;
      v33 = (1 << v30) & 0x33;
      v34 = v32 || v33 == 0;
      v20 = (int *)(a2 + 16392);
      if (v34)
      {
        *(_QWORD *)(a2 + 16 * *v36 + 16) = 0x100000030;
      }
      else
      {
        *(_DWORD *)(a2 + 16 * *v36 + 16) = v13;
        v3 = len + (uint64_t)(int)v3;
        v13 = xmlStringCurrentChar(0, &a1[v3], &len);
      }
    }
    v21 = v3;
    v22 = (const xmlChRangeGroup *)MEMORY[0x24BEDE8E0];
    while (2)
    {
      if (v13 <= 255)
      {
        if ((v13 - 192) >= 0x17
          && (v13 & 0xFFFFFFDF) - 65 >= 0x1A
          && v13 <= 247
          && (v13 - 216) >= 0x1F)
        {
          result = (xmlChar *)((v13 - 48) < 0xA);
          if ((v13 - 48) >= 0xA)
            break;
        }
        goto LABEL_62;
      }
      if (xmlCharInRange(v13, v11))
        v23 = 0;
      else
        v23 = (v13 - 12321) >= 9;
      v25 = v23 && v13 != 12295 && (v13 - 19968) >= 0x51A6;
      if (!v25 || (result = (xmlChar *)xmlCharInRange(v13, v22), (_DWORD)result))
      {
LABEL_62:
        v21 = len + (uint64_t)(int)v21;
        v13 = xmlStringCurrentChar(0, &a1[v21], &len);
        continue;
      }
      break;
    }
    v3 = v21;
    while (2)
    {
      if (v13 <= 255)
      {
        if ((v13 - 192) < 0x17)
          break;
        if ((v13 & 0xFFFFFFDF) - 65 < 0x1A)
          break;
        if (v13 > 247)
          break;
        if ((v13 - 216) < 0x1F)
          break;
        result = (xmlChar *)((v13 - 48) < 0xA);
        if (!v13)
          break;
        goto LABEL_84;
      }
      result = (xmlChar *)xmlCharInRange(v13, v11);
      if ((_DWORD)result)
        v26 = 0;
      else
        v26 = (v13 - 12321) >= 9;
      if (v26 && v13 != 12295 && (v13 - 19968) >= 0x51A6)
      {
        result = (xmlChar *)xmlCharInRange(v13, MEMORY[0x24BEDE8E0]);
LABEL_84:
        if ((_DWORD)result)
          break;
        v3 = len + (uint64_t)(int)v3;
        result = (xmlChar *)xmlStringCurrentChar(0, &a1[v3], &len);
        v13 = (int)result;
        continue;
      }
      break;
    }
    if ((int)v3 > (int)v21)
    {
      result = xmlStrndup(&a1[(int)v21], (int)v3 - (int)v21);
      *(_QWORD *)(a2 + 16400) = result;
    }
    v29 = *v20;
    v10 = *v20 + 1;
    *v20 = v10;
    v9 = a2;
    if (v29 < 1023)
      continue;
    return result;
  }
}

uint64_t xsltNumberFormatInsertNumbers(uint64_t result, uint64_t a2, int a3, uint64_t a4, xmlBufferPtr buf)
{
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  double v13;
  uint64_t v14;
  uint64_t *v15;
  BOOL v16;
  uint64_t v17;
  int IsInf;
  xmlBuffer *v19;
  const char *v20;
  int v21;
  unint64_t v22;
  int *v23;
  xmlBuffer *v24;
  double v25;
  int v26;
  uint64_t v27;
  xmlBuffer *v28;
  double v29;
  int v30;
  const xmlChar *v31;
  int *v32;

  v32 = (int *)result;
  if (*(_QWORD *)a4)
    result = xmlBufferCat(buf, *(const xmlChar **)a4);
  v9 = a3 - 1;
  if (a3 >= 1)
  {
    v10 = 0;
    v11 = a3;
    v12 = (uint64_t *)(a4 + 8);
    do
    {
      v13 = floor(*(double *)(a2 + 8 * v9) + 0.5);
      if (v13 < 0.0)
      {
        xsltTransformError(0, 0, 0, "xsl-number : negative value\n");
        v13 = 0.0;
      }
      v14 = *(int *)(a4 + 16392);
      v15 = v12;
      if (v10 >= v14)
      {
        v16 = (int)v14 < 1;
        v17 = a4 + 16 * (v14 - 1) + 8;
        if (v16)
          v15 = &default_token;
        else
          v15 = (uint64_t *)v17;
      }
      if (v10)
      {
        if (*v15)
          xmlBufferCat(buf, (const xmlChar *)*v15);
        else
          xmlBufferCCat(buf, ".");
      }
      IsInf = xmlXPathIsInf(v13);
      if (IsInf == 1)
      {
        v19 = buf;
        v20 = "Infinity";
      }
      else if (IsInf == -1)
      {
        v19 = buf;
        v20 = "-Infinity";
      }
      else
      {
        if (!xmlXPathIsNaN(v13))
        {
          v21 = *((_DWORD *)v15 + 2);
          HIDWORD(v22) = v21 - 65;
          LODWORD(v22) = v21 - 65;
          switch((v22 >> 3))
          {
            case 0u:
              v23 = v32;
              v24 = buf;
              v25 = v13;
              v26 = 1;
              goto LABEL_30;
            case 1u:
              v27 = (uint64_t)v32;
              v28 = buf;
              v29 = v13;
              v30 = 1;
              goto LABEL_32;
            case 4u:
              v23 = v32;
              v24 = buf;
              v25 = v13;
              v26 = 0;
LABEL_30:
              result = xsltNumberFormatAlpha(v23, v24, v26, v25);
              goto LABEL_22;
            case 5u:
              v27 = (uint64_t)v32;
              v28 = buf;
              v29 = v13;
              v30 = 0;
LABEL_32:
              result = xsltNumberFormatRoman(v27, v28, v30, v29);
              break;
            default:
              result = xsltIsDigitZero(*((_DWORD *)v15 + 2));
              if ((_DWORD)result)
                result = xsltNumberFormatDecimal(buf, v21, *((_DWORD *)v15 + 3), v32[11], v32[12], v32[13], v13);
              break;
          }
          goto LABEL_22;
        }
        v19 = buf;
        v20 = "NaN";
      }
      result = xmlBufferCCat(v19, v20);
LABEL_22:
      ++v10;
      --v9;
      v12 += 2;
    }
    while (v11 != v10);
  }
  v31 = *(const xmlChar **)(a4 + 16400);
  if (v31)
    return xmlBufferCat(buf, v31);
  return result;
}

uint64_t xsltNumberFormatGetMultipleLevel(xsltTransformContext *a1, uint64_t a2, xsltCompMatch *a3, xsltCompMatch *a4, uint64_t a5, int a6)
{
  xmlXPathContext *xpathCtxt;
  xmlNode *node;
  xmlXPathParserContextPtr v13;
  xmlXPathParserContext *v14;
  uint64_t v15;
  xmlNodePtr Ancestor;
  xmlNodePtr PrecedingSibling;
  xmlNode *v18;
  int v19;
  uint64_t v20;
  xmlNode *v22;

  xpathCtxt = a1->xpathCtxt;
  node = xpathCtxt->node;
  v13 = xmlXPathNewParserContext(0, xpathCtxt);
  if (v13)
  {
    v14 = v13;
    v22 = node;
    if (a2)
    {
      v15 = 0;
      Ancestor = (xmlNodePtr)a2;
      while (Ancestor->type != XML_DOCUMENT_NODE && (!a4 || !xsltTestCompMatchList(a1, Ancestor, a4)))
      {
        if (xsltTestCompMatchCount(a1, Ancestor, a3, a2))
        {
          a1->xpathCtxt->node = Ancestor;
          PrecedingSibling = xmlXPathNextPrecedingSibling(v14, Ancestor);
          if (PrecedingSibling)
          {
            v18 = PrecedingSibling;
            v19 = 1;
            do
            {
              if (xsltTestCompMatchCount(a1, v18, a3, a2))
                ++v19;
              a1->xpathCtxt->node = Ancestor;
              v18 = xmlXPathNextPrecedingSibling(v14, v18);
            }
            while (v18);
          }
          else
          {
            v19 = 1;
          }
          v20 = (v15 + 1);
          *(double *)(a5 + 8 * (int)v15) = (double)v19;
          v15 = v20;
          if ((int)v20 >= a6)
            goto LABEL_22;
        }
        else
        {
          v20 = v15;
        }
        a1->xpathCtxt->node = (xmlNodePtr)a2;
        Ancestor = xmlXPathNextAncestor(v14, Ancestor);
        if (!Ancestor)
          goto LABEL_22;
      }
      v20 = v15;
    }
    else
    {
      v20 = 0;
    }
LABEL_22:
    xmlXPathFreeParserContext(v14);
    node = v22;
  }
  else
  {
    v20 = 0;
  }
  a1->xpathCtxt->node = node;
  return v20;
}

uint64_t xsltNumberFormatGetAnyLevel(uint64_t result, uint64_t node, xsltCompMatch *a3, xsltCompMatch *a4, double *a5)
{
  xsltTransformContext *v9;
  int v10;
  xmlNodePtr v11;
  int type;
  xmlNode *v13;
  _xmlNode *prev;
  unsigned int v15;
  BOOL v16;
  int v17;
  double v19;

  if (!node)
  {
    v19 = 0.0;
    goto LABEL_28;
  }
  v9 = (xsltTransformContext *)result;
  v10 = 0;
  v11 = (xmlNodePtr)node;
  do
  {
    result = xsltTestCompMatchCount(v9, v11, a3, node);
    if ((_DWORD)result)
      ++v10;
    if (a4)
    {
      result = xsltTestCompMatchList(v9, v11, a4);
      if ((_DWORD)result)
        break;
    }
    type = v11->type;
    if (type <= 12)
    {
      if (type != 2)
      {
        if (type != 9)
          goto LABEL_18;
        break;
      }
    }
    else
    {
      if (type == 18)
        goto LABEL_14;
      if (type == 13 || type == 21)
        break;
LABEL_18:
      while (1)
      {
        prev = v11->prev;
        if (!prev)
          break;
        v11 = v11->prev;
        v15 = prev->type;
        v16 = v15 > 0x14;
        v17 = (1 << v15) & 0x184000;
        if (v16 || v17 == 0)
        {
          do
          {
            v13 = v11;
            v11 = v11->last;
          }
          while (v11);
          goto LABEL_15;
        }
      }
    }
    v11 = (xmlNodePtr)((char *)v11 + 40);
LABEL_14:
    v13 = (xmlNode *)v11->_private;
LABEL_15:
    v11 = v13;
  }
  while (v13);
  v19 = (double)v10;
LABEL_28:
  *a5 = v19;
  return result;
}

xmlXPathError xsltFormatNumberConversion(xsltDecimalFormatPtr self, xmlChar *format, double number, xmlChar **result)
{
  xmlChar *v6;
  xmlChar *noNumber;
  xmlChar *v9;
  xmlBufferPtr v10;
  xmlBuffer *v11;
  int v12;
  int v13;
  const xmlChar *v14;
  char v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  unsigned int v22;
  xmlXPathError v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  const xmlChar *v33;
  int v34;
  int v35;
  const xmlChar *v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  _BOOL4 v42;
  double v43;
  int IsInf;
  xmlChar *minusSign;
  xmlChar *v46;
  xmlChar *infinity;
  xmlChar *v48;
  xmlChar *v49;
  int v50;
  int i;
  int v52;
  double v53;
  int v54;
  int v55;
  int v56;
  double v57;
  double v58;
  xmlChar *grouping;
  int UTF8Char;
  double v61;
  int v62;
  int v63;
  int v64;
  int v65;
  xmlBuffer *v66;
  int v67;
  double v68;
  xmlChar *zeroDigit;
  int v71;
  xmlChar *v72;
  int v73;
  double v74;
  xmlChar *decimalPoint;
  int v77;
  double v78;
  double v79;
  unsigned int v80;
  double v81;
  int j;
  const xmlChar *v83;
  const xmlChar *v84;
  int v85;
  int v86;
  xmlChar **v87;
  int len;
  int v89;
  const xmlChar *v90;
  int v91[4];
  int v92[2];
  int v93;
  int v94;
  const xmlChar *v95;

  v6 = format;
  v94 = 0;
  if (xmlStrlen(format) <= 0)
    xsltTransformError(0, 0, 0, "xsltFormatNumberConversion : Invalid format (0-length)\n");
  *result = 0;
  if (xmlXPathIsNaN(number))
  {
    noNumber = (xmlChar *)"NaN";
    if (self)
    {
      if (self->noNumber)
        noNumber = self->noNumber;
    }
    v9 = xmlStrdup(noNumber);
    goto LABEL_103;
  }
  v10 = xmlBufferCreate();
  if (!v10)
    return 15;
  v11 = v10;
  v93 = 0;
  memset(v91, 0, sizeof(v91));
  *(_QWORD *)v92 = 0x1FFFFFFFFLL;
  v95 = v6;
  v12 = xsltFormatNumberPreSuffix((const xmlChar **)self, &v95, (uint64_t)v91);
  if (v12 < 0)
  {
    v14 = 0;
    goto LABEL_92;
  }
  v86 = v12;
  v87 = result;
  v13 = xmlStrlen(self->grouping);
  v14 = v95;
  v15 = BYTE1(v93);
  v16 = v92[0];
  v17 = v92[1];
  v18 = v91[1];
  len = v13;
  v89 = v91[0];
  if (!*v95)
  {
    v19 = 0;
    v20 = 0;
LABEL_37:
    v95 = v14;
    BYTE1(v93) = v15;
    v92[0] = v16;
    v92[1] = v17;
    v91[0] = v89;
    v91[1] = v18;
    goto LABEL_38;
  }
  v19 = 0;
  v20 = 0;
  while (1)
  {
    if (!xsltUTF8Charcmp(v14, self->decimalPoint)
      || !xsltUTF8Charcmp(v14, self->patternSeparator))
    {
      goto LABEL_150;
    }
    if (v20)
    {
      v15 = 1;
      v17 = v20;
    }
    if (!xsltUTF8Charcmp(v14, self->digit))
    {
      if (v18 > 0)
        goto LABEL_87;
      v20 = 0;
      ++v89;
      goto LABEL_27;
    }
    if (!xsltUTF8Charcmp(v14, self->zeroDigit))
    {
      v20 = 0;
      ++v18;
LABEL_27:
      v16 += v16 >= 0;
      goto LABEL_28;
    }
    if (len < 1)
      break;
    v21 = xmlStrncmp(v14, self->grouping, len);
    v22 = len;
    if (v21)
      break;
    v16 = 0;
    v20 = 0;
LABEL_29:
    v14 += v22;
    if (!*v14)
      goto LABEL_37;
  }
  if (!xsltUTF8Charcmp(v14, self->percent))
  {
    if (v15)
    {
LABEL_87:
      v95 = v14;
      BYTE1(v93) = v15;
      v92[0] = v16;
      v92[1] = v17;
      v91[0] = v89;
      v91[1] = v18;
LABEL_90:
      v14 = 0;
      goto LABEL_91;
    }
    v20 = 100;
    goto LABEL_28;
  }
  if (!xsltUTF8Charcmp(v14, self->permille))
  {
    if (v15)
      goto LABEL_87;
    v20 = 1000;
LABEL_28:
    v19 = xmlUTF8Strsize(v14, 1);
    v94 = v19;
    v22 = v19;
    if (v19 < 1)
      goto LABEL_87;
    goto LABEL_29;
  }
  v20 = 0;
LABEL_150:
  v95 = v14;
  BYTE1(v93) = v15;
  v92[0] = v16;
  v92[1] = v17;
  v91[0] = v89;
  v91[1] = v18;
  if (*v14 && !xsltUTF8Charcmp(v14, self->decimalPoint))
  {
    LOBYTE(v93) = 1;
    v85 = xmlUTF8Strsize(v14, 1);
    v94 = v85;
    if (v85 < 1)
      goto LABEL_90;
    v19 = v85;
    v14 += v85;
    v95 = v14;
  }
LABEL_38:
  v24 = v91[2];
  v25 = v91[3];
  while (*v14)
  {
    if (!xsltUTF8Charcmp(v14, self->zeroDigit))
    {
      if (v25)
        goto LABEL_89;
      ++v24;
      goto LABEL_49;
    }
    if (!xsltUTF8Charcmp(v14, self->digit))
    {
      ++v25;
LABEL_49:
      v26 = xmlUTF8Strsize(v14, 1);
      v94 = v26;
      if (v26 < 1)
        goto LABEL_89;
      v19 = v26;
      v14 += v26;
      if (v20)
      {
        v17 = v20;
        v15 = 1;
      }
      v20 = 0;
      continue;
    }
    if (xsltUTF8Charcmp(v14, self->percent))
    {
      if (xsltUTF8Charcmp(v14, self->permille))
      {
        if (xsltUTF8Charcmp(v14, self->grouping))
          break;
        goto LABEL_49;
      }
      if (v15)
        goto LABEL_89;
      v28 = xmlUTF8Strsize(v14, 1);
      v94 = v28;
      if (v28 < 1)
      {
LABEL_88:
        v15 = 0;
LABEL_89:
        v95 = v14;
        BYTE1(v93) = v15;
        goto LABEL_90;
      }
      v19 = v28;
      v15 = 0;
      v14 += v28;
      v20 = 1000;
    }
    else
    {
      if (v15)
        goto LABEL_89;
      v27 = xmlUTF8Strsize(v14, 1);
      v94 = v27;
      if (v27 < 1)
        goto LABEL_88;
      v19 = v27;
      v15 = 0;
      v14 += v27;
      v20 = 100;
    }
  }
  v95 = v14;
  BYTE1(v93) = v15;
  v91[2] = v24;
  v91[3] = v25;
  v92[1] = v17;
  if (v20)
  {
    v14 -= v19;
    v95 = v14;
  }
  v29 = v86;
  v30 = xsltFormatNumberPreSuffix((const xmlChar **)self, &v95, (uint64_t)v91);
  if (v30 < 0)
    goto LABEL_91;
  v31 = v30;
  if (*v95)
  {
    if (xsltUTF8Charcmp(v95, self->patternSeparator))
      goto LABEL_91;
  }
  if (number >= 0.0)
  {
LABEL_162:
    v42 = 0;
    goto LABEL_163;
  }
  v32 = xmlUTF8Strloc(v6, self->patternSeparator);
  if (v32 < 0)
  {
    v42 = 1;
LABEL_163:
    v36 = v14;
    v41 = v31;
    goto LABEL_164;
  }
  v33 = xmlUTF8Strpos(v6, v32 + 1);
  v95 = v33;
  *(_WORD *)((char *)&v93 + 1) = 256;
  v34 = xsltFormatNumberPreSuffix((const xmlChar **)self, &v95, (uint64_t)v91);
  if (v34 < 0)
    goto LABEL_91;
  v35 = v34;
  v36 = v95;
  if (!*v95)
    goto LABEL_154;
  v90 = v33;
  v37 = 0;
  v38 = BYTE1(v93);
  do
  {
    if (xsltUTF8Charcmp(v36, self->percent) && xsltUTF8Charcmp(v36, self->permille))
    {
      if (xsltUTF8Charcmp(v36, self->zeroDigit)
        && xsltUTF8Charcmp(v36, self->digit)
        && xsltUTF8Charcmp(v36, self->decimalPoint)
        && xsltUTF8Charcmp(v36, self->grouping)
        && xsltUTF8Charcmp(v36, self->patternSeparator))
      {
        break;
      }
      v37 = 0;
    }
    else
    {
      if (v38)
        goto LABEL_165;
      v38 = 1;
      v37 = 1;
    }
    v39 = xmlUTF8Strsize(v36, 1);
    v94 = v39;
    if (v39 < 1)
    {
LABEL_165:
      v95 = v36;
      BYTE1(v93) = v38;
      goto LABEL_91;
    }
    v19 = v39;
    v36 += v39;
  }
  while (*v36);
  v95 = v36;
  BYTE1(v93) = v38;
  if (v37)
  {
    BYTE1(v93) = 0;
    v36 -= v19;
    v95 = v36;
  }
  v33 = v90;
  v29 = v86;
  if (!*v36)
  {
LABEL_154:
    v41 = 0;
    v36 = 0;
LABEL_155:
    if (v35 != v29 || v41 != v31 || v29 >= 1 && xmlStrncmp(v33, v6, v29))
      goto LABEL_161;
    if (!v31)
    {
      v41 = 0;
      v42 = 0;
      v36 = v14;
      goto LABEL_164;
    }
    if (xmlStrncmp(v36, v14, v31))
    {
LABEL_161:
      v6 = (xmlChar *)v33;
      v42 = 0;
      v29 = v35;
LABEL_164:
      result = v87;
      goto LABEL_93;
    }
    goto LABEL_162;
  }
  v40 = xsltFormatNumberPreSuffix((const xmlChar **)self, &v95, (uint64_t)v91);
  if ((v40 & 0x80000000) == 0 && !*v95)
  {
    v41 = v40;
    goto LABEL_155;
  }
LABEL_91:
  result = v87;
LABEL_92:
  xsltTransformError(0, 0, 0, "xsltFormatNumberConversion : error in format string '%s', using default\n", (const char *)v6);
  v29 = 0;
  v41 = 0;
  v42 = number < 0.0;
  *(_OWORD *)v91 = xmmword_209C21A30;
  *(_QWORD *)v92 = 0x1FFFFFFFFLL;
  LOBYTE(v93) = 1;
  v36 = v14;
LABEL_93:
  v43 = (double)v92[1] * number;
  IsInf = xmlXPathIsInf(v43);
  if (IsInf == 1)
  {
    v46 = *result;
    if (self)
      goto LABEL_100;
    goto LABEL_101;
  }
  if (IsInf == -1)
  {
    if (self->minusSign)
      minusSign = self->minusSign;
    else
      minusSign = (xmlChar *)"-";
    v46 = xmlStrdup(minusSign);
    *result = v46;
LABEL_100:
    infinity = self->infinity;
    if (!infinity)
LABEL_101:
      infinity = (xmlChar *)"Infinity";
    v9 = xmlStrcat(v46, infinity);
LABEL_103:
    v48 = v9;
    v23 = XPATH_EXPRESSION_OK;
    *result = v48;
  }
  else
  {
    if (v42)
    {
      v49 = self->minusSign;
      v50 = xmlUTF8Strsize(v49, 1);
      xmlBufferAdd(v11, v49, v50);
    }
    if (v29 >= 1)
    {
      for (i = 0; i < v29; i += v52)
      {
        if (*v6 == 39)
          ++v6;
        v52 = xmlUTF8Strsize(v6, 1);
        v94 = v52;
        xmlBufferAdd(v11, v6, v52);
        v6 += v52;
      }
    }
    v53 = fabs(v43);
    v54 = v91[2];
    v55 = v91[3];
    v56 = v91[3] + v91[2];
    if (v91[3] + v91[2] >= 309)
    {
      if (v91[2] < 309)
      {
        v55 = 308 - v91[2];
      }
      else
      {
        v55 = 0;
        v54 = 308;
        v91[2] = 308;
      }
      v91[3] = v55;
      v56 = 308;
    }
    v57 = __exp10((double)v56);
    v58 = v53 + 0.5 / v57 - fmod(v53 + 0.5 / v57, 1.0 / v57);
    grouping = self->grouping;
    if (grouping && *grouping)
    {
      v94 = xmlStrlen(grouping);
      UTF8Char = xsltGetUTF8Char(self->grouping, &v94);
      v61 = floor(v58);
      v62 = *self->zeroDigit;
      v63 = v91[1];
      v64 = v92[0];
      v65 = v94;
      v66 = v11;
      v67 = v91[1];
    }
    else
    {
      v61 = floor(v58);
      v62 = *self->zeroDigit;
      v63 = v91[1];
      v64 = v92[0];
      v66 = v11;
      v67 = v91[1];
      UTF8Char = 44;
      v65 = 1;
    }
    xsltNumberFormatDecimal(v66, v62, v67, v64, UTF8Char, v65, v61);
    if (!(v91[0] + v63 + v54) && v55 >= 1)
    {
      v91[2] = ++v54;
      v91[3] = --v55;
    }
    v68 = floor(v58);
    if (v68 == 0.0 && v63 == -v54)
    {
      zeroDigit = self->zeroDigit;
      v71 = xmlUTF8Strsize(zeroDigit, 1);
      xmlBufferAdd(v11, zeroDigit, v71);
    }
    if (v54 + v55)
    {
      v74 = v58 - v68;
      if (v74 != 0.0 || v54 != 0)
      {
        decimalPoint = self->decimalPoint;
        v77 = xmlUTF8Strsize(decimalPoint, 1);
        xmlBufferAdd(v11, decimalPoint, v77);
        v78 = floor(v57 * v74 + 0.5);
        v79 = fmod(v78, 10.0);
        if (v55 >= 1 && v79 < 1.0)
        {
          do
          {
            v80 = v55--;
            v78 = v78 / 10.0;
            v81 = fmod(v78, 10.0);
          }
          while (v80 >= 2 && v81 < 1.0);
        }
        xsltNumberFormatDecimal(v11, *self->zeroDigit, v55 + v54, 0, 0, 0, floor(v78));
      }
    }
    else if ((_BYTE)v93)
    {
      v72 = self->decimalPoint;
      v73 = xmlUTF8Strsize(v72, 1);
      xmlBufferAdd(v11, v72, v73);
    }
    if (v41 >= 1)
    {
      for (j = 0; j < v41; j += v94)
      {
        if (*v36 == 39)
          v83 = v36 + 1;
        else
          v83 = v36;
        v94 = xmlUTF8Strsize(v83, 1);
        xmlBufferAdd(v11, v83, v94);
        v36 = &v83[v94];
      }
    }
    v84 = xmlBufferContent(v11);
    *result = xmlStrdup(v84);
    xmlBufferFree(v11);
    return 0;
  }
  return v23;
}

uint64_t xsltFormatNumberPreSuffix(const xmlChar **a1, const xmlChar **a2, uint64_t a3)
{
  uint64_t v6;
  const xmlChar *i;
  int v8;
  int v9;

  v6 = 0;
  for (i = *a2; ; *a2 = i)
  {
    if (*i == 39)
    {
      *a2 = i + 1;
      if (!i[1])
        return 0xFFFFFFFFLL;
    }
    else
    {
      if (!*i
        || !xsltUTF8Charcmp(i, a1[11])
        || !xsltUTF8Charcmp(*a2, a1[2])
        || !xsltUTF8Charcmp(*a2, a1[7])
        || !xsltUTF8Charcmp(*a2, a1[8])
        || !xsltUTF8Charcmp(*a2, a1[3]))
      {
        return v6;
      }
      if (xsltUTF8Charcmp(*a2, a1[9]))
      {
        if (xsltUTF8Charcmp(*a2, a1[10]))
          goto LABEL_18;
        if (*(_BYTE *)(a3 + 25))
          return 0xFFFFFFFFLL;
        v8 = 1000;
      }
      else
      {
        if (*(_BYTE *)(a3 + 25))
          return 0xFFFFFFFFLL;
        v8 = 100;
      }
      *(_DWORD *)(a3 + 20) = v8;
      *(_BYTE *)(a3 + 25) = 1;
    }
LABEL_18:
    v9 = xmlUTF8Strsize(*a2, 1);
    if (v9 < 1)
      break;
    v6 = (v9 + v6);
    i = &(*a2)[v9];
  }
  return 0xFFFFFFFFLL;
}

uint64_t xsltUTF8Charcmp(const xmlChar *a1, const xmlChar *a2)
{
  int v4;

  v4 = xmlUTF8Strsize(a1, 1);
  if (v4 < 1)
    return 0xFFFFFFFFLL;
  if (a1)
    return xmlStrncmp(a1, a2, v4);
  if (a2)
    return 0xFFFFFFFFLL;
  return 0;
}

uint64_t xsltNumberFormatDecimal(xmlBufferPtr buf, int a2, int a3, int a4, int val, int a6, double a7)
{
  int v13;
  uint64_t v14;
  const xmlChar *v15;
  int v16;
  int v17;
  const xmlChar *v18;
  xmlChar out[4];
  __int16 v21;
  _BYTE v22[499];
  char v23;
  uint64_t v24;

  v13 = 0;
  v24 = *MEMORY[0x24BDAC8D0];
  memset(v22, 0, sizeof(v22));
  v21 = 0;
  v14 = -(uint64_t)a6;
  v15 = (const xmlChar *)&v23;
  *(_DWORD *)out = 0;
  v23 = 0;
  while (v13 < a3 || fabs(a7) >= 1.0)
  {
    if (a4 >= 1 && val && v13 && !(v13 % a4))
    {
      if (&v15[v14] < v22)
        goto LABEL_17;
      xmlCopyCharMultiByte((xmlChar *)&v15[v14], val);
      v15 += v14;
    }
    v16 = (int)fmod(a7, 10.0) + a2;
    if (v16 > 127)
    {
      v17 = xmlCopyCharMultiByte(out, v16);
      v18 = &v15[-v17];
      if (v18 < v22)
      {
LABEL_17:
        xsltGenericError(xsltGenericErrorContext, "xsltNumberFormatDecimal: Internal buffer size exceeded\n");
        return xmlBufferCat(buf, v15);
      }
      memcpy((void *)&v15[-v17], out, v17);
      v15 = v18;
    }
    else
    {
      if (v15 <= v22)
        goto LABEL_17;
      *--v15 = v16;
    }
    ++v13;
    a7 = a7 / 10.0;
    if (v15 <= v22)
      return xmlBufferCat(buf, v15);
  }
  return xmlBufferCat(buf, v15);
}

uint64_t xsltIsDigitZero(int a1)
{
  uint64_t result;

  result = 1;
  if (a1 > 2917)
  {
    if (a1 <= 3429)
    {
      if (a1 != 2918 && a1 != 3174 && a1 != 3302)
        return 0;
    }
    else if (a1 > 3791)
    {
      if (a1 != 3792 && a1 != 3872)
        return 0;
    }
    else if (a1 != 3430 && a1 != 3664)
    {
      return 0;
    }
  }
  else if (a1 <= 2405)
  {
    if (a1 != 48 && a1 != 1632 && a1 != 1776)
      return 0;
  }
  else
  {
    if (a1 <= 2661)
    {
      if (a1 == 2406 || a1 == 2534)
        return result;
      return 0;
    }
    if (a1 != 2662 && a1 != 2790)
      return 0;
  }
  return result;
}

uint64_t xsltNumberFormatAlpha(int *a1, xmlBufferPtr buf, int a3, double a4)
{
  const char *v6;
  char *v7;
  int v8;
  double v9;
  _OWORD v10[3];
  __int128 v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a4 < 1.0)
    return xsltNumberFormatDecimal(buf, 48, 1, a1[11], a1[12], a1[13], a4);
  v11 = 0u;
  memset(v10, 0, sizeof(v10));
  v12 = 0;
  if (a3)
    v6 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  else
    v6 = "abcdefghijklmnopqrstuvwxyz";
  v7 = (char *)&v11 + 15;
  v8 = 64;
  while (1)
  {
    v9 = a4 + -1.0;
    *v7 = v6[(int)fmod(a4 + -1.0, 26.0)];
    a4 = v9 / 26.0;
    if (v9 / 26.0 < 1.0)
      break;
    --v7;
    if (!--v8)
    {
      v7 = (char *)v10;
      return xmlBufferCCat(buf, v7);
    }
  }
  return xmlBufferCCat(buf, v7);
}

uint64_t xsltNumberFormatRoman(uint64_t result, xmlBufferPtr buf, int a3, double a4)
{
  double v4;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;

  v4 = a4;
  if (a4 < 1.0 || a4 > 5000.0)
    return xsltNumberFormatDecimal(buf, 48, 1, *(_DWORD *)(result + 44), *(_DWORD *)(result + 48), *(_DWORD *)(result + 52), a4);
  if (a4 >= 1000.0)
  {
    if (a3)
      v7 = "M";
    else
      v7 = "m";
    do
    {
      result = xmlBufferCCat(buf, v7);
      v4 = v4 + -1000.0;
    }
    while (v4 >= 1000.0);
  }
  if (v4 >= 900.0)
  {
    if (a3)
      v8 = "CM";
    else
      v8 = "cm";
    result = xmlBufferCCat(buf, v8);
    v4 = v4 + -900.0;
  }
  if (v4 >= 500.0)
  {
    if (a3)
      v9 = "D";
    else
      v9 = "d";
    do
    {
      result = xmlBufferCCat(buf, v9);
      v4 = v4 + -500.0;
    }
    while (v4 >= 500.0);
  }
  if (v4 >= 400.0)
  {
    if (a3)
      v10 = "CD";
    else
      v10 = "cd";
    result = xmlBufferCCat(buf, v10);
    v4 = v4 + -400.0;
  }
  if (v4 >= 100.0)
  {
    if (a3)
      v11 = "C";
    else
      v11 = "c";
    do
    {
      result = xmlBufferCCat(buf, v11);
      v4 = v4 + -100.0;
    }
    while (v4 >= 100.0);
  }
  if (v4 >= 90.0)
  {
    if (a3)
      v12 = "XC";
    else
      v12 = "xc";
    result = xmlBufferCCat(buf, v12);
    v4 = v4 + -90.0;
  }
  if (v4 >= 50.0)
  {
    if (a3)
      v13 = "L";
    else
      v13 = "l";
    do
    {
      result = xmlBufferCCat(buf, v13);
      v4 = v4 + -50.0;
    }
    while (v4 >= 50.0);
  }
  if (v4 >= 40.0)
  {
    if (a3)
      v14 = "XL";
    else
      v14 = "xl";
    result = xmlBufferCCat(buf, v14);
    v4 = v4 + -40.0;
  }
  if (v4 >= 10.0)
  {
    if (a3)
      v15 = "X";
    else
      v15 = "x";
    do
    {
      result = xmlBufferCCat(buf, v15);
      v4 = v4 + -10.0;
    }
    while (v4 >= 10.0);
  }
  if (v4 >= 9.0)
  {
    if (a3)
      v16 = "IX";
    else
      v16 = "ix";
    result = xmlBufferCCat(buf, v16);
    v4 = v4 + -9.0;
  }
  if (v4 >= 5.0)
  {
    if (a3)
      v17 = "V";
    else
      v17 = "v";
    do
    {
      result = xmlBufferCCat(buf, v17);
      v4 = v4 + -5.0;
    }
    while (v4 >= 5.0);
  }
  if (v4 >= 4.0)
  {
    if (a3)
      v18 = "IV";
    else
      v18 = "iv";
    result = xmlBufferCCat(buf, v18);
    v4 = v4 + -4.0;
  }
  if (v4 >= 1.0)
  {
    if (a3)
      v19 = "I";
    else
      v19 = "i";
    do
    {
      result = xmlBufferCCat(buf, v19);
      v4 = v4 + -1.0;
    }
    while (v4 >= 1.0);
  }
  return result;
}

uint64_t xsltTestCompMatchCount(xsltTransformContext *a1, xmlNodePtr node, xsltCompMatch *a3, uint64_t a4)
{
  uint64_t result;
  xmlElementType type;
  xmlNs *ns;
  xmlNs *v9;

  if (a3)
    return xsltTestCompMatchList(a1, node, a3);
  type = node->type;
  if (type != *(_DWORD *)(a4 + 8))
    return 0;
  if (type == XML_NAMESPACE_DECL)
    return 1;
  result = xmlStrEqual(node->name, *(const xmlChar **)(a4 + 16));
  if ((_DWORD)result)
  {
    ns = node->ns;
    v9 = *(xmlNs **)(a4 + 72);
    if (ns == v9)
      return 1;
    result = 0;
    if (ns)
    {
      if (v9)
        return xmlStrEqual(ns->href, v9->href);
    }
  }
  return result;
}

void xsltFreeCompMatchList(xsltCompMatchPtr comp)
{
  xsltCompMatch *v1;

  if (comp)
  {
    do
    {
      v1 = *(xsltCompMatch **)comp;
      xsltFreeCompMatch((uint64_t)comp);
      comp = v1;
    }
    while (v1);
  }
}

uint64_t xsltFreeCompMatch(uint64_t a1)
{
  void (**v2)(void);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  xmlXPathCompExpr *v7;
  __int128 v8;

  v2 = (void (**)(void))MEMORY[0x24BEDE758];
  if (*(_QWORD *)(a1 + 16))
    ((void (*)(void))*MEMORY[0x24BEDE758])();
  if (*(_QWORD *)(a1 + 72))
    (*v2)();
  if (*(int *)(a1 + 60) >= 1)
  {
    v3 = 0;
    v4 = 0;
    do
    {
      v5 = *(_QWORD *)(a1 + 88);
      if (*(_QWORD *)(v5 + v3 + 8))
        (*v2)();
      if (*(_QWORD *)(v5 + v3 + 16))
        (*v2)();
      v6 = v5 + v3;
      if (*(_QWORD *)(v6 + 24))
        (*v2)();
      v7 = *(xmlXPathCompExpr **)(v6 + 32);
      if (v7)
        xmlXPathFreeCompExpr(v7);
      ++v4;
      v3 += 56;
    }
    while (v4 < *(int *)(a1 + 60));
  }
  ((void (*)(_QWORD))*v2)(*(_QWORD *)(a1 + 88));
  *(_QWORD *)&v8 = -1;
  *((_QWORD *)&v8 + 1) = -1;
  *(_OWORD *)(a1 + 64) = v8;
  *(_OWORD *)(a1 + 80) = v8;
  *(_OWORD *)(a1 + 32) = v8;
  *(_OWORD *)(a1 + 48) = v8;
  *(_OWORD *)a1 = v8;
  *(_OWORD *)(a1 + 16) = v8;
  return ((uint64_t (*)(uint64_t))*v2)(a1);
}

void xsltNormalizeCompSteps(void *payload, void *data, const xmlChar *name)
{
  uint64_t v3;
  unsigned int v4;
  int32x2_t v5;
  int32x2_t *v6;

  v3 = *((unsigned int *)payload + 15);
  if ((int)v3 >= 1)
  {
    v4 = *((_DWORD *)data + 84);
    v5 = vdup_n_s32(v4);
    v6 = (int32x2_t *)(*((_QWORD *)payload + 11) + 48);
    do
    {
      v6[-1] = vadd_s32(v6[-1], v5);
      v6->i32[0] += v4;
      v6 += 7;
      --v3;
    }
    while (v3);
  }
}

int xsltTestCompMatchList(xsltTransformContextPtr ctxt, xmlNodePtr node, xsltCompMatchPtr comp)
{
  int result;
  xsltCompMatchPtr v6;

  result = -1;
  if (ctxt && node)
  {
    v6 = comp;
    if (comp)
    {
      while (1)
      {
        result = xsltTestCompMatch(ctxt, (uint64_t)v6, node, 0, 0);
        if (result == 1)
          break;
        v6 = *(xsltCompMatchPtr *)v6;
        if (!v6)
          return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t xsltTestCompMatch(xsltTransformContext *a1, uint64_t a2, xmlNodePtr node, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t matched;
  uint64_t v10;
  xmlNode *inst;
  int *v12;
  int v13;
  xmlNodePtr v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  xmlXPathCompExprPtr *v20;
  uint64_t v21;
  _xmlDoc *doc;
  char *v24;
  _BOOL4 v25;
  unsigned int type;
  int v27;
  const xmlChar *v29;
  const xmlChar *name;
  xmlNs *ns;
  const xmlChar *href;
  const xmlChar *v33;
  int v34;
  uint64_t v35;
  unsigned int v36;
  unsigned int v37;
  int v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  xmlNode *ptr;
  _xmlNode *parent;
  int v44;
  xmlNode *v45;
  BOOL v46;
  xmlNode *v47;
  char v48;
  const xmlChar *v49;
  const xmlChar *v50;
  xmlNs *v51;
  const xmlChar *v52;
  const xmlChar *v53;
  xmlNode *children;
  int ival;
  int v56;
  _BOOL4 v57;
  _xmlNode *v58;
  _xmlDoc *v60;
  xsltRuntimeExtraPtr extras;
  xmlXPathContextPtr xpathCtxt;
  xmlXPathContextPtr v64;
  xmlXPathContextPtr v65;
  xmlNode *v66;
  _BOOL4 v68;
  _BOOL4 v69;
  xmlNode *v70;
  xmlXPathCompExprPtr *v71;
  uint64_t v72;
  uint64_t v73;

  v72 = 0;
  v73 = 0;
  if (!a1 || !node)
  {
    xsltTransformError(a1, 0, node, "xsltTestCompMatch: null arg\n");
    return 0xFFFFFFFFLL;
  }
  v8 = *(_QWORD *)(a2 + 24);
  if (a4)
  {
    matched = 0;
    if (!v8 || v8 != a4)
      return matched;
  }
  else if (v8)
  {
    return 0;
  }
  v10 = *(_QWORD *)(a2 + 32);
  if (!a5)
  {
    if (!v10)
      goto LABEL_15;
    return 0;
  }
  matched = 0;
  if (!v10 || v10 != a5)
    return matched;
LABEL_15:
  inst = a1->inst;
  a1->inst = *(xmlNodePtr *)(a2 + 48);
  if (*(int *)(a2 + 60) >= 1)
  {
    v12 = 0;
    v13 = 0;
    v14 = node;
    v70 = inst;
    while (1)
    {
      v15 = *(_QWORD *)(a2 + 88);
      v16 = v15 + 56 * v13;
      v17 = *(_DWORD *)v16;
      if (*(_DWORD *)v16 != 14)
        v12 = (int *)(v15 + 56 * v13);
      if (v17 > 4)
        break;
      if (v17 != 4)
      {
        if (!v17)
          goto LABEL_148;
LABEL_50:
        if (xsltTestStepMatch(a1, v14, v15 + 56 * v13) == 1)
          goto LABEL_142;
        goto LABEL_57;
      }
      type = v14->type;
      v39 = type > 0x15;
      v27 = (1 << type) & 0x242200;
      if (!v39 && v27 != 0)
        goto LABEL_57;
      v14 = v14->parent;
      if (!v14)
        goto LABEL_57;
      v29 = *(const xmlChar **)(v15 + 56 * v13 + 8);
      if (!v29)
        goto LABEL_142;
      name = v14->name;
      if (*v29 != *name || !xmlStrEqual(v29, name))
        goto LABEL_57;
      ns = v14->ns;
      if (ns)
      {
        href = ns->href;
        if (!href)
          goto LABEL_142;
        v33 = *(const xmlChar **)(v15 + 56 * v13 + 16);
        if (!v33)
          goto LABEL_57;
        v34 = xmlStrEqual(v33, href);
        goto LABEL_141;
      }
      if (!*(_QWORD *)(v15 + 56 * v13 + 16))
        goto LABEL_142;
LABEL_57:
      v38 = v72;
      if (v73)
        v39 = (int)v72 < 1;
      else
        v39 = 1;
      if (v39)
      {
        matched = 0;
        goto LABEL_151;
      }
      LODWORD(v72) = v72 - 1;
      v40 = v73 + 16 * (v38 - 1);
      v13 = *(_DWORD *)v40;
      v14 = *(xmlNodePtr *)(v40 + 8);
LABEL_143:
      if (v13 >= *(_DWORD *)(a2 + 60))
        goto LABEL_148;
    }
    if (v17 != 5)
    {
      if (v17 != 14)
        goto LABEL_50;
      if (*(_DWORD *)(a2 + 56))
      {
        matched = xsltTestCompMatchDirect((uint64_t)a1, a2, (uint64_t)node, *(_QWORD *)(a2 + 72), *(_DWORD *)(a2 + 80));
        goto LABEL_151;
      }
      if (!*(_QWORD *)(v15 + 56 * v13 + 8))
        goto LABEL_57;
      v18 = v15 + 56 * v13;
      v21 = *(_QWORD *)(v18 + 32);
      v20 = (xmlXPathCompExprPtr *)(v18 + 32);
      v19 = v21;
      if (!v12 || v19 == 0)
        goto LABEL_57;
      doc = v14->doc;
      v25 = 1;
      if (doc)
      {
        if (doc->type == XML_DOCUMENT_NODE)
        {
          v24 = doc->name;
          if (v24)
          {
            if (*v24 == 32)
              v25 = 0;
          }
        }
      }
      v41 = *(_QWORD *)&a1->xpathCtxt->contextSize;
      ptr = (xmlNode *)a1->extras[v12[10]].val.ptr;
      v71 = v20;
      if (ptr)
      {
        parent = v14->parent;
        if (ptr->parent == parent)
        {
          v68 = v25;
          if (ptr == v14)
          {
            v44 = 0;
          }
          else
          {
            v44 = 0;
            v45 = v14;
            do
            {
              if (xsltTestStepMatch(a1, v45, (uint64_t)v12))
                ++v44;
              v45 = v45->prev;
              if (v45)
                v46 = v45 == ptr;
              else
                v46 = 1;
            }
            while (!v46);
            if (!v45)
            {
              v44 = 0;
              v47 = v14;
              while (v47 != ptr)
              {
                v44 -= xsltTestStepMatch(a1, v47, (uint64_t)v12) != 0;
                v47 = v47->next;
                v48 = 1;
                if (!v47)
                  goto LABEL_138;
              }
            }
          }
          extras = a1->extras;
          v56 = extras[v12[11]].val.ival + v44;
          v60 = v14->doc;
          if (v60)
          {
            ival = extras[v12[12]].val.ival;
            if (v68)
            {
              extras[v12[10]].val.ptr = v14;
              a1->extras[v12[11]].val.ival = v56;
              if (v56)
              {
                LODWORD(v60) = 0;
                xpathCtxt = a1->xpathCtxt;
                xpathCtxt->contextSize = ival;
                xpathCtxt->proximityPosition = v56;
                doc = v14->doc;
                goto LABEL_131;
              }
LABEL_137:
              v48 = 1;
            }
            else
            {
              if (!v56)
                goto LABEL_137;
              v48 = 0;
              v65 = a1->xpathCtxt;
              v65->contextSize = ival;
              v65->proximityPosition = v56;
            }
LABEL_138:
            v66 = a1->node;
            a1->node = v14;
            v34 = xsltEvalXPathPredicate(a1, *v71, *(xmlNsPtr **)(a2 + 72), *(_DWORD *)(a2 + 80));
            if ((v48 & 1) == 0)
              *(_QWORD *)&a1->xpathCtxt->contextSize = v41;
            a1->node = v66;
            inst = v70;
LABEL_141:
            if (v34)
              goto LABEL_142;
            goto LABEL_57;
          }
          doc = 0;
          ival = 0;
          v57 = v68;
LABEL_129:
          if (!v56)
            goto LABEL_137;
          v64 = a1->xpathCtxt;
          v64->contextSize = ival;
          v64->proximityPosition = v56;
          if (v57)
          {
LABEL_131:
            v48 = 0;
            if (!(_DWORD)v60 && doc)
            {
              v48 = 0;
              a1->extras[v12[10]].val.ptr = v14;
              a1->extras[v12[11]].val.ival = v56;
              a1->extras[v12[12]].val.ival = ival;
            }
          }
          else
          {
            v48 = 0;
          }
          goto LABEL_138;
        }
      }
      else
      {
        parent = v14->parent;
      }
      if (!parent)
        goto LABEL_137;
      v69 = v25;
      children = parent->children;
      if (children)
      {
        ival = 0;
        v56 = 0;
        do
        {
          if (children == v14)
          {
            v56 = ++ival;
          }
          else if (xsltTestStepMatch(a1, children, (uint64_t)v12))
          {
            ++ival;
          }
          children = children->next;
        }
        while (children);
        doc = v14->doc;
      }
      else
      {
        ival = 0;
        v56 = 0;
      }
      v57 = v69;
      if (doc)
      {
        do
        {
          v58 = parent;
          parent = parent->parent;
        }
        while (parent);
        LODWORD(v60) = (v58->type | 4) != 0xD || v58 != (_xmlNode *)doc;
      }
      else
      {
        LODWORD(v60) = 1;
      }
      goto LABEL_129;
    }
    if (*(_QWORD *)(v15 + 56 * v13 + 8))
    {
      LODWORD(matched) = 5;
      goto LABEL_54;
    }
    v35 = v15 + 56 * v13;
    v36 = *(_DWORD *)(v35 + 56);
    v16 = v35 + 56;
    matched = v36;
    if (v36 <= 9)
    {
      if (((1 << matched) & 0x344) != 0)
      {
LABEL_54:
        if (!v14)
          goto LABEL_57;
        goto LABEL_55;
      }
      if ((_DWORD)matched == 1)
        goto LABEL_151;
    }
    if ((_DWORD)matched != 7 || v14 == 0)
      goto LABEL_57;
    LODWORD(matched) = 7;
LABEL_55:
    v37 = v14->type;
    if (v37 > 0x15 || ((1 << v37) & 0x242200) == 0)
    {
      v14 = v14->parent;
      if ((_DWORD)matched != 2 && (_DWORD)matched != 9)
      {
        xsltPatPushState((uint64_t)a1, (int *)&v72, v13, (uint64_t)v14);
LABEL_142:
        ++v13;
        goto LABEL_143;
      }
      if (!*(_QWORD *)(v16 + 8))
      {
LABEL_122:
        xsltPatPushState((uint64_t)a1, (int *)&v72, v13++, (uint64_t)v14);
        v12 = (int *)v16;
        goto LABEL_142;
      }
      for (; v14; v14 = v14->parent)
      {
        if (v14->type == XML_ELEMENT_NODE)
        {
          v49 = *(const xmlChar **)(v16 + 8);
          v50 = v14->name;
          if (*v49 == *v50)
          {
            if (xmlStrEqual(v49, v50))
            {
              v51 = v14->ns;
              if (v51)
              {
                v52 = v51->href;
                if (v52)
                {
                  v53 = *(const xmlChar **)(v16 + 16);
                  if (v53)
                  {
                    if (xmlStrEqual(v53, v52))
                      goto LABEL_122;
                  }
                }
              }
              else if (!*(_QWORD *)(v16 + 16))
              {
                goto LABEL_122;
              }
            }
          }
        }
      }
      v12 = (int *)v16;
    }
    goto LABEL_57;
  }
LABEL_148:
  matched = 1;
LABEL_151:
  a1->inst = inst;
  if (v73)
    ((void (*)(void))*MEMORY[0x24BEDE758])();
  return matched;
}

void xsltCompMatchClearCache(xsltTransformContextPtr ctxt, xsltCompMatchPtr comp)
{
  int *v3;
  xmlXPathObject *info;
  xsltRuntimeExtraPtr extras;

  if (ctxt && comp)
  {
    v3 = (int *)*((_QWORD *)comp + 11);
    info = (xmlXPathObject *)ctxt->extras[v3[12]].info;
    if (info)
    {
      xmlXPathFreeObject(info);
      extras = ctxt->extras;
      extras[v3[12]].info = 0;
      extras[v3[10]].val.ptr = 0;
      ctxt->extras[v3[11]].val.ival = 0;
      ctxt->extras[v3[12]].deallocate = 0;
    }
  }
}

xsltCompMatchPtr xsltCompilePattern(const xmlChar *pattern, xmlDocPtr doc, xmlNodePtr node, xsltStylesheetPtr style, xsltTransformContextPtr runtime)
{
  return (xsltCompMatchPtr)xsltCompilePatternInternal(pattern, doc, node, style, (uint64_t)runtime, 0);
}

_QWORD *xsltCompilePatternInternal(_BYTE *a1, const xmlDoc *a2, xmlNode *a3, xsltStylesheet *a4, uint64_t a5, int a6)
{
  _BYTE *v10;
  uint64_t v11;
  _OWORD *v12;
  void (**v13)(_OWORD *);
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _BYTE *v17;
  void **v18;
  const xmlChar *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t i;
  unsigned int v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v28;
  int v29;
  int v30;
  int v31;
  unsigned __int8 *v32;
  int v33;
  int v34;
  int v35;
  uint64_t v36;
  unsigned __int8 *v37;
  int v38;
  int v39;
  void **v40;
  _BYTE *v41;
  uint64_t (**v42)(uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  void **v47;
  xmlChar *v48;
  xmlNsPtr *NsList;
  int v50;
  uint64_t v51;
  _BYTE *j;
  unsigned int v53;
  uint64_t v54;
  xmlChar *v55;
  xmlChar *v56;
  unsigned __int8 *k;
  uint64_t v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  int v71;
  __int128 v72;
  int v73;
  int v74;
  uint64_t v75;
  _DWORD *v76;
  xmlChar *v77;
  uint64_t v78;
  xmlChar *v79;
  float v80;
  int *v81;
  int v82;
  uint64_t v84;
  _BYTE *v85;
  uint64_t v86;
  unsigned __int8 *v87;
  _BYTE *v88;
  unsigned int v89;
  uint64_t v90;
  unsigned int v92;
  __int128 v93;
  __int128 v95;
  _QWORD *v96;
  _BYTE *v97;
  uint64_t v98;
  uint64_t *v100;
  _QWORD *v101;
  const xmlChar *v102;
  int v103;

  if (!a1)
  {
    xsltTransformError(0, 0, a3, "xsltCompilePattern : NULL pattern\n");
    return 0;
  }
  v10 = a1;
  v11 = ((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(64);
  if (!v11)
  {
    xsltTransformError(0, 0, 0, "xsltNewParserContext : malloc failed\n");
    return 0;
  }
  v12 = (_OWORD *)v11;
  *(_OWORD *)(v11 + 32) = 0u;
  *(_OWORD *)(v11 + 48) = 0u;
  *(_OWORD *)v11 = 0u;
  *(_OWORD *)(v11 + 16) = 0u;
  *(_QWORD *)v11 = a4;
  *(_QWORD *)(v11 + 8) = a5;
  *(_QWORD *)(v11 + 32) = a2;
  *(_QWORD *)(v11 + 40) = a3;
  v13 = (void (**)(_OWORD *))MEMORY[0x24BEDE758];
  if (!*v10)
  {
    v16 = 0;
    goto LABEL_149;
  }
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = v10 + 1;
  v18 = &xsltGenericDebugContext;
  v19 = v10;
  v97 = v10 + 1;
  v98 = v11;
LABEL_5:
  v20 = v15;
  v21 = 0;
  v22 = (uint64_t *)v20;
  for (i = v14 << 32; ; i += 0x100000000)
  {
    v24 = v10[(int)v14 + v21];
    v25 = v24 > 0x20;
    v26 = (1 << v24) & 0x100002600;
    if (v25 || v26 == 0)
      break;
    ++v21;
  }
  v28 = i >> 32;
  v29 = v10[v28];
  if (!v10[v28])
  {
LABEL_151:
    xsltTransformError(0, 0, a3, "xsltCompilePattern : NULL pattern\n");
LABEL_162:
    v13 = (void (**)(_OWORD *))MEMORY[0x24BEDE758];
    goto LABEL_163;
  }
  v30 = 0;
  v31 = v21 + v14;
  while (v29 != 124 || v30)
  {
    if (v29 > 90)
    {
      v35 = v30 - 1;
      if (v29 != 93)
        v35 = v30;
      if (v29 == 91)
        ++v30;
      else
        v30 = v35;
    }
    else if (v29 == 34)
    {
      v37 = &v17[v31];
      do
      {
        v39 = *v37++;
        v38 = v39;
        ++v31;
      }
      while (v39 && v38 != 34);
    }
    else if (v29 == 39)
    {
      v32 = &v17[v31];
      do
      {
        v34 = *v32++;
        v33 = v34;
        ++v31;
      }
      while (v34 && v33 != 39);
    }
    if (!v10[v31])
      break;
    v36 = v31 + 1;
    v29 = v10[v36];
    ++v31;
    if (!v10[v36])
      goto LABEL_35;
  }
  LODWORD(v36) = v31;
LABEL_35:
  if (!((_DWORD)v14 - (_DWORD)v36 + (_DWORD)v21))
    goto LABEL_151;
  v100 = v22;
  v102 = v19;
  v103 = v14;
  v40 = v18;
  v41 = v10;
  v42 = (uint64_t (**)(uint64_t))MEMORY[0x24BEDE910];
  v43 = ((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(96);
  if (!v43)
  {
    xsltTransformError(0, 0, 0, "xsltNewCompMatch : out of memory error\n");
    v13 = (void (**)(_OWORD *))MEMORY[0x24BEDE758];
    goto LABEL_154;
  }
  v44 = v43;
  *(_OWORD *)(v43 + 64) = 0u;
  *(_OWORD *)(v43 + 80) = 0u;
  *(_OWORD *)(v43 + 32) = 0u;
  *(_OWORD *)(v43 + 48) = 0u;
  *(_OWORD *)v43 = 0u;
  *(_OWORD *)(v43 + 16) = 0u;
  *(_QWORD *)(v43 + 60) = 0xA00000000;
  v45 = (*v42)(560);
  *(_QWORD *)(v44 + 88) = v45;
  if (v45)
  {
    *(_DWORD *)(v44 + 80) = 0;
    *(_QWORD *)(v44 + 72) = 0;
    v46 = (_QWORD *)v44;
    *(_DWORD *)(v44 + 56) = 0;
    v10 = v41;
    v47 = v40;
    v12 = (_OWORD *)v98;
    if (v16)
    {
      if (v100)
        *v100 = v44;
      v46 = v16;
    }
    v101 = v46;
    *(_QWORD *)(v98 + 56) = v44;
    v48 = xmlStrndup(v102, (int)v36 - v103);
    *(_QWORD *)(v98 + 24) = v48;
    if (!v48)
      goto LABEL_161;
    *(_QWORD *)(v98 + 16) = &v48[(int)v21];
    *(_QWORD *)(v44 + 16) = v48;
    *(_QWORD *)(v44 + 48) = a3;
    NsList = xmlGetNsList(a2, a3);
    *(_QWORD *)(v44 + 72) = NsList;
    v15 = v44;
    if (NsList)
    {
      v50 = -1;
      v18 = v47;
      do
      {
        v51 = (uint64_t)*NsList++;
        ++v50;
      }
      while (v51);
    }
    else
    {
      v50 = 0;
      v18 = v47;
    }
    *(_DWORD *)(v15 + 80) = v50;
    xsltGenericDebug(*v18, "xsltCompilePattern : parsing '%s'\n", *(const char **)(v15 + 16));
    *(_DWORD *)(v15 + 8) = 0;
    for (j = *(_BYTE **)(v98 + 16); ; *(_QWORD *)(v98 + 16) = j)
    {
      v53 = *j++;
      if (v53 <= 0xC)
      {
        if (v53 - 9 >= 2)
          goto LABEL_61;
      }
      else if (*(j - 1) <= 0x1Fu)
      {
        if (v53 != 13)
          goto LABEL_61;
      }
      else
      {
        if (*(j - 1) > 0x29u)
        {
          switch(v53)
          {
            case '*':
              goto LABEL_70;
            case '/':
              if (*j == 47)
              {
                *(_QWORD *)(v98 + 16) = j;
                if (*j)
                  *(_QWORD *)(v98 + 16) = j + 1;
                *(_DWORD *)(*(_QWORD *)(v98 + 56) + 8) = 1056964608;
                goto LABEL_70;
              }
              do
              {
                *(_QWORD *)(v98 + 16) = j;
                v59 = *j++;
                v60 = (1 << v59) & 0x100002600;
              }
              while (v59 <= 0x20 && v60 != 0);
              if (!xsltCompMatchAdd(v98, *(_QWORD *)(v98 + 56), 1, 0, 0, a6)
                && **(_BYTE **)(v98 + 16)
                && **(_BYTE **)(v98 + 16) != 124
                && !xsltCompMatchAdd(v98, *(_QWORD *)(v98 + 56), 4, 0, 0, a6))
              {
                goto LABEL_70;
              }
              break;
            case '@':
              goto LABEL_70;
            default:
LABEL_61:
              v54 = v15;
              v55 = xsltScanNCName(v98);
              if (!v55)
              {
                xsltTransformError(0, 0, 0, "xsltCompileLocationPathPattern : Name expected\n");
                *(_DWORD *)(v98 + 48) = 1;
LABEL_159:
                xsltTransformError(0, a4, a3, "xsltCompilePattern : failed to compile '%s'\n", *(const char **)(v15 + 16));
                if (a4)
                  ++a4->errors;
LABEL_161:
                v16 = v101;
                goto LABEL_162;
              }
              v56 = v55;
              for (k = *(unsigned __int8 **)(v98 + 16); ; *(_QWORD *)(v98 + 16) = k)
              {
                v58 = *k++;
                if (v58 > 0x28)
                  goto LABEL_83;
                if (((1 << v58) & 0x100002600) == 0)
                  break;
              }
              if (v58 != 40 || xmlXPathIsNodeType(v55))
              {
LABEL_83:
                xsltCompileRelativePathPattern(v98, v56, a6);
                v15 = v54;
                v18 = v47;
                break;
              }
              xsltCompileIdKeyPattern(v98, v56, 1, a6, 0);
              ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v56);
              v15 = v54;
              if (*(_DWORD *)(v98 + 48))
                goto LABEL_159;
              v18 = v47;
              v85 = *(_BYTE **)(v98 + 16);
              if (*v85 == 47)
              {
                v86 = *(_QWORD *)(v98 + 56);
                if (v85[1] == 47)
                {
                  if (!xsltCompMatchAdd(v98, v86, 5, 0, 0, a6))
                  {
                    v87 = *(unsigned __int8 **)(v98 + 16);
                    if (*v87)
                    {
                      *(_QWORD *)(v98 + 16) = v87 + 1;
                      if (v87[1])
                      {
                        v87 += 2;
                        goto LABEL_136;
                      }
                      ++v87;
                    }
                    while (1)
                    {
                      v89 = *v87;
                      v25 = v89 > 0x20;
                      v90 = (1 << v89) & 0x100002600;
                      if (v25 || v90 == 0)
                        break;
                      ++v87;
LABEL_136:
                      *(_QWORD *)(v98 + 16) = v87;
                    }
LABEL_70:
                    xsltCompileRelativePathPattern(v98, 0, a6);
                  }
                }
                else if (!xsltCompMatchAdd(v98, v86, 4, 0, 0, a6))
                {
                  v88 = *(_BYTE **)(v98 + 16);
                  if (*v88)
                    goto LABEL_142;
                  while (1)
                  {
                    v92 = *v88;
                    if (v92 > 0x20 || ((1 << v92) & 0x100002600) == 0)
                      goto LABEL_70;
LABEL_142:
                    *(_QWORD *)(v98 + 16) = ++v88;
                  }
                }
              }
              break;
          }
          if (*(_DWORD *)(v98 + 48))
            goto LABEL_159;
          v62 = *(unsigned int *)(v15 + 60);
          if ((int)v62 >= 2)
          {
            v63 = 0;
            v64 = 0;
            v65 = *(_QWORD *)(v15 + 88);
            v66 = 56 * v62;
            v67 = v62 - 2;
            do
            {
              v68 = v65 + v63;
              v69 = v65 + v66;
              v70 = *(_OWORD *)(v65 + v63 + 8);
              *(_OWORD *)(v68 + 8) = *(_OWORD *)(v65 + v66 - 48);
              *(_OWORD *)(v69 - 48) = v70;
              v71 = *(_DWORD *)(v65 + v63);
              *(_DWORD *)v68 = *(_DWORD *)(v65 + v66 - 56);
              *(_DWORD *)(v69 - 56) = v71;
              v72 = *(_OWORD *)(v65 + v63 + 24);
              *(_OWORD *)(v68 + 24) = *(_OWORD *)(v65 + v66 - 32);
              *(_OWORD *)(v69 - 32) = v72;
              *(_QWORD *)&v72 = *(_QWORD *)(v65 + v63 + 40);
              *(_QWORD *)(v68 + 40) = *(_QWORD *)(v65 + v66 - 16);
              *(_QWORD *)(v69 - 16) = v72;
              v73 = *(_DWORD *)(v65 + v63 + 48);
              *(_DWORD *)(v68 + 48) = *(_DWORD *)(v65 + v66 - 8);
              *(_DWORD *)(v69 - 8) = v73;
              ++v64;
              v66 -= 56;
              v63 += 56;
              v25 = v67-- <= v64;
            }
            while (!v25);
          }
          xsltCompMatchAdd(v98, v15, 0, 0, 0, 0);
          v74 = *(_DWORD *)(v15 + 60);
          if (v74 >= 2)
          {
            v75 = (v74 - 1);
            v76 = *(_DWORD **)(v15 + 88);
            while (*v76 != 14 || v76[14] != 14)
            {
              v76 += 14;
              if (!--v75)
                goto LABEL_97;
            }
            *(_DWORD *)(v15 + 56) = 1;
            if (**(_BYTE **)(v15 + 16) != 47)
            {
              v77 = xmlStrdup((const xmlChar *)"//");
              v78 = v15;
              v79 = xmlStrcat(v77, *(const xmlChar **)(v15 + 16));
              ((void (*)(_QWORD))*MEMORY[0x24BEDE758])(*(_QWORD *)(v78 + 16));
              *(_QWORD *)(v78 + 16) = v79;
              v15 = v78;
            }
          }
LABEL_97:
          v80 = *(float *)(v15 + 8);
          if (v80 != 0.0)
            goto LABEL_119;
          v81 = *(int **)(v15 + 88);
          v82 = *v81;
          if ((*v81 - 2) < 2 || v82 == 10)
          {
            v84 = *((_QWORD *)v81 + 1);
            if (v84 && !v81[14])
              goto LABEL_119;
            if (v82 == 8)
              goto LABEL_112;
            if (v82 != 3)
              goto LABEL_115;
            if (*((_QWORD *)v81 + 2))
              goto LABEL_113;
            if (v84)
              goto LABEL_117;
          }
          else
          {
            if (v82 == 8)
            {
              v84 = *((_QWORD *)v81 + 1);
LABEL_112:
              if (v84)
              {
LABEL_113:
                if (!v81[14])
                {
                  v80 = -0.25;
                  goto LABEL_118;
                }
              }
LABEL_117:
              v80 = 0.5;
LABEL_118:
              *(float *)(v15 + 8) = v80;
LABEL_119:
              xsltGenericDebug(*v18, "xsltCompilePattern : parsed %s, default priority %f\n", *(const char **)(v15 + 16), v80);
              if (v10[(int)v36] == 124)
                v14 = (int)v36 + 1;
              else
                v14 = (int)v36;
              v19 = &v10[v14];
              v17 = v97;
              v16 = v101;
              if (!v10[v14])
              {
                if ((_DWORD)v14)
                {
                  *(_QWORD *)&v93 = -1;
                  *((_QWORD *)&v93 + 1) = -1;
                  *(_OWORD *)(v98 + 32) = v93;
                  *(_OWORD *)(v98 + 48) = v93;
                  *(_OWORD *)v98 = v93;
                  *(_OWORD *)(v98 + 16) = v93;
                  ((void (*)(uint64_t))*MEMORY[0x24BEDE758])(v98);
                  return v101;
                }
                v13 = (void (**)(_OWORD *))MEMORY[0x24BEDE758];
LABEL_149:
                xsltTransformError(0, a4, a3, "xsltCompilePattern : NULL pattern\n");
                if (a4)
                  ++a4->errors;
                goto LABEL_163;
              }
              goto LABEL_5;
            }
LABEL_115:
            if ((v82 - 9) > 4)
              goto LABEL_117;
          }
          if (v81[14])
            goto LABEL_117;
          v80 = -0.5;
          goto LABEL_118;
        }
        if (v53 != 32)
          goto LABEL_61;
      }
    }
  }
  xsltTransformError(0, 0, 0, "xsltNewCompMatch : out of memory error\n");
  v13 = (void (**)(_OWORD *))MEMORY[0x24BEDE758];
  ((void (*)(uint64_t))*MEMORY[0x24BEDE758])(v44);
LABEL_154:
  v12 = (_OWORD *)v98;
LABEL_163:
  *(_QWORD *)&v95 = -1;
  *((_QWORD *)&v95 + 1) = -1;
  v12[2] = v95;
  v12[3] = v95;
  *v12 = v95;
  v12[1] = v95;
  (*v13)(v12);
  if (v16)
  {
    do
    {
      v96 = (_QWORD *)*v16;
      xsltFreeCompMatch((uint64_t)v16);
      v16 = v96;
    }
    while (v96);
  }
  return 0;
}

int xsltAddTemplate(xsltStylesheetPtr style, xsltTemplatePtr cur, const xmlChar *mode, const xmlChar *modeURI)
{
  int result;
  const xmlChar *name;
  xmlHashTable *namedTemplates;
  xmlHashTable *v11;
  xmlChar *match;
  float priority;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _xsltCompMatch **v22;
  _xsltCompMatch **p_elemMatch;
  _xsltCompMatch **p_attrMatch;
  xmlGenericErrorFunc *v25;
  uint64_t v26;
  uint64_t v27;
  _xsltCompMatch **p_piMatch;
  _xsltCompMatch **p_rootMatch;
  _xsltCompMatch **v30;
  xmlGenericErrorFunc *v31;
  const xmlChar *v32;
  xmlHashTable *templatesHash;
  uint64_t *v34;
  float v35;
  uint64_t *v36;
  _xsltCompMatch *v37;
  float v38;
  uint64_t *v39;
  void (*v40)(uint64_t, const char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char);
  uint64_t v41;
  xmlHashTable *v42;

  result = -1;
  if (!style || !cur)
    return result;
  if (cur->next)
    cur->position = cur->next->position + 1;
  name = cur->name;
  if (name)
  {
    namedTemplates = style->namedTemplates;
    if (namedTemplates)
    {
      if (xmlHashLookup2(namedTemplates, name, cur->nameURI))
      {
        xsltTransformError(0, style, cur->elem, "xsl:template: error duplicate name '%s'\n");
        goto LABEL_61;
      }
      v11 = style->namedTemplates;
    }
    else
    {
      v11 = xmlHashCreate(10);
      style->namedTemplates = v11;
      if (!v11)
        return -1;
    }
    xmlHashAddEntry2(v11, cur->name, cur->nameURI, cur);
  }
  match = cur->match;
  if (!match)
  {
    if (cur->name)
      return 0;
    xsltTransformError(0, style, cur->elem, "xsl:template: need to specify match or name attribute\n");
LABEL_61:
    ++style->errors;
    return -1;
  }
  priority = cur->priority;
  v14 = xsltCompilePatternInternal(match, style->doc, cur->elem, style, 0, 1);
  if (!v14)
    return -1;
  v21 = (uint64_t)v14;
  v22 = 0;
  p_elemMatch = &style->elemMatch;
  p_attrMatch = &style->attrMatch;
  v25 = &xsltGenericDebug;
  while (2)
  {
    v26 = *(_QWORD *)v21;
    *(_QWORD *)v21 = 0;
    *(_QWORD *)(v21 + 40) = cur;
    if (mode)
      *(_QWORD *)(v21 + 24) = xmlDictLookup(style->dict, mode, -1);
    if (modeURI)
      *(_QWORD *)(v21 + 32) = xmlDictLookup(style->dict, modeURI, -1);
    if (priority != -12346000.0)
      *(float *)(v21 + 8) = priority;
    v27 = *(_QWORD *)(v21 + 88);
    p_piMatch = p_attrMatch;
    p_rootMatch = p_elemMatch;
    switch(*(_DWORD *)v27)
    {
      case 0:
      case 0xE:
        goto LABEL_64;
      case 1:
        p_rootMatch = &style->rootMatch;
        goto LABEL_39;
      case 2:
      case 0xD:
        p_piMatch = p_elemMatch;
        goto LABEL_27;
      case 3:
        goto LABEL_27;
      case 4:
      case 5:
      case 6:
      case 8:
      case 9:
        goto LABEL_39;
      case 7:
        p_rootMatch = &style->keyMatch;
        goto LABEL_39;
      case 0xA:
        p_piMatch = &style->piMatch;
LABEL_27:
        v30 = p_attrMatch;
        v31 = v25;
        v32 = *(const xmlChar **)(v27 + 8);
        if (v32)
        {
          templatesHash = style->templatesHash;
          if (templatesHash)
          {
            v34 = (uint64_t *)xmlHashLookup3(templatesHash, *(const xmlChar **)(v27 + 8), mode, modeURI);
            if (v34)
            {
              v35 = *(float *)(v21 + 8);
              if (*((float *)v34 + 2) <= v35)
              {
                *(_QWORD *)v21 = v34;
                xmlHashUpdateEntry3(style->templatesHash, v32, mode, modeURI, (void *)v21, 0);
              }
              else
              {
                do
                {
                  v36 = v34;
                  v34 = (uint64_t *)*v34;
                }
                while (v34 && *((float *)v34 + 2) > v35);
                *(_QWORD *)v21 = v34;
                *v36 = v21;
              }
              goto LABEL_57;
            }
            v42 = style->templatesHash;
          }
          else
          {
            v42 = xmlHashCreate(1024);
            style->templatesHash = v42;
            if (!v42)
              goto LABEL_65;
          }
          xmlHashAddEntry3(v42, v32, mode, modeURI, (void *)v21);
LABEL_57:
          v25 = v31;
          p_attrMatch = v30;
          p_elemMatch = &style->elemMatch;
LABEL_47:
          v40 = (void (*)(uint64_t, const char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char))*v25;
          v41 = *(_QWORD *)(v21 + 16);
          if (mode)
            v40((uint64_t)xsltGenericDebugContext, "added pattern : '%s' mode '%s' priority %f\n", v15, v16, v17, v18, v19, v20, v41);
          else
            v40((uint64_t)xsltGenericDebugContext, "added pattern : '%s' priority %f\n", v15, v16, v17, v18, v19, v20, v41);
          v21 = v26;
          if (!v26)
            return 0;
          continue;
        }
        v22 = p_piMatch;
        v25 = v31;
        p_attrMatch = v30;
        p_elemMatch = &style->elemMatch;
LABEL_35:
        p_rootMatch = v22;
        if (v22)
        {
LABEL_39:
          v37 = *p_rootMatch;
          if (*p_rootMatch)
          {
            v38 = *(float *)(v21 + 8);
            if (*((float *)v37 + 2) <= v38)
            {
              *(_QWORD *)v21 = v37;
              *p_rootMatch = (_xsltCompMatch *)v21;
            }
            else
            {
              do
              {
                v39 = (uint64_t *)v37;
                v37 = *(_xsltCompMatch **)v37;
              }
              while (v37 && *((float *)v37 + 2) > v38);
              *(_QWORD *)v21 = v37;
              *v39 = v21;
            }
          }
          else
          {
            *p_rootMatch = (_xsltCompMatch *)v21;
            *(_QWORD *)v21 = 0;
          }
          v22 = p_rootMatch;
          goto LABEL_47;
        }
LABEL_64:
        xsltTransformError(0, style, 0, "xsltAddTemplate: invalid compiled pattern\n");
LABEL_65:
        xsltFreeCompMatch(v21);
        return -1;
      case 0xB:
        p_rootMatch = &style->commentMatch;
        goto LABEL_39;
      case 0xC:
        p_rootMatch = &style->textMatch;
        goto LABEL_39;
      default:
        goto LABEL_35;
    }
  }
}

xsltTemplatePtr xsltGetTemplate(xsltTransformContextPtr ctxt, xmlNodePtr node, xsltStylesheetPtr style)
{
  xsltTemplate *v3;
  xsltStylesheetPtr v7;
  int v8;
  const xmlChar *name;
  xmlHashTable *templatesHash;
  xmlElementType type;
  void *v12;
  uint64_t v13;
  float v14;
  xmlElementType v15;
  uint64_t attrMatch;
  char v17;
  _QWORD *p_properties;
  uint64_t v19;
  char v20;
  char v21;
  float v22;
  int v23;
  uint64_t p_elemMatch;
  float v25;
  float v26;
  xsltDocumentPtr document;
  _xmlDoc *doc;
  xsltDocument *v29;
  int v30;
  _xmlAttr **p_parent;
  xsltStylesheet *Import;
  uint64_t p_keyMatch;
  float v34;

  v3 = 0;
  if (ctxt && node)
  {
    v7 = style ? xsltNextImport(style) : ctxt->style;
    v3 = 0;
    if (v7)
    {
      if (v7 != style)
      {
        v8 = 0;
        name = 0;
        while (2)
        {
          templatesHash = v7->templatesHash;
          if (templatesHash)
          {
            v3 = 0;
            type = node->type;
            if (type > XML_XINCLUDE_END)
              return v3;
            if (((1 << type) & 0x1FFF78) == 0)
            {
              if (((1 << type) & 0x84) != 0)
                goto LABEL_100;
              if (type != XML_ELEMENT_NODE)
                return v3;
              if (*node->name != 32)
LABEL_100:
                name = node->name;
            }
          }
          if (name && (v12 = xmlHashLookup3(templatesHash, name, ctxt->mode, ctxt->modeURI)) != 0)
          {
            v13 = (uint64_t)v12;
            while (xsltTestCompMatch(ctxt, v13, node, (uint64_t)ctxt->mode, (uint64_t)ctxt->modeURI) != 1)
            {
              v13 = *(_QWORD *)v13;
              if (!v13)
                goto LABEL_17;
            }
            v3 = *(xsltTemplate **)(v13 + 40);
            v14 = *(float *)(v13 + 8);
          }
          else
          {
LABEL_17:
            v3 = 0;
            v14 = -12346000.0;
          }
          v15 = node->type;
          switch(v15)
          {
            case XML_ELEMENT_NODE:
              v19 = 104;
              if (*node->name == 32)
                v19 = 88;
              attrMatch = *(uint64_t *)((char *)&v7->parent + v19);
              goto LABEL_30;
            case XML_ATTRIBUTE_NODE:
              attrMatch = (uint64_t)v7->attrMatch;
              v20 = linkedOnOrAfterFall2023OSVersions();
              p_properties = &node->properties;
              if ((v20 & 1) != 0)
                goto LABEL_33;
              goto LABEL_31;
            case XML_TEXT_NODE:
            case XML_CDATA_SECTION_NODE:
              attrMatch = (uint64_t)v7->textMatch;
              goto LABEL_30;
            case XML_PI_NODE:
              attrMatch = (uint64_t)v7->piMatch;
              goto LABEL_30;
            case XML_COMMENT_NODE:
              attrMatch = (uint64_t)v7->commentMatch;
LABEL_30:
              v21 = linkedOnOrAfterFall2023OSVersions();
              p_properties = &node->psvi;
              if ((v21 & 1) == 0)
                goto LABEL_31;
              goto LABEL_33;
            case XML_DOCUMENT_NODE:
            case XML_HTML_DOCUMENT_NODE:
              attrMatch = (uint64_t)v7->rootMatch;
              v17 = linkedOnOrAfterFall2023OSVersions();
              p_properties = &node[1].parent;
              if ((v17 & 1) != 0)
                goto LABEL_33;
LABEL_31:
              if (*p_properties)
                v8 = 1;
LABEL_33:
              if (!attrMatch)
                goto LABEL_42;
              break;
            default:
              goto LABEL_43;
          }
          do
          {
            if (v3)
            {
              v22 = *(float *)(attrMatch + 8);
              if (v22 <= v14 && (v22 != v14 || *(_DWORD *)(*(_QWORD *)(attrMatch + 40) + 144) <= v3->position))
                break;
            }
            if (xsltTestCompMatch(ctxt, attrMatch, node, (uint64_t)ctxt->mode, (uint64_t)ctxt->modeURI) == 1)
            {
              v3 = *(xsltTemplate **)(attrMatch + 40);
              v14 = *(float *)(attrMatch + 8);
              break;
            }
            attrMatch = *(_QWORD *)attrMatch;
          }
          while (attrMatch);
LABEL_42:
          v15 = node->type;
LABEL_43:
          if (v15 <= XML_HTML_DOCUMENT_NODE)
          {
            v23 = 1 << v15;
            if ((v23 & 0x2208) != 0)
            {
              p_elemMatch = (uint64_t)&v7->elemMatch;
              do
              {
                p_elemMatch = *(_QWORD *)p_elemMatch;
                if (p_elemMatch)
                {
                  if (!v3)
                    continue;
                  v25 = *(float *)(p_elemMatch + 8);
                  if (v25 > v14 || v25 == v14 && *(_DWORD *)(*(_QWORD *)(p_elemMatch + 40) + 144) > v3->position)
                    continue;
                }
                goto LABEL_62;
              }
              while (xsltTestCompMatch(ctxt, p_elemMatch, node, (uint64_t)ctxt->mode, (uint64_t)ctxt->modeURI) != 1);
            }
            else
            {
              if ((v23 & 0x180) == 0)
                goto LABEL_62;
              p_elemMatch = (uint64_t)&v7->elemMatch;
              do
              {
                p_elemMatch = *(_QWORD *)p_elemMatch;
                if (p_elemMatch)
                {
                  if (!v3)
                    continue;
                  v26 = *(float *)(p_elemMatch + 8);
                  if (v26 > v14 || v26 == v14 && *(_DWORD *)(*(_QWORD *)(p_elemMatch + 40) + 144) > v3->position)
                    continue;
                }
                goto LABEL_62;
              }
              while (xsltTestCompMatch(ctxt, p_elemMatch, node, (uint64_t)ctxt->mode, (uint64_t)ctxt->modeURI) != 1);
            }
            v3 = *(xsltTemplate **)(p_elemMatch + 40);
            v14 = *(float *)(p_elemMatch + 8);
            goto LABEL_62;
          }
          while (1)
          {
LABEL_62:
            if (linkedOnOrAfterFall2023OSVersions())
              v8 = xsltGetSourceNodeFlags((uint64_t)node) & 1;
            if (v8)
              break;
            if (!ctxt->hasTemplKeyPatterns)
              goto LABEL_82;
            document = ctxt->document;
            if (document)
            {
              if (document->nbKeysComputed >= ctxt->nbKeys)
                goto LABEL_82;
            }
            else
            {
              doc = node->doc;
              if (doc->_private)
              {
                xsltTransformError(ctxt, 0, ctxt->inst, "Internal error in xsltComputeAllKeys(): The context's document info doesn't match the document info of the current result tree.\n");
                v3 = 0;
                ctxt->state = XSLT_STATE_STOPPED;
                return v3;
              }
              v29 = xsltNewDocument(ctxt, doc);
              ctxt->document = v29;
              if (!v29)
                return 0;
            }
            if (xsltInitAllDocKeys(ctxt) == -1)
              return 0;
            if (linkedOnOrAfterFall2023OSVersions())
            {
              v30 = xsltGetSourceNodeFlags((uint64_t)node) & 1;
            }
            else
            {
              v8 = 0;
              switch(node->type)
              {
                case XML_ELEMENT_NODE:
                case XML_TEXT_NODE:
                case XML_CDATA_SECTION_NODE:
                case XML_PI_NODE:
                case XML_COMMENT_NODE:
                  if (!node->psvi)
                    goto LABEL_82;
                  goto LABEL_80;
                case XML_ATTRIBUTE_NODE:
                  p_parent = &node->properties;
                  goto LABEL_79;
                case XML_DOCUMENT_NODE:
                case XML_HTML_DOCUMENT_NODE:
                  p_parent = (_xmlAttr **)&node[1].parent;
LABEL_79:
                  if (!*p_parent)
                    goto LABEL_82;
LABEL_80:
                  v30 = 1;
                  break;
                default:
                  goto LABEL_83;
              }
            }
            v8 = 1;
            if (!v30)
            {
LABEL_82:
              v8 = 0;
LABEL_83:
              if (v3)
                return v3;
              goto LABEL_84;
            }
          }
          p_keyMatch = (uint64_t)&v7->keyMatch;
          while (1)
          {
            p_keyMatch = *(_QWORD *)p_keyMatch;
            if (!p_keyMatch)
              break;
            if (v3)
            {
              v34 = *(float *)(p_keyMatch + 8);
              if (v34 <= v14 && (v34 != v14 || *(_DWORD *)(*(_QWORD *)(p_keyMatch + 40) + 144) <= v3->position))
                return v3;
            }
            if (xsltTestCompMatch(ctxt, p_keyMatch, node, (uint64_t)ctxt->mode, (uint64_t)ctxt->modeURI) == 1)
            {
              v3 = *(xsltTemplate **)(p_keyMatch + 40);
              break;
            }
          }
          v8 = 1;
          if (v3)
            return v3;
LABEL_84:
          Import = xsltNextImport(v7);
          if (Import)
          {
            v7 = Import;
            if (Import != style)
              continue;
          }
          break;
        }
      }
    }
  }
  return v3;
}

void xsltFreeTemplateHashes(xsltStylesheetPtr style)
{
  xmlHashTable *templatesHash;
  _xsltCompMatch *rootMatch;
  _xsltCompMatch *v4;
  _xsltCompMatch *keyMatch;
  _xsltCompMatch *v6;
  _xsltCompMatch *elemMatch;
  _xsltCompMatch *v8;
  _xsltCompMatch *attrMatch;
  _xsltCompMatch *v10;
  _xsltCompMatch *parentMatch;
  _xsltCompMatch *v12;
  _xsltCompMatch *textMatch;
  _xsltCompMatch *v14;
  _xsltCompMatch *piMatch;
  _xsltCompMatch *v16;
  _xsltCompMatch *commentMatch;
  _xsltCompMatch *v18;
  xmlHashTable *namedTemplates;

  templatesHash = style->templatesHash;
  if (templatesHash)
    xmlHashFree(templatesHash, (xmlHashDeallocator)xsltFreeCompMatchListEntry);
  rootMatch = style->rootMatch;
  if (rootMatch)
  {
    do
    {
      v4 = *(_xsltCompMatch **)rootMatch;
      xsltFreeCompMatch((uint64_t)rootMatch);
      rootMatch = v4;
    }
    while (v4);
  }
  keyMatch = style->keyMatch;
  if (keyMatch)
  {
    do
    {
      v6 = *(_xsltCompMatch **)keyMatch;
      xsltFreeCompMatch((uint64_t)keyMatch);
      keyMatch = v6;
    }
    while (v6);
  }
  elemMatch = style->elemMatch;
  if (elemMatch)
  {
    do
    {
      v8 = *(_xsltCompMatch **)elemMatch;
      xsltFreeCompMatch((uint64_t)elemMatch);
      elemMatch = v8;
    }
    while (v8);
  }
  attrMatch = style->attrMatch;
  if (attrMatch)
  {
    do
    {
      v10 = *(_xsltCompMatch **)attrMatch;
      xsltFreeCompMatch((uint64_t)attrMatch);
      attrMatch = v10;
    }
    while (v10);
  }
  parentMatch = style->parentMatch;
  if (parentMatch)
  {
    do
    {
      v12 = *(_xsltCompMatch **)parentMatch;
      xsltFreeCompMatch((uint64_t)parentMatch);
      parentMatch = v12;
    }
    while (v12);
  }
  textMatch = style->textMatch;
  if (textMatch)
  {
    do
    {
      v14 = *(_xsltCompMatch **)textMatch;
      xsltFreeCompMatch((uint64_t)textMatch);
      textMatch = v14;
    }
    while (v14);
  }
  piMatch = style->piMatch;
  if (piMatch)
  {
    do
    {
      v16 = *(_xsltCompMatch **)piMatch;
      xsltFreeCompMatch((uint64_t)piMatch);
      piMatch = v16;
    }
    while (v16);
  }
  commentMatch = style->commentMatch;
  if (commentMatch)
  {
    do
    {
      v18 = *(_xsltCompMatch **)commentMatch;
      xsltFreeCompMatch((uint64_t)commentMatch);
      commentMatch = v18;
    }
    while (v18);
  }
  namedTemplates = style->namedTemplates;
  if (namedTemplates)
    xmlHashFree(namedTemplates, 0);
}

_QWORD *xsltFreeCompMatchListEntry(_QWORD *result)
{
  _QWORD *v1;

  if (result)
  {
    do
    {
      v1 = (_QWORD *)*result;
      xsltFreeCompMatch((uint64_t)result);
      result = v1;
    }
    while (v1);
  }
  return result;
}

void xsltPatPushState(uint64_t a1, int *a2, int a3, uint64_t a4)
{
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v8 = *((_QWORD *)a2 + 1);
  if (!v8 || (v9 = a2[1], v9 <= 0))
  {
    *(_QWORD *)a2 = 0x400000000;
    v8 = ((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(64);
    *((_QWORD *)a2 + 1) = v8;
    goto LABEL_7;
  }
  if (v9 > *a2)
  {
LABEL_7:
    v10 = *a2;
    v11 = v8 + 16 * v10;
    *(_DWORD *)v11 = a3;
    *a2 = v10 + 1;
    *(_QWORD *)(v11 + 8) = a4;
    return;
  }
  v8 = ((uint64_t (*)(void))*MEMORY[0x24BEDEB10])();
  if (v8)
  {
    *((_QWORD *)a2 + 1) = v8;
    a2[1] *= 2;
    goto LABEL_7;
  }
  xsltGenericError(xsltGenericErrorContext, "xsltPatPushState: memory re-allocation failure.\n");
  *(_DWORD *)(a1 + 168) = 2;
}

uint64_t xsltTestCompMatchDirect(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v7;
  _BYTE *v8;
  BOOL v9;
  int *v10;
  uint64_t v11;
  xmlXPathObject *v12;
  uint64_t v13;
  __int128 *v14;
  int v15;
  uint64_t v16;
  const xmlChar *v17;
  uint64_t v18;
  xmlXPathObjectPtr v19;
  uint64_t v20;
  xmlXPathObject *v21;
  char v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int *nodesetval;
  uint64_t v28;
  _QWORD *v29;
  __int128 v31;

  v7 = *(_QWORD *)(a3 + 64);
  v9 = 0;
  if (v7)
  {
    if (*(_DWORD *)(v7 + 8) == 9)
    {
      v8 = *(_BYTE **)(v7 + 16);
      if (v8)
      {
        if (*v8 == 32)
          v9 = 1;
      }
    }
  }
  v10 = *(int **)(a2 + 88);
  v11 = *(_QWORD *)(a1 + 256);
  v12 = *(xmlXPathObject **)(v11 + 24 * v10[12]);
  if (v12 && *(_QWORD *)(v11 + 24 * v10[10] + 16) == v7)
  {
    v24 = 0;
    v23 = *(_DWORD *)(v11 + 24 * v10[11] + 16);
    v21 = v12;
  }
  else
  {
    v13 = *(_QWORD *)(a3 + 40);
    v14 = *(__int128 **)(a1 + 160);
    v15 = *((_DWORD *)v14 + 22);
    v16 = *((_QWORD *)v14 + 10);
    *((_QWORD *)v14 + 10) = a4;
    *((_DWORD *)v14 + 22) = a5;
    v17 = *(const xmlChar **)(a2 + 16);
    v18 = *((_QWORD *)v14 + 13);
    v31 = *v14;
    *(_QWORD *)v14 = v7;
    *((_QWORD *)v14 + 1) = a3;
    v19 = xmlXPathEval(v17, (xmlXPathContextPtr)v14);
    v20 = *(_QWORD *)(a1 + 160);
    *(_OWORD *)v20 = v31;
    *(_QWORD *)(v20 + 80) = v16;
    *(_DWORD *)(v20 + 88) = v15;
    *(_QWORD *)(v20 + 104) = v18;
    if (!v19)
      return 0xFFFFFFFFLL;
    v21 = v19;
    if (v19->type != XPATH_NODESET)
    {
      v25 = 0xFFFFFFFFLL;
      goto LABEL_32;
    }
    if (v13 && (!*(_QWORD *)(a3 + 64) ? (v22 = 1) : (v22 = v9), (v22 & 1) == 0))
    {
      if (v12)
        xmlXPathFreeObject(v12);
      v24 = 0;
      v23 = 0;
      v26 = *(_QWORD *)(a1 + 256);
      *(_QWORD *)(v26 + 24 * v10[12]) = v21;
      *(_QWORD *)(v26 + 24 * v10[10] + 16) = v7;
      *(_DWORD *)(*(_QWORD *)(a1 + 256) + 24 * v10[11] + 16) = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 256) + 24 * v10[12] + 8) = xmlXPathFreeObjectWrapper;
    }
    else
    {
      v23 = 0;
      v24 = 1;
    }
  }
  nodesetval = (unsigned int *)v21->nodesetval;
  if (!nodesetval || (v28 = *nodesetval, (int)v28 <= 0))
  {
    v25 = 0;
    if ((v24 & 1) == 0)
      return v25;
    goto LABEL_32;
  }
  if (v23)
  {
LABEL_29:
    v25 = 0;
    if (!v24)
      return v25;
    goto LABEL_32;
  }
  v29 = (_QWORD *)*((_QWORD *)nodesetval + 1);
  while (*v29 != a3)
  {
    ++v29;
    if (!--v28)
      goto LABEL_29;
  }
  v25 = 1;
  if ((v24 & 1) != 0)
LABEL_32:
    xmlXPathFreeObject(v21);
  return v25;
}

uint64_t xsltTestStepMatch(xsltTransformContext *a1, xmlNodePtr node, uint64_t a3)
{
  int v5;
  unint64_t v6;
  BOOL v7;
  const xmlChar *v8;
  const xmlChar *name;
  uint64_t result;
  xmlNs *ns;
  const xmlChar *href;
  const xmlChar *v13;
  const xmlChar *v14;
  xmlNs *v15;
  uint64_t v16;
  xmlNodePtr *v17;
  xmlNs *v18;
  unsigned __int32 v19;

  switch(*(_DWORD *)a3)
  {
    case 1:
      HIDWORD(v6) = node->type - 1;
      LODWORD(v6) = HIDWORD(v6);
      v5 = v6 >> 2;
      v7 = (v5 - 2) < 2 || v5 == 5;
      return v7 || !v5 && *node->name == 32;
    case 2:
      if (node->type != XML_ELEMENT_NODE)
        return 0;
      v8 = *(const xmlChar **)(a3 + 8);
      if (!v8)
        return 1;
      name = node->name;
      if (*v8 != *name)
        return 0;
      result = xmlStrEqual(v8, name);
      if (!(_DWORD)result)
        return result;
      ns = node->ns;
      if (!ns)
        return !*(_QWORD *)(a3 + 16);
      href = ns->href;
      if (!href)
        return 1;
      result = *(_QWORD *)(a3 + 16);
      if (result)
        goto LABEL_45;
      return result;
    case 3:
      if (node->type != XML_ATTRIBUTE_NODE)
        return 0;
      v13 = *(const xmlChar **)(a3 + 8);
      if (!v13)
        goto LABEL_21;
      v14 = node->name;
      if (*v13 != *v14)
        return 0;
      result = xmlStrEqual(v13, v14);
      if (!(_DWORD)result)
        return result;
LABEL_21:
      v15 = node->ns;
      result = *(_QWORD *)(a3 + 16);
      if (v15)
      {
        if (!result)
          return 1;
        href = v15->href;
        goto LABEL_45;
      }
      return !result;
    case 6:
      if (node->type != XML_ELEMENT_NODE)
        return 0;
      result = (uint64_t)xmlGetID(node->doc, *(const xmlChar **)(a3 + 8));
      if (!result)
        return result;
      return *(xmlNodePtr *)(result + 40) == node;
    case 7:
      result = (uint64_t)xsltGetKey(a1, *(const xmlChar **)(a3 + 8), *(const xmlChar **)(a3 + 24), *(const xmlChar **)(a3 + 16));
      if (!result)
        return result;
      v16 = *(unsigned int *)result;
      if ((int)v16 < 1)
        return 0;
      v17 = *(xmlNodePtr **)(result + 8);
      break;
    case 8:
      if (node->type != XML_ELEMENT_NODE)
        return 0;
      v18 = node->ns;
      if (v18)
      {
        href = v18->href;
        if (!href)
          return 1;
        result = *(_QWORD *)(a3 + 8);
        if (result)
        {
LABEL_45:
          result = xmlStrEqual((const xmlChar *)result, href);
          if ((_DWORD)result)
            return 1;
        }
      }
      else
      {
        return !*(_QWORD *)(a3 + 8);
      }
      return result;
    case 9:
      return node->type == XML_ELEMENT_NODE;
    case 0xA:
      if (node->type != XML_PI_NODE)
        return 0;
      result = *(_QWORD *)(a3 + 8);
      if (!result)
        return 1;
      href = node->name;
      goto LABEL_45;
    case 0xB:
      return node->type == XML_COMMENT_NODE;
    case 0xC:
      return node->type - 3 < 2;
    case 0xD:
      v19 = node->type - 1;
      if (v19 >= 8)
        return 0;
      return dword_209C21A84[v19];
    default:
      xsltTransformError(a1, 0, node, "xsltTestStepMatch: unexpected step op %d\n", *(_DWORD *)a3);
      return 0xFFFFFFFFLL;
  }
  while (*v17 != node)
  {
    result = 0;
    ++v17;
    if (!--v16)
      return result;
  }
  return 1;
}

void xsltCompileRelativePathPattern(uint64_t a1, xmlChar *a2, int a3)
{
  unsigned __int8 *i;
  unsigned int v6;
  unsigned int v8;
  uint64_t v9;
  unsigned __int8 *v10;
  _BYTE *v11;
  unsigned int v12;
  BOOL v13;
  uint64_t v14;
  unsigned int v16;
  uint64_t v17;

  xsltCompileStepPattern(a1, a2, a3);
  if (*(_DWORD *)(a1 + 48))
    return;
  for (i = *(unsigned __int8 **)(a1 + 16); ; *(_QWORD *)(a1 + 16) = i)
  {
    v6 = *i;
    if (v6 > 0x20 || ((1 << v6) & 0x100002600) == 0)
      break;
    ++i;
  }
  LOBYTE(v8) = *i;
  while (v8 == 47)
  {
    v9 = *(_QWORD *)(a1 + 56);
    if (i[1] != 47)
    {
      if (xsltCompMatchAdd(a1, v9, 4, 0, 0, a3))
        return;
      v11 = *(_BYTE **)(a1 + 16);
      if (*v11)
        goto LABEL_26;
      while (1)
      {
        v16 = *v11;
        v13 = v16 > 0x20;
        v17 = (1 << v16) & 0x100002600;
        if (v13 || v17 == 0)
          goto LABEL_32;
LABEL_26:
        *(_QWORD *)(a1 + 16) = ++v11;
      }
    }
    if (xsltCompMatchAdd(a1, v9, 5, 0, 0, a3))
      return;
    v10 = *(unsigned __int8 **)(a1 + 16);
    if (*v10)
    {
      *(_QWORD *)(a1 + 16) = v10 + 1;
      if (v10[1])
      {
        v10 += 2;
        goto LABEL_20;
      }
      ++v10;
    }
    while (1)
    {
      v12 = *v10;
      v13 = v12 > 0x20;
      v14 = (1 << v12) & 0x100002600;
      if (v13 || v14 == 0)
        break;
      ++v10;
LABEL_20:
      *(_QWORD *)(a1 + 16) = v10;
    }
LABEL_32:
    xsltCompileStepPattern(a1, 0, a3);
    if (*(_DWORD *)(a1 + 48))
      return;
    for (i = *(unsigned __int8 **)(a1 + 16); ; *(_QWORD *)(a1 + 16) = i)
    {
      v8 = *i;
      if (v8 > 0x20 || ((1 << v8) & 0x100002600) == 0)
        break;
      ++i;
    }
  }
  if ((_BYTE)v8 && v8 != 124)
    *(_DWORD *)(a1 + 48) = 1;
}

uint64_t xsltCompMatchAdd(uint64_t a1, uint64_t a2, int a3, const xmlChar *a4, uint64_t a5, int a6)
{
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  xsltTransformContext *v16;
  int ExtraCtxt;
  xmlXPathCompExprPtr v18;
  uint64_t result;
  void (**v20)(uint64_t);

  v12 = *(_DWORD *)(a2 + 60);
  v13 = *(int *)(a2 + 64);
  if (v12 < (int)v13)
  {
    v14 = *(_QWORD *)(a2 + 88);
LABEL_5:
    v15 = v14 + 56 * v12;
    *(_DWORD *)v15 = a3;
    *(_QWORD *)(v15 + 8) = a4;
    *(_QWORD *)(v15 + 16) = a5;
    *(_QWORD *)(v15 + 24) = 0;
    *(_QWORD *)(v15 + 32) = 0;
    v16 = *(xsltTransformContext **)(a1 + 8);
    if (v16)
    {
      *(_DWORD *)(*(_QWORD *)(a2 + 88) + 56 * *(int *)(a2 + 60) + 40) = xsltAllocateExtraCtxt(v16);
      *(_DWORD *)(*(_QWORD *)(a2 + 88) + 56 * *(int *)(a2 + 60) + 44) = xsltAllocateExtraCtxt(*(xsltTransformContextPtr *)(a1 + 8));
      ExtraCtxt = xsltAllocateExtraCtxt(*(xsltTransformContextPtr *)(a1 + 8));
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(a2 + 88) + 56 * *(int *)(a2 + 60) + 40) = xsltAllocateExtra(*(xsltStylesheetPtr *)a1);
      *(_DWORD *)(*(_QWORD *)(a2 + 88) + 56 * *(int *)(a2 + 60) + 44) = xsltAllocateExtra(*(xsltStylesheetPtr *)a1);
      ExtraCtxt = xsltAllocateExtra(*(xsltStylesheetPtr *)a1);
    }
    *(_DWORD *)(*(_QWORD *)(a2 + 88) + 56 * *(int *)(a2 + 60) + 48) = ExtraCtxt;
    if (a3 == 14)
    {
      v18 = xsltXPathCompileFlags(*(xsltStylesheetPtr *)a1, a4, 2 * (a6 != 0));
      *(_QWORD *)(*(_QWORD *)(a2 + 88) + 56 * *(int *)(a2 + 60) + 32) = v18;
      if (!v18)
      {
        xsltTransformError(0, *(xsltStylesheetPtr *)a1, *(xmlNodePtr *)(a1 + 40), "Failed to compile predicate\n");
        if (*(_QWORD *)a1)
          ++*(_DWORD *)(*(_QWORD *)a1 + 292);
      }
    }
    result = 0;
    ++*(_DWORD *)(a2 + 60);
    return result;
  }
  v14 = ((uint64_t (*)(_QWORD, uint64_t))*MEMORY[0x24BEDEB10])(*(_QWORD *)(a2 + 88), 112 * v13);
  if (v14)
  {
    v12 = *(_DWORD *)(a2 + 60);
    *(_DWORD *)(a2 + 64) *= 2;
    *(_QWORD *)(a2 + 88) = v14;
    goto LABEL_5;
  }
  xsltGenericError(xsltGenericErrorContext, "xsltCompMatchAdd: memory re-allocation failure.\n");
  if (*(_QWORD *)a1)
    ++*(_DWORD *)(*(_QWORD *)a1 + 292);
  v20 = (void (**)(uint64_t))MEMORY[0x24BEDE758];
  if (a4)
    ((void (*)(const xmlChar *))*MEMORY[0x24BEDE758])(a4);
  if (a5)
    (*v20)(a5);
  return 0xFFFFFFFFLL;
}

xmlChar *xsltScanNCName(uint64_t a1)
{
  const xmlChar *v2;
  const xmlChar *v3;
  unsigned int v4;
  uint64_t v5;
  signed int v7;
  signed int v8;
  xmlChar *result;
  BOOL v10;
  const xmlChRangeGroup *v13;
  const xmlChar *i;
  BOOL v15;
  BOOL v17;
  int v18;
  int len;

  len = 0;
  v2 = *(const xmlChar **)(a1 + 16);
  v3 = v2;
  while (1)
  {
    v4 = *v3;
    v10 = v4 > 0x20;
    v5 = (1 << v4) & 0x100002600;
    if (v10 || v5 == 0)
      break;
    *(_QWORD *)(a1 + 16) = ++v3;
    ++v2;
  }
  v7 = xmlStringCurrentChar(0, v3, &len);
  v8 = v7;
  if (v7 > 255)
  {
    if (xmlCharInRange(v7, MEMORY[0x24BEDE8C8]))
      v10 = 1;
    else
      v10 = (v8 - 12330) > 0xFFFFFFF6;
    if (!v10 && v8 != 12295 && (v8 - 40870) < 0xFFFFAE5A)
      return 0;
  }
  else if ((v7 - 192) >= 0x17
         && (v7 & 0xFFFFFFDF) - 65 >= 0x1A
         && v7 != 95
         && v7 <= 247
         && (v7 - 216) >= 0x1F)
  {
    return 0;
  }
  v13 = (const xmlChRangeGroup *)MEMORY[0x24BEDE8C8];
  for (i = v3; ; v8 = xmlStringCurrentChar(0, i, &len))
  {
    if (v8 > 255)
    {
      if (xmlCharInRange(v8, v13))
        v15 = 0;
      else
        v15 = (v8 - 12321) >= 9;
      v17 = v15 && v8 != 12295 && (v8 - 19968) >= 0x51A6;
      if (!v17 || xmlCharInRange(v8, MEMORY[0x24BEDE8E0]))
        goto LABEL_47;
    }
    else if ((v8 - 192) < 0x17
           || (v8 & 0xFFFFFFDF) - 65 < 0x1A
           || (v8 - 48) < 0xA
           || v8 > 247
           || (v8 - 216) < 0x1F)
    {
      goto LABEL_47;
    }
    if ((v8 - 45) <= 0x32 && ((1 << (v8 - 45)) & 0x4000000000003) != 0)
      goto LABEL_47;
    if (v8 >= 256)
      break;
    if (v8 != 183)
      goto LABEL_53;
LABEL_47:
    i += len;
  }
  if (xmlCharInRange(v8, MEMORY[0x24BEDE8D8]) || xmlCharInRange(v8, MEMORY[0x24BEDE8E8]))
    goto LABEL_47;
LABEL_53:
  if (i - v2 >= 0x7FFFFFFF)
    v18 = 0x7FFFFFFF;
  else
    v18 = (_DWORD)i - (_DWORD)v2;
  result = xmlStrndup(v3, v18);
  *(_QWORD *)(a1 + 16) = i;
  return result;
}

void xsltCompileIdKeyPattern(uint64_t a1, xmlChar *str1, int a3, int a4, int a5)
{
  _BYTE *v10;
  _BYTE *j;
  _BYTE *v12;
  _BYTE *v13;
  _BYTE *v14;
  _BYTE *v15;
  unsigned int v16;
  BOOL v17;
  uint64_t v18;
  xmlChar *v20;
  uint64_t i;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  const xmlChar *v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  unsigned __int8 *k;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  xmlChar *v36;
  xmlChar *v37;
  uint64_t m;
  uint64_t v39;
  void (**v40)(xmlChar *);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  if (**(_BYTE **)(a1 + 16) != 40)
  {
    xsltTransformError(0, 0, 0, "xsltCompileIdKeyPattern :(expected\n");
    goto LABEL_11;
  }
  if (!a3)
    goto LABEL_109;
  if (xmlStrEqual(str1, (const xmlChar *)"id"))
  {
    if (!a5)
    {
      v10 = *(_BYTE **)(a1 + 16);
      if (*v10)
        goto LABEL_29;
      while (1)
      {
        v16 = *v10;
        v17 = v16 > 0x20;
        v18 = (1 << v16) & 0x100002600;
        if (v17 || v18 == 0)
          break;
LABEL_29:
        *(_QWORD *)(a1 + 16) = ++v10;
      }
      v20 = xsltScanLiteral(a1);
      if (!*(_DWORD *)(a1 + 48))
      {
        for (i = *(_QWORD *)(a1 + 16) + 1; ; ++i)
        {
          v22 = *(unsigned __int8 *)(i - 1);
          if (v22 > 0x29)
            break;
          if (((1 << v22) & 0x100002600) == 0)
          {
            if (v22 == 41)
            {
              *(_QWORD *)(a1 + 16) = i;
              v23 = *(_QWORD *)(a1 + 56);
              v24 = a1;
              v25 = 6;
              goto LABEL_46;
            }
            break;
          }
          *(_QWORD *)(a1 + 16) = i;
        }
        xsltTransformError(0, 0, 0, "xsltCompileIdKeyPattern :) expected\n");
LABEL_43:
        ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v20);
        goto LABEL_11;
      }
      goto LABEL_44;
    }
    goto LABEL_10;
  }
  if (!xmlStrEqual(str1, (const xmlChar *)"key"))
  {
LABEL_109:
    if (xmlStrEqual(str1, (const xmlChar *)"processing-instruction"))
    {
      j = *(_BYTE **)(a1 + 16);
      if (*j)
        goto LABEL_75;
      while (1)
      {
        v41 = *j;
        if (v41 > 0x29)
          break;
        if (((1 << v41) & 0x100002600) == 0)
        {
          if (v41 == 41)
          {
            v20 = 0;
LABEL_80:
            *(_QWORD *)(a1 + 16) = j + 1;
            v23 = *(_QWORD *)(a1 + 56);
            v24 = a1;
            v25 = 10;
LABEL_46:
            v26 = v20;
            goto LABEL_47;
          }
          break;
        }
LABEL_75:
        *(_QWORD *)(a1 + 16) = ++j;
      }
      v20 = xsltScanLiteral(a1);
      if (*(_DWORD *)(a1 + 48))
        goto LABEL_44;
      for (j = *(_BYTE **)(a1 + 16); ; *(_QWORD *)(a1 + 16) = j)
      {
        v42 = *j;
        if (v42 > 0x29)
          break;
        if (((1 << v42) & 0x100002600) == 0)
        {
          if (v42 == 41)
            goto LABEL_80;
          break;
        }
        ++j;
      }
      xsltTransformError(0, 0, 0, "xsltCompileIdKeyPattern :) expected\n");
      *(_DWORD *)(a1 + 48) = 1;
      goto LABEL_45;
    }
    if (xmlStrEqual(str1, (const xmlChar *)"text"))
    {
      v12 = *(_BYTE **)(a1 + 16);
      if (*v12)
        goto LABEL_88;
      while (1)
      {
        v43 = *v12;
        if (v43 > 0x29)
          break;
        if (((1 << v43) & 0x100002600) == 0)
        {
          if (v43 != 41)
            break;
          *(_QWORD *)(a1 + 16) = v12 + 1;
          v23 = *(_QWORD *)(a1 + 56);
          v24 = a1;
          v25 = 12;
          goto LABEL_99;
        }
LABEL_88:
        *(_QWORD *)(a1 + 16) = ++v12;
      }
    }
    else if (xmlStrEqual(str1, (const xmlChar *)"comment"))
    {
      v13 = *(_BYTE **)(a1 + 16);
      if (*v13)
        goto LABEL_94;
      while (1)
      {
        v44 = *v13;
        if (v44 > 0x29)
          break;
        if (((1 << v44) & 0x100002600) == 0)
        {
          if (v44 != 41)
            break;
          *(_QWORD *)(a1 + 16) = v13 + 1;
          v23 = *(_QWORD *)(a1 + 56);
          v24 = a1;
          v25 = 11;
          goto LABEL_99;
        }
LABEL_94:
        *(_QWORD *)(a1 + 16) = ++v13;
      }
    }
    else
    {
      if (!xmlStrEqual(str1, (const xmlChar *)"node"))
      {
        if (a3)
          xsltTransformError(0, 0, 0, "xsltCompileIdKeyPattern : expecting 'key' or 'id' or node type\n");
        else
          xsltTransformError(0, 0, 0, "xsltCompileIdKeyPattern : node type\n");
        goto LABEL_11;
      }
      v15 = *(_BYTE **)(a1 + 16);
      if (*v15)
        goto LABEL_100;
      while (1)
      {
        v45 = *v15;
        if (v45 > 0x29)
          break;
        if (((1 << v45) & 0x100002600) == 0)
        {
          if (v45 != 41)
            break;
          *(_QWORD *)(a1 + 16) = v15 + 1;
          v23 = *(_QWORD *)(a1 + 56);
          v24 = a1;
          if (a5 == 2)
            v25 = 3;
          else
            v25 = 13;
LABEL_99:
          v26 = 0;
LABEL_47:
          v27 = 0;
LABEL_48:
          xsltCompMatchAdd(v24, v23, v25, v26, v27, a4);
          return;
        }
LABEL_100:
        *(_QWORD *)(a1 + 16) = ++v15;
      }
    }
    xsltTransformError(0, 0, 0, "xsltCompileIdKeyPattern :) expected\n");
LABEL_11:
    *(_DWORD *)(a1 + 48) = 1;
    return;
  }
  if (a5)
  {
LABEL_10:
    xsltTransformError(0, 0, 0, "xsltCompileIdKeyPattern : NodeTest expected\n");
    goto LABEL_11;
  }
  v14 = *(_BYTE **)(a1 + 16);
  if (*v14)
    goto LABEL_49;
  while (1)
  {
    v28 = *v14;
    v17 = v28 > 0x20;
    v29 = (1 << v28) & 0x100002600;
    if (v17 || v29 == 0)
      break;
LABEL_49:
    *(_QWORD *)(a1 + 16) = ++v14;
  }
  v20 = xsltScanLiteral(a1);
  if (!*(_DWORD *)(a1 + 48))
  {
    for (k = (unsigned __int8 *)(*(_QWORD *)(a1 + 16) + 1); ; ++k)
    {
      v32 = *(k - 1);
      if (v32 > 0x2C)
        goto LABEL_71;
      if (((1 << v32) & 0x100002600) == 0)
        break;
      *(_QWORD *)(a1 + 16) = k;
    }
    if (v32 != 44)
    {
LABEL_71:
      xsltTransformError(0, 0, 0, "xsltCompileIdKeyPattern : , expected\n");
      goto LABEL_43;
    }
    do
    {
      *(_QWORD *)(a1 + 16) = k;
      v33 = *k++;
      v34 = (1 << v33) & 0x100002600;
    }
    while (v33 <= 0x20 && v34 != 0);
    v36 = xsltScanLiteral(a1);
    if (!*(_DWORD *)(a1 + 48))
    {
      v37 = v36;
      for (m = *(_QWORD *)(a1 + 16) + 1; ; ++m)
      {
        v39 = *(unsigned __int8 *)(m - 1);
        if (v39 > 0x29)
          break;
        if (((1 << v39) & 0x100002600) == 0)
        {
          if (v39 == 41)
          {
            *(_QWORD *)(a1 + 16) = m;
            v23 = *(_QWORD *)(a1 + 56);
            v24 = a1;
            v25 = 7;
            v26 = v20;
            v27 = (uint64_t)v37;
            goto LABEL_48;
          }
          break;
        }
        *(_QWORD *)(a1 + 16) = m;
      }
      xsltTransformError(0, 0, 0, "xsltCompileIdKeyPattern :) expected\n");
      v40 = (void (**)(xmlChar *))MEMORY[0x24BEDE758];
      ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v20);
      (*v40)(v37);
      goto LABEL_11;
    }
  }
LABEL_44:
  xsltTransformError(0, 0, 0, "xsltCompileIdKeyPattern : Literal expected\n");
LABEL_45:
  ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v20);
}

void xsltCompileStepPattern(uint64_t a1, xmlChar *str1, int a3)
{
  xmlChar *v4;
  uint64_t i;
  unsigned int v7;
  int v9;
  void (**v10)(xmlChar *);
  unsigned __int8 *k;
  unsigned int v12;
  BOOL v13;
  uint64_t v14;
  _BYTE *j;
  uint64_t v17;
  const xmlChar *QNameURI;
  xmlChar *v19;
  uint64_t v20;
  xmlChar *v21;
  uint64_t v22;
  int v23;
  xmlChar *v24;
  _BYTE *m;
  unsigned int v26;
  const xmlChar *v28;
  int v29;
  const xmlChar *v30;
  unsigned int v31;
  unsigned __int8 *v32;
  unsigned int v33;
  unsigned int v34;
  int v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  unsigned int v43;
  _BYTE *v44;
  int v45;
  xmlChar *v46;
  xmlNsPtr v47;
  int matched;
  _BYTE *v49;
  int v50;
  const xmlChar *v51;
  uint64_t v52;
  xmlChar *name;

  v4 = str1;
  name = str1;
  for (i = *(_QWORD *)(a1 + 16) + 1; ; ++i)
  {
    v7 = *(unsigned __int8 *)(i - 1);
    if (v7 > 0x20 || ((1 << v7) & 0x100002600) == 0)
      break;
    *(_QWORD *)(a1 + 16) = i;
  }
  v9 = 0;
  if (!str1 && v7 == 64)
  {
    *(_QWORD *)(a1 + 16) = i;
    v9 = 2;
  }
  v10 = (void (**)(xmlChar *))MEMORY[0x24BEDE758];
  if (str1)
    goto LABEL_27;
LABEL_26:
  v4 = xsltScanNCName(a1);
  name = v4;
  if (v4)
  {
    while (1)
    {
LABEL_27:
      for (j = *(_BYTE **)(a1 + 16); ; *(_QWORD *)(a1 + 16) = j)
      {
        v17 = *j++;
        if (v17 > 0x3A)
          goto LABEL_34;
        if (((1 << v17) & 0x100002600) == 0)
          break;
      }
      if (v17 == 40)
      {
        xsltCompileIdKeyPattern(a1, v4, 0, a3, v9);
        (*v10)(v4);
        name = 0;
        if (*(_DWORD *)(a1 + 48))
          return;
        goto LABEL_44;
      }
      if (v17 != 58)
      {
LABEL_34:
        QNameURI = xsltGetQNameURI(*(xmlNodePtr *)(a1 + 40), &name);
        if (!name)
        {
LABEL_86:
          *(_DWORD *)(a1 + 48) = 1;
          return;
        }
        if (QNameURI)
          v19 = xmlStrdup(QNameURI);
        else
          v19 = 0;
        v20 = *(_QWORD *)(a1 + 56);
        v21 = name;
        v22 = a1;
        if (v9 == 2)
          v23 = 3;
        else
          v23 = 2;
        goto LABEL_41;
      }
      *(_QWORD *)(a1 + 16) = j;
      if (*j != 58)
        break;
      if (v9)
      {
        xsltTransformError(0, 0, 0, "xsltCompileStepPattern : NodeTest expected\n");
        goto LABEL_98;
      }
      *(_QWORD *)(a1 + 16) = j + 1;
      if (xmlStrEqual(v4, (const xmlChar *)"child"))
      {
        v9 = 1;
      }
      else
      {
        if (!xmlStrEqual(v4, (const xmlChar *)"attribute"))
        {
          xsltTransformError(0, 0, 0, "xsltCompileStepPattern : 'child' or 'attribute' expected\n");
LABEL_98:
          v19 = 0;
LABEL_99:
          v24 = 0;
          *(_DWORD *)(a1 + 48) = 1;
          goto LABEL_100;
        }
        v9 = 2;
      }
      (*v10)(v4);
      for (k = *(unsigned __int8 **)(a1 + 16); ; *(_QWORD *)(a1 + 16) = k)
      {
        v12 = *k++;
        v13 = v12 > 0x20;
        v14 = (1 << v12) & 0x100002600;
        if (v13 || v14 == 0)
          break;
      }
      v4 = xsltScanNCName(a1);
      name = v4;
      if (!v4)
        goto LABEL_26;
    }
    v46 = xsltScanNCName(a1);
    name = v46;
    v47 = xmlSearchNs(*(xmlDocPtr *)(a1 + 32), *(xmlNodePtr *)(a1 + 40), v4);
    if (!v47)
    {
      xsltTransformError(0, 0, 0, "xsltCompileStepPattern : no namespace bound to prefix %s\n", (const char *)v4);
      (*v10)(v4);
      goto LABEL_98;
    }
    v19 = xmlStrdup(v47->href);
    (*v10)(v4);
    if (v46)
    {
      v20 = *(_QWORD *)(a1 + 56);
      v22 = a1;
      if (v9 == 2)
        v23 = 3;
      else
        v23 = 2;
      v21 = v46;
LABEL_41:
      if (xsltCompMatchAdd(v22, v20, v23, v21, (uint64_t)v19, a3))
      {
        v24 = 0;
        goto LABEL_100;
      }
      name = 0;
      goto LABEL_44;
    }
    v49 = *(_BYTE **)(a1 + 16);
    if (*v49 != 42)
    {
      xsltTransformError(0, 0, 0, "xsltCompileStepPattern : Name expected\n");
      goto LABEL_99;
    }
    *(_QWORD *)(a1 + 16) = v49 + 1;
    if (v9 == 2)
    {
      v50 = 3;
      v51 = 0;
      v52 = (uint64_t)v19;
    }
    else
    {
      v50 = 8;
      v51 = v19;
      v52 = 0;
    }
    matched = xsltCompMatchAdd(a1, *(_QWORD *)(a1 + 56), v50, v51, v52, a3);
  }
  else
  {
    v44 = *(_BYTE **)(a1 + 16);
    if (*v44 != 42)
    {
      xsltTransformError(0, 0, 0, "xsltCompileStepPattern : Name expected\n");
      goto LABEL_98;
    }
    *(_QWORD *)(a1 + 16) = v44 + 1;
    if (v9 == 2)
      v45 = 3;
    else
      v45 = 9;
    matched = xsltCompMatchAdd(a1, *(_QWORD *)(a1 + 56), v45, 0, 0, a3);
    v19 = 0;
  }
  v24 = 0;
  if (matched)
    goto LABEL_100;
LABEL_44:
  for (m = *(_BYTE **)(a1 + 16); ; *(_QWORD *)(a1 + 16) = m)
  {
    v26 = *m;
    if (v26 > 0x20 || ((1 << v26) & 0x100002600) == 0)
      break;
    ++m;
  }
  if (v26 != 91)
    return;
LABEL_51:
  v28 = m + 1;
  v29 = 1;
  v30 = v28;
  while (2)
  {
    *(_QWORD *)(a1 + 16) = v30;
    while (1)
    {
      v31 = *v30;
      if (v31 > 0x26)
        break;
      if (v31 == 34)
      {
        v32 = (unsigned __int8 *)(v30 + 1);
        do
        {
          *(_QWORD *)(a1 + 16) = v32;
          v34 = *v32++;
          v31 = v34;
        }
        while (v34 && v31 != 34);
        goto LABEL_63;
      }
      if (!*v30)
      {
        xsltTransformError(0, 0, 0, "xsltCompileStepPattern : ']' expected\n");
        goto LABEL_86;
      }
LABEL_64:
      if (v31)
        goto LABEL_73;
    }
    if (v31 == 39)
    {
      v32 = (unsigned __int8 *)(v30 + 1);
      do
      {
        *(_QWORD *)(a1 + 16) = v32;
        v33 = *v32++;
        v31 = v33;
      }
      while (v33 && v31 != 39);
LABEL_63:
      v30 = v32 - 1;
      goto LABEL_64;
    }
    if (v31 == 91)
    {
      ++v29;
LABEL_73:
      ++v30;
      continue;
    }
    break;
  }
  if (v31 != 93)
    goto LABEL_64;
  if (--v29)
    goto LABEL_73;
  if (v30 - v28 >= 0x7FFFFFFF)
    v35 = 0x7FFFFFFF;
  else
    v35 = (_DWORD)v30 - (_DWORD)v28;
  v24 = xmlStrndup(v28, v35);
  if (!xsltCompMatchAdd(a1, *(_QWORD *)(a1 + 56), 14, v24, 0, a3))
  {
    v36 = *(_QWORD *)(a1 + 56);
    v37 = *(_DWORD *)(v36 + 60);
    if (v37 >= 2)
    {
      v38 = *(_QWORD *)(v36 + 88);
      v39 = v38 + 56 * (v37 - 2);
      v40 = *(_OWORD *)(v39 + 8);
      v41 = v38 + 56 * (v37 - 1);
      *(_OWORD *)(v39 + 8) = *(_OWORD *)(v41 + 8);
      *(_OWORD *)(v41 + 8) = v40;
      LODWORD(v38) = *(_DWORD *)v39;
      *(_DWORD *)v39 = *(_DWORD *)v41;
      *(_DWORD *)v41 = v38;
      v42 = *(_OWORD *)(v39 + 24);
      *(_OWORD *)(v39 + 24) = *(_OWORD *)(v41 + 24);
      *(_OWORD *)(v41 + 24) = v42;
      *(_QWORD *)&v42 = *(_QWORD *)(v39 + 40);
      *(_QWORD *)(v39 + 40) = *(_QWORD *)(v41 + 40);
      *(_QWORD *)(v41 + 40) = v42;
      LODWORD(v38) = *(_DWORD *)(v39 + 48);
      *(_DWORD *)(v39 + 48) = *(_DWORD *)(v41 + 48);
      *(_DWORD *)(v41 + 48) = v38;
    }
    m = *(_BYTE **)(a1 + 16);
    if (!*m)
      goto LABEL_82;
    while (1)
    {
      *(_QWORD *)(a1 + 16) = ++m;
LABEL_82:
      v43 = *m;
      if (v43 > 0x20 || ((1 << v43) & 0x100002600) == 0)
      {
        if (v43 != 91)
          return;
        goto LABEL_51;
      }
    }
  }
  v19 = 0;
LABEL_100:
  if (name)
    ((void (*)(void))*v10)();
  if (v19)
    (*v10)(v19);
  if (v24)
    (*v10)(v24);
}

xmlChar *xsltScanLiteral(uint64_t a1)
{
  const xmlChar *i;
  uint64_t v3;
  int v4;
  const xmlChar *j;
  int v6;
  xmlChar *result;
  int v8;
  int len;

  len = 0;
  for (i = (const xmlChar *)(*(_QWORD *)(a1 + 16) + 1); ; ++i)
  {
    v3 = *(i - 1);
    if (v3 > 0x27)
      goto LABEL_31;
    if (((1 << v3) & 0x100002600) == 0)
      break;
    *(_QWORD *)(a1 + 16) = i;
  }
  if (v3 != 34)
  {
    if (v3 == 39)
    {
      *(_QWORD *)(a1 + 16) = i;
      v4 = xmlStringCurrentChar(0, i, &len);
      for (j = i; ; v4 = xmlStringCurrentChar(0, j, &len))
      {
        if (v4 > 255)
        {
          if ((v4 - 0x10000) >= 0x100000
            && v4 >> 11 >= 0x1B
            && (v4 - 57344) >> 1 >= 0xFFF)
          {
            break;
          }
        }
        else if (v4 <= 31)
        {
          if (v4 > 0xD || ((1 << v4) & 0x2600) == 0)
            break;
        }
        else if (v4 == 39)
        {
          goto LABEL_32;
        }
        j += len;
      }
    }
LABEL_31:
    result = 0;
    *(_DWORD *)(a1 + 48) = 1;
    return result;
  }
  *(_QWORD *)(a1 + 16) = i;
  v6 = xmlStringCurrentChar(0, i, &len);
  j = i;
  while (v6 > 255)
  {
    if ((v6 - 0x10000) >= 0x100000
      && v6 >> 11 >= 0x1B
      && (v6 - 57344) >> 1 >= 0xFFF)
    {
      goto LABEL_31;
    }
LABEL_30:
    j += len;
    v6 = xmlStringCurrentChar(0, j, &len);
  }
  if (v6 <= 31)
  {
    if (v6 > 0xD || ((1 << v6) & 0x2600) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
  if (v6 != 34)
    goto LABEL_30;
LABEL_32:
  if (j - i >= 0x7FFFFFFF)
    v8 = 0x7FFFFFFF;
  else
    v8 = (_DWORD)j - (_DWORD)i;
  result = xmlStrndup(i, v8);
  *(_QWORD *)(a1 + 16) = &j[len];
  return result;
}

xsltElemPreCompPtr xsltDocumentComp(xsltStylesheetPtr style, xmlNodePtr inst, xsltTransformFunction function)
{
  xsltElemPreComp *v5;
  xsltElemPreComp *v6;
  const char *v7;
  const xmlChar *v8;
  xmlNs *ns;

  v5 = xsltNewStylePreComp(style, 17);
  v6 = v5;
  if (!v5)
    return v6;
  v5->inst = inst;
  LODWORD(v5[4].free) = 0;
  if (xmlStrEqual(inst->name, (const xmlChar *)"output"))
  {
    v7 = "file";
LABEL_4:
    v8 = xsltEvalStaticAttrValueTemplate(style, inst, (const xmlChar *)v7, 0, (int *)&v6[5].type);
    goto LABEL_7;
  }
  if (!xmlStrEqual(inst->name, (const xmlChar *)"write") && xmlStrEqual(inst->name, (const xmlChar *)"document"))
  {
    ns = inst->ns;
    if (ns)
    {
      if (xmlStrEqual(ns->href, (const xmlChar *)"http://www.w3.org/1999/XSL/Transform"))
      {
        LODWORD(v6[4].free) = 1;
      }
      else if (!xmlStrEqual(inst->ns->href, (const xmlChar *)"http://exslt.org/common"))
      {
        xmlStrEqual(inst->ns->href, (const xmlChar *)"http://www.jclark.com/xt");
      }
    }
    v7 = "href";
    goto LABEL_4;
  }
  v8 = 0;
LABEL_7:
  if (v6[5].type)
    v6[5].next = (xsltElemPreCompPtr)v8;
  return v6;
}

xsltElemPreComp *xsltNewStylePreComp(xsltStylesheet *a1, int a2)
{
  uint64_t v4;
  xsltElemPreComp *v5;
  void (__cdecl *v6)(xsltTransformContextPtr, xmlNodePtr, xmlNodePtr, xsltElemPreCompPtr);

  if (!a1)
    return 0;
  v4 = ((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(328);
  v5 = (xsltElemPreComp *)v4;
  if (v4)
  {
    *(_QWORD *)(v4 + 320) = 0;
    *(_OWORD *)(v4 + 288) = 0u;
    *(_OWORD *)(v4 + 304) = 0u;
    *(_OWORD *)(v4 + 256) = 0u;
    *(_OWORD *)(v4 + 272) = 0u;
    *(_OWORD *)(v4 + 224) = 0u;
    *(_OWORD *)(v4 + 240) = 0u;
    *(_OWORD *)(v4 + 192) = 0u;
    *(_OWORD *)(v4 + 208) = 0u;
    *(_OWORD *)(v4 + 160) = 0u;
    *(_OWORD *)(v4 + 176) = 0u;
    *(_OWORD *)(v4 + 128) = 0u;
    *(_OWORD *)(v4 + 144) = 0u;
    *(_OWORD *)(v4 + 96) = 0u;
    *(_OWORD *)(v4 + 112) = 0u;
    *(_OWORD *)(v4 + 64) = 0u;
    *(_OWORD *)(v4 + 80) = 0u;
    *(_OWORD *)(v4 + 32) = 0u;
    *(_OWORD *)(v4 + 48) = 0u;
    *(_OWORD *)v4 = 0u;
    *(_OWORD *)(v4 + 16) = 0u;
    *(_DWORD *)(v4 + 8) = a2;
    switch(a2)
    {
      case 1:
        v6 = xsltCopy;
        goto LABEL_25;
      case 2:
        v6 = xsltSort;
        goto LABEL_25;
      case 3:
        v6 = xsltText;
        goto LABEL_25;
      case 4:
        v6 = xsltElement;
        goto LABEL_25;
      case 5:
        v6 = xsltAttribute;
        goto LABEL_25;
      case 6:
        v6 = xsltComment;
        goto LABEL_25;
      case 7:
        v6 = xsltProcessingInstruction;
        goto LABEL_25;
      case 8:
        v6 = xsltCopyOf;
        goto LABEL_25;
      case 9:
        v6 = xsltValueOf;
        goto LABEL_25;
      case 10:
        v6 = xsltNumber;
        goto LABEL_25;
      case 11:
        v6 = xsltApplyImports;
        goto LABEL_25;
      case 12:
        v6 = xsltCallTemplate;
        goto LABEL_25;
      case 13:
        v6 = xsltApplyTemplates;
        goto LABEL_25;
      case 14:
        v6 = xsltChoose;
        goto LABEL_25;
      case 15:
        v6 = xsltIf;
        goto LABEL_25;
      case 16:
        v6 = xsltForEach;
        goto LABEL_25;
      case 17:
        v6 = xsltDocumentElem;
LABEL_25:
        *(_QWORD *)(v4 + 16) = v6;
        break;
      case 18:
      case 19:
      case 20:
      case 21:
        break;
      default:
        if (!*(_QWORD *)(v4 + 16))
        {
          xsltTransformError(0, a1, 0, "xsltNewStylePreComp : no function for type %d\n", a2);
          ++a1->errors;
        }
        break;
    }
    v5->next = a1->preComps;
    a1->preComps = v5;
  }
  else
  {
    xsltTransformError(0, a1, 0, "xsltNewStylePreComp : malloc failed\n");
    ++a1->errors;
  }
  return v5;
}

void xsltFreeStylePreComps(xsltStylesheetPtr style)
{
  xsltElemPreCompPtr preComps;
  void (**v2)(void);
  xsltElemPreCompPtr v3;
  void (**p_free)(void);
  xsltElemPreCompPtr next;
  xmlXPathCompExpr *inst;
  xsltCompMatch *v7;
  xsltCompMatch *func;

  if (style)
  {
    preComps = style->preComps;
    if (preComps)
    {
      v2 = (void (**)(void))MEMORY[0x24BEDE758];
      do
      {
        v3 = preComps;
        preComps = preComps->next;
        if (v3->type == XSLT_FUNC_EXTENSION)
        {
          p_free = (void (**)(void))&v3->free;
        }
        else
        {
          next = v3[2].next;
          if (next)
            xsltFreeLocale(next);
          inst = (xmlXPathCompExpr *)v3[7].inst;
          if (inst)
            xmlXPathFreeCompExpr(inst);
          v7 = *(xsltCompMatch **)&v3[7].type;
          if (v7)
            xsltFreeCompMatchList(v7);
          func = (xsltCompMatch *)v3[7].func;
          if (func)
            xsltFreeCompMatchList(func);
          if (v3[7].free)
            (*v2)();
          p_free = v2;
        }
        ((void (*)(xsltElemPreCompPtr))*p_free)(v3);
      }
      while (preComps);
    }
  }
}

void xsltStylePreCompute(xsltStylesheetPtr style, xmlNodePtr inst)
{
  xmlNs *ns;
  xsltElemPreComp *v5;
  xsltElemPreComp *v6;
  const xmlChar *CNsProp;
  xmlXPathCompExprPtr v8;
  xsltElemPreCompPtr v9;
  _xmlNode *parent;
  xmlNs *v11;
  xmlNs *v12;
  void *psvi;
  xmlNsPtr *NsList;
  int v15;
  uint64_t v16;
  _xmlNode *v17;
  xsltTransformFunction v18;

  if (!inst || inst->type != XML_ELEMENT_NODE || inst->psvi)
    return;
  ns = inst->ns;
  if (ns && xmlStrEqual(ns->href, (const xmlChar *)"http://www.w3.org/1999/XSL/Transform"))
  {
    if (xmlStrEqual(inst->name, (const xmlChar *)"apply-templates"))
    {
      xsltCheckInstructionElement(style, inst);
      if (style)
      {
        if (inst->type == XML_ELEMENT_NODE)
        {
          v5 = xsltNewStylePreComp(style, 13);
          if (v5)
          {
            v6 = v5;
            inst->psvi = v5;
            v5->inst = inst;
            xsltGetQNameProperty(style, inst, (xmlChar *)"mode", 0, 0, (const xmlChar **)&v5[4], (xmlChar **)&v5[3].free);
            CNsProp = xsltGetCNsProp(style, inst, (const xmlChar *)"select", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
            v6[4].inst = (xmlNodePtr)CNsProp;
            if (CNsProp)
            {
              v8 = xsltXPathCompile(style, CNsProp);
              v6[7].inst = (xmlNodePtr)v8;
              if (!v8)
              {
                xsltTransformError(0, style, inst, "XSLT-apply-templates: could not compile select expression '%s'\n", (const char *)v6[4].inst);
                ++style->errors;
              }
            }
          }
        }
      }
      goto LABEL_65;
    }
    if (xmlStrEqual(inst->name, (const xmlChar *)"with-param"))
    {
      xsltCheckParentElement(style, inst, (xmlChar *)"apply-templates", (const xmlChar *)"call-template");
      xsltWithParamComp(style, (uint64_t)inst);
      goto LABEL_65;
    }
    if (xmlStrEqual(inst->name, (const xmlChar *)"value-of"))
    {
      xsltCheckInstructionElement(style, inst);
      xsltValueOfComp(style, (uint64_t)inst);
      goto LABEL_65;
    }
    if (xmlStrEqual(inst->name, (const xmlChar *)"copy"))
    {
      xsltCheckInstructionElement(style, inst);
      xsltCopyComp(style, (uint64_t)inst);
      goto LABEL_65;
    }
    if (xmlStrEqual(inst->name, (const xmlChar *)"copy-of"))
    {
      xsltCheckInstructionElement(style, inst);
      xsltCopyOfComp(style, (uint64_t)inst);
      goto LABEL_65;
    }
    if (xmlStrEqual(inst->name, (const xmlChar *)"if"))
    {
      xsltCheckInstructionElement(style, inst);
      xsltIfComp(style, (uint64_t)inst);
      goto LABEL_65;
    }
    if (xmlStrEqual(inst->name, (const xmlChar *)"when"))
    {
      xsltCheckParentElement(style, inst, (xmlChar *)"choose", 0);
      xsltWhenComp(style, (uint64_t)inst);
      goto LABEL_65;
    }
    if (xmlStrEqual(inst->name, (const xmlChar *)"choose"))
    {
      xsltCheckInstructionElement(style, inst);
      xsltChooseComp(style, (uint64_t)inst);
      goto LABEL_65;
    }
    if (xmlStrEqual(inst->name, (const xmlChar *)"for-each"))
    {
      xsltCheckInstructionElement(style, inst);
      xsltForEachComp(style, (uint64_t)inst);
      goto LABEL_65;
    }
    if (xmlStrEqual(inst->name, (const xmlChar *)"apply-imports"))
    {
      xsltCheckInstructionElement(style, inst);
      xsltApplyImportsComp(style, (uint64_t)inst);
      goto LABEL_65;
    }
    if (xmlStrEqual(inst->name, (const xmlChar *)"attribute"))
    {
      parent = inst->parent;
      if (!parent
        || parent->type != XML_ELEMENT_NODE
        || (v11 = parent->ns) == 0
        || (v12 = inst->ns, v11 != v12) && !xmlStrEqual(v11->href, v12->href)
        || !xmlStrEqual(parent->name, (const xmlChar *)"attribute-set"))
      {
        xsltCheckInstructionElement(style, inst);
      }
      xsltAttributeComp(style, (uint64_t)inst);
      goto LABEL_65;
    }
    if (xmlStrEqual(inst->name, (const xmlChar *)"element"))
    {
      xsltCheckInstructionElement(style, inst);
      xsltElementComp(style, (uint64_t)inst);
      goto LABEL_65;
    }
    if (xmlStrEqual(inst->name, (const xmlChar *)"text"))
    {
      xsltCheckInstructionElement(style, inst);
      xsltTextComp(style, (uint64_t)inst);
      goto LABEL_65;
    }
    if (xmlStrEqual(inst->name, (const xmlChar *)"sort"))
    {
      xsltCheckParentElement(style, inst, (xmlChar *)"apply-templates", (const xmlChar *)"for-each");
      xsltSortComp(style, (uint64_t)inst);
      goto LABEL_65;
    }
    if (xmlStrEqual(inst->name, (const xmlChar *)"comment"))
    {
      xsltCheckInstructionElement(style, inst);
      xsltCommentComp(style, (uint64_t)inst);
      goto LABEL_65;
    }
    if (xmlStrEqual(inst->name, (const xmlChar *)"number"))
    {
      xsltCheckInstructionElement(style, inst);
      xsltNumberComp(style, (uint64_t)inst);
      goto LABEL_65;
    }
    if (xmlStrEqual(inst->name, (const xmlChar *)"processing-instruction"))
    {
      xsltCheckInstructionElement(style, inst);
      xsltProcessingInstructionComp(style, (uint64_t)inst);
      goto LABEL_65;
    }
    if (xmlStrEqual(inst->name, (const xmlChar *)"call-template"))
    {
      xsltCheckInstructionElement(style, inst);
      xsltCallTemplateComp(style, (uint64_t)inst);
      goto LABEL_65;
    }
    if (xmlStrEqual(inst->name, (const xmlChar *)"param"))
    {
      if (!xsltCheckTopLevelElement(style, inst, 0))
        xsltCheckInstructionElement(style, inst);
      xsltParamComp(style, (uint64_t)inst);
      goto LABEL_65;
    }
    if (xmlStrEqual(inst->name, (const xmlChar *)"variable"))
    {
      if (!xsltCheckTopLevelElement(style, inst, 0))
        xsltCheckInstructionElement(style, inst);
      xsltVariableComp(style, (uint64_t)inst);
      goto LABEL_65;
    }
    if (xmlStrEqual(inst->name, (const xmlChar *)"otherwise"))
    {
      xsltCheckParentElement(style, inst, (xmlChar *)"choose", 0);
      goto LABEL_74;
    }
    if (xmlStrEqual(inst->name, (const xmlChar *)"template")
      || xmlStrEqual(inst->name, (const xmlChar *)"output")
      || xmlStrEqual(inst->name, (const xmlChar *)"preserve-space")
      || xmlStrEqual(inst->name, (const xmlChar *)"strip-space"))
    {
LABEL_79:
      xsltCheckTopLevelElement(style, inst, 1);
      return;
    }
    if (!xmlStrEqual(inst->name, (const xmlChar *)"stylesheet")
      && !xmlStrEqual(inst->name, (const xmlChar *)"transform"))
    {
      if (!xmlStrEqual(inst->name, (const xmlChar *)"key"))
      {
        if (xmlStrEqual(inst->name, (const xmlChar *)"message"))
          goto LABEL_74;
        if (!xmlStrEqual(inst->name, (const xmlChar *)"attribute-set")
          && !xmlStrEqual(inst->name, (const xmlChar *)"namespace-alias")
          && !xmlStrEqual(inst->name, (const xmlChar *)"include")
          && !xmlStrEqual(inst->name, (const xmlChar *)"import")
          && !xmlStrEqual(inst->name, (const xmlChar *)"decimal-format"))
        {
          if (!xmlStrEqual(inst->name, (const xmlChar *)"fallback"))
          {
            if (xmlStrEqual(inst->name, (const xmlChar *)"document"))
            {
              xsltCheckInstructionElement(style, inst);
              psvi = xsltDocumentComp(style, inst, v18);
              inst->psvi = psvi;
              if (!psvi)
                return;
              goto LABEL_66;
            }
            if (style)
            {
              if (!style->forwards_compatible)
              {
                xsltTransformError(0, style, inst, "xsltStylePreCompute: unknown xsl:%s\n", (const char *)inst->name);
                ++style->warnings;
              }
            }
            else
            {
              xsltTransformError(0, 0, inst, "xsltStylePreCompute: unknown xsl:%s\n", (const char *)inst->name);
            }
LABEL_65:
            psvi = inst->psvi;
            if (!psvi)
              return;
LABEL_66:
            NsList = xmlGetNsList(inst->doc, inst);
            *((_QWORD *)psvi + 39) = NsList;
            if (NsList)
            {
              v15 = -1;
              do
              {
                v16 = (uint64_t)*NsList++;
                ++v15;
              }
              while (v16);
            }
            else
            {
              v15 = 0;
            }
            *((_DWORD *)psvi + 80) = v15;
            return;
          }
LABEL_74:
          xsltCheckInstructionElement(style, inst);
          return;
        }
      }
      goto LABEL_79;
    }
    v17 = inst->parent;
    if (!v17 || v17->type != XML_DOCUMENT_NODE)
    {
      xsltTransformError(0, style, inst, "element %s only allowed only as root element\n", (const char *)inst->name);
      ++style->errors;
    }
  }
  else
  {
    v9 = xsltPreComputeExtModuleElement(style, inst);
    inst->psvi = v9;
    if (!v9)
      inst->psvi = (void *)xsltExtMarker;
  }
}

void xsltCheckInstructionElement(xsltStylesheetPtr style, xmlNodePtr node)
{
  _xmlNode *parent;
  xmlHashTablePtr extInfos;
  xmlNs *ns;
  xmlNs *v7;
  xmlNs *v8;

  if (style && node->ns && !style->literal_result)
  {
    parent = node->parent;
    if (parent)
    {
      extInfos = style->extInfos;
      do
      {
        if (parent->type == XML_DOCUMENT_NODE)
          break;
        ns = parent->ns;
        v7 = node->ns;
        if ((ns == v7 || ns && xmlStrEqual(ns->href, v7->href))
          && (xmlStrEqual(parent->name, (const xmlChar *)"template")
           || xmlStrEqual(parent->name, (const xmlChar *)"param")
           || xmlStrEqual(parent->name, (const xmlChar *)"attribute")
           || xmlStrEqual(parent->name, (const xmlChar *)"variable")))
        {
          return;
        }
        if (extInfos)
        {
          v8 = parent->ns;
          if (v8)
          {
            if (xmlHashLookup(style->extInfos, v8->href))
              return;
          }
        }
        parent = parent->parent;
      }
      while (parent);
      xsltTransformError(0, style, node, "element %s only allowed within a template, variable or param\n");
    }
    else
    {
      xsltTransformError(0, style, node, "internal problem: element has no parent\n");
    }
    ++style->errors;
  }
}

void xsltCheckParentElement(xsltStylesheetPtr style, xmlNodePtr node, xmlChar *str2, const xmlChar *a4)
{
  xmlNs *ns;
  _xmlNode *parent;
  xmlNs *v10;
  xmlNs *v11;

  if (style)
  {
    ns = node->ns;
    if (ns)
    {
      if (!style->literal_result)
      {
        parent = node->parent;
        if (!parent)
        {
          xsltTransformError(0, style, node, "internal problem: element has no parent\n");
LABEL_17:
          ++style->errors;
          return;
        }
        v10 = parent->ns;
        if (v10 != ns && (!v10 || !xmlStrEqual(v10->href, ns->href))
          || !xmlStrEqual(parent->name, str2) && !xmlStrEqual(parent->name, a4))
        {
          if (style->extInfos)
          {
            while (parent->type != XML_DOCUMENT_NODE)
            {
              v11 = parent->ns;
              if (v11 && xmlHashLookup(style->extInfos, v11->href))
                return;
              parent = parent->parent;
              if (!parent)
                break;
            }
          }
          xsltTransformError(0, style, node, "element %s is not allowed within that context\n");
          goto LABEL_17;
        }
      }
    }
  }
}

void xsltWithParamComp(xsltStylesheet *a1, uint64_t a2)
{
  xsltElemPreComp *v4;
  xsltElemPreComp *v5;
  const xmlChar *CNsProp;
  xmlXPathCompExprPtr v7;

  if (a1)
  {
    if (*(_DWORD *)(a2 + 8) == 1)
    {
      v4 = xsltNewStylePreComp(a1, 18);
      if (v4)
      {
        v5 = v4;
        *(_QWORD *)(a2 + 104) = v4;
        v4->inst = (xmlNodePtr)a2;
        xsltGetQNameProperty(a1, (xmlNodePtr)a2, (xmlChar *)"name", 1, &v4[3].type, (const xmlChar **)&v4[3].func, (xmlChar **)&v4[3]);
        if (v5[3].func)
          LODWORD(v5[3].inst) = 1;
        CNsProp = xsltGetCNsProp(a1, (xmlNodePtr)a2, (const xmlChar *)"select", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
        v5[4].inst = (xmlNodePtr)CNsProp;
        if (CNsProp)
        {
          v7 = xsltXPathCompile(a1, CNsProp);
          v5[7].inst = (xmlNodePtr)v7;
          if (!v7)
          {
            xsltTransformError(0, a1, (xmlNodePtr)a2, "XSLT-with-param: Failed to compile select expression '%s'\n", (const char *)v5[4].inst);
            ++a1->errors;
          }
          if (*(_QWORD *)(a2 + 24))
          {
            xsltTransformError(0, a1, (xmlNodePtr)a2, "XSLT-with-param: The content should be empty since the attribute select is present.\n");
            ++a1->warnings;
          }
        }
      }
    }
  }
}

void xsltValueOfComp(xsltStylesheet *a1, uint64_t a2)
{
  xsltElemPreComp *v4;
  xsltElemPreComp *v5;
  const xmlChar *CNsProp;
  const xmlChar *v7;
  const xmlChar *v8;
  xmlXPathCompExprPtr v9;

  if (a1)
  {
    if (*(_DWORD *)(a2 + 8) == 1)
    {
      v4 = xsltNewStylePreComp(a1, 9);
      if (v4)
      {
        v5 = v4;
        *(_QWORD *)(a2 + 104) = v4;
        v4->inst = (xmlNodePtr)a2;
        CNsProp = xsltGetCNsProp(a1, (xmlNodePtr)a2, (const xmlChar *)"disable-output-escaping", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
        if (CNsProp)
        {
          v7 = CNsProp;
          if (xmlStrEqual(CNsProp, (const xmlChar *)"yes"))
          {
            HIDWORD(v5[2].free) = 1;
          }
          else if (!xmlStrEqual(v7, (const xmlChar *)"no"))
          {
            xsltTransformError(0, a1, (xmlNodePtr)a2, "xsl:value-of : disable-output-escaping allows only yes or no\n");
            ++a1->warnings;
          }
        }
        v8 = xsltGetCNsProp(a1, (xmlNodePtr)a2, (const xmlChar *)"select", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
        v5[4].inst = (xmlNodePtr)v8;
        if (v8)
        {
          v9 = xsltXPathCompile(a1, v8);
          v5[7].inst = (xmlNodePtr)v9;
          if (v9)
            return;
          xsltTransformError(0, a1, (xmlNodePtr)a2, "xsl:value-of : could not compile select expression '%s'\n");
        }
        else
        {
          xsltTransformError(0, a1, (xmlNodePtr)a2, "xsl:value-of : select is missing\n");
        }
        ++a1->errors;
      }
    }
  }
}

xsltStylesheet *xsltCopyComp(xsltStylesheet *result, uint64_t a2)
{
  xsltStylesheet *v3;
  xsltStylesheet *v4;

  if (result && *(_DWORD *)(a2 + 8) == 1)
  {
    v3 = result;
    result = (xsltStylesheet *)xsltNewStylePreComp(result, 1);
    if (result)
    {
      v4 = result;
      *(_QWORD *)(a2 + 104) = result;
      result->docList = (xsltDocumentPtr)a2;
      result = (xsltStylesheet *)xsltGetCNsProp(v3, (xmlNodePtr)a2, (const xmlChar *)"use-attribute-sets", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
      v4->elemMatch = (_xsltCompMatch *)result;
      LODWORD(v4->attrMatch) = result != 0;
    }
  }
  return result;
}

void xsltCopyOfComp(xsltStylesheet *a1, uint64_t a2)
{
  xsltElemPreComp *v4;
  xsltElemPreComp *v5;
  const xmlChar *CNsProp;
  xmlXPathCompExprPtr v7;

  if (a1)
  {
    if (*(_DWORD *)(a2 + 8) == 1)
    {
      v4 = xsltNewStylePreComp(a1, 8);
      if (v4)
      {
        v5 = v4;
        *(_QWORD *)(a2 + 104) = v4;
        v4->inst = (xmlNodePtr)a2;
        CNsProp = xsltGetCNsProp(a1, (xmlNodePtr)a2, (const xmlChar *)"select", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
        v5[4].inst = (xmlNodePtr)CNsProp;
        if (CNsProp)
        {
          v7 = xsltXPathCompile(a1, CNsProp);
          v5[7].inst = (xmlNodePtr)v7;
          if (v7)
            return;
          xsltTransformError(0, a1, (xmlNodePtr)a2, "xsl:copy-of : could not compile select expression '%s'\n");
        }
        else
        {
          xsltTransformError(0, a1, (xmlNodePtr)a2, "xsl:copy-of : select is missing\n");
        }
        ++a1->errors;
      }
    }
  }
}

void xsltIfComp(xsltStylesheet *a1, uint64_t a2)
{
  xsltElemPreComp *v4;
  xsltElemPreComp *v5;
  const xmlChar *CNsProp;
  xmlXPathCompExprPtr v7;

  if (a1)
  {
    if (*(_DWORD *)(a2 + 8) == 1)
    {
      v4 = xsltNewStylePreComp(a1, 15);
      if (v4)
      {
        v5 = v4;
        *(_QWORD *)(a2 + 104) = v4;
        v4->inst = (xmlNodePtr)a2;
        CNsProp = xsltGetCNsProp(a1, (xmlNodePtr)a2, (const xmlChar *)"test", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
        *(_QWORD *)&v5[4].type = CNsProp;
        if (CNsProp)
        {
          v7 = xsltXPathCompile(a1, CNsProp);
          v5[7].inst = (xmlNodePtr)v7;
          if (v7)
            return;
          xsltTransformError(0, a1, (xmlNodePtr)a2, "xsl:if : could not compile test expression '%s'\n");
        }
        else
        {
          xsltTransformError(0, a1, (xmlNodePtr)a2, "xsl:if : test is not defined\n");
        }
        ++a1->errors;
      }
    }
  }
}

void xsltWhenComp(xsltStylesheet *a1, uint64_t a2)
{
  xsltElemPreComp *v4;
  xsltElemPreComp *v5;
  const xmlChar *CNsProp;
  xmlXPathCompExprPtr v7;

  if (a1)
  {
    if (*(_DWORD *)(a2 + 8) == 1)
    {
      v4 = xsltNewStylePreComp(a1, 21);
      if (v4)
      {
        v5 = v4;
        *(_QWORD *)(a2 + 104) = v4;
        v4->inst = (xmlNodePtr)a2;
        CNsProp = xsltGetCNsProp(a1, (xmlNodePtr)a2, (const xmlChar *)"test", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
        *(_QWORD *)&v5[4].type = CNsProp;
        if (CNsProp)
        {
          v7 = xsltXPathCompile(a1, CNsProp);
          v5[7].inst = (xmlNodePtr)v7;
          if (v7)
            return;
          xsltTransformError(0, a1, (xmlNodePtr)a2, "xsl:when : could not compile test expression '%s'\n");
        }
        else
        {
          xsltTransformError(0, a1, (xmlNodePtr)a2, "xsl:when : test is not defined\n");
        }
        ++a1->errors;
      }
    }
  }
}

xsltStylesheet *xsltChooseComp(xsltStylesheet *result, uint64_t a2)
{
  if (result && *(_DWORD *)(a2 + 8) == 1)
  {
    result = (xsltStylesheet *)xsltNewStylePreComp(result, 14);
    if (result)
    {
      *(_QWORD *)(a2 + 104) = result;
      result->docList = (xsltDocumentPtr)a2;
    }
  }
  return result;
}

void xsltForEachComp(xsltStylesheet *a1, uint64_t a2)
{
  xsltElemPreComp *v4;
  xsltElemPreComp *v5;
  const xmlChar *CNsProp;
  xmlXPathCompExprPtr v7;

  if (a1)
  {
    if (*(_DWORD *)(a2 + 8) == 1)
    {
      v4 = xsltNewStylePreComp(a1, 16);
      if (v4)
      {
        v5 = v4;
        *(_QWORD *)(a2 + 104) = v4;
        v4->inst = (xmlNodePtr)a2;
        CNsProp = xsltGetCNsProp(a1, (xmlNodePtr)a2, (const xmlChar *)"select", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
        v5[4].inst = (xmlNodePtr)CNsProp;
        if (CNsProp)
        {
          v7 = xsltXPathCompile(a1, CNsProp);
          v5[7].inst = (xmlNodePtr)v7;
          if (v7)
            return;
          xsltTransformError(0, a1, (xmlNodePtr)a2, "xsl:for-each : could not compile select expression '%s'\n");
        }
        else
        {
          xsltTransformError(0, a1, (xmlNodePtr)a2, "xsl:for-each : select is missing\n");
        }
        ++a1->errors;
      }
    }
  }
}

xsltStylesheet *xsltApplyImportsComp(xsltStylesheet *result, uint64_t a2)
{
  if (result && *(_DWORD *)(a2 + 8) == 1)
  {
    result = (xsltStylesheet *)xsltNewStylePreComp(result, 11);
    if (result)
    {
      *(_QWORD *)(a2 + 104) = result;
      result->docList = (xsltDocumentPtr)a2;
    }
  }
  return result;
}

void xsltAttributeComp(xsltStylesheet *a1, uint64_t a2)
{
  xsltElemPreComp *v4;
  xsltElemPreComp *v5;
  const xmlChar *next;
  const char *v7;
  xmlNsPtr v8;
  xsltElemPreCompPtr v9;
  xmlChar *prefix;

  if (a1)
  {
    if (*(_DWORD *)(a2 + 8) == 1)
    {
      v4 = xsltNewStylePreComp(a1, 5);
      if (v4)
      {
        v5 = v4;
        *(_QWORD *)(a2 + 104) = v4;
        v4->inst = (xmlNodePtr)a2;
        v4[3].next = (xsltElemPreCompPtr)xsltEvalStaticAttrValueTemplate(a1, (xmlNodePtr)a2, (const xmlChar *)"name", 0, (int *)&v4[3].type);
        if (!v5[3].type)
        {
          v7 = "XSLT-attribute: The attribute 'name' is missing.\n";
          goto LABEL_9;
        }
        v5[3].func = (xsltTransformFunction)xsltEvalStaticAttrValueTemplate(a1, (xmlNodePtr)a2, (const xmlChar *)"namespace", 0, (int *)&v5[3].inst);
        next = (const xmlChar *)v5[3].next;
        if (!next)
          return;
        if (xmlValidateQName(next, 0))
        {
          v9 = v5[3].next;
          v7 = "xsl:attribute: The value '%s' of the attribute 'name' is not a valid QName.\n";
LABEL_9:
          xsltTransformError(0, a1, (xmlNodePtr)a2, v7, v9);
LABEL_10:
          ++a1->errors;
          return;
        }
        if (xmlStrEqual((const xmlChar *)v5[3].next, (const xmlChar *)"xmlns"))
        {
          v7 = "xsl:attribute: The attribute name 'xmlns' is not allowed.\n";
          goto LABEL_9;
        }
        prefix = 0;
        xsltSplitQName(a1->dict, (const xmlChar *)v5[3].next, (const xmlChar **)&prefix);
        if (prefix && !LODWORD(v5[3].inst))
        {
          v8 = xmlSearchNs(*(xmlDocPtr *)(a2 + 64), (xmlNodePtr)a2, prefix);
          if (v8)
          {
            v5[3].func = (xsltTransformFunction)xmlDictLookup(a1->dict, v8->href, -1);
            LODWORD(v5[3].inst) = 1;
            return;
          }
          xsltTransformError(0, a1, (xmlNodePtr)a2, "xsl:attribute: The prefixed QName '%s' has no namespace binding in scope in the stylesheet; this is an error"
            ", since the namespace was not specified by the instruction itself.\n");
          goto LABEL_10;
        }
      }
    }
  }
}

void xsltElementComp(xsltStylesheet *a1, uint64_t a2)
{
  xsltElemPreComp *v4;
  xsltElemPreComp *v5;
  xsltStyleType *p_type;
  const xmlChar *next;
  xmlNsPtr v8;
  xmlChar *prefix;

  if (a1)
  {
    if (*(_DWORD *)(a2 + 8) == 1)
    {
      v4 = xsltNewStylePreComp(a1, 4);
      if (v4)
      {
        v5 = v4;
        *(_QWORD *)(a2 + 104) = v4;
        v4->inst = (xmlNodePtr)a2;
        p_type = &v4[3].type;
        v4[3].next = (xsltElemPreCompPtr)xsltEvalStaticAttrValueTemplate(a1, (xmlNodePtr)a2, (const xmlChar *)"name", 0, (int *)&v4[3].type);
        if (v5[3].type)
        {
          v5[3].func = (xsltTransformFunction)xsltEvalStaticAttrValueTemplate(a1, (xmlNodePtr)a2, (const xmlChar *)"namespace", 0, (int *)&v5[3].inst);
          next = (const xmlChar *)v5[3].next;
          if (next)
          {
            if (!xmlValidateQName(next, 0))
            {
              prefix = 0;
              xsltSplitQName(a1->dict, (const xmlChar *)v5[3].next, (const xmlChar **)&prefix);
              if (!LODWORD(v5[3].inst))
              {
                v8 = xmlSearchNs(*(xmlDocPtr *)(a2 + 64), (xmlNodePtr)a2, prefix);
                if (v8)
                {
                  v5[3].func = (xsltTransformFunction)xmlDictLookup(a1->dict, v8->href, -1);
                  LODWORD(v5[3].inst) = 1;
                }
                else
                {
                  if (!prefix)
                    goto LABEL_8;
                  xsltTransformError(0, a1, (xmlNodePtr)a2, "xsl:element: The prefixed QName '%s' has no namespace binding in scope in the stylesheet; this is an"
                    " error, since the namespace was not specified by the instruction itself.\n",
                    (const char *)v5[3].next);
                  ++a1->errors;
                }
              }
              if (prefix)
              {
                if (!xmlStrncasecmp(prefix, (const xmlChar *)"xml", 3))
                  *p_type = 0;
              }
              goto LABEL_8;
            }
            xsltTransformError(0, a1, (xmlNodePtr)a2, "xsl:element: The value '%s' of the attribute 'name' is not a valid QName.\n", (const char *)v5[3].next);
            ++a1->errors;
          }
LABEL_8:
          v5[2].inst = (xmlNodePtr)xsltEvalStaticAttrValueTemplate(a1, (xmlNodePtr)a2, (const xmlChar *)"use-attribute-sets", 0, (int *)&v5[2].free);
          return;
        }
        xsltTransformError(0, a1, (xmlNodePtr)a2, "xsl:element: The attribute 'name' is missing.\n");
        ++a1->errors;
      }
    }
  }
}

void xsltTextComp(xsltStylesheet *a1, uint64_t a2)
{
  xsltElemPreComp *v4;
  xsltElemPreComp *v5;
  const xmlChar *CNsProp;
  const xmlChar *v7;

  if (a1)
  {
    if (*(_DWORD *)(a2 + 8) == 1)
    {
      v4 = xsltNewStylePreComp(a1, 3);
      if (v4)
      {
        v5 = v4;
        *(_QWORD *)(a2 + 104) = v4;
        v4->inst = (xmlNodePtr)a2;
        HIDWORD(v4[2].free) = 0;
        CNsProp = xsltGetCNsProp(a1, (xmlNodePtr)a2, (const xmlChar *)"disable-output-escaping", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
        if (CNsProp)
        {
          v7 = CNsProp;
          if (xmlStrEqual(CNsProp, (const xmlChar *)"yes"))
          {
            HIDWORD(v5[2].free) = 1;
          }
          else if (!xmlStrEqual(v7, (const xmlChar *)"no"))
          {
            xsltTransformError(0, a1, (xmlNodePtr)a2, "xsl:text: disable-output-escaping allows only yes or no\n");
            ++a1->warnings;
          }
        }
      }
    }
  }
}

void xsltSortComp(xsltStylesheet *a1, uint64_t a2)
{
  xsltElemPreComp *v4;
  xsltElemPreComp *v5;
  const xmlChar *v6;
  const xmlChar *v7;
  const xmlChar *v8;
  const xmlChar *v9;
  const xmlChar *CNsProp;
  xmlXPathCompExprPtr v11;

  if (a1)
  {
    if (*(_DWORD *)(a2 + 8) == 1)
    {
      v4 = xsltNewStylePreComp(a1, 2);
      if (v4)
      {
        v5 = v4;
        *(_QWORD *)(a2 + 104) = v4;
        v4->inst = (xmlNodePtr)a2;
        v6 = xsltEvalStaticAttrValueTemplate(a1, (xmlNodePtr)a2, (const xmlChar *)"data-type", 0, (int *)&v4[1]);
        v5->free = (xsltElemPreCompDeallocator)v6;
        if (v6)
        {
          if (xmlStrEqual(v6, (const xmlChar *)"text"))
          {
            HIDWORD(v5[1].next) = 0;
          }
          else if (xmlStrEqual((const xmlChar *)v5->free, (const xmlChar *)"number"))
          {
            HIDWORD(v5[1].next) = 1;
          }
          else
          {
            xsltTransformError(0, a1, (xmlNodePtr)a2, "xsltSortComp: no support for data-type = %s\n", (const char *)v5->free);
            HIDWORD(v5[1].next) = 0;
            ++a1->warnings;
          }
        }
        v7 = xsltEvalStaticAttrValueTemplate(a1, (xmlNodePtr)a2, (const xmlChar *)"order", 0, (int *)&v5[1].func);
        *(_QWORD *)&v5[1].type = v7;
        if (v7)
        {
          if (xmlStrEqual(v7, (const xmlChar *)"ascending"))
          {
            HIDWORD(v5[1].func) = 0;
          }
          else if (xmlStrEqual(*(const xmlChar **)&v5[1].type, (const xmlChar *)"descending"))
          {
            HIDWORD(v5[1].func) = 1;
          }
          else
          {
            xsltTransformError(0, a1, (xmlNodePtr)a2, "xsltSortComp: invalid value %s for order\n", *(const char **)&v5[1].type);
            HIDWORD(v5[1].func) = 0;
            ++a1->warnings;
          }
        }
        v8 = xsltEvalStaticAttrValueTemplate(a1, (xmlNodePtr)a2, (const xmlChar *)"case-order", 0, (int *)&v5[2].free);
        *(_QWORD *)&v5[2].type = v8;
        if (v8)
        {
          if (xmlStrEqual(v8, (const xmlChar *)"upper-first"))
          {
            LODWORD(v5[2].func) = 0;
          }
          else if (xmlStrEqual(*(const xmlChar **)&v5[2].type, (const xmlChar *)"lower-first"))
          {
            LODWORD(v5[2].func) = 1;
          }
          else
          {
            xsltTransformError(0, a1, (xmlNodePtr)a2, "xsltSortComp: invalid value %s for order\n", *(const char **)&v5[1].type);
            LODWORD(v5[2].func) = 0;
            ++a1->warnings;
          }
        }
        v9 = xsltEvalStaticAttrValueTemplate(a1, (xmlNodePtr)a2, (const xmlChar *)"lang", 0, (int *)&v5[1].free);
        v5[1].inst = (xmlNodePtr)v9;
        if (v9)
          v9 = (const xmlChar *)xsltNewLocale(v9);
        v5[2].next = (xsltElemPreCompPtr)v9;
        CNsProp = xsltGetCNsProp(a1, (xmlNodePtr)a2, (const xmlChar *)"select", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
        v5[4].inst = (xmlNodePtr)CNsProp;
        if (!CNsProp)
        {
          CNsProp = xmlDictLookup(a1->dict, (const xmlChar *)".", 1);
          v5[4].inst = (xmlNodePtr)CNsProp;
        }
        v11 = xsltXPathCompile(a1, CNsProp);
        v5[7].inst = (xmlNodePtr)v11;
        if (!v11)
        {
          xsltTransformError(0, a1, (xmlNodePtr)a2, "xsltSortComp: could not compile select expression '%s'\n", (const char *)v5[4].inst);
          ++a1->errors;
        }
        if (*(_QWORD *)(a2 + 24))
        {
          xsltTransformError(0, a1, (xmlNodePtr)a2, "xsl:sort : is not empty\n");
          ++a1->errors;
        }
      }
    }
  }
}

xsltStylesheet *xsltCommentComp(xsltStylesheet *result, uint64_t a2)
{
  if (result && *(_DWORD *)(a2 + 8) == 1)
  {
    result = (xsltStylesheet *)xsltNewStylePreComp(result, 6);
    if (result)
    {
      *(_QWORD *)(a2 + 104) = result;
      result->docList = (xsltDocumentPtr)a2;
    }
  }
  return result;
}

xsltStylesheet *xsltNumberComp(xsltStylesheet *result, uint64_t a2)
{
  xsltStylesheet *v3;
  xsltStylesheet *v4;
  const xmlChar *v5;
  const xmlChar *CNsProp;
  const xmlChar *v7;
  const xmlChar *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const xmlChar *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const xmlChar *v30;
  const unsigned __int8 *v31;
  int UTF8Char;

  if (result)
  {
    if (*(_DWORD *)(a2 + 8) == 1)
    {
      v3 = result;
      result = (xsltStylesheet *)xsltNewStylePreComp(result, 10);
      if (result)
      {
        v4 = result;
        *(_QWORD *)(a2 + 104) = result;
        result->mediaType = *(xmlChar **)(a2 + 64);
        result->preComps = (xsltElemPreCompPtr)a2;
        *(_QWORD *)&result->standalone = xsltGetCNsProp(v3, (xmlNodePtr)a2, (const xmlChar *)"value", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
        v5 = xsltEvalStaticAttrValueTemplate(v3, (xmlNodePtr)a2, (const xmlChar *)"format", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform", (int *)&v4->doctypeSystem);
        if (!LODWORD(v4->doctypeSystem))
          v5 = xmlDictLookup(v3->dict, (const xmlChar *)&unk_209C1ADF6, 0);
        v4->doctypePublic = (xmlChar *)v5;
        *(_QWORD *)&v4->omitXmlDeclaration = xsltGetCNsProp(v3, (xmlNodePtr)a2, (const xmlChar *)"count", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
        v4->decimalFormat = (xsltDecimalFormatPtr)xsltGetCNsProp(v3, (xmlNodePtr)a2, (const xmlChar *)"from", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
        CNsProp = xsltGetCNsProp(v3, (xmlNodePtr)a2, (const xmlChar *)"count", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
        if (CNsProp)
          *(_QWORD *)&v4->warnings = xsltCompilePattern(CNsProp, *(xmlDocPtr *)(a2 + 64), (xmlNodePtr)a2, v3, 0);
        v7 = xsltGetCNsProp(v3, (xmlNodePtr)a2, (const xmlChar *)"from", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
        if (v7)
          v4->exclPrefix = (xmlChar *)xsltCompilePattern(v7, *(xmlDocPtr *)(a2 + 64), (xmlNodePtr)a2, v3, 0);
        v8 = xsltGetCNsProp(v3, (xmlNodePtr)a2, (const xmlChar *)"level", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
        if (v8)
        {
          v9 = (const char *)v8;
          if (xmlStrEqual(v8, (const xmlChar *)"single")
            || xmlStrEqual((const xmlChar *)v9, (const xmlChar *)"multiple")
            || xmlStrEqual((const xmlChar *)v9, (const xmlChar *)"any"))
          {
            v4->encoding = (xmlChar *)v9;
          }
          else
          {
            xsltTransformError(0, v3, (xmlNodePtr)a2, "xsl:number : invalid value %s for level\n", v9);
            ++v3->warnings;
          }
        }
        if (xsltGetCNsProp(v3, (xmlNodePtr)a2, (const xmlChar *)"lang", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform"))
        {
          xsltTransformError(0, v3, (xmlNodePtr)a2, "xsl:number : lang attribute not implemented\n");
          xsltGenericError(xsltGenericErrorContext, "Unimplemented block at %s:%d\n", v10, v11, v12, v13, v14, v15, (char)"/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libxslt/preproc.c");
        }
        v16 = xsltGetCNsProp(v3, (xmlNodePtr)a2, (const xmlChar *)"letter-value", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
        if (v16)
        {
          v17 = (const char *)v16;
          if (xmlStrEqual(v16, (const xmlChar *)"alphabetic"))
          {
            xsltTransformError(0, v3, (xmlNodePtr)a2, "xsl:number : letter-value 'alphabetic' not implemented\n");
            ++v3->warnings;
            xsltGenericError(xsltGenericErrorContext, "Unimplemented block at %s:%d\n", v18, v19, v20, v21, v22, v23, (char)"/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libxslt/preproc.c");
          }
          else if (xmlStrEqual((const xmlChar *)v17, (const xmlChar *)"traditional"))
          {
            xsltTransformError(0, v3, (xmlNodePtr)a2, "xsl:number : letter-value 'traditional' not implemented\n");
            ++v3->warnings;
            xsltGenericError(xsltGenericErrorContext, "Unimplemented block at %s:%d\n", v24, v25, v26, v27, v28, v29, (char)"/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libxslt/preproc.c");
          }
          else
          {
            xsltTransformError(0, v3, (xmlNodePtr)a2, "xsl:number : invalid value %s for letter-value\n", v17);
            ++v3->warnings;
          }
        }
        v30 = xsltGetCNsProp(v3, (xmlNodePtr)a2, (const xmlChar *)"grouping-separator", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
        if (v30)
        {
          v31 = v30;
          *(&v4->indent + 1) = xmlStrlen(v30);
          UTF8Char = xsltGetUTF8Char(v31, &v4->indent + 1);
          v4->indent = UTF8Char & ~(UTF8Char >> 31);
        }
        result = (xsltStylesheet *)xsltGetCNsProp(v3, (xmlNodePtr)a2, (const xmlChar *)"grouping-size", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
        if (result)
          result = (xsltStylesheet *)sscanf((const char *)result, "%d", (char *)&v4->doctypeSystem + 4);
        else
          v4->indent = 0;
        if (!*(_QWORD *)&v4->standalone && !v4->encoding)
        {
          result = (xsltStylesheet *)xmlDictLookup(v3->dict, (const xmlChar *)"single", 6);
          v4->encoding = (xmlChar *)result;
        }
      }
    }
  }
  return result;
}

void *xsltProcessingInstructionComp(void *result, uint64_t a2)
{
  xsltStylesheet *v3;
  _QWORD *v4;

  if (result && *(_DWORD *)(a2 + 8) == 1)
  {
    v3 = (xsltStylesheet *)result;
    result = xsltNewStylePreComp((xsltStylesheet *)result, 7);
    if (result)
    {
      v4 = result;
      *(_QWORD *)(a2 + 104) = result;
      *((_QWORD *)result + 3) = a2;
      result = (void *)xsltEvalStaticAttrValueTemplate(v3, (xmlNodePtr)a2, (const xmlChar *)"name", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform", (int *)result + 32);
      v4[15] = result;
    }
  }
  return result;
}

void xsltCallTemplateComp(xsltStylesheet *a1, uint64_t a2)
{
  xsltElemPreComp *v4;
  xsltElemPreComp *v5;

  if (a1)
  {
    if (*(_DWORD *)(a2 + 8) == 1)
    {
      v4 = xsltNewStylePreComp(a1, 12);
      if (v4)
      {
        v5 = v4;
        *(_QWORD *)(a2 + 104) = v4;
        v4->inst = (xmlNodePtr)a2;
        xsltGetQNameProperty(a1, (xmlNodePtr)a2, (xmlChar *)"name", 1, &v4[3].type, (const xmlChar **)&v4[3].func, (xmlChar **)&v4[3]);
        if (v5[3].func)
          LODWORD(v5[3].inst) = 1;
      }
    }
  }
}

uint64_t xsltCheckTopLevelElement(xsltStylesheetPtr style, xmlNodePtr node, int a3)
{
  xmlNs *ns;
  _xmlNode *parent;
  xmlNs *v8;
  uint64_t result;

  if (!style)
    return 0xFFFFFFFFLL;
  ns = node->ns;
  if (!ns)
    return 0xFFFFFFFFLL;
  parent = node->parent;
  if (parent)
  {
    v8 = parent->ns;
    if (v8
      && parent->type == XML_ELEMENT_NODE
      && (v8 == ns || xmlStrEqual(v8->href, ns->href))
      && (xmlStrEqual(parent->name, (const xmlChar *)"stylesheet")
       || xmlStrEqual(parent->name, (const xmlChar *)"transform")))
    {
      return 1;
    }
    if (a3)
    {
      xsltTransformError(0, style, node, "element %s only allowed as child of stylesheet\n");
LABEL_17:
      result = 0;
      ++style->errors;
      return result;
    }
  }
  else if (a3)
  {
    xsltTransformError(0, style, node, "internal problem: element has no parent\n");
    goto LABEL_17;
  }
  return 0;
}

void xsltParamComp(xsltStylesheet *a1, uint64_t a2)
{
  xsltElemPreComp *v4;
  xsltElemPreComp *v5;
  const xmlChar *CNsProp;
  xmlXPathCompExprPtr v7;

  if (a1)
  {
    if (*(_DWORD *)(a2 + 8) == 1)
    {
      v4 = xsltNewStylePreComp(a1, 19);
      if (v4)
      {
        v5 = v4;
        *(_QWORD *)(a2 + 104) = v4;
        v4->inst = (xmlNodePtr)a2;
        xsltGetQNameProperty(a1, (xmlNodePtr)a2, (xmlChar *)"name", 1, &v4[3].type, (const xmlChar **)&v4[3].func, (xmlChar **)&v4[3]);
        if (v5[3].func)
          LODWORD(v5[3].inst) = 1;
        CNsProp = xsltGetCNsProp(a1, (xmlNodePtr)a2, (const xmlChar *)"select", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
        v5[4].inst = (xmlNodePtr)CNsProp;
        if (CNsProp)
        {
          v7 = xsltXPathCompile(a1, CNsProp);
          v5[7].inst = (xmlNodePtr)v7;
          if (!v7)
          {
            xsltTransformError(0, a1, (xmlNodePtr)a2, "XSLT-param: could not compile select expression '%s'.\n", (const char *)v5[4].inst);
            ++a1->errors;
          }
          if (*(_QWORD *)(a2 + 24))
          {
            xsltTransformError(0, a1, (xmlNodePtr)a2, "XSLT-param: The content should be empty since the attribute 'select' is present.\n");
            ++a1->warnings;
          }
        }
      }
    }
  }
}

void xsltVariableComp(xsltStylesheet *a1, uint64_t a2)
{
  xsltElemPreComp *v4;
  xsltElemPreComp *v5;
  const xmlChar *CNsProp;
  xmlXPathCompExprPtr v7;
  uint64_t i;
  int v9;

  if (a1)
  {
    if (*(_DWORD *)(a2 + 8) == 1)
    {
      v4 = xsltNewStylePreComp(a1, 20);
      if (v4)
      {
        v5 = v4;
        *(_QWORD *)(a2 + 104) = v4;
        v4->inst = (xmlNodePtr)a2;
        xsltGetQNameProperty(a1, (xmlNodePtr)a2, (xmlChar *)"name", 1, &v4[3].type, (const xmlChar **)&v4[3].func, (xmlChar **)&v4[3]);
        if (v5[3].func)
          LODWORD(v5[3].inst) = 1;
        CNsProp = xsltGetCNsProp(a1, (xmlNodePtr)a2, (const xmlChar *)"select", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
        v5[4].inst = (xmlNodePtr)CNsProp;
        if (CNsProp)
        {
          v7 = xsltXPathCompile(a1, CNsProp);
          v5[7].inst = (xmlNodePtr)v7;
          if (!v7)
          {
            xsltTransformError(0, a1, (xmlNodePtr)a2, "XSLT-variable: Failed to compile the XPath expression '%s'.\n", (const char *)v5[4].inst);
            ++a1->errors;
          }
          for (i = *(_QWORD *)(a2 + 24); i; i = *(_QWORD *)(i + 48))
          {
            v9 = *(_DWORD *)(i + 8);
            if (v9 != 8 && (v9 != 3 || !xsltIsBlank(*(xmlChar **)(i + 80))))
            {
              xsltTransformError(0, a1, (xmlNodePtr)a2, "XSLT-variable: There must be no child nodes, since the attribute 'select' was specified.\n");
              ++a1->errors;
            }
          }
        }
      }
    }
  }
}

void xsltGetQNameProperty(xsltStylesheetPtr style, xmlNodePtr node, xmlChar *name, int a4, _DWORD *a5, const xmlChar **a6, xmlChar **a7)
{
  xmlChar *CNsProp;
  const xmlChar *QNameURI2;
  xmlChar *namea;

  if (a6)
    *a6 = 0;
  if (a7)
    *a7 = 0;
  if (a5)
    *a5 = 0;
  CNsProp = (xmlChar *)xsltGetCNsProp(style, node, name, (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
  namea = CNsProp;
  if (!CNsProp)
  {
    if (!a4)
      return;
    xsltTransformError(0, style, node, "The attribute '%s' is missing.\n");
    goto LABEL_12;
  }
  if (xmlValidateQName(CNsProp, 0))
  {
    xsltTransformError(0, style, node, "The value '%s' of the attribute '%s' is not a valid QName.\n");
LABEL_12:
    ++style->errors;
    return;
  }
  QNameURI2 = xsltGetQNameURI2(style, node, (const xmlChar **)&namea);
  if (!namea)
    goto LABEL_12;
  if (a7)
    *a7 = namea;
  if (a5)
    *a5 = 1;
  if (a6)
  {
    if (QNameURI2)
      *a6 = xmlDictLookup(style->dict, QNameURI2, -1);
  }
}

xsltSecurityPrefsPtr xsltNewSecurityPrefs(void)
{
  uint64_t v0;
  xsltSecurityPrefs *v1;

  xsltInitGlobals();
  v0 = ((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(40);
  v1 = (xsltSecurityPrefs *)v0;
  if (v0)
  {
    *(_QWORD *)(v0 + 32) = 0;
    *(_OWORD *)v0 = 0u;
    *(_OWORD *)(v0 + 16) = 0u;
  }
  else
  {
    xsltTransformError(0, 0, 0, "xsltNewSecurityPrefs : malloc failed\n");
  }
  return v1;
}

void xsltFreeSecurityPrefs(xsltSecurityPrefsPtr sec)
{
  if (sec)
    ((void (*)(void))*MEMORY[0x24BEDE758])();
}

int xsltSetSecurityPrefs(xsltSecurityPrefsPtr sec, xsltSecurityOption option, xsltSecurityCheck func)
{
  int result;

  xsltInitGlobals();
  if (!sec)
    return -1;
  switch(option)
  {
    case XSLT_SECPREF_READ_FILE:
      break;
    case XSLT_SECPREF_WRITE_FILE:
      sec = (xsltSecurityPrefsPtr)((char *)sec + 8);
      break;
    case XSLT_SECPREF_CREATE_DIRECTORY:
      sec = (xsltSecurityPrefsPtr)((char *)sec + 16);
      break;
    case XSLT_SECPREF_READ_NETWORK:
      sec = (xsltSecurityPrefsPtr)((char *)sec + 24);
      break;
    case XSLT_SECPREF_WRITE_NETWORK:
      sec = (xsltSecurityPrefsPtr)((char *)sec + 32);
      break;
    default:
      return -1;
  }
  result = 0;
  *(_QWORD *)sec = func;
  return result;
}

xsltSecurityCheck xsltGetSecurityPrefs(xsltSecurityCheck sec, xsltSecurityOption option)
{
  if (sec)
  {
    switch(option)
    {
      case XSLT_SECPREF_READ_FILE:
        goto LABEL_8;
      case XSLT_SECPREF_WRITE_FILE:
        sec = (xsltSecurityCheck)((char *)sec + 8);
        goto LABEL_8;
      case XSLT_SECPREF_CREATE_DIRECTORY:
        sec = (xsltSecurityCheck)((char *)sec + 16);
        goto LABEL_8;
      case XSLT_SECPREF_READ_NETWORK:
        sec = (xsltSecurityCheck)((char *)sec + 24);
        goto LABEL_8;
      case XSLT_SECPREF_WRITE_NETWORK:
        sec = (xsltSecurityCheck)((char *)sec + 32);
LABEL_8:
        sec = *(xsltSecurityCheck *)sec;
        break;
      default:
        sec = 0;
        break;
    }
  }
  return sec;
}

void xsltSetDefaultSecurityPrefs(xsltSecurityPrefsPtr sec)
{
  xsltDefaultSecurityPrefs = (uint64_t)sec;
}

xsltSecurityPrefsPtr xsltGetDefaultSecurityPrefs(void)
{
  return (xsltSecurityPrefsPtr)xsltDefaultSecurityPrefs;
}

int xsltSetCtxtSecurityPrefs(xsltSecurityPrefsPtr sec, xsltTransformContextPtr ctxt)
{
  int result;

  if (!ctxt)
    return -1;
  result = 0;
  ctxt->sec = sec;
  return result;
}

int xsltSecurityAllow(xsltSecurityPrefsPtr sec, xsltTransformContextPtr ctxt, const char *value)
{
  return 1;
}

int xsltSecurityForbid(xsltSecurityPrefsPtr sec, xsltTransformContextPtr ctxt, const char *value)
{
  return 0;
}

int xsltCheckWrite(xsltSecurityPrefsPtr sec, xsltTransformContextPtr ctxt, const xmlChar *URL)
{
  xmlURIPtr v6;
  xmlURIPtr URI;
  int v8;
  int v9;
  unsigned int (*v10)(xsltSecurityPrefsPtr, xsltTransformContextPtr, const xmlChar *);

  v6 = xmlParseURI((const char *)URL);
  if (!v6)
  {
    URI = xmlCreateURI();
    if (!URI)
    {
      xsltTransformError(ctxt, 0, 0, "xsltCheckWrite: out of memory for %s\n", (const char *)URL);
      return -1;
    }
    v6 = URI;
    URI->path = (char *)xmlStrdup(URL);
  }
  if (v6->scheme && !xmlStrEqual((const xmlChar *)v6->scheme, (const xmlChar *)"file"))
  {
    if (sec)
    {
      v10 = (unsigned int (*)(xsltSecurityPrefsPtr, xsltTransformContextPtr, const xmlChar *))*((_QWORD *)sec + 4);
      if (v10)
      {
        if (!v10(sec, ctxt, URL))
        {
          xsltTransformError(ctxt, 0, 0, "File write for %s refused\n", (const char *)URL);
          xmlFreeURI(v6);
          return 0;
        }
      }
    }
  }
  else
  {
    v8 = xsltCheckWritePath((uint64_t)sec, ctxt, v6->path);
    if (v8 <= 0)
    {
      v9 = v8;
      xmlFreeURI(v6);
      return v9;
    }
  }
  xmlFreeURI(v6);
  return 1;
}

uint64_t xsltCheckWritePath(uint64_t a1, xsltTransformContext *a2, const char *a3)
{
  unsigned int (*v6)(uint64_t, xsltTransformContext *, const char *);
  char *Directory;
  const char *v8;
  unsigned int (*v9)(uint64_t, xsltTransformContext *, const char *);
  uint64_t v10;
  stat v12;

  if (a1)
  {
    v6 = *(unsigned int (**)(uint64_t, xsltTransformContext *, const char *))(a1 + 8);
    if (v6)
    {
      if (!v6(a1, a2, a3))
      {
        xsltTransformError(a2, 0, 0, "File write for %s refused\n", a3);
        return 0;
      }
    }
  }
  Directory = xmlParserGetDirectory(a3);
  if (!Directory)
    return 1;
  v8 = Directory;
  memset(&v12, 0, sizeof(v12));
  if (stat(Directory, &v12) != -1)
  {
    ((void (*)(const char *))*MEMORY[0x24BEDE758])(v8);
    return 1;
  }
  if (a1)
  {
    v9 = *(unsigned int (**)(uint64_t, xsltTransformContext *, const char *))(a1 + 16);
    if (v9)
    {
      if (!v9(a1, a2, v8))
      {
        xsltTransformError(a2, 0, 0, "Directory creation for %s refused\n", a3);
        ((void (*)(const char *))*MEMORY[0x24BEDE758])(v8);
        return 0;
      }
    }
  }
  v10 = xsltCheckWritePath(a1, a2, v8);
  if ((_DWORD)v10 == 1)
    v10 = mkdir(v8, 0x1EDu);
  ((void (*)(const char *))*MEMORY[0x24BEDE758])(v8);
  if ((v10 & 0x80000000) == 0)
    return 1;
  return v10;
}

int xsltCheckRead(xsltSecurityPrefsPtr sec, xsltTransformContextPtr ctxt, const xmlChar *URL)
{
  xmlURIPtr v6;
  xmlURI *v7;
  const xmlChar *scheme;
  unsigned int (*v10)(xsltSecurityPrefsPtr, xsltTransformContextPtr, const xmlChar *);

  v6 = xmlParseURI((const char *)URL);
  if (!v6)
  {
    xsltTransformError(ctxt, 0, 0, "xsltCheckRead: URL parsing failed for %s\n", (const char *)URL);
    return -1;
  }
  v7 = v6;
  scheme = (const xmlChar *)v6->scheme;
  if (scheme && !xmlStrEqual(scheme, (const xmlChar *)"file"))
  {
    if (sec)
    {
      v10 = (unsigned int (*)(xsltSecurityPrefsPtr, xsltTransformContextPtr, const xmlChar *))*((_QWORD *)sec + 3);
      if (v10)
      {
        if (!v10(sec, ctxt, URL))
        {
          xsltTransformError(ctxt, 0, 0, "Network file read for %s refused\n");
          goto LABEL_14;
        }
      }
    }
LABEL_12:
    xmlFreeURI(v7);
    return 1;
  }
  if (!sec
    || !*(_QWORD *)sec
    || (*(unsigned int (**)(xsltSecurityPrefsPtr, xsltTransformContextPtr, char *))sec)(sec, ctxt, v7->path))
  {
    goto LABEL_12;
  }
  xsltTransformError(ctxt, 0, 0, "Local file read for %s refused\n");
LABEL_14:
  xmlFreeURI(v7);
  return 0;
}

int xsltEvalXPathPredicate(xsltTransformContextPtr ctxt, xmlXPathCompExprPtr comp, xmlNsPtr *nsList, int nsNr)
{
  xmlNode *inst;
  xmlXPathContextPtr xpathCtxt;
  uint64_t v7;
  int v8;
  xmlNsPtr *namespaces;
  xmlXPathObject *v10;
  xmlXPathObject *v11;
  int v12;
  unint64_t *traceCode;
  unint64_t *v14;
  xmlXPathContextPtr v15;

  if (ctxt && (inst = ctxt->inst) != 0)
  {
    xpathCtxt = ctxt->xpathCtxt;
    v7 = *(_QWORD *)&xpathCtxt->contextSize;
    v8 = xpathCtxt->nsNr;
    namespaces = xpathCtxt->namespaces;
    xpathCtxt->node = ctxt->node;
    xpathCtxt->namespaces = nsList;
    xpathCtxt->nsNr = nsNr;
    v10 = xmlXPathCompiledEval(comp, xpathCtxt);
    if (v10)
    {
      v11 = v10;
      v12 = xmlXPathEvalPredicate(ctxt->xpathCtxt, v10);
      xmlXPathFreeObject(v11);
      traceCode = ctxt->traceCode;
      if (traceCode && (*((_BYTE *)traceCode + 1) & 0x40) != 0)
        xsltGenericDebug(xsltGenericDebugContext, "xsltEvalXPathPredicate: returns %d\n", v12);
    }
    else
    {
      v14 = ctxt->traceCode;
      if (v14 && (*((_BYTE *)v14 + 1) & 0x40) != 0)
        xsltGenericDebug(xsltGenericDebugContext, "xsltEvalXPathPredicate: failed\n");
      v12 = 0;
      ctxt->state = XSLT_STATE_STOPPED;
    }
    v15 = ctxt->xpathCtxt;
    v15->nsNr = v8;
    v15->namespaces = namespaces;
    ctxt->inst = inst;
    *(_QWORD *)&v15->contextSize = v7;
  }
  else
  {
    xsltTransformError(ctxt, 0, 0, "xsltEvalXPathPredicate: No context or instruction\n");
    return 0;
  }
  return v12;
}

xmlChar *__cdecl xsltEvalXPathStringNs(xsltTransformContextPtr ctxt, xmlXPathCompExprPtr comp, int nsNr, xmlNsPtr *nsList)
{
  xmlNode *inst;
  xmlNode *node;
  xmlXPathContextPtr xpathCtxt;
  uint64_t v8;
  int v9;
  xmlNsPtr *namespaces;
  xmlXPathObjectPtr v11;
  xmlXPathObjectPtr v12;
  const char *stringval;
  unint64_t *traceCode;
  xmlXPathContextPtr v15;

  if (ctxt && (inst = ctxt->inst) != 0)
  {
    node = ctxt->node;
    xpathCtxt = ctxt->xpathCtxt;
    v8 = *(_QWORD *)&xpathCtxt->contextSize;
    v9 = xpathCtxt->nsNr;
    namespaces = xpathCtxt->namespaces;
    xpathCtxt->node = node;
    xpathCtxt->namespaces = nsList;
    xpathCtxt->nsNr = nsNr;
    v11 = xmlXPathCompiledEval(comp, xpathCtxt);
    if (v11)
    {
      v12 = v11;
      if (v11->type == XPATH_STRING || (v12 = xmlXPathConvertString(v11), v12->type == XPATH_STRING))
      {
        stringval = (const char *)v12->stringval;
        v12->stringval = 0;
      }
      else
      {
        xsltTransformError(ctxt, 0, 0, "xpath : string() function didn't return a String\n");
        stringval = 0;
      }
      xmlXPathFreeObject(v12);
    }
    else
    {
      stringval = 0;
      ctxt->state = XSLT_STATE_STOPPED;
    }
    traceCode = ctxt->traceCode;
    if (traceCode && (*((_BYTE *)traceCode + 1) & 0x40) != 0)
      xsltGenericDebug(xsltGenericDebugContext, "xsltEvalXPathString: returns %s\n", stringval);
    ctxt->inst = inst;
    ctxt->node = node;
    v15 = ctxt->xpathCtxt;
    *(_QWORD *)&v15->contextSize = v8;
    v15->nsNr = v9;
    v15->namespaces = namespaces;
  }
  else
  {
    xsltTransformError(ctxt, 0, 0, "xsltEvalXPathStringNs: No context or instruction\n");
    return 0;
  }
  return (xmlChar *)stringval;
}

xmlChar *__cdecl xsltEvalXPathString(xsltTransformContextPtr ctxt, xmlXPathCompExprPtr comp)
{
  return xsltEvalXPathStringNs(ctxt, comp, 0, 0);
}

xmlChar *__cdecl xsltEvalTemplateString(xsltTransformContextPtr ctxt, xmlNodePtr contextNode, xmlNodePtr inst)
{
  xmlNode *v6;
  xmlNode *v7;
  xmlNode *insert;
  const xmlChar *lasttext;
  uint64_t v10;
  xmlChar *Content;

  if (ctxt && contextNode && inst && inst->type == XML_ELEMENT_NODE && inst->children)
  {
    v6 = xmlNewDocNode(ctxt->output, 0, (const xmlChar *)"fake", 0);
    if (v6)
    {
      v7 = v6;
      insert = ctxt->insert;
      ctxt->insert = v6;
      lasttext = ctxt->lasttext;
      v10 = *(_QWORD *)&ctxt->lasttsize;
      xsltApplyOneTemplate(ctxt, contextNode, inst->children, 0, 0);
      ctxt->insert = insert;
      ctxt->lasttext = lasttext;
      *(_QWORD *)&ctxt->lasttsize = v10;
      Content = xmlNodeGetContent(v7);
      xmlFreeNode(v7);
      return Content;
    }
    xsltTransformError(ctxt, 0, inst, "Failed to create temporary node\n");
  }
  return 0;
}

xmlChar *__cdecl xsltAttrTemplateValueProcessNode(xsltTransformContextPtr ctxt, const xmlChar *str, xmlNodePtr node)
{
  const xmlChar *v3;
  int v4;
  xmlChar *v7;
  xmlNsPtr *v8;
  const xmlChar *v9;
  const xmlChar *v10;
  int v11;
  unsigned __int8 *v12;
  unsigned int v13;
  unsigned __int8 *v14;
  int v15;
  int v16;
  BOOL v17;
  int v18;
  int v19;
  xmlChar *v20;
  const xmlChar *v21;
  xmlNsPtr *NsList;
  uint64_t v23;
  xmlXPathCompExpr *v25;
  xmlChar *v26;
  int v27;
  xmlChar *v28;
  const xmlChar *v29;
  int nsNr;

  if (!str)
    return 0;
  v3 = str;
  v4 = *str;
  if (!*str)
    return xmlStrndup((const xmlChar *)&unk_209C1ADF6, 0);
  v7 = 0;
  v8 = 0;
  nsNr = 0;
  v9 = str;
LABEL_4:
  if (v4 == 123)
  {
    v10 = v9 + 1;
    if (v9[1] == 123)
      goto LABEL_30;
    if (v9 - v3 >= 0x7FFFFFFF)
      v11 = 0x7FFFFFFF;
    else
      v11 = (_DWORD)v9 - (_DWORD)v3;
    v7 = xmlStrncat(v7, v3, v11);
    v12 = (unsigned __int8 *)(v9 + 1);
    while (1)
    {
      v13 = *v12;
      if (v13 > 0x26)
      {
        if (v13 == 39)
          goto LABEL_18;
        if (v13 == 125)
        {
          if (v12 - v10 >= 0x7FFFFFFF)
            v19 = 0x7FFFFFFF;
          else
            v19 = (_DWORD)v12 - (_DWORD)v10;
          v20 = xmlStrndup(v9 + 1, v19);
          if (!v20)
            goto LABEL_57;
          v21 = v20;
          if (*v20 == 123)
            goto LABEL_49;
          if (node)
          {
            if (!v8)
            {
              NsList = xmlGetNsList(node->doc, node);
              v8 = NsList;
              if (NsList)
              {
                v23 = 0;
                while (NsList[v23++])
                  ;
                nsNr = v23 - 1;
              }
            }
          }
          v25 = xmlXPathCtxtCompile(ctxt->xpathCtxt, v21);
          v26 = xsltEvalXPathStringNs(ctxt, v25, nsNr, v8);
          xmlXPathFreeCompExpr(v25);
          ((void (*)(const xmlChar *))*MEMORY[0x24BEDE758])(v21);
          v21 = v26;
          if (v26)
          {
LABEL_49:
            v7 = xmlStrcat(v7, v21);
            ((void (*)(const xmlChar *))*MEMORY[0x24BEDE758])(v21);
          }
          v3 = v12 + 1;
LABEL_34:
          v9 = v3;
LABEL_36:
          v4 = *v9;
          goto LABEL_4;
        }
LABEL_28:
        ++v12;
      }
      else
      {
        if (v13 != 34)
        {
          if (!*v12)
          {
            xsltTransformError(ctxt, 0, node, "xsltAttrTemplateValueProcessNode: unmatched '{'\n");
            if (v12 - v9 >= 0x7FFFFFFF)
              v27 = 0x7FFFFFFF;
            else
              v27 = (_DWORD)v12 - (_DWORD)v9;
            v28 = v7;
            v29 = v9;
            goto LABEL_56;
          }
          goto LABEL_28;
        }
LABEL_18:
        v14 = v12 + 1;
        do
        {
          v16 = *v14++;
          v15 = v16;
          if (v16)
            v17 = v15 == v13;
          else
            v17 = 1;
        }
        while (!v17);
        if (v15)
          v12 = v14;
        else
          v12 = v14 - 1;
      }
    }
  }
  if (v4 == 125)
  {
    v10 = v9 + 1;
    if (v9[1] != 125)
    {
      xsltTransformError(ctxt, 0, node, "xsltAttrTemplateValueProcessNode: unmatched '}'\n");
      ++v9;
      goto LABEL_36;
    }
LABEL_30:
    if (v10 - v3 >= 0x7FFFFFFF)
      v18 = 0x7FFFFFFF;
    else
      v18 = (_DWORD)v10 - (_DWORD)v3;
    v7 = xmlStrncat(v7, v3, v18);
    v3 = v9 + 2;
    goto LABEL_34;
  }
  if (v4)
  {
    ++v9;
    goto LABEL_36;
  }
  if (v9 != v3)
  {
    if (v9 - v3 >= 0x7FFFFFFF)
      v27 = 0x7FFFFFFF;
    else
      v27 = (_DWORD)v9 - (_DWORD)v3;
    v28 = v7;
    v29 = v3;
LABEL_56:
    v7 = xmlStrncat(v28, v29, v27);
  }
LABEL_57:
  if (v8)
    ((void (*)(xmlNsPtr *))*MEMORY[0x24BEDE758])(v8);
  return v7;
}

xmlChar *__cdecl xsltAttrTemplateValueProcess(xsltTransformContextPtr ctxt, const xmlChar *attr)
{
  return xsltAttrTemplateValueProcessNode(ctxt, attr, 0);
}

xmlChar *__cdecl xsltEvalAttrValueTemplate(xsltTransformContextPtr ctxt, xmlNodePtr node, const xmlChar *name, const xmlChar *ns)
{
  xmlChar *v4;
  xmlChar *NsProp;
  const char *v8;
  unint64_t *traceCode;

  v4 = 0;
  if (ctxt && node && name)
  {
    if (node->type == XML_ELEMENT_NODE && (NsProp = xsltGetNsProp(node, name, ns)) != 0)
    {
      v8 = (const char *)NsProp;
      v4 = xsltAttrTemplateValueProcessNode(ctxt, NsProp, node);
      traceCode = ctxt->traceCode;
      if (traceCode && (*((_BYTE *)traceCode + 1) & 0x40) != 0)
        xsltGenericDebug(xsltGenericDebugContext, "xsltEvalAttrValueTemplate: %s returns %s\n", v8, (const char *)v4);
      ((void (*)(const char *))*MEMORY[0x24BEDE758])(v8);
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

const xmlChar *__cdecl xsltEvalStaticAttrValueTemplate(xsltStylesheetPtr style, xmlNodePtr node, const xmlChar *name, const xmlChar *ns, int *found)
{
  xmlChar *NsProp;
  const xmlChar *v8;
  const xmlChar *v10;

  if (!style || !node || !name || node->type != XML_ELEMENT_NODE)
    return 0;
  NsProp = xsltGetNsProp(node, name, ns);
  if (!NsProp)
  {
    *found = 0;
    return 0;
  }
  v8 = NsProp;
  *found = 1;
  if (xmlStrchr(NsProp, 0x7Bu))
  {
    ((void (*)(const xmlChar *))*MEMORY[0x24BEDE758])(v8);
    return 0;
  }
  v10 = xmlDictLookup(style->dict, v8, -1);
  ((void (*)(const xmlChar *))*MEMORY[0x24BEDE758])(v8);
  return v10;
}

xmlAttrPtr xsltAttrTemplateProcess(xsltTransformContextPtr ctxt, xmlNodePtr target, xmlAttrPtr attr)
{
  _xmlAttr *properties;
  xmlNs *ns;
  _xmlNode *children;
  const xmlChar *content;
  xmlNs *v11;
  xmlNs *v12;
  xmlNs *Namespace;
  xmlNodePtr v14;
  xmlNodePtr v15;
  void *psvi;
  xmlChar *v17;
  xmlNode *v18;
  xmlNode *parent;
  xmlNs *v20;
  _xmlDoc *doc;
  xmlDict *dict;
  const xmlChar *v23;

  properties = 0;
  if (target && ctxt && attr)
  {
    if (target->type != XML_ELEMENT_NODE)
      return 0;
    if (attr->type != XML_ATTRIBUTE_NODE)
      return 0;
    ns = attr->ns;
    if (ns)
    {
      if (xmlStrEqual(ns->href, (const xmlChar *)"http://www.w3.org/1999/XSL/Transform"))
        return 0;
    }
    children = attr->children;
    if (!children)
      goto LABEL_15;
    if (children->type != XML_TEXT_NODE || children->next)
    {
      xsltTransformError(ctxt, 0, attr->parent, "Internal error: The children of an attribute node of a literal result element are not in the expected form.\n");
      return 0;
    }
    content = children->content;
    if (!content)
LABEL_15:
      content = xmlDictLookup(ctxt->dict, (const xmlChar *)&unk_209C1ADF6, 0);
    properties = target->properties;
    if (properties)
    {
      while (1)
      {
        if ((attr->ns == 0) != (properties->ns != 0))
        {
          if (xmlStrEqual(properties->name, attr->name))
          {
            v11 = attr->ns;
            if (!v11 || xmlStrEqual(properties->ns->href, v11->href))
              break;
          }
        }
        properties = properties->next;
        if (!properties)
          goto LABEL_22;
      }
      xmlFreeNodeList(properties->children);
      properties->children = 0;
      properties->last = 0;
      v20 = properties->ns;
      if (v20 && !xmlStrEqual(v20->prefix, attr->ns->prefix))
        properties->ns = xsltGetNamespace(ctxt, attr->parent, attr->ns, target);
    }
    else
    {
LABEL_22:
      v12 = attr->ns;
      if (v12)
        Namespace = xsltGetNamespace(ctxt, attr->parent, v12, target);
      else
        Namespace = 0;
      properties = xmlNewNsProp(target, Namespace, attr->name, 0);
      if (!properties)
      {
        parent = attr->parent;
        if (attr->ns)
          xsltTransformError(ctxt, 0, parent, "Internal error: Failed to create attribute '{%s}%s'.\n");
        else
          xsltTransformError(ctxt, 0, parent, "Internal error: Failed to create attribute '%s'.\n");
        return 0;
      }
    }
    v14 = xmlNewText(0);
    if (!v14)
      return properties;
    v15 = v14;
    properties->children = v14;
    properties->last = v14;
    v14->parent = (_xmlNode *)properties;
    v14->doc = properties->doc;
    psvi = attr->psvi;
    if (psvi)
    {
      v17 = xsltEvalAVT(ctxt, psvi, attr->parent);
      if (v17)
      {
LABEL_44:
        v15->content = v17;
        return properties;
      }
      v18 = attr->parent;
      if (attr->ns)
        xsltTransformError(ctxt, 0, v18, "Internal error: Failed to evaluate the AVT of attribute '{%s}%s'.\n");
      else
        xsltTransformError(ctxt, 0, v18, "Internal error: Failed to evaluate the AVT of attribute '%s'.\n");
      v23 = (const xmlChar *)&unk_209C1ADF6;
    }
    else
    {
      if (ctxt->internalized)
      {
        doc = target->doc;
        if (doc)
        {
          dict = doc->dict;
          if (dict == ctxt->dict)
          {
            if (xmlDictOwns(dict, content))
            {
              v15->content = (xmlChar *)content;
              return properties;
            }
          }
        }
      }
      v23 = content;
    }
    v17 = xmlStrdup(v23);
    goto LABEL_44;
  }
  return properties;
}

xmlAttrPtr xsltAttrListTemplateProcess(xsltTransformContextPtr ctxt, xmlNodePtr target, xmlAttrPtr cur)
{
  xmlAttrPtr result;
  xmlAttrPtr v6;
  xmlNode *v7;
  xmlAttrPtr v8;
  xmlNs *Namespace;
  _xmlAttr *properties;
  xmlNs *ns;
  _xmlNode *children;
  const xmlChar *content;
  xmlNode *v14;
  xmlAttrPtr v15;
  xmlAttrPtr v16;
  xmlNodePtr v17;
  xmlNodePtr v18;
  void *psvi;
  _xmlDoc *doc;
  xmlDict *dict;
  xmlNode *parent;
  xmlNode *v23;
  xmlNode *insert;

  result = 0;
  if (!ctxt)
    return result;
  if (!target)
    return result;
  v6 = cur;
  if (!cur)
    return result;
  if (target->type != XML_ELEMENT_NODE)
    return 0;
  insert = ctxt->insert;
  ctxt->insert = target;
  v7 = (xmlNode *)cur;
  do
  {
    if (v7->ns
      && xmlStrEqual(v7->name, (const xmlChar *)"use-attribute-sets")
      && xmlStrEqual(v7->ns->href, (const xmlChar *)"http://www.w3.org/1999/XSL/Transform"))
    {
      xsltApplyAttributeSet(ctxt, ctxt->node, v7, 0);
    }
    v7 = v7->next;
  }
  while (v7);
  v8 = 0;
  Namespace = 0;
  properties = target->properties;
  while (1)
  {
    ns = v6->ns;
    if (ns && xmlStrEqual(ns->href, (const xmlChar *)"http://www.w3.org/1999/XSL/Transform"))
      goto LABEL_41;
    children = v6->children;
    if (!children)
      goto LABEL_18;
    if (children->type != XML_TEXT_NODE || children->next)
    {
      xsltTransformError(ctxt, 0, v6->parent, "Internal error: The children of an attribute node of a literal result element are not in the expected form.\n");
      goto LABEL_52;
    }
    content = children->content;
    if (!content)
LABEL_18:
      content = xmlDictLookup(ctxt->dict, (const xmlChar *)&unk_209C1ADF6, 0);
    v14 = (xmlNode *)v6->ns;
    if (v14 == v7)
      goto LABEL_22;
    if (v14)
    {
      Namespace = xsltGetNamespace(ctxt, v6->parent, v6->ns, target);
      v7 = v14;
      if (!Namespace)
        goto LABEL_52;
LABEL_22:
      if (properties)
        goto LABEL_23;
      goto LABEL_26;
    }
    v7 = 0;
    Namespace = 0;
    if (properties)
    {
LABEL_23:
      v15 = xmlSetNsProp(target, Namespace, v6->name, 0);
      if (!v15)
        goto LABEL_47;
      goto LABEL_31;
    }
LABEL_26:
    v16 = xmlNewDocProp(target->doc, v6->name, 0);
    if (!v16)
    {
LABEL_47:
      parent = v6->parent;
      if (v6->ns)
        xsltTransformError(ctxt, 0, parent, "Internal error: Failed to create attribute '{%s}%s'.\n");
      else
        xsltTransformError(ctxt, 0, parent, "Internal error: Failed to create attribute '%s'.\n");
      goto LABEL_52;
    }
    v15 = v16;
    v16->ns = Namespace;
    v16->parent = target;
    if (v8)
    {
      v8->next = v16;
      v16->prev = v8;
    }
    else
    {
      target->properties = v16;
    }
    v8 = v16;
LABEL_31:
    v17 = xmlNewText(0);
    if (v17)
      break;
LABEL_41:
    v6 = v6->next;
    if (!v6)
    {
      ctxt->insert = insert;
      return target->properties;
    }
  }
  v18 = v17;
  v15->children = v17;
  v15->last = v17;
  v17->parent = (_xmlNode *)v15;
  v17->doc = v15->doc;
  psvi = v6->psvi;
  if (!psvi)
  {
    if (!ctxt->internalized
      || (doc = target->doc) == 0
      || (dict = doc->dict, dict != ctxt->dict)
      || !xmlDictOwns(dict, content))
    {
      content = xmlStrdup(content);
    }
    goto LABEL_39;
  }
  content = xsltEvalAVT(ctxt, psvi, v6->parent);
  if (content)
  {
LABEL_39:
    v18->content = (xmlChar *)content;
    if (xmlIsID(v15->doc, v15->parent, v15))
      xmlAddID(0, v15->doc, v18->content, v15);
    goto LABEL_41;
  }
  v23 = v6->parent;
  if (v6->ns)
    xsltTransformError(ctxt, 0, v23, "Internal error: Failed to evaluate the AVT of attribute '{%s}%s'.\n");
  else
    xsltTransformError(ctxt, 0, v23, "Internal error: Failed to evaluate the AVT of attribute '%s'.\n");
  v18->content = xmlStrdup((const xmlChar *)&unk_209C1ADF6);
LABEL_52:
  result = 0;
  ctxt->insert = insert;
  return result;
}

xmlNodePtr *__cdecl xsltTemplateProcess(xsltTransformContextPtr ctxt, xmlNodePtr node)
{
  return 0;
}

void xsltLocalVariablePop(xsltTransformContextPtr ctxt, int limitNr, int level)
{
  int varsNr;
  xsltStackElemPtr v7;
  int v8;
  BOOL v9;
  int v10;
  xsltStackElem *v11;

  varsNr = ctxt->varsNr;
  if (varsNr >= 1)
  {
    while (varsNr > limitNr)
    {
      v7 = ctxt->varsTab[varsNr - 1];
      v8 = v7->level;
      if (v8 <= level)
        break;
      if ((v8 & 0x80000000) == 0)
      {
        xsltFreeStackElemList(v7);
        varsNr = ctxt->varsNr;
      }
      ctxt->varsNr = --varsNr;
      if (!varsNr)
        goto LABEL_10;
    }
    v9 = __OFSUB__(varsNr, 1);
    v10 = varsNr - 1;
    if (v10 < 0 == v9)
    {
      v11 = ctxt->varsTab[v10];
      goto LABEL_11;
    }
LABEL_10:
    v11 = 0;
LABEL_11:
    ctxt->vars = v11;
  }
}

void xsltSetXIncludeDefault(int xinclude)
{
  xsltDoXIncludeDefault = xinclude != 0;
}

int xsltGetXIncludeDefault(void)
{
  return xsltDoXIncludeDefault;
}

void xsltDebugSetDefaultTrace(xsltDebugTraceCodes val)
{
  xsltDefaultTrace = val;
}

xsltDebugTraceCodes xsltDebugGetDefaultTrace(void)
{
  return (int)xsltDefaultTrace;
}

xsltTransformContextPtr xsltNewTransformContext(xsltStylesheetPtr style, xmlDocPtr doc)
{
  uint64_t (**v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  xmlDictPtr Sub;
  BOOL v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  xmlXPathContext *v13;
  uint64_t extrasNr;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  xmlGenericErrorFunc v20;
  void **v21;
  xmlXPathContext *v22;
  xsltDocumentPtr v23;

  xsltInitGlobals();
  v4 = (uint64_t (**)(uint64_t))MEMORY[0x24BEDE910];
  v5 = ((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(504);
  v6 = v5;
  if (v5)
  {
    *(_QWORD *)(v5 + 496) = 0;
    *(_OWORD *)(v5 + 464) = 0u;
    *(_OWORD *)(v5 + 480) = 0u;
    *(_OWORD *)(v5 + 432) = 0u;
    *(_OWORD *)(v5 + 448) = 0u;
    *(_OWORD *)(v5 + 400) = 0u;
    *(_OWORD *)(v5 + 416) = 0u;
    *(_OWORD *)(v5 + 368) = 0u;
    *(_OWORD *)(v5 + 384) = 0u;
    *(_OWORD *)(v5 + 336) = 0u;
    *(_OWORD *)(v5 + 352) = 0u;
    *(_OWORD *)(v5 + 304) = 0u;
    *(_OWORD *)(v5 + 320) = 0u;
    *(_OWORD *)(v5 + 272) = 0u;
    *(_OWORD *)(v5 + 288) = 0u;
    *(_OWORD *)(v5 + 240) = 0u;
    *(_OWORD *)(v5 + 256) = 0u;
    *(_OWORD *)(v5 + 208) = 0u;
    *(_OWORD *)(v5 + 224) = 0u;
    *(_OWORD *)(v5 + 176) = 0u;
    *(_OWORD *)(v5 + 192) = 0u;
    *(_OWORD *)(v5 + 144) = 0u;
    *(_OWORD *)(v5 + 160) = 0u;
    *(_OWORD *)(v5 + 112) = 0u;
    *(_OWORD *)(v5 + 128) = 0u;
    *(_OWORD *)(v5 + 80) = 0u;
    *(_OWORD *)(v5 + 96) = 0u;
    *(_OWORD *)(v5 + 48) = 0u;
    *(_OWORD *)(v5 + 64) = 0u;
    *(_OWORD *)(v5 + 16) = 0u;
    *(_OWORD *)(v5 + 32) = 0u;
    *(_OWORD *)v5 = 0u;
    v7 = (_OWORD *)(*v4)(32);
    if (!v7)
    {
      xsltTransformError(0, 0, 0, "xsltTransformCacheCreate : malloc failed\n");
      *(_QWORD *)(v6 + 424) = 0;
      goto LABEL_30;
    }
    *v7 = 0u;
    v7[1] = 0u;
    *(_QWORD *)(v6 + 424) = v7;
    Sub = xmlDictCreateSub(style->dict);
    *(_QWORD *)(v6 + 368) = Sub;
    if (style->internalized)
      v9 = Sub == 0;
    else
      v9 = 1;
    v10 = !v9;
    *(_DWORD *)(v6 + 384) = v10;
    xsltGenericDebug(xsltGenericDebugContext, "Creating sub-dictionary from stylesheet for transformation\n");
    v11 = (*v4)(80);
    *(_QWORD *)(v6 + 32) = v11;
    if (!v11)
    {
      xsltTransformError(0, 0, (xmlNodePtr)doc, "xsltNewTransformContext: out of memory\n");
      goto LABEL_30;
    }
    *(_QWORD *)(v6 + 24) = 0x500000000;
    *(_QWORD *)(v6 + 16) = 0;
    *(_DWORD *)(v6 + 464) = xsltMaxDepth;
    v12 = (*v4)(80);
    *(_QWORD *)(v6 + 56) = v12;
    if (v12)
    {
      *(_QWORD *)(v6 + 48) = 0xA00000000;
      *(_QWORD *)(v6 + 40) = 0;
      *(_DWORD *)(v6 + 64) = 0;
      *(_DWORD *)(v6 + 468) = xsltMaxVars;
      *(_QWORD *)(v6 + 224) = 0;
      *(_QWORD *)(v6 + 232) = 0;
      *(_QWORD *)(v6 + 216) = 0;
      *(_QWORD *)v6 = style;
      xmlXPathInit();
      v13 = xmlXPathNewContext(doc);
      *(_QWORD *)(v6 + 160) = v13;
      if (!v13)
      {
        xsltTransformError(0, 0, (xmlNodePtr)doc, "xsltNewTransformContext : xmlXPathNewContext failed\n");
        goto LABEL_30;
      }
      if (xmlXPathContextSetCache(v13, 1, -1, 0) == -1)
      {
LABEL_30:
        xsltFreeTransformContext((xsltTransformContextPtr)v6);
        return 0;
      }
      extrasNr = style->extrasNr;
      if (!(_DWORD)extrasNr)
      {
        *(_QWORD *)(v6 + 248) = 0;
        *(_QWORD *)(v6 + 256) = 0;
LABEL_25:
        xmlXPathRegisterVariableLookup(*(xmlXPathContextPtr *)(v6 + 160), xsltXPathVariableLookup, (void *)v6);
        xsltRegisterAllFunctions(*(xmlXPathContextPtr *)(v6 + 160));
        xsltRegisterAllElement((xsltTransformContextPtr)v6);
        v22 = *(xmlXPathContext **)(v6 + 160);
        v22->extra = (void *)v6;
        xmlXPathRegisterFuncLookup(v22, xsltXPathFunctionLookup, v22);
        *(_QWORD *)(*(_QWORD *)(v6 + 160) + 136) = style->nsHash;
        xsltInitCtxtExts((xsltTransformContextPtr)v6);
        if (!xslDebugStatus)
          xmlXPathOrderDocElems(doc);
        *(_DWORD *)(v6 + 360) = 16398;
        v23 = xsltNewDocument((xsltTransformContextPtr)v6, doc);
        if (v23)
        {
          v23->main = 1;
          *(_QWORD *)(v6 + 120) = v23;
          *(_QWORD *)(v6 + 184) = 0;
          *(_QWORD *)(v6 + 200) = 0;
          *(_QWORD *)(v6 + 272) = xsltGetDefaultSecurityPrefs();
          *(_DWORD *)(v6 + 344) = xslDebugStatus;
          *(_QWORD *)(v6 + 352) = &xsltDefaultTrace;
          *(_DWORD *)(v6 + 192) = xsltDoXIncludeDefault;
          *(_DWORD *)(v6 + 456) = 0;
          return (xsltTransformContextPtr)v6;
        }
        xsltTransformError((xsltTransformContextPtr)v6, 0, (xmlNodePtr)doc, "xsltNewTransformContext : xsltNewDocument failed\n");
        goto LABEL_30;
      }
      v15 = extrasNr + 20;
      *(_DWORD *)(v6 + 252) = v15;
      v16 = (*v4)(24 * v15);
      *(_QWORD *)(v6 + 256) = v16;
      if (v16)
      {
        *(_DWORD *)(v6 + 248) = style->extrasNr;
        if (*(int *)(v6 + 252) >= 1)
        {
          v17 = 0;
          v18 = 0;
          do
          {
            v19 = (_QWORD *)(*(_QWORD *)(v6 + 256) + v17);
            ++v18;
            *v19 = 0;
            v19[1] = 0;
            v19[2] = 0;
            v17 += 24;
          }
          while (v18 < *(int *)(v6 + 252));
        }
        goto LABEL_25;
      }
    }
    v20 = *__xmlGenericError();
    v21 = __xmlGenericErrorContext();
    v20(*v21, "xsltNewTransformContext: out of memory\n");
    goto LABEL_30;
  }
  xsltTransformError(0, 0, (xmlNodePtr)doc, "xsltNewTransformContext : malloc failed\n");
  return (xsltTransformContextPtr)v6;
}

void xsltRegisterAllElement(xsltTransformContextPtr ctxt)
{
  xsltRegisterExtElement(ctxt, (const xmlChar *)"apply-templates", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform", xsltApplyTemplates);
  xsltRegisterExtElement(ctxt, (const xmlChar *)"apply-imports", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform", xsltApplyImports);
  xsltRegisterExtElement(ctxt, (const xmlChar *)"call-template", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform", xsltCallTemplate);
  xsltRegisterExtElement(ctxt, (const xmlChar *)"element", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform", xsltElement);
  xsltRegisterExtElement(ctxt, (const xmlChar *)"attribute", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform", xsltAttribute);
  xsltRegisterExtElement(ctxt, (const xmlChar *)"text", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform", xsltText);
  xsltRegisterExtElement(ctxt, (const xmlChar *)"processing-instruction", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform", xsltProcessingInstruction);
  xsltRegisterExtElement(ctxt, (const xmlChar *)"comment", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform", xsltComment);
  xsltRegisterExtElement(ctxt, (const xmlChar *)"copy", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform", xsltCopy);
  xsltRegisterExtElement(ctxt, (const xmlChar *)"value-of", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform", xsltValueOf);
  xsltRegisterExtElement(ctxt, (const xmlChar *)"number", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform", xsltNumber);
  xsltRegisterExtElement(ctxt, (const xmlChar *)"for-each", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform", xsltForEach);
  xsltRegisterExtElement(ctxt, (const xmlChar *)"if", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform", xsltIf);
  xsltRegisterExtElement(ctxt, (const xmlChar *)"choose", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform", xsltChoose);
  xsltRegisterExtElement(ctxt, (const xmlChar *)"sort", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform", xsltSort);
  xsltRegisterExtElement(ctxt, (const xmlChar *)"copy-of", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform", xsltCopyOf);
  xsltRegisterExtElement(ctxt, (const xmlChar *)"message", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform", (xsltTransformFunction)xsltMessageWrapper);
  xsltRegisterExtElement(ctxt, (const xmlChar *)"variable", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform", xsltDebug);
  xsltRegisterExtElement(ctxt, (const xmlChar *)"param", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform", xsltDebug);
  xsltRegisterExtElement(ctxt, (const xmlChar *)"with-param", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform", xsltDebug);
  xsltRegisterExtElement(ctxt, (const xmlChar *)"decimal-format", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform", xsltDebug);
  xsltRegisterExtElement(ctxt, (const xmlChar *)"when", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform", xsltDebug);
  xsltRegisterExtElement(ctxt, (const xmlChar *)"otherwise", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform", xsltDebug);
  xsltRegisterExtElement(ctxt, (const xmlChar *)"fallback", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform", xsltDebug);
}

void xsltFreeTransformContext(xsltTransformContextPtr ctxt)
{
  xmlXPathContextPtr xpathCtxt;
  void (**v3)(void);
  int extrasNr;
  uint64_t v5;
  uint64_t i;
  xsltRuntimeExtraPtr extras;
  void (*deallocate)(void);
  xsltTransformCachePtr cache;
  xmlDoc *RVT;
  _xmlNode *next;
  _QWORD *p_next;
  _QWORD *v13;
  __int128 v14;

  if (ctxt)
  {
    xsltShutdownCtxtExts(ctxt);
    xpathCtxt = ctxt->xpathCtxt;
    if (xpathCtxt)
    {
      xpathCtxt->nsHash = 0;
      xmlXPathFreeContext(xpathCtxt);
    }
    v3 = (void (**)(void))MEMORY[0x24BEDE758];
    if (ctxt->templTab)
      ((void (*)(void))*MEMORY[0x24BEDE758])();
    if (ctxt->varsTab)
      (*v3)();
    if (ctxt->profTab)
      (*v3)();
    extrasNr = ctxt->extrasNr;
    if (extrasNr >= 1 && ctxt->extras)
    {
      v5 = 0;
      for (i = 0; i < extrasNr; ++i)
      {
        extras = ctxt->extras;
        deallocate = (void (*)(void))extras[v5].deallocate;
        if (deallocate && extras[v5].info)
        {
          deallocate();
          extrasNr = ctxt->extrasNr;
        }
        ++v5;
      }
      ((void (*)(xsltRuntimeExtraPtr))*v3)(ctxt->extras);
    }
    xsltFreeGlobalVariables(ctxt);
    xsltFreeDocuments(ctxt);
    xsltFreeCtxtExts(ctxt);
    xsltFreeRVTs(ctxt);
    cache = ctxt->cache;
    if (cache)
    {
      RVT = cache->RVT;
      if (cache->RVT)
      {
        do
        {
          next = RVT->next;
          if (RVT->_private)
          {
            xsltFreeDocumentKeys((xsltDocumentPtr)RVT->_private);
            ((void (*)(void *))*v3)(RVT->_private);
          }
          xmlFreeDoc(RVT);
          RVT = (xmlDoc *)next;
        }
        while (next);
      }
      p_next = &cache->stackItems->next;
      if (p_next)
      {
        do
        {
          v13 = (_QWORD *)*p_next;
          (*v3)();
          p_next = v13;
        }
        while (v13);
      }
      ((void (*)(xsltTransformCachePtr))*v3)(cache);
    }
    xmlDictFree(ctxt->dict);
    xsltGenericDebug(xsltGenericDebugContext, "freeing transformation dictionary\n");
    ctxt->currentId = -1;
    *(_QWORD *)&v14 = -1;
    *((_QWORD *)&v14 + 1) = -1;
    *(_OWORD *)&ctxt->maxTemplateDepth = v14;
    *(_OWORD *)&ctxt->opCount = v14;
    *(_OWORD *)&ctxt->contextVariable = v14;
    *(_OWORD *)&ctxt->localRVTBase = v14;
    *(_OWORD *)&ctxt->currentTemplateRule = v14;
    *(_OWORD *)&ctxt->initialContextDoc = v14;
    *(_OWORD *)&ctxt->dict = v14;
    *(_OWORD *)&ctxt->internalized = v14;
    *(_OWORD *)&ctxt->lasttsize = v14;
    *(_OWORD *)&ctxt->traceCode = v14;
    *(_OWORD *)&ctxt->tmpRVT = v14;
    *(_OWORD *)&ctxt->ctxtflags = v14;
    *(_OWORD *)&ctxt->sec = v14;
    *(_OWORD *)&ctxt->errctx = v14;
    *(_OWORD *)&ctxt->_private = v14;
    *(_OWORD *)&ctxt->extras = v14;
    *(_OWORD *)&ctxt->profile = v14;
    *(_OWORD *)&ctxt->profNr = v14;
    *(_OWORD *)&ctxt->globalVars = v14;
    *(_OWORD *)&ctxt->xinclude = v14;
    *(_OWORD *)&ctxt->output = v14;
    *(_OWORD *)&ctxt->xpathCtxt = v14;
    *(_OWORD *)&ctxt->docList = v14;
    *(_OWORD *)&ctxt->node = v14;
    *(_OWORD *)&ctxt->extElements = v14;
    *(_OWORD *)&ctxt->mode = v14;
    *(_OWORD *)&ctxt->varsNr = v14;
    *(_OWORD *)&ctxt->varsBase = v14;
    *(_OWORD *)&ctxt->templ = v14;
    *(_OWORD *)&ctxt->templTab = v14;
    *(_OWORD *)&ctxt->style = v14;
    ((void (*)(xsltTransformContextPtr))*v3)(ctxt);
  }
}

xmlNodePtr xsltCopyTextString(xsltTransformContextPtr ctxt, xmlNodePtr target, const xmlChar *string, int noescape)
{
  unint64_t *traceCode;
  size_t v9;
  _xmlNode *last;
  xmlNodePtr v11;
  xmlNodePtr v12;
  xmlHashTable *cdataSection;
  xmlNs *ns;
  xmlNodePtr v15;

  if (!string)
    return 0;
  traceCode = ctxt->traceCode;
  if (traceCode && (*(_BYTE *)traceCode & 1) != 0)
    xsltGenericDebug(xsltGenericDebugContext, "xsltCopyTextString: copy text %s\n", (const char *)string);
  if (!target || !target->children)
    ctxt->lasttext = 0;
  v9 = xmlStrlen(string);
  if (ctxt->type == XSLT_OUTPUT_XML)
  {
    if (target)
    {
      cdataSection = ctxt->style->cdataSection;
      if (cdataSection)
      {
        if (target->type == XML_ELEMENT_NODE)
        {
          ns = target->ns;
          if (!ns)
          {
            if (xmlHashLookup2(cdataSection, target->name, 0))
              goto LABEL_37;
            ns = target->ns;
            if (!ns)
              goto LABEL_9;
            cdataSection = ctxt->style->cdataSection;
          }
          if (!xmlHashLookup2(cdataSection, target->name, ns->href))
            goto LABEL_9;
LABEL_37:
          last = target->last;
          if (last && last->type == XML_CDATA_SECTION_NODE)
            return xsltAddTextString(ctxt, last, (xmlChar *)string, v9);
          v15 = xmlNewCDataBlock(ctxt->output, string, v9);
          goto LABEL_29;
        }
      }
    }
  }
LABEL_9:
  if (!noescape)
  {
    if (target)
    {
      last = target->last;
      if (last)
      {
        if (last->type == XML_TEXT_NODE && last->name == (const xmlChar *)MEMORY[0x24BEDEC68])
          return xsltAddTextString(ctxt, last, (xmlChar *)string, v9);
      }
    }
    v15 = xmlNewTextLen(string, v9);
LABEL_29:
    v12 = v15;
    if (!target)
      goto LABEL_32;
    goto LABEL_30;
  }
  if (!target
    || (last = target->last) == 0
    || last->type != XML_TEXT_NODE
    || last->name != (const xmlChar *)MEMORY[0x24BEDEC70])
  {
    v11 = xmlNewTextLen(string, v9);
    if (!v11)
      goto LABEL_34;
    v12 = v11;
    v11->name = (const xmlChar *)MEMORY[0x24BEDEC70];
    if (!target)
    {
LABEL_32:
      if (v12)
      {
        ctxt->lasttext = v12->content;
        ctxt->lasttsize = v9;
        ctxt->lasttuse = v9;
        return v12;
      }
LABEL_34:
      xsltTransformError(ctxt, 0, target, "xsltCopyTextString: text copy failed\n");
      v12 = 0;
      ctxt->lasttext = 0;
      return v12;
    }
LABEL_30:
    if (v12)
      v12 = xmlAddChild(target, v12);
    goto LABEL_32;
  }
  return xsltAddTextString(ctxt, last, (xmlChar *)string, v9);
}

xmlNodePtr xsltAddTextString(xsltTransformContextPtr ctxt, xmlNodePtr cur, xmlChar *content, size_t __n)
{
  xmlNodePtr v4;
  unsigned int v6;
  xmlChar *lasttext;
  const xmlChar *v9;
  int v10;
  int lasttuse;
  int lasttsize;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  uint64_t v17;

  v4 = cur;
  if (cur)
  {
    if (content)
    {
      v6 = __n;
      if ((int)__n >= 1)
      {
        lasttext = (xmlChar *)ctxt->lasttext;
        if (lasttext != cur->content)
        {
          xmlNodeAddContent(cur, content);
          v9 = v4->content;
          ctxt->lasttext = v9;
          v10 = xmlStrlen(v9);
          ctxt->lasttsize = v10;
          ctxt->lasttuse = v10;
          return v4;
        }
        lasttuse = ctxt->lasttuse;
        if ((lasttuse ^ 0x7FFFFFFFu) > __n)
        {
          lasttsize = ctxt->lasttsize;
          if (lasttsize > lasttuse + (int)__n)
          {
LABEL_16:
            memcpy(&lasttext[lasttuse], content, v6);
            v17 = ctxt->lasttuse + (uint64_t)(int)v6;
            ctxt->lasttuse = v17;
            v4->content[v17] = 0;
            return v4;
          }
          if (lasttuse + (int)__n <= 99)
            v13 = 99;
          else
            v13 = lasttuse + __n;
          v14 = lasttsize ^ 0x7FFFFFFF;
          v15 = v13 + lasttsize;
          if (v13 < v14)
            v16 = v15 + 1;
          else
            v16 = 0x7FFFFFFF;
          lasttext = (xmlChar *)((uint64_t (*)(void))*MEMORY[0x24BEDEB10])();
          if (lasttext)
          {
            ctxt->lasttsize = v16;
            ctxt->lasttext = lasttext;
            v4->content = lasttext;
            lasttuse = ctxt->lasttuse;
            goto LABEL_16;
          }
        }
        xsltTransformError(ctxt, 0, v4, "xsltCopyText: text allocation failed\n");
        return 0;
      }
    }
  }
  return v4;
}

void xsltAddChild(xmlNode *a1, xmlNodePtr cur)
{
  if (cur)
  {
    if (a1)
      xmlAddChild(a1, cur);
    else
      xmlFreeNode(cur);
  }
}

void xsltProcessOneNode(xsltTransformContextPtr ctxt, xmlNodePtr node, xsltStackElemPtr params)
{
  xsltTemplatePtr Template;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  xmlElementType type;
  xsltTemplate *v14;
  xsltTemplate *currentTemplateRule;
  unint64_t *v16;
  unint64_t *v17;
  unint64_t *traceCode;
  unint64_t *v19;
  unint64_t *v20;
  unint64_t *v21;
  unint64_t *v22;
  xmlNode *v23;
  char v24;

  Template = xsltGetTemplate(ctxt, node, 0);
  type = node->type;
  if (Template)
  {
    v14 = Template;
    currentTemplateRule = ctxt->currentTemplateRule;
    ctxt->currentTemplateRule = Template;
    if (type == XML_DOCUMENT_NODE)
    {
      traceCode = ctxt->traceCode;
      if (traceCode && (*(_BYTE *)traceCode & 2) != 0)
        xsltGenericDebug(xsltGenericDebugContext, "xsltProcessOneNode: applying template '%s' for /\n", v7, v8, v9, v10, v11, v12, (char)Template->match);
    }
    else if (type == XML_ATTRIBUTE_NODE)
    {
      v16 = ctxt->traceCode;
      if (v16)
      {
        if ((*(_BYTE *)v16 & 2) != 0)
          xsltGenericDebug(xsltGenericDebugContext, "xsltProcessOneNode: applying template '%s' for attribute %s\n", v7, v8, v9, v10, v11, v12, (char)Template->match);
      }
    }
    else
    {
      v19 = ctxt->traceCode;
      if (v19 && (*(_BYTE *)v19 & 2) != 0)
        xsltGenericDebug(xsltGenericDebugContext, "xsltProcessOneNode: applying template '%s' for %s\n", v7, v8, v9, v10, v11, v12, (char)Template->match);
    }
    xsltApplyXSLTTemplate((uint64_t)ctxt, node, v14->content, v14, params);
    ctxt->currentTemplateRule = currentTemplateRule;
  }
  else
  {
    switch(type)
    {
      case XML_ATTRIBUTE_NODE:
        v20 = ctxt->traceCode;
        if (v20 && (*(_BYTE *)v20 & 2) != 0)
          xsltGenericDebug(xsltGenericDebugContext, "xsltProcessOneNode: no template found for attribute %s\n", v7, v8, v9, v10, v11, v12, (char)node->name);
        break;
      case XML_CDATA_SECTION_NODE:
        v21 = ctxt->traceCode;
        if (v21 && (*(_BYTE *)v21 & 2) != 0)
          xsltGenericDebug(xsltGenericDebugContext, "xsltProcessOneNode: no template found for CDATA\n", v7, v8, v9, v10, v11, v12, v24);
        break;
      case XML_DOCUMENT_NODE:
        v17 = ctxt->traceCode;
        if (v17 && (*(_BYTE *)v17 & 2) != 0)
          xsltGenericDebug(xsltGenericDebugContext, "xsltProcessOneNode: no template found for /\n", v7, v8, v9, v10, v11, v12, v24);
        break;
      default:
        v22 = ctxt->traceCode;
        if (v22 && (*(_BYTE *)v22 & 2) != 0)
          xsltGenericDebug(xsltGenericDebugContext, "xsltProcessOneNode: no template found for %s\n", v7, v8, v9, v10, v11, v12, (char)node->name);
        break;
    }
    v23 = ctxt->node;
    ctxt->node = node;
    xsltDefaultProcessOneNode(ctxt, node, params);
    ctxt->node = v23;
  }
}

void xsltDefaultProcessOneNode(xsltTransformContextPtr ctxt, xmlNodePtr node, xsltStackElemPtr params)
{
  _xmlNode *children;
  int v7;
  _xmlNode *v8;
  unsigned int type;
  BOOL v10;
  int v11;
  uint64_t v13;
  int v14;
  xmlXPathContextPtr xpathCtxt;
  xsltTemplatePtr v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  xsltTemplate *v23;
  xmlElementType v24;
  unint64_t *v25;
  xsltTemplatePtr Template;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t *traceCode;
  xsltTemplatePtr v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t *v41;
  unint64_t *v42;
  xmlXPathContextPtr v43;
  unint64_t *v44;
  xmlXPathContextPtr v45;
  _xmlNode *i;
  unint64_t *v47;
  xmlNodePtr insert;
  xsltTransformContextPtr v49;
  xmlNodePtr v50;
  unint64_t *v51;
  unint64_t *v52;
  char v53;

  if (ctxt->state != XSLT_STATE_STOPPED)
  {
    switch(node->type)
    {
      case XML_ELEMENT_NODE:
      case XML_DOCUMENT_NODE:
      case XML_HTML_DOCUMENT_NODE:
        children = node->children;
        if (children)
        {
          v7 = 0;
          v8 = node->children;
          do
          {
            type = v8->type;
            v10 = type > 0xD;
            v11 = (1 << type) & 0x239E;
            if (!v10 && v11 != 0)
              ++v7;
            v8 = v8->next;
          }
          while (v8);
          v13 = *(_QWORD *)&ctxt->xpathCtxt->contextSize;
          v14 = 1;
          do
          {
            switch(children->type)
            {
              case XML_ELEMENT_NODE:
              case XML_DOCUMENT_NODE:
              case XML_HTML_DOCUMENT_NODE:
                xpathCtxt = ctxt->xpathCtxt;
                xpathCtxt->contextSize = v7;
                xpathCtxt->proximityPosition = v14;
                xsltProcessOneNode(ctxt, children, params);
                break;
              case XML_TEXT_NODE:
                Template = xsltGetTemplate(ctxt, children, 0);
                if (Template)
                {
                  v23 = Template;
                  traceCode = ctxt->traceCode;
                  if (traceCode)
                  {
                    if ((*(_BYTE *)traceCode & 2) != 0)
                      xsltGenericDebug(xsltGenericDebugContext, "xsltDefaultProcessOneNode: applying template for text %s\n", v27, v28, v29, v30, v31, v32, (char)children->content);
                  }
                  goto LABEL_31;
                }
                v44 = ctxt->traceCode;
                if (children->content)
                {
                  if (v44 && (*(_BYTE *)v44 & 2) != 0)
                    xsltGenericDebug(xsltGenericDebugContext, "xsltDefaultProcessOneNode: copy text %s\n", v27, v28, v29, v30, v31, v32, (char)children->content);
                }
                else if (v44 && (*(_BYTE *)v44 & 2) != 0)
                {
                  xsltGenericDebug(xsltGenericDebugContext, "xsltDefaultProcessOneNode: copy empty text\n");
                }
                if (!xsltCopyText((uint64_t)ctxt, (uint64_t)ctxt->insert, (uint64_t)children, 0))
                  xsltTransformError(ctxt, 0, children, "xsltDefaultProcessOneNode: text copy failed\n");
                break;
              case XML_CDATA_SECTION_NODE:
                v34 = xsltGetTemplate(ctxt, children, 0);
                v41 = ctxt->traceCode;
                if (v34)
                {
                  v23 = v34;
                  if (v41 && (*(_BYTE *)v41 & 2) != 0)
                    xsltGenericDebug(xsltGenericDebugContext, "xsltDefaultProcessOneNode: applying template for CDATA %s\n", v35, v36, v37, v38, v39, v40, (char)children->content);
                  goto LABEL_32;
                }
                if (v41 && (*(_BYTE *)v41 & 2) != 0)
                  xsltGenericDebug(xsltGenericDebugContext, "xsltDefaultProcessOneNode: copy CDATA %s\n", v35, v36, v37, v38, v39, v40, (char)children->content);
                if (!xsltCopyText((uint64_t)ctxt, (uint64_t)ctxt->insert, (uint64_t)children, 0))
                  xsltTransformError(ctxt, 0, children, "xsltDefaultProcessOneNode: cdata copy failed\n");
                break;
              case XML_PI_NODE:
              case XML_COMMENT_NODE:
                v16 = xsltGetTemplate(ctxt, children, 0);
                if (v16)
                {
                  v23 = v16;
                  v24 = children->type;
                  if (v24 == XML_COMMENT_NODE)
                  {
                    v42 = ctxt->traceCode;
                    if (v42 && (*(_BYTE *)v42 & 2) != 0)
                      xsltGenericDebug(xsltGenericDebugContext, "xsltDefaultProcessOneNode: template found for comment\n", v17, v18, v19, v20, v21, v22, v53);
                  }
                  else if (v24 == XML_PI_NODE)
                  {
                    v25 = ctxt->traceCode;
                    if (v25)
                    {
                      if ((*(_BYTE *)v25 & 2) != 0)
                        xsltGenericDebug(xsltGenericDebugContext, "xsltDefaultProcessOneNode: template found for PI %s\n", v17, v18, v19, v20, v21, v22, (char)children->name);
                    }
                  }
LABEL_31:
                  v43 = ctxt->xpathCtxt;
                  v43->contextSize = v7;
                  v43->proximityPosition = v14;
LABEL_32:
                  xsltApplyXSLTTemplate((uint64_t)ctxt, children, v23->content, v23, params);
                }
                break;
              default:
                break;
            }
            children = children->next;
            ++v14;
          }
          while (children);
          v45 = ctxt->xpathCtxt;
        }
        else
        {
          v45 = ctxt->xpathCtxt;
          v13 = *(_QWORD *)&v45->contextSize;
        }
        *(_QWORD *)&v45->contextSize = v13;
        break;
      case XML_ATTRIBUTE_NODE:
        for (i = node->children; i; i = i->next)
        {
          if (i->type == XML_TEXT_NODE)
          {
            v52 = ctxt->traceCode;
            if (i->content)
            {
              if (v52 && (*(_BYTE *)v52 & 2) != 0)
                xsltGenericDebug(xsltGenericDebugContext, "xsltDefaultProcessOneNode: copy text %s\n", (const char *)i->content);
            }
            else if (v52 && (*(_BYTE *)v52 & 2) != 0)
            {
              xsltGenericDebug(xsltGenericDebugContext, "xsltDefaultProcessOneNode: copy empty text\n", params);
            }
            insert = ctxt->insert;
            v49 = ctxt;
            v50 = i;
            goto LABEL_77;
          }
        }
        xsltTransformError(ctxt, 0, node, "xsltDefaultProcessOneNode: no text for attribute\n");
        break;
      case XML_TEXT_NODE:
        v47 = ctxt->traceCode;
        if (node->content)
        {
          if (v47 && (*(_BYTE *)v47 & 2) != 0)
            xsltGenericDebug(xsltGenericDebugContext, "xsltDefaultProcessOneNode: copy text %s\n", (const char *)node->content);
          insert = ctxt->insert;
          v49 = ctxt;
          v50 = node;
LABEL_77:
          if (!xsltCopyText((uint64_t)v49, (uint64_t)insert, (uint64_t)v50, 0))
            xsltTransformError(ctxt, 0, node, "xsltDefaultProcessOneNode: text copy failed\n");
        }
        else if (v47 && (*(_BYTE *)v47 & 2) != 0)
        {
          xsltGenericDebug(xsltGenericDebugContext, "xsltDefaultProcessOneNode: copy empty text\n");
        }
        break;
      case XML_CDATA_SECTION_NODE:
        v51 = ctxt->traceCode;
        if (v51 && (*(_BYTE *)v51 & 2) != 0)
          xsltGenericDebug(xsltGenericDebugContext, "xsltDefaultProcessOneNode: copy CDATA %s\n", (const char *)node->content);
        if (!xsltCopyText((uint64_t)ctxt, (uint64_t)ctxt->insert, (uint64_t)node, 0))
          xsltTransformError(ctxt, 0, node, "xsltDefaultProcessOneNode: cdata copy failed\n");
        break;
      default:
        return;
    }
  }
}

void xsltApplyXSLTTemplate(uint64_t a1, xmlNode *a2, xmlNodePtr source, xsltTemplatePtr templ, xsltStackElem *a5)
{
  xmlNodePtr v6;
  xmlNodePtr started;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  xmlGenericErrorFunc v15;
  void *v16;
  uint64_t v17;
  xmlGenericErrorFunc v18;
  void *v19;
  xsltTemplate *v20;
  uint64_t templMax;
  uint64_t (**v22)(int *, uint64_t);
  int *v23;
  xmlGenericErrorFunc v24;
  void *v25;
  uint64_t (**v26)(uint64_t);
  int *v27;
  uint64_t templNr;
  uint64_t v29;
  xsltTemplatePtr *templCalledTab;
  xmlGenericErrorFunc v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  xmlGenericErrorFunc v35;
  void *v36;
  uint64_t v37;
  xmlGenericErrorFunc v38;
  void *v39;
  _BYTE *v40;
  xmlNode *next;
  xmlElementType type;
  xmlNodePtr *p_next;
  const xmlChar *name;
  xmlNs *ns;
  _QWORD *psvi;
  xsltStackElem *v47;
  int v48;
  int v49;
  xsltStackElem *v50;
  BOOL v51;
  int v52;
  uint64_t v53;
  xmlDoc *v54;
  _xmlNode *v55;
  int v56;
  unsigned int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  int v71;

  v71 = 0;
  if (!a1)
    return;
  v6 = source;
  if (!templ)
  {
    xsltTransformError((xsltTransformContextPtr)a1, 0, source, "xsltApplyXSLTTemplate: Bad arguments; @templ is mandatory.\n");
    return;
  }
  if (*(_DWORD *)(a1 + 344))
  {
    started = xsltDebuggerStartSequenceConstructor((xsltTransformContext *)a1, a2, source, templ, &v71);
    if (!v6 || !started)
      return;
  }
  else if (!source)
  {
    return;
  }
  if (*(_DWORD *)(a1 + 168) == 2)
    return;
  v11 = *(_DWORD *)(a1 + 48);
  if (v11 >= *(_DWORD *)(a1 + 468))
  {
    xsltTransformError((xsltTransformContextPtr)a1, 0, v6, "xsltApplyXSLTTemplate: A potential infinite template recursion was detected.\nYou can adjust maxTemplateVars (--maxvars) in order to raise the maximum number of variables/params (currently set to %d).\n", *(_DWORD *)(a1 + 468));
    xsltDebug((xsltTransformContextPtr)a1, a2, v6, 0);
    *(_DWORD *)(a1 + 168) = 2;
    return;
  }
  v70 = *(_QWORD *)(a1 + 304);
  *(_QWORD *)(a1 + 304) = 0;
  v12 = *(_DWORD *)(a1 + 64);
  *(_DWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 128) = a2;
  if (!*(_DWORD *)(a1 + 208))
  {
    v69 = 0;
    goto LABEL_40;
  }
  ++templ->nbCalls;
  v69 = xsltTimestamp();
  v13 = *(int *)(a1 + 228);
  if (!(_DWORD)v13)
  {
    *(_DWORD *)(a1 + 228) = 4;
    v14 = ((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(32);
    *(_QWORD *)(a1 + 232) = v14;
    if (!v14)
    {
      v15 = *__xmlGenericError();
      v16 = *__xmlGenericErrorContext();
      v15(v16, "malloc failed !\n");
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  if (*(_DWORD *)(a1 + 224) < (int)v13)
  {
    v14 = *(_QWORD *)(a1 + 232);
LABEL_20:
    v17 = *(int *)(a1 + 224);
    *(_QWORD *)(v14 + 8 * v17) = 0;
    *(_QWORD *)(a1 + 216) = 0;
    *(_DWORD *)(a1 + 224) = v17 + 1;
    goto LABEL_22;
  }
  *(_DWORD *)(a1 + 228) = 2 * v13;
  v14 = ((uint64_t (*)(_QWORD, uint64_t))*MEMORY[0x24BEDEB10])(*(_QWORD *)(a1 + 232), 16 * v13);
  *(_QWORD *)(a1 + 232) = v14;
  if (v14)
    goto LABEL_20;
  v18 = *__xmlGenericError();
  v19 = *__xmlGenericErrorContext();
  v18(v19, "realloc failed !\n");
LABEL_22:
  v20 = *(xsltTemplate **)(a1 + 16);
  templMax = templ->templMax;
  if ((_DWORD)templMax)
  {
    if (templ->templNr >= (int)templMax)
    {
      templ->templMax = 2 * templMax;
      v22 = (uint64_t (**)(int *, uint64_t))MEMORY[0x24BEDEB10];
      templ->templCalledTab = (xsltTemplatePtr *)((uint64_t (*)(xsltTemplatePtr *, uint64_t))*MEMORY[0x24BEDEB10])(templ->templCalledTab, 16 * templMax);
      v23 = (int *)(*v22)(templ->templCountTab, 4 * templ->templMax);
      templ->templCountTab = v23;
      if (!templ->templCalledTab || !v23)
      {
        v24 = *__xmlGenericError();
        v25 = *__xmlGenericErrorContext();
        v24(v25, "realloc failed !\n");
        goto LABEL_40;
      }
    }
  }
  else
  {
    templ->templMax = 4;
    v26 = (uint64_t (**)(uint64_t))MEMORY[0x24BEDE910];
    templ->templCalledTab = (xsltTemplatePtr *)((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(32);
    v27 = (int *)(*v26)(4 * templ->templMax);
    templ->templCountTab = v27;
    if (!templ->templCalledTab || !v27)
    {
      v31 = *__xmlGenericError();
      v32 = *__xmlGenericErrorContext();
      v31(v32, "malloc failed !\n");
      goto LABEL_40;
    }
  }
  templNr = templ->templNr;
  if ((int)templNr < 1)
  {
    LODWORD(v29) = 0;
  }
  else
  {
    v29 = 0;
    templCalledTab = templ->templCalledTab;
    while (templCalledTab[v29] != v20)
    {
      if (templNr == ++v29)
        goto LABEL_38;
    }
    ++templ->templCountTab[v29];
    LODWORD(templNr) = templ->templNr;
  }
  if ((_DWORD)v29 == (_DWORD)templNr)
  {
    templCalledTab = templ->templCalledTab;
LABEL_38:
    templCalledTab[(int)templNr] = v20;
    templ->templCountTab[(int)templNr] = 1;
    ++templ->templNr;
  }
LABEL_40:
  v33 = *(int *)(a1 + 28);
  if (!(_DWORD)v33)
  {
    *(_DWORD *)(a1 + 28) = 4;
    v34 = ((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(32);
    *(_QWORD *)(a1 + 32) = v34;
    if (!v34)
    {
      v35 = *__xmlGenericError();
      v36 = *__xmlGenericErrorContext();
      v35(v36, "malloc failed !\n");
      goto LABEL_48;
    }
    goto LABEL_46;
  }
  if (*(_DWORD *)(a1 + 24) < (int)v33)
  {
    v34 = *(_QWORD *)(a1 + 32);
LABEL_46:
    v37 = *(int *)(a1 + 24);
    *(_QWORD *)(v34 + 8 * v37) = templ;
    *(_QWORD *)(a1 + 16) = templ;
    *(_DWORD *)(a1 + 24) = v37 + 1;
    goto LABEL_48;
  }
  *(_DWORD *)(a1 + 28) = 2 * v33;
  v34 = ((uint64_t (*)(_QWORD, uint64_t))*MEMORY[0x24BEDEB10])(*(_QWORD *)(a1 + 32), 16 * v33);
  *(_QWORD *)(a1 + 32) = v34;
  if (v34)
    goto LABEL_46;
  v38 = *__xmlGenericError();
  v39 = *__xmlGenericErrorContext();
  v38(v39, "realloc failed !\n");
LABEL_48:
  if (templ->name)
  {
    v40 = *(_BYTE **)(a1 + 352);
    if (v40)
    {
      if ((*v40 & 4) != 0)
        xsltGenericDebug(xsltGenericDebugContext, "applying xsl:template '%s'\n", (const char *)templ->name);
    }
  }
  next = v6;
  do
  {
    type = v6->type;
    if (type != XML_ELEMENT_NODE)
    {
      if (type != XML_TEXT_NODE)
        break;
      p_next = &v6->next;
      goto LABEL_68;
    }
    name = v6->name;
    if (*name != 112)
      break;
    if (!v6->psvi)
      break;
    if (!xmlStrEqual(name, (const xmlChar *)"param"))
      break;
    if (v6->type != XML_ELEMENT_NODE)
      break;
    ns = v6->ns;
    if (!ns || !xmlStrEqual(ns->href, (const xmlChar *)"http://www.w3.org/1999/XSL/Transform"))
      break;
    p_next = &v6->next;
    next = v6->next;
    if (a5)
    {
      psvi = v6->psvi;
      v47 = a5;
      while (v47->name != (const xmlChar *)psvi[15] || v47->nameURI != (const xmlChar *)psvi[17])
      {
        v47 = v47->next;
        if (!v47)
          goto LABEL_67;
      }
      xsltLocalVariablePush((xsltTransformContextPtr)a1, v47, -1);
    }
    else
    {
LABEL_67:
      xsltParseStylesheetParam((xsltTransformContextPtr)a1, v6);
    }
LABEL_68:
    v6 = *p_next;
  }
  while (*p_next);
  xsltApplySequenceConstructor(a1, a2, next, templ);
  v48 = *(_DWORD *)(a1 + 48);
  v49 = *(_DWORD *)(a1 + 64);
  if (v48 > v49)
  {
    do
    {
      v50 = *(xsltStackElem **)(*(_QWORD *)(a1 + 56) + 8 * --v48);
      if ((v50->level & 0x80000000) == 0)
      {
        xsltFreeStackElemList(v50);
        v49 = *(_DWORD *)(a1 + 64);
        v48 = *(_DWORD *)(a1 + 48) - 1;
      }
      *(_DWORD *)(a1 + 48) = v48;
    }
    while (v48 > v49);
    v51 = __OFSUB__(v48, 1);
    v52 = v48 - 1;
    if (v52 < 0 != v51)
      v53 = 0;
    else
      v53 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v52);
    *(_QWORD *)(a1 + 40) = v53;
  }
  *(_DWORD *)(a1 + 64) = v12;
  v54 = *(xmlDoc **)(a1 + 304);
  if (v54)
  {
    do
    {
      v55 = v54->next;
      xsltReleaseRVT((xsltTransformContextPtr)a1, v54);
      v54 = (xmlDoc *)v55;
    }
    while (v55);
  }
  *(_QWORD *)(a1 + 304) = v70;
  v56 = *(_DWORD *)(a1 + 24);
  v57 = v56 - 1;
  if (v56 >= 1)
  {
    *(_DWORD *)(a1 + 24) = v57;
    v58 = *(_QWORD *)(a1 + 32);
    if (v56 == 1)
      v59 = 0;
    else
      v59 = *(_QWORD *)(v58 + 8 * (v56 - 2));
    *(_QWORD *)(a1 + 16) = v59;
    *(_QWORD *)(v58 + 8 * v57) = 0;
  }
  if (*(_DWORD *)(a1 + 208))
  {
    v60 = xsltTimestamp();
    v61 = *(_DWORD *)(a1 + 224);
    v62 = v61 - 1;
    if (v61 < 1)
    {
      v64 = 0;
      v62 = *(_DWORD *)(a1 + 224);
    }
    else
    {
      *(_DWORD *)(a1 + 224) = v62;
      v63 = *(_QWORD *)(a1 + 232);
      if (v61 == 1)
        v65 = 0;
      else
        v65 = *(_QWORD *)(v63 + 8 * (v61 - 2));
      *(_QWORD *)(a1 + 216) = v65;
      v64 = *(_QWORD *)(v63 + 8 * v62);
      *(_QWORD *)(v63 + 8 * v62) = 0;
    }
    v66 = v60 - v69;
    v51 = __OFSUB__(v60 - v69, v64);
    v67 = v60 - v69 - v64;
    if ((v67 < 0) ^ v51 | (v67 == 0))
    {
      xsltCalibrateAdjust(v67);
      v67 = 0;
      v62 = *(_DWORD *)(a1 + 224);
    }
    templ->time += v67;
    v51 = __OFSUB__(v62, 1);
    v68 = v62 - 1;
    if (v68 < 0 == v51)
      *(_QWORD *)(*(_QWORD *)(a1 + 232) + 8 * v68) += v66;
  }
  if (*(_DWORD *)(a1 + 344))
  {
    if (v71)
      xslDropCall();
  }
}

int xsltLocalVariablePush(xsltTransformContextPtr ctxt, xsltStackElemPtr variable, int level)
{
  int varsMax;
  xsltStackElemPtr *v7;
  int varsNr;
  xsltStackElemPtr *varsTab;
  int v10;
  int v11;
  xmlGenericErrorFunc v12;
  void *v13;
  const char *v14;

  varsMax = ctxt->varsMax;
  if (!varsMax)
  {
    ctxt->varsMax = 10;
    v7 = (xsltStackElemPtr *)((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(80);
    ctxt->varsTab = v7;
    if (!v7)
    {
      v12 = *__xmlGenericError();
      v13 = *__xmlGenericErrorContext();
      v14 = "malloc failed !\n";
      goto LABEL_11;
    }
    varsMax = ctxt->varsMax;
  }
  varsNr = ctxt->varsNr;
  if (varsNr >= varsMax)
  {
    v10 = 2 * varsMax;
    ctxt->varsMax = v10;
    varsTab = (xsltStackElemPtr *)((uint64_t (*)(xsltStackElemPtr *, uint64_t))*MEMORY[0x24BEDEB10])(ctxt->varsTab, 8 * v10);
    ctxt->varsTab = varsTab;
    if (varsTab)
    {
      varsNr = ctxt->varsNr;
      goto LABEL_8;
    }
    v12 = *__xmlGenericError();
    v13 = *__xmlGenericErrorContext();
    v14 = "realloc failed !\n";
LABEL_11:
    v12(v13, v14);
    return -1;
  }
  varsTab = ctxt->varsTab;
LABEL_8:
  v11 = 0;
  ctxt->varsNr = varsNr + 1;
  varsTab[varsNr] = variable;
  ctxt->vars = variable;
  variable->level = level;
  return v11;
}

void xsltApplyOneTemplate(xsltTransformContextPtr ctxt, xmlNodePtr node, xmlNodePtr list, xsltTemplatePtr templ, xsltStackElemPtr params)
{
  xsltStackElem *v7;
  int varsNr;

  if (ctxt && list && ctxt->state != XSLT_STATE_STOPPED)
  {
    v7 = params;
    if (params)
    {
      varsNr = ctxt->varsNr;
      do
      {
        xsltLocalVariablePush(ctxt, v7, -1);
        v7 = v7->next;
      }
      while (v7);
      xsltApplySequenceConstructor((uint64_t)ctxt, node, list, templ);
      xsltLocalVariablePop(ctxt, varsNr, -2);
    }
    else
    {
      xsltApplySequenceConstructor((uint64_t)ctxt, node, list, templ);
    }
  }
}

void xsltApplySequenceConstructor(uint64_t a1, xmlNode *a2, xmlNode *a3, xsltTemplate *a4)
{
  xsltTemplate *v4;
  xmlNodePtr started;
  int v9;
  uint64_t v10;
  xmlNode *v11;
  uint64_t v12;
  BOOL v13;
  int v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, xmlNode *, uint64_t);
  uint64_t v22;
  _BYTE *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  xsltTransformFunction v28;
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  xsltStylesheet *Import;
  xmlHashTable *nsAliases;
  const xmlChar *v36;
  const xmlChar *v37;
  xmlNsPtr v38;
  xmlNs *ns;
  xmlAttr *v40;
  _BYTE *v41;
  _BYTE *v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  int v50;
  _BYTE *v51;
  BOOL v52;
  xsltTemplate *v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  int limitNr;
  xmlDoc *v58;
  xmlNode *v59;
  uint64_t v60;
  int v61;
  xmlNode *node;
  int v63;

  v63 = 0;
  if (!a1)
    return;
  v4 = a4;
  if (*(_DWORD *)(a1 + 344))
  {
    started = xsltDebuggerStartSequenceConstructor((xsltTransformContext *)a1, a2, a3, a4, &v63);
    if (!started || !a3)
      return;
  }
  else
  {
    started = 0;
    if (!a3)
      return;
  }
  if (*(_DWORD *)(a1 + 168) == 2)
    return;
  v9 = *(_DWORD *)(a1 + 460);
  if (v9 >= *(_DWORD *)(a1 + 464))
  {
    xsltTransformError((xsltTransformContextPtr)a1, 0, a3, "xsltApplySequenceConstructor: A potential infinite template recursion was detected.\nYou can adjust xsltMaxDepth (--maxdepth) in order to raise the maximum number of nested template calls and variables/params (currently set to %d).\n", *(_DWORD *)(a1 + 464));
    xsltDebug((xsltTransformContextPtr)a1, a2, a3, 0);
    *(_DWORD *)(a1 + 168) = 2;
    return;
  }
  node = 0;
  v54 = 0;
  *(_DWORD *)(a1 + 460) = v9 + 1;
  v58 = *(xmlDoc **)(a1 + 440);
  v59 = started;
  v10 = *(_QWORD *)(a1 + 152);
  v55 = *(_QWORD *)(a1 + 128);
  v56 = *(_QWORD *)(a1 + 184);
  limitNr = *(_DWORD *)(a1 + 48);
  v11 = a3;
  v12 = v10;
  v60 = v10;
LABEL_10:
  if (v4)
    v13 = v10 == v12;
  else
    v13 = 0;
  v14 = v13;
  v61 = v14;
  while (v11)
  {
    v15 = (uint64_t)v11;
    if (linkedOnOrAfterFall2022OSVersions())
    {
      v16 = *(_QWORD *)(a1 + 472);
      if (v16)
      {
        v17 = *(_QWORD *)(a1 + 480);
        if (v17 >= v16)
        {
          xsltTransformError((xsltTransformContextPtr)a1, 0, (xmlNodePtr)v15, "xsltApplySequenceConstructor: Operation limit exceeded\n");
          *(_DWORD *)(a1 + 168) = 2;
          break;
        }
        *(_QWORD *)(a1 + 480) = v17 + 1;
      }
    }
    *(_QWORD *)(a1 + 184) = v15;
    if (!v12)
    {
      v51 = *(_BYTE **)(a1 + 352);
      if (v51 && (*v51 & 4) != 0)
        xsltGenericDebug(xsltGenericDebugContext, "xsltApplySequenceConstructor: insert == NULL !\n");
      break;
    }
    if (started != (xmlNodePtr)v15 && *(_DWORD *)(a1 + 344))
      xslHandleDebugger((xmlNodePtr)v15, a2, v4, (xsltTransformContextPtr)a1);
    v18 = *(_DWORD *)(v15 + 8);
    if (v18 != 1)
      goto LABEL_35;
    v19 = *(_QWORD *)(v15 + 72);
    if (!v19)
      goto LABEL_41;
    if (!xmlStrEqual(*(const xmlChar **)(v19 + 16), (const xmlChar *)"http://www.w3.org/1999/XSL/Transform"))
    {
      v18 = *(_DWORD *)(v15 + 8);
LABEL_35:
      if (v18 != 1)
      {
        if (v18 == 3)
        {
          v41 = *(_BYTE **)(a1 + 352);
          if (*(_QWORD *)(v15 + 16) == MEMORY[0x24BEDEC70])
          {
            if (v41)
            {
              v24 = "xsltApplySequenceConstructor: copy unescaped text %s\n";
              if ((*v41 & 4) != 0)
                goto LABEL_80;
            }
          }
          else if (v41)
          {
            v24 = "xsltApplySequenceConstructor: copy text %s\n";
            if ((*v41 & 4) != 0)
              goto LABEL_80;
          }
        }
        else
        {
          if (v18 != 4)
            goto LABEL_82;
          v23 = *(_BYTE **)(a1 + 352);
          if (!v23)
            goto LABEL_81;
          v24 = "xsltApplySequenceConstructor: copy CDATA text %s\n";
          if ((*v23 & 4) == 0)
            goto LABEL_81;
LABEL_80:
          xsltGenericDebug(xsltGenericDebugContext, v24, *(_QWORD *)(v15 + 80));
        }
LABEL_81:
        if (!xsltCopyText(a1, v12, v15, *(_DWORD *)(a1 + 384)))
          break;
        goto LABEL_82;
      }
LABEL_41:
      v25 = *(_QWORD *)(v15 + 72);
      if (!v25 || (v26 = *(_QWORD *)(v15 + 104)) == 0)
      {
        v29 = *(_BYTE **)(a1 + 352);
        if (v29 && (*v29 & 4) != 0)
          xsltGenericDebug(xsltGenericDebugContext, "xsltApplySequenceConstructor: copy node %s\n", *(const char **)(v15 + 16));
        v30 = *(_QWORD *)(a1 + 184);
        *(_QWORD *)(a1 + 184) = v15;
        node = xsltShallowCopyElem((xsltTransformContext *)a1, (xmlNodePtr)v15, v12, 1);
        if (!node)
          break;
        if (v61)
        {
          v31 = *(_QWORD *)(a1 + 16);
          if (v31)
          {
            if (*(_QWORD *)(v31 + 88))
            {
              v53 = v4;
              if (*(int *)(v31 + 80) >= 1)
              {
                v32 = 0;
                do
                {
                  v33 = *(_QWORD *)(*(_QWORD *)(v31 + 88) + 8 * v32);
                  Import = *(xsltStylesheet **)a1;
                  if (*(_QWORD *)a1)
                  {
                    while (1)
                    {
                      nsAliases = Import->nsAliases;
                      if (nsAliases)
                      {
                        v36 = (const xmlChar *)xmlHashLookup(nsAliases, *(const xmlChar **)(v33 + 16));
                        if (v36)
                          break;
                      }
                      Import = xsltNextImport(Import);
                      if (!Import)
                        goto LABEL_58;
                    }
                    v37 = v36;
                  }
                  else
                  {
LABEL_58:
                    v37 = 0;
                  }
                  if (v37 != (const xmlChar *)-1)
                  {
                    if (!v37)
                      v37 = *(const xmlChar **)(v33 + 16);
                    v38 = xmlSearchNs(node->doc, node, *(const xmlChar **)(v33 + 24));
                    if (!v38 || !xmlStrEqual(v38->href, v37))
                      xmlNewNs(node, v37, *(const xmlChar **)(v33 + 24));
                  }
                  ++v32;
                  v31 = *(_QWORD *)(a1 + 16);
                }
                while (v32 < *(int *)(v31 + 80));
              }
              ns = node->ns;
              v4 = v53;
              started = v59;
              v10 = v60;
              if (ns)
                node->ns = xsltGetNamespace((xsltTransformContextPtr)a1, (xmlNodePtr)v15, ns, node);
            }
          }
        }
        v40 = *(xmlAttr **)(v15 + 88);
        if (v40)
          xsltAttrListTemplateProcess((xsltTransformContextPtr)a1, node, v40);
        *(_QWORD *)(a1 + 184) = v30;
LABEL_82:
        v11 = *(xmlNode **)(v15 + 24);
        if (v11 && v11->type != XML_ENTITY_DECL)
        {
          ++v54;
          if (node)
            v12 = (uint64_t)node;
          goto LABEL_10;
        }
        goto LABEL_117;
      }
      v27 = *(_QWORD *)(a1 + 184);
      *(_QWORD *)(a1 + 184) = v15;
      if ((const xmlChar *)v26 == xsltExtMarker)
        v28 = xsltExtElementLookup((xsltTransformContextPtr)a1, *(const xmlChar **)(v15 + 16), *(const xmlChar **)(v25 + 16));
      else
        v28 = *(xsltTransformFunction *)(v26 + 16);
      v42 = *(_BYTE **)(a1 + 352);
      if (v28)
      {
        if (v42 && (*v42 & 4) != 0)
          xsltGenericDebug(xsltGenericDebugContext, "xsltApplySequenceConstructor: extension construct %s\n", *(const char **)(v15 + 16));
        if (*(const xmlChar **)(v15 + 104) == xsltExtMarker)
          *(_QWORD *)(a1 + 328) = 0;
        *(_QWORD *)(a1 + 152) = v12;
        ((void (*)(uint64_t, xmlNode *, uint64_t))v28)(a1, a2, v15);
        if (v58 != *(xmlDoc **)(a1 + 440))
          xsltReleaseLocalRVTs((xsltTransformContextPtr)a1, v58);
        v10 = v60;
        *(_QWORD *)(a1 + 152) = v60;
      }
      else
      {
        if (v42 && (*v42 & 4) != 0)
          xsltGenericDebug(xsltGenericDebugContext, "xsltApplySequenceConstructor: unknown extension %s\n", *(const char **)(v15 + 16));
        *(_QWORD *)(a1 + 152) = v12;
        v43 = *(_QWORD *)(v15 + 24);
        v10 = v60;
        if (v43)
        {
          v44 = 0;
          do
          {
            if (*(_DWORD *)(v43 + 8) == 1)
            {
              v45 = *(_QWORD *)(v43 + 72);
              if (v45)
              {
                if (xmlStrEqual(*(const xmlChar **)(v45 + 16), (const xmlChar *)"http://www.w3.org/1999/XSL/Transform")
                  && xmlStrEqual(*(const xmlChar **)(v43 + 16), (const xmlChar *)"fallback"))
                {
                  xsltApplySequenceConstructor(a1, a2, *(_QWORD *)(v43 + 24), 0);
                  v44 = 1;
                }
              }
            }
            v43 = *(_QWORD *)(v43 + 48);
          }
          while (v43);
          *(_QWORD *)(a1 + 152) = v60;
          if (v44)
            goto LABEL_116;
        }
        else
        {
          *(_QWORD *)(a1 + 152) = v60;
        }
        xsltTransformError((xsltTransformContextPtr)a1, 0, (xmlNodePtr)v15, "xsltApplySequenceConstructor: failed to find extension %s\n", *(const char **)(v15 + 16));
      }
LABEL_116:
      *(_QWORD *)(a1 + 184) = v27;
      started = v59;
      goto LABEL_117;
    }
    v20 = *(_QWORD *)(v15 + 104);
    if (v20)
    {
      v21 = *(void (**)(uint64_t, xmlNode *, uint64_t))(v20 + 16);
      if (v21)
      {
        v22 = *(_QWORD *)(a1 + 184);
        *(_QWORD *)(a1 + 184) = v15;
        *(_QWORD *)(a1 + 152) = v12;
        v21(a1, a2, v15);
        if (v58 != *(xmlDoc **)(a1 + 440))
          xsltReleaseLocalRVTs((xsltTransformContextPtr)a1, v58);
        *(_QWORD *)(a1 + 152) = v10;
        *(_QWORD *)(a1 + 184) = v22;
        goto LABEL_117;
      }
      if (xmlStrEqual(*(const xmlChar **)(v15 + 16), (const xmlChar *)"variable"))
      {
        v46 = *(_QWORD *)(a1 + 40);
        v47 = *(_QWORD *)(a1 + 184);
        *(_QWORD *)(a1 + 184) = v15;
        xsltParseStylesheetVariable((xsltTransformContextPtr)a1, (xmlNodePtr)v15);
        *(_QWORD *)(a1 + 184) = v47;
        v48 = *(_QWORD *)(a1 + 40);
        if (v46 != v48)
          *(_DWORD *)(v48 + 72) = v54;
        goto LABEL_117;
      }
      if (!xmlStrEqual(*(const xmlChar **)(v15 + 16), (const xmlChar *)"message"))
      {
        xsltTransformError((xsltTransformContextPtr)a1, 0, (xmlNodePtr)v15, "Unexpected XSLT element '%s'.\n", *(const char **)(v15 + 16));
        goto LABEL_117;
      }
    }
    else if (!xmlStrEqual(*(const xmlChar **)(v15 + 16), (const xmlChar *)"message"))
    {
      *(_QWORD *)(a1 + 152) = v12;
      if (!xsltApplyFallbacks(a1, (uint64_t)a2, v15))
        xsltGenericError(xsltGenericErrorContext, "xsltApplySequenceConstructor: %s was not compiled\n", *(const char **)(v15 + 16));
      *(_QWORD *)(a1 + 152) = v10;
      goto LABEL_117;
    }
    xsltMessage((xsltTransformContextPtr)a1, a2, (xmlNodePtr)v15);
LABEL_117:
    if (*(_DWORD *)(a1 + 168) == 2)
      break;
    v11 = *(xmlNode **)(v15 + 48);
    if (!v11)
    {
      v49 = v54;
      while (1)
      {
        v15 = *(_QWORD *)(v15 + 40);
        v50 = v49 - 1;
        if (*(_DWORD *)(a1 + 48) > limitNr && *(_DWORD *)(*(_QWORD *)(a1 + 40) + 72) >= v49)
          xsltLocalVariablePop((xsltTransformContextPtr)a1, limitNr, v49 - 1);
        v12 = *(_QWORD *)(v12 + 40);
        if (!v15 || (_xmlNode *)v15 == a3->parent)
          break;
        v11 = *(xmlNode **)(v15 + 48);
        v49 = v50;
        if (v11)
          goto LABEL_130;
      }
      v11 = 0;
LABEL_130:
      v54 = v50;
      v10 = v60;
      goto LABEL_10;
    }
  }
  if (*(_DWORD *)(a1 + 48) > limitNr)
    xsltLocalVariablePop((xsltTransformContextPtr)a1, limitNr, -1);
  *(_QWORD *)(a1 + 128) = v55;
  *(_QWORD *)(a1 + 184) = v56;
  *(_QWORD *)(a1 + 152) = v10;
  --*(_DWORD *)(a1 + 460);
  if (*(_DWORD *)(a1 + 344))
    v52 = v63 == 0;
  else
    v52 = 1;
  if (!v52)
    xslDropCall();
}

void xsltDocumentElem(xsltTransformContextPtr ctxt, xmlNodePtr node, xmlNodePtr inst, xsltElemPreCompPtr comp)
{
  const xmlChar *next;
  xmlChar *v8;
  xmlChar *v9;
  xmlChar *v10;
  xsltSecurityPrefs *sec;
  int v12;
  const char *outputFile;
  xsltOutputType type;
  xsltStylesheetPtr v15;
  xmlChar *v16;
  xmlChar *v17;
  xmlChar *v18;
  xmlChar *v19;
  const xmlChar *QNameURI;
  xmlChar *v21;
  xmlChar *v22;
  xmlDocPtr v23;
  xmlChar *v24;
  xmlChar *v25;
  xmlXPathCompExpr *v26;
  const char *v27;
  void (**v28)(xmlChar *);
  xsltTransformContext *v29;
  xmlNode *v30;
  xmlChar *v31;
  xmlChar *v32;
  xmlChar *v33;
  xmlChar *v34;
  xmlChar *v35;
  xmlChar *v36;
  xmlChar *v37;
  xmlHashTablePtr v38;
  unsigned int v39;
  xmlChar *i;
  uint64_t v41;
  int v42;
  const xmlChar *v43;
  xsltStylesheetPtr Import;
  const xmlChar *method;
  xsltStylesheetPtr v46;
  xsltStylesheetPtr v47;
  xsltStylesheetPtr v48;
  xmlChar *version;
  xsltStylesheetPtr v50;
  const xmlChar *encoding;
  xmlDict *dict;
  htmlDocPtr v53;
  const xmlChar *v54;
  const xmlChar *v55;
  xmlDict *v56;
  xmlNodePtr RootElement;
  xmlNodePtr v58;
  xmlNs *ns;
  const xmlChar *prefix;
  const xmlChar *v61;
  _xmlNode *children;
  xmlElementType v63;
  BOOL v64;
  const xmlChar *v65;
  const xmlChar *v66;
  xsltStylesheetPtr v67;
  xsltStylesheetPtr v68;
  const xmlChar *doctypeSystem;
  const xmlChar *v70;
  xmlChar *v71;
  FILE *v72;
  FILE *v73;
  int v74;
  void (**v75)(xmlChar *);
  xmlNode *v76;
  xsltOutputType v77;
  const char *v78;
  __int128 v79;
  __int128 v80;
  xmlChar *v81;
  xmlChar *name;

  if (!ctxt || !node || !inst || !comp)
    return;
  next = (const xmlChar *)comp[5].next;
  if (next)
  {
    v8 = xmlStrdup(next);
    goto LABEL_7;
  }
  if (xmlStrEqual(inst->name, (const xmlChar *)"output"))
  {
    xsltGenericDebug(xsltGenericDebugContext, "Found saxon:output extension\n");
    v9 = xsltEvalAttrValueTemplate(ctxt, inst, (const xmlChar *)"file", (const xmlChar *)"http://icl.com/saxon");
    if (v9)
      goto LABEL_11;
    v27 = "http://icl.com/saxon";
  }
  else
  {
    if (!xmlStrEqual(inst->name, (const xmlChar *)"write"))
    {
      if (!xmlStrEqual(inst->name, (const xmlChar *)"document"))
        goto LABEL_8;
      v29 = ctxt;
      v30 = inst;
      v27 = 0;
      goto LABEL_48;
    }
    xsltGenericDebug(xsltGenericDebugContext, "Found xalan:write extension\n");
    v24 = xsltEvalAttrValueTemplate(ctxt, inst, (const xmlChar *)"select", (const xmlChar *)"org.apache.xalan.xslt.extensions.Redirect");
    if (v24)
    {
      v25 = v24;
      v26 = xmlXPathCtxtCompile(ctxt->xpathCtxt, v24);
      v9 = xsltEvalXPathString(ctxt, v26);
      xmlXPathFreeCompExpr(v26);
      ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v25);
      if (v9)
        goto LABEL_11;
    }
    v9 = xsltEvalAttrValueTemplate(ctxt, inst, (const xmlChar *)"file", (const xmlChar *)"org.apache.xalan.xslt.extensions.Redirect");
    if (v9)
      goto LABEL_11;
    v27 = "org.apache.xalan.xslt.extensions.Redirect";
  }
  v29 = ctxt;
  v30 = inst;
LABEL_48:
  v8 = xsltEvalAttrValueTemplate(v29, v30, (const xmlChar *)"href", (const xmlChar *)v27);
LABEL_7:
  v9 = v8;
  if (!v8)
  {
LABEL_8:
    xsltTransformError(ctxt, 0, inst, "xsltDocumentElem: href/URI-Reference not found\n");
    return;
  }
LABEL_11:
  v10 = xmlBuildURI(v9, (const xmlChar *)ctxt->outputFile);
  if (!v10)
  {
    v21 = xmlURIEscapeStr(v9, (const xmlChar *)":/.?,");
    if (!v21
      || (v22 = v21,
          v10 = xmlBuildURI(v21, (const xmlChar *)ctxt->outputFile),
          ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v22),
          !v10))
    {
      xsltTransformError(ctxt, 0, inst, "xsltDocumentElem: URL computation failed for %s\n", (const char *)v9);
      ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v9);
      return;
    }
  }
  sec = (xsltSecurityPrefs *)ctxt->sec;
  if (!sec || (v12 = xsltCheckWrite(sec, ctxt, v10), v12 > 0))
  {
    name = 0;
    v81 = 0;
    v80 = 0uLL;
    outputFile = ctxt->outputFile;
    v79 = *(_OWORD *)&ctxt->output;
    type = ctxt->type;
    ctxt->outputFile = (const char *)v10;
    v15 = xsltNewStylesheet();
    if (!v15)
    {
      xsltTransformError(ctxt, 0, inst, "xsltDocumentElem: out of memory\n");
      v23 = 0;
LABEL_193:
      *(_OWORD *)&ctxt->output = v79;
      ctxt->type = type;
      ctxt->outputFile = outputFile;
      v75 = (void (**)(xmlChar *))MEMORY[0x24BEDE758];
      ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v9);
      (*v75)(v10);
      if (v15)
        xsltFreeStylesheet(v15);
      if (v23)
        xmlFreeDoc(v23);
      return;
    }
    v76 = node;
    v16 = xsltEvalAttrValueTemplate(ctxt, inst, (const xmlChar *)"version", 0);
    if (v16)
    {
      v17 = v16;
      if (v15->version)
        ((void (*)(void))*MEMORY[0x24BEDE758])();
      v15->version = v17;
    }
    v18 = xsltEvalAttrValueTemplate(ctxt, inst, (const xmlChar *)"encoding", 0);
    if (v18)
    {
      v19 = v18;
      if (v15->encoding)
        ((void (*)(void))*MEMORY[0x24BEDE758])();
      v15->encoding = v19;
    }
    name = xsltEvalAttrValueTemplate(ctxt, inst, (const xmlChar *)"method", 0);
    if (name)
    {
      if (v15->method)
        ((void (*)(void))*MEMORY[0x24BEDE758])();
      v15->method = 0;
      if (v15->methodURI)
        ((void (*)(void))*MEMORY[0x24BEDE758])();
      v15->methodURI = 0;
      QNameURI = xsltGetQNameURI(inst, &name);
      if (name)
      {
        if (QNameURI)
        {
          v15->method = name;
          v15->methodURI = xmlStrdup(QNameURI);
        }
        else if (xmlStrEqual(name, (const xmlChar *)"xml")
               || xmlStrEqual(name, (const xmlChar *)"html")
               || xmlStrEqual(name, (const xmlChar *)"text"))
        {
          v15->method = name;
        }
        else
        {
          xsltTransformError(ctxt, 0, inst, "invalid value for method: %s\n", (const char *)name);
          ++v15->warnings;
        }
      }
      else
      {
        ++v15->errors;
      }
    }
    v31 = xsltEvalAttrValueTemplate(ctxt, inst, (const xmlChar *)"doctype-system", 0);
    name = v31;
    if (v31)
    {
      if (v15->doctypeSystem)
      {
        ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v15->doctypeSystem);
        v31 = name;
      }
      v15->doctypeSystem = v31;
    }
    v32 = xsltEvalAttrValueTemplate(ctxt, inst, (const xmlChar *)"doctype-public", 0);
    name = v32;
    if (v32)
    {
      if (v15->doctypePublic)
      {
        ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v15->doctypePublic);
        v32 = name;
      }
      v15->doctypePublic = v32;
    }
    v33 = xsltEvalAttrValueTemplate(ctxt, inst, (const xmlChar *)"standalone", 0);
    name = v33;
    if (v33)
    {
      if (xmlStrEqual(v33, (const xmlChar *)"yes"))
      {
        v15->standalone = 1;
      }
      else if (xmlStrEqual(name, (const xmlChar *)"no"))
      {
        v15->standalone = 0;
      }
      else
      {
        xsltTransformError(ctxt, 0, inst, "invalid value for standalone: %s\n", (const char *)name);
        ++v15->warnings;
      }
      ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(name);
    }
    v34 = xsltEvalAttrValueTemplate(ctxt, inst, (const xmlChar *)"indent", 0);
    name = v34;
    if (v34)
    {
      if (xmlStrEqual(v34, (const xmlChar *)"yes"))
      {
        v15->indent = 1;
      }
      else if (xmlStrEqual(name, (const xmlChar *)"no"))
      {
        v15->indent = 0;
      }
      else
      {
        xsltTransformError(ctxt, 0, inst, "invalid value for indent: %s\n", (const char *)name);
        ++v15->warnings;
      }
      ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(name);
    }
    v35 = xsltEvalAttrValueTemplate(ctxt, inst, (const xmlChar *)"omit-xml-declaration", 0);
    name = v35;
    if (v35)
    {
      if (xmlStrEqual(v35, (const xmlChar *)"yes"))
      {
        v15->omitXmlDeclaration = 1;
      }
      else if (xmlStrEqual(name, (const xmlChar *)"no"))
      {
        v15->omitXmlDeclaration = 0;
      }
      else
      {
        xsltTransformError(ctxt, 0, inst, "invalid value for omit-xml-declaration: %s\n", (const char *)name);
        ++v15->warnings;
      }
      ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(name);
    }
    v36 = xsltEvalAttrValueTemplate(ctxt, inst, (const xmlChar *)"cdata-section-elements", 0);
    v78 = outputFile;
    v77 = type;
    if (v36)
    {
      v37 = v36;
      if (!v15->stripSpaces)
      {
        v38 = xmlHashCreate(10);
        v15->stripSpaces = v38;
        if (!v38)
        {
          ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v37);
          return;
        }
      }
      v81 = v37;
      v39 = *v37;
      if (*v37)
      {
        for (i = v37; ; ++i)
        {
          while (v39 > 0x20)
          {
LABEL_91:
            v41 = 0;
            while (v39 > 0x20 || ((1 << v39) & 0x100002601) == 0)
              v39 = i[++v41];
            if (v41 >= 0x7FFFFFFF)
              v42 = 0x7FFFFFFF;
            else
              v42 = v41;
            v81 = xmlStrndup(i, v42);
            if (v81)
            {
              v43 = xsltGetQNameURI(inst, &v81);
              xmlHashAddEntry2(v15->stripSpaces, v81, v43, "cdata");
              ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v81);
            }
            i += v41;
            v81 = i;
            v39 = *i;
            if (!*i)
              goto LABEL_101;
          }
          if (((1 << v39) & 0x100002600) == 0)
          {
            if (!v39)
              break;
            goto LABEL_91;
          }
          v81 = i + 1;
          v39 = i[1];
        }
      }
LABEL_101:
      ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v37);
    }
    Import = v15;
    do
    {
      method = Import->method;
      if (method)
        break;
      Import = xsltNextImport(Import);
    }
    while (Import);
    *((_QWORD *)&v80 + 1) = 0;
    v46 = v15;
    while (!v46->doctypePublic)
    {
      v46 = xsltNextImport(v46);
      if (!v46)
        goto LABEL_110;
    }
    *((_QWORD *)&v80 + 1) = v46->doctypePublic;
LABEL_110:
    *(_QWORD *)&v80 = 0;
    v47 = v15;
    while (!v47->doctypeSystem)
    {
      v47 = xsltNextImport(v47);
      if (!v47)
        goto LABEL_115;
    }
    *(_QWORD *)&v80 = v47->doctypeSystem;
LABEL_115:
    v48 = v15;
    do
    {
      version = v48->version;
      if (version)
        break;
      v48 = xsltNextImport(v48);
    }
    while (v48);
    v50 = v15;
    do
    {
      encoding = v50->encoding;
      if (encoding)
        break;
      v50 = xsltNextImport(v50);
    }
    while (v50);
    if (!method || xmlStrEqual(method, (const xmlChar *)"xml"))
    {
      ctxt->type = XSLT_OUTPUT_XML;
LABEL_124:
      v23 = xmlNewDoc(v15->version);
      if (v23)
      {
        dict = ctxt->dict;
        v23->dict = dict;
        xmlDictReference(dict);
        xsltGenericDebug(xsltGenericDebugContext, "reusing transformation dict for output\n");
        goto LABEL_141;
      }
      goto LABEL_192;
    }
    if (xmlStrEqual(method, (const xmlChar *)"html"))
    {
      ctxt->type = XSLT_OUTPUT_HTML;
      if (v80 != 0)
      {
        v53 = htmlNewDoc((const xmlChar *)v80, *((const xmlChar **)&v80 + 1));
        goto LABEL_139;
      }
      if (!version)
      {
        v55 = 0;
        v54 = 0;
        goto LABEL_138;
      }
      xsltGetHTMLIDs(version, (_QWORD *)&v80 + 1, &v80);
    }
    else
    {
      if (!xmlStrEqual(method, (const xmlChar *)"xhtml"))
      {
        if (!xmlStrEqual(method, (const xmlChar *)"text"))
        {
          xsltTransformError(ctxt, 0, inst, "xsltDocumentElem: unsupported method (%s)\n", (const char *)method);
          v23 = 0;
          goto LABEL_192;
        }
        ctxt->type = XSLT_OUTPUT_TEXT;
        goto LABEL_124;
      }
      xsltTransformError(ctxt, 0, inst, "xsltDocumentElem: unsupported method xhtml\n");
      ctxt->type = XSLT_OUTPUT_HTML;
    }
    v55 = (const xmlChar *)*((_QWORD *)&v80 + 1);
    v54 = (const xmlChar *)v80;
LABEL_138:
    v53 = htmlNewDocNoDtD(v54, v55);
LABEL_139:
    v23 = v53;
    if (v53)
    {
      v56 = ctxt->dict;
      v23->dict = v56;
      xmlDictReference(v56);
LABEL_141:
      v23->charset = 1;
      if (encoding)
        v23->encoding = xmlStrdup(encoding);
      ctxt->output = v23;
      ctxt->insert = (xmlNodePtr)v23;
      xsltApplySequenceConstructor((uint64_t)ctxt, v76, inst->children, 0);
      RootElement = xmlDocGetRootElement(v23);
      if (RootElement)
      {
        v58 = RootElement;
        ns = RootElement->ns;
        if (!ns || (prefix = ns->prefix) == 0 || (v61 = xmlDictQLookup(ctxt->dict, prefix, RootElement->name)) == 0)
          v61 = v58->name;
        if (!method && !v58->ns && !xmlStrcasecmp(v58->name, (const xmlChar *)"html"))
        {
          children = v23->children;
          if (children && children != v58)
          {
            do
            {
              v63 = children->type;
              if (v63 == XML_TEXT_NODE)
              {
                if (!xmlIsBlankNode(children))
                  break;
              }
              else if (v63 == XML_ELEMENT_NODE)
              {
                break;
              }
              children = children->next;
              if (children)
                v64 = children == v58;
              else
                v64 = 1;
            }
            while (!v64);
          }
          if (children == v58)
          {
            ctxt->type = XSLT_OUTPUT_HTML;
            v23->type = XML_HTML_DOCUMENT_NODE;
            v65 = (const xmlChar *)*((_QWORD *)&v80 + 1);
            v66 = (const xmlChar *)v80;
            if (v80 != 0
              || version
              && (xsltGetHTMLIDs(version, (_QWORD *)&v80 + 1, &v80),
                  v65 = (const xmlChar *)*((_QWORD *)&v80 + 1),
                  v66 = (const xmlChar *)v80,
                  v80 != 0))
            {
              v23->intSubset = xmlCreateIntSubset(v23, v61, v65, v66);
            }
          }
        }
        if (ctxt->type == XSLT_OUTPUT_XML)
        {
          *((_QWORD *)&v80 + 1) = 0;
          v67 = v15;
          while (!v67->doctypePublic)
          {
            v67 = xsltNextImport(v67);
            if (!v67)
              goto LABEL_173;
          }
          *((_QWORD *)&v80 + 1) = v67->doctypePublic;
LABEL_173:
          *(_QWORD *)&v80 = 0;
          v68 = v15;
          do
          {
            doctypeSystem = v68->doctypeSystem;
            if (doctypeSystem)
            {
              *(_QWORD *)&v80 = v68->doctypeSystem;
              v70 = (const xmlChar *)*((_QWORD *)&v80 + 1);
              goto LABEL_179;
            }
            v68 = xsltNextImport(v68);
          }
          while (v68);
          v70 = (const xmlChar *)*((_QWORD *)&v80 + 1);
          doctypeSystem = (const xmlChar *)v80;
          if (v80 == 0)
            goto LABEL_180;
LABEL_179:
          v23->intSubset = xmlCreateIntSubset(v23, v61, v70, doctypeSystem);
        }
      }
LABEL_180:
      v71 = xsltEvalAttrValueTemplate(ctxt, inst, (const xmlChar *)"append", 0);
      name = v71;
      type = v77;
      if (v71)
      {
        if (xmlStrEqual(v71, (const xmlChar *)"true") || xmlStrEqual(name, (const xmlChar *)"yes"))
        {
          v15->omitXmlDeclaration = 1;
          ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(name);
          v72 = fopen((const char *)v10, "ab");
          if (!v72)
            goto LABEL_189;
          v73 = v72;
          v74 = xsltSaveResultToFile(v72, v23, v15);
          fclose(v73);
LABEL_187:
          if ((v74 & 0x80000000) == 0)
          {
            xsltGenericDebug(xsltGenericDebugContext, "Wrote %d bytes to %s\n", v74, (const char *)v10);
LABEL_190:
            outputFile = v78;
            goto LABEL_193;
          }
LABEL_189:
          xsltTransformError(ctxt, 0, inst, "xsltDocumentElem: unable to save to %s\n", (const char *)v10);
          goto LABEL_190;
        }
        v15->omitXmlDeclaration = 0;
        ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(name);
      }
      v74 = xsltSaveResultToFilename((const char *)v10, v23, v15, 0);
      goto LABEL_187;
    }
LABEL_192:
    type = v77;
    goto LABEL_193;
  }
  if (!v12)
    xsltTransformError(ctxt, 0, inst, "xsltDocumentElem: write rights for %s denied\n", (const char *)v10);
  v28 = (void (**)(xmlChar *))MEMORY[0x24BEDE758];
  ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v9);
  (*v28)(v10);
}

uint64_t xsltGetHTMLIDs(xmlChar *str1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t result;

  v6 = 0;
  while (1)
  {
    result = xmlStrcasecmp(str1, (const xmlChar *)(&xsltHTMLVersions)[v6]);
    if (!(_DWORD)result)
      break;
    v6 += 3;
    if (v6 == 30)
      return result;
  }
  if (a2)
    *a2 = (&xsltHTMLVersions)[v6 + 1];
  if (a3)
    *a3 = (&xsltHTMLVersions)[v6 + 2];
  return result;
}

void xsltSort(xsltTransformContextPtr ctxt, xmlNodePtr node, xmlNodePtr inst, xsltElemPreCompPtr comp)
{
  if (comp)
    xsltTransformError(ctxt, 0, inst, "xsl:sort : improper use this should not be reached\n");
  else
    xsltTransformError(ctxt, 0, inst, "xsl:sort : compilation failed\n");
}

void xsltCopy(xsltTransformContextPtr ctxt, xmlNodePtr node, xmlNodePtr inst, xsltElemPreCompPtr comp)
{
  xmlNode *insert;
  xmlElementType type;
  unint64_t *traceCode;
  xmlNodePtr v11;
  const xmlChar *v12;
  unint64_t *v13;
  xmlNode *v14;
  unint64_t *v15;
  xmlNodePtr v16;
  unint64_t *v17;
  unint64_t *v18;
  unint64_t *v19;
  xmlNodePtr v20;
  xmlNode *v21;
  unint64_t *v22;
  xmlElementType v23;
  BOOL v24;
  int v25;

  insert = ctxt->insert;
  if (insert)
  {
    type = node->type;
    switch(type)
    {
      case XML_ELEMENT_NODE:
        traceCode = ctxt->traceCode;
        v11 = ctxt->insert;
        if (traceCode)
        {
          v11 = ctxt->insert;
          if ((*(_BYTE *)traceCode & 8) != 0)
          {
            xsltGenericDebug(xsltGenericDebugContext, "xsltCopy: node %s\n", (const char *)node->name);
            v11 = ctxt->insert;
          }
        }
        ctxt->insert = xsltShallowCopyElem(ctxt, node, (uint64_t)v11, 0);
        v12 = (const xmlChar *)comp[2].inst;
        if (v12)
          xsltApplyAttributeSet(ctxt, node, inst, v12);
        break;
      case XML_ATTRIBUTE_NODE:
        v15 = ctxt->traceCode;
        v16 = ctxt->insert;
        if (v15)
        {
          v16 = ctxt->insert;
          if ((*(_BYTE *)v15 & 8) != 0)
          {
            xsltGenericDebug(xsltGenericDebugContext, "xsltCopy: attribute %s\n", (const char *)node->name);
            v16 = ctxt->insert;
          }
        }
        xsltShallowCopyAttr(ctxt, inst, (uint64_t)v16, (uint64_t)node);
        break;
      case XML_TEXT_NODE:
        v17 = ctxt->traceCode;
        if (v17 && (*(_BYTE *)v17 & 8) != 0)
          xsltGenericDebug(xsltGenericDebugContext, "xsltCopy: text %s\n", inst);
        goto LABEL_23;
      case XML_CDATA_SECTION_NODE:
        v18 = ctxt->traceCode;
        if (v18 && (*(_BYTE *)v18 & 8) != 0)
          xsltGenericDebug(xsltGenericDebugContext, "xsltCopy: CDATA text %s\n", inst);
LABEL_23:
        xsltCopyText((uint64_t)ctxt, (uint64_t)ctxt->insert, (uint64_t)node, 0);
        break;
      case XML_ENTITY_REF_NODE:
      case XML_ENTITY_NODE:
        break;
      case XML_PI_NODE:
        v19 = ctxt->traceCode;
        v20 = ctxt->insert;
        if (v19)
        {
          v20 = ctxt->insert;
          if ((*(_BYTE *)v19 & 8) != 0)
          {
            xsltGenericDebug(xsltGenericDebugContext, "xsltCopy: PI %s\n", (const char *)node->name);
            v20 = ctxt->insert;
          }
        }
        v21 = xmlNewDocPI(v20->doc, node->name, node->content);
        goto LABEL_32;
      case XML_COMMENT_NODE:
        v22 = ctxt->traceCode;
        if (v22 && (*(_BYTE *)v22 & 8) != 0)
          xsltGenericDebug(xsltGenericDebugContext, "xsltCopy: comment\n", inst, comp);
        v21 = xmlNewComment(node->content);
LABEL_32:
        xsltAddChild(ctxt->insert, v21);
        break;
      default:
        if (type == XML_NAMESPACE_DECL)
        {
          v13 = ctxt->traceCode;
          v14 = ctxt->insert;
          if (v13)
          {
            v14 = ctxt->insert;
            if ((*(_BYTE *)v13 & 8) != 0)
            {
              xsltGenericDebug(xsltGenericDebugContext, "xsltCopy: namespace declaration\n", v14, comp);
              v14 = ctxt->insert;
            }
          }
          xsltShallowCopyNsNode(ctxt, inst, v14, (uint64_t)node);
        }
        break;
    }
  }
  v23 = node->type;
  v24 = v23 > XML_HTML_DOCUMENT_NODE;
  v25 = (1 << v23) & 0x2202;
  if (!v24 && v25 != 0)
    xsltApplySequenceConstructor((uint64_t)ctxt, ctxt->node, inst->children, 0);
  ctxt->insert = insert;
}

xmlNode *xsltCopyText(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  _BYTE *v9;
  _BYTE *v10;
  xmlHashTable *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  xmlNodePtr v19;
  xmlNode *v20;
  xmlChar *content;
  xmlNodePtr v22;
  xmlChar *v23;
  size_t v24;
  xsltTransformContext *v25;
  xmlNode *v26;
  xmlNodePtr v27;
  int v28;
  const xmlChar *v29;
  uint64_t v30;
  int v31;
  xmlNodePtr v32;
  xmlChar *v33;

  v4 = *(_DWORD *)(a3 + 8);
  if ((v4 - 3) > 1 || !*(_QWORD *)(a3 + 80))
    return 0;
  if (v4 == 4)
  {
    v9 = *(_BYTE **)(a1 + 352);
    if (v9 && (*v9 & 1) != 0)
      xsltGenericDebug(xsltGenericDebugContext, "xsltCopyText: copy CDATA text %s\n");
  }
  else
  {
    v10 = *(_BYTE **)(a1 + 352);
    if (*(_QWORD *)(a3 + 16) == MEMORY[0x24BEDEC70])
    {
      if (v10 && (*v10 & 1) != 0)
        xsltGenericDebug(xsltGenericDebugContext, "xsltCopyText: copy unescaped text %s\n");
    }
    else if (v10 && (*v10 & 1) != 0)
    {
      xsltGenericDebug(xsltGenericDebugContext, "xsltCopyText: copy text %s\n");
    }
  }
  if (!a2 || !*(_QWORD *)(a2 + 24))
    *(_QWORD *)(a1 + 328) = 0;
  v11 = *(xmlHashTable **)(*(_QWORD *)a1 + 56);
  if (v11 && a2 && !*(_DWORD *)(a1 + 8))
  {
    if (*(_DWORD *)(a2 + 8) != 1)
      goto LABEL_25;
    v12 = *(_QWORD *)(a2 + 72);
    if (!v12)
    {
      if (xmlHashLookup2(v11, *(const xmlChar **)(a2 + 16), 0))
        goto LABEL_46;
      v12 = *(_QWORD *)(a2 + 72);
      if (!v12)
        goto LABEL_25;
      v11 = *(xmlHashTable **)(*(_QWORD *)a1 + 56);
    }
    if (!xmlHashLookup2(v11, *(const xmlChar **)(a2 + 16), *(const xmlChar **)(v12 + 16)))
      goto LABEL_25;
LABEL_46:
    v30 = *(_QWORD *)(a2 + 32);
    if (!v30 || *(_DWORD *)(v30 + 8) != 4)
    {
      v31 = xmlStrlen(*(const xmlChar **)(a3 + 80));
      v32 = xmlNewCDataBlock(*(xmlDocPtr *)(a1 + 144), *(const xmlChar **)(a3 + 80), v31);
      v20 = v32;
      if (!v32)
        goto LABEL_53;
      *(_QWORD *)(a1 + 328) = v32->content;
      *(_DWORD *)(a1 + 336) = v31;
      *(_DWORD *)(a1 + 340) = v31;
      goto LABEL_38;
    }
    v23 = *(xmlChar **)(a3 + 80);
    v24 = xmlStrlen(v23);
    v25 = (xsltTransformContext *)a1;
    v26 = (xmlNode *)v30;
    goto LABEL_49;
  }
  if (!a2)
    goto LABEL_34;
LABEL_25:
  v13 = *(_QWORD *)(a2 + 32);
  if (v13)
  {
    v14 = *(_DWORD *)(v13 + 8);
    if (v14 == 4)
    {
      v15 = *(_QWORD *)(a3 + 16);
      v16 = MEMORY[0x24BEDEC70];
      goto LABEL_30;
    }
    if (v14 == 3)
    {
      v15 = *(_QWORD *)(v13 + 16);
      v16 = *(_QWORD *)(a3 + 16);
LABEL_30:
      if (v15 != v16)
        goto LABEL_31;
      v23 = *(xmlChar **)(a3 + 80);
      v24 = xmlStrlen(v23);
      v25 = (xsltTransformContext *)a1;
      v26 = (xmlNode *)v13;
LABEL_49:
      v22 = xsltAddTextString(v25, v26, v23, v24);
LABEL_50:
      v20 = v22;
      if (v22)
      {
        content = v22->content;
        goto LABEL_52;
      }
LABEL_53:
      xsltTransformError((xsltTransformContextPtr)a1, 0, (xmlNodePtr)a2, "Internal error in xsltCopyText(): Failed to copy the string.\n");
      *(_DWORD *)(a1 + 168) = 2;
      return v20;
    }
  }
LABEL_31:
  if (a4)
  {
    v17 = *(_QWORD *)(a2 + 64);
    if (v17)
    {
      if (*(_QWORD *)(v17 + 152) == *(_QWORD *)(a1 + 368))
      {
        v27 = xmlNewTextLen(0, 0);
        v20 = v27;
        if (!v27)
          goto LABEL_53;
        if (*(_QWORD *)(a3 + 16) == MEMORY[0x24BEDEC70])
          v27->name = (const xmlChar *)MEMORY[0x24BEDEC70];
        v28 = xmlDictOwns(*(xmlDictPtr *)(a1 + 368), *(const xmlChar **)(a3 + 80));
        v29 = *(const xmlChar **)(a3 + 80);
        if (v28)
        {
          v20->content = (xmlChar *)v29;
LABEL_59:
          *(_QWORD *)(a1 + 328) = 0;
LABEL_38:
          v20->doc = *(_xmlDoc **)(a2 + 64);
          v22 = xmlAddChild((xmlNodePtr)a2, v20);
          goto LABEL_50;
        }
        v33 = xmlStrdup(v29);
        v20->content = v33;
        if (v33)
          goto LABEL_59;
        return 0;
      }
    }
  }
LABEL_34:
  v18 = xmlStrlen(*(const xmlChar **)(a3 + 80));
  v19 = xmlNewTextLen(*(const xmlChar **)(a3 + 80), v18);
  v20 = v19;
  if (!v19)
    goto LABEL_53;
  if (*(_QWORD *)(a3 + 16) == MEMORY[0x24BEDEC70])
    v19->name = (const xmlChar *)MEMORY[0x24BEDEC70];
  content = v19->content;
  *(_QWORD *)(a1 + 328) = content;
  *(_DWORD *)(a1 + 336) = v18;
  *(_DWORD *)(a1 + 340) = v18;
  if (a2)
    goto LABEL_38;
LABEL_52:
  if (!content)
    goto LABEL_53;
  return v20;
}

xmlNode *xsltShallowCopyElem(xsltTransformContext *a1, xmlNodePtr node, uint64_t a3, int a4)
{
  xmlNode *v4;
  xmlElementType type;
  xmlNodePtr v11;
  xmlNs *v12;
  xmlNs *nsDef;
  xmlNs *ns;
  xmlNsPtr Namespace;

  v4 = 0;
  if (!a3)
    return v4;
  type = node->type;
  if (type == XML_DTD_NODE)
    return v4;
  if (type - 3 <= 1)
    return xsltCopyText((uint64_t)a1, a3, (uint64_t)node, 0);
  v11 = xmlDocCopyNode(node, *(xmlDocPtr *)(a3 + 64), 0);
  if (v11)
  {
    v11->doc = a1->output;
    v12 = (xmlNs *)xmlAddChild((xmlNodePtr)a3, v11);
    v4 = (xmlNode *)v12;
    if (v12)
    {
      if (node->type == XML_ELEMENT_NODE)
      {
        nsDef = node->nsDef;
        if (nsDef)
        {
          if (!a4)
          {
            xsltCopyNamespaceListInternal(v12, (uint64_t *)node->nsDef);
            ns = node->ns;
            if (ns)
              goto LABEL_17;
            goto LABEL_19;
          }
          xsltCopyNamespaceList(a1, (xmlNodePtr)v12, nsDef);
        }
        ns = node->ns;
        if (ns)
        {
          if (a4)
          {
            Namespace = xsltGetNamespace(a1, node, ns, v4);
LABEL_18:
            v4->ns = Namespace;
            return v4;
          }
LABEL_17:
          Namespace = xsltGetSpecialNamespace(a1, node, ns->href, ns->prefix, v4);
          goto LABEL_18;
        }
LABEL_19:
        if (*(_DWORD *)(a3 + 8) == 1)
        {
          if (*(_QWORD *)(a3 + 72))
            xsltGetSpecialNamespace(a1, node, 0, 0, v4);
        }
      }
    }
    else
    {
      xsltTransformError(a1, 0, node, "xsltShallowCopyElem: copy failed\n");
    }
  }
  else
  {
    xsltTransformError(a1, 0, node, "xsltShallowCopyElem: copy %s failed\n", (const char *)node->name);
    return 0;
  }
  return v4;
}

xmlAttrPtr xsltShallowCopyAttr(xsltTransformContextPtr ctxt, xmlNodePtr node, uint64_t a3, uint64_t a4)
{
  xmlAttrPtr v7;
  xmlChar *String;
  uint64_t v11;
  xmlNs *SpecialNamespace;

  if (!a4)
    return 0;
  if (*(_DWORD *)(a3 + 8) != 1)
  {
    xsltTransformError(ctxt, 0, node, "Cannot add an attribute node to a non-element node.\n");
    return 0;
  }
  if (*(_QWORD *)(a3 + 24))
  {
    xsltTransformError(ctxt, 0, node, "Attribute nodes must be added before any child nodes to an element.\n");
    return 0;
  }
  String = xmlNodeListGetString(*(xmlDocPtr *)(a4 + 64), *(const xmlNode **)(a4 + 24), 1);
  v11 = *(_QWORD *)(a4 + 72);
  if (v11)
  {
    SpecialNamespace = xsltGetSpecialNamespace(ctxt, node, *(const xmlChar **)(v11 + 16), *(const xmlChar **)(v11 + 24), (xmlNodePtr)a3);
    if (!SpecialNamespace)
      xsltTransformError(ctxt, 0, node, "Namespace fixup error: Failed to acquire an in-scope namespace binding of the copied attribute '{%s}%s'.\n", *(const char **)(*(_QWORD *)(a4 + 72) + 16), *(const char **)(a4 + 16));
  }
  else
  {
    SpecialNamespace = 0;
  }
  v7 = xmlSetNsProp((xmlNodePtr)a3, SpecialNamespace, *(const xmlChar **)(a4 + 16), String);
  if (String)
    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(String);
  return v7;
}

xmlNsPtr xsltShallowCopyNsNode(xsltTransformContext *a1, xmlNodePtr node, xmlNodePtr a3, uint64_t a4)
{
  const xmlChar *v7;
  xmlNs *nsDef;
  const xmlChar *prefix;
  const xmlChar *v10;
  xmlNsPtr v11;

  if (!a3 || a3->type != XML_ELEMENT_NODE)
    return 0;
  if (a3->children)
  {
    xsltTransformError(a1, 0, node, "Namespace nodes must be added before any child nodes are added to an element.\n");
    return 0;
  }
  v7 = *(const xmlChar **)(a4 + 24);
  if (v7)
  {
    if (*v7 == 120 && xmlStrEqual(v7, (const xmlChar *)"xml"))
      return 0;
  }
  else if (!a3->ns)
  {
    return 0;
  }
  nsDef = a3->nsDef;
  if (nsDef)
  {
    while (1)
    {
      prefix = nsDef->prefix;
      v10 = *(const xmlChar **)(a4 + 24);
      if ((prefix != 0) != (v10 == 0) && (prefix == v10 || xmlStrEqual(prefix, v10)))
        break;
      nsDef = nsDef->next;
      if (!nsDef)
        goto LABEL_16;
    }
    xmlStrEqual(nsDef->href, *(const xmlChar **)(a4 + 16));
    return 0;
  }
LABEL_16:
  v11 = xmlSearchNs(a3->doc, a3, *(const xmlChar **)(a4 + 24));
  if (v11 && xmlStrEqual(v11->href, *(const xmlChar **)(a4 + 16)))
    return 0;
  return xmlNewNs(a3, *(const xmlChar **)(a4 + 16), *(const xmlChar **)(a4 + 24));
}

void xsltText(xsltTransformContextPtr ctxt, xmlNodePtr node, xmlNodePtr inst, xsltElemPreCompPtr comp)
{
  _xmlNode *children;
  const xmlChar *v7;
  xmlNodePtr v8;

  if (comp)
  {
    children = inst->children;
    if (children)
    {
      v7 = (const xmlChar *)MEMORY[0x24BEDEC70];
      while (children->type - 3 < 2)
      {
        v8 = xmlNewDocText(ctxt->output, children->content);
        if (children->type != XML_CDATA_SECTION_NODE)
          v8->name = v7;
        xsltAddChild(ctxt->insert, v8);
        children = children->next;
        if (!children)
          return;
      }
      xsltTransformError(ctxt, 0, inst, "xsl:text content problem\n");
    }
  }
}

void xsltElement(xsltTransformContextPtr ctxt, xmlNodePtr node, xmlNodePtr inst, xsltElemPreCompPtr comp)
{
  xmlNode *insert;
  const xmlChar *next;
  xmlChar *v10;
  xmlChar *v11;
  const char *v12;
  xmlDocPtr output;
  xmlNodePtr v14;
  xmlNode *v15;
  xmlNode *v16;
  xmlNodePtr v17;
  xmlNode *v18;
  xsltTransformFunction func;
  const xmlChar *href;
  xmlNsPtr v21;
  xmlChar *v22;
  xmlChar *v23;
  xmlChar *v24;
  _xmlNode *parent;
  const xmlChar *v26;
  xmlChar *v27;
  xmlChar *v28;
  xmlNode *children;
  xmlChar *prefix;

  prefix = 0;
  insert = ctxt->insert;
  if (insert && comp[3].type)
  {
    next = (const xmlChar *)comp[3].next;
    if (next)
    {
      v10 = (xmlChar *)xsltSplitQName(ctxt->dict, next, (const xmlChar **)&prefix);
    }
    else
    {
      v11 = xsltEvalAttrValueTemplate(ctxt, inst, (const xmlChar *)"name", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
      if (!v11)
      {
        xsltTransformError(ctxt, 0, inst, "xsl:element: The attribute 'name' is missing.\n");
LABEL_56:
        ctxt->insert = insert;
        return;
      }
      v12 = (const char *)v11;
      if (xmlValidateQName(v11, 0))
        xsltTransformError(ctxt, 0, inst, "xsl:element: The effective name '%s' is not a valid QName.\n", v12);
      v10 = (xmlChar *)xsltSplitQName(ctxt->dict, (const xmlChar *)v12, (const xmlChar **)&prefix);
      ((void (*)(const char *))*MEMORY[0x24BEDE758])(v12);
    }
    output = ctxt->output;
    if (output->dict == ctxt->dict)
      v14 = xmlNewDocNodeEatName(output, 0, v10, 0);
    else
      v14 = xmlNewDocNode(output, 0, v10, 0);
    v15 = v14;
    if (!v14)
    {
      xsltTransformError(ctxt, 0, inst, "xsl:element : creation of %s failed\n");
      return;
    }
    v16 = ctxt->insert;
    if (v16)
    {
      v17 = xmlAddChild(v16, v15);
      if (v17)
      {
        v18 = v17;
        if (LODWORD(comp[3].inst))
        {
          func = comp[3].func;
          if (func)
          {
            if (*(_BYTE *)func)
              href = (const xmlChar *)comp[3].func;
            else
              href = 0;
          }
          else
          {
            v22 = xsltEvalAttrValueTemplate(ctxt, inst, (const xmlChar *)"namespace", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
            v23 = v22;
            if (v22 && *v22)
              href = xmlDictLookup(ctxt->dict, v22, -1);
            else
              href = 0;
            ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v23);
          }
          if (xmlStrEqual(href, (const xmlChar *)"http://www.w3.org/2000/xmlns/"))
          {
            xsltTransformError(ctxt, 0, inst, "xsl:attribute: Namespace http://www.w3.org/2000/xmlns/ forbidden.\n");
            goto LABEL_56;
          }
          if (xmlStrEqual(href, (const xmlChar *)"http://www.w3.org/XML/1998/namespace"))
          {
            prefix = (xmlChar *)"xml";
          }
          else if (xmlStrEqual(prefix, (const xmlChar *)"xml"))
          {
            prefix = 0;
          }
        }
        else
        {
          v21 = xmlSearchNs(inst->doc, inst, prefix);
          if (!v21)
          {
            if (prefix)
              xsltTransformError(ctxt, 0, inst, "xsl:element: The QName '%s:%s' has no namespace binding in scope in the stylesheet; this is an error, si"
                "nce the namespace was not specified by the instruction itself.\n",
                (const char *)prefix,
                (const char *)v10);
            goto LABEL_44;
          }
          href = v21->href;
        }
        if (href)
        {
          if (xmlStrEqual(prefix, (const xmlChar *)"xmlns"))
          {
            v24 = xmlStrdup((const xmlChar *)"ns_1");
            v18->ns = xsltGetSpecialNamespace(ctxt, inst, href, v24, v18);
            ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v24);
          }
          else
          {
            v18->ns = xsltGetSpecialNamespace(ctxt, inst, href, prefix, v18);
          }
LABEL_49:
          ctxt->insert = v18;
          if (LODWORD(comp[2].free))
          {
            v26 = (const xmlChar *)comp[2].inst;
            if (v26)
            {
              xsltApplyAttributeSet(ctxt, node, inst, v26);
            }
            else
            {
              v27 = xsltEvalAttrValueTemplate(ctxt, inst, (const xmlChar *)"use-attribute-sets", 0);
              if (v27)
              {
                v28 = v27;
                xsltApplyAttributeSet(ctxt, node, inst, v27);
                ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v28);
              }
            }
          }
          children = inst->children;
          if (children)
            xsltApplySequenceConstructor((uint64_t)ctxt, ctxt->node, children, 0);
          goto LABEL_56;
        }
LABEL_44:
        parent = v18->parent;
        if (parent && parent->type == XML_ELEMENT_NODE && parent->ns)
          xsltGetSpecialNamespace(ctxt, inst, 0, 0, v18);
        goto LABEL_49;
      }
    }
    else
    {
      xmlFreeNode(v15);
    }
    xsltTransformError(ctxt, 0, inst, "xsl:element : xsltAddChild failed\n");
  }
}

void xsltComment(xsltTransformContextPtr ctxt, xmlNodePtr node, xmlNodePtr inst, xsltElemPreCompPtr comp)
{
  xmlChar *v6;
  int v7;
  unint64_t *traceCode;
  xmlNode *v9;
  unint64_t *v10;
  xmlNode *v11;

  v6 = xsltEvalTemplateString(ctxt, node, inst);
  v7 = xmlStrlen(v6);
  if (v7 >= 1)
  {
    if (v6[v7 - 1] == 45 || xmlStrstr(v6, (const xmlChar *)"--"))
      xsltTransformError(ctxt, 0, inst, "xsl:comment : '--' or ending '-' not allowed in comment\n");
    goto LABEL_6;
  }
  if (v6)
  {
LABEL_6:
    traceCode = ctxt->traceCode;
    if (traceCode)
    {
      if ((*(_BYTE *)traceCode & 0x10) != 0)
        xsltGenericDebug(xsltGenericDebugContext, "xsltComment: content %s\n", (const char *)v6);
    }
    v9 = xmlNewComment(v6);
    xsltAddChild(ctxt->insert, v9);
    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v6);
    return;
  }
  v10 = ctxt->traceCode;
  if (v10 && (*(_BYTE *)v10 & 0x10) != 0)
    xsltGenericDebug(xsltGenericDebugContext, "xsltComment: empty\n");
  v11 = xmlNewComment(0);
  xsltAddChild(ctxt->insert, v11);
}

void xsltProcessingInstruction(xsltTransformContextPtr ctxt, xmlNodePtr node, xmlNodePtr inst, xsltElemPreCompPtr comp)
{
  const xmlChar *next;
  xmlChar *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t *traceCode;
  xmlNode *v17;
  xsltElemPreCompPtr v18;
  void (**v19)(xmlChar *);

  if (ctxt->insert && comp[3].type)
  {
    next = (const xmlChar *)comp[3].next;
    if (next || (next = xsltEvalAttrValueTemplate(ctxt, inst, (const xmlChar *)"name", 0)) != 0)
    {
      v9 = xsltEvalTemplateString(ctxt, node, inst);
      if (xmlStrstr(v9, (const xmlChar *)"?>"))
      {
        xsltTransformError(ctxt, 0, inst, "xsl:processing-instruction: '?>' not allowed within PI content\n");
      }
      else
      {
        traceCode = ctxt->traceCode;
        if (v9)
        {
          if (traceCode && (*(_BYTE *)traceCode & 0x20) != 0)
            xsltGenericDebug(xsltGenericDebugContext, "xsltProcessingInstruction: %s content %s\n", v10, v11, v12, v13, v14, v15, (char)next);
        }
        else if (traceCode && (*(_BYTE *)traceCode & 0x20) != 0)
        {
          xsltGenericDebug(xsltGenericDebugContext, "xsltProcessingInstruction: %s empty\n", v10, v11, v12, v13, v14, v15, (char)next);
        }
        v17 = xmlNewDocPI(ctxt->insert->doc, next, v9);
        xsltAddChild(ctxt->insert, v17);
      }
      v18 = comp[3].next;
      v19 = (void (**)(xmlChar *))MEMORY[0x24BEDE758];
      if (next != (const xmlChar *)v18)
        ((void (*)(const xmlChar *))*MEMORY[0x24BEDE758])(next);
      if (v9)
        (*v19)(v9);
    }
    else
    {
      xsltTransformError(ctxt, 0, inst, "xsl:processing-instruction : name is missing\n");
    }
  }
}

void xsltCopyOf(xsltTransformContextPtr ctxt, xmlNodePtr node, xmlNodePtr inst, xsltElemPreCompPtr comp)
{
  unint64_t *traceCode;
  xmlXPathObject *v9;
  xmlXPathObject *v10;
  unint64_t *v11;
  int *p_nodeNr;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v17;
  xmlNodePtr insert;
  unint64_t *v19;
  xmlNodeSetPtr nodesetval;
  xmlNodePtr *nodeTab;
  xmlNodePtr v22;
  unsigned int type;
  BOOL v24;
  int v25;
  xmlChar *v27;
  xmlChar *v28;
  unint64_t *v29;

  if (ctxt && node && inst)
  {
    if (comp && comp[4].inst && comp[7].inst)
    {
      traceCode = ctxt->traceCode;
      if (traceCode && (*(_BYTE *)traceCode & 0x40) != 0)
        xsltGenericDebug(xsltGenericDebugContext, "xsltCopyOf: select %s\n", (const char *)comp[4].inst);
      v9 = xsltPreCompEval((uint64_t)ctxt, (uint64_t)node, (uint64_t)comp);
      if (v9)
      {
        v10 = v9;
        if (v9->type == XPATH_XSLT_TREE)
        {
          v19 = ctxt->traceCode;
          if (v19 && (*(_BYTE *)v19 & 0x40) != 0)
            xsltGenericDebug(xsltGenericDebugContext, "xsltCopyOf: result is a result tree fragment\n");
          nodesetval = v10->nodesetval;
          if (nodesetval)
          {
            nodeTab = nodesetval->nodeTab;
            if (nodeTab)
            {
              v22 = *nodeTab;
              if (v22)
              {
                type = v22->type;
                v24 = type > 0xD;
                v25 = (1 << type) & 0x239E;
                if (!v24 && v25 != 0)
                  xsltCopyTreeList((xmlNodePtr)ctxt, inst, (uint64_t)v22->children, (uint64_t)ctxt->insert, 0);
              }
            }
          }
        }
        else if (v9->type == XPATH_NODESET)
        {
          v11 = ctxt->traceCode;
          if (v11 && (*(_BYTE *)v11 & 0x40) != 0)
            xsltGenericDebug(xsltGenericDebugContext, "xsltCopyOf: result is a node set\n");
          p_nodeNr = &v10->nodesetval->nodeNr;
          if (p_nodeNr && *p_nodeNr >= 1)
          {
            v13 = 0;
            do
            {
              v14 = *(_QWORD *)(*((_QWORD *)p_nodeNr + 1) + 8 * v13);
              if (v14)
              {
                v15 = *(_DWORD *)(v14 + 8);
                if (v15 == 2)
                {
                  xsltShallowCopyAttr(ctxt, inst, (uint64_t)ctxt->insert, *(_QWORD *)(*((_QWORD *)p_nodeNr + 1) + 8 * v13));
                }
                else if (v15 == 13 || v15 == 9)
                {
                  v17 = *(_QWORD *)(v14 + 24);
                  if (v17)
                  {
                    insert = ctxt->insert;
                    do
                    {
                      xsltCopyTree(ctxt, inst, v17, (uint64_t)insert, 0);
                      v17 = *(_QWORD *)(v17 + 48);
                    }
                    while (v17);
                  }
                }
                else
                {
                  xsltCopyTree(ctxt, inst, *(_QWORD *)(*((_QWORD *)p_nodeNr + 1) + 8 * v13), (uint64_t)ctxt->insert, 0);
                }
              }
              ++v13;
            }
            while (v13 < *p_nodeNr);
          }
        }
        else
        {
          v27 = xmlXPathCastToString(v9);
          if (v27)
          {
            v28 = v27;
            if (*v27)
              xsltCopyTextString(ctxt, ctxt->insert, v27, 0);
            ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v28);
            v29 = ctxt->traceCode;
            if (v29 && (*(_BYTE *)v29 & 0x40) != 0)
              xsltGenericDebug(xsltGenericDebugContext, "xsltCopyOf: result %s\n", (const char *)v10->stringval);
          }
          else
          {
            xsltTransformError(ctxt, 0, inst, "Internal error in xsltCopyOf(): failed to cast an XPath object to string.\n");
            ctxt->state = XSLT_STATE_STOPPED;
          }
        }
        xmlXPathFreeObject(v10);
      }
      else
      {
        ctxt->state = XSLT_STATE_STOPPED;
      }
    }
    else
    {
      xsltTransformError(ctxt, 0, inst, "xsl:copy-of : compilation failed\n");
    }
  }
}

xmlXPathObjectPtr xsltPreCompEval(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  xmlXPathCompExpr *v7;
  uint64_t v8;
  xmlXPathObjectPtr result;

  v3 = *(_QWORD *)(a1 + 160);
  v4 = *(_QWORD *)(v3 + 8);
  v5 = *(_DWORD *)(v3 + 88);
  v6 = *(_QWORD *)(v3 + 80);
  *(_QWORD *)(v3 + 8) = a2;
  v7 = *(xmlXPathCompExpr **)(a3 + 304);
  *(_QWORD *)(v3 + 80) = *(_QWORD *)(a3 + 312);
  *(_DWORD *)(v3 + 88) = *(_DWORD *)(a3 + 320);
  v8 = *(_QWORD *)(v3 + 104);
  result = xmlXPathCompiledEval(v7, (xmlXPathContextPtr)v3);
  *(_QWORD *)(v3 + 8) = v4;
  *(_QWORD *)(v3 + 104) = v8;
  *(_DWORD *)(v3 + 88) = v5;
  *(_QWORD *)(v3 + 80) = v6;
  return result;
}

xmlNodePtr xsltCopyTreeList(xmlNodePtr result, xmlNode *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  xsltTransformContext *v9;
  xmlNodePtr v10;
  BOOL v11;

  if (a3)
  {
    v7 = a3;
    v9 = (xsltTransformContext *)result;
    v10 = 0;
    do
    {
      result = xsltCopyTree(v9, a2, v7, a4, a5);
      if (v10)
        v11 = 1;
      else
        v11 = result == 0;
      if (!v11)
        v10 = result;
      v7 = *(_QWORD *)(v7 + 48);
    }
    while (v7);
  }
  return result;
}

xmlNodePtr xsltCopyTree(xsltTransformContext *a1, xmlNode *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  xmlNs *v10;
  _BOOL4 v12;
  const xmlChar *v13;
  xmlNode *v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  xmlNodePtr v19;
  xmlNs *v20;
  xmlNode *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  xmlNsPtr *NsList;
  xmlNsPtr *v26;
  xmlNsPtr v27;
  xmlNsPtr *v28;
  xmlNsPtr v29;
  xmlNsPtr v30;
  xmlNs *v31;
  uint64_t v32;
  uint64_t i;

  v10 = 0;
  switch(*(_DWORD *)(a3 + 8))
  {
    case 2:
      return (xmlNodePtr)xsltShallowCopyAttr(a1, a2, a4, a3);
    case 3:
      v12 = *(_QWORD *)(a3 + 16) == MEMORY[0x24BEDEC70];
      v13 = *(const xmlChar **)(a3 + 80);
      v14 = (xmlNode *)a4;
      return xsltCopyTextString(a1, v14, v13, v12);
    case 4:
      v13 = *(const xmlChar **)(a3 + 80);
      v14 = (xmlNode *)a4;
      v12 = 0;
      return xsltCopyTextString(a1, v14, v13, v12);
    case 9:
      v15 = *(_BYTE **)(a3 + 16);
      if (!v15 || *v15 != 32)
        goto LABEL_18;
      v16 = *(_QWORD *)(a3 + 24);
      if (!v16)
        goto LABEL_30;
      v10 = 0;
      do
      {
        v17 = xsltCopyTree(a1, a2, v16, a4, 0);
        if (v10)
          v18 = 1;
        else
          v18 = v17 == 0;
        if (!v18)
          v10 = (xmlNs *)v17;
        v16 = *(_QWORD *)(v16 + 48);
      }
      while (v16);
      break;
    case 0xA:
    case 0xB:
    case 0xC:
    case 0xE:
    case 0xF:
    case 0x10:
    case 0x11:
    case 0x13:
    case 0x14:
      return (xmlNodePtr)v10;
    case 0x12:
      return (xmlNodePtr)xsltShallowCopyNsNode(a1, a2, (xmlNodePtr)a4, a3);
    default:
LABEL_18:
      v19 = xmlDocCopyNode((xmlNodePtr)a3, *(xmlDocPtr *)(a4 + 64), 0);
      if (v19 && (v19->doc = a1->output, (v20 = (xmlNs *)xmlAddChild((xmlNodePtr)a4, v19)) != 0))
      {
        v21 = (xmlNode *)v20;
        v10 = *(xmlNs **)(a4 + 32);
        if (v10 == v20)
        {
          v20[1].next = 0;
          if (*(_DWORD *)(a3 + 8) == 1)
          {
            if ((_DWORD)a5 || (v24 = *(_QWORD *)(a3 + 40)) == 0 || (*(_DWORD *)(v24 + 8) | 4) == 0xD)
            {
              v22 = *(uint64_t **)(a3 + 96);
              if (v22)
                xsltCopyNamespaceListInternal(v20, v22);
            }
            else
            {
              NsList = xmlGetNsList(*(const xmlDoc **)(a3 + 64), (const xmlNode *)a3);
              if (NsList)
              {
                v26 = NsList;
                v27 = *NsList;
                v28 = NsList;
                do
                {
                  v29 = xmlSearchNs(*(xmlDocPtr *)(a4 + 64), (xmlNodePtr)a4, v27->prefix);
                  if (!v29 || (v30 = v29, !xmlStrEqual(v29->href, (*v28)->href)))
                    v30 = xmlNewNs(v21, (*v28)->href, (*v28)->prefix);
                  if (*(xmlNsPtr *)(a3 + 72) == *v28)
                    v21->ns = v30;
                  v31 = v28[1];
                  ++v28;
                  v27 = v31;
                }
                while (v31);
                ((void (*)(xmlNsPtr *))*MEMORY[0x24BEDE758])(v26);
              }
            }
            v23 = *(_QWORD *)(a3 + 72);
            if (v23)
            {
              if (!v21->ns)
                v21->ns = xsltGetSpecialNamespace(a1, a2, *(const xmlChar **)(v23 + 16), *(const xmlChar **)(v23 + 24), v21);
            }
            else if (*(_DWORD *)(a4 + 8) == 1 && *(_QWORD *)(a4 + 72))
            {
              xsltGetSpecialNamespace(a1, a2, 0, 0, v21);
            }
            v32 = *(_QWORD *)(a3 + 88);
            if (v32)
              xsltCopyAttrListNoOverwrite(a1, a2, v21, v32);
            if (a5 <= 1)
              a5 = 1;
            else
              a5 = a5;
          }
          for (i = *(_QWORD *)(a3 + 24); i; i = *(_QWORD *)(i + 48))
            xsltCopyTree(a1, a2, i, v21, a5);
          v10 = (xmlNs *)v21;
        }
      }
      else
      {
        xsltTransformError(a1, 0, a2, "xsltCopyTree: Copying of '%s' failed.\n");
LABEL_30:
        v10 = 0;
      }
      break;
  }
  return (xmlNodePtr)v10;
}

void xsltValueOf(xsltTransformContextPtr ctxt, xmlNodePtr node, xmlNodePtr inst, xsltElemPreCompPtr comp)
{
  unint64_t *traceCode;
  xmlXPathObject *v9;
  xmlXPathObject *v10;
  xmlChar *v11;
  const char *v12;
  unint64_t *v13;

  if (ctxt && node && inst)
  {
    if (comp && comp[4].inst && comp[7].inst)
    {
      traceCode = ctxt->traceCode;
      if (traceCode && (*(_BYTE *)traceCode & 0x80) != 0)
        xsltGenericDebug(xsltGenericDebugContext, "xsltValueOf: select %s\n", (const char *)comp[4].inst);
      v9 = xsltPreCompEval((uint64_t)ctxt, (uint64_t)node, (uint64_t)comp);
      if (v9)
      {
        v10 = v9;
        v11 = xmlXPathCastToString(v9);
        if (v11)
        {
          v12 = (const char *)v11;
          if (*v11)
            xsltCopyTextString(ctxt, ctxt->insert, v11, HIDWORD(comp[2].free));
          v13 = ctxt->traceCode;
          if (v13)
          {
            if ((*(_BYTE *)v13 & 0x80) != 0)
              xsltGenericDebug(xsltGenericDebugContext, "xsltValueOf: result '%s'\n", v12);
          }
          ((void (*)(const char *))*MEMORY[0x24BEDE758])(v12);
        }
        else
        {
          xsltTransformError(ctxt, 0, inst, "Internal error in xsltValueOf(): failed to cast an XPath object to string.\n");
          ctxt->state = XSLT_STATE_STOPPED;
        }
        xmlXPathFreeObject(v10);
      }
      else
      {
        xsltTransformError(ctxt, 0, inst, "XPath evaluation returned no result.\n");
        ctxt->state = XSLT_STATE_STOPPED;
      }
    }
    else
    {
      xsltTransformError(ctxt, 0, inst, "Internal error in xsltValueOf(): The XSLT 'value-of' instruction was not compiled.\n");
    }
  }
}

void xsltNumber(xsltTransformContextPtr ctxt, xmlNodePtr node, xmlNodePtr inst, xsltElemPreCompPtr comp)
{
  xmlXPathContextPtr xpathCtxt;
  int nsNr;
  xmlNsPtr *namespaces;

  if (comp)
  {
    if (ctxt && node)
    {
      if (inst)
      {
        comp[6].free = (xsltElemPreCompDeallocator)inst->doc;
        comp[7].next = (xsltElemPreCompPtr)inst;
        xpathCtxt = ctxt->xpathCtxt;
        nsNr = xpathCtxt->nsNr;
        namespaces = xpathCtxt->namespaces;
        xpathCtxt->namespaces = (xmlNsPtr *)comp[7].free;
        xpathCtxt->nsNr = (int)comp[8].next;
        xsltNumberFormat(ctxt, (xsltNumberDataPtr)&comp[5].func, node);
        xpathCtxt->nsNr = nsNr;
        xpathCtxt->namespaces = namespaces;
      }
    }
  }
  else
  {
    xsltTransformError(ctxt, 0, inst, "xsl:number : compilation failed\n");
  }
}

void xsltApplyImports(xsltTransformContextPtr ctxt, xmlNodePtr node, xmlNodePtr inst, xsltElemPreCompPtr comp)
{
  xsltTemplatePtr currentTemplateRule;
  xsltTemplatePtr Template;
  xsltTemplate *v8;
  const char *v9;

  if (ctxt && inst)
  {
    if (comp)
    {
      currentTemplateRule = ctxt->currentTemplateRule;
      if (currentTemplateRule)
      {
        Template = xsltGetTemplate(ctxt, node, currentTemplateRule->style);
        if (Template)
        {
          v8 = ctxt->currentTemplateRule;
          ctxt->currentTemplateRule = Template;
          xsltApplyXSLTTemplate((uint64_t)ctxt, node, Template->content, Template, 0);
          ctxt->currentTemplateRule = v8;
        }
        else
        {
          xsltDefaultProcessOneNode(ctxt, node, 0);
        }
        return;
      }
      v9 = "It is an error to call 'apply-imports' when there's no current template rule.\n";
    }
    else
    {
      v9 = "Internal error in xsltApplyImports(): The XSLT 'apply-imports' instruction was not compiled.\n";
    }
    xsltTransformError(ctxt, 0, inst, v9);
  }
}

void xsltCallTemplate(xsltTransformContextPtr ctxt, xmlNodePtr node, xmlNodePtr inst, xsltElemPreCompPtr comp)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (__cdecl *Template)(xsltTransformContextPtr, xmlNodePtr, xmlNodePtr, xsltElemPreCompPtr);
  unint64_t *traceCode;
  _xmlNode *children;
  xsltStackElem *v15;
  xmlNs *ns;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  xsltStackElemPtr v23;
  unint64_t *v24;

  if (ctxt->insert)
  {
    if (comp)
    {
      if (comp[4].func
        || (Template = (void (__cdecl *)(xsltTransformContextPtr, xmlNodePtr, xmlNodePtr, xsltElemPreCompPtr))xsltFindTemplate(ctxt, (const xmlChar *)comp[3].next, (const xmlChar *)comp[3].func),
            (comp[4].func = Template) != 0))
      {
        if (comp[3].next)
        {
          traceCode = ctxt->traceCode;
          if (traceCode)
          {
            if ((*((_BYTE *)traceCode + 1) & 1) != 0)
              xsltGenericDebug(xsltGenericDebugContext, "call-template: name %s\n", (const char *)comp[3].next);
          }
        }
        children = inst->children;
        if (children)
        {
          v15 = 0;
          do
          {
            if (ctxt->debugStatus)
              xslHandleDebugger(children, node, (xsltTemplatePtr)comp[4].func, ctxt);
            if (ctxt->state == XSLT_STATE_STOPPED)
              break;
            if (children->type == XML_ELEMENT_NODE
              && (ns = children->ns) != 0
              && xmlStrEqual(ns->href, (const xmlChar *)"http://www.w3.org/1999/XSL/Transform"))
            {
              if (xmlStrEqual(children->name, (const xmlChar *)"with-param"))
              {
                v23 = xsltParseStylesheetCallerParam(ctxt, children);
                if (v23)
                {
                  v23->next = v15;
                  v15 = v23;
                }
              }
              else
              {
                xsltGenericError(xsltGenericErrorContext, "xsl:call-template: misplaced xsl:%s\n", v17, v18, v19, v20, v21, v22, (char)children->name);
              }
            }
            else
            {
              xsltGenericError(xsltGenericErrorContext, "xsl:call-template: misplaced %s element\n", (uint64_t)inst, (uint64_t)comp, v4, v5, v6, v7, (char)children->name);
            }
            children = children->next;
          }
          while (children);
        }
        else
        {
          v15 = 0;
        }
        xsltApplyXSLTTemplate((uint64_t)ctxt, node, *((xmlNodePtr *)comp[4].func + 8), (xsltTemplatePtr)comp[4].func, v15);
        if (v15)
          xsltFreeStackElemList(v15);
        if (comp[3].next)
        {
          v24 = ctxt->traceCode;
          if (v24)
          {
            if ((*((_BYTE *)v24 + 1) & 1) != 0)
              xsltGenericDebug(xsltGenericDebugContext, "call-template returned: name %s\n", (const char *)comp[3].next);
          }
        }
      }
      else if (comp[3].func)
      {
        xsltTransformError(ctxt, 0, inst, "The called template '{%s}%s' was not found.\n");
      }
      else
      {
        xsltTransformError(ctxt, 0, inst, "The called template '%s' was not found.\n");
      }
    }
    else
    {
      xsltTransformError(ctxt, 0, inst, "The XSLT 'call-template' instruction was not compiled.\n");
    }
  }
}

void xsltApplyTemplates(xsltTransformContextPtr ctxt, xmlNodePtr node, xmlNodePtr inst, xsltElemPreCompPtr comp)
{
  unint64_t *traceCode;
  xmlXPathContextPtr xpathCtxt;
  xmlNodeSet *nodeList;
  uint64_t v11;
  xmlDoc *doc;
  unint64_t *v13;
  xmlXPathObjectPtr v14;
  xmlXPathObject *v15;
  xmlNodeSet *nodesetval;
  unint64_t *v17;
  xmlNodeSetPtr v18;
  _xmlNode *i;
  unsigned int v20;
  BOOL v21;
  int v22;
  unint64_t *v24;
  _xmlNode *children;
  xsltStackElem *v26;
  xmlElementType type;
  xmlNs *ns;
  xsltStackElemPtr v29;
  xsltTemplate *currentTemplateRule;
  _xmlNode *next;
  int v32;
  xmlElementType v33;
  xmlNs *v34;
  xsltStackElemPtr v35;
  int nodeNr;
  uint64_t v37;
  xmlNodePtr v38;
  xmlDoc *v39;
  __int128 v40;
  __int128 v41;
  xmlNodePtr sorts;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  if (!comp)
  {
    xsltTransformError(ctxt, 0, inst, "xsl:apply-templates : compilation failed\n");
    return;
  }
  if (ctxt && node && inst)
  {
    if (node->name)
    {
      traceCode = ctxt->traceCode;
      if (traceCode)
      {
        if ((*((_BYTE *)traceCode + 1) & 2) != 0)
          xsltGenericDebug(xsltGenericDebugContext, "xsltApplyTemplates: node: '%s'\n", (const char *)node->name);
      }
    }
    xpathCtxt = ctxt->xpathCtxt;
    v40 = *(_OWORD *)&ctxt->document;
    v41 = *(_OWORD *)&ctxt->mode;
    nodeList = ctxt->nodeList;
    v11 = *(_QWORD *)&xpathCtxt->contextSize;
    doc = xpathCtxt->doc;
    *(_OWORD *)&ctxt->mode = *(_OWORD *)&comp[3].free;
    if (comp[4].inst)
    {
      if (comp[7].inst)
      {
        v13 = ctxt->traceCode;
        if (v13 && (*((_BYTE *)v13 + 1) & 2) != 0)
          xsltGenericDebug(xsltGenericDebugContext, "xsltApplyTemplates: select %s\n", (const char *)comp[4].inst);
        v14 = xsltPreCompEval((uint64_t)ctxt, (uint64_t)node, (uint64_t)comp);
        if (v14)
        {
          v15 = v14;
          if (v14->type == XPATH_NODESET)
          {
            nodesetval = v14->nodesetval;
            v14->nodesetval = 0;
            xmlXPathFreeObject(v14);
            if (!nodesetval)
            {
              v17 = ctxt->traceCode;
              if (v17)
              {
                if ((*((_BYTE *)v17 + 1) & 2) != 0)
                  xsltGenericDebug(xsltGenericDebugContext, "xsltApplyTemplates: select didn't evaluate to a node list\n");
              }
              goto LABEL_79;
            }
LABEL_30:
            v24 = ctxt->traceCode;
            if (v24 && (*((_BYTE *)v24 + 1) & 2) != 0)
              xsltGenericDebug(xsltGenericDebugContext, "xsltApplyTemplates: list of %d nodes\n", nodesetval->nodeNr);
            if (nodesetval->nodeNr)
            {
              ctxt->nodeList = nodesetval;
              children = inst->children;
              if (children)
              {
                v26 = 0;
                do
                {
                  if (ctxt->debugStatus)
                    xslHandleDebugger(children, node, 0, ctxt);
                  if (ctxt->state == XSLT_STATE_STOPPED)
                    break;
                  type = children->type;
                  if (type != XML_TEXT_NODE)
                  {
                    if (type != XML_ELEMENT_NODE)
                      break;
                    ns = children->ns;
                    if (!ns || !xmlStrEqual(ns->href, (const xmlChar *)"http://www.w3.org/1999/XSL/Transform"))
                      break;
                    if (xmlStrEqual(children->name, (const xmlChar *)"with-param"))
                    {
                      v29 = xsltParseStylesheetCallerParam(ctxt, children);
                      if (v29)
                      {
                        v29->next = v26;
                        v26 = v29;
                      }
                    }
                    if (xmlStrEqual(children->name, (const xmlChar *)"sort"))
                    {
                      currentTemplateRule = ctxt->currentTemplateRule;
                      v48 = 0u;
                      v49 = 0u;
                      v46 = 0u;
                      v47 = 0u;
                      v44 = 0u;
                      v45 = 0u;
                      v43 = 0u;
                      sorts = children;
                      next = children->next;
                      if (next)
                      {
                        v32 = 1;
                        do
                        {
                          if (ctxt->debugStatus)
                            xslHandleDebugger(next, node, 0, ctxt);
                          if (ctxt->state == XSLT_STATE_STOPPED)
                            break;
                          v33 = next->type;
                          if (v33 != XML_TEXT_NODE)
                          {
                            if (v33 != XML_ELEMENT_NODE)
                              break;
                            v34 = next->ns;
                            if (!v34
                              || !xmlStrEqual(v34->href, (const xmlChar *)"http://www.w3.org/1999/XSL/Transform"))
                            {
                              break;
                            }
                            if (xmlStrEqual(next->name, (const xmlChar *)"with-param"))
                            {
                              v35 = xsltParseStylesheetCallerParam(ctxt, next);
                              if (v35)
                              {
                                v35->next = v26;
                                v26 = v35;
                              }
                            }
                            if (xmlStrEqual(next->name, (const xmlChar *)"sort"))
                            {
                              if (v32 >= 15)
                              {
                                xsltTransformError(ctxt, 0, next, "The number (%d) of xsl:sort instructions exceeds the maximum allowed by this processor's settings.\n", v32);
                                ctxt->state = XSLT_STATE_STOPPED;
                                break;
                              }
                              *(&sorts + v32++) = next;
                            }
                          }
                          next = next->next;
                        }
                        while (next);
                      }
                      else
                      {
                        v32 = 1;
                      }
                      ctxt->currentTemplateRule = 0;
                      xsltDoSortFunction(ctxt, &sorts, v32);
                      ctxt->currentTemplateRule = currentTemplateRule;
                      break;
                    }
                  }
                  children = children->next;
                }
                while (children);
              }
              else
              {
                v26 = 0;
              }
              nodeNr = nodesetval->nodeNr;
              xpathCtxt->contextSize = nodesetval->nodeNr;
              if (nodeNr >= 1)
              {
                v37 = 0;
                do
                {
                  v38 = nodesetval->nodeTab[v37];
                  ctxt->node = v38;
                  if (v38->type != XML_NAMESPACE_DECL)
                  {
                    v39 = v38->doc;
                    if (v39)
                      xpathCtxt->doc = v39;
                  }
                  xpathCtxt->proximityPosition = ++v37;
                  xsltProcessOneNode(ctxt, v38, v26);
                }
                while (v37 < nodesetval->nodeNr);
              }
              if (v26)
                xsltFreeStackElemList(v26);
            }
            xmlXPathFreeNodeSet(nodesetval);
            goto LABEL_79;
          }
          xsltTransformError(ctxt, 0, inst, "The 'select' expression did not evaluate to a node set.\n");
          ctxt->state = XSLT_STATE_STOPPED;
          xmlXPathFreeObject(v15);
        }
        else
        {
          xsltTransformError(ctxt, 0, inst, "Failed to evaluate the 'select' expression.\n");
          ctxt->state = XSLT_STATE_STOPPED;
        }
      }
      else
      {
        xsltTransformError(ctxt, 0, inst, "xsl:apply-templates : compilation failed\n");
      }
    }
    else
    {
      v18 = xmlXPathNodeSetCreate(0);
      if (v18)
      {
        nodesetval = v18;
        if (node->type != XML_NAMESPACE_DECL)
        {
          for (i = node->children; i; i = i->next)
          {
            v20 = i->type;
            v21 = v20 > 0xD;
            v22 = (1 << v20) & 0x239E;
            if (!v21 && v22 != 0)
              xmlXPathNodeSetAddUnique(nodesetval, i);
          }
        }
        goto LABEL_30;
      }
    }
LABEL_79:
    xpathCtxt->doc = doc;
    *(_QWORD *)&xpathCtxt->contextSize = v11;
    ctxt->nodeList = nodeList;
    *(_OWORD *)&ctxt->document = v40;
    *(_OWORD *)&ctxt->mode = v41;
  }
}

void xsltChoose(xsltTransformContextPtr ctxt, xmlNodePtr node, xmlNodePtr inst, xsltElemPreCompPtr comp)
{
  _xmlNode *children;
  xmlNs *ns;
  xmlNs *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t psvi;
  unint64_t *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  unint64_t *v26;
  const char *v27;
  xsltTransformContext *v28;
  xmlNode *v29;
  xmlNs *v30;
  unint64_t *traceCode;

  if (!ctxt || !node || !inst)
    return;
  children = inst->children;
  if (!children)
  {
    v27 = "xsl:choose: The instruction has no content.\n";
LABEL_30:
    v28 = ctxt;
    v29 = inst;
LABEL_31:
    xsltTransformError(v28, 0, v29, v27);
    return;
  }
  if (children->type != XML_ELEMENT_NODE
    || (ns = children->ns) == 0
    || !xmlStrEqual(ns->href, (const xmlChar *)"http://www.w3.org/1999/XSL/Transform")
    || !xmlStrEqual(children->name, (const xmlChar *)"when"))
  {
    v27 = "xsl:choose: xsl:when expected first\n";
    goto LABEL_30;
  }
  while (children->type == XML_ELEMENT_NODE)
  {
    v9 = children->ns;
    if (!v9
      || !xmlStrEqual(v9->href, (const xmlChar *)"http://www.w3.org/1999/XSL/Transform")
      || !xmlStrEqual(children->name, (const xmlChar *)"when"))
    {
      if (children->type == XML_ELEMENT_NODE)
      {
        v30 = children->ns;
        if (v30)
        {
          if (xmlStrEqual(v30->href, (const xmlChar *)"http://www.w3.org/1999/XSL/Transform")
            && xmlStrEqual(children->name, (const xmlChar *)"otherwise"))
          {
            if (xslDebugStatus)
              xslHandleDebugger(children, node, 0, ctxt);
            traceCode = ctxt->traceCode;
            if (traceCode && (*((_BYTE *)traceCode + 1) & 4) != 0)
              xsltGenericDebug(xsltGenericDebugContext, "evaluating xsl:otherwise\n");
LABEL_41:
            xsltApplySequenceConstructor((uint64_t)ctxt, ctxt->node, children->children, 0);
            return;
          }
        }
      }
      return;
    }
    psvi = (uint64_t)children->psvi;
    if (!psvi || !*(_QWORD *)(psvi + 168) || !*(_QWORD *)(psvi + 304))
    {
      v27 = "Internal error in xsltChoose(): The XSLT 'when' instruction was not compiled.\n";
      v28 = ctxt;
      v29 = children;
      goto LABEL_31;
    }
    if (xslDebugStatus)
      xslHandleDebugger(children, node, 0, ctxt);
    v17 = ctxt->traceCode;
    if (v17 && (*((_BYTE *)v17 + 1) & 4) != 0)
      xsltGenericDebug(xsltGenericDebugContext, "xsltChoose: test %s\n", v10, v11, v12, v13, v14, v15, *(_QWORD *)(psvi + 168));
    v18 = xsltPreCompEvalToBoolean((uint64_t)ctxt, (uint64_t)node, psvi);
    if (v18 == -1)
    {
      ctxt->state = XSLT_STATE_STOPPED;
      return;
    }
    v25 = v18;
    v26 = ctxt->traceCode;
    if (v26)
    {
      if ((*((_BYTE *)v26 + 1) & 4) != 0)
        xsltGenericDebug(xsltGenericDebugContext, "xsltChoose: test evaluate to %d\n", v19, v20, v21, v22, v23, v24, v18 == 1);
    }
    if (v25 == 1)
      goto LABEL_41;
    children = children->next;
    if (!children)
      return;
  }
}

uint64_t xsltPreCompEvalToBoolean(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  xmlXPathCompExpr *v7;
  uint64_t v8;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 160);
  v4 = *(_QWORD *)(v3 + 8);
  v5 = *(_DWORD *)(v3 + 88);
  v6 = *(_QWORD *)(v3 + 80);
  *(_QWORD *)(v3 + 8) = a2;
  v7 = *(xmlXPathCompExpr **)(a3 + 304);
  *(_QWORD *)(v3 + 80) = *(_QWORD *)(a3 + 312);
  *(_DWORD *)(v3 + 88) = *(_DWORD *)(a3 + 320);
  v8 = *(_QWORD *)(v3 + 104);
  result = xmlXPathCompiledEvalToBoolean(v7, (xmlXPathContextPtr)v3);
  *(_QWORD *)(v3 + 8) = v4;
  *(_QWORD *)(v3 + 104) = v8;
  *(_DWORD *)(v3 + 88) = v5;
  *(_QWORD *)(v3 + 80) = v6;
  return result;
}

void xsltIf(xsltTransformContextPtr ctxt, xmlNodePtr node, xmlNodePtr inst, xsltElemPreCompPtr comp)
{
  unint64_t *traceCode;
  xmlDoc *localRVT;
  int v10;
  unint64_t *v11;

  if (ctxt && node && inst)
  {
    if (comp && *(_QWORD *)&comp[4].type && comp[7].inst)
    {
      traceCode = ctxt->traceCode;
      if (traceCode && (*((_BYTE *)traceCode + 1) & 8) != 0)
        xsltGenericDebug(xsltGenericDebugContext, "xsltIf: test %s\n", *(const char **)&comp[4].type);
      localRVT = ctxt->localRVT;
      v10 = xsltPreCompEvalToBoolean((uint64_t)ctxt, (uint64_t)node, (uint64_t)comp);
      if (localRVT != ctxt->localRVT)
        xsltReleaseLocalRVTs(ctxt, localRVT);
      v11 = ctxt->traceCode;
      if (v11 && (*((_BYTE *)v11 + 1) & 8) != 0)
        xsltGenericDebug(xsltGenericDebugContext, "xsltIf: test evaluate to %d\n", v10);
      if (v10 == 1)
      {
        xsltApplySequenceConstructor((uint64_t)ctxt, node, inst->children, 0);
      }
      else if (v10 == -1)
      {
        ctxt->state = XSLT_STATE_STOPPED;
      }
    }
    else
    {
      xsltTransformError(ctxt, 0, inst, "Internal error in xsltIf(): The XSLT 'if' instruction was not compiled.\n");
    }
  }
}

void xsltReleaseLocalRVTs(xsltTransformContextPtr ctxt, xmlDoc *a2)
{
  xmlDocPtr localRVT;
  _xmlNode *next;
  int compression;
  xmlGenericErrorFunc v7;
  void **v8;

  localRVT = ctxt->localRVT;
  if (localRVT != a2)
  {
    if (localRVT->prev)
      xsltTransformError(ctxt, 0, 0, "localRVT not head of list\n");
    ctxt->localRVT = a2;
    if (a2)
      a2->prev = 0;
    do
    {
      next = localRVT->next;
      if (linkedOnOrAfterFall2023OSVersions())
        compression = localRVT->compression;
      else
        compression = (int)localRVT->psvi;
      switch(compression)
      {
        case 3:
          xsltRegisterPersistRVT(ctxt, localRVT);
          break;
        case 2:
          xsltRegisterLocalRVT(ctxt, localRVT);
          if (linkedOnOrAfterFall2023OSVersions())
            localRVT->compression = 2;
          else
            localRVT->psvi = (void *)2;
          break;
        case 1:
          xsltReleaseRVT(ctxt, localRVT);
          break;
        default:
          v7 = *__xmlGenericError();
          v8 = __xmlGenericErrorContext();
          v7(*v8, "xsltReleaseLocalRVTs: Unexpected RVT flag %p\n", localRVT->psvi);
          break;
      }
      localRVT = (xmlDocPtr)next;
    }
    while (next != (_xmlNode *)a2);
  }
}

void xsltForEach(xsltTransformContextPtr ctxt, xmlNodePtr node, xmlNodePtr inst, xsltElemPreCompPtr comp)
{
  xmlXPathContextPtr xpathCtxt;
  unint64_t *traceCode;
  xmlNodeSet *nodeList;
  xsltTemplate *currentTemplateRule;
  xmlDoc *doc;
  uint64_t v13;
  xmlXPathObjectPtr v14;
  xmlXPathObject *v15;
  xmlNodeSet *nodesetval;
  unint64_t *v17;
  _xmlNode *children;
  xmlNs *ns;
  uint64_t v20;
  xmlNs *v21;
  const char *v22;
  unint64_t *v23;
  int nodeNr;
  uint64_t v25;
  xmlNodePtr v26;
  xmlDoc *v27;
  __int128 v28;
  xmlNodePtr sorts;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (!ctxt || !node || !inst)
  {
    xsltGenericError(xsltGenericErrorContext, "xsltForEach(): Bad arguments.\n");
    return;
  }
  if (!comp)
  {
    v22 = "Internal error in xsltForEach(): The XSLT 'for-each' instruction was not compiled.\n";
    goto LABEL_38;
  }
  if (!comp[4].inst || !comp[7].inst)
  {
    v22 = "Internal error in xsltForEach(): The selecting expression of the XSLT 'for-each' instruction was not compiled correctly.\n";
LABEL_38:
    xsltTransformError(ctxt, 0, inst, v22);
    return;
  }
  xpathCtxt = ctxt->xpathCtxt;
  traceCode = ctxt->traceCode;
  if (traceCode && (*((_BYTE *)traceCode + 1) & 0x10) != 0)
    xsltGenericDebug(xsltGenericDebugContext, "xsltForEach: select %s\n", (const char *)comp[4].inst);
  nodeList = ctxt->nodeList;
  v28 = *(_OWORD *)&ctxt->document;
  currentTemplateRule = ctxt->currentTemplateRule;
  ctxt->currentTemplateRule = 0;
  doc = xpathCtxt->doc;
  v13 = *(_QWORD *)&xpathCtxt->contextSize;
  v14 = xsltPreCompEval((uint64_t)ctxt, (uint64_t)node, (uint64_t)comp);
  if (v14)
  {
    v15 = v14;
    if (v14->type == XPATH_NODESET)
    {
      nodesetval = v14->nodesetval;
      if (nodesetval && nodesetval->nodeNr >= 1)
      {
        v17 = ctxt->traceCode;
        if (v17 && (*((_BYTE *)v17 + 1) & 0x10) != 0)
          xsltGenericDebug(xsltGenericDebugContext, "xsltForEach: select evaluates to %d nodes\n", nodesetval->nodeNr);
        ctxt->nodeList = nodesetval;
        children = inst->children;
        if (children)
        {
          if (children->type == XML_ELEMENT_NODE)
          {
            ns = children->ns;
            if (ns)
            {
              if (xmlStrEqual(ns->href, (const xmlChar *)"http://www.w3.org/1999/XSL/Transform")
                && xmlStrEqual(children->name, (const xmlChar *)"sort"))
              {
                v35 = 0u;
                v36 = 0u;
                v33 = 0u;
                v34 = 0u;
                v31 = 0u;
                v32 = 0u;
                v30 = 0u;
                sorts = children;
                if (xslDebugStatus)
                  xslHandleDebugger(children, node, 0, ctxt);
                children = children->next;
                if (children)
                {
                  v20 = 1;
                  do
                  {
                    if (children->type != XML_ELEMENT_NODE)
                      break;
                    v21 = children->ns;
                    if (!v21
                      || !xmlStrEqual(v21->href, (const xmlChar *)"http://www.w3.org/1999/XSL/Transform")
                      || !xmlStrEqual(children->name, (const xmlChar *)"sort"))
                    {
                      break;
                    }
                    if (v20 == 15)
                    {
                      xsltTransformError(ctxt, 0, children, "The number of xsl:sort instructions exceeds the maximum (%d) allowed by this processor.\n", 15);
                      goto LABEL_51;
                    }
                    *(&sorts + v20) = children;
                    if (xslDebugStatus)
                      xslHandleDebugger(children, node, 0, ctxt);
                    children = children->next;
                    ++v20;
                  }
                  while (children);
                }
                else
                {
                  LODWORD(v20) = 1;
                }
                xsltDoSortFunction(ctxt, &sorts, v20);
              }
            }
          }
        }
        nodeNr = nodesetval->nodeNr;
        xpathCtxt->contextSize = nodesetval->nodeNr;
        if (nodeNr >= 1)
        {
          v25 = 0;
          do
          {
            v26 = nodesetval->nodeTab[v25];
            ctxt->node = v26;
            if (v26->type != XML_NAMESPACE_DECL)
            {
              v27 = v26->doc;
              if (v27)
                xpathCtxt->doc = v27;
            }
            xpathCtxt->proximityPosition = ++v25;
            xsltApplySequenceConstructor((uint64_t)ctxt, v26, children, 0);
          }
          while (v25 < nodesetval->nodeNr);
        }
      }
    }
    else
    {
      xsltTransformError(ctxt, 0, inst, "The 'select' expression does not evaluate to a node set.\n");
      v23 = ctxt->traceCode;
      if (v23 && (*((_BYTE *)v23 + 1) & 0x10) != 0)
        xsltGenericDebug(xsltGenericDebugContext, "xsltForEach: select didn't evaluate to a node list\n");
    }
LABEL_51:
    xmlXPathFreeObject(v15);
  }
  else
  {
    xsltTransformError(ctxt, 0, inst, "Failed to evaluate the 'select' expression.\n");
    ctxt->state = XSLT_STATE_STOPPED;
  }
  ctxt->nodeList = nodeList;
  *(_OWORD *)&ctxt->document = v28;
  ctxt->currentTemplateRule = currentTemplateRule;
  xpathCtxt->doc = doc;
  *(_QWORD *)&xpathCtxt->contextSize = v13;
}

void xsltApplyStripSpaces(xsltTransformContextPtr ctxt, xmlNodePtr node)
{
  int v4;
  xmlNodePtr children;
  xmlNodePtr v6;
  unsigned int type;
  BOOL v8;
  int v9;
  _xmlNode *i;
  _xmlNode *next;
  BOOL v13;
  unint64_t *traceCode;

  if (node)
  {
    v4 = 0;
    children = node;
    while (1)
    {
      v6 = children;
      type = children->type;
      v8 = type > 0xD;
      v9 = (1 << type) & 0x239E;
      if (!v8 && v9 != 0)
      {
        if (v6->children)
        {
          if (xsltFindElemSpaceHandling(ctxt, v6))
          {
            for (i = v6->children; i; i = i->next)
            {
              while (i->type == XML_TEXT_NODE && xsltIsBlank(i->content))
              {
                next = i->next;
                xmlUnlinkNode(i);
                xmlFreeNode(i);
                ++v4;
                i = next;
                if (!next)
                  goto LABEL_15;
              }
            }
          }
        }
      }
LABEL_15:
      if (node->type == XML_ENTITY_REF_NODE)
        xsltApplyStripSpaces(ctxt, node->children);
      children = v6->children;
      if (!children || v6->type == XML_ENTITY_REF_NODE)
      {
        while (1)
        {
          children = v6->next;
          if (children)
            break;
          v6 = v6->parent;
          if (v6)
            v13 = v6 == node;
          else
            v13 = 1;
          if (v13)
            goto LABEL_27;
        }
      }
    }
  }
  v4 = 0;
LABEL_27:
  traceCode = ctxt->traceCode;
  if (traceCode)
  {
    if ((*((_BYTE *)traceCode + 1) & 0x20) != 0)
      xsltGenericDebug(xsltGenericDebugContext, "xsltApplyStripSpaces: removed %d ignorable blank node\n", v4);
  }
}

xmlDocPtr xsltApplyStylesheet(xsltStylesheetPtr style, xmlDocPtr doc, const char **params)
{
  return xsltApplyStylesheetInternal(style, doc, params, 0, 0, 0);
}

htmlDocPtr xsltApplyStylesheetInternal(xsltStylesheetPtr a1, xmlDoc *a2, const char **a3, char *a4, FILE *a5, xsltTransformContext *a6)
{
  htmlDocPtr v12;
  _xmlNode *intSubset;
  _xmlNode **p_next;
  _xmlNode *next;
  _xmlNode *prev;
  xmlNodePtr RootElement;
  xsltTransformContextPtr v18;
  xmlDict *dict;
  const xmlChar *mode;
  const xmlChar *modeURI;
  xsltStylesheetPtr Import;
  const xmlChar *method;
  xsltStylesheetPtr v24;
  xmlChar *doctypePublic;
  xsltStylesheetPtr v26;
  xmlChar *doctypeSystem;
  xsltStylesheetPtr v28;
  xmlChar *version;
  xsltStylesheetPtr v30;
  const xmlChar *encoding;
  htmlDocPtr v32;
  xmlDict *v33;
  xsltStackElemPtr variables;
  xmlXPathContextPtr xpathCtxt;
  xmlNode *v36;
  xsltStylesheet *style;
  const xmlChar *v38;
  const xmlChar *v39;
  xsltStylesheet *v40;
  _QWORD *keys;
  int nbKeys;
  xsltStackElem *v43;
  _QWORD *v44;
  _QWORD *v45;
  xmlXPathObject *value;
  xmlNodePtr v47;
  xmlNodePtr v48;
  xmlNs *ns;
  const xmlChar *prefix;
  const xmlChar *name;
  _xmlNode *children;
  xmlElementType type;
  BOOL v54;
  const xmlChar *v55;
  const xmlChar *v56;
  xsltStylesheetPtr v57;
  const xmlChar *v58;
  const xmlChar *v59;
  _xmlNode *v60;
  _xmlNode *last;
  _xmlNode *v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *PSVIPtr;
  int v66;
  uint64_t i;
  int v68;
  const xmlDoc *v69;
  xmlNode *v70;
  xmlDtd *v71;
  FILE *output;
  xmlChar *URL;
  __int128 v75;

  xsltInitGlobals();
  v12 = 0;
  if (!a1 || !a2)
    return v12;
  if (!a1->internalized)
    xsltGenericDebug(xsltGenericDebugContext, "Stylesheet was not fully internalized !\n");
  intSubset = (_xmlNode *)a2->intSubset;
  if (intSubset)
  {
    p_next = &intSubset->next;
    next = intSubset->next;
    if (next)
      next->prev = intSubset->prev;
    prev = intSubset->prev;
    if (prev)
      prev->next = next;
    if (a2->children == intSubset)
      a2->children = *p_next;
    if (a2->last == intSubset)
      a2->last = prev;
    *p_next = 0;
    intSubset->prev = 0;
  }
  RootElement = xmlDocGetRootElement(a2);
  if (RootElement && ((unint64_t)RootElement->content & 0x8000000000000000) == 0 && !xslDebugStatus)
    xmlXPathOrderDocElems(a2);
  v18 = a6;
  if (!a6)
  {
    v18 = xsltNewTransformContext(a1, a2);
    if (!v18)
      return 0;
  }
  v18->initialContextNode = (xmlNodePtr)a2;
  v18->initialContextDoc = a2;
  if (a5)
    v18->profile = 1;
  v18->outputFile = a4;
  dict = v18->dict;
  if (dict)
  {
    mode = v18->mode;
    if (mode)
      v18->mode = xmlDictLookup(dict, mode, -1);
    modeURI = v18->modeURI;
    if (modeURI)
      v18->modeURI = xmlDictLookup(v18->dict, modeURI, -1);
  }
  Import = a1;
  do
  {
    method = Import->method;
    if (method)
      break;
    Import = xsltNextImport(Import);
  }
  while (Import);
  *((_QWORD *)&v75 + 1) = 0;
  v24 = a1;
  while (1)
  {
    doctypePublic = v24->doctypePublic;
    if (doctypePublic)
      break;
    v24 = xsltNextImport(v24);
    if (!v24)
      goto LABEL_36;
  }
  *((_QWORD *)&v75 + 1) = v24->doctypePublic;
LABEL_36:
  output = a5;
  *(_QWORD *)&v75 = 0;
  v26 = a1;
  while (1)
  {
    doctypeSystem = v26->doctypeSystem;
    if (doctypeSystem)
      break;
    v26 = xsltNextImport(v26);
    if (!v26)
      goto LABEL_41;
  }
  *(_QWORD *)&v75 = v26->doctypeSystem;
LABEL_41:
  URL = (xmlChar *)a4;
  v28 = a1;
  do
  {
    version = v28->version;
    if (version)
      break;
    v28 = xsltNextImport(v28);
  }
  while (v28);
  v30 = a1;
  do
  {
    encoding = v30->encoding;
    if (encoding)
      break;
    v30 = xsltNextImport(v30);
  }
  while (v30);
  if (method && !xmlStrEqual(method, (const xmlChar *)"xml"))
  {
    if (xmlStrEqual(method, (const xmlChar *)"html"))
    {
      v18->type = XSLT_OUTPUT_HTML;
      if ((unint64_t)doctypePublic | (unint64_t)doctypeSystem)
      {
        v38 = doctypeSystem;
        v39 = doctypePublic;
      }
      else
      {
        if (!version)
        {
          v69 = htmlNewDoc(0, 0);
          if (v69)
          {
            v12 = (htmlDocPtr)v69;
            v70 = (xmlNode *)xmlGetIntSubset(v69);
            if (v70)
            {
              v71 = (xmlDtd *)v70;
              xmlUnlinkNode(v70);
              xmlFreeDtd(v71);
            }
            v12->intSubset = 0;
            v12->extSubset = 0;
            goto LABEL_52;
          }
          goto LABEL_163;
        }
        xsltGetHTMLIDs(version, (_QWORD *)&v75 + 1, &v75);
        v39 = (const xmlChar *)*((_QWORD *)&v75 + 1);
        v38 = (const xmlChar *)v75;
      }
      v12 = htmlNewDoc(v38, v39);
      if (v12)
        goto LABEL_52;
      goto LABEL_163;
    }
    if (xmlStrEqual(method, (const xmlChar *)"xhtml"))
    {
      xsltTransformError(v18, 0, (xmlNodePtr)a2, "xsltApplyStylesheetInternal: unsupported method xhtml, using html\n");
      v18->type = XSLT_OUTPUT_HTML;
      v32 = htmlNewDoc(doctypeSystem, doctypePublic);
      if (v32)
        goto LABEL_51;
      goto LABEL_163;
    }
    if (!xmlStrEqual(method, (const xmlChar *)"text"))
    {
      xsltTransformError(v18, 0, (xmlNodePtr)a2, "xsltApplyStylesheetInternal: unsupported method (%s)\n", (const char *)method);
LABEL_163:
      if (!a6)
        xsltFreeTransformContext(v18);
      return 0;
    }
    v18->type = XSLT_OUTPUT_TEXT;
  }
  else
  {
    v18->type = XSLT_OUTPUT_XML;
  }
  v32 = xmlNewDoc(a1->version);
  if (!v32)
    goto LABEL_163;
LABEL_51:
  v12 = v32;
LABEL_52:
  v33 = v18->dict;
  v12->dict = v33;
  xmlDictReference(v33);
  xsltGenericDebug(xsltGenericDebugContext, "reusing transformation dict for output\n");
  v12->charset = 1;
  if (encoding)
    v12->encoding = xmlStrdup(encoding);
  variables = a1->variables;
  v18->node = (xmlNodePtr)a2;
  v18->output = v12;
  xpathCtxt = v18->xpathCtxt;
  *(_QWORD *)&xpathCtxt->contextSize = 0x100000001;
  xpathCtxt->node = 0;
  if (xsltNeedElemSpaceHandling(v18))
  {
    v36 = xmlDocGetRootElement(a2);
    xsltApplyStripSpaces(v18, v36);
  }
  if (!v18->globalVars)
    v18->globalVars = xmlHashCreate(20);
  if (a3)
    xsltEvalUserParams(v18, a3);
  v18->hasTemplKeyPatterns = 0;
  style = v18->style;
  if (v18->style)
  {
    while (!style->keyMatch)
    {
      style = xsltNextImport(style);
      if (!style)
        goto LABEL_69;
    }
    v18->hasTemplKeyPatterns = 1;
LABEL_69:
    v40 = v18->style;
    for (v18->nbKeys = 0; v40; v40 = xsltNextImport(v40))
    {
      keys = v40->keys;
      if (keys)
      {
        nbKeys = v18->nbKeys;
        do
        {
          ++nbKeys;
          keys = (_QWORD *)*keys;
        }
        while (keys);
        v18->nbKeys = nbKeys;
      }
    }
  }
  else
  {
    v18->nbKeys = 0;
  }
  xsltEvalGlobalVariables(v18);
  xsltReleaseLocalRVTs(v18, 0);
  v18->insert = (xmlNodePtr)v12;
  v18->varsBase = v18->varsNr - 1;
  xsltProcessOneNode(v18, v18->node, 0);
  xsltLocalVariablePop(v18, 0, -2);
  xsltShutdownCtxtExts(v18);
  xsltCleanupTemplates(a1);
  v43 = a1->variables;
  if (v43 != variables)
  {
    v44 = &a1->variables->next;
    do
    {
      v45 = v44;
      v44 = (_QWORD *)*v44;
    }
    while (v44 != (_QWORD *)variables);
    *v45 = 0;
    xsltFreeStackElemList(v43);
    a1->variables = variables;
  }
  for (; variables; variables = variables->next)
  {
    if (variables->computed)
    {
      value = variables->value;
      if (value)
      {
        xmlXPathFreeObject(value);
        variables->value = 0;
        variables->computed = 0;
      }
    }
  }
  v47 = xmlDocGetRootElement(v12);
  if (v47)
  {
    v48 = v47;
    ns = v47->ns;
    if (!ns || (prefix = ns->prefix) == 0 || (name = xmlDictQLookup(v18->dict, prefix, v47->name)) == 0)
      name = v48->name;
    if (!method && !v48->ns && !xmlStrcasecmp(v48->name, (const xmlChar *)"html"))
    {
      children = v12->children;
      if (children && children != v48)
      {
        do
        {
          type = children->type;
          if (type == XML_TEXT_NODE)
          {
            if (!xmlIsBlankNode(children))
              break;
          }
          else if (type == XML_ELEMENT_NODE)
          {
            break;
          }
          children = children->next;
          if (children)
            v54 = children == v48;
          else
            v54 = 1;
        }
        while (!v54);
      }
      if (children == v48)
      {
        v18->type = XSLT_OUTPUT_HTML;
        v12->type = XML_HTML_DOCUMENT_NODE;
        v55 = (const xmlChar *)*((_QWORD *)&v75 + 1);
        v56 = (const xmlChar *)v75;
        if (v75 != 0
          || version
          && (xsltGetHTMLIDs(version, (_QWORD *)&v75 + 1, &v75),
              v55 = (const xmlChar *)*((_QWORD *)&v75 + 1),
              v56 = (const xmlChar *)v75,
              v75 != 0))
        {
          v12->intSubset = xmlCreateIntSubset(v12, name, v55, v56);
        }
      }
    }
    if (v18->type == XSLT_OUTPUT_XML)
    {
      *((_QWORD *)&v75 + 1) = 0;
      v57 = a1;
      while (!v57->doctypePublic)
      {
        v57 = xsltNextImport(v57);
        if (!v57)
          goto LABEL_117;
      }
      *((_QWORD *)&v75 + 1) = v57->doctypePublic;
LABEL_117:
      *(_QWORD *)&v75 = 0;
      do
      {
        v58 = a1->doctypeSystem;
        if (v58)
        {
          *(_QWORD *)&v75 = a1->doctypeSystem;
          v59 = (const xmlChar *)*((_QWORD *)&v75 + 1);
          goto LABEL_123;
        }
        a1 = xsltNextImport(a1);
      }
      while (a1);
      v59 = (const xmlChar *)*((_QWORD *)&v75 + 1);
      v58 = (const xmlChar *)v75;
      if (v75 == 0)
        goto LABEL_131;
LABEL_123:
      v60 = v12->children;
      last = v12->last;
      v12->last = 0;
      v12->children = 0;
      v12->intSubset = xmlCreateIntSubset(v12, name, v59, v58);
      v62 = v12->children;
      if (v62)
      {
        v62->next = v60;
        v60->prev = v62;
      }
      else
      {
        v12->children = v60;
      }
      v12->last = last;
    }
  }
LABEL_131:
  xmlXPathFreeNodeSet(v18->nodeList);
  if (output)
    xsltSaveProfiling(v18, output);
  if (v18->state)
  {
    xmlFreeDoc(v12);
    v12 = 0;
  }
  else if (URL)
  {
    v68 = xsltCheckWrite((xsltSecurityPrefsPtr)v18->sec, v18, URL);
    if (v68)
    {
      if (v68 < 0)
        xsltTransformError(v18, 0, 0, "xsltApplyStylesheet: saving to %s may not be possible\n");
    }
    else
    {
      xsltTransformError(v18, 0, 0, "xsltApplyStylesheet: forbidden to save to %s\n");
    }
  }
  if (linkedOnOrAfterFall2023OSVersions() && v18->sourceDocDirty)
  {
    v63 = (uint64_t)a2;
    while (1)
    {
      do
      {
        v64 = v63;
        xsltClearSourceNodeFlags(v63, 15);
        PSVIPtr = (_QWORD *)xsltGetPSVIPtr(v64);
        if (PSVIPtr)
          *PSVIPtr = 0;
        v66 = *(_DWORD *)(v64 + 8);
        if (v66 == 1)
        {
          for (i = *(_QWORD *)(v64 + 88); i; i = *(_QWORD *)(i + 48))
          {
            *(_DWORD *)(i + 80) &= 0x87FFFFFF;
            *(_QWORD *)(i + 88) = 0;
          }
        }
        if (v66 == 5)
          break;
        v63 = *(_QWORD *)(v64 + 24);
      }
      while (v63);
      while (1)
      {
        v63 = *(_QWORD *)(v64 + 48);
        if (v63)
          break;
        v64 = *(_QWORD *)(v64 + 40);
        if ((xmlDoc *)v64 == a2)
          goto LABEL_149;
      }
    }
  }
LABEL_149:
  if (!a6)
    xsltFreeTransformContext(v18);
  return v12;
}

xmlDocPtr xsltProfileStylesheet(xsltStylesheetPtr style, xmlDocPtr doc, const char **params, FILE *output)
{
  return xsltApplyStylesheetInternal(style, doc, params, 0, output, 0);
}

int xsltRunStylesheetUser(xsltStylesheetPtr style, xmlDocPtr doc, const char **params, const char *output, xmlSAXHandlerPtr SAX, xmlOutputBufferPtr IObuf, FILE *profile, xsltTransformContextPtr userCtxt)
{
  int v12;
  xmlDoc *v14;
  xmlDoc *v15;
  int v16;

  if (!output && !SAX && !IObuf || SAX && IObuf)
    return -1;
  if (SAX)
  {
    xsltGenericError(xsltGenericErrorContext, "Unimplemented block at %s:%d\n", "/Library/Caches/com.apple.xbs/Sources/libxslt/libxslt/libxslt/transform.c", 6355);
    return -1;
  }
  v14 = xsltApplyStylesheetInternal(style, doc, params, (char *)output, profile, userCtxt);
  if (!v14)
  {
    xsltTransformError(0, 0, (xmlNodePtr)doc, "xsltRunStylesheet : run failed\n");
    return -1;
  }
  v15 = v14;
  if (IObuf)
    v16 = xsltSaveResultTo(IObuf, v14, style);
  else
    v16 = xsltSaveResultToFilename(output, v14, style, 0);
  v12 = v16;
  xmlFreeDoc(v15);
  return v12;
}

int xsltRunStylesheet(xsltStylesheetPtr style, xmlDocPtr doc, const char **params, const char *output, xmlSAXHandlerPtr SAX, xmlOutputBufferPtr IObuf)
{
  return xsltRunStylesheetUser(style, doc, params, output, SAX, IObuf, 0, 0);
}

xmlNodePtr xsltDebuggerStartSequenceConstructor(xsltTransformContext *a1, xmlNode *a2, xmlNodePtr source, xsltTemplatePtr templ, int *a5)
{
  int v9;
  xmlNode *v10;
  xmlNode *inst;

  if (!a1->debugStatus)
    return 0;
  if (!templ)
  {
    v10 = source;
    v9 = xslAddCall(0, source);
    *a5 = v9;
    if ((a1->debugStatus & 0xFFFFFFFE) != 8)
    {
      if (v10)
      {
        xslHandleDebugger(v10, a2, 0, a1);
        return v10;
      }
      inst = a1->inst;
      if (inst)
      {
        xslHandleDebugger(inst, a2, 0, a1);
        return a1->inst;
      }
      return 0;
    }
    goto LABEL_6;
  }
  v9 = xslAddCall(templ, templ->elem);
  *a5 = v9;
  if ((a1->debugStatus & 0xFFFFFFFE) == 8)
  {
LABEL_6:
    if (v9)
      xslDropCall();
    return 0;
  }
  xslHandleDebugger(templ->elem, a2, templ, a1);
  return templ->elem;
}

uint64_t xsltApplyFallbacks(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;

  if (!a2)
    return 0;
  v3 = *(_QWORD *)(a3 + 24);
  if (!v3)
    return 0;
  v6 = 0;
  do
  {
    if (*(_DWORD *)(v3 + 8) == 1)
    {
      v7 = *(_QWORD *)(v3 + 72);
      if (v7)
      {
        if (xmlStrEqual(*(const xmlChar **)(v7 + 16), (const xmlChar *)"http://www.w3.org/1999/XSL/Transform")
          && xmlStrEqual(*(const xmlChar **)(v3 + 16), (const xmlChar *)"fallback"))
        {
          v6 = (v6 + 1);
          xsltApplySequenceConstructor(a1, a2, *(_QWORD *)(v3 + 24), 0);
        }
      }
    }
    v3 = *(_QWORD *)(v3 + 48);
  }
  while (v3);
  return v6;
}

xmlNsPtr xsltCopyNamespaceListInternal(xmlNsPtr result, uint64_t *a2)
{
  xmlNs *v3;
  xmlNode *v4;
  xmlNs *ns;
  xmlNsPtr v6;

  v3 = 0;
  if (result->type == XML_ELEMENT_NODE)
    v4 = (xmlNode *)result;
  else
    v4 = 0;
  while (*((_DWORD *)a2 + 2) == 18)
  {
    if (v4)
    {
      if ((ns = v4->ns) != 0
        && xmlStrEqual(ns->prefix, (const xmlChar *)a2[3])
        && xmlStrEqual(v4->ns->href, (const xmlChar *)a2[2])
        || (v6 = xmlSearchNs(v4->doc, v4, (const xmlChar *)a2[3])) != 0
        && xmlStrEqual(v6->href, (const xmlChar *)a2[2]))
      {
LABEL_14:
        result = v3;
        goto LABEL_15;
      }
    }
    result = xmlNewNs(v4, (const xmlChar *)a2[2], (const xmlChar *)a2[3]);
    if (v3)
    {
      if (!result)
        goto LABEL_14;
      v3->next = result;
    }
LABEL_15:
    a2 = (uint64_t *)*a2;
    v3 = result;
    if (!a2)
      return result;
  }
  return result;
}

xsltTransformContext *xsltCopyAttrListNoOverwrite(xsltTransformContext *ctxt, xmlNodePtr cur, xmlNodePtr node, uint64_t a4)
{
  uint64_t v4;
  xsltTransformContext *v7;
  xmlNs *v8;
  uint64_t v9;
  uint64_t (**v10)(xmlChar *);
  uint64_t v11;
  uint64_t v12;
  xmlChar *String;
  xmlAttrPtr v14;
  const xmlChar *v15;
  xmlNode *v16;
  xmlNs *v17;
  const xmlChar *v18;

  if (a4)
  {
    v4 = a4;
    v7 = ctxt;
    v8 = 0;
    v9 = 0;
    v10 = (uint64_t (**)(xmlChar *))MEMORY[0x24BEDE758];
    while (1)
    {
      v11 = *(_QWORD *)(v4 + 72);
      if (v11 != v9)
      {
        if (v11)
        {
          ctxt = (xsltTransformContext *)xsltGetSpecialNamespace(v7, cur, *(const xmlChar **)(v11 + 16), *(const xmlChar **)(v11 + 24), node);
          v8 = (xmlNs *)ctxt;
          v9 = v11;
          if (!ctxt)
            return ctxt;
        }
        else
        {
          v9 = 0;
          v8 = 0;
        }
      }
      v12 = *(_QWORD *)(v4 + 24);
      if (!v12)
        break;
      if (*(_DWORD *)(v12 + 8) == 3 && !*(_QWORD *)(v12 + 48))
      {
        v15 = *(const xmlChar **)(v4 + 16);
        v18 = *(const xmlChar **)(v12 + 80);
        v16 = node;
        v17 = v8;
LABEL_15:
        ctxt = (xsltTransformContext *)xmlNewNsProp(v16, v17, v15, v18);
        if (!ctxt)
          return ctxt;
        goto LABEL_16;
      }
      String = xmlNodeListGetString(*(xmlDocPtr *)(v4 + 64), (const xmlNode *)v12, 1);
      v14 = xmlNewNsProp(node, v8, *(const xmlChar **)(v4 + 16), String);
      ctxt = (xsltTransformContext *)(*v10)(String);
      if (!v14)
        return ctxt;
LABEL_16:
      v4 = *(_QWORD *)(v4 + 48);
      if (!v4)
        return ctxt;
    }
    v15 = *(const xmlChar **)(v4 + 16);
    v16 = node;
    v17 = v8;
    v18 = 0;
    goto LABEL_15;
  }
  return ctxt;
}

xmlDocPtr xsltCreateRVT(xsltTransformContextPtr ctxt)
{
  xsltTransformCachePtr cache;
  xmlDocPtr RVT;
  int nbRVT;
  BOOL v5;
  int v6;
  xmlDict *dict;

  if (!ctxt)
    return 0;
  cache = ctxt->cache;
  RVT = cache->RVT;
  if (cache->RVT)
  {
    cache->RVT = (xmlDocPtr)RVT->next;
    RVT->next = 0;
    RVT->prev = 0;
    nbRVT = cache->nbRVT;
    v5 = __OFSUB__(nbRVT, 1);
    v6 = nbRVT - 1;
    if (v6 < 0 == v5)
      cache->nbRVT = v6;
  }
  else
  {
    RVT = xmlNewDoc(0);
    if (RVT)
    {
      dict = ctxt->dict;
      RVT->dict = dict;
      xmlDictReference(dict);
      RVT->name = (char *)xmlStrdup((const xmlChar *)" fake node libxslt");
      RVT->doc = RVT;
      RVT->parent = 0;
    }
  }
  return RVT;
}

int xsltRegisterTmpRVT(xsltTransformContextPtr ctxt, xmlDocPtr RVT)
{
  int result;
  char *contextVariable;
  xmlDocPtr *p_tmpRVT;
  _xmlNode *v7;
  _xmlNode *tmpRVT;

  result = -1;
  if (ctxt && RVT)
  {
    RVT->prev = 0;
    if (linkedOnOrAfterFall2023OSVersions())
      RVT->compression = 1;
    else
      RVT->psvi = (void *)1;
    contextVariable = (char *)ctxt->contextVariable;
    if (contextVariable)
    {
      v7 = (_xmlNode *)*((_QWORD *)contextVariable + 8);
      p_tmpRVT = (xmlDocPtr *)(contextVariable + 64);
      RVT->next = v7;
    }
    else
    {
      p_tmpRVT = &ctxt->tmpRVT;
      tmpRVT = (_xmlNode *)ctxt->tmpRVT;
      RVT->next = tmpRVT;
      if (tmpRVT)
        tmpRVT->prev = (_xmlNode *)RVT;
    }
    result = 0;
    *p_tmpRVT = RVT;
  }
  return result;
}

int xsltRegisterLocalRVT(xsltTransformContextPtr ctxt, xmlDocPtr RVT)
{
  int result;
  char *contextVariable;
  xmlDocPtr *p_localRVT;
  _xmlNode *localRVT;
  _xmlNode *v8;

  result = -1;
  if (ctxt && RVT)
  {
    RVT->prev = 0;
    if (linkedOnOrAfterFall2023OSVersions())
      RVT->compression = 1;
    else
      RVT->psvi = (void *)1;
    contextVariable = (char *)ctxt->contextVariable;
    if (contextVariable && (contextVariable[88] & 2) != 0)
    {
      v8 = (_xmlNode *)*((_QWORD *)contextVariable + 8);
      p_localRVT = (xmlDocPtr *)(contextVariable + 64);
      RVT->next = v8;
    }
    else
    {
      p_localRVT = &ctxt->localRVT;
      localRVT = (_xmlNode *)ctxt->localRVT;
      RVT->next = localRVT;
      if (localRVT)
        localRVT->prev = (_xmlNode *)RVT;
    }
    result = 0;
    *p_localRVT = RVT;
  }
  return result;
}

int xsltExtensionInstructionResultFinalize(xsltTransformContextPtr ctxt)
{
  xmlGenericErrorFunc v1;
  void **v2;

  v1 = *__xmlGenericError();
  v2 = __xmlGenericErrorContext();
  v1(*v2, "xsltExtensionInstructionResultFinalize is unsupported in this release of libxslt.\n");
  return -1;
}

int xsltExtensionInstructionResultRegister(xsltTransformContextPtr ctxt, xmlXPathObjectPtr obj)
{
  return 0;
}

int xsltFlagRVTs(xsltTransformContextPtr ctxt, xmlXPathObjectPtr obj, intptr_t val)
{
  int result;
  xmlNodeSetPtr nodesetval;
  int v7;
  uint64_t v8;
  xmlNodePtr v9;
  _xmlDoc *doc;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  char *name;
  unint64_t *traceCode;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  xmlGenericErrorFunc v25;
  void **v26;

  result = -1;
  if (!ctxt || !obj)
    return result;
  if ((obj->type | 8) != 9)
    return 0;
  nodesetval = obj->nodesetval;
  if (!nodesetval || nodesetval->nodeNr < 1)
    return 0;
  v7 = val;
  v8 = 0;
  while (1)
  {
    v9 = nodesetval->nodeTab[v8];
    if (v9->type == XML_NAMESPACE_DECL)
    {
      v9 = (xmlNodePtr)v9->_private;
      if (!v9 || v9->type != XML_ELEMENT_NODE)
      {
        xsltTransformError(ctxt, 0, ctxt->inst, "Internal error in xsltFlagRVTs(): Cannot retrieve the doc of a namespace node.\n");
        return -1;
      }
    }
    doc = v9->doc;
    if (!doc)
    {
      xsltTransformError(ctxt, 0, ctxt->inst, "Internal error in xsltFlagRVTs(): Cannot retrieve the doc of a node.\n");
      return -1;
    }
    v17 = linkedOnOrAfterFall2023OSVersions() ? doc->compression : LODWORD(doc->psvi);
    name = doc->name;
    if (name)
    {
      if (*name == 32 && v17 != 3)
        break;
    }
LABEL_33:
    ++v8;
    nodesetval = obj->nodesetval;
    if (v8 >= nodesetval->nodeNr)
      return 0;
  }
  traceCode = ctxt->traceCode;
  if (traceCode && (*((_BYTE *)traceCode + 2) & 1) != 0)
    xsltGenericDebug(xsltGenericDebugContext, "Flagging RVT %p: %d -> %d\n", v11, v12, v13, v14, v15, v16, (char)doc);
  if (v7 != 3)
  {
    if (v7 == 2)
    {
      v24 = linkedOnOrAfterFall2023OSVersions();
      v22 = 2;
      if (v24)
        goto LABEL_32;
    }
    else
    {
      if (v7 != 1 || v17 != 2)
        goto LABEL_33;
      v21 = linkedOnOrAfterFall2023OSVersions();
      v22 = 1;
      if (v21)
      {
LABEL_32:
        doc->compression = v22;
        goto LABEL_33;
      }
    }
    goto LABEL_30;
  }
  if (v17 == 1)
  {
    v23 = linkedOnOrAfterFall2023OSVersions();
    v22 = 3;
    if (v23)
      goto LABEL_32;
LABEL_30:
    doc->psvi = (void *)v22;
    goto LABEL_33;
  }
  v25 = *__xmlGenericError();
  v26 = __xmlGenericErrorContext();
  v25(*v26, "xsltFlagRVTs: Invalid transition %d => GLOBAL\n", v17);
  if (linkedOnOrAfterFall2023OSVersions())
    doc->compression = 3;
  else
    doc->psvi = (void *)3;
  return -1;
}

void xsltReleaseRVT(xsltTransformContextPtr ctxt, xmlDocPtr RVT)
{
  xmlNode *children;
  xmlIDTable *ids;
  xmlRefTable *refs;
  xsltTransformCachePtr cache;

  if (RVT)
  {
    if (ctxt && ctxt->cache->nbRVT <= 39)
    {
      if (RVT->_private)
      {
        xsltFreeDocumentKeys((xsltDocumentPtr)RVT->_private);
        ((void (*)(void *))*MEMORY[0x24BEDE758])(RVT->_private);
        RVT->_private = 0;
      }
      children = RVT->children;
      if (children)
      {
        xmlFreeNodeList(children);
        RVT->children = 0;
        RVT->last = 0;
      }
      ids = (xmlIDTable *)RVT->ids;
      if (ids)
      {
        xmlFreeIDTable(ids);
        RVT->ids = 0;
      }
      refs = (xmlRefTable *)RVT->refs;
      if (refs)
      {
        xmlFreeRefTable(refs);
        RVT->refs = 0;
      }
      if (linkedOnOrAfterFall2023OSVersions())
        RVT->compression = 0;
      else
        RVT->psvi = 0;
      cache = ctxt->cache;
      RVT->next = (_xmlNode *)cache->RVT;
      cache->RVT = RVT;
      ++cache->nbRVT;
    }
    else
    {
      if (RVT->_private)
      {
        xsltFreeDocumentKeys((xsltDocumentPtr)RVT->_private);
        ((void (*)(void *))*MEMORY[0x24BEDE758])(RVT->_private);
      }
      xmlFreeDoc(RVT);
    }
  }
}

int xsltRegisterPersistRVT(xsltTransformContextPtr ctxt, xmlDocPtr RVT)
{
  int result;
  _xmlNode *persistRVT;

  result = -1;
  if (ctxt && RVT)
  {
    if (linkedOnOrAfterFall2023OSVersions())
      RVT->compression = 3;
    else
      RVT->psvi = (void *)3;
    persistRVT = (_xmlNode *)ctxt->persistRVT;
    RVT->next = persistRVT;
    RVT->prev = 0;
    if (persistRVT)
      persistRVT->prev = (_xmlNode *)RVT;
    result = 0;
    ctxt->persistRVT = RVT;
  }
  return result;
}

void xsltFreeRVTs(xsltTransformContextPtr ctxt)
{
  xmlDocPtr localRVT;
  void (**v3)(void *);
  _xmlNode *next;
  xmlDocPtr tmpRVT;
  _xmlNode *v6;
  xmlDocPtr persistRVT;
  _xmlNode *v8;

  if (ctxt)
  {
    localRVT = ctxt->localRVT;
    v3 = (void (**)(void *))MEMORY[0x24BEDE758];
    if (localRVT)
    {
      do
      {
        next = localRVT->next;
        if (localRVT->_private)
        {
          xsltFreeDocumentKeys((xsltDocumentPtr)localRVT->_private);
          (*v3)(localRVT->_private);
        }
        xmlFreeDoc(localRVT);
        localRVT = (xmlDocPtr)next;
      }
      while (next);
    }
    ctxt->localRVT = 0;
    tmpRVT = ctxt->tmpRVT;
    if (tmpRVT)
    {
      do
      {
        v6 = tmpRVT->next;
        if (tmpRVT->_private)
        {
          xsltFreeDocumentKeys((xsltDocumentPtr)tmpRVT->_private);
          (*v3)(tmpRVT->_private);
        }
        xmlFreeDoc(tmpRVT);
        tmpRVT = (xmlDocPtr)v6;
      }
      while (v6);
    }
    ctxt->tmpRVT = 0;
    persistRVT = ctxt->persistRVT;
    if (persistRVT)
    {
      do
      {
        v8 = persistRVT->next;
        if (persistRVT->_private)
        {
          xsltFreeDocumentKeys((xsltDocumentPtr)persistRVT->_private);
          (*v3)(persistRVT->_private);
        }
        xmlFreeDoc(persistRVT);
        persistRVT = (xmlDocPtr)v8;
      }
      while (v8);
    }
    ctxt->persistRVT = 0;
  }
}

void xsltFreeStackElemList(xsltStackElemPtr elem)
{
  xsltStackElem *next;

  if (elem)
  {
    do
    {
      next = elem->next;
      xsltFreeStackElem((uint64_t)elem);
      elem = next;
    }
    while (next);
  }
}

void xsltFreeStackElem(uint64_t a1)
{
  xmlXPathObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  xmlGenericErrorFunc v6;
  void **v7;
  uint64_t v8;

  if (a1)
  {
    v2 = *(xmlXPathObject **)(a1 + 56);
    if (v2)
      xmlXPathFreeObject(v2);
    v3 = *(_QWORD *)(a1 + 80);
    if (!v3)
      goto LABEL_21;
    v4 = *(_QWORD *)(a1 + 64);
    if (v4)
    {
      do
      {
        *(_QWORD *)(a1 + 64) = *(_QWORD *)(v4 + 48);
        if (linkedOnOrAfterFall2023OSVersions())
          v5 = *(_DWORD *)(v4 + 72);
        else
          v5 = *(_DWORD *)(v4 + 160);
        if (v5 == 2)
        {
          xsltRegisterLocalRVT(*(xsltTransformContextPtr *)(a1 + 80), (xmlDocPtr)v4);
          if (linkedOnOrAfterFall2023OSVersions())
            *(_DWORD *)(v4 + 72) = 2;
          else
            *(_QWORD *)(v4 + 160) = 2;
        }
        else if (v5 == 1)
        {
          xsltReleaseRVT(*(xsltTransformContextPtr *)(a1 + 80), (xmlDocPtr)v4);
        }
        else
        {
          v6 = *__xmlGenericError();
          v7 = __xmlGenericErrorContext();
          v6(*v7, "xsltFreeStackElem: Unexpected RVT flag %d\n", v5);
        }
        v4 = *(_QWORD *)(a1 + 64);
      }
      while (v4);
      v3 = *(_QWORD *)(a1 + 80);
      if (!v3)
        goto LABEL_21;
    }
    if (*(int *)(*(_QWORD *)(v3 + 424) + 24) <= 49)
    {
      *(_OWORD *)(a1 + 64) = 0u;
      *(_OWORD *)(a1 + 80) = 0u;
      *(_OWORD *)(a1 + 32) = 0u;
      *(_OWORD *)(a1 + 48) = 0u;
      *(_OWORD *)a1 = 0u;
      *(_OWORD *)(a1 + 16) = 0u;
      *(_QWORD *)(a1 + 80) = v3;
      v8 = *(_QWORD *)(v3 + 424);
      *(_QWORD *)a1 = *(_QWORD *)(v8 + 16);
      *(_QWORD *)(v8 + 16) = a1;
      ++*(_DWORD *)(v8 + 24);
    }
    else
    {
LABEL_21:
      ((void (*)(uint64_t))*MEMORY[0x24BEDE758])(a1);
    }
  }
}

uint64_t xsltAddStackElem(uint64_t a1, _QWORD *a2)
{
  uint64_t result;
  _QWORD *v4;
  uint64_t (**v5)(uint64_t);
  const char *v6;
  uint64_t (**v7)(uint64_t, uint64_t);
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  xmlGenericErrorFunc v12;
  void **v13;

  result = 0xFFFFFFFFLL;
  if (!a1)
    return result;
  v4 = a2;
  if (!a2)
    return result;
  v5 = (uint64_t (**)(uint64_t))MEMORY[0x24BEDE910];
  v6 = "malloc failed !\n";
  v7 = (uint64_t (**)(uint64_t, uint64_t))MEMORY[0x24BEDEB10];
  while (1)
  {
    v8 = *(_DWORD *)(a1 + 52);
    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 56);
    }
    else
    {
      *(_DWORD *)(a1 + 52) = 10;
      v9 = (*v5)(80);
      *(_QWORD *)(a1 + 56) = v9;
      if (!v9)
        goto LABEL_14;
      v8 = *(_DWORD *)(a1 + 52);
    }
    v10 = *(_DWORD *)(a1 + 48);
    if (v10 >= v8)
      break;
LABEL_11:
    *(_DWORD *)(a1 + 48) = v10 + 1;
    *(_QWORD *)(v9 + 8 * v10) = v4;
    *(_QWORD *)(a1 + 40) = v4;
    v4 = (_QWORD *)*v4;
    if (!v4)
      return 0;
  }
  v11 = 2 * v8;
  *(_DWORD *)(a1 + 52) = v11;
  v9 = (*v7)(v9, 8 * v11);
  *(_QWORD *)(a1 + 56) = v9;
  if (v9)
  {
    v10 = *(_DWORD *)(a1 + 48);
    goto LABEL_11;
  }
  v6 = "realloc failed !\n";
LABEL_14:
  v12 = *__xmlGenericError();
  v13 = __xmlGenericErrorContext();
  v12(*v13, v6);
  return 0xFFFFFFFFLL;
}

int xsltEvalGlobalVariables(xsltTransformContextPtr ctxt)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t *traceCode;
  xsltStylesheetPtr style;
  uint64_t (**v10)(uint64_t);
  xsltStackElemPtr variables;
  xmlDocPtr doc;
  const xmlChar *URL;
  unint64_t *v14;
  _QWORD *v15;
  xsltStylePreCompPtr comp;
  xmlNode *inst;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  if (!ctxt)
    return -1;
  if (!ctxt->document)
    return -1;
  traceCode = ctxt->traceCode;
  if (traceCode && (*((_BYTE *)traceCode + 2) & 1) != 0)
    xsltGenericDebug(xsltGenericDebugContext, "Registering global variables\n");
  style = ctxt->style;
  if (ctxt->style)
  {
    v10 = (uint64_t (**)(uint64_t))MEMORY[0x24BEDE910];
    do
    {
      variables = style->variables;
      doc = style->doc;
      if (doc)
      {
        URL = doc->URL;
        if (URL)
        {
          v14 = ctxt->traceCode;
          if (v14)
          {
            if ((*((_BYTE *)v14 + 2) & 1) != 0)
              xsltGenericDebug(xsltGenericDebugContext, "Registering global variables from %s\n", v1, v2, v3, v4, v5, v6, (char)URL);
          }
        }
      }
      for (; variables; variables = variables->next)
      {
        v15 = xmlHashLookup2(ctxt->globalVars, variables->name, variables->nameURI);
        if (v15)
        {
          comp = variables->comp;
          if (comp)
          {
            if (comp->type == XSLT_FUNC_VARIABLE)
            {
              inst = comp->inst;
              if (inst)
              {
                v18 = v15[1];
                if (v18)
                {
                  v19 = *(_QWORD *)(v18 + 24);
                  if (v19)
                  {
                    if (inst->doc == *(_xmlDoc **)(v19 + 64))
                    {
                      xsltTransformError(ctxt, style, inst, "Global variable %s already defined\n", (const char *)variables->name);
                      ++style->errors;
                    }
                  }
                }
              }
            }
          }
        }
        else
        {
          v20 = (*v10)(96);
          v21 = (void *)v20;
          if (v20)
          {
            *(_OWORD *)(v20 + 64) = 0u;
            *(_OWORD *)(v20 + 80) = 0u;
            *(_OWORD *)(v20 + 32) = 0u;
            *(_OWORD *)(v20 + 48) = 0u;
            *(_OWORD *)v20 = 0u;
            *(_OWORD *)(v20 + 16) = 0u;
            *(_QWORD *)(v20 + 80) = variables->context;
            *(_OWORD *)(v20 + 24) = *(_OWORD *)&variables->name;
            *(_OWORD *)(v20 + 40) = *(_OWORD *)&variables->select;
            *(_QWORD *)(v20 + 8) = variables->comp;
          }
          else
          {
            xsltTransformError(0, 0, 0, "xsltCopyStackElem : malloc failed\n");
          }
          xmlHashAddEntry2(ctxt->globalVars, variables->name, variables->nameURI, v21);
        }
      }
      style = xsltNextImport(style);
    }
    while (style);
  }
  xmlHashScan(ctxt->globalVars, (xmlHashScanner)xsltEvalGlobalVariableWrapper, ctxt);
  return 0;
}

int xsltEvalUserParams(xsltTransformContextPtr ctxt, const char **params)
{
  const char **i;
  xmlChar *v4;
  const char *v5;

  if (!params)
    return 0;
  for (i = params + 1; ; i += 2)
  {
    v4 = (xmlChar *)*(i - 1);
    if (!v4)
      break;
    v5 = *i;
    if (xsltProcessUserParamInternal(ctxt, v4, v5, 1))
      return -1;
  }
  return 0;
}

int xsltEvalOneUserParam(xsltTransformContextPtr ctxt, const xmlChar *name, const xmlChar *value)
{
  return xsltProcessUserParamInternal(ctxt, (xmlChar *)name, (const char *)value, 1);
}

int xsltQuoteUserParams(xsltTransformContextPtr ctxt, const char **params)
{
  const char **i;
  xmlChar *v4;
  const char *v5;

  if (!params)
    return 0;
  for (i = params + 1; ; i += 2)
  {
    v4 = (xmlChar *)*(i - 1);
    if (!v4)
      break;
    v5 = *i;
    if (xsltProcessUserParamInternal(ctxt, v4, v5, 0))
      return -1;
  }
  return 0;
}

int xsltQuoteOneUserParam(xsltTransformContextPtr ctxt, const xmlChar *name, const xmlChar *value)
{
  return xsltProcessUserParamInternal(ctxt, (xmlChar *)name, (const char *)value, 0);
}

uint64_t xsltProcessUserParamInternal(xsltTransformContextPtr ctxt, xmlChar *name, const char *a3, int a4)
{
  const xmlChar *v4;
  uint64_t result;
  xsltStylesheetPtr style;
  unint64_t *traceCode;
  int v11;
  uint64_t i;
  xmlDoc *doc;
  xmlNode *RootElement;
  xmlNsPtr v15;
  const xmlChar *href;
  xsltStackElemPtr variables;
  xsltStylePreCompPtr comp;
  xsltStylesheet *v19;
  xmlXPathCompExpr *v20;
  xmlXPathCompExpr *v21;
  xmlXPathContextPtr xpathCtxt;
  xmlNsPtr *namespaces;
  int nsNr;
  xmlDocPtr initialContextDoc;
  xmlNodePtr initialContextNode;
  uint64_t v27;
  xmlXPathObject *v28;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  xsltStylesheet *v33;
  xmlChar *prefix;

  if (!ctxt)
    return 0xFFFFFFFFLL;
  v4 = name;
  result = 0;
  if (!name || !a3)
    return result;
  prefix = 0;
  style = ctxt->style;
  traceCode = ctxt->traceCode;
  if (traceCode && (*((_BYTE *)traceCode + 2) & 1) != 0)
    xsltGenericDebug(xsltGenericDebugContext, "Evaluating user parameter %s=%s\n", (const char *)name, a3);
  v11 = *v4;
  if (v11 != 123)
  {
    v4 = xsltSplitQName(ctxt->dict, v4, (const xmlChar **)&prefix);
    if (prefix)
    {
      doc = style->doc;
      RootElement = xmlDocGetRootElement(doc);
      v15 = xmlSearchNs(doc, RootElement, prefix);
      if (v15)
      {
        href = v15->href;
        if (!v4)
          return 0xFFFFFFFFLL;
        goto LABEL_22;
      }
      xsltTransformError(ctxt, style, 0, "user param : no namespace bound to prefix %s\n", (const char *)prefix);
    }
    href = 0;
    if (!v4)
      return 0xFFFFFFFFLL;
    goto LABEL_22;
  }
  for (i = 1; ; ++i)
  {
    if (!(_BYTE)v11)
    {
      xsltTransformError(ctxt, style, 0, "user param : malformed parameter name : %s\n", (const char *)v4);
      href = 0;
      goto LABEL_22;
    }
    if (v11 == 125)
      break;
    LOBYTE(v11) = v4[i];
  }
  href = xmlDictLookup(ctxt->dict, v4 + 1, (int)i - 2);
  v4 = xmlDictLookup(ctxt->dict, &v4[i], -1);
  if (!v4)
    return 0xFFFFFFFFLL;
LABEL_22:
  if (xmlHashLookup2(ctxt->globalVars, v4, href))
    xsltTransformError(ctxt, style, 0, "Global parameter %s already defined\n", (const char *)v4);
  if (ctxt->globalVars)
  {
    if (style)
      goto LABEL_26;
  }
  else
  {
    ctxt->globalVars = xmlHashCreate(20);
    if (style)
    {
LABEL_26:
      while (1)
      {
        variables = ctxt->style->variables;
        if (variables)
          break;
LABEL_32:
        style = xsltNextImport(style);
        if (!style)
          goto LABEL_35;
      }
      while (1)
      {
        comp = variables->comp;
        if (comp)
        {
          if (comp->type == XSLT_FUNC_VARIABLE
            && xmlStrEqual(variables->name, v4)
            && xmlStrEqual(variables->nameURI, href))
          {
            return 0;
          }
        }
        variables = variables->next;
        if (!variables)
          goto LABEL_32;
      }
    }
  }
LABEL_35:
  v19 = ctxt->style;
  if (a4)
  {
    v20 = xmlXPathCtxtCompile(ctxt->xpathCtxt, (const xmlChar *)a3);
    if (!v20)
      goto LABEL_38;
    v21 = v20;
    xpathCtxt = ctxt->xpathCtxt;
    namespaces = xpathCtxt->namespaces;
    v33 = v19;
    nsNr = xpathCtxt->nsNr;
    initialContextNode = ctxt->initialContextNode;
    initialContextDoc = ctxt->initialContextDoc;
    xpathCtxt->namespaces = 0;
    xpathCtxt->nsNr = 0;
    v27 = *(_QWORD *)&xpathCtxt->contextSize;
    *(_QWORD *)&xpathCtxt->contextSize = 0x100000001;
    v32 = *(_OWORD *)&xpathCtxt->doc;
    xpathCtxt->doc = initialContextDoc;
    xpathCtxt->node = initialContextNode;
    v28 = xmlXPathCompiledEval(v20, xpathCtxt);
    *(_OWORD *)&xpathCtxt->doc = v32;
    *(_QWORD *)&xpathCtxt->contextSize = v27;
    xpathCtxt->namespaces = namespaces;
    xpathCtxt->nsNr = nsNr;
    v19 = v33;
    xmlXPathFreeCompExpr(v21);
    if (!v28)
    {
LABEL_38:
      xsltTransformError(ctxt, v19, 0, "Evaluating user parameter %s failed\n", (const char *)v4);
      ctxt->state = XSLT_STATE_STOPPED;
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
    v28 = 0;
  }
  if (xsltGenericDebugContext == (void *)*MEMORY[0x24BDAC8E8]
    || xsltGenericDebugContext == (void *)*MEMORY[0x24BDAC8D8])
  {
    xmlXPathDebugDumpObject((FILE *)xsltGenericDebugContext, v28, 0);
  }
  v30 = xsltNewStackElem(0);
  v31 = v30;
  if (v30)
  {
    *(_QWORD *)(v30 + 24) = v4;
    *(_QWORD *)(v30 + 40) = xmlDictLookup(ctxt->dict, (const xmlChar *)a3, -1);
    if (href)
      *(_QWORD *)(v31 + 32) = xmlDictLookup(ctxt->dict, href, -1);
    *(_QWORD *)(v31 + 48) = 0;
    *(_DWORD *)(v31 + 16) = 1;
    if (!a4)
      v28 = xmlXPathNewString((const xmlChar *)a3);
    *(_QWORD *)(v31 + 56) = v28;
  }
  result = xmlHashAddEntry2(ctxt->globalVars, v4, href, (void *)v31);
  if ((_DWORD)result)
  {
    xsltFreeStackElem(v31);
    xsltTransformError(ctxt, v19, 0, "Global parameter %s already defined\n", (const char *)v4);
    return 0;
  }
  return result;
}

xmlXPathObjectPtr xsltVariableLookup(xsltTransformContextPtr ctxt, const xmlChar *name, const xmlChar *ns_uri)
{
  _QWORD *v6;
  uint64_t v7;
  xmlXPathObject *v8;
  unint64_t *traceCode;
  unint64_t *v11;

  if (ctxt)
  {
    v6 = xsltStackLookup((uint64_t)ctxt, name, ns_uri);
    if (!v6)
      return xsltGlobalVariableLookup(ctxt, name, ns_uri);
    v7 = (uint64_t)v6;
    if (*((_DWORD *)v6 + 4))
    {
      v8 = (xmlXPathObject *)v6[7];
      if (v8)
        return xmlXPathObjectCopy(v8);
    }
    else
    {
      traceCode = ctxt->traceCode;
      if (traceCode && (*((_BYTE *)traceCode + 2) & 1) != 0)
        xsltGenericDebug(xsltGenericDebugContext, "uncomputed variable %s\n", (const char *)name);
      v8 = xsltEvalVariable(ctxt, v7, 0);
      *(_QWORD *)(v7 + 56) = v8;
      *(_DWORD *)(v7 + 16) = 1;
      if (v8)
        return xmlXPathObjectCopy(v8);
    }
    v11 = ctxt->traceCode;
    if (v11)
    {
      if ((*((_BYTE *)v11 + 2) & 1) != 0)
        xsltGenericDebug(xsltGenericDebugContext, "variable not found %s\n", (const char *)name);
    }
  }
  return 0;
}

_QWORD *xsltStackLookup(uint64_t a1, const xmlChar *a2, const xmlChar *a3)
{
  uint64_t v4;
  uint64_t v6;
  _QWORD *result;
  const xmlChar *v8;
  const xmlChar *v9;
  uint64_t v10;
  uint64_t v11;

  if (!a2)
    return 0;
  v4 = *(int *)(a1 + 48);
  if (!(_DWORD)v4)
    return 0;
  v6 = *(int *)(a1 + 64);
  if ((int)v4 <= (int)v6)
  {
LABEL_9:
    v8 = xmlDictLookup(*(xmlDictPtr *)(a1 + 368), a2, -1);
    if (a3)
      v9 = xmlDictLookup(*(xmlDictPtr *)(a1 + 368), a3, -1);
    else
      v9 = 0;
    v10 = *(int *)(a1 + 48);
    v11 = *(int *)(a1 + 64);
    if ((int)v10 > (int)v11)
    {
      while (1)
      {
        --v10;
        result = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8 * v10);
        if (result)
          break;
LABEL_18:
        result = 0;
        if (v10 <= v11)
          return result;
      }
      while ((const xmlChar *)result[3] != v8 || (const xmlChar *)result[4] != v9)
      {
        result = (_QWORD *)*result;
        if (!result)
          goto LABEL_18;
      }
      return result;
    }
    return 0;
  }
  while (1)
  {
    --v4;
    result = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8 * v4);
    if (result)
      break;
LABEL_8:
    if (v4 <= v6)
      goto LABEL_9;
  }
  while ((const xmlChar *)result[3] != a2 || (const xmlChar *)result[4] != a3)
  {
    result = (_QWORD *)*result;
    if (!result)
      goto LABEL_8;
  }
  return result;
}

xmlXPathObjectPtr xsltGlobalVariableLookup(xsltTransformContext *a1, const xmlChar *a2, const xmlChar *a3)
{
  xmlHashTable *globalVars;
  void *v6;
  xmlXPathObject *v7;
  unint64_t *traceCode;

  if (a1->xpathCtxt)
  {
    globalVars = a1->globalVars;
    if (globalVars)
    {
      v6 = xmlHashLookup2(globalVars, a2, a3);
      if (v6)
      {
        if (*((_DWORD *)v6 + 4))
        {
          v7 = (xmlXPathObject *)*((_QWORD *)v6 + 7);
          return xmlXPathObjectCopy(v7);
        }
        if (*((char **)v6 + 3) != " var/param being computed")
        {
          v7 = xsltEvalGlobalVariable((uint64_t)v6, a1);
          return xmlXPathObjectCopy(v7);
        }
        xsltTransformError(a1, 0, *(xmlNodePtr *)(*((_QWORD *)v6 + 1) + 24), "Recursive definition of %s\n", (const char *)a2);
      }
      else
      {
        traceCode = a1->traceCode;
        if (traceCode)
        {
          if ((*((_BYTE *)traceCode + 2) & 1) != 0)
            xsltGenericDebug(xsltGenericDebugContext, "global variable not found %s\n", (const char *)a2);
        }
      }
    }
  }
  return 0;
}

xmlXPathObject *xsltEvalVariable(xsltTransformContextPtr ctxt, uint64_t a2, uint64_t a3)
{
  xmlNode *inst;
  unint64_t *traceCode;
  const xmlChar *v8;
  xmlXPathContextPtr xpathCtxt;
  void *v10;
  xmlXPathCompExpr *v11;
  __int128 v12;
  uint64_t v13;
  xmlNsPtr *namespaces;
  int nsNr;
  xmlNodePtr v16;
  _xmlDoc *doc;
  xmlNsPtr *v18;
  int v19;
  void *contextVariable;
  xmlDocPtr RVT;
  xmlDoc *v22;
  xmlXPathObjectPtr v23;
  xmlXPathObject *v24;
  xmlNode *v25;
  xmlNode *node;
  xmlNode *v27;
  xmlXPathObjectPtr v28;
  __int128 v30;
  __int128 v31;

  inst = ctxt->inst;
  traceCode = ctxt->traceCode;
  if (traceCode && (*((_BYTE *)traceCode + 2) & 1) != 0)
    xsltGenericDebug(xsltGenericDebugContext, "Evaluating variable '%s'\n", *(const char **)(a2 + 24));
  v8 = *(const xmlChar **)(a2 + 40);
  if (!v8)
  {
    if (!*(_QWORD *)(a2 + 48))
    {
      v24 = xmlXPathNewCString((const char *)&unk_209C1ADF6);
LABEL_37:
      ctxt->inst = inst;
      return v24;
    }
    contextVariable = ctxt->contextVariable;
    RVT = xsltCreateRVT(ctxt);
    if (!RVT)
    {
      v24 = 0;
      goto LABEL_37;
    }
    v22 = RVT;
    *(_QWORD *)(a2 + 64) = RVT;
    if (linkedOnOrAfterFall2023OSVersions())
      v22->compression = 1;
    else
      v22->psvi = (void *)1;
    ctxt->contextVariable = (void *)a2;
    node = ctxt->node;
    v27 = *(xmlNode **)(a2 + 48);
    v31 = *(_OWORD *)&ctxt->output;
    ctxt->output = v22;
    ctxt->insert = (xmlNodePtr)v22;
    xsltApplyOneTemplate(ctxt, node, v27, 0, 0);
    ctxt->contextVariable = contextVariable;
    *(_OWORD *)&ctxt->output = v31;
    v28 = xmlXPathNewValueTree((xmlNodePtr)v22);
    if (v28)
    {
      v24 = v28;
      v28->BOOLval = 0;
    }
    else
    {
      v24 = xmlXPathNewCString((const char *)&unk_209C1ADF6);
    }
    goto LABEL_34;
  }
  xpathCtxt = ctxt->xpathCtxt;
  v10 = ctxt->contextVariable;
  if (a3 && (v11 = *(xmlXPathCompExpr **)(a3 + 304)) != 0 || (v11 = xmlXPathCtxtCompile(ctxt->xpathCtxt, v8)) != 0)
  {
    v12 = *(_OWORD *)&xpathCtxt->doc;
    v13 = *(_QWORD *)&xpathCtxt->contextSize;
    namespaces = xpathCtxt->namespaces;
    nsNr = xpathCtxt->nsNr;
    v16 = ctxt->node;
    xpathCtxt->node = v16;
    if (v16->type != XML_NAMESPACE_DECL)
    {
      doc = v16->doc;
      if (doc)
        xpathCtxt->doc = doc;
    }
    v30 = v12;
    if (a3)
    {
      v18 = *(xmlNsPtr **)(a3 + 312);
      v19 = *(_DWORD *)(a3 + 320);
    }
    else
    {
      v18 = 0;
      v19 = 0;
    }
    xpathCtxt->namespaces = v18;
    xpathCtxt->nsNr = v19;
    ctxt->contextVariable = (void *)a2;
    *(_DWORD *)(a2 + 88) |= 2u;
    v23 = xmlXPathCompiledEval(v11, xpathCtxt);
    v24 = v23;
    *(_DWORD *)(a2 + 88) ^= 2u;
    ctxt->contextVariable = v10;
    *(_OWORD *)&xpathCtxt->doc = v30;
    *(_QWORD *)&xpathCtxt->contextSize = v13;
    xpathCtxt->namespaces = namespaces;
    xpathCtxt->nsNr = nsNr;
    if (a3)
    {
      if (*(_QWORD *)(a3 + 304))
      {
        if (!v23)
          goto LABEL_27;
      }
      else
      {
        xmlXPathFreeCompExpr(v11);
        if (!v24)
        {
LABEL_27:
          v25 = *(xmlNode **)(a3 + 24);
          goto LABEL_28;
        }
      }
    }
    else
    {
      xmlXPathFreeCompExpr(v11);
      if (!v24)
      {
        v25 = 0;
LABEL_28:
        xsltTransformError(ctxt, 0, v25, "Failed to evaluate the expression of variable '%s'.\n", *(const char **)(a2 + 24));
        v24 = 0;
        ctxt->state = XSLT_STATE_STOPPED;
        goto LABEL_37;
      }
    }
LABEL_34:
    if (xsltGenericDebugContext == (void *)*MEMORY[0x24BDAC8E8]
      || xsltGenericDebugContext == (void *)*MEMORY[0x24BDAC8D8])
    {
      xmlXPathDebugDumpObject((FILE *)xsltGenericDebugContext, v24, 0);
    }
    goto LABEL_37;
  }
  return 0;
}

xsltStackElemPtr xsltParseStylesheetCallerParam(xsltTransformContextPtr ctxt, xmlNodePtr cur)
{
  xmlNodePtr v2;
  _QWORD *psvi;
  unint64_t *traceCode;
  unint64_t *v6;

  if (!ctxt)
    return 0;
  v2 = cur;
  if (!cur || cur->type != XML_ELEMENT_NODE)
    return 0;
  psvi = cur->psvi;
  if (!psvi)
  {
    xsltTransformError(ctxt, 0, cur, "Internal error in xsltParseStylesheetCallerParam(): The XSLT 'with-param' instruction was not compiled.\n");
    return 0;
  }
  if (!psvi[15])
  {
    xsltTransformError(ctxt, 0, cur, "Internal error in xsltParseStylesheetCallerParam(): XSLT 'with-param': The attribute 'name' was not compiled.\n");
    return 0;
  }
  traceCode = ctxt->traceCode;
  if (traceCode && (*((_BYTE *)traceCode + 2) & 1) != 0)
    xsltGenericDebug(xsltGenericDebugContext, "Handling xsl:with-param %s\n", (const char *)psvi[15]);
  if (psvi[23])
  {
    v6 = ctxt->traceCode;
    if (v6)
    {
      if ((*((_BYTE *)v6 + 2) & 1) != 0)
        xsltGenericDebug(xsltGenericDebugContext, "        select %s\n", (const char *)psvi[23]);
    }
  }
  else
  {
    v2 = v2->children;
  }
  return (xsltStackElemPtr)xsltBuildVariable(ctxt, (uint64_t)psvi, (uint64_t)v2);
}

_QWORD *xsltBuildVariable(xsltTransformContext *a1, uint64_t a2, uint64_t a3)
{
  unint64_t *traceCode;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  traceCode = a1->traceCode;
  if (!traceCode)
    goto LABEL_11;
  if ((*((_BYTE *)traceCode + 2) & 1) != 0)
  {
    xsltGenericDebug(xsltGenericDebugContext, "Building variable %s", *(const char **)(a2 + 120));
    traceCode = a1->traceCode;
  }
  if (!*(_QWORD *)(a2 + 184))
    goto LABEL_8;
  if (!traceCode)
    goto LABEL_11;
  if ((*((_BYTE *)traceCode + 2) & 1) != 0)
  {
    xsltGenericDebug(xsltGenericDebugContext, " select %s", *(const char **)(a2 + 184));
    traceCode = a1->traceCode;
LABEL_8:
    if (!traceCode)
      goto LABEL_11;
  }
  if ((*((_BYTE *)traceCode + 2) & 1) != 0)
    xsltGenericDebug(xsltGenericDebugContext, "\n");
LABEL_11:
  v7 = (_QWORD *)xsltNewStackElem((uint64_t)a1);
  v8 = v7;
  if (v7)
  {
    v7[1] = a2;
    v9 = *(_QWORD *)(a2 + 184);
    v10 = *(_QWORD *)(a2 + 136);
    v7[3] = *(_QWORD *)(a2 + 120);
    v7[4] = v10;
    v7[5] = v9;
    v7[6] = a3;
    v7[7] = xsltEvalVariable(a1, (uint64_t)v7, a2);
    *((_DWORD *)v8 + 4) = 1;
  }
  return v8;
}

void xsltParseGlobalVariable(xsltStylesheetPtr style, xmlNodePtr cur)
{
  const xmlChar **psvi;
  const char *v5;
  const char *v6;

  if (!style || !cur || cur->type != XML_ELEMENT_NODE)
    return;
  xsltStylePreCompute(style, cur);
  psvi = (const xmlChar **)cur->psvi;
  if (!psvi)
  {
    v6 = "xsl:variable : compilation failed\n";
LABEL_12:
    xsltTransformError(0, style, cur, v6);
    return;
  }
  v5 = (const char *)psvi[15];
  if (!v5)
  {
    v6 = "xsl:variable : missing name attribute\n";
    goto LABEL_12;
  }
  if (cur->children)
  {
    xsltParseTemplateContent(style, cur);
    v5 = (const char *)psvi[15];
  }
  xsltGenericDebug(xsltGenericDebugContext, "Registering global variable %s\n", v5);
  xsltRegisterGlobalVariable(style, psvi[15], psvi[17], psvi[23], (uint64_t)cur->children, (uint64_t)psvi);
}

void xsltRegisterGlobalVariable(xsltStylesheet *a1, const xmlChar *a2, const xmlChar *a3, const xmlChar *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  xsltStackElemPtr variables;
  xsltStackElemPtr *p_variables;
  const xmlChar *v16;
  const xmlChar *v17;

  if (a2)
  {
    if (*(_DWORD *)(a6 + 8) == 19)
      xsltGenericDebug(xsltGenericDebugContext, "Defining global param %s\n");
    else
      xsltGenericDebug(xsltGenericDebugContext, "Defining global variable %s\n");
    v12 = xsltNewStackElem(0);
    if (v12)
    {
      v13 = v12;
      *(_QWORD *)(v12 + 8) = a6;
      *(_QWORD *)(v12 + 24) = xmlDictLookup(a1->dict, a2, -1);
      *(_QWORD *)(v13 + 40) = xmlDictLookup(a1->dict, a4, -1);
      if (a3)
        *(_QWORD *)(v13 + 32) = xmlDictLookup(a1->dict, a3, -1);
      *(_QWORD *)(v13 + 48) = a5;
      p_variables = &a1->variables;
      variables = a1->variables;
      if (variables)
      {
        do
        {
          p_variables = &variables->next;
          if (*(_DWORD *)(*(_QWORD *)(v13 + 8) + 8) == 20 && variables->comp->type == XSLT_FUNC_VARIABLE)
          {
            if (xmlStrEqual(*(const xmlChar **)(v13 + 24), variables->name))
            {
              v16 = *(const xmlChar **)(v13 + 32);
              v17 = (const xmlChar *)p_variables[4];
              if (v16 == v17 || xmlStrEqual(v16, v17))
              {
                xsltTransformError(0, a1, *(xmlNodePtr *)(a6 + 24), "redefinition of global variable %s\n", *(const char **)(v13 + 24));
                ++a1->errors;
              }
            }
          }
          variables = *p_variables;
        }
        while (*p_variables);
      }
      *(_QWORD *)v13 = 0;
      *p_variables = (xsltStackElemPtr)v13;
    }
  }
}

void xsltParseGlobalParam(xsltStylesheetPtr style, xmlNodePtr cur)
{
  const xmlChar **psvi;
  const char *v5;
  const char *v6;

  if (!style || !cur || cur->type != XML_ELEMENT_NODE)
    return;
  xsltStylePreCompute(style, cur);
  psvi = (const xmlChar **)cur->psvi;
  if (!psvi)
  {
    v6 = "xsl:param : compilation failed\n";
LABEL_12:
    xsltTransformError(0, style, cur, v6);
    return;
  }
  v5 = (const char *)psvi[15];
  if (!v5)
  {
    v6 = "xsl:param : missing name attribute\n";
    goto LABEL_12;
  }
  if (cur->children)
  {
    xsltParseTemplateContent(style, cur);
    v5 = (const char *)psvi[15];
  }
  xsltGenericDebug(xsltGenericDebugContext, "Registering global param %s\n", v5);
  xsltRegisterGlobalVariable(style, psvi[15], psvi[17], psvi[23], (uint64_t)cur->children, (uint64_t)psvi);
}

void xsltParseStylesheetVariable(xsltTransformContextPtr ctxt, xmlNodePtr cur)
{
  _QWORD *psvi;
  unint64_t *traceCode;
  const char *v6;

  if (!ctxt || !cur || cur->type != XML_ELEMENT_NODE)
    return;
  psvi = cur->psvi;
  if (!psvi)
  {
    v6 = "Internal error in xsltParseStylesheetVariable(): The XSLT 'variable' instruction was not compiled.\n";
LABEL_13:
    xsltTransformError(ctxt, 0, cur, v6);
    return;
  }
  if (!psvi[15])
  {
    v6 = "Internal error in xsltParseStylesheetVariable(): The attribute 'name' was not compiled.\n";
    goto LABEL_13;
  }
  traceCode = ctxt->traceCode;
  if (traceCode)
  {
    if ((*((_BYTE *)traceCode + 2) & 1) != 0)
      xsltGenericDebug(xsltGenericDebugContext, "Registering variable '%s'\n", (const char *)psvi[15]);
  }
  xsltRegisterVariable(ctxt, (uint64_t)psvi, (uint64_t)cur->children, 0);
}

void xsltRegisterVariable(xsltTransformContext *a1, uint64_t a2, uint64_t a3, int a4)
{
  const xmlChar *v7;
  _QWORD *v9;
  uint64_t v10;
  unsigned int v11;
  int v12;
  unint64_t *traceCode;
  _QWORD *v14;

  v7 = *(const xmlChar **)(a2 + 120);
  if (v7)
  {
    v9 = xsltStackLookup((uint64_t)a1, v7, *(const xmlChar **)(a2 + 136));
    if (!v9)
      goto LABEL_17;
    v10 = v9[1];
    v11 = 1;
    if (v10)
    {
      v12 = *(_DWORD *)(v10 + 8);
      v11 = v12 == 19 ? 2 : 1;
      if (v12 == 18)
        v11 = 3;
    }
    if (a4)
    {
      if (v11 <= 2)
      {
        xsltTransformError(a1, 0, *(xmlNodePtr *)(a2 + 24), "XSLT-param: Redefinition of parameter '%s'.\n");
        return;
      }
      goto LABEL_13;
    }
    if (v11 == 3)
    {
LABEL_17:
      v14 = xsltBuildVariable(a1, a2, a3);
      xsltAddStackElem((uint64_t)a1, v14);
      return;
    }
LABEL_18:
    xsltTransformError(a1, 0, *(xmlNodePtr *)(a2 + 24), "XSLT-variable: Redefinition of variable '%s'.\n");
    return;
  }
  if (!a4)
    goto LABEL_18;
LABEL_13:
  traceCode = a1->traceCode;
  if (traceCode)
  {
    if ((*((_BYTE *)traceCode + 2) & 1) != 0)
      xsltGenericDebug(xsltGenericDebugContext, "param %s defined by caller\n", *(const char **)(a2 + 120));
  }
}

void xsltParseStylesheetParam(xsltTransformContextPtr ctxt, xmlNodePtr cur)
{
  const char **psvi;
  unint64_t *traceCode;

  if (ctxt && cur && cur->type == XML_ELEMENT_NODE)
  {
    psvi = (const char **)cur->psvi;
    if (psvi && psvi[15])
    {
      traceCode = ctxt->traceCode;
      if (traceCode)
      {
        if ((*((_BYTE *)traceCode + 2) & 1) != 0)
          xsltGenericDebug(xsltGenericDebugContext, "Registering param %s\n", psvi[15]);
      }
      xsltRegisterVariable(ctxt, (uint64_t)psvi, (uint64_t)cur->children, 1);
    }
    else
    {
      xsltTransformError(ctxt, 0, cur, "Internal error in xsltParseStylesheetParam(): The XSLT 'param' declaration was not compiled correctly.\n");
    }
  }
}

void xsltFreeGlobalVariables(xsltTransformContextPtr ctxt)
{
  xmlHashFree(ctxt->globalVars, (xmlHashDeallocator)xsltFreeStackElemEntry);
}

xmlXPathObjectPtr xsltXPathVariableLookup(void *ctxt, const xmlChar *name, const xmlChar *ns_uri)
{
  xmlXPathObject *v3;
  const xmlChar *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const xmlChar *v11;
  const xmlChar *v12;
  uint64_t v14;
  uint64_t v15;
  xmlXPathObjectPtr v16;
  uint64_t v17;
  xmlNode *v18;
  xmlXPathObject *v20;
  uint64_t v21;

  v3 = 0;
  if (!ctxt)
    return v3;
  v4 = name;
  if (!name)
    return v3;
  v7 = *((_QWORD *)ctxt + 44);
  if (v7 && (*(_BYTE *)(v7 + 2) & 1) != 0)
    xsltGenericDebug(xsltGenericDebugContext, "Lookup variable '%s'\n", (const char *)name);
  v8 = *((int *)ctxt + 12);
  if (!(_DWORD)v8)
    goto LABEL_23;
  v9 = *((int *)ctxt + 16);
  if ((int)v8 <= (int)v9)
  {
LABEL_11:
    v11 = xmlDictLookup(*((xmlDictPtr *)ctxt + 46), v4, -1);
    if (ns_uri)
      v12 = xmlDictLookup(*((xmlDictPtr *)ctxt + 46), ns_uri, -1);
    else
      v12 = 0;
    if (v11 != v4 || v12 != ns_uri)
    {
      v14 = *((int *)ctxt + 12);
      v15 = *((int *)ctxt + 16);
      if ((int)v14 > (int)v15)
      {
        while (1)
        {
          v10 = *(_QWORD *)(*((_QWORD *)ctxt + 7) - 8 + 8 * v14);
          if (*(const xmlChar **)(v10 + 24) == v11 && *(const xmlChar **)(v10 + 32) == v12)
            break;
          if (--v14 <= v15)
            goto LABEL_22;
        }
        v4 = v11;
        goto LABEL_38;
      }
LABEL_22:
      v4 = v11;
      ns_uri = v12;
    }
LABEL_23:
    if (*((_QWORD *)ctxt + 22))
    {
      v16 = xsltGlobalVariableLookup((xsltTransformContext *)ctxt, v4, ns_uri);
      v17 = *((_QWORD *)ctxt + 44);
      if (v16)
      {
        v3 = v16;
        if (v17)
        {
          if ((*(_BYTE *)(v17 + 2) & 1) != 0)
            xsltGenericDebug(xsltGenericDebugContext, "found variable '%s'\n", (const char *)v4);
        }
        return v3;
      }
    }
    else
    {
      v17 = *((_QWORD *)ctxt + 44);
    }
    if (v17 && (*(_BYTE *)(v17 + 2) & 1) != 0)
      xsltGenericDebug(xsltGenericDebugContext, "variable not found '%s'\n", (const char *)v4);
    v18 = (xmlNode *)*((_QWORD *)ctxt + 23);
    if (ns_uri)
      xsltTransformError((xsltTransformContextPtr)ctxt, 0, v18, "Variable '{%s}%s' has not been declared.\n");
    else
      xsltTransformError((xsltTransformContextPtr)ctxt, 0, v18, "Variable '%s' has not been declared.\n");
    return 0;
  }
  while (1)
  {
    v10 = *(_QWORD *)(*((_QWORD *)ctxt + 7) - 8 + 8 * v8);
    if (*(const xmlChar **)(v10 + 24) == v4 && *(const xmlChar **)(v10 + 32) == ns_uri)
      break;
    if (--v8 <= v9)
      goto LABEL_11;
  }
LABEL_38:
  if (*(_DWORD *)(v10 + 16))
  {
    v20 = *(xmlXPathObject **)(v10 + 56);
    if (!v20)
      return 0;
  }
  else
  {
    v21 = *((_QWORD *)ctxt + 44);
    if (v21 && (*(_BYTE *)(v21 + 2) & 1) != 0)
      xsltGenericDebug(xsltGenericDebugContext, "uncomputed variable '%s'\n", (const char *)v4);
    v20 = xsltEvalVariable((xsltTransformContextPtr)ctxt, v10, 0);
    *(_QWORD *)(v10 + 56) = v20;
    *(_DWORD *)(v10 + 16) = 1;
    if (!v20)
      return 0;
  }
  return xmlXPathObjectCopy(v20);
}

xmlXPathObject *xsltEvalGlobalVariable(uint64_t a1, xsltTransformContextPtr ctxt)
{
  xmlXPathObject *v2;
  unint64_t *traceCode;
  uint64_t v6;
  xmlNode *v7;
  xmlNode *inst;
  uint64_t v9;
  uint64_t v10;
  const xmlChar *v11;
  xmlXPathContextPtr xpathCtxt;
  xmlXPathCompExpr *v13;
  xmlNode *v14;
  xmlDoc *RVT;
  xmlDoc *v16;
  xmlXPathContextPtr v17;
  xmlDoc *doc;
  xmlNode *node;
  xmlNode *v20;
  xmlXPathObjectPtr v21;
  xmlXPathCompExprPtr v22;
  __int128 v23;
  uint64_t v24;
  xmlNsPtr *namespaces;
  int nsNr;
  xmlNodePtr initialContextNode;
  xmlNsPtr *v28;
  int v29;
  xmlNode *v30;
  __int128 v32;
  __int128 v33;

  v2 = 0;
  if (a1 && ctxt)
  {
    if (*(_DWORD *)(a1 + 16))
      return *(xmlXPathObject **)(a1 + 56);
    traceCode = ctxt->traceCode;
    if (traceCode && (*((_BYTE *)traceCode + 2) & 1) != 0)
      xsltGenericDebug(xsltGenericDebugContext, "Evaluating global variable %s\n", *(const char **)(a1 + 24));
    if (ctxt->debugStatus)
    {
      v6 = *(_QWORD *)(a1 + 8);
      if (v6)
      {
        v7 = *(xmlNode **)(v6 + 24);
        if (v7)
          xslHandleDebugger(v7, 0, 0, ctxt);
      }
    }
    inst = ctxt->inst;
    v9 = *(_QWORD *)(a1 + 8);
    v10 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 24) = " var/param being computed";
    v11 = *(const xmlChar **)(a1 + 40);
    if (v11)
    {
      xpathCtxt = ctxt->xpathCtxt;
      if (v9)
      {
        v13 = *(xmlXPathCompExpr **)(v9 + 304);
        if (!v13)
        {
          v13 = xmlXPathCtxtCompile(ctxt->xpathCtxt, v11);
          if (!v13)
            goto LABEL_39;
        }
        v14 = *(xmlNode **)(v9 + 24);
        goto LABEL_23;
      }
      v22 = xmlXPathCtxtCompile(ctxt->xpathCtxt, v11);
      if (v22)
      {
        v13 = v22;
        v14 = 0;
LABEL_23:
        ctxt->inst = v14;
        v23 = *(_OWORD *)&xpathCtxt->doc;
        v24 = *(_QWORD *)&xpathCtxt->contextSize;
        namespaces = xpathCtxt->namespaces;
        nsNr = xpathCtxt->nsNr;
        initialContextNode = ctxt->initialContextNode;
        xpathCtxt->doc = ctxt->initialContextDoc;
        xpathCtxt->node = initialContextNode;
        *(_QWORD *)&xpathCtxt->contextSize = 0x100000001;
        v33 = v23;
        if (v9)
        {
          v28 = *(xmlNsPtr **)(v9 + 312);
          v29 = *(_DWORD *)(v9 + 320);
        }
        else
        {
          v28 = 0;
          v29 = 0;
        }
        xpathCtxt->namespaces = v28;
        xpathCtxt->nsNr = v29;
        v2 = xmlXPathCompiledEval(v13, xpathCtxt);
        *(_OWORD *)&xpathCtxt->doc = v33;
        *(_QWORD *)&xpathCtxt->contextSize = v24;
        xpathCtxt->namespaces = namespaces;
        xpathCtxt->nsNr = nsNr;
        if (v9)
        {
          if (!*(_QWORD *)(v9 + 304))
            xmlXPathFreeCompExpr(v13);
          if (!v2)
          {
            v30 = *(xmlNode **)(v9 + 24);
LABEL_38:
            xsltTransformError(ctxt, 0, v30, "Evaluating global variable %s failed\n", *(const char **)(a1 + 24));
            ctxt->state = XSLT_STATE_STOPPED;
            goto LABEL_39;
          }
        }
        else
        {
          xmlXPathFreeCompExpr(v13);
          if (!v2)
          {
            v30 = 0;
            goto LABEL_38;
          }
        }
        xsltFlagRVTs(ctxt, v2, 3);
        if (xsltGenericDebugContext == (void *)*MEMORY[0x24BDAC8E8]
          || xsltGenericDebugContext == (void *)*MEMORY[0x24BDAC8D8])
        {
          xmlXPathDebugDumpObject((FILE *)xsltGenericDebugContext, v2, 0);
        }
        *(_QWORD *)(a1 + 24) = v10;
        ctxt->inst = inst;
LABEL_45:
        *(_QWORD *)(a1 + 56) = v2;
        *(_DWORD *)(a1 + 16) = 1;
        return v2;
      }
LABEL_39:
      v2 = 0;
      *(_QWORD *)(a1 + 24) = v10;
      ctxt->inst = inst;
      return v2;
    }
    if (*(_QWORD *)(a1 + 48))
    {
      RVT = xsltCreateRVT(ctxt);
      if (!RVT)
        goto LABEL_39;
      v16 = RVT;
      xsltRegisterPersistRVT(ctxt, RVT);
      v17 = ctxt->xpathCtxt;
      doc = v17->doc;
      v17->doc = ctxt->initialContextDoc;
      node = ctxt->node;
      v20 = *(xmlNode **)(a1 + 48);
      v32 = *(_OWORD *)&ctxt->output;
      ctxt->output = v16;
      ctxt->insert = (xmlNodePtr)v16;
      xsltApplyOneTemplate(ctxt, node, v20, 0, 0);
      ctxt->xpathCtxt->doc = doc;
      *(_OWORD *)&ctxt->output = v32;
      v21 = xmlXPathNewValueTree((xmlNodePtr)v16);
      if (v21)
      {
        v2 = v21;
        v21->BOOLval = 0;
      }
      else
      {
        v2 = xmlXPathNewCString((const char *)&unk_209C1ADF6);
      }
      if (xsltGenericDebugContext == (void *)*MEMORY[0x24BDAC8E8]
        || xsltGenericDebugContext == (void *)*MEMORY[0x24BDAC8D8])
      {
        xmlXPathDebugDumpObject((FILE *)xsltGenericDebugContext, v2, 0);
      }
    }
    else
    {
      v2 = xmlXPathNewCString((const char *)&unk_209C1ADF6);
    }
    *(_QWORD *)(a1 + 24) = v10;
    ctxt->inst = inst;
    if (!v2)
      return v2;
    goto LABEL_45;
  }
  return v2;
}

uint64_t xsltNewStackElem(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  if (a1 && (v2 = *(_QWORD *)(a1 + 424), (result = *(_QWORD *)(v2 + 16)) != 0))
  {
    *(_QWORD *)(v2 + 16) = *(_QWORD *)result;
    *(_QWORD *)result = 0;
    --*(_DWORD *)(v2 + 24);
  }
  else
  {
    result = ((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(96);
    if (result)
    {
      *(_OWORD *)(result + 64) = 0u;
      *(_OWORD *)(result + 80) = 0u;
      *(_OWORD *)(result + 32) = 0u;
      *(_OWORD *)(result + 48) = 0u;
      *(_OWORD *)result = 0u;
      *(_OWORD *)(result + 16) = 0u;
      *(_QWORD *)(result + 80) = a1;
    }
    else
    {
      xsltTransformError(0, 0, 0, "xsltNewStackElem : malloc failed\n");
      return 0;
    }
  }
  return result;
}

void xsltInit(void)
{
  if ((initialized & 1) == 0)
  {
    initialized = 1;
    xsltRegisterAllExtras();
  }
}

void xsltUninit(void)
{
  initialized = 0;
}

int xsltIsBlank(xmlChar *str)
{
  unsigned int v1;

  if (!str)
    return 1;
  while (1)
  {
    v1 = *str;
    if (v1 > 0x20)
      break;
    if (((1 << v1) & 0x100002600) == 0)
      return !*str;
    ++str;
  }
  return 0;
}

xsltDecimalFormatPtr xsltDecimalFormatGetByName(xsltStylesheetPtr style, xmlChar *name)
{
  xsltStylesheetPtr Import;
  xsltDecimalFormat *next;

  Import = style;
  if (!name)
    return style->decimalFormat;
  if (!style)
    return 0;
  while (1)
  {
    next = Import->decimalFormat->next;
    if (next)
      break;
LABEL_8:
    Import = xsltNextImport(Import);
    if (!Import)
      return 0;
  }
  while (linkedOnOrAfterFall2022OSVersions() && next->nsUri || !xmlStrEqual(name, next->name))
  {
    next = next->next;
    if (!next)
      goto LABEL_8;
  }
  return next;
}

xsltDecimalFormatPtr xsltDecimalFormatGetByQName(xsltStylesheetPtr style, const xmlChar *nsUri, const xmlChar *name)
{
  xsltStylesheetPtr Import;
  xsltDecimalFormat *next;

  Import = style;
  if (!name)
    return style->decimalFormat;
  if (!style)
    return 0;
  while (1)
  {
    next = Import->decimalFormat->next;
    if (next)
      break;
LABEL_8:
    Import = xsltNextImport(Import);
    if (!Import)
      return 0;
  }
  while (linkedOnOrAfterFall2022OSVersions() && !xmlStrEqual(nsUri, next->nsUri)
       || !xmlStrEqual(name, next->name))
  {
    next = next->next;
    if (!next)
      goto LABEL_8;
  }
  return next;
}

xsltStylesheetPtr xsltNewStylesheet(void)
{
  return (xsltStylesheetPtr)xsltNewStylesheetInternal(0);
}

uint64_t xsltNewStylesheetInternal(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  xmlXPathContext *v4;

  v2 = ((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(424);
  v3 = v2;
  if (!v2)
  {
    xsltTransformError(0, 0, 0, "xsltNewStylesheet : malloc failed\n");
    return v3;
  }
  *(_QWORD *)(v2 + 416) = 0;
  *(_OWORD *)(v2 + 384) = 0u;
  *(_OWORD *)(v2 + 400) = 0u;
  *(_OWORD *)(v2 + 352) = 0u;
  *(_OWORD *)(v2 + 368) = 0u;
  *(_OWORD *)(v2 + 320) = 0u;
  *(_OWORD *)(v2 + 336) = 0u;
  *(_OWORD *)(v2 + 288) = 0u;
  *(_OWORD *)(v2 + 304) = 0u;
  *(_OWORD *)(v2 + 256) = 0u;
  *(_OWORD *)(v2 + 272) = 0u;
  *(_OWORD *)(v2 + 224) = 0u;
  *(_OWORD *)(v2 + 240) = 0u;
  *(_OWORD *)(v2 + 192) = 0u;
  *(_OWORD *)(v2 + 208) = 0u;
  *(_OWORD *)(v2 + 160) = 0u;
  *(_OWORD *)(v2 + 176) = 0u;
  *(_OWORD *)(v2 + 128) = 0u;
  *(_OWORD *)(v2 + 144) = 0u;
  *(_OWORD *)(v2 + 96) = 0u;
  *(_OWORD *)(v2 + 112) = 0u;
  *(_OWORD *)(v2 + 64) = 0u;
  *(_OWORD *)(v2 + 80) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)v2 = 0u;
  *(_OWORD *)(v2 + 16) = 0u;
  *(_QWORD *)v2 = a1;
  *(_DWORD *)(v2 + 224) = -1;
  *(_DWORD *)(v2 + 240) = -1;
  *(_QWORD *)(v2 + 232) = xsltNewDecimalFormat(0, 0);
  *(_DWORD *)(v3 + 264) = -1;
  *(_QWORD *)(v3 + 288) = 0;
  *(_QWORD *)(v3 + 328) = 0;
  *(_DWORD *)(v3 + 336) = 0;
  *(_QWORD *)(v3 + 304) = 0;
  *(_QWORD *)(v3 + 312) = 0;
  *(_QWORD *)(v3 + 380) = 1;
  *(_DWORD *)(v3 + 400) = 0;
  *(_QWORD *)(v3 + 352) = xmlDictCreate();
  xsltGenericDebug(xsltGenericDebugContext, "creating dictionary for stylesheet\n");
  if (a1)
  {
    *(_QWORD *)(v3 + 392) = *(_QWORD *)(a1 + 392);
    goto LABEL_8;
  }
  *(_QWORD *)(v3 + 392) = v3;
  if (linkedOnOrAfterFall2022OSVersions())
  {
    v4 = xmlXPathNewContext(0);
    *(_QWORD *)(v3 + 416) = v4;
    if (v4)
    {
      if (xmlXPathContextSetCache(v4, 1, -1, 0) != -1)
        goto LABEL_8;
    }
    else
    {
      xsltTransformError(0, 0, 0, "xsltNewStylesheet: xmlXPathNewContext failed\n");
    }
    xsltFreeStylesheet((xsltStylesheetPtr)v3);
    return 0;
  }
LABEL_8:
  if ((initialized & 1) == 0)
  {
    initialized = 1;
    xsltRegisterAllExtras();
  }
  return v3;
}

int xsltAllocateExtra(xsltStylesheetPtr style)
{
  int extrasNr;

  extrasNr = style->extrasNr;
  style->extrasNr = extrasNr + 1;
  return extrasNr;
}

int xsltAllocateExtraCtxt(xsltTransformContextPtr ctxt)
{
  int extrasNr;
  uint64_t extrasMax;
  int result;
  uint64_t v5;
  xsltRuntimeExtra *v6;
  uint64_t v7;
  uint64_t v8;
  xsltRuntimeExtra *v9;
  xsltRuntimeExtra *v10;
  uint64_t v11;
  uint64_t v12;
  xsltRuntimeExtra *v13;

  extrasNr = ctxt->extrasNr;
  extrasMax = ctxt->extrasMax;
  if (extrasNr < (int)extrasMax)
  {
LABEL_2:
    result = ctxt->extrasNr;
    ctxt->extrasNr = result + 1;
    return result;
  }
  if (extrasNr)
  {
    v5 = extrasMax + 100;
    ctxt->extrasMax = v5;
    v6 = (xsltRuntimeExtra *)((uint64_t (*)(xsltRuntimeExtraPtr, uint64_t))*MEMORY[0x24BEDEB10])(ctxt->extras, 24 * v5);
    if (v6)
    {
      ctxt->extras = v6;
      v7 = ctxt->extrasNr;
      if ((int)v7 < ctxt->extrasMax)
      {
        v8 = v7;
        do
        {
          v9 = &ctxt->extras[v8];
          ++v7;
          v9->info = 0;
          v9->deallocate = 0;
          v9->val.ptr = 0;
          ++v8;
        }
        while (v7 < ctxt->extrasMax);
      }
      goto LABEL_2;
    }
  }
  else
  {
    ctxt->extrasMax = 20;
    v10 = (xsltRuntimeExtra *)((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(480);
    ctxt->extras = v10;
    if (v10)
    {
      if (ctxt->extrasMax >= 1)
      {
        v11 = 0;
        v12 = 0;
        do
        {
          v13 = &ctxt->extras[v11];
          ++v12;
          v13->info = 0;
          v13->deallocate = 0;
          v13->val.ptr = 0;
          ++v11;
        }
        while (v12 < ctxt->extrasMax);
      }
      goto LABEL_2;
    }
  }
  xsltTransformError(ctxt, 0, 0, "xsltAllocateExtraCtxt: out of memory\n");
  return 0;
}

void xsltFreeStylesheet(xsltStylesheetPtr style)
{
  const xmlDoc *doc;
  xsltDecimalFormatPtr decimalFormat;
  void (**v4)(void);
  xsltDecimalFormat *next;
  xsltTemplatePtr templates;
  xsltTemplate *v7;
  __int128 v8;
  xsltStackElem *variables;
  xmlHashTable *cdataSection;
  xmlHashTable *stripSpaces;
  xmlHashTable *nsHash;
  void *attVTs;
  _xsltStylesheet *imports;
  _xsltStylesheet *v15;
  xmlDoc *v16;
  xmlXPathContext *xpathCtxt;
  __int128 v18;

  if (style)
  {
    if (!style->parent)
    {
      doc = style->doc;
      if (doc)
        xmlDocGetRootElement(doc);
    }
    xsltFreeKeys(style);
    xsltFreeExts(style);
    xsltFreeTemplateHashes(style);
    decimalFormat = style->decimalFormat;
    v4 = (void (**)(void))MEMORY[0x24BEDE758];
    if (decimalFormat)
    {
      do
      {
        next = decimalFormat->next;
        if (decimalFormat->digit)
          (*v4)();
        if (decimalFormat->patternSeparator)
          (*v4)();
        if (decimalFormat->decimalPoint)
          (*v4)();
        if (decimalFormat->grouping)
          (*v4)();
        if (decimalFormat->percent)
          (*v4)();
        if (decimalFormat->permille)
          (*v4)();
        if (decimalFormat->zeroDigit)
          (*v4)();
        if (decimalFormat->minusSign)
          (*v4)();
        if (decimalFormat->infinity)
          (*v4)();
        if (decimalFormat->noNumber)
          (*v4)();
        if (decimalFormat->name)
          (*v4)();
        ((void (*)(xsltDecimalFormatPtr))*v4)(decimalFormat);
        decimalFormat = next;
      }
      while (next);
    }
    templates = style->templates;
    if (templates)
    {
      do
      {
        v7 = templates->next;
        if (templates->match)
          (*v4)();
        if (templates->inheritedNs)
          (*v4)();
        if (templates->templCalledTab)
          (*v4)();
        if (templates->templCountTab)
          (*v4)();
        *(_QWORD *)&templates->position = -1;
        *(_QWORD *)&v8 = -1;
        *((_QWORD *)&v8 + 1) = -1;
        *(_OWORD *)&templates->params = v8;
        *(_OWORD *)&templates->templCalledTab = v8;
        *(_OWORD *)&templates->inheritedNsNr = v8;
        *(_OWORD *)&templates->nbCalls = v8;
        *(_OWORD *)&templates->mode = v8;
        *(_OWORD *)&templates->content = v8;
        *(_OWORD *)&templates->match = v8;
        *(_OWORD *)&templates->name = v8;
        *(_OWORD *)&templates->next = v8;
        ((void (*)(xsltTemplatePtr))*v4)(templates);
        templates = v7;
      }
      while (v7);
    }
    xsltFreeAttributeSetsHashes(style);
    xsltFreeNamespaceAliasHashes(style);
    xsltFreeStylePreComps(style);
    xsltFreeStyleDocuments(style);
    xsltShutdownExts(style);
    variables = style->variables;
    if (variables)
      xsltFreeStackElemList(variables);
    cdataSection = style->cdataSection;
    if (cdataSection)
      xmlHashFree(cdataSection, 0);
    stripSpaces = style->stripSpaces;
    if (stripSpaces)
      xmlHashFree(stripSpaces, 0);
    nsHash = style->nsHash;
    if (nsHash)
      xmlHashFree(nsHash, 0);
    if (style->exclPrefixTab)
      (*v4)();
    if (style->method)
      (*v4)();
    if (style->methodURI)
      (*v4)();
    if (style->version)
      (*v4)();
    if (style->encoding)
      (*v4)();
    if (style->doctypePublic)
      (*v4)();
    if (style->doctypeSystem)
      (*v4)();
    if (style->mediaType)
      (*v4)();
    attVTs = style->attVTs;
    if (attVTs)
      xsltFreeAVTList(attVTs);
    imports = style->imports;
    if (imports)
    {
      do
      {
        v15 = imports->next;
        xsltFreeStylesheet(imports);
        imports = v15;
      }
      while (v15);
    }
    v16 = style->doc;
    if (v16)
      xmlFreeDoc(v16);
    xsltGenericDebug(xsltGenericDebugContext, "freeing dictionary from stylesheet\n");
    xmlDictFree(style->dict);
    if (linkedOnOrAfterFall2022OSVersions())
    {
      xpathCtxt = style->xpathCtxt;
      if (xpathCtxt)
        xmlXPathFreeContext(xpathCtxt);
    }
    style->xpathCtxt = (xmlXPathContextPtr)-1;
    *(_QWORD *)&v18 = -1;
    *((_QWORD *)&v18 + 1) = -1;
    *(_OWORD *)&style->literal_result = v18;
    *(_OWORD *)&style->forwards_compatible = v18;
    *(_OWORD *)&style->dict = v18;
    *(_OWORD *)&style->defaultAlias = v18;
    *(_OWORD *)&style->_private = v18;
    *(_OWORD *)&style->extrasNr = v18;
    *(_OWORD *)&style->warnings = v18;
    *(_OWORD *)&style->exclPrefixTab = v18;
    *(_OWORD *)&style->doctypeSystem = v18;
    *(_OWORD *)&style->mediaType = v18;
    *(_OWORD *)&style->omitXmlDeclaration = v18;
    *(_OWORD *)&style->standalone = v18;
    *(_OWORD *)&style->method = v18;
    *(_OWORD *)&style->version = v18;
    *(_OWORD *)&style->attributeSets = v18;
    *(_OWORD *)&style->nsDefs = v18;
    *(_OWORD *)&style->textMatch = v18;
    *(_OWORD *)&style->commentMatch = v18;
    *(_OWORD *)&style->keyMatch = v18;
    *(_OWORD *)&style->attrMatch = v18;
    *(_OWORD *)&style->variables = v18;
    *(_OWORD *)&style->templatesHash = v18;
    *(_OWORD *)&style->doc = v18;
    *(_OWORD *)&style->stripAll = v18;
    *(_OWORD *)&style->parent = v18;
    *(_OWORD *)&style->imports = v18;
    ((void (*)(xsltStylesheetPtr))*v4)(style);
  }
}

void xsltParseStylesheetOutput(xsltStylesheetPtr style, xmlNodePtr cur)
{
  xmlChar *NsProp;
  void (**v5)(void);
  xmlChar *v6;
  xmlChar *v7;
  xmlChar *v8;
  const xmlChar *QNameURI;
  xmlChar *v10;
  xmlChar *v11;
  xmlChar *v12;
  xmlChar *v13;
  xmlChar *v14;
  xmlChar *v15;
  xmlChar *v16;
  xmlHashTable *v17;
  unsigned int v18;
  xmlChar *v19;
  uint64_t v20;
  int v21;
  xmlChar *v22;
  const xmlChar *v23;
  const xmlChar *href;
  xmlNsPtr v25;
  xmlChar *v26;
  _xmlNode *children;
  xmlChar *value;
  xmlChar *name;

  if (style && cur && cur->type == XML_ELEMENT_NODE)
  {
    NsProp = xmlGetNsProp(cur, (const xmlChar *)"version", 0);
    v5 = (void (**)(void))MEMORY[0x24BEDE758];
    if (NsProp)
    {
      v6 = NsProp;
      if (style->version)
        ((void (*)(void))*MEMORY[0x24BEDE758])();
      style->version = v6;
    }
    v7 = xmlGetNsProp(cur, (const xmlChar *)"encoding", 0);
    if (v7)
    {
      v8 = v7;
      if (style->encoding)
        (*v5)();
      style->encoding = v8;
    }
    value = 0;
    name = xmlGetNsProp(cur, (const xmlChar *)"method", 0);
    if (name)
    {
      if (style->method)
        (*v5)();
      style->method = 0;
      if (style->methodURI)
        (*v5)();
      style->methodURI = 0;
      QNameURI = xsltGetQNameURI(cur, &name);
      if (name)
      {
        if (QNameURI)
        {
          style->method = name;
          style->methodURI = xmlStrdup(QNameURI);
        }
        else if (xmlStrEqual(name, (const xmlChar *)"xml")
               || xmlStrEqual(name, (const xmlChar *)"html")
               || xmlStrEqual(name, (const xmlChar *)"text"))
        {
          style->method = name;
        }
        else
        {
          xsltTransformError(0, style, cur, "invalid value for method: %s\n", (const char *)name);
          ++style->warnings;
          ((void (*)(xmlChar *))*v5)(name);
        }
      }
      else
      {
        ++style->errors;
      }
    }
    v10 = xmlGetNsProp(cur, (const xmlChar *)"doctype-system", 0);
    name = v10;
    if (v10)
    {
      if (style->doctypeSystem)
      {
        ((void (*)(xmlChar *))*v5)(style->doctypeSystem);
        v10 = name;
      }
      style->doctypeSystem = v10;
    }
    v11 = xmlGetNsProp(cur, (const xmlChar *)"doctype-public", 0);
    name = v11;
    if (v11)
    {
      if (style->doctypePublic)
      {
        ((void (*)(xmlChar *))*v5)(style->doctypePublic);
        v11 = name;
      }
      style->doctypePublic = v11;
    }
    v12 = xmlGetNsProp(cur, (const xmlChar *)"standalone", 0);
    name = v12;
    if (v12)
    {
      if (xmlStrEqual(v12, (const xmlChar *)"yes"))
      {
        style->standalone = 1;
      }
      else if (xmlStrEqual(name, (const xmlChar *)"no"))
      {
        style->standalone = 0;
      }
      else
      {
        xsltTransformError(0, style, cur, "invalid value for standalone: %s\n", (const char *)name);
        ++style->errors;
      }
      ((void (*)(xmlChar *))*v5)(name);
    }
    v13 = xmlGetNsProp(cur, (const xmlChar *)"indent", 0);
    name = v13;
    if (v13)
    {
      if (xmlStrEqual(v13, (const xmlChar *)"yes"))
      {
        style->indent = 1;
      }
      else if (xmlStrEqual(name, (const xmlChar *)"no"))
      {
        style->indent = 0;
      }
      else
      {
        xsltTransformError(0, style, cur, "invalid value for indent: %s\n", (const char *)name);
        ++style->errors;
      }
      ((void (*)(xmlChar *))*v5)(name);
    }
    v14 = xmlGetNsProp(cur, (const xmlChar *)"omit-xml-declaration", 0);
    name = v14;
    if (v14)
    {
      if (xmlStrEqual(v14, (const xmlChar *)"yes"))
      {
        style->omitXmlDeclaration = 1;
      }
      else if (xmlStrEqual(name, (const xmlChar *)"no"))
      {
        style->omitXmlDeclaration = 0;
      }
      else
      {
        xsltTransformError(0, style, cur, "invalid value for omit-xml-declaration: %s\n", (const char *)name);
        ++style->errors;
      }
      ((void (*)(xmlChar *))*v5)(name);
    }
    v15 = xmlGetNsProp(cur, (const xmlChar *)"cdata-section-elements", 0);
    if (v15)
    {
      v16 = v15;
      if (!style->cdataSection)
      {
        v17 = xmlHashCreate(10);
        style->cdataSection = v17;
        if (!v17)
          return;
      }
      value = v16;
      v18 = *v16;
      if (*v16)
      {
        v19 = v16;
        while (1)
        {
          if (v18 > 0x20)
            goto LABEL_63;
          if (((1 << v18) & 0x100002600) != 0)
          {
            value = v19 + 1;
            v18 = *++v19;
          }
          else
          {
            if (!v18)
              break;
LABEL_63:
            v20 = 0;
            while (v18 > 0x20 || ((1 << v18) & 0x100002601) == 0)
              v18 = v19[++v20];
            if (v20 >= 0x7FFFFFFF)
              v21 = 0x7FFFFFFF;
            else
              v21 = v20;
            v22 = xmlStrndup(v19, v21);
            value = v22;
            if (v22)
            {
              xsltGenericDebug(xsltGenericDebugContext, "add cdata section output element %s\n", (const char *)v22);
              if (xmlValidateQName(value, 0))
              {
                xsltTransformError(0, style, cur, "Attribute 'cdata-section-elements': The value '%s' is not a valid QName.\n", (const char *)value);
                ((void (*)(xmlChar *))*v5)(value);
              }
              else
              {
                v23 = xsltGetQNameURI(cur, &value);
                if (value)
                {
                  href = v23;
                  if (!v23)
                  {
                    v25 = xmlSearchNs(style->doc, cur, 0);
                    if (v25)
                      href = v25->href;
                    else
                      href = 0;
                  }
                  xmlHashAddEntry2(style->cdataSection, value, href, "cdata");
                  ((void (*)(xmlChar *))*v5)(value);
                  goto LABEL_81;
                }
                xsltTransformError(0, style, cur, "Attribute 'cdata-section-elements': Not a valid QName.\n");
              }
              ++style->errors;
            }
LABEL_81:
            v19 += v20;
            value = v19;
            v18 = *v19;
            if (!*v19)
              break;
          }
        }
      }
      ((void (*)(xmlChar *))*v5)(v16);
    }
    v26 = xmlGetNsProp(cur, (const xmlChar *)"media-type", 0);
    name = v26;
    if (v26)
    {
      if (style->mediaType)
      {
        ((void (*)(xmlChar *))*v5)(style->mediaType);
        v26 = name;
      }
      style->mediaType = v26;
    }
    children = cur->children;
    if (children)
      xsltParseContentError(style, (uint64_t)children);
  }
}

void xsltParseContentError(xsltStylesheet *a1, uint64_t a2)
{
  uint64_t v4;

  if (*(_DWORD *)(a2 + 8) == 1
    && (v4 = *(_QWORD *)(a2 + 72)) != 0
    && xmlStrEqual(*(const xmlChar **)(v4 + 16), (const xmlChar *)"http://www.w3.org/1999/XSL/Transform"))
  {
    xsltTransformError(0, a1, (xmlNodePtr)a2, "The XSLT-element '%s' is not allowed at this position.\n");
  }
  else
  {
    xsltTransformError(0, a1, (xmlNodePtr)a2, "The element '%s' is not allowed at this position.\n");
  }
  ++a1->errors;
}

void xsltParseTemplateContent(xsltStylesheetPtr style, xmlNodePtr templ)
{
  const xmlChar *defaultAlias;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _xmlNode *children;
  xmlNode *v11;
  const xmlChar *v12;
  xmlGenericErrorFunc *v13;
  uint64_t *v14;
  xmlNodePtr v15;
  xmlNs *v16;
  _xmlNode *v17;
  xmlChar *NsProp;
  const xmlChar *v19;
  const xmlChar *v20;
  uint64_t *v21;
  xmlGenericErrorFunc *v22;
  int v23;
  xmlNs *ns;
  xmlAttr *i;
  BOOL v26;
  const xmlChar *v27;
  xmlElementType type;
  xmlNode *v29;
  xmlDict *dict;
  const xmlChar *v31;
  xmlChar *v32;
  const xmlChar *content;
  xmlNode *next;
  _xmlNode *v35;
  xmlNs *v36;
  xmlNs *v37;
  _xmlNode *v38;
  char v39;

  if (!style)
    return;
  if (!templ)
    return;
  if (templ->type == XML_NAMESPACE_DECL)
    return;
  children = templ->children;
  if (!children)
    return;
  v11 = 0;
  v12 = (const xmlChar *)"text";
  v13 = &xsltGenericDebug;
  v14 = (uint64_t *)&xsltGenericDebugContext;
  while (1)
  {
LABEL_6:
    v15 = children;
    if (v11)
    {
      xmlUnlinkNode(v11);
      xmlFreeNode(v11);
    }
    if (v15->type != XML_ELEMENT_NODE
      || (v16 = v15->ns) == 0
      || !xmlStrEqual(v16->href, (const xmlChar *)"http://www.w3.org/1999/XSL/Transform"))
    {
      ns = v15->ns;
      if (ns && style->nsDefs && xsltCheckExtPrefix(style, ns->prefix))
      {
        xsltStylePreCompute(style, v15);
      }
      else if (v15->type == XML_ELEMENT_NODE)
      {
        if (!v15->ns)
        {
          defaultAlias = style->defaultAlias;
          if (defaultAlias)
            v15->ns = xmlSearchNsByHref(v15->doc, v15, defaultAlias);
        }
        for (i = v15->properties; i; i = i->next)
          xsltCompileAttr(style, i);
      }
      goto LABEL_26;
    }
    xsltStylePreCompute(style, v15);
    if (xmlStrEqual(v15->name, v12))
      break;
LABEL_26:
    children = v15->children;
    if (!children)
    {
      v11 = 0;
      goto LABEL_30;
    }
    v11 = 0;
    if (children->type == XML_ENTITY_DECL)
      goto LABEL_30;
  }
  v17 = v15->children;
  v11 = v15;
  if (!v17)
    goto LABEL_30;
  NsProp = xmlGetNsProp(v15, (const xmlChar *)"disable-output-escaping", 0);
  if (NsProp)
  {
    v19 = NsProp;
    (*v13)((void *)*v14, "Disable escaping: %s\n", (uint64_t)defaultAlias, v3, v4, v5, v6, v7, (char)v17->content);
    if (xmlStrEqual(v19, (const xmlChar *)"yes"))
    {
      v20 = v12;
      v21 = v14;
      v22 = v13;
      v23 = 1;
    }
    else
    {
      v20 = v12;
      v21 = v14;
      v22 = v13;
      if (xmlStrEqual(v19, (const xmlChar *)"no"))
      {
        v23 = 0;
      }
      else
      {
        xsltTransformError(0, style, v15, "xsl:text: disable-output-escaping allows only yes or no\n");
        v23 = 0;
        ++style->warnings;
      }
    }
    ((void (*)(const xmlChar *))*MEMORY[0x24BEDE758])(v19);
  }
  else
  {
    v20 = v12;
    v21 = v14;
    v22 = v13;
    v23 = 0;
  }
  v27 = (const xmlChar *)MEMORY[0x24BEDEC70];
  do
  {
    type = v17->type;
    if (type - 3 >= 2)
    {
      if (type != XML_COMMENT_NODE)
      {
        xsltTransformError(0, style, v15, "xsltParseTemplateContent: xslt:text content problem\n");
        ++style->errors;
        v11 = v15;
        v13 = v22;
        v14 = v21;
        v12 = v20;
        goto LABEL_30;
      }
    }
    else if (v23 && type != XML_CDATA_SECTION_NODE)
    {
      v17->name = v27;
    }
    v17 = v17->next;
  }
  while (v17);
  v29 = v15->children;
  v11 = v15;
  v13 = v22;
  v14 = v21;
  v12 = v20;
  if (v29)
  {
    do
    {
      if (style->internalized)
      {
        content = v29->content;
        if (content)
        {
          if (!xmlDictOwns(style->dict, content))
          {
            dict = v29->doc->dict;
            if (dict)
            {
              v31 = xmlDictLookup(dict, v29->content, -1);
              if (v31 != v29->content)
              {
                v32 = (xmlChar *)v31;
                xmlNodeSetContent(v29, 0);
                v29->content = v32;
              }
            }
          }
        }
      }
      next = v29->next;
      xmlUnlinkNode(v29);
      xmlAddPrevSibling(v15, v29);
      v29 = next;
    }
    while (next);
    v11 = v15;
  }
  do
  {
LABEL_30:
    children = v15->next;
    if (children)
      goto LABEL_6;
    v15 = v15->parent;
    if (v15)
      v26 = v15 == templ;
    else
      v26 = 1;
  }
  while (!v26);
  if (v11)
  {
    (*v13)((void *)*v14, "xsltParseTemplateContent: removing text\n", (uint64_t)defaultAlias, v3, v4, v5, v6, v7, v39);
    xmlUnlinkNode(v11);
    xmlFreeNode(v11);
  }
  v35 = templ->children;
  if (v35)
  {
    while (1)
    {
      if (v35->type == XML_ELEMENT_NODE)
      {
        v36 = v35->ns;
        if (v36)
        {
          if (xmlStrEqual(v36->href, (const xmlChar *)"http://www.w3.org/1999/XSL/Transform")
            && !xmlStrEqual(v35->name, (const xmlChar *)"param"))
          {
            break;
          }
        }
      }
      v35 = v35->next;
      if (!v35)
        return;
    }
    do
    {
      if (v35->type != XML_ELEMENT_NODE)
        break;
      v37 = v35->ns;
      if (!v37)
        break;
      if (!xmlStrEqual(v37->href, (const xmlChar *)"http://www.w3.org/1999/XSL/Transform"))
        break;
      if (!xmlStrEqual(v35->name, (const xmlChar *)"param"))
        break;
      xsltTransformError(0, style, v35, "xsltParseTemplateContent: ignoring misplaced param element\n");
      ++style->warnings;
      v38 = v35->next;
      xmlUnlinkNode(v35);
      xmlFreeNode(v35);
      v35 = v38;
    }
    while (v38);
  }
}

xsltStylesheetPtr xsltParseStylesheetProcess(xsltStylesheetPtr ret, xmlDocPtr doc)
{
  xsltStylesheetPtr result;
  xmlNodePtr RootElement;
  uint64_t v6;
  xmlNs *ns;
  xmlChar *v8;
  const xmlChar *v9;
  xsltTemplate *v10;
  xmlChar *NsProp;
  const xmlChar *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  _BYTE *v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  _BYTE *i;
  unsigned int v27;
  uint64_t v28;
  xsltTopLevelFunction v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  xmlChar *v36;
  xmlChar *v37;
  xmlHashTable *v38;
  unsigned int v39;
  xmlChar *v40;
  uint64_t v41;
  int v42;
  xmlChar *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const xmlChar *QNameURI;
  uint64_t v51;
  xmlChar *v52;
  xmlChar *v53;
  xmlHashTable *v54;
  unsigned int v55;
  xmlChar *v56;
  uint64_t v57;
  int v58;
  xmlChar *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const xmlChar *v66;
  uint64_t v67;
  xmlChar *cur;
  xmlChar *cura;
  uint64_t v70;
  uint64_t v71;
  xmlChar *str1;

  xsltInitGlobals();
  result = 0;
  if (!ret || !doc)
    return result;
  RootElement = xmlDocGetRootElement(doc);
  if (!RootElement)
  {
    xsltTransformError(0, ret, (xmlNodePtr)doc, "xsltParseStylesheetProcess : empty stylesheet\n");
    return 0;
  }
  v6 = (uint64_t)RootElement;
  if (RootElement->type == XML_ELEMENT_NODE
    && (ns = RootElement->ns) != 0
    && xmlStrEqual(ns->href, (const xmlChar *)"http://www.w3.org/1999/XSL/Transform")
    && (xmlStrEqual(*(const xmlChar **)(v6 + 16), (const xmlChar *)"stylesheet")
     || xmlStrEqual(*(const xmlChar **)(v6 + 16), (const xmlChar *)"transform")))
  {
    xsltGenericDebug(xsltGenericDebugContext, "xsltParseStylesheetProcess : found stylesheet\n");
    ret->literal_result = 0;
    xsltParseStylesheetExcludePrefix(ret, (xmlNode *)v6, 1);
    xsltParseStylesheetExtPrefix((xmlChar *)ret, (xmlNode *)v6, 1);
  }
  else
  {
    xsltParseStylesheetExcludePrefix(ret, (xmlNode *)v6, 0);
    xsltParseStylesheetExtPrefix((xmlChar *)ret, (xmlNode *)v6, 0);
    ret->literal_result = 1;
  }
  if (!ret->nopreproc)
    xsltPreprocessStylesheet(ret, v6);
  if (!ret->literal_result)
  {
    if (*(_DWORD *)(v6 + 8) != 1)
      return ret;
    NsProp = xmlGetNsProp((const xmlNode *)v6, (const xmlChar *)"version", 0);
    if (NsProp)
    {
      v12 = NsProp;
      if (!xmlStrEqual(NsProp, (const xmlChar *)"1.0") && !xmlStrEqual(v12, (const xmlChar *)"1.1"))
      {
        xsltTransformError(0, ret, (xmlNodePtr)v6, "xsl:version: only 1.1 features are supported\n");
        ret->forwards_compatible = 1;
        ++ret->warnings;
      }
      ((void (*)(const xmlChar *))*MEMORY[0x24BEDE758])(v12);
    }
    else
    {
      xsltTransformError(0, ret, (xmlNodePtr)v6, "xsl:version is missing: document may not be a stylesheet\n");
      ++ret->warnings;
    }
    v19 = *(_QWORD *)(v6 + 24);
    if (!v19)
    {
LABEL_142:
      LODWORD(v24) = 0;
LABEL_143:
      xsltGenericDebug(xsltGenericDebugContext, "parsed %d templates\n", v24);
      return ret;
    }
    while (1)
    {
      v20 = *(_DWORD *)(v19 + 8);
      if (v20 != 1)
        break;
      v23 = *(_QWORD *)(v19 + 72);
      if (!v23
        || !xmlStrEqual(*(const xmlChar **)(v23 + 16), (const xmlChar *)"http://www.w3.org/1999/XSL/Transform")
        || !xmlStrEqual(*(const xmlChar **)(v19 + 16), (const xmlChar *)"import"))
      {
        goto LABEL_45;
      }
      if (xsltParseStylesheetImport(ret, (xmlNodePtr)v19))
        ++ret->errors;
LABEL_43:
      v19 = *(_QWORD *)(v19 + 48);
      if (!v19)
        goto LABEL_142;
    }
    if (v20 == 3)
    {
      v21 = *(_BYTE **)(v19 + 80);
      if (!v21)
        goto LABEL_43;
      while (1)
      {
        v22 = *v21;
        if (v22 > 0x20)
          goto LABEL_45;
        if (((1 << v22) & 0x100002600) == 0)
          break;
        ++v21;
      }
      if (!*v21)
        goto LABEL_43;
    }
LABEL_45:
    v24 = 0;
    while (1)
    {
      v25 = *(_DWORD *)(v19 + 8);
      if (v25 == 1)
        break;
      if (v25 != 3)
        goto LABEL_64;
      if (*(_QWORD *)(v19 + 80))
      {
        for (i = *(_BYTE **)(v19 + 80); ; ++i)
        {
          v27 = *i;
          if (v27 > 0x20)
            break;
          if (((1 << v27) & 0x100002600) == 0)
          {
            if (!*i)
              goto LABEL_62;
            break;
          }
        }
        xsltTransformError(0, ret, (xmlNodePtr)v19, "misplaced text node: '%s'\n");
        goto LABEL_61;
      }
LABEL_62:
      v19 = *(_QWORD *)(v19 + 48);
      if (!v19)
        goto LABEL_143;
    }
    v28 = *(_QWORD *)(v19 + 72);
    if (!v28)
    {
      xsltGenericError(xsltGenericErrorContext, "Found a top-level element %s with null namespace URI\n", v13, v14, v15, v16, v17, v18, *(_QWORD *)(v19 + 16));
LABEL_61:
      ++ret->errors;
      goto LABEL_62;
    }
    if (!xmlStrEqual(*(const xmlChar **)(v28 + 16), (const xmlChar *)"http://www.w3.org/1999/XSL/Transform"))
    {
      v29 = xsltExtModuleTopLevelLookup(*(const xmlChar **)(v19 + 16), *(const xmlChar **)(*(_QWORD *)(v19 + 72) + 16));
      if (v29)
        ((void (*)(xsltStylesheetPtr, uint64_t))v29)(ret, v19);
      xsltGenericDebug(xsltGenericDebugContext, "xsltParseStylesheetTop : found foreign element %s\n", v30, v31, v32, v33, v34, v35, *(_QWORD *)(v19 + 16));
      goto LABEL_62;
    }
LABEL_64:
    if (xmlStrEqual(*(const xmlChar **)(v19 + 16), (const xmlChar *)"import"))
    {
      xsltTransformError(0, ret, (xmlNodePtr)v19, "xsltParseStylesheetTop: ignoring misplaced import element\n", v67);
      goto LABEL_61;
    }
    if (xmlStrEqual(*(const xmlChar **)(v19 + 16), (const xmlChar *)"include"))
    {
      if (!xsltParseStylesheetInclude(ret, (xmlNodePtr)v19))
        goto LABEL_62;
      goto LABEL_61;
    }
    if (xmlStrEqual(*(const xmlChar **)(v19 + 16), (const xmlChar *)"strip-space"))
    {
      if (*(_DWORD *)(v19 + 8) != 1)
        goto LABEL_62;
      v36 = xmlGetNsProp((const xmlNode *)v19, (const xmlChar *)"elements", 0);
      if (!v36)
      {
        xsltTransformError(0, ret, (xmlNodePtr)v19, "xsltParseStylesheetStripSpace: missing elements attribute\n");
LABEL_127:
        ++ret->warnings;
        goto LABEL_62;
      }
      v37 = v36;
      cur = v36;
      if (!ret->stripSpaces)
      {
        v38 = xmlHashCreate(10);
        v37 = cur;
        ret->stripSpaces = v38;
        if (!v38)
          goto LABEL_62;
      }
      v70 = v24;
      str1 = v37;
      v39 = *v37;
      if (!*v37)
      {
LABEL_93:
        ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(cur);
        v51 = *(_QWORD *)(v19 + 24);
        v24 = v70;
        if (!v51)
          goto LABEL_62;
LABEL_120:
        xsltParseContentError(ret, v51);
        goto LABEL_62;
      }
      v40 = cur;
      while (1)
      {
        if (v39 <= 0x20)
        {
          if (((1 << v39) & 0x100002600) != 0)
          {
            str1 = v40 + 1;
            v39 = *++v40;
            continue;
          }
          if (!v39)
            goto LABEL_93;
        }
        v41 = 0;
        while (v39 > 0x20 || ((1 << v39) & 0x100002601) == 0)
          v39 = v40[++v41];
        if (v41 >= 0x7FFFFFFF)
          v42 = 0x7FFFFFFF;
        else
          v42 = v41;
        v43 = xmlStrndup(v40, v42);
        str1 = v43;
        if (v43)
        {
          xsltGenericDebug(xsltGenericDebugContext, "add stripped space element %s\n", v44, v45, v46, v47, v48, v49, (char)v43);
          if (xmlStrEqual(str1, (const xmlChar *)"*"))
          {
            ret->stripAll = 1;
          }
          else
          {
            QNameURI = xsltGetQNameURI((xmlNodePtr)v19, &str1);
            xmlHashAddEntry2(ret->stripSpaces, str1, QNameURI, "strip");
          }
          ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(str1);
        }
        v40 += v41;
        str1 = v40;
        v39 = *v40;
        if (!*v40)
          goto LABEL_93;
      }
    }
    if (!xmlStrEqual(*(const xmlChar **)(v19 + 16), (const xmlChar *)"preserve-space"))
    {
      if (xmlStrEqual(*(const xmlChar **)(v19 + 16), (const xmlChar *)"output"))
      {
        xsltParseStylesheetOutput(ret, (xmlNodePtr)v19);
        goto LABEL_62;
      }
      if (xmlStrEqual(*(const xmlChar **)(v19 + 16), (const xmlChar *)"key"))
      {
        xsltParseStylesheetKey(ret, (xmlNode *)v19);
        goto LABEL_62;
      }
      if (xmlStrEqual(*(const xmlChar **)(v19 + 16), (const xmlChar *)"decimal-format"))
      {
        xsltParseStylesheetDecimalFormat(ret, (xmlNode *)v19);
        goto LABEL_62;
      }
      if (xmlStrEqual(*(const xmlChar **)(v19 + 16), (const xmlChar *)"attribute-set"))
      {
        xsltParseStylesheetAttributeSet(ret, (xmlNodePtr)v19);
        goto LABEL_62;
      }
      if (xmlStrEqual(*(const xmlChar **)(v19 + 16), (const xmlChar *)"variable"))
      {
        xsltParseGlobalVariable(ret, (xmlNodePtr)v19);
        goto LABEL_62;
      }
      if (xmlStrEqual(*(const xmlChar **)(v19 + 16), (const xmlChar *)"param"))
      {
        xsltParseGlobalParam(ret, (xmlNodePtr)v19);
        goto LABEL_62;
      }
      if (xmlStrEqual(*(const xmlChar **)(v19 + 16), (const xmlChar *)"template"))
      {
        v24 = (v24 + 1);
        xsltParseStylesheetTemplate((uint64_t)ret, v19);
        goto LABEL_62;
      }
      if (xmlStrEqual(*(const xmlChar **)(v19 + 16), (const xmlChar *)"namespace-alias"))
      {
        xsltNamespaceAlias(ret, (xmlNodePtr)v19);
        goto LABEL_62;
      }
      if (ret->forwards_compatible)
        goto LABEL_62;
      xsltTransformError(0, ret, (xmlNodePtr)v19, "xsltParseStylesheetTop: unknown %s element\n");
      goto LABEL_61;
    }
    if (*(_DWORD *)(v19 + 8) != 1)
      goto LABEL_62;
    v52 = xmlGetNsProp((const xmlNode *)v19, (const xmlChar *)"elements", 0);
    if (!v52)
    {
      xsltTransformError(0, ret, (xmlNodePtr)v19, "xsltParseStylesheetPreserveSpace: missing elements attribute\n");
      goto LABEL_127;
    }
    v53 = v52;
    cura = v52;
    if (!ret->stripSpaces)
    {
      v54 = xmlHashCreate(10);
      v53 = cura;
      ret->stripSpaces = v54;
      if (!v54)
        goto LABEL_62;
    }
    str1 = v53;
    v55 = *v53;
    if (!*v53)
    {
LABEL_119:
      ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(cura);
      v51 = *(_QWORD *)(v19 + 24);
      if (v51)
        goto LABEL_120;
      goto LABEL_62;
    }
    v56 = cura;
    v71 = v24;
    while (1)
    {
      while (v55 > 0x20)
      {
LABEL_106:
        v57 = 0;
        while (v55 > 0x20 || ((1 << v55) & 0x100002601) == 0)
          v55 = v56[++v57];
        if (v57 >= 0x7FFFFFFF)
          v58 = 0x7FFFFFFF;
        else
          v58 = v57;
        v59 = xmlStrndup(v56, v58);
        str1 = v59;
        if (v59)
        {
          xsltGenericDebug(xsltGenericDebugContext, "add preserved space element %s\n", v60, v61, v62, v63, v64, v65, (char)v59);
          if (xmlStrEqual(str1, (const xmlChar *)"*"))
          {
            ret->stripAll = -1;
          }
          else
          {
            v66 = xsltGetQNameURI((xmlNodePtr)v19, &str1);
            xmlHashAddEntry2(ret->stripSpaces, str1, v66, "preserve");
          }
          ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(str1);
        }
        v56 += v57;
        str1 = v56;
        v55 = *v56;
        v24 = v71;
        if (!*v56)
          goto LABEL_119;
      }
      if (((1 << v55) & 0x100002600) == 0)
      {
        if (!v55)
          goto LABEL_119;
        goto LABEL_106;
      }
      str1 = v56 + 1;
      v55 = *++v56;
    }
  }
  v8 = xmlGetNsProp((const xmlNode *)v6, (const xmlChar *)"version", (const xmlChar *)"http://www.w3.org/1999/XSL/Transform");
  if (!v8)
  {
    xsltTransformError(0, ret, (xmlNodePtr)v6, "xsltParseStylesheetProcess : document is not a stylesheet\n");
    return 0;
  }
  v9 = v8;
  xsltGenericDebug(xsltGenericDebugContext, "xsltParseStylesheetProcess : document is stylesheet\n");
  if (!xmlStrEqual(v9, (const xmlChar *)"1.0") && !xmlStrEqual(v9, (const xmlChar *)"1.1"))
  {
    xsltTransformError(0, ret, (xmlNodePtr)v6, "xsl:version: only 1.1 features are supported\n");
    ret->forwards_compatible = 1;
    ++ret->warnings;
  }
  ((void (*)(const xmlChar *))*MEMORY[0x24BEDE758])(v9);
  result = (xsltStylesheetPtr)xsltNewTemplate();
  if (result)
  {
    v10 = (xsltTemplate *)result;
    result->parent = (_xsltStylesheet *)ret->templates;
    ret->templates = (xsltTemplatePtr)result;
    result->imports = (_xsltStylesheet *)xmlStrdup((const xmlChar *)"/");
    xsltParseTemplateContent(ret, (xmlNodePtr)doc);
    v10->elem = (xmlNodePtr)doc;
    v10->content = doc->children;
    xsltAddTemplate(ret, v10, 0, 0);
    ret->literal_result = 1;
    return ret;
  }
  return result;
}

uint64_t xsltParseStylesheetExcludePrefix(xsltStylesheet *a1, xmlNode *node, int a3)
{
  const xmlNode *v5;
  const xmlChar *v6;
  xmlChar *NsProp;
  xmlChar *v8;
  unsigned int v9;
  void (**v10)(_QWORD);
  uint64_t v11;
  xmlChar *v12;
  const xmlChar *v13;
  unsigned int v14;
  uint64_t v15;
  int v16;
  xmlChar *v17;
  xmlChar *v18;
  const xmlChar *v19;
  xmlNsPtr v20;
  const xmlChar *href;
  uint64_t v22;
  uint64_t exclPrefixNr;
  uint64_t v24;
  uint64_t exclPrefixMax;
  uint64_t exclPrefixTab;
  const char *v27;
  void (**v28)(_QWORD);
  xmlGenericErrorFunc v29;
  void *v30;
  const char *v31;
  const char *v33;

  if (node->type != XML_ELEMENT_NODE)
    return 0;
  if (a3)
  {
    v5 = node;
    v6 = 0;
  }
  else
  {
    v6 = (const xmlChar *)"http://www.w3.org/1999/XSL/Transform";
    v5 = node;
  }
  NsProp = xmlGetNsProp(v5, (const xmlChar *)"exclude-result-prefixes", v6);
  v8 = NsProp;
  if (!NsProp)
    return 0;
  v9 = *NsProp;
  v10 = (void (**)(_QWORD))MEMORY[0x24BEDE758];
  v11 = 0;
  if (*NsProp)
  {
    v12 = NsProp;
    do
    {
      v13 = v12;
      while (v9 <= 0x20)
      {
        if (((1 << v9) & 0x100002600) == 0)
        {
          if (!v9)
            goto LABEL_46;
          break;
        }
        v14 = *++v13;
        v9 = v14;
        ++v12;
      }
      v15 = 0;
      while (v9 > 0x20 || ((1 << v9) & 0x100002601) == 0)
        v9 = v13[++v15];
      if (v15 >= 0x7FFFFFFF)
        v16 = 0x7FFFFFFF;
      else
        v16 = v15;
      v17 = xmlStrndup(v13, v16);
      if (!v17)
        goto LABEL_45;
      v18 = v17;
      v33 = (const char *)v17;
      if (xmlStrEqual(v17, (const xmlChar *)"#default"))
        v19 = 0;
      else
        v19 = v18;
      v20 = xmlSearchNs(a1->doc, node, v19);
      v10 = (void (**)(_QWORD))MEMORY[0x24BEDE758];
      if (v20)
      {
        href = v20->href;
        if (!a1->exclPrefixMax)
        {
          a1->exclPrefixMax = 4;
          v22 = ((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(32);
          a1->exclPrefixTab = (xmlChar **)v22;
          if (!v22)
          {
            v28 = v10;
            v29 = *__xmlGenericError();
            v30 = *__xmlGenericErrorContext();
            v31 = "malloc failed !\n";
            goto LABEL_42;
          }
        }
        LODWORD(exclPrefixNr) = a1->exclPrefixNr;
        if ((int)exclPrefixNr >= 1)
        {
          v24 = 0;
          while (!xmlStrEqual(a1->exclPrefixTab[v24], href))
          {
            ++v24;
            exclPrefixNr = a1->exclPrefixNr;
            if (v24 >= exclPrefixNr)
            {
              v10 = (void (**)(_QWORD))MEMORY[0x24BEDE758];
              goto LABEL_32;
            }
          }
          v10 = (void (**)(_QWORD))MEMORY[0x24BEDE758];
          goto LABEL_43;
        }
LABEL_32:
        exclPrefixMax = a1->exclPrefixMax;
        if ((int)exclPrefixNr >= (int)exclPrefixMax)
        {
          a1->exclPrefixMax = 2 * exclPrefixMax;
          exclPrefixTab = ((uint64_t (*)(xmlChar **, uint64_t))*MEMORY[0x24BEDEB10])(a1->exclPrefixTab, 16 * exclPrefixMax);
          a1->exclPrefixTab = (xmlChar **)exclPrefixTab;
          if (!exclPrefixTab)
          {
            v28 = v10;
            v29 = *__xmlGenericError();
            v30 = *__xmlGenericErrorContext();
            v31 = "realloc failed !\n";
LABEL_42:
            v29(v30, v31);
            v10 = v28;
LABEL_43:
            v27 = v33;
            goto LABEL_44;
          }
          LODWORD(exclPrefixNr) = a1->exclPrefixNr;
        }
        else
        {
          exclPrefixTab = (uint64_t)a1->exclPrefixTab;
        }
        *(_QWORD *)(exclPrefixTab + 8 * (int)exclPrefixNr) = href;
        a1->exclPrefix = (xmlChar *)href;
        a1->exclPrefixNr = exclPrefixNr + 1;
        if ((exclPrefixNr & 0x80000000) != 0)
          goto LABEL_43;
        xsltGenericDebug(xsltGenericDebugContext, "exclude result prefix %s\n", v33);
        v27 = v33;
        v11 = (v11 + 1);
      }
      else
      {
        xsltTransformError(0, a1, node, "xsl:exclude-result-prefixes : undefined namespace %s\n", v33);
        v27 = v33;
        v10 = (void (**)(_QWORD))MEMORY[0x24BEDE758];
        ++a1->warnings;
      }
LABEL_44:
      (*v10)(v27);
LABEL_45:
      v12 = (xmlChar *)&v13[v15];
      v9 = v13[v15];
    }
    while (v13[v15]);
  }
LABEL_46:
  (*v10)(v8);
  return v11;
}

xmlChar *xsltParseStylesheetExtPrefix(xmlChar *result, xmlNode *node, int a3)
{
  xsltStylesheet *v4;
  const xmlNode *v5;
  const xmlChar *v6;
  unsigned int v7;
  xmlChar *i;
  unsigned int v9;
  uint64_t v10;
  int v11;
  xmlChar *v12;
  const char *v13;
  const xmlChar *v14;
  xmlNsPtr v15;
  xmlChar *cur;

  if (node->type == XML_ELEMENT_NODE)
  {
    v4 = (xsltStylesheet *)result;
    if (a3)
    {
      v5 = node;
      v6 = 0;
    }
    else
    {
      v6 = (const xmlChar *)"http://www.w3.org/1999/XSL/Transform";
      v5 = node;
    }
    result = xmlGetNsProp(v5, (const xmlChar *)"extension-element-prefixes", v6);
    if (result)
    {
      cur = result;
      v7 = *result;
      if (*result)
      {
        for (i = result; ; ++i)
        {
          while (v7 > 0x20)
          {
LABEL_12:
            v10 = 0;
            while (v7 > 0x20 || ((1 << v7) & 0x100002601) == 0)
              v7 = i[++v10];
            if (v10 >= 0x7FFFFFFF)
              v11 = 0x7FFFFFFF;
            else
              v11 = v10;
            v12 = xmlStrndup(i, v11);
            if (v12)
            {
              v13 = (const char *)v12;
              if (xmlStrEqual(v12, (const xmlChar *)"#default"))
                v14 = 0;
              else
                v14 = (const xmlChar *)v13;
              v15 = xmlSearchNs(v4->doc, node, v14);
              if (v15)
              {
                xsltGenericDebug(xsltGenericDebugContext, "add extension prefix %s\n", v13);
                xsltRegisterExtPrefix(v4, (const xmlChar *)v13, v15->href);
              }
              else
              {
                xsltTransformError(0, v4, node, "xsl:extension-element-prefix : undefined namespace %s\n", v13);
                ++v4->warnings;
              }
              ((void (*)(const char *))*MEMORY[0x24BEDE758])(v13);
            }
            i += v10;
            v7 = *i;
            if (!*i)
              return (xmlChar *)((uint64_t (*)(xmlChar *))*MEMORY[0x24BEDE758])(cur);
          }
          if (((1 << v7) & 0x100002600) == 0)
          {
            if (!v7)
              return (xmlChar *)((uint64_t (*)(xmlChar *))*MEMORY[0x24BEDE758])(cur);
            goto LABEL_12;
          }
          v9 = i[1];
          v7 = v9;
        }
      }
      return (xmlChar *)((uint64_t (*)(_QWORD))*MEMORY[0x24BEDE758])(cur);
    }
  }
  return result;
}

void xsltPreprocessStylesheet(xsltStylesheet *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  xmlDictPtr dict;
  char v6;
  uint64_t v7;
  uint64_t v8;
  xmlNode *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  const xmlChar *v14;
  const xmlChar *v15;
  const xmlChar *v16;
  uint64_t v17;
  const xmlChar *v18;
  _BYTE *i;
  unsigned int v20;
  xmlNs *v21;
  xmlNodePtr RootElement;
  xmlNodePtr v23;
  xmlNs *v24;
  xmlNs *v25;
  int exclPrefixNr;
  uint64_t v27;
  _xmlNs **p_next;
  int v29;
  int v30;
  unsigned int v31;
  xmlChar **exclPrefixTab;
  xmlChar *v33;
  uint64_t v34;
  const xmlChar *v35;
  int v36;
  uint64_t v37;
  char v38;
  int v39;

  if (!a2)
    return;
  v2 = a2;
  v4 = *(_QWORD *)(a2 + 64);
  if (v4 && (dict = a1->dict) != 0 && *(xmlDictPtr *)(v4 + 152) == dict)
  {
    v6 = 0;
    v36 = 1;
  }
  else
  {
    v36 = 0;
    a1->internalized = 0;
    v6 = 1;
  }
  if (*(_DWORD *)(a2 + 8) != 1
    || (v7 = *(_QWORD *)(a2 + 72)) == 0
    || !xmlStrEqual(*(const xmlChar **)(v7 + 16), (const xmlChar *)"http://www.w3.org/1999/XSL/Transform")
    || (v8 = v2, !xmlStrEqual(*(const xmlChar **)(v2 + 16), (const xmlChar *)"stylesheet")))
  {
    v8 = 0;
  }
  v9 = 0;
  v37 = v8;
  v38 = v6;
LABEL_12:
  while (2)
  {
    v10 = v2;
    if (v9)
    {
      xmlUnlinkNode(v9);
      xmlFreeNode(v9);
    }
    v11 = *(_DWORD *)(v2 + 8);
    if (v11 == 4)
    {
      v9 = 0;
      goto LABEL_78;
    }
    if (v11 == 3)
    {
      v18 = *(const xmlChar **)(v2 + 80);
      if (v18)
      {
        for (i = *(_BYTE **)(v2 + 80); ; ++i)
        {
          v20 = *i;
          if (v20 > 0x20)
            goto LABEL_68;
          if (((1 << v20) & 0x100002600) == 0)
            break;
        }
        if (*i)
        {
LABEL_68:
          if (v36 && !xmlDictOwns(a1->dict, v18))
          {
            v35 = xmlDictLookup(a1->dict, *(const xmlChar **)(v2 + 80), -1);
            xmlNodeSetContent((xmlNodePtr)v10, 0);
            v9 = 0;
            *(_QWORD *)(v10 + 80) = v35;
          }
          else
          {
            v9 = 0;
          }
          goto LABEL_72;
        }
      }
      if (xmlNodeGetSpacePreserve(*(const xmlNode **)(v2 + 40)) == 1)
        v9 = 0;
      else
        v9 = (xmlNode *)v2;
      goto LABEL_72;
    }
    v9 = (xmlNode *)v2;
    if (v11 != 1)
      goto LABEL_79;
    if ((v6 & 1) == 0)
    {
      v12 = *(_QWORD *)(v2 + 88);
      if (v12)
      {
        do
        {
          v13 = *(_QWORD *)(v12 + 24);
          if (v13)
          {
            if (*(_DWORD *)(v13 + 8) == 3)
            {
              v14 = *(const xmlChar **)(v13 + 80);
              if (v14)
              {
                if (!xmlDictOwns(a1->dict, v14))
                {
                  v15 = xmlDictLookup(a1->dict, *(const xmlChar **)(v13 + 80), -1);
                  if (v15 != *(const xmlChar **)(v13 + 80))
                  {
                    v16 = v15;
                    xmlNodeSetContent((xmlNodePtr)v13, 0);
                    *(_QWORD *)(v13 + 80) = v16;
                  }
                }
              }
            }
          }
          v12 = *(_QWORD *)(v12 + 48);
        }
        while (v12);
        if (*(_DWORD *)(v10 + 8) != 1)
          goto LABEL_37;
      }
    }
    v17 = *(_QWORD *)(v10 + 72);
    if (v17 && xmlStrEqual(*(const xmlChar **)(v17 + 16), (const xmlChar *)"http://www.w3.org/1999/XSL/Transform"))
    {
      if (xmlStrEqual(*(const xmlChar **)(v10 + 16), (const xmlChar *)"text"))
      {
LABEL_63:
        v9 = 0;
        goto LABEL_79;
      }
      v39 = 0;
    }
    else
    {
LABEL_37:
      v39 = xsltParseStylesheetExcludePrefix(a1, (xmlNode *)v10, 0);
    }
    v21 = *(xmlNs **)(v10 + 96);
    if (!v21)
      goto LABEL_55;
    if (a1->exclPrefixNr < 1)
      goto LABEL_55;
    RootElement = xmlDocGetRootElement(*(const xmlDoc **)(v10 + 64));
    if (!RootElement)
      goto LABEL_55;
    v23 = RootElement;
    if (RootElement == (xmlNodePtr)v10)
      goto LABEL_55;
    v24 = 0;
    do
    {
      while (1)
      {
        v25 = v21;
        v21 = v21->next;
        exclPrefixNr = a1->exclPrefixNr;
        if (exclPrefixNr >= 1)
          break;
LABEL_49:
        v24 = v25;
        if (!v21)
          goto LABEL_55;
      }
      v27 = 0;
      while (!v25->prefix)
      {
LABEL_48:
        if (++v27 >= exclPrefixNr)
          goto LABEL_49;
      }
      if (!xmlStrEqual(v25->href, a1->exclPrefixTab[v27]))
      {
        exclPrefixNr = a1->exclPrefixNr;
        goto LABEL_48;
      }
      if (v24)
        p_next = &v24->next;
      else
        p_next = (_xmlNs **)(v10 + 96);
      *p_next = v25->next;
      v25->next = v23->nsDef;
      v23->nsDef = v25;
    }
    while (v21);
LABEL_55:
    if (v39 >= 1)
    {
      xsltPreprocessStylesheet(a1, *(_QWORD *)(v10 + 24));
      v29 = a1->exclPrefixNr;
      v30 = v39 + 1;
      v6 = v38;
      v8 = v37;
      do
      {
        v31 = v29 - 1;
        if (v29 >= 1)
        {
          a1->exclPrefixNr = v31;
          exclPrefixTab = a1->exclPrefixTab;
          if (v29 == 1)
            v33 = 0;
          else
            v33 = exclPrefixTab[v29 - 2];
          a1->exclPrefix = v33;
          exclPrefixTab[v31] = 0;
          v29 = v31;
        }
        --v30;
      }
      while (v30 > 1);
      goto LABEL_63;
    }
    v9 = 0;
    v6 = v38;
    v8 = v37;
LABEL_72:
    if (*(_DWORD *)(v10 + 8) != 1
      || !v8
      || (v34 = *(_QWORD *)(v10 + 72)) == 0
      || *(_QWORD *)(v10 + 40) != v8
      || xmlStrEqual(*(const xmlChar **)(v34 + 16), (const xmlChar *)"http://www.w3.org/1999/XSL/Transform")
      || xsltCheckExtURI(a1, *(const xmlChar **)(*(_QWORD *)(v10 + 72) + 16)))
    {
LABEL_78:
      v2 = *(_QWORD *)(v10 + 24);
      if (!v2)
        goto LABEL_79;
      continue;
    }
    break;
  }
  do
  {
LABEL_79:
    v2 = *(_QWORD *)(v10 + 48);
    if (v2)
      goto LABEL_12;
    v10 = *(_QWORD *)(v10 + 40);
  }
  while (v10 && (xmlDocPtr)v10 != a1->doc);
  if (v9)
  {
    xsltGenericDebug(xsltGenericDebugContext, "xsltPreprocessStylesheet: removing ignorable blank node\n");
    xmlUnlinkNode(v9);
    xmlFreeNode(v9);
  }
}

uint64_t xsltNewTemplate()
{
  uint64_t v0;
  uint64_t v1;

  v0 = ((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(152);
  v1 = v0;
  if (v0)
  {
    *(_QWORD *)(v0 + 144) = 0;
    *(_OWORD *)(v0 + 112) = 0u;
    *(_OWORD *)(v0 + 128) = 0u;
    *(_OWORD *)(v0 + 80) = 0u;
    *(_OWORD *)(v0 + 96) = 0u;
    *(_OWORD *)(v0 + 48) = 0u;
    *(_OWORD *)(v0 + 64) = 0u;
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    *(_OWORD *)v0 = 0u;
    *(_DWORD *)(v0 + 24) = -885235267;
  }
  else
  {
    xsltTransformError(0, 0, 0, "xsltNewTemplate : malloc failed\n");
  }
  return v1;
}

xsltStylesheetPtr xsltParseStylesheetImportedDoc(xmlDocPtr doc, xsltStylesheetPtr style)
{
  xsltStylesheet *v3;
  xsltStylesheet *v4;

  if (!doc)
    return 0;
  v3 = (xsltStylesheet *)xsltNewStylesheetInternal((uint64_t)style);
  v4 = v3;
  if (v3 && xsltParseStylesheetUser(v3, doc))
  {
    xsltFreeStylesheet(v4);
    return 0;
  }
  return v4;
}

int xsltParseStylesheetUser(xsltStylesheetPtr style, xmlDocPtr doc)
{
  int result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  xmlNodePtr RootElement;
  xmlDoc *v12;
  xmlNs *nsDef;
  const xmlChar *prefix;
  xmlHashTable *nsHash;
  const xmlChar *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  result = -1;
  if (style && doc)
  {
    if (doc->dict)
    {
      xmlDictFree(style->dict);
      style->dict = doc->dict;
      xsltGenericDebug(xsltGenericDebugContext, "reusing dictionary from %s for stylesheet\n", v5, v6, v7, v8, v9, v10, (char)doc->URL);
      xmlDictReference(style->dict);
    }
    RootElement = xmlDocGetRootElement(style->doc);
    if (RootElement)
    {
      while (1)
      {
        v12 = (xmlDoc *)RootElement;
        if (RootElement->type == XML_ELEMENT_NODE)
        {
          nsDef = RootElement->nsDef;
          if (nsDef)
            break;
        }
LABEL_17:
        RootElement = v12->children;
        if (!RootElement || RootElement->type == XML_ENTITY_DECL)
        {
          while (1)
          {
            RootElement = v12->next;
            if (RootElement)
              break;
            v12 = (xmlDoc *)v12->parent;
            if (!v12 || v12 == style->doc)
              goto LABEL_24;
          }
        }
      }
      while (1)
      {
        prefix = nsDef->prefix;
        if (prefix)
        {
          nsHash = style->nsHash;
          if (!nsHash)
          {
            nsHash = xmlHashCreate(10);
            style->nsHash = nsHash;
            if (!nsHash)
            {
              xsltTransformError(0, style, (xmlNodePtr)v12, "xsltGatherNamespaces: failed to create hash table\n");
              ++style->errors;
              break;
            }
            prefix = nsDef->prefix;
          }
          v16 = (const xmlChar *)xmlHashLookup(nsHash, prefix);
          if (v16)
          {
            if (!xmlStrEqual(v16, nsDef->href))
            {
              xsltTransformError(0, style, (xmlNodePtr)v12, "Namespaces prefix %s used for multiple namespaces\n", (const char *)nsDef->prefix);
              ++style->warnings;
            }
          }
          else
          {
            xmlHashUpdateEntry(style->nsHash, nsDef->prefix, (void *)nsDef->href, 0);
            xsltGenericDebug(xsltGenericDebugContext, "Added namespace: %s mapped to %s\n", v17, v18, v19, v20, v21, v22, (char)nsDef->prefix);
          }
        }
        nsDef = nsDef->next;
        if (!nsDef)
          goto LABEL_17;
      }
    }
LABEL_24:
    style->doc = doc;
    if (!xsltParseStylesheetProcess(style, doc))
    {
      style->doc = 0;
      return -1;
    }
    if (style->errors)
    {
      style->doc = 0;
      if (!style->parent)
        xmlDocGetRootElement(doc);
      return -1;
    }
    if (!style->parent)
      xsltResolveStylesheetAttributeSet(style);
    return 0;
  }
  return result;
}

xsltStylesheetPtr xsltParseStylesheetDoc(xmlDocPtr doc)
{
  xsltInitGlobals();
  return xsltParseStylesheetImportedDoc(doc, 0);
}

xsltStylesheetPtr xsltParseStylesheetFile(const xmlChar *filename)
{
  xsltSecurityPrefs *DefaultSecurityPrefs;
  int v3;
  xmlDocPtr v4;
  xmlDoc *v5;
  xsltStylesheetPtr result;

  xsltInitGlobals();
  if (filename)
  {
    xsltGenericDebug(xsltGenericDebugContext, "xsltParseStylesheetFile : parse %s\n", (const char *)filename);
    DefaultSecurityPrefs = xsltGetDefaultSecurityPrefs();
    if (DefaultSecurityPrefs && (v3 = xsltCheckRead(DefaultSecurityPrefs, 0, filename), v3 <= 0))
    {
      if (!v3)
        xsltTransformError(0, 0, 0, "xsltParseStylesheetFile: read rights for %s denied\n");
    }
    else
    {
      v4 = xsltDocDefaultLoader(filename, 0, 16398, 0, XSLT_LOAD_START);
      if (v4)
      {
        v5 = v4;
        xsltInitGlobals();
        result = xsltParseStylesheetImportedDoc(v5, 0);
        if (result)
          return result;
        xmlFreeDoc(v5);
      }
      else
      {
        xsltTransformError(0, 0, 0, "xsltParseStylesheetFile : cannot parse %s\n");
      }
    }
  }
  return 0;
}

xsltStylesheetPtr xsltLoadStylesheetPI(xmlDocPtr doc)
{
  _xmlNode *children;
  xmlElementType type;
  xmlChar *content;
  uint64_t v5;
  int v6;
  xmlChar *v7;
  int v8;
  unsigned __int8 *v9;
  xmlChar *v10;
  uint64_t v11;
  unsigned __int8 *v12;
  int v13;
  uint64_t v14;
  int v15;
  BOOL v16;
  int v17;
  xmlChar *v18;
  uint64_t v19;
  int v20;
  int v21;
  BOOL v22;
  int v23;
  xmlURIPtr v25;
  xmlURI *v26;
  xmlChar *Base;
  xmlChar *v28;
  char *fragment;
  const xmlChar *v30;
  int v31;
  const xmlChar *v32;
  xmlAttrPtr ID;
  xmlAttrPtr v34;
  xmlNode *parent;
  xmlDocPtr v36;
  xmlDoc *v37;
  xmlNode *v38;
  xmlChar *v39;
  xmlNs *i;
  _BOOL8 v41;
  xmlChar *str1;

  xsltInitGlobals();
  if (doc)
  {
    children = doc->children;
    if (!children)
      return 0;
    while (1)
    {
      type = children->type;
      if (type != XML_PI_NODE)
      {
        if (type != XML_ELEMENT_NODE)
          goto LABEL_86;
        return 0;
      }
      if (!xmlStrEqual(children->name, (const xmlChar *)"xml-stylesheet"))
        goto LABEL_86;
      content = children->content;
      if (!content)
        goto LABEL_86;
      LODWORD(v5) = *content;
      if (!*content)
        goto LABEL_86;
      v6 = 0;
      v7 = 0;
      while (1)
      {
LABEL_10:
        while (v5 <= 0x20 && ((1 << v5) & 0x100002600) != 0)
        {
          v8 = *++content;
          LODWORD(v5) = v8;
        }
        if ((_DWORD)v5 != 104)
          break;
        if (content[1] != 114 || content[2] != 101 || content[3] != 102)
        {
LABEL_29:
          while (1)
          {
            if (v5 <= 0x20)
            {
              if (((1 << v5) & 0x100002600) != 0)
                goto LABEL_10;
              if (!(_DWORD)v5)
                goto LABEL_81;
            }
            LODWORD(v5) = *++content;
          }
        }
        v12 = content + 6;
        v10 = content + 5;
        for (content += 4; ; ++content)
        {
          v5 = *content;
          if (v5 > 0x3D)
            break;
          if (((1 << v5) & 0x100002600) == 0)
          {
            if (v5 != 61)
              break;
            LODWORD(v5) = content[1];
            if ((_DWORD)v5 == 34 || (_DWORD)v5 == 39)
            {
              v19 = -1;
              do
              {
                v21 = *++v10;
                v20 = v21;
                ++v19;
                if (v21)
                  v22 = v20 == (_DWORD)v5;
                else
                  v22 = 1;
              }
              while (!v22);
              if (v20 != (_DWORD)v5)
              {
                LODWORD(v5) = v20;
                goto LABEL_65;
              }
              if (!v7)
              {
                if (v19 >= 0x7FFFFFFF)
                  v23 = 0x7FFFFFFF;
                else
                  v23 = v19;
                v7 = xmlStrndup(content + 2, v23);
                LODWORD(v5) = *v10;
              }
              if ((_DWORD)v5)
                content = v10 + 1;
              else
                content = v10;
              LODWORD(v5) = *content;
            }
            else
            {
              ++content;
            }
            break;
          }
          ++v12;
          ++v10;
        }
LABEL_69:
        if (!(_DWORD)v5)
          goto LABEL_81;
      }
      if ((_DWORD)v5 != 116 || content[1] != 121 || content[2] != 112 || content[3] != 101)
        goto LABEL_29;
      v9 = content + 6;
      v10 = content + 5;
      for (content += 4; ; ++content)
      {
        v11 = *content;
        if (v11 > 0x3D)
          goto LABEL_66;
        if (((1 << v11) & 0x100002600) == 0)
          break;
        ++v9;
        ++v10;
      }
      if (v11 != 61)
      {
LABEL_66:
        LODWORD(v5) = *content;
        goto LABEL_69;
      }
      v13 = content[1];
      if (v13 != 34 && v13 != 39)
      {
        LODWORD(v5) = *++content;
        goto LABEL_69;
      }
      v14 = -1;
      do
      {
        v15 = *++v10;
        LODWORD(v5) = v15;
        ++v14;
        if (v15)
          v16 = (_DWORD)v5 == v13;
        else
          v16 = 1;
      }
      while (!v16);
      if ((_DWORD)v5 != v13)
        break;
      if (v14 >= 0x7FFFFFFF)
        v17 = 0x7FFFFFFF;
      else
        v17 = v14;
      v18 = xmlStrndup(content + 2, v17);
      v41 = *v10 != 0;
      if (*v10)
        content = v10 + 1;
      else
        content = v10;
      if (!v18)
        goto LABEL_86;
      str1 = v18;
      if (!xmlStrcasecmp(v18, (const xmlChar *)"text/xml") || !xmlStrcasecmp(str1, (const xmlChar *)"text/xsl"))
      {
        ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(str1);
        LODWORD(v5) = v10[v41];
        v6 = 1;
        if (v10[v41])
          goto LABEL_10;
LABEL_82:
        if (!v7)
          goto LABEL_86;
        xsltGenericDebug(xsltGenericDebugContext, "xsltLoadStylesheetPI : found PI href=%s\n", (const char *)v7);
        v25 = xmlParseURI((const char *)v7);
        if (v25)
        {
          v26 = v25;
          if (!v25->fragment
            || v25->scheme
            || v25->opaque
            || v25->authority
            || v25->server
            || v25->user
            || v25->path
            || v25->query)
          {
            Base = xmlNodeGetBase(doc, (const xmlNode *)doc);
            v28 = xmlBuildURI(v7, Base);
            if (v28)
            {
              xsltGenericDebug(xsltGenericDebugContext, "xsltLoadStylesheetPI : fetching %s\n", (const char *)v28);
              doc = (xmlDocPtr)xsltParseStylesheetFile(v28);
              ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v28);
            }
            else
            {
              xsltGenericDebug(xsltGenericDebugContext, "xsltLoadStylesheetPI : fetching %s\n", (const char *)v7);
              doc = (xmlDocPtr)xsltParseStylesheetFile(v7);
            }
            if (Base)
              ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(Base);
            goto LABEL_104;
          }
          xsltGenericDebug(xsltGenericDebugContext, "xsltLoadStylesheetPI : Reference to ID %s\n", (const char *)v7);
          fragment = v26->fragment;
          v31 = *fragment;
          v30 = (const xmlChar *)(fragment + 1);
          if (v31 == 35)
            v32 = v30;
          else
            v32 = (const xmlChar *)v26->fragment;
          ID = xmlGetID(doc, v32);
          if (ID)
          {
            v34 = ID;
            xsltGenericDebug(xsltGenericDebugContext, "creating new document from %s for embedded stylesheet\n", (const char *)doc->URL);
            parent = v34->parent;
            v36 = xmlNewDoc(0);
            if (v36)
            {
              v37 = v36;
              v36->dict = doc->dict;
              xmlDictReference(doc->dict);
              xsltGenericDebug(xsltGenericDebugContext, "reusing dictionary from %s for embedded stylesheet\n", (const char *)doc->URL);
              v38 = xmlDocCopyNode(parent, v37, 1);
              v39 = xmlNodeGetBase(doc, parent->parent);
              v37->URL = v39;
              xsltGenericDebug(xsltGenericDebugContext, "set base URI for embedded stylesheet as %s\n", (const char *)v39);
              while (1)
              {
                parent = parent->parent;
                if (parent == (xmlNode *)doc)
                  break;
                for (i = parent->ns; i; i = i->next)
                  xmlNewNs(v38, i->href, i->prefix);
              }
              xmlAddChild((xmlNodePtr)v37, v38);
              xsltInitGlobals();
              doc = (xmlDocPtr)xsltParseStylesheetImportedDoc(v37, 0);
              if (!doc)
                xmlFreeDoc(v37);
LABEL_104:
              xmlFreeURI(v26);
LABEL_105:
              ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v7);
              return (xsltStylesheetPtr)doc;
            }
          }
          else
          {
            xsltTransformError(0, 0, children, "xml-stylesheet : no ID %s found\n", v26->fragment);
          }
          doc = 0;
          goto LABEL_104;
        }
        xsltTransformError(0, 0, children, "xml-stylesheet : href %s is not valid\n", (const char *)v7);
        doc = 0;
        goto LABEL_105;
      }
      ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(str1);
LABEL_81:
      if (v6)
        goto LABEL_82;
      if (v7)
        ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v7);
LABEL_86:
      children = children->next;
      if (!children)
        return 0;
    }
LABEL_65:
    content = v10;
    goto LABEL_69;
  }
  return (xsltStylesheetPtr)doc;
}

_QWORD *xsltNewDecimalFormat(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = (_QWORD *)((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(104);
  v5 = v4;
  if (v4)
  {
    *v4 = 0;
    if (linkedOnOrAfterFall2022OSVersions())
      v5[12] = a1;
    v5[1] = a2;
    v5[2] = xmlStrdup((const xmlChar *)"#");
    v5[3] = xmlStrdup((const xmlChar *)";");
    v5[7] = xmlStrdup((const xmlChar *)".");
    v5[8] = xmlStrdup((const xmlChar *)",");
    v5[9] = xmlStrdup((const xmlChar *)"%");
    v5[10] = xmlStrdup(xsltNewDecimalFormat_permille);
    v5[11] = xmlStrdup((const xmlChar *)"0");
    v5[4] = xmlStrdup((const xmlChar *)"-");
    v5[5] = xmlStrdup((const xmlChar *)"Infinity");
    v5[6] = xmlStrdup((const xmlChar *)"NaN");
  }
  return v5;
}

void xsltParseStylesheetKey(xsltStylesheet *a1, xmlNode *node)
{
  const xmlChar *QNameURI;
  xmlChar *v5;
  xmlChar *v6;
  xmlChar *NsProp;
  void (**v8)(xmlChar *);
  const xmlChar *v9;
  xmlChar *v10;
  xmlChar *v11;
  _xmlNode *children;
  xmlChar *name;

  if (node->type == XML_ELEMENT_NODE)
  {
    name = xmlGetNsProp(node, (const xmlChar *)"name", 0);
    if (name)
    {
      QNameURI = xsltGetQNameURI(node, &name);
      v5 = name;
      if (name)
      {
        if (QNameURI)
          v6 = xmlStrdup(QNameURI);
        else
          v6 = 0;
        xsltGenericDebug(xsltGenericDebugContext, "xsltParseStylesheetKey: name %s\n", (const char *)v5);
        NsProp = xmlGetNsProp(node, (const xmlChar *)"match", 0);
        v8 = (void (**)(xmlChar *))MEMORY[0x24BEDE758];
        if (NsProp)
        {
          v9 = NsProp;
          v10 = xmlGetNsProp(node, (const xmlChar *)"use", 0);
          if (v10)
          {
            v11 = v10;
            xsltAddKey(a1, v5, v6, v9, v10, node);
            (*v8)(v11);
          }
          else
          {
            xsltTransformError(0, a1, node, "xsl:key : error missing use\n");
            ++a1->errors;
          }
          (*v8)((xmlChar *)v9);
        }
        else
        {
          xsltTransformError(0, a1, node, "xsl:key : error missing match\n");
          ++a1->errors;
        }
        (*v8)(v5);
        if (v6)
          (*v8)(v6);
        goto LABEL_17;
      }
    }
    else
    {
      xsltTransformError(0, a1, node, "xsl:key : error missing name\n");
    }
    ++a1->errors;
LABEL_17:
    children = node->children;
    if (children)
      xsltParseContentError(a1, (uint64_t)children);
  }
}

void xsltParseStylesheetDecimalFormat(xsltStylesheet *a1, xmlNode *node)
{
  _QWORD *p_next;
  xmlChar *NsProp;
  const char *v6;
  const xmlChar *QNameURI;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  xmlChar *v12;
  xmlChar *v13;
  xmlChar *v14;
  xmlChar *v15;
  xmlChar *v16;
  xmlChar *v17;
  xmlChar *v18;
  xmlChar *v19;
  xmlChar *v20;
  xmlChar *v21;
  _xmlNode *children;
  xmlChar *name;

  if (node->type == XML_ELEMENT_NODE)
  {
    p_next = &a1->decimalFormat->next;
    NsProp = xmlGetNsProp(node, (const xmlChar *)"name", 0);
    name = NsProp;
    if (NsProp)
    {
      v6 = (const char *)NsProp;
      if (xmlValidateQName(NsProp, 0))
      {
        xsltTransformError(0, a1, node, "xsl:decimal-format: Invalid QName '%s'.\n", v6);
        ++a1->warnings;
        ((void (*)(const char *))*MEMORY[0x24BEDE758])(v6);
        return;
      }
      QNameURI = xsltGetQNameURI(node, &name);
      if (!name)
      {
        ++a1->warnings;
        return;
      }
      v8 = (uint64_t)QNameURI;
      if (xsltDecimalFormatGetByQName(a1, QNameURI, name))
      {
        xsltTransformError(0, a1, node, "xsltParseStylestyleDecimalFormat: %s already exists\n", (const char *)name);
        ++a1->warnings;
LABEL_8:
        ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(name);
        return;
      }
      v9 = xsltNewDecimalFormat(v8, (uint64_t)name);
      if (!v9)
      {
        xsltTransformError(0, a1, node, "xsltParseStylestyleDecimalFormat: failed creating new decimal-format\n");
        ++a1->errors;
        goto LABEL_8;
      }
      p_next = v9;
      v10 = &a1->decimalFormat->next;
      do
      {
        v11 = v10;
        v10 = (_QWORD *)*v10;
      }
      while (v10);
      *v11 = v9;
    }
    v12 = xmlGetNsProp(node, (const xmlChar *)"decimal-separator", 0);
    name = v12;
    if (v12)
    {
      if (p_next[7])
      {
        ((void (*)(_QWORD))*MEMORY[0x24BEDE758])(p_next[7]);
        v12 = name;
      }
      p_next[7] = v12;
    }
    v13 = xmlGetNsProp(node, (const xmlChar *)"grouping-separator", 0);
    name = v13;
    if (v13)
    {
      if (p_next[8])
      {
        ((void (*)(_QWORD))*MEMORY[0x24BEDE758])(p_next[8]);
        v13 = name;
      }
      p_next[8] = v13;
    }
    v14 = xmlGetNsProp(node, (const xmlChar *)"infinity", 0);
    name = v14;
    if (v14)
    {
      if (p_next[5])
      {
        ((void (*)(_QWORD))*MEMORY[0x24BEDE758])(p_next[5]);
        v14 = name;
      }
      p_next[5] = v14;
    }
    v15 = xmlGetNsProp(node, (const xmlChar *)"minus-sign", 0);
    name = v15;
    if (v15)
    {
      if (p_next[4])
      {
        ((void (*)(_QWORD))*MEMORY[0x24BEDE758])(p_next[4]);
        v15 = name;
      }
      p_next[4] = v15;
    }
    v16 = xmlGetNsProp(node, (const xmlChar *)"NaN", 0);
    name = v16;
    if (v16)
    {
      if (p_next[6])
      {
        ((void (*)(_QWORD))*MEMORY[0x24BEDE758])(p_next[6]);
        v16 = name;
      }
      p_next[6] = v16;
    }
    v17 = xmlGetNsProp(node, (const xmlChar *)"percent", 0);
    name = v17;
    if (v17)
    {
      if (p_next[9])
      {
        ((void (*)(_QWORD))*MEMORY[0x24BEDE758])(p_next[9]);
        v17 = name;
      }
      p_next[9] = v17;
    }
    v18 = xmlGetNsProp(node, (const xmlChar *)"per-mille", 0);
    name = v18;
    if (v18)
    {
      if (p_next[10])
      {
        ((void (*)(_QWORD))*MEMORY[0x24BEDE758])(p_next[10]);
        v18 = name;
      }
      p_next[10] = v18;
    }
    v19 = xmlGetNsProp(node, (const xmlChar *)"zero-digit", 0);
    name = v19;
    if (v19)
    {
      if (p_next[11])
      {
        ((void (*)(_QWORD))*MEMORY[0x24BEDE758])(p_next[11]);
        v19 = name;
      }
      p_next[11] = v19;
    }
    v20 = xmlGetNsProp(node, (const xmlChar *)"digit", 0);
    name = v20;
    if (v20)
    {
      if (p_next[2])
      {
        ((void (*)(_QWORD))*MEMORY[0x24BEDE758])(p_next[2]);
        v20 = name;
      }
      p_next[2] = v20;
    }
    v21 = xmlGetNsProp(node, (const xmlChar *)"pattern-separator", 0);
    name = v21;
    if (v21)
    {
      if (p_next[3])
      {
        ((void (*)(_QWORD))*MEMORY[0x24BEDE758])(p_next[3]);
        v21 = name;
      }
      p_next[3] = v21;
    }
    children = node->children;
    if (children)
      xsltParseContentError(a1, (uint64_t)children);
  }
}

uint64_t xsltParseStylesheetTemplate(uint64_t result, uint64_t a2)
{
  xmlNode *v2;
  xsltStylesheet *v3;
  xsltTemplate *v4;
  xsltTemplatePtr templates;
  uint64_t v6;
  xmlNsPtr *v7;
  int v8;
  xmlNode *v9;
  xmlNs *nsDef;
  const xmlChar *prefix;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const xmlChar *v15;
  const xmlChar *v16;
  uint64_t v17;
  xmlGenericErrorFunc v18;
  void *v19;
  const char *v20;
  xmlChar *v21;
  xmlChar *v22;
  void (**v23)(xmlChar *);
  xmlChar *NsProp;
  xmlChar *v25;
  float v26;
  const xmlChar *QNameURI;
  const xmlChar *v28;
  xmlNode *v29;
  xmlChar *name;

  if (*(_DWORD *)(a2 + 8) != 1)
    return result;
  v2 = (xmlNode *)a2;
  v3 = (xsltStylesheet *)result;
  result = xsltNewTemplate();
  if (!result)
    return result;
  v4 = (xsltTemplate *)result;
  name = 0;
  templates = v3->templates;
  v3->templates = (xsltTemplatePtr)result;
  *(_QWORD *)result = templates;
  *(_QWORD *)(result + 8) = v3;
  if (*(_DWORD *)(result + 80) || *(_QWORD *)(result + 88))
    goto LABEL_35;
  LODWORD(v6) = 0;
  v7 = 0;
  v8 = 10;
  v29 = v2;
  v9 = v2;
  while (1)
  {
    if (v9->type == XML_ELEMENT_NODE)
    {
      nsDef = v9->nsDef;
      if (nsDef)
        break;
    }
LABEL_29:
    v9 = v9->parent;
    if (!v9)
    {
      v2 = v29;
      if ((_DWORD)v6)
      {
        xsltGenericDebug(xsltGenericDebugContext, "template has %d inherited namespaces\n", v6);
        v4->inheritedNsNr = v6;
        v4->inheritedNs = v7;
      }
      goto LABEL_35;
    }
  }
  while (1)
  {
    if (xmlStrEqual(nsDef->href, (const xmlChar *)"http://www.w3.org/1999/XSL/Transform"))
      goto LABEL_9;
    prefix = nsDef->prefix;
    if (prefix)
    {
      if (xsltCheckExtPrefix(v3, prefix))
        goto LABEL_9;
    }
    if (v3->exclPrefixNr >= 1)
    {
      v12 = 0;
      while (!xmlStrEqual(nsDef->href, v3->exclPrefixTab[v12]))
      {
        if (++v12 >= v3->exclPrefixNr)
          goto LABEL_17;
      }
      goto LABEL_9;
    }
LABEL_17:
    if (!v7)
    {
      v13 = ((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(8 * (v8 + 1));
      if (!v13)
      {
        v18 = *__xmlGenericError();
        v19 = *__xmlGenericErrorContext();
        v20 = "xsltGetInheritedNsList : out of memory!\n";
        goto LABEL_34;
      }
      v7 = (xmlNsPtr *)v13;
      *(_QWORD *)(v13 + 8 * (int)v6) = 0;
    }
    if ((int)v6 >= 1)
    {
      v14 = 0;
      do
      {
        v15 = nsDef->prefix;
        v16 = v7[v14]->prefix;
        if (v15 == v16 || xmlStrEqual(v15, v16))
          goto LABEL_9;
        ++v14;
      }
      while (v6 != v14);
    }
    if ((int)v6 >= v8)
      break;
LABEL_28:
    v7[(int)v6] = nsDef;
    v6 = (int)v6 + 1;
    v7[v6] = 0;
LABEL_9:
    nsDef = nsDef->next;
    if (!nsDef)
      goto LABEL_29;
  }
  v17 = ((uint64_t (*)(xmlNsPtr *, uint64_t))*MEMORY[0x24BEDEB10])(v7, 8 * ((2 * v8) | 1));
  if (v17)
  {
    v7 = (xmlNsPtr *)v17;
    v8 *= 2;
    goto LABEL_28;
  }
  v18 = *__xmlGenericError();
  v19 = *__xmlGenericErrorContext();
  v20 = "xsltGetInheritedNsList : realloc failed!\n";
LABEL_34:
  v18(v19, v20);
  v2 = v29;
LABEL_35:
  name = xmlGetNsProp(v2, (const xmlChar *)"mode", 0);
  if (name)
  {
    result = (uint64_t)xsltGetQNameURI(v2, &name);
    v21 = name;
    if (name)
    {
      if (result)
        v22 = xmlStrdup((const xmlChar *)result);
      else
        v22 = 0;
      v4->mode = xmlDictLookup(v3->dict, v21, -1);
      v4->modeURI = xmlDictLookup(v3->dict, v22, -1);
      xsltGenericDebug(xsltGenericDebugContext, "xsltParseStylesheetTemplate: mode %s\n", (const char *)v21);
      v23 = (void (**)(xmlChar *))MEMORY[0x24BEDE758];
      ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v21);
      if (v22)
        (*v23)(v22);
      goto LABEL_42;
    }
LABEL_52:
    ++v3->errors;
  }
  else
  {
LABEL_42:
    NsProp = xmlGetNsProp(v2, (const xmlChar *)"match", 0);
    name = NsProp;
    if (NsProp)
    {
      if (v4->match)
      {
        ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v4->match);
        NsProp = name;
      }
      v4->match = NsProp;
    }
    v25 = xmlGetNsProp(v2, (const xmlChar *)"priority", 0);
    name = v25;
    if (v25)
    {
      v26 = xmlXPathStringEvalNumber(v25);
      v4->priority = v26;
      ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(name);
    }
    name = xmlGetNsProp(v2, (const xmlChar *)"name", 0);
    if (name)
    {
      QNameURI = xsltGetQNameURI(v2, &name);
      result = (uint64_t)name;
      if (!name)
        goto LABEL_52;
      if (xmlValidateNCName(name, 0))
      {
        xsltTransformError(0, v3, v2, "xsl:template : error invalid name '%s'\n", (const char *)name);
        ++v3->errors;
        return ((uint64_t (*)(xmlChar *))*MEMORY[0x24BEDE758])(name);
      }
      v4->name = xmlDictLookup(v3->dict, name, -1);
      ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(name);
      name = 0;
      if (QNameURI)
        v28 = xmlDictLookup(v3->dict, QNameURI, -1);
      else
        v28 = 0;
      v4->nameURI = v28;
    }
    xsltParseTemplateContent(v3, v2);
    v4->content = v2->children;
    v4->elem = v2;
    return xsltAddTemplate(v3, v4, v4->mode, v4->modeURI);
  }
  return result;
}

xsltLocale xsltNewLocale(xsltLocale langName)
{
  uint64_t v1;
  int v2;
  char *v3;
  _BYTE *v4;
  uint64_t v5;
  char *v6;
  _BYTE *v7;
  int v8;
  char *v9;
  const char *v10;
  uint64_t v11;
  char **v12;
  _BYTE v13[23];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!langName)
    return langName;
  v1 = 0;
  *(_QWORD *)v13 = 0;
  *(_QWORD *)&v13[8] = 0;
  *(_QWORD *)&v13[15] = 0;
  while (1)
  {
    v2 = *((unsigned __int8 *)langName + v1);
    if ((v2 & 0xFFFFFFDF) - 65 > 0x19)
      break;
    v13[v1++] = v2 | 0x20;
    if ((_DWORD)v1 == 8)
    {
      v3 = &v13[v1];
      v4 = (char *)langName + v1;
      LODWORD(v1) = 8;
      goto LABEL_8;
    }
  }
  if (!(_DWORD)v1)
    return 0;
  v3 = &v13[v1];
  v4 = (char *)langName + v1;
LABEL_8:
  if (*v4)
  {
    if (*v4 == 45)
    {
      v5 = 0;
      *v3 = 95;
      v6 = v3 + 1;
      v7 = v4 + 1;
      while (1)
      {
        v8 = v7[v5] & 0xDF;
        if ((v8 - 65) > 0x19)
          break;
        v6[v5++] = v8;
        if ((_DWORD)v5 == 8)
          goto LABEL_15;
      }
      if (!(_DWORD)v5)
        return 0;
LABEL_15:
      v9 = &v6[v5];
      if (!v7[v5])
      {
        strcpy(v9, ".utf8");
        langName = newlocale(1, v13, 0);
        if (langName)
          return langName;
        v3 = &v13[v1];
        goto LABEL_18;
      }
    }
    return 0;
  }
LABEL_18:
  strcpy(v3, ".utf8");
  langName = newlocale(1, v13, 0);
  if (langName)
    return langName;
  if ((_DWORD)v1 != 2)
    return 0;
  langName = 0;
  switch(v13[0])
  {
    case 'a':
      langName = 0;
      if (v13[1] > 0x6Du)
      {
        switch(v13[1])
        {
          case 'n':
            goto LABEL_112;
          case 'r':
            v10 = "AE";
            goto LABEL_153;
          case 'z':
            v10 = "AZ";
            goto LABEL_153;
        }
      }
      else
      {
        v10 = "ET";
        switch(v13[1])
        {
          case 'a':
            goto LABEL_153;
          case 'f':
            goto LABEL_99;
          case 'm':
            goto LABEL_153;
        }
      }
      return langName;
    case 'b':
      langName = 0;
      if (v13[1] <= 0x6Du)
      {
        if (v13[1] == 101)
        {
          v10 = "BY";
          goto LABEL_153;
        }
        if (v13[1] == 103)
        {
          v10 = "BG";
          goto LABEL_153;
        }
      }
      else
      {
        switch(v13[1])
        {
          case 'n':
            v10 = "BD";
            goto LABEL_153;
          case 'r':
            goto LABEL_117;
          case 's':
            v10 = "BA";
            goto LABEL_153;
        }
      }
      return langName;
    case 'c':
      if (v13[1] == 97)
        goto LABEL_112;
      if (v13[1] == 121)
        goto LABEL_107;
      if (v13[1] != 115)
        return 0;
      v10 = "CZ";
      goto LABEL_153;
    case 'd':
      v10 = "DE";
      if (v13[1] != 101)
        v10 = 0;
      if (v13[1] != 97)
        goto LABEL_104;
      v10 = "DK";
      goto LABEL_153;
    case 'e':
      if (v13[1] == 108)
      {
        v10 = "GR";
        goto LABEL_153;
      }
      if ((v13[1] & 0xFE) == 0x6E)
      {
        v10 = "US";
        goto LABEL_153;
      }
      LOBYTE(v11) = v13[1] - 115;
      if (v13[1] - 115 >= 3)
        return 0;
      v11 = (char)v11;
      v12 = off_24C2358D0;
LABEL_138:
      v10 = v12[v11];
      goto LABEL_153;
    case 'f':
      langName = 0;
      if (v13[1] > 0x6Eu)
      {
        if (v13[1] == 111)
        {
          v10 = "FO";
        }
        else
        {
          if (v13[1] != 114)
            return langName;
LABEL_117:
          v10 = "FR";
        }
      }
      else if (v13[1] == 97)
      {
        v10 = "IR";
      }
      else
      {
        if (v13[1] != 105)
          return langName;
        v10 = "FI";
      }
      goto LABEL_153;
    case 'g':
      switch(v13[1])
      {
        case 'a':
          v10 = "IE";
          goto LABEL_153;
        case 'v':
          goto LABEL_107;
        case 'l':
LABEL_112:
          v10 = "ES";
          goto LABEL_153;
      }
      return 0;
    case 'h':
      langName = 0;
      if (v13[1] <= 0x71u)
      {
        if (v13[1] == 101)
          goto LABEL_123;
        if (v13[1] == 105)
        {
LABEL_89:
          v10 = "IN";
          goto LABEL_153;
        }
        return langName;
      }
      if (v13[1] == 114)
      {
        v10 = "HT";
      }
      else
      {
        if (v13[1] != 117)
          return langName;
        v10 = "HU";
      }
      goto LABEL_153;
    case 'i':
      langName = 0;
      if (v13[1] > 0x73u)
      {
        if (v13[1] == 116)
        {
          v10 = "IT";
        }
        else
        {
          if (v13[1] != 119)
            return langName;
LABEL_123:
          v10 = "IL";
        }
      }
      else if (v13[1] == 100)
      {
        v10 = "ID";
      }
      else
      {
        if (v13[1] != 115)
          return langName;
        v10 = "IS";
      }
      goto LABEL_153;
    case 'j':
      if (v13[1] != 97)
        return 0;
      v10 = "JP";
      goto LABEL_153;
    case 'k':
      switch(v13[1])
      {
        case 'l':
          v10 = "GL";
          break;
        case 'w':
LABEL_107:
          v10 = "GB";
          break;
        case 'o':
          v10 = "KR";
          break;
        default:
          return 0;
      }
      goto LABEL_153;
    case 'l':
      v10 = "LV";
      if (v13[1] != 118)
        v10 = 0;
      if (v13[1] != 116)
        goto LABEL_104;
      v10 = "LT";
      goto LABEL_153;
    case 'm':
      LOBYTE(v11) = v13[1] - 107;
      if (v13[1] - 107 >= 0xA || ((0x38Bu >> v11) & 1) == 0)
        return 0;
      v11 = (char)v11;
      v12 = off_24C2358E8;
      goto LABEL_138;
    case 'n':
      langName = 0;
      v10 = "NO";
      if (v13[1] <= 0x6Du)
      {
        switch(v13[1])
        {
          case 'b':
            goto LABEL_153;
          case 'e':
            v10 = "NP";
            break;
          case 'l':
            v10 = "NL";
            break;
          default:
            return langName;
        }
        goto LABEL_153;
      }
      if (v13[1] - 110 < 2)
        goto LABEL_153;
      return langName;
    case 'o':
      if (v13[1] != 109)
        return 0;
      v10 = "ET";
      goto LABEL_153;
    case 'p':
      switch(v13[1])
      {
        case 'a':
          goto LABEL_89;
        case 't':
          v10 = "PT";
          break;
        case 'l':
          v10 = "PL";
          break;
        default:
          return 0;
      }
      goto LABEL_153;
    case 'r':
      v10 = "RU";
      if (v13[1] != 117)
        v10 = 0;
      if (v13[1] != 111)
        goto LABEL_104;
      v10 = "RO";
      goto LABEL_153;
    case 's':
      LOBYTE(v11) = v13[1] - 101;
      if (v13[1] - 101 >= 0x12 || ((0x294C9u >> v11) & 1) == 0)
        return 0;
      v11 = (char)v11;
      v12 = off_24C235938;
      goto LABEL_138;
    case 't':
      if ((v13[1] & 0xFB) == 0x61)
        goto LABEL_89;
      langName = 0;
      if (v13[1] > 0x71u)
      {
        if (v13[1] == 114)
        {
          v10 = "TR";
        }
        else
        {
          if (v13[1] != 116)
            return langName;
          v10 = "RU";
        }
      }
      else if (v13[1] == 104)
      {
        v10 = "TH";
      }
      else
      {
        if (v13[1] != 105)
          return langName;
        v10 = "ER";
      }
      goto LABEL_153;
    case 'u':
      v10 = "PK";
      if (v13[1] != 114)
        v10 = 0;
      if (v13[1] != 107)
        goto LABEL_104;
      v10 = "UA";
      goto LABEL_153;
    case 'v':
      if (v13[1] != 105)
        return 0;
      v10 = "VN";
      goto LABEL_153;
    case 'w':
      if (v13[1] != 97)
        return 0;
      v10 = "BE";
      goto LABEL_153;
    case 'x':
      if (v13[1] != 104)
        return 0;
LABEL_99:
      v10 = "ZA";
      goto LABEL_153;
    case 'z':
      v10 = "ZA";
      if (v13[1] != 117)
        v10 = 0;
      if (v13[1] == 104)
      {
        v10 = "CN";
      }
      else
      {
LABEL_104:
        if (!v10)
          return 0;
      }
LABEL_153:
      v13[2] = 95;
      *(_WORD *)&v13[3] = *(_WORD *)v10;
      strcpy(&v13[5], ".utf8");
      langName = newlocale(1, v13, 0);
      break;
    default:
      return langName;
  }
  return langName;
}

void xsltFreeLocale(xsltLocale locale)
{
  if (locale)
    freelocale((locale_t)locale);
}

xsltLocaleChar *__cdecl xsltStrxfrm(xsltLocale locale, const xmlChar *string)
{
  size_t v4;
  char *v5;
  xsltLocaleChar *v6;

  v4 = strxfrm_l(0, (const char *)string, 0, (locale_t)locale) + 1;
  v5 = (char *)((uint64_t (*)(size_t))*MEMORY[0x24BEDE910])(v4);
  v6 = (xsltLocaleChar *)v5;
  if (v5)
  {
    if (strxfrm_l(v5, (const char *)string, v4, (locale_t)locale) >= v4)
    {
      xsltTransformError(0, 0, 0, "xsltStrxfrm : strxfrm failed\n");
      ((void (*)(xsltLocaleChar *))*MEMORY[0x24BEDE758])(v6);
      return 0;
    }
  }
  else
  {
    xsltTransformError(0, 0, 0, "xsltStrxfrm : out of memory error\n");
  }
  return v6;
}

int xsltLocaleStrcmp(xsltLocale locale, const xsltLocaleChar *str1, const xsltLocaleChar *str2)
{
  return xmlStrcmp(str1, str2);
}

uint64_t linkedOnOrAfterFall2022OSVersions()
{
  if (linkedOnOrAfterFall2022OSVersions_once != -1)
    dispatch_once(&linkedOnOrAfterFall2022OSVersions_once, &__block_literal_global);
  return linkedOnOrAfterFall2022OSVersions_result;
}

uint64_t __linkedOnOrAfterFall2022OSVersions_block_invoke()
{
  uint64_t result;

  result = dyld_program_minos_at_least();
  linkedOnOrAfterFall2022OSVersions_result = result;
  return result;
}

uint64_t linkedOnOrAfterFall2023OSVersions()
{
  if (linkedOnOrAfterFall2023OSVersions_once != -1)
    dispatch_once(&linkedOnOrAfterFall2023OSVersions_once, &__block_literal_global_2);
  return linkedOnOrAfterFall2023OSVersions_result;
}

uint64_t __linkedOnOrAfterFall2023OSVersions_block_invoke()
{
  uint64_t result;

  result = dyld_program_minos_at_least();
  linkedOnOrAfterFall2023OSVersions_result = result;
  return result;
}

const xmlChar *__cdecl xsltGetCNsProp(xsltStylesheetPtr style, xmlNodePtr node, const xmlChar *name, const xmlChar *nameSpace)
{
  xmlElementType type;
  _xmlAttr *properties;
  xmlNs *ns;
  xmlNs *v11;
  _xmlDoc *doc;
  xmlDtd *intSubset;
  xmlAttributePtr DtdAttrDesc;
  const xmlChar *prefix;
  xmlNsPtr v17;
  xmlDtd *extSubset;
  xmlChar *String;
  xmlDict *dict;
  const xmlChar *v21;

  if (!style || !node || !style->dict)
    return 0;
  if (!nameSpace)
    return xmlGetProp(node, name);
  type = node->type;
  if (type == XML_NAMESPACE_DECL)
    return 0;
  if (type != XML_ELEMENT_NODE || (properties = node->properties) == 0)
  {
LABEL_18:
    doc = node->doc;
    if (doc)
    {
      intSubset = doc->intSubset;
      if (intSubset)
      {
        DtdAttrDesc = xmlGetDtdAttrDesc(intSubset, node->name, name);
        if (DtdAttrDesc
          || (extSubset = doc->extSubset) != 0
          && (DtdAttrDesc = xmlGetDtdAttrDesc(extSubset, node->name, name)) != 0)
        {
          prefix = DtdAttrDesc->prefix;
          if (prefix)
          {
            v17 = xmlSearchNs(doc, node, prefix);
            if (v17)
            {
              if (xmlStrEqual(v17->href, nameSpace))
                return xmlDictLookup(style->dict, DtdAttrDesc->defaultValue, -1);
            }
          }
        }
      }
    }
    return 0;
  }
  while (1)
  {
    if (!xmlStrEqual(properties->name, name))
      goto LABEL_11;
    ns = properties->ns;
    if (!ns)
      break;
LABEL_10:
    if (xmlStrEqual(ns->href, nameSpace))
      goto LABEL_28;
LABEL_11:
    properties = properties->next;
    if (!properties)
      goto LABEL_18;
  }
  v11 = node->ns;
  if (!v11)
    goto LABEL_11;
  if (!xmlStrEqual(v11->href, nameSpace))
  {
    ns = properties->ns;
    if (!ns)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_28:
  String = xmlNodeListGetString(node->doc, properties->children, 1);
  dict = style->dict;
  if (!String)
    return xmlDictLookup(dict, (const xmlChar *)&unk_209C1ADF6, 0);
  v21 = xmlDictLookup(dict, String, -1);
  ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(String);
  return v21;
}

xmlChar *__cdecl xsltGetNsProp(xmlChar *node, const xmlChar *name, const xmlChar *nameSpace)
{
  xmlNode *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  xmlNs *ns;
  _xmlDoc *doc;
  void *DtdAttrDesc;
  const xmlChar *v12;
  const xmlChar *v13;

  if (!node)
    return node;
  v5 = (xmlNode *)node;
  if (!nameSpace)
    return xmlGetProp((const xmlNode *)node, name);
  v6 = *((_DWORD *)node + 2);
  if (v6 == 18)
    return 0;
  if (v6 != 1 || (v7 = *((_QWORD *)node + 11)) == 0)
  {
LABEL_16:
    doc = v5->doc;
    if (doc)
    {
      node = (xmlChar *)doc->intSubset;
      if (!node)
        return node;
      DtdAttrDesc = xmlGetDtdAttrDesc((xmlDtdPtr)node, v5->name, name);
      if (!DtdAttrDesc)
      {
        node = (xmlChar *)doc->extSubset;
        if (!node)
          return node;
        node = (xmlChar *)xmlGetDtdAttrDesc((xmlDtdPtr)node, v5->name, name);
        DtdAttrDesc = node;
        if (!node)
          return node;
      }
      v12 = (const xmlChar *)*((_QWORD *)DtdAttrDesc + 13);
      if (v12)
      {
        node = (xmlChar *)xmlSearchNs(doc, v5, v12);
        if (!node)
          return node;
        if (xmlStrEqual(*((const xmlChar **)node + 2), nameSpace))
        {
          v13 = (const xmlChar *)*((_QWORD *)DtdAttrDesc + 11);
          return xmlStrdup(v13);
        }
      }
    }
    return 0;
  }
  while (1)
  {
    if (!xmlStrEqual(*(const xmlChar **)(v7 + 16), name))
      goto LABEL_9;
    v8 = *(_QWORD *)(v7 + 72);
    if (!v8)
      break;
LABEL_8:
    if (xmlStrEqual(*(const xmlChar **)(v8 + 16), nameSpace))
      goto LABEL_28;
LABEL_9:
    v7 = *(_QWORD *)(v7 + 48);
    if (!v7)
      goto LABEL_16;
  }
  ns = v5->ns;
  if (!ns)
    goto LABEL_9;
  if (!xmlStrEqual(ns->href, nameSpace))
  {
    v8 = *(_QWORD *)(v7 + 72);
    if (!v8)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_28:
  node = xmlNodeListGetString(v5->doc, *(const xmlNode **)(v7 + 24), 1);
  if (!node)
  {
    v13 = (const xmlChar *)&unk_209C1ADF6;
    return xmlStrdup(v13);
  }
  return node;
}

int xsltGetUTF8Char(const unsigned __int8 *utf, int *len)
{
  unsigned int v2;
  int v3;
  int v5;
  unsigned __int8 v6;

  if (!utf || !len)
  {
    if (!len)
      return -1;
LABEL_7:
    *len = 0;
    return -1;
  }
  v2 = *len;
  if (*len < 1)
    goto LABEL_7;
  v3 = *utf;
  if (*(char *)utf < 0)
  {
    if (v2 >= 2 && (utf[1] & 0xC0) == 0x80)
    {
      if ((~v3 & 0xE0) != 0)
      {
        *len = 2;
        return utf[1] & 0x3F | ((*utf & 0x1F) << 6);
      }
      if (v2 >= 3 && (utf[2] & 0xC0) == 0x80)
      {
        if ((~v3 & 0xF0) != 0)
        {
          *len = 3;
          v5 = ((*utf & 0xF) << 12) | ((utf[1] & 0x3F) << 6);
          v6 = utf[2];
          return v5 & 0xFFFFFFC0 | v6 & 0x3F;
        }
        if (v2 >= 4 && (v3 & 0xF8) == 0xF0 && (utf[3] & 0xC0) == 0x80)
        {
          *len = 4;
          v5 = ((*utf & 7) << 18) | ((utf[1] & 0x3F) << 12) | ((utf[2] & 0x3F) << 6);
          v6 = utf[3];
          return v5 & 0xFFFFFFC0 | v6 & 0x3F;
        }
      }
    }
    goto LABEL_7;
  }
  *len = 1;
  return v3;
}

void xsltMessage(xsltTransformContextPtr ctxt, xmlNodePtr node, xmlNodePtr inst)
{
  xmlGenericErrorFunc error;
  xmlGenericErrorFunc v7;
  void **p_errctx;
  void *v9;
  xmlChar *NsProp;
  void (**v11)(const xmlChar *);
  const xmlChar *v12;
  int v13;
  xmlChar *v14;
  const char *v15;
  int v16;

  if (ctxt && inst)
  {
    error = ctxt->error;
    if (error)
      v7 = ctxt->error;
    else
      v7 = xsltGenericError;
    p_errctx = &xsltGenericErrorContext;
    if (error)
      p_errctx = &ctxt->errctx;
    v9 = *p_errctx;
    NsProp = xmlGetNsProp(inst, (const xmlChar *)"terminate", 0);
    v11 = (void (**)(const xmlChar *))MEMORY[0x24BEDE758];
    if (NsProp)
    {
      v12 = NsProp;
      if (xmlStrEqual(NsProp, (const xmlChar *)"yes"))
      {
        v13 = 1;
      }
      else
      {
        if (!xmlStrEqual(v12, (const xmlChar *)"no"))
          xsltTransformError(ctxt, 0, inst, "xsl:message : terminate expecting 'yes' or 'no'\n");
        v13 = 0;
      }
      (*v11)(v12);
    }
    else
    {
      v13 = 0;
    }
    v14 = xsltEvalTemplateString(ctxt, node, inst);
    if (v14)
    {
      v15 = (const char *)v14;
      v16 = xmlStrlen(v14);
      v7(v9, "%s", v15);
      if (v16 >= 1 && v15[v16 - 1] != 10)
        v7(v9, "\n");
      (*v11)((const xmlChar *)v15);
    }
    if (v13)
      ctxt->state = XSLT_STATE_STOPPED;
  }
}

void xsltTransformError(xsltTransformContextPtr ctxt, xsltStylesheetPtr style, xmlNodePtr node, const char *msg, ...)
{
  xmlGenericErrorFunc error;
  void *errctx;
  char *v7;
  int v8;
  uint64_t (**v9)(const char *, _QWORD);
  const char *v10;
  int v11;
  int v12;
  va_list va;

  va_start(va, msg);
  error = xsltGenericError;
  errctx = xsltGenericErrorContext;
  if (ctxt)
  {
    if (ctxt->state == XSLT_STATE_OK)
      ctxt->state = XSLT_STATE_ERROR;
    if (ctxt->error)
    {
      errctx = ctxt->errctx;
      error = ctxt->error;
    }
    if (!node)
      node = ctxt->inst;
  }
  xsltPrintErrorContext(ctxt, style, node);
  v7 = (char *)((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(150);
  if (v7)
  {
    v8 = 150;
    v9 = (uint64_t (**)(const char *, _QWORD))MEMORY[0x24BEDEB10];
    while (1)
    {
      v10 = v7;
      if (v8 > 63999)
        break;
      v11 = vsnprintf(v7, v8, msg, va);
      if ((v11 & 0x80000000) == 0 && v11 < v8)
        break;
      if (v11 >= 0)
        v12 = v11 + 1;
      else
        v12 = 100;
      v8 += v12;
      v7 = (char *)(*v9)(v10, v8);
      if (!v7)
        goto LABEL_19;
    }
    error(errctx, "%s", v10);
LABEL_19:
    ((void (*)(const char *))*MEMORY[0x24BEDE758])(v10);
  }
}

uint64_t xsltGenericErrorDefaultFunc(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (!xsltGenericErrorContext)
    xsltGenericErrorContext = (void *)*MEMORY[0x24BDAC8D8];
  return vfprintf((FILE *)xsltGenericErrorContext, a2, &a9);
}

void xsltSetGenericErrorFunc(void *ctx, xmlGenericErrorFunc handler)
{
  void (*v2)(void *, const char *, ...);

  xsltGenericErrorContext = ctx;
  v2 = (void (*)(void *, const char *, ...))xsltGenericErrorDefaultFunc;
  if (handler)
    v2 = handler;
  xsltGenericError = v2;
}

uint64_t xsltGenericDebugDefaultFunc(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t result;

  if (xsltGenericDebugContext)
    return vfprintf((FILE *)xsltGenericDebugContext, a2, &a9);
  return result;
}

void xsltSetGenericDebugFunc(void *ctx, xmlGenericErrorFunc handler)
{
  void (*v2)(void *, const char *, ...);

  xsltGenericDebugContext = ctx;
  v2 = (void (*)(void *, const char *, ...))xsltGenericDebugDefaultFunc;
  if (handler)
    v2 = handler;
  xsltGenericDebug = v2;
}

void xsltPrintErrorContext(xsltTransformContextPtr ctxt, xsltStylesheetPtr style, xmlNodePtr node)
{
  xmlNodePtr inst;
  xmlGenericErrorFunc error;
  void *errctx;
  uint64_t LineNo;
  const xmlChar *v7;
  _QWORD *name;
  BOOL v9;
  int v10;
  const char *v11;

  inst = node;
  error = xsltGenericError;
  errctx = xsltGenericErrorContext;
  if (ctxt)
  {
    if (ctxt->state == XSLT_STATE_OK)
      ctxt->state = XSLT_STATE_ERROR;
    if (ctxt->error)
    {
      errctx = ctxt->errctx;
      error = ctxt->error;
    }
    if (node)
      goto LABEL_9;
    inst = ctxt->inst;
  }
  if (!inst)
  {
    LineNo = 0;
    name = 0;
    v7 = 0;
    goto LABEL_15;
  }
LABEL_9:
  if ((inst->type | 4) == 0xD)
  {
    LineNo = 0;
    v7 = 0;
    name = inst[1].name;
  }
  else
  {
    LineNo = xmlGetLineNo(inst);
    name = &inst->doc->_private;
    if (name)
      name = (_QWORD *)name[17];
    v7 = inst->name;
  }
LABEL_15:
  if (name)
    v9 = LineNo == 0;
  else
    v9 = 1;
  v10 = !v9;
  if (v9 || !v7)
  {
    if (name && v7)
    {
      v11 = "%s: file %s element %s\n";
    }
    else if (v10)
    {
      v11 = "%s: file %s line %ld\n";
    }
    else if (name)
    {
      v11 = "%s: file %s\n";
    }
    else if (v7)
    {
      v11 = "%s: element %s\n";
    }
    else
    {
      v11 = "%s\n";
    }
  }
  else
  {
    v11 = "%s: file %s line %ld element %s\n";
  }
  error(errctx, v11);
}

void xsltSetTransformErrorFunc(xsltTransformContextPtr ctxt, void *ctx, xmlGenericErrorFunc handler)
{
  ctxt->error = handler;
  ctxt->errctx = ctx;
}

const xmlChar *__cdecl xsltSplitQName(xmlDictPtr dict, const xmlChar *name, const xmlChar **prefix)
{
  const xmlChar *v3;
  xmlDict *v4;
  int v5;
  uint64_t v7;

  *prefix = 0;
  if (!dict)
    return 0;
  v3 = name;
  if (!name)
    return 0;
  v4 = dict;
  v5 = *name;
  if (v5 != 58)
  {
    v7 = 1;
    if (*name)
    {
      while (v5 != 58)
      {
        v5 = name[v7++];
        if (!v5)
          return xmlDictLookup(dict, name, -1);
      }
      *prefix = xmlDictLookup(dict, name, (int)v7 - 1);
      name = &v3[v7];
      dict = v4;
    }
  }
  return xmlDictLookup(dict, name, -1);
}

const xmlChar *__cdecl xsltGetQNameURI(xmlNodePtr node, xmlChar **name)
{
  xmlChar *v3;
  int v4;
  const xmlChar *result;
  uint64_t v6;
  int v7;
  xmlChar *v8;
  xmlNsPtr v9;
  xmlNsPtr v10;

  if (!name)
    return 0;
  v3 = *name;
  if (!*name)
    return 0;
  v4 = *v3;
  if (!*v3)
    return 0;
  if (!node)
  {
    xsltGenericError(xsltGenericErrorContext, "QName: no element for namespace lookup %s\n", (const char *)*name);
    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v3);
    result = 0;
    *name = 0;
    return result;
  }
  if (v4 == 58)
    return 0;
  v6 = 0;
  v7 = *v3;
  if (!*v3)
    return 0;
  while (v7 != 58)
  {
    v8 = &v3[v6++];
    v7 = v8[1];
    if (!v7)
      return 0;
  }
  if (v4 == 120 && v3[1] == 109 && v3[2] == 108 && v3[3] == 58)
  {
    if (v3[4])
    {
      *name = xmlStrdup(v3 + 4);
      ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v3);
      return (const xmlChar *)"http://www.w3.org/XML/1998/namespace";
    }
    return 0;
  }
  v3[v6] = 0;
  v9 = xmlSearchNs(node->doc, node, v3);
  if (!v9)
  {
    xsltGenericError(xsltGenericErrorContext, "%s:%s : no namespace bound to prefix %s\n", (const char *)v3, (const char *)&v3[(v6 + 1)], (const char *)v3);
    *name = 0;
    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v3);
    return 0;
  }
  v10 = v9;
  *name = xmlStrdup(&v3[(v6 + 1)]);
  ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v3);
  return v10->href;
}

const xmlChar *__cdecl xsltGetQNameURI2(xsltStylesheetPtr style, xmlNodePtr node, const xmlChar **name)
{
  const xmlChar *v4;
  uint64_t v7;
  int v8;
  const xmlChar *result;
  const xmlChar *v10;
  int v11;
  xmlChar *v12;
  xmlNsPtr v13;
  xmlNsPtr v14;

  if (!name)
    return 0;
  v4 = *name;
  if (*name && *v4)
  {
    if (!node)
    {
      xsltGenericError(xsltGenericErrorContext, "QName: no element for namespace lookup %s\n", (const char *)*name);
      result = 0;
      *name = 0;
      return result;
    }
    v7 = 1;
    v8 = *v4;
    if (*v4)
    {
      while (v8 != 58)
      {
        v8 = v4[v7++];
        if (!v8)
          return 0;
      }
      if (*v4 == 120 && v4[1] == 109 && v4[2] == 108 && v4[3] == 58)
      {
        v11 = v4[4];
        v10 = v4 + 4;
        if (v11)
        {
          *name = xmlDictLookup(style->dict, v10, -1);
          return (const xmlChar *)"http://www.w3.org/XML/1998/namespace";
        }
      }
      else
      {
        v12 = xmlStrndup(*name, (int)v7 - 1);
        v13 = xmlSearchNs(node->doc, node, v12);
        if (v13)
        {
          v14 = v13;
          *name = xmlDictLookup(style->dict, &(*name)[v7], -1);
          ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v12);
          return v14->href;
        }
        if (style)
        {
          xsltTransformError(0, style, node, "No namespace bound to prefix '%s'.\n", (const char *)v12);
          ++style->errors;
        }
        else
        {
          xsltGenericError(xsltGenericErrorContext, "%s : no namespace bound to prefix %s\n", (const char *)*name, (const char *)v12);
        }
        *name = 0;
        ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v12);
      }
    }
  }
  return 0;
}

void xsltDocumentSortFunction(xmlNodeSetPtr list)
{
  unint64_t nodeNr;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  xmlNodePtr *nodeTab;
  xmlNode *v8;

  if (list)
  {
    nodeNr = list->nodeNr;
    if ((int)nodeNr >= 2)
    {
      v3 = 0;
      v4 = 1;
      do
      {
        v5 = v3 + 1;
        if (v3 + 1 < nodeNr)
        {
          v6 = v4;
          do
          {
            if (xmlXPathCmpNodes(list->nodeTab[v3], list->nodeTab[v6]) == -1)
            {
              nodeTab = list->nodeTab;
              v8 = nodeTab[v3];
              nodeTab[v3] = nodeTab[v6];
              list->nodeTab[v6] = v8;
            }
            ++v6;
          }
          while (nodeNr != v6);
        }
        ++v4;
        ++v3;
      }
      while (v5 != (_DWORD)nodeNr - 1);
    }
  }
}

xmlXPathObjectPtr *__cdecl xsltComputeSortResult(xsltTransformContextPtr ctxt, xmlNodePtr sort)
{
  return (xmlXPathObjectPtr *)xsltComputeSortResultInternal((uint64_t)ctxt, (uint64_t)sort, 0);
}

uint64_t xsltComputeSortResultInternal(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  unsigned int *v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  xmlXPathContext *v13;
  uint64_t v14;
  xmlNode *v15;
  xmlXPathCompExpr *v16;
  xmlXPathObject *v17;
  xmlXPathObjectPtr v18;
  xmlXPathObjectPtr v19;
  int v20;
  void *v21;
  const xmlChar *stringval;
  const xmlChar *v23;
  uint64_t v24;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;

  v3 = *(_QWORD *)(a2 + 104);
  if (!v3)
  {
    xsltGenericError(xsltGenericErrorContext, "xsl:sort : compilation failed\n");
    return 0;
  }
  if (!*(_QWORD *)(v3 + 184))
    return 0;
  if (!*(_QWORD *)(v3 + 304))
    return 0;
  v5 = *(unsigned int **)(a1 + 136);
  if (!v5)
    return 0;
  v6 = *v5;
  if ((int)v6 < 2)
    return 0;
  v9 = ((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(8 * v6);
  if (!v9)
  {
    xsltGenericError(xsltGenericErrorContext, "xsltComputeSortResult: memory allocation failure\n");
    return v9;
  }
  v10 = 0;
  v28 = *(_QWORD *)(a1 + 184);
  v29 = *(_QWORD *)(a1 + 128);
  v11 = *(_QWORD *)(a1 + 160);
  v12 = *(_QWORD *)(v11 + 104);
  v27 = *(_DWORD *)(v11 + 88);
  v26 = *(_QWORD *)(v11 + 80);
  v30 = a3;
  do
  {
    *(_QWORD *)(a1 + 184) = a2;
    v13 = *(xmlXPathContext **)(a1 + 160);
    v14 = v10 + 1;
    v13->contextSize = v6;
    v13->proximityPosition = v10 + 1;
    v15 = *(xmlNode **)(*((_QWORD *)v5 + 1) + 8 * v10);
    *(_QWORD *)(a1 + 128) = v15;
    v13->node = v15;
    v16 = *(xmlXPathCompExpr **)(v3 + 304);
    v13->namespaces = *(xmlNsPtr **)(v3 + 312);
    v13->nsNr = *(_DWORD *)(v3 + 320);
    v17 = xmlXPathCompiledEval(v16, v13);
    if (!v17)
    {
      *(_DWORD *)(a1 + 168) = 2;
      goto LABEL_22;
    }
    v18 = v17;
    if (v17->type != XPATH_STRING)
      v18 = xmlXPathConvertString(v17);
    if (*(_DWORD *)(v3 + 44))
    {
      v19 = xmlXPathConvertNumber(v18);
      v18 = v19;
      v20 = *(_DWORD *)(v3 + 44);
      v19->index = v10;
      if (v20)
      {
        if (v19->type == XPATH_NUMBER)
          goto LABEL_21;
        goto LABEL_22;
      }
    }
    else
    {
      v18->index = v10;
    }
    if (v18->type == XPATH_STRING)
    {
      if (a3)
      {
        v21 = *(void **)(v3 + 80);
        if (v21)
        {
          stringval = v18->stringval;
          v18->stringval = xsltStrxfrm(v21, stringval);
          v23 = stringval;
          a3 = v30;
          ((void (*)(const xmlChar *))*MEMORY[0x24BEDE758])(v23);
        }
      }
LABEL_21:
      *(_QWORD *)(v9 + 8 * v10) = v18;
      goto LABEL_23;
    }
LABEL_22:
    *(_QWORD *)(v9 + 8 * v10) = 0;
LABEL_23:
    ++v10;
  }
  while (v6 != v14);
  v24 = *(_QWORD *)(a1 + 160);
  *(_QWORD *)(a1 + 128) = v29;
  *(_QWORD *)(a1 + 184) = v28;
  *(_QWORD *)(v24 + 104) = v12;
  *(_DWORD *)(v24 + 88) = v27;
  *(_QWORD *)(v24 + 80) = v26;
  return v9;
}

void xsltDefaultSortFunction(xsltTransformContextPtr ctxt, xmlNodePtr *sorts, int nbsorts)
{
  int v3;
  xmlNodeSetPtr nodeList;
  uint64_t v5;
  xmlNodePtr v6;
  void *psvi;
  xmlChar *v8;
  int v9;
  xmlChar *v10;
  int v11;
  xmlChar *v12;
  xmlChar *v13;
  xmlNodeSetPtr v14;
  uint64_t v15;
  uint64_t v16;
  _DWORD *v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  int IsNaN;
  unint64_t v25;
  int v26;
  int v27;
  void *v28;
  uint64_t v29;
  double v30;
  double v31;
  int v32;
  int v33;
  xmlNodePtr *v34;
  xmlNodePtr v35;
  uint64_t *v36;
  uint64_t v37;
  int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  int v44;
  int v45;
  void *v46;
  double v47;
  double v48;
  int v49;
  xmlNode *v50;
  uint64_t v51;
  int v52;
  xmlNodePtr *nodeTab;
  xmlNode *v54;
  uint64_t v55;
  xmlNodePtr *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (**v61)(uint64_t);
  void *v62;
  uint64_t v63;
  uint64_t v64;
  xmlXPathObject **v65;
  xmlXPathObject *v66;
  unsigned int v67;
  uint64_t v68;
  uint64_t nodeNr;
  uint64_t v71;
  int v73;
  xmlNodeSetPtr v74;
  int v75;
  int v76;
  unint64_t v77;
  _OWORD v78[4];
  _OWORD v79[4];
  _OWORD v80[4];
  _BYTE v81[120];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  memset(v79, 0, 60);
  memset(v78, 0, 60);
  if (!ctxt)
    return;
  if (!sorts)
    return;
  v3 = nbsorts;
  if ((nbsorts - 15) < 0xFFFFFFF2)
    return;
  if (!*sorts)
    return;
  if (!(*sorts)->psvi)
    return;
  nodeList = ctxt->nodeList;
  if (!nodeList || nodeList->nodeNr < 2)
    return;
  v74 = ctxt->nodeList;
  v5 = 0;
  v68 = nbsorts;
  memset(v80, 0, 60);
  do
  {
    v6 = sorts[v5];
    psvi = v6->psvi;
    *((_DWORD *)v80 + v5) = 0;
    if (!*((_QWORD *)psvi + 4))
    {
      if (*((_DWORD *)psvi + 10))
      {
        v8 = xsltEvalAttrValueTemplate(ctxt, v6, (const xmlChar *)"data-type", 0);
        *((_QWORD *)psvi + 4) = v8;
        if (v8)
        {
          *((_DWORD *)v80 + v5) = 1;
          if (!xmlStrEqual(v8, (const xmlChar *)"text"))
          {
            if (xmlStrEqual(*((const xmlChar **)psvi + 4), (const xmlChar *)"number"))
            {
              v9 = 1;
              goto LABEL_27;
            }
            xsltTransformError(ctxt, 0, sorts[v5], "xsltDoSortFunction: no support for data-type = %s\n", *((const char **)psvi + 4));
          }
          v9 = 0;
LABEL_27:
          *((_DWORD *)psvi + 11) = v9;
        }
      }
    }
    *((_DWORD *)v79 + v5) = 0;
    if (!*((_QWORD *)psvi + 6))
    {
      if (*((_DWORD *)psvi + 14))
      {
        v10 = xsltEvalAttrValueTemplate(ctxt, sorts[v5], (const xmlChar *)"order", 0);
        *((_QWORD *)psvi + 6) = v10;
        if (v10)
        {
          *((_DWORD *)v79 + v5) = 1;
          if (!xmlStrEqual(v10, (const xmlChar *)"ascending"))
          {
            if (xmlStrEqual(*((const xmlChar **)psvi + 6), (const xmlChar *)"descending"))
            {
              v11 = 1;
              goto LABEL_30;
            }
            xsltTransformError(ctxt, 0, sorts[v5], "xsltDoSortFunction: invalid value %s for order\n", *((const char **)psvi + 6));
          }
          v11 = 0;
LABEL_30:
          *((_DWORD *)psvi + 15) = v11;
        }
      }
    }
    *((_DWORD *)v78 + v5) = 0;
    if (!*((_QWORD *)psvi + 8))
    {
      if (*((_DWORD *)psvi + 18))
      {
        v12 = xsltEvalAttrValueTemplate(ctxt, sorts[v5], (const xmlChar *)"lang", 0);
        if (v12)
        {
          v13 = v12;
          *((_DWORD *)v78 + v5) = 1;
          *((_QWORD *)psvi + 10) = xsltNewLocale(v12);
          ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v13);
        }
      }
    }
    ++v5;
  }
  while (v68 != v5);
  memset(v81, 0, sizeof(v81));
  v14 = v74;
  nodeNr = v74->nodeNr;
  v15 = xsltComputeSortResultInternal((uint64_t)ctxt, (uint64_t)*sorts, 1);
  *(_QWORD *)v81 = v15;
  memset(&v81[8], 0, 112);
  if (v15 && (int)nodeNr >= 2)
  {
    v16 = v15;
    v17 = (*sorts)->psvi;
    v75 = v17[15];
    v76 = v17[11];
    v18 = nodeNr;
    v73 = v3;
    do
    {
      v67 = v18;
      v19 = v18 >> 1;
      if ((int)(v18 >> 1) < (int)nodeNr)
      {
        v20 = v18 >> 1;
        do
        {
          v71 = v20;
          if (*(_QWORD *)(v16 + 8 * v20))
          {
            v21 = v20 - v19;
            do
            {
              v22 = *(_QWORD *)(v16 + 8 * v21);
              v23 = v21;
              if (v22)
              {
                if (v76)
                {
                  IsNaN = xmlXPathIsNaN(*(double *)(v22 + 24));
                  v25 = (int)v23 + (unint64_t)v19;
                  v26 = xmlXPathIsNaN(*(double *)(*(_QWORD *)(v16 + 8 * v25) + 24));
                  if (IsNaN)
                  {
                    if (v26)
                      v27 = 0;
                    else
                      v27 = -1;
                  }
                  else if (v26)
                  {
                    v27 = 1;
                  }
                  else
                  {
                    v30 = *(double *)(*(_QWORD *)(v16 + 8 * v23) + 24);
                    v31 = *(double *)(*(_QWORD *)(v16 + 8 * v25) + 24);
                    if (v30 > v31)
                      v32 = 1;
                    else
                      v32 = -1;
                    if (v30 == v31)
                      v27 = 0;
                    else
                      v27 = v32;
                  }
                }
                else
                {
                  v28 = (void *)*((_QWORD *)v17 + 10);
                  v29 = *(_QWORD *)(v16 + 8 * (int)(v21 + v19));
                  if (v28)
                    v27 = xsltLocaleStrcmp(v28, *(const xsltLocaleChar **)(v22 + 32), *(const xsltLocaleChar **)(v29 + 32));
                  else
                    v27 = xmlStrcmp(*(const xmlChar **)(v22 + 32), *(const xmlChar **)(v29 + 32));
                }
                if (v75)
                  v33 = -v27;
                else
                  v33 = v27;
                if (!v33)
                {
                  v77 = (int)v23 + (unint64_t)v19;
                  if (v3 >= 2)
                  {
                    v34 = sorts + 2;
                    v35 = sorts[1];
                    v36 = (uint64_t *)&v81[8];
                    v37 = v68 - 2;
                    if (v35)
                    {
                      while (1)
                      {
                        v17 = v35->psvi;
                        if (!v17)
                          break;
                        v38 = v17[15];
                        v39 = v17[11];
                        v40 = *v36;
                        if (!*v36)
                        {
                          v40 = xsltComputeSortResultInternal((uint64_t)ctxt, (uint64_t)v35, 1);
                          *v36 = v40;
                          if (!v40)
                            break;
                        }
                        v41 = *(_QWORD *)(v40 + 8 * v23);
                        v42 = *(_QWORD *)(v40 + 8 * v77);
                        if (v41)
                        {
                          if (!v42)
                          {
                            v3 = v73;
                            v14 = v74;
                            goto LABEL_103;
                          }
                          if (v39)
                          {
                            v43 = xmlXPathIsNaN(*(double *)(v41 + 24));
                            v44 = xmlXPathIsNaN(*(double *)(*(_QWORD *)(v40 + 8 * v77) + 24));
                            if (v43)
                            {
                              if (v44)
                                v45 = 0;
                              else
                                v45 = -1;
                            }
                            else if (v44)
                            {
                              v45 = 1;
                            }
                            else
                            {
                              v47 = *(double *)(*(_QWORD *)(v40 + 8 * v23) + 24);
                              v48 = *(double *)(*(_QWORD *)(v40 + 8 * v77) + 24);
                              if (v47 > v48)
                                v49 = 1;
                              else
                                v49 = -1;
                              if (v47 == v48)
                                v45 = 0;
                              else
                                v45 = v49;
                            }
                          }
                          else
                          {
                            v46 = (void *)*((_QWORD *)v17 + 10);
                            if (v46)
                              v45 = xsltLocaleStrcmp(v46, *(const xsltLocaleChar **)(v41 + 32), *(const xsltLocaleChar **)(v42 + 32));
                            else
                              v45 = xmlStrcmp(*(const xmlChar **)(v41 + 32), *(const xmlChar **)(v42 + 32));
                          }
                          if (v38)
                            v33 = -v45;
                          else
                            v33 = v45;
                          if (v33)
                            goto LABEL_93;
                        }
                        else if (v42)
                        {
                          v3 = v73;
                          v14 = v74;
                          goto LABEL_95;
                        }
                        if (v37)
                        {
                          v50 = *v34++;
                          v35 = v50;
                          --v37;
                          ++v36;
                          if (v50)
                            continue;
                        }
                        break;
                      }
                    }
                  }
                  v33 = *(_DWORD *)(*(_QWORD *)(v16 + 8 * v23) + 48) > *(_DWORD *)(*(_QWORD *)(v16 + 8 * v77) + 48);
LABEL_93:
                  v3 = v73;
                  v14 = v74;
                }
                if (v33 < 1)
                  break;
              }
LABEL_95:
              v51 = *(_QWORD *)(v16 + 8 * v23);
              v52 = v23 + v19;
              *(_QWORD *)(v16 + 8 * v23) = *(_QWORD *)(v16 + 8 * (int)(v23 + v19));
              *(_QWORD *)(v16 + 8 * v52) = v51;
              nodeTab = v14->nodeTab;
              v54 = nodeTab[v23];
              nodeTab[v23] = nodeTab[(int)(v23 + v19)];
              v14->nodeTab[v52] = v54;
              if (v3 >= 2)
              {
                v55 = v68 - 1;
                v56 = sorts + 1;
                v57 = (uint64_t *)&v81[8];
                do
                {
                  if (!*v56)
                    break;
                  v58 = *v57;
                  if (!*v57)
                    break;
                  v59 = *(_QWORD *)(v58 + 8 * v23);
                  *(_QWORD *)(v58 + 8 * v23) = *(_QWORD *)(v58 + 8 * v52);
                  *(_QWORD *)(v58 + 8 * v52) = v59;
                  ++v57;
                  ++v56;
                  --v55;
                }
                while (v55);
              }
              v21 = v23 - v19;
            }
            while ((int)(v23 - v19) >= 0);
          }
LABEL_103:
          v20 = v71 + 1;
        }
        while ((_DWORD)nodeNr != (_DWORD)v71 + 1);
      }
      v18 = v19;
    }
    while (v67 > 3);
  }
  v60 = 0;
  v61 = (void (**)(uint64_t))MEMORY[0x24BEDE758];
  do
  {
    v62 = sorts[v60]->psvi;
    if (*((_DWORD *)v80 + v60) == 1)
    {
      (*v61)(*((_QWORD *)v62 + 4));
      *((_QWORD *)v62 + 4) = 0;
    }
    if (*((_DWORD *)v79 + v60) == 1)
    {
      (*v61)(*((_QWORD *)v62 + 6));
      *((_QWORD *)v62 + 6) = 0;
    }
    if (*((_DWORD *)v78 + v60) == 1)
    {
      xsltFreeLocale(*((xsltLocale *)v62 + 10));
      *((_QWORD *)v62 + 10) = 0;
    }
    v63 = *(_QWORD *)&v81[8 * v60];
    if (v63)
    {
      if ((int)nodeNr >= 1)
      {
        v64 = nodeNr;
        v65 = *(xmlXPathObject ***)&v81[8 * v60];
        do
        {
          v66 = *v65++;
          xmlXPathFreeObject(v66);
          --v64;
        }
        while (v64);
      }
      (*v61)(v63);
    }
    ++v60;
  }
  while (v60 != v68);
}

void xsltDoSortFunction(xsltTransformContextPtr ctxt, xmlNodePtr *sorts, int nbsorts)
{
  void (*sortfunc)(void);

  sortfunc = (void (*)(void))ctxt->sortfunc;
  if (sortfunc || (sortfunc = (void (*)(void))xsltSortFunction) != 0)
    sortfunc();
}

void xsltSetSortFunc(xsltSortFunc handler)
{
  void (__cdecl *v1)(xsltTransformContextPtr, xmlNodePtr *, int);

  v1 = xsltDefaultSortFunction;
  if (handler)
    v1 = handler;
  xsltSortFunction = (uint64_t)v1;
}

void xsltSetCtxtSortFunc(xsltTransformContextPtr ctxt, xsltSortFunc handler)
{
  ctxt->sortfunc = handler;
}

int xsltSetCtxtParseOptions(xsltTransformContextPtr ctxt, int options)
{
  int result;

  if (!ctxt)
    return -1;
  if (ctxt->xinclude)
    result = ctxt->parserOptions | 0x400;
  else
    result = ctxt->parserOptions;
  ctxt->parserOptions = options;
  ctxt->xinclude = (options >> 10) & 1;
  return result;
}

int xsltSaveResultTo(xmlOutputBufferPtr buf, xmlDocPtr result, xsltStylesheetPtr style)
{
  int v4;
  xsltStylesheetPtr v6;
  _xmlNode *children;
  xmlChar *method;
  int written;
  xsltStylesheetPtr Import;
  const xmlChar *v11;
  xsltStylesheetPtr v12;
  const char *encoding;
  xsltStylesheetPtr v14;
  int indent;
  xsltStylesheetPtr v16;
  const xmlChar *v17;
  int v18;
  const xmlChar *v19;
  int v20;
  _xmlNode *next;
  _xmlNode *v22;
  unsigned int type;
  BOOL v24;
  int v25;
  int omitXmlDeclaration;
  int standalone;
  const char *v29;
  const char *v30;
  _xmlNode *v31;
  _xmlNode *v32;
  xmlElementType v33;
  xmlCharEncoding charset;

  v4 = -1;
  if (buf)
  {
    if (result)
    {
      v6 = style;
      if (style)
      {
        children = result->children;
        if (!children || children->type == XML_DTD_NODE && !children->next)
          return 0;
        if (style->methodURI)
        {
          method = style->method;
          if (!method || !xmlStrEqual(method, (const xmlChar *)"xhtml"))
          {
            xsltGenericError(xsltGenericErrorContext, "xsltSaveResultTo : unknown output method\n");
            return -1;
          }
        }
        written = buf->written;
        Import = v6;
        do
        {
          v11 = Import->method;
          if (v11)
            break;
          Import = xsltNextImport(Import);
        }
        while (Import);
        v12 = v6;
        do
        {
          encoding = (const char *)v12->encoding;
          if (encoding)
            break;
          v12 = xsltNextImport(v12);
        }
        while (v12);
        v14 = v6;
        do
        {
          indent = v14->indent;
          if (indent != -1)
            break;
          v14 = xsltNextImport(v14);
        }
        while (v14);
        if (!v11)
        {
          v16 = v6;
          if (result->type != XML_HTML_DOCUMENT_NODE)
            goto LABEL_50;
          v11 = (const xmlChar *)"html";
        }
        if (xmlStrEqual(v11, (const xmlChar *)"html"))
        {
          if (encoding)
            v17 = (const xmlChar *)encoding;
          else
            v17 = (const xmlChar *)"UTF-8";
          htmlSetMetaEncoding(result, v17);
          if (indent == -1)
            v18 = 1;
          else
            v18 = indent;
          htmlDocContentDumpFormatOutput(buf, result, encoding, v18);
LABEL_79:
          xmlOutputBufferFlush(buf);
          return buf->written - written;
        }
        if (xmlStrEqual(v11, (const xmlChar *)"xhtml"))
        {
          if (encoding)
            v19 = (const xmlChar *)encoding;
          else
            v19 = (const xmlChar *)"UTF-8";
          htmlSetMetaEncoding(result, v19);
          htmlDocContentDumpOutput(buf, result, encoding);
          goto LABEL_79;
        }
        v20 = xmlStrEqual(v11, (const xmlChar *)"text");
        v16 = v6;
        if (v20)
        {
          next = result->children;
          if (next)
          {
            while (1)
            {
              do
              {
                v22 = next;
                if (next->type == XML_TEXT_NODE)
                  xmlOutputBufferWriteString(buf, (const char *)next->content);
                next = v22->children;
                if (!next)
                  break;
                type = next->type;
                v24 = type > 0x11;
                v25 = (1 << type) & 0x20060;
              }
              while (v24 || v25 == 0);
              while (1)
              {
                next = v22->next;
                if (next)
                  break;
                v22 = v22->parent;
                if (!v22 || v22 == (_xmlNode *)v6->doc)
                  goto LABEL_79;
              }
            }
          }
          goto LABEL_79;
        }
        do
        {
LABEL_50:
          omitXmlDeclaration = v16->omitXmlDeclaration;
          if (omitXmlDeclaration != -1)
            break;
          v16 = xsltNextImport(v16);
        }
        while (v16);
        do
        {
          standalone = v6->standalone;
          if (standalone != -1)
            break;
          v6 = xsltNextImport(v6);
        }
        while (v6);
        if (omitXmlDeclaration == 1)
        {
LABEL_68:
          v31 = result->children;
          if (v31)
          {
            result->children = 0;
            v32 = v31;
            do
            {
              while (1)
              {
                xmlNodeDumpOutput(buf, result, v32, 0, indent == 1, encoding);
                if (indent)
                  break;
                v32 = v32->next;
                if (!v32)
                  goto LABEL_78;
              }
              v33 = v32->type;
              if (v33 == XML_DTD_NODE || v33 == XML_COMMENT_NODE && v32->next)
                xmlOutputBufferWriteString(buf, "\n");
              v32 = v32->next;
            }
            while (v32);
            xmlOutputBufferWriteString(buf, "\n");
LABEL_78:
            result->children = v31;
          }
          goto LABEL_79;
        }
        xmlOutputBufferWriteString(buf, "<?xml version=");
        if (result->version)
        {
          v29 = "\"";
          xmlOutputBufferWriteString(buf, "\"");
          xmlOutputBufferWriteString(buf, (const char *)result->version);
        }
        else
        {
          v29 = "\"1.0\"";
        }
        xmlOutputBufferWriteString(buf, v29);
        if (encoding)
          goto LABEL_61;
        encoding = (const char *)result->encoding;
        if (encoding)
          goto LABEL_61;
        charset = result->charset;
        if (charset == XML_CHAR_ENCODING_UTF8)
        {
          encoding = 0;
        }
        else
        {
          encoding = xmlGetCharEncodingName(charset);
          if (encoding)
          {
LABEL_61:
            xmlOutputBufferWriteString(buf, " encoding=");
            xmlOutputBufferWriteString(buf, "\"");
            xmlOutputBufferWriteString(buf, encoding);
            xmlOutputBufferWriteString(buf, "\"");
          }
        }
        if (standalone)
        {
          if (standalone != 1)
          {
LABEL_67:
            xmlOutputBufferWriteString(buf, "?>\n");
            goto LABEL_68;
          }
          v30 = " standalone=\"yes\"";
        }
        else
        {
          v30 = " standalone=\"no\"";
        }
        xmlOutputBufferWriteString(buf, v30);
        goto LABEL_67;
      }
    }
  }
  return v4;
}

int xsltSaveResultToFilename(const char *URI, xmlDocPtr result, xsltStylesheetPtr style, int compression)
{
  int v5;
  xsltStylesheetPtr Import;
  xmlCharEncodingHandlerPtr CharEncodingHandler;
  xmlCharEncodingHandler *v11;
  xmlCharEncodingHandler *v12;
  xmlOutputBuffer *Filename;
  xmlOutputBuffer *v14;

  v5 = -1;
  if (URI && result && style)
  {
    if (result->children)
    {
      Import = style;
      while (!Import->encoding)
      {
        Import = xsltNextImport(Import);
        if (!Import)
          goto LABEL_14;
      }
      CharEncodingHandler = xmlFindCharEncodingHandler((const char *)Import->encoding);
      if (!CharEncodingHandler)
      {
LABEL_14:
        v12 = 0;
        goto LABEL_15;
      }
      v11 = CharEncodingHandler;
      if (xmlStrEqual((const xmlChar *)CharEncodingHandler->name, (const xmlChar *)"UTF-8"))
        v12 = 0;
      else
        v12 = v11;
LABEL_15:
      Filename = xmlOutputBufferCreateFilename(URI, v12, compression);
      if (Filename)
      {
        v14 = Filename;
        xsltSaveResultTo(Filename, result, style);
        return xmlOutputBufferClose(v14);
      }
      else
      {
        return -1;
      }
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

int xsltSaveResultToFile(FILE *file, xmlDocPtr result, xsltStylesheetPtr style)
{
  int v4;
  xsltStylesheetPtr Import;
  xmlCharEncodingHandlerPtr CharEncodingHandler;
  xmlCharEncodingHandler *v9;
  xmlCharEncodingHandler *v10;
  xmlOutputBuffer *v11;
  xmlOutputBuffer *v12;

  v4 = -1;
  if (file && result && style)
  {
    if (result->children)
    {
      Import = style;
      while (!Import->encoding)
      {
        Import = xsltNextImport(Import);
        if (!Import)
          goto LABEL_14;
      }
      CharEncodingHandler = xmlFindCharEncodingHandler((const char *)Import->encoding);
      if (!CharEncodingHandler)
      {
LABEL_14:
        v10 = 0;
        goto LABEL_15;
      }
      v9 = CharEncodingHandler;
      if (xmlStrEqual((const xmlChar *)CharEncodingHandler->name, (const xmlChar *)"UTF-8"))
        v10 = 0;
      else
        v10 = v9;
LABEL_15:
      v11 = xmlOutputBufferCreateFile(file, v10);
      if (v11)
      {
        v12 = v11;
        xsltSaveResultTo(v11, result, style);
        return xmlOutputBufferClose(v12);
      }
      else
      {
        return -1;
      }
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

int xsltSaveResultToFd(int fd, xmlDocPtr result, xsltStylesheetPtr style)
{
  int v4;
  xsltStylesheetPtr Import;
  xmlCharEncodingHandlerPtr CharEncodingHandler;
  xmlCharEncodingHandler *v9;
  xmlCharEncodingHandler *v10;
  xmlOutputBuffer *v11;
  xmlOutputBuffer *v12;

  v4 = -1;
  if ((fd & 0x80000000) == 0 && result && style)
  {
    if (result->children)
    {
      Import = style;
      while (!Import->encoding)
      {
        Import = xsltNextImport(Import);
        if (!Import)
          goto LABEL_14;
      }
      CharEncodingHandler = xmlFindCharEncodingHandler((const char *)Import->encoding);
      if (!CharEncodingHandler)
      {
LABEL_14:
        v10 = 0;
        goto LABEL_15;
      }
      v9 = CharEncodingHandler;
      if (xmlStrEqual((const xmlChar *)CharEncodingHandler->name, (const xmlChar *)"UTF-8"))
        v10 = 0;
      else
        v10 = v9;
LABEL_15:
      v11 = xmlOutputBufferCreateFd(fd, v10);
      if (v11)
      {
        v12 = v11;
        xsltSaveResultTo(v11, result, style);
        return xmlOutputBufferClose(v12);
      }
      else
      {
        return -1;
      }
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

int xsltSaveResultToString(xmlChar **doc_txt_ptr, int *doc_txt_len, xmlDocPtr result, xsltStylesheetPtr style)
{
  xsltStylesheet *Import;
  xsltStylesheet *v9;
  xmlOutputBuffer *v10;
  xmlOutputBuffer *v11;
  xmlBuf *conv;
  const xmlBuf **p_conv;
  size_t v14;
  int v15;
  xmlChar *v16;

  *doc_txt_ptr = 0;
  *doc_txt_len = 0;
  if (!result->children)
    return 0;
  if (style)
  {
    Import = style;
    while (!Import->encoding)
    {
      Import = xsltNextImport(Import);
      if (!Import)
        goto LABEL_12;
    }
    Import = (xsltStylesheet *)xmlFindCharEncodingHandler((const char *)Import->encoding);
    if (Import)
    {
      v9 = Import;
      if (xmlStrEqual((const xmlChar *)Import->parent, (const xmlChar *)"UTF-8"))
        Import = 0;
      else
        Import = v9;
    }
  }
  else
  {
    Import = 0;
  }
LABEL_12:
  v10 = xmlAllocOutputBuffer((xmlCharEncodingHandlerPtr)Import);
  if (v10)
  {
    v11 = v10;
    xsltSaveResultTo(v10, result, style);
    p_conv = &v11->conv;
    conv = v11->conv;
    if (!conv)
    {
      p_conv = &v11->buffer;
      conv = v11->buffer;
    }
    v14 = xmlBufUse(conv);
    v15 = 0x7FFFFFFF;
    if (v14 < 0x7FFFFFFF)
      v15 = v14;
    *doc_txt_len = v15;
    v16 = xmlBufContent(*p_conv);
    *doc_txt_ptr = xmlStrndup(v16, *doc_txt_len);
    xmlOutputBufferClose(v11);
    return 0;
  }
  return -1;
}

uint64_t xsltGetSourceNodeFlags(uint64_t a1)
{
  uint64_t result;
  unsigned int v3;

  result = 0;
  v3 = *(_DWORD *)(a1 + 8);
  if (v3 <= 0xD)
  {
    if (((1 << v3) & 0x19A) != 0)
    {
      return *(unsigned __int16 *)(a1 + 114) >> 12;
    }
    else if (((1 << v3) & 0x2200) != 0)
    {
      return (*(int *)(a1 + 172) >> 27);
    }
    else if (v3 == 2)
    {
      return *(_DWORD *)(a1 + 80) >> 27;
    }
  }
  return result;
}

uint64_t xsltSetSourceNodeFlags(uint64_t a1, uint64_t a2, int a3)
{
  unsigned int v3;
  uint64_t result;

  if (*(_QWORD *)(a2 + 64) == *(_QWORD *)(a1 + 416))
    *(_DWORD *)(a1 + 488) = 1;
  v3 = *(_DWORD *)(a2 + 8);
  result = 0xFFFFFFFFLL;
  if (v3 <= 0xD)
  {
    if (((1 << v3) & 0x19A) != 0)
    {
      result = 0;
      *(_WORD *)(a2 + 114) |= (_WORD)a3 << 12;
    }
    else if (((1 << v3) & 0x2200) != 0)
    {
      result = 0;
      *(_DWORD *)(a2 + 172) |= a3 << 27;
    }
    else if (v3 == 2)
    {
      result = 0;
      *(_DWORD *)(a2 + 80) |= a3 << 27;
    }
  }
  return result;
}

uint64_t xsltClearSourceNodeFlags(uint64_t a1, int a2)
{
  unsigned int v3;
  uint64_t result;

  v3 = *(_DWORD *)(a1 + 8);
  result = 0xFFFFFFFFLL;
  if (v3 <= 0xD)
  {
    if (((1 << v3) & 0x19A) != 0)
    {
      result = 0;
      *(_WORD *)(a1 + 114) &= ~((_WORD)a2 << 12);
    }
    else if (((1 << v3) & 0x2200) != 0)
    {
      result = 0;
      *(_DWORD *)(a1 + 172) &= ~(a2 << 27);
    }
    else if (v3 == 2)
    {
      result = 0;
      *(_DWORD *)(a1 + 80) &= ~(a2 << 27);
    }
  }
  return result;
}

uint64_t xsltGetPSVIPtr(uint64_t a1)
{
  unsigned int v1;
  int v2;
  BOOL v3;
  uint64_t v4;

  v1 = *(_DWORD *)(a1 + 8);
  if (v1 > 0xD)
    return 0;
  v2 = 1 << v1;
  v3 = v1 == 2;
  v4 = a1 + 88;
  if (!v3)
    v4 = 0;
  if ((v2 & 0x2200) != 0)
    v4 = a1 + 160;
  if ((v2 & 0x19A) != 0)
    return a1 + 104;
  else
    return v4;
}

void xsltCalibrateAdjust(uint64_t delta)
{
  calibration += delta;
}

uint64_t xsltTimestamp(void)
{
  int v1;
  timespec v2;

  if (calibration < 0)
  {
    clock_gettime(_CLOCK_MONOTONIC, (timespec *)&xsltTimestamp_startup);
    calibration = 0;
    v1 = 999;
    do
    {
      xsltTimestamp();
      --v1;
    }
    while (v1);
    calibration = xsltTimestamp() / 1000;
    clock_gettime(_CLOCK_MONOTONIC, (timespec *)&xsltTimestamp_startup);
    return 0;
  }
  else
  {
    v2.tv_sec = 0;
    v2.tv_nsec = 0;
    clock_gettime(_CLOCK_MONOTONIC, &v2);
    return 100000 * (v2.tv_sec - xsltTimestamp_startup) - calibration + (v2.tv_nsec - *(_QWORD *)algn_2545ADBC8) / 10000;
  }
}

void xsltSaveProfiling(xsltTransformContextPtr ctxt, FILE *output)
{
  FILE *v2;
  uint64_t (**v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  xsltStylesheetPtr style;
  int v8;
  xsltTemplatePtr templates;
  BOOL v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int v22;
  FILE *v23;
  uint64_t v24;
  const xmlChar *v25;
  FILE *v26;
  const xmlChar *v27;
  const xmlChar *v28;
  int v29;
  _DWORD *v30;
  _DWORD *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  const char *v48;
  int v49;
  const char *v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  uint64_t v56;
  uint64_t v57;
  int v58;
  uint64_t j;
  const char *v60;
  uint64_t v61;
  _QWORD *v62;
  const char *v63;
  void (**v64)(uint64_t);
  unint64_t v65;
  uint64_t v66;
  FILE *__stream;
  char v68[8];
  uint64_t v69;
  int v70;
  char v71[8];
  uint64_t v72;
  int v73;
  char __str[8];
  uint64_t v75;
  int v76;
  char v77[8];
  uint64_t v78;
  int v79;
  char v80[8];
  uint64_t v81;
  int v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  if (ctxt)
  {
    v2 = output;
    if (output)
    {
      if (ctxt->profile)
      {
        v4 = (uint64_t (**)(uint64_t))MEMORY[0x24BEDE910];
        v5 = ((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(80000);
        if (v5)
        {
          v6 = v5;
          __stream = v2;
          style = ctxt->style;
          if (ctxt->style)
          {
            v8 = 0;
            do
            {
              templates = style->templates;
              if (templates)
                v10 = v8 <= 9999;
              else
                v10 = 0;
              if (v10)
              {
                do
                {
                  if (templates->nbCalls >= 1)
                    *(_QWORD *)(v6 + 8 * v8++) = templates;
                  templates = templates->next;
                  if (templates)
                    v11 = v8 < 10000;
                  else
                    v11 = 0;
                }
                while (v11);
              }
              style = xsltNextImport(style);
            }
            while (style);
            v2 = (FILE *)v8;
            if (v8 > 1)
            {
              v12 = 0;
              v13 = v6 + 8;
              v14 = 1;
              do
              {
                v15 = v12 + 1;
                if (v12 + 1 < (unint64_t)v8)
                {
                  v16 = *(_QWORD *)(v6 + 8 * v12);
                  v17 = v8;
                  v18 = (uint64_t *)v13;
                  do
                  {
                    v19 = *v18;
                    if (*(_QWORD *)(v16 + 104) <= *(_QWORD *)(*v18 + 104))
                    {
                      *v18 = v16;
                      *(_QWORD *)(v6 + 8 * v12) = v19;
                      v16 = v19;
                    }
                    ++v18;
                    --v17;
                  }
                  while (v14 != v17);
                }
                ++v14;
                v13 += 8;
                ++v12;
              }
              while (v15 != v8 - 1);
            }
            fprintf(__stream, "%6s%20s%20s%10s  Calls Tot 100us Avg\n\n", "number", "match", "name", "mode");
            if (v8 >= 1)
            {
              v20 = 0;
              v21 = 0;
              v22 = 0;
              v23 = __stream;
              while (1)
              {
                v24 = *(_QWORD *)(v6 + 8 * v20);
                fprintf(v23, "%5d ", v20);
                v25 = *(const xmlChar **)(v24 + 16);
                if (v25)
                {
                  if (xmlStrlen(v25) >= 21)
                  {
                    fprintf(__stream, "%s\n%26s");
                    goto LABEL_35;
                  }
                  v26 = __stream;
                }
                else
                {
                  v26 = v23;
                }
                fprintf(v26, "%20s");
LABEL_35:
                v27 = *(const xmlChar **)(v24 + 32);
                if (v27 && xmlStrlen(v27) >= 21)
                  fprintf(__stream, "%s\n%46s");
                else
                  fprintf(__stream, "%20s");
                v28 = *(const xmlChar **)(v24 + 48);
                if (v28 && xmlStrlen(v28) >= 11)
                {
                  v23 = __stream;
                  fprintf(__stream, "%s\n%56s");
                }
                else
                {
                  v23 = __stream;
                  fprintf(__stream, "%10s");
                }
                fprintf(v23, " %6d", *(_DWORD *)(v24 + 96));
                fprintf(v23, " %6ld %6ld\n", *(_QWORD *)(v24 + 104), *(_QWORD *)(v24 + 104) / (unint64_t)*(int *)(v24 + 96));
                v22 += *(_DWORD *)(v24 + 96);
                v21 += *(_QWORD *)(v24 + 104);
                if (v2 == (FILE *)++v20)
                {
                  v29 = 1;
                  v4 = (uint64_t (**)(uint64_t))MEMORY[0x24BEDE910];
                  goto LABEL_47;
                }
              }
            }
            v29 = 0;
            v22 = 0;
            v21 = 0;
            v23 = __stream;
          }
          else
          {
            v23 = v2;
            fprintf(v2, "%6s%20s%20s%10s  Calls Tot 100us Avg\n\n", "number", "match", "name", "mode");
            v29 = 0;
            LODWORD(v2) = 0;
            v22 = 0;
            v21 = 0;
          }
LABEL_47:
          v65 = v21;
          fprintf(v23, "\n%30s%26s %6d %6ld\n", "Total", (const char *)&unk_209C1ADF6, v22, v21);
          v30 = (_DWORD *)(*v4)(4 * ((int)v2 + 1));
          if (v30)
          {
            v31 = v30;
            if ((v29 & 1) != 0)
            {
              v32 = 0;
              v33 = v2;
              v34 = v65;
              do
              {
                v35 = 0;
                v36 = 0;
                v37 = *(_QWORD *)(v6 + 8 * v32);
                v30[v32] = 0;
                do
                {
                  v38 = *(_QWORD *)(v6 + 8 * v36);
                  v39 = *(_DWORD *)(v38 + 120);
                  if (v39 >= 1)
                  {
                    v40 = 0;
                    v41 = *(_QWORD *)(v38 + 128);
                    do
                    {
                      if (*(_QWORD *)(v41 + 8 * v40) == v37)
                      {
                        v35 += *(_DWORD *)(v38 + 104);
                        v30[v32] = v35;
                        v39 = *(_DWORD *)(v38 + 120);
                      }
                      ++v40;
                    }
                    while (v40 < v39);
                  }
                  ++v36;
                }
                while (v36 != v2);
                ++v32;
              }
              while (v32 != v2);
              v30[v2] = 0;
              fprintf(v23, "\nindex %% time    self  children    called     name\n");
              if (v29)
              {
                v42 = 0;
                do
                {
                  *(_QWORD *)v80 = 0;
                  v81 = 0;
                  v82 = 0;
                  *(_QWORD *)v77 = 0;
                  v78 = 0;
                  v79 = 0;
                  *(_QWORD *)__str = 0;
                  v75 = 0;
                  v76 = 0;
                  *(_QWORD *)v71 = 0;
                  v72 = 0;
                  v73 = 0;
                  *(_QWORD *)v68 = 0;
                  v69 = 0;
                  v70 = 0;
                  v66 = v42;
                  v43 = *(_QWORD *)(v6 + 8 * v42);
                  if (*(int *)(v43 + 120) >= 1)
                  {
                    v44 = 0;
                    do
                    {
                      v45 = 0;
                      v46 = *(_QWORD *)(*(_QWORD *)(v43 + 128) + 8 * v44);
                      while (*(_QWORD *)(v6 + 8 * v45) != v46)
                      {
                        if (v33 == ++v45)
                        {
                          LODWORD(v45) = v33;
                          break;
                        }
                      }
                      v47 = v34;
                      if (v46)
                        v47 = *(_QWORD *)(v46 + 104);
                      snprintf(__str, 0x14uLL, "%8.3f", (float)((float)v47 / 100000.0));
                      snprintf(v71, 0x14uLL, "%8.3f", (float)((float)(int)v31[v45] / 100000.0));
                      snprintf(v68, 0x14uLL, "%6d/%d", *(_DWORD *)(*(_QWORD *)(v43 + 136) + 4 * v44), *(_DWORD *)(v43 + 96));
                      if (v46)
                      {
                        v48 = *(const char **)(v46 + 32);
                        if (!v48)
                        {
                          pretty_templ_match(v46);
                          v48 = pretty_templ_match_dst;
                        }
                      }
                      else
                      {
                        v48 = "-";
                      }
                      fprintf(v23, "             %-8s %-8s %-12s     %s [%d]\n", __str, v71, v68, v48, v45);
                      ++v44;
                    }
                    while (v44 < *(int *)(v43 + 120));
                  }
                  snprintf(v80, 0x14uLL, "[%d]", v66);
                  snprintf(v77, 0x14uLL, "%6.2f", (float)*(unint64_t *)(v43 + 104) * 100.0 / (double)v65);
                  snprintf(__str, 0x14uLL, "%8.3f", (float)((float)*(unint64_t *)(v43 + 104) / 100000.0));
                  snprintf(v71, 0x14uLL, "%8.3f", (float)((float)(int)v31[v66] / 100000.0));
                  v49 = *(_DWORD *)(v43 + 96);
                  v50 = *(const char **)(v43 + 32);
                  if (!v50)
                  {
                    pretty_templ_match(v43);
                    v50 = pretty_templ_match_dst;
                  }
                  fprintf(v23, "%-5s %-6s %-8s %-8s %6d     %s [%d]\n", v80, v77, __str, v71, v49, v50, v66);
                  v51 = 0;
                  v52 = 0;
                  do
                  {
                    v53 = *(_QWORD *)(v6 + 8 * v51);
                    v54 = *(unsigned int *)(v53 + 120);
                    if ((int)v54 >= 1)
                    {
                      for (i = 0; i != v54; ++i)
                      {
                        if (*(_QWORD *)(*(_QWORD *)(v53 + 128) + 8 * i) == v43)
                          v52 += *(_DWORD *)(*(_QWORD *)(v53 + 136) + 4 * i);
                      }
                    }
                    ++v51;
                  }
                  while (v51 != v33);
                  v56 = 0;
                  do
                  {
                    v57 = *(_QWORD *)(v6 + 8 * v56);
                    v58 = *(_DWORD *)(v57 + 120);
                    if (v58 >= 1)
                    {
                      for (j = 0; j < v58; ++j)
                      {
                        if (*(_QWORD *)(*(_QWORD *)(v57 + 128) + 8 * j) == v43)
                        {
                          snprintf(__str, 0x14uLL, "%8.3f", (float)((float)*(unint64_t *)(v57 + 104) / 100000.0));
                          snprintf(v71, 0x14uLL, "%8.3f", (float)((float)(int)v31[v56] / 100000.0));
                          snprintf(v68, 0x14uLL, "%6d/%d", *(_DWORD *)(*(_QWORD *)(v57 + 136) + 4 * j), v52);
                          v60 = *(const char **)(v57 + 32);
                          if (!v60)
                          {
                            pretty_templ_match(v57);
                            v60 = pretty_templ_match_dst;
                          }
                          fprintf(__stream, "             %-8s %-8s %-12s     %s [%d]\n", __str, v71, v68, v60, v56);
                          v58 = *(_DWORD *)(v57 + 120);
                        }
                      }
                    }
                    ++v56;
                  }
                  while (v56 != v33);
                  v23 = __stream;
                  fwrite("-----------------------------------------------\n", 0x30uLL, 1uLL, __stream);
                  v34 = v65;
                  v42 = v66 + 1;
                }
                while (v66 + 1 != v33);
                fwrite("\f\nIndex by function name\n", 0x19uLL, 1uLL, __stream);
                v61 = 0;
                do
                {
                  v62 = *(_QWORD **)(v6 + 8 * v61);
                  v63 = (const char *)v62[4];
                  if (!v63)
                  {
                    pretty_templ_match(*(_QWORD *)(v6 + 8 * v61));
                    v63 = pretty_templ_match_dst;
                  }
                  fprintf(__stream, "[%d] %s (%s:%d)\n", v61++, v63, *(const char **)(*(_QWORD *)(v62[1] + 32) + 136), *(unsigned __int16 *)(v62[9] + 112));
                }
                while (v33 != v61);
                goto LABEL_99;
              }
            }
            else
            {
              *v30 = 0;
              fprintf(v23, "\nindex %% time    self  children    called     name\n");
            }
            fwrite("\f\nIndex by function name\n", 0x19uLL, 1uLL, v23);
LABEL_99:
            fwrite("\f\n", 2uLL, 1uLL, v23);
            v64 = (void (**)(uint64_t))MEMORY[0x24BEDE758];
            ((void (*)(_DWORD *))*MEMORY[0x24BEDE758])(v31);
            (*v64)(v6);
          }
        }
      }
    }
  }
}

uint64_t pretty_templ_match(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  _BYTE *v7;
  int v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;

  v1 = 0;
  LODWORD(v2) = 0;
  v3 = *(_QWORD *)(result + 16);
  v4 = 998;
  v5 = 1u;
  while (*(_BYTE *)(v3 + (int)v2))
  {
    v2 = (int)v2;
    do
      v6 = *(unsigned __int8 *)(v3 + v2++);
    while (v6 == 32);
    pretty_templ_match_dst[v1++] = v6;
    ++v5;
    --v4;
    if (v1 == 1000)
      goto LABEL_16;
  }
  if (v1 <= 0x3E5 && *(_QWORD *)(result + 48))
  {
    pretty_templ_match_dst[v1] = 91;
    v7 = *(_BYTE **)(result + 48);
    LOBYTE(v8) = *v7;
    if (*v7)
    {
      v9 = 0;
      v10 = v7 + 1;
      v11 = v4 - 1;
      v5 = 0x3E7u;
      while (1)
      {
        pretty_templ_match_dst[v1 + 1 + v9] = v8;
        if (v11 == v9)
          break;
        v8 = v10[v9++];
        if (!v8)
        {
          LODWORD(v1) = v1 + v9;
          v5 = v1 + 1;
          goto LABEL_15;
        }
      }
      LODWORD(v1) = 998;
    }
LABEL_15:
    LODWORD(v1) = v1 + 2;
    pretty_templ_match_dst[v5] = 93;
  }
LABEL_16:
  pretty_templ_match_dst[(int)v1] = 0;
  return result;
}

xmlDocPtr xsltGetProfileInformation(xmlDocPtr ctxt)
{
  xmlDocPtr v1;
  xmlDocPtr v2;
  xsltStylesheetPtr Import;
  int v4;
  xsltTemplatePtr templates;
  BOOL v6;
  BOOL v7;
  uint64_t v8;
  xmlElementType *p_type;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  xmlElementType *v14;
  uint64_t v15;
  xmlDoc *v16;
  xmlNode *v17;
  uint64_t i;
  xmlNode *v19;
  char __str[16];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (ctxt)
  {
    v1 = ctxt;
    if (LODWORD(ctxt[1].last))
    {
      ctxt = (xmlDocPtr)((uint64_t (*)(uint64_t))*MEMORY[0x24BEDE910])(80000);
      if (ctxt)
      {
        v2 = ctxt;
        v26 = 0;
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        *(_OWORD *)__str = 0u;
        v21 = 0u;
        Import = (xsltStylesheetPtr)v1->_private;
        if (v1->_private)
        {
          v4 = 0;
          do
          {
            templates = Import->templates;
            if (templates)
              v6 = v4 <= 9999;
            else
              v6 = 0;
            if (v6)
            {
              do
              {
                if (templates->nbCalls >= 1)
                  *((_QWORD *)&v2->_private + v4++) = templates;
                templates = templates->next;
                if (templates)
                  v7 = v4 < 10000;
                else
                  v7 = 0;
              }
              while (v7);
            }
            Import = xsltNextImport(Import);
          }
          while (Import);
          if (v4 > 1)
          {
            v8 = 0;
            p_type = &v2->type;
            v10 = 1;
            do
            {
              v11 = v8 + 1;
              if (v8 + 1 < (unint64_t)v4)
              {
                v12 = *((_QWORD *)&v2->_private + v8);
                v13 = v4;
                v14 = p_type;
                do
                {
                  v15 = *(_QWORD *)v14;
                  if (*(_QWORD *)(v12 + 104) <= *(_QWORD *)(*(_QWORD *)v14 + 104))
                  {
                    *(_QWORD *)v14 = v12;
                    *((_QWORD *)&v2->_private + v8) = v15;
                    v12 = v15;
                  }
                  v14 += 2;
                  --v13;
                }
                while (v10 != v13);
              }
              ++v10;
              p_type += 2;
              ++v8;
            }
            while (v11 != v4 - 1);
          }
        }
        else
        {
          v4 = 0;
        }
        v16 = xmlNewDoc((const xmlChar *)"1.0");
        v17 = xmlNewDocNode(v16, 0, (const xmlChar *)"profile", 0);
        xmlDocSetRootElement(v16, v17);
        if (v4 >= 1)
        {
          for (i = 0; i != v4; ++i)
          {
            v19 = xmlNewChild(v17, 0, (const xmlChar *)"template", 0);
            snprintf(__str, 0x64uLL, "%d", i + 1);
            xmlSetProp(v19, (const xmlChar *)"rank", (const xmlChar *)__str);
            xmlSetProp(v19, (const xmlChar *)"match", *(const xmlChar **)(*((_QWORD *)&v2->_private + i) + 16));
            xmlSetProp(v19, (const xmlChar *)"name", *(const xmlChar **)(*((_QWORD *)&v2->_private + i) + 32));
            xmlSetProp(v19, (const xmlChar *)"mode", *(const xmlChar **)(*((_QWORD *)&v2->_private + i) + 48));
            snprintf(__str, 0x64uLL, "%d", *(_DWORD *)(*((_QWORD *)&v2->_private + i) + 96));
            xmlSetProp(v19, (const xmlChar *)"calls", (const xmlChar *)__str);
            snprintf(__str, 0x64uLL, "%ld", *(_QWORD *)(*((_QWORD *)&v2->_private + i) + 104));
            xmlSetProp(v19, (const xmlChar *)"time", (const xmlChar *)__str);
            snprintf(__str, 0x64uLL, "%ld", *(_QWORD *)(*((_QWORD *)&v2->_private + i) + 104)/ (unint64_t)*(int *)(*((_QWORD *)&v2->_private + i) + 96));
            xmlSetProp(v19, (const xmlChar *)"average", (const xmlChar *)__str);
          }
        }
        ((void (*)(xmlDocPtr))*MEMORY[0x24BEDE758])(v2);
        return v16;
      }
    }
    else
    {
      return 0;
    }
  }
  return ctxt;
}

xmlXPathCompExprPtr xsltXPathCompileFlags(xsltStylesheetPtr style, const xmlChar *str, int flags)
{
  int v6;
  xmlXPathContextPtr xpathCtxt;
  xmlXPathContextPtr v8;
  xmlXPathCompExpr *v9;

  if (style)
  {
    if (linkedOnOrAfterFall2022OSVersions_once != -1)
      dispatch_once(&linkedOnOrAfterFall2022OSVersions_once, &__block_literal_global);
    if (linkedOnOrAfterFall2022OSVersions_result)
    {
      v6 = 0;
      xpathCtxt = style->principal->xpathCtxt;
      if (!xpathCtxt)
        return 0;
      goto LABEL_10;
    }
    xpathCtxt = xmlXPathNewContext(style->doc);
    v6 = 1;
    if (xpathCtxt)
    {
LABEL_10:
      xpathCtxt->dict = style->dict;
      goto LABEL_11;
    }
    return 0;
  }
  v8 = xmlXPathNewContext(0);
  if (!v8)
    return 0;
  xpathCtxt = v8;
  v6 = 0;
LABEL_11:
  xpathCtxt->flags = flags;
  v9 = xmlXPathCtxtCompile(xpathCtxt, str);
  if (!style || v6)
    xmlXPathFreeContext(xpathCtxt);
  return v9;
}

xmlXPathCompExprPtr xsltXPathCompile(xsltStylesheetPtr style, const xmlChar *str)
{
  return xsltXPathCompileFlags(style, str, 0);
}

int xsltGetDebuggerStatus(void)
{
  return xslDebugStatus;
}

void xsltSetDebuggerStatus(int value)
{
  xslDebugStatus = value;
}

int xsltSetDebuggerCallbacks(int no, void *block)
{
  int result;
  void *v4;

  result = -1;
  if (no == 3)
  {
    if (block)
    {
      result = 0;
      v4 = (void *)*((_QWORD *)block + 1);
      xsltDebuggerCurrentCallbacks_0 = *(_UNKNOWN **)block;
      xsltDebuggerCurrentCallbacks_1 = v4;
      xsltDebuggerCurrentCallbacks_2 = (_UNKNOWN *)*((_QWORD *)block + 2);
    }
  }
  return result;
}

void xslHandleDebugger(xmlNodePtr cur, xmlNodePtr node, xsltTemplatePtr templ, xsltTransformContextPtr ctxt)
{
  if (xsltDebuggerCurrentCallbacks_0)
    xsltDebuggerCurrentCallbacks_0(cur, node, templ, ctxt);
}

int xslAddCall(xsltTemplatePtr templ, xmlNodePtr source)
{
  if (xsltDebuggerCurrentCallbacks_1)
    return xsltDebuggerCurrentCallbacks_1(templ, source);
  else
    return 0;
}

void xslDropCall(void)
{
  if (xsltDebuggerCurrentCallbacks_2)
    xsltDebuggerCurrentCallbacks_2();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x24BDAC7D8](a1);
  return result;
}

xmlGenericErrorFunc *__xmlGenericError(void)
{
  return (xmlGenericErrorFunc *)MEMORY[0x24BEDE538]();
}

void **__xmlGenericErrorContext(void)
{
  return (void **)MEMORY[0x24BEDE540]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x24BDAD9B8](*(_QWORD *)&__clock_id, __tp);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

uint64_t dyld_program_minos_at_least()
{
  return MEMORY[0x24BDAE140]();
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

int freelocale(locale_t a1)
{
  return MEMORY[0x24BDAE470](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

void htmlDocContentDumpFormatOutput(xmlOutputBufferPtr buf, xmlDocPtr cur, const char *encoding, int format)
{
  MEMORY[0x24BEDE570](buf, cur, encoding, *(_QWORD *)&format);
}

void htmlDocContentDumpOutput(xmlOutputBufferPtr buf, xmlDocPtr cur, const char *encoding)
{
  MEMORY[0x24BEDE578](buf, cur, encoding);
}

htmlDocPtr htmlNewDoc(const xmlChar *URI, const xmlChar *ExternalID)
{
  return (htmlDocPtr)MEMORY[0x24BEDE588](URI, ExternalID);
}

htmlDocPtr htmlNewDocNoDtD(const xmlChar *URI, const xmlChar *ExternalID)
{
  return (htmlDocPtr)MEMORY[0x24BEDE590](URI, ExternalID);
}

int htmlSetMetaEncoding(htmlDocPtr doc, const xmlChar *encoding)
{
  return MEMORY[0x24BEDE5C0](doc, encoding);
}

int inputPush(xmlParserCtxtPtr ctxt, xmlParserInputPtr value)
{
  return MEMORY[0x24BEDE5D0](ctxt, value);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

locale_t newlocale(int a1, const char *a2, locale_t a3)
{
  return (locale_t)MEMORY[0x24BDAF108](*(_QWORD *)&a1, a2, a3);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

uint64_t random(void)
{
  return MEMORY[0x24BDAFA48]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

void srandom(unsigned int a1)
{
  MEMORY[0x24BDAFE98](*(_QWORD *)&a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

size_t strxfrm_l(char *a1, const char *a2, size_t a3, locale_t a4)
{
  return MEMORY[0x24BDB0070](a1, a2, a3, a4);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

xmlXPathObjectPtr valuePop(xmlXPathParserContextPtr ctxt)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDE5D8](ctxt);
}

int valuePush(xmlXPathParserContextPtr ctxt, xmlXPathObjectPtr value)
{
  return MEMORY[0x24BEDE5E0](ctxt, value);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x24BDB0370](a1, a2, a3);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

xmlNodePtr xmlAddChild(xmlNodePtr parent, xmlNodePtr cur)
{
  return (xmlNodePtr)MEMORY[0x24BEDE5E8](parent, cur);
}

xmlIDPtr xmlAddID(xmlValidCtxtPtr ctxt, xmlDocPtr doc, const xmlChar *value, xmlAttrPtr attr)
{
  return (xmlIDPtr)MEMORY[0x24BEDE5F0](ctxt, doc, value, attr);
}

xmlNodePtr xmlAddPrevSibling(xmlNodePtr cur, xmlNodePtr elem)
{
  return (xmlNodePtr)MEMORY[0x24BEDE5F8](cur, elem);
}

xmlOutputBufferPtr xmlAllocOutputBuffer(xmlCharEncodingHandlerPtr encoder)
{
  return (xmlOutputBufferPtr)MEMORY[0x24BEDE600](encoder);
}

xmlChar *__cdecl xmlBufContent(const xmlBuf *buf)
{
  return (xmlChar *)MEMORY[0x24BEDE608](buf);
}

size_t xmlBufUse(const xmlBufPtr buf)
{
  return MEMORY[0x24BEDE610](buf);
}

int xmlBufferAdd(xmlBufferPtr buf, const xmlChar *str, int len)
{
  return MEMORY[0x24BEDE618](buf, str, *(_QWORD *)&len);
}

int xmlBufferCCat(xmlBufferPtr buf, const char *str)
{
  return MEMORY[0x24BEDE620](buf, str);
}

int xmlBufferCat(xmlBufferPtr buf, const xmlChar *str)
{
  return MEMORY[0x24BEDE628](buf, str);
}

const xmlChar *__cdecl xmlBufferContent(const xmlBuffer *buf)
{
  return (const xmlChar *)MEMORY[0x24BEDE630](buf);
}

xmlBufferPtr xmlBufferCreate(void)
{
  return (xmlBufferPtr)MEMORY[0x24BEDE638]();
}

void xmlBufferFree(xmlBufferPtr buf)
{
  MEMORY[0x24BEDE650](buf);
}

xmlChar *__cdecl xmlBuildURI(const xmlChar *URI, const xmlChar *base)
{
  return (xmlChar *)MEMORY[0x24BEDE668](URI, base);
}

int xmlCharInRange(unsigned int val, const xmlChRangeGroup *group)
{
  return MEMORY[0x24BEDE670](*(_QWORD *)&val, group);
}

int xmlCheckFilename(const char *path)
{
  return MEMORY[0x24BEDE688](path);
}

int xmlCopyCharMultiByte(xmlChar *out, int val)
{
  return MEMORY[0x24BEDE6A0](out, *(_QWORD *)&val);
}

xmlDtdPtr xmlCreateIntSubset(xmlDocPtr doc, const xmlChar *name, const xmlChar *ExternalID, const xmlChar *SystemID)
{
  return (xmlDtdPtr)MEMORY[0x24BEDE6B0](doc, name, ExternalID, SystemID);
}

xmlURIPtr xmlCreateURI(void)
{
  return (xmlURIPtr)MEMORY[0x24BEDE6C0]();
}

int xmlCtxtUseOptions(xmlParserCtxtPtr ctxt, int options)
{
  return MEMORY[0x24BEDE6E0](ctxt, *(_QWORD *)&options);
}

xmlDictPtr xmlDictCreate(void)
{
  return (xmlDictPtr)MEMORY[0x24BEDE6F8]();
}

xmlDictPtr xmlDictCreateSub(xmlDictPtr sub)
{
  return (xmlDictPtr)MEMORY[0x24BEDE700](sub);
}

void xmlDictFree(xmlDictPtr dict)
{
  MEMORY[0x24BEDE708](dict);
}

const xmlChar *__cdecl xmlDictLookup(xmlDictPtr dict, const xmlChar *name, int len)
{
  return (const xmlChar *)MEMORY[0x24BEDE710](dict, name, *(_QWORD *)&len);
}

int xmlDictOwns(xmlDictPtr dict, const xmlChar *str)
{
  return MEMORY[0x24BEDE718](dict, str);
}

const xmlChar *__cdecl xmlDictQLookup(xmlDictPtr dict, const xmlChar *prefix, const xmlChar *name)
{
  return (const xmlChar *)MEMORY[0x24BEDE720](dict, prefix, name);
}

int xmlDictReference(xmlDictPtr dict)
{
  return MEMORY[0x24BEDE728](dict);
}

xmlNodePtr xmlDocCopyNode(xmlNodePtr node, xmlDocPtr doc, int recursive)
{
  return (xmlNodePtr)MEMORY[0x24BEDE730](node, doc, *(_QWORD *)&recursive);
}

xmlNodePtr xmlDocGetRootElement(const xmlDoc *doc)
{
  return (xmlNodePtr)MEMORY[0x24BEDE740](doc);
}

xmlNodePtr xmlDocSetRootElement(xmlDocPtr doc, xmlNodePtr root)
{
  return (xmlNodePtr)MEMORY[0x24BEDE748](doc, root);
}

xmlCharEncodingHandlerPtr xmlFindCharEncodingHandler(const char *name)
{
  return (xmlCharEncodingHandlerPtr)MEMORY[0x24BEDE750](name);
}

void xmlFreeDoc(xmlDocPtr cur)
{
  MEMORY[0x24BEDE760](cur);
}

void xmlFreeDtd(xmlDtdPtr cur)
{
  MEMORY[0x24BEDE768](cur);
}

void xmlFreeIDTable(xmlIDTablePtr table)
{
  MEMORY[0x24BEDE770](table);
}

void xmlFreeMutex(xmlMutexPtr tok)
{
  MEMORY[0x24BEDE778](tok);
}

void xmlFreeNode(xmlNodePtr cur)
{
  MEMORY[0x24BEDE780](cur);
}

void xmlFreeNodeList(xmlNodePtr cur)
{
  MEMORY[0x24BEDE788](cur);
}

void xmlFreeParserCtxt(xmlParserCtxtPtr ctxt)
{
  MEMORY[0x24BEDE798](ctxt);
}

void xmlFreeRefTable(xmlRefTablePtr table)
{
  MEMORY[0x24BEDE7A0](table);
}

void xmlFreeURI(xmlURIPtr uri)
{
  MEMORY[0x24BEDE7B8](uri);
}

const char *__cdecl xmlGetCharEncodingName(xmlCharEncoding enc)
{
  return (const char *)MEMORY[0x24BEDE7C8](*(_QWORD *)&enc);
}

xmlEntityPtr xmlGetDocEntity(const xmlDoc *doc, const xmlChar *name)
{
  return (xmlEntityPtr)MEMORY[0x24BEDE7D0](doc, name);
}

xmlAttributePtr xmlGetDtdAttrDesc(xmlDtdPtr dtd, const xmlChar *elem, const xmlChar *name)
{
  return (xmlAttributePtr)MEMORY[0x24BEDE7D8](dtd, elem, name);
}

xmlAttrPtr xmlGetID(xmlDocPtr doc, const xmlChar *ID)
{
  return (xmlAttrPtr)MEMORY[0x24BEDE7E8](doc, ID);
}

xmlDtdPtr xmlGetIntSubset(const xmlDoc *doc)
{
  return (xmlDtdPtr)MEMORY[0x24BEDE7F0](doc);
}

uint64_t xmlGetLineNo(const xmlNode *node)
{
  return MEMORY[0x24BEDE800](node);
}

xmlNsPtr *__cdecl xmlGetNsList(const xmlDoc *doc, const xmlNode *node)
{
  return (xmlNsPtr *)MEMORY[0x24BEDE810](doc, node);
}

xmlChar *__cdecl xmlGetNsProp(const xmlNode *node, const xmlChar *name, const xmlChar *nameSpace)
{
  return (xmlChar *)MEMORY[0x24BEDE818](node, name, nameSpace);
}

xmlChar *__cdecl xmlGetProp(const xmlNode *node, const xmlChar *name)
{
  return (xmlChar *)MEMORY[0x24BEDE828](node, name);
}

int xmlHashAddEntry(xmlHashTablePtr table, const xmlChar *name, void *userdata)
{
  return MEMORY[0x24BEDE840](table, name, userdata);
}

int xmlHashAddEntry2(xmlHashTablePtr table, const xmlChar *name, const xmlChar *name2, void *userdata)
{
  return MEMORY[0x24BEDE848](table, name, name2, userdata);
}

int xmlHashAddEntry3(xmlHashTablePtr table, const xmlChar *name, const xmlChar *name2, const xmlChar *name3, void *userdata)
{
  return MEMORY[0x24BEDE850](table, name, name2, name3, userdata);
}

xmlHashTablePtr xmlHashCreate(int size)
{
  return (xmlHashTablePtr)MEMORY[0x24BEDE858](*(_QWORD *)&size);
}

void xmlHashFree(xmlHashTablePtr table, xmlHashDeallocator f)
{
  MEMORY[0x24BEDE860](table, f);
}

void *__cdecl xmlHashLookup(xmlHashTablePtr table, const xmlChar *name)
{
  return (void *)MEMORY[0x24BEDE868](table, name);
}

void *__cdecl xmlHashLookup2(xmlHashTablePtr table, const xmlChar *name, const xmlChar *name2)
{
  return (void *)MEMORY[0x24BEDE870](table, name, name2);
}

void *__cdecl xmlHashLookup3(xmlHashTablePtr table, const xmlChar *name, const xmlChar *name2, const xmlChar *name3)
{
  return (void *)MEMORY[0x24BEDE878](table, name, name2, name3);
}

int xmlHashRemoveEntry(xmlHashTablePtr table, const xmlChar *name, xmlHashDeallocator f)
{
  return MEMORY[0x24BEDE880](table, name, f);
}

int xmlHashRemoveEntry2(xmlHashTablePtr table, const xmlChar *name, const xmlChar *name2, xmlHashDeallocator f)
{
  return MEMORY[0x24BEDE888](table, name, name2, f);
}

void xmlHashScan(xmlHashTablePtr table, xmlHashScanner f, void *data)
{
  MEMORY[0x24BEDE890](table, f, data);
}

void xmlHashScanFull(xmlHashTablePtr table, xmlHashScannerFull f, void *data)
{
  MEMORY[0x24BEDE898](table, f, data);
}

int xmlHashUpdateEntry(xmlHashTablePtr table, const xmlChar *name, void *userdata, xmlHashDeallocator f)
{
  return MEMORY[0x24BEDE8A0](table, name, userdata, f);
}

int xmlHashUpdateEntry2(xmlHashTablePtr table, const xmlChar *name, const xmlChar *name2, void *userdata, xmlHashDeallocator f)
{
  return MEMORY[0x24BEDE8A8](table, name, name2, userdata, f);
}

int xmlHashUpdateEntry3(xmlHashTablePtr table, const xmlChar *name, const xmlChar *name2, const xmlChar *name3, void *userdata, xmlHashDeallocator f)
{
  return MEMORY[0x24BEDE8B0](table, name, name2, name3, userdata, f);
}

int xmlIsBlankNode(const xmlNode *node)
{
  return MEMORY[0x24BEDE8D0](node);
}

int xmlIsID(xmlDocPtr doc, xmlNodePtr elem, xmlAttrPtr attr)
{
  return MEMORY[0x24BEDE8F0](doc, elem, attr);
}

xmlParserInputPtr xmlLoadExternalEntity(const char *URL, const char *ID, xmlParserCtxtPtr ctxt)
{
  return (xmlParserInputPtr)MEMORY[0x24BEDE900](URL, ID, ctxt);
}

int xmlModuleClose(xmlModulePtr module)
{
  return MEMORY[0x24BEDE918](module);
}

xmlModulePtr xmlModuleOpen(const char *filename, int options)
{
  return (xmlModulePtr)MEMORY[0x24BEDE920](filename, *(_QWORD *)&options);
}

int xmlModuleSymbol(xmlModulePtr module, const char *name, void **result)
{
  return MEMORY[0x24BEDE928](module, name, result);
}

void xmlMutexLock(xmlMutexPtr tok)
{
  MEMORY[0x24BEDE930](tok);
}

void xmlMutexUnlock(xmlMutexPtr tok)
{
  MEMORY[0x24BEDE938](tok);
}

xmlNodePtr xmlNewCDataBlock(xmlDocPtr doc, const xmlChar *content, int len)
{
  return (xmlNodePtr)MEMORY[0x24BEDE940](doc, content, *(_QWORD *)&len);
}

xmlNodePtr xmlNewChild(xmlNodePtr parent, xmlNsPtr ns, const xmlChar *name, const xmlChar *content)
{
  return (xmlNodePtr)MEMORY[0x24BEDE948](parent, ns, name, content);
}

xmlNodePtr xmlNewComment(const xmlChar *content)
{
  return (xmlNodePtr)MEMORY[0x24BEDE950](content);
}

xmlDocPtr xmlNewDoc(const xmlChar *version)
{
  return (xmlDocPtr)MEMORY[0x24BEDE958](version);
}

xmlNodePtr xmlNewDocNode(xmlDocPtr doc, xmlNsPtr ns, const xmlChar *name, const xmlChar *content)
{
  return (xmlNodePtr)MEMORY[0x24BEDE960](doc, ns, name, content);
}

xmlNodePtr xmlNewDocNodeEatName(xmlDocPtr doc, xmlNsPtr ns, xmlChar *name, const xmlChar *content)
{
  return (xmlNodePtr)MEMORY[0x24BEDE968](doc, ns, name, content);
}

xmlNodePtr xmlNewDocPI(xmlDocPtr doc, const xmlChar *name, const xmlChar *content)
{
  return (xmlNodePtr)MEMORY[0x24BEDE970](doc, name, content);
}

xmlAttrPtr xmlNewDocProp(xmlDocPtr doc, const xmlChar *name, const xmlChar *value)
{
  return (xmlAttrPtr)MEMORY[0x24BEDE978](doc, name, value);
}

xmlNodePtr xmlNewDocText(const xmlDoc *doc, const xmlChar *content)
{
  return (xmlNodePtr)MEMORY[0x24BEDE988](doc, content);
}

xmlMutexPtr xmlNewMutex(void)
{
  return (xmlMutexPtr)MEMORY[0x24BEDE9A0]();
}

xmlNsPtr xmlNewNs(xmlNodePtr node, const xmlChar *href, const xmlChar *prefix)
{
  return (xmlNsPtr)MEMORY[0x24BEDE9B0](node, href, prefix);
}

xmlAttrPtr xmlNewNsProp(xmlNodePtr node, xmlNsPtr ns, const xmlChar *name, const xmlChar *value)
{
  return (xmlAttrPtr)MEMORY[0x24BEDE9B8](node, ns, name, value);
}

xmlParserCtxtPtr xmlNewParserCtxt(void)
{
  return (xmlParserCtxtPtr)MEMORY[0x24BEDE9C0]();
}

xmlNodePtr xmlNewText(const xmlChar *content)
{
  return (xmlNodePtr)MEMORY[0x24BEDE9D8](content);
}

xmlNodePtr xmlNewTextLen(const xmlChar *content, int len)
{
  return (xmlNodePtr)MEMORY[0x24BEDE9E8](content, *(_QWORD *)&len);
}

void xmlNodeAddContent(xmlNodePtr cur, const xmlChar *content)
{
  MEMORY[0x24BEDEA28](cur, content);
}

void xmlNodeDumpOutput(xmlOutputBufferPtr buf, xmlDocPtr doc, xmlNodePtr cur, int level, int format, const char *encoding)
{
  MEMORY[0x24BEDEA40](buf, doc, cur, *(_QWORD *)&level, *(_QWORD *)&format, encoding);
}

xmlChar *__cdecl xmlNodeGetBase(const xmlDoc *doc, const xmlNode *cur)
{
  return (xmlChar *)MEMORY[0x24BEDEA48](doc, cur);
}

xmlChar *__cdecl xmlNodeGetContent(const xmlNode *cur)
{
  return (xmlChar *)MEMORY[0x24BEDEA50](cur);
}

int xmlNodeGetSpacePreserve(const xmlNode *cur)
{
  return MEMORY[0x24BEDEA58](cur);
}

xmlChar *__cdecl xmlNodeListGetString(xmlDocPtr doc, const xmlNode *list, int inLine)
{
  return (xmlChar *)MEMORY[0x24BEDEA68](doc, list, *(_QWORD *)&inLine);
}

void xmlNodeSetContent(xmlNodePtr cur, const xmlChar *content)
{
  MEMORY[0x24BEDEA70](cur, content);
}

int xmlOutputBufferClose(xmlOutputBufferPtr out)
{
  return MEMORY[0x24BEDEA78](out);
}

xmlOutputBufferPtr xmlOutputBufferCreateFd(int fd, xmlCharEncodingHandlerPtr encoder)
{
  return (xmlOutputBufferPtr)MEMORY[0x24BEDEA80](*(_QWORD *)&fd, encoder);
}

xmlOutputBufferPtr xmlOutputBufferCreateFile(FILE *file, xmlCharEncodingHandlerPtr encoder)
{
  return (xmlOutputBufferPtr)MEMORY[0x24BEDEA88](file, encoder);
}

xmlOutputBufferPtr xmlOutputBufferCreateFilename(const char *URI, xmlCharEncodingHandlerPtr encoder, int compression)
{
  return (xmlOutputBufferPtr)MEMORY[0x24BEDEA90](URI, encoder, *(_QWORD *)&compression);
}

int xmlOutputBufferFlush(xmlOutputBufferPtr out)
{
  return MEMORY[0x24BEDEAA0](out);
}

int xmlOutputBufferWriteString(xmlOutputBufferPtr out, const char *str)
{
  return MEMORY[0x24BEDEAA8](out, str);
}

int xmlParseDocument(xmlParserCtxtPtr ctxt)
{
  return MEMORY[0x24BEDEAC0](ctxt);
}

xmlURIPtr xmlParseURI(const char *str)
{
  return (xmlURIPtr)MEMORY[0x24BEDEAD0](str);
}

char *__cdecl xmlParserGetDirectory(const char *filename)
{
  return (char *)MEMORY[0x24BEDEAD8](filename);
}

xmlChar *__cdecl xmlSaveUri(xmlURIPtr uri)
{
  return (xmlChar *)MEMORY[0x24BEDEB68](uri);
}

xmlNsPtr xmlSearchNs(xmlDocPtr doc, xmlNodePtr node, const xmlChar *nameSpace)
{
  return (xmlNsPtr)MEMORY[0x24BEDEBD8](doc, node, nameSpace);
}

xmlNsPtr xmlSearchNsByHref(xmlDocPtr doc, xmlNodePtr node, const xmlChar *href)
{
  return (xmlNsPtr)MEMORY[0x24BEDEBE0](doc, node, href);
}

xmlAttrPtr xmlSetNsProp(xmlNodePtr node, xmlNsPtr ns, const xmlChar *name, const xmlChar *value)
{
  return (xmlAttrPtr)MEMORY[0x24BEDEC00](node, ns, name, value);
}

xmlAttrPtr xmlSetProp(xmlNodePtr node, const xmlChar *name, const xmlChar *value)
{
  return (xmlAttrPtr)MEMORY[0x24BEDEC08](node, name, value);
}

xmlChar *__cdecl xmlSplitQName2(const xmlChar *name, xmlChar **prefix)
{
  return (xmlChar *)MEMORY[0x24BEDEC18](name, prefix);
}

int xmlStrEqual(const xmlChar *str1, const xmlChar *str2)
{
  return MEMORY[0x24BEDEC28](str1, str2);
}

int xmlStrPrintf(xmlChar *buf, int len, const char *msg, ...)
{
  return MEMORY[0x24BEDEC30](buf, *(_QWORD *)&len, msg);
}

int xmlStrcasecmp(const xmlChar *str1, const xmlChar *str2)
{
  return MEMORY[0x24BEDEC38](str1, str2);
}

xmlChar *__cdecl xmlStrcat(xmlChar *cur, const xmlChar *add)
{
  return (xmlChar *)MEMORY[0x24BEDEC40](cur, add);
}

const xmlChar *__cdecl xmlStrchr(const xmlChar *str, xmlChar val)
{
  return (const xmlChar *)MEMORY[0x24BEDEC48](str, val);
}

int xmlStrcmp(const xmlChar *str1, const xmlChar *str2)
{
  return MEMORY[0x24BEDEC50](str1, str2);
}

xmlChar *__cdecl xmlStrdup(const xmlChar *cur)
{
  return (xmlChar *)MEMORY[0x24BEDEC58](cur);
}

int xmlStringCurrentChar(xmlParserCtxtPtr ctxt, const xmlChar *cur, int *len)
{
  return MEMORY[0x24BEDEC60](ctxt, cur, len);
}

int xmlStrlen(const xmlChar *str)
{
  return MEMORY[0x24BEDEC78](str);
}

int xmlStrncasecmp(const xmlChar *str1, const xmlChar *str2, int len)
{
  return MEMORY[0x24BEDEC80](str1, str2, *(_QWORD *)&len);
}

xmlChar *__cdecl xmlStrncat(xmlChar *cur, const xmlChar *add, int len)
{
  return (xmlChar *)MEMORY[0x24BEDEC88](cur, add, *(_QWORD *)&len);
}

int xmlStrncmp(const xmlChar *str1, const xmlChar *str2, int len)
{
  return MEMORY[0x24BEDEC90](str1, str2, *(_QWORD *)&len);
}

xmlChar *__cdecl xmlStrndup(const xmlChar *cur, int len)
{
  return (xmlChar *)MEMORY[0x24BEDEC98](cur, *(_QWORD *)&len);
}

const xmlChar *__cdecl xmlStrstr(const xmlChar *str, const xmlChar *val)
{
  return (const xmlChar *)MEMORY[0x24BEDECA0](str, val);
}

xmlChar *__cdecl xmlURIEscapeStr(const xmlChar *str, const xmlChar *list)
{
  return (xmlChar *)MEMORY[0x24BEDEDE0](str, list);
}

int xmlUTF8Strloc(const xmlChar *utf, const xmlChar *utfchar)
{
  return MEMORY[0x24BEDEE00](utf, utfchar);
}

const xmlChar *__cdecl xmlUTF8Strpos(const xmlChar *utf, int pos)
{
  return (const xmlChar *)MEMORY[0x24BEDEE10](utf, *(_QWORD *)&pos);
}

int xmlUTF8Strsize(const xmlChar *utf, int len)
{
  return MEMORY[0x24BEDEE18](utf, *(_QWORD *)&len);
}

void xmlUnlinkNode(xmlNodePtr cur)
{
  MEMORY[0x24BEDEE20](cur);
}

int xmlValidateNCName(const xmlChar *value, int space)
{
  return MEMORY[0x24BEDEE30](value, *(_QWORD *)&space);
}

int xmlValidateQName(const xmlChar *value, int space)
{
  return MEMORY[0x24BEDEE38](value, *(_QWORD *)&space);
}

int xmlXIncludeProcessFlags(xmlDocPtr doc, int flags)
{
  return MEMORY[0x24BEDEE40](doc, *(_QWORD *)&flags);
}

xmlChar *__cdecl xmlXPathCastNodeToString(xmlNodePtr node)
{
  return (xmlChar *)MEMORY[0x24BEDEE50](node);
}

xmlChar *__cdecl xmlXPathCastToString(xmlXPathObjectPtr val)
{
  return (xmlChar *)MEMORY[0x24BEDEE68](val);
}

int xmlXPathCmpNodes(xmlNodePtr node1, xmlNodePtr node2)
{
  return MEMORY[0x24BEDEE70](node1, node2);
}

xmlXPathObjectPtr xmlXPathCompiledEval(xmlXPathCompExprPtr comp, xmlXPathContextPtr ctx)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDEE78](comp, ctx);
}

int xmlXPathCompiledEvalToBoolean(xmlXPathCompExprPtr comp, xmlXPathContextPtr ctxt)
{
  return MEMORY[0x24BEDEE80](comp, ctxt);
}

int xmlXPathContextSetCache(xmlXPathContextPtr ctxt, int active, int value, int options)
{
  return MEMORY[0x24BEDEE88](ctxt, *(_QWORD *)&active, *(_QWORD *)&value, *(_QWORD *)&options);
}

xmlXPathObjectPtr xmlXPathConvertNumber(xmlXPathObjectPtr val)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDEE90](val);
}

xmlXPathObjectPtr xmlXPathConvertString(xmlXPathObjectPtr val)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDEE98](val);
}

xmlXPathCompExprPtr xmlXPathCtxtCompile(xmlXPathContextPtr ctxt, const xmlChar *str)
{
  return (xmlXPathCompExprPtr)MEMORY[0x24BEDEEA0](ctxt, str);
}

void xmlXPathDebugDumpObject(FILE *output, xmlXPathObjectPtr cur, int depth)
{
  MEMORY[0x24BEDEEA8](output, cur, *(_QWORD *)&depth);
}

void xmlXPathErr(xmlXPathParserContextPtr ctxt, int error)
{
  MEMORY[0x24BEDEEC0](ctxt, *(_QWORD *)&error);
}

xmlXPathObjectPtr xmlXPathEval(const xmlChar *str, xmlXPathContextPtr ctx)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDEEC8](str, ctx);
}

xmlXPathObjectPtr xmlXPathEvalExpression(const xmlChar *str, xmlXPathContextPtr ctxt)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDEED0](str, ctxt);
}

int xmlXPathEvalPredicate(xmlXPathContextPtr ctxt, xmlXPathObjectPtr res)
{
  return MEMORY[0x24BEDEED8](ctxt, res);
}

void xmlXPathFreeCompExpr(xmlXPathCompExprPtr comp)
{
  MEMORY[0x24BEDEEE0](comp);
}

void xmlXPathFreeContext(xmlXPathContextPtr ctxt)
{
  MEMORY[0x24BEDEEE8](ctxt);
}

void xmlXPathFreeNodeSet(xmlNodeSetPtr obj)
{
  MEMORY[0x24BEDEEF0](obj);
}

void xmlXPathFreeObject(xmlXPathObjectPtr obj)
{
  MEMORY[0x24BEDEEF8](obj);
}

void xmlXPathFreeParserContext(xmlXPathParserContextPtr ctxt)
{
  MEMORY[0x24BEDEF00](ctxt);
}

xmlXPathFunction xmlXPathFunctionLookupNS(xmlXPathContextPtr ctxt, const xmlChar *name, const xmlChar *ns_uri)
{
  return (xmlXPathFunction)MEMORY[0x24BEDEF08](ctxt, name, ns_uri);
}

void xmlXPathInit(void)
{
  MEMORY[0x24BEDEF18]();
}

int xmlXPathIsInf(double val)
{
  return MEMORY[0x24BEDEF28](val);
}

int xmlXPathIsNaN(double val)
{
  return MEMORY[0x24BEDEF30](val);
}

int xmlXPathIsNodeType(const xmlChar *name)
{
  return MEMORY[0x24BEDEF38](name);
}

xmlXPathObjectPtr xmlXPathNewBoolean(int val)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDEF48](*(_QWORD *)&val);
}

xmlXPathObjectPtr xmlXPathNewCString(const char *val)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDEF50](val);
}

xmlXPathContextPtr xmlXPathNewContext(xmlDocPtr doc)
{
  return (xmlXPathContextPtr)MEMORY[0x24BEDEF58](doc);
}

xmlXPathObjectPtr xmlXPathNewNodeSet(xmlNodePtr val)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDEF68](val);
}

xmlXPathParserContextPtr xmlXPathNewParserContext(const xmlChar *str, xmlXPathContextPtr ctxt)
{
  return (xmlXPathParserContextPtr)MEMORY[0x24BEDEF70](str, ctxt);
}

xmlXPathObjectPtr xmlXPathNewString(const xmlChar *val)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDEF78](val);
}

xmlXPathObjectPtr xmlXPathNewValueTree(xmlNodePtr val)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDEF80](val);
}

xmlNodePtr xmlXPathNextAncestor(xmlXPathParserContextPtr ctxt, xmlNodePtr cur)
{
  return (xmlNodePtr)MEMORY[0x24BEDEF88](ctxt, cur);
}

xmlNodePtr xmlXPathNextPrecedingSibling(xmlXPathParserContextPtr ctxt, xmlNodePtr cur)
{
  return (xmlNodePtr)MEMORY[0x24BEDEF90](ctxt, cur);
}

int xmlXPathNodeSetAdd(xmlNodeSetPtr cur, xmlNodePtr val)
{
  return MEMORY[0x24BEDEFA8](cur, val);
}

int xmlXPathNodeSetAddUnique(xmlNodeSetPtr cur, xmlNodePtr val)
{
  return MEMORY[0x24BEDEFB0](cur, val);
}

xmlNodeSetPtr xmlXPathNodeSetCreate(xmlNodePtr val)
{
  return (xmlNodeSetPtr)MEMORY[0x24BEDEFB8](val);
}

xmlNodeSetPtr xmlXPathNodeSetMerge(xmlNodeSetPtr val1, xmlNodeSetPtr val2)
{
  return (xmlNodeSetPtr)MEMORY[0x24BEDEFC0](val1, val2);
}

const xmlChar *__cdecl xmlXPathNsLookup(xmlXPathContextPtr ctxt, const xmlChar *prefix)
{
  return (const xmlChar *)MEMORY[0x24BEDEFD8](ctxt, prefix);
}

void xmlXPathNumberFunction(xmlXPathParserContextPtr ctxt, int nargs)
{
  MEMORY[0x24BEDEFE0](ctxt, *(_QWORD *)&nargs);
}

xmlXPathObjectPtr xmlXPathObjectCopy(xmlXPathObjectPtr val)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDEFE8](val);
}

uint64_t xmlXPathOrderDocElems(xmlDocPtr doc)
{
  return MEMORY[0x24BEDEFF0](doc);
}

int xmlXPathRegisterFunc(xmlXPathContextPtr ctxt, const xmlChar *name, xmlXPathFunction f)
{
  return MEMORY[0x24BEDF020](ctxt, name, f);
}

void xmlXPathRegisterFuncLookup(xmlXPathContextPtr ctxt, xmlXPathFuncLookupFunc f, void *funcCtxt)
{
  MEMORY[0x24BEDF028](ctxt, f, funcCtxt);
}

int xmlXPathRegisterFuncNS(xmlXPathContextPtr ctxt, const xmlChar *name, const xmlChar *ns_uri, xmlXPathFunction f)
{
  return MEMORY[0x24BEDF030](ctxt, name, ns_uri, f);
}

void xmlXPathRegisterVariableLookup(xmlXPathContextPtr ctxt, xmlXPathVariableLookupFunc f, void *data)
{
  MEMORY[0x24BEDF040](ctxt, f, data);
}

double xmlXPathStringEvalNumber(const xmlChar *str)
{
  double result;

  MEMORY[0x24BEDF050](str);
  return result;
}

void xmlXPathStringFunction(xmlXPathParserContextPtr ctxt, int nargs)
{
  MEMORY[0x24BEDF058](ctxt, *(_QWORD *)&nargs);
}

xmlXPathObjectPtr xmlXPathWrapNodeSet(xmlNodeSetPtr val)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDF068](val);
}

xmlXPathObjectPtr xmlXPathWrapString(xmlChar *val)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDF070](val);
}

xmlXPathObjectPtr xmlXPtrEval(const xmlChar *str, xmlXPathContextPtr ctx)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDF080](str, ctx);
}

