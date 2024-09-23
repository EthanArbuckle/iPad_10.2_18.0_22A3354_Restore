@implementation WXAnnotation

+ (id)annotationTypeEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_28, 0, &dword_22A0CC000);
  }
  if (+[WXAnnotation annotationTypeEnumMap]::onceToken != -1)
    dispatch_once(&+[WXAnnotation annotationTypeEnumMap]::onceToken, &__block_literal_global_79);
  return (id)+[WXAnnotation annotationTypeEnumMap]::sAnnotationTypeEnumMap;
}

void __37__WXAnnotation_annotationTypeEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXAnnotation annotationTypeEnumMap]::sAnnotationTypeStructs, 3, 1);
  v1 = (void *)+[WXAnnotation annotationTypeEnumMap]::sAnnotationTypeEnumMap;
  +[WXAnnotation annotationTypeEnumMap]::sAnnotationTypeEnumMap = (uint64_t)v0;

}

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 type:(int)a5 state:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  CXNamespace *v11;
  _xmlAttr *v12;
  void *v13;
  _xmlNode *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  _xmlNode *v33;
  _xmlNode *v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  id v41;
  id v42;
  id obj;
  unsigned int v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v7 = *(_QWORD *)&a5;
  v55 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a6;
  if ((objc_msgSend(v10, "hasAnnotations") & 1) != 0)
  {
    objc_msgSend(v10, "WXMainNamespace");
    v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v12 = CXRequiredLongAttribute(a3, v11, (xmlChar *)"id");

    objc_msgSend(v10, "annotationWithId:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (_xmlNode *)objc_msgSend(v10, "xmlAnnotationWithID:", v12);
    if (v14)
    {
      objc_msgSend(v9, "addAnnotation:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if ((_DWORD)v7 == 2 && v13)
      {
        objc_msgSend(v15, "paragraph");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeRun:", v16);

      }
      else if (v13)
      {
        objc_msgSend(v13, "setOtherEndOfRangedAnnotation:", v15);
        objc_msgSend(v16, "setOtherEndOfRangedAnnotation:", v13);
        objc_msgSend(v16, "useDataFromOtherEnd");
      }
      else
      {
        objc_msgSend(v10, "addAnnotationId:annotation:", v12, v15);
        wmxmlGetAuthorProperty(v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setOwner:", v18);

        wmxmlGetDateProperty(v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setDate:", v19);

        objc_msgSend(v10, "drawingState");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "packagePart");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "drawingState");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "annotationPart");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setPackagePart:", v22);

        v39 = objc_msgSend(v10, "isNewSectionRequested");
        objc_msgSend(v10, "setNewSectionRequested:", 0);
        v41 = -[WXReadState initNoStacksWith:]([WXReadState alloc], "initNoStacksWith:", v10);
        objc_msgSend(v16, "text");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[WXText readFrom:baseStyle:to:state:](WXText, "readFrom:baseStyle:to:state:", v14, 0, v23, v41);

        if (objc_msgSend(v10, "hasAnnotationsExtended"))
        {
          objc_msgSend(v16, "paragraphIds");
          v51 = 0u;
          v52 = 0u;
          v49 = 0u;
          v50 = 0u;
          obj = (id)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
          if (v24)
          {
            v25 = *(_QWORD *)v50;
LABEL_11:
            v26 = 0;
            while (1)
            {
              if (*(_QWORD *)v50 != v25)
                objc_enumerationMutation(obj);
              v27 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v26);
              if (!+[OCXSTValidator isValidValue:simpleType:](OCXSTValidator, "isValidValue:simpleType:", v27, 10))break;
              objc_msgSend(v10, "addAnnotationParaId:annotation:", objc_msgSend(v27, "unsignedIntValue"), v16);
              if (v24 == ++v26)
              {
                v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
                if (v24)
                  goto LABEL_11;
                goto LABEL_17;
              }
            }
          }
          else
          {
LABEL_17:

            objc_msgSend(v10, "drawingState");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "annotationExtendedPart");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setPackagePart:", v29);

            v47 = 0u;
            v48 = 0u;
            v45 = 0u;
            v46 = 0u;
            v42 = obj;
            v30 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
            if (v30)
            {
              v31 = *(_QWORD *)v46;
              while (2)
              {
                for (i = 0; i != v30; ++i)
                {
                  if (*(_QWORD *)v46 != v31)
                    objc_enumerationMutation(v42);
                  v33 = (_xmlNode *)objc_msgSend(v10, "xmlAnnotationExtendedWithParaId:", objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "unsignedIntValue"));
                  v34 = v33;
                  if (v33)
                  {
                    objc_msgSend(v16, "setIsResolved:", CXDefaultBoolAttribute(v33, (CXNamespace *)WXWord2012Namespace, (xmlChar *)"done", 0));
                    v44 = 0;
                    if (CXOptionalUnsignedAttributeFromHex8X(v34, (CXNamespace *)WXWord2012Namespace, (xmlChar *)"paraIdParent", &v44))
                    {
                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v44);
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      v36 = +[OCXSTValidator isValidValue:simpleType:](OCXSTValidator, "isValidValue:simpleType:", v35, 10);

                      if (v36)
                      {
                        objc_msgSend(v10, "annotationWithParaId:", v44);
                        v37 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v16, "setParent:", v37);

                        goto LABEL_29;
                      }
                    }
                  }
                }
                v30 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
                if (v30)
                  continue;
                break;
              }
            }
          }
LABEL_29:

        }
        objc_msgSend(v10, "drawingState");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setPackagePart:", v40);

        objc_msgSend(v10, "setNewSectionRequested:", v39);
      }

    }
  }

}

@end
