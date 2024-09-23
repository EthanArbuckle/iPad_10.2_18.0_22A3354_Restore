@implementation PFXStreamReader

+ (BOOL)readWithElementReaders:(id)a3 textReader:(Class)a4 piReader:(Class)a5 readerState:(id)a6
{
  xmlTextReader *v11;
  xmlTextReader *v12;
  int v13;
  int v14;
  uint64_t v15;
  char *v16;
  char *v17;
  unsigned __int8 v18;
  const xmlChar *v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  const xmlChar *v32;
  id v33;
  objc_class *v34;
  id v35;
  unsigned int v36;
  char **v38;
  void *__p;
  char *v40;
  char *v41;

  v11 = (xmlTextReader *)objc_msgSend(a6, "streamAPI");
  if (!v11)
  {
    LOBYTE(v36) = 0;
    return v36;
  }
  v12 = v11;
  v38 = &v41;
  __p = 0;
  v40 = 0;
  v41 = 0;
  while (2)
  {
    v13 = xmlTextReaderRead(v12);
    if (v13 == 1)
    {
      v14 = xmlTextReaderDepth(v12);
      switch(xmlTextReaderNodeType(v12))
      {
        case 1:
          v16 = v40;
          if (v40 >= v41)
          {
            v20 = (char *)__p;
            v21 = (v40 - (_BYTE *)__p) >> 3;
            v22 = v21 + 1;
            if ((unint64_t)(v21 + 1) >> 61)
              sub_36C30();
            v23 = v41 - (_BYTE *)__p;
            if ((v41 - (_BYTE *)__p) >> 2 > v22)
              v22 = v23 >> 2;
            if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF8)
              v24 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v24 = v22;
            if (v24)
            {
              v25 = (char *)sub_3CC38((uint64_t)v38, v24);
              v20 = (char *)__p;
              v16 = v40;
            }
            else
            {
              v25 = 0;
            }
            v26 = &v25[8 * v21];
            *(_QWORD *)v26 = 0;
            v17 = v26 + 8;
            while (v16 != v20)
            {
              v27 = *((_QWORD *)v16 - 1);
              v16 -= 8;
              *((_QWORD *)v26 - 1) = v27;
              v26 -= 8;
            }
            __p = v26;
            v40 = v17;
            v41 = &v25[8 * v24];
            if (v20)
              operator delete(v20);
          }
          else
          {
            *(_QWORD *)v40 = 0;
            v17 = v16 + 8;
          }
          v28 = v14;
          v40 = v17;
          if (v14 >= 1)
          {
            v29 = (char *)__p + 8 * v14;
            v30 = *((_QWORD *)v29 - 1);
            v31 = 1;
            if ((v30 & 1) == 0)
              v31 = 2;
            *((_QWORD *)v29 - 1) = v30 + v31;
          }
          v32 = (const xmlChar *)"";
          if (objc_msgSend(a6, "namespaceCheck", v38))
            v32 = xmlTextReaderConstNamespaceUri(v12);
          v33 = objc_msgSend(a3, "elementInfoForElementName:elementNamespace:", xmlTextReaderConstLocalName(v12), v32);
          v34 = (objc_class *)objc_msgSend(v33, "mappingClass");
          if (!v34)
          {
            v18 = objc_msgSend(a1, "skipSubtreeWithStream:endNodeType:readerState:", v12, 15, a6);
            v40 -= 8;
            goto LABEL_43;
          }
          v35 = objc_alloc_init(v34);
          objc_msgSend(a6, "pushReader:elementInfo:cfiPath:", v35, v33, +[PFXCommon cfiPathToNodeWithDepth:nodeArray:idArray:](PFXCommon, "cfiPathToNodeWithDepth:nodeArray:idArray:", v28, &__p, 0));
          if ((objc_msgSend(v35, "mapStartElementWithState:", a6) & 1) != 0)
          {
            if (!xmlTextReaderIsEmptyElement(v12))
            {
LABEL_48:

              goto LABEL_49;
            }
            objc_msgSend(objc_msgSend(objc_msgSend(a6, "currentXmlStackEntry"), "reader"), "mapEndElementWithState:", a6);
            objc_msgSend(a6, "popReader");
LABEL_47:
            v40 -= 8;
            goto LABEL_48;
          }
          if ((objc_msgSend(a1, "skipSubtreeWithStream:endNodeType:readerState:", v12, 15, a6) & 1) != 0)
          {
            objc_msgSend(a6, "popReader");
            goto LABEL_47;
          }

          break;
        case 3:
        case 13:
        case 14:
          if (a4)
          {
            if (v14 < 1)
            {
              v15 = 1;
            }
            else
            {
              v15 = *((_QWORD *)v40 - 1);
              if ((v15 & 1) == 0)
                *((_QWORD *)v40 - 1) = ++v15;
            }
            -[objc_class readTextFromStream:childIndex:readerState:](a4, "readTextFromStream:childIndex:readerState:", v12, v15, a6, v38);
            if (objc_msgSend(a6, "shouldCountText"))
            {
              v19 = xmlTextReaderConstValue(v12);
              objc_msgSend(a6, "incrementTextReadBy:", xmlStrlen(v19));
            }
          }
          goto LABEL_49;
        case 6:
          v18 = objc_msgSend(a1, "skipSubtreeWithStream:endNodeType:readerState:", v12, 16, a6);
LABEL_43:
          if ((v18 & 1) == 0)
            break;
          goto LABEL_49;
        case 7:
          if (a5)
            -[objc_class readProcessingInstructionFromStream:readerState:](a5, "readProcessingInstructionFromStream:readerState:", v12, a6);
          goto LABEL_49;
        case 15:
          objc_msgSend(objc_msgSend(objc_msgSend(a6, "currentXmlStackEntry"), "reader"), "mapEndElementWithState:", a6);
          objc_msgSend(a6, "popReader");
          v40 -= 8;
          goto LABEL_49;
        default:
LABEL_49:
          if ((objc_msgSend(a6, "isCancelled", v38) & 1) != 0)
            goto LABEL_53;
          continue;
      }
    }
    else if ((v13 & 0x80000000) == 0)
    {
LABEL_53:
      v36 = objc_msgSend(a6, "isCancelled", v38) ^ 1;
      goto LABEL_56;
    }
    break;
  }
  LOBYTE(v36) = 0;
LABEL_56:
  if (__p)
  {
    v40 = (char *)__p;
    operator delete(__p);
  }
  return v36;
}

+ (BOOL)skipSubtreeWithStream:(_xmlTextReader *)a3 endNodeType:(int64_t)a4 readerState:(id)a5
{
  int v8;
  int v9;
  int v10;
  int v12;
  int v13;
  unsigned int v14;
  const xmlChar *v15;

  v8 = xmlTextReaderNodeType(a3);
  v9 = xmlTextReaderDepth(a3);
  if (v8 == a4)
    return 1;
  v10 = v9;
  if (v8 == 1)
  {
    if (xmlTextReaderIsEmptyElement(a3))
      return 1;
  }
  v12 = xmlTextReaderRead(a3);
  if (v12 == 1)
  {
    while (1)
    {
      v13 = xmlTextReaderDepth(a3);
      v14 = xmlTextReaderNodeType(a3);
      if (v13 == v10 && v14 == a4)
        break;
      if (v14 <= 0xE && ((1 << v14) & 0x6008) != 0)
      {
        if (objc_msgSend(a5, "shouldCountText"))
        {
          v15 = xmlTextReaderConstValue(a3);
          objc_msgSend(a5, "incrementTextReadBy:", xmlStrlen(v15));
        }
      }
      v12 = xmlTextReaderRead(a3);
      if (v12 != 1)
        return v12 >= 0;
    }
    v12 = 1;
  }
  return v12 >= 0;
}

@end
